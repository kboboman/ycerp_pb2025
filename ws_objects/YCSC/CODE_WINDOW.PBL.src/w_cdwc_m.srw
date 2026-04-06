$PBExportHeader$w_cdwc_m.srw
$PBExportComments$작업장관리(98/02/03, 성삼지)
forward
global type w_cdwc_m from w_inheritance
end type
type dw_3 from datawindow within w_cdwc_m
end type
type st_1 from statictext within w_cdwc_m
end type
type st_2 from statictext within w_cdwc_m
end type
type rb_1 from radiobutton within w_cdwc_m
end type
type rb_2 from radiobutton within w_cdwc_m
end type
type rb_3 from radiobutton within w_cdwc_m
end type
type st_8 from statictext within w_cdwc_m
end type
type ddlb_col from dropdownlistbox within w_cdwc_m
end type
type st_9 from statictext within w_cdwc_m
end type
type ddlb_2 from dropdownlistbox within w_cdwc_m
end type
type sle_value from singlelineedit within w_cdwc_m
end type
type cb_filteron from commandbutton within w_cdwc_m
end type
type cb_filteroff from commandbutton within w_cdwc_m
end type
type cb_11 from commandbutton within w_cdwc_m
end type
type cb_12 from commandbutton within w_cdwc_m
end type
end forward

global type w_cdwc_m from w_inheritance
integer width = 4699
integer height = 2940
string title = "작업장관리(w_cdwc_m)"
dw_3 dw_3
st_1 st_1
st_2 st_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
end type
global w_cdwc_m w_cdwc_m

type variables
st_print  i_print
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)
//st_2.visible = false
pb_retrieve.postevent( clicked! )

end event

on w_cdwc_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_1=create st_1
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.st_8
this.Control[iCurrent+8]=this.ddlb_col
this.Control[iCurrent+9]=this.st_9
this.Control[iCurrent+10]=this.ddlb_2
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_filteron
this.Control[iCurrent+13]=this.cb_filteroff
this.Control[iCurrent+14]=this.cb_11
this.Control[iCurrent+15]=this.cb_12
end on

on w_cdwc_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
end on

event resize;call super::resize;//

gb_2.width  = this.width  - 92
gb_2.height = this.height - 432

dw_1.width  = this.width  - 133
dw_1.height = this.height - 624

ddlb_2.text     = "LIKE"
ddlb_col.text   = "작업장명"
sle_value.text  = ""

end event

type pb_save from w_inheritance`pb_save within w_cdwc_m
integer x = 4206
integer y = 68
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_update1(dw_1,"Y")
// 작업지시서 출력시.
//	if ls_fact = '1'  then
//		dw_1.dataobject = 'd_mpsfcrel_r'// 생산수량 입력 불가능.
//	else
////		dw_1.dataobject = 'd_mpsfcrel_r2'  // 생산수량 입력 가능.
//		dw_1.dataobject = 'd_mpsfcrel_r3'  // 생산수량 입력 가능.
//	end if
//end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdwc_m
integer x = 27
integer y = 500
integer width = 4567
integer height = 2316
string dataobject = "d_cdwc_m"
end type

event dw_1::clicked;call super::clicked;string ls_col, ls_text

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)
This.ScrollToRow( row )


choose case dwo.name
	case "work_no"
		ls_col  = "번호"
		ls_text = string(this.object.work_no[row])
	case "work_name"
		ls_col  = "작업장명"
		ls_text = string(this.object.work_name[row])
	case "work_type"
		ls_col  = "유형"
		ls_text = this.object.work_type[row]
	case "work_manager"
		ls_col  = "관리자"
		ls_text = this.object.work_manager[row]
	case "capacity"
		ls_col  = "능력(분)"
		ls_text = string(this.object.capacity[row])
	case "work_pos"
		ls_col  = "작업장위치"
		ls_text = this.object.work_pos[row]
	case "work_per"
		ls_col  = "기본인원"
		ls_text = string(this.object.work_per[row])
	case "def_loc"
		ls_col  = "기본입고저장소"
		ls_text = this.object.def_loc[row]
	case "fact_wc"
		ls_col  = "공장구분"
		ls_text = this.object.fact_wc[row]
	case "rout_auto"
		ls_col  = "공정자동수불"
		ls_text = this.object.rout_auto[row]
	case "area_no"
		ls_col  = "사업장"
		ls_text = this.object.area_no[row]
end choose

choose case ls_col
	case "능력(분)", "기본인원"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type dw_2 from w_inheritance`dw_2 within w_cdwc_m
boolean visible = false
integer x = 1664
integer y = 60
integer width = 480
integer height = 148
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type st_title from w_inheritance`st_title within w_cdwc_m
integer x = 41
integer width = 987
string text = "작업장 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdwc_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdwc_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdwc_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdwc_m
integer x = 4398
integer y = 68
integer width = 183
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdwc_m
integer x = 4014
integer y = 68
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_3.retrieve()
i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 작업장 내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=120'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdwc_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdwc_m
integer x = 3822
integer y = 68
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;INTEGER li_count
string ls_work_no

ls_work_no = dw_1.getitemstring(dw_1.getrow(), "work_no")
SELECT COUNT(*) INTO :li_count FROM rout
   WHERE wc_no = :ls_work_no;
IF li_count > 0 THEN
	Messagebox("에러", "물품별 작업장에서 사용하고 있기~r~n "  + &
	           "때문에 삭제할수 없습니다.", exclamation!, ok!)
ELSE
   dw_1.deleterow(0)
END IF


end event

type pb_insert from w_inheritance`pb_insert within w_cdwc_m
integer x = 3630
integer y = 68
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;long ll_row
ll_row = dw_1.insertrow(0)
dw_1.ScrollToRow(ll_row)
dw_1.setcolumn(1)  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdwc_m
integer x = 3424
integer y = 68
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdwc_m
integer x = 1248
integer y = 60
integer width = 951
integer height = 156
integer taborder = 70
integer textsize = -10
long textcolor = 0
string text = "작업장"
end type

