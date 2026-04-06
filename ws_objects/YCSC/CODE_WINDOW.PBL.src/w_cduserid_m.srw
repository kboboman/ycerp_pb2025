$PBExportHeader$w_cduserid_m.srw
$PBExportComments$사용자관리(1998/02/05,곽용덕)
forward
global type w_cduserid_m from w_inheritance
end type
type tv_1 from treeview within w_cduserid_m
end type
type gb_4 from groupbox within w_cduserid_m
end type
type dw_4 from datawindow within w_cduserid_m
end type
type dw_5 from datawindow within w_cduserid_m
end type
type cb_1 from commandbutton within w_cduserid_m
end type
type cb_2 from commandbutton within w_cduserid_m
end type
type cb_3 from commandbutton within w_cduserid_m
end type
type cbx_1 from checkbox within w_cduserid_m
end type
type cb_4 from commandbutton within w_cduserid_m
end type
type cb_5 from commandbutton within w_cduserid_m
end type
type sle_1 from singlelineedit within w_cduserid_m
end type
type cb_6 from commandbutton within w_cduserid_m
end type
type sle_2 from singlelineedit within w_cduserid_m
end type
type cb_7 from commandbutton within w_cduserid_m
end type
type st_8 from statictext within w_cduserid_m
end type
type ddlb_col from dropdownlistbox within w_cduserid_m
end type
type st_9 from statictext within w_cduserid_m
end type
type ddlb_2 from dropdownlistbox within w_cduserid_m
end type
type sle_value from singlelineedit within w_cduserid_m
end type
type cb_filteron from commandbutton within w_cduserid_m
end type
type cb_filteroff from commandbutton within w_cduserid_m
end type
type cb_11 from commandbutton within w_cduserid_m
end type
type cb_12 from commandbutton within w_cduserid_m
end type
type st_filter from statictext within w_cduserid_m
end type
type st_1 from statictext within w_cduserid_m
end type
type gb_5 from groupbox within w_cduserid_m
end type
end forward

global type w_cduserid_m from w_inheritance
integer x = 5
integer y = 4
integer width = 5696
integer height = 2992
string title = "사용자 등록(w_cduserid)"
boolean center = true
tv_1 tv_1
gb_4 gb_4
dw_4 dw_4
dw_5 dw_5
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cbx_1 cbx_1
cb_4 cb_4
cb_5 cb_5
sle_1 sle_1
cb_6 cb_6
sle_2 sle_2
cb_7 cb_7
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
st_filter st_filter
st_1 st_1
gb_5 gb_5
end type
global w_cduserid_m w_cduserid_m

type variables
//Transaction SQLCA2 // Global 변수로 선언하는 것이 좋음. 
long il_dragsource,il_dragparent,il_droptarget
long ih_curteam
integer ii_chk=0
string is_chk = 'N'
st_print i_print
TreeViewitem itv_team

end variables

forward prototypes
public function boolean wf_make_team (string as_str)
public function boolean wf_make_team1 (string as_str)
public subroutine wf_ns_yoochang_connect ()
public subroutine wf_ns_yoochang_disconnect ()
end prototypes

public function boolean wf_make_team (string as_str);// as_str  string  value
TreeViewitem ltv_team
INT ll_Count, lh_team, l
long ll_len


ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2

ll_count = dw_1.rowcount()
FOR l = 1 TO ll_Count
	ltv_team.Label = dw_1.object.team_code[l] + " " + dw_1.object.team_name[l]

	lh_team = tv_1.FindItem( CurrentTreeItem! , 0 )
	tv_1.InsertitemSort( lh_team, ltv_team )
	tv_1.ExpandAll( lh_team )
NEXT

return( TRUE )


end function

public function boolean wf_make_team1 (string as_str);// as_str string boolean
TreeViewitem ltv_team
int    ll_Count, lh_team, l
long   ll_len
string ls_company, ls_Component, ls_Source

ltv_team.PictureIndex         = 1
ltv_team.SelectedPictureIndex = 2

