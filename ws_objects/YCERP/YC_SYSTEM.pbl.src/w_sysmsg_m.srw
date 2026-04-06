$PBExportHeader$w_sysmsg_m.srw
$PBExportComments$사용자메시지(1999/06/23, 이인호)
forward 
global type w_sysmsg_m from window
end type
type st_1 from statictext within w_sysmsg_m
end type
type tab_1 from tab within w_sysmsg_m
end type
type tabpage_1 from userobject within tab_1
end type
type cb_8 from commandbutton within tabpage_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type cb_9 from commandbutton within tabpage_1
end type
type dw_8 from datawindow within tabpage_1
end type
type tv_1 from treeview within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_8 cb_8
cb_7 cb_7
cb_9 cb_9
dw_8 dw_8
tv_1 tv_1
end type
type tab_1 from tab within w_sysmsg_m
tabpage_1 tabpage_1
end type
type cb_5 from commandbutton within w_sysmsg_m
end type
type cb_3 from commandbutton within w_sysmsg_m
end type
type cb_2 from commandbutton within w_sysmsg_m
end type
type cb_1 from commandbutton within w_sysmsg_m
end type
type sle_value from singlelineedit within w_sysmsg_m
end type
type ddlb_op from dropdownlistbox within w_sysmsg_m
end type
type st_4 from statictext within w_sysmsg_m
end type
type ddlb_dwtitles from dropdownlistbox within w_sysmsg_m
end type
type ddlb_fld from dropdownlistbox within w_sysmsg_m
end type
type st_3 from statictext within w_sysmsg_m
end type
type dw_7 from datawindow within w_sysmsg_m
end type
type cbx_all from checkbox within w_sysmsg_m
end type
type cbx_3 from checkbox within w_sysmsg_m
end type
type cb_insertall from commandbutton within w_sysmsg_m
end type
type ddplb_1 from dropdownpicturelistbox within w_sysmsg_m
end type
type cb_cancel from commandbutton within w_sysmsg_m
end type
type cb_send from commandbutton within w_sysmsg_m
end type
type cb_exit from commandbutton within w_sysmsg_m
end type
type dw_1 from datawindow within w_sysmsg_m
end type
type cb_delete from commandbutton within w_sysmsg_m
end type
type cb_send2 from commandbutton within w_sysmsg_m
end type
type cb_insert from commandbutton within w_sysmsg_m
end type
type gb_1 from groupbox within w_sysmsg_m
end type
type gb_2 from groupbox within w_sysmsg_m
end type
type dw_2 from datawindow within w_sysmsg_m
end type
end forward

global type w_sysmsg_m from window
integer x = 494
integer y = 424
integer width = 3602
integer height = 1868
boolean titlebar = true
string title = "메시지(w_sysmsg_m)"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 79741120
string icon = "C:\bmp\Book.ico"
boolean center = true
st_1 st_1
tab_1 tab_1
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_value sle_value
ddlb_op ddlb_op
st_4 st_4
ddlb_dwtitles ddlb_dwtitles
ddlb_fld ddlb_fld
st_3 st_3
dw_7 dw_7
cbx_all cbx_all
cbx_3 cbx_3
cb_insertall cb_insertall
ddplb_1 ddplb_1
cb_cancel cb_cancel
cb_send cb_send
cb_exit cb_exit
dw_1 dw_1
cb_delete cb_delete
cb_send2 cb_send2
cb_insert cb_insert
gb_1 gb_1
gb_2 gb_2
dw_2 dw_2
end type
global w_sysmsg_m w_sysmsg_m

type prototypes

end prototypes

type variables
gs_custper_str istr_select
int ii_type, ii_sw =0
int ii_cnt = 0

string is_datawindow, is_user
DataWindowChild idwc_user

long    il_dragsource, il_dragparent, il_droptarget
long    ih_curteam
integer ii_chk = 0
string  is_chk = 'N',  is_app5
TreeViewitem itv_team


end variables

