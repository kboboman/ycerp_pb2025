$PBExportHeader$w_mpsfcwc_r.srw
$PBExportComments$작업장별 생산현황 조회(2002/05/23,이인호)
forward
global type w_mpsfcwc_r from w_inheritance
end type
type em_1 from editmask within w_mpsfcwc_r
end type
type em_2 from editmask within w_mpsfcwc_r
end type
type st_1 from statictext within w_mpsfcwc_r
end type
type rb_1 from radiobutton within w_mpsfcwc_r
end type
type rb_2 from radiobutton within w_mpsfcwc_r
end type
type rb_3 from radiobutton within w_mpsfcwc_r
end type
type rb_4 from radiobutton within w_mpsfcwc_r
end type
type dw_3 from datawindow within w_mpsfcwc_r
end type
type dw_area from datawindow within w_mpsfcwc_r
end type
type gb_4 from groupbox within w_mpsfcwc_r
end type
type dw_4 from datawindow within w_mpsfcwc_r
end type
type pb_1 from pb_print within w_mpsfcwc_r
end type
type pb_2 from picturebutton within w_mpsfcwc_r
end type
type st_12 from statictext within w_mpsfcwc_r
end type
type ddlb_col from dropdownlistbox within w_mpsfcwc_r
end type
type st_13 from statictext within w_mpsfcwc_r
end type
type ddlb_2 from dropdownlistbox within w_mpsfcwc_r
end type
type sle_value from singlelineedit within w_mpsfcwc_r
end type
type cb_filteron from commandbutton within w_mpsfcwc_r
end type
type cb_filteroff from commandbutton within w_mpsfcwc_r
end type
type cb_11 from commandbutton within w_mpsfcwc_r
end type
type cb_12 from commandbutton within w_mpsfcwc_r
end type
type gb_5 from groupbox within w_mpsfcwc_r
end type
end forward

global type w_mpsfcwc_r from w_inheritance
integer width = 4695
integer height = 2696
string title = "작업장별 생산현황(w_mpsfcwc_r)"
windowstate windowstate = normal!
em_1 em_1
em_2 em_2
st_1 st_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
dw_3 dw_3
dw_area dw_area
gb_4 gb_4
dw_4 dw_4
pb_1 pb_1
pb_2 pb_2
st_12 st_12
ddlb_col ddlb_col
st_13 st_13
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
gb_5 gb_5
end type
global w_mpsfcwc_r w_mpsfcwc_r

type variables
st_print i_print
int ii_year, ii_month
string is_wcno = '%'
datawindowchild idwc_wc
end variables

on w_mpsfcwc_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_3=create dw_3
this.dw_area=create dw_area
this.gb_4=create gb_4
this.dw_4=create dw_4
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_12=create st_12
this.ddlb_col=create ddlb_col
this.st_13=create st_13
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.dw_area
this.Control[iCurrent+10]=this.gb_4
this.Control[iCurrent+11]=this.dw_4
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.pb_2
this.Control[iCurrent+14]=this.st_12
this.Control[iCurrent+15]=this.ddlb_col
this.Control[iCurrent+16]=this.st_13
this.Control[iCurrent+17]=this.ddlb_2
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_filteron
this.Control[iCurrent+20]=this.cb_filteroff
this.Control[iCurrent+21]=this.cb_11
this.Control[iCurrent+22]=this.cb_12
this.Control[iCurrent+23]=this.gb_5
end on

on w_mpsfcwc_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_3)
destroy(this.dw_area)
destroy(this.gb_4)
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_12)
destroy(this.ddlb_col)
destroy(this.st_13)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.x      = dw_3.x
dw_4.y      = dw_3.y
dw_4.width  = dw_3.width
dw_4.height = dw_3.height
dw_4.visible = false

dw_1.insertrow(1)
dw_1.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no','%')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()
dw_1.object.wc_no[1] = "%"

dw_2.visible = false
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)

