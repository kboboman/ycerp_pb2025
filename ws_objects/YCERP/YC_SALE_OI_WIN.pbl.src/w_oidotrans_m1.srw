$PBExportHeader$w_oidotrans_m1.srw
$PBExportComments$거래처 이관관리
forward
global type w_oidotrans_m1 from w_inheritance
end type
type em_1 from editmask within w_oidotrans_m1
end type
type em_2 from editmask within w_oidotrans_m1
end type
type dw_3 from datawindow within w_oidotrans_m1
end type
type st_3 from statictext within w_oidotrans_m1
end type
type ddlb_fld from dropdownlistbox within w_oidotrans_m1
end type
type ddlb_dwtitles from dropdownlistbox within w_oidotrans_m1
end type
type st_4 from statictext within w_oidotrans_m1
end type
type sle_value from singlelineedit within w_oidotrans_m1
end type
type cb_1 from commandbutton within w_oidotrans_m1
end type
type cb_2 from commandbutton within w_oidotrans_m1
end type
type cb_3 from commandbutton within w_oidotrans_m1
end type
type cb_5 from commandbutton within w_oidotrans_m1
end type
type pb_1 from picturebutton within w_oidotrans_m1
end type
type st_1 from statictext within w_oidotrans_m1
end type
type cbx_1 from checkbox within w_oidotrans_m1
end type
type st_6 from statictext within w_oidotrans_m1
end type
type st_7 from statictext within w_oidotrans_m1
end type
type dw_4 from datawindow within w_oidotrans_m1
end type
type gb_4 from groupbox within w_oidotrans_m1
end type
type pb_add from picturebutton within w_oidotrans_m1
end type
type cbx_2 from checkbox within w_oidotrans_m1
end type
type dw_7 from datawindow within w_oidotrans_m1
end type
type tab_1 from tab within w_oidotrans_m1
end type
type tabpage_1 from userobject within tab_1
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
cb_7 cb_7
dw_8 dw_8
tv_1 tv_1
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
end type
type tab_1 from tab within w_oidotrans_m1
tabpage_1 tabpage_1
end type
type pb_del from picturebutton within w_oidotrans_m1
end type
type dw_9 from datawindow within w_oidotrans_m1
end type
type cb_4 from commandbutton within w_oidotrans_m1
end type
type cbx_3 from checkbox within w_oidotrans_m1
end type
type cbx_5 from checkbox within w_oidotrans_m1
end type
type cbx_all from checkbox within w_oidotrans_m1
end type
type cb_6 from commandbutton within w_oidotrans_m1
end type
type rb_1 from radiobutton within w_oidotrans_m1
end type
type rb_2 from radiobutton within w_oidotrans_m1
end type
type rb_3 from radiobutton within w_oidotrans_m1
end type
type st_vertical from statictext within w_oidotrans_m1
end type
type dw_5 from datawindow within w_oidotrans_m1
end type
type dw_6 from datawindow within w_oidotrans_m1
end type
type dw_10 from datawindow within w_oidotrans_m1
end type
type cbx_6 from checkbox within w_oidotrans_m1
end type
type rb_4 from radiobutton within w_oidotrans_m1
end type
type cbx_4 from checkbox within w_oidotrans_m1
end type
type dw_11 from datawindow within w_oidotrans_m1
end type
type cbx_7 from checkbox within w_oidotrans_m1
end type
type ddlb_op from dropdownlistbox within w_oidotrans_m1
end type
end forward

global type w_oidotrans_m1 from w_inheritance
integer y = 112
integer width = 5193
integer height = 2924
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
st_vertical st_vertical
dw_5 dw_5
dw_6 dw_6
dw_10 dw_10
cbx_6 cbx_6
rb_4 rb_4
cbx_4 cbx_4
dw_11 dw_11
cbx_7 cbx_7
ddlb_op ddlb_op
end type
global w_oidotrans_m1 w_oidotrans_m1

type variables
st_print i_print
string  is_user, is_apply, is_datawindow
DataWindowChild idwc_cust, idwc_cust1, idwc_cust2, idwc_scene, idwc_scene1, idwc_scene2, idwc_sales1, idwc_sales2

boolean ib_applyCancel

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
string	ls_user1, ls_user2, ls_user3, ls_user4, ls_user5, ls_userh	// 이름
string	ls_teamnm, ls_balteam, ls_hyupteam, ls_hyundt
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

on w_oidotrans_m1.create
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
this.st_vertical=create st_vertical
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_10=create dw_10
this.cbx_6=create cbx_6
this.rb_4=create rb_4
this.cbx_4=create cbx_4
this.dw_11=create dw_11
this.cbx_7=create cbx_7
this.ddlb_op=create ddlb_op
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
this.Control[iCurrent+34]=this.st_vertical
this.Control[iCurrent+35]=this.dw_5
this.Control[iCurrent+36]=this.dw_6
this.Control[iCurrent+37]=this.dw_10
this.Control[iCurrent+38]=this.cbx_6
this.Control[iCurrent+39]=this.rb_4
this.Control[iCurrent+40]=this.cbx_4
this.Control[iCurrent+41]=this.dw_11
this.Control[iCurrent+42]=this.cbx_7
this.Control[iCurrent+43]=this.ddlb_op
end on

on w_oidotrans_m1.destroy
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
destroy(this.st_vertical)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_10)
destroy(this.cbx_6)
destroy(this.rb_4)
destroy(this.cbx_4)
destroy(this.dw_11)
destroy(this.cbx_7)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

/////////////////////////////////////////////////////////////////////////////////
// The following lines are for setting up the resizing service
/////////////////////////////////////////////////////////////////////////////////
st_vertical.visible = true		// BUG 연구대상

if st_vertical.visible = false then
else
	idrg_Vertical[1] = dw_3
	idrg_Vertical[2] = dw_1
	
	// Set the color of the bars to make them invisible
	il_HiddenColor = This.BackColor
	st_Vertical.BackColor = il_HiddenColor
	
	wf_ResizeBars()	// Resize Bars
	wf_ResizePanels()	// Resize the panels
end if
/////////////////////////////////////////////////////////////////////////////////

dw_3.SetTransObject(SQLCA)		// 문서목록
dw_4.SetTransObject(SQLCA)		// 출력양식
dw_5.SetTransObject(SQLCA)		// 문서상세
dw_6.SetTransObject(SQLCA)		// 결재자비고
dw_7.SetTransObject(SQLCA)		// 조직도
tab_1.tabpage_1.dw_8.SetTransObject(SQLCA)		// 조직도(팀원)
dw_9.SetTransObject(SQLCA)		// 출고송장
dw_10.SetTransObject(SQLCA)	// 자재납품확인서
dw_11.SetTransObject(SQLCA)	// 결재반영된 송장들

dw_2.visible  = false	// 송장상세
dw_4.visible  = false	// 프린트
dw_7.visible  = false	// 조직도
dw_9.visible  = false	// 출고송장
dw_10.visible = false	// 자재납품확인서
dw_11.visible = false

cbx_6.visible = false   // 자재납품확인서
cb_4.enabled  = false	// 출고송장 가져오기
cbx_3.visible = false	// 전체선택
tab_1.visible = false 	// 조직도

// 매출이관이월 작업구분별 당월누계금액이(ii_amount) 초과할 경우는 회장님 결재
// YCEIS, YCALARM 프로그램에서 금액 체크함
SELECT isnull(sort,0) INTO :ii_amount FROM codemst with(nolock)
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
  FROM LOGIN;
	  
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
dw_3.height = newheight - 484

st_vertical.height = dw_3.height

dw_1.x      = dw_3.width + 64
dw_1.width  = newwidth  - 1742

dw_5.x      = dw_3.width + 64
dw_5.width  = newwidth  - 1742
dw_5.height = dw_3.height - dw_1.height - dw_6.height

dw_6.x      = dw_3.width + 64
dw_6.y      = dw_5.y + dw_5.height
dw_6.width  = newwidth  - 1742


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

wf_ResizeBars()	// Resize Bars
wf_ResizePanels()	// Resize the panels

end event