type gb_2 from w_inheritance`gb_2 within w_cdwc_m
integer x = 9
integer y = 324
integer width = 4608
integer height = 2508
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_cdwc_m
integer x = 3378
integer y = 24
integer width = 1230
end type

type dw_3 from datawindow within w_cdwc_m
boolean visible = false
integer x = 1714
integer y = 44
integer width = 146
integer height = 144
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_cdwc_r"
boolean livescroll = true
end type

type st_1 from statictext within w_cdwc_m
integer x = 32
integer y = 284
integer width = 2313
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "유형이 ~"외주~"인것은 생산계획작성시에 외주(가공/발주)대상 항목으로 넘어 갑니다."
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdwc_m
integer x = 2382
integer y = 280
integer width = 2235
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "공장구분 1 이면 작업지시서에 생산수량수기 기록란이 없는 폼이 출력됨"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_cdwc_m
integer x = 1317
integer y = 124
integer width = 265
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;dw_1.setfilter('')
dw_1.filter()
end event

type rb_2 from radiobutton within w_cdwc_m
integer x = 1605
integer y = 124
integer width = 265
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사내"
end type

event clicked;dw_1.setfilter('work_type = "D"')
dw_1.filter()
end event

type rb_3 from radiobutton within w_cdwc_m
integer x = 1893
integer y = 124
integer width = 265
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "외주"
end type

event clicked;dw_1.setfilter('work_type = "S"')
dw_1.filter()
end event

type st_8 from statictext within w_cdwc_m
integer x = 50
integer y = 412
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

type ddlb_col from dropdownlistbox within w_cdwc_m
integer x = 233
integer y = 392
integer width = 402
integer height = 532
integer taborder = 40
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
string item[] = {"번호","작업장명","유형","관리자","능력(분)","작업장위치","기본인원","기본입고저장소","공장구분","공정자동수불","사업장"}
end type

type st_9 from statictext within w_cdwc_m
integer x = 649
integer y = 412
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

type ddlb_2 from dropdownlistbox within w_cdwc_m
integer x = 832
integer y = 392
integer width = 279
integer height = 512
integer taborder = 50
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

type sle_value from singlelineedit within w_cdwc_m
integer x = 1125
integer y = 396
integer width = 498
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdwc_m
integer x = 1637
integer y = 396
integer width = 270
integer height = 76
integer taborder = 70
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
		case "번호"
			ls_col = "work_no "
		case "작업장명"
			ls_col = "work_name "
		case "유형"
			ls_col = "work_type "
		case "관리자"
			ls_col = "work_manager "
		case "능력(분)"
			ls_col = "capacity "
		case "작업장위치"
			ls_col = "work_pos "
		case "기본인원"
			ls_col = "work_per "
		case "기본입고저장소"
			ls_col = "def_loc "
		case "공장구분"
			ls_col = "fact_wc "
		case "공정자동수불"
			ls_col = "rout_auto "
		case "사업장"
			ls_col = "area_no "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_2.text) + " #" + trim(sle_value.text) + "# "
		elseif ls_col = "capacity " or ls_col = "work_per " then
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

type cb_filteroff from commandbutton within w_cdwc_m
integer x = 1911
integer y = 396
integer width = 270
integer height = 76
integer taborder = 80
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
ddlb_col.text   = "작업장명"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

end event

type cb_11 from commandbutton within w_cdwc_m
integer x = 2185
integer y = 396
integer width = 270
integer height = 76
integer taborder = 90
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
	case "번호"
		ls_col = "work_no "
	case "작업장명"
		ls_col = "work_name "
	case "유형"
		ls_col = "work_type "
	case "관리자"
		ls_col = "work_manager "
	case "능력(분)"
		ls_col = "capacity "
	case "작업장위치"
		ls_col = "work_pos "
	case "기본인원"
		ls_col = "work_per "
	case "기본입고저장소"
		ls_col = "def_loc "
	case "공장구분"
		ls_col = "fact_wc "
	case "공정자동수불"
		ls_col = "rout_auto "
	case "사업장"
		ls_col = "area_no "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_12 from commandbutton within w_cdwc_m
integer x = 2459
integer y = 396
integer width = 270
integer height = 76
integer taborder = 100
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
	case "번호"
		ls_col = "work_no "
	case "작업장명"
		ls_col = "work_name "
	case "유형"
		ls_col = "work_type "
	case "관리자"
		ls_col = "work_manager "
	case "능력(분)"
		ls_col = "capacity "
	case "작업장위치"
		ls_col = "work_pos "
	case "기본인원"
		ls_col = "work_per "
	case "기본입고저장소"
		ls_col = "def_loc "
	case "공장구분"
		ls_col = "fact_wc "
	case "공정자동수불"
		ls_col = "rout_auto "
	case "사업장"
		ls_col = "area_no "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

