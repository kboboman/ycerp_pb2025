$PBExportHeader$w_mpsfcmon_r.srw
$PBExportComments$생산월보 조회(1998/05/08, 이인호)
forward
global type w_mpsfcmon_r from w_inheritance
end type
type em_1 from editmask within w_mpsfcmon_r
end type
type em_2 from editmask within w_mpsfcmon_r
end type
type st_1 from statictext within w_mpsfcmon_r
end type
type rb_1 from radiobutton within w_mpsfcmon_r
end type
type rb_2 from radiobutton within w_mpsfcmon_r
end type
type dw_3 from datawindow within w_mpsfcmon_r
end type
type dw_area from datawindow within w_mpsfcmon_r
end type
type pb_2 from picturebutton within w_mpsfcmon_r
end type
type st_2 from statictext within w_mpsfcmon_r
end type
type st_12 from statictext within w_mpsfcmon_r
end type
type ddlb_col from dropdownlistbox within w_mpsfcmon_r
end type
type st_13 from statictext within w_mpsfcmon_r
end type
type ddlb_2 from dropdownlistbox within w_mpsfcmon_r
end type
type sle_value from singlelineedit within w_mpsfcmon_r
end type
type cb_filteron from commandbutton within w_mpsfcmon_r
end type
type cb_filteroff from commandbutton within w_mpsfcmon_r
end type
type cb_11 from commandbutton within w_mpsfcmon_r
end type
type cb_12 from commandbutton within w_mpsfcmon_r
end type
type gb_15 from groupbox within w_mpsfcmon_r
end type
type gb_4 from groupbox within w_mpsfcmon_r
end type
end forward

global type w_mpsfcmon_r from w_inheritance
integer width = 4457
integer height = 2484
string title = "생산월보 조회(w_mpsfcmon_r)"
em_1 em_1
em_2 em_2
st_1 st_1
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_area dw_area
pb_2 pb_2
st_2 st_2
st_12 st_12
ddlb_col ddlb_col
st_13 st_13
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
gb_15 gb_15
gb_4 gb_4
end type
global w_mpsfcmon_r w_mpsfcmon_r

type variables
st_print i_print
int ii_year, ii_month
string is_wcno
datawindowchild idwc_wc
end variables

on w_mpsfcmon_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_area=create dw_area
this.pb_2=create pb_2
this.st_2=create st_2
this.st_12=create st_12
this.ddlb_col=create ddlb_col
this.st_13=create st_13
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
this.gb_15=create gb_15
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.pb_2
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_12
this.Control[iCurrent+11]=this.ddlb_col
this.Control[iCurrent+12]=this.st_13
this.Control[iCurrent+13]=this.ddlb_2
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_filteron
this.Control[iCurrent+16]=this.cb_filteroff
this.Control[iCurrent+17]=this.cb_11
this.Control[iCurrent+18]=this.cb_12
this.Control[iCurrent+19]=this.gb_15
this.Control[iCurrent+20]=this.gb_4
end on

on w_mpsfcmon_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_area)
destroy(this.pb_2)
destroy(this.st_2)
destroy(this.st_12)
destroy(this.ddlb_col)
destroy(this.st_13)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.gb_15)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.insertrow(0)
dw_2.visible = false
dw_3.SetTransObject(SQLCA)
em_1.text = string(today(), "YYYY/MM")
em_2.text = string(today(), "YYYY/MM")

dw_1.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)
// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천
end event

type pb_save from w_inheritance`pb_save within w_mpsfcmon_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcmon_r
integer x = 2574
integer y = 56
integer width = 869
integer height = 84
integer taborder = 30
string dataobject = "d_mpwcno_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;long ll_row

this.accepttext()
is_wcno = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_name')) + "%"


end event

type dw_2 from w_inheritance`dw_2 within w_mpsfcmon_r
integer x = 1019
integer y = 28
integer width = 133
integer height = 92
integer taborder = 40
string dataobject = "d_mpsfcmon_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpsfcmon_r
integer x = 41
integer y = 68
integer width = 1056
integer height = 148
string text = "생산월보 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcmon_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcmon_r
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcmon_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcmon_r
integer x = 4137
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcmon_r
integer x = 3931
integer y = 64
integer taborder = 90
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_3.getrow() <= 0 THEN
   RETURN
