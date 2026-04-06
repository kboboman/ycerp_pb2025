$PBExportHeader$w_cdgroup_m.srw
$PBExportComments$물품그룹명입력(1999/06/01,이인호)
forward
global type w_cdgroup_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdgroup_m
end type
type cbx_1 from checkbox within w_cdgroup_m
end type
type gb_4 from groupbox within w_cdgroup_m
end type
end forward

global type w_cdgroup_m from w_inheritance
integer x = 320
integer y = 552
integer width = 2423
integer height = 1780
string title = "물품그룹관리(w_cdgroup_m)"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
windowstate windowstate = normal!
boolean center = true
cb_3 cb_3
cbx_1 cbx_1
gb_4 gb_4
end type
global w_cdgroup_m w_cdgroup_m

type variables
boolean ib_check
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.retrieve()
dw_1.setfilter('isNull( item_group )')
dw_1.filter()

if gf_permission('물품그룹사용여부관리', gs_userid) = 'Y' then	
else
	pb_save.enabled = false
end if
end event

on w_cdgroup_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cbx_1=create cbx_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.gb_4
end on

on w_cdgroup_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cbx_1)
destroy(this.gb_4)
end on

type pb_save from w_inheritance`pb_save within w_cdgroup_m
integer x = 1943
integer y = 48
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()
wf_update1(dw_1, "Y")

end event

type dw_1 from w_inheritance`dw_1 within w_cdgroup_m
integer x = 50
integer y = 264
integer width = 2281
integer height = 1360
string dataobject = "d_cdgroup_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_cdgroup_m
boolean visible = false
integer x = 1321
integer y = 52
integer width = 187
integer height = 144
integer taborder = 60
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdgroup_m
integer width = 1138
string text = "물품그룹관리"
end type

type st_tips from w_inheritance`st_tips within w_cdgroup_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdgroup_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdgroup_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdgroup_m
integer x = 2139
integer y = 48
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdgroup_m
boolean visible = false
integer x = 951
integer y = 556
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdgroup_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdgroup_m
boolean visible = false
integer x = 951
integer y = 412
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_cdgroup_m
boolean visible = false
integer x = 951
integer y = 268
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdgroup_m
boolean visible = false
integer taborder = 140
end type

type gb_3 from w_inheritance`gb_3 within w_cdgroup_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdgroup_m
integer x = 27
integer y = 216
integer width = 2336
integer height = 1428
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdgroup_m
boolean visible = false
integer x = 1134
integer y = 244
integer width = 233
integer height = 636
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cdgroup_m
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

type cbx_1 from checkbox within w_cdgroup_m
integer x = 1234
integer y = 84
integer width = 631
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
string text = "그룹명이없는것만"
boolean checked = true
end type

event clicked;//
if this.checked = true then
	dw_1.setfilter('isNull( item_group )')
	dw_1.filter()
else
	dw_1.setfilter('')
	dw_1.filter()
end if

end event

type gb_4 from groupbox within w_cdgroup_m
integer x = 1897
integer y = 8
integer width = 457
integer height = 200
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

