$PBExportHeader$w_cduserid_m.srw
$PBExportComments$사용자관리(1998/02/05,곽용덕)
forward
global type w_cduserid_m from w_inheritance
end type
type tv_1 from treeview within w_cduserid_m
end type
type gb_4 from groupbox within w_cduserid_m
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
type cb_5 from commandbutton within w_cduserid_m
end type
type sle_1 from singlelineedit within w_cduserid_m
end type
type sle_2 from singlelineedit within w_cduserid_m
end type
type cb_7 from commandbutton within w_cduserid_m
end type
type st_filter from statictext within w_cduserid_m
end type
type st_1 from statictext within w_cduserid_m
end type
type dw_3 from datawindow within w_cduserid_m
end type
type cbx_3 from checkbox within w_cduserid_m
end type
type st_3 from statictext within w_cduserid_m
end type
type ddlb_fld from dropdownlistbox within w_cduserid_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cduserid_m
end type
type st_4 from statictext within w_cduserid_m
end type
type sle_value from singlelineedit within w_cduserid_m
end type
type cb_8 from commandbutton within w_cduserid_m
end type
type cb_9 from commandbutton within w_cduserid_m
end type
type cb_10 from commandbutton within w_cduserid_m
end type
type cb_11 from commandbutton within w_cduserid_m
end type
type cbx_pwd from checkbox within w_cduserid_m
end type
type cb_12 from commandbutton within w_cduserid_m
end type
type cb_13 from commandbutton within w_cduserid_m
end type
type ddlb_op from dropdownlistbox within w_cduserid_m
end type
type gb_5 from groupbox within w_cduserid_m
end type
type dw_4 from datawindow within w_cduserid_m
end type
end forward

global type w_cduserid_m from w_inheritance
integer x = 5
integer y = 4
integer width = 5687
integer height = 2964
string title = "사용자 등록(w_cduserid_m)"
boolean center = true
tv_1 tv_1
gb_4 gb_4
dw_5 dw_5
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cbx_1 cbx_1
cb_5 cb_5
sle_1 sle_1
sle_2 sle_2
cb_7 cb_7
st_filter st_filter
st_1 st_1
dw_3 dw_3
cbx_3 cbx_3
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
cb_11 cb_11
cbx_pwd cbx_pwd
cb_12 cb_12
cb_13 cb_13
ddlb_op ddlb_op
gb_5 gb_5
dw_4 dw_4
end type
global w_cduserid_m w_cduserid_m

type variables
//Transaction SQLCA2 // Global 변수로 선언하는 것이 좋음. 
long    il_dragsource,il_dragparent,il_droptarget
long    ih_curteam
integer ii_chk=0
string  is_chk = 'N', is_dw

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
INT    ll_Count, lh_team, l
long   ll_len
STRING ls_Component, ls_Source

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
this.dw_5=create dw_5
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cbx_1=create cbx_1
this.cb_5=create cb_5
this.sle_1=create sle_1
this.sle_2=create sle_2
this.cb_7=create cb_7
this.st_filter=create st_filter
this.st_1=create st_1
this.dw_3=create dw_3
this.cbx_3=create cbx_3
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cbx_pwd=create cbx_pwd
this.cb_12=create cb_12
this.cb_13=create cb_13
this.ddlb_op=create ddlb_op
this.gb_5=create gb_5
this.dw_4=create dw_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.cb_5
this.Control[iCurrent+9]=this.sle_1
this.Control[iCurrent+10]=this.sle_2
this.Control[iCurrent+11]=this.cb_7
this.Control[iCurrent+12]=this.st_filter
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.dw_3
this.Control[iCurrent+15]=this.cbx_3
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.ddlb_fld
this.Control[iCurrent+18]=this.ddlb_dwtitles
this.Control[iCurrent+19]=this.st_4
this.Control[iCurrent+20]=this.sle_value
this.Control[iCurrent+21]=this.cb_8
this.Control[iCurrent+22]=this.cb_9
this.Control[iCurrent+23]=this.cb_10
this.Control[iCurrent+24]=this.cb_11
this.Control[iCurrent+25]=this.cbx_pwd
this.Control[iCurrent+26]=this.cb_12
this.Control[iCurrent+27]=this.cb_13
this.Control[iCurrent+28]=this.ddlb_op
this.Control[iCurrent+29]=this.gb_5
this.Control[iCurrent+30]=this.dw_4
end on