SELECT com_name INTO :ls_company FROM glcomp;
ltv_team.Label  = "00000 " + ls_company

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

return( true )

end function

public subroutine wf_ns_yoochang_connect (); 
//Transaction SQLCA2 // Global 변수로 선언하는 것이 좋음. 

SQLCA2 = CREATE Transaction // 적당한 위치에서.. 예를 들면 App의 Open Event.. 

// Profile yoo-chang
SQLCA2.DBMS       = "MSS Microsoft SQL Server 6.x"
SQLCA2.Database   = "yoochang"
SQLCA2.LogPass    = 'yc.sa'
SQLCA2.ServerName = "ns"
SQLCA2.LogId      = "sa"
SQLCA2.AutoCommit = False
SQLCA2.DBParm     = "CommitOnDisconnect='No',DateTimeAllowed='Yes',Host=" + gs_userid

Connect using SQLCA2; // using SQLCA 가 아님에 주의! 


//Disconnect using SQLCA2; 
//
//DESTROY SQLCA2 // 사용이 끝났으면 DESTROY를 해줄 것. 
//

end subroutine

public subroutine wf_ns_yoochang_disconnect (); 
//Transaction SQLCA2 // Global 변수로 선언하는 것이 좋음. 
//
//SQLCA2 = CREATE Transaction // 적당한 위치에서.. 예를 들면 App의 Open Event.. 
//
//SQLCA.Database   ='yoochang'
//SQLCA.LogID      ='sa'
//SQLCA.LogPass    ='yc.sa'
//SQLCA.ServerName ='ns'
//SQLCA.UserID     ='이인호'
//
//Connect using SQLCA2; // using SQLCA 가 아님에 주의! 
//

Disconnect using SQLCA2; 

DESTROY SQLCA2 // 사용이 끝났으면 DESTROY를 해줄 것. 

end subroutine

on w_cduserid_m.create
int iCurrent
call super::create
this.tv_1=create tv_1
this.gb_4=create gb_4
this.dw_4=create dw_4
this.dw_5=create dw_5
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cbx_1=create cbx_1
this.cb_4=create cb_4
this.cb_5=create cb_5
this.sle_1=create sle_1
this.cb_6=create cb_6
this.sle_2=create sle_2
this.cb_7=create cb_7
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
this.st_filter=create st_filter
this.st_1=create st_1
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.sle_1
this.Control[iCurrent+12]=this.cb_6
this.Control[iCurrent+13]=this.sle_2
this.Control[iCurrent+14]=this.cb_7
this.Control[iCurrent+15]=this.st_8
this.Control[iCurrent+16]=this.ddlb_col
this.Control[iCurrent+17]=this.st_9
this.Control[iCurrent+18]=this.ddlb_2
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_filteron
this.Control[iCurrent+21]=this.cb_filteroff
this.Control[iCurrent+22]=this.cb_11
this.Control[iCurrent+23]=this.cb_12
this.Control[iCurrent+24]=this.st_filter
this.Control[iCurrent+25]=this.st_1
this.Control[iCurrent+26]=this.gb_5
end on

on w_cduserid_m.destroy
call super::destroy
destroy(this.tv_1)
destroy(this.gb_4)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cbx_1)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.sle_1)
destroy(this.cb_6)
destroy(this.sle_2)
destroy(this.cb_7)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.st_filter)
destroy(this.st_1)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.visible = false
//dw_2.sharedata(dw_5)
dw_5.visible = false
dw_4.settransobject(sqlca)
dw_1.retrieve("00000")
dw_2.retrieve('00000')

sle_1.text = GS_VER
if gs_userid = "1999010s" then
	dw_2.Object.password.visible = 1
	dw_2.Object.use_flag.TabSequence = 55
else
	dw_2.Object.password.visible = 0
	dw_2.Object.use_flag.TabSequence = 0
end if

