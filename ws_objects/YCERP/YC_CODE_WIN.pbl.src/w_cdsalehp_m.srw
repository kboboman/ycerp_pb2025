$PBExportHeader$w_cdsalehp_m.srw
$PBExportComments$영업사원HP관리(2001/03/15,정갑용)
forward
global type w_cdsalehp_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdsalehp_m
end type
type st_4 from statictext within w_cdsalehp_m
end type
type st_8 from statictext within w_cdsalehp_m
end type
type ddlb_fld from dropdownlistbox within w_cdsalehp_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdsalehp_m
end type
type st_9 from statictext within w_cdsalehp_m
end type
type sle_value from singlelineedit within w_cdsalehp_m
end type
type cb_filteron from commandbutton within w_cdsalehp_m
end type
type cb_filteroff from commandbutton within w_cdsalehp_m
end type
type cb_1 from commandbutton within w_cdsalehp_m
end type
type cb_2 from commandbutton within w_cdsalehp_m
end type
type st_1 from statictext within w_cdsalehp_m
end type
type st_2 from statictext within w_cdsalehp_m
end type
type st_5 from statictext within w_cdsalehp_m
end type
type st_6 from statictext within w_cdsalehp_m
end type
type cbx_1 from checkbox within w_cdsalehp_m
end type
type rb_1 from radiobutton within w_cdsalehp_m
end type
type rb_2 from radiobutton within w_cdsalehp_m
end type
type rb_3 from radiobutton within w_cdsalehp_m
end type
type rb_4 from radiobutton within w_cdsalehp_m
end type
type rb_5 from radiobutton within w_cdsalehp_m
end type
type rb_6 from radiobutton within w_cdsalehp_m
end type
type mle_1 from multilineedit within w_cdsalehp_m
end type
type gb_4 from groupbox within w_cdsalehp_m
end type
type gb_5 from groupbox within w_cdsalehp_m
end type
type st_3 from statictext within w_cdsalehp_m
end type
type sle_1 from singlelineedit within w_cdsalehp_m
end type
type rb_7 from radiobutton within w_cdsalehp_m
end type
type rb_8 from radiobutton within w_cdsalehp_m
end type
type cb_4 from commandbutton within w_cdsalehp_m
end type
type rb_9 from radiobutton within w_cdsalehp_m
end type
type cbx_fix from checkbox within w_cdsalehp_m
end type
type st_horizontal from u_splitbar_horizontal within w_cdsalehp_m
end type
type st_7 from statictext within w_cdsalehp_m
end type
type ddlb_op from dropdownlistbox within w_cdsalehp_m
end type
end forward

global type w_cdsalehp_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4759
integer height = 2228
string title = "영업사원HP관리(w_cdsalehp_m)"
cb_3 cb_3
st_4 st_4
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
st_1 st_1
st_2 st_2
st_5 st_5
st_6 st_6
cbx_1 cbx_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
mle_1 mle_1
gb_4 gb_4
gb_5 gb_5
st_3 st_3
sle_1 sle_1
rb_7 rb_7
rb_8 rb_8
cb_4 cb_4
rb_9 rb_9
cbx_fix cbx_fix
st_horizontal st_horizontal
st_7 st_7
ddlb_op ddlb_op
end type
global w_cdsalehp_m w_cdsalehp_m

type variables
public string is_bank_code, is_bank_name, is_bank_id
st_print i_print

string   is_sql, is_dw
boolean  ib_check = true

DataWindowChild idwc_user

////////////////////////////////////////////////////////////////////////////////////////////////
// The following are used for the resizing service
boolean		ib_debug = False			// Debug mode
long			il_hiddencolor = 0		// Bar hidden color to match the window background
long        iMy_Width, iMy_Height
integer     ii_vertical
integer		ii_barthickness = 32		// Bar Thickness
integer		ii_windowborder = 436	// Window border to be used on all sides
dragobject	idrg_Vertical[2]			// Reference to the vertical controls on the window
////////////////////////////////////////////////////////////////////////////////////////////////

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

