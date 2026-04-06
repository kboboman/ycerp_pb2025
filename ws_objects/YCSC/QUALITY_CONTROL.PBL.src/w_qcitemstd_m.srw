$PBExportHeader$w_qcitemstd_m.srw
$PBExportComments$품목기준관리(2005/06/08, 이인호)
forward
global type w_qcitemstd_m from w_inheritance
end type
end forward

global type w_qcitemstd_m from w_inheritance
integer width = 3689
integer height = 2188
string title = "품목기준관리(w_qcitemstd_m)"
end type
global w_qcitemstd_m w_qcitemstd_m

type variables
st_print  i_print
end variables

on w_qcitemstd_m.create
call super::create
end on

on w_qcitemstd_m.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 119
gb_2.height = this.height - 372

dw_1.width  = this.width  - 187
dw_1.height = this.height - 456

end event

type pb_save from w_inheritance`pb_save within w_qcitemstd_m
integer x = 3200
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_qcitemstd_m
integer x = 69
integer width = 3502
integer height = 1732
string dataobject = "d_qcitemstd_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_qcitemstd_m
boolean visible = false
integer x = 1664
integer y = 60
integer width = 480
integer height = 148
string dataobject = "d_cduom_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type st_title from w_inheritance`st_title within w_qcitemstd_m
integer x = 41
integer y = 56
integer width = 1307
integer height = 132
string text = "품목기준관리"
end type

type st_tips from w_inheritance`st_tips within w_qcitemstd_m
end type

type pb_compute from w_inheritance`pb_compute within w_qcitemstd_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_qcitemstd_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_qcitemstd_m
integer x = 3392
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_qcitemstd_m
integer x = 3008
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//w_repsuper w_print
//string ls_currcode
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//dw_2.retrieve()
//i_print.st_datawindow = dw_2
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 검사성적서 품목기준표를 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_qcitemstd_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_qcitemstd_m
integer x = 2816
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;dw_1.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_qcitemstd_m
integer x = 2624
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;long ll_row

ll_row = dw_1.insertrow(0)
dw_1.ScrollToRow(ll_row)
dw_1.object.area_no[ll_row] = gs_area
dw_1.setcolumn(ll_row)  
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_qcitemstd_m
integer x = 2432
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve(gs_area)

end event

type gb_3 from w_inheritance`gb_3 within w_qcitemstd_m
boolean visible = false
integer x = 1582
integer y = 36
integer width = 594
integer height = 204
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_qcitemstd_m
integer x = 37
integer y = 232
integer width = 3570
integer height = 1816
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_qcitemstd_m
integer x = 2405
integer width = 1198
end type

