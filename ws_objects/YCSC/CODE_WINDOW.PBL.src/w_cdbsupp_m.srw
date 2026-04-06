$PBExportHeader$w_cdbsupp_m.srw
$PBExportComments$조업자재 구매처(1999/06/07,이인호)
forward
global type w_cdbsupp_m from w_inheritance
end type
end forward

global type w_cdbsupp_m from w_inheritance
integer x = 0
integer y = 0
integer width = 4370
integer height = 2580
string title = "조업자재 거래처관리(w_cdbsupp_m)"
end type
global w_cdbsupp_m w_cdbsupp_m

type variables
st_print  i_print
end variables

on w_cdbsupp_m.create
call super::create
end on

on w_cdbsupp_m.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 178
gb_2.height = newheight - 424

dw_1.width  = newwidth  - 265
dw_1.height = newheight - 524

end event

type pb_save from w_inheritance`pb_save within w_cdbsupp_m
integer x = 3840
integer y = 56
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cdbsupp_m
integer x = 87
integer y = 296
integer width = 4105
integer height = 2056
string dataobject = "d_cdbsupp_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_cdbsupp_m
integer x = 1810
integer y = 76
integer width = 160
integer height = 108
string dataobject = "d_cdbsupp_r"
boolean vscrollbar = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type st_title from w_inheritance`st_title within w_cdbsupp_m
integer x = 55
integer width = 1568
string text = "조업자재 거래처관리"
end type

type st_tips from w_inheritance`st_tips within w_cdbsupp_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdbsupp_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdbsupp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdbsupp_m
integer x = 4032
integer y = 56
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdbsupp_m
integer x = 3648
integer y = 56
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_2.retrieve()
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 조업자재거래처내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdbsupp_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdbsupp_m
integer x = 3456
integer y = 56
end type

event pb_delete::clicked;long   ll_row
string ls_suppno

dw_1.accepttext()
if dw_1.getrow() < 1 then return

ls_suppno = trim(dw_1.object.supp_no[dw_1.getrow()])

SELECT count(*) INTO :ll_row FROM binitem WHERE supp_no = :ls_suppno;

if ll_row > 0 then
	MessageBox("확인", "이거래처는 일보에서 이미 사용중입니다. 삭제할 수 없습니다!")
	return
end if

dw_1.deleterow(0)
dw_1.accepttext()

if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if


end event

type pb_insert from w_inheritance`pb_insert within w_cdbsupp_m
integer x = 3264
integer y = 56
end type

event pb_insert::clicked;long   ll_row
string ls_suppno

dw_1.accepttext()
if dw_1.getrow() < 1 then
	ll_row = dw_1.insertrow(0)
else
	ll_row = dw_1.insertrow(dw_1.getrow())
end if

SELECT max(supp_no) INTO :ls_suppno  FROM bsupp;
if isnull(ls_suppno) then
	ls_suppno = "001"
else 
	ls_suppno = string(integer(ls_suppno) + 1, "000")
end if

dw_1.ScrollToRow(ll_row)
dw_1.object.supp_no[ll_row] = ls_suppno
dw_1.setcolumn('supp_name')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdbsupp_m
integer x = 3072
integer y = 56
end type

event pb_retrieve::clicked;dw_1.retrieve()
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
	
end event

type gb_3 from w_inheritance`gb_3 within w_cdbsupp_m
boolean visible = false
integer x = 1632
integer y = 12
integer width = 594
integer height = 204
end type

type gb_2 from w_inheritance`gb_2 within w_cdbsupp_m
integer x = 50
integer y = 236
integer width = 4192
integer height = 2156
integer textsize = -10
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdbsupp_m
integer x = 3045
integer y = 16
integer width = 1198
end type

