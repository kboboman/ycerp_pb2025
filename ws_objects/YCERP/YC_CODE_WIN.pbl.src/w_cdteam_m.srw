$PBExportHeader$w_cdteam_m.srw
$PBExportComments$팀관리(1998/02/03,곽용덕)
forward 
global type w_cdteam_m from window
end type
type dw_9 from datawindow within w_cdteam_m
end type
type tv_1 from treeview within w_cdteam_m
end type
type pb_5 from picturebutton within w_cdteam_m
end type
type pb_4 from picturebutton within w_cdteam_m
end type
type pb_3 from picturebutton within w_cdteam_m
end type
type pb_2 from picturebutton within w_cdteam_m
end type
type pb_1 from picturebutton within w_cdteam_m
end type
type st_tips from statictext within w_cdteam_m
end type
type dw_8 from datawindow within w_cdteam_m
end type
type dw_7 from datawindow within w_cdteam_m
end type
type dw_6 from datawindow within w_cdteam_m
end type
type dw_5 from datawindow within w_cdteam_m
end type
type tab_1 from tab within w_cdteam_m
end type
type tabpage_1 from userobject within tab_1
end type
type dw_10 from datawindow within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type dw_2 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_10 dw_10
st_1 st_1
dw_3 dw_3
dw_2 dw_2
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
end type
type tab_1 from tab within w_cdteam_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_1 from datawindow within w_cdteam_m
end type
type st_title from statictext within w_cdteam_m
end type
type gb_2 from groupbox within w_cdteam_m
end type
type gb_1 from groupbox within w_cdteam_m
end type
end forward

global type w_cdteam_m from window
integer x = 5
integer y = 12
integer width = 4576
integer height = 2620
boolean titlebar = true
string title = "팀관리(w_cdteam_m)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
dw_9 dw_9
tv_1 tv_1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_tips st_tips
dw_8 dw_8
dw_7 dw_7
dw_6 dw_6
dw_5 dw_5
tab_1 tab_1
dw_1 dw_1
st_title st_title
gb_2 gb_2
gb_1 gb_1
end type
global w_cdteam_m w_cdteam_m

type variables
public int ii_chk = 0
long   ih_curteam
long   il_DragSource, il_DragParent, il_DropTarget
st_print i_print
datawindow dw2, dw3, dw4, dw10
end variables

forward prototypes
public function boolean wf_makeonelevelbom (string as_str)
public function boolean wf_make_team (string as_str, integer ai_cnt)
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
public function boolean wf_update2 (datawindow arg_dw1, datawindow arg_dw2, string arg_str)
end prototypes

public function boolean wf_makeonelevelbom (string as_str);TreeViewitem ltv_team
int    ll_Count, lh_team, l
long   ll_len
string ls_Component, ls_Source

ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2
ltv_team.Label = "00000 유창"

tv_1.Deleteitem(0)
lh_team = tv_1.InsertitemSort( 0, ltv_team )

ll_count = dw_1.rowcount()
for l = 1 to ll_Count
	if dw_1.object.team_name[l] = "" then
	else
		ltv_team.Label = dw_1.object.team_code[l] + " " + dw_1.object.team_name[l]
		tv_1.InsertitemSort( lh_team, ltv_team )
		tv_1.ExpandAll( lh_team )
	end if
next

RETURN( true )

end function

public function boolean wf_make_team (string as_str, integer ai_cnt);// as_str  string  value
TreeViewitem ltv_team
int  ll_Count, lh_team, l
long ll_len


ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2

ll_count = dw_1.rowcount()
for l = 1 to ll_Count
	ltv_team.Label = dw_1.object.team_code[l] + " " + dw_1.object.team_name[l]

	lh_team = tv_1.FindItem( CurrentTreeItem! , 0 )
	
	tv_1.InsertitemSort( lh_team, ltv_team )
	tv_1.ExpandAll( lh_team )
next

RETURN( true )


end function

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었읍니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

