$PBExportHeader$w_cdcustlevel_w.srw
forward 
global type w_cdcustlevel_w from window
end type
type p_1 from picture within w_cdcustlevel_w
end type
end forward

global type w_cdcustlevel_w from window
integer width = 2505
integer height = 2012
boolean titlebar = true
string title = "거래처등급분류표(w_cdcustlevel_w)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
end type
global w_cdcustlevel_w w_cdcustlevel_w

on w_cdcustlevel_w.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on w_cdcustlevel_w.destroy
destroy(this.p_1)
end on

type p_1 from picture within w_cdcustlevel_w
integer width = 2496
integer height = 1944
boolean originalsize = true
string picturename = "c:\bmp\cust_level.bmp"
boolean focusrectangle = false
end type

