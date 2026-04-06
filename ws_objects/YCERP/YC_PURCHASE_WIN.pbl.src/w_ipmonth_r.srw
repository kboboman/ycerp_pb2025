$PBExportHeader$w_ipmonth_r.srw
$PBExportComments$자재구매월보(1999/09/21, 이인호)
forward 
global type w_ipmonth_r from w_inheritance
end type
type ddlb_1 from dropdownlistbox within w_ipmonth_r
end type
type ddlb_2 from dropdownlistbox within w_ipmonth_r
end type
type rb_1 from radiobutton within w_ipmonth_r
end type
type rb_2 from radiobutton within w_ipmonth_r
end type
type rb_3 from radiobutton within w_ipmonth_r
end type
type rb_4 from radiobutton within w_ipmonth_r
end type
type ddlb_3 from dropdownlistbox within w_ipmonth_r
end type
end forward

global type w_ipmonth_r from w_inheritance
integer width = 3616
integer height = 2124
string title = "조업자재 구매월보(w_ipbmonth_r)"
ddlb_1 ddlb_1
ddlb_2 ddlb_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
ddlb_3 ddlb_3
end type
global w_ipmonth_r w_ipmonth_r

type variables
int ii_year, ii_mon 
st_print i_print
string is_flag

end variables

on w_ipmonth_r.create
int iCurrent
call super::create
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.ddlb_3=create ddlb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_1
this.Control[iCurrent+2]=this.ddlb_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.rb_4
this.Control[iCurrent+7]=this.ddlb_3
end on

on w_ipmonth_r.destroy
call super::destroy
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.ddlb_3)
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
ii_mon = integer(ddlb_2.text)
dw_2.visible =false

ddlb_3.text = "상품"
is_flag = "S"

end event

type pb_save from w_inheritance`pb_save within w_ipmonth_r
boolean visible = false
integer x = 3136
integer y = 64
end type

event pb_save::clicked;
dw_1.accepttext()

wf_update1(dw_1, "Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipmonth_r
integer x = 37
integer y = 272
integer width = 3506
integer height = 1712
string dataobject = "d_ippur_suppmon_r2"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ipmonth_r
integer x = 32
integer width = 1152
string text = "자재 구매월보"
end type

type st_tips from w_inheritance`st_tips within w_ipmonth_r
end type

type pb_compute from w_inheritance`pb_compute within w_ipmonth_r
boolean visible = false
integer x = 3008
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipmonth_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipmonth_r
integer x = 3333
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipmonth_r
integer x = 3136
integer y = 64
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_pur

if dw_1.rowcount() < 1 then return

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 조업자재 구매월보를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ipmonth_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ipmonth_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ipmonth_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipmonth_r
integer x = 2939
integer y = 64
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.settransobject(sqlca)
if rb_3.checked = true then
	if dw_1.retrieve(ii_year, ii_mon) < 1 then
		dw_1.reset()
	end if
else
	if dw_1.retrieve(ii_year, ii_mon, gs_area) < 1 then
		dw_1.reset()
	end if
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipmonth_r
integer x = 1221
integer y = 24
integer width = 1655
integer height = 192
long textcolor = 0
string text = "년월"
end type

type gb_2 from w_inheritance`gb_2 within w_ipmonth_r
integer x = 14
integer width = 3552
integer height = 1772
integer taborder = 90
integer textsize = -10
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ipmonth_r
integer x = 2903
integer y = 20
integer width = 654
end type

type dw_2 from w_inheritance`dw_2 within w_ipmonth_r
boolean visible = false
integer x = 1687
integer y = 104
integer width = 87
integer height = 68
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type ddlb_1 from dropdownlistbox within w_ipmonth_r
integer x = 1637
integer y = 92
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
string item[] = {"1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_year = integer(this.text)

end event

type ddlb_2 from dropdownlistbox within w_ipmonth_r
integer x = 1911
integer y = 92
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

type rb_1 from radiobutton within w_ipmonth_r
integer x = 2158
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

type rb_2 from radiobutton within w_ipmonth_r
integer x = 2158
integer y = 136
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
end if

end event

type rb_3 from radiobutton within w_ipmonth_r
integer x = 2432
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

type rb_4 from radiobutton within w_ipmonth_r
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

type ddlb_3 from dropdownlistbox within w_ipmonth_r
integer x = 1280
integer y = 92
integer width = 334
integer height = 364
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
boolean sorted = false
boolean vscrollbar = true
string item[] = {"상품","원자재","부자재","외주가공"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_flag = "S"
	CASE 2
		is_flag = "W"
	CASE 3
		is_flag = "B"
	CASE 4
		is_flag = "Y"
END CHOOSE

end event

