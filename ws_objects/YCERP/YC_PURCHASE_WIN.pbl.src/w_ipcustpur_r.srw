$PBExportHeader$w_ipcustpur_r.srw
$PBExportComments$거래처별입고내역(1998/05/13,곽용덕)
forward
global type w_ipcustpur_r from w_inheritance
end type
type dw_3 from datawindow within w_ipcustpur_r
end type
type rb_2 from radiobutton within w_ipcustpur_r
end type
type rb_1 from radiobutton within w_ipcustpur_r
end type
type rb_3 from radiobutton within w_ipcustpur_r
end type
type st_2 from statictext within w_ipcustpur_r
end type
type dw_area from datawindow within w_ipcustpur_r
end type
type pb_1 from picturebutton within w_ipcustpur_r
end type
type dw_4 from datawindow within w_ipcustpur_r
end type
type dw_5 from datawindow within w_ipcustpur_r
end type
type st_1 from statictext within w_ipcustpur_r
end type
type rb_4 from radiobutton within w_ipcustpur_r
end type
type rb_5 from radiobutton within w_ipcustpur_r
end type
type rb_6 from radiobutton within w_ipcustpur_r
end type
type rb_7 from radiobutton within w_ipcustpur_r
end type
type rb_8 from radiobutton within w_ipcustpur_r
end type
type cbx_1 from checkbox within w_ipcustpur_r
end type
type rb_9 from radiobutton within w_ipcustpur_r
end type
type st_3 from statictext within w_ipcustpur_r
end type
type ddlb_fld from dropdownlistbox within w_ipcustpur_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ipcustpur_r
end type
type st_4 from statictext within w_ipcustpur_r
end type
type ddlb_op from dropdownlistbox within w_ipcustpur_r
end type
type sle_value from singlelineedit within w_ipcustpur_r
end type
type cb_1 from commandbutton within w_ipcustpur_r
end type
type cb_2 from commandbutton within w_ipcustpur_r
end type
type cb_3 from commandbutton within w_ipcustpur_r
end type
type cb_5 from commandbutton within w_ipcustpur_r
end type
type cbx_2 from checkbox within w_ipcustpur_r
end type
type gb_4 from groupbox within w_ipcustpur_r
end type
end forward

global type w_ipcustpur_r from w_inheritance
integer width = 4695
integer height = 2328
string title = "거래처별 입고내역(w_ipcustpur_r)"
dw_3 dw_3
rb_2 rb_2
rb_1 rb_1
rb_3 rb_3
st_2 st_2
dw_area dw_area
pb_1 pb_1
dw_4 dw_4
dw_5 dw_5
st_1 st_1
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
rb_8 rb_8
cbx_1 cbx_1
rb_9 rb_9
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
cbx_2 cbx_2
gb_4 gb_4
end type
global w_ipcustpur_r w_ipcustpur_r

type variables
st_print i_print
string is_dw, is_supp
date   id_date1, id_date2
datawindowchild idwc_cust, idwc_area, idwc_loc
end variables

on w_ipcustpur_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.rb_3=create rb_3
this.st_2=create st_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_1=create st_1
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.rb_8=create rb_8
this.cbx_1=create cbx_1
this.rb_9=create rb_9
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
this.cbx_2=create cbx_2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.dw_5
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.rb_4
this.Control[iCurrent+12]=this.rb_5
this.Control[iCurrent+13]=this.rb_6
this.Control[iCurrent+14]=this.rb_7
this.Control[iCurrent+15]=this.rb_8
this.Control[iCurrent+16]=this.cbx_1
this.Control[iCurrent+17]=this.rb_9
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.ddlb_fld
this.Control[iCurrent+20]=this.ddlb_dwtitles
this.Control[iCurrent+21]=this.st_4
this.Control[iCurrent+22]=this.ddlb_op
this.Control[iCurrent+23]=this.sle_value
this.Control[iCurrent+24]=this.cb_1
this.Control[iCurrent+25]=this.cb_2
this.Control[iCurrent+26]=this.cb_3
this.Control[iCurrent+27]=this.cb_5
this.Control[iCurrent+28]=this.cbx_2
this.Control[iCurrent+29]=this.gb_4
end on

on w_ipcustpur_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.rb_3)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.rb_8)
destroy(this.cbx_1)
destroy(this.rb_9)
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
destroy(this.cbx_2)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = FALSE
dw_4.visible = FALSE
dw_5.visible = FALSE
dw_1.sharedata(dw_2)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = gs_area

