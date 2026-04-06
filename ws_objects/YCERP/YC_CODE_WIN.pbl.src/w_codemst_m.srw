$PBExportHeader$w_codemst_m.srw
$PBExportComments$은행코드관리(1997/3/18,성삼지)
forward
global type w_codemst_m from w_inheritance
end type
type cb_3 from commandbutton within w_codemst_m
end type
type rb_1 from radiobutton within w_codemst_m
end type
type rb_2 from radiobutton within w_codemst_m
end type
type rb_3 from radiobutton within w_codemst_m
end type
type pb_4 from picturebutton within w_codemst_m
end type
type cbx_1 from checkbox within w_codemst_m
end type
type cbx_2 from checkbox within w_codemst_m
end type
type cbx_3 from checkbox within w_codemst_m
end type
type cbx_4 from checkbox within w_codemst_m
end type
type cb_copy from commandbutton within w_codemst_m
end type
type sle_from from singlelineedit within w_codemst_m
end type
type sle_to from singlelineedit within w_codemst_m
end type
type cb_from from commandbutton within w_codemst_m
end type
type cb_to from commandbutton within w_codemst_m
end type
type cbx_5 from checkbox within w_codemst_m
end type
type dw_3 from datawindow within w_codemst_m
end type
type tab_1 from tab within w_codemst_m
end type
type tabpage_1 from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type sle_1 from singlelineedit within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type dw_8 from datawindow within tabpage_1
end type
type tv_1 from treeview within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_1 cb_1
sle_1 sle_1
cb_5 cb_5
cb_2 cb_2
dw_8 dw_8
tv_1 tv_1
end type
type tab_1 from tab within w_codemst_m
tabpage_1 tabpage_1
end type
type cbx_org from checkbox within w_codemst_m
end type
type dw_4 from datawindow within w_codemst_m
end type
type st_4 from statictext within w_codemst_m
end type
type ddlb_fld from dropdownlistbox within w_codemst_m
end type
type ddlb_dwtitles from dropdownlistbox within w_codemst_m
end type
type st_6 from statictext within w_codemst_m
end type
type sle_value from singlelineedit within w_codemst_m
end type
type cbx_op from checkbox within w_codemst_m
end type
type cb_4 from commandbutton within w_codemst_m
end type
type cb_6 from commandbutton within w_codemst_m
end type
type cb_7 from commandbutton within w_codemst_m
end type
type cb_8 from commandbutton within w_codemst_m
end type
type rb_4 from radiobutton within w_codemst_m
end type
type rb_5 from radiobutton within w_codemst_m
end type
type cbx_dual from checkbox within w_codemst_m
end type
type gb_4 from groupbox within w_codemst_m
end type
type gb_5 from groupbox within w_codemst_m
end type
type st_vertical from u_splitbar_vertical within w_codemst_m
end type
type ddlb_op from dropdownlistbox within w_codemst_m
end type
end forward

global type w_codemst_m from w_inheritance
integer x = 320
integer y = 552
integer width = 5184
integer height = 2508
string title = "CODEMST 관리작업(w_codemst_m)"
long backcolor = 79416533
cb_3 cb_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
pb_4 pb_4
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
cb_copy cb_copy
sle_from sle_from
sle_to sle_to
cb_from cb_from
cb_to cb_to
cbx_5 cbx_5
dw_3 dw_3
tab_1 tab_1
cbx_org cbx_org
dw_4 dw_4
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cbx_op cbx_op
cb_4 cb_4
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
rb_4 rb_4
rb_5 rb_5
cbx_dual cbx_dual
gb_4 gb_4
gb_5 gb_5
st_vertical st_vertical
ddlb_op ddlb_op
end type
global w_codemst_m w_codemst_m

type variables
st_print i_print
string   is_dw, is_sql
boolean  ib_check = true

long    idw_w, idw_h
long    ih_curteam
integer ii_chk = 0
string  is_chk = 'N'
TreeViewitem itv_team

end variables

forward prototypes
public function boolean wf_make_team1 (string as_str)
public function boolean wf_make_team (string as_str)
public subroutine wf_filter ()
end prototypes

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

ll_count = dw_3.rowcount()
for l = 1 to ll_Count
	if dw_3.object.team_name[l] = "" then	// SKIP
	else
		ltv_team.Label = dw_3.object.team_code[l] + " " + dw_3.object.team_name[l]

		if cbx_2.checked = true then		// 영업조직
			ltv_team.Label = dw_3.object.team_code[l] + " " + dw_3.object.team_name[l]
			tab_1.tabpage_1.tv_1.InsertitemSort( lh_team, ltv_team )
			tab_1.tabpage_1.tv_1.ExpandAll( lh_team )

//			choose case left(dw_3.object.team_code[l],1)
//				case '1', '7'		// 관리본부, 영업본부
//				case else
//					// SKIP
//			end choose
		else
			ltv_team.Label = dw_3.object.team_code[l] + " " + dw_3.object.team_name[l]
			tab_1.tabpage_1.tv_1.InsertitemSort( lh_team, ltv_team )
			tab_1.tabpage_1.tv_1.ExpandAll( lh_team )
		end if
	end if
next

return( true )

end function

public function boolean wf_make_team (string as_str);// wf_make_team Boolean
// as_str       string
TreeViewitem ltv_team
INT ll_Count, lh_team, l
long ll_len