dw_2.Object.user_id.TabSequence = 10
dw_2.Object.rank.TabSequence = 20
dw_2.Object.user_name.TabSequence = 30
dw_2.Object.rem.TabSequence = 40

wf_Make_team1( "00000" )

tv_1.setfocus()
cb_1.visible = false
cb_2.visible = false
cb_3.visible = false
dw_2.setfilter('use_flag = "Y"')
dw_2.filter()

ddlb_col.text = "성명"
ddlb_2.text   = "LIKE"

end event

event resize;call super::resize;gb_4.height = this.height - 428
tv_1.height = this.height - 496

gb_3.width  = this.width  - 1344
gb_3.height = this.height - 428

dw_2.width  = this.width  - 1403
dw_2.height = this.height - 648

end event

type pb_save from w_inheritance`pb_save within w_cduserid_m
integer x = 5211
integer y = 68
end type

event pb_save::clicked;long   ll_row, ll_cnt, ll_chkcnt
string ls_user, ls_usernm, ls_useyn, ls_updatego = "N", ls_continue
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================


dw_2.accepttext()
//===============================================
// CODEMST UPDATE하기
//===============================================
for ll_row = 1 to dw_2.rowcount()
	ls_user   = dw_2.object.user_id[ll_row]
	ls_usernm = dw_2.object.user_name[ll_row]
	ls_useyn  = dw_2.object.use_flag[ll_row]
	if ls_useyn = "N" then
		SELECT COUNT(*) INTO :ll_cnt  FROM CODEMST WHERE ITEM_CD = :ls_user  AND USE_YN = 'Y';
		 
		if ll_cnt > 0 then
			if ls_updatego = "Y" then
				// CODEMST 권한 사용불가 일괄처리 
				UPDATE CODEMST SET USE_YN = 'N' WHERE ITEM_CD = :ls_user;
			else
				if MessageBox("확인","CODEMST 테이블에 [" + ls_usernm + "] " + string(ll_cnt,"#,##0") + " 건의 권한이 존재합니다.~n~n" + &
								  "이 권한을 전체 사용불가 처리 합니까?", Exclamation!, OKCancel!, 2) = 2 then
					// 권한보존
				else
					ll_chkcnt = ll_chkcnt + 1
					if ll_chkcnt = 1 then
						// CODEMST 권한 사용불가 처리 
						UPDATE CODEMST SET USE_YN = 'N' WHERE ITEM_CD = :ls_user;
					else
						if MessageBox("확인","나머지 작업도 모두 일괄처리 합니까?", Exclamation!, OKCancel!, 2) = 1 then
							ls_updatego = "Y"
						end if
						// CODEMST 권한 사용불가 처리 
						UPDATE CODEMST SET USE_YN = 'N' WHERE ITEM_CD = :ls_user;
					end if					
				end if
			end if
		end if
	end if
next
//===============================================

// 회계 통제관리
if dw_2.object.ycgl_manager_chk[dw_2.getrow()] = 'Y' then
	ls_user = dw_2.object.user_id[dw_2.getrow()]
	UPDATE login 
	   SET ycgl_manager_chk = 'N'
	 WHERE user_id <> :ls_user;
	 
	COMMIT Using sqlca;
end if

wf_update1(dw_2,"Y")

//wf_ns_yoochang_connect()// ns/yc_mail 서버 db:yoochang connect
//
//dw_5.settransobject(sqlca2)
//dw_5.retrieve(left(string(itv_team.label),5))
//dw_5.rowsmove(1,dw_5.rowcount(),Primary!, dw_5, 1, Delete!)
//dw_2.rowscopy(1,dw_2.rowcount(),Primary!, dw_5, 1, Primary!)
//dw_5.accepttext()
//for ll_row = 1 to dw_5.rowcount()
//	dw_5.SetItemStatus(ll_row, 0, Primary!, NewModified!)
//next
//dw_5.accepttext()
//
//if dw_5.update() = 1 then
//	COMMIT USING sqlca2 ; 
//	   MessageBox("확인", "저장되었습니다.")
//	return
//else
//	rollback USING sqlca2 ;
//	MessageBox("오류", "저장 실패!")
//	return
//end if
//wf_ns_yoochang_disconnect()// ns/yc_mail 서버 db:yoochang connect
//
end event

type dw_1 from w_inheritance`dw_1 within w_cduserid_m
integer x = 946
integer y = 12
integer width = 197
integer height = 152
integer taborder = 70
string dataobject = "d_cdteam_h"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_cduserid_m
integer x = 1285
integer y = 456
integer width = 4293
integer height = 2344
integer taborder = 90
string dragicon = "C:\bmp\Arrowl.ico"
string dataobject = "d_cdlogin_t"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rbuttondown;this.scrolltorow(row)
if this.DragAuto = TRUE then
	this.DragAuto = False