forward prototypes
public function boolean wf_make_team (string as_str)
public function boolean wf_make_team1 (string as_str)
end prototypes

public function boolean wf_make_team (string as_str);// wf_make_team boolean
// as_str  string  value
TreeViewitem ltv_team
int  ll_Count, lh_team, l
long ll_len


ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2

ll_count = dw_7.rowcount()
for l = 1 TO ll_Count
	if dw_7.object.team_name[l] = "" then
	else
		ltv_team.Label = dw_7.object.team_code[l] + " " + dw_7.object.team_name[l]
	
		lh_team = tab_1.tabpage_1.tv_1.FindItem( CurrentTreeItem! , 0 )
		tab_1.tabpage_1.tv_1.InsertitemSort( lh_team, ltv_team )
		tab_1.tabpage_1.tv_1.ExpandAll( lh_team )
	end if
next

return( TRUE )


end function

public function boolean wf_make_team1 (string as_str);// wf_make_team1 boolean
// as_str string 
TreeViewitem ltv_team
int    ll_Count, lh_team, l
long   ll_len
string ls_Component, ls_Source

ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2
ltv_team.Label = "00000 유창"


tab_1.tabpage_1.tv_1.Deleteitem(0)
lh_team = tab_1.tabpage_1.tv_1.InsertitemSort( 0, ltv_team )

ll_count = dw_7.rowcount()
for l = 1 to ll_Count
	if dw_7.object.team_name[l] = "" then	// SKIP
	else
		ltv_team.Label = dw_7.object.team_code[l] + " " + dw_7.object.team_name[l]

		//if cbx_2.checked = true then		// 영업조직
			choose case LeftA(dw_7.object.team_code[l],1)
				case '1', '7', '9'		// 관리본부, 영업본부, 생산본부
					ltv_team.Label = dw_7.object.team_code[l] + " " + dw_7.object.team_name[l]
					tab_1.tabpage_1.tv_1.InsertitemSort( lh_team, ltv_team )
					tab_1.tabpage_1.tv_1.ExpandAll( lh_team )
				case else
					// SKIP
			end choose
//		else
//			ltv_team.Label = dw_7.object.team_code[l] + " " + dw_7.object.team_name[l]
//			tab_1.tabpage_1.tv_1.InsertitemSort( lh_team, ltv_team )
//			tab_1.tabpage_1.tv_1.ExpandAll( lh_team )
//		end if
	end if
next

return( true )

end function

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_msgchk

dw_7.SetTransObject(SQLCA)		// 조직도
tab_1.tabpage_1.dw_8.SetTransObject(SQLCA)		// 조직도(팀원)

dw_7.retrieve( "00000" )
wf_Make_team1( "00000" )

////////////////////////////////////////////////////////////////
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
////////////////////////////////////////////////////////////////

tab_1.visible= false
dw_7.visible = false
dw_2.visible = false
ddplb_1.text = "받은 메시지"

if GF_PERMISSION("사내메신저_사용", gs_userid) = "Y" then
end if

ls_msgchk = ProfileString("YCERP.INI", "MessageBox", "Check", " ")
if ls_msgchk = 'Y' then
	cbx_3.Checked = True		// 알림
else
	cbx_3.Checked = False
end if

istr_select = Message.PowerObjectParm
choose case istr_select.str_ok
	case true 	// 받은 메시지
		  dw_1.dataobject   = 'd_sysmsg_m'
		  ddplb_1.text      = "받은 메시지"
		  
		  ii_type           = 1
		  cb_insertall.text = "운영자"	// 전체추가
		  cb_cancel.enabled = false
		  cb_send.enabled   = false
		  cb_insert.enabled = false
		  cb_delete.enabled = true
		  cb_send2.enabled  = true
		  
	case false 	// 보낸 메시지
		  dw_1.dataobject   = 'd_sysmsg2_m'	
		  cb_insertall.text = "전체추가"
		  
		  ii_type   = 2
		  ddplb_1.text      = "보낸 메시지"
		  cb_cancel.enabled = true
		  cb_send.enabled   = true
		  cb_insert.enabled = true
		  cb_delete.enabled = false
		  cb_send2.enabled  = false
