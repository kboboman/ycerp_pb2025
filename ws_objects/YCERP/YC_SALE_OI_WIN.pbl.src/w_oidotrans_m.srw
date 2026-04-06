$PBExportHeader$w_oidotrans_m.srw
$PBExportComments$거래처 이관관리
forward
global type w_oidotrans_m from w_inheritance
end type
type em_1 from editmask within w_oidotrans_m
end type
type em_2 from editmask within w_oidotrans_m
end type
type dw_3 from datawindow within w_oidotrans_m
end type
type st_3 from statictext within w_oidotrans_m
end type
type ddlb_fld from dropdownlistbox within w_oidotrans_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oidotrans_m
end type
type st_4 from statictext within w_oidotrans_m
end type
type sle_value from singlelineedit within w_oidotrans_m
end type
type cb_1 from commandbutton within w_oidotrans_m
end type
type cb_2 from commandbutton within w_oidotrans_m
end type
type cb_3 from commandbutton within w_oidotrans_m
end type
type cb_5 from commandbutton within w_oidotrans_m
end type
type pb_1 from picturebutton within w_oidotrans_m
end type
type st_1 from statictext within w_oidotrans_m
end type
type cbx_1 from checkbox within w_oidotrans_m
end type
type st_6 from statictext within w_oidotrans_m
end type
type st_7 from statictext within w_oidotrans_m
end type
type dw_4 from datawindow within w_oidotrans_m
end type
type gb_4 from groupbox within w_oidotrans_m
end type
type pb_add from picturebutton within w_oidotrans_m
end type
type cbx_2 from checkbox within w_oidotrans_m
end type
type dw_7 from datawindow within w_oidotrans_m
end type
type tab_1 from tab within w_oidotrans_m
end type
type tabpage_1 from userobject within tab_1
end type
type cb_14 from commandbutton within tabpage_1
end type
type cbx_8 from checkbox within tabpage_1
end type
type cb_13 from commandbutton within tabpage_1
end type
type cb_12 from commandbutton within tabpage_1
end type
type cb_11 from commandbutton within tabpage_1
end type
type dw_12 from datawindow within tabpage_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type dw_8 from datawindow within tabpage_1
end type
type tv_1 from treeview within tabpage_1
end type
type cb_8 from commandbutton within tabpage_1
end type
type cb_9 from commandbutton within tabpage_1
end type
type cb_10 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_14 cb_14
cbx_8 cbx_8
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
dw_12 dw_12
cb_7 cb_7
dw_8 dw_8
tv_1 tv_1
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
end type
type tab_1 from tab within w_oidotrans_m
tabpage_1 tabpage_1
end type
type pb_del from picturebutton within w_oidotrans_m
end type
type dw_9 from datawindow within w_oidotrans_m
end type
type cb_4 from commandbutton within w_oidotrans_m
end type
type cbx_3 from checkbox within w_oidotrans_m
end type
type cbx_5 from checkbox within w_oidotrans_m
end type
type cbx_all from checkbox within w_oidotrans_m
end type
type cb_6 from commandbutton within w_oidotrans_m
end type
type rb_1 from radiobutton within w_oidotrans_m
end type
type rb_2 from radiobutton within w_oidotrans_m
end type
type rb_3 from radiobutton within w_oidotrans_m
end type
type dw_5 from datawindow within w_oidotrans_m
end type
type dw_6 from datawindow within w_oidotrans_m
end type
type dw_10 from datawindow within w_oidotrans_m
end type
type cbx_6 from checkbox within w_oidotrans_m
end type
type rb_4 from radiobutton within w_oidotrans_m
end type
type cbx_4 from checkbox within w_oidotrans_m
end type
type dw_11 from datawindow within w_oidotrans_m
end type
type cbx_7 from checkbox within w_oidotrans_m
end type
type cbx_msg from checkbox within w_oidotrans_m
end type
type st_vertical from u_splitbar_vertical within w_oidotrans_m
end type
type rb_all from radiobutton within w_oidotrans_m
end type
type rb_topno from radiobutton within w_oidotrans_m
end type
type rb_topyes from radiobutton within w_oidotrans_m
end type
type ddlb_op from dropdownlistbox within w_oidotrans_m
end type
type gb_5 from groupbox within w_oidotrans_m
end type
end forward

global type w_oidotrans_m from w_inheritance
integer y = 112
integer width = 5797
integer height = 3448
string title = "거래명세서 이관/이월/변경(w_oidotrans_m)"
em_1 em_1
em_2 em_2
dw_3 dw_3
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
pb_1 pb_1
st_1 st_1
cbx_1 cbx_1
st_6 st_6
st_7 st_7
dw_4 dw_4
gb_4 gb_4
pb_add pb_add
cbx_2 cbx_2
dw_7 dw_7
tab_1 tab_1
pb_del pb_del
dw_9 dw_9
cb_4 cb_4
cbx_3 cbx_3
cbx_5 cbx_5
cbx_all cbx_all
cb_6 cb_6
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_5 dw_5
dw_6 dw_6
dw_10 dw_10
cbx_6 cbx_6
rb_4 rb_4
cbx_4 cbx_4
dw_11 dw_11
cbx_7 cbx_7
cbx_msg cbx_msg
st_vertical st_vertical
rb_all rb_all
rb_topno rb_topno
rb_topyes rb_topyes
ddlb_op ddlb_op
gb_5 gb_5
end type
global w_oidotrans_m w_oidotrans_m

type variables
st_print i_print
string  is_user, is_apply, is_datawindow, is_row_name

DataWindowChild idwc_cust,   idwc_cust1,  idwc_cust2
DataWindowChild idwc_scene,  idwc_scene1, idwc_scene2
DataWindowChild idwc_sales1, idwc_sales2

boolean ib_applyCancel

long     il_apply			// 본인위치
long     il_appcnt		// 클릭위치

long    il_dragsource, il_dragparent, il_droptarget
long    ih_curteam
integer ii_chk = 0,  ii_amount
string  is_chk = 'N',  is_app5
TreeViewitem itv_team

////////////////////////////////////////////////////////////////////////////////////////////////
// The following are used for the resizing service
boolean		ib_debug = False			// Debug mode
long			il_hiddencolor = 0		// Bar hidden color to match the window background
integer		ii_barthickness = 32		// Bar Thickness
integer		ii_windowborder = 456	// Window border to be used on all sides
dragobject	idrg_Vertical[2]			// Reference to the vertical controls on the window
////////////////////////////////////////////////////////////////////////////////////////////////

end variables

forward prototypes
public function string wf_permission (string arg_userid, long arg_sort, string arg_flag)
public function boolean wf_make_team1 (string as_str)
public function boolean wf_make_team (string as_str)
public subroutine wf_print (datawindow arg_dw)
public function integer wf_resizebars ()
public function integer wf_resizepanels ()
public function integer wf_refreshbars ()
end prototypes

public function string wf_permission (string arg_userid, long arg_sort, string arg_flag);//////////////////////////////////////////////////////////////
//  arg_flag   : 1 (결재자), 2 [arg_sort : 1(직위), 2(이름)]
//  arg_userid : 
//////////////////////////////////////////////////////////////
string ls_val

if arg_flag = '1' then
	SELECT item_cd INTO :ls_val FROM codemst   
	 WHERE type = '매출할인_결재자' AND use_yn  = 'Y' AND sort = :arg_sort;
	
elseif arg_flag = '2' then
	choose case arg_sort
		case 1
			SELECT rank      INTO :ls_val FROM login WHERE user_id = :arg_userid AND 1 = :arg_sort;
	   case 2 
			SELECT user_name INTO :ls_val FROM login WHERE user_id = :arg_userid AND 2 = :arg_sort;
	end choose	
end if

RETURN ls_val

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

		if cbx_2.checked = true then		// 영업조직
			choose case LeftA(dw_7.object.team_code[l],1)
				case '1', '7', '9'		// 관리본부, 영업본부, 생산본부
					ltv_team.Label = dw_7.object.team_code[l] + " " + dw_7.object.team_name[l]
					tab_1.tabpage_1.tv_1.InsertitemSort( lh_team, ltv_team )
					tab_1.tabpage_1.tv_1.ExpandAll( lh_team )
				case else
					// SKIP
			end choose
		else
			ltv_team.Label = dw_7.object.team_code[l] + " " + dw_7.object.team_name[l]
			tab_1.tabpage_1.tv_1.InsertitemSort( lh_team, ltv_team )
			tab_1.tabpage_1.tv_1.ExpandAll( lh_team )
		end if
	end if
next

return( true )

end function

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

public subroutine wf_print (datawindow arg_dw);// wf_print( arg_dw )
datetime ld_date
dec      ld_amount
long     ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt
string   ls_itemno,  ls_qa, ls_price, ls_calc_amt, ls_calc_rate, ls_bigo, ls_cnt
int      li_seq_no

string   ls_transno, ls_cust_name, ls_scene_name, ls_dcdate, ls_username
string	ls_app1,  ls_app2,  ls_app3,  ls_app4,  ls_app5,  ls_apph	// ID
string	ls_rank1, ls_rank2, ls_rank3, ls_rank4, ls_rank5, ls_rankh	// 직위
string	ls_user1, ls_user2, ls_user3, ls_user4, ls_user5, ls_userh	, ls_userh1// 이름
string	ls_teamnm, ls_balteam, ls_hyupteam, ls_hyundt, ls_hyundt1
string   ls_dctype, ls_dctitle, ls_content, ls_totprice, ls_applyid	// 팀명

ll_line    = 0
ll_pagecnt = 0

ls_username = gs_username
ll_line_cnt = 10
ll_pagetot  = dw_5.rowcount()
if mod(dw_5.rowcount(), ll_line_cnt) > 0 then
	ll_pagetot = (dw_5.rowcount() / ll_line_cnt) + 1
else
	ll_pagetot = (dw_5.rowcount() / ll_line_cnt)
end if

for ll_row = 1 to dw_5.rowcount()
	if dw_5.object.trans_no[ll_row] = "" then continue
	
	if ll_line = 0 then
			ls_transno    = dw_1.object.trans_no[1]
			ls_dcdate     = string(dw_1.object.tr_date[1],"yyyy/mm/dd")
			ls_teamnm     = dw_1.object.team_name[1]
			ls_username   = dw_1.object.user_name[1]
	
		 	ls_userh      = dw_1.object.tr_userh[1]
			ls_hyundt     = string(dw_1.object.tr_apphdt[1],"mm/dd")
			
		 	ls_userh1      = dw_1.object.tr_userh1[1]
			ls_hyundt1     = string(dw_1.object.tr_apphdt1[1],"mm/dd")		
			
			ls_rank1      = dw_1.object.rank1[1]
			ls_user1      = dw_1.object.user1[1]
			ls_app1       = string(dw_1.object.tr_appdt1[1],"mm/dd")
			ls_rank2      = dw_1.object.rank2[1]
			ls_user2      = dw_1.object.user2[1]
			ls_app2       = string(dw_1.object.tr_appdt2[1],"mm/dd")
			ls_rank3      = dw_1.object.rank3[1]
			ls_user3      = dw_1.object.user3[1]
			ls_app3       = string(dw_1.object.tr_appdt3[1],"mm/dd")
			ls_rank4      = dw_1.object.rank4[1]
			ls_user4      = dw_1.object.user4[1]
			ls_app4       = string(dw_1.object.tr_appdt4[1],"mm/dd")
			ls_rank5      = dw_1.object.rank5[1]
			ls_user5      = dw_1.object.user5[1]
			ls_app5       = string(dw_1.object.tr_appdt5[1],"mm/dd")
							  
			ls_balteam    = dw_1.object.tr_balteam[1]
			ls_hyupteam   = dw_1.object.tr_hyupteam[1]
							  
			ls_cust_name  = dw_5.object.cust_name[1]
			ls_content    = dw_1.object.tr_content[1]
			ls_totprice   = string(dw_1.object.totprice[1],"#,##0")
			
			arg_dw.object.trans_no[1]    = ls_transno    
			arg_dw.object.tr_date[1]     = ls_dcdate     
			arg_dw.object.team_name[1]   = ls_teamnm     
			arg_dw.object.user_name[1]   = ls_username   
	
			arg_dw.object.tr_hyupuser[1] = ls_userh   
			arg_dw.object.tr_hyupdt[1]   = ls_hyundt
	
			arg_dw.object.rank1[1]       = ls_rank1      
			arg_dw.object.user1[1]       = ls_user1      
			arg_dw.object.tr_appdt1[1]   = ls_app1       
			arg_dw.object.rank2[1]       = ls_rank2      
			arg_dw.object.user2[1]       = ls_user2      
			arg_dw.object.tr_appdt2[1]   = ls_app2       
			arg_dw.object.rank3[1]       = ls_rank3      
			arg_dw.object.user3[1]       = ls_user3      
			arg_dw.object.tr_appdt3[1]   = ls_app3       
			arg_dw.object.rank4[1]       = ls_rank4      
			arg_dw.object.user4[1]       = ls_user4      
			arg_dw.object.tr_appdt4[1]   = ls_app4       
			arg_dw.object.rank5[1]       = ls_rank5      
			arg_dw.object.user5[1]       = ls_user5      
			arg_dw.object.tr_appdt5[1]   = ls_app5       
	
			SELECT team_name INTO :ls_balteam  FROM team   WHERE team_code = :ls_balteam;                                                 
			arg_dw.object.tr_balteam[1]  = ls_balteam    
			SELECT team_name INTO :ls_hyupteam FROM team   WHERE team_code = :ls_hyupteam;                                                 
			arg_dw.object.tr_hyupteam[1] = ls_hyupteam   
																	 
			arg_dw.object.cust_name[1]   = ls_cust_name  
			SELECT item_nm INTO :ls_dctype    FROM codemst WHERE type = '매출할인_유형' AND item_cd = :ls_dctype;                                                 
			arg_dw.object.tr_type[1]     = ls_dctype     

			arg_dw.object.cap_name[1]     = dw_1.object.cap_name[1]    
			arg_dw.object.level_credit[1] = dw_1.object.level_credit[1]
			arg_dw.object.price_level[1]  = dw_1.object.price_level[1] 
			arg_dw.object.terms[1]        = dw_1.object.terms[1]       
			arg_dw.object.shipamt_case[1] = dw_1.object.shipamt_case[1]
			arg_dw.object.credit_limit[1] = string(dw_1.object.credit_limit[1],"#,##0")
			arg_dw.object.balance_amt[1]  = string(dw_1.object.balance_amt[1] ,"#,##0")
			arg_dw.object.main_co[1]      = dw_1.object.main_co[1]     
			arg_dw.object.license_name[1] = dw_1.object.license_name[1]
			arg_dw.object.tr_content[1]   = ls_content    
			arg_dw.object.price[1]        = ls_totprice
		
//		arg_dw.object.pagecnt[1]    = string(ll_pagecnt + 1) + " / " + string(ll_pagetot)
	end if
	
   	ls_scene_name= dw_5.object.scene_desc[ll_row]
	ls_price     = string(dw_5.object.price[ll_row],     '###,###,##0')
	ls_calc_amt  = string(dw_5.object.calc_amt[ll_row],  '###,###,##0')
	ls_calc_rate = string(dw_5.object.calc_rate[ll_row], '###,###,##0.0')
   	ls_bigo      = dw_5.object.rem[ll_row]
	
	ll_line    = ll_line + 1
	arg_dw.setitem(1, 'scene_name' + string(ll_line,"00"), ls_scene_name)
	arg_dw.setitem(1, 'price'      + string(ll_line,"00"), ls_price)
	arg_dw.setitem(1, 'calc_amt'   + string(ll_line,"00"), ls_calc_amt)
	arg_dw.setitem(1, 'calc_rate'  + string(ll_line,"00"), ls_calc_rate)
	arg_dw.setitem(1, 'rem'        + string(ll_line,"00"), ls_bigo)

	if ll_line = ll_line_cnt then 	// LABEL지 10줄
		ll_line    = 0
		ll_pagecnt = ll_pagecnt + 1
		arg_dw.print()
		arg_dw.reset()
		arg_dw.insertrow(0)
	end if
next

end subroutine

public function integer wf_resizebars ();// wf_resizebars()
// Resize Bars according to Bars themselves, WindowBorder, and BarThickness.

Integer li_x1, li_y1, li_x2, li_y2

li_x1 = st_vertical.X
li_y1 = ii_WindowBorder
li_x2 = ii_barthickness
li_y2 = 5 + This.WorkSpaceHeight() - 492	// this.height - st_vertical.height

st_vertical.Move( li_x1, li_y1 )
st_vertical.Resize( li_x2, li_y2 )

wf_RefreshBars()

Return 1


end function

public function integer wf_resizepanels ();// wf_resizepanels()

Integer	li_X, li_Y, li_HHeight, li_HWidth
Long		ll_Width, ll_Height, ll_X1, ll_Y1, ll_X2, ll_Y2
integer  dw_leftX

dw_leftX  = 37
ll_Width  = this.WorkSpaceWidth()
ll_Height = this.WorkspaceHeight()

if ll_Width < idrg_Vertical[2].X + 150 then
	ll_Width = idrg_Vertical[2].X + 150
end if

if ll_Height < idrg_Vertical[1].Y + 150 then
	ll_Height = idrg_Vertical[1].Y + 150
end if

if st_vertical.X <= st_vertical.Width then st_vertical.BackColor = rgb(128, 128, 128)

// Left vertical object processing
ll_X1 = dw_leftX
ll_Y1 = ii_WindowBorder
ll_X2 = st_vertical.X - idrg_Vertical[1].X
ll_Y2 = ll_Height - idrg_Vertical[1].Y - dw_leftX

idrg_Vertical[1].Move( ll_X1, ll_Y1 )
idrg_Vertical[1].Resize( ll_X2, ll_Y2 )

// Right vertical object processing
ll_X1 = st_vertical.X + ii_BarThickness
ll_Y1 = ii_WindowBorder
ll_X2 = ll_Width - st_vertical.X - st_vertical.Width - 37
ll_Y2 = 1280	// ll_Height - idrg_Vertical[2].Y - dw_leftX

idrg_Vertical[2].Move( ll_X1, ll_Y1 )
idrg_Vertical[2].Resize( ll_X2, ll_Y2 )

dw_5.x     = dw_1.x
dw_5.width = dw_1.width
dw_6.x     = dw_1.x
dw_6.width = dw_1.width

dw_9.x      = dw_3.x 
dw_9.y      = dw_3.y 
dw_9.width  = dw_3.width
dw_9.height = dw_3.height 

RETURN 1

end function

public function integer wf_refreshbars ();////////////////////////////////
// wf_refreshbars()
////////////////////////////////
Integer	li_Cnt

// Force appropriate order
st_vertical.SetPosition( ToTop! )

// Make sure the Width is not lost
st_vertical.Width = ii_BarThickness

Return 1

end function

on w_oidotrans_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.pb_1=create pb_1
this.st_1=create st_1
this.cbx_1=create cbx_1
this.st_6=create st_6
this.st_7=create st_7
this.dw_4=create dw_4
this.gb_4=create gb_4
this.pb_add=create pb_add
this.cbx_2=create cbx_2
this.dw_7=create dw_7
this.tab_1=create tab_1
this.pb_del=create pb_del
this.dw_9=create dw_9
this.cb_4=create cb_4
this.cbx_3=create cbx_3
this.cbx_5=create cbx_5
this.cbx_all=create cbx_all
this.cb_6=create cb_6
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_10=create dw_10
this.cbx_6=create cbx_6
this.rb_4=create rb_4
this.cbx_4=create cbx_4
this.dw_11=create dw_11
this.cbx_7=create cbx_7
this.cbx_msg=create cbx_msg
this.st_vertical=create st_vertical
this.rb_all=create rb_all
this.rb_topno=create rb_topno
this.rb_topyes=create rb_topyes
this.ddlb_op=create ddlb_op
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.pb_1
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.cbx_1
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.st_7
this.Control[iCurrent+18]=this.dw_4
this.Control[iCurrent+19]=this.gb_4
this.Control[iCurrent+20]=this.pb_add
this.Control[iCurrent+21]=this.cbx_2
this.Control[iCurrent+22]=this.dw_7
this.Control[iCurrent+23]=this.tab_1
this.Control[iCurrent+24]=this.pb_del
this.Control[iCurrent+25]=this.dw_9
this.Control[iCurrent+26]=this.cb_4
this.Control[iCurrent+27]=this.cbx_3
this.Control[iCurrent+28]=this.cbx_5
this.Control[iCurrent+29]=this.cbx_all
this.Control[iCurrent+30]=this.cb_6
this.Control[iCurrent+31]=this.rb_1
this.Control[iCurrent+32]=this.rb_2
this.Control[iCurrent+33]=this.rb_3
this.Control[iCurrent+34]=this.dw_5
this.Control[iCurrent+35]=this.dw_6
this.Control[iCurrent+36]=this.dw_10
this.Control[iCurrent+37]=this.cbx_6
this.Control[iCurrent+38]=this.rb_4
this.Control[iCurrent+39]=this.cbx_4
this.Control[iCurrent+40]=this.dw_11
this.Control[iCurrent+41]=this.cbx_7
this.Control[iCurrent+42]=this.cbx_msg
this.Control[iCurrent+43]=this.st_vertical
this.Control[iCurrent+44]=this.rb_all
this.Control[iCurrent+45]=this.rb_topno
this.Control[iCurrent+46]=this.rb_topyes
this.Control[iCurrent+47]=this.ddlb_op
this.Control[iCurrent+48]=this.gb_5
end on

