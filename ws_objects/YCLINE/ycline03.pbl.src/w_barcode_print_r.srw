$PBExportHeader$w_barcode_print_r.srw
$PBExportComments$바코드 재출력용
forward
global type w_barcode_print_r from window
end type
type cb_2 from commandbutton within w_barcode_print_r
end type
type dw_8 from datawindow within w_barcode_print_r
end type
type cb_1 from commandbutton within w_barcode_print_r
end type
type st_3 from statictext within w_barcode_print_r
end type
type st_2 from statictext within w_barcode_print_r
end type
type st_1 from statictext within w_barcode_print_r
end type
type dw_1 from datawindow within w_barcode_print_r
end type
end forward

global type w_barcode_print_r from window
integer width = 4110
integer height = 1768
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
dw_8 dw_8
cb_1 cb_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_1 dw_1
end type
global w_barcode_print_r w_barcode_print_r

type prototypes

end prototypes

forward prototypes
public subroutine wf_reprint ()
end prototypes

public subroutine wf_reprint ();
int li_cnt, li_prt, li_cnt2, li_order_seq
long ll_row, ll_cnt
string ls_order_no
dec ld_wid, ld_oldwid

DW_1.ACCEPTTEXT()
ld_oldwid = 0

//openport('TSC TTP/TDP-242')
//clearbuffer()
for ll_row = 1 to dw_1.rowcount()
	ls_order_no = dw_1.object.coilsliting_order_no[ll_row]
	li_cnt = dw_1.object.coilsliting_seq[ll_row]
	li_prt = dw_1.object.lb_cnt[ll_row]
	if isnull(li_prt) or li_prt < 1 then continue
	dw_1.scrolltorow(ll_row)
	ld_wid = dw_1.object.swid[ll_row]
	if ld_wid <> ld_oldwid then
		if ld_wid < 50.0 then
			dw_8.dataobject = 'd_sfclabel03_2'
		else
			dw_8.dataobject = 'd_sfclabel03_1'
		end if
		dw_8.settransobject(sqlca)
	end if
	li_cnt2 = dw_8.retrieve( ls_order_no, li_cnt )
	if li_cnt2 < 1 then continue
	dw_8.Object.DataWindow.Print.Copies = li_prt
	dw_8.print()
//	printlabel('1',string(li_prt))
	ld_oldwid = ld_wid
//PrintClose(job)
next
//closeport()
//dw_8.Reset()
//dw_8.Object.DataWindow.Print.Copies = 1
//dw_8.InsertRow(0)
//dw_8.Print()

ls_order_no  = w_coilslit_m.dw_3.object.order_no[w_coilslit_m.dw_3.getrow()]
li_order_seq = w_coilslit_m.dw_3.object.order_seq[w_coilslit_m.dw_3.getrow()]
dw_1.retrieve(ls_order_no, li_order_seq)