ltv_team.PictureIndex = 1
ltv_team.SelectedPictureIndex = 2

ll_count = dw_3.rowcount()
for l = 1 to ll_Count
	ltv_team.Label = dw_3.object.team_code[l] + " " + dw_3.object.team_name[l]

	lh_team = tab_1.tabpage_1.tv_1.FindItem( CurrentTreeItem! , 0 )
	tab_1.tabpage_1.tv_1.InsertitemSort( lh_team, ltv_team )
	tab_1.tabpage_1.tv_1.ExpandAll( lh_team )
next

RETURN( TRUE )


end function

public subroutine wf_filter ();//
string ls_filter[4], ls_null[], ls_filters
long   ll_row

ls_filter = ls_null		// 초기화

if cbx_1.checked = true then ls_filter[1] = "category = 'MENU' "
if cbx_2.checked = true then ls_filter[2] = "category = 'DATA' "
if cbx_3.checked = true then ls_filter[3] = "category = 'AUTH' "
if cbx_4.checked = true then ls_filter[4] = "category = 'DATE' "

for ll_row = 1 to 4
	if isnull(ls_filter[ll_row]) OR ls_filter[ll_row] = "" then
	else
		ls_filters = ls_filters + ls_filter[ll_row] + " OR "
	end if
next
ls_filters = LeftA(ls_filters, LenA(ls_filters) - 4)

dw_1.setfilter( ls_filters )
dw_1.filter()
dw_1.setsort( "category D, type A, sort A" )
dw_1.sort()

dw_4.setfilter( ls_filters )
dw_4.filter()
dw_4.setsort( "category D, type A, sort A" )
dw_4.sort()


dw_2.setfilter( ls_filters )
dw_2.filter()
dw_2.setsort( "seq A, category D, type A" )
dw_2.sort()

end subroutine

on w_codemst_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.pb_4=create pb_4
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cb_copy=create cb_copy
this.sle_from=create sle_from
this.sle_to=create sle_to
this.cb_from=create cb_from
this.cb_to=create cb_to
this.cbx_5=create cbx_5
this.dw_3=create dw_3
this.tab_1=create tab_1
this.cbx_org=create cbx_org
this.dw_4=create dw_4
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_4=create cb_4
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.rb_4=create rb_4
this.rb_5=create rb_5
this.cbx_dual=create cbx_dual
this.gb_4=create gb_4
this.gb_5=create gb_5
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.pb_4
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.cbx_2
this.Control[iCurrent+8]=this.cbx_3
this.Control[iCurrent+9]=this.cbx_4
this.Control[iCurrent+10]=this.cb_copy
this.Control[iCurrent+11]=this.sle_from
this.Control[iCurrent+12]=this.sle_to
this.Control[iCurrent+13]=this.cb_from
this.Control[iCurrent+14]=this.cb_to
this.Control[iCurrent+15]=this.cbx_5
this.Control[iCurrent+16]=this.dw_3
this.Control[iCurrent+17]=this.tab_1
this.Control[iCurrent+18]=this.cbx_org
this.Control[iCurrent+19]=this.dw_4
this.Control[iCurrent+20]=this.st_4
this.Control[iCurrent+21]=this.ddlb_fld
this.Control[iCurrent+22]=this.ddlb_dwtitles
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.sle_value
this.Control[iCurrent+25]=this.cbx_op
this.Control[iCurrent+26]=this.cb_4
this.Control[iCurrent+27]=this.cb_6
this.Control[iCurrent+28]=this.cb_7
this.Control[iCurrent+29]=this.cb_8
this.Control[iCurrent+30]=this.rb_4
this.Control[iCurrent+31]=this.rb_5
this.Control[iCurrent+32]=this.cbx_dual
this.Control[iCurrent+33]=this.gb_4
this.Control[iCurrent+34]=this.gb_5
this.Control[iCurrent+35]=this.st_vertical
this.Control[iCurrent+36]=this.ddlb_op
end on

on w_codemst_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.pb_4)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cb_copy)
destroy(this.sle_from)
destroy(this.sle_to)
destroy(this.cb_from)
destroy(this.cb_to)
destroy(this.cbx_5)
destroy(this.dw_3)
destroy(this.tab_1)
destroy(this.cbx_org)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_4)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.cbx_dual)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.st_vertical)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_2.height = newheight - dw_2.y - gb_2.x

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_1.width  = newwidth  - dw_1.x - gb_2.x
dw_1.height = newheight - dw_1.y - gb_2.x

idw_w       = dw_1.width
idw_h       = dw_1.height

end event

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_2)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false

//
dw_3.SetTransObject(SQLCA)		// 조직도
dw_4.SetTransObject(SQLCA)		// 권한듀얼

tab_1.tabpage_1.dw_8.SetTransObject(SQLCA)		// 조직도(팀원)

rb_4.enabled = false 	// 가로창
rb_5.enabled = false		// 세로창

tab_1.visible = false
dw_3.visible  = false
dw_4.visible  = false