on w_oidotrans_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.dw_4)
destroy(this.gb_4)
destroy(this.pb_add)
destroy(this.cbx_2)
destroy(this.dw_7)
destroy(this.tab_1)
destroy(this.pb_del)
destroy(this.dw_9)
destroy(this.cb_4)
destroy(this.cbx_3)
destroy(this.cbx_5)
destroy(this.cbx_all)
destroy(this.cb_6)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_10)
destroy(this.cbx_6)
destroy(this.rb_4)
destroy(this.cbx_4)
destroy(this.dw_11)
destroy(this.cbx_7)
destroy(this.cbx_msg)
destroy(this.st_vertical)
destroy(this.rb_all)
destroy(this.rb_topno)
destroy(this.rb_topyes)
destroy(this.ddlb_op)
destroy(this.gb_5)
end on

event open;call super::open;string ls_custno

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

/////////////////////////////////////////////////////////////////////////////////////
// register objects with vertical splitbar
st_vertical.of_set_leftobject(dw_3)

st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_rightobject(dw_5)
st_vertical.of_set_rightobject(dw_6)
st_vertical.of_set_minsize(250, 250)
/////////////////////////////////////////////////////////////////////////////////////


dw_3.SetTransObject(SQLCA)		// 문서목록
dw_4.SetTransObject(SQLCA)		// 출력양식
dw_5.SetTransObject(SQLCA)		// 문서상세
dw_6.SetTransObject(SQLCA)		// 결재자비고
dw_7.SetTransObject(SQLCA)		// 조직도
tab_1.tabpage_1.dw_8.SetTransObject(SQLCA)		// 조직도(팀원)
tab_1.tabpage_1.dw_12.SetTransObject(SQLCA)	// 즐겨찾기 결재라인
dw_9.SetTransObject(SQLCA)		// 출고송장
dw_10.SetTransObject(SQLCA)	// 자재납품확인서
dw_11.SetTransObject(SQLCA)	// 결재반영된 송장들

tab_1.height = 796
tab_1.width  = 2267

tab_1.tabpage_1.cb_11.visible = false
tab_1.tabpage_1.cb_12.visible = false
tab_1.tabpage_1.cb_13.visible = false	
tab_1.tabpage_1.cb_14.visible = false	


//	화면출력
dw_1.getchild("fcust_no", idwc_cust1)
idwc_cust1.settransobject(sqlca)

dw_1.getchild("fspot_code", idwc_scene1)
idwc_scene1.settransobject(sqlca)
idwc_scene1.retrieve( ls_custno )	// d_cdtransscene_dddw

dw_1.getchild("tcust_no", idwc_cust2)
idwc_cust2.settransobject(sqlca)

dw_1.getchild("tspot_code", idwc_scene2)
idwc_scene2.settransobject(sqlca)
idwc_scene2.retrieve( "%" )			// d_cdtransscene_dddw

dw_1.getchild("fsalesman", idwc_sales1)	// d_cduser_all
idwc_sales1.settransobject(sqlca)

dw_1.getchild("tsalesman", idwc_sales2)	// d_cduser_all
idwc_sales2.settransobject(sqlca)

dw_5.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)

dw_5.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)		// d_cdscene_dddw



dw_2.visible  = false	// 송장상세
dw_4.visible  = false	// 프린트
dw_7.visible  = false	// 조직도
dw_9.visible  = false	// 출고송장
dw_10.visible = false	// 자재납품확인서
dw_11.visible = false

cbx_6.visible = false   // 자재납품확인서
cb_4.enabled  = false	// 출고송장 가져오기
cbx_3.enabled = false	// 전체선택
tab_1.visible = false 	// 조직도

// 매출이관이월 작업구분별 당월누계금액이(ii_amount) 초과할 경우는 회장님 결재
// YCEIS, YCALARM 프로그램에서 금액 체크함
SELECT isnull(sort,0) INTO :ii_amount FROM codemst 
 WHERE type = '매출이관이월_최종결재자_금액' AND item_cd = 'TOP' AND use_yn = 'Y';
if ii_amount = 0 then ii_amount = 10000000

if GF_PERMISSION("매출이관이월_전체보기", gs_userid) = "Y" then
	cbx_all.enabled = true
else
	cbx_all.enabled = false
end if
if GF_PERMISSION("매출이관이월_현장이관", gs_userid) = "Y" then
	rb_3.enabled = true
else
	rb_3.enabled = false
end if


dw_7.retrieve( "00000" )
wf_Make_team1( "00000" )

////////////////////////////////////////////////////////////////
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )
////////////////////////////////////////////////////////////////

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN with(nolock);
	  
if Day(today()) > 10 then
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = ls_lastday	// 당월말일
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if

pb_retrieve.postevent( clicked! )

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

dw_3.height = newheight - dw_3.y - gb_4.x

st_vertical.height = dw_3.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_4.x


dw_5.x      = st_vertical.x + st_vertical.width
dw_5.width  = newwidth  - dw_5.x - gb_4.x
dw_5.height = dw_3.height - dw_1.height - dw_6.height

dw_6.x      = st_vertical.x + st_vertical.width
dw_6.y      = dw_5.y + dw_5.height
dw_6.width  = newwidth  - dw_6.x - gb_4.x


tab_1.x     = dw_1.x
tab_1.y     = dw_1.y

dw_9.x      = dw_3.x 
dw_9.y      = dw_3.y 
dw_9.width  = dw_3.width
dw_9.height = dw_3.height 

// 기반영된 송장
dw_11.x      = dw_1.x 
dw_11.y      = dw_1.y 
dw_11.width  = dw_1.width
dw_11.height = dw_9.height 

end event

type pb_save from w_inheritance`pb_save within w_oidotrans_m
integer x = 5047
integer y = 68
integer taborder = 50
end type

event pb_save::clicked;call super::clicked;///////////////////////////////////////////////////////////////////////
// 1) 작성자가 직접 저장하는 경우
// 2) dw_1 DoubleClicked Event에서 결재상태 체크 후 Call 하는 경우
///////////////////////////////////////////////////////////////////////

string	ls_transno, ls_itemno, ls_qa, ls_qa_cust, ls_uom, ls_magamyn, ls_yyyymm
string	ls_custno,  ls_itemcd, ls_itemnm
string   ls_rem1, ls_rem2, ls_rem3, ls_rem4, ls_rem5, ls_remh
string   ls_app1, ls_app2, ls_app3, ls_app4, ls_app5, ls_apph, ls_apph1, ls_apph2

decimal  ld_totAmount, ld_totprice, ld_applyAMT
long		ll_row, ll_dw3_row, ll_oi_no, ll_seq_no, ll_ship_qty, ll_price, ll_rate_cash, ll_cnt, ll_stock_qty
date		ld_date
datetime ldt_date
string   ls_apply, ls_applyend, ls_ccflag, ls_trtype, ls_sdate, ls_edate, ls_dberror, ls_runid

setnull( ldt_date )

if dw_1.accepttext() = -1 then return
if dw_5.accepttext() = -1 then return
if dw_1.rowcount() < 1 then RETURN

// 마감통제 체크
ls_yyyymm = string(dw_1.object.tr_date[1],"yyyymm")
SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '00';
if ls_magamyn <> "N" then
	MessageBox('확인','해당년월은 마감되었습니다.',Stopsign!)
	dw_1.setcolumn("tr_date")
	dw_1.setfocus()
	RETURN
end if

ls_sdate = em_1.text
ls_edate = em_2.text

// 매출이관이월결재_실행자
SELECT item_cd INTO :ls_runid 
FROM codemst 
WHERE type = '매출이관이월결재_실행자' AND use_yn = 'Y';

if isnull(ls_runid) OR ls_runid = "" then
	MessageBox("확인","매출이관이월결재_실행자 를 찾을 수 없습니다.")
	RETURN
end if

//////////////////////////////////////////////////////////////////
// 문서내용
//////////////////////////////////////////////////////////////////
ls_trtype   = dw_1.object.tr_type[1] 		// MOVE: 이관, NEXT: 이월, SPOT: 현장, DO: 송장
ls_transno  = dw_1.object.trans_no[1]		// 문서번호
ls_custno   = dw_1.object.fcust_no[1]		// 변경전 거래처
ld_totprice = dw_1.object.tr_transamt[1]	// 문서금액
ls_apph     = dw_1.object.tr_apph[1]		// 협조자
ls_apph1		= dw_1.object.tr_apph1[1]		// 협조자
ls_apph2		= dw_1.object.tr_apph2[1]		// 협조자	bkkim

if isnull(ls_trtype) OR ls_trtype = "" then
	dw_1.setcolumn("tr_type")
	dw_1.setfocus()
	MessageBox('확인','작업구분이 누락 되었습니다.',Stopsign!)
	RETURN
end if

// 매출이관이월_협조자
SELECT top 1 rtrim(item_cd), rtrim(item_nm) INTO :ls_itemcd, :ls_itemnm
FROM codemst 
WHERE type = '매출이관이월_협조자' AND use_yn = 'Y';

// 문서타입
choose case ls_trtype
	case "MOVE", "NEXT"			// MOVE: 이관, NEXT: 이월
		/*2021/11/1 jowonsuk 협조자1 추가로 로직 변경 협조자, 협조자1 분리로 각각 협조자 지정되어 있는지 점검 */
		// 매출이관이월_협조자
		if ls_apph <> ls_itemcd then
				dw_1.setcolumn("tr_apph")
				dw_1.setfocus()
				MessageBox('확인','매출이관이월_협조자[' + ls_itemnm + '] 를 지정하시기 바랍니다.',Stopsign!)
				RETURN
		end if

		// 매출이관이월_협조자1
		ls_itemcd	= ''
		ls_itemnm	= ''
		SELECT top 1 rtrim(item_cd), rtrim(item_nm) INTO :ls_itemcd, :ls_itemnm
		FROM codemst 
		WHERE type = '매출이관이월_협조자1' AND use_yn = 'Y';			
		 
		if ls_apph1 <> ls_itemcd then			
			dw_1.setcolumn("tr_apph1")
			dw_1.setfocus()
			MessageBox('확인','매출이관이월_협조자1[' + ls_itemnm + '] 를 지정하시기 바랍니다.',Stopsign!)
			RETURN
		end if						
		
		// 매출이관이월_협조자2	bkkim 
		//- 20241213 주석처리함 => 공통코드에 협조자2를 등록 안할 경우
		ls_itemcd	= ''
		ls_itemnm	= ''
		SELECT top 1 rtrim(item_cd), rtrim(item_nm) INTO :ls_itemcd, :ls_itemnm
		FROM codemst 
		WHERE type = '매출이관이월_협조자2' AND use_yn = 'Y';			
		 
		if ls_itemcd <> '' then 
			if ls_apph2 <> ls_itemcd then			
				dw_1.setcolumn("tr_apph2")
				dw_1.setfocus()
				MessageBox('확인','매출이관이월_협조자2[' + ls_itemnm + '] 를 지정하시기 바랍니다.',Stopsign!)
				RETURN
			end if						
		end if

	case else						// SPOT: 현장, DO: 송장
		if isnull(ls_apph) OR ls_apph = "" then
			MessageBox('확인','현장변경, 주요업무는 협조자를 정하시기 바랍니다.',Stopsign!)
			dw_1.setcolumn("tr_apph")
			dw_1.setfocus()
			RETURN
		end if
end choose

// 변경전 거래처
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox('확인','변경전 거래처가 누락 되었습니다.',Stopsign!)
	dw_1.setcolumn("fcust_no")
	dw_1.setfocus()
	RETURN
end if

// 변경전 대표자명
if isnull(dw_1.object.fcaptain_name[1]) OR dw_1.object.fcaptain_name[1] = "" then
	MessageBox("확인","변경전 거래처 대표자가 누락되었습니다. 마스터에서 수정 바랍니다.")
	RETURN	
end if

// 변경전 채권잔액
if isnull(dw_1.object.funpaid_amt[1]) then dw_1.object.funpaid_amt[1] = 0

// 출고송장번호
if dw_5.rowcount() < 1 then
	MessageBox("확인","문서 내용이 한건도 존재하지 않습니다.")
	RETURN	
end if

// 문서종류에 따른 필수데이터 체크
choose case ls_trtype
	case "MOVE" 		// 매출이관
		if isnull(dw_1.object.tcust_no[1]) OR dw_1.object.tcust_no[1] = "" then
			MessageBox('확인','이관대상 거래처가 누락 되었습니다.',Stopsign!)
			dw_1.setcolumn("tcust_no")
			dw_1.setfocus()
			RETURN
		else
			if isnull(dw_1.object.tspot_code[1]) OR dw_1.object.tspot_code[1] = "" then
				MessageBox('확인','이관대상 현장이 누락 되었습니다.',Stopsign!)
				dw_1.setcolumn("tspot_code")
				dw_1.setfocus()
				RETURN
			end if
		end if
		
	case "NEXT" 		// 매출이월
		if isnull(dw_1.object.tcust_no[1]) OR dw_1.object.tcust_no[1] = "" then
		else
			dw_1.object.tcust_no[1] = ""
			if isnull(dw_1.object.tspot_code[1]) OR dw_1.object.tspot_code[1] = "" then
			else
				dw_1.object.tspot_code[1] = ""
			end if
		end if

	case "SPOT" 		// 현장변경
		if isnull(dw_1.object.tcust_no[1]) OR dw_1.object.tcust_no[1] = "" then
			MessageBox('확인','변경후 거래처가 누락되었습니다.',Stopsign!)
			dw_1.setcolumn("tcust_no")
			dw_1.setfocus()
			RETURN
		end if
	
		if isnull(dw_1.object.tspot_code[1]) OR dw_1.object.tspot_code[1] = ""  then
			MessageBox('확인','변경후 현장이 누락되었습니다.',Stopsign!)
			dw_1.setcolumn("tspot_code")
			dw_1.setfocus()
			RETURN
		end if

	case "DO" 			// 주요업무(출고수정)
		for ll_row = 1 to 5
			ls_apply  = dw_1.GetItemString( 1, "tr_app" + string(ll_row) )
			if isnull(ls_apply) OR ls_apply = "" then
			else
				ll_cnt = ll_cnt + 1
			end if
		next

		if ll_cnt < 1 then
			MessageBox("확인","주요업무 문서의 필수 결재자는 1명 이상으로 설정해야 합니다.")
			RETURN	
		end if
		
		// 주요업무(출고수정)는 협조자1,2 필요없음 협조자 2022-01-26 jowonsuk bkkim
		if isnull(dw_1.object.tr_apph[1]) OR dw_1.object.tr_apph[1] = "" then
			MessageBox("확인","주요업무 문서는 협조자를 반드시 선택해야 합니다.")
			RETURN	
		end if
		
		
		if isnull(dw_1.object.tcust_no[1]) OR dw_1.object.tcust_no[1] = "" then
		else
			dw_1.object.tcust_no[1] = ""
			if isnull(dw_1.object.tspot_code[1]) OR dw_1.object.tspot_code[1] = "" then
			else
				dw_1.object.tspot_code[1] = ""
			end if
		end if

	case else
		MessageBox("확인저장","문서종류가 설정되지 않았습니다.")
		RETURN	
end choose
//////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////
// DOTRANS 체크
//////////////////////////////////////////////////////////////////
ld_date = date(dw_1.object.tr_date[1])

if isnull(ld_date) then
	MessageBox('확인','매출이관이월 기준일자가 누락되었습니다.',Stopsign!)
	dw_1.setcolumn("tr_date")
	dw_1.setfocus()
	RETURN
end if

if string(ld_date,"yyyy/mm/dd") > string(gf_today(),"yyyy/mm/dd") then
	MessageBox('확인','매출이관이월 기준일자는 ' + string(gf_today(),"yyyy/mm/dd") + ' 까지 입니다.',Stopsign!)
	dw_1.setcolumn("tr_date")
	dw_1.setfocus()
//	RETURN
end if

if isnull(dw_1.object.fcust_no[1]) then
	MessageBox('확인','거래처가 누락되었습니다.',Stopsign!)
	dw_1.setcolumn("fcust_no")
	dw_1.setfocus()
	RETURN
end if

if isnull(dw_1.object.tr_content[1]) then
	MessageBox('확인','변경사유가 누락되었습니다.',Stopsign!)
	dw_1.setcolumn("tr_content")
	dw_1.setfocus()
	RETURN
end if
//////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////
// DOTRANSDET 체크
//////////////////////////////////////////////////////////////////
for ll_row = 1 to dw_5.rowcount()
	dw_5.object.trans_no[ll_row] = dw_1.object.trans_no[1] 	// 이관번호
	dw_5.object.seq_no[ll_row]   = ll_row							// 이관순번

	if isnull(dw_5.object.do_no[ll_row]) then
		MessageBox('확인','출고번호 누락되었습니다.',Stopsign!)
		dw_5.setcolumn("do_no")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.cust_no[ll_row]) then
		MessageBox('확인','거래처가 누락되었습니다.',Stopsign!)
		dw_5.setcolumn("cust_no")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.scene_code[ll_row]) then
		MessageBox('확인','현장이 누락되었습니다.',Stopsign!)
		dw_5.setcolumn("scene_code")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.trans_amt[ll_row]) then
		MessageBox('확인','출고금액이 누락되었습니다.',Stopsign!)
		dw_5.setcolumn("trans_amt")
		dw_5.setfocus()
		RETURN
	end if

	if isnull(dw_5.object.do_date[ll_row]) then
		MessageBox('확인','출고일자가 누락되었습니다.',Stopsign!)
		//dw_5.setcolumn("do_date")
		dw_5.setfocus()
		RETURN
	end if
next
//////////////////////////////////////////////////////////////////


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//문서 번호 채번
ls_transno = dw_1.object.trans_no[1]
if isnull(ls_transno) OR ls_transno = "" then	// 신규모드
	SELECT isnull(max(trans_no),'') INTO :ls_transno FROM dotrans WHERE tr_date = :ld_date;
	
	if isnull(ls_transno) then ls_transno = ""
	if ls_transno = "" then
		ls_transno = "TR" + string(ld_date,"yyyymmdd") + "-001"
	else
		ls_transno = LeftA(ls_transno,11) + string(long(RightA(ls_transno,3)) + 1,"000")
	end if
	
	dw_1.object.trans_no[1] = ls_transno
else
	// 수정모드	(이관일자 변경한 경우)
	if string(ld_date,"yyyymmdd") <> MidA(ls_transno,3,8) then
		if MessageBox("일자변경","매출이관이월 기준일자를 변경하시겠습니까?",Exclamation!, YesNo!, 2) = 2 then
			RETURN
		end if
	
		SELECT isnull(max(trans_no),'') INTO :ls_transno FROM dotrans WHERE tr_date = :ld_date;
		if isnull(ls_transno) then ls_transno = ""
		if ls_transno = "" then
			ls_transno = "TR" + string(ld_date,"yyyymmdd") + "-001"
		else
			ls_transno = LeftA(ls_transno,11) + string(long(RightA(ls_transno,3)) + 1,"000")
		end if
		dw_1.object.trans_no[1] = ls_transno
	end if
end if

// 일자변경 할수도 있음
for ll_row = 1 to dw_5.rowcount()
	dw_5.object.trans_no[ll_row] = ls_transno
	dw_5.object.seq_no[ll_row]   = ll_row			// 순번
next
//////////////////////////////////////////////////////////////////////
dw_1.object.tr_transamt[1]  = dw_5.object.tot_price[1]	// 이관총액
//////////////////////////////////////////////////////////////////////

dw_1.AcceptText()		// HEAD
dw_5.AcceptText()		// DETAIL
dw_6.AcceptText()		// HEAD(설명)

ls_rem1 = dw_6.object.tr_rem1[1]		// 설명
ls_rem2 = dw_6.object.tr_rem2[1]
ls_rem3 = dw_6.object.tr_rem3[1]
ls_rem4 = dw_6.object.tr_rem4[1]
ls_rem5 = dw_6.object.tr_rem5[1]
ls_remh = dw_6.object.tr_remh[1]

// 등록과 동시에 본인결재
ls_app1 	= dw_1.object.tr_app1[1]
ls_app2 	= dw_1.object.tr_app2[1]
ls_app3 	= dw_1.object.tr_app3[1]
ls_app4 	= dw_1.object.tr_app4[1]
ls_app5 	= dw_1.object.tr_app5[1]
//ls_apph 	= dw_1.object.tr_apph[1]
//ls_apph1 = dw_1.object.tr_apph1[1]
//ls_apph2 = dw_1.object.tr_apph2[1]	//bkkim

if isnull(ls_app1) then ls_app1 = ""
if isnull(ls_app2) then ls_app2 = ""
if isnull(ls_app3) then ls_app3 = ""

if ib_applyCancel = true then
	// 결재취소
else
	if dw_1.object.cc_flag[1] = "0" then	// 작성중
		if gs_userid = ls_app1 then dw_1.object.tr_appdt1[1] = Date(gdt_today)
		if gs_userid = ls_app2 then dw_1.object.tr_appdt2[1] = Date(gdt_today)
		if gs_userid = ls_app3 then dw_1.object.tr_appdt3[1] = Date(gdt_today)
	end if
end if

//////////////////////////////////////////////////////////////////
// dw_1: HEAD, dw_5: DETAIL
//////////////////////////////////////////////////////////////////
if wf_update2( dw_1, dw_5, "Y") = true then
	UPDATE DOTRANS
	   SET tr_rem1 = :ls_rem1, tr_rem2 = :ls_rem2
		  , tr_rem3 = :ls_rem3, tr_rem4 = :ls_rem4
		  , tr_rem5 = :ls_rem5, tr_remh = :ls_remh
	 WHERE trans_no  = :ls_transno;
	if sqlca.sqlcode <> 0 then
		COMMIT;
	end if
	
	// 메시지 전송
	if is_apply = "user5" OR is_apply = "userh" or is_apply = "userh1" or is_apply = "userh2" then
		// 종결문서 체크
		if dw_1.object.apply_end[1] = "Y" then
			choose case dw_1.object.tr_type[1]		// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
				case "DO"
					ls_dberror = "[종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
									 "매출이관이월_주요업무 문서종결 되었습니다."
					INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) 
					VALUES (:gs_userid, :ls_itemcd, getdate(), :ls_dberror,'N');	
					COMMIT;
	
				case "SPOT"
					ls_dberror = "[종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
									 "매출이관이월_현장이관 문서종결 되었습니다."
					INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) 
					VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
					COMMIT;
	
				case "MOVE", "NEXT"
					ls_dberror = "[협조종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
									 "매출이관이월 문서종결 되었습니다."
					INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) 
					VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
					COMMIT;
			end choose
		// 결재중인 문서(결재, 취소)
		else
			choose case dw_1.object.tr_type[1]		// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
				case "DO"
					if is_apply = "user5" OR is_apply = "userh" OR is_apply = "userh1" OR is_apply = "userh2"  then
						ls_dberror = "[종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
										 "매출이관이월_주요업무 문서가 있습니다."
						INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) 
						VALUES (:gs_userid, :ls_itemcd, getdate(), :ls_dberror,'N');	
						COMMIT;				
					end if
								
				case "SPOT"
					ls_dberror = "[종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
									 "매출이관이월_현장이관 문서가 있습니다."
					INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) 
					VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
					COMMIT;				
									 
				case "MOVE", "NEXT"
					if is_apply = "userh" OR is_apply = "userh1" OR is_apply = "userh2" then						
						if isnull(dw_1.object.tr_appdth[1]) then 
							ls_dberror = "[협조취소]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
											 "매출이관이월 문서가 있습니다."
							INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) 
							VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
							COMMIT;				
						end if
					end if
			end choose
		end if		
	end if

	// 저장후 Scroll 대상
	ll_dw3_row = dw_3.getrow()

	/////////////////////////////////////////////
	pb_retrieve.triggerevent(clicked!)	// 조회
	/////////////////////////////////////////////
	if ll_dw3_row > 0 and ll_dw3_row <= dw_3.rowcount() then
		if ll_dw3_row > dw_3.rowcount() then
			ll_dw3_row = dw_3.rowcount()
		end if
		dw_3.scrolltorow( ll_dw3_row )
	end if
	/////////////////////////////////////////////
else
	MessageBox('확인','매출이관/이월 작성중 오류가 발생 하였습니다.',Stopsign!)
end if
//////////////////////////////////////////////////////////////////

end event

type dw_1 from w_inheritance`dw_1 within w_oidotrans_m
integer x = 2217
integer y = 456
integer width = 2903
integer height = 1280
integer taborder = 0
string dataobject = "d_oidotrans_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::clicked;call super::clicked;string ls_apply