type pb_save from w_inheritance`pb_save within w_oidotrans_m1
integer x = 4704
integer y = 68
integer taborder = 50
end type

event pb_save::clicked;call super::clicked;///////////////////////////////////////////////////////////////////////
// 저장단계(2014/04/01) 결재로직 재정립 필요함
///////////////////////////////////////////////////////////////////////
// 결재방 DoubleClicked 만들어진 데이터 만들어 결재조건에 따라 점검 후
// 저장함
///////////////////////////////////////////////////////////////////////

boolean  lb_minus
string	ls_transno, ls_itemno, ls_qa, ls_qa_cust, ls_uom, ls_magamyn, ls_yyyymm
string	ls_custno,  ls_rem, ls_app1
string   ls_rem1, ls_rem2, ls_rem3, ls_rem4, ls_rem5, ls_dctype, ls_trapp3

long		ll_row, ll_dw3_row, ll_oi_no, ll_seq_no, ll_ship_qty, ll_price, ll_rate_cash, ll_cnt, ll_stock_qty
date		ld_date
datetime ldt_date
decimal  ld_totAmount, ld_totprice, ld_applyAMT
string   ls_apply, ls_applyend, ls_ccflag, ls_trtype, ls_sdate, ls_edate, ls_dberror, ls_runid

setnull( ldt_date )

dw_1.accepttext()
dw_5.accepttext()
if dw_1.rowcount() < 1 then RETURN

ls_sdate = em_1.text
ls_edate = em_2.text

// 매출이관이월결재_실행자
SELECT item_cd INTO :ls_runid FROM codemst WHERE type = '매출이관이월결재_실행자' AND use_yn = 'Y';
if isnull(ls_runid) or ls_runid = "" then
	MessageBox("확인","매출이관이월결재_실행자 를 찾을 수 없습니다다.")
	RETURN
end if

//////////////////////////////////////////////////////////////////
// 문서내용
//////////////////////////////////////////////////////////////////
ls_trtype   = dw_1.object.tr_type[1] 			// MOVE: 이관, NEXT: 이월, SPOT: 현장, DO: 송장
ls_custno   = dw_1.object.fcust_no[1]
ls_transno  = dw_1.object.trans_no[1]
ld_totprice = dw_1.object.tr_transamt[1]	// 문서금액

if isnull(ls_trtype) or ls_trtype = "" then
	MessageBox('확인','작업구분이 누락 되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("tr_type")
	dw_1.setfocus()
	RETURN
end if

if isnull(ls_custno) or ls_custno = "" then
	MessageBox('확인','변경전 거래처가 누락 되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("fcust_no")
	dw_1.setfocus()
	RETURN
end if

// 변경전 대표자명
if isnull(dw_1.object.fcaptain_name[1]) or dw_1.object.fcaptain_name[1] = "" then
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

// 작성중인 문서
ls_ccflag = dw_1.object.cc_flag[1]
if ls_ccflag = "0" then
	if gs_userid = dw_1.object.user_id[1] then
	else
		MessageBox("확인","현재 기안자가 작성중인 문서입니다.")
		RETURN	
	end if
end if

choose case ls_trtype
	case "MOVE" 		// 거래처이관
		if isnull(dw_1.object.tcust_no[1]) or dw_1.object.tcust_no[1] = "" then
			MessageBox('확인','이관대상 거래처가 누락 되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
			dw_1.setcolumn("tcust_no")
			dw_1.setfocus()
			RETURN
		else
			if isnull(dw_1.object.tspot_code[1]) or dw_1.object.tspot_code[1] = "" then
				MessageBox('확인','이관대상 현장이 누락 되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
				dw_1.setcolumn("tspot_code")
				dw_1.setfocus()
				RETURN
			end if
		end if
		
	case "NEXT" 		// 매출이월
		if isnull(dw_1.object.tcust_no[1]) or dw_1.object.tcust_no[1] = "" then
		else
			dw_1.object.tcust_no[1] = ""
			if isnull(dw_1.object.tspot_code[1]) or dw_1.object.tspot_code[1] = "" then
			else
				dw_1.object.tspot_code[1] = ""
			end if
		end if

	case "SPOT" 		// 현장변경
		if isnull(dw_1.object.tcust_no[1]) or dw_1.object.tcust_no[1] = "" then
			MessageBox('확인','변경후 거래처가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
			dw_1.setcolumn("tcust_no")
			dw_1.setfocus()
			RETURN
		end if
	
		if isnull(dw_1.object.tspot_code[1]) or dw_1.object.tspot_code[1] = ""  then
			MessageBox('확인','변경후 현장이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
			dw_1.setcolumn("tspot_code")
			dw_1.setfocus()
			RETURN
		end if

	case "DO" // 주요업무(출고수정)
		for ll_row = 1 to 5
			ls_apply  = dw_1.GetItemString( 1, "tr_app" + string(ll_row) )
			if isnull(ls_apply) or ls_apply = "" then
			else
				ll_cnt = ll_cnt + 1
			end if
		next
		if ll_cnt < 2 then
			MessageBox("확인","주요업무 문서의 필수 결재자는 2명 이상으로 설정해야 합니다.")
			RETURN	
		end if
		
		if isnull(dw_1.object.tr_apph[1]) or dw_1.object.tr_apph[1] = "" then
			MessageBox("확인","주요업무 문서는 협조자를 반드시 선택해야 합니다.")
			RETURN	
		end if
		
		if isnull(dw_1.object.tcust_no[1]) or dw_1.object.tcust_no[1] = "" then
		else
			dw_1.object.tcust_no[1] = ""
			if isnull(dw_1.object.tspot_code[1]) or dw_1.object.tspot_code[1] = "" then
			else
				dw_1.object.tspot_code[1] = ""
			end if
		end if

	case else
		MessageBox("확인저장","문서종류가 설정되지 않았습니다.")
		RETURN	
end choose
//////////////////////////////////////////////////////////////////

debugbreak()

setnull(ls_applyend)
setnull(ld_applyAMT)

// 작업자의 권한과, 결재금액
// 매출이관이월_결재자 -> 매출이관이월_본부장 -> 매출이관이월_팀장
SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
  FROM codemst 
 WHERE TYPE = '매출이관이월_결재자' AND use_yn = 'Y' AND item_cd = :gs_userid;
if ls_applyend = "" or isnull(ls_applyend) then
	SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
	  FROM codemst 
	 WHERE TYPE = '매출이관이월_본부장' AND use_yn = 'Y' AND item_cd = :gs_userid;
	if ls_applyend = "" or isnull(ls_applyend) then
		SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
		  FROM codemst 
		 WHERE TYPE = '매출이관이월_팀장' AND use_yn = 'Y' AND item_cd = :gs_userid;
		if ls_applyend = "" or isnull(ls_applyend) then
			SELECT bigo, isnull(sort,0) INTO :ls_applyend, :ld_applyAMT 
			  FROM codemst 
			 WHERE TYPE = '매출이관이월_협조자' AND use_yn = 'Y' AND item_cd = :gs_userid;
		end if
	end if
end if


if ls_applyend = "매출이관이월_본부장" then
	ls_trapp3 = dw_1.object.tr_app3[1] 		// 매출이관이월_본부장
else
	ls_trapp3 = dw_1.object.tr_app3[1] 		// 매출이관이월_본부장
end if
SELECT isnull(sort,0) INTO :ld_applyAMT FROM codemst 
 WHERE TYPE = '매출이관이월_본부장' AND use_yn = 'Y' AND item_cd = :ls_trapp3;


//////////////////////////////////////////////////////////////////
//  당월 이관/이월 총금액 계산하기
//////////////////////////////////////////////////////////////////
SELECT isnull(sum(trans_amt), 0) INTO :ld_totAmount
  FROM dotransdet b
       LEFT OUTER JOIN dotrans a ON a.trans_no = b.trans_no
 WHERE b.cust_no   = :ls_custno 
   AND a.tr_type   = :ls_trtype
	AND a.trans_no <> :ls_transno
	AND a.apply_end = 'Y'
   AND b.do_date   BETWEEN :ls_sdate and :ls_edate;

ld_totAmount = ld_totAmount + ld_totprice		// 거래처 당월누계 금액
//////////////////////////////////////////////////////////////////

if ld_totprice < 0 then
	lb_minus = true
else
	lb_minus = false
end if

if gs_userid = "TOP" then
else
	if ld_totAmount > 10000000 then				// 거래처 당월누계 금액이 본부장 권한 이상인 경우
		// is_apply
		if dw_1.object.tr_app5[1] <> "TOP" then
			if (dw_1.object.tr_type[1] = "NEXT" and dw_1.object.tr_ewolfix[1] = "Y") OR &
			   (dw_1.object.tr_type[1] = "DO"    or dw_1.object.tr_type[1] = "SPOT" ) then
				// 매출이월 이면서 이월고정업체, 주요업무, 현장변경 은 본부장 전결처리함, 주요문서 담당자전결
			else			
				dw_1.object.tr_app5[1]   = "TOP"
				dw_1.object.user5[1]     = "조용선인"
				dw_1.object.tr_appdt5[1] = ldt_date
				
				MessageBox('확인','거래처 당월 총 결재금액이 10,000,000원 이상으로~n~n회장님 결재사항 입니다. 확인하여 주십시요.',Stopsign!)
				dw_1.setcolumn("tr_app5")
				dw_1.setfocus()
				RETURN
			end if
		end if
	end if
	
	if dw_1.object.tr_type[1] = "DO" or dw_1.object.tr_type[1] = "SPOT" then	// 주요업무, 현장변경
		// 금액체크 안함
	else
		if ld_totprice > ld_applyAMT then	// 문서금액이 결재자 금액 초과시
			if	ib_applyCancel = true then
			else
				// 매출이월 + 이월고정업체는 본부장 전결처리함
				if dw_1.object.tr_type[1] = "NEXT" and dw_1.object.tr_ewolfix[1] = "Y" then
					if MessageBox("확인", "총금액이 " + string(ld_totprice, "#,###0") + " 입니다.~n~n" + &
									  "매출이월 고정업체는 본부장 전결입니다. 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
						RETURN
					end if		
				else
					if ld_totprice > 10000000 then
						if MessageBox("확인", "문서 총금액이 " + string(ld_totprice, "#,###0") + " 입니다.~n~n" + &
										  "회장님 결재 사항으로 다시한번 확인바랍니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
							RETURN
						end if
					else
						if MessageBox("확인", "문서 총금액이 " + string(ld_totprice, "#,###0") + " 입니다.~n~n" + &
										  "본부장 결재 사항으로 다시한번 확인바랍니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
							RETURN
						end if
					end if
				end if		
			end if		
		else
			if ld_totprice < 0 then
				choose case is_apply
					case "user5"
						if ld_totprice * -1 > 50000 then
							if ls_applyend = "매출이관이월_본부장" then
							else
								dw_1.object.tr_appdt5[1] = ldt_date
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
	end if		// 금액체크안함
end if

//////////////////////////////////////////////////////////////////
// DOTRANS 체크
//////////////////////////////////////////////////////////////////
ld_date = date(dw_1.object.tr_date[1])

if string(ld_date,"yyyy/mm/dd") > string(gf_today(),"yyyy/mm/dd") then
	MessageBox('확인','매출이관이월 기준일자는 ' + string(gf_today(),"yyyy/mm/dd") + ' 까지 입니다.',Stopsign!)
	dw_1.setcolumn("tr_date")
	dw_1.setfocus()
//	RETURN
end if

ls_yyyymm = string(dw_1.object.tr_date[1],"yyyymm")
SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '00';
if ls_magamyn <> "N" then
	MessageBox('확인','해당년월은 마감되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("tr_date")
	dw_1.setfocus()
	return
end if

if isnull(ld_date) then
	MessageBox('확인','매출이관이월 기준일자가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("tr_date")
	dw_1.setfocus()
	RETURN
end if

if isnull(dw_1.object.fcust_no[1]) then
	MessageBox('확인','거래처가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("fcust_no")
	dw_1.setfocus()
	RETURN
end if

if isnull(dw_1.object.tr_content[1]) then
	MessageBox('확인','변경사유가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
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
		MessageBox('확인','출고번호 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("do_no")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.cust_no[ll_row]) then
		MessageBox('확인','거래처가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("cust_no")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.scene_code[ll_row]) then
		MessageBox('확인','현장이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("scene_code")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.trans_amt[ll_row]) then
		MessageBox('확인','출고금액이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("trans_amt")
		dw_5.setfocus()
		RETURN
	end if

	if isnull(dw_5.object.do_date[ll_row]) then
		MessageBox('확인','출고일자가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		//dw_5.setcolumn("do_date")
		dw_5.setfocus()
		RETURN
	end if
next
//////////////////////////////////////////////////////////////////

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_transno = dw_1.object.trans_no[1]
if isNULL(ls_transno) or ls_transno = "" then	// 신규모드
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
		if MessageBox("일자변경","매출이관이월 기준일자를 변경 하시겠습니까?",Exclamation!, YesNo!, 2) = 2 then
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
	
// 등록과 동시에 본인결재
ls_app1 = dw_1.object.tr_app1[1]
if isnull(ls_app1) then ls_app1 = ""

if ls_app1 = "" then
	dw_1.object.tr_appdt2[1] = Date(gdt_today)
else
	if dw_1.object.cc_flag[1] = "0" then	// 작성중
		dw_1.object.tr_appdt1[1] = Date(gdt_today)
	else
		if is_apply = "user1" then
			dw_1.object.tr_appdt1[1] = ldt_date
		end if
	end if
end if

//////////////////////////////////////////////////////////////////
// dw_1: HEAD, dw_5: DETAIL
//////////////////////////////////////////////////////////////////
if wf_update2( dw_1, dw_5, "Y") = true then
	UPDATE DOTRANS
	   SET tr_rem1 = :ls_rem1, tr_rem2 = :ls_rem2
		  , tr_rem3 = :ls_rem3, tr_rem4 = :ls_rem4, tr_rem5 = :ls_rem5
	 WHERE trans_no  = :ls_transno;
	if sqlca.sqlcode <> 0 then
		COMMIT;
	end if
	
	// 메시지 전송
	if is_apply = "user5" or is_apply = "userh" then
		if dw_1.object.apply_end[1] = "Y" then
			choose case dw_1.object.tr_type[1]		// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
				case "SPOT"
					ls_dberror = "[종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
									 "매출이관이월_현장이관 문서종결 되었습니다."
					INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
					COMMIT;
	
				case "DO"
					ls_dberror = "[종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
									 "매출이관이월_주요업무 문서종결 되었습니다."
					INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
					COMMIT;
	
				case "MOVE", "NEXT"
					ls_dberror = "[협조종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
									 "매출이관이월 문서종결 되었습니다."
					INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
					COMMIT;
			end choose
		else
			choose case dw_1.object.tr_type[1]		// 문서종류(MOVE:이관, NEXT:이월, SPOT:현장, DO:출고수정)
				case "SPOT"
					ls_dberror = "[종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
									 "매출이관이월_현장이관 문서취소 되었습니다."
					INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
					COMMIT;				
									 
				case "DO"
					if is_apply = "userh" then
						ls_dberror = "[종결]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
										 "매출이관이월_주요업무 문서취소 되었습니다."
						INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
						COMMIT;				
					end if
								
				case "MOVE", "NEXT"
					if is_apply = "userh" then						
						if isnull(dw_1.object.tr_appdth[1]) then 
							ls_dberror = "[협조취소]문서번호: " + ls_transno + "총금액: " + string(ld_totprice,"#,##0") + "~n~n" + &
											 "매출이관이월 문서취소 되었습니다."
							INSERT INTO SYSMSG (flogin, tlogin, msgdate, msg, del) VALUES (:gs_userid, :ls_runid, getdate(), :ls_dberror,'N');	
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

type dw_1 from w_inheritance`dw_1 within w_oidotrans_m1
integer x = 1701
integer y = 456
integer width = 3419
integer height = 1280
integer taborder = 0
string dataobject = "d_oidotrans_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::clicked;call super::clicked;//
string ls_apply