else
	this.DragAuto = TRUE
end if

end event

event dw_2::clicked;this.scrolltorow(row)

string ls_col, ls_text

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

choose case dwo.name
	case "user_id"
		ls_col  = "ID"
		ls_text = string(this.object.user_id[row])
	case "user_name"
		ls_col  = "성명"
		ls_text = string(this.object.user_name[row])
	case "team_code"
		ls_col  = "팀코드"
		ls_text = string(this.object.team_code[row])
	case "rank_no"
		ls_col  = "직책"
		ls_text = string(this.object.rank_no[row])
	case "area_no"
		ls_col  = "근무지"
		ls_text = string(this.object.area_no[row])
end choose

choose case ls_col
	case "번호", "처리자"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text



end event

event dw_2::itemchanged;call super::itemchanged;string ls_null, ls_data, ls_name

setnull(ls_null)

choose case dwo.name
	case 'update_chk'
		if data = 'Y' then
			dw_2.object.force_update[row] = sle_1.text
		else
			dw_2.object.force_update[row] = dw_2.object.force_old[row]
		end if
		
	case 'rank_no'
		ls_data = data
		SELECT CODE_NM  INTO :ls_name  FROM code_table WHERE code_cd = :ls_data AND type_cd = 'JIK_CD';
		this.object.rank[row] = ls_name
end choose
end event

type st_title from w_inheritance`st_title within w_cduserid_m
integer x = 46
integer width = 1170
string text = "사용자 등록"
end type

type st_tips from w_inheritance`st_tips within w_cduserid_m
end type

type pb_compute from w_inheritance`pb_compute within w_cduserid_m
boolean visible = false
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_cduserid_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cduserid_m
integer x = 5403
integer y = 68
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cduserid_m
integer x = 5019
integer y = 68
integer taborder = 160
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

i_print.st_datawindow = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 사원 마스터를 출력합니다." 
dw_4.retrieve()
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_cduserid_m
boolean visible = false
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_cduserid_m
integer x = 4827
integer y = 68
integer taborder = 180
end type

event pb_delete::clicked;call super::clicked;dw_2.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_cduserid_m
integer x = 4635
integer y = 68
integer taborder = 200
end type

event pb_insert::clicked;call super::clicked;long ll_row,ll_team
treeviewitem    ltv_team
string ls_team

if is_chk <> 'Y' then
	messagebox('경고','사용자 중복검색을 먼저 하시기 바랍니다.')
	return
end if

is_chk  = 'N'
ll_team = tv_1.finditem(CurrentTreeItem!,0)
tv_1.getitem(ll_team,ltv_team)

ls_team = LeftA(string(ltv_team.label),5)

if ls_team = '00000' then return

ll_row = dw_2.insertrow(0)
dw_2.scrolltorow(ll_row)
dw_2.object.team_code[ll_row] = ls_team
dw_2.object.force_update[ll_row] = trim(sle_1.text)

wf_focus(dw_2,"user_id")

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cduserid_m
boolean visible = false
integer taborder = 190
end type

type gb_3 from w_inheritance`gb_3 within w_cduserid_m
integer x = 1257
integer y = 260
integer width = 4352
integer height = 2564
integer taborder = 110
end type

