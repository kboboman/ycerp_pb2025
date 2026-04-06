$PBExportHeader$w_c_main.srw
$PBExportComments$공무관리메인화면(작성일:98/01/17, 작성자:곽용덕)
forward 
global type w_c_main from window
end type
type mdi_1 from mdiclient within w_c_main
end type
type mditbb_1 from tabbedbar within w_c_main
end type
type mdirbb_1 from ribbonbar within w_c_main
end type
end forward

global type w_c_main from window
integer x = 5
integer y = 4
integer width = 4718
integer height = 2984
boolean titlebar = true
string title = "공무관리(C)"
string menuname = "m_c_main"
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
global w_c_main w_c_main

on w_c_main.create
if this.MenuName = "m_c_main" then this.MenuID = create m_c_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_c_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
end on

type mdi_1 from mdiclient within w_c_main
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_c_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_c_main
int X=0
int Y=0
int Width=0
int Height=596
end type

