$PBExportHeader$w_ipcustpur1_r.srw
$PBExportComments$물품별입고내역보고서(1998/05/13,곽용덕)
forward 
global type w_ipcustpur1_r from w_inheritance
end type
type dw_3 from datawindow within w_ipcustpur1_r
end type
type rb_1 from radiobutton within w_ipcustpur1_r
end type
type rb_2 from radiobutton within w_ipcustpur1_r
end type
type st_2 from statictext within w_ipcustpur1_r
end type
type dw_area from datawindow within w_ipcustpur1_r
end type
type dw_4 from datawindow within w_ipcustpur1_r
end type
type pb_1 from picturebutton within w_ipcustpur1_r
end type
type pb_2 from picturebutton within w_ipcustpur1_r
end type
type st_3 from statictext within w_ipcustpur1_r
end type
type ddlb_fld from dropdownlistbox within w_ipcustpur1_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ipcustpur1_r
end type
type st_4 from statictext within w_ipcustpur1_r
end type
type ddlb_op from dropdownlistbox within w_ipcustpur1_r
end type
type sle_value from singlelineedit within w_ipcustpur1_r
end type
type cb_1 from commandbutton within w_ipcustpur1_r
end type
type cb_2 from commandbutton within w_ipcustpur1_r
end type
type cb_3 from commandbutton within w_ipcustpur1_r
end type
type cb_5 from commandbutton within w_ipcustpur1_r
end type
type dw_5 from datawindow within w_ipcustpur1_r
end type
type cbx_sum from checkbox within w_ipcustpur1_r
end type
type cbx_yymm from checkbox within w_ipcustpur1_r
end type
type cbx_hap from checkbox within w_ipcustpur1_r
end type
end forward

global type w_ipcustpur1_r from w_inheritance
integer width = 4293
integer height = 2320
string title = "물품별 입고내역(w_ipcustpur1_r)"
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
st_2 st_2
dw_area dw_area
dw_4 dw_4
pb_1 pb_1
pb_2 pb_2
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
dw_5 dw_5
cbx_sum cbx_sum
cbx_yymm cbx_yymm
cbx_hap cbx_hap
end type
global w_ipcustpur1_r w_ipcustpur1_r

type variables
st_print i_print
string is_dw, is_item
date   id_date1, id_date2

datawindowchild idwc_area, idwc_itemno, idwc_no
end variables

on w_ipcustpur1_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_2=create st_2
this.dw_area=create dw_area
this.dw_4=create dw_4
this.pb_1=create pb_1
this.pb_2=create pb_2
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
this.dw_5=create dw_5
this.cbx_sum=create cbx_sum
this.cbx_yymm=create cbx_yymm
this.cbx_hap=create cbx_hap
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.pb_2
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
this.Control[iCurrent+19]=this.dw_5
this.Control[iCurrent+20]=this.cbx_sum
this.Control[iCurrent+21]=this.cbx_yymm
this.Control[iCurrent+22]=this.cbx_hap
end on

on w_ipcustpur1_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.pb_2)
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
destroy(this.dw_5)
destroy(this.cbx_sum)
destroy(this.cbx_yymm)
destroy(this.cbx_hap)
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
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

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

// 전체 품목
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.getchild("item_no", idwc_itemno)
idwc_itemno.settransobject(SQLCA)

idwc_itemno.insertrow(1)
idwc_itemno.setitem(1, "item_no", "%")
idwc_itemno.setitem(1, "item_name", "전체")
dw_3.object.item_no[1] = "%"

dw_3.object.ymd1[1] = date(string(today(),"yyyy/mm/01"))
dw_3.object.ymd2[1] = date(string(today(),"yyyy/mm/dd"))

id_date1 = dw_3.object.ymd1[1]
id_date2 = dw_3.object.ymd2[1]

//
cbx_sum.checked = true
cbx_sum.PostEvent( clicked! )

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

dw_4.x   = dw_1.x
dw_4.y   = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

dw_5.x   = dw_1.x
dw_5.y   = dw_1.y
dw_5.width  = dw_1.width
dw_5.height = dw_1.height


end event

