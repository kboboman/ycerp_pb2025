$PBExportHeader$w_apoibputtot_r.srw
$PBExportComments$물품별 조업자재(집계)
forward
global type w_apoibputtot_r from w_inheritance
end type
type gb_4 from groupbox within w_apoibputtot_r
end type
type st_2 from statictext within w_apoibputtot_r
end type
type dw_area from datawindow within w_apoibputtot_r
end type
type pb_1 from picturebutton within w_apoibputtot_r
end type
type dw_3 from datawindow within w_apoibputtot_r
end type
type rb_1 from radiobutton within w_apoibputtot_r
end type
type rb_2 from radiobutton within w_apoibputtot_r
end type
type rb_3 from radiobutton within w_apoibputtot_r
end type
type rb_4 from radiobutton within w_apoibputtot_r
end type
type dw_5 from datawindow within w_apoibputtot_r
end type
type st_5 from statictext within w_apoibputtot_r
end type
type cbx_3 from checkbox within w_apoibputtot_r
end type
type dw_8 from datawindow within w_apoibputtot_r
end type
type dw_4 from datawindow within w_apoibputtot_r
end type
type st_3 from statictext within w_apoibputtot_r
end type
type ddlb_fld from dropdownlistbox within w_apoibputtot_r
end type
type ddlb_dwtitles from dropdownlistbox within w_apoibputtot_r
end type
type st_4 from statictext within w_apoibputtot_r
end type
type ddlb_op from dropdownlistbox within w_apoibputtot_r
end type
type sle_value from singlelineedit within w_apoibputtot_r
end type
type cb_1 from commandbutton within w_apoibputtot_r
end type
type cb_2 from commandbutton within w_apoibputtot_r
end type
type cb_3 from commandbutton within w_apoibputtot_r
end type
type cb_5 from commandbutton within w_apoibputtot_r
end type
type dw_9 from datawindow within w_apoibputtot_r
end type
type dw_6 from datawindow within w_apoibputtot_r
end type
type rb_5 from radiobutton within w_apoibputtot_r
end type
type rb_6 from radiobutton within w_apoibputtot_r
end type
type rb_7 from radiobutton within w_apoibputtot_r
end type
type rb_8 from radiobutton within w_apoibputtot_r
end type
end forward

global type w_apoibputtot_r from w_inheritance
integer width = 4699
integer height = 2904
string title = "물품별 조업자재(집계)(w_apoibputtot_r)"
gb_4 gb_4
st_2 st_2
dw_area dw_area
pb_1 pb_1
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
dw_5 dw_5
st_5 st_5
cbx_3 cbx_3
dw_8 dw_8
dw_4 dw_4
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
dw_9 dw_9
dw_6 dw_6
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
rb_8 rb_8
end type
global w_apoibputtot_r w_apoibputtot_r

type variables
st_print i_print
string is_supp
date   id_date1, id_date2
datawindowchild idwc_area, idwc_supp

end variables

on w_apoibputtot_r.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.st_2=create st_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_5=create dw_5
this.st_5=create st_5
this.cbx_3=create cbx_3
this.dw_8=create dw_8
this.dw_4=create dw_4
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
this.dw_9=create dw_9
this.dw_6=create dw_6
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.rb_8=create rb_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_3
this.Control[iCurrent+9]=this.rb_4
this.Control[iCurrent+10]=this.dw_5
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.cbx_3
this.Control[iCurrent+13]=this.dw_8
this.Control[iCurrent+14]=this.dw_4
this.Control[iCurrent+15]=this.st_3
this.Control[iCurrent+16]=this.ddlb_fld
this.Control[iCurrent+17]=this.ddlb_dwtitles
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.ddlb_op
this.Control[iCurrent+20]=this.sle_value
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.cb_2
this.Control[iCurrent+23]=this.cb_3
this.Control[iCurrent+24]=this.cb_5
this.Control[iCurrent+25]=this.dw_9
this.Control[iCurrent+26]=this.dw_6
this.Control[iCurrent+27]=this.rb_5
this.Control[iCurrent+28]=this.rb_6
this.Control[iCurrent+29]=this.rb_7
this.Control[iCurrent+30]=this.rb_8
end on

