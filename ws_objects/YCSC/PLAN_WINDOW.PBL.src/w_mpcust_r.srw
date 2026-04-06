$PBExportHeader$w_mpcust_r.srw
$PBExportComments$거래처별 생산계획 조회(1998/05/06, 이인호)
forward
global type w_mpcust_r from w_inheritance
end type
type cb_1 from commandbutton within w_mpcust_r
end type
type em_1 from editmask within w_mpcust_r
end type
type st_22 from statictext within w_mpcust_r
end type
type em_2 from editmask within w_mpcust_r
end type
type dw_3 from datawindow within w_mpcust_r
end type
type rb_1 from radiobutton within w_mpcust_r
end type
type rb_2 from radiobutton within w_mpcust_r
end type
type rb_3 from radiobutton within w_mpcust_r
end type
type cbx_1 from checkbox within w_mpcust_r
end type
type dw_area from datawindow within w_mpcust_r
end type
type gb_15 from groupbox within w_mpcust_r
end type
end forward

global type w_mpcust_r from w_inheritance
integer width = 3712
integer height = 2212
string title = "거래처별 생산계획 조회(w_mpcust_r)"
cb_1 cb_1
em_1 em_1
st_22 st_22
em_2 em_2
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cbx_1 cbx_1
dw_area dw_area
gb_15 gb_15
end type
global w_mpcust_r w_mpcust_r

type variables
st_print i_print
string is_custno, is_scenesql
long il_row
datawindowchild idwc_scene, idwc_cust
date id_date1, id_date2
end variables

on w_mpcust_r.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.em_1=create em_1
this.st_22=create st_22
this.em_2=create em_2
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cbx_1=create cbx_1
this.dw_area=create dw_area
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_22
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_3
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.dw_area
this.Control[iCurrent+11]=this.gb_15
end on

on w_mpcust_r.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.em_1)
destroy(this.st_22)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cbx_1)
destroy(this.dw_area)
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.insertrow(0)

dw_3.SetTransObject(SQLCA)
em_1.text = string(today(),'yyyy/mm/dd')
id_date1 = today()
em_2.text = string(today(),'yyyy/mm/dd')
id_date2 = today()
em_1.setfocus()
dw_2.visible = false
cb_1.visible = false

dw_1.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")
dw_3.sharedata(dw_2)

// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천
end event

event resize;call super::resize;dw_3.width  = this.width  - 137
dw_3.height = this.height - 544
end event

type pb_save from w_inheritance`pb_save within w_mpcust_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpcust_r
integer x = 87
integer y = 276
integer width = 2345
integer height = 92
string dataobject = "d_mpcust_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;string ls_cust_no, ls_where, ls_sql, ls_null

dw_3.reset()
CHOOSE CASE dwo.name
	CASE 'cust_no'
		this.getchild("scene_code", idwc_scene)
		idwc_scene.settransobject(sqlca)
		this.accepttext()
		ls_cust_no = trim(this.getitemstring(1, "cust_no"))
		setnull(ls_null)
		this.object.scene_code[1] = ls_null
		this.getchild("cust_no", idwc_cust)
		idwc_cust.settransobject(sqlca)
		if isnull(ls_cust_no) or ls_cust_no = '' then
			ls_where = ""
		else
			ls_where = " where scene.cust_no = ~~'" + ls_cust_no + "~~'"
		end if
		ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
		idwc_scene.modify(ls_sql)
		idwc_scene.retrieve()
		this.setfocus()
	CASE 'scene_code'
		if isnull(data) or trim(data) = '' then
			return
		end if
	   this.getchild("scene_code", idwc_scene)
   	idwc_scene.settransobject(sqlca)
		ls_cust_no = LeftA(data,4)
		this.setredraw(false)
		this.object.cust_no[1] = ls_cust_no
		this.setredraw(true)
END CHOOSE


end event

type dw_2 from w_inheritance`dw_2 within w_mpcust_r
integer x = 1166
integer y = 4
integer width = 87
integer height = 64
string dataobject = "d_mpcust_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpcust_r
integer x = 23
integer y = 72
integer width = 1317
string text = "거래처별 생산계획 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpcust_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpcust_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpcust_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpcust_r
integer x = 3397
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpcust_r
integer x = 3205
integer y = 64
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_3.rowcount() <= 0 THEN
   RETURN