dw_4.object.no_t.Background.Color       = rgb(204, 192, 218)
dw_4.object.id_t.Background.Color       = rgb(204, 192, 218)
dw_4.object.chk_t.Background.Color      = rgb(204, 192, 218)
dw_4.object.category_t.Background.Color = rgb(204, 192, 218)
dw_4.object.item_cd_t.Background.Color  = rgb(204, 192, 218)
dw_4.object.item_nm_t.Background.Color  = rgb(204, 192, 218)
dw_4.object.sort_t.Background.Color     = rgb(204, 192, 218)
dw_4.object.sharp_t.Background.Color    = rgb(204, 192, 218)
dw_4.object.type_t.Background.Color     = rgb(204, 192, 218)
dw_4.object.use_yn_t.Background.Color   = rgb(204, 192, 218)
dw_4.object.bigo_t.Background.Color     = rgb(204, 192, 218)

//
dw_3.retrieve( "00000" )
wf_Make_team1( "00000" )

//
rb_1.checked  = true

sle_from.text    = ""
sle_to.text      = "" 
cb_from.enabled  = false
cb_to.enabled    = false
sle_from.enabled = false
sle_to.enabled   = false
cb_copy.enabled  = true
cb_copy.text     = "권한복사"

pb_retrieve.triggerevent(clicked!)

dw_1.setfocus()

end event

type pb_save from w_inheritance`pb_save within w_codemst_m
integer x = 4096
integer y = 56
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()

if dw_1.rowcount() < 1 then return

//FOR ll_count = 1 TO dw_1.rowcount()
//	IF isnull(dw_1.object.bank_code[ll_count]) OR dw_1.object.bank_code[ll_count] <= "" THEN
//		messagebox("입력오류", string(ll_count) + " 번째 은행코드을 입력하십시오")
//		return
//	END IF
//	IF isnull(dw_1.object.bank_name[ll_count]) OR dw_1.object.bank_name[ll_count] <= "" THEN
//		messagebox("입력오류", string(ll_count) + " 번째 은행명을 입력하십시오")
//		return
//	END IF
//NEXT
//FOR li_cnt1 = 1 TO dw_1.rowcount()
//	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
//	    IF dw_1.object.bank_code[li_cnt1] = dw_1.object.bank_code[li_cnt2] THEN
//		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
//		            " 번째 은행코드가 중복되었습니다.")
//			 return
//		END IF
//   NEXT
//NEXT		            
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_codemst_m
integer x = 1801
integer y = 428
integer width = 3305
integer height = 1944
string dataobject = "d_codemst_master"
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//
is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
long   ll_row
string ls_itemcd, ls_type, ls_colname

if cbx_dual.checked = true then
	ls_itemcd = this.object.item_cd[row]
	ls_type   = this.object.type[row]
	ll_row    = dw_4.find( "item_cd = '" + ls_itemcd + "' AND type = '" + ls_type + "' ", 1, dw_4.rowcount() )
	if isnull(ll_row) OR ll_row < 1 then
	else
		dw_4.scrolltorow( ll_row )
	end if
end if

end event

event dw_1::getfocus;call super::getfocus;//
GS_Filter = ""
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event dw_1::losefocus;call super::losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type st_title from w_inheritance`st_title within w_codemst_m
integer x = 32
integer y = 20
integer width = 1152
integer height = 140
string text = "CODEMST 관리작업"
end type

type st_tips from w_inheritance`st_tips within w_codemst_m
end type

type pb_compute from w_inheritance`pb_compute within w_codemst_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_codemst_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_codemst_m
integer x = 4288
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_codemst_m
integer x = 3712
integer y = 56
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 은행코드를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_codemst_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_codemst_m
integer x = 3520
integer y = 56
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;string ls_bank_code, ls_bank_check
int    li_count
long   ll_row

if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()

//ls_bank_code = dw_1.object.bank_code[dw_1.getrow()]
//select count(*) into :li_count from glbill 
//   where bank_code = :ls_bank_code;
//IF li_count > 0 THEN
//	Messagebox("에러", "어음관리에서 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
//	return
//END IF
//
//select count(*) into :li_count from aroivc 
//   where bank_code = :ls_bank_code;
//IF li_count > 0 THEN
//	Messagebox("에러", "수금관리에서 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
//	return
//END IF

debugbreak()
li_count = dw_1.object.tchk[1]
if li_count = 0 then
else
	for ll_row = dw_1.rowcount() to 1 step -1
		if dw_1.object.chk[ll_row] = "Y" then
			dw_1.scrolltorow( ll_row )
			dw_1.deleterow( ll_row )
		end if
	next
end if

wf_update1(dw_1,"Y")
cbx_5.checked = false		// 전체


end event

