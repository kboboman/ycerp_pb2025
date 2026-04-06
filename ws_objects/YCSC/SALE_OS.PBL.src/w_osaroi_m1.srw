$PBExportHeader$w_osaroi_m1.srw
$PBExportComments$판매매출관리(1998/04/13, 정재수)
forward
global type w_osaroi_m1 from window
end type
type st_1 from statictext within w_osaroi_m1
end type
type cbx_1 from checkbox within w_osaroi_m1
end type
type dw_1 from datawindow within w_osaroi_m1
end type
type pb_2 from picturebutton within w_osaroi_m1
end type
type pb_1 from picturebutton within w_osaroi_m1
end type
type gb_1 from groupbox within w_osaroi_m1
end type
end forward

global type w_osaroi_m1 from window
integer x = 832
integer y = 360
integer width = 1847
integer height = 1168
boolean titlebar = true
string title = "운송비 선택(w_osaroi_m1)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_1 st_1
cbx_1 cbx_1
dw_1 dw_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_osaroi_m1 w_osaroi_m1

type variables
st_aroi_s ist_aroi
boolean ib_check = false
end variables

forward prototypes
public subroutine wf_calc ()
end prototypes

public subroutine wf_calc ();long  ll_row
decimal lr_amount

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.pick[ll_row] = 'Y' and dw_1.object.do_shipamt_case[ll_row] = 'R' then
			lr_amount = lr_amount + dw_1.GetItemDecimal(ll_row, 'ship_amount')
	end if
next

st_1.text = string(lr_amount, '#,##0')
end subroutine

on w_osaroi_m1.create
this.st_1=create st_1
this.cbx_1=create cbx_1
this.dw_1=create dw_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.cbx_1,&
this.dw_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_osaroi_m1.destroy
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.dw_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

datawindow ldw_1

ist_aroi = message.powerobjectparm

ldw_1 = ist_aroi.dw_object

dw_1.dataobject = ist_aroi.name
dw_1.settransobject(sqlca)

ldw_1.sharedata(dw_1)

wf_calc()  


long ll_row
if cbx_1.checked = true then
	for ll_row = 1 to dw_1.rowcount()
		dw_1.setitem(ll_row, "pick", 'Y')
	next
else
	for ll_row = 1 to dw_1.rowcount()
		dw_1.setitem(ll_row, "pick", 'N')
	next
end if	

wf_calc()  
end event

type st_1 from statictext within w_osaroi_m1
integer x = 677
integer y = 908
integer width = 494
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_osaroi_m1
integer x = 46
integer y = 916
integer width = 571
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체선정"
boolean checked = true
end type

event clicked;long ll_row


if cbx_1.checked = true then
	for ll_row = 1 to dw_1.rowcount()
		dw_1.setitem(ll_row, "pick", 'Y')
	next
else
	for ll_row = 1 to dw_1.rowcount()
		dw_1.setitem(ll_row, "pick", 'N')
	next
end if	

wf_calc()  
end event

type dw_1 from datawindow within w_osaroi_m1
integer x = 55
integer y = 48
integer width = 1701
integer height = 796
integer taborder = 10
string dataobject = "d_osaroi_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event other;
if ib_check = true then
	wf_calc()
end if
end event

event itemchanged;
ib_check = true
end event

type pb_2 from picturebutton within w_osaroi_m1
integer x = 1499
integer y = 880
integer width = 279
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;
ib_check = false

ist_aroi.flag = 'N'
closewithreturn(parent, ist_aroi)
end event

type pb_1 from picturebutton within w_osaroi_m1
integer x = 1216
integer y = 880
integer width = 279
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = right!
end type

event clicked;
ib_check = false
ist_aroi.flag = 'Y'
closewithreturn(parent, ist_aroi)


end event

type gb_1 from groupbox within w_osaroi_m1
integer x = 32
integer width = 1751
integer height = 864
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
end type