// 전체거래처
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.getchild("supp_no", idwc_loc)
idwc_loc.settransobject(SQLCA)

dw_3.object.ymd1[1] = date(string(today(),"yyyy/mm/01"))
dw_3.object.ymd2[1] = date(string(today(),"yyyy/mm/dd"))
id_date1 = dw_3.object.ymd1[1]
id_date2 = dw_3.object.ymd2[1]

idwc_loc.insertrow(1)
idwc_loc.setitem(1, "supp_no", "%")
idwc_loc.setitem(1, "supp_name", "전체")

//if left(gs_team,1) = "9" then
	dw_3.object.supp_no[1] = "%"
//end if

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_ipcustpur_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ipcustpur_r
integer x = 32
integer y = 428
integer width = 4590
integer height = 1768
integer taborder = 60
string title = "d_ipcustpur_t3"
string dataobject = "d_ipcustpur_t"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ipcustpur_r
integer x = 0
integer y = 0
integer width = 1138
integer height = 144
string text = "거래처별 입고내역"
end type

type st_tips from w_inheritance`st_tips within w_ipcustpur_r
end type

type pb_compute from w_inheritance`pb_compute within w_ipcustpur_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipcustpur_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipcustpur_r
integer x = 4398
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipcustpur_r
integer x = 4018
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_supp,ls_order
long   ll_row

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 거래처별 입고내역 보고서를 출력합니다."

if rb_1.checked = true then
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=73'
else
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=79'
end if
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_ipcustpur_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ipcustpur_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ipcustpur_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipcustpur_r
integer x = 3826
integer taborder = 150
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
string ls_area, ls_category

dw_3.accepttext()

ls_area = LeftA(dw_area.object.area[1],1)
if ls_area = "" then ls_area = "%"
if is_supp = "" then is_supp = "%"

if rb_4.checked = true then		// 전체
	ls_category = "%"
elseif rb_5.checked = true then	// 원자재
	ls_category = "W"
elseif rb_6.checked = true then	// 상품
	ls_category = "S"
elseif rb_7.checked = true then	// 부자재
	ls_category = "B"
elseif rb_8.checked = true then	// 외주가공
	ls_category = "Y"
elseif rb_8.checked = true then	// 공사원가
	ls_category = "A"
end if

dw_1.reset()
ll_row = dw_1.retrieve( is_supp, id_date1, id_date2, ls_area, ls_category )
if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipcustpur_r
integer x = 32
integer width = 4590
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_ipcustpur_r
integer x = 1262
integer y = 8
integer width = 1902
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipcustpur_r
integer x = 3799
integer y = 8
integer width = 823
integer height = 216
integer taborder = 50
end type