on w_apoibputtot_r.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_5)
destroy(this.st_5)
destroy(this.cbx_3)
destroy(this.dw_8)
destroy(this.dw_4)
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
destroy(this.dw_9)
destroy(this.dw_6)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.rb_8)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
dw_4.visible = false
dw_5.visible = false
dw_6.visible = false
dw_8.visible = false
dw_9.visible = false

cbx_3.visible = false	// 틀고정

dw_4.settransobject(sqlca)
dw_4.sharedata(dw_5)

dw_1.settransobject(sqlca)
dw_1.sharedata(dw_2)

dw_6.settransobject(sqlca)
dw_8.settransobject(sqlca)

dw_9.settransobject(sqlca)
dw_9.sharedata(dw_8)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", " ")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = " "

// 전체거래처
dw_3.settransobject(sqlca)
dw_3.insertrow(0)  

dw_3.object.ymd1[1] = date(string(today(),"yyyy/mm/01"))
dw_3.object.ymd2[1] = date(string(today(),"yyyy/mm/dd"))
id_date1 = dw_3.object.ymd1[1]
id_date2 = dw_3.object.ymd2[1]

idwc_supp.setredraw(false)
dw_3.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(sqlca)
idwc_supp.insertrow(1)
idwc_supp.setitem(1, "supp_no", "%")
idwc_supp.setitem(1, "supp_name", "전체")

dw_3.object.supp_no[1] = "%" // 전체
idwc_supp.accepttext()
idwc_supp.setredraw(false)

dw_3.setcolumn( "ymd1" )
dw_3.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 472

dw_1.width  = this.width  - 165
dw_1.height = this.height - 540

dw_4.x      = dw_1.x
dw_4.y      = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

dw_6.x      = dw_1.x
dw_6.y      = dw_1.y
dw_6.width  = dw_1.width
dw_6.height = dw_1.height

dw_9.x      = dw_1.x
dw_9.y      = dw_1.y
dw_9.width  = dw_1.width
dw_9.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_apoibputtot_r
boolean visible = false
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_apoibputtot_r
integer x = 59
integer y = 388
integer width = 4530
integer height = 2356
integer taborder = 80
string dataobject = "d_apbitemtot_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return
this.scrolltorow(row)

//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_apoibputtot_r
integer x = 1170
integer y = 16
integer width = 101
integer height = 76
integer taborder = 0
string title = "d_ipbpurin_r"
string dataobject = "d_apbitemtot_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_apoibputtot_r
integer x = 50
integer y = 40
integer width = 1385
integer height = 148
string text = "물품별 조업자재(집계)"
end type

type st_tips from w_inheritance`st_tips within w_apoibputtot_r
end type

type pb_compute from w_inheritance`pb_compute within w_apoibputtot_r
boolean visible = false
integer taborder = 200
end type

type pb_print_part from w_inheritance`pb_print_part within w_apoibputtot_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_apoibputtot_r
integer x = 4407
integer y = 48
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoibputtot_r
integer x = 4018
integer y = 48
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
datawindow dwprt
string     ls_zoom

ls_zoom = "100"
if rb_5.checked = true then			// 집계
	dwprt = dw_2
elseif rb_6.checked = true then		// 거래처
	dwprt = dw_5
elseif rb_7.checked = true then		// 횟수
	dwprt = dw_8
elseif rb_8.checked = true then		// 월분석
	dwprt = dw_6
end if


i_print.st_datawindow  = dwprt
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 조업자재 입고현황(집계)를 출력합니다."

gs_print_control  = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=" + ls_zoom
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_apoibputtot_r
boolean visible = false
integer taborder = 240
end type

type pb_delete from w_inheritance`pb_delete within w_apoibputtot_r
boolean visible = false
integer taborder = 260
end type

