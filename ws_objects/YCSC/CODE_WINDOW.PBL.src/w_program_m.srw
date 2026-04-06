$PBExportHeader$w_program_m.srw
$PBExportComments$프로그램등록(1998/02/06,곽용덕)
forward
global type w_program_m from w_inheritance
end type
type tv_1 from treeview within w_program_m
end type
type gb_4 from groupbox within w_program_m
end type
type dw_3 from datawindow within w_program_m
end type
type dw_4 from datawindow within w_program_m
end type
type dw_5 from datawindow within w_program_m
end type
end forward

global type w_program_m from w_inheritance
integer x = 5
integer y = 4
integer width = 3557
integer height = 2248
string title = "프로그램 등록(w_program_m)"
boolean maxbox = false
windowstate windowstate = normal!
boolean center = true
tv_1 tv_1
gb_4 gb_4
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
end type
global w_program_m w_program_m

type variables
long il_dragsource,il_dragparent,il_droptarget
long ih_curteam
integer ii_chk=0
st_print i_print
string is_select,is_select1,is_select2,is_select3
string is_where,is_clause
end variables

forward prototypes
public function boolean wf_make_team (string as_str)
public function boolean wf_make_team1 (string as_str)
public function long wf_strchk (string arg_str)
end prototypes

public function boolean wf_make_team (string as_str);// as_str  string  value
TreeViewitem ltv_team
INT ll_Count, lh_team, l
long ll_len


ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2