type gb_2 from w_inheritance`gb_2 within w_cduserid_m
boolean visible = false
integer taborder = 120
end type

type gb_1 from w_inheritance`gb_1 within w_cduserid_m
integer x = 4603
integer y = 28
integer width = 1006
integer taborder = 60
end type

type tv_1 from treeview within w_cduserid_m
event begindrag pbm_tvnbegindrag
event clicked pbm_tvnclicked
event doubleclicked pbm_tvndoubleclicked
event dragdrop pbm_tvndragdrop
event dragwithin pbm_tvndragwithin
event selectionchanged pbm_tvnselchanged
integer x = 50
integer y = 304
integer width = 1170
integer height = 2496
integer taborder = 100
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
boolean hideselection = false
string picturename[] = {"Custom039!","Custom050!"}
long picturemaskcolor = 553648127
string statepicturename[] = {"Custom039!","Custom050!","Custom050!","Custom050!","Custom050!","Custom050!"}
long statepicturemaskcolor = 553648127
end type

event dragdrop;TreeViewItem		ltvi_Target
string ls_team, ls_name
long ll_row

IF source.TypeOf( ) = datawindow! THEN
	GetItem(il_DropTarget, ltvi_Target)
	ls_team = LeftA(ltvi_Target.label,5)
	ll_row  = dw_2.getrow()
	ls_name = dw_2.object.user_name[ll_row]
   If MessageBox("확인", "사용자 [" + trim(ls_name) + "]를 정말로 " + &
					  "[" +ls_team + " " + trim(MidA(ltvi_Target.label,7)) +  "] 으로 이동하시겠읍니까?  ", Question!, YesNo!) = 2 Then Return	
	if ls_team = dw_2.object.team_code[ll_row] then
		return
	end if
	
	dw_2.object.team_code[ll_row] = ls_team
	dw_2.RowsMove(ll_row, ll_row, Primary!, dw_2, 1, Filter! )
	dw_2.accepttext()
   if wf_update1(dw_2,"Y") = false then
      dw_2.retrieve(ls_team)
		dw_2.scrolltorow(ll_row)
	end if	
   return
END IF
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

event selectionchanged;LONG   ll_Row, ll_tvi
STRING ls_team
datawindowchild ldwc_team

if ii_chk = 1  then 
	ii_chk = 0
	return
end if

ih_Curteam = newhandle

GetItem( newhandle , itv_team )
dw_2.retrieve(LeftA(string(itv_team.label),5))
if itv_team.Children = true then return	

if dw_1.retrieve(LeftA(string(itv_team.label),5)) < 1 then
	return
end if

wf_make_team(itv_team.label)

end event

type gb_4 from groupbox within w_cduserid_m
integer x = 37
integer y = 260
integer width = 1202
integer height = 2564
integer taborder = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 79741120
end type

type dw_4 from datawindow within w_cduserid_m
boolean visible = false
integer x = 1463
integer y = 40
integer width = 178
integer height = 108
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cduserid_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_cduserid_m
boolean visible = false
integer x = 1330
integer width = 763
integer height = 116
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_cdlogin_t_ns_db"
boolean controlmenu = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type cb_1 from commandbutton within w_cduserid_m
boolean visible = false
integer x = 1326
integer y = 16
integer width = 498
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dw_5_retrieve()"
end type

event clicked;wf_ns_yoochang_connect()// ns/yc_mail 서버 db:yoochang connect

dw_5.settransobject(sqlca2)
dw_5.visible = true
dw_5.retrieve(LeftA(string(itv_team.label),5))

end event

type cb_2 from commandbutton within w_cduserid_m
boolean visible = false
integer x = 1833
integer y = 16
integer width = 549
integer height = 108
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dw_5_insertrow()"
end type

event clicked;long ll_row,ll_team
treeviewitem    ltv_team
string ls_team

ll_team = tv_1.finditem(CurrentTreeItem!,0)
tv_1.getitem(ll_team,ltv_team)

