$PBExportHeader$w_ipsuppgroup_m.srw
$PBExportComments$거래처별 그룹관리 (2001/07/24, 이인호)
forward 
global type w_ipsuppgroup_m from w_inheritance
end type
end forward

global type w_ipsuppgroup_m from w_inheritance
integer x = 750
integer y = 4
integer width = 2021
integer height = 2284
string title = "구매처별 그룹관리(w_ipsuppgroup_m)"
end type
global w_ipsuppgroup_m w_ipsuppgroup_m

type variables
st_print  i_print
date id_start, id_end
end variables

on w_ipsuppgroup_m.create
call super::create
end on

on w_ipsuppgroup_m.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.insertrow(1)
end event

type pb_save from w_inheritance`pb_save within w_ipsuppgroup_m
integer x = 1559
integer y = 64
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipsuppgroup_m
integer y = 532
integer width = 1829
integer height = 1612
string dataobject = "d_ipsuppgroup_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ipsuppgroup_m
integer x = 37
integer y = 40
integer width = 1394
string text = "구매처별 그룹관리"
end type

type st_tips from w_inheritance`st_tips within w_ipsuppgroup_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipsuppgroup_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipsuppgroup_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipsuppgroup_m
integer x = 1751
integer y = 64
integer width = 183
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipsuppgroup_m
boolean visible = false
integer x = 2939
integer y = 60
end type

type pb_cancel from w_inheritance`pb_cancel within w_ipsuppgroup_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_ipsuppgroup_m
integer x = 1742
integer y = 308
end type

event pb_delete::clicked;dw_1.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_ipsuppgroup_m
integer x = 1550
integer y = 308
end type

event pb_insert::clicked;long ll_row
string ls_supp

 
ls_supp = dw_2.object.supp_no[1]

if isnull(ls_supp) or trim(ls_supp) = '' then 
	messagebox("확인", "구매처를 선택하십시요")
	return
end if
ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.object.supp_no[ll_row] = ls_supp

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ipsuppgroup_m
integer x = 1125
integer y = 308
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_2.accepttext()

string ls_supp

ls_supp = dw_2.object.supp_no [1]
if dw_1.retrieve(ls_supp) < 1 then
	messagebox('확인','자료가 없읍니다.',information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipsuppgroup_m
integer x = 37
integer y = 264
integer width = 1906
integer height = 204
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ipsuppgroup_m
integer x = 37
integer y = 472
integer width = 1906
integer height = 1692
end type

type gb_1 from w_inheritance`gb_1 within w_ipsuppgroup_m
integer x = 1518
integer y = 20
integer width = 430
end type

type dw_2 from w_inheritance`dw_2 within w_ipsuppgroup_m
integer x = 78
integer y = 340
integer width = 1019
integer height = 100
string dataobject = "d_whsupp_s"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;dw_1.reset()

end event