type pb_insert from w_inheritance`pb_insert within w_codemst_m
integer x = 3328
integer y = 56
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;long ll_row, ll_count

dw_1.accepttext()
//FOR ll_count = 1 TO dw_1.rowcount()
//	IF isnull(dw_1.object.bank_code[ll_count]) OR dw_1.object.bank_code[ll_count] <= "" THEN
//		messagebox("입력오류", string(ll_count) + " 번째 은행코드을 입력하십시오")
//		dw_1.setcolumn("bank_code")
//		dw_1.setfocus()
//		return
//	END IF
//	IF isnull(dw_1.object.bank_name[ll_count]) OR dw_1.object.bank_name[ll_count] <= "" THEN
//		messagebox("입력오류", string(ll_count) + " 번째 은행명을 입력하십시오")
//		dw_1.setcolumn("bank_name")
//		dw_1.setfocus()
//		return
//	END IF
//NEXT
ll_row = dw_1.insertrow( dw_1.getrow() )
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('item_cd')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_codemst_m
integer x = 3113
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;//
String ls_type, ls_itemcd, ls_use

//cb_filteroff.TriggerEvent(clicked!)
dw_2.SetFilter("")
dw_2.Filter()

if rb_1.checked = true then		// 전체
	ls_use    = "%"
elseif rb_2.checked = true then	// 사용
	ls_use    = "Y"
elseif rb_3.checked = true then	// 불가 
	ls_use    = "N"
end if
ls_type   = "%"
ls_itemcd = "%"

sle_from.text    = ""
sle_to.text      = "" 
cb_from.enabled  = false
cb_to.enabled    = false
sle_from.enabled = false
sle_to.enabled   = false
cb_copy.enabled  = true
cb_copy.text     = "권한복사"

dw_2.Retrieve()
dw_1.Retrieve( ls_use, ls_itemcd, ls_type )
dw_4.Retrieve( ls_use, ls_itemcd, ls_type )


end event

type gb_3 from w_inheritance`gb_3 within w_codemst_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_codemst_m
integer x = 27
integer width = 5079
integer height = 188
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_codemst_m
integer x = 3072
integer y = 16
integer width = 1449
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_codemst_m
integer x = 27
integer y = 428
integer width = 1719
integer height = 1944
integer taborder = 60
string dataobject = "d_codemst_list"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_2"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string ls_type, acct_name
long   ll_find

ls_type   = this.object.type[row]
sle_value.text = ls_type

ll_find = dw_1.find( "type = '" + ls_type + "' ", 1, dw_1.rowcount() )
if ll_find > 1 then
	dw_1.scrolltorow( ll_find )
end if

end event

event dw_2::getfocus;call super::getfocus;//
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event dw_2::losefocus;call super::losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type cb_3 from commandbutton within w_codemst_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type rb_1 from radiobutton within w_codemst_m
integer x = 1285
integer y = 72
integer width = 261
integer height = 60
boolean bringtotop = true
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

event clicked;pb_retrieve.triggerevent(clicked!)
end event

type rb_2 from radiobutton within w_codemst_m
integer x = 1568
integer y = 72
integer width = 261
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사용"
end type

event clicked;pb_retrieve.triggerevent(clicked!)
end event

type rb_3 from radiobutton within w_codemst_m
integer x = 1568
integer y = 136
integer width = 261
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "불가"
end type

event clicked;pb_retrieve.triggerevent(clicked!)
end event

type pb_4 from picturebutton within w_codemst_m
event mousemove pbm_mousemove
integer x = 3904
integer y = 56
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_1
if ldw_sel.rowcount() > 0 then
	Integer iRet

	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		choose case ls_ExpandName
			case "xls", "XLS"
				ldw_sel.SaveAsascii(ls_DocName)
			case "csv", "CSV"
				ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end choose
	end if
end if	


end event

type cbx_1 from checkbox within w_codemst_m
integer x = 1943
integer y = 108
integer width = 265
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "MENU"
end type

event clicked;//
wf_filter()

end event

type cbx_2 from checkbox within w_codemst_m
integer x = 2213
integer y = 108
integer width = 265
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "DATA"
end type

event clicked;//
wf_filter()

end event

type cbx_3 from checkbox within w_codemst_m
integer x = 2487
integer y = 108
integer width = 265
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "AUTH"
end type

event clicked;//
wf_filter()

end event

type cbx_4 from checkbox within w_codemst_m
integer x = 2761
integer y = 108
integer width = 265
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "DATE"
end type

event clicked;//
wf_filter()

end event

type cb_copy from commandbutton within w_codemst_m
integer x = 4645
integer y = 296
integer width = 430
integer height = 92
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "권한복사"
end type

event clicked;//
long   ll_sqlcode
string ls_fromid, ls_toid, ls_usernm[2], ls_sqlerrtext

if this.text = "권한복사" then
	cb_from.enabled  = true		// FROM
	cb_to.enabled    = true		// TO
	sle_from.enabled = false
	sle_to.enabled   = false
	
	this.text = "복사실행" 
	MessageBox("확인","담당자를 선택한 후 'FROM' 버튼을 클릭하고 ~r~r" + &
	           "대상자를 선택한 후 'TO' 버튼을 클릭 후 '복사실행'을 클릭하시기 바랍니다.", Exclamation!)