public function boolean wf_update2 (datawindow arg_dw1, datawindow arg_dw2, string arg_str);if arg_dw1.update(true,false) = 1 then
	if arg_dw2.update(true,true) = 1 then
	   commit;
		arg_dw1.resetupdate()
		if (arg_str = "Y") or (arg_str = "y") then
	      MessageBox("확인", "저장되었읍니다.")
		end if
		return true
	else
	   rollback;
	   MessageBox("오류", "저장 실패!")		
		return false
	end if	
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if


end function

on w_cdteam_m.create
this.dw_9=create dw_9
this.tv_1=create tv_1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_tips=create st_tips
this.dw_8=create dw_8
this.dw_7=create dw_7
this.dw_6=create dw_6
this.dw_5=create dw_5
this.tab_1=create tab_1
this.dw_1=create dw_1
this.st_title=create st_title
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.dw_9,&
this.tv_1,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_tips,&
this.dw_8,&
this.dw_7,&
this.dw_6,&
this.dw_5,&
this.tab_1,&
this.dw_1,&
this.st_title,&
this.gb_2,&
this.gb_1}
end on

on w_cdteam_m.destroy
destroy(this.dw_9)
destroy(this.tv_1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_tips)
destroy(this.dw_8)
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.tab_1)
destroy(this.dw_1)
destroy(this.st_title)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)
dw_8.settransobject(sqlca)
dw_9.settransobject(sqlca)

dw2  = tab_1.tabpage_1.dw_2
dw3  = tab_1.tabpage_1.dw_3
dw10 = tab_1.tabpage_1.dw_10
dw4  = tab_1.tabpage_2.dw_4

dw2.settransobject(sqlca)
dw3.settransobject(sqlca)
dw10.settransobject(sqlca)
dw4.settransobject(sqlca)

dw_1.retrieve("00000")
tab_1.tabpage_1.dw_2.retrieve('00000')
tab_1.tabpage_1.dw_3.retrieve('00000')

wf_MakeOneLevelBOM( "00000" )

tv_1.setfocus()
end event

event resize;//
long  ll_width, ll_height

debugbreak()

gb_2.height = newheight - 272
tv_1.height = newheight - 368

tab_1.width  = newwidth  - 1421
tab_1.height = newheight - 292

ll_width    = tab_1.width  - tab_1.tabpage_1.width
ll_height   = tab_1.height - tab_1.tabpage_1.height

dw3.width   = tab_1.width  - 92

ll_width    = tab_1.width  - 92
ll_height   = tab_1.height - dw3.y - dw3.height - 150 // 128

dw10.width  = ll_width
dw10.height = ll_height

// 
dw4.width   = tab_1.width  - 92
dw4.height  = tab_1.height - 172


end event

type dw_9 from datawindow within w_cdteam_m
boolean visible = false
integer x = 1536
integer y = 36
integer width = 274
integer height = 180
integer taborder = 140
string dataobject = "d_cdteam_r1"
boolean livescroll = true
end type

type tv_1 from treeview within w_cdteam_m
event begindrag pbm_tvnbegindrag
event clicked pbm_tvnclicked
event dragdrop pbm_tvndragdrop
event dragwithin pbm_tvndragwithin
event selectionchanged pbm_tvnselchanged
integer x = 69
integer y = 304
integer width = 1262
integer height = 2148
integer taborder = 70
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
boolean disabledragdrop = false
boolean hideselection = false
string picturename[] = {"Custom039!","Custom050!"}
long picturemaskcolor = 553648127
string statepicturename[] = {"Custom039!","Custom050!","Custom050!","Custom050!","Custom050!","Custom050!"}
long statepicturemaskcolor = 553648127
end type

event begindrag;TreeViewItem		ltvi_Source

tv_1.GetItem(handle, ltvi_Source)

// Make sure only employees are being dragged
If ltvi_Source.Level = 1 Then
	This.Drag(Cancel!)
Else
	// Save the handle of the item that is being dragged and its parent (department)
	il_DragSource = handle
	il_DragParent = FindItem(ParentTreeItem!, handle)
End If

end event

