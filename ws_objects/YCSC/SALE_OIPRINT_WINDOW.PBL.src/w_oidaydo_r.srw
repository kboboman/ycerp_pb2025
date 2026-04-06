$PBExportHeader$w_oidaydo_r.srw
$PBExportComments$일자별 제품출고현황(1999/6/21,이인호)
forward
global type w_oidaydo_r from w_inheritance
end type
type em_2 from editmask within w_oidaydo_r
end type
type gb_7 from groupbox within w_oidaydo_r
end type
type dw_area from datawindow within w_oidaydo_r
end type
type st_2 from statictext within w_oidaydo_r
end type
type pb_1 from picturebutton within w_oidaydo_r
end type
type gb_4 from groupbox within w_oidaydo_r
end type
type em_1 from editmask within w_oidaydo_r
end type
type dw_3 from datawindow within w_oidaydo_r
end type
type st_3 from statictext within w_oidaydo_r
end type
type ddlb_fld from dropdownlistbox within w_oidaydo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oidaydo_r
end type
type st_4 from statictext within w_oidaydo_r
end type
type ddlb_op from dropdownlistbox within w_oidaydo_r
end type
type sle_value from singlelineedit within w_oidaydo_r
end type
type cb_1 from commandbutton within w_oidaydo_r
end type
type cb_2 from commandbutton within w_oidaydo_r
end type
type cb_3 from commandbutton within w_oidaydo_r
end type
type cb_5 from commandbutton within w_oidaydo_r
end type
type cbx_sum from checkbox within w_oidaydo_r
end type
type cbx_view from checkbox within w_oidaydo_r
end type
type cbx_fix from checkbox within w_oidaydo_r
end type
type st_info from statictext within w_oidaydo_r
end type
type cb_popup from commandbutton within w_oidaydo_r
end type
type st_1 from statictext within w_oidaydo_r
end type
type cbx_hap from checkbox within w_oidaydo_r
end type
type st_5 from statictext within w_oidaydo_r
end type
type st_6 from statictext within w_oidaydo_r
end type
end forward

global type w_oidaydo_r from w_inheritance
integer y = 112
integer width = 4379
integer height = 2380
string title = "일자별  출고현황(w_oidaydo_r)"
em_2 em_2
gb_7 gb_7
dw_area dw_area
st_2 st_2
pb_1 pb_1
gb_4 gb_4
em_1 em_1
dw_3 dw_3
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_sum cbx_sum
cbx_view cbx_view
cbx_fix cbx_fix
st_info st_info
cb_popup cb_popup
st_1 st_1
cbx_hap cbx_hap
st_5 st_5
st_6 st_6
end type
global w_oidaydo_r w_oidaydo_r

type variables
DataWindowChild idwc_area
string is_dw, is_ret, is_dw1sql, is_price, is_team_code
date   id_start, id_end

end variables

on w_oidaydo_r.create
int iCurrent
call super::create
this.em_2=create em_2
this.gb_7=create gb_7
this.dw_area=create dw_area
this.st_2=create st_2
this.pb_1=create pb_1
this.gb_4=create gb_4
this.em_1=create em_1
this.dw_3=create dw_3
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_sum=create cbx_sum
this.cbx_view=create cbx_view
this.cbx_fix=create cbx_fix
this.st_info=create st_info
this.cb_popup=create cb_popup
this.st_1=create st_1
this.cbx_hap=create cbx_hap
this.st_5=create st_5
this.st_6=create st_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_2
this.Control[iCurrent+2]=this.gb_7
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.gb_4
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.cbx_sum
this.Control[iCurrent+20]=this.cbx_view
this.Control[iCurrent+21]=this.cbx_fix
this.Control[iCurrent+22]=this.st_info
this.Control[iCurrent+23]=this.cb_popup
this.Control[iCurrent+24]=this.st_1
this.Control[iCurrent+25]=this.cbx_hap
this.Control[iCurrent+26]=this.st_5
this.Control[iCurrent+27]=this.st_6
end on

