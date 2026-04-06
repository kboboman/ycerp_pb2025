$PBExportHeader$w_cdlabel_box_m.srw
$PBExportComments$유압반 Label Box(090205)
forward 
global type w_cdlabel_box_m from w_inheritance
end type
end forward

global type w_cdlabel_box_m from w_inheritance
integer width = 3639
integer height = 2168
string title = "유압반 Label Box관리(w_cdlabel_Box_m)"
end type
global w_cdlabel_box_m w_cdlabel_box_m

type variables
st_print  i_print

datawindowchild idwc_codemst

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

//	long ll_Y ; string ls_value, ls_val[]
//	GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )
//	for ll_Y = 1 to ddlb_dwtitles.totalitems()
//		ls_value  = ddlb_dwtitles.text( ll_Y )
//
//		GF_Split(ls_value, "|", ls_val)		
//		dw_2.Modify( ls_val[3] + ".Protect=1")
//	next
end if

dw_1.getchild("box_type",idwc_codemst)
idwc_codemst.settransobject(sqlca)
idwc_codemst.retrieve("YCLINE유압반(BOXTYPE)")

dw_1.retrieve()

end event

on w_cdlabel_box_m.create
call super::create
end on

on w_cdlabel_box_m.destroy
call super::destroy
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

end event

type pb_save from w_inheritance`pb_save within w_cdlabel_box_m
integer x = 2135
integer y = 56
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//
wf_update1(dw_1,"Y")


end event

type dw_1 from w_inheritance`dw_1 within w_cdlabel_box_m
integer x = 37
integer y = 432
integer width = 3525
integer height = 1588
string dataobject = "d_cdlabel_box_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;string  ls_case, ls_boxtype

dw_1.AcceptText()

debugbreak()
Choose Case dwo.name
	Case 'box_type'
		ls_case  =  dw_1.Object.Box_Type[row]

		SELECT item_nm INTO :ls_boxtype FROM codemst 
		 WHERE type = 'YCLINE유압반(BOXTYPE)' AND use_yn = 'Y' AND item_cd = :ls_case;
		if isnull(ls_boxtype) OR ls_boxtype = "" then
			MessageBox("확인","codemst에 해당하는 품목이 등록되지 않았습니다.")
			RETURN
		end if
		dw_1.Object.Box_name[row] = ls_boxtype
END Choose


//		IF  ls_case  =  '1'  THEN
//			dw_1.Object.Box_name[row]  =  '사각'
//		ElseIF  ls_case  =  '2'  THEN
//			dw_1.Object.Box_name[row]  =  '원형'
//		ElseIF  ls_case  =  '3'  THEN
//			dw_1.Object.Box_name[row]  =  '평판'
//		END IF
//
end event

type st_title from w_inheritance`st_title within w_cdlabel_box_m
integer x = 41
integer y = 20
integer width = 1435
integer height = 140
string text = "유압반 Label BOX 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdlabel_box_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdlabel_box_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdlabel_box_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdlabel_box_m
integer x = 2327
integer y = 56
integer width = 183
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdlabel_box_m
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

type pb_cancel from w_inheritance`pb_cancel within w_cdlabel_box_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdlabel_box_m
integer x = 1947
integer y = 56
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;long  ll_row  

dw_1.AcceptText()

ll_row  =  dw_1.Getrow()

dw_1.deleterow(ll_row)

end event

type pb_insert from w_inheritance`pb_insert within w_cdlabel_box_m
integer x = 1755
integer y = 56
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;long ll_row
ll_row = dw_1.insertrow(0)
dw_1.ScrollToRow(ll_row)
dw_1.setcolumn(1)  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdlabel_box_m
integer x = 1563
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;dw_1.Retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cdlabel_box_m
boolean visible = false
integer x = 1545
integer y = 40
integer width = 951
integer height = 156
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_cdlabel_box_m
integer x = 37
integer width = 3525
integer height = 188
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_cdlabel_box_m
integer x = 1531
integer y = 16
integer width = 1010
end type

type dw_2 from w_inheritance`dw_2 within w_cdlabel_box_m
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

