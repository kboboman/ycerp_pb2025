$PBExportHeader$w_ocglbillen_m.srw
$PBExportComments$어음 배서자 조회 및 입력(1998/05/25, 정재수)
forward
global type w_ocglbillen_m from w_inheritance
end type
end forward

global type w_ocglbillen_m from w_inheritance
integer x = 320
integer y = 552
integer width = 1641
integer height = 1308
string title = "배서자(w_ocglbillen_m)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
end type
global w_ocglbillen_m w_ocglbillen_m

type variables
string is_bill_no

end variables

on w_ocglbillen_m.create
call super::create
end on

on w_ocglbillen_m.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

is_bill_no = message.stringparm
dw_1.retrieve(is_bill_no)


end event

type pb_save from w_inheritance`pb_save within w_ocglbillen_m
integer x = 1408
integer y = 572
integer taborder = 40
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1, 'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_ocglbillen_m
integer x = 46
integer width = 1326
integer height = 884
integer taborder = 10
string dataobject = "d_ocglbillen_m"
boolean hscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_ocglbillen_m
boolean visible = false
integer x = 1243
integer y = 220
integer width = 50
integer height = 44
integer taborder = 80
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_ocglbillen_m
integer x = 23
integer width = 1294
string text = "배서자"
end type

type st_tips from w_inheritance`st_tips within w_ocglbillen_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocglbillen_m
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocglbillen_m
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_ocglbillen_m
integer x = 1408
integer y = 716
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocglbillen_m
boolean visible = false
integer x = 1271
integer y = 576
integer taborder = 110
end type

event pb_print::clicked;call super::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then
	return
else
	dw_2.retrieve()
end if

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 국가코드를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_ocglbillen_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ocglbillen_m
integer x = 1408
integer y = 428
integer taborder = 30
end type

event pb_delete::clicked;call super::clicked;dwitemstatus l_status
integer li_row

if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return

l_status = dw_1.getitemstatus(dw_1.getrow(), 0, primary!)

if l_status = new! or l_status = newmodified! then
	dw_1.deleterow(dw_1.getrow())
	
	dw_1.accepttext()
	for li_row = 1 to dw_1.rowcount()
		dw_1.object.seq[li_row] = li_row
	next
else
	dw_1.deleterow(dw_1.getrow())
	
	dw_1.accepttext()
	for li_row = 1 to dw_1.rowcount()
		dw_1.object.seq[li_row] = li_row
	next
	
	if wf_update1(dw_1, 'Y') = false then 
		dw_1.retrieve(is_bill_no)
	end if
end if
	
	

end event

type pb_insert from w_inheritance`pb_insert within w_ocglbillen_m
integer x = 1408
integer y = 284
integer taborder = 20
end type

event pb_insert::clicked;call super::clicked;long ll_row, ll_seq, ll_front

ll_seq = dw_1.rowcount()
ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)

if ll_seq > 1 then
	ll_front = dw_1.object.seq[ll_row - 1]
	dw_1.object.bill_no[ll_row] = is_bill_no
	dw_1.object.seq[ll_row] = ll_front + 1
else
	dw_1.object.bill_no[ll_row] = is_bill_no
	dw_1.object.seq[ll_row] = ll_row
end if
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ocglbillen_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_ocglbillen_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 90
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_ocglbillen_m
integer x = 23
integer y = 236
integer width = 1591
integer height = 968
integer taborder = 0
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_ocglbillen_m
boolean visible = false
integer x = 1134
integer y = 244
integer width = 233
integer height = 636
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

