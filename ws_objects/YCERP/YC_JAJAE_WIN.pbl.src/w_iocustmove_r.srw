$PBExportHeader$w_iocustmove_r.srw
$PBExportComments$거래처별코일이동현황(2001/05/07, 이인호)
forward 
global type w_iocustmove_r from w_inheritance
end type
type st_1 from statictext within w_iocustmove_r
end type
type em_1 from editmask within w_iocustmove_r
end type
type em_2 from editmask within w_iocustmove_r
end type
type ddlb_1 from dropdownlistbox within w_iocustmove_r
end type
type dw_3 from datawindow within w_iocustmove_r
end type
type st_2 from statictext within w_iocustmove_r
end type
type st_3 from statictext within w_iocustmove_r
end type
type st_13 from statictext within w_iocustmove_r
end type
type ddlb_fld from dropdownlistbox within w_iocustmove_r
end type
type st_14 from statictext within w_iocustmove_r
end type
type ddlb_op from dropdownlistbox within w_iocustmove_r
end type
type sle_value from singlelineedit within w_iocustmove_r
end type
type cb_10 from commandbutton within w_iocustmove_r
end type
type cb_14 from commandbutton within w_iocustmove_r
end type
type cb_15 from commandbutton within w_iocustmove_r
end type
type cb_16 from commandbutton within w_iocustmove_r
end type
type pb_1 from picturebutton within w_iocustmove_r
end type
end forward

global type w_iocustmove_r from w_inheritance
integer width = 4667
integer height = 2684
string title = "일별코일 이동현황(거래처별)(w_iocustmove_r)"
st_1 st_1
em_1 em_1
em_2 em_2
ddlb_1 ddlb_1
dw_3 dw_3
st_2 st_2
st_3 st_3
st_13 st_13
ddlb_fld ddlb_fld
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
pb_1 pb_1
end type
global w_iocustmove_r w_iocustmove_r

type variables
st_print i_print
date id_start, id_end
string is_flag = '%'
end variables

on w_iocustmove_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.ddlb_1=create ddlb_1
this.dw_3=create dw_3
this.st_2=create st_2
this.st_3=create st_3
this.st_13=create st_13
this.ddlb_fld=create ddlb_fld
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.ddlb_1
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_13
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.st_14
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_10
this.Control[iCurrent+14]=this.cb_14
this.Control[iCurrent+15]=this.cb_15
this.Control[iCurrent+16]=this.cb_16
this.Control[iCurrent+17]=this.pb_1
end on

on w_iocustmove_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.ddlb_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_13)
destroy(this.ddlb_fld)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.insertrow(0)
dw_2.visible = false
em_1.text = string(today(), "YYYY/MM/DD")
em_2.text = string(today(), "YYYY/MM/DD")
ddlb_1.visible = false
ddlb_1.text = '전체'
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
end event

event resize;call super::resize;//
gb_3.width  = this.width  - 123
gb_3.height = this.height - 396

dw_1.width  = this.width  - 196
dw_1.height = this.height - 564

end event

type pb_save from w_inheritance`pb_save within w_iocustmove_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_iocustmove_r
integer x = 78
integer y = 392
integer width = 4471
integer height = 2120
integer taborder = 30
string dataobject = "d_iocustmove_t"
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
	case "coilsfcday_sfc_date"
		ls_col  = "이동일자"
		ls_text = string(this.object.coilsfcday_sfc_date[row])		
end choose

choose case ls_col
	case "품명", "규격", "단위", "출고저장소"
		ddlb_op.text = "LIKE"
	case else
		ddlb_op.text = "="
end choose

ddlb_fld.text   = ls_col
sle_value.text  = ls_text

end event

event dw_1::itemchanged;call super::itemchanged;if row < 1 then return

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
	case "coilsfcday_sfc_date"
		ls_col  = "이동일자"
		ls_text = string(this.object.coilsfcday_sfc_date[row])		
end choose

choose case ls_col
	case "품명", "규격", "단위", "출고저장소"
		ddlb_op.text = "LIKE"
	case else
		ddlb_op.text = "="
end choose

ddlb_fld.text   = ls_col
sle_value.text  = ls_text

end event

type st_title from w_inheritance`st_title within w_iocustmove_r
integer x = 46
integer width = 1797
string text = "일별코일 이동현황(거래처별)"
end type

