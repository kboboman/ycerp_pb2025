$PBExportHeader$w_mpyspitemlist_r.srw
$PBExportComments$YSP TYPE별 생산리스트(2003/06/02, 정갑용)
forward
global type w_mpyspitemlist_r from w_inheritance
end type
type em_3 from editmask within w_mpyspitemlist_r
end type
type st_2 from statictext within w_mpyspitemlist_r
end type
type em_4 from editmask within w_mpyspitemlist_r
end type
type st_1 from statictext within w_mpyspitemlist_r
end type
type dw_area from datawindow within w_mpyspitemlist_r
end type
type st_3 from statictext within w_mpyspitemlist_r
end type
end forward

global type w_mpyspitemlist_r from w_inheritance
integer y = 112
integer width = 4690
integer height = 2744
string title = "YSP TYPE별 생산리스트(w_mpyspitemlist_r)"
em_3 em_3
st_2 st_2
em_4 em_4
st_1 st_1
dw_area dw_area
st_3 st_3
end type
global w_mpyspitemlist_r w_mpyspitemlist_r

type variables
st_print i_print
datawindowchild idwc_area
end variables

on w_mpyspitemlist_r.create
int iCurrent
call super::create
this.em_3=create em_3
this.st_2=create st_2
this.em_4=create em_4
this.st_1=create st_1
this.dw_area=create dw_area
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.em_4
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.st_3
end on

on w_mpyspitemlist_r.destroy
call super::destroy
destroy(this.em_3)
destroy(this.st_2)
destroy(this.em_4)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
em_3.text = string(today(), "YYYY/MM/DD")
em_4.text = string(today(), "YYYY/MM/DD")
//st_2.visible = false

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


end event

event resize;call super::resize;//
gb_3.width  = this.width  - 119
gb_3.height = this.height - 380

dw_1.width  = this.width  - 219
dw_1.height = this.height - 492

end event

type pb_save from w_inheritance`pb_save within w_mpyspitemlist_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_mpyspitemlist_r
integer x = 91
integer y = 316
integer width = 4471
integer height = 2252
integer taborder = 0
string dataobject = "d_mpyspitemlist_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_mpyspitemlist_r
integer x = 1358
integer y = 12
integer width = 123
integer height = 100
integer taborder = 0
boolean enabled = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::retrieveend;if this.rowcount() < 1 then return

string ls_start, ls_end
long ll_row


for ll_row = 1 to this.rowcount()
	this.object.start_date[ll_row] = ls_start
	this.object.end_date[ll_row] = ls_end
next

end event

type st_title from w_inheritance`st_title within w_mpyspitemlist_r
integer x = 46
integer y = 48
integer width = 1385
string text = "YSP TYPE별 생산리스트"
end type

type st_tips from w_inheritance`st_tips within w_mpyspitemlist_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpyspitemlist_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpyspitemlist_r
integer x = 4201
integer y = 64
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

event pb_print_part::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos

//   "파워빌더리포트 (*.PSR),*.PSR," + &
ls_value = GetFileSaveName("Select File",  &
	ls_Docname, ls_Named, "XLS",  &
	"엑셀 (*.XLS), *.XLS," + &
   "텍스트 (*.TXT),*.TXT," + &
	"HTML문서 (*.HTM), *.HTM," + &
   "CSV(쉽표로 분리), *.CSV")
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

   	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
    		      dw_1.SaveAs(ls_DocName, CSV!, TRUE)

      end if
end if


end event

type pb_close from w_inheritance`pb_close within w_mpyspitemlist_r
integer x = 4393
integer y = 64
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpyspitemlist_r
integer x = 4009
integer y = 64
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 YSP TYPE별 생산리스트를 출력합니다." 
dw_1.Modify("DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9")
OpenWithParm(w_printsetup, i_print) 
// cross tab은 sharedata가 안됨으로 직접프린트함.easthero
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)
//


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpyspitemlist_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_mpyspitemlist_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_mpyspitemlist_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpyspitemlist_r
integer x = 3817
integer y = 64
integer taborder = 10
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area
date   ld_start, ld_end

dw_1.modify('datawindow.print.preview = No')
dw_1.SetTransObject(SQLCA)
dw_1.setredraw(false)

ld_start = date(em_3.text )
ld_end   = RelativeDate(date(em_4.text), 1)
ls_area  = dw_area.object.area[1]
if ls_area = "" then ls_area = "%"

dw_1.retrieve(ls_area, ld_start, ld_end)
dw_1.groupcalc()
dw_1.setredraw(true)
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpyspitemlist_r
integer x = 41
integer y = 244
integer width = 4571
integer height = 2364
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpyspitemlist_r
integer x = 2350
integer y = 16
integer width = 1390
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpyspitemlist_r
integer x = 3762
integer y = 16
integer width = 850
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type em_3 from editmask within w_mpyspitemlist_r
integer x = 2921
integer y = 140
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

type st_2 from statictext within w_mpyspitemlist_r
integer x = 3278
integer y = 140
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

type em_4 from editmask within w_mpyspitemlist_r
integer x = 3351
integer y = 140
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

type st_1 from statictext within w_mpyspitemlist_r
integer x = 2386
integer y = 56
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

type dw_area from datawindow within w_mpyspitemlist_r
integer x = 2386
integer y = 140
integer width = 526
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_3 from statictext within w_mpyspitemlist_r
integer x = 2921
integer y = 56
integer width = 782
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
string text = "생산일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

