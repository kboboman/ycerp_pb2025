$PBExportHeader$w_inaudittype_m.srw
$PBExportComments$입출고 유형관리(1999/05/24, 이인호)
forward
global type w_inaudittype_m from w_inheritance
end type
type cb_3 from commandbutton within w_inaudittype_m
end type
type dw_3 from datawindow within w_inaudittype_m
end type
end forward

global type w_inaudittype_m from w_inheritance
integer x = 937
integer y = 236
integer width = 2368
integer height = 2056
string title = "입출고 유형관리(w_inaudittye_m)"
windowstate windowstate = normal!
boolean center = true
cb_3 cb_3
dw_3 dw_3
end type
global w_inaudittype_m w_inaudittype_m

type variables
boolean ib_check
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_3.SetTransObject(SQLCA)

if gs_userid = "1999010s" then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

dw_1.retrieve( "I" )
dw_3.retrieve( "R" )
end event

on w_inaudittype_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.dw_3
end on

on w_inaudittype_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.dw_3)
end on

event resize;call super::resize;//this.width  = 1445
//
//gb_2.width  = this.width  - 115
//gb_2.height = this.height - 308
//
//dw_1.width  = this.width  - 375
//dw_1.height = this.height - 388
//
end event

type pb_save from w_inheritance`pb_save within w_inaudittype_m
integer x = 1870
integer y = 44
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_inaudittype_m
integer x = 73
integer width = 1070
integer height = 1596
string dataobject = "d_inaudittype_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_inaudittype_m
integer x = 1074
integer y = 8
integer width = 110
integer height = 88
integer taborder = 60
string dataobject = "d_cdcolor_r"
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_inaudittype_m
integer x = 46
integer y = 48
integer width = 1083
integer height = 132
string text = "입출고 유형관리"
end type

type st_tips from w_inheritance`st_tips within w_inaudittype_m
end type

type pb_compute from w_inheritance`pb_compute within w_inaudittype_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_inaudittype_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_inaudittype_m
integer x = 2071
integer y = 44
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_inaudittype_m
boolean visible = false
integer x = 951
integer y = 556
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_inaudittype_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_inaudittype_m
integer x = 1678
integer y = 44
integer taborder = 130
end type

event pb_delete::clicked;string ls_color_code, ls_color_check, ls_color
int    li_count

if dw_1.rowcount() < 1 then return	


end event

type pb_insert from w_inheritance`pb_insert within w_inaudittype_m
integer x = 1486
integer y = 44
integer taborder = 150
end type

event pb_insert::clicked;dw_1.insertrow(0)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_inaudittype_m
integer x = 1289
integer y = 44
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve( "I" )
dw_3.retrieve( "R" )
end event

type gb_3 from w_inheritance`gb_3 within w_inaudittype_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_inaudittype_m
integer x = 41
integer width = 2249
integer height = 1684
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_inaudittype_m
integer x = 1248
integer y = 4
integer width = 1042
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_inaudittype_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type dw_3 from datawindow within w_inaudittype_m
integer x = 1175
integer y = 288
integer width = 1070
integer height = 1596
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_inaudittype_m"
boolean vscrollbar = true
boolean livescroll = true
end type