else
	cb_from.enabled  = false
	cb_to.enabled    = false
	sle_from.enabled = false
	sle_to.enabled   = false
	
	if sle_from.text = "1999010s" or sle_from.text = "" or sle_to.text = "1999010s" or sle_to.text = "" then
		MessageBox("오류","권한담당자 설정이 잘못되었습니다.")
		RETURN
	else
		ls_fromid  = sle_from.text
		ls_toid    = sle_to.text
		
		if ls_fromid = ls_toid then
			messagebox("주위","동일한 담당자와 대상자는~r~n권한을 복사할수 없습니다.")
			return
		end if
		
		SELECT user_name INTO :ls_usernm[1] FROM login WHERE user_id = :ls_fromid;
      ll_sqlcode = sqlca.sqlcode
		SELECT user_name INTO :ls_usernm[2] FROM login WHERE user_id = :ls_toid;
      if ll_sqlcode = 100 or sqlca.sqlcode = 100 then
			ls_sqlerrtext = sqlca.sqlerrtext
			MessageBox("오류","해당하는 담당자를 검색하지 못했습니다.~r~n" + ls_sqlerrtext, Exclamation!)
			RETURN
		end if
		
		// FROM 권한 필터링
		dw_1.setfilter( "item_cd = '" + ls_fromid + "'" )
		dw_1.filter()
		
		if MessageBox("확인", "현재 권한들을 [" + ls_usernm[2] + "] 에게 권한복사 합니까?", Exclamation!, OKCancel!, 2) = 1 then
			DELETE CODEMST WHERE ITEM_CD = :ls_toid;
			
			INSERT INTO CODEMST (item_cd, item_nm, category, sort, type, use_yn, log_dt, bigo, prt_yn)
			SELECT :ls_toid, :ls_usernm[2], category, sort, type, use_yn, log_dt, bigo, prt_yn  
			FROM CODEMST 
			WHERE ITEM_CD = :ls_fromid;
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				MessageBox("오류","권한복사중 오류 발생했습니다.~r~n" + ls_sqlerrtext, Exclamation!)
				RETURN
			else
				COMMIT;
			end if
			
			MessageBox("확인","권한복사 완료.", Exclamation!)
			pb_retrieve.triggerevent(clicked!)
		end if
	end if

	this.text = "권한복사" 
end if
end event

type sle_from from singlelineedit within w_codemst_m
integer x = 3968
integer y = 304
integer width = 251
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type sle_to from singlelineedit within w_codemst_m
integer x = 4370
integer y = 304
integer width = 251
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_from from commandbutton within w_codemst_m
integer x = 3749
integer y = 304
integer width = 210
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "FROM"
end type

event clicked;//
long   ll_row
string ls_itemcd

ll_row = dw_1.getrow()
if ll_row < 1 or ll_row > dw_1.rowcount() then RETURN

sle_to.enabled = true

ls_itemcd = dw_1.object.item_cd[ll_row]
sle_from.text = ls_itemcd

end event

type cb_to from commandbutton within w_codemst_m
integer x = 4238
integer y = 304
integer width = 123
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "TO"
end type

event clicked;//
long   ll_row
string ls_itemcd

ll_row = dw_1.getrow()
if ll_row < 1 or ll_row > dw_1.rowcount() then RETURN

tab_1.x  = dw_1.x
tab_1.y  = dw_1.y
tab_1.visible = true

ls_itemcd = dw_1.object.item_cd[ll_row]
sle_to.text = ls_itemcd

end event

type cbx_5 from checkbox within w_codemst_m
integer x = 1216
integer y = 236
integer width = 224
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
end type

event clicked;// 전체
long ll_row
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
end choose

for ll_row = 1 to arg_dw.rowcount()
	if this.checked = true then
		arg_dw.object.chk[ll_row] = "Y"
	else
		arg_dw.object.chk[ll_row] = "N"
	end if
next

end event

type dw_3 from datawindow within w_codemst_m
integer x = 69
integer y = 116
integer width = 128
integer height = 100
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdteam_h"
boolean livescroll = true
end type

type tab_1 from tab within w_codemst_m
event create ( )
event destroy ( )
integer x = 1673
integer y = 620
integer width = 2222
integer height = 1428
integer taborder = 100
boolean dragauto = true
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
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