type dw_2 from w_inheritance`dw_2 within w_ipcustpur_r
integer x = 41
integer y = 164
integer width = 101
integer height = 76
integer taborder = 70
string title = "d_ipcustpur_r3"
string dataobject = "d_ipcustpur_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_ipcustpur_r
integer x = 1815
integer y = 48
integer width = 1056
integer height = 156
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_ipsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
dw_1.reset()
this.accepttext()

id_date1 = this.object.ymd1[1]
id_date2 = this.object.ymd2[1]
is_supp  = trim(this.object.supp_no[1])


end event

event rbuttondown;//
gs_calendar lstr_calendar

choose case dwo.name
	case "ymd1", "ymd2"
		lstr_calendar.sdate = string(this.object.ymd1[1])
		lstr_calendar.edate = string(this.object.ymd2[1])
		OpenWithParm(w_calendar2, lstr_calendar)
		lstr_calendar = Message.PowerObjectParm
		
		if lstr_calendar.chk <> 'N' then
			this.object.ymd1[1] = date(lstr_calendar.sdate)
			this.object.ymd2[1] = date(lstr_calendar.edate)
		end if
end choose

this.postevent(itemchanged!)


end event

event itemfocuschanged;//
choose case dwo.name
	case "supp_no"
		this.SelectText(1, LenA(GetText()))
end choose

end event

type rb_2 from radiobutton within w_ipcustpur_r
integer x = 2889
integer y = 108
integer width = 238
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "집계1"
end type

event clicked;// 집계1
dw_1.dataobject = 'd_ipcustpur_t2'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r2'
dw_1.sharedata(dw_2)


if this.checked then
	cbx_2.enabled = false
end if
end event

type rb_1 from radiobutton within w_ipcustpur_r
integer x = 2889
integer y = 52
integer width = 238
integer height = 48
boolean bringtotop = true
integer textsize = -9
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

event clicked;// 상세
dw_1.dataobject = 'd_ipcustpur_t'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r'
dw_1.sharedata(dw_2)


if this.checked then
	cbx_2.enabled = true
end if

end event

type rb_3 from radiobutton within w_ipcustpur_r
integer x = 2889
integer y = 156
integer width = 238
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "집계"
end type

event clicked;// 집계2
dw_1.dataobject = 'd_ipcustpur_t3'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r3'
dw_1.sharedata(dw_2)


if this.checked then
	cbx_2.enabled = false
end if
end event

type st_2 from statictext within w_ipcustpur_r
integer x = 1289
integer y = 48
integer width = 521
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_ipcustpur_r
integer x = 1289
integer y = 124
integer width = 521
integer height = 84
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

type pb_1 from picturebutton within w_ipcustpur_r
event mousemove pbm_mousemove
integer x = 4206
integer y = 52
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type dw_4 from datawindow within w_ipcustpur_r
integer x = 453
integer y = 576
integer width = 3899
integer height = 676
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipcustpur_t2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_5 from datawindow within w_ipcustpur_r
integer x = 453
integer y = 1312
integer width = 3899
integer height = 676
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipcustpur_t3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_1 from statictext within w_ipcustpur_r
integer x = 3013
integer y = 280
integer width = 1413
integer height = 104
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "상세내역 엑셀출력 순서는 발주입고 수정및삭제에서 사용함."
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_ipcustpur_r
integer x = 3195
integer y = 52
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 77897888
string text = "전체"
boolean checked = true
end type

type rb_5 from radiobutton within w_ipcustpur_r
integer x = 3195
integer y = 108
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "원자재"
end type

type rb_6 from radiobutton within w_ipcustpur_r
integer x = 3195
integer y = 156
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "상품"
end type

type rb_7 from radiobutton within w_ipcustpur_r
integer x = 3465
integer y = 52
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "부자재"
end type

type rb_8 from radiobutton within w_ipcustpur_r
integer x = 3465
integer y = 108
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "외주"
end type

type cbx_1 from checkbox within w_ipcustpur_r
integer x = 2469
integer y = 276
integer width = 375
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처계"
end type

event clicked;//
//if rb_1.checked = false then
//	MessageBox("확인","거래처별 현장별 자료에서만 실행됩니다.")
//	return
//end if

string ls_value

if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=70")	// 거래처 소계
else
	dw_1.Modify("DataWindow.Detail.Height=72")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=70")	// 거래처 소계
end if

end event

type rb_9 from radiobutton within w_ipcustpur_r
integer x = 3465
integer y = 156
integer width = 302
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "공사원가"
end type

type st_3 from statictext within w_ipcustpur_r
integer x = 69
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

type ddlb_fld from dropdownlistbox within w_ipcustpur_r
integer x = 256
integer y = 288
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

type ddlb_dwtitles from dropdownlistbox within w_ipcustpur_r
integer x = 288
integer y = 300
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

type st_4 from statictext within w_ipcustpur_r
integer x = 727
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

type ddlb_op from dropdownlistbox within w_ipcustpur_r
integer x = 896
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

type sle_value from singlelineedit within w_ipcustpur_r
integer x = 1216
integer y = 292
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

type cb_1 from commandbutton within w_ipcustpur_r
integer x = 1787
integer y = 292
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ipcustpur_r
integer x = 1952
integer y = 292
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ipcustpur_r
integer x = 2117
integer y = 292
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ipcustpur_r
integer x = 2281
integer y = 292
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_2 from checkbox within w_ipcustpur_r
integer x = 2469
integer y = 336
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "기준단가표기"
end type

event clicked;if this.checked  then	
	// 상세
	dw_1.dataobject = 'd_ipcustpur_t1'
	dw_1.settransobject(sqlca)
	dw_2.dataobject = 'd_ipcustpur_r'
	dw_1.sharedata(dw_2)	
else
	// 상세
	dw_1.dataobject = 'd_ipcustpur_t'
	dw_1.settransobject(sqlca)
	dw_2.dataobject = 'd_ipcustpur_r'
	dw_1.sharedata(dw_2)
end if

pb_retrieve.triggerevent(clicked!)
end event

type gb_4 from groupbox within w_ipcustpur_r
integer x = 3177
integer y = 8
integer width = 608
integer height = 216
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
end type

