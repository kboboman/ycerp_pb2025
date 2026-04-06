$PBExportHeader$w_system_error.srw
$PBExportComments$System Error
forward
global type w_system_error from window
end type
type dw_error from datawindow within w_system_error
end type
type cb_print from commandbutton within w_system_error
end type
type cb_exit from commandbutton within w_system_error
end type
type cb_continue from commandbutton within w_system_error
end type
end forward

global type w_system_error from window
integer width = 2231
integer height = 1052
boolean titlebar = true
string title = "System Error"
windowtype windowtype = response!
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
dw_error dw_error
cb_print cb_print
cb_exit cb_exit
cb_continue cb_continue
end type
global w_system_error w_system_error

on w_system_error.create
this.dw_error=create dw_error
this.cb_print=create cb_print
this.cb_exit=create cb_exit
this.cb_continue=create cb_continue
this.Control[]={this.dw_error,&
this.cb_print,&
this.cb_exit,&
this.cb_continue}
end on

on w_system_error.destroy
destroy(this.dw_error)
destroy(this.cb_print)
destroy(this.cb_exit)
destroy(this.cb_continue)
end on

event open;dw_error.InsertRow (1)
 
dw_error.SetItem (1, "errornum", string(error.number))
dw_error.SetItem (1, "message" , error.text)
dw_error.SetItem (1, "where"   , error.windowmenu)
dw_error.SetItem (1, "object"  , error.object)
dw_error.SetItem (1, "event"   , error.objectevent)
dw_error.SetItem (1, "line"    , string(error.line))

end event

type dw_error from datawindow within w_system_error
integer x = 27
integer y = 32
integer width = 2162
integer height = 752
integer taborder = 10
boolean enabled = false
string dataobject = "d_system_error"
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_system_error
integer x = 1550
integer y = 824
integer width = 507
integer height = 112
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "&Print"
end type

event clicked;string  ls_line
long	  ll_prt

ll_prt   = printopen("System Error")

// Print each string variable

print    (ll_prt, "System error message - "+string(today())+" - "+string(now(), "HH:MM:SS"))
print    (ll_prt, " ")

ls_line = "Error Number  : " + getitemstring(dw_error,1,1)
print    (ll_prt, ls_line)

ls_line = "Error Message : " + getitemstring(dw_error,1,2)
print    (ll_prt, ls_line)

ls_line = "Window/Menu   : " + getitemstring(dw_error,1,3)
print    (ll_prt, ls_line)

ls_line = "Object        : " + getitemstring(dw_error,1,4)
print    (ll_prt, ls_line)

ls_line = "Event         : " + getitemstring(dw_error,1,5)
print    (ll_prt, ls_line)

ls_line = "Line Number   : " + getitemstring(dw_error,1,6)
print    (ll_prt, ls_line)

printclose(ll_prt)

return

end event

type cb_exit from commandbutton within w_system_error
integer x = 101
integer y = 824
integer width = 718
integer height = 112
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "Exit The Program"
boolean default = true
end type

event clicked;halt close

end event

type cb_continue from commandbutton within w_system_error
integer x = 978
integer y = 824
integer width = 507
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "&Continue"
end type

event clicked;Close (Parent)

end event

