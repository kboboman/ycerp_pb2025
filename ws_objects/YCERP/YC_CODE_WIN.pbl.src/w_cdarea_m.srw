$PBExportHeader$w_cdarea_m.srw
$PBExportComments$사업장 코드관리(2003/09/26,정갑용)
forward 
global type w_cdarea_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdarea_m
end type
end forward

global type w_cdarea_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4407
integer height = 2404
string title = "사업장 관리(w_cdarea_m)"
boolean maxbox = false
long backcolor = 79416533
boolean center = true
cb_3 cb_3
end type
global w_cdarea_m w_cdarea_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

on w_cdarea_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
end on

on w_cdarea_m.destroy
call super::destroy
destroy(this.cb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.settransobject(sqlca)

//dw_1.object.area_no.tabsequence   = 0
//dw_1.object.area_name.tabsequence = 0

end event

event resize;call super::resize;//

gb_2.width  = this.width  - 114
gb_2.height = this.height - 392

dw_1.width  = this.width  - 201
dw_1.height = this.height - 488

end event

type pb_save from w_inheritance`pb_save within w_cdarea_m
integer x = 3913
integer y = 64
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdarea_m
integer x = 73
integer y = 328
integer width = 4206
integer height = 1912
string dataobject = "d_cdarea_m"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_cdarea_m
integer width = 1070
string text = "사업장 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdarea_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdarea_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdarea_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdarea_m
integer x = 4105
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdarea_m
integer x = 3721
integer y = 64
integer taborder = 110
boolean enabled = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdarea_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdarea_m
integer x = 3529
integer y = 64
integer taborder = 130
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_cdarea_m
integer x = 3337
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;//
long ll_row

ll_row = dw_1.insertrow(0)

dw_1.scrolltorow( ll_row )
dw_1.setcolumn( "area_no" )
dw_1.setfocus( )

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdarea_m
integer x = 3145
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdarea_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdarea_m
integer x = 27
integer y = 264
integer width = 4293
integer height = 2008
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
string text = "실제사업장이 ~"Y~" 이면 사용자 관리에서 출고의뢰접수자 지정에 실제 사업장이 Y 인것만 나옴"
end type

type gb_1 from w_inheritance`gb_1 within w_cdarea_m
integer x = 3122
integer y = 24
integer width = 1198
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdarea_m
boolean visible = false
integer x = 1211
integer y = 56
integer width = 187
integer height = 144
integer taborder = 60
string dataobject = "d_cdbank_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_cdarea_m
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