end choose

if gs_userid = "1999010s" then
   cb_insertall.enabled = true	// 전체추가
else
   cb_insertall.enabled = false
end if

dw_1.settransobject(sqlca)
dw_1.retrieve( gs_userid )
dw_1.setfocus()

if gs_print_control = "mess" then
	setnull(gs_print_control)
	
	cb_insert.triggerevent(clicked!)	// 추가
	if dw_1.getrow() > 0 then
		dw_1.object.tlogin[dw_1.getrow()] = LeftA(istr_select.str_where,10)
		dw_1.object.msg[dw_1.getrow()]    = MidA(istr_select.str_where,11,170)
	end if
end if

timer(1)

end event

on w_sysmsg_m.create
this.st_1=create st_1
this.tab_1=create tab_1
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_4=create st_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_fld=create ddlb_fld
this.st_3=create st_3
this.dw_7=create dw_7
this.cbx_all=create cbx_all
this.cbx_3=create cbx_3
this.cb_insertall=create cb_insertall
this.ddplb_1=create ddplb_1
this.cb_cancel=create cb_cancel
this.cb_send=create cb_send
this.cb_exit=create cb_exit
this.dw_1=create dw_1
this.cb_delete=create cb_delete
this.cb_send2=create cb_send2
this.cb_insert=create cb_insert
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_2=create dw_2
this.Control[]={this.st_1,&
this.tab_1,&
this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_value,&
this.ddlb_op,&
this.st_4,&
this.ddlb_dwtitles,&
this.ddlb_fld,&
this.st_3,&
this.dw_7,&
this.cbx_all,&
this.cbx_3,&
this.cb_insertall,&
this.ddplb_1,&
this.cb_cancel,&
this.cb_send,&
this.cb_exit,&
this.dw_1,&
this.cb_delete,&
this.cb_send2,&
this.cb_insert,&
this.gb_1,&
this.gb_2,&
this.dw_2}
end on

on w_sysmsg_m.destroy
destroy(this.st_1)
destroy(this.tab_1)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_4)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_fld)
destroy(this.st_3)
destroy(this.dw_7)
destroy(this.cbx_all)
destroy(this.cbx_3)
destroy(this.cb_insertall)
destroy(this.ddplb_1)
destroy(this.cb_cancel)
destroy(this.cb_send)
destroy(this.cb_exit)
destroy(this.dw_1)
destroy(this.cb_delete)
destroy(this.cb_send2)
destroy(this.cb_insert)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_2)
end on

event timer;//
long hWnd
int  li_cnt

if ii_sw = 1 then
	SELECT count(*) INTO :li_cnt FROM sysmsg WHERE tlogin = :gs_userid AND del = "N";
	if li_cnt > 0 then dw_1.retrieve( gs_userid )
else
	if This.WindowState = Minimized! then
		if ii_sw = 0 then
			SELECT count(*) INTO :li_cnt FROM sysmsg WHERE tlogin = :gs_userid AND del = "N";
			if li_cnt > 0 then
				dw_1.retrieve( gs_userid )
				ii_sw = 2
			end if
			
			UPDATE sysmsg SET del = "Y" WHERE tlogin = :gs_userid AND del = "N";
			COMMIT;
			
			if This.WindowState = Minimized! and li_cnt > 0 and cbx_3.checked = true then
				if messagebox("메시지","메시지가 " + string(li_cnt) + " 개 있습니다 ~r~n" + &
								  "메지시를 확인하시겠습니까", Exclamation!, OKCancel!, 2) = 1 THEN
					This.WindowState = Normal!
				else
					ii_sw = 0
				end if
			end if
		end if
		
		if ii_sw = 2 then
			hWnd = Handle (THIS)
			//gu_ext_func.uf_Flash_Window (hWnd, true)
			FlashWindow(hWnd, TRUE)
			ii_sw = 2
			Timer (0.25)
		end if
	else
		ii_sw = 0
		Timer (120)
		//gu_ext_func.uf_Flash_Window (hWnd, TRUE)
		FlashWindow(hWnd, TRUE)
	end if
