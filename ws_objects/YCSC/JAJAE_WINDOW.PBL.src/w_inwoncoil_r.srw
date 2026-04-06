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
end forward

global type w_inwoncoil_r from w_inheritance
integer width = 4562
integer height = 2668
string title = "월별 원재료 구매현황(w_inwoncoil_r)"
em_1 em_1
ddlb_1 ddlb_1
pb_1 pb_1
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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.ddlb_1
this.Control[iCurrent+3]=this.pb_1
end on

on w_inwoncoil_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.ddlb_1)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.visible = false
em_1.text = string(today(), "YYYY/mm")

end event

event resize;call super::resize;dw_2.width  = this.width - 160
dw_2.height = this.height - 450

GB_3.Y = DW_2.Y - 55
GB_3.WIDTH = DW_2.WIDTH + 75
GB_3.HEIGHT = DW_2.HEIGHT + 85
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
string dataobject = "d_inwoncoil_r1"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_inwoncoil_r
integer x = 55
integer width = 4402
integer height = 2212
string dataobject = "d_inwoncoil_r2"
boolean hscrollbar = true
boolean hsplitscroll = true
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
integer height = 2296
integer taborder = 70
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

event selectionchanged;CHOOSE CASE index
	CASE 1
		dw_2.dataobject = 'd_inwoncoil_r2'
		dw_1.dataobject = 'd_inwoncoil_r1'
		is_flag = 'W'
	CASE 2
		dw_2.dataobject = 'd_inwoncoil_r2'
		dw_1.dataobject = 'd_inwoncoil_r1'
		is_flag = 'S'
	CASE 3
		dw_2.dataobject = 'd_inwonsheet_r2'
		dw_1.dataobject = 'd_inwonsheet_r1'
		is_flag = 'H'
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

