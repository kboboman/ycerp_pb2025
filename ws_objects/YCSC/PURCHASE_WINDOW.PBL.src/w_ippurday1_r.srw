$PBExportHeader$w_ippurday1_r.srw
$PBExportComments$구매일보(1998/10/13,곽용덕)
forward
global type w_ippurday1_r from w_inheritance
end type
end forward

global type w_ippurday1_r from w_inheritance
integer width = 4695
integer height = 2896
string title = "구매일보 현황(w_ippurday1_r)"
end type
global w_ippurday1_r w_ippurday1_r

type variables
gs_codere_str  ist_code
end variables

forward prototypes
public subroutine wf_print (string arg_flag, date arg_date)
end prototypes

public subroutine wf_print (string arg_flag, date arg_date);long   ll_row, ll_cnt, ll_insertrow
string ls_class

ll_row = dw_2.rowcount()

CHOOSE CASE arg_flag
	CASE 'S'
		ls_class = "상품"
	CASE 'W'
		ls_class = "원자재"
	CASE 'B'
		ls_class = "부자재"
	CASE 'Y'
		ls_class = "외주가공"
END CHOOSE

dw_1.settransobject(sqlca)
dw_1.setredraw(false)
for ll_cnt = 1 to ll_row
	ll_insertrow  = dw_1.insertrow(0)
	dw_1.object.item_class[ll_insertrow] = ls_class
	dw_1.object.in_date[ll_insertrow]    = arg_date
	dw_1.object.cust_name[ll_insertrow]  = dw_2.object.supp_supp_name[ll_cnt]
	dw_1.object.group_name[ll_insertrow] = trim(dw_2.object.inspdet_insp_no[ll_cnt])
	dw_1.object.item_name[ll_insertrow]  = dw_2.object.groupitem_item_name[ll_cnt]
	dw_1.object.seq[ll_insertrow]        = dw_2.object.inspdet_oi_no[ll_cnt]
	dw_1.object.qa[ll_insertrow]         = dw_2.object.qa[ll_cnt]
	dw_1.object.ea[ll_insertrow]         = dw_2.object.uom[ll_cnt]
	dw_1.object.qty[ll_insertrow]        = dw_2.object.comqty[ll_cnt]
	dw_1.object.cost[ll_insertrow]       = dw_2.object.price[ll_cnt]
	dw_1.object.amount[ll_insertrow]     = dw_2.object.ori_amount[ll_cnt]
//	dw_1.object.dept[ll_insertrow]       = dw_2.object.[ll_cnt]
//	dw_1.object.acct_desc[ll_insertrow]  = dw_2.object.[ll_cnt]
	dw_1.object.rem[ll_insertrow]        = dw_2.object.rem[ll_cnt]
next

dw_1.groupcalc()
dw_1.setredraw(true)

end subroutine

on w_ippurday1_r.create
call super::create
end on

on w_ippurday1_r.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 472

dw_1.width  = this.width  - 165
dw_1.height = this.height - 540

end event

type pb_save from w_inheritance`pb_save within w_ippurday1_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ippurday1_r
integer x = 59
integer y = 388
integer width = 4530
integer height = 2356
string dataobject = "d_apoi_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_ippurday1_r
integer x = 1413
integer y = 60
integer width = 142
integer height = 104
string dataobject = "d_iopurrcpt_h2"
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_ippurday1_r
integer width = 1289
string text = "구매일보 현황"
end type

type st_tips from w_inheritance`st_tips within w_ippurday1_r
end type

type pb_compute from w_inheritance`pb_compute within w_ippurday1_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ippurday1_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ippurday1_r
integer x = 4407
integer y = 56
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurday1_r
integer x = 4210
integer y = 56
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 구매일보 보고서를 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=83'
opensheetwithparm(w_print, l_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_ippurday1_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_ippurday1_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_ippurday1_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ippurday1_r
integer x = 4018
integer y = 56
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where, ls_flag, ls_area, ls_sel
date   ld_date
long   ll_count

openwithparm(w_whapoi_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

ls_flag = ist_code.flag
ld_date = date(ist_code.start_no)
ls_area = trim(ist_code.end_no)
ls_sel  = ist_code.sel

if dw_2.retrieve( ls_flag, ld_date, ls_area, ls_sel ) < 1 then
	messagebox("확인","해당 일자에는 자료가 없습니다")
	return
end if

wf_print(ls_flag, ld_date)


end event

type gb_3 from w_inheritance`gb_3 within w_ippurday1_r
boolean visible = false
integer x = 1161
integer y = 4
integer width = 1618
integer height = 208
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_ippurday1_r
integer y = 344
integer width = 4590
integer height = 2424
end type

type gb_1 from w_inheritance`gb_1 within w_ippurday1_r
integer x = 3991
integer y = 16
integer width = 631
end type

