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
type st_2 from statictext within w_iocoilinaudit_r
end type
type pb_1 from picturebutton within w_iocoilinaudit_r
end type
type st_1 from statictext within w_iocoilinaudit_r
end type
end forward

global type w_iocoilinaudit_r from w_inheritance
integer x = 320
integer y = 552
integer width = 4594
integer height = 2684
string title = "코일 입출고현황(w_iocoilinaudit_r)"
cb_3 cb_3
em_1 em_1
em_2 em_2
st_2 st_2
pb_1 pb_1
st_1 st_1
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
this.st_2=create st_2
this.pb_1=create pb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.st_1
end on

on w_iocoilinaudit_r.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
em_1.text    = LeftA(string(RelativeDate(today(), - 7),'yyyy/mm/dd'), 8) + "01"
em_2.text    = string(today(),'yyyy/mm/dd')

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 128
gb_2.height = this.height - 376

dw_1.width  = this.width  - 205
dw_1.height = this.height - 464


end event

type pb_save from w_inheritance`pb_save within w_iocoilinaudit_r
boolean visible = false
integer x = 2021
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_iocoilinaudit_r
integer x = 73
integer y = 296
integer width = 4389
integer height = 2220
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

event dw_1::clicked;call super::clicked;if row < 1 then return
this.SelectRow(0,  false)
this.SelectRow(row,  true)
end event

type dw_2 from w_inheritance`dw_2 within w_iocoilinaudit_r
integer x = 1339
integer y = 48
integer width = 155
integer height = 120
integer taborder = 60
string dataobject = "d_cdbank_excel_r"
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_iocoilinaudit_r
integer x = 55
integer y = 40
integer width = 1216
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
integer x = 4283
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilinaudit_r
integer x = 3895
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
integer x = 3707
integer y = 60
integer taborder = 140
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_date
long ll_row

ld_date = date(em_1.text)
ll_row  = dw_1.retrieve(em_1.text, em_2.text)
if ll_row < 1 then
	MessageBox("확인", "해당하는 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iocoilinaudit_r
integer x = 2747
integer y = 16
integer width = 878
integer height = 208
integer taborder = 70
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilinaudit_r
integer x = 41
integer y = 236
integer width = 4466
integer height = 2308
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilinaudit_r
integer x = 3657
integer y = 16
integer width = 850
integer height = 208
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

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
integer x = 2784
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
integer x = 3223
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

type st_2 from statictext within w_iocoilinaudit_r
integer x = 3154
integer y = 120
integer width = 64
integer height = 80
boolean bringtotop = true
integer textsize = -20
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_iocoilinaudit_r
event mousemove pbm_mousemove
integer x = 4082
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
integer x = 2784
integer y = 56
integer width = 800
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