event dragdrop;
//TreeViewItem  ltvi_Target, ltvi_Source, ltvi_Parent, ltvi_New,ltv_team,ltv_team1,ltv_list
//Integer li_Pending
//long    j, ll_cnt1, ii, ll_diff, ll_row1, ll_len
//Long    ll_NewItem, ll_team, ll_childteam, i, ll_parentteam, ll_team1, ll_row, ll_cnt, ll_chk
//string  ls_str, ls_str1, ls_team, ls_team1, ls_label, ls_str2, ls_parentteam, ls_str3
//
//IF source.TypeOf( ) = datawindow! THEN
//	tab_1.tabpage_2.dw_4.accepttext()
//	GetItem(il_DropTarget, ltvi_Target)
//	ls_team = left(ltvi_Target.label,5)
//   If MessageBox("확인", "정말로 " + ls_team + "으로 이동하시겠읍니까?  ", Question!, YesNo!) = 2 Then Return	
//	
//	if ls_team = tab_1.tabpage_2.dw_4.object.team_code[tab_1.tabpage_2.dw_4.GetRow()] then
//		return
//	end if
//	
//	messagebox('',ls_team)
//	tab_1.tabpage_2.dw_4.object.team_code[1] = ls_team
//	ll_row = tab_1.tabpage_2.dw_4.getrow()
//	
//	messagebox('',string(ll_row))
//	tab_1.tabpage_2.dw_4.RowsMove(ll_row, ll_row, Primary!,tab_1.tabpage_2.dw_4, 1, Filter! )
////	tab_1.tabpage_2.dw_4.accepttext()
//   if wf_update1(tab_1.tabpage_2.dw_4,"Y") = false then
//      tab_1.tabpage_2.dw_4.retrieve(ls_team)
//		tab_1.tabpage_2.dw_4.scrolltorow(ll_row)
//	end if	
//	
//   return
//END IF
//
//tv_1.SetRedraw(TRUE)
//If GetItem(il_DropTarget, ltvi_Target) = -1 Then Return
//If GetItem(il_DragSource, ltvi_Source) = -1 Then Return
//
//GetItem(il_DragParent, ltvi_Parent)
//If MessageBox("확인", "정말로 " + &
//					left(string(ltvi_Source.Label),5) + " from " + &
//					left(string(ltvi_Parent.label),5) + " to " + left(ltvi_Target.label,5) + &
//					"?", Question!, YesNo!) = 2 Then Return
//
////If Not ltvi_Target.Expanded Then
////	Trigger Event ItemExpanding(il_DropTarget)
////End If
//
//SetDropHighlight(0)
//
////SetNull(ltvi_Source.ItemHandle)
//ltv_team.PictureIndex = 1
//ltv_team.SelectedPictureIndex = 2
//ltv_list.PictureIndex = 1
//ltv_list.SelectedPictureIndex = 2
//ltv_team.label = ltvi_Source.label
//GetItem(il_DropTarget, ltvi_Target)
//if ltvi_Target.Children = false then
//   ll_row = dw_1.retrieve(left(string(ltvi_Target.label),5))
//   for i = 1 to ll_row
//		 ltv_list.Label = dw_1.object.team_code[i] + " " + dw_1.object.team_name[i]
//		 ii_chk = 1
//		 InsertItemFirst(il_DropTarget, ltv_list)
//	next
//end if
//
//ii_chk = 1
//ll_NewItem = InsertItemFirst(il_DropTarget, ltv_team)
//tv_1.ExpandItem(il_DropTarget)
//ll_parentteam = tv_1.finditem(childTreeItem!,il_DropTarget)
//ii_chk = 1
//tv_1.selectitem(ll_parentteam)
//ii_chk = 0
//ll_parentteam = tv_1.finditem(childTreeItem!,ll_parentteam)
//
//for i = 1 to 9
//	 if ll_parentteam = -1 then
//		 exit
//	 else
//		 DeleteItem(ll_parentteam)
//	end if
//next
//
//
//ll_team = tv_1.finditem(CurrentTreeItem!,0)
//ll_parentteam = tv_1.finditem(parentTreeItem!,ll_team)
//tv_1.getitem(ll_team,ltv_team)
//tv_1.getitem(il_DropTarget,ltv_team1)
//ll_chk = ltv_team1.level
//if ltv_team1.level >= ltvi_Source.level then
//	if ltv_team1.level > ltvi_Source.level then
//      ls_str = left(ltvi_Source.label,ltvi_Source.level - 1)
//		ls_str2 = left(ltvi_Source.label,5)
//	else
//		ls_str = left(ltv_team.label,ll_chk - 1)
//		ls_str2 = left(ltv_team.label,5)
//	end if
//   ls_str1 = ls_str + '%'
//else
//   ls_str = left(ltv_team.label,ltvi_Source.level - 1)
//   ls_str1 = ls_str + '%'
//	ls_str2 = left(ltv_team.label,5)
//end if
//
//ll_row = dw_7.retrieve(ls_str1)
//ll_row1 = dw_8.retrieve(ls_str1)
//ls_str = left(ltv_team1.label,ll_chk)
//for i = 1 to ll_row
//	 ls_team = dw_7.object.team_code[i]
//	 ls_parentteam = dw_7.object.team_code[i]
//	 
//	 if (left(ltv_team.label,5) = ls_team) then
//		 ll_cnt  = 5 - ltv_team1.level
//		 for ii = 1 to 9
//			  ls_team1 = left(ls_str,ltv_team1.level - 1) + string(ii) + mid('00000',ltv_team.level,ll_cnt)
//			  select count(*) into :ll_cnt1 from team where team_code = :ls_team1;
//			  if ll_cnt1 > 0 then 
//				  continue
//			  else
//				  ls_str = left(ls_str,ltv_team1.level - 1) + string(ii) 
//				  exit
//			  end if
//		 next
//	    dw_7.object.team_code[i] = ls_team1
//		 ls_str3 = ls_team1
//		 dw_7.object.parent_code[i] = left(ltv_team1.label,5)
//		 dw_7.accepttext()
//		 for ii = 1 to ll_row 
//			  if ls_team = dw_7.object.parent_code[ii] then
//				  dw_7.object.parent_code[ii] = ls_team1
//			  end if
//		 next
//		 dw_8.accepttext()
//		 for ii = 1 to ll_row1 
//			  if ls_team = dw_8.object.team_code[ii] then
//				  dw_8.object.team_code[ii] = ls_team1
//			  end if
//		 next		 
//	 else
//		 ll_cnt  = 5 - ltv_team1.level
//
//		 for ii = 1 to 9
//			  if ltv_team1.level > ltvi_Source.level then 
//			     ls_team1 = ls_str + string(ii) + mid('0000000000',ltv_team.level + 1,ll_cnt - 1)
//			  else
//				  ll_diff = ltv_team.level - ltv_team1.level
//				  ls_team1 = ls_str + string(ii)  + left('00000',ll_cnt - 1)
//			  end if
//			  dw_7.accepttext()
//			  if ls_team1 = dw_7.object.team_code[i - 1] then
//				  ls_str = ls_str + string(ii)
//				  ii = 0
//				  ll_cnt = ll_cnt - 1
//				  continue
//			  end if 
//			  select count(*) into :ll_cnt1 from team where team_code like :ls_team1;
//			  if ll_cnt1 > 0 then 
//				  continue
//			  else
//				  exit
//			  end if
//		 next		 
//	    dw_7.object.team_code[i] = ls_team1
//		 dw_7.accepttext()
//		 for ii = 1 to ll_row 
//			  if ls_team = dw_7.object.parent_code[ii] then
//				  dw_7.object.parent_code[ii] = ls_team1
//			  end if
//		 next	
//		 dw_8.accepttext()
//		 for ii = 1 to ll_row1 
//			  if ls_team = dw_8.object.team_code[ii] then
//				  dw_8.object.team_code[ii] = ls_team1
//			  end if
//		 next			 
//	 end if
//next
//
//if wf_update2(dw_7,dw_8,"Y") = true then
//	 ii_chk = 1
//    DeleteItem(il_DragSource)
//
//	 ls_team = ltv_team.label
//	 ll_cnt  = 36 - 6
//	 ltv_team.label = ls_str3 + mid(ls_team,6,ll_cnt)
//	 tv_1.SetItem ( ll_team, ltv_team )
//	 ls_team = left(ls_team,5)
//	 
//    ll_team = tv_1.finditem(CurrentTreeItem!,0)
//    tv_1.GetItem(ll_team , ltv_team )
//    tab_1.tabpage_1.dw_2.retrieve(left(string(ltv_team.label),5))
//    tab_1.tabpage_1.dw_3.retrieve(left(string(ltv_team.label),5))
//	 tab_1.tabpage_2.dw_4.retrieve(left(string(ltv_team.label),5))
//else
//	 ll_team = tv_1.finditem(CurrentTreeItem!,0)
//	 ii_chk = 1
//    tv_1.DeleteItem(ll_team)
//	 tv_1.selectitem(il_DragSource)
//end if
//
end event

