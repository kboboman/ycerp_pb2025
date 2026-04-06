$PBExportHeader$w_relation_net.srw
$PBExportComments$인적네트워크[2006.09.29 이기영]
forward
global type w_relation_net from w_inheritance
end type
end forward

global type w_relation_net from w_inheritance
integer width = 4347
integer height = 2348
string title = "인적네트워크현황[w_crm_net]"
end type
global w_relation_net w_relation_net

on w_relation_net.create
call super::create
end on

on w_relation_net.destroy
call super::destroy
end on

event open;call super::open;dw_1.SetTransObject(SQLCA)
end event

type pb_save from w_inheritance`pb_save within w_relation_net
boolean visible = false
integer x = 3872
integer y = 64
end type

type dw_1 from w_inheritance`dw_1 within w_relation_net
integer x = 32
integer y = 248
integer width = 4247
integer height = 1972
string dataobject = "d_ip01112_r"
end type

type dw_2 from w_inheritance`dw_2 within w_relation_net
boolean visible = false
integer width = 1440
integer height = 1108
end type

type st_title from w_inheritance`st_title within w_relation_net
integer width = 1595
string text = "인적네트워크현황"
end type

type st_tips from w_inheritance`st_tips within w_relation_net
end type

type pb_compute from w_inheritance`pb_compute within w_relation_net
boolean visible = false
integer x = 2528
integer y = 64
end type

type pb_print_part from w_inheritance`pb_print_part within w_relation_net
boolean visible = false
integer x = 3680
integer y = 64
end type

type pb_close from w_inheritance`pb_close within w_relation_net
integer x = 4064
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_relation_net
integer x = 3872
integer y = 64
end type

event pb_print::clicked;call super::clicked;w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 로그를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 2, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_relation_net
boolean visible = false
integer x = 3296
integer y = 64
end type

type pb_delete from w_inheritance`pb_delete within w_relation_net
boolean visible = false
integer x = 3104
integer y = 64
end type

type pb_insert from w_inheritance`pb_insert within w_relation_net
boolean visible = false
integer x = 2912
integer y = 64
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_relation_net
integer x = 3685
integer y = 64
end type

event pb_retrieve::clicked;call super::clicked;dw_1.RETRieve( )
end event

type gb_3 from w_inheritance`gb_3 within w_relation_net
boolean visible = false
end type

type gb_2 from w_inheritance`gb_2 within w_relation_net
boolean visible = false
end type

type gb_1 from w_inheritance`gb_1 within w_relation_net
integer x = 3648
integer y = 24
integer width = 626
end type