/////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
/////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

mle_1.visible = false

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_2.object.현장.width     = 0
dw_2.object.미수금액.width = 0

// 틀고정
string ls_colx

ls_colx = string(integer(dw_2.object.현장.x) + integer(dw_2.object.현장.width))
dw_2.object.datawindow.horizontalscrollsplit = ls_colx

//////////////////////////////////////////////////////////////
dw_1.getchild("apply5",idwc_user)		 
idwc_user.SetTransObject(SQLCA)
idwc_user.Retrieve()
//////////////////////////////////////////////////////////////
idwc_user.insertrow(1)
idwc_user.setitem(1, "user_id", "TOP")
idwc_user.setitem(1, "user_name", "조용선")

dw_1.object.apply5[1] = "TOP" 		// 회장
//dw_1.object.apply5.TabSequence = 0 	// 회장
idwc_user.accepttext()
//////////////////////////////////////////////////////////////

if GF_Permission('영업사원HP관리', gs_userid) = 'Y' then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
	
	dw_1.Modify("user_id.TabSequence = 0" )
	dw_1.Modify("apply1.TabSequence = 0" )
	dw_1.Modify("apply2.TabSequence = 0" )
	dw_1.Modify("apply3.TabSequence = 0" )
	dw_1.Modify("apply4.TabSequence = 0" )
	dw_1.Modify("apply5.TabSequence = 0" )
	
	dw_1.Modify("salesman.TabSequence = 0" )
	dw_1.Modify("appyn.TabSequence = 0" )	
end if

rb_1.checked = true
rb_1.triggerevent( clicked! )

pb_retrieve.postevent(clicked!)


end event

on w_cdsalehp_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_4)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.cbx_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.mle_1)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.rb_7)
destroy(this.rb_8)
destroy(this.cb_4)
destroy(this.rb_9)
destroy(this.cbx_fix)
destroy(this.st_horizontal)
destroy(this.st_7)
destroy(this.ddlb_op)
end on

on w_cdsalehp_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_4=create st_4
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_1=create st_1
this.st_2=create st_2
this.st_5=create st_5
this.st_6=create st_6
this.cbx_1=create cbx_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.mle_1=create mle_1
this.gb_4=create gb_4
this.gb_5=create gb_5
this.st_3=create st_3
this.sle_1=create sle_1
this.rb_7=create rb_7
this.rb_8=create rb_8
this.cb_4=create cb_4
this.rb_9=create rb_9
this.cbx_fix=create cbx_fix
this.st_horizontal=create st_horizontal
this.st_7=create st_7
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_8
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_9
this.Control[iCurrent+7]=this.sle_value
this.Control[iCurrent+8]=this.cb_filteron
this.Control[iCurrent+9]=this.cb_filteroff
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.cbx_1
this.Control[iCurrent+17]=this.rb_1
this.Control[iCurrent+18]=this.rb_2
this.Control[iCurrent+19]=this.rb_3
this.Control[iCurrent+20]=this.rb_4
this.Control[iCurrent+21]=this.rb_5
this.Control[iCurrent+22]=this.rb_6
this.Control[iCurrent+23]=this.mle_1
this.Control[iCurrent+24]=this.gb_4
this.Control[iCurrent+25]=this.gb_5
this.Control[iCurrent+26]=this.st_3
this.Control[iCurrent+27]=this.sle_1
this.Control[iCurrent+28]=this.rb_7
this.Control[iCurrent+29]=this.rb_8
this.Control[iCurrent+30]=this.cb_4
this.Control[iCurrent+31]=this.rb_9
this.Control[iCurrent+32]=this.cbx_fix
this.Control[iCurrent+33]=this.st_horizontal
this.Control[iCurrent+34]=this.st_7
this.Control[iCurrent+35]=this.ddlb_op
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - dw_1.x - gb_2.x
dw_1.height = (newheight - dw_1.y) / 2