if isnull(row) or this.RowCount() < 1 then RETURN

ls_apply = this.object.cc_flag[1]
if isnull(ls_apply) OR ls_apply = "" then RETURN


//매출이관이월_협조자2 존재 유무 확인
choose case dwo.name
	case 'userh2'
		long ll_userh2
		SELECT 
			count(*)
		into
			:ll_userh2
		FROM 
			codemst 
		WHERE 
			type = '매출이관이월_협조자2' AND use_yn = 'Y'
		using sqlca;			
		if ll_userh2 = 0 then return
end choose

if ls_apply = "0" then
	choose case dwo.name
		  case "rank1", "rank2", "rank3", "rank4", "userh", "userh1", "userh2" // 2021-11-10 jowonsuk 테스트 추가 부분 bkkim
				is_user  = dwo.name		// 결재라인 변경대상
				if MessageBox("확인","결재라인을 변경 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
					return
				else
					// 결재자 선택
					tab_1.tabpage_1.cb_9.enabled  = true		// 결재자 삭제
					tab_1.tabpage_1.cb_7.enabled  = true		// 선택
	
					tab_1.visible = true
					tab_1.tabpage_1.dw_12.retrieve(gs_userid)
					tab_1.tabpage_1.dw_12.SetRow (1)				
					tab_1.tabpage_1.tv_1.setfocus()
				end if
	end choose
else
	if GF_Permission("매출이관이월_결재라인수정", gs_userid) = "Y" then
		choose case dwo.name
			case "rank1" //테스트 추가 부분
				if Not isnull(dw_1.object.tr_appdt1[1]) then RETURN			
			case "rank2"
				if Not isnull(dw_1.object.tr_appdt2[1]) then RETURN
			case "rank3"
				if Not isnull(dw_1.object.tr_appdt3[1]) then RETURN
			case "rank4"
				if Not isnull(dw_1.object.tr_appdt4[1]) then RETURN
			case "userh"
				if Not isnull(dw_1.object.tr_appdth[1]) then RETURN
			case "userh1"
				if Not isnull(dw_1.object.tr_appdth1[1]) then RETURN				
			case "userh2"
				if Not isnull(dw_1.object.tr_appdth2[1]) then RETURN				
		end choose
		
		choose case dwo.name
			case "rank1", "rank2", "rank3", "rank4", "userh", "userh1", "userh2"  // 2021-11-10 jowonsuk 테스트 추가 부분	bkkim
				is_user  = dwo.name		// 결재라인 변경대상
				if MessageBox("확인","결재라인을 수정 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
					return
				else
					// 결재자 선택
					tab_1.tabpage_1.cb_9.enabled  = false		// 결재자 삭제
					tab_1.tabpage_1.cb_7.enabled  = false		// 선택
					tab_1.tabpage_1.cb_10.enabled = true		// 매출이관이월_결재라인수정
					
					tab_1.visible = true
					tab_1.tabpage_1.tv_1.setfocus()
				end if
		end choose
	end if
end if

end event

event dw_1::itemchanged;call super::itemchanged;// 거래처 변경
string  ls_data, ls_null
string  ls_content, ls_custno, ls_register_no, ls_credit_level, ls_level_grade, ls_price_level
string  ls_salesman, ls_captain, ls_collect_day, ls_ewoltrans

long    ll_row,   ll_cnt
datetime ld_dodate
decimal  ld_credit_limit, ld_balance_amt
DataWindow dw_tar

setnull( ls_null )

choose case dwo.name
	case "user1", "user2", "user3", "user4", "user5", "userh", "userh1", "userh2"
		
	case "tcust_no"			// 변경후 거래처
		if this.object.tr_type[1] = "SPOT" then
			if data <> this.object.fcust_no[1] then
				MessageBox("확인","이 문서는 변경전 거래처와 변경후 거래처가 동일해야 합니다.")
				this.object.tcust_no[1] = ""
				RETURN 2
			end if
		end if
		
		if data = this.object.fcust_no[1] then			
			if this.object.tr_type[1] = "SPOT" then		// 현장변경
			else
				MessageBox("확인","변경전 거래처와 변경후 거래처가 동일할 수 없습니다.")
				this.object.tcust_no[1] = ""
				RETURN 2
			end if
		end if
		
		ls_custno = data
		SELECT register_no  = a.register_no
		     , credit_level = a.credit_level
			  , level_grade  = a.level_grade 
			  , price_level  = a.price_level
			  , salesman     = a.salesman
			  , captain_name = a.captain_name
			  , balance_amt  = a.balance_amt
			  , collect_day  = CONVERT(char(10),DATEADD(day, CAST(isnull(a.credit_day,0) AS INT), getdate() ),111)
			  , ewol_trans   = isnull(a.ewol_trans,'')
		  INTO :ls_register_no, :ls_credit_level, :ls_level_grade, :ls_price_level
		     , :ls_salesman, :ls_captain,  :ld_balance_amt, :ls_collect_day, :ls_ewoltrans
		  FROM CUSTOMER A
		 WHERE a.cust_no      = :ls_custno;

		dw_1.getchild("tspot_code",idwc_scene2)		// 변경후 현장
		idwc_scene2.SetTransObject(SQLCA)
		idwc_scene2.Retrieve( ls_custno )

		dw_1.object.tr_transamt[1]   = 0
		dw_1.object.tcust_no[1]      = ls_custno
		dw_1.object.tspot_code[1]    = ls_null
		dw_1.object.tregister_no[1]  = ls_register_no
		dw_1.object.tcredit_level[1] = ls_credit_level
		dw_1.object.tlevel_grade[1]  = ls_level_grade
		dw_1.object.tprice_level[1]  = ls_price_level
		dw_1.object.tsalesman[1]     = ls_salesman
		dw_1.object.tcaptain_name[1] = ls_captain
		dw_1.object.tunpaid_amt[1]   = ld_balance_amt
		dw_1.object.tcollect_day[1]  = ls_collect_day

	case "tspot_code"
		if data = this.object.fspot_code[1] then			
			MessageBox("확인","변경전 거래처 현장과 변경후 거래처 현장이 동일할 수 없습니다.")
			this.object.tspot_code[1] = ""
			RETURN 2
		end if
		ls_custno = this.object.tcust_no[1]

		dw_1.getchild("tspot_code",idwc_scene2)		// 변경후 현장
		idwc_scene2.SetTransObject(SQLCA)
		idwc_scene2.Retrieve( ls_custno )


	case "fspot_code"
		ls_custno = this.object.fcust_no[1]

		dw_1.getchild("tspot_code",idwc_scene1)		// 변경전 현장
		idwc_scene1.SetTransObject(SQLCA)
		idwc_scene1.Retrieve( ls_custno )

	case "fcust_no"											// 변경전 거래처
		ls_custno = data
		SELECT register_no  = a.register_no
				  , credit_level = a.credit_level
				  , level_grade  = a.level_grade 
				  , price_level  = a.price_level
				  , salesman     = a.salesman
				  , captain_name = a.captain_name
				  , balance_amt  = a.balance_amt
				  , collect_day  = CONVERT(char(10),DATEADD(day, CAST(isnull(a.credit_day,0) AS INT), getdate() ),111)
				  , ewol_trans   = isnull(a.ewol_trans,'')
		  INTO :ls_register_no, :ls_credit_level, :ls_level_grade, :ls_price_level
		         , :ls_salesman, :ls_captain,  :ld_balance_amt, :ls_collect_day, :ls_ewoltrans
		  FROM CUSTOMER A
		 WHERE a.cust_no      = :ls_custno;

		dw_1.getchild("fspot_code",idwc_scene1)		// 변경전 현장
		idwc_scene1.SetTransObject(SQLCA)
		idwc_scene1.Retrieve( ls_custno )
		//////////////////////////////////////////////////////////////
		idwc_scene1.insertrow(1)
		idwc_scene1.setitem(1, "scene_code", "%")
		idwc_scene1.setitem(1, "scene_desc", "전체현장")
		
		dw_1.object.fspot_code[1] = "%" // 전체
		idwc_scene1.accepttext()
		//////////////////////////////////////////////////////////////

		ls_content = "1. 발생사유 : " + CharA(13) + CharA(10) + &
						 "2. 업체현황 : " + CharA(13) + CharA(10)

		dw_1.object.tr_transamt[1]   = 0
		dw_1.object.fcust_no[1]      = ls_custno
		dw_1.object.fspot_code[1]    = ls_null
		dw_1.object.fregister_no[1]  = ls_register_no
		dw_1.object.fcredit_level[1] = ls_credit_level
		dw_1.object.flevel_grade[1]  = ls_level_grade
		dw_1.object.fprice_level[1]  = ls_price_level
		dw_1.object.fsalesman[1]     = ls_salesman
		dw_1.object.fcaptain_name[1] = ls_captain
		dw_1.object.funpaid_amt[1]   = ld_balance_amt
		dw_1.object.fcollect_day[1]  = ls_collect_day
						 
		if isnull(ls_ewoltrans) or ls_ewoltrans = "" then
		else
			// 출고이월인 경우는 MASTER에 이월 업체
			if this.object.tr_type[1] = "NEXT" AND ls_ewoltrans = "Y" then
				dw_1.object.tr_ewolfix[1] = ls_ewoltrans		// 이월고정업체
			end if
		end if
		
		dw_1.object.tr_content[1]    = ls_content		
end choose

end event

event dw_1::rbuttondown;call super::rbuttondown;string ls_date, ls_apply

if this.RowCount() < 1 then return

ls_apply = this.object.cc_flag[1]
if ls_apply = "0" then
	if dwo.name = "tr_date" then
		OpenWithParm(w_calendar, message.stringparm)
		if Message.StringParm <> 'N' then
			ls_date = string(date(Message.StringParm))
			this.object.tr_date[1] = date(ls_date)
			this.setcolumn( "fcust_no" )
			this.setfocus()
		end if
	end if
end if

end event

event dw_1::doubleclicked;call super::doubleclicked;///////////////////////////////////////////////////////////////////////
// 결재조건에 따른 결재방 체크
///////////////////////////////////////////////////////////////////////
// pb_save Event 최종결재 함
///////////////////////////////////////////////////////////////////////
integer  ll_cnt, ll_totcnt
long     ll_row, ll_rowsave, ll_count
string   ls_apply,  ls_applyid, ls_applynm, ls_applydt, ls_appdt5		// 결재자 정보
string   ls_applyend, ls_applyend_save
string   ls_rankh,  ls_apph,    ls_userh, ls_tr_apph2						// 협조자
string   ls_custno, ls_sceneno, ls_dono,   ls_transno, ls_dberror		// 출고번호
string   ls_null,   ls_title,   ls_ccflag
string   ls_trtype, ls_sdate,   ls_edate,  ls_userid, ls_original_id, ls_fa_app, ls_app1_id

datetime ldt_appdt, ldt_null
decimal  ld_totAmount, ld_totPrice, ld_applyAMT
boolean  lb_chk
boolean  lb_minus

setnull(ldt_null) ; setnull(ls_null) ; ib_applyCancel = false

// 문서 작성중이면 RETURN
ls_ccflag = dw_1.object.cc_flag[1]
if ls_ccflag = "0" then
	MessageBox("확인","현재 기안자가 작성중인 문서입니다.")
	RETURN	
end if

// 회장은 RETURN
if gs_userid = "TOP" then RETURN

//////////////////////////////////////////////////////////
// 결재자 아니면 RETURN bkkim ▼▼▼▼▼▼▼▼▼▼▼▼▼
//////////////////////////////////////////////////////////
lb_chk = false
/*2021-11-10 jowonsuk 테스트 신규 user_id는 작성자*/ 
for ll_cnt = 1 to 9
	if ll_cnt = 9 then
		ls_userid = dw_1.getitemstring( 1, "user_id" )			
	elseif ll_cnt = 8 then
		ls_userid = dw_1.getitemstring( 1, "tr_apph2" )	// 협조2
	elseif ll_cnt = 7 then
		ls_userid = dw_1.getitemstring( 1, "tr_apph1" )	// 협조1
	elseif ll_cnt = 6 then
		ls_userid = dw_1.getitemstring( 1, "tr_apph" )	// 협조
	else
		ls_userid = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )
	end if
	
	if ls_userid = gs_userid then 
		il_apply = ll_cnt
		lb_chk   = true
		exit
	end if
next 
 
if lb_chk = false then RETURN
//▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

// 문서정보
ls_sdate    = em_1.text
ls_edate    = em_2.text

ls_trtype   	= dw_1.object.tr_type[1]						// 문서종류(MOVE: 이관, NEXT: 이월, SPOT:현장, DO: 송장)
ls_transno  	= this.object.trans_no[row]					// 문서번호
ld_totprice 	= dec(this.object.tr_transamt[row])			// 문서금액
ls_custno   	= dw_1.object.fcust_no[1]						// 변경전 거래처
ls_original_id = dw_1.getitemstring( 1, "tr_app5" )		// 최종결재권자 2018.03.15일 주요업에서 최종결재자를 변경하지 않도록 원결재자 저장 
ls_app1_id		= dw_1.getitemstring( 1, "tr_app1" ) 	  	// 2018.03.16 조원석  최초 작성자가 공장인지, 영업인지 구븐하기 위해서 그래야 주요업무의 결재자를 체크한다.
ls_tr_apph2		= dw_1.getitemstring( 1, "tr_apph2" )		// 협조자2 => 협조자2가 없을경우 로직 추가

/*2018/03/15 조원석 공장 최종 결재권자 체크하는 로직으로 공장 최종결재권자는 바뀌지 않게 한다. */
ll_count = 0

SELECT COUNT(item_cd)
INTO :ll_count
FROM codemst 
WHERE type = '매출이관이월_전체보기' AND use_yn  = 'Y' AND bigo = '공장'
AND item_cd = :ls_app1_id;

/*2018.03.15 조원석 주요업무일경우, 최종 결재자의 결재자를 바뀌지 않게 막음*/
if ls_trtype   = "DO" and ll_count > 0 then
	setnull(ls_fa_app)
	
	SELECT a.user_id
	INTO :ls_fa_app
	FROM login a
	WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_팀장' AND use_yn  = 'Y' AND bigo = '공장' AND item_cd = :ls_app1_id);
		
	if ls_fa_app <> gs_userid then
		messagebox("경고", "승인자 본인이 아닙니다.");
		return
	end if
end if	

// 결재방 클릭한 위치
choose case dwo.name
	case "user1"
		il_appcnt = 1
	case "user2"
		il_appcnt = 2
	case "user3"
		il_appcnt = 3
	case "user4"
		il_appcnt = 4
	case "user5"
		il_appcnt = 5
end choose
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 클릭한 결재자 상태체크(ls_apply, ldt_appdt, ib_applyCancel)			//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

is_apply  = dwo.name 
choose case is_apply
	case "user1", "user2", "user3", "user4", "user5"
		ls_apply   = dw_1.GetItemString( row, "tr_app" + string(il_appcnt) )
		ldt_appdt  = dw_1.GetItemDateTime( row, "tr_appdt" + string(il_appcnt) )
		ls_applynm = gf_replaceall(dw_1.GetItemString( row, is_apply ), CharA(13), "")		// char(13) 포함하고 있음
		
		if isnull(ls_applynm) OR ls_applynm = "" then RETURN
		
	case "userh"
		ls_apply   = dw_1.GetItemString( row, "tr_apph" )
		ldt_appdt  = dw_1.GetItemDateTime( row, "tr_appdth" )
		ls_applynm = gf_replaceall(dw_1.GetItemString( row, "userh" ), CharA(13), "")
		
		if gs_userid <> ls_apply then RETURN
		
	case "userh1"
		ls_apply   = dw_1.GetItemString( row, "tr_apph1" )
		ldt_appdt  = dw_1.GetItemDateTime( row, "tr_appdth1" )
		ls_applynm = gf_replaceall(dw_1.GetItemString( row, "userh1" ), CharA(13), "")
		
		if gs_userid <> ls_apply then RETURN
		
	case "userh2"
		ls_apply   = dw_1.GetItemString( row, "tr_apph2" )
		ldt_appdt  = dw_1.GetItemDateTime( row, "tr_appdth2" )
		ls_applynm = gf_replaceall(dw_1.GetItemString( row, "userh2" ), CharA(13), "")
		
		if gs_userid <> ls_apply then RETURN
		
	case else
		RETURN
end choose

if isnull(dw_1.object.tr_appdt5[1]) then
else
	if gs_userid = ls_apply then
	else
		if isnull(ls_apply) OR ls_apply = "" then RETURN
		
		MessageBox('확인','결재자 위치가 아닙니다.',Stopsign!)
		RETURN	
	end if
end if

/////////////////////////////////////////////////////////////////
// 결재1 -> 결재2 -> 결재3 -> 협조 -> 결재4 -> 결재5
// 결재1 -> 결재2 -> 결재3 -> 협조 -> 협조1 -> 결재4 -> 결재5
// 상급자 미결인 경우 결재취소 가능 
/////////////////////////////////////////////////////////////////
choose case dwo.name
	case "userh"	// 협조자
		if gs_userid = dw_1.object.tr_apph[row] then				// 자신이 협조자이고
			if isnull(dw_1.object.tr_appdt4[row]) then			// 상급자 미결상태			
					if isnull(dw_1.object.tr_appdth[row]) then		// 협조자 미결상태
						dw_1.object.tr_appdth[row] = gf_today()	// 협조결재
					else
						if isnull(dw_1.object.tr_appdt4[1]) AND isnull(dw_1.object.tr_appdt5[1]) then
						else
							MessageBox('확인','본부장 결재취소 후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if
						/*2022-02-04 jowonsuk 추가 bkkim*/
						if gf_null_chk(ls_tr_apph2) then
							if isnull(dw_1.object.tr_appdth1[1]) then
							else
								MessageBox('확인','협조자 결재취소 후 작업하시기 바랍니다.',Stopsign!)
								RETURN
							end if						
						else
							if isnull(dw_1.object.tr_appdth1[1]) and isnull(dw_1.object.tr_appdth2[1]) then
							else
								MessageBox('확인','협조자1/2 결재취소 후 작업하시기 바랍니다.',Stopsign!)
								RETURN
							end if						
						end if
	
						if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
							RETURN
						else
							ib_applyCancel = true
							dw_1.object.tr_appdth[row]	= ldt_null  	// 화면처리
						end if				
					end if					
			else
				MessageBox('확인','본부장 결재완료 되었습니다.',Stopsign!)
				RETURN
			end if
		end if

	case "userh1"	// 협조자1
		if gs_userid = dw_1.object.tr_apph1[row] then				// 자신이 협조자이고
			if isnull(dw_1.object.tr_appdt4[row]) then			// 상급자 미결상태			
					if isnull(dw_1.object.tr_appdth1[row]) then		// 협조자 미결상태
						dw_1.object.tr_appdth1[row] = gf_today()	// 협조결재
					else
						if isnull(dw_1.object.tr_appdt4[1]) AND isnull(dw_1.object.tr_appdt5[1]) then
						else
							MessageBox('확인','본부장 결재취소 후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if
						/*2022-02-04 jowonsuk 추가 bkkim*/
						if gf_null_chk(ls_tr_apph2) = false then
							if isnull(dw_1.object.tr_appdth2[1])  then
							else
								MessageBox('확인','협조자2 결재취소 후 작업하시기 바랍니다.',Stopsign!)
								RETURN
							end if						
						end if
	
						if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
							RETURN
						else
							ib_applyCancel = true
							dw_1.object.tr_appdth1[row]	= ldt_null  	// 화면처리
						end if				
					end if					
			else
				MessageBox('확인','본부장 결재완료 되었습니다.',Stopsign!)
				RETURN
			end if
		end if		
		
	case "userh2"	// 협조자2 
		if gs_userid = dw_1.object.tr_apph2[row] then		// 자신이 협조자이고
			if isnull(dw_1.object.tr_appdt4[row]) then			// 상급자 미결상태
				if isnull(dw_1.object.tr_appdth2[row]) then		// 협조자 미결상태
					dw_1.object.tr_appdth2[row] = gf_today()		// 협조결재
				else
					if isnull(dw_1.object.tr_appdt4[1]) AND isnull(dw_1.object.tr_appdt5[1]) then
					else
						MessageBox('확인','본부장 결재취소 후 작업하시기 바랍니다.',Stopsign!)
						RETURN
					end if

					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						ib_applyCancel = true
						dw_1.object.tr_appdth2[row]	= ldt_null  	// 화면처리
					end if				
				end if				
			else
				MessageBox('확인','본부장 결재완료 되었습니다.',Stopsign!)
				RETURN
			end if
		end if		

	case "user1"
		if gs_userid = dw_1.object.tr_app1[row] then
			if isnull(dw_1.object.tr_appdt2[row]) AND isnull(dw_1.object.tr_appdt3[row]) AND isnull(dw_1.object.tr_appdt4[row]) then
				if isnull(dw_1.object.tr_appdt1[row]) then
					dw_1.object.tr_appdt1[row] = gf_today()
				else
					if gf_null_chk(ls_tr_apph2) then
						if isnull(dw_1.object.tr_appdth[1]) or isnull(dw_1.object.tr_appdth1[1]) then
						else
							MessageBox('확인','협조자, 협조자~r~n결재취소 후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if
					else
						if isnull(dw_1.object.tr_appdth[1]) or isnull(dw_1.object.tr_appdth1[1])  or isnull(dw_1.object.tr_appdth2[1]) then
						else
							MessageBox('확인','협조자, 협조자1, 협조자2 ~r~n결재취소 후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if
					end if

					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						ib_applyCancel = true
						dw_1.object.tr_appdt1[row]	= ldt_null  	// 화면처리
					end if
				end if			
			else
				MessageBox("확인","상급자 결재완료 되었습니다.")
				RETURN
			end if
		end if
		
	case "user2"
		if gs_userid = dw_1.object.tr_app2[row] then
			if isnull(dw_1.object.tr_appdt3[row]) AND isnull(dw_1.object.tr_appdt4[row]) then
				if isnull(dw_1.object.tr_appdt2[row]) then
					dw_1.object.tr_appdt2[row] = gf_today()
				else
					if gf_null_chk(ls_tr_apph2) then					
						if isnull(dw_1.object.tr_appdth[1]) or isnull(dw_1.object.tr_appdth1[1])  then
						else
							MessageBox('확인','협조자, 협조자~r~n결재취소 후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if
					else
						if isnull(dw_1.object.tr_appdth[1]) or isnull(dw_1.object.tr_appdth1[1]) or isnull(dw_1.object.tr_appdth2[1]) then
						else
							MessageBox('확인','협조자, 협조자1, 협조자2 ~r~n결재취소 후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if
					end if

					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						ib_applyCancel = true
						dw_1.object.tr_appdt2[row]	= ldt_null  	// 화면처리
					end if
				end if
			else
				MessageBox("확인","상급자 결재완료 되었습니다.")
				RETURN
			end if
		end if
		
	case "user3"
		if gs_userid = dw_1.object.tr_app3[row] then
			if isnull(dw_1.object.tr_appdt4[row]) then
				if isnull(dw_1.object.tr_appdt3[row]) then
					dw_1.object.tr_appdt3[row] = gf_today()
				else
					if gf_null_chk(ls_tr_apph2) then
						if isnull(dw_1.object.tr_appdth[1]) or isnull(dw_1.object.tr_appdth1[1]) then
						else
							MessageBox('확인','협조자, 협조자~r~n결재취소 후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if
					else
						if isnull(dw_1.object.tr_appdth[1]) or isnull(dw_1.object.tr_appdth1[1]) or isnull(dw_1.object.tr_appdth2[1]) then
						else
							MessageBox('확인','협조자, 협조자1, 협조자2 ~r~n결재취소 후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if
					end if

					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						ib_applyCancel = true
						dw_1.object.tr_appdt3[row]	= ldt_null  	// 화면처리
					end if
				end if
			else
				MessageBox("확인","상급자 결재완료 되었습니다.")
				RETURN
			end if
		end if
		
	case "user4"
		if gs_userid = dw_1.object.tr_app4[row] then
			if isnull(dw_1.object.tr_appdt5[row]) then
				if isnull(dw_1.object.tr_appdt4[row]) then
					
					if gf_null_chk(dw_1.object.tr_apph2[row]) = true then	//협조자2가 결재에 없으면
						if isnull(dw_1.object.tr_appdth[1]) or isnull(dw_1.object.tr_appdth1[1]) then
							MessageBox('확인','협조자 미결문서 입니다.',Stopsign!)
							RETURN
						end if
					else
						if isnull(dw_1.object.tr_appdth[1]) or isnull(dw_1.object.tr_appdth2[1]) then
							MessageBox('확인','협조자 미결문서 입니다.',Stopsign!)
							RETURN
						end if
					end if
					
					dw_1.object.tr_appdt4[row] = gf_today()					
				else
					if isnull(dw_1.object.tr_appdt5[1]) then
					else
						MessageBox('확인','최종승인자 결재취소 후 작업하시기 바랍니다.',Stopsign!)
						RETURN
					end if
					
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else					
						ib_applyCancel = true
						dw_1.object.tr_appdt4[row]	= ldt_null  	// 화면처리
					end if
				end if
			else
				MessageBox("확인","상급자 결재완료 되었습니다.")
				RETURN
			end if
		end if
end choose
/////////////////////////////////////////////////////////////////////


if isnull(ls_trtype) OR ls_trtype = "" then
	MessageBox('확인','작업구분이 누락 되었습니다.',Stopsign!)
	dw_1.setcolumn("tr_type")
	dw_1.setfocus()
	RETURN
end if

if isnull(ls_custno) OR ls_custno = "" then
	MessageBox('확인','변경전 거래처가 누락 되었습니다.',Stopsign!)
	dw_1.setcolumn("fcust_no")
	dw_1.setfocus()
	RETURN
end if
	

////////////////////////////////////////////////////////////////////////////////
// 작업자의 권한과, 결재금액
// 매출이관이월_결재자 -> 매출이관이월_본부장 -> 매출이관이월_팀장 -> 매출이관이월_협조자 기존
////////////////////////////////////////////////////////////////////////////////
SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
FROM codemst 
WHERE TYPE = '매출이관이월_결재자' AND use_yn = 'Y' AND item_cd = :gs_userid; /*회장님*/
 
if ls_applyend = "" OR isnull(ls_applyend) then
	SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
	FROM codemst 
	WHERE TYPE = '매출이관이월_본부장' AND use_yn = 'Y' AND item_cd = :gs_userid;
	 
	if ls_applyend = "" OR isnull(ls_applyend) then
		SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
		FROM codemst 
		WHERE TYPE = '매출이관이월_팀장' AND use_yn = 'Y' AND item_cd = :gs_userid;
		 
		if ls_applyend = "" OR isnull(ls_applyend) then
			SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
			FROM codemst 
			WHERE TYPE = '매출이관이월_협조자2' AND use_yn = 'Y' AND item_cd = :gs_userid;			 

			if ls_applyend = "" OR isnull(ls_applyend) then
				SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
				FROM codemst 
				WHERE TYPE = '매출이관이월_협조자1' AND use_yn = 'Y' AND item_cd = :gs_userid;
		
				if ls_applyend = "" OR isnull(ls_applyend) then
					SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
					FROM codemst 
					WHERE TYPE = '매출이관이월_협조자' AND use_yn = 'Y' AND item_cd = :gs_userid;
				end if
			end if	
		end if			 		 
	end if	
end if

/* 2022-02-04 jowonsuk 내용 추가 이월고정인 경우, 본부장 권한 */
ll_cnt = 0
	
SELECT count(*)
into :ll_cnt
FROM codemst 
WHERE TYPE in ('매출이관이월_협조자1','매출이관이월_협조자2') AND use_yn = 'Y' AND item_cd = :gs_userid;	

if ll_cnt > 0 then			
	if ls_trtype = "NEXT" AND dw_1.object.tr_ewolfix[1] = "Y" then			
		SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
		FROM codemst 
		WHERE TYPE = '매출이관이월_본부장' AND use_yn = 'Y' AND item_cd = 'cwj';	/*2022-02-04 조우제 대표 권한을 준다.*/	 			 
	end if 		
end if

ls_applyend_save = ls_applyend		// 권한 SAVE
////////////////////////////////////////////////////////////////////////////////

if ls_applyend_save = "매출이관이월_본부장" then
	//////////////////////////////////////////////////////////////////
	// 당월 이관/이월 총금액 체크하기
	//////////////////////////////////////////////////////////////////
	SELECT isnull(sum(trans_amt), 0) INTO :ld_totAmount
	  FROM dotransdet b
			 LEFT OUTER JOIN dotrans a ON a.trans_no = b.trans_no
	 WHERE b.cust_no     = :ls_custno 
		AND a.tr_type     = :ls_trtype
		AND a.trans_no   <> :ls_transno
      AND a.apply_end   = 'Y'
		AND b.do_date   BETWEEN :ls_sdate and :ls_edate;

	//////////////////////////////////////////////////////////////////	
	ld_totPrice  = dw_3.object.tamt[dw_3.getrow()]		// 문서당 누계금액
	ld_totAmount = ld_totAmount + ld_totPrice				// 거래처 누계금액 + 문서금액
	//////////////////////////////////////////////////////////////////	
end if

// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
if ld_totAmount > 10000000 then				// 거래처 당월누계 금액이 본부장 권한 이상인 경우
	// is_apply
	if dw_1.object.tr_app5[1] <> "TOP" then
		if (ls_trtype = "NEXT" AND dw_1.object.tr_ewolfix[1] = "Y") OR &
			(ls_trtype = "DO"    OR ls_trtype = "SPOT" ) then
			// 매출이월고정업체, 현장변경 은 본부장 전결처리함, 주요문서 담당자전결
		else			
			dw_1.object.tr_app5[1]   = "TOP"
			dw_1.object.user5[1]     = "조용선인"
			dw_1.object.tr_appdt5[1] = ldt_null
			
			MessageBox('확인','거래처 당월 총 결재금액이 10,000,000원 이상으로~n~n회장님 결재사항 입니다',Stopsign!)
			dw_1.setcolumn("tr_app5")
			dw_1.setfocus()
			RETURN
		end if
	end if
end if

choose case ls_trtype
	case "DO", "SPOT"
		// 주요업무, 현장변경 금액체크 안함(담당자 전결사항)

	case else
		// 문서금액이 결재자 금액 초과시
		if ld_totprice > ld_applyAMT then	
			if	ib_applyCancel = true then
				isnull(ldt_appdt)
			else
				// 매출이월 + 이월고정업체는 본부장 전결처리함
				if ls_trtype = "NEXT" AND dw_1.object.tr_ewolfix[1] = "Y" then
					if MessageBox("확인", "총금액이 " + string(ld_totprice, "#,###0") + " 입니다.~n~n" + &
									  "매출이월 고정업체는 본부장 전결입니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
						RETURN
					end if		
				else
					if ld_totprice > 10000000 then
						if MessageBox("확인", "문서 총금액이 " + string(ld_totprice, "#,###0") + " 입니다.~n~n" + &
										  "회장님 결재건으로 다시한번 확인바랍니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
							RETURN
						end if
					else
						if MessageBox("확인", "문서 총금액이 " + string(ld_totprice, "#,###0") + " 입니다.~n~n" + &
										  "본부장 결재건으로 다시한번 확인바랍니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
							RETURN
						end if
					end if
				end if		
			end if		
		// 문서금액이 결재자의 금액한도 이내인 경우
		else
			if ld_totprice < 0 then
				choose case is_apply
					case "user5"
						if ld_totprice * -1 > 50000 then
							if ls_applyend = "매출이관이월_본부장" then
							else
								dw_1.object.tr_appdt5[1] = ldt_null
								MessageBox("확인","본부장 결재사항 문서 입니다.")
								RETURN
							end if
						end if
							
					case "user1", "user2", "user3", "user4"
						if ld_totprice * -1 <= 50000 then
							if ls_applyend = "매출이관이월_팀장" then
								MessageBox("확인","팀장 결재사항 문서 입니다. '결재자5'를 클릭하시기 바랍니다.")
								RETURN
							end if
						end if
				end choose
			end if
		end if
	
		// 로긴자와 결재칸이 동일하고
		if gs_userid = ls_apply then							
			if isnull(ldt_appdt) then							// 미결상태
				if ld_totAmount > dec(ii_amount) then		// 누계금액이 매출이관이월_최종결재자_금액 초과한 경우
					// 이월고정업체
					if (ls_trtype = "NEXT" AND dw_1.object.tr_ewolfix[1] = "Y") then		
						if ls_applyend_save = "매출이관이월_본부장" then	// 로긴자가 본부장이면
							if is_apply = "user5" then								
								// 전결 처리함
							else
								MessageBox("확인","전결처리 대상문서 입니다. '결재자5' 을 클릭하시기 바랍니다.")
								RETURN
							end if
						else
							// 팀장, 작성자
						end if
					// 이월고정업체가 아니면 금액별 체크
					else
						if ld_totprice <= ld_applyAMT then		// 문서금액이 결재 권한별 한도액보다 작거나 같으면
							choose case is_apply
								case "user2", "user3", "user4"
									if MessageBox("확인", "전결처리 문서입니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
										RETURN
									end if
							end choose
						end if					
					end if
				// 누계금액이 매출이관이월_최종결재자_금액 범위이내인 경우
				else
					if ld_totprice <= ld_applyAMT then		// 문서금액이 결재 권한별 한도액보다 작거나 같으면
						if	ld_totprice < 0 then					// 문서금액이 마이너스 금액이고
							if ld_totprice * -1 <= ld_applyAMT then		// 문서금액(음수)이 권한별 한도액이면
								// 마이너스 금액도 체크함
								MessageBox("확인","전결처리 대상문서 입니다. '결재자5' 을 클릭하시기 바랍니다.")
								RETURN
							end if
						else											// 문서금액이 양수이면
							if dwo.name = "userh" or dwo.name = "userh1" or dwo.name = "userh2" then		// 2021.11.10 jowonsuk 협조추가 작업	
								// 협조자 클릭한 경우는 SKIP
							else
								MessageBox("확인","전결처리 대상문서 입니다. '결재자5' 을 클릭하시기 바랍니다.")
								RETURN
							end if
						end if
					end if
				end if
			end if
		// 로긴자와 결재자 정보가 다른경우
		else			
			if isnull(ldt_appdt) then							// 결재자 미결인 경우
				if ls_trtype = "NEXT" and dw_1.object.tr_ewolfix[row] = "Y" then
					// 매출이월 고정업체이면 본부장 전결처리함
				else
					if ld_totprice > ld_applyAMT then		// 문서금액이 권한금액 초과한 경우
						MessageBox("확인","전결처리 대상문서가 아닙니다.")
						RETURN
					end if
				end if
			end if
		end if
end choose


/////////////////////////////////////////////////////////////////
// 최종결재
/////////////////////////////////////////////////////////////////
// 결재1 -> 결재2 -> 결재3 -> 협조 -> 결재4 -> 결재5
// 결재1 -> 결재2 -> 결재3 -> 협조 -> 협조1 -> 결재4 -> 결재5
/////////////////////////////////////////////////////////////////
choose case dwo.name
	case "user5", "p_rank5"
      //////////////////////////////////////////////////////////////////////////
		// [전결] 매출이관이월 은 본부장 (ld_applyAMT)원, 팀장 5만원까지 결재가능
      //////////////////////////////////////////////////////////////////////////
		if ls_applyend = "매출이관이월_본부장" then
			if ld_totprice <= ld_applyAMT then
				ls_applyend = "최종결재자"
			else
				// 매출이월 인 경우 이월고정업체이면 본부장 전결처리함
				if ls_trtype = "NEXT" and dw_1.object.tr_ewolfix[row] = "Y" then
					ls_applyend = "최종결재자"
				end if
			end if
		else
			if ls_applyend = "매출이관이월_팀장" then
				if ld_totprice <= ld_applyAMT then
					ls_applyend = "최종결재자"
				end if
			end if			
			
		end if
		
		if GF_PERMISSION("매출이관이월_현장이관", gs_userid) = "Y" then
			if ls_trtype = "SPOT" then
				ls_applyend = "최종결재자"
			end if
		end if


		// 주요업무
		choose case ls_trtype
		case "DO", "SPOT"
			if isnull(dw_1.object.tr_appdt5[row]) then		// 미결
				if isnull(dw_1.object.tr_appdth[row]) then	// 협조자 미결 상태이면				
					MessageBox("확인","협조자 미결 문서입니다.")
					RETURN
				end if			
			else
				if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
					RETURN
				end if
			end if
			
			ls_applyend = "최종결재자"			
		case else				
		end choose
		
		
      //////////////////////////////////////////////////////////////////////////				
		if LeftA(ls_applyend,10) <> "최종결재자" then
			MessageBox("확인","최종결재 권한이 존재하지 않습니다.")
			RETURN
		end if
      //////////////////////////////////////////////////////////////////////////				
		
		
		// 최종결재자 상태
		ls_applydt = string(dw_1.object.tr_appdt5[row],"yyyymmdd")

		// 최종결재
		if isnull(ls_applydt) OR ls_applydt = "" then	
			
			choose case ls_trtype
			case "DO", "SPOT"
				if isnull(dw_1.object.tr_appdth[1]) then
					MessageBox('확인','협조자 결재후 작업하시기 바랍니다.',Stopsign!)
					RETURN
				end if				
			case else				
				if isnull(dw_1.object.tr_appdth[1]) then
					MessageBox('확인','협조자 결재후 작업하시기 바랍니다.',Stopsign!)
					RETURN
				end if
				
				
				if ls_trtype = "NEXT" and dw_1.object.tr_ewolfix[row] = "Y" then
				else
					if gf_null_chk(dw_1.object.tr_apph2[row]) = false then	//협조자2가 결재에 있으면
						if isnull(dw_1.object.tr_appdth2[1]) then
							MessageBox('확인','협조자2 결재후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if	
					else
						if isnull(dw_1.object.tr_appdth1[1]) then
							MessageBox('확인','협조자 결재후 작업하시기 바랍니다.',Stopsign!)
							RETURN
						end if		
					end if
				end if
			end choose
			
			ls_applynm  = MidA(gs_username,1,4) + CharA(13) + MidA(gs_username,5,2) + "인"
			dw_1.object.user5[row]      = ls_applynm		// 결재인
			dw_1.object.tr_app5[row]    = gs_userid		// 결재자5 ID
			dw_1.object.tr_appdt5[row]  = gf_today()		// 결재자5 처리
			dw_1.object.apply_end[row]  = "Y"				// 종결
			
			if GF_PERMISSION("매출이관이월_현장이관", gs_userid) = "Y" then
				if ls_trtype = "SPOT" then
					dw_1.object.apply_end[row] = "Y"			// 종결
				end if
			end if
		// 결재취소	
		else																			
			///////////////////////////////////////////////////////////////////////////////
			// 매출이관 최종승인 후 "거래명세서 수정/삭제" 에서 작업처리 완료되면
			// 기 등록된(이관/이월) 송장번호와 상이한 번호로 변경 처리됨
			// 등록된 번호 출고송장 번호가 존재하면 "협조취소" 가능함
			///////////////////////////////////////////////////////////////////////////////
			ll_cnt = 0 ; ll_totcnt = 0
			for ll_row = 1 to dw_5.rowcount()
				ls_dono = dw_5.object.do_no[ll_row]
				if isnull(ls_dono) OR ls_dono = "" then
					MessageBox("확인","거래명세서 수정/삭제 작업처리가 완료되었습니다.")
					RETURN
				else
					SELECT count(*) INTO :ll_cnt FROM do WHERE do_no = :ls_dono;
					if isnull(ll_cnt) OR ll_cnt = 0 then
					else
						ll_totcnt = ll_totcnt + ll_cnt
					end if
				end if
			next
			if ll_totcnt <> dw_5.rowcount() then
				MessageBox("확인","취소불가~r~n~r~n거래명세서 수정/삭제 작업처리가 " + string(dw_5.rowcount() - ll_totcnt) + &
							  "건 완료되었습니다.")
				RETURN
			end if
				
			ib_applyCancel = true
			/*2018.03.15 조원석 주요업무일경우, 최종 결재자의 결재자를 바뀌지 않게 막음*/
			if ls_trtype   = "DO" then
				dw_1.object.tr_app5[row]   = ls_original_id	// 오리지널 최종 결재자
			else
				dw_1.object.tr_app5[row]   = "TOP"			// 최종결재 
			end if				
			
			dw_1.object.tr_appdt5[row]	= ldt_null  	// 화면처리
			dw_1.object.apply_end[row] = ls_null
			
			

			
			choose case ls_trtype
			case "DO", "SPOT"
				// 협조미결
				if isnull(dw_1.object.tr_appdth[row]) then  	
					ib_applyCancel = true
					/*2018.03.15 조원석 주요업무일경우, 최종 결재자의 결재자를 바뀌자 않게 막음*/				
					if ls_trtype   = "DO" and isnull(ls_fa_app) = false  then
						dw_1.object.tr_app5[row]   = ls_original_id	// 오리지널 최종 결재자
					else
						dw_1.object.tr_app5[row]   = "TOP"			// 최종결재 
					end if				
					
					dw_1.object.tr_appdt5[row]	= ldt_null  	// 결재취소
					dw_1.object.apply_end[row] = ls_null		// 진행중
					
					if ls_trtype = "DO" then		// 주요업무
					else
						// 협조자 원복
						SELECT '승인', a.user_id, a.user_name
						  INTO :ls_rankh,	:ls_apph, :ls_userh
						  FROM login a
						 WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자' AND use_yn = 'Y');
						
						// 협조결재 
						if cbx_5.checked = true then
							dw_1.object.rankh[1]	= ls_rankh ; dw_1.object.tr_apph[1]	= ls_apph
							dw_1.object.userh[1] = ls_userh
						end if					
					end if				
				end if
			case else				
				/*2021-11-29 jowonsuk 추가 협조1미결재*/
				  if isnull(dw_1.object.tr_appdth1[row]) then  	
					ib_applyCancel = true
					if ls_trtype   = "DO" and isnull(ls_fa_app) = false  then
						dw_1.object.tr_app5[row]   = ls_original_id	// 오리지널 최종 결재자
					else
						dw_1.object.tr_app5[row]   = "TOP"			// 최종결재 
					end if				
					
					dw_1.object.tr_appdt5[row]	= ldt_null  	// 결재취소
					dw_1.object.apply_end[row] = ls_null		// 진행중
					
					if ls_trtype = "DO" then		// 주요업무
					else
						// 협조자1 원복
						SELECT '승인', a.user_id, a.user_name
						  INTO :ls_rankh,	:ls_apph, :ls_userh
						  FROM login a
						 WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자1' AND use_yn = 'Y');
						
						// 협조결재1 
						if cbx_5.checked = true then
							dw_1.object.rankh1[1]	= ls_rankh ; dw_1.object.tr_apph1[1]	= ls_apph
							dw_1.object.userh1[1] = ls_userh
						end if
						
						// 협조자2 원복
						ls_rankh	= ''
						ls_apph	= ''
						ls_userh	= ''
						SELECT '승인', a.user_id, a.user_name
						  INTO :ls_rankh,	:ls_apph, :ls_userh
						  FROM login a
						 WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자2' AND use_yn = 'Y');
						
						// 협조결재2 
						if cbx_5.checked = true then
							dw_1.object.rankh2[1]	= ls_rankh ; dw_1.object.tr_apph2[1]	= ls_apph
							dw_1.object.userh2[1] = ls_userh
						end if						
					end if
				end if							
			end choose

			if GF_PERMISSION("매출이관이월_현장이관", gs_userid) = "Y" then
				if ls_trtype = "SPOT" then
					dw_1.object.apply_end[row] = ls_null		// 종결
				end if
			end if
			
			if ls_trtype = "DO" then		// 주요문서
				dw_1.object.apply_end[row] = ls_null		// 종결
			end if
		end if
end choose

/////////////////////////////////////////////
pb_save.triggerevent( clicked! )		// 저장
/////////////////////////////////////////////
end event

event dw_1::losefocus;call super::losefocus;this.Object.DataWindow.Color = rgb(255,255,255)

end event

event dw_1::retrieveend;call super::retrieveend;is_app5 = this.object.tr_app5[1]

end event

type st_title from w_inheritance`st_title within w_oidotrans_m
integer x = 50
integer y = 20
integer width = 1554
integer height = 140
string text = "거래명세서 이관/이월/변경"
end type

type st_tips from w_inheritance`st_tips within w_oidotrans_m
end type

type pb_compute from w_inheritance`pb_compute within w_oidotrans_m
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidotrans_m
boolean visible = false
integer x = 3205
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_oidotrans_m
integer x = 5239
integer y = 68
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidotrans_m
integer x = 4855
integer y = 68
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
string     ls_transno

if dw_5.rowcount() < 1 then RETURN

if PrintSetup() <> 1 then RETURN

dw_4.settransobject(sqlca)
dw_4.Reset()

ls_transno = dw_1.object.trans_no[1]
dw_4.retrieve( ls_transno )
if isnull(ls_transno) or ls_transno = "" then
else
	dw_4.print()
end if

if cbx_6.checked = true then	// 자재납품 확인서
	dw_10.reset()
	dw_10.retrieve( ls_transno )
	if dw_10.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
		RETURN
	end if

	l_print.st_datawindow  = dw_10
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 자재납품 확인서을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_oidotrans_m
boolean visible = false
integer taborder = 250
end type

type pb_delete from w_inheritance`pb_delete within w_oidotrans_m
integer x = 4475
integer y = 68
integer taborder = 320
end type

event pb_delete::clicked;call super::clicked;string	ls_transno, ls_flag
long		ll_cnt, ll_apply
datetime ldt_datetime

if dw_1.RowCount() < 1 then RETURN

// 신규등록 자료표시는 문서번호로 체크함
ls_transno = dw_1.Object.trans_no[1]
if isnull(ls_transno) OR ls_transno = "" then RETURN

for ll_cnt = 1 to 6
	if ll_cnt = 6 then
		ldt_datetime = dw_1.GetItemDateTime( 1, "tr_appdth" )			
	else
		ldt_datetime = dw_1.GetItemDateTime( 1, "tr_appdt" + string(ll_cnt) )			
	end if
	
	if isnull(ldt_datetime) then
		// 미결
	else
		ll_apply = ll_apply + 1
		exit
	end if
next

if ll_apply <> 0 then
	MessageBox("확인", "결재가 진행중인 자료입니다.~n~n승인취소 후 다시 진행해 주시기 바랍니다.~n", StopSign!)
	RETURN
end if

if MessageBox("삭제","삭제 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN


DELETE FROM dotransdet WHERE trans_no = :ls_transno;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("확인","[dotransdet] 삭제할 수 없는 에러가 발생하였습니다.",stopsign!)
	return
else
	DELETE FROM dotrans WHERE trans_no = :ls_transno;
	if sqlca.sqlcode <> 0 then
		ROLLBACK;
		MessageBox("확인","[dotrans] 삭제할 수 없는 에러가 발생하였습니다.",stopsign!)
		return
	else
		COMMIT;	
		MessageBox("확인","삭제완료 하였습니다.",stopsign!)
		
		pb_retrieve.triggerevent(clicked!)
	end if
end if

end event

type pb_insert from w_inheritance`pb_insert within w_oidotrans_m
integer x = 4283
integer y = 68
integer taborder = 330
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_insert::clicked;call super::clicked;string	ls_app1,  ls_app2,  ls_app3,  ls_app4,  ls_app5,  ls_apph	// ID
string	ls_rank1, ls_rank2, ls_rank3, ls_rank4, ls_rank5, ls_rankh	// 직위
string	ls_user1, ls_user2, ls_user3, ls_user4, ls_user5, ls_userh	// 이름
string	ls_teamnm, ls_applyid, ls_content									// 팀명
string	ls_message, ls_null,   ls_userchk									// 작성자
string	ls_rankh1, ls_userh1, ls_apph1	//협조1
string	ls_rankh2, ls_userh2, ls_apph2	//협조2
string	ls_fa_user
long     ll_apply, ll_userseq, l_count
datetime ldt_null

// 송장 초기화
if dw_9.rowcount() > 0 AND dw_9.visible = true then
	if MessageBox("확인", "출고송장 조회작업을 새로 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
		dw_9.reset()
		dw_9.visible = false
	end if
end if

setnull(ldt_null)
setnull(ls_null)
setnull(ls_fa_user)

dw_1.setredraw( false )
/*

  2018/03/15 조원석 로직 점검 주요업무이고 공장이면 협조체크버튼을 활성화 한다. 
  아래 쿼리는 공장의 주요업무 등록 가능한 사람인지를 체크한다.  반영 시작
*/

/*2018.12.17 jowonsuk 오류 수정*/
SELECT a.user_name
INTO :ls_fa_user
FROM login a with(nolock)
WHERE user_id = (SELECT item_cd FROM codemst with(nolock) WHERE type = '매출이관이월_전체보기' AND use_yn  = 'Y' AND bigo = '공장' and item_cd = :gs_userid );

if rb_4.checked = true and gs_username = ls_fa_user then
	cbx_1.checked = true			
else
	SELECT count(*) INTO :ll_apply FROM salehp a with(nolock) WHERE a.appyn = 'Y' AND a.user_id  = :gs_userid;
	if ll_apply <> 1 then
		MessageBox("확인","매출이관이월 관리를 작성할 수 없습니다.(영업사원 HP관리 미등록)" )
		RETURN
	end if
	
	cbx_1.checked = false			
end if 

/* 2018.03.15 조원석 반영 완료 */
dw_2.Reset()	// 송장상세
dw_1.Reset()	// TRANS(화면)
dw_5.Reset()	// TRANSDET(화면)
dw_6.Reset()	// 설명(화면)

cbx_5.enabled = true		// 협조결재
cbx_5.checked = true	

if cbx_1.checked = true then	// 전체 거래처
	idwc_cust1.setsort( " cust_name A, user_name A")
	idwc_cust1.sort()
else
	idwc_cust1.setsort( " user_name A, cust_name A")
	idwc_cust1.sort()

	idwc_cust1.setfilter( " user_name LIKE '" + gs_username + "%'")
	idwc_cust1.filter()	
end if

dw_1.getchild("fspot_code", idwc_scene1)
idwc_scene1.settransobject(sqlca)
idwc_scene1.retrieve( "%" )

dw_1.getchild("tspot_code", idwc_scene2)
idwc_scene2.settransobject(sqlca)
idwc_scene2.retrieve( "%" )

dw_1.insertrow(0)					// HEAD
dw_1.enabled    = true

dw_6.insertrow(0)					// HEAD(REM)
dw_6.enabled    = true

dw_1.object.tr_type[1]       = ""      	// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
dw_1.object.tcust_no[1]      = ""			// 이관업체
dw_1.object.tspot_code[1]    = ""			// 이관현장
dw_1.object.tsalesman[1]     = ""			// 영업담당
dw_1.object.tcaptain_name[1] = ""			//	대표자명
dw_1.object.tunpaid_amt[1]   = 0				// 채권잔액	
dw_1.object.tcollect_day[1]  = ""			// 수금예정일
dw_1.object.tcredit_level[1] = ""			// 신용
dw_1.object.tlevel_grade[1]  = ""			// 매출
dw_1.object.tprice_level[1]  = ""			// 단가

// 거래처이관
if rb_1.checked = true then	
	dw_1.object.tr_type[1]         = "MOVE"	// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
	dw_1.object.tcust_no.protect   = false
	dw_1.object.tspot_code.protect = false

   dw_1.object.tcust_no.TabSequence   = 150
   dw_1.object.tspot_code.TabSequence = 160

   dw_1.object.tcust_no.background.color   = rgb(254, 252, 175)
   dw_1.object.tspot_code.background.color = rgb(254, 252, 175)
// 출고이월
elseif rb_2.checked = true then
	dw_1.object.tr_type[1]       = "NEXT"	// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
	dw_1.object.tcust_no[1]      = ""		// 이관업체
	dw_1.object.tspot_code[1]    = ""		// 이관현장
	dw_1.object.tsalesman[1]     = ""		// 영업담당
	dw_1.object.tcaptain_name[1] = ""		//	대표자명
	dw_1.object.tunpaid_amt[1]   = 0			// 채권잔액	
	dw_1.object.tcollect_day[1]  = ""		// 수금예정일
	dw_1.object.tcredit_level[1] = ""		// 신용
	dw_1.object.tlevel_grade[1]  = ""		// 매출
	dw_1.object.tprice_level[1]  = ""		// 단가
	
	dw_1.object.tcust_no.protect   = true
	dw_1.object.tspot_code.protect = true

   dw_1.object.tcust_no.TabSequence   = 0
   dw_1.object.tspot_code.TabSequence = 0

   dw_1.object.tcust_no.background.color = 78682240
   dw_1.object.tspot_code.background.color = 78682240
// 현장이관
elseif rb_3.checked = true then
	cbx_5.checked = false						// 협조결재 생략
	
	dw_1.object.tr_type[1] = "SPOT"			// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
	dw_1.object.tcust_no.protect   = false
	dw_1.object.tspot_code.protect = false

   dw_1.object.tcust_no.TabSequence   = 150
   dw_1.object.tspot_code.TabSequence = 160

   dw_1.object.tcust_no.background.color = rgb(254, 252, 175)
   dw_1.object.tspot_code.background.color = rgb(254, 252, 175)
// 주요업무
elseif rb_4.checked = true then
	dw_1.object.tr_type[1]       = "DO" 	// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
	dw_1.object.tcust_no[1]      = ""		// 이관업체
	dw_1.object.tspot_code[1]    = ""		// 이관현장
	dw_1.object.tsalesman[1]     = ""		// 영업담당
	dw_1.object.tcaptain_name[1] = ""		//	대표자명
	dw_1.object.tunpaid_amt[1]   = 0			// 채권잔액	
	dw_1.object.tcollect_day[1]  = ""		// 수금예정일
	dw_1.object.tcredit_level[1] = ""		// 신용
	dw_1.object.tlevel_grade[1]  = ""		// 매출
	dw_1.object.tprice_level[1]  = ""		// 단가
	
	dw_1.object.tcust_no.protect   = true
	dw_1.object.tspot_code.protect = true

     dw_1.object.tcust_no.TabSequence   = 0
     dw_1.object.tspot_code.TabSequence = 0
	
     dw_1.object.tcust_no.background.color = 78682240
     dw_1.object.tspot_code.background.color = 78682240
else
	MessageBox("확인","문서종류가 설정되지 않았습니다.")
	RETURN
end if

/////////////////////////////////////////////
pb_save.enabled = true
dw_1.object.cc_flag[1] = '0'	// DW활성화
/////////////////////////////////////////////

// 기본값
SELECT team_name INTO :ls_teamnm FROM team with(nolock) WHERE team_code = :gs_team;

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
INTO :ls_lastday
FROM LOGIN with(nolock);

if Day(today()) > 10 then
	dw_1.object.tr_date[1]  = Date(string(today(), 'yyyy/mm/dd'))	// 당일
else
	ls_lastday = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
	dw_1.object.tr_date[1]  = Date(ls_lastday)
end if

dw_1.Modify("tr_date.TabSequence = 0" )
dw_1.object.tr_balteam[1]  = "70000"			// 발신(영업본부)
dw_1.object.tr_hyupteam[1] = "10000"			// 협조(관리본부)

dw_1.object.team_code[1]   = gs_team			// 기안부서
dw_1.object.team_name[1]   = ls_teamnm			// 기안부서 명
dw_1.object.user_id[1]     = gs_userid			// 기안자 ID
dw_1.object.user_name[1]   = gs_username		// 기안자 명

/*
 공장의  주요업무 등록 가능한 권한자인지 체크 2018/03/15 조원석
 주요업무일때 공장은 매출이관이월_전체보기, 매출이관이월_팀장의 비고가 '공장'인걸 체크한다.  
 기존 결재라인 로직을 넘어간다. 기존 결재라인은 영업사원중심으로 결재가 시작된다.
 공장은 아래의 salehp에 없다. 시작
			  
*/

if dw_1.object.tr_type[1]  = 'DO' and gs_username = ls_fa_user then
	SELECT a.rank, a.user_id, a.user_name
	INTO :ls_rank1, :ls_app1, :ls_user1
	FROM login a with(nolock)
	WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_전체보기' AND use_yn  = 'Y' AND bigo = '공장' and item_cd = :gs_userid);
				  
	SELECT a.rank, a.user_id, a.user_name
	INTO :ls_rank5, :ls_app5, :ls_user5
	FROM login a with(nolock)
	WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_팀장' AND use_yn  = 'Y' AND bigo = '공장');				  
/*공장의  주요업무 등록 가능한 권한자인지 체크 2018/03/15 조원석 끝 */
else											/* 기존 결재라인 주요업무 외  */  
	// 결재관련사항
	SELECT 
		 user2_rank  = a.rank2, user2_id  = a.apply2, user2_name  = isnull(c2.user_name,'')
		,user3_rank  = a.rank3, user3_id  = a.apply3, user3_name  = isnull(c3.user_name,'')
		,'','',''	  
		,user4_rank  = a.rank4, user4_id  = a.apply4, user4_name  = isnull(c4.user_name,'')
		,user5_rank  = a.rank5, user5_id  = a.apply5, user5_name  = isnull(c5.user_name,'')
		,userchk     = (case when a.apply1 = :gs_userid then a.apply1
								when a.apply2 = :gs_userid then a.apply2
								when a.apply3 = :gs_userid then a.apply3
						 	end)
		,userseq     = (case when a.apply1 = :gs_userid then 1
								when a.apply2 = :gs_userid then 2
								when a.apply3 = :gs_userid then 3
						 	end)
	INTO 
		:ls_rank1, :ls_app1, :ls_user1, 
		:ls_rank2, :ls_app2, :ls_user2, 
		:ls_rank3, :ls_app3, :ls_user3,
		:ls_rank4, :ls_app4, :ls_user4, 
		:ls_rank5, :ls_app5, :ls_user5, 
		:ls_userchk, :ll_userseq
	FROM 
		salehp a with(nolock)
				 LEFT OUTER JOIN login c1  with(nolock) ON a.apply1 = c1.user_id
				 LEFT OUTER JOIN login c2  with(nolock) ON a.apply2 = c2.user_id
				 LEFT OUTER JOIN login c3  with(nolock) ON a.apply3 = c3.user_id
				 LEFT OUTER JOIN login c4  with(nolock) ON a.apply4 = c4.user_id
				 LEFT OUTER JOIN login c5  with(nolock) ON a.apply5 = c5.user_id
	WHERE 
		a.appyn    = 'Y'
	AND 
		a.user_id  = :gs_userid;
			
	if isnull(ls_userchk) OR ls_userchk = "" then
		MessageBox("확인","매출이관이월 관리를 작성할 수 없습니다.(영업사원 HP관리 미등록)" )
		RETURN
	end if
		
	// 주요문서인 경우 발신부서 변경
	if dw_1.object.tr_type[1] = "DO" then
		dw_1.object.tr_balteam[1]  = LeftA(gs_team,1) + "0000"	// 발신(영업본부)
	end if

		
	// 최종결재자
	SELECT a.rank, a.user_id, a.user_name
	INTO :ls_rank5, :ls_app5, :ls_user5   
	FROM login a
	WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_결재자' AND use_yn  = 'Y' AND bigo = '최종결재자');
end if

// 협조자
SELECT '협조', a.user_id, a.user_name
INTO :ls_rankh,	:ls_apph, :ls_userh
FROM login a
WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자' AND use_yn = 'Y');


// 협조자1 jowonsuk 2022-11-25 협조1 추가 
choose case  dw_1.object.tr_type[1] 
case "DO", "SPOT"
case else				
	SELECT '협조1', a.user_id, a.user_name
	INTO :ls_rankh1,	:ls_apph1, :ls_userh1
	FROM login a
	WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자1' AND use_yn = 'Y');		 			
end choose		 

// 협조자2 bkikm 2024-01-10 협조2 추가 
choose case  dw_1.object.tr_type[1] 
case "DO", "SPOT"
case else				
	SELECT '협조2', a.user_id, a.user_name
	INTO :ls_rankh2,	:ls_apph2, :ls_userh2
	FROM login a
	WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자2' AND use_yn = 'Y');		 			
end choose		 

		
// 결재자 이름
if trim(ls_user1) <> "" then ls_user1 = trim(ls_user1) + "인"
if trim(ls_user2) <> "" then ls_user2 = trim(ls_user2) + "인"
if trim(ls_user3) <> "" then ls_user3 = trim(ls_user3) + "인"
if trim(ls_user4) <> "" then ls_user4 = trim(ls_user4) + "인"
if trim(ls_user5) <> "" then ls_user5 = trim(ls_user5) + "인"
		
// 결재자 직책
dw_1.object.rank1[1] = ls_rank1 ; dw_1.object.rank2[1] = ls_rank2
dw_1.object.rank3[1] = ls_rank3 ; dw_1.object.rank4[1] = ls_rank4
dw_1.object.rank5[1] = ls_rank5
// 결재자 이름
dw_1.object.user1[1] = ls_user1 ; dw_1.object.user2[1] = ls_user2
dw_1.object.user3[1] = ls_user3 ; dw_1.object.user4[1] = ls_user4
dw_1.object.user5[1] = ls_user5
// 결재자 ID
dw_1.object.tr_app1[1] = ls_app1 ; dw_1.object.tr_app2[1] = ls_app2
dw_1.object.tr_app3[1] = ls_app3 ; dw_1.object.tr_app4[1] = ls_app4
dw_1.object.tr_app5[1] = ls_app5
		
// 협조결재 
if cbx_5.checked = true then
	dw_1.object.rankh[1]		= ls_rankh
	dw_1.object.tr_apph[1]	= ls_apph
	dw_1.object.userh[1] 	= ls_userh
	dw_6.object.rankh[1] 	= ls_rankh
	
	dw_1.object.rankh1[1]	= ls_rankh1
	dw_1.object.tr_apph1[1] = ls_apph1
	dw_1.object.userh1[1] 	= ls_userh1

	dw_1.object.rankh2[1]	= ls_rankh2
	dw_1.object.tr_apph2[1] = ls_apph2
	dw_1.object.userh2[1] 	= ls_userh2
end if
		
// 주요업무는 기본결재선에서 협조와 본인외 삭제함
if dw_1.object.tr_type[1] = "DO" then
	dw_1.object.apply_end[1] = ls_null		// 종결

	choose case ll_userseq
		case 1
			dw_1.object.rank2[1]   = "" ; dw_1.object.rank3[1]   = "" ; dw_1.object.rank4[1]   = ""	// 직책
			dw_1.object.user2[1]   = "" ; dw_1.object.user3[1]   = "" ; dw_1.object.user4[1]   = ""	// 이름
			dw_1.object.tr_app2[1] = "" ; dw_1.object.tr_app3[1] = "" ; dw_1.object.tr_app4[1] = ""	// ID
			dw_6.object.rank2[1]   = "" ; dw_6.object.rank3[1]   = "" ; dw_6.object.rank4[1]   = ""	// 비고
		case 2
			dw_1.object.rank1[1]   = "" ; dw_1.object.rank3[1]   = "" ; dw_1.object.rank4[1]   = ""	// 직책
			dw_1.object.user1[1]   = "" ; dw_1.object.user3[1]   = "" ; dw_1.object.user4[1]   = ""	// 이름
			dw_1.object.tr_app1[1] = "" ; dw_1.object.tr_app3[1] = "" ; dw_1.object.tr_app4[1] = ""	// ID
			dw_6.object.rank1[1]   = "" ; dw_6.object.rank3[1]   = "" ; dw_6.object.rank4[1]   = ""	// 비고
		case 3
			dw_1.object.rank1[1]   = "" ; dw_1.object.rank2[1]   = "" ; dw_1.object.rank4[1]   = ""	// 직책
			dw_1.object.user1[1]   = "" ; dw_1.object.user2[1]   = "" ; dw_1.object.user4[1]   = ""	// 이름
			dw_1.object.tr_app1[1] = "" ; dw_1.object.tr_app2[1] = "" ; dw_1.object.tr_app4[1] = ""	// ID
			dw_6.object.rank1[1]   = "" ; dw_6.object.rank2[1]   = "" ; dw_6.object.rank4[1]   = ""	// 비고
	end choose
end if
		
if GF_PERMISSION("매출이관이월_현장이관", gs_userid) = "Y" then
	if dw_1.object.tr_type[1] = "SPOT" then
		dw_1.object.apply_end[1] = ls_null		// 종결

		dw_1.object.tr_apph[1]	 = ls_null  	// 협조제거
		dw_1.object.tr_appdth[1] 	 = ldt_null  	// 협조제거
		
		dw_1.object.tr_apph1[1]	 = ls_null  	// 협조1 제거
		dw_1.object.tr_appdth1[1] = ldt_null  	// 협조1 제거				
		
		dw_1.object.tr_apph2[1]	 = ls_null  	// 협조2 제거
		dw_1.object.tr_appdth2[1] = ldt_null  	// 협조2 제거				
		
	end if
end if
		
dw_1.object.fcust_no.protect    = false	// 변경전 거래처
dw_1.object.fspot_code.protect  = false	// 변경전 현장
dw_1.object.tcust_no.protect    = false	// 변경후 거래처
dw_1.object.tspot_code.protect  = false	// 변경후 현장

dw_1.object.tr_date.protect     = false	// 출고일자
dw_1.object.tr_balteam.protect  = false	// 발신부서
dw_1.object.tr_hyupteam.protect = false	// 협조부서

dw_1.object.tr_content.protect  = false	// 본문

// 결재자 비고
dw_6.object.rank1[1]   = ls_rank1 ; dw_6.object.rank2[1]   = ls_rank2
dw_6.object.rank3[1]   = ls_rank3 ; dw_6.object.rank4[1]   = ls_rank4
dw_6.object.rank5[1]   = ls_rank5	// 결재설명
		
/////////////////////////////////////////////////////////////////////////
if dw_5.rowcount() > 0 then
	dw_5.object.scene_code.protect = false	// 현장
	dw_5.object.price.protect      = false	// 금액
	dw_5.object.rem.protect        = false	// 산출근거
end if
//////////////////////////////////////////////////////////////
if dw_6.rowcount() > 0 then
	dw_6.object.tr_rem1.protect    = false	// 결재자1
	dw_6.object.tr_rem2.protect    = false	// 결재자2
	dw_6.object.tr_rem3.protect    = false	// 결재자3
	dw_6.object.tr_rem4.protect    = false	// 결재자4
	dw_6.object.tr_rem5.protect    = false	// 결재자5
end if
//////////////////////////////////////////////////////////////
		
// 결재란
for ll_apply = 1 to 5
	ls_applyid = dw_1.GetItemString( 1, "tr_app"+string(ll_apply) )
	if gs_userid = ls_applyid then
		dw_1.Modify("user"   + string(ll_apply) + ".background.Mode=1")
		dw_1.Modify("user"   + string(ll_apply) + ".background.color=65535")		// Yellow
		dw_1.Modify("user"   + string(ll_apply) + ".Protect=0")			

		dw_6.Modify("tr_rem" + string(ll_apply) + ".background.Mode=1")
		dw_6.Modify("tr_rem" + string(ll_apply) + ".background.color=65535")
		dw_6.Modify("tr_rem" + string(ll_apply) + ".Protect=0")			
	else
		dw_1.Modify("user"   + string(ll_apply) + ".background.Mode=1")
		dw_1.Modify("user"   + string(ll_apply) + ".background.color=12632256")	// Light gray
		dw_1.Modify("user"   + string(ll_apply) + ".Protect=1")			

		dw_6.Modify("tr_rem" + string(ll_apply) + ".background.Mode=1")
		dw_6.Modify("tr_rem" + string(ll_apply) + ".background.color=12632256")
		dw_6.Modify("tr_rem" + string(ll_apply) + ".Protect=1")			
	end if
next

ls_content = "1. 발생사유 : " + CharA(13) + CharA(10) + &
				 "2. 업체현황 : " + CharA(13) + CharA(10)
dw_1.object.tr_content[1] = ls_content

dw_1.setredraw( true )		
dw_1.setcolumn("fcust_no")
dw_1.setfocus()

if cbx_msg.checked = true then
else
	MessageBox("확인","본문작성시 줄 바꿈은 엔터키로 작업하시기 바랍니다.~n~r~r" + &
				  "직책난 2, 3번 결재라인은 클릭하여 변경할 수 있습니다.~n~r~r" + &
				  "1.발생사유와 2.업체현황은 4줄이내 작성 바랍니다. (결재시 안보임)" )
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oidotrans_m
integer x = 4091
integer y = 68
integer taborder = 10
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string   ls_trapp5, ls_trtype
string   ls_custno, ls_sdate, ls_edate, ls_transno, ls_user3, ls_userid, ls_value, ls_applyid, ls_applyend
long     ll_row, ll_cnt
date     ld_sdate, ld_edate
datetime ld_null

setnull( ld_null )

cb_2.triggerevent( clicked! )		// 필터해지

ls_sdate = em_1.text
ls_edate = em_2.text
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

dw_1.reset() ; dw_2.reset() ; dw_3.reset()
dw_4.reset() ; dw_5.reset() ; dw_6.reset()	// 7,8 조직도
dw_9.reset()

dw_1.getchild("fcust_no", idwc_cust1)
idwc_cust1.settransobject(sqlca)
dw_1.getchild("fspot_code", idwc_scene1)
idwc_scene1.settransobject(sqlca)
idwc_scene1.retrieve( '%' )

dw_1.getchild("tcust_no", idwc_cust2)
idwc_cust2.settransobject(sqlca)
dw_1.getchild("tspot_code", idwc_scene2)
idwc_scene2.settransobject(sqlca)
idwc_scene2.retrieve( "%" )			// d_cdtransscene_dddw
//
dw_1.getchild("fsalesman", idwc_sales1)	// d_cduser_all
idwc_sales1.settransobject(sqlca)
dw_1.getchild("tsalesman", idwc_sales2)	// d_cduser_all
idwc_sales2.settransobject(sqlca)
//
dw_5.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
dw_5.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)		// d_cdscene_dddw
idwc_scene.setfilter( "" )
idwc_scene.filter()

// 전체보기
ls_userid = gs_userid
if cbx_all.checked = true then	
	ls_userid = "%"
else
	ls_userid = gs_userid	
end if

// 전체, 미승인, 승인완료
if rb_all.checked = true then
	ls_trapp5 = "ALL"
elseif rb_topno.checked = true then
	ls_trapp5 = "NO"
elseif rb_topyes.checked = true then
	ls_trapp5 = "YES"
end if

ll_row = dw_3.retrieve( ls_userid, ld_sdate, ld_edate, ls_trapp5 )
if ll_row < 1 then 
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
else
	dw_3.PostEvent( rowfocuschanged! )
	ls_transno = dw_3.object.trans_no[1]		// 이관번호	
	ls_custno  = dw_3.object.fcust_no[1]		// 변경전 거래처
	
	dw_1.setredraw( false )
	dw_1.retrieve( ls_transno )	// 헤드
	dw_5.retrieve( ls_transno )	// 본문
	dw_6.retrieve( ls_transno )	// 결재 특이사항
	
	if isnull(dw_1.object.tr_appdt1[1]) then
	else
		dw_1.object.tcust_no.protect     = 1
		dw_1.object.tspot_code.protect   = 1
		dw_1.object.tr_content.protect   = 1
	end if

	//////////////////////////////////////////////////////////
	// 최종결재후 전결처리건 화면에서 지움 
	//////////////////////////////////////////////////////////
	if isnull(dw_1.object.tr_appdt5[1]) then
	else
		ls_applyid = dw_1.object.tr_app5[1]
		
		choose case ls_applyid
			case "TOP"
			case else	// 전결인 경우
				for ll_cnt = 4 to 2 step -1
					ls_applyid  = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )
					ls_applyend = dw_1.object.tr_app5[1]
					
					if ls_applyend = ls_applyid then
						dw_1.setitem( 1, "rank" + string(ll_cnt), "" )
						dw_1.setitem( 1, "user" + string(ll_cnt), "" )
						dw_1.setitem( 1, "tr_appdt" + string(ll_cnt), ld_null )
						exit
					end if
				next					
				
				/* 2022-02-04 jowonsuk 내용 추가 이월고정인 경우, 본부장 권한 */
				ll_cnt = 0
				ls_applyid = dw_1.object.tr_app5[1]
				ls_trtype   = dw_1.object.tr_type[1]				
					
				SELECT count(*)
				into :ll_cnt
				FROM codemst 
				WHERE TYPE = '매출이관이월_협조자1' AND use_yn = 'Y' AND item_cd = :ls_applyid;	
				
				if ll_cnt > 0 and ls_trtype = "NEXT" AND dw_1.object.tr_ewolfix[1] = "Y" then			
					ls_applyend = dw_1.object.tr_apph1[1]
					if ls_applyend = ls_applyid then
						dw_1.object.rankh1[1] = ''
						dw_1.object.userh1[1] = ''	
						dw_1.object.tr_appdt1[1] = ld_null					
					end if					
				end if				
				
				//협조2 추가(bkkim)
				ll_cnt	= 0
				SELECT count(*)
				into :ll_cnt
				FROM codemst 
				WHERE TYPE = '매출이관이월_협조자2' AND use_yn = 'Y' AND item_cd = :ls_applyid;	
				
				if ll_cnt > 0 and ls_trtype = "NEXT" AND dw_1.object.tr_ewolfix[1] = "Y" then			
					ls_applyend = dw_1.object.tr_apph2[1]
					if ls_applyend = ls_applyid then
						dw_1.object.rankh2[1] = ''
						dw_1.object.userh2[1] = ''	
						dw_1.object.tr_appdt1[1] = ld_null					
					end if					
				end if				
		end choose
	end if
	dw_1.setredraw( true )	
end if
dw_3.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_oidotrans_m
integer x = 1650
integer y = 12
integer width = 439
integer height = 272
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "작업구분"
end type

type gb_2 from w_inheritance`gb_2 within w_oidotrans_m
integer x = 2107
integer y = 12
integer width = 741
integer height = 232
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "11일 부터 당월"
end type

type gb_1 from w_inheritance`gb_1 within w_oidotrans_m
integer x = 3557
integer width = 1906
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidotrans_m
string tag = "d_oifiting_l2"
integer x = 50
integer y = 12
integer width = 128
integer height = 100
integer taborder = 0
string title = "출고상세"
string dataobject = "d_oigiupdate_m2"
boolean hscrollbar = true
end type

type em_1 from editmask within w_oidotrans_m
integer x = 2464
integer y = 68
integer width = 352
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if

end event

type em_2 from editmask within w_oidotrans_m
integer x = 2464
integer y = 148
integer width = 352
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type dw_3 from datawindow within w_oidotrans_m
event keydown pbm_dwnkey
integer x = 37
integer y = 456
integer width = 2158
integer height = 2336
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_oidotrans_s1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_datawindow = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
this.setfocus()

end event

event losefocus;this.Object.DataWindow.Color = rgb(255,255,255)
end event

event rowfocuschanged;string   ls_transno, ls_userid, ls_applyid, ls_applyend, ls_dono
long     ll_row, ll_cnt, ll_totcnt, ll_tabseq
datetime ld_null
boolean  lb_chk

setnull(ld_null)

dw_3.accepttext()
if dw_3.rowcount() < 1 then RETURN

if isnull(currentrow) OR currentrow < 1 OR currentrow > dw_3.rowcount() then return

// 출고내역 상세보기
cbx_4.checked = false		
cbx_4.triggerevent( clicked! )

dw_3.SetRow(currentrow)
ls_transno = dw_3.object.trans_no[currentrow]		// 문서번호
if isnull(ls_transno) OR ls_transno = "" then RETURN

//	화면출력
dw_1.setredraw( false )

idwc_cust1.setfilter( "")
idwc_cust1.filter()
idwc_scene1.retrieve( "%" )
//////////////////////////////////////////////////////////////
idwc_scene1.insertrow(1)
idwc_scene1.setitem(1, "scene_code", "%")
idwc_scene1.setitem(1, "scene_desc", "전체현장")

dw_1.object.fspot_code[1] = "%" // 전체
idwc_scene1.accepttext()
//////////////////////////////////////////////////////////////

idwc_scene2.retrieve( "%" )
idwc_scene.setfilter( "" )
idwc_scene.filter()

// 문서보여주기
dw_1.setredraw( false ) ; dw_5.setredraw( false ) ; dw_6.setredraw( false )
dw_1.retrieve( ls_transno )	// 화면
dw_5.retrieve( ls_transno )	// 본문
dw_6.retrieve( ls_transno )	// 결재 특이사항
dw_1.setredraw( true ) ; dw_5.setredraw( true ) ; dw_6.setredraw( true )


//////////////////////////////////////////////////////////
// 작성자가 아니면 삭제불가
//////////////////////////////////////////////////////////
if this.object.user_id[currentrow] <> gs_userid then 
	pb_delete.enabled = false
else
	pb_delete.enabled = true
end if

//////////////////////////////////////////////////////////
// 상급자 결재상태 체크
//////////////////////////////////////////////////////////
string   ls_field
long     ll_upcheck
datetime ldt_appdt

lb_chk = false
fOR ll_cnt = 1 to 5
	ls_userid = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )			
	if ls_userid = gs_userid then 
		lb_chk = true
		exit
	end if
next
if lb_chk = true then
	fOR ll_upcheck = ll_cnt + 1 to 5
		ls_field = "tr_appdt" + string(ll_upcheck)
		ldt_appdt = dw_1.getitemdatetime( 1, ls_field )			
		if isnull(ldt_appdt) then 
			lb_chk = true
		else
			lb_chk = false
			exit
		end if
	next		
end if
//////////////////////////////////////////////////////////
pb_save.enabled = lb_chk		// 저장
//////////////////////////////////////////////////////////


// 기안자
if gs_userid = dw_1.object.user_id[1] then
else
	dw_5.Modify("bigo.TabSequence = 0" )
end if

// 결재칸 프로텍트
fOR ll_cnt = 1 to 5
	ll_tabseq = ll_cnt * 10
	ls_userid = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )			
	
	if ls_userid = gs_userid then 
		dw_1.Modify("rank"     + string(ll_cnt) + ".Protect=0")			
		dw_1.Modify("user"     + string(ll_cnt) + ".Protect=0")			
		dw_6.Modify("tr_rem"   + string(ll_cnt) + ".Protect=0")			

		dw_1.Modify("rank"     + string(ll_cnt) + ".TabSequence = " + string(ll_tabseq) )
		dw_1.Modify("user"     + string(ll_cnt) + ".TabSequence = " + string(ll_tabseq) )
		dw_6.Modify("tr_rem"   + string(ll_cnt) + ".TabSequence = " + string(ll_tabseq) )
	else
		dw_1.Modify("rank"     + string(ll_cnt) + ".Protect=1")			
		dw_1.Modify("user"     + string(ll_cnt) + ".Protect=1")			
		dw_6.Modify("tr_rem"  + string(ll_cnt) + ".Protect=1")			

		dw_1.Modify("rank"     + string(ll_cnt) + ".TabSequence = 0" )
		dw_1.Modify("user"     + string(ll_cnt) + ".TabSequence = 0" )
		dw_6.Modify("tr_rem"   + string(ll_cnt) + ".TabSequence = 0" )
	end if
next

// 협조자 설명 2021.11.12 jowonsuk 협조1 추가/협조2 추가(bkkim)
ls_userid = dw_1.getitemstring( 1, "tr_apph" )			

if ls_userid = gs_userid or gs_userid = dw_1.object.tr_apph1[1] or gs_userid = dw_1.object.tr_apph2[1] then 
	dw_6.Modify("tr_remh.Protect=0")			
	dw_6.Modify("tr_remh.TabSequence = " + string(ll_tabseq) )

	dw_6.Modify("tr_remh.Protect=0")			
	dw_6.Modify("tr_remh.TabSequence = " + string(40) )
else
	dw_6.Modify("tr_remh.Protect=1")			
	dw_6.Modify("tr_remh.TabSequence = 0" )

	dw_6.Modify("tr_remh.Protect=1")			
	dw_6.Modify("tr_remh.TabSequence = 0" )		
end if

// 협조자 2021.11.12 jowonsuk 협조1 추가/협조2 추가(bkkim)
if ls_userid = gs_userid or gs_userid = dw_1.object.tr_apph1[1] or gs_userid = dw_1.object.tr_apph2[1] then
	dw_1.Modify( "userh.TabSequence = 120" )
else
	dw_1.Modify( "userh.TabSequence = 0" )
end if
	
//////////////////////////////////////////////////////////
// 최종결재후 전결처리건 화면에서 지움 
//////////////////////////////////////////////////////////
if isnull(dw_1.object.tr_appdt5[1]) then
else
	ls_applyid = dw_1.object.tr_app5[1]		// 최종결재자
	
	choose case ls_applyid
		case "TOP"	// 정상결재
		case else	// 전결처리한 경우
			fOR ll_cnt = 4 to 2 step -1
				ls_applyid  = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )
				ls_applyend = dw_1.object.tr_app5[1]
				
				if ls_applyend = ls_applyid then
					dw_1.setitem( 1, "rank" + string(ll_cnt), "" )
					dw_1.setitem( 1, "user" + string(ll_cnt), "" )
					dw_1.setitem( 1, "tr_appdt" + string(ll_cnt), ld_null )
					exit
				end if
			next
	end choose
end if

if isnull(dw_1.object.tr_appdt1[1]) then
	cbx_5.enabled = false	// 협조결재
	
	dw_1.object.tr_date.protect = false		// 기준일자
	
	dw_1.object.tcust_no.protect = false
	dw_1.object.tspot_code.protect = false
	dw_1.object.tr_content.protect = false

	dw_5.object.bigo.protect = false
else
	cbx_5.enabled = false   // 협조결재
	
	dw_1.object.tr_date.protect = true		// 기준일자

	dw_1.object.tcust_no.protect = true
	dw_1.object.tspot_code.protect = true
	dw_1.object.tr_content.protect = true

	dw_5.object.bigo.protect = true
end if

// 기안자
if gs_userid = dw_1.object.user_id[1] then
else
	dw_5.Modify("bigo.TabSequence = 0" )
end if

//
if gs_userid = "TOP" then
	if isnull(dw_1.object.tr_app5[1]) then
		dw_1.Modify( "user5.TabSequence = 110" )
	else
		dw_1.Modify( "user5.TabSequence = 0" )
		dw_1.Modify( "tr_appdt5.TabSequence = 0" )
	end if
end if
dw_1.setredraw( true )

this.setfocus()

end event

type st_3 from statictext within w_oidotrans_m
integer x = 297
integer y = 336
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

type ddlb_fld from dropdownlistbox within w_oidotrans_m
integer x = 475
integer y = 320
integer width = 389
integer height = 632
integer taborder = 200
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

type ddlb_dwtitles from dropdownlistbox within w_oidotrans_m
integer x = 539
integer y = 332
integer width = 219
integer height = 88
integer taborder = 260
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

type st_4 from statictext within w_oidotrans_m
integer x = 878
integer y = 336
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

type sle_value from singlelineedit within w_oidotrans_m
integer x = 1349
integer y = 320
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
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oidotrans_m
integer x = 1714
integer y = 320
integer width = 160
integer height = 76
integer taborder = 150
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
	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
	arg_dw = dw_5
else
	arg_dw = dw_9
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidotrans_m
integer x = 1879
integer y = 320
integer width = 160
integer height = 76
integer taborder = 210
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
	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
	arg_dw = dw_5
else
	arg_dw = dw_9
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oidotrans_m
integer x = 2043
integer y = 320
integer width = 160
integer height = 76
integer taborder = 270
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
	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
	arg_dw = dw_5
else
	arg_dw = dw_9
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidotrans_m
integer x = 2208
integer y = 320
integer width = 160
integer height = 76
integer taborder = 160
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
	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
	arg_dw = dw_5
else
	arg_dw = dw_9
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_oidotrans_m
event mousemove pbm_mousemove
integer x = 4667
integer y = 68
integer width = 187
integer height = 144
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_1 from statictext within w_oidotrans_m
integer x = 2139
integer y = 68
integer width = 320
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "출고일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_oidotrans_m
integer x = 2400
integer y = 304
integer width = 457
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
string text = "전체 거래처"
end type

event clicked;// 전체 거래처
if this.checked = true then
	// 담당자 거래처만 보여주기
	idwc_cust1.setsort( " cust_name A, user_name A ")
	idwc_cust1.sort()
	
	idwc_cust1.setfilter( "" )
	idwc_cust1.filter()
else
	idwc_cust1.setsort( " user_name A, cust_name A")
	idwc_cust1.sort()
	
	idwc_cust1.setfilter( " user_name LIKE '" + gs_username + "%'")
	idwc_cust1.filter()
end if

end event

type st_6 from statictext within w_oidotrans_m
integer x = 2743
integer y = 364
integer width = 2039
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "[전결]본부장 출고이월 고정업체(전결), 매출이관 1,000만원"
boolean focusrectangle = false
end type

type st_7 from statictext within w_oidotrans_m
integer x = 37
integer y = 192
integer width = 1513
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "본문작성시 줄 바꿈은 엔터키로 작업하시기 바랍니다."
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_oidotrans_m
integer x = 206
integer y = 12
integer width = 128
integer height = 100
integer taborder = 110
boolean bringtotop = true
string title = "양식"
string dataobject = "d_oidotrans_prt1"
boolean livescroll = true
end type

type gb_4 from groupbox within w_oidotrans_m
integer x = 37
integer y = 256
integer width = 5083
integer height = 184
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type pb_add from picturebutton within w_oidotrans_m
integer x = 4782
integer y = 300
integer width = 155
integer height = 116
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;// 송장 삽입
string ls_custno, ls_scene, ls_sdate, ls_edate
long   ll_row, ll_cnt, ll_dupcnt

if dw_1.rowcount() < 1 then RETURN

if dw_1.object.cc_flag[1] = "1" then
	//
else
	ls_custno = dw_1.object.fcust_no[1]
	ls_scene  = dw_1.object.fspot_code[1]

	if isnull( ls_custno ) or ls_custno = "" then
		MessageBox("확인","변경전 거래처를 선택하시기 바랍니다.")
		RETURN
	else
//		dw_5.getchild("scene_code",idwc_scene)		// 현장명
//		idwc_scene.SetTransObject(SQLCA)
//		idwc_scene.Retrieve( ls_custno )
		idwc_scene.setfilter( " cust_no = '" + ls_custno + "'" )
		idwc_scene.filter()

	end if

	if isnull( ls_scene ) or ls_scene = "" then
		MessageBox("확인","변경전 현장를 선택하시기 바랍니다.")
		RETURN
	end if

	ls_sdate = em_1.text
	ls_edate = em_2.text

	cb_4.enabled  = true		// 송장 가져오기
	cbx_3.enabled = true		// 전체선택
	dw_9.visible  = true		// 출고송장


	dw_9.Object.trans_no.Visible = 0		// 숨김
	dw_9.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, "N" )
	
	if dw_9.rowcount() < 1 then
		cbx_3.checked = false
		cbx_3.triggerevent( clicked! )
		
		cbx_3.enabled = false
		dw_9.visible  = false
		cb_4.enabled  = false		// 송장 가져오기
		MessageBox("확인","해당하는 거래처의 데이터가 존재하지 않거나, 이미 계산서가 발행 되었습니다.")
	else

	
		for ll_row = 1 to dw_5.rowcount()
			for ll_cnt = dw_9.rowcount() to 1 step -1
				if dw_5.object.do_no[ll_row] = dw_9.object.do_no[ll_cnt] then
					dw_9.deleterow( ll_cnt )
					ll_dupcnt = ll_dupcnt + 1
				end if
			next
		next
		if ll_dupcnt > 0 then
			MessageBox("확인","거래처 출고송장 조회 내용중에서 현재 작성중인 출고번호가 " + &
						  string(ll_dupcnt) + " 건 중복제거 되었습니다.")
		end if
	end if
end if

end event

type cbx_2 from checkbox within w_oidotrans_m
integer x = 2400
integer y = 360
integer width = 297
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
boolean enabled = false
string text = "조직도"
boolean checked = true
end type

type dw_7 from datawindow within w_oidotrans_m
integer x = 347
integer y = 12
integer width = 128
integer height = 100
integer taborder = 180
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdteam_h"
boolean livescroll = true
end type

type tab_1 from tab within w_oidotrans_m
event create ( )
event destroy ( )
integer x = 2254
integer y = 1384
integer width = 2665
integer height = 1392
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
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
integer width = 2629
integer height = 1276
long backcolor = 79741120
string text = "조직도(결재라인)"
long tabtextcolor = 128
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_14 cb_14
cbx_8 cbx_8
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
dw_12 dw_12
cb_7 cb_7
dw_8 dw_8
tv_1 tv_1
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
end type

on tabpage_1.create
this.cb_14=create cb_14
this.cbx_8=create cbx_8
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.dw_12=create dw_12
this.cb_7=create cb_7
this.dw_8=create dw_8
this.tv_1=create tv_1
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.Control[]={this.cb_14,&
this.cbx_8,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.dw_12,&
this.cb_7,&
this.dw_8,&
this.tv_1,&
this.cb_8,&
this.cb_9,&
this.cb_10}
end on

on tabpage_1.destroy
destroy(this.cb_14)
destroy(this.cbx_8)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.dw_12)
destroy(this.cb_7)
destroy(this.dw_8)
destroy(this.tv_1)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
end on

type cb_14 from commandbutton within tabpage_1
integer x = 960
integer y = 600
integer width = 215
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택"
end type

event clicked;string ls_rank, ls_usernm, ls_userid, ls_team, ls_null, ls_name
long   ll_row, l_row, l_count

tab_1.tabpage_1.dw_12.accepttext()

setnull(ls_null)
ll_row    = tab_1.tabpage_1.dw_12.getrow()

if ll_row < 1 then return

ls_name = tab_1.tabpage_1.dw_12.object.approval_name[ll_row]

l_count = 0

select count(*)
  into  :l_count
from approvalline
where user_id = :gs_userid
      and approval_name = :ls_name;
		
if l_count = 0 then return

for l_row = 1 to 5
	dw_6.setItem(1, "rank"+string(l_row), tab_1.tabpage_1.dw_12.GetItemString(ll_row, "rank"+string(l_row), Primary!, True))
	dw_1.setItem(1, "rank"+string(l_row), tab_1.tabpage_1.dw_12.GetItemString(ll_row, "rank"+string(l_row), Primary!, True)) 	
	dw_1.setItem(1, "user"+string(l_row), tab_1.tabpage_1.dw_12.GetItemString(ll_row, "user_name"+string(l_row), Primary!, True)+ '인')
	dw_1.setItem(1, "tr_app"+string(l_row), tab_1.tabpage_1.dw_12.GetItemString(ll_row, "approval"+string(l_row), Primary!, True))	
next

cbx_8.checked = false
tab_1.visible = false


tab_1.height = 796
tab_1.width  = 2267

tab_1.tabpage_1.cb_7.visible = true	
tab_1.tabpage_1.cb_8.visible = true
tab_1.tabpage_1.cb_9.visible = true	

tab_1.tabpage_1.cb_11.visible = false
tab_1.tabpage_1.cb_12.visible = false
tab_1.tabpage_1.cb_13.visible = false		
tab_1.tabpage_1.cb_14.visible = false
end event

type cbx_8 from checkbox within tabpage_1
integer x = 23
integer y = 596
integer width = 311
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "즐겨찾기"
end type

event clicked;if this.checked then
	
	tab_1.height = 1392
	tab_1.width  = 2665
	
	tab_1.tabpage_1.cb_7.visible = false	
	tab_1.tabpage_1.cb_8.visible = false
	tab_1.tabpage_1.cb_9.visible = false

	
	tab_1.tabpage_1.cb_11.visible = true
	tab_1.tabpage_1.cb_12.visible = true
	tab_1.tabpage_1.cb_13.visible = true		
	tab_1.tabpage_1.cb_14.visible = true	
	
	dw_12.retrieve(gs_userid)
	
//	tab_1.tabpage_1.dw_12.SelectRow(0, FALSE)
//	tab_1.tabpage_1.dw_12.SelectRow(1, TRUE)	
	
else

	tab_1.height = 796
	tab_1.width  = 2267
	
	tab_1.tabpage_1.cb_7.visible = true	
	tab_1.tabpage_1.cb_8.visible = true
	tab_1.tabpage_1.cb_9.visible = true	

	tab_1.tabpage_1.cb_11.visible = false
	tab_1.tabpage_1.cb_12.visible = false
	tab_1.tabpage_1.cb_13.visible = false		
	tab_1.tabpage_1.cb_14.visible = false		
	
//	tab_1.tabpage_1.dw_12.SelectRow(0, FALSE)	

end if
end event

type cb_13 from commandbutton within tabpage_1
integer x = 759
integer y = 600
integer width = 201
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;tab_1.tabpage_1.dw_12.deleterow(tab_1.tabpage_1.dw_12.getrow())
end event

type cb_12 from commandbutton within tabpage_1
integer x = 544
integer y = 600
integer width = 215
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;wf_update1(tab_1.tabpage_1.dw_12, 'N')
end event

type cb_11 from commandbutton within tabpage_1
integer x = 329
integer y = 600
integer width = 215
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;long l_row

l_row = tab_1.tabpage_1.dw_12.insertrow(0)

tab_1.tabpage_1.dw_12.object.user_id[l_row] = gs_userid
tab_1.tabpage_1.dw_12.object.approval_name[l_row] = gs_username + string(l_row)

tab_1.tabpage_1.dw_12.SelectRow(0, FALSE)
tab_1.tabpage_1.dw_12.SelectRow(l_row, TRUE)
end event

type dw_12 from datawindow within tabpage_1
integer x = 23
integer y = 688
integer width = 2606
integer height = 584
integer taborder = 20
string title = "none"
string dataobject = "d_approval_line"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;is_row_name = dwo.name

//this.SelectRow(0, FALSE)
//this.SelectRow(row, TRUE)
end event

event doubleclicked;
if cbx_8.checked = true then	
	cb_14.triggerevent( clicked! )		
end if	
end event

type cb_7 from commandbutton within tabpage_1
integer x = 1641
integer y = 604
integer width = 270
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택"
end type

event clicked;// 결재자 선택
string ls_rank, ls_usernm, ls_userid, ls_team, ls_null
long   ll_row

if isnull(is_user) or is_user = "" then RETURN

setnull(ls_null)
ll_row    = tab_1.tabpage_1.dw_8.getrow()
if ll_row < 1 then return

ls_rank   = tab_1.tabpage_1.dw_8.object.rank[ll_row]
ls_usernm = tab_1.tabpage_1.dw_8.object.user_name[ll_row]
ls_userid = tab_1.tabpage_1.dw_8.object.user_id[ll_row]

choose case is_user
	case "rank1"											/*2020-8-12 jowonsuk 테스트 추가 */
		dw_1.object.rank1[1]   = ls_rank				// 결재자 직위
		dw_1.object.user1[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app1[1] = ls_userid			// 결재자 ID
		dw_6.object.rank1[1]   = ls_rank
		
	case "rank2"
		dw_1.object.rank2[1]   = ls_rank				// 결재자 직위
		dw_1.object.user2[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app2[1] = ls_userid			// 결재자 ID
		dw_6.object.rank2[1]   = ls_rank
		
	case "rank3"
		dw_1.object.rank3[1]   = ls_rank				// 결재자 직위
		dw_1.object.user3[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app3[1] = ls_userid			// 결재자 ID
		dw_6.object.rank3[1]   = ls_rank

	case "rank4"
		dw_1.object.rank4[1]   = ls_rank				// 결재자 직위
		dw_1.object.user4[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app4[1] = ls_userid			// 결재자 ID
		dw_6.object.rank4[1]   = ls_rank

	case "rank5"
		dw_1.object.rank5[1]   = ls_rank				// 결재자 직위
		dw_1.object.user5[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app5[1] = ls_userid			// 결재자 ID
		dw_6.object.rank5[1]   = ls_rank

	case "rankh", "userh"	//협조
		dw_1.object.rankh[1]   = ls_rank				// 결재자 직위
		dw_1.object.userh[1]   = ls_usernm			// 결재자 이름
		dw_1.object.tr_apph[1] = ls_userid			// 결재자 ID
		
		if dw_1.object.tr_type[1] = "DO" then
			SELECT team_code INTO :ls_team FROM login WHERE user_id = :ls_userid;
			dw_1.object.tr_hyupteam[1] = LeftA(ls_team,1) + "0000"	// 협조부서
		end if		
		
	case "rankh1", "userh1"	//협조1
		dw_1.object.rankh1[1]   = ls_rank				// 결재자 직위
		dw_1.object.userh1[1]   = ls_usernm			// 결재자 이름
		dw_1.object.tr_apph1[1] = ls_userid			// 결재자 ID
		
		if dw_1.object.tr_type[1] = "DO" then
			SELECT team_code INTO :ls_team FROM login WHERE user_id = :ls_userid;
			dw_1.object.tr_hyupteam[1] = LeftA(ls_team,1) + "0000"	// 협조부서
		end if			
	case "rankh2", "userh2"	//협조2
		dw_1.object.rankh2[1]   = ls_rank				// 결재자 직위
		dw_1.object.userh2[1]   = ls_usernm			// 결재자 이름
		dw_1.object.tr_apph2[1] = ls_userid			// 결재자 ID
		
		if dw_1.object.tr_type[1] = "DO" then
			SELECT team_code INTO :ls_team FROM login WHERE user_id = :ls_userid;
			dw_1.object.tr_hyupteam[1] = LeftA(ls_team,1) + "0000"	// 협조부서
		end if			
	
end choose

tab_1.visible = false

end event

type dw_8 from datawindow within tabpage_1
integer x = 1175
integer width = 1019
integer height = 596
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_oidcgroup_member"
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;// 결재자 선택
string ls_rank, ls_usernm, ls_userid, ls_team, ls_null
long   ll_row

if cbx_8.checked  then
	setnull(ls_null)
	ll_row    = tab_1.tabpage_1.dw_8.getrow()
	if ll_row < 1 then return
	
	ls_rank   = tab_1.tabpage_1.dw_8.object.rank[ll_row]
	ls_usernm = tab_1.tabpage_1.dw_8.object.user_name[ll_row]
	ls_userid = tab_1.tabpage_1.dw_8.object.user_id[ll_row]
	
	if is_row_name = 'user_name1' then
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), is_row_name, ls_usernm)
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'approval1', ls_userid)	
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'rank1', ls_rank)
	elseif is_row_name = 'user_name2' then
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), is_row_name, ls_usernm)
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'approval2', ls_userid)		
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'rank2', ls_rank)		
	elseif is_row_name = 'user_name3' then
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), is_row_name, ls_usernm)
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'approval3', ls_userid)		
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'rank3', ls_rank)		
	elseif is_row_name = 'user_name4' then
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), is_row_name, ls_usernm)
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'approval4', ls_userid)		
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'rank4', ls_rank)		
	elseif is_row_name = 'user_name5' then
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), is_row_name, ls_usernm)
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'approval5', ls_userid)		
		tab_1.tabpage_1.dw_12.SetItem ( tab_1.tabpage_1.dw_12.getrow(), 'rank5', ls_rank)		
	end if	
else
	cb_7.triggerevent( clicked! )	
end if

end event

type tv_1 from treeview within tabpage_1
event begindrag pbm_tvnbegindrag
event clicked pbm_tvnclicked
event doubleclicked pbm_tvndoubleclicked
integer x = 23
integer width = 1147
integer height = 596
integer taborder = 60
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

type cb_8 from commandbutton within tabpage_1
integer x = 1925
integer y = 604
integer width = 270
integer height = 76
integer taborder = 30
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

type cb_9 from commandbutton within tabpage_1
integer x = 1179
integer y = 604
integer width = 453
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "결재자 삭제"
end type

event clicked;// 결재자 삭제
string ls_rank, ls_usernm, ls_userid, ls_null
long   ll_row

setnull( ls_null )
if isnull(is_user) or is_user = "" then RETURN

ls_rank   = ""
ls_usernm = ""
ls_userid = ""

choose case is_user
	case "rank1"									 // 2020-08-12 jowonsuk 테스트 추가
		dw_1.object.rank1[1]   = ls_rank		// 결재자 직위
		dw_1.object.user1[1]   = ls_usernm	// 결재자 이름
		dw_1.object.tr_app1[1] = ls_null  	// 결재자 ID
		dw_6.object.rank1[1]   = ls_rank
		
	case "rank2"
		dw_1.object.rank2[1]   = ls_rank		// 결재자 직위
		dw_1.object.user2[1]   = ls_usernm	// 결재자 이름
		dw_1.object.tr_app2[1] = ls_null  	// 결재자 ID
		dw_6.object.rank2[1]   = ls_rank
		
	case "rank3"
		dw_1.object.rank3[1]   = ls_rank		// 결재자 직위
		dw_1.object.user3[1]   = ls_usernm	// 결재자 이름
		dw_1.object.tr_app3[1] = ls_null  	// 결재자 ID
		dw_6.object.rank3[1]   = ls_rank

	case "rank4"
		dw_1.object.rank4[1]   = ls_rank		// 결재자 직위
		dw_1.object.user4[1]   = ls_usernm	// 결재자 이름
		dw_1.object.tr_app4[1] = ls_null  	// 결재자 ID
		dw_6.object.rank4[1]   = ls_rank

	case "rank5"
		dw_1.object.rank5[1]   = ls_rank		// 결재자 직위
		dw_1.object.user5[1]   = ls_usernm	// 결재자 이름
		dw_1.object.tr_app5[1] = ls_null  	// 결재자 ID
		dw_6.object.rank5[1]   = ls_rank

	case "rankh"
		dw_1.object.rankh[1]   = ls_rank		// 결재자 직위
		dw_1.object.userh[1]   = ls_usernm	// 결재자 이름
		dw_1.object.tr_apph[1] = ls_null  	// 결재자 ID
end choose

tab_1.visible = false

end event

type cb_10 from commandbutton within tabpage_1
boolean visible = false
integer x = 27
integer y = 644
integer width = 1147
integer height = 72
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "매출이관이월_결재라인수정"
end type

event clicked;// 결재자 변경
string ls_transno, ls_rank, ls_usernm, ls_userid, ls_team, ls_null
long   ll_row

if isnull(is_user) or is_user = "" then RETURN

// 문서번호
ls_transno = dw_1.object.trans_no[1]
if isnull(ls_transno) or ls_transno = "" then RETURN

setnull(ls_null)
ll_row    = tab_1.tabpage_1.dw_8.getrow()
if ll_row < 1 then return

ls_rank   = tab_1.tabpage_1.dw_8.object.rank[ll_row]
ls_usernm = tab_1.tabpage_1.dw_8.object.user_name[ll_row]
ls_userid = tab_1.tabpage_1.dw_8.object.user_id[ll_row]

choose case is_user
	case "rank2"
		dw_1.object.rank2[1]   = ls_rank				// 결재자 직위
		dw_1.object.user2[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app2[1] = ls_userid			// 결재자 ID
		dw_6.object.rank2[1]   = ls_rank
		
      UPDATE dotrans SET tr_app2 = :ls_userid WHERE trans_no = :ls_transno AND tr_appdt2 IS NULL;
		if sqlca.sqlcode <> 0 then
			COMMIT;
			MessageBox("확인","결재자2 수정되었습니다.")
		end if
		
	case "rank3"
		dw_1.object.rank3[1]   = ls_rank				// 결재자 직위
		dw_1.object.user3[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app3[1] = ls_userid			// 결재자 ID
		dw_6.object.rank3[1]   = ls_rank

      UPDATE dotrans SET tr_app3 = :ls_userid WHERE trans_no = :ls_transno AND tr_appdt3 IS NULL;
		if sqlca.sqlcode <> 0 then
			COMMIT;
			MessageBox("확인","결재자3 수정되었습니다.")
		end if

	case "rank4"
		dw_1.object.rank4[1]   = ls_rank				// 결재자 직위
		dw_1.object.user4[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app4[1] = ls_userid			// 결재자 ID
		dw_6.object.rank4[1]   = ls_rank

      UPDATE dotrans SET tr_app4 = :ls_userid WHERE trans_no = :ls_transno AND tr_appdt4 IS NULL;
		if sqlca.sqlcode <> 0 then
			COMMIT;
			MessageBox("확인","결재자4 수정되었습니다.")
		end if

	case "rank5"
		dw_1.object.rank5[1]   = ls_rank				// 결재자 직위
		dw_1.object.user5[1]   = ls_usernm + "인"	// 결재자 이름
		dw_1.object.tr_app5[1] = ls_userid			// 결재자 ID
		dw_6.object.rank5[1]   = ls_rank

      UPDATE dotrans SET tr_app5 = :ls_userid WHERE trans_no = :ls_transno AND tr_appdt5 IS NULL;
		if sqlca.sqlcode <> 0 then
			COMMIT;
			MessageBox("확인","결재자5 수정되었습니다.")
		end if

	case "rankh", "userh"
		dw_1.object.rankh[1]   = ls_rank				// 결재자 직위
		dw_1.object.userh[1]   = ls_usernm			// 결재자 이름
		dw_1.object.tr_apph[1] = ls_userid			// 결재자 ID
		
		if dw_1.object.tr_type[1] = "DO" then
			SELECT team_code INTO :ls_team FROM login WHERE user_id = :ls_userid;
			dw_1.object.tr_hyupteam[1] = LeftA(ls_team,1) + "0000"	// 협조부서
		end if		

      UPDATE dotrans SET tr_apph = :ls_userid WHERE trans_no = :ls_transno AND tr_apph IS NULL;
		if sqlca.sqlcode <> 0 then
			COMMIT;
			MessageBox("확인","협조자 수정되었습니다.")
		end if
end choose

tab_1.visible = false

end event

type pb_del from picturebutton within w_oidotrans_m
integer x = 4942
integer y = 300
integer width = 155
integer height = 116
integer taborder = 280
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;// 줄 삭제
if dw_1.rowcount() < 1 then RETURN

if dw_1.object.cc_flag[1] = "1" then
else
	dw_5.deleterow( dw_5.getrow() )     
end if

end event

type dw_9 from datawindow within w_oidotrans_m
integer x = 192
integer y = 1152
integer width = 1403
integer height = 912
integer taborder = 190
boolean bringtotop = true
string title = "출고송장"
string dataobject = "d_oidotrans_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_datawindow = "dw_9"
/////////////////////////////////////////////////////////////////////////////////
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
/////////////////////////////////////////////////////////////////////////////////
this.setfocus()

end event

event getfocus;//
//this.Object.DataWindow.Color = rgb(255,255,255)
//this.Object.DataWindow.Color = rgb(255,255,0)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255,255,255)
//this.Object.DataWindow.Color = rgb(255,255,0)

end event

type cb_4 from commandbutton within w_oidotrans_m
integer x = 3589
integer y = 136
integer width = 485
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "송장 가져오기"
end type

event clicked;//
long   ll_row, ll_cnt, ll_found, ll_dupcnt
string ls_custno, ls_dono, ls_null

setnull(ls_null)

if dw_1.object.cc_flag[1] = "1" then
	MessageBox("확인","결재완료 되었습니다.")
	RETURN
end if

if dw_9.rowcount() > 0 then
	if dw_9.object.tot_cnt[1] < 1 then
		MessageBox("확인","대상 출고번호를 먼저 선택하시기 바랍니다.")
		RETURN
	end if
end if

ls_custno = dw_1.object.fcust_no[1]

for ll_row = 1 to dw_9.rowcount()
	if dw_9.object.cc_check[ll_row] = "Y" then		
		ls_dono = dw_9.object.do_no[ll_row]
		
		if isnull(ls_dono) OR ls_dono = "" then
		else
			ll_found = dw_5.Find("do_no = '" + ls_dono + "'", 1, dw_5.RowCount())
			if ll_found > 0 then		// 출고번호 중복
				dw_9.object.cc_check[ll_row] = "N"
				ll_dupcnt = ll_dupcnt + 1
			else
				ll_cnt = dw_5.insertrow(0)     
			
				dw_5.object.trans_no[ll_cnt]   = dw_1.object.trans_no[1]
				dw_5.object.seq_no[ll_cnt]     = ll_cnt
				dw_5.object.do_date[ll_cnt]    = dw_9.object.tr_date[ll_row]
				dw_5.object.do_no[ll_cnt]      = dw_9.object.do_no[ll_row]
				dw_5.object.trans_amt[ll_cnt]  = dw_9.object.trans_amt[ll_row]
				dw_5.object.bigo[ll_cnt]       = ls_null
				dw_5.object.cust_no[ll_cnt]    = ls_custno		// dw_9.object.cust_no[ll_row]
				dw_5.object.scene_code[ll_cnt] = dw_9.object.spot_code[ll_row]
			end if
		end if
	end if
next

if ll_dupcnt > 0 then
	MessageBox("확인","출고번호 " + string(ll_dupcnt,"#,##0") + " 건이 중복되었습니다.")
else
	cbx_3.checked = false
	cbx_3.triggerevent( clicked! )
	cbx_3.enabled = false
	dw_9.visible  = false
	this.enabled  = false
end if

dw_5.enabled = true
dw_5.getchild("scene_code",idwc_scene)		// 현장명
idwc_scene.SetTransObject(SQLCA)
idwc_scene.Retrieve( ls_custno )

dw_5.object.scene_code.protect  = false	// 현장
dw_5.object.trans_amt.protect   = false	// 금액
dw_5.object.bigo.protect        = false	// 비고		

end event

type cbx_3 from checkbox within w_oidotrans_m
integer x = 69
integer y = 336
integer width = 224
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
string text = "전체"
end type

event clicked;// 전체선택
long   ll_row
string ls_chk

for ll_row = 1 to dw_9.rowcount()
	if this.checked = true then
		ls_chk = "Y"
	else
		ls_chk = "N"
	end if
	
	dw_9.object.cc_check[ll_row] = ls_chk
next

end event

type cbx_5 from checkbox within w_oidotrans_m
integer x = 3945
integer y = 304
integer width = 393
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "협조결재"
boolean checked = true
end type

event clicked;// 협조결재
string ls_rankh, ls_apph, ls_userh

if dw_1.object.cc_flag[1] = "1" then
	RETURN
end if

// 협조결재 
SELECT '승인', a.user_id, a.user_name
INTO :ls_rankh,	:ls_apph, :ls_userh
FROM login a
WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자' AND use_yn = 'Y');

if cbx_5.checked = true then
	dw_1.object.rankh[1]		= ls_rankh
	dw_1.object.tr_apph[1]	= ls_apph
	dw_1.object.userh[1]		= ls_userh
else
	ls_rankh = ""
	ls_apph = "" 
	ls_userh = ""

	dw_1.object.rankh[1]		= ls_rankh 
	dw_1.object.tr_apph[1]	= ls_apph
	dw_1.object.userh[1]		= ls_userh
end if

// 협조결재 1
SELECT '승인', a.user_id, a.user_name
INTO :ls_rankh,	:ls_apph, :ls_userh
FROM login a
WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자1' AND use_yn = 'Y');

if cbx_5.checked = true then
	dw_1.object.rankh1[1]	= ls_rankh
	dw_1.object.tr_apph1[1]	= ls_apph
	dw_1.object.userh1[1] = ls_userh
else
	ls_rankh = "" 
	ls_apph = ""  
	ls_userh = ""

	dw_1.object.rankh1[1]	= ls_rankh 
	dw_1.object.tr_apph1[1]	= ls_apph
	dw_1.object.userh1[1]	= ls_userh
end if

// 협조결재 2
ls_rankh = "" 
ls_apph = ""  
ls_userh = ""	
SELECT '승인', a.user_id, a.user_name
INTO :ls_rankh,	:ls_apph, :ls_userh
FROM login a
WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자2' AND use_yn = 'Y');

if cbx_5.checked = true then
	dw_1.object.rankh2[1]	= ls_rankh
	dw_1.object.tr_apph2[1]	= ls_apph
	dw_1.object.userh2[1]	= ls_userh
else
	dw_1.object.rankh2[1]	= ''
	dw_1.object.tr_apph2[1]	= ''
	dw_1.object.userh2[1]	= ''
end if
end event

type cbx_all from checkbox within w_oidotrans_m
integer x = 2903
integer y = 16
integer width = 375
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "전체보기"
end type

type cb_6 from commandbutton within w_oidotrans_m
integer x = 3589
integer y = 48
integer width = 485
integer height = 88
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "여신현황"
end type

event clicked;// 여신현황
gs_where        lstr_where
string ls_cust_no, ls_cust_name
long   ll_row

ll_row  = dw_3.getrow()
if isnull(ll_row) or ll_row < 1 then RETURN

ls_cust_no   = dw_3.object.fcust_no[ll_row]
ls_cust_name = dw_3.object.fcust_name[ll_row]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
OpenWithParm( w_whopeom_w, lstr_where )

end event

type rb_1 from radiobutton within w_oidotrans_m
integer x = 1673
integer y = 64
integer width = 398
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "매출이관"
end type

event clicked;// 거래처이관
pb_insert.triggerevent( clicked! )


end event

type rb_2 from radiobutton within w_oidotrans_m
integer x = 1673
integer y = 116
integer width = 398
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "매출이월"
boolean checked = true
end type

event clicked;// 출고이월
pb_insert.triggerevent( clicked! )

end event

type rb_3 from radiobutton within w_oidotrans_m
integer x = 1673
integer y = 168
integer width = 398
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "현장변경"
end type

event clicked;// 현장변경
pb_insert.triggerevent( clicked! )

end event

type dw_5 from datawindow within w_oidotrans_m
event keydown pbm_dwnkey
integer x = 2217
integer y = 1736
integer width = 2903
integer height = 372
integer taborder = 230
string title = "none"
string dataobject = "d_oidotrans_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keydown;// 비고에서 Tab -> Enter키로 변경
//if key = KeyTab! then 
long   ll_row

ll_row = this.getrow()
if ( keyflags = 0 AND key = KeyEnter! ) then
	choose case this.getcolumnname()
		case "price"

			this.setcolumn("calc_amt")
			this.setfocus()
			
		case "calc_amt"

			this.setcolumn("calc_rate")
			this.setfocus()

		case "calc_rate"

			this.setcolumn("rem")
			this.setfocus()

		case "rem"

			this.accepttext()
			this.insertrow(0)

			if this.getrow() <> this.rowcount() then
				scrolltorow(this.getrow() + 1)
				this.setcolumn("scene_code")
			end if
	end choose
elseif key = KeyTab! then //key = KeyEnter! 로 작업 중 setcolumn 밀리는 현상 발생하여 조정함
	choose case this.getcolumnname()
	case "rem"

			this.accepttext()
			this.insertrow(0)

			if this.getrow() <> this.rowcount() then
				scrolltorow(this.getrow() + 1)
				this.setcolumn("scene_code")
			end if
	end choose
end if


end event

event itemchanged;//string ls_scenecode
//long   ll_row
//
//choose case dwo.name
//	case "scene_code"		
//		this.setcolumn("price")
//		this.setfocus()
//	case "price"		
//		this.setcolumn("calc_amt")
//		this.setfocus()
//	case "calc_amt"		
//		this.setcolumn("calc_rate")
//		this.setfocus()
//end choose
//
end event

event getfocus;//
//this.Object.DataWindow.Color = rgb(255,255,255)
//this.Object.DataWindow.Color = rgb(255,255,0)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255,255,255)
//this.Object.DataWindow.Color = rgb(255,255,0)

end event

event clicked;//
is_datawindow = "dw_5"
/////////////////////////////////////////////////////////////////////////////////
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
/////////////////////////////////////////////////////////////////////////////////
this.setfocus()

end event

event rowfocuschanged;//
string ls_dono

if isnull(currentrow) or currentrow < 1 then RETURN

ls_dono = this.object.do_no[currentrow]
if isnull(ls_dono) or ls_dono = "" then RETURN

if cbx_4.checked = true then
	dw_2.visible = true
	dw_2.retrieve( ls_dono )
else
	dw_2.visible = false
end if


end event

type dw_6 from datawindow within w_oidotrans_m
integer x = 2217
integer y = 2108
integer width = 2903
integer height = 684
integer taborder = 290
string title = "none"
string dataobject = "d_oidotrans_m3"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event losefocus;//
this.Object.DataWindow.Color = rgb(255,255,255)
//this.Object.DataWindow.Color = rgb(255,255,0)

end event

event getfocus;//
//this.Object.DataWindow.Color = rgb(255,255,255)
//this.Object.DataWindow.Color = rgb(255,255,0)

end event

type dw_10 from datawindow within w_oidotrans_m
integer x = 498
integer y = 12
integer width = 128
integer height = 100
integer taborder = 240
boolean bringtotop = true
string title = "자재납품서"
string dataobject = "d_oidotrans_r"
boolean livescroll = true
end type

type cbx_6 from checkbox within w_oidotrans_m
integer x = 690
integer y = 252
integer width = 489
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "자재납품확인서"
end type

type rb_4 from radiobutton within w_oidotrans_m
integer x = 1673
integer y = 220
integer width = 398
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "주요업무"
end type

event clicked;
// 주요업무
pb_insert.triggerevent( clicked! )

end event

type cbx_4 from checkbox within w_oidotrans_m
integer x = 2994
integer y = 304
integer width = 695
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "출고내역 상세보기"
end type

event clicked;//
string ls_dono
long   ll_row

ll_row = dw_5.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_dono = dw_5.object.do_no[ll_row]
if isnull(ls_dono) OR ls_dono = "" then RETURN

if this.checked = true then
	dw_2.x  = dw_1.x
	dw_2.y  = dw_1.y
	dw_2.width  = dw_1.width
	dw_2.height = dw_1.height
	dw_2.BringToTop = TRUE
	dw_2.retrieve( ls_dono )
	dw_2.visible    = true
	st_vertical.visible = false
else
	dw_2.reset()
	dw_2.visible    = false
	st_vertical.visible = true
end if

end event

type dw_11 from datawindow within w_oidotrans_m
integer x = 494
integer y = 1348
integer width = 686
integer height = 400
integer taborder = 300
boolean bringtotop = true
string title = "기반영된 송장내역"
string dataobject = "d_oidotrans_exists"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_7 from checkbox within w_oidotrans_m
integer x = 4576
integer y = 244
integer width = 549
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "결재반영 송장보기"
end type

event clicked;//
string ls_custno, ls_scene, ls_sdate, ls_edate
long   ll_row

if this.checked = true then
	dw_11.visible = true
else
	dw_11.visible = false
end if

ll_row    = dw_3.getrow()
ls_custno = dw_3.object.fcust_no[ll_row]
ls_scene  = "%"	

if isnull( ls_custno ) or ls_custno = "" then
	RETURN
end if

if isnull( ls_scene ) or ls_scene = "" then
	RETURN
end if

ls_sdate = em_1.text
ls_edate = em_2.text

dw_11.object.cc_check.visible = false
dw_11.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, "N" )

end event

type cbx_msg from checkbox within w_oidotrans_m
integer x = 96
integer y = 252
integer width = 571
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "작성메시지 안보기"
end type

type st_vertical from u_splitbar_vertical within w_oidotrans_m
integer x = 2199
integer y = 456
integer height = 2336
boolean bringtotop = true
end type

type rb_all from radiobutton within w_oidotrans_m
integer x = 2912
integer y = 92
integer width = 224
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "전체"
end type

event clicked;// 
pb_retrieve.PostEvent( clicked! )

end event

type rb_topno from radiobutton within w_oidotrans_m
integer x = 3154
integer y = 92
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "미승인"
end type

event clicked;// 
pb_retrieve.PostEvent( clicked! )

end event

type rb_topyes from radiobutton within w_oidotrans_m
integer x = 3154
integer y = 156
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "승인완료"
end type

event clicked;// 
pb_retrieve.PostEvent( clicked! )

end event

type ddlb_op from dropdownlistbox within w_oidotrans_m
integer x = 1038
integer y = 316
integer width = 302
integer height = 500
integer taborder = 350
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

type gb_5 from groupbox within w_oidotrans_m
integer x = 2871
integer y = 12
integer width = 663
integer height = 232
integer taborder = 310
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