ls_team = LeftA(string(ltv_team.label),5)

if ls_team = '00000' then return

ll_row = dw_5.insertrow(0)
dw_5.scrolltorow(ll_row)
dw_5.object.team_code[ll_row] = ls_team

wf_focus(dw_5,"user_id")

end event

type cb_3 from commandbutton within w_cduserid_m
boolean visible = false
integer x = 1833
integer y = 136
integer width = 549
integer height = 108
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dw_5_update()"
end type

event clicked;dw_5.accepttext()

if dw_5.update() = 1 then
	COMMIT USING sqlca2 ; 
	   MessageBox("확인", "저장되었습니다.")
	return
else
	rollback USING sqlca2 ;
	MessageBox("오류", "저장 실패!")
	return
end if
wf_ns_yoochang_disconnect()// ns/yc_mail 서버 db:yoochang connect

end event

type cbx_1 from checkbox within w_cduserid_m
integer x = 1298
integer y = 264
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미사용자포함"
end type

event clicked;if this.checked = true then
	dw_2.setfilter('')
else
	dw_2.setfilter('use_flag = "Y"')
end if
dw_2.filter()
end event

type cb_4 from commandbutton within w_cduserid_m
integer x = 1646
integer y = 92
integer width = 672
integer height = 92
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체강제 UPDATE적용"
end type

event clicked;string ls_up_ver

ls_up_ver = sle_1.text
if isnull(ls_up_ver) or trim(ls_up_ver) = '' then	// 전체강제 UPDATE적용
	sle_1.setfocus()
	MessageBox("확인","프로그램 Version 번호가 누락 되었습니다.")
	return
end if

///////////////////////////////////////////////////
// '최신버전 UPDATE' 알림
///////////////////////////////////////////////////
UPDATE CODEMST
   SET item_cd    = :ls_up_ver, USE_YN = 'Y'
 WHERE TYPE       = 'ERP_VERSION';

///////////////////////////////////////////////////
// '사용자정보 UPDATE
///////////////////////////////////////////////////
UPDATE login 
   SET force_update = :ls_up_ver
 WHERE use_flag = 'Y';
IF sqlca.sqlcode <> 0 then
	rollback;
	MessageBox("오류","취소되었습니다")
	return
end if

COMMIT;

tv_1.triggerevent(selectionchanged!)
MessageBox("확인","완료되었습니다")

end event

type cb_5 from commandbutton within w_cduserid_m
integer x = 2331
integer y = 92
integer width = 672
integer height = 92
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체강제 UPDATE취소"
end type

event clicked;string ls_up_ver

///////////////////////////////////////////////////
// '최신버전 UPDATE' 알림
///////////////////////////////////////////////////
UPDATE CODEMST
   SET USE_YN   = 'N'
 WHERE TYPE     = 'ERP_VERSION';


setnull(ls_up_ver)
UPDATE login set force_update = :ls_up_ver
 WHERE use_flag = 'Y';
IF sqlca.sqlcode <> 0 then
	rollback;
	MESSAGEBOX("오류","취소되었습니다")
	return
end if
COMMIT;

MESSAGEBOX("확인","완료되었습니다")
tv_1.triggerevent(selectionchanged!)
end event

type sle_1 from singlelineedit within w_cduserid_m
integer x = 1330
integer y = 92
integer width = 302
integer height = 92
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "V"
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_cduserid_m
integer x = 1861
integer y = 240
integer width = 448
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "최종버전전체"
end type

event clicked;long ll_row

for ll_row = 1 to dw_2.rowcount()
	dw_2.object.force_update[ll_row] = sle_1.text
next
end event

type sle_2 from singlelineedit within w_cduserid_m
integer x = 3739
integer y = 92
integer width = 402
integer height = 92
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_7 from commandbutton within w_cduserid_m
integer x = 4151
integer y = 92
integer width = 343
integer height = 92
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ID중복검사"
end type