event dragleave;//
This.setredraw( false )
This.X = Parent.PointerX()
This.Y = Parent.PointerY()
This.setredraw( true )



end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2185
integer height = 1312
long backcolor = 79416533
string text = "조직도"
long tabtextcolor = 33554432
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
cb_1 cb_1
sle_1 sle_1
cb_5 cb_5
cb_2 cb_2
dw_8 dw_8
tv_1 tv_1
end type

on tabpage_1.create
this.cb_1=create cb_1
this.sle_1=create sle_1
this.cb_5=create cb_5
this.cb_2=create cb_2
this.dw_8=create dw_8
this.tv_1=create tv_1
this.Control[]={this.cb_1,&
this.sle_1,&
this.cb_5,&
this.cb_2,&
this.dw_8,&
this.tv_1}
end on

on tabpage_1.destroy
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.cb_5)
destroy(this.cb_2)
destroy(this.dw_8)
destroy(this.tv_1)
end on

type cb_1 from commandbutton within tabpage_1
integer x = 599
integer y = 1208
integer width = 494
integer height = 100
integer taborder = 140
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "찾기"
end type

event clicked;// 찾기
string ls_username, ls_teamname

ls_username  = sle_1.text

SELECT team_name INTO :ls_teamname
  FROM login
       LEFT OUTER JOIN team ON login.team_code = team.team_code
 WHERE user_name  = :ls_username;
if isnull(ls_teamname) OR ls_teamname = "" then
	MessageBox("확인","해당하는 담당자를 찾을 수 없습니다.")
else
	MessageBox("혹인","[" + ls_teamname + "] 에 존재합니다.")
end if

end event

type sle_1 from singlelineedit within tabpage_1
integer x = 5
integer y = 1208
integer width = 571
integer height = 100
integer taborder = 130
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 16777215
end type

type cb_5 from commandbutton within tabpage_1
integer x = 1166
integer y = 1208
integer width = 471
integer height = 100
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택"
end type

event clicked;// 사용자 선택
string ls_rank, ls_usernm, ls_userid
long   ll_row, ll_dw1row

ll_row    = tab_1.tabpage_1.dw_8.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ll_dw1row    = dw_1.getrow()
if isnull(ll_dw1row) OR ll_dw1row < 1 then RETURN

ls_rank   = tab_1.tabpage_1.dw_8.object.rank[ll_row]
ls_usernm = tab_1.tabpage_1.dw_8.object.user_name[ll_row]
ls_userid = tab_1.tabpage_1.dw_8.object.user_id[ll_row]

dw_1.object.item_cd[ll_dw1row] = ls_userid
dw_1.object.item_nm[ll_dw1row] = ls_usernm

sle_to.text = ls_userid

// 조직도
cbx_org.checked = false		
tab_1.visible   = false

end event

type cb_2 from commandbutton within tabpage_1
integer x = 1701
integer y = 1208
integer width = 471
integer height = 100
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;// 닫기
tab_1.visible   = false
cbx_org.checked = false

end event

type dw_8 from datawindow within tabpage_1
integer x = 1166
integer y = 12
integer width = 1006
integer height = 1184
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oidcgroup_member"
boolean vscrollbar = true
boolean livescroll = true
end type

event itemchanged;// 
cb_5.triggerevent( clicked! )

end event

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type tv_1 from treeview within tabpage_1
event begindrag pbm_tvnbegindrag
event clicked pbm_tvnclicked
event doubleclicked pbm_tvndoubleclicked
integer y = 12
integer width = 1147
integer height = 1184
integer taborder = 130
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
string ls_team, ls_teamlabel
DataWindowChild ldwc_team

debugbreak()

if ii_chk = 1  then 
	ii_chk = 0
	RETURN
end if

ih_Curteam = newhandle

