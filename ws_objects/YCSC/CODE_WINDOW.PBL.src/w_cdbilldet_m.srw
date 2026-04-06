$PBExportHeader$w_cdbilldet_m.srw
$PBExportComments$어음처리내역(1998/05/08, 성삼지)
forward
global type w_cdbilldet_m from window
end type
type dw_1 from datawindow within w_cdbilldet_m
end type
end forward

global type w_cdbilldet_m from window
integer x = 233
integer y = 424
integer width = 3195
integer height = 696
boolean titlebar = true
string title = "어음처리내역(w_cdbilldet_m)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
dw_1 dw_1
end type
global w_cdbilldet_m w_cdbilldet_m

on w_cdbilldet_m.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_cdbilldet_m.destroy
destroy(this.dw_1)
end on

event open;string ls_vc_no

ls_vc_no = message.stringparm
dw_1.settransobject(sqlca)
dw_1.retrieve(ls_vc_no)

end event

type dw_1 from datawindow within w_cdbilldet_m
integer x = 9
integer y = 4
integer width = 3163
integer height = 592
integer taborder = 1
string dataobject = "d_cdglbilldet_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

