$PBExportHeader$w_ippurorder_r.srw
$PBExportComments$거래처별발주내역(1998/10/19,곽용덕)
forward
global type w_ippurorder_r from w_inheritance
end type
type gb_4 from groupbox within w_ippurorder_r
end type
type dw_3 from datawindow within w_ippurorder_r
end type
type dw_area from datawindow within w_ippurorder_r
end type
type st_2 from statictext within w_ippurorder_r
end type
type pb_1 from picturebutton within w_ippurorder_r
end type
type st_5 from statictext within w_ippurorder_r
end type
type ddlb_fld from dropdownlistbox within w_ippurorder_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ippurorder_r
end type
type st_6 from statictext within w_ippurorder_r
end type
type ddlb_op from dropdownlistbox within w_ippurorder_r
end type
type sle_value from singlelineedit within w_ippurorder_r
end type
type cb_1 from commandbutton within w_ippurorder_r
end type
type cb_2 from commandbutton within w_ippurorder_r
end type
type cb_3 from commandbutton within w_ippurorder_r
end type
type cb_5 from commandbutton within w_ippurorder_r
end type
end forward

global type w_ippurorder_r from w_inheritance
integer width = 4695
integer height = 2896
string title = "거래처별 발주내역(w_ippurorder_r)"
gb_4 gb_4
dw_3 dw_3
dw_area dw_area
st_2 st_2
pb_1 pb_1
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
end type
global w_ippurorder_r w_ippurorder_r

type variables
datawindowchild idwc_area, idwc_supp
st_print i_print
date   id_startday, id_endday
string is_supp

end variables

on w_ippurorder_r.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.dw_3=create dw_3
this.dw_area=create dw_area
this.st_2=create st_2
this.pb_1=create pb_1
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
end on

on w_ippurorder_r.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_1.sharedata(dw_2)

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

// 전체거래처
dw_3.settransobject(sqlca)
dw_3.insertrow(0)  

dw_3.object.ymd1[1] = date(string(today(),'yyyy/mm/dd'))
dw_3.object.ymd2[1] = date(string(today(),'yyyy/mm/dd'))
id_startday = dw_3.object.ymd1[1]
id_endday   = dw_3.object.ymd2[1]

idwc_supp.setredraw(false)
dw_3.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(sqlca)
idwc_supp.insertrow(1)
idwc_supp.setitem(1, "supp_no", "%")
idwc_supp.setitem(1, "supp_name", "전체")

idwc_supp.accepttext()
idwc_supp.setredraw(false)

if LeftA(gs_team,1) = "9" then
	dw_3.object.supp_no[1] = "%"
end if


ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 68
gb_2.height = newheight - 416

dw_1.width  = newwidth  - 151
dw_1.height = newheight - 512

end event

type pb_save from w_inheritance`pb_save within w_ippurorder_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ippurorder_r
integer x = 73
integer y = 444
integer width = 4507
integer height = 2280
integer taborder = 50
string dataobject = "d_ippurorder_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_ippurorder_r
integer x = 1175
integer y = 48
integer width = 96
integer height = 80
integer taborder = 70
string dataobject = "d_ippurorder_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ippurorder_r
integer x = 37
integer y = 32
integer width = 1106
string text = "거래처별 발주내역"
end type

type st_tips from w_inheritance`st_tips within w_ippurorder_r
end type

type pb_compute from w_inheritance`pb_compute within w_ippurorder_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ippurorder_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ippurorder_r
integer x = 4402
integer y = 56
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurorder_r
integer x = 4000
integer y = 56
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 거래처별 발주내역을 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ippurorder_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ippurorder_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ippurorder_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ippurorder_r
integer x = 3808
integer y = 56
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
string ls_area

dw_3.accepttext()

ls_area = LeftA(dw_area.object.area[1],1)
if ls_area = "" then	ls_area = "%"
if is_supp = "" then is_supp = "%"

dw_1.reset()
ll_row = dw_1.retrieve(is_supp, id_startday, id_endday, ls_area)
if ll_row < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if


end event

type gb_3 from w_inheritance`gb_3 within w_ippurorder_r
integer x = 32
integer y = 232
integer width = 4590
integer height = 144
integer taborder = 80
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_ippurorder_r
integer y = 380
integer width = 4590
integer height = 2376
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_ippurorder_r
integer x = 3771
integer y = 8
integer width = 846
integer height = 220
integer weight = 400
end type

type gb_4 from groupbox within w_ippurorder_r
integer x = 2112
integer y = 8
integer width = 1641
integer height = 220
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_3 from datawindow within w_ippurorder_r
integer x = 2693
integer y = 48
integer width = 1051
integer height = 160
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_ipsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
dw_1.reset()
this.accepttext()

id_startday = this.object.ymd1[1]
id_endday   = this.object.ymd2[1]
is_supp     = this.object.supp_no[1]
if is_supp  = "" then is_supp = "%"

end event

event rbuttondown;//
choose case dwo.name
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

type dw_area from datawindow within w_ippurorder_r
integer x = 2139
integer y = 124
integer width = 526
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type st_2 from statictext within w_ippurorder_r
integer x = 2139
integer y = 44
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

type pb_1 from picturebutton within w_ippurorder_r
event mousemove pbm_mousemove
integer x = 4192
integer y = 56
integer width = 187
integer height = 144
integer taborder = 120
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
long ll_cnt
DataWindow dwxls

dwxls = dw_1
if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV," + &
										"Html(웹문서), *.HTML,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dwxls.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" OR ls_ExpandName = "html" OR ls_ExpandName = "HTML" then
						dwxls.SaveAs(ls_DocName, HTMLTable!	, TRUE)
			end if
	end if
end if	

end event

type st_5 from statictext within w_ippurorder_r
integer x = 105
integer y = 288
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

type ddlb_fld from dropdownlistbox within w_ippurorder_r
integer x = 293
integer y = 272
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ippurorder_r
integer x = 361
integer y = 288
integer width = 329
integer height = 88
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

type st_6 from statictext within w_ippurorder_r
integer x = 809
integer y = 288
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

type ddlb_op from dropdownlistbox within w_ippurorder_r
integer x = 978
integer y = 272
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ippurorder_r
integer x = 1298
integer y = 276
integer width = 567
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_ippurorder_r
integer x = 1879
integer y = 276
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
string text = "필터"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Filter( arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_ippurorder_r
integer x = 2043
integer y = 276
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ippurorder_r
integer x = 2208
integer y = 276
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ippurorder_r
integer x = 2373
integer y = 276
integer width = 160
integer height = 76
integer taborder = 130
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