end if

end event

event resize;//
dw_1.width  = newwidth  - 83
dw_1.height = newheight - 412

tab_1.x     = (dw_1.width  - tab_1.width)  / 2
tab_1.y     = (dw_1.y + dw_1.height - tab_1.height) / 2
end event

type st_1 from statictext within w_sysmsg_m
integer x = 37
integer y = 40
integer width = 837
integer height = 124
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "사내 메신저"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type tab_1 from tab within w_sysmsg_m
event create ( )
event destroy ( )
integer x = 827
integer y = 600
integer width = 2112
integer height = 868
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2075
integer height = 752
long backcolor = 79741120
string text = "수신자 선택"
long tabtextcolor = 128
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_8 cb_8
cb_7 cb_7
cb_9 cb_9
dw_8 dw_8
tv_1 tv_1
end type

on tabpage_1.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_9=create cb_9
this.dw_8=create dw_8
this.tv_1=create tv_1
this.Control[]={this.cb_8,&
this.cb_7,&
this.cb_9,&
this.dw_8,&
this.tv_1}
end on

on tabpage_1.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_9)
destroy(this.dw_8)
destroy(this.tv_1)
end on

type cb_8 from commandbutton within tabpage_1
integer x = 1792
integer y = 668
integer width = 270
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;//
tab_1.visible = false

end event

type cb_7 from commandbutton within tabpage_1
integer x = 1509
integer y = 668
integer width = 270
integer height = 76
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택"
end type

event clicked;// 결재자 선택
string ls_rank, ls_usernm, ls_userid, ls_team
long   ll_row

ll_row    = tab_1.tabpage_1.dw_8.getrow()
if isnull(ll_row) or ll_row < 1 then return

ls_rank   = tab_1.tabpage_1.dw_8.object.rank[ll_row]
ls_usernm = tab_1.tabpage_1.dw_8.object.user_name[ll_row]
ls_userid = tab_1.tabpage_1.dw_8.object.user_id[ll_row]

ii_sw = 0
tab_1.visible = false

dw_1.accepttext()

ll_row = dw_1.insertrow(0)
dw_1.object.flogin[ll_row] = ls_userid

dw_1.getchild("flogin", idwc_user)
idwc_user.setredraw(false)
idwc_user.settransobject(sqlca)
idwc_user.insertrow(1)
idwc_user.setitem(1, 'user_id', ls_userid)
idwc_user.setitem(1, 'user_name', ls_usernm)

idwc_user.accepttext()
idwc_user.setredraw(false)


dw_1.scrolltorow(ll_row)
dw_1.setcolumn('del')
dw_1.setfocus()


end event

type cb_9 from commandbutton within tabpage_1
integer x = 1042
integer y = 668
integer width = 453
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수신자 삭제"
end type

event clicked;// 결재자 삭제
string ls_rank, ls_usernm, ls_userid, ls_null
long   ll_row

setnull( ls_null )
if isnull(is_user) or is_user = "" then RETURN

ls_rank   = ""
ls_usernm = ""
ls_userid = ""