event clicked;//treeviewitem ltv_team
//long ll_team
//
//ll_team = tv_1.finditem(CurrentTreeItem!,0)
//tv_1.GetItem(ll_team , ltv_team )
//
//tab_1.tabpage_1.dw_2.retrieve(left(string(ltv_team.label),5))
//tab_1.tabpage_1.dw_3.retrieve(left(string(ltv_team.label),5))
//tab_1.tabpage_2.dw_4.retrieve(left(string(ltv_team.label),5))
end event

event dragdrop;TreeViewItem  ltvi_Target, ltvi_Source, ltvi_Parent, ltvi_New,ltv_team,ltv_team1,ltv_list
Integer li_Pending
long    j, ll_cnt1, ii, ll_diff, ll_row1, ll_len
Long    ll_NewItem, ll_team, ll_childteam, i, ll_parentteam, ll_team1, ll_row, ll_cnt, ll_chk
string  ls_str, ls_str1, ls_team, ls_team1, ls_label, ls_str2, ls_parentteam, ls_str3

IF source.TypeOf( ) = datawindow! THEN
	tab_1.tabpage_2.dw_4.accepttext()
	GetItem(il_DropTarget, ltvi_Target)
	ls_team = LeftA(ltvi_Target.label,5)
   If MessageBox("확인", "정말로 " + ls_team + "으로 이동하시겠읍니까?  ", Question!, YesNo!) = 2 Then Return	
	
	if ls_team = tab_1.tabpage_2.dw_4.object.team_code[tab_1.tabpage_2.dw_4.GetRow()] then
		return
	end if
	
	messagebox('',ls_team)
	tab_1.tabpage_2.dw_4.object.team_code[1] = ls_team
	ll_row = tab_1.tabpage_2.dw_4.getrow()
	
	messagebox('',string(ll_row))
	tab_1.tabpage_2.dw_4.RowsMove(ll_row, ll_row, Primary!,tab_1.tabpage_2.dw_4, 1, Filter! )
//	tab_1.tabpage_2.dw_4.accepttext()
   if wf_update1(tab_1.tabpage_2.dw_4,"Y") = false then
      tab_1.tabpage_2.dw_4.retrieve(ls_team)
		tab_1.tabpage_2.dw_4.scrolltorow(ll_row)
	end if	
	
   return
END IF

tv_1.SetRedraw(TRUE)
If GetItem(il_DropTarget, ltvi_Target) = -1 Then Return
If GetItem(il_DragSource, ltvi_Source) = -1 Then Return

GetItem(il_DragParent, ltvi_Parent)
If MessageBox("확인", "정말로 " + &
					LeftA(string(ltvi_Source.Label),5) + " from " + &
					LeftA(string(ltvi_Parent.label),5) + " to " + LeftA(ltvi_Target.label,5) + &
					"?", Question!, YesNo!) = 2 Then Return

//If Not ltvi_Target.Expanded Then
//	Trigger Event ItemExpanding(il_DropTarget)
//End If

SetDropHighlight(0)

//SetNull(ltvi_Source.ItemHandle)
ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2
ltv_list.PictureIndex = 1
ltv_list.SelectedPictureIndex = 2
ltv_team.label = ltvi_Source.label
GetItem(il_DropTarget, ltvi_Target)
if ltvi_Target.Children = false then
   ll_row = dw_1.retrieve(LeftA(string(ltvi_Target.label),5))
   for i = 1 to ll_row
		 ltv_list.Label = dw_1.object.team_code[i] + " " + dw_1.object.team_name[i]
		 ii_chk = 1
		 InsertItemFirst(il_DropTarget, ltv_list)
	next
end if

ii_chk = 1
ll_NewItem = InsertItemFirst(il_DropTarget, ltv_team)
tv_1.ExpandItem(il_DropTarget)
ll_parentteam = tv_1.finditem(childTreeItem!,il_DropTarget)
ii_chk = 1
tv_1.selectitem(ll_parentteam)
ii_chk = 0
ll_parentteam = tv_1.finditem(childTreeItem!,ll_parentteam)

for i = 1 to 9
	 if ll_parentteam = -1 then
		 exit
	 else
		 DeleteItem(ll_parentteam)
	end if
next


