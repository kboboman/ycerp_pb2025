$PBExportHeader$w_apoiinv_r.srw
$PBExportComments$월별매입총괄현황(2001/12/07, 이대준)
forward
global type w_apoiinv_r from w_inheritance
end type
type ddlb_1 from dropdownlistbox within w_apoiinv_r
end type
type ddlb_2 from dropdownlistbox within w_apoiinv_r
end type
type st_1 from statictext within w_apoiinv_r
end type
type st_2 from statictext within w_apoiinv_r
end type
type ddlb_3 from dropdownlistbox within w_apoiinv_r
end type
type dw_area from datawindow within w_apoiinv_r
end type
end forward

global type w_apoiinv_r from w_inheritance
integer x = 5
integer y = 112
integer width = 3643
integer height = 2172
string title = "월별매입 총괄현황(w_apoiinv_r)"
ddlb_1 ddlb_1
ddlb_2 ddlb_2
st_1 st_1
st_2 st_2
ddlb_3 ddlb_3
dw_area dw_area
end type
global w_apoiinv_r w_apoiinv_r

type variables
string is_date, is_con
st_print i_print
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

ddlb_1.text = string(today(),"YYYY")
ddlb_2.text = string(today(),"MM")
is_date     = string(ddlb_1.text) + "/" +  string(ddlb_2.text)

ddlb_3.text = "미확정"
is_con      = "O"

end event

on w_apoiinv_r.create
int iCurrent
call super::create
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.st_1=create st_1
this.st_2=create st_2
this.ddlb_3=create ddlb_3
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_1
this.Control[iCurrent+2]=this.ddlb_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.ddlb_3
this.Control[iCurrent+6]=this.dw_area
end on

on w_apoiinv_r.destroy
call super::destroy
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.ddlb_3)
destroy(this.dw_area)
end on

event resize;call super::resize;dw_1.width  = this.width - 128
dw_1.height = this.height - 436

GB_2.Y      = DW_1.Y - 55
GB_2.WIDTH  = DW_1.WIDTH  + 55
GB_2.HEIGHT = DW_1.HEIGHT + 85
end event

type pb_save from w_inheritance`pb_save within w_apoiinv_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_apoiinv_r
integer x = 50
integer y = 276
integer width = 3515
integer taborder = 60
string dataobject = "d_apoiinv_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_apoiinv_r
boolean visible = false
integer x = 59
integer y = 48
integer width = 151
integer height = 104
integer taborder = 90
end type

type st_title from w_inheritance`st_title within w_apoiinv_r
integer x = 23
integer width = 1230
string text = "월별매입 총괄현황"
end type

type st_tips from w_inheritance`st_tips within w_apoiinv_r
end type

type pb_compute from w_inheritance`pb_compute within w_apoiinv_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_apoiinv_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_apoiinv_r
integer x = 3378
integer y = 64
integer taborder = 130
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoiinv_r
integer x = 3186
integer y = 64
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_1.rowcount() < 1 then return

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 월별매입총괄현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_apoiinv_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_apoiinv_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_apoiinv_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apoiinv_r
integer x = 2994
integer y = 64
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//string ls_flag
//
//if string(ddlb_2.text) = '전체' then
//	ls_flag = 'A'
//	is_date = string(ddlb_1.text)
//else
//	ls_flag = 'P'
	is_date = string(ddlb_1.text) + "/" +  string(ddlb_2.text)
//end if
dw_1.setredraw(false)
if dw_1.retrieve(is_date, is_con, dw_area.object.area[1]) < 1 then
	dw_1.reset()
end if
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_apoiinv_r
integer x = 1422
integer y = 16
integer width = 1531
integer height = 204
integer taborder = 100
end type

type gb_2 from w_inheritance`gb_2 within w_apoiinv_r
integer x = 27
integer width = 3557
integer taborder = 110
end type

type gb_1 from w_inheritance`gb_1 within w_apoiinv_r
integer x = 2967
integer y = 24
integer width = 617
end type

type ddlb_1 from dropdownlistbox within w_apoiinv_r
integer x = 1993
integer y = 92
integer width = 270
integer height = 680
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_2 from dropdownlistbox within w_apoiinv_r
integer x = 2345
integer y = 92
integer width = 215
integer height = 772
integer taborder = 50
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
string item[] = {"01","02","03","04","05","06","07","08","09","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_apoiinv_r
integer x = 2272
integer y = 104
integer width = 73
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "년"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_apoiinv_r
integer x = 2560
integer y = 104
integer width = 73
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "월"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_3 from dropdownlistbox within w_apoiinv_r
integer x = 2642
integer y = 92
integer width = 293
integer height = 288
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
string item[] = {"확정","미확정"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_con = 'S'
	CASE 2
		is_con = 'O'
END CHOOSE

dw_1.reset()
end event

type dw_area from datawindow within w_apoiinv_r
integer x = 1463
integer y = 96
integer width = 526
integer height = 84
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