type pb_save from w_inheritance`pb_save within w_ipcustpur1_r
boolean visible = false
end type

event clicked;call super::clicked;gs_where2 lstr_where
string ls_null
long   ll_row

dw_3.accepttext()

lstr_where.chk = "S"
openwithparm(w_whitemselectmulti_w,lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk = "Y" then
	dw_3.SetRedraw(FALSE)
	dw_3.object.item_no[1] = lstr_where.str1[1]
	setnull(ls_null)
	dw_3.SetRedraw(TRUE)
	pb_retrieve.triggerevent(clicked!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_ipcustpur1_r
string tag = "d_ipcustpur1_t2"
integer x = 32
integer y = 440
integer width = 4187
integer height = 1744
integer taborder = 60
string dataobject = "d_ipcustpur1_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ipcustpur1_r
integer x = 32
integer y = 20
integer width = 978
integer height = 140
string text = "물품별 입고내역"
end type

type st_tips from w_inheritance`st_tips within w_ipcustpur1_r
end type

type pb_compute from w_inheritance`pb_compute within w_ipcustpur1_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipcustpur1_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipcustpur1_r
integer x = 3995
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipcustpur1_r
integer x = 3607
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
i_print.st_print_desc  = " 이 프로그램은 물품별 입고내역 보고서를 출력합니다."

if rb_1.checked = true then
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=86'
else
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=84'
end if
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ipcustpur1_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ipcustpur1_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ipcustpur1_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipcustpur1_r
integer x = 3415
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_itemno, ls_yymm
long   ll_row
date   ld_sdate, ld_edate

// 사업장
dw_area.accepttext()
ls_area = LeftA(dw_area.object.area[1],1)
if ls_area = "" then ls_area = "%"

// ITEM_NO
dw_3.accepttext()
ls_itemno  = dw_3.object.item_no[1]
if isnull(ls_itemno) OR ls_itemno = "" then ls_itemno = "%"
if ls_itemno = "%" then
	dw_3.object.item_no[1] = "%"
end if

// 일자
ld_sdate   = dw_3.object.ymd1[1]
ld_edate   = dw_3.object.ymd2[1]

// 년월별
if cbx_yymm.checked = true then
	ls_yymm = "Y"
else
	ls_yymm = "N"
end if

// 집계보기
if cbx_sum.checked = true then
	dw_5.reset()
	dw_5.retrieve( ls_area, ls_itemno, ld_sdate, ld_edate, ls_yymm )
else
	// 상세
	if rb_1.checked = true then
		dw_1.reset()
		dw_1.retrieve( ls_itemno, ld_sdate, ld_edate, ls_area )
		if dw_1.rowcount() < 1 then
			MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
		end if
	// 집계
	else
		dw_4.reset()
		dw_4.retrieve( ls_itemno, ld_sdate, ld_edate, ls_area )
		if dw_4.rowcount() < 1 then
			MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
		end if
	end if
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipcustpur1_r
integer x = 32
integer y = 236
integer width = 4187
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_ipcustpur1_r
integer x = 1065
integer y = 0
integer width = 2286
integer height = 220
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipcustpur1_r
integer x = 3374
integer y = 0
integer width = 846
integer height = 220
integer taborder = 50
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ipcustpur1_r
integer x = 50
integer y = 180
integer width = 87
integer height = 64
integer taborder = 70
string dataobject = "d_ipcustpur1_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_ipcustpur1_r
integer x = 1623
integer y = 44
integer width = 1047
integer height = 164
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_ipsupp1_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
dw_1.reset()
this.AcceptText()

is_item =  trim(this.object.item_no[1]) 
id_date1 = this.object.ymd1[1]
id_date2 = this.object.ymd2[1]

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

type rb_1 from radiobutton within w_ipcustpur1_r
integer x = 2674
integer y = 56
integer width = 219
integer height = 76
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
dw_1.dataobject = 'd_ipcustpur1_t'
dw_1.settransobject(sqlca)
dw_1.visible = true

dw_2.dataobject = 'd_ipcustpur1_r'
dw_1.sharedata(dw_2)


end event

type rb_2 from radiobutton within w_ipcustpur1_r
integer x = 2674
integer y = 128
integer width = 219
integer height = 76
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
dw_4.dataobject = 'd_ipcustpur1_t2'
dw_4.settransobject(sqlca)
dw_4.visible = true

dw_2.dataobject = 'd_ipcustpur1_r2'
dw_4.sharedata(dw_2)


end event

type st_2 from statictext within w_ipcustpur1_r
integer x = 1093
integer y = 44
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

type dw_area from datawindow within w_ipcustpur1_r
integer x = 1093
integer y = 120
integer width = 526
integer height = 80
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

type dw_4 from datawindow within w_ipcustpur1_r
integer x = 498
integer y = 568
integer width = 3323
integer height = 1376
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipcustpur1_t2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type pb_1 from picturebutton within w_ipcustpur1_r
event mousemove pbm_mousemove
integer x = 3799
integer y = 52
integer width = 187
integer height = 144
integer taborder = 50
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
		        "엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
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

type pb_2 from picturebutton within w_ipcustpur1_r
integer x = 2917
integer y = 56
integer width = 398
integer height = 140
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품목선택"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;//
gs_where2 lstr_where
string ls_null
long   ll_row

setnull(ls_null)
dw_3.accepttext()

lstr_where.chk = "S"
OpenWithParm( w_whitemselectmulti_w, lstr_where )
lstr_where = Message.PowerObjectParm

if lstr_where.chk = "Y" then
	dw_3.object.item_no[1] = lstr_where.str1[1]

	pb_retrieve.triggerevent(clicked!)
end if

end event

type st_3 from statictext within w_ipcustpur1_r
integer x = 96
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

type ddlb_fld from dropdownlistbox within w_ipcustpur1_r
integer x = 283
integer y = 288
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

type ddlb_dwtitles from dropdownlistbox within w_ipcustpur1_r
integer x = 315
integer y = 300
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

type st_4 from statictext within w_ipcustpur1_r
integer x = 754
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

type ddlb_op from dropdownlistbox within w_ipcustpur1_r
integer x = 923
integer y = 288
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

type sle_value from singlelineedit within w_ipcustpur1_r
integer x = 1243
integer y = 292
integer width = 567
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

type cb_1 from commandbutton within w_ipcustpur1_r
integer x = 1815
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ipcustpur1_r
integer x = 1979
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
end choose

ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ipcustpur1_r
integer x = 2144
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ipcustpur1_r
integer x = 2309
integer y = 292
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_5 from datawindow within w_ipcustpur1_r
integer x = 914
integer y = 844
integer width = 2446
integer height = 832
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_ipcustpur1_ct"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

//is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type cbx_sum from checkbox within w_ipcustpur1_r
integer x = 2514
integer y = 280
integer width = 402
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
string text = "집계보기"
end type

event clicked;// 집계보기
if this.checked = true then
	cbx_yymm.checked = true
	dw_5.visible = true
	
	rb_1.enabled = false
	rb_2.enabled = false
	
	dw_1.visible = false
	dw_4.visible = false
else
	dw_5.visible = false

	rb_1.enabled = true
	rb_2.enabled = true

	if rb_1.checked = true then	
		dw_1.visible = true
		dw_4.visible = false
	else
		dw_1.visible = false
		dw_4.visible = true
	end if
end if

end event

type cbx_yymm from checkbox within w_ipcustpur1_r
integer x = 2514
integer y = 340
integer width = 402
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
string text = "년월별"
end type

type cbx_hap from checkbox within w_ipcustpur1_r
integer x = 2953
integer y = 280
integer width = 489
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
string text = "합계만 보기"
end type

event clicked;//
DataWindow arg_dw

if dw_1.visible = true then
	arg_dw = dw_1
elseif dw_4.visible = true then
	arg_dw = dw_4
elseif dw_5.visible = true then
	arg_dw = dw_5
else
	MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
	RETURN
end if

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
else
	arg_dw.Modify("DataWindow.Detail.Height=72")		
	arg_dw.Modify("DataWindow.Trailer.3.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

