$PBExportHeader$w_bidinfo_r.srw
$PBExportComments$입찰정보 출력 (2000/11/07 문종혁)
forward
global type w_bidinfo_r from w_inheritance
end type
end forward

global type w_bidinfo_r from w_inheritance
string title = "입찰정보 출력(w_bidinfo_r)"
end type
global w_bidinfo_r w_bidinfo_r

on w_bidinfo_r.create
call super::create
end on

on w_bidinfo_r.destroy
call super::destroy
end on

type pb_save from w_inheritance`pb_save within w_bidinfo_r
integer x = 4251
integer y = 68
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_bidinfo_r
integer width = 4581
string dataobject = "dw_bidinfo_print2"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_bidinfo_r
boolean visible = false
boolean enabled = false
end type

type st_title from w_inheritance`st_title within w_bidinfo_r
string text = "입찰정보 출력"
end type

type st_tips from w_inheritance`st_tips within w_bidinfo_r
end type

type pb_compute from w_inheritance`pb_compute within w_bidinfo_r
integer x = 2907
integer y = 68
boolean enabled = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_bidinfo_r
integer x = 4059
integer y = 68
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bidinfo_r
integer x = 4443
integer y = 68
end type

type pb_print from w_inheritance`pb_print within w_bidinfo_r
integer x = 3867
integer y = 68
end type

event pb_print::clicked;call super::clicked;
w_repsuper w_print
st_print l_print
if dw_1.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if


l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업진행내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_bidinfo_r
integer x = 3675
integer y = 68
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bidinfo_r
integer x = 3483
integer y = 68
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_bidinfo_r
integer x = 3291
integer y = 68
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_bidinfo_r
integer x = 3099
integer y = 68
end type

event pb_retrieve::clicked;call super::clicked;//openwithparm(w_bdinfo_r, ist_code)
//
////ist_code = message.powerobjectparm
//
//if ist_code.chk_flag = FALSE then
////	dw_1.reset()
//	return
//end if
dw_1.setredraw(false)
dw_1.retrieve('0000000001')
dw_1.setredraw(true)
if dw_1.rowcount() < 1 then
	messagebox("확인", "해당기간에 조회내역이 없습니다.",information!)
   return
end if
end event

type gb_3 from w_inheritance`gb_3 within w_bidinfo_r
boolean visible = false
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_bidinfo_r
integer width = 4635
end type

type gb_1 from w_inheritance`gb_1 within w_bidinfo_r
integer x = 2885
integer y = 28
end type