if isnull(row) or this.RowCount() < 1 then RETURN

ls_apply = this.object.cc_flag[1]
if isnull(ls_apply) OR ls_apply = "" then RETURN

if ls_apply = "0" then
	choose case dwo.name
		case "rank2", "rank3", "rank4", "userh"
			is_user  = dwo.name		// 결재라인 변경대상
			if MessageBox("확인","결재라인을 변경 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
				return
			else
				// 결재자 선택
				tab_1.tabpage_1.cb_9.enabled  = true		// 결재자 삭제
				tab_1.tabpage_1.cb_7.enabled  = true		// 선택
				tab_1.tabpage_1.cb_10.enabled = false		// 매출이관이월_결재라인수정

				tab_1.visible = true
				tab_1.tabpage_1.tv_1.setfocus()
			end if
	end choose
else
	if GF_Permission("매출이관이월_결재라인수정", gs_userid) = "Y" then
		choose case dwo.name
			case "rank2"
				if Not isnull(dw_1.object.tr_appdt2[1]) then RETURN
				
			case "rank3"
				if Not isnull(dw_1.object.tr_appdt3[1]) then RETURN

			case "rank4"
				if Not isnull(dw_1.object.tr_appdt4[1]) then RETURN

			case "userh"
				if Not isnull(dw_1.object.tr_appdth[1]) then RETURN
		end choose
		
		choose case dwo.name
			case "rank2", "rank3", "rank4", "userh"
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
this.AcceptText()

choose case dwo.name
	case "user1", "user2", "user3", "user4", "user5", "userh"
		
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

	case "fcust_no"											// 변정전 거래처
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
				//cbx_4.checked = true
				//cbx_4.triggerevent( clicked! )
				dw_1.object.tr_ewolfix[1] = ls_ewoltrans		// 이월고정업체
			end if
		end if
		
		dw_1.object.tr_content[1]    = ls_content		
end choose

end event

event dw_1::rbuttondown;call super::rbuttondown;//
string ls_date, ls_apply

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
// 결재단계
///////////////////////////////////////////////////////////////////////
// 결재조건에 따른 결재방 데이터 만들어 주고
// pb_save Event 최종결재 함
///////////////////////////////////////////////////////////////////////
integer ll_cnt, ll_totcnt
long   ll_row, ll_rowsave
long   ll_apply		// 본인위치
long   ll_appcnt		// 클릭위치
string ls_apply,  ls_applyid, ls_applynm, ls_applyend, ls_appdt5, ls_applydt		// 결재자 정보
string ls_custno, ls_sceneno, ls_dono, ls_invoice, ls_transno, ls_dberror			// 출고번호
string ls_null,   ls_applyend_save, ls_title, ls_ccflag, ls_ewoltrans
string ls_trtype, ls_sdate,   ls_edate, ls_userid

datetime ldt_appdt, ldt_null
decimal  ld_totAmount, ld_totprice, ld_applyAMT
boolean  lb_chk

setnull(ldt_null) ; setnull(ls_null)
///////////////////////////////////////
ib_applyCancel = false
///////////////////////////////////////

//////////////////////////////////////////////////////////
// 결재자 아니면 RETURN
//////////////////////////////////////////////////////////
lb_chk = false
for ll_cnt = 1 to 6
	if ll_cnt = 6 then
		ls_userid = dw_1.getitemstring( 1, "tr_apph" )			
	else
		ls_userid = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )			
	end if
	
	if ls_userid = gs_userid then 
		lb_chk = true
		exit
	end if
