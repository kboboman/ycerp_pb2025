$PBExportHeader$w_cbuilder_m.srw
$PBExportComments$현장설명참가 내역서(2004/07/09,이인호)
forward
global type w_cbuilder_m from w_inheritance
end type
type em_3 from editmask within w_cbuilder_m
end type
type st_2 from statictext within w_cbuilder_m
end type
type em_4 from editmask within w_cbuilder_m
end type
type dw_4 from datawindow within w_cbuilder_m
end type
type rb_top_n from radiobutton within w_cbuilder_m
end type
type rb_top_y from radiobutton within w_cbuilder_m
end type
type st_8 from statictext within w_cbuilder_m
end type
type ddlb_col from dropdownlistbox within w_cbuilder_m
end type
type st_9 from statictext within w_cbuilder_m
end type
type ddlb_2 from dropdownlistbox within w_cbuilder_m
end type
type sle_value from singlelineedit within w_cbuilder_m
end type
type cb_filteron from commandbutton within w_cbuilder_m
end type
type cb_filteroff from commandbutton within w_cbuilder_m
end type
type cb_7 from commandbutton within w_cbuilder_m
end type
type cb_4 from commandbutton within w_cbuilder_m
end type
end forward

global type w_cbuilder_m from w_inheritance
integer y = 112
integer width = 6075
integer height = 2888
string title = "공사입찰견적보고서(w_cbuilder_m)"
em_3 em_3
st_2 st_2
em_4 em_4
dw_4 dw_4
rb_top_n rb_top_n
rb_top_y rb_top_y
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_7 cb_7
cb_4 cb_4
end type
global w_cbuilder_m w_cbuilder_m

type variables
st_print i_print
long i_id
end variables

on w_cbuilder_m.create
int iCurrent
call super::create
this.em_3=create em_3
this.st_2=create st_2
this.em_4=create em_4
this.dw_4=create dw_4
this.rb_top_n=create rb_top_n
this.rb_top_y=create rb_top_y
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_7=create cb_7
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.em_4
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.rb_top_n
this.Control[iCurrent+6]=this.rb_top_y
this.Control[iCurrent+7]=this.st_8
this.Control[iCurrent+8]=this.ddlb_col
this.Control[iCurrent+9]=this.st_9
this.Control[iCurrent+10]=this.ddlb_2
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_filteron
this.Control[iCurrent+13]=this.cb_filteroff
this.Control[iCurrent+14]=this.cb_7
this.Control[iCurrent+15]=this.cb_4
end on

