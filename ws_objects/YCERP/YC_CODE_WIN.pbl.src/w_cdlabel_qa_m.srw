$PBExportHeader$w_cdlabel_qa_m.srw
$PBExportComments$유압반 Label QA(090205)
forward 
global type w_cdlabel_qa_m from w_inheritance
end type
end forward

global type w_cdlabel_qa_m from w_inheritance
integer width = 3639
integer height = 2168
string title = "유압반 Label 규격 관리(w_cdlabel_QA_m)"
end type
global w_cdlabel_qa_m w_cdlabel_qa_m

type variables
st_print  i_print
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

dw_1.retrieve()

end event

on w_cdlabel_qa_m.create
call super::create
end on

on w_cdlabel_qa_m.destroy
call super::destroy
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

end event

type pb_save from w_inheritance`pb_save within w_cdlabel_qa_m
integer x = 2213
integer y = 56
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//
wf_update1(dw_1,"Y")


end event

type dw_1 from w_inheritance`dw_1 within w_cdlabel_qa_m
integer x = 37
integer y = 432
integer width = 3525
integer height = 1588
string dataobject = "d_cdlabel_qa_m"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_cdlabel_qa_m
integer x = 41
integer y = 20
integer width = 1522
integer height = 140
string text = "유압반 Label 규격 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdlabel_qa_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdlabel_qa_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdlabel_qa_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdlabel_qa_m
integer x = 2405
integer y = 56
integer width = 183
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdlabel_qa_m
boolean visible = false
integer x = 1797
integer y = 72
integer taborder = 110
end type

event pb_print::clicked;//w_repsuper w_print
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//dw_3.retrieve()
//i_print.st_datawindow = dw_3
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 작업장 내역을 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=120'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdlabel_qa_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdlabel_qa_m
integer x = 2025
integer y = 56
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;long  ll_row  

dw_1.AcceptText()

ll_row  =  dw_1.Getrow()

dw_1.deleterow(ll_row)

end event

type pb_insert from w_inheritance`pb_insert within w_cdlabel_qa_m
integer x = 1833
integer y = 56
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;long ll_row
ll_row = dw_1.insertrow(0)
dw_1.ScrollToRow(ll_row)
dw_1.setcolumn(1)  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdlabel_qa_m
integer x = 1641
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;dw_1.Retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cdlabel_qa_m
boolean visible = false
integer x = 1545
integer y = 40
integer width = 951
integer height = 156
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_cdlabel_qa_m
integer x = 37
integer width = 3525
integer height = 188
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_cdlabel_qa_m
integer x = 1609
integer y = 16
integer width = 1010
end type

type dw_2 from w_inheritance`dw_2 within w_cdlabel_qa_m
boolean visible = false
integer x = 1664
integer y = 60
integer width = 480
integer height = 148
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

