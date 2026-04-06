$PBExportHeader$w_s_main.srw
$PBExportComments$시스템관리메인화면(작성일:98/01/17, 작성자:곽용덕)
forward
global type w_s_main from window
end type
type mdi_1 from mdiclient within w_s_main
end type
type mditbb_1 from tabbedbar within w_s_main
end type
type mdirbb_1 from ribbonbar within w_s_main
end type
end forward

global type w_s_main from window
integer x = 5
integer y = 4
integer width = 3657
integer height = 2400
boolean titlebar = true
string title = "시스템관리(S)"
string menuname = "m_s_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 79741120
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
end type
global w_s_main w_s_main

forward prototypes
public subroutine wf_menu ()
public subroutine wf_menucase1 (string arg_str1, string arg_str2)
public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3)
public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4)
end prototypes

public subroutine wf_menu ();//long ll_row,ll_cnt
//string ls_menuitem1,ls_menuitem2,ls_menuitem3,ls_menuitem4
//datastore ds_1,ds_2,ds_3,ds_4
//
//ds_1 = CREATE DataStore
//ds_2 = CREATE DataStore
//ds_3 = CREATE DataStore
//ds_4 = CREATE DataStore
//
//ds_1.dataobject = "d_authority1_login"
//ds_2.dataobject = "d_authority2_login"
//ds_3.dataobject = "d_authority3_login"
//ds_4.dataobject = "d_authority4_login"
//ds_1.settransobject(sqlca)
//ds_2.settransobject(sqlca)
//ds_3.settransobject(sqlca)
//ds_4.settransobject(sqlca)
//
//ds_1.retrieve(gs_userid,"m_main")
//ds_2.retrieve(gs_userid,"m_main")
//ds_3.retrieve(gs_userid,"m_main")
//ds_4.retrieve(gs_userid,"m_main")
//
//ll_row = ds_2.rowcount()
//for ll_cnt = 1 to ll_row
//	 ls_menuitem1 = trim(ds_2.getitemstring(ll_cnt,"menu1"))
//    ls_menuitem2 = trim(ds_2.getitemstring(ll_cnt,"use_type"))
//	 wf_menucase1(ls_menuitem1,ls_menuitem2)
//next
//
//ll_row = ds_3.rowcount()
//for ll_cnt = 1 to ll_row
//	 ls_menuitem1 = trim(ds_3.getitemstring(ll_cnt,"menu1"))
//	 ls_menuitem2 = trim(ds_3.getitemstring(ll_cnt,"menu2"))
//    ls_menuitem3 = trim(ds_3.getitemstring(ll_cnt,"use_type"))
//	 wf_menucase2(ls_menuitem1,ls_menuitem2,ls_menuitem3)
//next
//
//ll_row = ds_4.rowcount()
//for ll_cnt = 1 to ll_row
//	 ls_menuitem1 = trim(ds_4.getitemstring(ll_cnt,"menu1"))
//	 ls_menuitem2 = trim(ds_4.getitemstring(ll_cnt,"menu2"))
//	 ls_menuitem3 = trim(ds_4.getitemstring(ll_cnt,"menu3"))
//    ls_menuitem4 = trim(ds_4.getitemstring(ll_cnt,"use_type"))
//	 wf_menucase3(ls_menuitem1,ls_menuitem2,ls_menuitem3,ls_menuitem4)
//next
end subroutine

public subroutine wf_menucase1 (string arg_str1, string arg_str2);
end subroutine

public subroutine wf_menucase2 (string arg_str1, string arg_str2, string arg_str3);
end subroutine

public subroutine wf_menucase3 (string arg_str1, string arg_str2, string arg_str3, string arg_str4);
end subroutine

on w_s_main.create
if this.MenuName = "m_s_main" then this.MenuID = create m_s_main
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_s_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
end on

event open;string ls_name
date   ld_date
datetime ldt_date

SELECT REPLACE(area_name,'사업장','') INTO :ls_name 
  FROM area
 WHERE area_no = :gs_area;
THIS.Title = '[' + ls_name + '관리]' + GS_USERNAME + ' [' + Sqlca.ServerName + '][' + SQLCA.DataBase + '][' + gs_ver + "][" + gs_level + "]"

//wf_menu()

end event

type mdi_1 from mdiclient within w_s_main
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_s_main
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_s_main
int X=0
int Y=0
int Width=0
int Height=596
end type