//choose case is_user
//	case "rank2"
//		dw_1.object.rank2[1]   = ls_rank		// 결재자 직위
//		dw_1.object.user2[1]   = ls_usernm	// 결재자 이름
//		dw_1.object.tr_app2[1] = ls_null  	// 결재자 ID
////		dw_6.object.rank2[1]   = ls_rank
//		
//	case "rank3"
//		dw_1.object.rank3[1]   = ls_rank		// 결재자 직위
//		dw_1.object.user3[1]   = ls_usernm	// 결재자 이름
//		dw_1.object.tr_app3[1] = ls_null  	// 결재자 ID
////		dw_6.object.rank3[1]   = ls_rank
//
//	case "rank4"
//		dw_1.object.rank4[1]   = ls_rank		// 결재자 직위
//		dw_1.object.user4[1]   = ls_usernm	// 결재자 이름
//		dw_1.object.tr_app4[1] = ls_null  	// 결재자 ID
////		dw_6.object.rank4[1]   = ls_rank
//
//	case "rank5"
//		dw_1.object.rank5[1]   = ls_rank		// 결재자 직위
//		dw_1.object.user5[1]   = ls_usernm	// 결재자 이름
//		dw_1.object.tr_app5[1] = ls_null  	// 결재자 ID
////		dw_6.object.rank5[1]   = ls_rank
//
//	case "rankh"
//		dw_1.object.rankh[1]   = ls_rank		// 결재자 직위
//		dw_1.object.userh[1]   = ls_usernm	// 결재자 이름
//		dw_1.object.tr_apph[1] = ls_null  	// 결재자 ID
//end choose
//
tab_1.visible = false

end event

type dw_8 from datawindow within tabpage_1
integer x = 1038
integer y = 16
integer width = 1019
integer height = 640
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_oidcgroup_member"
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;//
cb_7.triggerevent( clicked! )

end event

type tv_1 from treeview within tabpage_1
event begindrag pbm_tvnbegindrag
event clicked pbm_tvnclicked
event doubleclicked pbm_tvndoubleclicked
integer x = 14
integer y = 16
integer width = 1006
integer height = 640
integer taborder = 20
string dragicon = "C:\Bmp\man.ico"
boolean dragauto = true
boolean bringtotop = true
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

event selectionchanged;//
long   ll_Row, ll_tvi
string ls_team
DataWindowChild ldwc_team

if ii_chk = 1  then 
	ii_chk = 0
	return
end if

ih_Curteam = newhandle

GetItem( newhandle, itv_team )
dw_8.retrieve(LeftA(string(itv_team.label),5))

if itv_team.Children = true then return	

if dw_7.retrieve(LeftA(string(itv_team.label),5)) < 1 then
	return
end if

wf_make_team(itv_team.label)

end event

type cb_5 from commandbutton within w_sysmsg_m
integer x = 1998
integer y = 256
integer width = 160
integer height = 76
integer taborder = 80
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

if is_datawindow = "dw_3" then
//	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
//	arg_dw = dw_5
else
//	arg_dw = dw_9
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_3 from commandbutton within w_sysmsg_m
integer x = 1833
integer y = 256
integer width = 160
integer height = 76
integer taborder = 70
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

if is_datawindow = "dw_3" then
//	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
//	arg_dw = dw_5
else
//	arg_dw = dw_9
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_sysmsg_m
integer x = 1669
integer y = 256
integer width = 160
integer height = 76
integer taborder = 60
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

if is_datawindow = "dw_3" then
//	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
//	arg_dw = dw_5
else
//	arg_dw = dw_9
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_1 from commandbutton within w_sysmsg_m
integer x = 1504
integer y = 256
integer width = 160
integer height = 76
integer taborder = 50
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

if is_datawindow = "dw_3" then
//	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
//	arg_dw = dw_5
else
//	arg_dw = dw_9
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type sle_value from singlelineedit within w_sysmsg_m
integer x = 1138
integer y = 256
integer width = 357
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_sysmsg_m
integer x = 837
integer y = 252
integer width = 297
integer height = 512
integer taborder = 30
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

type st_4 from statictext within w_sysmsg_m
integer x = 667
integer y = 268
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

type ddlb_dwtitles from dropdownlistbox within w_sysmsg_m
integer x = 329
integer y = 256
integer width = 219
integer height = 88
integer taborder = 30
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

type ddlb_fld from dropdownlistbox within w_sysmsg_m
integer x = 265
integer y = 244
integer width = 389
integer height = 632
integer taborder = 20
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

