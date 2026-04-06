$PBExportHeader$w_barcode_print_r.srw
$PBExportComments$바코드재출력용윈도우(2004년어느날, 정갑용)
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
integer width = 3232
integer height = 1384
boolean titlebar = true
string title = "스리팅바코드출력(w_barcode_print_r)"
boolean controlmenu = true
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

type variables
ws_process ist_code
end variables

forward prototypes
public subroutine wf_reprint ()
end prototypes

public subroutine wf_reprint ();int li_cnt, li_prt, li_cnt2, li_order_seq
long ll_row, ll_cnt
string ls_order_no, ls_prt
dec ld_wid, ld_oldwid

dw_1.ACCEPTTEXT()

if gs_userid = 'plh' or gs_userid = 'etwas' then
	select bar_ttps2 into :ls_prt from globals;
else
	select bar_ttps into :ls_prt from globals;
end if
ld_oldwid = 0

for ll_row = 1 to dw_1.rowcount()
	ls_order_no = dw_1.object.coilsliting_order_no[ll_row]
	li_cnt = dw_1.object.coilsliting_seq[ll_row]
	li_prt = dw_1.object.lb_cnt[ll_row]
	if isnull(li_prt) or li_prt < 1 then continue
	dw_1.scrolltorow(ll_row)
	ld_wid = dw_1.object.swid[ll_row]
	if ld_wid <> ld_oldwid then
		if ld_wid < 50.0 then
			dw_8.dataobject = 'd_sfclabel_2'
		else
			dw_8.dataobject = 'd_sfclabel_1'
		end if
		dw_8.settransobject(sqlca)
	end if
	li_cnt2 = dw_8.retrieve( ls_order_no, li_cnt )
	dw_8.object.datawindow.printer = ls_prt
	if li_cnt2 < 1 then continue
	dw_8.Object.DataWindow.Print.Copies = li_prt
	dw_8.print()
	ld_oldwid = ld_wid
next
dw_1.retrieve(ist_code.sale_no, ist_code.seq_no)

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

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ist_code = message.powerobjectparm


string ls_order_no
integer li_order_seq
dw_1.SetTransobject(sqlca)
dw_8.SetTransobject(sqlca)
dw_8.visible = false

//ls_order_no = w_coils.dw_3.object.order_no[w_coils.dw_3.getrow()]
//li_order_seq = w_coils.dw_3.object.order_seq[w_coils.dw_3.getrow()]
dw_1.retrieve(ist_code.sale_no, ist_code.seq_no)


end event

type cb_2 from commandbutton within w_barcode_print_r
integer x = 2016
integer y = 36
integer width = 530
integer height = 100
integer taborder = 10
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출력"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_reprint()
end event

type dw_8 from datawindow within w_barcode_print_r
integer x = 750
integer y = 440
integer width = 1801
integer height = 760
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_sfclabel_1"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type cb_1 from commandbutton within w_barcode_print_r
integer x = 2651
integer y = 36
integer width = 530
integer height = 100
integer taborder = 20
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소(Esc)"
boolean cancel = true
end type

event clicked;close(parent)
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
long textcolor = 8388608
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
integer x = 18
integer y = 176
integer width = 3168
integer height = 1072
integer taborder = 10
string title = "none"
string dataobject = "d_lb_cnt"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_keydown;THIS.ACCEPTTEXT()
choose case key
	case KeyF6!
		wf_reprint()
//	case KeyESC!
//		OpenWithParm(w_end, '프로그램 종료[w_end]')
end choose
end event

