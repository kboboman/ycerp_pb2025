$PBExportHeader$w_customer_opem.srw
$PBExportComments$거래처마스터금액과 원장금액비교
forward
global type w_customer_opem from w_inheritance
end type
type cbx_1 from checkbox within w_customer_opem
end type
end forward

global type w_customer_opem from w_inheritance
integer width = 3401
integer height = 2228
string title = "거래처마스터금액과 원장금액비교"
cbx_1 cbx_1
end type
global w_customer_opem w_customer_opem

on w_customer_opem.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
end on

on w_customer_opem.destroy
call super::destroy
destroy(this.cbx_1)
end on

event resize;call super::resize;//
gb_2.width  = this.width  - 160
gb_2.height = this.height - 404

dw_1.width  = this.width  - 242
dw_1.height = this.height - 516

end event

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

end event

type pb_save from w_inheritance`pb_save within w_customer_opem
integer x = 2875
end type

event pb_save::clicked;long ll_row, ll_cnt

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
ll_cnt = dw_1.rowcount()

for ll_row = 1 to ll_cnt
	dw_1.object.customer_balance_amt[ll_row] = dw_1.object.eom_amt[ll_row]
next

//
//wf_update1(dw_1,"Y")
//

end event

type dw_1 from w_inheritance`dw_1 within w_customer_opem
integer x = 87
integer y = 300
integer width = 3159
integer height = 1712
string dataobject = "d_opeom_customer_check"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_customer_opem
boolean visible = false
integer x = 974
integer y = 12
boolean enabled = false
boolean vscrollbar = false
boolean resizable = true
end type

type st_title from w_inheritance`st_title within w_customer_opem
integer x = 46
integer y = 52
integer width = 1993
integer height = 128
string text = "거래처 마스터금액과 원장금액비교"
end type

type st_tips from w_inheritance`st_tips within w_customer_opem
end type

type pb_compute from w_inheritance`pb_compute within w_customer_opem
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_customer_opem
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_customer_opem
integer x = 3067
end type

event pb_close::clicked;call super::clicked;//
close(parent)
end event

type pb_print from w_inheritance`pb_print within w_customer_opem
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_customer_opem
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_customer_opem
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_customer_opem
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_customer_opem
integer x = 2688
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_year
ls_year = string(today(), 'yyyy')

dw_1.reset()
dw_1.retrieve( integer(ls_year) )

end event

type gb_3 from w_inheritance`gb_3 within w_customer_opem
boolean visible = false
integer x = 1655
integer y = 652
integer width = 297
integer height = 96
end type

type gb_2 from w_inheritance`gb_2 within w_customer_opem
integer x = 46
integer width = 3241
long textcolor = 0
string text = " customer_balance_amt <> eom_amt "
end type

type gb_1 from w_inheritance`gb_1 within w_customer_opem
integer x = 2665
integer width = 622
integer height = 208
end type

type cbx_1 from checkbox within w_customer_opem
integer x = 2167
integer y = 92
integer width = 457
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "필터"
end type

event clicked;//
if this.checked = true then
	 dw_1.setfilter(" customer_balance_amt <> eom_amt ")
	 dw_1.filter()
else
	 dw_1.setfilter("")
	 dw_1.filter()
end if

end event

