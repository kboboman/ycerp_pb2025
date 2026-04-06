$PBExportHeader$w_iocoilmove_r.srw
$PBExportComments$일별코일이동현황(2001/05/23, 이인호)
forward 
global type w_iocoilmove_r from w_inheritance
end type
type em_1 from editmask within w_iocoilmove_r
end type
type em_2 from editmask within w_iocoilmove_r
end type
type dw_3 from datawindow within w_iocoilmove_r
end type
type rb_1 from radiobutton within w_iocoilmove_r
end type
type rb_2 from radiobutton within w_iocoilmove_r
end type
type pb_1 from picturebutton within w_iocoilmove_r
end type
type st_13 from statictext within w_iocoilmove_r
end type
type ddlb_fld from dropdownlistbox within w_iocoilmove_r
end type
type st_14 from statictext within w_iocoilmove_r
end type
type ddlb_op from dropdownlistbox within w_iocoilmove_r
end type
type sle_value from singlelineedit within w_iocoilmove_r
end type
type cb_10 from commandbutton within w_iocoilmove_r
end type
type cb_14 from commandbutton within w_iocoilmove_r
end type
type cb_15 from commandbutton within w_iocoilmove_r
end type
type cb_16 from commandbutton within w_iocoilmove_r
end type
type st_2 from statictext within w_iocoilmove_r
end type
type st_3 from statictext within w_iocoilmove_r
end type
end forward

global type w_iocoilmove_r from w_inheritance
integer width = 4608
integer height = 2700
string title = "일별코일 이동 현황(w_iocoilmove_r)"
em_1 em_1
em_2 em_2
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
pb_1 pb_1
st_13 st_13
ddlb_fld ddlb_fld
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
st_2 st_2
st_3 st_3
end type
global w_iocoilmove_r w_iocoilmove_r

type variables
st_print i_print
date id_start, id_end
datawindowchild idwc_loc
end variables

on w_iocoilmove_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.pb_1=create pb_1
this.st_13=create st_13
this.ddlb_fld=create ddlb_fld
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.st_2=create st_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.st_13
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.st_14
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_10
this.Control[iCurrent+13]=this.cb_14
this.Control[iCurrent+14]=this.cb_15
this.Control[iCurrent+15]=this.cb_16
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.st_3
end on

on w_iocoilmove_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.pb_1)
destroy(this.st_13)
destroy(this.ddlb_fld)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.st_2)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.insertrow(0)
dw_2.visible = false
em_1.text = string(today(), "YYYY/MM/DD")
em_2.text = string(today(), "YYYY/MM/DD")

dw_3.SetTransObject(SQLCA)
dw_3.insertrow(0)
dw_3.getchild("loc_no", idwc_loc)
idwc_loc.settransobject(SQLCA)

idwc_loc.insertrow(1)
idwc_loc.setitem(1, "loc_no", "%")
idwc_loc.setitem(1, "loc_name", "전체")


end event

event resize;call super::resize;//
gb_3.width  = this.width  - 133
gb_3.height = this.height - 400

dw_1.width  = this.width  - 197
dw_1.height = this.height - 576

end event

type pb_save from w_inheritance`pb_save within w_iocoilmove_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_iocoilmove_r
integer x = 82
integer y = 404
integer width = 4411
integer height = 2124
integer taborder = 30
string title = "d_iocoilmove_r2"
string dataobject = "d_iocoilmove_t"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "groupitem_item_name"
		ls_col  = "품명"
		ls_text = string(this.object.groupitem_item_name[row])
	case "coilmst_qa"
		ls_col  = "규격"
		ls_text = string(this.object.coilmst_qa[row])
	case "qty"
		ls_col  = "단중"
		ls_text = string(this.object.qty[row])
	case "coilmst_cnt"
		ls_col  = "수량"
		ls_text = string(this.object.coilmst_cnt[row])
	case "compute_2"
		ls_col  = "총중량"
		ls_text = string(this.object.compute_2[row])
	case "coil_no"
		ls_col  = "로트번호"
		ls_text = string(this.object.coil_no[row])
	case "wc_name"
		ls_col  = "출고저장소"
		ls_text = string(this.object.wc_name[row])
	case "supp_name"
		ls_col  = "입고저장소"
		ls_text = string(this.object.supp_name[row])
	case "coilsfcday_sfc_date"
		ls_col  = "이동일자"
		ls_text = string(this.object.coilsfcday_sfc_date[row])		
end choose

choose case ls_col
	case "품명", "규격", "단위", "출고저장소", "입고저장소"
		ddlb_op.text = "LIKE"
	case else
		ddlb_op.text = "="
end choose

ddlb_fld.text   = ls_col
sle_value.text  = ls_text

end event

type st_title from w_inheritance`st_title within w_iocoilmove_r
integer x = 50
integer width = 1298
string text = "일별코일 이동현황"
end type