next
if lb_chk = false then RETURN
//////////////////////////////////////////////////////////


choose case dwo.name
	case "user1"
		ll_appcnt = 1
	case "user2"
		ll_appcnt = 2
	case "user3"
		ll_appcnt = 3
	case "user4"
		ll_appcnt = 4
	case "user5"
		ll_appcnt = 5
end choose

// 작성중인 문서
ls_ccflag = dw_1.object.cc_flag[1]
if ls_ccflag = "0" then
	if gs_userid = dw_1.object.user_id[1] then
	else
		MessageBox("확인","현재 기안자가 작성중인 문서입니다.")
		RETURN	
	end if
end if

// 결재공난을 클릭한 경우
if ll_appcnt > 0 AND ll_appcnt < 6 then
	ls_applynm = dw_1.getitemstring( 1, "user" + string(ll_appcnt) )			
	if isnull(ls_applynm) or ls_applynm = "" then RETURN	
end if

// 매출이관이월_결재자 -> 매출이관이월_본부장 -> 매출이관이월_팀장
SELECT bigo, sort INTO :ls_applyend, :ld_applyAMT FROM codemst 
 WHERE TYPE = '매출이관이월_결재자' AND use_yn = 'Y' AND item_cd = :gs_userid;
if ls_applyend = "" or isnull(ls_applyend) then
	SELECT bigo, sort INTO :ls_applyend, :ld_applyAMT FROM codemst 
	 WHERE TYPE = '매출이관이월_본부장' AND use_yn = 'Y' AND item_cd = :gs_userid;
	if ls_applyend = "" or isnull(ls_applyend) then
		SELECT bigo, sort INTO :ls_applyend, :ld_applyAMT FROM codemst 
		 WHERE TYPE = '매출이관이월_팀장' AND use_yn = 'Y' AND item_cd = :gs_userid;
		if ls_applyend = "" or isnull(ls_applyend) then
			SELECT bigo, sort INTO :ls_applyend, :ld_applyAMT FROM codemst 
			 WHERE TYPE = '매출이관이월_협조자' AND use_yn = 'Y' AND item_cd = :gs_userid;
		end if
	end if
end if

ls_transno  = this.object.trans_no[row]			// 문서번호
ld_totprice = dec(this.object.tr_transamt[row])	// 문서금액