st_horizontal.y     = dw_1.y + dw_1.height
st_horizontal.width = dw_1.width 

dw_2.y      = dw_1.y + dw_1.height + st_horizontal.Height 
dw_2.width  = dw_1.width
dw_2.height = newheight - dw_2.y - gb_2.x

end event

type pb_save from w_inheritance`pb_save within w_cdsalehp_m
integer x = 4215
integer y = 56
end type

event pb_save::clicked;//
int    li_cnt1, li_cnt2, ll_count, li_X
string ls_appyn, ls_apply1, ls_apply2, ls_apply3

dw_1.accepttext()

if dw_1.rowcount() < 1 then RETURN

for ll_count = 1 TO dw_1.rowcount()
	if isnull(dw_1.object.user_id[ll_count]) OR dw_1.object.user_id[ll_count] <= "" THEN
		MessageBox("입력오류", string(ll_count) + " 번째 영업사원을 입력하십시오")
		dw_1.setcolumn("user_id")
		dw_1.setfocus()
		dw_1.scrolltorow(ll_count)
		RETURN
	end if

	ls_appyn  = dw_1.object.appyn[ll_count]
	ls_apply1 = dw_1.object.apply1[ll_count]
	ls_apply2 = dw_1.object.apply2[ll_count]
	ls_apply3 = dw_1.object.apply3[ll_count]
	
	if ls_appyn = "Y" then
		if (ls_apply1 = "" AND ls_apply2 = "" AND ls_apply3 = "") then
			MessageBox("결재오류", string(ll_count) + " 번째 결재자를 확인 하십시오")
			dw_1.setcolumn("appyn")
			dw_1.setfocus()
			dw_1.scrolltorow(ll_count)
			RETURN
		end if
	end if
next

for li_cnt1 = 1 TO dw_1.rowcount()
	for li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
	    if dw_1.object.user_id[li_cnt1] = dw_1.object.user_id[li_cnt2] THEN
		    MessageBox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
		            " 번째 영업사원이 중복되었습니다.")
			 RETURN
		end if
   next
next		            

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
wf_update1(dw_1, "Y")

end event

type dw_1 from w_inheritance`dw_1 within w_cdsalehp_m
integer x = 32
integer y = 436
integer width = 4585
integer height = 872
string dataobject = "d_cdsalehp_m"
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
string ls_userid
string ls_type, ls_val1, ls_val2, ls_val3, ls_val4, ls_val5, ls_val6, ls_val7, ls_val8, ls_val9

debugbreak()

if isnull(currentrow) OR currentrow < 1 then RETURN

ls_userid   = dw_1.object.user_id[currentrow]
if isnull(ls_userid) OR ls_userid = "" then RETURN


if rb_1.checked = true then
	ls_type = "cust_name"			// 거래처명
elseif rb_2.checked = true then
	ls_type = "captain_name"		// 대표자명
elseif rb_3.checked = true then
	ls_type = "addr"					// 주소
elseif rb_4.checked = true then
	ls_type = "balance_amt"			// 미수금액 00원 이상
elseif rb_5.checked = true then
	ls_type = "last_tn_date"		// 최종거래 00월 이상
elseif rb_6.checked = true then
	ls_type = "main_co"				// 주건설사
elseif rb_7.checked = true then
	ls_type = "register_no"			// 사업자번호
elseif rb_8.checked = true then
	ls_type = "terms"					// 유형	
elseif rb_9.checked = true then
	ls_type = "scene"					// 현장
end if

