$PBExportHeader$w_cdbitem_m.srw
$PBExportComments$조업자재 코드관리(1998/03/18,곽용덕)
forward
global type w_cdbitem_m from w_inheritance
end type
end forward

global type w_cdbitem_m from w_inheritance
integer width = 2190
integer height = 2028
string title = "조업자재 코드관리(w_cdbitem_m)"
end type
global w_cdbitem_m w_cdbitem_m

type variables
st_print  i_print
end variables

on w_cdbitem_m.create
call super::create
end on

on w_cdbitem_m.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

end event

type pb_save from w_inheritance`pb_save within w_cdbitem_m
integer x = 1819
integer y = 900
end type

event pb_save::clicked;//long ll_row
//int ll_no
//dwitemstatus l_status

dw_1.accepttext()
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cdbitem_m
integer width = 1701
integer height = 1576
string dataobject = "d_cdbitem_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_cdbitem_m
boolean visible = false
integer x = 2171
integer y = 52
integer width = 119
integer height = 148
string dataobject = "d_cdbitem_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type st_title from w_inheritance`st_title within w_cdbitem_m
integer y = 40
integer width = 1449
string text = "조업자재 코드관리"
end type

type st_tips from w_inheritance`st_tips within w_cdbitem_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdbitem_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdbitem_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdbitem_m
integer x = 1819
integer y = 1048
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdbitem_m
integer x = 1819
integer y = 752
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_2.retrieve()
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 조업자재 코드내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdbitem_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdbitem_m
integer x = 1819
integer y = 604
end type

event pb_delete::clicked;long ll_no, ll_row

dw_1.accepttext()
if dw_1.getrow() < 1 then return
ll_no = dw_1.object.item_no[dw_1.getrow()]

select count(*) into :ll_row from binitem where item_no = :ll_no;

if ll_row > 0 then
	MessageBox("확인", "이자재는 일보에서 이미 사용중입니다. 삭제할 수 없습니다!")
	return
end if

dw_1.deleterow(dw_1.getrow())

dw_1.accepttext()

if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if


end event

type pb_insert from w_inheritance`pb_insert within w_cdbitem_m
integer x = 1819
integer y = 456
end type

event pb_insert::clicked;long ll_row
string ls_currcode

dw_1.accepttext()
ll_row = dw_1.insertrow(0)
dw_1.ScrollToRow(ll_row)
dw_1.object.item_no[ll_row] = ll_row
dw_1.setcolumn('item_name')
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdbitem_m
integer x = 1819
integer y = 308
end type

event pb_retrieve::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdbitem_m
boolean visible = false
integer x = 1632
integer y = 12
integer width = 594
integer height = 204
end type

type gb_2 from w_inheritance`gb_2 within w_cdbitem_m
integer y = 232
integer width = 2002
integer height = 1660
end type

type gb_1 from w_inheritance`gb_1 within w_cdbitem_m
boolean visible = false
integer x = 1829
integer y = 56
integer width = 1001
end type