ls_applyend_save = ls_applyend		// 권한 SAVE
if ls_applyend_save = "매출이관이월_본부장" then
	//////////////////////////////////////////////////////////////////
	//  당월 이관/이월 총금액 체크하기
	//////////////////////////////////////////////////////////////////
	ls_sdate = em_1.text
	ls_edate = em_2.text
	
	ls_trtype  = dw_1.object.tr_type[1] 			// MOVE: 이관, NEXT: 이월, SPOT:현장, DO: 송장
	ls_custno  = dw_1.object.fcust_no[1]
   ls_transno = dw_1.object.trans_no[1]
	
	if isnull(ls_trtype) or ls_trtype = "" then
		MessageBox('확인','작업구분이 누락 되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_1.setcolumn("tr_type")
		dw_1.setfocus()
		RETURN
	end if
	
	if isnull(ls_custno) or ls_custno = "" then
		MessageBox('확인','변경전 거래처가 누락 되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_1.setcolumn("fcust_no")
		dw_1.setfocus()
		RETURN
	end if
	
	//////////////////////////////////////////////////////////////////
	SELECT SUM(trans_amt) INTO :ld_totAmount
	  FROM dotransdet b
			 LEFT OUTER JOIN dotrans a ON a.trans_no = b.trans_no
	 WHERE b.cust_no   = :ls_custno 
		AND a.tr_type   = :ls_trtype
		AND a.trans_no <> :ls_transno
      AND a.apply_end = 'Y'
		AND b.do_date   BETWEEN :ls_sdate and :ls_edate;
	//////////////////////////////////////////////////////////////////
	if isnull(ld_totAmount) then ld_totAmount = 0
	//////////////////////////////////////////////////////////////////	
	ld_totAmount = ld_totAmount + ld_totprice				// 거래처 누계금액 + 문서금액
	ld_totAmount = dw_3.object.tamt[dw_3.getrow()]		// 문서당 누계금액
	//////////////////////////////////////////////////////////////////	
end if
SELECT rank INTO :ls_title FROM login WHERE user_id = :gs_userid;

// 결재자 전결체크
is_apply  = dwo.name 
choose case is_apply
	case "user1", "user2", "user3", "user4", "user5"
		ls_apply  = dw_1.GetItemString( 1, "tr_app" + string(ll_appcnt) )
		ldt_appdt = dw_1.GetItemDateTime( 1, "tr_appdt" + string(ll_appcnt) )
		
	case "userh"
		ls_apply  = dw_1.GetItemString( 1, "tr_apph" )
		ldt_appdt = dw_1.GetItemDateTime( 1, "tr_appdth" )
end choose


if gs_userid = "TOP" then
else
	if dw_1.object.tr_type[1] = "SPOT" OR dw_1.object.tr_type[1] = "DO" then	// 현장이관, 주요업무
		// 담당자 전결
	else
		if gs_userid = ls_apply then							// 로긴자와 결재칸이 동일하고
			if isnull(ldt_appdt) then							// 미결상태
				if ld_totAmount > ii_amount then				// 누계금액이 매출이관이월_최종결재자_금액 초과한 경우
					if (dw_1.object.tr_type[1] = "NEXT" and dw_1.object.tr_ewolfix[1] = "Y") then		// 이월고정업체
						if ls_applyend_save = "매출이관이월_본부장" then	// 로긴자가 본부장이면
							if is_apply = "user5" then								// 전결 처리함
							else
								MessageBox("확인","전결처리 대상문서 입니다. '결재자5' 을 클릭하시기 바랍니다.")
								RETURN
							end if
						else
							// 팀장, 작성자
						end if
					else
						// 
					end if
				else
					if ld_totprice <= ld_applyAMT then		// 문서금액이 결재 권한별 한도액보다 작거나 같으면
						if	ld_totprice < 0 then					// 문서금액이 마이너스 금액이고
							if ld_totprice * -1 <= ld_applyAMT then		// 문서금액(음수)이 권한별 한도액이면
								// 마이너스 금액도 체크함
								MessageBox("확인","전결처리 대상문서 입니다. '결재자5' 을 클릭하시기 바랍니다.")
								RETURN
							end if
						else											// 문서금액이 양수이면
							if dwo.name = "userh" then			// 협조자 클릭한 경우는 SKIP
							else
								MessageBox("확인","전결처리 대상문서 입니다. '결재자5' 을 클릭하시기 바랍니다.")
								RETURN
							end if
						end if
					end if
				end if
			end if
		else			// 로긴자와 결재자 정보가 다른경우
			if isnull(ldt_appdt) then							// 결재자 미결인 경우
				if dw_1.object.tr_type[row] = "NEXT" and dw_1.object.tr_ewolfix[row] = "Y" then
					// 매출이월 고정업체이면 본부장 전결처리함
				else
					if ld_totprice > ld_applyAMT then		// 문서금액이 권한금액 초과한 경우
						MessageBox("확인","전결처리 대상문서가 아닙니다.")
						RETURN
					end if
				end if
			end if
		end if
	end if
end if

// 상급자 미결인 경우 결재취소 가능 
choose case dwo.name
	case "user1"
		if gs_userid = dw_1.object.tr_app1[row] then
			if isnull(dw_1.object.tr_appdt2[row]) then
				if isnull(dw_1.object.tr_appdt1[row]) then
					dw_1.object.tr_appdt1[row] = gf_today()
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						ib_applyCancel = true
						dw_1.object.tr_appdt1[row]	= ldt_null  	// 화면처리
					end if
				end if			
				
				/////////////////////////////////////////////
				pb_save.triggerevent( clicked! )		// 저장
				/////////////////////////////////////////////
			else
				MessageBox("확인","결재자2 결재완료 되었습니다.")
			end if
		end if
		
	case "user2"
		if gs_userid = dw_1.object.tr_app2[row] then
			if isnull(dw_1.object.tr_appdt3[row]) then
				if isnull(dw_1.object.tr_appdt2[row]) then
					dw_1.object.tr_appdt2[row] = gf_today()
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						ib_applyCancel = true
						dw_1.object.tr_appdt2[row]	= ldt_null  	// 화면처리
					end if
				end if
				
				/////////////////////////////////////////////
				pb_save.triggerevent( clicked! )		// 저장
				/////////////////////////////////////////////
			else
				MessageBox("확인","결재자3 결재완료 되었습니다.")
			end if
		end if
		
	case "user3"
		if gs_userid = dw_1.object.tr_app3[row] then
			if isnull(dw_1.object.tr_appdt4[row]) then
				if isnull(dw_1.object.tr_appdt3[row]) then
					dw_1.object.tr_appdt3[row] = gf_today()
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						ib_applyCancel = true
						dw_1.object.tr_appdt3[row]	= ldt_null  	// 화면처리
					end if
				end if
				
				/////////////////////////////////////////////
				pb_save.triggerevent( clicked! )		// 저장
				/////////////////////////////////////////////
			else
				MessageBox("확인","결재자4 결재완료 되었습니다.")
			end if
		end if
		
	case "user4"
		if gs_userid = dw_1.object.tr_app4[row] then
			if isnull(dw_1.object.tr_appdt5[row]) then
				if isnull(dw_1.object.tr_appdt4[row]) then
					dw_1.object.tr_appdt4[row] = gf_today()					
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						ib_applyCancel = true
						dw_1.object.tr_appdt4[row]	= ldt_null  	// 화면처리
					end if
				end if
				
				/////////////////////////////////////////////
				pb_save.triggerevent( clicked! )		// 저장
				/////////////////////////////////////////////
			else
				MessageBox("확인","결재자5 결재완료 되었습니다.")
			end if
		end if

	case "userh"	// 협조자
		if gs_userid = dw_1.object.tr_apph[row] then
			if isnull(dw_1.object.tr_appdt5[row]) then
				MessageBox("확인","결재자5 미결재 문서입니다.")
				RETURN
			else
				if isnull(dw_1.object.tr_appdth[row]) then
					dw_1.object.tr_appdth[row] = gf_today()					
					dw_1.object.apply_end[row] = "Y"
				else
					if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
						RETURN
					else
						// 매출이관 최종승인 후 "거래명세서 수정/삭제" 에서 작업처리 완료되면
						// 기 등록된(이관/이월) 송장번호와 상이한 번호로 변경 처리됨
						// 등록된 번호 출고송장 번호가 존재하면 "협조취소" 가능함
						ll_cnt = 0 ; ll_totcnt = 0
						for ll_row = 1 to dw_5.rowcount()
							ls_dono = dw_5.object.do_no[ll_row]
							if isnull(ls_dono) or ls_dono = "" then
								MessageBox("확인","거래명세서 수정/삭제 작업처리가 완료되었습니다.")
								RETURN
							else
								SELECT count(*) INTO :ll_cnt FROM do WHERE do_no = :ls_dono;
								if isnull(ll_cnt) or ll_cnt = 0 then
								else
									ll_totcnt = ll_totcnt + ll_cnt
								end if
							end if
						next
						if ll_totcnt <> dw_5.rowcount() then
							MessageBox("확인","거래명세서 수정/삭제 작업처리가 완료되었습니다. 취소불가")
							RETURN
						end if
							
						ib_applyCancel = true
						dw_1.object.tr_appdth[row]	= ldt_null  	// 화면처리
						dw_1.object.apply_end[row] = ls_null
					end if
				end if
				
				/////////////////////////////////////////////
				pb_save.triggerevent( clicked! )		// 저장
				/////////////////////////////////////////////
			end if
		end if

	case "user5", "p_rank5"
      //////////////////////////////////////////////////////////////////////////
		// [전결] 매출이관이월 은 본부장 (ld_applyAMT)원, 팀장 5만원까지 결재가능
      //////////////////////////////////////////////////////////////////////////
		if ls_applyend = "매출이관이월_본부장" then
			if ld_totprice <= ld_applyAMT then
				ls_applyend = "최종결재자"
			else
				// 매출이월 인 경우 이월고정업체이면 본부장 전결처리함
				if dw_1.object.tr_type[row] = "NEXT" and dw_1.object.tr_ewolfix[row] = "Y" then
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
			if dw_1.object.tr_type[1] = "SPOT" then
				ls_applyend = "최종결재자"
			end if
		end if

		if dw_1.object.tr_type[1] = "DO" then		// 주요업무
			ls_applyend = "최종결재자"
		end if
		
      //////////////////////////////////////////////////////////////////////////		
		
		if LeftA(ls_applyend,10) = "최종결재자" then
			ls_applydt = string(dw_1.object.tr_appdt5[row],"yyyymmdd")
			
			if isnull(ls_applydt) or ls_applydt = "" then	// 미결
				ls_applynm  = MidA(gs_username,1,4) + CharA(13) + MidA(gs_username,5,2) + "인"
				dw_1.object.user5[row]      = ls_applynm		// 결재인
				dw_1.object.tr_app5[row]    = gs_userid		// 결재자5 ID
				dw_1.object.tr_appdt5[row]  = gf_today()		// 결재자5 처리
				
				if dw_1.object.tr_app5[row] = "TOP" then
					dw_1.object.apply_end[row] = "Y"				// 종결

					dw_1.object.tr_apph[row]	= ls_null  	   // 협조제거
					dw_1.object.tr_appdth[row]	= ldt_null  	// 협조제거
				else
					dw_1.object.apply_end[row] = ls_null		// 미결
				end if

				if GF_PERMISSION("매출이관이월_현장이관", gs_userid) = "Y" then
					if dw_1.object.tr_type[1] = "SPOT" then
						dw_1.object.apply_end[row] = "Y"				// 종결
	
						dw_1.object.tr_apph[row]	= ls_null  	   // 협조제거
						dw_1.object.tr_appdth[row]	= ldt_null  	// 협조제거
					end if
				end if
			// 결재취소	
			else															
				if isnull(dw_1.object.tr_appdth[row]) then  	// 협조미결
				else
					MessageBox("확인","협조 종결된 문서입니다.")
					RETURN
				end if
				
				if MessageBox("확인","결재를 취소 하시겠습니까?",question!,YesNo!,2) = 2 then
					RETURN
				end if
				
				if isnull(dw_1.object.tr_appdth[row]) then  	// 협조미결
					ib_applyCancel = true
					dw_1.object.tr_app5[row]   = "TOP"			// 최종결재 
					dw_1.object.tr_appdt5[row]	= ldt_null  	// 결재취소
					dw_1.object.apply_end[row] = ls_null		// 진행중
					
					if dw_1.object.tr_type[1] = "DO" then		// 주요업무
					else
						// 협조자 원복
						string ls_rankh, ls_apph, ls_userh
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

				if GF_PERMISSION("매출이관이월_현장이관", gs_userid) = "Y" then
					if dw_1.object.tr_type[1] = "SPOT" then
						dw_1.object.apply_end[row] = ls_null		// 종결
	
						dw_1.object.tr_apph[row]	= ls_null  	   // 협조제거
						dw_1.object.tr_appdth[row]	= ldt_null  	// 협조제거
					end if
				end if
				
				if dw_1.object.tr_type[1] = "DO" then		// 주요문서
					dw_1.object.apply_end[row] = ls_null		// 종결
				end if
			end if
				
			/////////////////////////////////////////////
			pb_save.triggerevent( clicked! )		// 저장
			/////////////////////////////////////////////
		else
			MessageBox("확인","최종결재 권한이 존재하지 않습니다.")
			RETURN
		end if
end choose

end event

event dw_1::getfocus;call super::getfocus;//
//this.Object.DataWindow.Color = rgb(255,255,255)
//this.Object.DataWindow.Color = rgb(255,255,0)

end event

event dw_1::losefocus;call super::losefocus;//
this.Object.DataWindow.Color = rgb(255,255,255)
//this.Object.DataWindow.Color = rgb(255,255,0)

end event

event dw_1::retrieveend;call super::retrieveend;//
is_app5 = this.object.tr_app5[1]

end event

type st_title from w_inheritance`st_title within w_oidotrans_m1
integer x = 50
integer y = 40
integer width = 1554
string text = "거래명세서 이관/이월/변경"
end type

type st_tips from w_inheritance`st_tips within w_oidotrans_m1
end type

type pb_compute from w_inheritance`pb_compute within w_oidotrans_m1
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidotrans_m1
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

type pb_close from w_inheritance`pb_close within w_oidotrans_m1
integer x = 4896
integer y = 68
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidotrans_m1
integer x = 4512
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

type pb_cancel from w_inheritance`pb_cancel within w_oidotrans_m1
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oidotrans_m1
integer x = 4133
integer y = 68
integer taborder = 110
end type

event pb_delete::clicked;call super::clicked;string	ls_transno, ls_flag
long		ll_cnt

if dw_1.RowCount() < 1 then return

ls_transno = dw_1.Object.trans_no[1]
if isnull(ls_transno) or ls_transno = "" then RETURN

ls_flag = dw_1.Object.cc_flag[1]
if isnull(ls_flag) then ls_flag = "0"	// 신규등록 자료표시

if ls_flag <> "0" then
	MessageBox("확인", "결재가 진행중인 자료입니다.~n~n승인취소 후 다시 진행해 주시기 바랍니다.~n", StopSign!)
	return
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

type pb_insert from w_inheritance`pb_insert within w_oidotrans_m1
integer x = 3941
integer y = 68
integer taborder = 120
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_insert::clicked;call super::clicked;// 
string	ls_app1,  ls_app2,  ls_app3,  ls_app4,  ls_app5,  ls_apph	// ID
string	ls_rank1, ls_rank2, ls_rank3, ls_rank4, ls_rank5, ls_rankh	// 직위
string	ls_user1, ls_user2, ls_user3, ls_user4, ls_user5, ls_userh	// 이름
string	ls_teamnm, ls_applyid, ls_content									// 팀명
string   ls_message, ls_null

long     ll_apply
datetime ldt_null

// 송장 초기화
if dw_9.rowcount() > 0 AND dw_9.visible = true then
	if MessageBox("확인", "출고송장 조회작업을 새로 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
		dw_9.reset()
		dw_9.visible = false
	end if
end if

setnull( ldt_null ) ; setnull( ls_null )

if rb_4.checked = true then	// 주요업무
else
	SELECT count(*) INTO :ll_apply FROM salehp a with(nolock) WHERE a.appyn = 'Y' AND a.user_id  = :gs_userid;
	if ll_apply <> 1 then
		MessageBox("확인","매출이관이월 관리를 작성할 수 없습니다.(영업사원 HP관리 미등록)" )
		RETURN
	end if
end if

dw_2.Reset()	// 송장상세

dw_1.Reset()	// TRANS(화면)
dw_5.Reset()	// TRANSDET(화면)
dw_6.Reset()	// 설명(화면)

cbx_5.enabled = true		// 협조결재

//	화면출력
dw_1.getchild("fcust_no", idwc_cust1)		// 변경전
idwc_cust1.settransobject(sqlca)
idwc_cust1.retrieve( "%" )

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

dw_1.getchild("tcust_no", idwc_cust2)		// 변경후
idwc_cust2.settransobject(sqlca)

dw_1.getchild("tspot_code", idwc_scene2)
idwc_scene2.settransobject(sqlca)
idwc_scene2.retrieve( "%" )

dw_5.getchild("cust_no", idwc_cust)			// 상세
idwc_cust.settransobject(sqlca)
dw_5.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)

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

   dw_1.object.tcust_no.background.color = rgb(254, 252, 175)
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
	cbx_5.checked = false						// 협조결재 안함
	
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

// 결재관련사항
SELECT user1_rank  = a.rank1, user1_id  = a.apply1, user1_name  = isnull(c1.user_name,'')
     , user2_rank  = a.rank2, user2_id  = a.apply2, user2_name  = isnull(c2.user_name,'')
     , user3_rank  = a.rank3, user3_id  = a.apply3, user3_name  = isnull(c3.user_name,'')
     , user4_rank  = a.rank4, user4_id  = a.apply4, user4_name  = isnull(c4.user_name,'')
     , user5_rank  = a.rank5, user5_id  = a.apply5, user5_name  = isnull(c5.user_name,'')
  INTO :ls_rank1, :ls_app1, :ls_user1, :ls_rank2, :ls_app2, :ls_user2, :ls_rank3, :ls_app3, :ls_user3
     , :ls_rank4, :ls_app4, :ls_user4, :ls_rank5, :ls_app5, :ls_user5
  FROM salehp a with(nolock)
       LEFT OUTER JOIN login c1  with(nolock) on a.apply1 = c1.user_id
       LEFT OUTER JOIN login c2  with(nolock) on a.apply2 = c2.user_id
       LEFT OUTER JOIN login c3  with(nolock) on a.apply3 = c3.user_id
       LEFT OUTER JOIN login c4  with(nolock) on a.apply4 = c4.user_id
       LEFT OUTER JOIN login c5  with(nolock) on a.apply5 = c5.user_id
 WHERE a.appyn    = 'Y'
   AND a.user_id  = :gs_userid;
if isnull(ls_rank1) or ls_rank1 = "" then
	SELECT user1_rank  = a.rank,  user1_id  = a.user_id, user1_name  = isnull(a.user_name,'')
		  , user2_rank  = '',      user2_id  = '',        user2_name  = ''
		  , user3_rank  = '',      user3_id  = '',        user3_name  = ''
		  , user4_rank  = '',      user4_id  = '',        user4_name  = ''
		  , user5_rank  = '회장',  user5_id  = 'TOP',    user5_name  = '조용선'
	  INTO :ls_rank1, :ls_app1, :ls_user1, :ls_rank2, :ls_app2, :ls_user2, :ls_rank3, :ls_app3, :ls_user3
		  , :ls_rank4, :ls_app4, :ls_user4, :ls_rank5, :ls_app5, :ls_user5
	  FROM login a with(nolock)
	 WHERE a.user_id  = :gs_userid;
end if

// 주요문서인 경우 발신부서 변경
if dw_1.object.tr_type[1] = "DO" then
	dw_1.object.tr_balteam[1]  = LeftA(gs_team,1) + "0000"	// 발신(영업본부)
end if

// 최종결재자
SELECT a.rank, a.user_id, a.user_name
  INTO :ls_rank5, :ls_app5, :ls_user5   
  FROM login a with(nolock)
 WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_결재자' AND use_yn  = 'Y' AND bigo = '최종결재자');

// 협조자
SELECT '승인', a.user_id, a.user_name
  INTO :ls_rankh,	:ls_apph, :ls_userh
  FROM login a with(nolock)
 WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자' AND use_yn = 'Y');

// 결재자 이름
if ls_user1 <> "" then ls_user1 = ls_user1 + "인"
if ls_user2 <> "" then ls_user2 = ls_user2 + "인"
if ls_user3 <> "" then ls_user3 = ls_user3 + "인"
if ls_user4 <> "" then ls_user4 = ls_user4 + "인"
if ls_user5 <> "" then ls_user5 = ls_user5 + "인"

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
	dw_1.object.rankh[1]	= ls_rankh ; dw_1.object.tr_apph[1]	= ls_apph
	dw_1.object.userh[1] = ls_userh
end if

dw_1.object.fcust_no.protect    = false	// 변경전 거래처
dw_1.object.fspot_code.protect  = false	// 변경전 현장
dw_1.object.tcust_no.protect    = false	// 변경후 거래처
dw_1.object.tspot_code.protect  = false	// 변경후 현장

dw_1.object.tr_date.protect     = false	// 출고일자
dw_1.object.tr_balteam.protect  = false	// 발신부서
dw_1.object.tr_hyupteam.protect = false	// 협조부서

dw_1.object.tr_content.protect  = false	// 본문

if GF_PERMISSION("매출이관이월_현장이관", gs_userid) = "Y" then
	if dw_1.object.tr_type[1] = "SPOT" then
		dw_1.object.apply_end[1] = ls_null		// 종결

		dw_1.object.tr_apph[1]	 = ls_null  	// 협조제거
		dw_1.object.tr_appdth[1] = ldt_null  	// 협조제거
	end if
end if

// 결재자 비고
dw_6.object.rank1[1]   = ls_rank1 ; dw_6.object.rank2[1]   = ls_rank2
dw_6.object.rank3[1]   = ls_rank3 ; dw_6.object.rank4[1]   = ls_rank4
dw_6.object.rank5[1]   = ls_rank5	// 결재설명

// 주요업무 기본결재 삭제함
if dw_1.object.tr_type[1] = "DO" then
	dw_1.object.apply_end[1] = ls_null		// 종결

	dw_1.object.tr_apph[1]	 = ls_null  	// 협조제거
	dw_1.object.tr_appdth[1] = ldt_null  	// 협조제거
	
	// 결재자 직책
	dw_1.object.rank2[1] = "" ; dw_1.object.rank3[1] = "" ; dw_1.object.rank4[1] = ""
	// 결재자 이름
	dw_1.object.user2[1] = "" ; dw_1.object.user3[1] = "" ; dw_1.object.user4[1] = ""
	// 결재자 ID
	dw_1.object.tr_app2[1] = "" ; dw_1.object.tr_app3[1] = "" ; dw_1.object.tr_app4[1] = ""
	// 결재자 비고
	dw_6.object.rank2[1] = "" ; dw_6.object.rank3[1] = "" ; dw_6.object.rank4[1] = ""
end if

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

// 결재난 
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

MessageBox("확인","본문작성시 줄 바꿈은 엔터키로 작업하시기 바랍니다.~n~r~r" + &
           "직책난 2, 3번 결재라인은 클릭하여 변경할 수 있습니다.~n~r~r" + &
			  "1.발생사유와 2.업체현황은 4줄이내 작성 바랍니다. (결재시 안보임)" )

dw_1.setcolumn("tr_date")
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oidotrans_m1
integer x = 3749
integer y = 68
integer taborder = 10
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_custno, ls_sdate, ls_edate, ls_transno, ls_user3, ls_userid, ls_value, ls_applyid, ls_applyend
long   ll_row, ll_cnt
datetime ld_null

setnull( ld_null )

cb_2.triggerevent( clicked! )		// 필터해지

ls_sdate = em_1.text
ls_edate = em_2.text

dw_1.reset() ; dw_2.reset() ; dw_3.reset()
dw_4.reset() ; dw_5.reset() ; dw_6.reset()	// 7,8 조직도
dw_9.reset()

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

ls_userid = gs_userid
if cbx_all.checked = true then	// 전체보기
	ls_userid = "%"
else
	ls_userid = gs_userid	
end if

//dw_3.setredraw( false )
ll_row = dw_3.retrieve( ls_userid, ls_sdate, ls_edate )
//dw_3.setredraw( true )
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
		end choose
	end if
	dw_1.setredraw( true )	
end if
dw_3.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_oidotrans_m1
integer x = 1627
integer y = 12
integer width = 439
integer height = 272
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "작업구분"
end type

type gb_2 from w_inheritance`gb_2 within w_oidotrans_m1
integer x = 2085
integer y = 12
integer width = 782
integer height = 232
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "11일 부터 당월"
end type

type gb_1 from w_inheritance`gb_1 within w_oidotrans_m1
integer x = 2889
integer width = 2231
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidotrans_m1
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

type em_1 from editmask within w_oidotrans_m1
integer x = 2117
integer y = 148
integer width = 352
integer height = 80
integer taborder = 70
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

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oidotrans_m1
integer x = 2482
integer y = 148
integer width = 352
integer height = 80
integer taborder = 70
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

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_oidotrans_m1
event keydown pbm_dwnkey
integer x = 37
integer y = 456
integer width = 1637
integer height = 2336
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_oidotrans_s1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_datawindow = "dw_3"
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

event rowfocuschanged;//
string   ls_transno, ls_userid, ls_applyid, ls_applyend, ls_dono
long     ll_row, ll_cnt, ll_totcnt, ll_tabseq
datetime ld_null
boolean  lb_chk

setnull(ld_null)

dw_3.accepttext()
if dw_3.rowcount() < 1 then RETURN

if isnull(currentrow) or currentrow < 1 or currentrow > dw_3.rowcount() then return

cbx_4.checked = false		// 출고내역 상세보기
cbx_4.triggerevent( clicked! )

dw_3.SetRow(currentrow)
ls_transno = dw_3.object.trans_no[currentrow]		// 문서번호
if isnull(ls_transno) or ls_transno = "" then RETURN

//	화면출력
dw_1.getchild("fcust_no", idwc_cust1)
idwc_cust1.settransobject(sqlca)
dw_1.getchild("fspot_code", idwc_scene1)
idwc_scene1.settransobject(sqlca)
idwc_scene1.retrieve( "%" )
//////////////////////////////////////////////////////////////
idwc_scene1.insertrow(1)
idwc_scene1.setitem(1, "scene_code", "%")
idwc_scene1.setitem(1, "scene_desc", "전체현장")

dw_1.object.fspot_code[1] = "%" // 전체
idwc_scene1.accepttext()
//////////////////////////////////////////////////////////////

dw_1.getchild("tcust_no", idwc_cust2)
idwc_cust2.settransobject(sqlca)
dw_1.getchild("tspot_code", idwc_scene2)
idwc_scene2.settransobject(sqlca)
idwc_scene2.retrieve( "%" )

dw_1.getchild("fsalesman", idwc_sales1)
idwc_sales1.settransobject(sqlca)
dw_1.getchild("tsalesman", idwc_sales2)
idwc_sales2.settransobject(sqlca)

dw_5.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
dw_5.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)

//dw_1.setredraw( false )
dw_1.retrieve( ls_transno )	// 화면
dw_5.retrieve( ls_transno )	// 본문
dw_6.retrieve( ls_transno )	// 결재 특이사항


//////////////////////////////////////////////////////////
// 작성자가 아니면 삭제불가
//////////////////////////////////////////////////////////
if this.object.user_id[currentrow] <> gs_userid then 
	pb_delete.enabled = false
else
	pb_delete.enabled = true
end if

////////////////////////////////////////////////////////////
//// 결재자 아니면 저장불가
////////////////////////////////////////////////////////////
//lb_chk = false
//for ll_cnt = 1 to 6
//	if ll_cnt = 6 then
//		ls_userid = dw_1.getitemstring( 1, "tr_apph" )			
//	else
//		ls_userid = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )			
//	end if
//	if ls_userid = gs_userid then 
//		lb_chk = true
//		exit
//	end if
//next
//pb_save.enabled = lb_chk
////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 상급자 결재상태 체크
//////////////////////////////////////////////////////////
string   ls_field
long     ll_upcheck
datetime ldt_appdt

lb_chk = false
for ll_cnt = 1 to 5
	ls_userid = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )			
	if ls_userid = gs_userid then 
		lb_chk = true
		exit
	end if