ll_team = tv_1.finditem(CurrentTreeItem!,0)
ll_parentteam = tv_1.finditem(parentTreeItem!,ll_team)
tv_1.getitem(ll_team,ltv_team)
tv_1.getitem(il_DropTarget,ltv_team1)
ll_chk = ltv_team1.level
if ltv_team1.level >= ltvi_Source.level then
	if ltv_team1.level > ltvi_Source.level then
      ls_str = LeftA(ltvi_Source.label,ltvi_Source.level - 1)
		ls_str2 = LeftA(ltvi_Source.label,5)
	else
		ls_str = LeftA(ltv_team.label,ll_chk - 1)
		ls_str2 = LeftA(ltv_team.label,5)
	end if
   ls_str1 = ls_str + '%'
else
   ls_str = LeftA(ltv_team.label,ltvi_Source.level - 1)
   ls_str1 = ls_str + '%'
	ls_str2 = LeftA(ltv_team.label,5)
end if

ll_row = dw_7.retrieve(ls_str1)
ll_row1 = dw_8.retrieve(ls_str1)
ls_str = LeftA(ltv_team1.label,ll_chk)
for i = 1 to ll_row
	 ls_team = dw_7.object.team_code[i]
	 ls_parentteam = dw_7.object.team_code[i]
	 
	 if (LeftA(ltv_team.label,5) = ls_team) then
		 ll_cnt  = 5 - ltv_team1.level
		 for ii = 1 to 9
			  ls_team1 = LeftA(ls_str,ltv_team1.level - 1) + string(ii) + MidA('00000',ltv_team.level,ll_cnt)
			  select count(*) into :ll_cnt1 from team where team_code = :ls_team1;
			  if ll_cnt1 > 0 then 
				  continue
			  else
				  ls_str = LeftA(ls_str,ltv_team1.level - 1) + string(ii) 
				  exit
			  end if
		 next
	    dw_7.object.team_code[i] = ls_team1
		 ls_str3 = ls_team1
		 dw_7.object.parent_code[i] = LeftA(ltv_team1.label,5)
		 dw_7.accepttext()
		 for ii = 1 to ll_row 
			  if ls_team = dw_7.object.parent_code[ii] then
				  dw_7.object.parent_code[ii] = ls_team1
			  end if
		 next
		 dw_8.accepttext()
		 for ii = 1 to ll_row1 
			  if ls_team = dw_8.object.team_code[ii] then
				  dw_8.object.team_code[ii] = ls_team1
			  end if
		 next		 
	 else
		 ll_cnt  = 5 - ltv_team1.level

		 for ii = 1 to 9
			  if ltv_team1.level > ltvi_Source.level then 
			     ls_team1 = ls_str + string(ii) + MidA('0000000000',ltv_team.level + 1,ll_cnt - 1)
			  else
				  ll_diff = ltv_team.level - ltv_team1.level
				  ls_team1 = ls_str + string(ii)  + LeftA('00000',ll_cnt - 1)
			  end if
			  dw_7.accepttext()
			  if ls_team1 = dw_7.object.team_code[i - 1] then
				  ls_str = ls_str + string(ii)
				  ii = 0
				  ll_cnt = ll_cnt - 1
				  continue
			  end if 
			  select count(*) into :ll_cnt1 from team where team_code like :ls_team1;
			  if ll_cnt1 > 0 then 
				  continue
			  else
				  exit
			  end if
		 next		 
	    dw_7.object.team_code[i] = ls_team1
		 dw_7.accepttext()
		 for ii = 1 to ll_row 
			  if ls_team = dw_7.object.parent_code[ii] then
				  dw_7.object.parent_code[ii] = ls_team1
			  end if
		 next	
		 dw_8.accepttext()
		 for ii = 1 to ll_row1 
			  if ls_team = dw_8.object.team_code[ii] then
				  dw_8.object.team_code[ii] = ls_team1
			  end if
		 next			 
	 end if
next

