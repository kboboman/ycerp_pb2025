$PBExportHeader$w_oicustdoewol_r.srw
$PBExportComments$거래처별 이월내역
forward
global type w_oicustdoewol_r from w_inheritance
end type
type dw_area from datawindow within w_oicustdoewol_r
end type
type pb_1 from picturebutton within w_oicustdoewol_r
end type
type em_1 from editmask within w_oicustdoewol_r
end type
type em_2 from editmask within w_oicustdoewol_r
end type
type st_1 from statictext within w_oicustdoewol_r
end type
type st_2 from statictext within w_oicustdoewol_r
end type
type rb_1 from radiobutton within w_oicustdoewol_r
end type
type rb_2 from radiobutton within w_oicustdoewol_r
end type
type dw_3 from datawindow within w_oicustdoewol_r
end type
type dw_4 from datawindow within w_oicustdoewol_r
end type
type st_3 from statictext within w_oicustdoewol_r
end type
type ddlb_fld from dropdownlistbox within w_oicustdoewol_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oicustdoewol_r
end type
type st_4 from statictext within w_oicustdoewol_r
end type
type sle_value from singlelineedit within w_oicustdoewol_r
end type
type cb_1 from commandbutton within w_oicustdoewol_r
end type
type cb_2 from commandbutton within w_oicustdoewol_r
end type
type cb_3 from commandbutton within w_oicustdoewol_r
end type
type cb_5 from commandbutton within w_oicustdoewol_r
end type
type dw_5 from datawindow within w_oicustdoewol_r
end type
type st_7 from statictext within w_oicustdoewol_r
end type
type st_5 from statictext within w_oicustdoewol_r
end type
type st_8 from statictext within w_oicustdoewol_r
end type
type dw_6 from datawindow within w_oicustdoewol_r
end type
type cb_4 from commandbutton within w_oicustdoewol_r
end type
type cbx_1 from checkbox within w_oicustdoewol_r
end type
type cbx_2 from checkbox within w_oicustdoewol_r
end type
type ddlb_op from dropdownlistbox within w_oicustdoewol_r
end type
type rb_3 from radiobutton within w_oicustdoewol_r
end type
end forward

global type w_oicustdoewol_r from w_inheritance
integer y = 112
integer width = 5362
integer height = 2556
string title = "거래처별 이월내역(w_oicustdoewol_r)"
dw_area dw_area
pb_1 pb_1
em_1 em_1
em_2 em_2
st_1 st_1
st_2 st_2
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_4 dw_4
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_5 dw_5
st_7 st_7
st_5 st_5
st_8 st_8
dw_6 dw_6
cb_4 cb_4
cbx_1 cbx_1
cbx_2 cbx_2
ddlb_op ddlb_op
rb_3 rb_3
end type
global w_oicustdoewol_r w_oicustdoewol_r

type variables
string is_sale_flag, is_custdosql, is_custdorsql,is_custdor1sql, is_ret
datawindowchild idwc_area, idwc_cust, idwc_user

gs_custdo_str ist_code

end variables

on w_oicustdoewol_r.create
int iCurrent
call super::create
this.dw_area=create dw_area
this.pb_1=create pb_1
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_5=create dw_5
this.st_7=create st_7
this.st_5=create st_5
this.st_8=create st_8
this.dw_6=create dw_6
this.cb_4=create cb_4
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.ddlb_op=create ddlb_op
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_area
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.dw_3
this.Control[iCurrent+10]=this.dw_4
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.sle_value
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.cb_2
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.cb_5
this.Control[iCurrent+20]=this.dw_5
this.Control[iCurrent+21]=this.st_7
this.Control[iCurrent+22]=this.st_5
this.Control[iCurrent+23]=this.st_8
this.Control[iCurrent+24]=this.dw_6
this.Control[iCurrent+25]=this.cb_4
this.Control[iCurrent+26]=this.cbx_1
this.Control[iCurrent+27]=this.cbx_2
this.Control[iCurrent+28]=this.ddlb_op
this.Control[iCurrent+29]=this.rb_3
end on

on w_oicustdoewol_r.destroy
call super::destroy
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_5)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.st_8)
destroy(this.dw_6)
destroy(this.cb_4)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.ddlb_op)
destroy(this.rb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_chk

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

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
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = "%"

// 전체거래처
dw_5.settransobject(sqlca)
dw_5.insertrow(0)  

idwc_cust.setredraw(false)
dw_5.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체")

dw_5.object.cust_no[1] = "%"

// 담당자
dw_6.settransobject(sqlca)
dw_6.insertrow(1)

choose case gs_level
	case 'A', 'B'
		ls_chk = 'Y'
	case 'C'
		ls_chk = 'N'
end choose

if ls_chk = 'Y' Then
	is_ret = '%'
	dw_6.getchild('user', idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1,'user_id','%')
	idwc_user.setitem(1,'user_name','전체')
	idwc_user.accepttext()
	dw_6.object.user[1] = '%'
else
	dw_6.object.user[1] = gs_userid
	is_ret = gs_userid
end if

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(day, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(RelativeDate(today(), + Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), + Day(today()) ), "yyyy/mm/dd")	// 전달말일
else
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = ls_lastday	// 당월말일
end if

rb_2.checked = true
rb_2.triggerevent( clicked! )

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

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
integer x = 27
integer y = 440
integer width = 4585
integer height = 2000
integer taborder = 0
string title = "d_oicustdoewol_t"
string dataobject = "d_oicustdoewol_t"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return

This.SelectRow(0,  false)
This.SelectRow(row, TRUE)

//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
if currentrow < 1 then return

This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)

