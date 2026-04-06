$PBExportHeader$w_mpslitsfc_r.srw
$PBExportComments$일별 코일입고 현황(2001/05/02,이인호)
forward 
global type w_mpslitsfc_r from w_inheritance
end type
type em_1 from editmask within w_mpslitsfc_r
end type
type em_2 from editmask within w_mpslitsfc_r
end type
type rb_1 from radiobutton within w_mpslitsfc_r
end type
type rb_3 from radiobutton within w_mpslitsfc_r
end type
type rb_4 from radiobutton within w_mpslitsfc_r
end type
type ddlb_1 from dropdownlistbox within w_mpslitsfc_r
end type
type rb_2 from radiobutton within w_mpslitsfc_r
end type
type pb_1 from picturebutton within w_mpslitsfc_r
end type
type st_2 from statictext within w_mpslitsfc_r
end type
type dw_area from datawindow within w_mpslitsfc_r
end type
type dw_3 from datawindow within w_mpslitsfc_r
end type
type cbx_sum from checkbox within w_mpslitsfc_r
end type
type st_8 from statictext within w_mpslitsfc_r
end type
type ddlb_fld from dropdownlistbox within w_mpslitsfc_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpslitsfc_r
end type
type st_9 from statictext within w_mpslitsfc_r
end type
type ddlb_op from dropdownlistbox within w_mpslitsfc_r
end type
type sle_value from singlelineedit within w_mpslitsfc_r
end type
type cb_filteron from commandbutton within w_mpslitsfc_r
end type
type cb_filteroff from commandbutton within w_mpslitsfc_r
end type
type cb_1 from commandbutton within w_mpslitsfc_r
end type
type cb_2 from commandbutton within w_mpslitsfc_r
end type
type gb_4 from groupbox within w_mpslitsfc_r
end type
end forward

global type w_mpslitsfc_r from w_inheritance
integer width = 4681
integer height = 2388
string title = "일별코일 입고현황(w_mpslitsfc_r)"
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_3 rb_3
rb_4 rb_4
ddlb_1 ddlb_1
rb_2 rb_2
pb_1 pb_1
st_2 st_2
dw_area dw_area
dw_3 dw_3
cbx_sum cbx_sum
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
gb_4 gb_4
end type
global w_mpslitsfc_r w_mpslitsfc_r

type variables
st_print i_print
date id_start, id_end
string is_wc = 'W'
datawindowchild idwc_area
end variables

on w_mpslitsfc_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_3=create rb_3
this.rb_4=create rb_4
this.ddlb_1=create ddlb_1
this.rb_2=create rb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.dw_area=create dw_area
this.dw_3=create dw_3
this.cbx_sum=create cbx_sum
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.pb_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.dw_area
this.Control[iCurrent+11]=this.dw_3
this.Control[iCurrent+12]=this.cbx_sum
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_9
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_filteron
this.Control[iCurrent+20]=this.cb_filteroff
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.cb_2
this.Control[iCurrent+23]=this.gb_4
end on

on w_mpslitsfc_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.ddlb_1)
destroy(this.rb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.dw_3)
destroy(this.cbx_sum)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.insertrow(0)
dw_2.visible = false
em_1.text = string(today(), "YYYY/MM/DD")
em_2.text = string(today(), "YYYY/MM/DD")
ddlb_1.text = '원코일'

dw_3.settransobject(sqlca)
dw_3.visible = false

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
dw_area.object.area[1] = gs_area

rb_1.enabled = false
rb_2.enabled = true
rb_2.checked = true
rb_2.triggerevent(clicked!)
rb_3.enabled = false

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (dw_1.x * 2)
dw_1.height = newheight - dw_1.y - dw_1.x

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width 
dw_3.height = dw_1.height



end event

type pb_save from w_inheritance`pb_save within w_mpslitsfc_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpslitsfc_r
string tag = "d_mpslitsfc_wt1"
integer x = 32
integer y = 424
integer width = 4576
integer height = 1820
integer taborder = 30
string title = "d_mpslitsfc_t"
string dataobject = "d_mpslitsfc_t"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_mpslitsfc_r
integer x = 32
integer width = 1362
integer height = 136
string text = "일별코일 입고현황"
end type

type st_tips from w_inheritance`st_tips within w_mpslitsfc_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpslitsfc_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpslitsfc_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpslitsfc_r
integer x = 4384
integer y = 64
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpslitsfc_r
integer x = 3991
integer y = 64
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_1.getrow() <= 0 THEN
   RETURN
END IF

dw_2.SetTransObject(SQLCA)
dw_1.sharedata(dw_2)

//dw_2.SetTransObject(SQLCA)
//dw_2.Retrieve()
//dw_2.sharedata(dw_1)

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 일별 코일작업현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpslitsfc_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpslitsfc_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mpslitsfc_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpslitsfc_r
integer x = 3799
integer y = 64
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_area
date   ld_sdate, ld_edate

DEBUGBREAK()

dw_area.accepttext()

ls_area    = LeftA(dw_area.object.area[1],1)
if ls_area = "" then	ls_area = "%"

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

dw_1.reset()
dw_1.SetTransObject(SQLCA)

if is_wc = 'W' and rb_2.checked = true then
	if gs_team = "12000" then
		dw_1.retrieve( ld_sdate, ld_edate, "S")
		dw_3.retrieve( ld_sdate, ld_edate, "S")
	else
		dw_1.retrieve( ld_sdate, ld_edate, LeftA(ls_area,1))
		dw_3.retrieve( ld_sdate, ld_edate, LeftA(ls_area,1))
	end if
else
	dw_1.retrieve( ld_sdate, ld_edate)
	dw_3.retrieve( ld_sdate, ld_edate, LeftA(ls_area,1))
