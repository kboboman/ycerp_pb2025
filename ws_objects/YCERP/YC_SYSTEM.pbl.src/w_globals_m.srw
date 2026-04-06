$PBExportHeader$w_globals_m.srw
$PBExportComments$GLOBALS DATA관리(2001/07/14,이인호)
forward 
global type w_globals_m from w_inheritance
end type
type mle_1 from multilineedit within w_globals_m
end type
end forward

global type w_globals_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4407
integer height = 1836
string title = "공유데이터 관리(w_globals_m)"
windowstate windowstate = normal!
long backcolor = 79220952
mle_1 mle_1
end type
global w_globals_m w_globals_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.SetTransObject(SQLCA)
dw_1.retrieve()


end event

on w_globals_m.create
int iCurrent
call super::create
this.mle_1=create mle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
end on

on w_globals_m.destroy
call super::destroy
destroy(this.mle_1)
end on

type pb_save from w_inheritance`pb_save within w_globals_m
integer x = 3909
integer y = 76
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_globals_m
integer x = 50
integer width = 4256
integer height = 1364
string dataobject = "d_globals_m"
boolean vscrollbar = false
boolean hsplitscroll = true
borderstyle borderstyle = styleshadowbox!
end type

type st_title from w_inheritance`st_title within w_globals_m
integer width = 1394
string text = "공유데이터 관리"
end type

type st_tips from w_inheritance`st_tips within w_globals_m
end type

type pb_compute from w_inheritance`pb_compute within w_globals_m
integer x = 3241
integer y = 80
integer width = 603
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "프린터 검색"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;call super::clicked;mle_1.text = printgetprinters()
end event

type pb_print_part from w_inheritance`pb_print_part within w_globals_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_globals_m
integer x = 4110
integer y = 76
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_globals_m
boolean visible = false
integer x = 1097
integer y = 580
end type

type pb_cancel from w_inheritance`pb_cancel within w_globals_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_globals_m
boolean visible = false
integer x = 1723
integer y = 72
end type

type pb_insert from w_inheritance`pb_insert within w_globals_m
boolean visible = false
integer x = 1531
integer y = 72
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_globals_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_globals_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_globals_m
integer x = 27
integer y = 236
integer width = 4311
integer height = 1464
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_globals_m
integer x = 3872
integer y = 32
integer width = 466
integer height = 208
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_globals_m
boolean visible = false
integer x = 1243
integer y = 220
integer width = 50
integer height = 44
string dataobject = "d_cdcountry_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type mle_1 from multilineedit within w_globals_m
integer x = 1390
integer y = 300
integer width = 2894
integer height = 236
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