type st_3 from statictext within w_sysmsg_m
integer x = 87
integer y = 268
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

type dw_7 from datawindow within w_sysmsg_m
integer x = 841
integer y = 4
integer width = 128
integer height = 100
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdteam_h"
boolean livescroll = true
end type

type cbx_all from checkbox within w_sysmsg_m
integer x = 3250
integer y = 264
integer width = 238
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
end type

event clicked;//
long   ll_row
string ls_chk

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = ls_chk
next

end event

type cbx_3 from checkbox within w_sysmsg_m
integer x = 2981
integer y = 264
integer width = 238
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "알림"
end type

event clicked;string  ls_chk

if cbx_3.checked = true then
	SetProfileString("YCERP.INI", "MessageBox", "Check", "Y")
else
	SetProfileString("YCERP.INI", "MessageBox", "Check", "N")
end if

end event

type cb_insertall from commandbutton within w_sysmsg_m
integer x = 1627
integer y = 72
integer width = 375
integer height = 100
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체추가"
end type

event clicked;//
datawindowchild ldwc_login
long ll_row, ll_cnt

if ii_type = 2 then
	dw_1.getchild("tlogin", ldwc_login)
	ldwc_login.settransobject(sqlca)

	ii_sw = 0
	ldwc_login.retrieve()
	for ll_row = 1 to ldwc_login.rowcount()
		ll_cnt = dw_1.insertrow(0)
		dw_1.object.flogin[ll_cnt] = gs_userid
		dw_1.object.tlogin[ll_cnt] = ldwc_login.getitemstring(ll_row,'user_id')
		dw_1.object.del[ll_cnt] = "N"
	next
else
	dw_1.retrieve( gs_userid )
end if

end event

type ddplb_1 from dropdownpicturelistbox within w_sysmsg_m
integer x = 1047
integer y = 76
integer width = 544
integer height = 320
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"받은 메시지","보낸 메시지"}
integer itempictureindex[] = {1,2}
string picturename[] = {"EnglishEdit!","RunWindow!","Custom021!"}
long picturemaskcolor = 553648127
end type

event selectionchanged;//
string ls_sql, ls_where

choose case index
	case 1 // 받은 메시지
		dw_1.dataobject = 'd_sysmsg_m'		
		cb_insertall.text = "운영자"
		ii_type = 1
		
		ii_sw = 0

		cb_insert.enabled = true	// 추가
		cb_send2.enabled  = false	// 보내기2
		cb_delete.enabled = true	// 삭제
		cb_send.enabled   = true	// 보내기
		cb_cancel.enabled = true   // 취소
		
	case 2 // 보낸 메시지
		dw_1.update()
		commit;
		
      dw_1.dataobject   = 'd_sysmsg2_m'	
		cb_insertall.text = "전체추가"
		ii_type = 2
		
		ii_sw   = 0
		cb_insert.enabled = true	// 추가
		cb_send2.enabled  = false	// 보내기2
		cb_delete.enabled = true	// 삭제
		cb_send.enabled   = true	// 보내기
		cb_cancel.enabled = true	// 취소
end choose			

dw_1.settransobject(sqlca)
dw_1.retrieve( gs_userid )
dw_1.setfocus()

end event

type cb_cancel from commandbutton within w_sysmsg_m
integer x = 2994
integer y = 72
integer width = 238
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;//
dw_1.reset()
dw_1.retrieve( gs_userid )

end event

type cb_send from commandbutton within w_sysmsg_m
integer x = 2743
integer y = 72
integer width = 238
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "보내기"
end type

event clicked;//
dw_1.accepttext()
ii_sw = 0

if dw_1.update() = 1 then
	commit;
	
	cbx_all.checked = false
	MessageBox("확인", "메시지 보내기 성공!")
else
	rollback;
	MessageBox("오류", "메시지 내역을 확인하십시요. 보내기 실패!")
	return
end if