em_1.text = string(RelativeDate( today(), - 15 ), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

dw_1.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

ddlb_2.text     = "LIKE"
ddlb_col.text   = "품명"
sle_value.text  = ""
end event

event resize;call super::resize;//
gb_5.width  = this.width  - 137
gb_5.height = this.height - 404

dw_3.width  = this.width  - 207
dw_3.height = this.height - 572

dw_4.x      = dw_3.x
dw_4.y      = dw_3.y
dw_4.width  = dw_3.width
dw_4.height = dw_3.height


end event

type pb_save from w_inheritance`pb_save within w_mpsfcwc_r
boolean visible = false
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcwc_r
integer x = 2139
integer y = 52
integer width = 869
integer height = 84
string dataobject = "d_mpwcno_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;long ll_row

this.accepttext()
if data = '%' then
	is_wcno = data
else
	is_wcno = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_name')) + "%"
end if


end event

type dw_2 from w_inheritance`dw_2 within w_mpsfcwc_r
integer x = 1106
integer y = 20
integer width = 128
integer height = 92
string dataobject = "d_mpsfcwc_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpsfcwc_r
integer x = 59
integer width = 1312
integer height = 144
string text = "작업장별 생산현황"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcwc_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcwc_r
boolean visible = false
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcwc_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcwc_r
integer x = 4384
integer y = 60
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcwc_r
integer x = 4178
integer y = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print
datawindow dw_print

IF dw_3.getrow() <= 0 THEN
   RETURN
END IF
if rb_3.checked = true then
	if rb_1.checked = true then
		dw_2.dataobject = 'd_mpsfcwc_r1'
	else
		dw_2.dataobject = 'd_mpsfcwc_r2'
	end if
	dw_2.SetTransObject(SQLCA)
	
	dw_3.sharedata(dw_2)
	dw_print = dw_2
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
else
	dw_print = dw_4
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
end if

i_print.st_datawindow = dw_print
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 작업장별 생산현황을 출력합니다." 

opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcwc_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcwc_r
boolean visible = false
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcwc_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcwc_r
integer x = 3781
integer y = 60
integer taborder = 70
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date   ld_start, ld_end
long   ll_row
string ls_start, ls_end, ls_wcno

ld_start = date(em_1.text)
ld_end   = RelativeDate( ld_start, 31)

ls_start = string(ld_start,"yyyy/mm/dd")
ls_end   = string(ld_end,  "yyyy/mm/dd")
dw_3.reset()
dw_4.reset()

ls_wcno = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_no')) + "%"

if rb_1.checked = true then
	dw_3.retrieve(ls_wcno, ls_start, ls_end, dw_area.object.area[1])
else
	dw_3.retrieve(is_wcno, ld_start, ld_end, dw_area.object.area[1])
end if
dw_4.retrieve(is_wcno, ld_start, ld_end, dw_area.object.area[1])
if dw_3.rowcount() < 1 then
	messagebox("에러","해당월에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcwc_r
integer x = 1422
integer y = 16
integer width = 393
integer height = 208
integer taborder = 120
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "보기"
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcwc_r
integer x = 1833
integer y = 16
integer width = 1216
integer height = 208
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcwc_r
integer x = 3739
integer y = 16
integer width = 864
integer height = 208
integer taborder = 0
integer textsize = -10
end type

type em_1 from editmask within w_mpsfcwc_r
integer x = 2144
integer y = 136
integer width = 361
integer height = 72
integer taborder = 60
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

event rbuttondown;
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm),"yyyy/mm/dd")
end if

end event

type em_2 from editmask within w_mpsfcwc_r
integer x = 2638
integer y = 136
integer width = 361
integer height = 72
integer taborder = 90
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

event rbuttondown;
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm),"yyyy/mm/dd")
end if

end event

type st_1 from statictext within w_mpsfcwc_r
integer x = 2537
integer y = 140
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_mpsfcwc_r
integer x = 1879
integer y = 88
integer width = 229
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
string text = "일별"
boolean checked = true
end type

event clicked;dw_3.dataobject = 'd_mpsfcwc_t1'
dw_4.dataobject = 'd_mpsfcwc_g1'
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)

rb_3.checked = true
rb_4.checked = false
dw_3.visible = true
dw_4.visible = false

pb_retrieve.triggerevent('clicked')
end event

type rb_2 from radiobutton within w_mpsfcwc_r
integer x = 1879
integer y = 148
integer width = 229
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
string text = "월별"
end type

event clicked;dw_3.dataobject = 'd_mpsfcwc_t2'
dw_4.dataobject = 'd_mpsfcwc_g2'
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)

rb_3.checked = true
rb_4.checked = false
dw_3.visible = true
dw_4.visible = false

pb_retrieve.triggerevent('clicked')
end event

type rb_3 from radiobutton within w_mpsfcwc_r
integer x = 1477
integer y = 88
integer width = 169
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
string text = "표"
boolean checked = true
end type

event clicked;dw_3.visible = true
dw_4.visible = false
end event

type rb_4 from radiobutton within w_mpsfcwc_r
integer x = 1477
integer y = 148
integer width = 297
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
string text = "그래프"
end type

event clicked;dw_3.visible = false
dw_4.visible = true
end event