next
if lb_chk = true then
	for ll_upcheck = ll_cnt + 1 to 5
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
for ll_cnt = 1 to 5
	ll_tabseq = ll_cnt * 10
	ls_userid = dw_1.getitemstring( 1, "tr_app" + string(ll_cnt) )			
	if ls_userid = gs_userid then 
		dw_1.Modify("rank"     + string(ll_cnt) + ".Protect=0")			
		dw_1.Modify("user"     + string(ll_cnt) + ".Protect=0")			
		dw_1.Modify("tr_appdt" + string(ll_cnt) + ".Protect=0")			
	
		dw_6.Modify("tr_rem"   + string(ll_cnt) + ".Protect=0")			

		dw_1.Modify("rank"     + string(ll_cnt) + ".TabSequence = " + string(ll_tabseq) )
		dw_1.Modify("user"     + string(ll_cnt) + ".TabSequence = " + string(ll_tabseq) )
		dw_1.Modify("tr_appdt" + string(ll_cnt) + ".TabSequence = " + string(ll_tabseq) )

		dw_6.Modify("tr_rem"   + string(ll_cnt) + ".TabSequence = " + string(ll_tabseq) )
	else
		dw_1.Modify("rank"     + string(ll_cnt) + ".Protect=1")			
		dw_1.Modify("user"     + string(ll_cnt) + ".Protect=1")			
		dw_1.Modify("tr_appdt" + string(ll_cnt) + ".Protect=1")			
	
		dw_6.Modify("tr_rem"   + string(ll_cnt) + ".Protect=1")			

		dw_1.Modify("rank"     + string(ll_cnt) + ".TabSequence = 0" )
		dw_1.Modify("user"     + string(ll_cnt) + ".TabSequence = 0" )
		dw_1.Modify("tr_appdt" + string(ll_cnt) + ".TabSequence = 0" )

		dw_6.Modify("tr_rem"   + string(ll_cnt) + ".TabSequence = 0" )
	end if
