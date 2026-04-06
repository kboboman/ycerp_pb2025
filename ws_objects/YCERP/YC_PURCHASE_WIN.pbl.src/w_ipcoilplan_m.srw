$PBExportHeader$w_ipcoilplan_m.srw
$PBExportComments$원재료 구매계획(2002/06/21, 이인호)
forward 
global type w_ipcoilplan_m from w_inheritance
end type
type ddlb_1 from dropdownlistbox within w_ipcoilplan_m
end type
type ddlb_2 from dropdownlistbox within w_ipcoilplan_m
end type
type ddlb_3 from dropdownlistbox within w_ipcoilplan_m
end type
end forward

global type w_ipcoilplan_m from w_inheritance
integer x = 5
integer y = 136
integer width = 4590
integer height = 2780
string title = "원재료 구매계획(w_ipcoilplan_m)"
ddlb_1 ddlb_1
ddlb_2 ddlb_2
ddlb_3 ddlb_3
end type
global w_ipcoilplan_m w_ipcoilplan_m

type variables
st_print i_print
string is_flag
end variables

on w_ipcoilplan_m.create
int iCurrent
call super::create
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.ddlb_3=create ddlb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_1
this.Control[iCurrent+2]=this.ddlb_2
this.Control[iCurrent+3]=this.ddlb_3
end on

on w_ipcoilplan_m.destroy
call super::destroy
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.ddlb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_1.text = string(today(),'yyyy')
ddlb_2.text = string(today(),'mm')
dw_2.sharedata(dw_1)
dw_1.visible = false
end event

event resize;call super::resize;//
gb_3.width  = this.width  - 119
gb_3.height = this.height - 384

dw_2.width  = this.width  - 197
dw_2.height = this.height - 480


end event

type pb_save from w_inheritance`pb_save within w_ipcoilplan_m
integer x = 4082
integer y = 64
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_2, 'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_ipcoilplan_m
integer x = 1175
integer y = 12
integer width = 146
integer height = 100
integer taborder = 60
string dataobject = "d_ippurplan_r"
boolean hscrollbar = false
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_ipcoilplan_m
integer x = 50
integer y = 52
integer width = 1216
integer height = 144
string text = "원재료 구매계획"
end type

type st_tips from w_inheritance`st_tips within w_ipcoilplan_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipcoilplan_m
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipcoilplan_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipcoilplan_m
integer x = 4288
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipcoilplan_m
integer x = 3890
integer y = 64
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_2.getrow() <= 0 THEN
   RETURN
END IF

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 원재료 구매 계획를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_ipcoilplan_m
integer x = 3698
integer y = 64
integer taborder = 130
boolean bringtotop = true
end type

event pb_cancel::clicked;dw_2.reset()
end event

type pb_delete from w_inheritance`pb_delete within w_ipcoilplan_m
integer x = 3506
integer y = 64
integer taborder = 140
end type

event pb_delete::clicked;long ll_row

ll_row = dw_2.getrow()

if ll_row < 1 then return

dw_2.deleterow(ll_row)
end event

type pb_insert from w_inheritance`pb_insert within w_ipcoilplan_m
integer x = 3314
integer y = 64
integer taborder = 160
end type

event pb_insert::clicked;long ll_row

if dw_2.rowcount() <  1 then
else
end if
ll_row = dw_2.insertrow(0)

dw_2.object.plan_year[ll_row] = ddlb_1.text
dw_2.object.plan_mon[ll_row] = ddlb_2.text
dw_2.object.plan_flag[ll_row] = is_flag
dw_2.object.user_id[ll_row] = gs_userid
if ll_row = 1 then
	dw_2.object.seq[ll_row] = 1
else
	dw_2.object.seq[ll_row] = dw_2.object.seq[ll_row] + 1
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ipcoilplan_m
integer x = 3118
integer y = 64
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.retrieve(ddlb_1.text, ddlb_2.text, is_flag)
end event

type gb_3 from w_inheritance`gb_3 within w_ipcoilplan_m
integer x = 41
integer y = 244
integer width = 4471
integer height = 2396
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_ipcoilplan_m
integer x = 2107
integer y = 16
integer width = 951
integer height = 212
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_ipcoilplan_m
integer x = 3077
integer y = 16
integer width = 1435
integer height = 212
integer textsize = -11
end type

type dw_2 from w_inheritance`dw_2 within w_ipcoilplan_m
integer x = 78
integer y = 308
integer width = 4393
integer height = 2300
integer taborder = 70
string dataobject = "d_ippurplan_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_1 from dropdownlistbox within w_ipcoilplan_m
integer x = 2149
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

event selectionchanged;dw_2.setredraw(false)
dw_2.reset()
dw_2.setredraw(true)

end event

type ddlb_2 from dropdownlistbox within w_ipcoilplan_m
integer x = 2427
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
boolean vscrollbar = true
string item[] = {"01","02","03","04","05","06","07","08","09","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_2.setredraw(false)
dw_2.reset()
dw_2.setredraw(true)

end event

type ddlb_3 from dropdownlistbox within w_ipcoilplan_m
integer x = 2651
integer y = 92
integer width = 366
integer height = 268
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
string item[] = {"GI COIL","칼라 COIL","AL COIL"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_flag = 'G'
	CASE 2
		is_flag = 'C'
	CASE 3
		is_flag = 'A'
END CHOOSE

dw_2.setredraw(false)
dw_2.reset()
dw_2.setredraw(true)

end event