////--------------아래 원본 -----------
//////TSCLib.dll
////openport('TSC TTP/TDP-242')
////setup("100", "50", "4", "8", "0", "0", "0" )
////sendcommand("BAR 400,200,300,100" )
////sendcommand("BOX 10,300,300,300,5" )
////printlabel('1','2')
////closeport()
////return
////		
////long ll_prt
////		PrintSend(ll_prt, "~h1BPRINT ~ 01 ~ 01", 255)
////Print(ll_prt, "Database error - " &
////   + String(Today(), "mm/dd/yyyy") &
////      + " - " &
////      + String(Now(), "HH:MM:SS"))
////PrintDataWindow(ll_prt, dw_8)
////long job
////
////job = PrintOpen( )
////
////// Each DataWindow starts printing on a new page.
////
////PrintDataWindow(job, dw_EmpHeader)
////
////PrintDataWindow(job, dw_EmpDetail)
////
////PrintDataWindow(job, dw_EmpDptSum)
////
////PrintClose(job)
//
//int li_cnt, li_prt, li_cnt2, li_order_seq
//long ll_row, ll_cnt
//string ls_order_no
//dec ld_wid, ld_oldwid
//
//DW_1.ACCEPTTEXT()
//ld_oldwid = 0
//
////long job
////
////job = PrintOpen( )
//		
//openport('TSC TTP/TDP-242')
////clearbuffer()
//for ll_row = 1 to dw_1.rowcount()
//	ls_order_no = dw_1.object.coilsliting_order_no[ll_row]
//	li_cnt = dw_1.object.coilsliting_seq[ll_row]
//	li_prt = dw_1.object.lb_cnt[ll_row]
//	if isnull(li_prt) or li_prt < 1 then continue
//	dw_1.scrolltorow(ll_row)
//	ld_wid = dw_1.object.swid[ll_row]
//	if ld_wid <> ld_oldwid then
//		if ld_wid < 50.0 then
//			dw_8.dataobject = 'd_sfclabel03_2'
//		else
//			dw_8.dataobject = 'd_sfclabel03_1'
//		end if
//		dw_8.settransobject(sqlca)
//	end if
//	li_cnt2 = dw_8.retrieve( ls_order_no, li_cnt )
//	if li_cnt2 < 1 then continue
////	dw_8.Object.DataWindow.Print.Copies = li_prt
////	dw_8.print()
//	printlabel('1',string(li_prt))
//	ld_oldwid = ld_wid
////PrintClose(job)
//next
//closeport()
////dw_8.Reset()
////dw_8.Object.DataWindow.Print.Copies = 1
////dw_8.InsertRow(0)
////dw_8.Print()
//
//ls_order_no = w_coils.dw_3.object.order_no[w_coils.dw_3.getrow()]
//li_order_seq = w_coils.dw_3.object.order_seq[w_coils.dw_3.getrow()]
//dw_1.retrieve(ls_order_no, li_order_seq)
//
end subroutine

on w_barcode_print_r.create
this.cb_2=create cb_2
this.dw_8=create dw_8
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.dw_8,&
this.cb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_1}
end on

on w_barcode_print_r.destroy
destroy(this.cb_2)
destroy(this.dw_8)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;//
string  ls_order_no
integer li_order_seq

dw_1.SetTransobject(sqlca)
dw_1.Object.DataWindow.Zoom = gl_resolution

dw_8.SetTransobject(sqlca)
dw_8.visible = false

ls_order_no  = w_coilslit_m.dw_3.object.order_no[w_coilslit_m.dw_3.getrow()]
li_order_seq = w_coilslit_m.dw_3.object.order_seq[w_coilslit_m.dw_3.getrow()]
dw_1.retrieve( ls_order_no, li_order_seq )


end event

event key;//
choose case key
	case KeyF6!
		wf_reprint()
		
	case KeyEscape!
		//OpenWithParm(w_end, '프로그램 종료[w_end]')
		Close( this )
end choose
end event

type cb_2 from commandbutton within w_barcode_print_r
integer x = 2496
integer y = 20
integer width = 777
integer height = 140
integer taborder = 40
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F6:출력"
boolean cancel = true
end type

event clicked;// F6:출력
wf_reprint()

end event

type dw_8 from datawindow within w_barcode_print_r
integer x = 1029
integer y = 524
integer width = 1929
integer height = 860
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_sfclabel03_1"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type cb_1 from commandbutton within w_barcode_print_r
integer x = 3287
integer y = 20
integer width = 777
integer height = 140
integer taborder = 30
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ESC: 취소"
boolean cancel = true
end type

event clicked;// ESC: 취소
close(parent)
end event

type st_3 from statictext within w_barcode_print_r
integer x = 18
integer y = 36
integer width = 229
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "출력"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_barcode_print_r
integer x = 864
integer y = 36
integer width = 233
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "장수"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_barcode_print_r
integer x = 238
integer y = 36
integer width = 1614
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "할 페이지의     를 입력하세요."
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_barcode_print_r
event ue_keydown pbm_dwnkey
integer x = 37
integer y = 176
integer width = 4027
integer height = 1472
integer taborder = 10
string title = "none"
string dataobject = "d_lb_cnt"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_keydown;//
this.accepttext()

choose case key
	case KeyF6!
		wf_reprint()
		
	case KeyEscape!
		//OpenWithParm(w_end, '프로그램 종료[w_end]')
		Close( Parent )
end choose

end event

