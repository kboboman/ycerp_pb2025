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
type gb_1 from groupbox within w_whsaleall_w
end type
end forward

global type w_whsaleall_w from window
integer x = 23
integer y = 288
integer width = 3904
integer height = 2644
boolean titlebar = true
string title = "수주현황(w_whsaleall_w) "
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 79741120
string icon = "Form!"
boolean center = true
dw_2 dw_2
dw_1 dw_1
lb_1 lb_1
gb_1 gb_1
end type
global w_whsaleall_w w_whsaleall_w

type variables
Integer	 ii_WindowBorder = 15
end variables

on w_whsaleall_w.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.lb_1=create lb_1
this.gb_1=create gb_1
this.Control[]={this.dw_2,&
this.dw_1,&
this.lb_1,&
this.gb_1}
end on

on w_whsaleall_w.destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.lb_1)
destroy(this.gb_1)
end on

event open;//
gs_where2 lst_str 
string ls_sale
long   ll_seqno, ll_row, ll_cnt, ll_found

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

lst_str = message.powerobjectparm
ll_cnt  = upperbound(lst_str.str1)

for ll_row = 1 to ll_cnt
	lb_1.AddItem(lst_str.str1[ll_row])
next

if ll_cnt > 0 then
	ll_seqno = long(lst_str.str2[1])		// 순번
	
	dw_1.retrieve( lst_str.str1[1] )
	dw_2.retrieve( lst_str.str1[1] )
	if dw_2.rowcount() > 0 then
		ll_found = dw_2.find( "seq_no = " + string(ll_seqno), 1, dw_2.rowcount() )
		if ll_found > 0 then
			dw_2.scrolltorow( ll_found )
		end if
	end if
end if

end event

type dw_2 from datawindow within w_whsaleall_w
integer x = 37
integer y = 1172
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
integer x = 818
integer y = 40
integer width = 2642
integer height = 1108
integer taborder = 10
string dataobject = "d_whsaleallhead_w"
boolean border = false
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_1 from listbox within w_whsaleall_w
integer x = 37
integer y = 32
integer width = 741
integer height = 1124
integer taborder = 30
integer textsize = -12
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

type gb_1 from groupbox within w_whsaleall_w
integer x = 795
integer y = 12
integer width = 3058
integer height = 1144
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