if wf_update2(dw_7,dw_8,"Y") = true then
	 ii_chk = 1
    DeleteItem(il_DragSource)

	 ls_team = ltv_team.label
	 ll_cnt  = 36 - 6
	 ltv_team.label = ls_str3 + MidA(ls_team,6,ll_cnt)
	 tv_1.SetItem ( ll_team, ltv_team )
	 ls_team = LeftA(ls_team,5)
	 
    ll_team = tv_1.finditem(CurrentTreeItem!,0)
    tv_1.GetItem(ll_team , ltv_team )
    tab_1.tabpage_1.dw_2.retrieve(LeftA(string(ltv_team.label),5))
    tab_1.tabpage_1.dw_3.retrieve(LeftA(string(ltv_team.label),5))
	 tab_1.tabpage_2.dw_4.retrieve(LeftA(string(ltv_team.label),5))
else
	 ll_team = tv_1.finditem(CurrentTreeItem!,0)
	 ii_chk = 1
    tv_1.DeleteItem(ll_team)
	 tv_1.selectitem(il_DragSource)
end if

end event

event dragwithin;TreeViewItem		ltvi_Over

If GetItem(handle, ltvi_Over) = -1 Then
	SetDropHighlight(0)
	il_DropTarget = 0
	Return
End If



If handle <> il_DragParent Then
//		SetDropHighlight(handle)
		il_DropTarget = handle
Else
		SetDropHighlight(0)
		il_DropTarget = 0
End If

end event

event selectionchanged;//
TreeViewitem ltv_team
long   ll_Row, ll_tvi
string ls_label, ls_label5, ls_teamno

if ii_chk = 1  then 
	ii_chk = 0
	RETURN
end if

ih_Curteam = newhandle
tv_1.GetItem( newhandle , ltv_team )

ls_label  = string(ltv_team.label)
ls_label5 = LeftA(ls_label, 5)

dw4.retrieve( ls_label5 )
dw10.retrieve( ls_label5 )

if dw2.retrieve( ls_label5 ) < 1 then RETURN
if dw3.retrieve( ls_label5 ) < 1 then RETURN

if ltv_team.Children = true then RETURN	
if dw_1.retrieve( ls_label5 ) < 1 then	RETURN

wf_make_team(ltv_team.label, ltv_team.PictureIndex + 1)

end event

event doubleclicked;//treeviewitem ltv_team
//long ll_team
//
//ll_team = tv_1.finditem(CurrentTreeItem!,0)
//tv_1.GetItem(ll_team , ltv_team )
//
//tab_1.tabpage_1.dw_2.retrieve(left(string(ltv_team.label),5))
//tab_1.tabpage_1.dw_3.retrieve(left(string(ltv_team.label),5))
//tab_1.tabpage_2.dw_4.retrieve(left(string(ltv_team.label),5))
end event

type pb_5 from picturebutton within w_cdteam_m
event mousemove pbm_mousemove
integer x = 4283
integer y = 64
integer width = 178
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"닫기",parent, li_x, li_y)

//Parent.wf_Help( "작업을 종료하고 창을 닫습니다....." )

end event

event clicked;close(parent)
end event

type pb_4 from picturebutton within w_cdteam_m
event mousemove pbm_mousemove
integer x = 4096
integer y = 64
integer width = 178
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"저장",parent, li_x, li_y)

//Parent.wf_Help( "작업을 종료하고 창을 닫습니다....." )

end event

event clicked;long ll_team,ll_row,ll_num1[100],ll_num2[100],ll_cnt1,ll_cnt2,i,ll_row1
long ll_parentteam,ll_childteam,ll_childteam1
dwItemStatus l_status
string ls_team,ls_teamlike
treeviewitem ltv_team
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

tab_1.tabpage_1.dw_3.accepttext()
ll_row = tab_1.tabpage_1.dw_3.rowcount()

ll_cnt1 = 0
ll_cnt2 = 0

for i = 1 to ll_row
	 l_status = tab_1.tabpage_1.dw_3.GetItemStatus(i, 0, Primary!)
	 if l_status = newmodified! then
		 ll_cnt1++
		 ll_num1[ll_cnt1] = i
	 end if
next 

ll_row = tab_1.tabpage_1.dw_3.deletedcount()