END IF

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 거래처별 생산계획 내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=87'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpcust_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpcust_r
boolean visible = false
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_mpcust_r
boolean visible = false
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpcust_r
integer x = 2944
integer y = 68
integer taborder = 180
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date ,ls_flag
string ls_cust_no, ls_scene_code

dw_1.accepttext()
ls_cust_no = trim(dw_1.object.cust_no[1])
if isnull(ls_cust_no) then
	messagebox("에러","거래처를 선택하십시요.",Exclamation!)
	return
end if
if cbx_1.checked = true then
	ls_scene_code = "%"
else
	ls_scene_code = trim(dw_1.object.scene_code[1])
	IF isnull(ls_scene_code) then
		ls_scene_code = "%"
	else
	end if
end if

ls_date = trim(em_1.text)
if isdate(ls_date) = false then
	beep(1)
	em_1.setfocus()
	return
end if
id_date1 = date(ls_date)

ls_date = trim(em_2.text)
if isdate(ls_date) = false then
	beep(1)
	em_2.setfocus()
	return
end if
id_date2 = date(ls_date)

if rb_1.checked = true then
	ls_flag = "%"   //생산계획여부
else
	if rb_2.checked = true then
		ls_flag = "Y"
	else
		ls_flag = "N"
	end if
end if

dw_3.reset()
dw_3.retrieve(ls_cust_no, ls_scene_code, id_date1, id_date2, ls_flag, dw_area.object.area[1])


if dw_3.rowcount() < 1 then
	messagebox("에러","조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpcust_r
integer x = 1888
integer y = 24
integer width = 1266
integer height = 204
integer taborder = 70
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "수주일자"
end type

type gb_2 from w_inheritance`gb_2 within w_mpcust_r
integer x = 37
integer y = 236
integer width = 3575
integer height = 144
integer taborder = 80
integer textsize = -8
end type

type gb_1 from w_inheritance`gb_1 within w_mpcust_r
integer x = 3168
integer y = 24
integer width = 443
end type

type cb_1 from commandbutton within w_mpcust_r
integer x = 3186
integer y = 272
integer width = 329
integer height = 96
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "고객조회"
end type

event clicked;string ls_custno

if dw_1.rowcount() < 1 then
	ls_custno = ""
else
	ls_custno = dw_1.object.cust_no[1]
	if isnull(ls_custno) or ls_custno = "" then
		ls_custno = "*"
	end if
end if
openwithparm(w_whcustomer_w,ls_custno)
end event

type em_1 from editmask within w_mpcust_r
integer x = 1998
integer y = 132
integer width = 366
integer height = 76
integer taborder = 100
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
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_22 from statictext within w_mpcust_r
integer x = 2395
integer y = 144
integer width = 55
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_mpcust_r
integer x = 2478
integer y = 132
integer width = 366
integer height = 76
integer taborder = 110
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
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_mpcust_r
integer x = 37
integer y = 392
integer width = 3575
integer height = 1668
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_mpcust_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;int li_int
string ls_sale

if row < 1 then return
this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(parent.parentwindow().PointerX(),  parent.parentwindow().PointerY())

ls_sale = trim(this.object.sale_no[row])
CHOOSE CASE gs_print_control
	CASE 'PROC'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
	CASE 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
END CHOOSE

end event

type rb_1 from radiobutton within w_mpcust_r
integer x = 1915
integer y = 76
integer width = 219
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
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_mpcust_r
integer x = 2158
integer y = 76
integer width = 352
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
string text = "생산계획"
end type

type rb_3 from radiobutton within w_mpcust_r
integer x = 2519
integer y = 76
integer width = 416
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
string text = "미생산계획"
end type

type cbx_1 from checkbox within w_mpcust_r
integer x = 2821
integer y = 280
integer width = 338
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
string text = "현장전체"
end type

event clicked;if this.checked = true then
	DW_1.object.scene_code.background.color = rgb(192,192,192)
	DW_1.object.scene_code.protect = 1 
else
	DW_1.object.scene_code.background.color = rgb(255,255,255)
	DW_1.object.scene_code.protect = 0
end if

end event

type dw_area from datawindow within w_mpcust_r
integer x = 1376
integer y = 116
integer width = 494
integer height = 84
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type gb_15 from groupbox within w_mpcust_r
integer x = 1362
integer y = 56
integer width = 521
integer height = 168
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

