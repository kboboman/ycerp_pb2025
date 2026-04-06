$PBExportHeader$w_inwoncoil_r.srw
$PBExportComments$원코일구매결과보고서조회[1998/12/10,방영석]
forward
global type w_inwoncoil_r from w_inheritance
end type
type em_1 from editmask within w_inwoncoil_r
end type
type ddlb_1 from dropdownlistbox within w_inwoncoil_r
end type
type pb_1 from picturebutton within w_inwoncoil_r
end type
type st_4 from statictext within w_inwoncoil_r
end type
type ddlb_fld from dropdownlistbox within w_inwoncoil_r
end type
type ddlb_dwtitles from dropdownlistbox within w_inwoncoil_r
end type
type st_5 from statictext within w_inwoncoil_r
end type
type ddlb_op from dropdownlistbox within w_inwoncoil_r
end type
type sle_value from singlelineedit within w_inwoncoil_r
end type
type cb_1 from commandbutton within w_inwoncoil_r
end type
type cb_2 from commandbutton within w_inwoncoil_r
end type
type cb_3 from commandbutton within w_inwoncoil_r
end type
type cb_5 from commandbutton within w_inwoncoil_r
end type
end forward

global type w_inwoncoil_r from w_inheritance
integer width = 4562
integer height = 2668
string title = "월별 원재료 구매현황(w_inwoncoil_r)"
em_1 em_1
ddlb_1 ddlb_1
pb_1 pb_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
end type
global w_inwoncoil_r w_inwoncoil_r

type variables
st_print i_print
int ii_year, ii_month
string is_flag
end variables

on w_inwoncoil_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.ddlb_1=create ddlb_1
this.pb_1=create pb_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.ddlb_1
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
end on

on w_inwoncoil_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.ddlb_1)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
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

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_1.visible = false
em_1.text = string(today(), "YYYY/mm")

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - 46

dw_2.width  = newwidth  - 46
dw_2.height = newheight - 456

end event

type pb_save from w_inheritance`pb_save within w_inwoncoil_r
boolean visible = false
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_inwoncoil_r
integer x = 1710
integer y = 68
integer width = 146
integer height = 120
string title = "d_inwoncoil_r1"
string dataobject = "d_inwoncoil_r1"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_inwoncoil_r
integer x = 32
integer y = 48
integer width = 1477
integer height = 140
string text = "월별 원재료 구매현황"
end type

type st_tips from w_inheritance`st_tips within w_inwoncoil_r
end type

type pb_compute from w_inheritance`pb_compute within w_inwoncoil_r
boolean visible = false
integer taborder = 90
boolean enabled = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_inwoncoil_r
boolean visible = false
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_inwoncoil_r
integer x = 4274
integer y = 64
integer taborder = 100
end type

event clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_inwoncoil_r
integer x = 3881
integer y = 64
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper   w_print
string       ls_sql,    ls_where, ls_source
gs_print_str lstr_print

//ii_year = integer(left(em_1.text,4))
//ii_month = integer(mid(em_1.text,6,2))
//
//if isnull(ii_year) or isnull(ii_month) then
//	return
//end if
//
//if is_flag = 'H' then
//	dw_1.retrieve(ii_year, ii_month)
//else
//	dw_1.retrieve(ii_year, ii_month, is_flag)
//end if


IF dw_2.RowCount() <= 0 THEN
   RETURN
END IF

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 원재료 구매 결과를  출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_inwoncoil_r
boolean visible = false
integer taborder = 120
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_inwoncoil_r
boolean visible = false
integer taborder = 130
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_inwoncoil_r
boolean visible = false
integer taborder = 150
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_inwoncoil_r
integer x = 3689
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ii_year = integer(LeftA(em_1.text,4))
ii_month = integer(MidA(em_1.text,6,2))

if isnull(ii_year) or isnull(ii_month) then
	return
end if

if is_flag = 'H' then
	dw_2.retrieve(ii_year, ii_month)
else
	dw_2.retrieve(ii_year, ii_month, is_flag)
end if

if dw_2.rowcount() < 1 then
	messagebox("에러","해당월에 조회한 자료가 없습니다", exclamation!)
end if
em_1.setfocus()
end event

type gb_3 from w_inheritance`gb_3 within w_inwoncoil_r
integer x = 18
integer y = 240
integer width = 4480
integer height = 168
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_inwoncoil_r
integer x = 2633
integer y = 20
integer width = 1006
integer height = 204
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회"
end type

type gb_1 from w_inheritance`gb_1 within w_inwoncoil_r
integer x = 3657
integer y = 20
integer width = 837
end type

type dw_2 from w_inheritance`dw_2 within w_inwoncoil_r
string tag = "d_inwonsheet_r2"
integer x = 18
integer y = 424
integer width = 4480
integer height = 2108
string title = "d_inwoncoil_r2"
string dataobject = "d_inwoncoil_r2"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then return

//this.SelectRow(0,  false)
//this.SelectRow(row, true)

this.ScrollToRow(row)

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type em_1 from editmask within w_inwoncoil_r
integer x = 3269
integer y = 100
integer width = 329
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

type ddlb_1 from dropdownlistbox within w_inwoncoil_r
integer x = 2674
integer y = 100
integer width = 576
integer height = 392
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"원코일","스리팅코일","SHEET",""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
CHOOSE CASE index
	CASE 1
		is_flag = 'W'
		dw_2.dataobject = 'd_inwoncoil_r2'
		dw_1.dataobject = 'd_inwoncoil_r1'
	CASE 2
		is_flag = 'S'
		dw_2.dataobject = 'd_inwoncoil_r2'
		dw_1.dataobject = 'd_inwoncoil_r1'
	CASE 3
		is_flag = 'H'
		dw_2.dataobject = 'd_inwonsheet_r2'
		dw_1.dataobject = 'd_inwonsheet_r1'
END CHOOSE

dw_2.settransobject(sqlca)
dw_2.sharedata(dw_1)

end event

type pb_1 from picturebutton within w_inwoncoil_r
integer x = 4069
integer y = 64
integer width = 187
integer height = 144
integer taborder = 40
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

dwxls = dw_2
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
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
   //===============================================================//
end if   
MessageBox("확인","엑셀파일 작업완료.")

end event

type st_4 from statictext within w_inwoncoil_r
integer x = 82
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_inwoncoil_r
integer x = 270
integer y = 292
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

type ddlb_dwtitles from dropdownlistbox within w_inwoncoil_r
integer x = 320
integer y = 308
integer width = 311
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

type st_5 from statictext within w_inwoncoil_r
integer x = 768
integer y = 308
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

type ddlb_op from dropdownlistbox within w_inwoncoil_r
integer x = 937
integer y = 292
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

type sle_value from singlelineedit within w_inwoncoil_r
integer x = 1257
integer y = 300
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

type cb_1 from commandbutton within w_inwoncoil_r
integer x = 1829
integer y = 300
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
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_inwoncoil_r
integer x = 1993
integer y = 300
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

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_inwoncoil_r
integer x = 2158
integer y = 300
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

type cb_5 from commandbutton within w_inwoncoil_r
integer x = 2322
integer y = 300
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