end event

type st_title from w_inheritance`st_title within w_oicustdoewol_r
integer x = 50
integer y = 56
integer width = 1193
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
integer x = 4389
integer y = 76
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicustdoewol_r
integer x = 4183
integer y = 76
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
long ll_count
w_repsuper w_print
st_print   l_print
datawindow dw_prt

if dw_4.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

// 프린트 담당자계 높이 = 0 만들기
debugbreak()
if rb_1.checked = true then
	dw_4.Modify("DataWindow.Trailer.1.Height=0")		// 담당 소계
else
	dw_4.Modify("DataWindow.Trailer.1.Height=84")	// 담당 소계
end if

dw_prt = dw_4

l_print.st_datawindow  = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 거래처별 이월내역을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
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
integer x = 3799
integer y = 76
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_salesman, ls_area, ls_custno, ls_sdate, ls_edate

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_1.checked = true then
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
else
	GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )
end if

// 거래처
dw_5.accepttext()
ls_custno    = dw_5.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then ls_custno = "%"

// 사업장
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

// 담당자
dw_6.accepttext()
ls_salesman    = dw_6.object.user[1]
if isnull(ls_salesman) or ls_salesman = "" then ls_salesman = "%"

ls_sdate = em_1.text
ls_edate = em_2.text

choose case gs_level
	case 'A', 'B'
		is_ret = '%'

	case 'C'
		is_ret = gs_userid
end choose

/*2018.10.01 jowonsuk 임원담당자 추가  */
if rb_2.checked then	
	dw_3.dataobject = "d_oicustdoewol_r22"
	dw_4.dataobject = "d_oicustdoewol_r4"	
	dw_3.SetTransObject(SQLCA)		
	dw_4.SetTransObject(SQLCA)			
elseif rb_3.checked then	
	dw_3.dataobject = "d_oicustdoewol_imwon_r22"
	dw_4.dataobject = "d_oicustdoewol_imwon_r4"		
	dw_3.SetTransObject(SQLCA)			
	dw_4.SetTransObject(SQLCA)				
end if


dw_1.retrieve( ls_salesman, ls_area, ls_custno, ls_sdate, ls_edate )
dw_1.groupcalc()

dw_3.retrieve( ls_salesman, ls_area, ls_custno, ls_sdate, ls_edate )
dw_3.groupcalc()

dw_4.retrieve( ls_salesman, ls_area, ls_custno, ls_sdate, ls_edate )
dw_4.groupcalc()

if dw_1.rowcount() < 1 then
	messagebox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.",information!)
end if

dw_1.sharedata(dw_2)
dw_2.groupcalc()

dw_3.sharedata(dw_4)
dw_4.groupcalc()

end event

type gb_3 from w_inheritance`gb_3 within w_oicustdoewol_r
integer x = 27
integer y = 248
integer width = 5147
integer height = 180
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oicustdoewol_r
integer x = 1312
integer y = 16
integer width = 2423
integer height = 228
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oicustdoewol_r
integer x = 3762
integer y = 16
integer width = 850
integer height = 228
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oicustdoewol_r
integer x = 763
integer y = 12
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

type dw_area from datawindow within w_oicustdoewol_r
integer x = 2011
integer y = 148
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
integer x = 3991
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

if rb_1.checked = true then
	dwxls  = dw_1
else
	dwxls  = dw_3
end if

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

type em_1 from editmask within w_oicustdoewol_r
integer x = 2839
integer y = 148
integer width = 407
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_oicustdoewol_r
integer x = 3301
integer y = 148
integer width = 407
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_1 from statictext within w_oicustdoewol_r
integer x = 2011
integer y = 60
integer width = 517
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_oicustdoewol_r
integer x = 2542
integer y = 152
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oicustdoewol_r
integer x = 2464
integer y = 328
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
cb_4.enabled = true
end event

type rb_2 from radiobutton within w_oicustdoewol_r
integer x = 2697
integer y = 328
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
cb_4.enabled = false

end event

type dw_3 from datawindow within w_oicustdoewol_r
integer x = 439
integer y = 784
integer width = 3790
integer height = 1264
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oicustdoewol_r22"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if row < 1 then return

This.SelectRow(0,  false)
This.SelectRow(row, TRUE)

//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_4 from datawindow within w_oicustdoewol_r
integer x = 887
integer y = 12
integer width = 101
integer height = 84
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_oicustdoewol_r4"
boolean livescroll = true
end type

type st_3 from statictext within w_oicustdoewol_r
integer x = 78
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_oicustdoewol_r
integer x = 265
integer y = 316
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_oicustdoewol_r
integer x = 297
integer y = 328
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