type pb_insert from w_inheritance`pb_insert within w_apoibputtot_r
boolean visible = false
integer taborder = 290
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apoibputtot_r
integer x = 3826
integer y = 48
integer taborder = 50
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
string ls_date1, ls_date2, ls_category, ls_area, ls_supp

dw_area.accepttext()
ls_area    = trim(dw_area.object.area[1])
if isnull(ls_area) or ls_area = "" then ls_area = "%"

dw_3.accepttext()

ls_date1   = string(dw_3.object.ymd1[1],"yyyy/mm/dd")
ls_date2   = string(dw_3.object.ymd2[1],"yyyy/mm/dd")
ls_supp    = trim(dw_3.object.supp_no[1])
if isnull(ls_supp) or ls_supp = "" then ls_supp = "%"

if rb_1.checked = true then		// 전체
	ls_category = "%"
elseif rb_2.checked = true then	// 제품
	ls_category = "P%"
elseif rb_3.checked = true then	// 상품
	ls_category = "G%"
elseif rb_4.checked = true then	// 원재료
	ls_category = "M%"
end if

if rb_5.checked = true then			// 집계
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	ll_row = dw_1.retrieve( ls_date1, ls_date2, ls_supp, ls_category )
	
elseif rb_6.checked = true then		// 거래처
	GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
	ll_row = dw_4.retrieve( ls_date1, ls_date2, ls_supp, ls_category )

elseif rb_7.checked = true then		// 횟수
	GF_DWTitle2ddlb( dw_9, ddlb_fld, ddlb_dwtitles )
	ll_row = dw_9.retrieve( ls_date1, ls_date2, ls_supp, ls_category )	

elseif rb_8.checked = true then		// 월분석
	GF_DWTitle2ddlb( dw_6, ddlb_fld, ddlb_dwtitles )
	ll_row = dw_6.retrieve( ls_date1, ls_date2, ls_supp, ls_category )	
end if

if ll_row < 1 then
	MessageBox("확인", "조회조건에 만족하는 입고내역이 없습니다.",information!)
	return
else
	MessageBox("확인", "조회완료.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_apoibputtot_r
integer x = 32
integer y = 216
integer width = 4590
integer height = 144
integer taborder = 150
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_apoibputtot_r
integer y = 344
integer width = 4590
integer height = 2424
integer taborder = 190
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_apoibputtot_r
integer x = 3799
integer y = 8
integer width = 823
integer taborder = 70
end type

type gb_4 from groupbox within w_apoibputtot_r
integer x = 1545
integer y = 8
integer width = 2231
integer height = 208
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
end type

type st_2 from statictext within w_apoibputtot_r
integer x = 2171
integer y = 44
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

type dw_area from datawindow within w_apoibputtot_r
integer x = 2171
integer y = 120
integer width = 521
integer height = 84
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

type pb_1 from picturebutton within w_apoibputtot_r
event mousemove pbm_mousemove
integer x = 4206
integer y = 48
integer width = 187
integer height = 144
integer taborder = 90
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
datawindow dwxls

if rb_5.checked = true then			// 집계
	dwxls = dw_1	
elseif rb_6.checked = true then		// 거래처
	dwxls = dw_4
elseif rb_7.checked = true then		// 횟수
	dwxls = dw_9
elseif rb_8.checked = true then		// 월분석
	dwxls = dw_6
end if

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
		                        "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인","작업완료")
	end if
end if	

end event

type dw_3 from datawindow within w_apoibputtot_r
integer x = 2697
integer y = 44
integer width = 1051
integer height = 160
integer taborder = 220
boolean bringtotop = true
string dataobject = "d_ipbsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
dw_1.reset()
this.accepttext()

id_date1   = this.object.ymd1[1]
id_date2   = this.object.ymd2[1]
is_supp    = trim(this.object.supp_no[1])
if isnull(is_supp) or is_supp = "" then is_supp = "%"

choose case dwo.name
	case "supp_no"
		this.setcolumn( "ymd1" )
	case "ymd1"
		this.setcolumn( "ymd2" )
end choose
this.setfocus()

end event

event rbuttondown;choose case dwo.name
	case 'ymd1'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.ymd1[1] = date(message.stringparm)
		end if
		this.SetColumn('ymd2')
	case 'ymd2'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.ymd2[1] = date(message.stringparm)
		end if
end choose
this.postevent(itemchanged!)

end event

type rb_1 from radiobutton within w_apoibputtot_r
integer x = 1595
integer y = 56
integer width = 242
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_apoibputtot_r
integer x = 1842
integer y = 56
integer width = 247
integer height = 64
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
string text = "제품"
end type

type rb_3 from radiobutton within w_apoibputtot_r
integer x = 1595
integer y = 136
integer width = 247
integer height = 64
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
string text = "상품"
end type

type rb_4 from radiobutton within w_apoibputtot_r
integer x = 1842
integer y = 136
integer width = 315
integer height = 64
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
string text = "원재료"
end type

type dw_5 from datawindow within w_apoibputtot_r
integer x = 1280
integer y = 16
integer width = 101
integer height = 76
boolean bringtotop = true
string title = "none"
string dataobject = "d_apbitemtot_r3"
boolean livescroll = true
end type

type st_5 from statictext within w_apoibputtot_r
integer x = 2446
integer y = 252
integer width = 613
integer height = 92
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "현황과 원본, 월분석은 단수차이 발생."
boolean focusrectangle = false
end type

type cbx_3 from checkbox within w_apoibputtot_r
integer x = 4306
integer y = 272
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx
long   ll_itemnm, ll_qa


if this.checked = true then
	ll_itemnm = long(dw_6.object.item_name.width)
	ll_qa     = long(dw_6.object.qa.width)
	ls_colx   = string(ll_itemnm + ll_qa)
	dw_6.object.datawindow.horizontalscrollsplit= "1536" // ls_colx
else
	ls_colx = "0"
	dw_6.object.datawindow.horizontalscrollsplit= ls_colx
end if

end event

type dw_8 from datawindow within w_apoibputtot_r
integer x = 1403
integer y = 16
integer width = 101
integer height = 76
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_apbitemtot_r2"
boolean livescroll = true
end type

type dw_4 from datawindow within w_apoibputtot_r
integer x = 270
integer y = 636
integer width = 4238
integer height = 1792
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_apbitemtot_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_3 from statictext within w_apoibputtot_r
integer x = 73
integer y = 272
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

type ddlb_fld from dropdownlistbox within w_apoibputtot_r
integer x = 261
integer y = 256
integer width = 480
integer height = 632
integer taborder = 10
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

type ddlb_dwtitles from dropdownlistbox within w_apoibputtot_r
integer x = 302
integer y = 268
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

type st_4 from statictext within w_apoibputtot_r
integer x = 759
integer y = 272
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

type ddlb_op from dropdownlistbox within w_apoibputtot_r
integer x = 928
integer y = 256
integer width = 297
integer height = 512
integer taborder = 20
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

type sle_value from singlelineedit within w_apoibputtot_r
integer x = 1248
integer y = 264
integer width = 494
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

type cb_1 from commandbutton within w_apoibputtot_r
integer x = 1755
integer y = 264
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

if rb_5.checked = true then			// 집계
	arg_dw = dw_1	
elseif rb_6.checked = true then		// 거래처
	arg_dw = dw_4
elseif rb_7.checked = true then		// 횟수
	arg_dw = dw_9
elseif rb_8.checked = true then		// 월분석
	arg_dw = dw_6
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_apoibputtot_r
integer x = 1920
integer y = 264
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

if rb_5.checked = true then			// 집계
	arg_dw = dw_1	
elseif rb_6.checked = true then		// 거래처
	arg_dw = dw_4
elseif rb_7.checked = true then		// 횟수
	arg_dw = dw_9
elseif rb_8.checked = true then		// 월분석
	arg_dw = dw_6
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_apoibputtot_r
integer x = 2085
integer y = 264
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

if rb_5.checked = true then			// 집계
	arg_dw = dw_1	
elseif rb_6.checked = true then		// 거래처
	arg_dw = dw_4
elseif rb_7.checked = true then		// 횟수
	arg_dw = dw_9
elseif rb_8.checked = true then		// 월분석
	arg_dw = dw_6
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_apoibputtot_r
integer x = 2249
integer y = 264
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

if rb_5.checked = true then			// 집계
	arg_dw = dw_1	
elseif rb_6.checked = true then		// 거래처
	arg_dw = dw_4
elseif rb_7.checked = true then		// 횟수
	arg_dw = dw_9
elseif rb_8.checked = true then		// 월분석
	arg_dw = dw_6
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_9 from datawindow within w_apoibputtot_r
integer x = 425
integer y = 848
integer width = 3890
integer height = 1424
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_apbitemtot_t2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_6 from datawindow within w_apoibputtot_r
integer x = 827
integer y = 1112
integer width = 3099
integer height = 860
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_apbitemtot_ct"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_5 from radiobutton within w_apoibputtot_r
integer x = 3122
integer y = 272
integer width = 242
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
string text = "집계"
boolean checked = true
end type

event clicked;// 집계표
if this.checked = true then
	dw_1.visible = true
	dw_4.visible = false
	dw_9.visible = false
	dw_6.visible = false
else
	dw_1.visible = false
	dw_4.visible = false
	dw_9.visible = false
	dw_6.visible = false
end if
cbx_3.visible = false	// 틀고정
pb_retrieve.postevent( clicked! )

end event

type rb_6 from radiobutton within w_apoibputtot_r
integer x = 3392
integer y = 272
integer width = 311
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
string text = "거래처"
end type

event clicked;// 거래처계
if this.checked = true then
	dw_1.visible = false
	dw_4.visible = true
	dw_9.visible = false
	dw_6.visible = false
else
	dw_1.visible = false
	dw_4.visible = false
	dw_9.visible = false
	dw_6.visible = false
end if
cbx_3.visible = false	// 틀고정
pb_retrieve.postevent( clicked! )

end event

type rb_7 from radiobutton within w_apoibputtot_r
integer x = 3730
integer y = 272
integer width = 233
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
string text = "횟수"
end type

event clicked;// 횟수계
if this.checked = true then
	dw_1.visible = false
	dw_4.visible = false
	dw_9.visible = true
	dw_6.visible = false
else
	dw_1.visible = false
	dw_4.visible = false
	dw_9.visible = false
	dw_6.visible = false
end if
cbx_3.visible = false	// 틀고정
pb_retrieve.postevent( clicked! )

//
//if this.checked = true then
//	dw_9.visible  = true		// 횟수계
//	dw_7.visible  = false	// 월분석
//	dw_1.visible  = false
//	dw_4.visible  = false
//	dw_6.visible  = false
//	
//	cbx_3.visible = true		// 틀고정
//	if MessageBox("확인", "전년도 전체를 조회 하시겠습니까?", Exclamation!, YesNo!, 1) = 1 then
//		datetime ldt_sdate, ldt_edate
//		SELECT top 1 dateadd(year, -1, getdate()), getdate() INTO :ldt_sdate, :ldt_edate FROM login;
//		
//		dw_3.object.ymd1[1] = date(string(ldt_sdate,"yyyy/01/01"))
//		dw_3.object.ymd2[1] = date(string(ldt_sdate,"yyyy/12/31"))			
//	end if	
//else
////	if cbx_cust.checked = true then
////		dw_4.visible = true
////	else
////		dw_1.visible = true
////	end if
//	dw_9.visible  = false	
//	dw_6.visible  = false	
//	dw_7.visible  = false
//	cbx_3.visible = false	// 틀고정
//end if
//
//pb_retrieve.triggerevent( clicked! )
//if this.checked = true then
//	cbx_3.checked = true
//	cbx_3.postevent( clicked! )
//end if
//
end event

type rb_8 from radiobutton within w_apoibputtot_r
integer x = 3991
integer y = 272
integer width = 302
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
string text = "월분석"
end type

event clicked;// 월분석
if this.checked = true then
	dw_1.visible = false
	dw_4.visible = false
	dw_9.visible = false
	dw_6.visible = true

	cbx_3.visible = true	// 틀고정
	if MessageBox("확인", "전년도 전체를 조회 하시겠습니까?", Exclamation!, YesNo!, 1) = 1 then
		datetime ldt_sdate, ldt_edate
		SELECT top 1 dateadd(year, -1, getdate()), getdate() INTO :ldt_sdate, :ldt_edate FROM login;
		
		dw_3.object.ymd1[1] = date(string(ldt_sdate,"yyyy/01/01"))
		dw_3.object.ymd2[1] = date(string(ldt_sdate,"yyyy/12/31"))			
	end if	
else
	dw_1.visible = false
	dw_4.visible = false
	dw_9.visible = false
	dw_6.visible = false

	cbx_3.visible = false	// 틀고정
end if
pb_retrieve.postevent( clicked! )

end event