ll_count = dw_1.rowcount()
FOR l = 1 TO ll_Count
	ltv_team.Label = trim(dw_1.object.#1[l]) + " " + trim(dw_1.object.#2[l])

	lh_team = tv_1.FindItem( CurrentTreeItem! , 0 )
	tv_1.InsertitemSort( lh_team, ltv_team )
	tv_1.ExpandAll( lh_team )
NEXT

return( TRUE )


end function

public function boolean wf_make_team1 (string as_str);// as_str string boolean
TreeViewitem ltv_team
Int    ll_Count, lh_team, l
long   ll_len
string ls_Component, ls_Source

ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2
ltv_team.Label = "송천"


tv_1.Deleteitem(0)
lh_team = tv_1.InsertItemSort( 0, ltv_team )

ll_count = dw_1.rowcount()
FOR l = 1 TO ll_Count
	ltv_team.Label = trim(dw_1.object.#1[l]) + " " + trim(dw_1.object.#2[l])

	tv_1.InsertItemSort( lh_team, ltv_team )
	tv_1.ExpandAll( lh_team )
NEXT

return( TRUE )
end function

public function long wf_strchk (string arg_str);string ls_str
long i

for i = 1 to 1000
	 ls_str = MidA(arg_str,i,1)
	 if ls_str = " " then
	    return i - 1
	 end if
next
end function

on w_program_m.create
int iCurrent
call super::create
this.tv_1=create tv_1
this.gb_4=create gb_4
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.dw_5
end on

on w_program_m.destroy
call super::destroy
destroy(this.tv_1)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.visible = false
dw_4.visible = false
dw_5.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

is_select  = dw_2.Describe("DataWindow.Table.Select")
is_select1 = dw_3.Describe("DataWindow.Table.Select")
is_select2 = dw_4.Describe("DataWindow.Table.Select")
is_select3 = dw_5.Describe("DataWindow.Table.Select")

dw_1.retrieve()
wf_Make_team1( "00000" )

tv_1.setfocus()



end event

type pb_save from w_inheritance`pb_save within w_program_m
integer x = 3063
integer y = 68
end type

event pb_save::clicked;long ll_team,ll_row,ll_num1[100],ll_cnt1,ll_cnt2,i,ll_row1,ll_cnt
long ll_parentteam,ll_childteam,ll_childteam1,ll_child
dwItemStatus l_status
string ls_team,ls_teamlike
treeviewitem ltv_team
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
ll_row = dw_1.rowcount()

ll_cnt1 = 0
ll_cnt2 = 0

for i = 1 to ll_row
	 l_status = dw_1.GetItemStatus(i, 0, Primary!)
	 if l_status = newmodified! then
		 ll_cnt1++
		 ll_num1[ll_cnt1] = i
	 end if
next 

ll_row = dw_1.deletedcount()

ll_team = tv_1.FindItem(CurrentTreeItem! , 0)
tv_1.getitem(ll_team,ltv_team)
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()
for i = 1 to ll_row
	 ls_team = trim(dw_1.GetItemString(i,1, Delete!, TRUE))
    choose case ltv_team.level
   	case 0
	   	  return
	   case 1
           is_clause = " where menu1.group_id = ~~'" + ls_team +"~~'"
           is_where = "DataWindow.Table.Select='" + is_select1 + is_clause + "'"			
		     if wf_retrieve(dw_3,is_where) > 1 then
				  dw_3.RowsMove(1, dw_3.rowcount(), Primary!, dw_3, 1, delete! )
			  end if
           is_clause = " where menu2.group_id = ~~'" + ls_team +"~~'"
           is_where = "DataWindow.Table.Select='" + is_select2 + is_clause + "'"				  
		     if wf_retrieve(dw_4,is_where) > 1 then
				  dw_4.RowsMove(1, dw_4.rowcount(), Primary!, dw_4, 1, delete! )
			  end if
           is_clause = " where menu3.group_id = ~~'" + ls_team +"~~'"
           is_where = "DataWindow.Table.Select='" + is_select3 + is_clause + "'"				  
		     if wf_retrieve(dw_5,is_where) > 1 then
				  dw_5.RowsMove(1, dw_5.rowcount(), Primary!, dw_5, 1, delete! )
			  end if
	   case 2
           is_clause = " where menu2.menu1 = ~~'" + ls_team +"~~'"
           is_where = "DataWindow.Table.Select='" + is_select2 + is_clause + "'"				
		     if wf_retrieve(dw_4,is_where) > 1 then
				  dw_4.RowsMove(1, dw_4.rowcount(), Primary!, dw_4, 1, delete! )
			  end if
           is_clause = " where menu3.menu1 = ~~'" + ls_team +"~~'"
           is_where = "DataWindow.Table.Select='" + is_select3 + is_clause + "'"			  
		     if wf_retrieve(dw_5,is_where) > 1 then
				  dw_5.RowsMove(1, dw_5.rowcount(), Primary!, dw_5, 1, delete! )
			  end if
	   case 3
           is_clause = " where menu3.menu2 = ~~'" + ls_team +"~~'"
           is_where = "DataWindow.Table.Select='" + is_select3 + is_clause + "'"			
		     if wf_retrieve(dw_5,is_where) > 1 then
				  dw_5.RowsMove(1, dw_5.rowcount(), Primary!, dw_5, 1, delete! )
			  end if
    end choose
next

ll_parentteam = tv_1.finditem(parenttreeitem!, ll_team)
if wf_update4(dw_1,dw_3,dw_4,dw_5,"Y") = true then
   dw_1.accepttext()
	for i = 1 to ll_cnt1
		 tv_1.getitem(ll_team,ltv_team)
		 ltv_team.label = trim(dw_1.object.#1[ll_num1[i]]) + " " + trim(dw_1.object.#2[ll_num1[i]])
		 ii_chk = 1
		 tv_1.InsertItemfirst(ll_team, ltv_team)
	next
   tv_1.SelectItem(ll_team)
	tv_1.getitem(ll_team,ltv_team)
	ll_row = dw_1.retrieve(LeftA(string(ltv_team.label),5))
	ll_childteam = tv_1.finditem(childtreeitem!, ll_team)
	if ll_childteam = -1 then return
	
	for i = 1 to ll_row
		 tv_1.getitem(ll_childteam,ltv_team)
		 ll_cnt = wf_strchk(ltv_team.label)
		 if LeftA(ltv_team.label,ll_cnt) = trim(dw_1.object.#1[i]) then
			 ll_childteam = tv_1.finditem(nexttreeitem!, ll_childteam)
			 if ll_childteam = -1 then exit
			 i = 0
			 continue
		 end if
		 if i = ll_row then
			 ll_childteam1 = tv_1.finditem(nexttreeitem!, ll_childteam)
			 ii_chk = 1
			 tv_1.deleteitem(ll_childteam)			 
			 if ll_childteam1 = -1 then exit
			 ll_childteam = ll_childteam1
			 i = 0
		 end if 
	next
end if


end event

type dw_1 from w_inheritance`dw_1 within w_program_m
integer x = 1925
integer y = 308
integer width = 1541
integer height = 1768
integer taborder = 60
string dataobject = "d_group"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_program_m
boolean visible = false
integer x = 1925
integer y = 36
integer width = 247
integer height = 188
integer taborder = 80
string dragicon = "Rectangle!"
string dataobject = "d_group"
boolean border = false
end type

event dw_2::rbuttondown;call super::rbuttondown;if this.DragAuto = TRUE then
	this.DragAuto = False
else
	this.DragAuto = TRUE
end if
end event

type st_title from w_inheritance`st_title within w_program_m
integer x = 41
integer y = 40
integer width = 1792
string text = "프로그램 등록"
end type

type st_tips from w_inheritance`st_tips within w_program_m
end type

type pb_compute from w_inheritance`pb_compute within w_program_m
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_program_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_program_m
integer x = 3255
integer y = 68
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_program_m
integer x = 2871
integer y = 68
integer taborder = 140
end type

event pb_print::clicked;long ll_row,i,j,k,ll_cnt1,ll_team,kk
treeviewitem    ltv_team,ltv_team1
string ls_team,ls_group,ls_menu1,ls_menu2,ls_menu3,ls_str,ls_clause
long ll_cnt,ll_parent
integer li_FileNum


ls_team = trim(dw_1.getitemstring(dw_1.getrow(),'group_id'))
ls_clause = " where menu1.group_id = ~~'" + ls_team + "~~'"
is_where = "DataWindow.Table.Select='" + is_select1 + ls_clause + "'"			
ll_row = wf_retrieve(dw_3,is_where)

if ll_row < 1 then return
li_FileNum = FileOpen("C:\windows\" + ls_team +"1.DAT", LineMode!, Write!, LockWrite!, Replace!)
FileWrite(li_FileNum, "Choose Case arg_str1")

for i = 1 to ll_row
    ls_group = trim(dw_3.object.group_id[i])
	 ls_menu1 = trim(dw_3.object.menu1[i])
	 ls_str = "    Case '" + ls_menu1 + "'"
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "        IF arg_str2 = 'Y' THEN "
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "           " + ls_group + "." + ls_menu1 + ".visible = True " 
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "        ELSE "
	 FileWrite(li_FileNum, ls_str)
    ls_str = "           " + ls_group + "." + ls_menu1 + ".visible = False "
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "        END IF "
	 FileWrite(li_FileNum, ls_str)
next
FileWrite(li_FileNum, "End Choose ")
FileClose(li_FileNum)


li_FileNum = FileOpen("C:\windows\" + ls_team +"2.DAT", LineMode!, Write!, LockWrite!, Replace!)
FileWrite(li_FileNum, "Choose Case arg_str1")

for i = 1 to ll_row
    ls_group = trim(dw_3.object.group_id[i])
	 ls_menu1 = trim(dw_3.object.menu1[i])
	 ls_clause = " where menu2.group_id = ~~'" + ls_group + "~~'" &
	           + " and menu2.menu1 = ~~'" + ls_menu1 +"~~'"
	 is_where = "DataWindow.Table.Select='" + is_select2 + ls_clause +"'"
	 ll_cnt = wf_retrieve(dw_4,is_where)
	 if ll_cnt < 1 then continue
	 ls_str = "    Case '" + ls_menu1 + "'"
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "        Choose Case arg_str2 "
	 FileWrite(li_FileNum, ls_str)
	 for j = 1 to ll_cnt
	 ls_menu2 = trim(dw_4.object.menu2[j])	
	 ls_str = "            Case '" + ls_menu2 + "'"
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "                IF arg_str3 = 'Y' THEN "
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "                   " + ls_group + "." + ls_menu1 + "." + ls_menu2 + ".visible = True " 
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "                ELSE "
	 FileWrite(li_FileNum, ls_str)
    ls_str = "                   " + ls_group + "." + ls_menu1 + "." + ls_menu2 + ".visible = False "
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "                END IF "
	 FileWrite(li_FileNum, ls_str)
    next
FileWrite(li_FileNum, "        End Choose ")	 
next
FileWrite(li_FileNum, "End Choose ")
FileClose(li_FileNum)

li_FileNum = FileOpen("C:\windows\" + ls_team +"3.DAT", LineMode!, Write!, LockWrite!, Replace!)
FileWrite(li_FileNum, "Choose Case arg_str1")

for i = 1 to ll_row
    ls_group = trim(dw_3.object.group_id[i])
	 ls_menu1 = trim(dw_3.object.menu1[i])
	 ls_clause = " where menu2.group_id = ~~'" + ls_group + "~~'" &
	           + " and menu2.menu1 = ~~'" + ls_menu1 +"~~'"
	 is_where = "DataWindow.Table.Select='" + is_select2 + ls_clause +"'"	 
	 ll_cnt = wf_retrieve(dw_4,is_where)
	 if ll_cnt < 1 then continue
	 ls_str = "    Case '" + ls_menu1 + "'"
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "        Choose Case arg_str2 "
	 FileWrite(li_FileNum, ls_str)
	 kk = 0
	 for j = 1 to ll_cnt
	 ls_menu2 = trim(dw_4.object.menu2[j])	
	 ls_clause = " where menu3.group_id = ~~'" + ls_group + "~~'" &
	           + " and menu3.menu1 = ~~'" + ls_menu1 +"~~'" &
				  + " and menu3.menu2 = ~~'" + ls_menu2 +"~~'"
	 is_where = "DataWindow.Table.Select='" + is_select3 + ls_clause +"'"	 
	 ll_cnt1 = wf_retrieve(dw_5,is_where)
	 if ll_cnt1 < 1 then continue
	 kk = 1
	 ls_str = "            Case '" + ls_menu2 + "'"
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "                Choose Case arg_str3 "
	 FileWrite(li_FileNum, ls_str)
	 for k = 1 to ll_cnt1
	 ls_menu3 = trim(dw_5.object.menu3[k])	
	 ls_str = "                     Case '" + ls_menu3 + "'"
	 FileWrite(li_FileNum, ls_str)	 
	 ls_str = "                         IF arg_str4 = 'Y' THEN "
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "                            " + ls_group + "." + ls_menu1 + "." + ls_menu2 + "." + ls_menu3 + ".visible = True " 
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "                         ELSE "
	 FileWrite(li_FileNum, ls_str)
    ls_str = "                            " + ls_group + "." + ls_menu1 + "." + ls_menu2 + "." + ls_menu3 + ".visible = False "
	 FileWrite(li_FileNum, ls_str)
	 ls_str = "                         END IF "
	 FileWrite(li_FileNum, ls_str)
    next
    FileWrite(li_FileNum, "                End Choose ")	 
    next
	 if kk = 0  then
		 ls_str = "            Case 'zzzzzzzzzzzz'"
	    FileWrite(li_FileNum, ls_str)
	 end if
    FileWrite(li_FileNum, "        End Choose ")	 
next
FileWrite(li_FileNum, "End Choose ")
FileClose(li_FileNum)




end event

type pb_cancel from w_inheritance`pb_cancel within w_program_m
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_program_m
integer x = 2679
integer y = 68
integer taborder = 160
end type

event pb_delete::clicked;call super::clicked;dw_1.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_program_m
integer x = 2487
integer y = 68
integer taborder = 180
end type

event pb_insert::clicked;call super::clicked;long ll_row,ll_team,n=3
treeviewitem    ltv_team,ltv_team1
string ls_team,ls_str1,ls_str2,ls_str3
long ll_cnt,ll_parent

ll_team = tv_1.finditem(CurrentTreeItem!,0)
tv_1.getitem(ll_team,ltv_team)

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)

choose case ltv_team.level
	case 1

	case 2
		  ll_cnt = wf_strchk(ltv_team.label)
		  ls_str1 = LeftA(string(ltv_team.label),ll_cnt)
		  dw_1.setitem(ll_row,n,ls_str1)
	case 3
		  ll_cnt = wf_strchk(ltv_team.label)
		  ls_str1 = LeftA(string(ltv_team.label),ll_cnt)
		  ll_parent = tv_1.finditem( ParentTreeItem! , ll_team)
		  tv_1.getitem(ll_parent,ltv_team1)

		  ll_cnt = wf_strchk(ltv_team1.label)
		  ls_str2 = LeftA(string(ltv_team1.label),ll_cnt)		  
		  dw_1.setitem(ll_row,n,ls_str2)
		  n++
		  dw_1.setitem(ll_row,n,ls_str1)
	case 4
		  ll_cnt = wf_strchk(ltv_team.label)
		  ls_str1 = LeftA(string(ltv_team.label),ll_cnt)
		  ll_parent = tv_1.finditem( ParentTreeItem! , ll_team)
		  tv_1.getitem(ll_parent,ltv_team1)
		  ll_cnt = wf_strchk(ltv_team1.label)
		  ls_str2 = LeftA(string(ltv_team1.label),ll_cnt)
		  ll_parent = tv_1.finditem( ParentTreeItem! , ll_parent)
		  tv_1.getitem(ll_parent,ltv_team1)
		  
		  ll_cnt = wf_strchk(ltv_team1.label)
		  ls_str3 = LeftA(string(ltv_team1.label),ll_cnt)
		  dw_1.setitem(ll_row,n,ls_str3)			  
		  n++
		  dw_1.setitem(ll_row,n,ls_str2)
		  n++
		  dw_1.setitem(ll_row,n,ls_str1)	  
	case else
		dw_1.deleterow(0)
		return
end choose

dw_1.setcolumn(1)
dw_1.setfocus()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_program_m
boolean visible = false
integer taborder = 170
end type

type gb_3 from w_inheritance`gb_3 within w_program_m
integer x = 1902
integer y = 260
integer width = 1591
integer height = 1840
integer taborder = 100
end type

type gb_2 from w_inheritance`gb_2 within w_program_m
boolean visible = false
integer taborder = 110
end type

type gb_1 from w_inheritance`gb_1 within w_program_m
integer x = 2418
integer y = 28
integer width = 1042
integer taborder = 50
end type

type tv_1 from treeview within w_program_m
event begindrag pbm_tvnbegindrag
event clicked pbm_tvnclicked
event doubleclicked pbm_tvndoubleclicked
event dragdrop pbm_tvndragdrop
event dragwithin pbm_tvndragwithin
event selectionchanged pbm_tvnselchanged
integer x = 69
integer y = 336
integer width = 1774
integer height = 1720
integer taborder = 90
string dragicon = "C:\Bmp\man.ico"
boolean dragauto = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
boolean border = false
boolean hideselection = false
string picturename[] = {"Custom039!","Custom050!"}
long picturemaskcolor = 553648127
string statepicturename[] = {"Custom039!","Custom050!","Custom050!","Custom050!","Custom050!","Custom050!"}
long statepicturemaskcolor = 553648127
end type

event selectionchanged;TreeViewitem ltv_team,ltv_team1
LONG ll_Row, ll_tvi,ll_cnt,ll_parent
STRING ls_team,ls_str1,ls_str2,ls_str3
datawindowchild ldwc_team

if ii_chk = 1  then 
	ii_chk = 0
	return
end if

ih_Curteam = newhandle
GetItem( newhandle , ltv_team )

choose case ltv_team.level
	case 0
		  return		  
	case 1
		  dw_1.dataobject = 'd_group'
		  dw_1.settransobject(sqlca)
		  is_where = "DataWindow.Table.Select='" + is_select + "'"
		  
	case 2
		  ll_cnt  = wf_strchk(ltv_team.label)
		  ls_str1 = LeftA(string(ltv_team.label),ll_cnt)
		  dw_1.dataobject = 'd_menu'
		  dw_1.settransobject(sqlca)
        is_clause = " where menu1.group_id = ~~'" + ls_str1 +"~~'"
        is_where  = "DataWindow.Table.Select='" + is_select1 + is_clause + "'"
		  
	case 3
		  ll_cnt  = wf_strchk(ltv_team.label)
		  ls_str1 = LeftA(string(ltv_team.label),ll_cnt)
		  dw_1.dataobject = 'd_menu1'
		  dw_1.settransobject(sqlca)
		  
		  ll_parent = tv_1.finditem( ParentTreeItem! , newhandle)
		  tv_1.getitem(ll_parent,ltv_team1)
		  ll_cnt  = wf_strchk(ltv_team1.label)
		  ls_str2 = LeftA(string(ltv_team1.label),ll_cnt)		  
		  
        is_clause = " where menu2.group_id = ~~'" + ls_str2 +"~~'" &
		            + "   and menu2.menu1    = ~~'" + ls_str1 +"~~'"
        is_where = "DataWindow.Table.Select='" + is_select2 + is_clause + "'"		
		  
	case 4
		  ll_cnt = wf_strchk(ltv_team.label)
		  dw_1.dataobject = 'd_menu2'
		  dw_1.settransobject(sqlca)
		  ls_str1 = LeftA(string(ltv_team.label),ll_cnt)
		  
		  ll_parent = tv_1.finditem( ParentTreeItem! , newhandle)
		  tv_1.getitem(ll_parent,ltv_team1)
		  
		  ll_cnt = wf_strchk(ltv_team1.label)
		  ls_str2 = LeftA(string(ltv_team1.label),ll_cnt)
		  
		  ll_parent = tv_1.finditem( ParentTreeItem! , ll_parent)
		  tv_1.getitem(ll_parent,ltv_team1)
		  
		  ll_cnt = wf_strchk(ltv_team1.label)
		  ls_str3 = LeftA(string(ltv_team1.label),ll_cnt)		  
		  
        is_clause = " where menu3.group_id = ~~'" + ls_str3 +"~~'" + &
		            + "   and menu3.menu1    = ~~'" + ls_str2 +"~~'" + &
						+ "   and menu3.menu2    = ~~'" + ls_str1 +"~~'"
        is_where = "DataWindow.Table.Select='" + is_select3 + is_clause + "'"		
		  
	case else
		dw_1.reset()
		return
end choose

if wf_retrieve(dw_1,is_where) < 1 then	return
if ltv_team.Children = true then return	

wf_make_team(ltv_team.label)

end event

type gb_4 from groupbox within w_program_m
integer x = 37
integer y = 256
integer width = 1838
integer height = 1848
integer taborder = 70
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 79741120
end type

type dw_3 from datawindow within w_program_m
integer x = 1865
integer y = 92
integer width = 137
integer height = 112
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_menu"
boolean livescroll = true
end type

type dw_4 from datawindow within w_program_m
integer x = 2016
integer y = 92
integer width = 137
integer height = 112
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_menu1"
boolean livescroll = true
end type

type dw_5 from datawindow within w_program_m
integer x = 2167
integer y = 92
integer width = 137
integer height = 112
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_menu2"
boolean livescroll = true
end type

