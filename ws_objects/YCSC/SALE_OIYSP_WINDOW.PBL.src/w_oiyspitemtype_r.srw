$PBExportHeader$w_oiyspitemtype_r.srw
$PBExportComments$YSP 월별 실적현황(2000/03/06,이인호)
forward
global type w_oiyspitemtype_r from w_inheritance
end type
type st_1 from statictext within w_oiyspitemtype_r
end type
type em_1 from editmask within w_oiyspitemtype_r
end type
type em_2 from editmask within w_oiyspitemtype_r
end type
type rb_1 from radiobutton within w_oiyspitemtype_r
end type
type rb_2 from radiobutton within w_oiyspitemtype_r
end type
type rb_3 from radiobutton within w_oiyspitemtype_r
end type
type rb_4 from radiobutton within w_oiyspitemtype_r
end type
type rb_5 from radiobutton within w_oiyspitemtype_r
end type
type st_2 from statictext within w_oiyspitemtype_r
end type
type gb_4 from groupbox within w_oiyspitemtype_r
end type
end forward

global type w_oiyspitemtype_r from w_inheritance
integer y = 112
integer width = 3643
integer height = 2172
string title = "YSP 월별 실적현황(w_oiyspitemtype_r)"
st_1 st_1
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
st_2 st_2
gb_4 gb_4
end type
global w_oiyspitemtype_r w_oiyspitemtype_r

type variables
st_print i_print

end variables

on w_oiyspitemtype_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.st_2=create st_2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.rb_5
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.gb_4
end on

on w_oiyspitemtype_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.st_2)
destroy(this.gb_4)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1
dw_2.visible = false
em_1.text = string(today(), "YYYY/MM")
em_2.text = string(today(), "YYYY/MM")

end event

type pb_save from w_inheritance`pb_save within w_oiyspitemtype_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiyspitemtype_r
integer x = 14
integer y = 236
integer width = 3575
integer height = 1804
integer taborder = 0
string dataobject = "d_oiyspitemtype_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oiyspitemtype_r
integer x = 1733
integer y = 0
integer width = 69
integer height = 68
integer taborder = 0
boolean enabled = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::retrieveend;if this.rowcount() < 1 then return

string ls_start, ls_end
long ll_row

ls_start = em_1.text
ls_end = em_2.text

for ll_row = 1 to this.rowcount()
	this.object.start_date[ll_row] = ls_start
	this.object.end_date[ll_row] = ls_end
next

end event

type st_title from w_inheritance`st_title within w_oiyspitemtype_r
integer y = 40
integer width = 1262
string text = "YSP 월별 실적현황"
end type

type st_tips from w_inheritance`st_tips within w_oiyspitemtype_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiyspitemtype_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiyspitemtype_r
integer x = 3177
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "화일출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos

//   "파워빌더리포트 (*.PSR),*.PSR," + &
ls_value = GetFileSaveName("Select File",  & 
	ls_Docname, ls_Named, "XLS",  &
	"엑셀 (*.XLS), *.XLS," + &
   "텍스트 (*.TXT),*.TXT," + &
	"HTML문서 (*.HTM), *.HTM," + &
 	"dBase2 (*.DBF), *.DBF," + & 
   "dBase3 (*.DBF), *.DBF," + &
   "Lotus  (*.WK1), *.WK1," + &
   "CSV(쉽표로 분리), *.CSV," + &
   "DIF (*.dif), *.DIF," + &
   "Symbolic Link(*.SLK), *.SLK," + &
   "Works (*.WKS), *.WKS")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
//      if ls_ExpandName = "psr" OR ls_ExpandName = "PSR" then
//    		      dw_1.SaveAs(ls_DocName, PsReport!, TRUE)
//
//   	else
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
  		      dw_1.SaveAsascii(ls_DocName)
//  		      dw_1.SaveAs(ls_DocName, HTMLTable!, TRUE)

		elseif ls_ExpandName = "txt" OR ls_ExpandName = "TXT" then
  		      dw_1.SaveAsascii(ls_DocName)
				  
		elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" then
    		      dw_1.SaveAs(ls_DocName, HTMLTable!, TRUE)

   	elseif ls_ExpandName = "dbf" OR ls_ExpandName = "DBF" then
  		      dw_1.SaveAs(ls_DocName, dBase2!, TRUE)

		elseif ls_ExpandName = "wk1" OR ls_ExpandName = "WK1" then
    		      dw_1.SaveAs(ls_DocName, WK1!, TRUE)

		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
    		      dw_1.SaveAs(ls_DocName, CSV!, TRUE)

//		elseif ls_ExpandName = "dbf" then
//    		      dw_1.SaveAs(sle_ToFileName.text, dBase3!, TRUE)

		elseif ls_ExpandName = "dif" OR ls_ExpandName = "DIF" then
    		      dw_1.SaveAs(ls_DocName, DIF!, TRUE)

		elseif ls_ExpandName = "slk" OR ls_ExpandName = "SLK" then
    		      dw_1.SaveAs(ls_DocName, SYLK!, TRUE)

		elseif ls_ExpandName = "wks" OR ls_ExpandName = "WKS" then
    		      dw_1.SaveAs(ls_DocName, WKS!, TRUE)
      end if
end if


end event

type pb_close from w_inheritance`pb_close within w_oiyspitemtype_r
integer x = 3369
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiyspitemtype_r
integer x = 2985
integer taborder = 20
end type

