$PBExportHeader$w_cdpattern_m.srw
$PBExportComments$공정패턴관리(1998/08/25,곽용덕)
forward
global type w_cdpattern_m from w_inheritance
end type
end forward

global type w_cdpattern_m from w_inheritance
integer width = 2743
integer height = 2140
string title = "패턴관리(w_cdpattern_m)"
boolean controlmenu = false
windowstate windowstate = normal!
end type
global w_cdpattern_m w_cdpattern_m

on w_cdpattern_m.create
call super::create
end on

on w_cdpattern_m.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if gs_userid = "1999010s" then
	dw_2.object.bigo.TabSequence = 40
else
	dw_2.object.bigo.TabSequence = 0
end if

dw_2.retrieve()
dw_1.visible = false
end event

type pb_save from w_inheritance`pb_save within w_cdpattern_m
integer x = 2254
integer y = 80
end type

event pb_save::clicked;wf_update1(dw_2, 'Y')

end event

type dw_1 from w_inheritance`dw_1 within w_cdpattern_m
integer x = 855
integer y = 92
integer width = 123
integer height = 88
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_cdpattern_m
integer x = 59
integer y = 320
integer width = 2583
integer height = 1680
string dataobject = "d_cdpattern_m"
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;if row < 1 then return
this.scrolltorow(row)

end event

type st_title from w_inheritance`st_title within w_cdpattern_m
integer width = 782
string text = "패턴관리"
end type

type st_tips from w_inheritance`st_tips within w_cdpattern_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdpattern_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdpattern_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdpattern_m
integer x = 2450
integer y = 80
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdpattern_m
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdpattern_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdpattern_m
integer x = 2057
integer y = 80
end type

event pb_delete::clicked;long ll_rowcount,k

dw_2.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_cdpattern_m
integer x = 1861
integer y = 80
end type

event pb_insert::clicked;long ll_row,ll_pat 

dw_2.accepttext()
dw_2.setredraw(false)
ll_row = dw_2.insertrow(dw_2.getrow() + 1)

dw_2.object.pat_no[ll_row] = dw_2.object.pat_no[ll_row - 1]
dw_2.groupcalc()
dw_2.scrolltorow(ll_row)
dw_2.setredraw(true)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdpattern_m
integer x = 1664
integer y = 80
end type

event pb_retrieve::clicked;call super::clicked;dw_2.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdpattern_m
integer x = 37
integer y = 272
integer width = 2629
integer height = 1744
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_cdpattern_m
boolean visible = false
integer y = 8
integer width = 1061
integer height = 152
integer textsize = -8
end type

type gb_1 from w_inheritance`gb_1 within w_cdpattern_m
integer x = 1614
integer y = 28
integer width = 1051
integer height = 224
end type