GetItem( newhandle, itv_team )
ls_teamlabel = string(itv_team.label)
dw_8.retrieve( LeftA(ls_teamlabel,5) )

if itv_team.Children = true then RETURN	

ll_row = dw_3.retrieve( LeftA(ls_teamlabel,5) )
if ll_row < 1 then RETURN

wf_make_team(itv_team.label)

end event

type cbx_org from checkbox within w_codemst_m
integer x = 818
integer y = 308
integer width = 338
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "조직도"
end type

event clicked;// 조직도
if this.checked = true then
	tab_1.x  = dw_1.x
	tab_1.y  = dw_1.y
	tab_1.visible = true
else
	tab_1.visible = false
end if

end event

type dw_4 from datawindow within w_codemst_m
integer x = 2085
integer y = 984
integer width = 2318
integer height = 868
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_codemst_master"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//
is_dw = "dw_4"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

// 
long   ll_row
string ls_itemcd, ls_type

if cbx_dual.checked = true then
	ls_itemcd = this.object.item_cd[row]
	ls_type   = this.object.type[row]
	ll_row    = dw_1.find( "item_cd = '" + ls_itemcd + "' AND type = '" + ls_type + "' ", 1, dw_1.rowcount() )
	if isnull(ll_row) OR ll_row < 1 then
	else
		dw_1.scrolltorow( ll_row )
	end if
end if

end event

event getfocus;//
GS_Filter = ""
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255, 255, 255)		// 78682240

end event

type st_4 from statictext within w_codemst_m
integer x = 1175
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_codemst_m
integer x = 1362
integer y = 300
integer width = 443
integer height = 632
integer taborder = 100
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

type ddlb_dwtitles from dropdownlistbox within w_codemst_m
integer x = 1394
integer y = 312
integer width = 311
integer height = 88
integer taborder = 110
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

type st_6 from statictext within w_codemst_m
integer x = 1833
integer y = 316
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

type sle_value from singlelineedit within w_codemst_m
integer x = 2322
integer y = 304
integer width = 539
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

type cbx_op from checkbox within w_codemst_m
integer x = 2875
integer y = 312
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type cb_4 from commandbutton within w_codemst_m
integer x = 3081
integer y = 304
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
end choose

integer    li_ret
string     ls_column, ls_value, ls_col, ls_type, ls_op
ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_6 from commandbutton within w_codemst_m
integer x = 3246
integer y = 304
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_7 from commandbutton within w_codemst_m
integer x = 3410
integer y = 304
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_8 from commandbutton within w_codemst_m
integer x = 3575
integer y = 304
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_4"
		arg_dw  = dw_4
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type rb_4 from radiobutton within w_codemst_m
integer x = 384
integer y = 280
integer width = 306
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
string text = "가로창"
end type

event clicked;// 가로창	idw_w, idw_h
if this.checked = true then
	dw_1.width   = Parent.width - dw_1.x - gb_2.x - 37
	dw_1.height  = idw_h / 2
	
	dw_4.x       = dw_1.x
	dw_4.y       = dw_1.y + dw_1.height
	dw_4.width   = dw_1.width
	dw_4.height  = dw_1.height
	dw_4.visible = true
end if

end event

type rb_5 from radiobutton within w_codemst_m
integer x = 384
integer y = 340
integer width = 306
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
string text = "세로창"
end type

event clicked;// 세로창 idw_w, idw_h
if this.checked = true then
	dw_1.width   = (Parent.width - dw_1.x - gb_2.x - 37) / 2
	dw_1.height  = idw_h
	
	dw_4.x       = dw_1.x + dw_1.width
	dw_4.y       = dw_1.y
	dw_4.width   = dw_1.width
	dw_4.height  = dw_1.height
	dw_4.visible = true
end if

end event

type cbx_dual from checkbox within w_codemst_m
integer x = 73
integer y = 280
integer width = 297
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
string text = "듀얼창"
end type

event clicked;// 듀얼창
if this.checked = true then	
	rb_4.enabled = true
	rb_5.enabled = true
else
	dw_1.width   = Parent.width  - dw_1.x - gb_2.x - 37		//  37: Parent.width  - newwidth
	dw_1.height  = Parent.height - dw_1.y - gb_2.x - 108		// 108: Parent.height - newheight

	idw_w        = dw_1.width
	idw_h        = dw_1.height
	
	dw_4.visible = false
	
	rb_4.checked = false
	rb_5.checked = false
	
	rb_4.enabled = false
	rb_5.enabled = false
end if

end event

type gb_4 from groupbox within w_codemst_m
integer x = 1234
integer y = 16
integer width = 626
integer height = 204
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사용유무"
end type

type gb_5 from groupbox within w_codemst_m
integer x = 1883
integer y = 16
integer width = 1166
integer height = 204
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "구분"
end type

type st_vertical from u_splitbar_vertical within w_codemst_m
integer x = 1765
integer y = 428
integer height = 1944
end type

event mouseup;call super::mouseup;//
idw_w      = dw_1.width

// 세로창
if rb_5.checked = true then
	dw_4.x     = dw_1.x + dw_1.width
else
	dw_4.x     = this.x + this.width
	dw_4.width = dw_1.width
end if

end event

type ddlb_op from dropdownlistbox within w_codemst_m
integer x = 2007
integer y = 300
integer width = 306
integer height = 500
integer taborder = 100
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

