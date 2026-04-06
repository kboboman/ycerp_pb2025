$PBExportHeader$w_iocoilinaudit_r.srw
$PBExportComments$코일입출고보고서(1998/09/10,곽용덕)
forward 
global type w_iocoilinaudit_r from w_inheritance
end type
type cb_3 from commandbutton within w_iocoilinaudit_r
end type
type em_1 from editmask within w_iocoilinaudit_r
end type
type em_2 from editmask within w_iocoilinaudit_r
end type
type pb_1 from picturebutton within w_iocoilinaudit_r
end type
type st_1 from statictext within w_iocoilinaudit_r
end type
type st_4 from statictext within w_iocoilinaudit_r
end type
type ddlb_fld from dropdownlistbox within w_iocoilinaudit_r
end type
type ddlb_dwtitles from dropdownlistbox within w_iocoilinaudit_r
end type
type st_7 from statictext within w_iocoilinaudit_r
end type
type ddlb_op from dropdownlistbox within w_iocoilinaudit_r
end type
type sle_value from singlelineedit within w_iocoilinaudit_r
end type
type cb_19 from commandbutton within w_iocoilinaudit_r
end type
type cb_20 from commandbutton within w_iocoilinaudit_r
end type
type cb_21 from commandbutton within w_iocoilinaudit_r
end type
type cb_22 from commandbutton within w_iocoilinaudit_r
end type
end forward

global type w_iocoilinaudit_r from w_inheritance
integer x = 320
integer y = 552
integer width = 4055
integer height = 2208
string title = "코일 입출고현황(w_iocoilinaudit_r)"
cb_3 cb_3
em_1 em_1
em_2 em_2
pb_1 pb_1
st_1 st_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
end type
global w_iocoilinaudit_r w_iocoilinaudit_r

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

on w_iocoilinaudit_r.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.em_1=create em_1
this.em_2=create em_2
this.pb_1=create pb_1
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_7
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_19
this.Control[iCurrent+13]=this.cb_20
this.Control[iCurrent+14]=this.cb_21
this.Control[iCurrent+15]=this.cb_22
end on

on w_iocoilinaudit_r.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false

em_1.text    = LeftA(string(RelativeDate(today(), - 7),'yyyy/mm/dd'), 8) + "01"
em_2.text    = string(today(),'yyyy/mm/dd')

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x



end event

type pb_save from w_inheritance`pb_save within w_iocoilinaudit_r
boolean visible = false
integer x = 2021
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_iocoilinaudit_r
integer x = 32
integer y = 444
integer width = 3950
integer height = 1624
string dataobject = "d_iocoilinaudit_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//long ll_row
//string ls_bank_code
//
//ll_row = wf_rowfocuschange(dw_1,"N")
//if ll_row < 1 then
//	return
//end if
//dw_2.accepttext()
//ls_bank_code = this.object.bank_code[ll_row]
//dw_2.object.bank_code.protect = true
//if isnull(ls_bank_code) or ls_bank_code = "" then
//	dw_1.object.bank_code[ll_row] = is_bank_code
//	dw_1.object.bank_name[ll_row] = is_bank_name
//	dw_1.object.bank_id[ll_row] = is_bank_id
//else
//	dw_2.retrieve(ls_bank_code)
//end if
//

end event

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
////
//this.SelectRow(0,  false)
//this.SelectRow(row,  true)
//
end event

type st_title from w_inheritance`st_title within w_iocoilinaudit_r
integer x = 32
integer y = 20
integer width = 1115
integer height = 136
string text = "코일 입출고현황"
end type

type st_tips from w_inheritance`st_tips within w_iocoilinaudit_r
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilinaudit_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_iocoilinaudit_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iocoilinaudit_r
integer x = 2656
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilinaudit_r
integer x = 2267
integer y = 60
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 코일 입출고현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_iocoilinaudit_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_iocoilinaudit_r
boolean visible = false
integer x = 1637
integer y = 60
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_iocoilinaudit_r
boolean visible = false
integer x = 1445
integer y = 60
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilinaudit_r
integer x = 2080
integer y = 60
integer taborder = 140
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_row
date ld_sdate, ld_edate

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

dw_1.retrieve(ld_sdate, ld_edate)
if dw_1.rowcount() < 1 then
	MessageBox("확인", "해당하는 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iocoilinaudit_r
integer x = 1243
integer y = 16
integer width = 786
integer height = 208
integer taborder = 70
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilinaudit_r
integer y = 244
integer width = 3950
integer height = 176
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilinaudit_r
integer x = 2048
integer y = 16
integer width = 837
integer height = 208
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_iocoilinaudit_r
integer x = 50
integer y = 184
integer width = 87
integer height = 64
integer taborder = 60
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_iocoilinaudit_r
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type em_1 from editmask within w_iocoilinaudit_r
integer x = 1271
integer y = 136
integer width = 361
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_iocoilinaudit_r
integer x = 1637
integer y = 136
integer width = 361
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type pb_1 from picturebutton within w_iocoilinaudit_r
event mousemove pbm_mousemove
integer x = 2455
integer y = 60
integer width = 187
integer height = 144
integer taborder = 20
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

type st_1 from statictext within w_iocoilinaudit_r
integer x = 1271
integer y = 56
integer width = 727
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
boolean enabled = false
string text = "입출고 일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_iocoilinaudit_r
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_iocoilinaudit_r
integer x = 261
integer y = 308
integer width = 430
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
string item[] = {""}
end type

type ddlb_dwtitles from dropdownlistbox within w_iocoilinaudit_r
integer x = 306
integer y = 316
integer width = 256
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

type st_7 from statictext within w_iocoilinaudit_r
integer x = 699
integer y = 324
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

type ddlb_op from dropdownlistbox within w_iocoilinaudit_r
integer x = 882
integer y = 308
integer width = 293
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

type sle_value from singlelineedit within w_iocoilinaudit_r
integer x = 1184
integer y = 308
integer width = 562
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_19 from commandbutton within w_iocoilinaudit_r
integer x = 1755
integer y = 308
integer width = 160
integer height = 76
integer taborder = 140
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

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_20 from commandbutton within w_iocoilinaudit_r
integer x = 1920
integer y = 308
integer width = 160
integer height = 76
integer taborder = 150
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

arg_dw = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_21 from commandbutton within w_iocoilinaudit_r
integer x = 2085
integer y = 308
integer width = 160
integer height = 76
integer taborder = 160
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

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_22 from commandbutton within w_iocoilinaudit_r
integer x = 2249
integer y = 308
integer width = 160
integer height = 76
integer taborder = 170
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

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