ll_team = tv_1.FindItem(CurrentTreeItem! , 0)
tv_1.getitem(ll_team,ltv_team)
for i = 1 to ll_row
	 ls_team = tab_1.tabpage_1.dw_3.GetItemString(i,"team_code", Delete!, TRUE)
	 ls_teamlike = LeftA(ls_team,ltv_team.level - 1) + '%'
	 ll_row1 = dw_5.retrieve(ls_teamlike,ls_team)
	 dw_5.RowsCopy(1, ll_row1, Primary!, dw_6, 1, delete!)
next
	 
ll_parentteam = tv_1.finditem(parenttreeitem!, ll_team)
if wf_update2(tab_1.tabpage_1.dw_3,dw_6,"Y") = true then
   tab_1.tabpage_1.dw_3.accepttext()
	for i = 1 to ll_cnt1
		 tv_1.getitem(ll_team,ltv_team)
		 ltv_team.label = tab_1.tabpage_1.dw_3.object.team_code[ll_num1[i]] + " " + tab_1.tabpage_1.dw_3.object.team_name[ll_num1[i]]
		 ii_chk = 1
		 tv_1.InsertItemfirst(ll_team, ltv_team)
	next
   tv_1.SelectItem(ll_team)
	
	tv_1.getitem(ll_team,ltv_team)
	ll_row = tab_1.tabpage_1.dw_3.retrieve(LeftA(string(ltv_team.label),5))
	ll_childteam = tv_1.finditem(childtreeitem!, ll_team)
	if ll_childteam = -1 then return
	
	for i = 1 to ll_row
		 tv_1.getitem(ll_childteam,ltv_team)
		 if LeftA(ltv_team.label,5) = tab_1.tabpage_1.dw_3.object.team_code[i] then
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

type pb_3 from picturebutton within w_cdteam_m
event mousemove pbm_mousemove
integer x = 3909
integer y = 64
integer width = 178
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"인쇄",parent, li_x, li_y)

//Parent.wf_Help( "작업을 종료하고 창을 닫습니다....." )

end event

event clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

i_print.st_datawindow = dw_9
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 팀 마스터를 출력합니다." 
dw_9.retrieve()
gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=120'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)



end event

type pb_2 from picturebutton within w_cdteam_m
event mousemove pbm_mousemove
integer x = 3721
integer y = 64
integer width = 178
integer height = 144
integer taborder = 90
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)

//Parent.wf_Help( "작업을 종료하고 창을 닫습니다....." )

end event

event clicked;tab_1.tabpage_1.dw_3.deleterow(0)
end event

type pb_1 from picturebutton within w_cdteam_m
event mousemove pbm_mousemove
integer x = 3534
integer y = 64
integer width = 178
integer height = 144
integer taborder = 150
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)

//Parent.wf_Help( "작업을 종료하고 창을 닫습니다....." )

end event

event clicked;long ll_row,ll_team,i,ll_cnt1
treeviewitem    ltv_team
string ls_team,ls_team1,ls_str

ll_team = tv_1.finditem(CurrentTreeItem!,0)
tv_1.getitem(ll_team,ltv_team)

ls_team = LeftA(string(ltv_team.label),5)
ls_team1 = LeftA(string(ltv_team.label),ltv_team.level - 1)
ll_row = tab_1.tabpage_1.dw_3.insertrow(0)
tab_1.tabpage_1.dw_3.scrolltorow(ll_row)
tab_1.tabpage_1.dw_3.setitem(ll_row,'parent_code',ls_team)
for i = 1 to 9
	 ls_str = ls_team1 + string(i) + '000000000'
	 ls_str = LeftA(ls_str,5)
	 select count(*) into :ll_cnt1 from team where team_code = :ls_str;
	 if ll_cnt1 > 0 then 
	    continue
	 else
		 tab_1.tabpage_1.dw_3.setitem(ll_row,'team_code',ls_str)
	    exit
	 end if	 
next
tab_1.tabpage_1.dw_3.setcolumn('team_name')
tab_1.tabpage_1.dw_3.setfocus()
end event

type st_tips from statictext within w_cdteam_m
boolean visible = false
integer x = 1664
integer y = 96
integer width = 247
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 12632256
boolean enabled = false
boolean focusrectangle = false
end type

