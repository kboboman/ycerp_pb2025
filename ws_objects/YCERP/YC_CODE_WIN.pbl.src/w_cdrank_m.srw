$PBExportHeader$w_cdrank_m.srw
$PBExportComments$직급 코드관리(2003/09/26,정갑용)
forward 
global type w_cdrank_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdrank_m
end type
type dw_3 from datawindow within w_cdrank_m
end type
end forward

global type w_cdrank_m from w_inheritance
integer x = 320
integer y = 552
integer width = 3598
integer height = 2252
string title = "코드관리[직급,모듈](w_cdrank_m)"
windowstate windowstate = normal!
long backcolor = 79416533
boolean center = true
cb_3 cb_3
dw_3 dw_3
end type
global w_cdrank_m w_cdrank_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

on w_cdrank_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.dw_3
end on

on w_cdrank_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.dw_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.settransobject(sqlca)
dw_3.settransobject(sqlca)

dw_2.visible = false
dw_3.retrieve()
end event

type pb_save from w_inheritance`pb_save within w_cdrank_m
integer x = 3095
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_1.accepttext()
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdrank_m
integer x = 887
integer y = 264
integer width = 2583
integer height = 1812
string dataobject = "d_cdrank_m"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_cdrank_m
integer x = 37
integer y = 40
integer width = 1417
integer height = 132
string text = "코드관리[직급,모듈]"
end type

type st_tips from w_inheritance`st_tips within w_cdrank_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdrank_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdrank_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdrank_m
integer x = 3287
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdrank_m
integer x = 2903
integer taborder = 110
boolean enabled = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdrank_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdrank_m
integer x = 2711
integer taborder = 130
boolean enabled = false
end type

event pb_delete::clicked;call super::clicked;dw_1.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_cdrank_m
integer x = 2519
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;dw_1.insertrow(0)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdrank_m
integer x = 2327
integer taborder = 140
end type

event pb_retrieve::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_1.retrieve('%')

end event

type gb_3 from w_inheritance`gb_3 within w_cdrank_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdrank_m
integer x = 27
integer y = 224
integer width = 3479
integer height = 1876
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdrank_m
integer x = 2304
integer width = 1198
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdrank_m
integer x = 2034
integer y = 24
integer width = 128
integer height = 88
integer taborder = 60
string dataobject = "d_cdbank_r"
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_cdrank_m
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

type dw_3 from datawindow within w_cdrank_m
integer x = 59
integer y = 264
integer width = 814
integer height = 1812
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdrank_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long   ll_row
string ls_cd

ls_cd  = this.object.type_cd[currentrow]
ll_row = dw_1.retrieve( ls_cd )
end event

