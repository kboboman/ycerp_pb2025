$PBExportHeader$w_ca_main.srw
$PBExportComments$원가관리메인화면(작성일2000/12/18,이인호)
forward
global type w_ca_main from window
end type
type mdi_1 from mdiclient within w_ca_main
end type
type mditbb_1 from tabbedbar within w_ca_main
end type
type mdirbb_1 from ribbonbar within w_ca_main
end type
end forward

global type w_ca_main from window
integer x = 5
integer y = 4
integer width = 4718
integer height = 2984
boolean titlebar = true
string title = "원가관리(CA)"
string menuname = "m_ca_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
long backcolor = 79741120
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
end type
global w_ca_main w_ca_main

on w_ca_main.create
if this.MenuName = "m_ca_main" then this.MenuID = create m_ca_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_ca_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
end on

event open;gf_loghis("I", this.title)

end event

event close;gf_loghis("O", "")

end event

type mdi_1 from mdiclient within w_ca_main
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_ca_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_ca_main
int X=0
int Y=0
int Width=0
int Height=596
end type