choose case ls_type
	case "cust_name"			// 거래처명
		ls_val1 = "%" + sle_1.text + "%"
		ls_val2 = "%" ; ls_val3 = "%" ; ls_val4 = "000" ;	ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%" 
		
	case "captain_name"		// 대표자명
		ls_val2 = "%" + sle_1.text + "%"
		ls_val1 = "%" ; ls_val3 = "%" ; ls_val4 = "000" ;	ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  

	case "addr"					// 주소
		ls_val3 = "%" + sle_1.text + "%"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val4 = "000" ;	ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  

	case "balance_amt"		// 미수금액 00원 이상
		ls_val4 = sle_1.text + "000"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  

	case "last_tn_date"		// 최종거래 00월 이상
		ls_val5 = sle_1.text
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "000" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  

	case "main_co"				// 주건설사
		ls_val6 = sle_1.text
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "000" ; ls_val5 = "0" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  
		
	case "register_no"		// 사업자번호
		ls_val7 = "%" + sle_1.text + "%"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "000" ; ls_val5 = "0" ; ls_val6 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  
		
	case "terms"				// 결재유형
		ls_val8 = "%" + sle_1.text + "%"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "000" ; ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val9 = "%"  
		
	case "scene"				// 현장
		ls_val9 = "%" + sle_1.text + "%"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "000" ; ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%"  
		
	case else
		RETURN
end choose
	
if sle_1.text = "" then
	dw_2.reset()
	dw_2.retrieve( "%", ls_userid, ls_val1, ls_val2, ls_val3, long(ls_val4), long(ls_val5), ls_val6, ls_val7, ls_val8, ls_val9 )
else
	dw_2.reset()
	dw_2.retrieve( "%", "%", ls_val1, ls_val2, ls_val3, long(ls_val4), long(ls_val5), ls_val6, ls_val7, ls_val8, ls_val9 )
end if	
end event

event dw_1::getfocus;call super::getfocus;//
is_dw = "dw_1"
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )


end event

event dw_1::itemchanged;call super::itemchanged;//
string ls_rank

if isnull(row) or row < 1 or row > this.rowcount() then RETURN

choose case dwo.name
	case "apply1"
		SELECT rank INTO :ls_rank FROM login WHERE user_id = :data;
		this.object.rank1[row] = ls_rank
		this.setcolumn( "apply2" )
		this.setfocus()
		
	case "apply2"
		SELECT rank INTO :ls_rank FROM login WHERE user_id = :data;
		this.object.rank2[row] = ls_rank
		this.setcolumn( "apply3" )
		this.setfocus()

	case "apply3"
		SELECT rank INTO :ls_rank FROM login WHERE user_id = :data;
		this.object.rank3[row] = ls_rank
		this.setcolumn( "apply4" )
		this.setfocus()

	case "apply4"
		SELECT rank INTO :ls_rank FROM login WHERE user_id = :data;
		this.object.rank4[row] = ls_rank
		this.setcolumn( "apply5" )
		this.setfocus()

	case "apply5"
		SELECT rank INTO :ls_rank FROM login WHERE user_id = :data;
		this.object.rank5[row] = ls_rank
		this.setcolumn( "salehp_rem" )
		this.setfocus()
end choose

end event

type st_title from w_inheritance`st_title within w_cdsalehp_m
integer width = 1010
string text = "영업사원 HP관리"
end type

type st_tips from w_inheritance`st_tips within w_cdsalehp_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdsalehp_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdsalehp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdsalehp_m
integer x = 4407
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdsalehp_m
integer x = 4023
integer y = 56
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then
	return
end if
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원 HP 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdsalehp_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdsalehp_m
integer x = 3831
integer y = 56
integer taborder = 130
end type

event pb_delete::clicked;//
string ls_driver, ls_bank_check
int    li_count

if dw_1.rowcount() < 1 then return	

if LeftA(dw_1.object.user_id[dw_1.getrow()],8) = 'chulha_t' then
	messagebox('확인', '삭제 할수 없는 항목입니다. 전산실에 문의하세요', information!)
	return
end if

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdsalehp_m
integer x = 3639
integer y = 56
integer taborder = 150
end type

event pb_insert::clicked;long ll_row //, ll_count

dw_1.accepttext()

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('user_id')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdsalehp_m
integer x = 3447
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//

