$PBExportHeader$w_ipbyear_r.srw
$PBExportComments$조업자재구매년보(1999/07/09, 이인호)
forward
global type w_ipbyear_r from w_inheritance
end type
type rb_4 from radiobutton within w_ipbyear_r
end type
type em_1 from editmask within w_ipbyear_r
end type
type rb_1 from radiobutton within w_ipbyear_r
end type
type rb_2 from radiobutton within w_ipbyear_r
end type
type st_1 from statictext within w_ipbyear_r
end type
type dw_area from datawindow within w_ipbyear_r
end type
end forward

global type w_ipbyear_r from w_inheritance
integer width = 3616
integer height = 2124
string title = "조업자재 구매년보(w_ipbyear_r)"
rb_4 rb_4
em_1 em_1
rb_1 rb_1
rb_2 rb_2
st_1 st_1
dw_area dw_area
end type
global w_ipbyear_r w_ipbyear_r

type variables
st_print i_print
end variables

on w_ipbyear_r.create
int iCurrent
call super::create
this.rb_4=create rb_4
this.em_1=create em_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_1=create st_1
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.dw_area
end on

on w_ipbyear_r.destroy
call super::destroy
destroy(this.rb_4)
destroy(this.em_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_1)
destroy(this.dw_area)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

pb_save.visible = false
this.x = 1
this.y = 1
em_1.text = string(today(),"YYYY")
dw_2.visible =false

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

end event

type pb_save from w_inheritance`pb_save within w_ipbyear_r
boolean visible = false
integer x = 3136
integer y = 64
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_ipbyear_r
integer x = 37
integer y = 272
integer width = 3506
integer height = 1712
integer taborder = 50
string dataobject = "d_ipbyear_r1"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_ipbyear_r
boolean visible = false
integer x = 1687
integer y = 104
integer width = 87
integer height = 68
integer taborder = 60
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ipbyear_r
integer x = 32
integer width = 1083
string text = "조업자재 구매년보"
end type

type st_tips from w_inheritance`st_tips within w_ipbyear_r
end type

type pb_compute from w_inheritance`pb_compute within w_ipbyear_r
boolean visible = false
integer x = 3008
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipbyear_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipbyear_r
integer x = 3333
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipbyear_r
integer x = 3136
integer y = 64
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_1.rowcount() < 1 then return

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 조업자재 구매년보를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ipbyear_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ipbyear_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_ipbyear_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipbyear_r
integer x = 2939
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

int li_year

li_year = integer(em_1.text)
dw_1.settransobject(sqlca)
dw_1.retrieve(li_year, dw_area.object.area[1])

end event

type gb_3 from w_inheritance`gb_3 within w_ipbyear_r
integer x = 1161
integer y = 24
integer width = 1714
integer height = 192
integer taborder = 70
integer weight = 400
long textcolor = 0
string text = "조회"
end type

type gb_2 from w_inheritance`gb_2 within w_ipbyear_r
integer x = 14
integer width = 3552
integer height = 1772
integer taborder = 80
integer textsize = -10
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ipbyear_r
integer x = 2903
integer y = 20
integer width = 654
integer taborder = 40
end type

type rb_4 from radiobutton within w_ipbyear_r
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

type em_1 from editmask within w_ipbyear_r
integer x = 1742
integer y = 92
integer width = 206
integer height = 92
integer taborder = 20
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
string mask = "yyyy"
end type

type rb_1 from radiobutton within w_ipbyear_r
integer x = 2080
integer y = 100
integer width = 402
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
string text = "거래처별"
boolean checked = true
end type

event clicked;dw_1.dataobject = "d_ipbyear_r1"

end event

type rb_2 from radiobutton within w_ipbyear_r
integer x = 2546
integer y = 100
integer width = 311
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
string text = "품목별"
end type

event clicked;dw_1.dataobject = "d_ipbyear_r2"

end event

type st_1 from statictext within w_ipbyear_r
integer x = 1961
integer y = 104
integer width = 101
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "년"
boolean focusrectangle = false
end type

type dw_area from datawindow within w_ipbyear_r
integer x = 1202
integer y = 92
integer width = 503
integer height = 96
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

end event

