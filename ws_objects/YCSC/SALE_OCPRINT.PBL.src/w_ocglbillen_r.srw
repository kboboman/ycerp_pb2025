$PBExportHeader$w_ocglbillen_r.srw
$PBExportComments$어음번호별 배서자현황(1998/07/06,성삼지)
forward
global type w_ocglbillen_r from w_inheritance
end type
end forward

global type w_ocglbillen_r from w_inheritance
integer y = 112
integer width = 3643
integer height = 2172
string title = "어음번호별 배서자현황(w_ocglbillen_r)"
end type
global w_ocglbillen_r w_ocglbillen_r

type variables

end variables

on w_ocglbillen_r.create
call super::create
end on

on w_ocglbillen_r.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.sharedata(dw_2)
dw_2.visible = false
end event

type pb_save from w_inheritance`pb_save within w_ocglbillen_r
boolean visible = false
integer taborder = 60
end type

type dw_1 from w_inheritance`dw_1 within w_ocglbillen_r
integer x = 37
integer y = 272
integer width = 3520
integer height = 1764
integer taborder = 0
string dataobject = "d_ocglbillen_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_ocglbillen_r
integer x = 1893
integer y = 64
integer width = 110
integer height = 92
integer taborder = 10
string dataobject = "d_ocglbillen_r1"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::editchanged;call super::editchanged;datawindowchild ldwc_draft
string ls_data
long ll_found,ll_row
int li_line

this.getchild("draft", ldwc_draft)
ldwc_draft.settransobject(sqlca)

choose case dwo.name
	case 'draft'
		 ls_data = data + '%'
		 ll_row = ldwc_draft.RowCount( )
		 ll_found = ldwc_draft.Find("draft like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("draft.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 ldwc_draft.scrolltorow(ll_found)
end choose

RETURN 0
end event

event dw_2::itemchanged;call super::itemchanged;this.accepttext()
dw_1.retrieve(this.getitemstring(this.getrow(), "draft"))


end event

type st_title from w_inheritance`st_title within w_ocglbillen_r
integer y = 40
integer width = 1627
string text = "어음번호별 배서자현황"
end type

type st_tips from w_inheritance`st_tips within w_ocglbillen_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocglbillen_r
boolean visible = false
integer taborder = 70
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocglbillen_r
boolean visible = false
integer taborder = 50
end type

type pb_close from w_inheritance`pb_close within w_ocglbillen_r
integer x = 3365
integer taborder = 40
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocglbillen_r
integer x = 3173
integer taborder = 30
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 어음번호별 배서자현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_ocglbillen_r
boolean visible = false
integer taborder = 80
end type

type pb_delete from w_inheritance`pb_delete within w_ocglbillen_r
boolean visible = false
integer taborder = 90
end type

type pb_insert from w_inheritance`pb_insert within w_ocglbillen_r
boolean visible = false
integer taborder = 100
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocglbillen_r
integer x = 2981
integer taborder = 20
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve()	
end event

type gb_3 from w_inheritance`gb_3 within w_ocglbillen_r
boolean visible = false
integer x = 2290
integer y = 48
integer width = 837
integer height = 168
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
string text = "발행자"
end type

type gb_2 from w_inheritance`gb_2 within w_ocglbillen_r
integer x = 23
integer y = 232
integer width = 3557
integer height = 1816
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocglbillen_r
integer x = 2962
integer width = 617
integer taborder = 0
end type