type dw_8 from datawindow within w_cdteam_m
boolean visible = false
integer x = 983
integer width = 421
integer height = 224
integer taborder = 20
string dataobject = "d_cdlogin_m"
boolean livescroll = true
end type

type dw_7 from datawindow within w_cdteam_m
boolean visible = false
integer x = 1495
integer width = 850
integer height = 212
integer taborder = 100
string dataobject = "d_cdteam2_m"
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_6 from datawindow within w_cdteam_m
boolean visible = false
integer x = 1746
integer y = 40
integer width = 128
integer height = 176
integer taborder = 110
string dataobject = "d_cdteam1_m"
boolean livescroll = true
end type

type dw_5 from datawindow within w_cdteam_m
boolean visible = false
integer x = 1563
integer y = 36
integer width = 768
integer height = 184
integer taborder = 120
string dataobject = "d_cdteam1_m"
boolean vscrollbar = true
boolean livescroll = true
end type

type tab_1 from tab within w_cdteam_m
integer x = 1381
integer y = 260
integer width = 3118
integer height = 2224
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 77897888
boolean raggedright = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3081
integer height = 2096
long backcolor = 77897888
string text = "팀구성내역"
long tabtextcolor = 16711680
long tabbackcolor = 77897888
string picturename = "DosEdit5!"
long picturemaskcolor = 553648127
dw_10 dw_10
st_1 st_1
dw_3 dw_3
dw_2 dw_2
end type

on tabpage_1.create
this.dw_10=create dw_10
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.Control[]={this.dw_10,&
this.st_1,&
this.dw_3,&
this.dw_2}
end on

on tabpage_1.destroy
destroy(this.dw_10)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_2)
end on

type dw_10 from datawindow within tabpage_1
integer x = 18
integer y = 1164
integer width = 3026
integer height = 912
integer taborder = 30
string title = "none"
string dataobject = "d_cdlogin_l"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = StyleLowered!
end type

type st_1 from statictext within tabpage_1
integer x = 50
integer y = 56
integer width = 2048
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "팀명이 공난일 경우에 팀구성도에 나타나지 않음"
boolean focusrectangle = false
end type

type dw_3 from datawindow within tabpage_1
integer x = 18
integer y = 248
integer width = 3026
integer height = 904
integer taborder = 10
string dataobject = "d_cdteam_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = StyleLowered!
end type

type dw_2 from datawindow within tabpage_1
integer x = 23
integer y = 124
integer width = 2135
integer height = 108
integer taborder = 20
string dataobject = "d_cdteam_t"
boolean border = false
boolean livescroll = true
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3081
integer height = 2096
long backcolor = 77897888
string text = "팀구성원조회"
long tabtextcolor = 16711680
long tabbackcolor = 77897888
string picturename = "Preview!"
long picturemaskcolor = 553648127
dw_4 dw_4
end type

on tabpage_2.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_2.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_2
integer x = 14
integer y = 28
integer width = 3045
integer height = 2052
integer taborder = 52
string dragicon = "C:\Bmp\man.ico"
boolean dragauto = true
string dataobject = "d_cdlogin_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = this.getrow()
this.scrolltorow(ll_row)
end event

event clicked;//if this.rowcount() < 1 then
//	this.Drag(Cancel!)
//else
//	this.Drag(Begin!)
//end if
end event

event rbuttondown;//
if this.DragAuto = TRUE then
	this.DragAuto = False
else
	this.DragAuto = TRUE
end if
end event

type dw_1 from datawindow within w_cdteam_m
boolean visible = false
integer x = 1742
integer y = 76
integer width = 215
integer height = 108
integer taborder = 130
string dataobject = "d_cdteam_h"
boolean livescroll = true
end type

type st_title from statictext within w_cdteam_m
integer x = 41
integer y = 60
integer width = 1312
integer height = 132
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "팀(Team) 관리"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_cdteam_m
integer x = 37
integer y = 236
integer width = 1335
integer height = 2244
integer taborder = 80
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "팀구성도"
end type

type gb_1 from groupbox within w_cdteam_m
integer x = 3488
integer y = 16
integer width = 1015
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 77897888
end type

