$PBExportHeader$w_ipbmonth_r.srw
$PBExportComments$조업자재구매월보(1999/07/09, 이인호)
forward
global type w_ipbmonth_r from w_inheritance
end type
type ddlb_1 from dropdownlistbox within w_ipbmonth_r
end type
type ddlb_2 from dropdownlistbox within w_ipbmonth_r
end type
type rb_1 from radiobutton within w_ipbmonth_r
end type
type rb_2 from radiobutton within w_ipbmonth_r
end type
type rb_3 from radiobutton within w_ipbmonth_r
end type
type rb_4 from radiobutton within w_ipbmonth_r
end type
type dw_area from datawindow within w_ipbmonth_r
end type
type gb_15 from groupbox within w_ipbmonth_r
end type
end forward

global type w_ipbmonth_r from w_inheritance
integer width = 3835
integer height = 2152
string title = "조업자재 구매월보(w_ipbmonth_r)"
ddlb_1 ddlb_1
ddlb_2 ddlb_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
dw_area dw_area
gb_15 gb_15
end type
global w_ipbmonth_r w_ipbmonth_r

type variables
int ii_year, ii_mon 
st_print i_print
end variables

on w_ipbmonth_r.create
int iCurrent
call super::create
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_area=create dw_area
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_1
this.Control[iCurrent+2]=this.ddlb_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.rb_4
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.gb_15
end on

on w_ipbmonth_r.destroy
call super::destroy
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_area)
destroy(this.gb_15)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

pb_save.visible = false
this.x = 1
this.y = 1
ddlb_1.text = string(today(),"YYYY")
ddlb_2.text = string(today(),"MM")
ii_year = integer(ddlb_1.text)
ii_mon  = integer(ddlb_2.text)
dw_2.visible =false

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 123
gb_2.height = this.height - 380

dw_1.width  = this.width  - 192
dw_1.height = this.height - 468

end event

type pb_save from w_inheritance`pb_save within w_ipbmonth_r
integer x = 3333
integer y = 64
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()

wf_update1(dw_1, "Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipbmonth_r
string tag = "d_ipbpur_custmon_r2"
integer x = 73
integer y = 284
integer width = 3643
integer height = 1684
string title = "d_ipbpur_custmon_r"
string dataobject = "d_ipbpur_custmon_r2"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_ipbmonth_r
boolean visible = false
integer x = 1687
integer y = 104
integer width = 87
integer height = 68
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ipbmonth_r
integer x = 59
integer width = 1056
string text = "조업자재 구매월보"
end type

type st_tips from w_inheritance`st_tips within w_ipbmonth_r
end type

type pb_compute from w_inheritance`pb_compute within w_ipbmonth_r
boolean visible = false
integer x = 3008
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipbmonth_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipbmonth_r
integer x = 3529
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipbmonth_r
integer x = 3333
integer y = 64
integer taborder = 120
end type

event pb_print::clicked;w_repsuper w_print
string ls_pur

if dw_1.rowcount() < 1 then return

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 조업자재 구매월보를 출력합니다." 

if rb_2.checked = true then
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=96'
else
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
end if
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ipbmonth_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ipbmonth_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ipbmonth_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipbmonth_r
integer x = 3136
integer y = 64
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.settransobject(sqlca)
if rb_3.checked = true then
	if dw_1.retrieve(ii_year, ii_mon, dw_area.object.area[1]) < 1 then
		dw_1.reset()
	end if
else
	if dw_1.retrieve(ii_year, ii_mon, dw_area.object.area[1]) < 1 then
		dw_1.reset()
	end if
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipbmonth_r
integer x = 1925
integer y = 20
integer width = 1157
integer height = 204
long textcolor = 0
string text = "년월"
end type

type gb_2 from w_inheritance`gb_2 within w_ipbmonth_r
integer x = 41
integer width = 3712
integer height = 1772
integer taborder = 90
integer textsize = -10
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ipbmonth_r
integer x = 3099
integer y = 20
integer width = 654
end type

type ddlb_1 from dropdownlistbox within w_ipbmonth_r
integer x = 1975
integer y = 96
integer width = 270
integer height = 680
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_year = integer(this.text)

end event

type ddlb_2 from dropdownlistbox within w_ipbmonth_r
integer x = 2249
integer y = 96
integer width = 215
integer height = 772
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"01","02","03","04","05","06","07","08","09","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_mon = integer(this.text)

end event

type rb_1 from radiobutton within w_ipbmonth_r
integer x = 2505
integer y = 64
integer width = 238
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "표지"
boolean checked = true
end type

event clicked;if this.checked = TRUE then
	pb_save.visible = false
	dw_1.dataobject = "d_ipbpur_custmon_r2"
end if

end event

type rb_2 from radiobutton within w_ipbmonth_r
integer x = 2505
integer y = 128
integer width = 238
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "상세"
end type

event clicked;if this.checked = TRUE then
	pb_save.visible = false
	dw_1.dataobject = "d_ipbpur_custmon_r"
	dw_1.modify('Datawindow.Zoom=96')
end if

end event

type rb_3 from radiobutton within w_ipbmonth_r
integer x = 2747
integer y = 64
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부서별"
end type

event clicked;if this.checked = TRUE then
	pb_save.visible = false
	dw_1.dataobject = "d_ipbpur_allmon_part_r"
end if

end event

type rb_4 from radiobutton within w_ipbmonth_r
boolean visible = false
integer x = 2432
integer y = 136
integer width = 393
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체수정"
end type

event clicked;if this.checked = TRUE then
	pb_save.visible = true
	dw_1.dataobject = "d_ipbpurinmonth_m"
else
	pb_save.visible = false
end if

end event

type dw_area from datawindow within w_ipbmonth_r
integer x = 1326
integer y = 96
integer width = 539
integer height = 88
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

end event

type gb_15 from groupbox within w_ipbmonth_r
integer x = 1285
integer y = 20
integer width = 622
integer height = 204
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

