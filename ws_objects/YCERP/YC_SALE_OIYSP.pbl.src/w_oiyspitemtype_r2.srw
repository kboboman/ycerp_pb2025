$PBExportHeader$w_oiyspitemtype_r2.srw
$PBExportComments$YSP TYPE별 출고집계(2000/03/06,이인호)
forward 
global type w_oiyspitemtype_r2 from w_inheritance
end type
type rb_1 from radiobutton within w_oiyspitemtype_r2
end type
type rb_2 from radiobutton within w_oiyspitemtype_r2
end type
type em_1 from editmask within w_oiyspitemtype_r2
end type
type em_2 from editmask within w_oiyspitemtype_r2
end type
type st_1 from statictext within w_oiyspitemtype_r2
end type
type st_3 from statictext within w_oiyspitemtype_r2
end type
type dw_area from datawindow within w_oiyspitemtype_r2
end type
end forward

global type w_oiyspitemtype_r2 from w_inheritance
integer y = 112
integer width = 4334
integer height = 2052
string title = "YSP TYPE별 출고집계(w_oiyspitemtype_r2)"
rb_1 rb_1
rb_2 rb_2
em_1 em_1
em_2 em_2
st_1 st_1
st_3 st_3
dw_area dw_area
end type
global w_oiyspitemtype_r2 w_oiyspitemtype_r2

type variables
st_print i_print
DataWindowChild idwc_area
end variables

on w_oiyspitemtype_r2.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.st_3=create st_3
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.dw_area
end on

on w_oiyspitemtype_r2.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.dw_area)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false

em_1.text = string(today(), "YYYY/MM/01")
em_2.text = string(today(), "YYYY/MM/DD")

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = "%"


end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_oiyspitemtype_r2
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiyspitemtype_r2
string tag = "d_oiyspitemtype2_s1"
integer x = 32
integer y = 448
integer width = 4219
integer height = 1472
integer taborder = 0
string title = "d_oiyspitemtype2_s2"
string dataobject = "d_oiyspitemtype2_s1"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oiyspitemtype_r2
integer x = 32
integer y = 24
integer width = 1317
integer height = 136
string text = "YSP TYPE별 출고집계"
end type

type st_tips from w_inheritance`st_tips within w_oiyspitemtype_r2
end type

type pb_compute from w_inheritance`pb_compute within w_oiyspitemtype_r2
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiyspitemtype_r2
integer x = 3241
integer y = 60
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

type pb_close from w_inheritance`pb_close within w_oiyspitemtype_r2
integer x = 3433
integer y = 60
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiyspitemtype_r2
integer x = 3049
integer y = 60
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
i_print.st_print_desc = " 이 프로그램은 YSP TYPE별 출고집계를 출력합니다." 

OpenWithParm(w_printsetup, i_print) // cross tab은 sharedata가 안됨으로 직접프린트함.easthero
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)
//


end event

type pb_cancel from w_inheritance`pb_cancel within w_oiyspitemtype_r2
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oiyspitemtype_r2
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_oiyspitemtype_r2
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiyspitemtype_r2
integer x = 2857
integer y = 60
integer taborder = 10
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sdate, ls_edate
date   ld_sdate, ld_edate

dw_1.SetTransObject(SQLCA)

// 월별
if rb_1.checked = true then
	ls_sdate  = LeftA(em_1.text,7) + "/01"
	ld_sdate  = date( em_1.text )

	ls_edate  = GF_ReplaceAll(em_2.text,"/","")
	SELECT top 1 dbo.UF_GetLastDAY( :ls_edate ) INTO :ls_edate FROM login;
	em_2.text = ls_edate
	ld_edate  = date(ls_edate)
else
	ld_sdate  = date(em_1.text)
	ld_edate  = date(em_2.text)
end if

//
dw_1.setredraw(false)
dw_1.retrieve( ld_sdate, ld_edate)
dw_1.groupcalc()
dw_1.setredraw(true)

if dw_1.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiyspitemtype_r2
integer x = 32
integer y = 256
integer width = 4219
integer height = 180
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oiyspitemtype_r2
integer x = 1399
integer y = 12
integer width = 1399
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oiyspitemtype_r2
integer x = 2821
integer width = 841
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_oiyspitemtype_r2
integer x = 50
integer y = 184
integer width = 101
integer height = 72
integer taborder = 0
boolean enabled = false
boolean vscrollbar = false
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

type rb_1 from radiobutton within w_oiyspitemtype_r2
integer x = 2546
integer y = 56
integer width = 210
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월별"
boolean checked = true
end type

event clicked;//
dw_1.setredraw(false)
dw_1.dataobject = 'd_oiyspitemtype2_s1'
dw_1.setredraw(true)

end event

type rb_2 from radiobutton within w_oiyspitemtype_r2
integer x = 2546
integer y = 132
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일별"
end type

event clicked;//
dw_1.setredraw(false)
dw_1.dataobject = 'd_oiyspitemtype2_s2'
dw_1.setredraw(true)

end event

type em_1 from editmask within w_oiyspitemtype_r2
integer x = 1765
integer y = 132
integer width = 379
integer height = 76
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

end event

type em_2 from editmask within w_oiyspitemtype_r2
integer x = 2149
integer y = 132
integer width = 379
integer height = 76
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

end event

type st_1 from statictext within w_oiyspitemtype_r2
integer x = 1431
integer y = 132
integer width = 329
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
string text = "출고일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_oiyspitemtype_r2
integer x = 1431
integer y = 52
integer width = 329
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

type dw_area from datawindow within w_oiyspitemtype_r2
integer x = 1765
integer y = 52
integer width = 526
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