on w_oidaydo_r.destroy
call super::destroy
destroy(this.em_2)
destroy(this.gb_7)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_sum)
destroy(this.cbx_view)
destroy(this.cbx_fix)
destroy(this.st_info)
destroy(this.cb_popup)
destroy(this.st_1)
destroy(this.cbx_hap)
destroy(this.st_5)
destroy(this.st_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

em_1.text = string(today(), "yyyy/mm/01")
em_2.text = string(today(), "yyyy/mm/dd")
id_start  = date(em_1.text)
id_end    = date(em_2.text)

em_1.setfocus()
dw_2.visible = false
dw_1.sharedata(dw_2)

dw_3.visible = false
dw_3.settransobject(sqlca)

// 출고집계
cbx_sum.checked = true
cbx_sum.triggerevent( clicked! )

// 합계만 보기
cbx_hap.enabled  = false

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')
idwc_area.accepttext()
dw_area.object.area[1] = "%"	// gs_area

is_dw1sql = dw_1.describe("datawindow.table.select")

// 단가조회
SELECT isnull(sale_price,'N'), team_code INTO :is_price, :is_team_code 
  FROM login
 WHERE user_id = :gs_userid; 

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_oidaydo_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_oidaydo_r
integer x = 32
integer y = 440
integer width = 4274
integer height = 1804
integer taborder = 0
string dataobject = "d_oidaydo_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_oidaydo_r
integer x = 41
integer y = 172
integer width = 110
integer height = 76
integer taborder = 0
string dataobject = "d_oidayrep_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oidaydo_r
integer y = 20
integer width = 1120
integer height = 136
string text = "출고일보(기간별)"
end type

type st_tips from w_inheritance`st_tips within w_oidaydo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oidaydo_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidaydo_r
boolean visible = false
integer x = 2935
integer y = 116
integer taborder = 70
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

type pb_close from w_inheritance`pb_close within w_oidaydo_r
integer x = 3259
integer y = 60
integer taborder = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidaydo_r
integer x = 3067
integer y = 60
integer taborder = 50
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
DataWindow dw_prt

if cbx_sum.checked = true then
   MessageBox("확인", "출고집계 조회시에는 출력작업을 지원하지 않습니다.",information!)
   RETURN
else
	dw_prt = dw_2

	if dw_prt.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
		return
	end if
	
	l_print.st_datawindow  = dw_prt
	l_print.st_print_sheet = " 프린트용지 : A3"
	l_print.st_print_desc  = " 이 프로그램은 판매거래처별 출고현황을 출력합니다." 
	
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
end if



end event

type pb_cancel from w_inheritance`pb_cancel within w_oidaydo_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_oidaydo_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_oidaydo_r
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidaydo_r
integer x = 2683
integer y = 60
integer taborder = 30
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where, ls_area

//// 합계만 보기
//cbx_hap.checked  = false
//cbx_hap.triggerevent( clicked! )
//cbx_hap.enabled  = false

// 사업장
dw_area.AcceptText()
ls_area = dw_area.object.area[1]

if is_price = 'Y' Then
	is_ret = '%'
else
	is_ret = gs_userid
end if
is_ret = '%'

dw_1.setredraw(false)

string ls_salesman
choose case gs_level
	case 'A', 'B'
		ls_salesman = '%'
	case 'C'
		ls_salesman = gs_userid
end choose

// 출고일 집계
string ls_colx, ls_sdate, ls_edate, ls_yymm
date   ld_sdate, ld_edate

ls_sdate = em_1.text
ls_edate = em_2.text
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)
ls_yymm = "N"
	
if cbx_sum.checked = true then
	dw_3.visible = true
	cbx_fix.visible = true
   if cbx_view.checked = true then ls_yymm = "Y"
	
   if dw_3.rowcount() > 0 then
		if MessageBox("확인","출고 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			dw_3.retrieve( LeftA(ls_area,1), ld_sdate, ld_edate, ls_yymm )
		end if
	else
		dw_3.retrieve( LeftA(ls_area,1), ld_sdate, ld_edate, ls_yymm )
	end if
	dw_3.setfocus()

	cbx_fix.triggerevent( clicked! )
else
	dw_1.retrieve( id_start, id_end, ls_area, is_ret, ls_salesman )
	dw_1.groupcalc()
	dw_2.groupcalc()
	dw_1.setredraw(true)
	
	if dw_1.rowcount() < 1 then
		messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
		return
	end if
	dw_1.setfocus()
end if
MessageBox("확인", "조회완료",information!)

end event

type gb_3 from w_inheritance`gb_3 within w_oidaydo_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oidaydo_r
integer y = 240
integer width = 4274
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oidaydo_r
integer x = 2642
integer width = 850
integer height = 216
integer taborder = 0
end type

type em_2 from editmask within w_oidaydo_r
integer x = 2203
integer y = 136
integer width = 375
integer height = 72
integer taborder = 20
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
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
id_end = date(this.text)
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_end = date(this.text)
end if

end event

type gb_7 from groupbox within w_oidaydo_r
integer x = 1189
integer y = 12
integer width = 585
integer height = 216
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_area from datawindow within w_oidaydo_r
integer x = 1211
integer y = 132
integer width = 526
integer height = 84
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type st_2 from statictext within w_oidaydo_r
boolean visible = false
integer x = 146
integer y = 200
integer width = 1294
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "화곡저장소에서 출고된것만 조회됩니다."
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_oidaydo_r
event mousemove pbm_mousemove
integer x = 2875
integer y = 60
integer width = 187
integer height = 144
integer taborder = 80
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_dest

if cbx_sum.checked = true then
	dw_dest = dw_3
else
	dw_dest = dw_1
end if

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type gb_4 from groupbox within w_oidaydo_r
integer x = 1797
integer y = 12
integer width = 823
integer height = 216
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_1 from editmask within w_oidaydo_r
integer x = 1824
integer y = 136
integer width = 375
integer height = 72
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
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
id_start = date(this.text)

end event

event rbuttondown;//
OpenWithParm( w_calendar, Message.StringParm )
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
	id_start = date(this.text)
end if

end event

type dw_3 from datawindow within w_oidaydo_r
integer x = 613
integer y = 680
integer width = 2747
integer height = 1220
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidaydo_ct3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

// 합계만 보기
cbx_hap.enabled  = true

end event

type st_3 from statictext within w_oidaydo_r
integer x = 64
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_oidaydo_r
integer x = 251
integer y = 304
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oidaydo_r
integer x = 283
integer y = 316
integer width = 311
integer height = 88
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

type st_4 from statictext within w_oidaydo_r
integer x = 722
integer y = 320
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

type ddlb_op from dropdownlistbox within w_oidaydo_r
integer x = 891
integer y = 304
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_oidaydo_r
integer x = 1211
integer y = 312
integer width = 489
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oidaydo_r
integer x = 1783
integer y = 312
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidaydo_r
integer x = 1947
integer y = 312
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oidaydo_r
integer x = 2112
integer y = 312
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidaydo_r
integer x = 2277
integer y = 312
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_sum from checkbox within w_oidaydo_r
integer x = 2464
integer y = 292
integer width = 384
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "출고집계"
boolean checked = true
end type

event clicked;// 납기일 집계
if this.checked = true then
	dw_3.visible = true
	dw_1.visible = false
	cbx_fix.visible = true
   cbx_view.visible = true

	st_info.visible  = true
else
	dw_3.visible = false
	dw_1.visible = true
	cbx_fix.visible  = false
   cbx_view.visible = false

	st_info.visible  = false
end if

cbx_fix.triggerevent( clicked! )

end event

type cbx_view from checkbox within w_oidaydo_r
integer x = 2464
integer y = 352
integer width = 320
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "년월별"
boolean checked = true
end type

event clicked;////
//debugbreak()
//if this.checked = true then
//	dw_3.Modify("DataWindow.Detail.Height=0")			// Detail
//	dw_3.Modify("DataWindow.Trailer.1.Height=80")	// 대분류계
//else
//	dw_3.Modify("DataWindow.Detail.Height=80")		// Detail
//	dw_3.Modify("DataWindow.Trailer.1.Height=80")	// 대분류계
//end if
//
//
//
end event

type cbx_fix from checkbox within w_oidaydo_r
integer x = 2875
integer y = 352
integer width = 311
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "고정틀"
end type

event clicked;//
string ls_colx

if this.checked = true then
	ls_colx = string(integer(dw_3.object.item_name.x) + integer(dw_3.object.item_name.width))
else
	ls_colx = "0"
end if
dw_3.object.datawindow.horizontalscrollsplit = ls_colx

end event

type st_info from statictext within w_oidaydo_r
integer x = 3525
integer y = 32
integer width = 640
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
string text = "운반비 차액 발생함"
boolean focusrectangle = false
end type

type cb_popup from commandbutton within w_oidaydo_r
integer x = 1710
integer y = 312
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

event clicked;//		
m_dwgrid_popup NewMenu
string  ls_sort, ls_filter
integer li_int, li_rtn

NewMenu = CREATE m_dwgrid_popup

GS_SortFilter = ""
li_int = NewMenu.m_popup.PopMenu(ParentWindow().PointerX(), ParentWindow().PointerY())

choose case is_dw
	case "dw_1"
		GDW_Client = dw_1
	case "dw_3"
		GDW_Client = dw_3
	case ""
		MessageBox("확인","작업할 대상을 먼저 선택하시기 바랍니다.")
end choose

choose case GS_SortFilter
	case "m_specifysort"
		SetNull(ls_sort)
		li_rtn = GDW_Client.SetSort(ls_sort)
		if li_rtn = 1 then
			GS_Sort = GDW_Client.Describe("Datawindow.Table.Sort")
			GDW_Client.Sort()
		end if

	case "m_specifyfilter"
		GDW_Client.SetRedraw(True)
		SetNull(ls_filter)
		li_rtn = GDW_Client.SetFilter(ls_filter)
		if li_rtn = 1 then
			GDW_Client.Filter()
			GDW_Client.Sort()
		end if
				
	case "m_print"
		GDW_Client.Print()
		
	case "m_saveas"
		GDW_Client.SetRedraw(True)
		GDW_Client.SaveAs()
end choose

end event

type st_1 from statictext within w_oidaydo_r
integer x = 3525
integer y = 108
integer width = 1157
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
string text = "출고집계는 품목금액을 기준으로 함"
boolean focusrectangle = false
end type

type cbx_hap from checkbox within w_oidaydo_r
integer x = 2875
integer y = 292
integer width = 489
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
string text = "합계만 보기"
end type

event clicked;// 합계만 보기
DataWindow arg_dw

// 출고집계
if cbx_sum.checked = true then
	arg_dw = dw_3
else
	arg_dw = dw_1
end if

//
arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.4.Height=0")	
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
else
	arg_dw.Modify("DataWindow.Detail.Height=80")		
	arg_dw.Modify("DataWindow.Trailer.4.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.3.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

type st_5 from statictext within w_oidaydo_r
integer x = 1211
integer y = 52
integer width = 526
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_oidaydo_r
integer x = 1824
integer y = 52
integer width = 759
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
string text = "출고일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