type st_tips from w_inheritance`st_tips within w_iocoilmove_r
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilmove_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_iocoilmove_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iocoilmove_r
integer x = 4306
integer y = 64
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilmove_r
integer x = 3913
integer y = 64
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
w_repsuper   w_print
string ls_sql, ls_where, ls_source

IF dw_1.getrow() < 1 THEN RETURN

if rb_1.checked = true then
	dw_2.dataobject = 'd_iocoilmove_r'
else
	dw_2.dataobject = 'd_iocoilmove_r2'
end if
dw_2.SetTransObject(SQLCA)
dw_1.sharedata(dw_2)

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 일별코일 이동현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_iocoilmove_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_iocoilmove_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_iocoilmove_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilmove_r
integer x = 3721
integer y = 64
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date   ld_start, ld_end
string ls_loc

ld_start = date(em_1.text)
ld_end   = date(em_2.text)
ls_loc   = trim(dw_3.object.loc_no[1])

if isnull(ls_loc) or ls_loc = "" then
	messagebox('오류','저장소를 입력하십시요.',exclamation!)
	return
end if

dw_1.reset()
dw_1.SetTransObject(SQLCA)
dw_1.retrieve( ld_start, ld_end, ls_loc)
if dw_1.rowcount() < 1 then
	messagebox("에러","해당일에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iocoilmove_r
integer x = 50
integer y = 256
integer width = 4475
integer height = 2300
integer taborder = 80
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilmove_r
integer x = 2286
integer y = 16
integer width = 1381
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilmove_r
integer x = 3685
integer y = 16
integer width = 841
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_iocoilmove_r
integer x = 1426
integer y = 76
integer width = 187
integer height = 112
integer taborder = 40
string dataobject = "d_iocoilmove_r2"
boolean vscrollbar = false
boolean resizable = true
boolean livescroll = false
end type

type em_1 from editmask within w_iocoilmove_r
integer x = 2793
integer y = 140
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

type em_2 from editmask within w_iocoilmove_r
integer x = 3223
integer y = 140
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

type dw_3 from datawindow within w_iocoilmove_r
integer x = 2793
integer y = 52
integer width = 841
integer height = 84
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type rb_1 from radiobutton within w_iocoilmove_r
integer x = 2331
integer y = 72
integer width = 288
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
string text = "리스트"
boolean checked = true
end type

type rb_2 from radiobutton within w_iocoilmove_r
integer x = 2331
integer y = 144
integer width = 288
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
string text = "양식"
end type

type pb_1 from picturebutton within w_iocoilmove_r
event mousemove pbm_mousemove
integer x = 4105
integer y = 64
integer width = 187
integer height = 144
integer taborder = 130
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

type st_13 from statictext within w_iocoilmove_r
integer x = 119
integer y = 328
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

type ddlb_fld from dropdownlistbox within w_iocoilmove_r
integer x = 293
integer y = 312
integer width = 402
integer height = 532
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"품명","규격","단중","수량","총중량","로트번호","출고저장소","입고저장소"}
end type

type st_14 from statictext within w_iocoilmove_r
integer x = 713
integer y = 328
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

type ddlb_op from dropdownlistbox within w_iocoilmove_r
integer x = 882
integer y = 312
integer width = 279
integer height = 512
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
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

type sle_value from singlelineedit within w_iocoilmove_r
integer x = 1175
integer y = 312
integer width = 704
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_10 from commandbutton within w_iocoilmove_r
integer x = 1888
integer y = 312
integer width = 146
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
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
			ls_col  = "groupitem_item_name"
		case "규격"
			ls_col  = "coilmst_qa"
		case "단중"
			ls_col  = "qty"
		case "수량"
			ls_col  = "coilmst_cnt"
		case "총중량"
			ls_col  = "compute_2"
		case "로트번호"
			ls_col  = "coil_no"
		case "출고저장소"
			ls_col  = "wc_name"
		case "입고저장소"
			ls_col  = "supp_name"
		case "이동일자"
			ls_col  = "coilsfcday_sfc_date"
	end choose
	
	ls_col = ls_col + " "
	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "coilsfcday_sfc_date"
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "qty", "coilmst_cnt", "compute_2"
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

type cb_14 from commandbutton within w_iocoilmove_r
integer x = 2039
integer y = 312
integer width = 146
integer height = 76
integer taborder = 170
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
ddlb_fld.text  = "물품명"
ddlb_op.text   = "LIKE"
sle_value.text = ""

dw_1.setfilter("")
dw_1.filter()

pb_retrieve.triggerevent(clicked!)
dw_1.scrolltorow(1)

end event

type cb_15 from commandbutton within w_iocoilmove_r
integer x = 2190
integer y = 312
integer width = 146
integer height = 76
integer taborder = 180
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
string ls_col
choose case trim(ddlb_fld.text)
	case "품명"
		ls_col  = "groupitem_item_name"
	case "규격"
		ls_col  = "coilmst_qa"
	case "단중"
		ls_col  = "qty"
	case "수량"
		ls_col  = "coilmst_cnt"
	case "총중량"
		ls_col  = "compute_2"
	case "로트번호"
		ls_col  = "coil_no"
	case "출고저장소"
		ls_col  = "wc_name"
	case "입고저장소"
		ls_col  = "supp_name"
	case "이동일자"
		ls_col  = "coilsfcday_sfc_date"
end choose

dw_1.SetSort(ls_col + " A")
dw_1.sort()

end event

type cb_16 from commandbutton within w_iocoilmove_r
integer x = 2336
integer y = 312
integer width = 146
integer height = 76
integer taborder = 190
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
string ls_col
choose case trim(ddlb_fld.text)
	case "품명"
		ls_col  = "groupitem_item_name"
	case "규격"
		ls_col  = "coilmst_qa"
	case "단중"
		ls_col  = "qty"
	case "수량"
		ls_col  = "coilmst_cnt"
	case "총중량"
		ls_col  = "compute_2"
	case "로트번호"
		ls_col  = "coil_no"
	case "출고저장소"
		ls_col  = "wc_name"
	case "입고저장소"
		ls_col  = "supp_name"
	case "이동일자"
		ls_col  = "coilsfcday_sfc_date"
end choose

dw_1.SetSort(ls_col + " D")
dw_1.sort()

end event

type st_2 from statictext within w_iocoilmove_r
integer x = 2642
integer y = 56
integer width = 151
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
string text = "입고"
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_iocoilmove_r
integer x = 2642
integer y = 140
integer width = 151
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
string text = "일자"
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