type st_tips from w_inheritance`st_tips within w_iocustmove_r
end type

type pb_compute from w_inheritance`pb_compute within w_iocustmove_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_iocustmove_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iocustmove_r
integer x = 4366
integer y = 60
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocustmove_r
integer x = 3973
integer y = 60
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

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 일별 코일작업현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_iocustmove_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_iocustmove_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_iocustmove_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iocustmove_r
integer x = 3781
integer y = 60
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end
string ls_loc

ld_start = date(em_1.text)
ld_end = date(em_2.text)
dw_3.accepttext()
ls_loc = trim(dw_3.object.supp_no[1])
if ls_loc = '' then 
	messagebox('확인', '거래처를 선택하십시오')
	return
end if
//ls_loc = '%'
dw_1.reset()
dw_1.SetTransObject(SQLCA)
dw_1.retrieve( ld_start, ld_end, ls_loc)
if dw_1.rowcount() < 1 then
	messagebox("에러","해당일에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iocustmove_r
integer x = 41
integer y = 252
integer width = 4544
integer height = 2288
integer taborder = 80
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iocustmove_r
integer x = 2382
integer y = 16
integer width = 1335
integer height = 208
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_iocustmove_r
integer x = 3749
integer y = 16
integer width = 837
integer height = 208
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_iocustmove_r
integer x = 1710
integer y = 12
integer width = 114
integer height = 80
integer taborder = 40
string dataobject = "d_iocustmove_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_1 from statictext within w_iocustmove_r
integer x = 3090
integer y = 120
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -20
integer weight = 700
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

type em_1 from editmask within w_iocustmove_r
integer x = 2674
integer y = 136
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

type em_2 from editmask within w_iocustmove_r
integer x = 3173
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

type ddlb_1 from dropdownlistbox within w_iocustmove_r
boolean visible = false
integer x = 1751
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
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","원코일","스리팅"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_flag ='%'
	CASE 2
		is_flag ='W'
	CASE 3
		is_flag ='S'
END CHOOSE



end event

type dw_3 from datawindow within w_iocustmove_r
integer x = 2674
integer y = 52
integer width = 1015
integer height = 80
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_whsupp_s"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_iocustmove_r
integer x = 2400
integer y = 72
integer width = 270
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_iocustmove_r
integer x = 2400
integer y = 148
integer width = 270
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "이동일자"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_13 from statictext within w_iocustmove_r
integer x = 101
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_iocustmove_r
integer x = 274
integer y = 300
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
string item[] = {"품명","규격","단중","수량","총중량","로트번호","출고저장소","이동일자"}
end type

type st_14 from statictext within w_iocustmove_r
integer x = 695
integer y = 316
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

type ddlb_op from dropdownlistbox within w_iocustmove_r
integer x = 864
integer y = 300
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

type sle_value from singlelineedit within w_iocustmove_r
integer x = 1157
integer y = 300
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

type cb_10 from commandbutton within w_iocustmove_r
integer x = 1870
integer y = 300
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

type cb_14 from commandbutton within w_iocustmove_r
integer x = 2021
integer y = 300
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

type cb_15 from commandbutton within w_iocustmove_r
integer x = 2171
integer y = 300
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

type cb_16 from commandbutton within w_iocustmove_r
integer x = 2318
integer y = 300
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

type pb_1 from picturebutton within w_iocustmove_r
event mousemove pbm_mousemove
integer x = 4160
integer y = 60
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