event clicked;long ll_cnt
string ls_sle2, ls_user_id, ls_user_name, ls_team_code, ls_team_name
ls_sle2 = trim(sle_2.text)
if isnull(ls_sle2) or ls_sle2 = '' then
	messagebox('확인', 'ERP 사용자 ID를 입력하고, 중복여부를 체크해 주세요.')
	return
end if

select count(*)
  into :ll_cnt
 from login
 where user_id = :ls_sle2;

if ll_cnt > 0 then
	select isnull(user_id,'Not'), isnull(user_name,'Not'), isnull(a.team_code,'Not'), isnull(b.team_name, 'Not')
	  into :ls_user_id, :ls_user_name, :ls_team_code, :ls_team_name
	  FROM login a LEFT OUTER JOIN team b  ON a.team_code = b.team_code
	 and   user_id = :ls_sle2;
	messagebox('경고', '이미 등록된(' + trim(ls_team_code) + ' ' + trim(ls_team_name) + ' ' + trim(ls_user_id) + '  ' + trim(ls_user_name) + ') ERP ID 입니다.')
	is_chk = 'N'
else
	messagebox('확인', '사용가능한 ERP ID 입니다.')
	is_chk = 'Y'
end if

	
		
end event

type st_8 from statictext within w_cduserid_m
integer x = 1303
integer y = 380
integer width = 174
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_col from dropdownlistbox within w_cduserid_m
integer x = 1486
integer y = 360
integer width = 402
integer height = 532
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"ID","성명","팀코드","직책","근무지"}
end type

type st_9 from statictext within w_cduserid_m
integer x = 1902
integer y = 380
integer width = 174
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_cduserid_m
integer x = 2085
integer y = 360
integer width = 279
integer height = 512
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_cduserid_m
integer x = 2377
integer y = 364
integer width = 498
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cduserid_m
integer x = 2889
integer y = 364
integer width = 270
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "ID"
			ls_col = "user_id "
		case "성명"
			ls_col = "user_name "
		case "팀코드"
			ls_col = "team_code "
		case "직책"
			ls_col = "rank_no "
		case "근무지"
			ls_col = "area_no "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_2.text) + " #" + trim(sle_value.text) + "# "
		elseif ls_col = "cnt " then
			ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

st_filter.text = ls_temp
dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)
dw_2.triggerevent(rowfocuschanged!)

end event

type cb_filteroff from commandbutton within w_cduserid_m
integer x = 3163
integer y = 364
integer width = 270
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
st_filter.text  = ""
ddlb_2.text     = "LIKE"
ddlb_col.text   = "성명"
sle_value.text  = ""

dw_2.setfilter("")
dw_2.filter()

end event

type cb_11 from commandbutton within w_cduserid_m
integer x = 3438
integer y = 364
integer width = 270
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
String ls_col
choose case trim(ddlb_col.text)
	case "ID"
		ls_col = "user_id "
	case "성명"
		ls_col = "user_name "
	case "팀코드"
		ls_col = "team_code "
	case "직책"
		ls_col = "rank_no "
	case "근무지"
		ls_col = "area_no "
end choose		

dw_2.SetSort(ls_col + "A")
dw_2.sort()

end event

type cb_12 from commandbutton within w_cduserid_m
integer x = 3712
integer y = 364
integer width = 270
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
String ls_col
choose case trim(ddlb_col.text)
	case "ID"
		ls_col = "user_id "
	case "성명"
		ls_col = "user_name "
	case "팀코드"
		ls_col = "team_code "
	case "직책"
		ls_col = "rank_no "
	case "근무지"
		ls_col = "area_no "
end choose		

dw_2.SetSort(ls_col + "D")
dw_2.sort()

end event

type st_filter from statictext within w_cduserid_m
integer x = 4027
integer y = 364
integer width = 1513
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cduserid_m
integer x = 3017
integer y = 128
integer width = 718
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "CODEMST: ~'ERP_VERSION~'"
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_cduserid_m
integer x = 1266
integer y = 28
integer width = 3314
integer height = 204
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