event pb_print::clicked;w_repsuper w_print

if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 YSP TYPE별 실적현황(M2)을 출력합니다." 

OpenWithParm(w_printsetup, i_print) // cross tab은 sharedata가 안됨으로 직접프린트함.easthero
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)
//


end event

type pb_cancel from w_inheritance`pb_cancel within w_oiyspitemtype_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_oiyspitemtype_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_oiyspitemtype_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiyspitemtype_r
integer x = 2793
integer taborder = 10
boolean default = true
end type

event pb_retrieve::clicked;gs_itemdo_str1 lst_code
string ls_sql, ls_where, ls_flag
date ld_start, ld_end

dw_1.setredraw(false)
if rb_4.checked = true then
	dw_1.dataobject = 'd_oiyspitemtype_s'
else
	dw_1.dataobject = 'd_oiyspitemtype_s2'
end if
dw_1.SetTransObject(SQLCA)
if rb_1.checked = true then
	ls_flag = 'A'
elseif rb_2.checked = true then
	ls_flag = 'P'
else
	ls_flag = 'Q'
end if

ld_start = date(em_1.text + "/01")
ld_end = RelativeDate(date(string(RelativeDate( date(em_2.text + "/01"), 31), "yyyy/mm") + "/01"), -1)

dw_1.retrieve('B0001', ld_start, ld_end, ls_flag)

dw_1.groupcalc()
dw_1.setredraw(true)
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type gb_3 from w_inheritance`gb_3 within w_oiyspitemtype_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiyspitemtype_r
integer x = 1682
integer y = 8
integer width = 1029
integer height = 208
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oiyspitemtype_r
integer x = 2738
integer y = 8
integer width = 850
integer height = 216
integer taborder = 0
end type

type st_1 from statictext within w_oiyspitemtype_r
integer x = 2290
integer y = 52
integer width = 69
integer height = 64
boolean bringtotop = true
integer textsize = -20
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

type em_1 from editmask within w_oiyspitemtype_r
integer x = 1961
integer y = 60
integer width = 325
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
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

type em_2 from editmask within w_oiyspitemtype_r
integer x = 2363
integer y = 64
integer width = 325
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
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

type rb_1 from radiobutton within w_oiyspitemtype_r
integer x = 1851
integer y = 140
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_oiyspitemtype_r
integer x = 2130
integer y = 140
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "판넬"
end type

type rb_3 from radiobutton within w_oiyspitemtype_r
integer x = 2409
integer y = 140
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부속"
end type

type rb_4 from radiobutton within w_oiyspitemtype_r
integer x = 1390
integer y = 48
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "판매"
end type

type rb_5 from radiobutton within w_oiyspitemtype_r
integer x = 1390
integer y = 132
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "생산"
boolean checked = true
end type

type st_2 from statictext within w_oiyspitemtype_r
integer x = 1696
integer y = 68
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출고년월"
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_oiyspitemtype_r
integer x = 1362
integer width = 279
integer height = 220
integer taborder = 10
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

