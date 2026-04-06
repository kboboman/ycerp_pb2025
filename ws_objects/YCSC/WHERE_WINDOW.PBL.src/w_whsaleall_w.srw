$PBExportHeader$w_whsaleall_w.srw
$PBExportComments$수주현황(헤더/상세)(2004/09/24,이인호)
forward
global type w_whsaleall_w from window
end type
type dw_2 from datawindow within w_whsaleall_w
end type
type dw_1 from datawindow within w_whsaleall_w
end type
type lb_1 from listbox within w_whsaleall_w
end type
end forward

global type w_whsaleall_w from window
integer x = 23
integer y = 288
integer width = 3904
integer height = 2648
boolean titlebar = true
string title = "수주현황(w_whsaleall_w) "
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 79741120
boolean center = true
dw_2 dw_2
dw_1 dw_1
lb_1 lb_1
end type
global w_whsaleall_w w_whsaleall_w

type variables
Integer	 ii_WindowBorder = 15
end variables

on w_whsaleall_w.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.lb_1=create lb_1
this.Control[]={this.dw_2,&
this.dw_1,&
this.lb_1}
end on

on w_whsaleall_w.destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.lb_1)
end on

event open;dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
string ls_sale
gs_where2 lst_str 
long ll_row, ll_cnt

lst_str = message.powerobjectparm
ll_cnt = UPPERbound(lst_str.str1)
for ll_row = 1 to ll_cnt
	lb_1.AddItem(lst_str.str1[ll_row])
NEXT
if ll_cnt > 0 then
	dw_1.retrieve(lst_str.str1[1])
	dw_2.retrieve(lst_str.str1[1])
end if

end event

type dw_2 from datawindow within w_whsaleall_w
integer x = 37
integer y = 1160
integer width = 3817
integer height = 1372
integer taborder = 20
string dataobject = "d_whsalealldet_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_whsaleall_w
integer x = 791
integer y = 40
integer width = 2642
integer height = 1108
integer taborder = 10
string dataobject = "d_whsaleallhead_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_1 from listbox within w_whsaleall_w
integer x = 46
integer y = 40
integer width = 741
integer height = 1108
integer taborder = 30
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
borderstyle borderstyle = stylelowered!
boolean extendedselect = true
end type

event selectionchanged;dw_1.retrieve(lb_1.SelectedItem())
dw_2.retrieve(lb_1.SelectedItem())

end event