ii_sw   = 1
ii_type = 1
dw_1.dataobject      = 'd_sysmsg_m'
ddplb_1.text         = "받은 메시지"

cb_insertall.enabled = false	// 전체추가
cb_insert.enabled    = false	// 추가
cb_send2.enabled     = true	// 보내기2
cb_delete.enabled    = true	// 삭제
cb_send.enabled      = false	// 보내기
cb_cancel.enabled    = false  // 취소

dw_1.settransobject(sqlca)
dw_1.retrieve(gs_userid)

end event

type cb_exit from commandbutton within w_sysmsg_m
integer x = 3246
integer y = 72
integer width = 238
integer height = 100
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "종료"
end type

event clicked;//
closewithreturn(parent, istr_select)
close(parent)

end event

type dw_1 from datawindow within w_sysmsg_m
string tag = "d_sysmsg_m"
integer x = 37
integer y = 380
integer width = 3483
integer height = 1352
integer taborder = 80
string title = "d_sysmsg2_m"
string dataobject = "d_sysmsg_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemerror;return 1
end event

event dberror;return 2
end event

event clicked;//
is_datawindow = "dw_1"
/////////////////////////////////////////////////////////////////////////////////
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
/////////////////////////////////////////////////////////////////////////////////
this.setfocus()

end event

type cb_delete from commandbutton within w_sysmsg_m
integer x = 2501
integer y = 72
integer width = 238
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;//
long ll_row

dw_1.accepttext()
if dw_1.getrow() < 1 then return

for ll_row = dw_1.rowcount() to 1 step - 1
	if dw_1.object.chk[ll_row] = "Y" then
		dw_1.scrolltorow( ll_row )
		dw_1.deleterow( ll_row )
	end if
next
cbx_all.checked = false

dw_1.accepttext()
if dw_1.update() = 1 then
	COMMIT;
else
	ROLLBACK;
end if

ii_sw = 0

end event

type cb_send2 from commandbutton within w_sysmsg_m
integer x = 2258
integer y = 72
integer width = 238
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "보내기"
end type

event clicked;//
long   ll_row
string ls_touser

ddplb_1.text = "보낸 메시지"

dw_1.accepttext()

ll_row = dw_1.getrow()

UPDATE sysmsg SET del = "Y" WHERE tlogin = :gs_userid AND del = "N";
COMMIT;

if ll_row > 0 then
	ls_touser = dw_1.object.flogin[ll_row]
end if

dw_1.dataobject = 'd_sysmsg2_m'
ii_type = 2
ii_sw   = 0

cb_insert.enabled = true	// 추가
cb_send2.enabled  = false	// 보내기2
cb_delete.enabled = true	// 삭제
cb_send.enabled   = true	// 보내기
cb_cancel.enabled = true   // 취소

if gs_userid = "1999010s" then
  cb_insertall.enabled = true
else
  cb_insertall.enabled = false
end if

dw_1.settransobject(sqlca)
dw_1.retrieve(gs_userid)

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.object.flogin[ll_row] = gs_userid
dw_1.object.tlogin[ll_row] = ls_touser
dw_1.setcolumn('del')
dw_1.setfocus()

end event

type cb_insert from commandbutton within w_sysmsg_m
integer x = 2011
integer y = 72
integer width = 238
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;// 추가
long ll_row

tab_1.visible = true

//dw_1.accepttext()
//
//ll_row = dw_1.insertrow(0)
//dw_1.scrolltorow(ll_row)
//
//dw_1.object.flogin[ll_row] = gs_userid
//dw_1.setcolumn('del')
//dw_1.setfocus()
//
//ii_sw = 0
//
end event

type gb_1 from groupbox within w_sysmsg_m
integer x = 1024
integer y = 16
integer width = 2496
integer height = 192
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_sysmsg_m
integer x = 37
integer y = 208
integer width = 3483
integer height = 148
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_2 from datawindow within w_sysmsg_m
integer x = 690
integer y = 4
integer width = 128
integer height = 100
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_sysmsg2_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