type st_4 from statictext within w_oicustdoewol_r
integer x = 736
integer y = 332
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

type sle_value from singlelineedit within w_oicustdoewol_r
integer x = 1225
integer y = 320
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

type cb_1 from commandbutton within w_oicustdoewol_r
integer x = 1797
integer y = 320
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

if rb_1.checked = true then
	arg_dw  = dw_1
else
	arg_dw  = dw_3
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)



end event

type cb_2 from commandbutton within w_oicustdoewol_r
integer x = 1961
integer y = 320
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

if rb_1.checked = true then
	arg_dw  = dw_1
else
	arg_dw  = dw_3
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oicustdoewol_r
integer x = 2126
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if rb_1.checked = true then
	arg_dw  = dw_1
else
	arg_dw  = dw_3
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oicustdoewol_r
integer x = 2290
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

if rb_1.checked = true then
	arg_dw  = dw_1
else
	arg_dw  = dw_3
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_5 from datawindow within w_oicustdoewol_r
integer x = 2839
integer y = 56
integer width = 869
integer height = 80
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;//
this.accepttext()

end event

type st_7 from statictext within w_oicustdoewol_r
integer x = 3255
integer y = 156
integer width = 46
integer height = 52
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "~~"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_oicustdoewol_r
integer x = 2542
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_oicustdoewol_r
integer x = 1344
integer y = 60
integer width = 654
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_oicustdoewol_r
integer x = 1339
integer y = 148
integer width = 672
integer height = 84
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type cb_4 from commandbutton within w_oicustdoewol_r
integer x = 4270
integer y = 312
integer width = 850
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서 수정 및 삭제"
end type

event clicked;// 거래명세서 수정 및 삭제 w_oidoupdate_m
string ls_dono
long   ll_row

if dw_1.rowcount() < 1 then return

ls_dono = dw_1.object.do_do_no[dw_1.getrow()]
if isnull(ls_dono) or ls_dono = "" then RETURN

ll_row = dw_1.object.dodet_oi_no[dw_1.getrow()]
if isnull(ll_row) or ll_row = 0 then RETURN

if IsValid(w_o_main) = true then
	OpenSheet(w_oidoupdate_m, w_o_main, 5, original!)
else
	OpenSheet(w_oidoupdate_m, w_all_main, 5, original!)
end if

ls_dono = LeftA(ls_dono,10) + RightA(ls_dono,3)
w_oidoupdate_m.setredraw(false)
cb_1.setfocus()
w_oidoupdate_m.em_3.text = ls_dono		// 출고번호
w_oidoupdate_m.cb_1.triggerevent(clicked!)

if w_oidoupdate_m.dw_2.rowcount() > ll_row then
	w_oidoupdate_m.dw_2.scrolltorow( ll_row )
	w_oidoupdate_m.dw_2.setcolumn( "price" )
end if
w_oidoupdate_m.dw_2.setfocus()
w_oidoupdate_m.setredraw(true)

end event

type cbx_1 from checkbox within w_oicustdoewol_r
integer x = 3493
integer y = 328
integer width = 352
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
string text = "담당숨김"
end type

event clicked;// 담당계
if rb_1.checked = true then
	MessageBox("확인","집계 자료에서만 실행됩니다.")
	return
end if

string ls_value

if this.checked = true then
	dw_3.Modify("DataWindow.Detail.Height=72")		// Detail
	//dw_3.Modify("DataWindow.Trailer.2.Height=76")	// 거래처 소계
	dw_3.Modify("DataWindow.Trailer.1.Height=0")	// 담당 소계
else
	dw_3.Modify("DataWindow.Detail.Height=72")		// Detail
	//dw_3.Modify("DataWindow.Trailer.2.Height=76")	// 거래처 소계
	dw_3.Modify("DataWindow.Trailer.1.Height=72")	// 담당 소계
end if

dw_3.groupcalc()

end event

type cbx_2 from checkbox within w_oicustdoewol_r
integer x = 3845
integer y = 328
integer width = 416
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
string text = "거래처숨김"
end type

event clicked;// 거래처계
if rb_1.checked = true then
	MessageBox("확인","집계 자료에서만 실행됩니다.")
	return
end if

string ls_value

if this.checked = true then
	dw_3.Modify("DataWindow.Detail.Height=72")		// Detail
	dw_3.Modify("DataWindow.Trailer.2.Height=0")		// 거래처 소계
	//dw_3.Modify("DataWindow.Trailer.1.Height=0")	// 담당 소계
else
	dw_3.Modify("DataWindow.Detail.Height=72")		// Detail
	dw_3.Modify("DataWindow.Trailer.2.Height=76")	// 거래처 소계
	//dw_3.Modify("DataWindow.Trailer.1.Height=72")	// 담당 소계
end if

dw_3.groupcalc()

end event

type ddlb_op from dropdownlistbox within w_oicustdoewol_r
integer x = 914
integer y = 312
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

type rb_3 from radiobutton within w_oicustdoewol_r
integer x = 2935
integer y = 328
integer width = 544
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
string text = "집계(부담당)"
end type

event clicked;//
dw_1.visible = false
dw_3.visible = true
cb_4.enabled = false

end event