end if

if dw_1.rowcount() < 1 then
	MessageBox("에러","해당일에 조회한 자료가 없습니다",Exclamation!)
end if

if cbx_sum.checked = true then
	dw_3.setfocus()
else
	dw_1.setfocus()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpslitsfc_r
integer x = 32
integer y = 240
integer width = 4576
integer height = 164
integer taborder = 80
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_mpslitsfc_r
integer x = 2651
integer y = 16
integer width = 1093
integer height = 212
integer taborder = 0
integer textsize = -10
long textcolor = 0
string text = "구분"
end type

type gb_1 from w_inheritance`gb_1 within w_mpslitsfc_r
integer x = 3762
integer y = 16
integer width = 841
integer height = 212
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpslitsfc_r
integer x = 1042
integer y = 8
integer width = 160
integer height = 120
integer taborder = 40
string dataobject = "d_mpslitsfc_wr1"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_mpslitsfc_r
integer x = 2080
integer y = 60
integer width = 407
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpslitsfc_r
integer x = 2181
integer y = 136
integer width = 407
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event modified;id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_mpslitsfc_r
integer x = 3040
integer y = 64
integer width = 247
integer height = 60
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

event clicked;CHOOSE CASE is_wc
	CASE 'W'
		dw_1.dataobject = 'd_mpslitsfc_wt'
		dw_2.dataobject = 'd_mpslitsfc_wr'
	CASE 'C'
		dw_1.dataobject = 'd_mpslitsfc_t'
		dw_2.dataobject = 'd_mpslitsfc_r'
END CHOOSE


end event

type rb_3 from radiobutton within w_mpslitsfc_r
integer x = 3040
integer y = 148
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주"
end type

event clicked;CHOOSE CASE is_wc
	CASE 'W'
		dw_1.dataobject = 'd_mpslitsfc_wt2'
		dw_2.dataobject = 'd_mpslitsfc_wr2'
	CASE 'C'
		dw_1.dataobject = 'd_mpslitsfc_t2'
		dw_2.dataobject = 'd_mpslitsfc_r2'
END CHOOSE

end event

type rb_4 from radiobutton within w_mpslitsfc_r
integer x = 3269
integer y = 148
integer width = 247
integer height = 60
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
string text = "구매"
end type

event clicked;dw_1.dataobject = 'd_mpslitsfc_t3'
dw_2.dataobject = 'd_mpslitsfc_r3'
end event

type ddlb_1 from dropdownlistbox within w_mpslitsfc_r
integer x = 2688
integer y = 92
integer width = 334
integer height = 332
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
string item[] = {"원코일","스리팅"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_wc = 'W'
		rb_1.enabled = false
		rb_2.enabled = true
		rb_2.checked = true
		rb_2.triggerevent(clicked!)
		rb_3.enabled = false
	CASE 2
		is_wc = 'C'
		rb_1.enabled = true
		rb_1.checked = true
		rb_1.triggerevent(clicked!)
		rb_2.enabled = true
		rb_3.enabled = true
END CHOOSE

end event

type rb_2 from radiobutton within w_mpslitsfc_r
integer x = 3269
integer y = 64
integer width = 233
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사내"
end type

event clicked;CHOOSE CASE is_wc
	CASE 'W'
		dw_1.dataobject = 'd_mpslitsfc_wt1'
		dw_2.dataobject = 'd_mpslitsfc_wr1'
	CASE 'C'
		dw_1.dataobject = 'd_mpslitsfc_t1'
		dw_2.dataobject = 'd_mpslitsfc_r1'
END CHOOSE

end event

type pb_1 from picturebutton within w_mpslitsfc_r
event mousemove pbm_mousemove
integer x = 4183
integer y = 64
integer width = 187
integer height = 144
integer taborder = 140
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
datawindow dw_xls

if cbx_sum.checked = true then
	dw_xls = dw_3
else
	dw_xls = dw_1
end if

if dw_xls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_xls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	
	MessageBox("확인","작업완료")
end if	

end event

type st_2 from statictext within w_mpslitsfc_r
integer x = 1527
integer y = 56
integer width = 526
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpslitsfc_r
integer x = 1527
integer y = 136
integer width = 526
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

type dw_3 from datawindow within w_mpslitsfc_r
integer x = 617
integer y = 824
integer width = 3497
integer height = 924
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpslitsfc_wt2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_sum from checkbox within w_mpslitsfc_r
integer x = 3515
integer y = 148
integer width = 215
integer height = 60
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
if this.checked = true then
	dw_3.visible = true
	dw_1.visible = false
else
	dw_3.visible = false
	dw_1.visible = true
end if

end event

type st_8 from statictext within w_mpslitsfc_r
integer x = 101
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_mpslitsfc_r
integer x = 283
integer y = 296
integer width = 480
integer height = 580
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

type ddlb_dwtitles from dropdownlistbox within w_mpslitsfc_r
integer x = 343
integer y = 304
integer width = 306
integer height = 92
integer taborder = 120
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

type st_9 from statictext within w_mpslitsfc_r
integer x = 800
integer y = 316
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_mpslitsfc_r
integer x = 974
integer y = 296
integer width = 261
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpslitsfc_r
integer x = 1248
integer y = 300
integer width = 581
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_mpslitsfc_r
integer x = 1842
integer y = 296
integer width = 197
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_mpslitsfc_r
integer x = 2043
integer y = 296
integer width = 197
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_mpslitsfc_r
integer x = 2245
integer y = 296
integer width = 183
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_mpslitsfc_r
integer x = 2432
integer y = 296
integer width = 183
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

type gb_4 from groupbox within w_mpslitsfc_r
integer x = 1481
integer y = 16
integer width = 1147
integer height = 212
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