next

// 협조자 
if gs_userid = dw_1.object.tr_apph[1] then
	dw_1.Modify( "userh.TabSequence = 120" )
else
	dw_1.Modify( "userh.TabSequence = 0" )
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
	end choose
end if

if isnull(dw_1.object.tr_appdt1[1]) then
	cbx_5.enabled = false	// 협조결재
	
	dw_1.object.tr_date.protect = false		// 기준일자
	
	dw_1.object.tcust_no.protect = false
	dw_1.object.tspot_code.protect = false
	dw_1.object.tr_content.protect = false
//	dw_1.object.tcust_no.background.color = rgb(192,192,192)
//	dw_1.object.tspot_code.background.color = rgb(192,192,192)
//	dw_1.object.tr_content.background.color = rgb(192,192,192)

	dw_5.object.bigo.protect = false
else
	cbx_5.enabled = false   // 협조결재
	
	dw_1.object.tr_date.protect = true		// 기준일자

	dw_1.object.tcust_no.protect = true
	dw_1.object.tspot_code.protect = true
	dw_1.object.tr_content.protect = true
//	dw_1.object.tcust_no.background.color = rgb(192,192,192)
//	dw_1.object.tspot_code.background.color = rgb(192,192,192)
//	dw_1.object.tr_content.background.color = rgb(192,192,192)

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
//dw_1.setredraw( true )

this.setfocus()

end event

type st_3 from statictext within w_oidotrans_m1
integer x = 297
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

type ddlb_fld from dropdownlistbox within w_oidotrans_m1
integer x = 475
integer y = 316
integer width = 389
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oidotrans_m1
integer x = 539
integer y = 328
integer width = 219
integer height = 88
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

type st_4 from statictext within w_oidotrans_m1
integer x = 878
integer y = 332
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

type sle_value from singlelineedit within w_oidotrans_m1
integer x = 1349
integer y = 320
integer width = 357
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