type dw_3 from datawindow within w_mpsfcwc_r
integer x = 82
integer y = 404
integer width = 4489
integer height = 2124
integer taborder = 80
string dataobject = "d_mpsfcwc_t1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "wc_no"
		ls_col  = "작업장"
		ls_text = this.object.wc_no[row]
	case "item_name"
		ls_col  = "품명"
		ls_text = this.object.item_name[row]
	case "qa"
		ls_col  = "규격"
		ls_text = this.object.qa[row]
	case "calc"
		ls_col  = "TYPE"
		ls_text = string(this.object.calc[row])
	case "rem"
		ls_col  = "비고"
		ls_text = string(this.object.rem[row])
end choose

choose case ls_col
	case "작업장", "품목"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type dw_area from datawindow within w_mpsfcwc_r
integer x = 3150
integer y = 100
integer width = 521
integer height = 80
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type gb_4 from groupbox within w_mpsfcwc_r
integer x = 3109
integer y = 16
integer width = 603
integer height = 208
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type dw_4 from datawindow within w_mpsfcwc_r
integer x = 1047
integer y = 876
integer width = 2514
integer height = 1076
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_mpsfcwc_g1"
borderstyle borderstyle = stylelowered!
end type

type pb_1 from pb_print within w_mpsfcwc_r
boolean visible = false
integer x = 2386
integer y = 40
integer taborder = 50
boolean bringtotop = true
string picturename = "CrossTab!"
end type

type pb_2 from picturebutton within w_mpsfcwc_r
integer x = 3977
integer y = 60
integer width = 187
integer height = 144
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

dwxls = dw_3
if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			//	dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
end if
MessageBox("확인","엑셀파일 작업완료.")

end event

type st_12 from statictext within w_mpsfcwc_r
integer x = 101
integer y = 324
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

type ddlb_col from dropdownlistbox within w_mpsfcwc_r
integer x = 279
integer y = 308
integer width = 402
integer height = 532
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
string item[] = {"작업장","품목","규격","TYPE","비고"}
end type

type st_13 from statictext within w_mpsfcwc_r
integer x = 699
integer y = 324
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

type ddlb_2 from dropdownlistbox within w_mpsfcwc_r
integer x = 869
integer y = 308
integer width = 279
integer height = 512
integer taborder = 30
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

type sle_value from singlelineedit within w_mpsfcwc_r
integer x = 1175
integer y = 312
integer width = 658
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_mpsfcwc_r
integer x = 1847
integer y = 308
integer width = 238
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_3.setfilter(ls_temp)
	dw_3.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "작업장"
			ls_col  = "wc_no "
		case "품목"
			ls_col  = "item_name "
		case "규격"
			ls_col  = "qa "
		case "TYPE"
			ls_col  = "calc "
		case "비고"
			ls_col  = "rem "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_2.text) + "datetime('" + trim(sle_value.text) + "') "
		elseif ls_col = "calc " then
			ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
		end if
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

dw_3.setfilter(ls_temp)
dw_3.filter()

dw_3.scrolltorow(1)
dw_3.triggerevent(rowfocuschanged!)

end event

type cb_filteroff from commandbutton within w_mpsfcwc_r
integer x = 2085
integer y = 308
integer width = 238
integer height = 84
integer taborder = 50
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "품명"
sle_value.text  = ""

dw_3.setfilter("")
dw_3.filter()

end event

type cb_11 from commandbutton within w_mpsfcwc_r
integer x = 2322
integer y = 308
integer width = 238
integer height = 84
integer taborder = 60
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
String ls_col
choose case trim(ddlb_col.text)
	case "작업장"
		ls_col  = "wc_no "
	case "품목"
		ls_col  = "item_name "
	case "규격"
		ls_col  = "qa "
	case "TYPE"
		ls_col  = "calc "
	case "비고"
		ls_col  = "rem "
end choose		

dw_3.SetSort(ls_col + "A")
dw_3.sort()

end event

type cb_12 from commandbutton within w_mpsfcwc_r
integer x = 2560
integer y = 308
integer width = 238
integer height = 84
integer taborder = 70
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
String ls_col
choose case trim(ddlb_col.text)
	case "작업장"
		ls_col  = "wc_no "
	case "품목"
		ls_col  = "item_name "
	case "규격"
		ls_col  = "qa "
	case "TYPE"
		ls_col  = "calc "
	case "비고"
		ls_col  = "rem "
end choose		

dw_3.SetSort(ls_col + "D")
dw_3.sort()

end event

type gb_5 from groupbox within w_mpsfcwc_r
integer x = 50
integer y = 260
integer width = 4558
integer height = 2292
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

