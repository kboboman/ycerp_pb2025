$PBExportHeader$w_apoivc_r.srw
$PBExportComments$월별지불총괄현황(2001/12/08, 이대준)
forward
global type w_apoivc_r from w_inheritance
end type
type st_2 from statictext within w_apoivc_r
end type
type ddlb_2 from dropdownlistbox within w_apoivc_r
end type
type st_1 from statictext within w_apoivc_r
end type
type ddlb_1 from dropdownlistbox within w_apoivc_r
end type
end forward

global type w_apoivc_r from w_inheritance
integer width = 3369
integer height = 2196
string title = "월별지불총괄현황(w_apoivc_r)"
st_2 st_2
ddlb_2 ddlb_2
st_1 st_1
ddlb_1 ddlb_1
end type
global w_apoivc_r w_apoivc_r

type variables
st_print i_print
end variables

on w_apoivc_r.create
int iCurrent
call super::create
this.st_2=create st_2
this.ddlb_2=create ddlb_2
this.st_1=create st_1
this.ddlb_1=create ddlb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.ddlb_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.ddlb_1
end on

on w_apoivc_r.destroy
call super::destroy
destroy(this.st_2)
destroy(this.ddlb_2)
destroy(this.st_1)
destroy(this.ddlb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_1.text = string(today(),"YYYY")
ddlb_2.text = string(today(),"MM")

end event

event resize;call super::resize;//
gb_2.height = this.height - 372
dw_1.height = this.height - 460

end event

type pb_save from w_inheritance`pb_save within w_apoivc_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_apoivc_r
integer width = 3191
integer taborder = 50
string dataobject = "d_apoivc_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_apoivc_r
boolean visible = false
integer x = 27
integer y = 4
integer width = 142
integer height = 116
integer taborder = 60
end type

type st_title from w_inheritance`st_title within w_apoivc_r
integer width = 1216
string text = "월별지불 총괄현황"
end type

type st_tips from w_inheritance`st_tips within w_apoivc_r
end type

type pb_compute from w_inheritance`pb_compute within w_apoivc_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_apoivc_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_apoivc_r
integer taborder = 100
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoivc_r
integer x = 2880
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_1.rowcount() < 1 then return

i_print.st_datawindow  = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 월별지불총괄현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_apoivc_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_apoivc_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_apoivc_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apoivc_r
integer x = 2688
integer taborder = 140
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date

ls_date = string(ddlb_1.text) + "/" +  string(ddlb_2.text)

dw_1.setredraw(false)
if dw_1.retrieve(ls_date) < 1 then
	dw_1.reset()
end if
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_apoivc_r
integer x = 1829
integer y = 12
integer width = 805
integer height = 204
integer taborder = 70
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_apoivc_r
integer width = 3259
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_apoivc_r
integer x = 2651
integer width = 635
end type

type st_2 from statictext within w_apoivc_r
integer x = 2496
integer y = 96
integer width = 105
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
string text = "월"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_apoivc_r
integer x = 2281
integer y = 92
integer width = 215
integer height = 872
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
string item[] = {"01","02","03","04","05","06","07","08","09","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_apoivc_r
integer x = 2139
integer y = 96
integer width = 105
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
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_apoivc_r
integer x = 1879
integer y = 92
integer width = 270
integer height = 884
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

