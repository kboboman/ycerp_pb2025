$PBExportHeader$w_b_main.srw
$PBExportComments$영업정보메인화면(작성일:2007.04.02, 작성자:이인호)
forward 
global type w_b_main from window
end type
type mdi_1 from mdiclient within w_b_main
end type
type mditbb_1 from tabbedbar within w_b_main
end type
type mdirbb_1 from ribbonbar within w_b_main
end type
end forward

global type w_b_main from window
integer width = 4718
integer height = 2984
boolean titlebar = true
string title = "영업정보"
string menuname = "m_b_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
end type
global w_b_main w_b_main

on w_b_main.create
if this.MenuName = "m_b_main" then this.MenuID = create m_b_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_b_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
end on

event open;this.title = this.title +" "+ gs_ver + "[" + gs_level + "]"

gf_loghis("I", this.title)
gf_getuserinfo()
 
//close(w_login)  

end event

event close;gf_loghis("O", "")

end event

type mdi_1 from mdiclient within w_b_main
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_b_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_b_main
int X=0
int Y=0
int Width=0
int Height=596
end type