END IF
if rb_1.checked = true then
   dw_2.dataobject = 'd_mpsfcmon_r'
else
   dw_2.dataobject = 'd_mpsfcmon_r2'
end if
dw_2.SetTransObject(SQLCA)

dw_3.sharedata(dw_2)

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 생산월보를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcmon_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcmon_r
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcmon_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcmon_r
integer x = 3547
integer y = 64
integer taborder = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end

ld_start = date(em_1.text + "/01")
ld_end = RelativeDate(date(string(RelativeDate( date(em_2.text + "/01"), 31), "yyyy/mm") + "/01"), -1)

dw_3.reset()
dw_3.retrieve(is_wcno, ld_start, ld_end, dw_area.object.area[1])
if dw_3.rowcount() < 1 then
	messagebox("에러","해당월에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcmon_r
boolean visible = false
integer x = 2779
integer y = 40
integer width = 160
integer height = 184
integer taborder = 110
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcmon_r
integer x = 2258
integer y = 20
integer width = 1234
integer height = 208
integer taborder = 0
integer textsize = -8
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcmon_r
integer x = 3520
integer y = 20
integer width = 837
integer height = 208
integer taborder = 0
end type

type em_1 from editmask within w_mpsfcmon_r
integer x = 2789
integer y = 140
integer width = 293
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type em_2 from editmask within w_mpsfcmon_r
integer x = 3136
integer y = 140
integer width = 293
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type st_1 from statictext within w_mpsfcmon_r
integer x = 3086
integer y = 128
integer width = 46
integer height = 76
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

type rb_1 from radiobutton within w_mpsfcmon_r
integer x = 2299
integer y = 64
integer width = 238
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
string text = "합계"
boolean checked = true
end type

event clicked;//
dw_3.dataobject = 'd_mpsfcmon_t'
dw_3.SetTransObject(SQLCA)
pb_retrieve.triggerevent('clicked')
end event

type rb_2 from radiobutton within w_mpsfcmon_r
integer x = 2299
integer y = 136
integer width = 238
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
string text = "월별"
end type

event clicked;//
dw_3.dataobject = 'd_mpsfcmon_t2'
dw_3.SetTransObject(SQLCA)
pb_retrieve.triggerevent('clicked')

end event

type dw_3 from datawindow within w_mpsfcmon_r
integer x = 87
integer y = 388
integer width = 4229
integer height = 1916
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_mpsfcmon_t"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_area from datawindow within w_mpsfcmon_r
integer x = 1678
integer y = 100
integer width = 526
integer height = 80
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type pb_2 from picturebutton within w_mpsfcmon_r
integer x = 3739
integer y = 64
integer width = 187
integer height = 144
integer taborder = 20
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

type st_2 from statictext within w_mpsfcmon_r
integer x = 2578
integer y = 140
integer width = 210
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
string text = "기간 :"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_12 from statictext within w_mpsfcmon_r
integer x = 82
integer y = 312
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

type ddlb_col from dropdownlistbox within w_mpsfcmon_r
integer x = 261
integer y = 296
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

type st_13 from statictext within w_mpsfcmon_r
integer x = 681
integer y = 312
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

type ddlb_2 from dropdownlistbox within w_mpsfcmon_r
integer x = 850
integer y = 296
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

type sle_value from singlelineedit within w_mpsfcmon_r
integer x = 1157
integer y = 300
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

type cb_filteron from commandbutton within w_mpsfcmon_r
integer x = 1829
integer y = 296
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
	dw_1.setfilter(ls_temp)
	dw_1.filter()
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

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)
dw_1.triggerevent(rowfocuschanged!)

end event

type cb_filteroff from commandbutton within w_mpsfcmon_r
integer x = 2066
integer y = 296
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
ddlb_col.text   = "품목"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

end event

type cb_11 from commandbutton within w_mpsfcmon_r
integer x = 2304
integer y = 296
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

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_12 from commandbutton within w_mpsfcmon_r
integer x = 2542
integer y = 296
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

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

type gb_15 from groupbox within w_mpsfcmon_r
integer x = 1646
integer y = 20
integer width = 594
integer height = 208
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type gb_4 from groupbox within w_mpsfcmon_r
integer x = 46
integer y = 252
integer width = 4315
integer height = 2088
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