on w_cduserid_m.destroy
call super::destroy
destroy(this.tv_1)
destroy(this.gb_4)
destroy(this.dw_5)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cbx_1)
destroy(this.cb_5)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.cb_7)
destroy(this.st_filter)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.cbx_3)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cbx_pwd)
destroy(this.cb_12)
destroy(this.cb_13)
destroy(this.ddlb_op)
destroy(this.gb_5)
destroy(this.dw_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.visible = false
//dw_2.sharedata(dw_5)
dw_3.visible = false
dw_5.visible = false

dw_3.settransobject(sqlca)
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

end event

event resize;call super::resize;//
gb_4.height = this.height - 428
tv_1.height = this.height - 496

gb_3.width  = this.width  - 1344
gb_3.height = this.height - 428

dw_2.width  = this.width  - 1403
dw_2.height = this.height - 648

dw_3.x      = dw_2.X
dw_3.y      = dw_2.Y
dw_3.width  = dw_2.width
dw_3.height = dw_2.height
end event

type pb_save from w_inheritance`pb_save within w_cduserid_m
integer x = 4631
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
integer x = 0
integer y = 0
integer width = 50
integer height = 50
integer taborder = 70
string dataobject = "d_cdteam_h"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_cduserid_m
integer x = 46
integer y = 48
integer width = 1170
string text = "사용자 등록"
end type

type st_tips from w_inheritance`st_tips within w_cduserid_m
integer x = 0
integer y = 0
end type

type pb_compute from w_inheritance`pb_compute within w_cduserid_m
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_cduserid_m
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance`pb_close within w_cduserid_m
integer x = 4823
integer y = 68
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cduserid_m
integer x = 4439
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
integer x = 0
integer y = 0
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_cduserid_m
integer x = 4247
integer y = 68
integer taborder = 180
end type

event pb_delete::clicked;call super::clicked;dw_2.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_cduserid_m
integer x = 4055
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
dw_2.object.force_update[ll_row] = 'V00.0000'

wf_focus(dw_2,"user_id")

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cduserid_m
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 190
end type

type gb_3 from w_inheritance`gb_3 within w_cduserid_m
integer x = 1257
integer y = 260
integer width = 4352
integer height = 2564
integer taborder = 110
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cduserid_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 50
integer taborder = 120
end type

type gb_1 from w_inheritance`gb_1 within w_cduserid_m
integer x = 4023
integer y = 28
integer width = 1024
integer taborder = 60
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
end type

event dw_2::rbuttondown;this.scrolltorow(row)
if this.DragAuto = TRUE then
	this.DragAuto = False
else
	this.DragAuto = TRUE
end if

end event

event dw_2::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_2"

end event

event dw_2::itemchanged;call super::itemchanged;string ls_null, ls_data, ls_name

setnull(ls_null)

choose case dwo.name
	case 'rank_no'
		ls_data = data
		SELECT CODE_NM  INTO :ls_name  FROM V_CODE_TABLE  
		 where code_cd = :ls_data
		 	and type_cd = 'JIK_CD';
		this.object.rank[row] = ls_name
end choose
end event

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

event selectionchanged;//
long   ll_Row, ll_tvi
string ls_team
datawindowchild ldwc_team

if ii_chk = 1  then 
	ii_chk = 0
	RETURN
end if

ih_Curteam = newhandle

GetItem( newhandle, itv_team )
ls_team = LeftA(string(itv_team.label),5)

dw_2.retrieve( ls_team )
dw_3.retrieve( ls_team )


if itv_team.Children = true then RETURN	

if dw_1.retrieve(LeftA(string(itv_team.label),5)) < 1 then
	RETURN
end if

wf_make_team(itv_team.label)

end event

type gb_4 from groupbox within w_cduserid_m
integer x = 37
integer y = 260
integer width = 1202
integer height = 2564
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type dw_5 from datawindow within w_cduserid_m
integer x = 329
integer y = 532
integer width = 517
integer height = 292
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
integer width = 50
integer height = 50
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

event clicked;//
wf_ns_yoochang_connect()// ns/yc_mail 서버 db:yoochang connect

dw_5.settransobject(sqlca2)
dw_5.visible = true
dw_5.retrieve( LeftA(string(itv_team.label),5) )

end event

type cb_2 from commandbutton within w_cduserid_m
boolean visible = false
integer width = 50
integer height = 50
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

type cb_5 from commandbutton within w_cduserid_m
integer x = 1687
integer y = 144
integer width = 672
integer height = 76
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
integer x = 1303
integer y = 92
integer width = 366
integer height = 92
integer taborder = 150
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "V"
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_cduserid_m
integer x = 3150
integer y = 100
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
integer x = 3561
integer y = 64
integer width = 398
integer height = 76
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

event clicked;// ID중복검사
long   ll_cnt
string ls_sle2, ls_user_id, ls_user_name, ls_team_code, ls_team_name

ls_sle2 = trim(sle_2.text)
if isnull(ls_sle2) or ls_sle2 = '' then
	MessageBox('확인', 'ERP 사용자 ID를 입력하고, 중복여부를 체크해 주세요.')
	return
end if

SELECT count(*) INTO :ll_cnt FROM login WHERE user_id      = :ls_sle2;
if ll_cnt > 0 then
	SELECT isnull(user_id,'Not'), isnull(user_name,'Not'), isnull(a.team_code,'Not'), isnull(b.team_name, 'Not')
	  INTO :ls_user_id, :ls_user_name, :ls_team_code, :ls_team_name
	  FROM login a
	       LEFT OUTER JOIN team b  ON a.team_code = b.team_code
	 WHERE user_id      = :ls_sle2;
	MessageBox('확인', '이미 등록된(' + trim(ls_team_code) + ' ' + trim(ls_team_name) + ' ' + trim(ls_user_id) + '  ' + trim(ls_user_name) + ') ERP ID 입니다.')
	is_chk = 'N'
else
	MessageBox('확인', '사용가능한 ERP ID 입니다.')
	is_chk = 'Y'
end if


end event

type st_filter from statictext within w_cduserid_m
integer x = 4379
integer y = 360
integer width = 1161
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
integer x = 2423
integer y = 120
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

type dw_3 from datawindow within w_cduserid_m
integer x = 512
integer y = 1080
integer width = 3895
integer height = 1176
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdlogin_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_3"

end event

type cbx_3 from checkbox within w_cduserid_m
integer x = 3858
integer y = 356
integer width = 325
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "리스트"
end type

event clicked;// 리스트
TreeViewitem  ltv_team
string ls_pwd, ls_useyn, ls_team, ls_label, ls_label5

if cbx_pwd.checked = true then
	ls_pwd = "Y"
else
	ls_pwd = "N"
end if

// 미사용자포함
if cbx_1.checked = true then
	ls_useyn = "%"
else
	ls_useyn = "Y"
end if


tv_1.GetItem( ih_Curteam, ltv_team )

ls_label  = string(ltv_team.label)
ls_label5 = LeftA(ls_label, 5)

if this.checked = true then
	dw_3.visible = true
	dw_3.bringtotop = true
	
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_print.enabled  = false
	pb_save.enabled   = false
	
//	dw_3.retrieve( ls_pwd, ls_useyn )
else
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_print.enabled  = true
	pb_save.enabled   = true
	
	dw_3.visible = false
	dw_3.bringtotop = false
end if

end event

type st_3 from statictext within w_cduserid_m
integer x = 1294
integer y = 356
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

type ddlb_fld from dropdownlistbox within w_cduserid_m
integer x = 1481
integer y = 340
integer width = 443
integer height = 632
integer taborder = 60
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
end type

type ddlb_dwtitles from dropdownlistbox within w_cduserid_m
integer x = 1513
integer y = 352
integer width = 311
integer height = 88
integer taborder = 130
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
end type

type st_4 from statictext within w_cduserid_m
integer x = 1952
integer y = 356
integer width = 165
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

type sle_value from singlelineedit within w_cduserid_m
integer x = 2441
integer y = 348
integer width = 526
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_8 from commandbutton within w_cduserid_m
integer x = 2976
integer y = 348
integer width = 160
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2

	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_9 from commandbutton within w_cduserid_m
integer x = 3141
integer y = 348
integer width = 160
integer height = 76
integer taborder = 100
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
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2

	case "dw_3"
		arg_dw  = dw_3
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_10 from commandbutton within w_cduserid_m
integer x = 3305
integer y = 348
integer width = 160
integer height = 76
integer taborder = 110
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
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2

	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_11 from commandbutton within w_cduserid_m
integer x = 3470
integer y = 348
integer width = 160
integer height = 76
integer taborder = 120
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
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2

	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_pwd from checkbox within w_cduserid_m
integer x = 3648
integer y = 356
integer width = 201
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 67108864
string text = "PWD"
end type

event clicked;//
cbx_3.triggerevent( clicked! )

end event

type cb_12 from commandbutton within w_cduserid_m
integer x = 41
integer y = 196
integer width = 357
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "새로고침"
end type

event clicked;//
dw_1.retrieve("00000")
dw_2.retrieve('00000')

wf_Make_team1( "00000" )

tv_1.setfocus()
dw_2.setfilter('use_flag = "Y"')
dw_2.filter()

end event

type cb_13 from commandbutton within w_cduserid_m
integer x = 3561
integer y = 144
integer width = 398
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "이름찾기"
end type

event clicked;// 이름찾기
long   ll_cnt
string ls_sle2, ls_userid, ls_user_name, ls_team_code, ls_team_name

ls_sle2 = "%" + trim(sle_2.text) + "%"
if isnull(ls_sle2) OR ls_sle2 = "" then
	MessageBox('확인', 'ERP 사용자 이름을 입력하세요.')
	RETURN
end if

SELECT isnull(user_id,''), isnull(user_name,''), isnull(a.team_code,''), isnull(b.team_name, '')
  INTO :ls_userid, :ls_user_name, :ls_team_code, :ls_team_name
  FROM login A
       LEFT OUTER JOIN team B ON a.team_code = b.team_code
 WHERE user_name   LIKE :ls_sle2;
if isnull(ls_userid) OR ls_userid = "" then
	MessageBox('확인', 'ERP 사용자를 입력하세요.')
else
	MessageBox("확인", '이미 등록된(' + ls_team_code + ' ' + ls_team_name + ' ' &
	           + ls_userid + '  ' + ls_user_name + ') ERP 사용자 입니다.')
end if


end event

type ddlb_op from dropdownlistbox within w_cduserid_m
integer x = 2126
integer y = 344
integer width = 306
integer height = 500
integer taborder = 90
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type gb_5 from groupbox within w_cduserid_m
integer x = 1266
integer y = 28
integer width = 2734
integer height = 204
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_4 from datawindow within w_cduserid_m
boolean visible = false
integer width = 178
integer height = 108
integer taborder = 30
string dataobject = "d_cduserid_r"
boolean livescroll = true
end type