type cb_1 from commandbutton within w_oidotrans_m1
integer x = 1714
integer y = 320
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

type cb_2 from commandbutton within w_oidotrans_m1
integer x = 1879
integer y = 320
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

type cb_3 from commandbutton within w_oidotrans_m1
integer x = 2043
integer y = 320
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

type cb_5 from commandbutton within w_oidotrans_m1
integer x = 2208
integer y = 320
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
	arg_dw = dw_3
elseif is_datawindow = "dw_5" then
	arg_dw = dw_5
else
	arg_dw = dw_9
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_oidotrans_m1
event mousemove pbm_mousemove
integer x = 4325
integer y = 68
integer width = 187
integer height = 144
integer taborder = 120
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

type st_1 from statictext within w_oidotrans_m1
integer x = 2117
integer y = 68
integer width = 718
integer height = 76
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

type cbx_1 from checkbox within w_oidotrans_m1
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

type st_6 from statictext within w_oidotrans_m1
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

type st_7 from statictext within w_oidotrans_m1
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

type dw_4 from datawindow within w_oidotrans_m1
integer x = 206
integer y = 12
integer width = 128
integer height = 100
integer taborder = 70
boolean bringtotop = true
string title = "양식"
string dataobject = "d_oidotrans_prt1"
boolean livescroll = true
end type

type gb_4 from groupbox within w_oidotrans_m1
integer x = 37
integer y = 256
integer width = 5083
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type pb_add from picturebutton within w_oidotrans_m1
integer x = 4782
integer y = 300
integer width = 155
integer height = 116
integer taborder = 90
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
else
	ls_custno = dw_1.object.fcust_no[1]
	ls_scene  = dw_1.object.fspot_code[1]

	if isnull( ls_custno ) or ls_custno = "" then
		MessageBox("확인","변경전 거래처를 선택하시기 바랍니다.")
		RETURN
	else
		dw_5.getchild("scene_code",idwc_scene)		// 현장명
		idwc_scene.SetTransObject(SQLCA)
		idwc_scene.Retrieve( ls_custno )
	end if

	if isnull( ls_scene ) or ls_scene = "" then
		MessageBox("확인","변경전 현장를 선택하시기 바랍니다.")
		RETURN
	end if

	ls_sdate = em_1.text
	ls_edate = em_2.text

	cb_4.enabled  = true		// 송장 가져오기
	cbx_3.visible = true		// 전체선택
	dw_9.visible  = true		// 출고송장

debugbreak()

	dw_9.Object.trans_no.Visible = 0		// 숨김
	dw_9.retrieve( ls_custno, ls_scene, ls_sdate, ls_edate, "N" )
	if dw_9.rowcount() < 1 then
		cbx_3.checked = false
		cbx_3.triggerevent( clicked! )
		
		cbx_3.visible = false
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

type cbx_2 from checkbox within w_oidotrans_m1
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

type dw_7 from datawindow within w_oidotrans_m1
integer x = 347
integer y = 12
integer width = 128
integer height = 100
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdteam_h"
boolean livescroll = true
end type

type tab_1 from tab within w_oidotrans_m1
event create ( )
event destroy ( )
integer x = 2331
integer y = 1940
integer width = 2267
integer height = 796
integer taborder = 60
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
integer width = 2231
integer height = 680
long backcolor = 79741120
string text = "조직도(결재라인)"
long tabtextcolor = 128
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_7 cb_7
dw_8 dw_8
tv_1 tv_1
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
end type

on tabpage_1.create
this.cb_7=create cb_7
this.dw_8=create dw_8
this.tv_1=create tv_1
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.Control[]={this.cb_7,&
this.dw_8,&
this.tv_1,&
this.cb_8,&
this.cb_9,&
this.cb_10}
end on

on tabpage_1.destroy
destroy(this.cb_7)
destroy(this.dw_8)
destroy(this.tv_1)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
end on

type cb_7 from commandbutton within tabpage_1
integer x = 1641
integer y = 604
integer width = 270
integer height = 76
integer taborder = 90
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

	case "rankh", "userh"
		dw_1.object.rankh[1]   = ls_rank				// 결재자 직위
		dw_1.object.userh[1]   = ls_usernm			// 결재자 이름
		dw_1.object.tr_apph[1] = ls_userid			// 결재자 ID
		
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
integer taborder = 90
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
integer x = 23
integer width = 1147
integer height = 596
integer taborder = 120
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
integer taborder = 100
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
integer taborder = 100
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
integer x = 23
integer y = 604
integer width = 1147
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
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

type pb_del from picturebutton within w_oidotrans_m1
integer x = 4942
integer y = 300
integer width = 155
integer height = 116
integer taborder = 100
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

type dw_9 from datawindow within w_oidotrans_m1
integer x = 192
integer y = 1152
integer width = 1403
integer height = 912
integer taborder = 80
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

type cb_4 from commandbutton within w_oidotrans_m1
integer x = 2926
integer y = 68
integer width = 485
integer height = 144
integer taborder = 60
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
	cbx_3.visible = false
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

type cbx_3 from checkbox within w_oidotrans_m1
integer x = 55
integer y = 332
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

type cbx_5 from checkbox within w_oidotrans_m1
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
	//MessageBox("확인","결재완료 되었습니다.")
	RETURN
end if

SELECT '승인', a.user_id, a.user_name
  INTO :ls_rankh,	:ls_apph, :ls_userh
  FROM login a
 WHERE user_id = (SELECT item_cd FROM codemst WHERE type = '매출이관이월_협조자' AND use_yn = 'Y');

// 협조결재 
if cbx_5.checked = true then
	dw_1.object.rankh[1]	= ls_rankh ; dw_1.object.tr_apph[1]	= ls_apph
	dw_1.object.userh[1] = ls_userh
else
	ls_rankh = "" ; ls_apph = "" ; ls_userh = ""

	dw_1.object.rankh[1]	= ls_rankh ; dw_1.object.tr_apph[1]	= ls_apph
	dw_1.object.userh[1] = ls_userh
end if

end event

type cbx_all from checkbox within w_oidotrans_m1
integer x = 4402
integer y = 304
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

event clicked;// 전체보기
pb_retrieve.triggerevent( clicked! )

end event

type cb_6 from commandbutton within w_oidotrans_m1
integer x = 3415
integer y = 68
integer width = 315
integer height = 144
integer taborder = 70
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

type rb_1 from radiobutton within w_oidotrans_m1
integer x = 1650
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

type rb_2 from radiobutton within w_oidotrans_m1
integer x = 1650
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

type rb_3 from radiobutton within w_oidotrans_m1
integer x = 1650
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

type st_vertical from statictext within w_oidotrans_m1
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
event mousedown pbm_lbuttondown
integer x = 1673
integer y = 456
integer width = 32
integer height = 2336
string dragicon = "Exclamation!"
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeWE!"
long textcolor = 255
long backcolor = 0
long bordercolor = 273962025
boolean focusrectangle = false
end type

event mousemove;// Check for move in progess
if KeyDown(keyLeftButton!) then This.X = Parent.PointerX()

end event

event mouseup;// Hide the bar
if Not ib_debug Then	This.BackColor = il_hiddencolor

// Resize the panels
wf_ResizePanels()

end event

event mousedown;// mousedown : pbm_lbuttondown
If Not ib_debug Then this.BackColor = 0  //show Bar in Black

end event

type dw_5 from datawindow within w_oidotrans_m1
event keydown pbm_dwnkey
integer x = 1701
integer y = 1736
integer width = 3419
integer height = 372
integer taborder = 90
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

type dw_6 from datawindow within w_oidotrans_m1
integer x = 1701
integer y = 2108
integer width = 3419
integer height = 684
integer taborder = 100
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

type dw_10 from datawindow within w_oidotrans_m1
integer x = 498
integer y = 12
integer width = 128
integer height = 100
integer taborder = 90
boolean bringtotop = true
string title = "자재납품서"
string dataobject = "d_oidotrans_r"
boolean livescroll = true
end type

type cbx_6 from checkbox within w_oidotrans_m1
integer x = 73
integer y = 252
integer width = 498
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

type rb_4 from radiobutton within w_oidotrans_m1
integer x = 1650
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

event clicked;// 주요업무
pb_insert.triggerevent( clicked! )

end event

type cbx_4 from checkbox within w_oidotrans_m1
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
if isnull(ll_row) or ll_row < 1 then RETURN

ls_dono = dw_5.object.do_no[ll_row]
if isnull(ls_dono) or ls_dono = "" then RETURN

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

type dw_11 from datawindow within w_oidotrans_m1
integer x = 494
integer y = 1348
integer width = 686
integer height = 400
integer taborder = 100
boolean bringtotop = true
string title = "기반영된 송장내역"
string dataobject = "d_oidotrans_exists"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_7 from checkbox within w_oidotrans_m1
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

type ddlb_op from dropdownlistbox within w_oidotrans_m1
integer x = 1038
integer y = 312
integer width = 302
integer height = 500
integer taborder = 150
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