if rb_8.checked = true then
	sle_1.triggerevent( modified! )
else
	if LenA(sle_1.text) > 0 then
		sle_1.triggerevent( modified! )
	else
		dw_1.retrieve()
	end if
end if

end event

type gb_3 from w_inheritance`gb_3 within w_cdsalehp_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdsalehp_m
integer y = 252
integer width = 4585
integer height = 168
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdsalehp_m
integer x = 3410
integer y = 16
integer width = 1211
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdsalehp_m
integer x = 32
integer y = 1344
integer width = 4585
integer height = 748
integer taborder = 60
string dataobject = "d_cdcustomer_find"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_2::getfocus;call super::getfocus;//
is_dw = "dw_2"
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )


end event

event dw_2::doubleclicked;call super::doubleclicked;// 더블클릭시 "판매거래처관리" 실행.
string ls_custno, ls_custnm

if row > 0 then
	ls_custno = trim(this.object.거래처코드[row])
	SELECT cust_name INTO :ls_custnm FROM CUSTOMER WHERE cust_no = :ls_custno;
	 
	gs_print_control = "V" + ls_custno
	if gf_permission('판매거래처관리open', gs_userid) = 'Y' then
		if IsValid(w_cdcustomer_m) = False then			
			OpenSheet(w_cdcustomer_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
			Parent.ArrangeSheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
			
			w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
			w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
			//w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
			w_cdcustomer_m.dw_1.accepttext()		

			w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
			if	w_cdcustomer_m.dw_1.event itemchanged(w_cdcustomer_m.dw_1.getrow(), w_cdcustomer_m.dw_1.object.cust_no, ls_custno) = 1 then
				w_cdcustomer_m.dw_1.event itemerror(w_cdcustomer_m.dw_1.getrow(), w_cdcustomer_m.dw_1.object.cust_no, ls_custno)
				RETURN
			end if
		
		else
			if MessageBox("확인", "작업중인 판매거래처관리 프로그램을 종료하고 재 실행 합니까?", Exclamation!, OKCancel!, 2) = 2 then
				parent.arrangesheets( Cascade! )
				RETURN
			else
				close(w_cdcustomer_m)
				OpenSheet(w_cdcustomer_m, parent.parentwindow(), 6, Cascaded!) // Layered! , Cascaded!
				Parent.ArrangeSheets(Cascade!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

				w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
				w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
				//w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
				w_cdcustomer_m.dw_1.accepttext()		
		
				if	w_cdcustomer_m.dw_1.event itemchanged(w_cdcustomer_m.dw_1.getrow(), w_cdcustomer_m.dw_1.object.cust_no, ls_custno) = 1 then
					w_cdcustomer_m.dw_1.event itemerror(w_cdcustomer_m.dw_1.getrow(), w_cdcustomer_m.dw_1.object.cust_no, ls_custno)
					RETURN
				end if
			end if
		end if
	else
		OpenSheet(w_cdcustomer_r, parent.parentwindow(), 6, Cascaded!)
		Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

		w_cdcustomer_r.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
		w_cdcustomer_r.dw_1.object.cust_no[1]   = ls_custno
		//w_cdcustomer_r.dw_1.object.cust_name[1] = ls_custnm
		w_cdcustomer_r.dw_1.accepttext()		

		if	w_cdcustomer_r.dw_1.event itemchanged(w_cdcustomer_r.dw_1.getrow(), w_cdcustomer_r.dw_1.object.cust_no, ls_custno) = 1 then
			w_cdcustomer_r.dw_1.event itemerror(w_cdcustomer_r.dw_1.getrow(), w_cdcustomer_r.dw_1.object.cust_no, ls_custno)
			RETURN
		end if
	end if
end if

end event

event dw_2::sqlpreview;call super::sqlpreview;//
//string ls_sql
//
//if gs_userid = "1999010s" then
//	mle_1.x  = dw_1.x
//	mle_1.y  = dw_1.y
//	mle_1.width  = dw_1.width
//	mle_1.height = dw_1.height
//	
//	mle_1.visible = true
//	mle_1.text = sqlsyntax	
//	//messagebox('sqlpreview', sqlsyntax)
//end if
//
end event

type cb_3 from commandbutton within w_cdsalehp_m
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

type st_4 from statictext within w_cdsalehp_m
integer x = 32
integer y = 8
integer width = 407
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "영업사원HP관리"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_cdsalehp_m
integer x = 73
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_cdsalehp_m
integer x = 256
integer y = 312
integer width = 480
integer height = 580
integer taborder = 80
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

type ddlb_dwtitles from dropdownlistbox within w_cdsalehp_m
integer x = 315
integer y = 320
integer width = 306
integer height = 92
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
end type

type st_9 from statictext within w_cdsalehp_m
integer x = 773
integer y = 332
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

type sle_value from singlelineedit within w_cdsalehp_m
integer x = 1221
integer y = 316
integer width = 512
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
end type

type cb_filteron from commandbutton within w_cdsalehp_m
integer x = 1755
integer y = 312
integer width = 197
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdsalehp_m
integer x = 1957
integer y = 312
integer width = 197
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_cdsalehp_m
integer x = 2158
integer y = 312
integer width = 183
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_cdsalehp_m
integer x = 2345
integer y = 312
integer width = 183
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type st_1 from statictext within w_cdsalehp_m
integer x = 2560
integer y = 300
integer width = 1134
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "결재: 매출할인 결재라인으로 사용함."
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdsalehp_m
integer x = 2560
integer y = 356
integer width = 1262
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
string text = "      본부장 공난시 회장님 직접 결재됨."
boolean focusrectangle = false
end type

type st_5 from statictext within w_cdsalehp_m
integer x = 2949
integer y = 52
integer width = 407
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "업체검색"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_cdsalehp_m
integer x = 2917
integer y = 228
integer width = 1051
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "더블클릭시 ~"판매거래처관리~" 실행."
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_cdsalehp_m
integer x = 4251
integer y = 256
integer width = 352
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
string text = "강제결재"
end type

event clicked;// 강제결재

if this.checked = true then
	if dw_1.object.cnt[dw_1.getrow()] > 0 then
		this.checked = false
	else		
		dw_1.object.cnt[dw_1.getrow()] = 1
	end if
end if
	
end event

type rb_1 from radiobutton within w_cdsalehp_m
integer x = 1115
integer y = 72
integer width = 361
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
string text = "거래처명"
boolean checked = true
end type

event clicked;// 거래처명
if this.checked = true then
	dw_2.object.현장.width = 0
else
	dw_2.object.현장.width = 878
end if
sle_1.setfocus()
end event

type rb_2 from radiobutton within w_cdsalehp_m
integer x = 1115
integer y = 140
integer width = 361
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
string text = "대표자명"
end type

event clicked;// 대표자명
if this.checked = true then
	dw_2.object.현장.width = 0
else
	dw_2.object.현장.width = 878
end if
sle_1.setfocus()
end event

type rb_3 from radiobutton within w_cdsalehp_m
integer x = 1495
integer y = 72
integer width = 274
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
string text = "주소"
end type

event clicked;// 주소
if this.checked = true then
	dw_2.object.현장.width = 0
else
	dw_2.object.현장.width = 878
end if
sle_1.setfocus()
end event

type rb_4 from radiobutton within w_cdsalehp_m
integer x = 1495
integer y = 140
integer width = 549
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
string text = "미수금액(천원)"
end type

event clicked;// 미수금액(천원)
if this.checked = true then
	dw_2.object.현장.width = 0
else
	dw_2.object.현장.width = 878
end if
sle_1.setfocus()

end event

type rb_5 from radiobutton within w_cdsalehp_m
integer x = 2080
integer y = 72
integer width = 549
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
string text = "최종거래(개월)"
end type

event clicked;// 최종거래(개월)
if this.checked = true then
	dw_2.object.현장.width = 0
else
	dw_2.object.현장.width = 878
end if
sle_1.setfocus()

end event

type rb_6 from radiobutton within w_cdsalehp_m
integer x = 2080
integer y = 140
integer width = 357
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
string text = "주건설사"
end type

event clicked;// 주건설사
if this.checked = true then
	dw_2.object.현장.width = 0
else
	dw_2.object.현장.width = 878
end if
sle_1.setfocus()

end event

type mle_1 from multilineedit within w_cdsalehp_m
integer x = 809
integer y = 12
integer width = 187
integer height = 104
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_cdsalehp_m
integer x = 2917
integer y = 16
integer width = 475
integer height = 204
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

type gb_5 from groupbox within w_cdsalehp_m
integer x = 1079
integer y = 16
integer width = 1824
integer height = 204
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "검색구분"
end type

type st_3 from statictext within w_cdsalehp_m
integer x = 41
integer y = 228
integer width = 1138
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
string text = "거래처 수가 ZERO 이면 매출할인 결재 안됨."
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cdsalehp_m
event keydown pbm_keydown
integer x = 2949
integer y = 124
integer width = 407
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//
string ls_type, ls_val1, ls_val2, ls_val3, ls_val4, ls_val5, ls_val6, ls_val7, ls_val8, ls_val9

if LenA(this.text) < 2 then
	if rb_8.checked = true then
		// 전체검색 가능	
	else
		MessageBox("확인","검색어를 2자리 이상 입력하시기 바랍니다.")
		RETURN
	end if
end if

debugbreak()

if rb_1.checked = true then
	ls_type = "cust_name"			// 거래처명
elseif rb_2.checked = true then
   ls_type = "captain_name"		// 대표자명
elseif rb_3.checked = true then
   ls_type = "addr"					// 주소
elseif rb_4.checked = true then
   ls_type = "balance_amt"			// 미수금액 00원 이상
elseif rb_5.checked = true then
   ls_type = "last_tn_date"		// 최종거래 00월 이상
elseif rb_6.checked = true then
   ls_type = "main_co"				// 주건설사
elseif rb_7.checked = true then
   ls_type = "register_no"			// 사업자번호
elseif rb_8.checked = true then
   ls_type = "terms"					// 유형	
elseif rb_9.checked = true then
   ls_type = "scene"					// 현장
end if

choose case ls_type
	case "cust_name"			// 거래처명
		ls_val1 = "%" + this.text + "%"
		ls_val2 = "%" ; ls_val3 = "%" ; ls_val4 = "0" ;	ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%" 
		
   case "captain_name"		// 대표자명
		ls_val2 = "%" + this.text + "%"
		ls_val1 = "%" ; ls_val3 = "%" ; ls_val4 = "0" ;	ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  

	case "addr"					// 주소
		ls_val3 = "%" + this.text + "%"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val4 = "0" ;	ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  

	case "balance_amt"		// 미수금액 00원 이상
		ls_val4 = this.text + "000"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  

	case "last_tn_date"		// 최종거래 00월 이상
		ls_val5 = this.text
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  

	case "main_co"				// 주건설사
		ls_val6 = this.text
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "0" ; ls_val5 = "0" ; ls_val7 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  
		
	case "register_no"		// 사업자번호
		ls_val7 = "%" + this.text + "%"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "0" ; ls_val5 = "0" ; ls_val6 = "%" ; ls_val8 = "%" ; ls_val9 = "%"  
		
	case "terms"				// 결재유형
		ls_val8 = "%" + this.text + "%"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "0" ; ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val9 = "%"  
		
	case "scene"				// 현장
		ls_val9 = "%" + this.text + "%"
		ls_val1 = "%" ; ls_val2 = "%" ; ls_val3 = "%" ;	ls_val4 = "0" ; ls_val5 = "0" ; ls_val6 = "%" ; ls_val7 = "%" ; ls_val8 = "%"  
		
	case else
		RETURN
end choose

dw_2.reset()
dw_2.retrieve( "%", "%", ls_val1, ls_val2, ls_val3, long(ls_val4), long(ls_val5), ls_val6, ls_val7, ls_val8, ls_val9 )

if dw_2.rowcount() > 0 then
	dw_2.scrolltorow( 1 )
	dw_2.setcolumn( "상호" )
	dw_2.setfocus()
else
	this.setfocus()
end if
MessageBox("확인","검색완료")

end event

event getfocus;// 한글 키보드 
long mode

mode = ImmGetContext( handle(parent) )
ImmSetConversionStatus( mode, 1, 0 )		// 2번째 인수값 1=KOR, 2=ENG

this.SelectText(1, LenA(this.Text))

end event

type rb_7 from radiobutton within w_cdsalehp_m
integer x = 2464
integer y = 140
integer width = 416
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
string text = "사업자번호"
end type

event clicked;// 사업자번호
if this.checked = true then
	dw_2.object.현장.width = 0
else
	dw_2.object.현장.width = 878
end if
sle_1.setfocus()

end event

type rb_8 from radiobutton within w_cdsalehp_m
integer x = 2656
integer y = 72
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "유형"
end type

event clicked;// 유형
if this.checked = true then
	dw_2.object.현장.width = 0
else
	dw_2.object.현장.width = 878
end if
sle_1.setfocus()

end event

type cb_4 from commandbutton within w_cdsalehp_m
integer x = 3835
integer y = 316
integer width = 763
integer height = 88
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "현장별 자재투입 현황"
end type

event clicked;//
string ls_custno
long   ll_row

ll_row = dw_2.getrow()
if ll_row > 0 then
	ls_custno = trim(dw_2.object.거래처코드[ll_row])

	if IsValid(w_oiscene_r) = False then			
		OpenSheet(w_oiscene_r, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
		Parent.ArrangeSheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
		
		w_oiscene_r.dw_1.object.cust_no[1] = ls_custno
		w_oiscene_r.dw_1.accepttext()		
	
		if	w_oiscene_r.dw_1.event itemchanged(w_oiscene_r.dw_1.getrow(),w_oiscene_r.dw_1.object.cust_no,ls_custno) = 1 then
			w_oiscene_r.dw_1.event itemerror(w_oiscene_r.dw_1.getrow(),w_oiscene_r.dw_1.object.cust_no,ls_custno)
			return
		else
			w_oiscene_r.pb_retrieve.triggerevent( clicked! )
		end if
	end if
else
	MessageBox("확인","거래처를 선택 하시기 바랍니다.")
end if

end event

type rb_9 from radiobutton within w_cdsalehp_m
integer x = 1810
integer y = 72
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "현장"
end type

event clicked;// 주소
if this.checked = true then
	dw_2.object.현장.width = 878
else
	dw_2.object.현장.width = 0
end if
sle_1.setfocus()
end event

type cbx_fix from checkbox within w_cdsalehp_m
integer x = 2587
integer y = 224
integer width = 315
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "틀고정"
boolean checked = true
end type

event clicked;//
string ls_colx

if this.checked = true then
	ls_colx = string(integer(dw_2.object.현장.x) + integer(dw_2.object.현장.width))
else
	ls_colx = "0"
end if
dw_2.object.datawindow.horizontalscrollsplit = ls_colx

end event

type st_horizontal from u_splitbar_horizontal within w_cdsalehp_m
integer x = 32
integer y = 1312
integer width = 4585
boolean bringtotop = true
end type

type st_7 from statictext within w_cdsalehp_m
integer x = 1216
integer y = 228
integer width = 1303
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
string text = "전자담당은 ~"전자세금계산서(관리담당)~" 에서 등록"
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_cdsalehp_m
integer x = 942
integer y = 312
integer width = 265
integer height = 500
integer taborder = 80
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