on w_cbuilder_m.destroy
call super::destroy
destroy(this.em_3)
destroy(this.st_2)
destroy(this.em_4)
destroy(this.dw_4)
destroy(this.rb_top_n)
destroy(this.rb_top_y)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_7)
destroy(this.cb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_2.visible = false
gb_3.visible = false
rb_top_n.visible = false
rb_top_y.visible = false

em_3.text = string(RelativeDate(today(), - 90), "YYYY/MM/DD")
em_4.text = string(today(), "YYYY/MM/DD")

if gf_permission('판매현장설명참가내역서조회조건', gs_userid) = 'Y' then
	gb_3.visible = true
	rb_top_n.visible = true
	rb_top_y.visible = true
else
	gb_3.visible = false
	rb_top_n.visible = false
	rb_top_y.visible = false

//	dw_1.object.saleman_opinion.visible = false
//	dw_1.object.team2_opinion.visible = false
//	dw_1.object.team4_opinion.visible = false
//	dw_1.object.team5_opinion.visible = false
end if

ddlb_col.text = "현장명"
ddlb_2.text   = "LIKE"

dw_1.insertrow(0)
dw_1.object.gubun[1] = '1'
dw_1.object.result[1] = '1'
end event

event resize;call super::resize;dw_4.height = this.height - 564
dw_1.height = this.height - 380

end event

type pb_save from w_inheritance`pb_save within w_cbuilder_m
integer x = 4197
integer taborder = 50
end type

event pb_save::clicked;call super::clicked;
STRING LS_DATE

SELECT CONVERT(CHAR(8),GETDATE(),112) 
INTO :LS_DATE
FROM DUAL;


DW_1.OBJECT.WRITE_DATE[1] = LS_DATE

wf_update1(dw_1, 'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_cbuilder_m
integer x = 2930
integer y = 236
integer width = 3470
integer height = 2508
integer taborder = 0
string dataobject = "d_cbuilder_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::clicked;call super::clicked;this.bringtotop = true
end event

type st_title from w_inheritance`st_title within w_cbuilder_m
integer x = 55
integer y = 40
integer width = 1591
string text = "공사 입찰&&견적 보고서"
end type

type st_tips from w_inheritance`st_tips within w_cbuilder_m
end type

type pb_compute from w_inheritance`pb_compute within w_cbuilder_m
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_cbuilder_m
boolean visible = false
integer x = 3205
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_cbuilder_m
integer x = 4571
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cbuilder_m
integer x = 4393
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
string ls_saleno

if dw_2.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 현설정보 현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=73'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_cbuilder_m
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_cbuilder_m
integer x = 3995
integer taborder = 110
end type

event pb_delete::clicked;call super::clicked;delete make_manager
where id = :i_id;

commit;
end event

type pb_insert from w_inheritance`pb_insert within w_cbuilder_m
integer x = 3803
integer taborder = 120
end type

event pb_insert::clicked;call super::clicked;dw_1.reset()

dw_1.insertrow(0)

dw_1.object.gubun[1] = '1'
dw_1.object.result[1] = '1'
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cbuilder_m
integer x = 3607
integer taborder = 10
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_flag,  ls_top_chk = 'Y'
string   ld_start, ld_end
long   ll_dw4_cnt

ld_start = LeftA(em_3.text,4)+MidA(em_3.text,6,2)+ RightA(em_3.text,2)
ld_end  = LeftA(em_4.text,4)+MidA(em_4.text,6,2)+ RightA(em_4.text,2)

dw_4.SetRedraw(false)
dw_4.reset()

dw_4.retrieve(ld_start, ld_end)

dw_4.SetRedraw(True)


dw_2.retrieve(ld_start, ld_end)

end event

type gb_3 from w_inheritance`gb_3 within w_cbuilder_m
integer x = 2587
integer y = 44
integer width = 718
integer height = 168
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "결재구분"
end type

type gb_2 from w_inheritance`gb_2 within w_cbuilder_m
integer x = 1664
integer y = 44
integer width = 905
integer height = 168
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회기간"
end type

type gb_1 from w_inheritance`gb_1 within w_cbuilder_m
integer x = 3543
integer y = 8
integer width = 1298
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_cbuilder_m
integer x = 1454
integer y = 60
integer width = 128
integer height = 100
integer taborder = 0
boolean enabled = false
string dataobject = "d_cbuilder_list2"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_3 from editmask within w_cbuilder_m
integer x = 1710
integer y = 108
integer width = 352
integer height = 80
integer taborder = 70
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

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_cbuilder_m
integer x = 2085
integer y = 100
integer width = 69
integer height = 64
boolean bringtotop = true
integer textsize = -18
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

type em_4 from editmask within w_cbuilder_m
integer x = 2171
integer y = 108
integer width = 352
integer height = 80
integer taborder = 70
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

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_4 from datawindow within w_cbuilder_m
integer x = 23
integer y = 420
integer width = 2898
integer height = 2324
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cbuilder_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row
long l_id

dw_1.accepttext()
ll_row = this.getrow()
if ll_row < 1 then
	return
end if

l_id = this.object.id[ll_row]
This.SelectRow(0, False)
This.ScrollToRow(ll_row)
This.SelectRow(ll_row, True)

dw_1.retrieve( l_id )


end event

event clicked;long l_id

This.accepttext()
if row < 1 then
	return
end if

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

i_id = this.object.id[row]

dw_1.retrieve( i_id )

return 1

end event

type rb_top_n from radiobutton within w_cbuilder_m
integer x = 2610
integer y = 120
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "미결재"
end type

type rb_top_y from radiobutton within w_cbuilder_m
integer x = 2930
integer y = 120
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "결재완료"
boolean checked = true
end type

type st_8 from statictext within w_cbuilder_m
integer x = 41
integer y = 264
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

type ddlb_col from dropdownlistbox within w_cbuilder_m
integer x = 224
integer y = 244
integer width = 402
integer height = 532
integer taborder = 150
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
string item[] = {"건설사","현장명","현설일자","입찰예정일시"}
end type

type st_9 from statictext within w_cbuilder_m
integer x = 640
integer y = 264
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

type ddlb_2 from dropdownlistbox within w_cbuilder_m
integer x = 823
integer y = 244
integer width = 279
integer height = 512
integer taborder = 160
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

type sle_value from singlelineedit within w_cbuilder_m
integer x = 1115
integer y = 248
integer width = 498
integer height = 76
integer taborder = 320
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cbuilder_m
integer x = 37
integer y = 340
integer width = 402
integer height = 68
integer taborder = 150
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
if dw_4.FilteredCount() > 0 THEN
	dw_4.setfilter(ls_temp)
	dw_4.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "건설사"
			ls_col = "cust_no "
		case "현장명"
			ls_col = "scne_no "
		case "현설일자"
			ls_col = "briefing_date "
		case "입찰예정일시"
			ls_col = "tender_date "
		case "현설번호"
			ls_col = "sale_no "
	end choose		
	
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "briefing_date ", "tender_date"
				ls_column = ls_col + trim(ddlb_2.text) + " #"  + trim(sle_value.text) + "# "
			case else
				ls_column = ls_col + trim(ddlb_2.text) + " '"  + trim(sle_value.text) + "' "
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

dw_4.setfilter(ls_temp)
dw_4.filter()

dw_4.scrolltorow(1)
dw_4.triggerevent(rowfocuschanged!)

end event

type cb_filteroff from commandbutton within w_cbuilder_m
integer x = 439
integer y = 340
integer width = 402
integer height = 68
integer taborder = 160
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
ddlb_col.text   = "현장명"
sle_value.text  = ""

dw_4.setfilter("")
dw_4.filter()

end event

type cb_7 from commandbutton within w_cbuilder_m
integer x = 841
integer y = 340
integer width = 402
integer height = 68
integer taborder = 150
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
	case "건설사"
		ls_col = "cust_no "
	case "현장명"
		ls_col = "scne_no "
	case "현설일자"
		ls_col = "briefing_date "
	case "입찰예정일시"
		ls_col = "tender_date "
	case "현설번호"
		ls_col = "sale_no "
end choose		

dw_4.SetSort(ls_col + "A")
dw_4.sort()

end event

type cb_4 from commandbutton within w_cbuilder_m
integer x = 1243
integer y = 340
integer width = 402
integer height = 68
integer taborder = 160
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
	case "건설사"
		ls_col = "cust_no "
	case "현장명"
		ls_col = "scne_no "
	case "현설일자"
		ls_col = "briefing_date "
	case "입찰예정일시"
		ls_col = "tender_date "
	case "현설번호"
		ls_col = "sale_no "
end choose		

dw_4.SetSort(ls_col + "D")
dw_4.sort()

end event

