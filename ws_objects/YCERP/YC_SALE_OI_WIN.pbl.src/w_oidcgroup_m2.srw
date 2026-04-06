$PBExportHeader$w_oidcgroup_m2.srw
$PBExportComments$매출할인 관리(다중)
forward
global type w_oidcgroup_m2 from w_inheritance
end type
type em_1 from editmask within w_oidcgroup_m2
end type
type em_2 from editmask within w_oidcgroup_m2
end type
type dw_3 from datawindow within w_oidcgroup_m2
end type
type st_3 from statictext within w_oidcgroup_m2
end type
type ddlb_fld from dropdownlistbox within w_oidcgroup_m2
end type
type ddlb_dwtitles from dropdownlistbox within w_oidcgroup_m2
end type
type st_4 from statictext within w_oidcgroup_m2
end type
type sle_value from singlelineedit within w_oidcgroup_m2
end type
type cb_1 from commandbutton within w_oidcgroup_m2
end type
type cb_2 from commandbutton within w_oidcgroup_m2
end type
type cb_3 from commandbutton within w_oidcgroup_m2
end type
type cb_5 from commandbutton within w_oidcgroup_m2
end type
type pb_1 from picturebutton within w_oidcgroup_m2
end type
type st_1 from statictext within w_oidcgroup_m2
end type
type cb_4 from commandbutton within w_oidcgroup_m2
end type
type cbx_1 from checkbox within w_oidcgroup_m2
end type
type cb_6 from commandbutton within w_oidcgroup_m2
end type
type st_2 from statictext within w_oidcgroup_m2
end type
type st_5 from statictext within w_oidcgroup_m2
end type
type st_6 from statictext within w_oidcgroup_m2
end type
type st_7 from statictext within w_oidcgroup_m2
end type
type dw_4 from datawindow within w_oidcgroup_m2
end type
type dw_6 from datawindow within w_oidcgroup_m2
end type
type gb_4 from groupbox within w_oidcgroup_m2
end type
type pb_add from picturebutton within w_oidcgroup_m2
end type
type cbx_2 from checkbox within w_oidcgroup_m2
end type
type dw_7 from datawindow within w_oidcgroup_m2
end type
type dw_5 from datawindow within w_oidcgroup_m2
end type
type tab_1 from tab within w_oidcgroup_m2
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
type tabpage_1 from userobject within tab_1
cb_7 cb_7
dw_8 dw_8
tv_1 tv_1
cb_8 cb_8
cb_9 cb_9
end type
type tab_1 from tab within w_oidcgroup_m2
tabpage_1 tabpage_1
end type
type pb_del from picturebutton within w_oidcgroup_m2
end type
type rb_1 from radiobutton within w_oidcgroup_m2
end type
type rb_2 from radiobutton within w_oidcgroup_m2
end type
type rb_3 from radiobutton within w_oidcgroup_m2
end type
type rb_4 from radiobutton within w_oidcgroup_m2
end type
type ddlb_op from dropdownlistbox within w_oidcgroup_m2
end type
type gb_5 from groupbox within w_oidcgroup_m2
end type
end forward

global type w_oidcgroup_m2 from w_inheritance
integer y = 112
integer width = 5202
integer height = 2924
string title = "매출할인 관리(거래처)(w_oidcgroup_m)"
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
cb_4 cb_4
cbx_1 cbx_1
cb_6 cb_6
st_2 st_2
st_5 st_5
st_6 st_6
st_7 st_7
dw_4 dw_4
dw_6 dw_6
gb_4 gb_4
pb_add pb_add
cbx_2 cbx_2
dw_7 dw_7
dw_5 dw_5
tab_1 tab_1
pb_del pb_del
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
ddlb_op ddlb_op
gb_5 gb_5
end type
global w_oidcgroup_m2 w_oidcgroup_m2

type variables
st_print i_print
string  is_user
DataWindowChild idwc_cust, idwc_scene, idwc_type

long    il_dragsource, il_dragparent, il_droptarget
long    ih_curteam
integer ii_chk = 0
string  is_chk = 'N'
TreeViewitem itv_team

end variables

forward prototypes
public function string wf_permission (string arg_userid, long arg_sort, string arg_flag)
public function boolean wf_make_team1 (string as_str)
public function boolean wf_make_team (string as_str)
public subroutine wf_print (datawindow arg_dw)
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

public function boolean wf_make_team1 (string as_str);// as_str string boolean
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
				case '1', '7'		// 관리본부, 영업본부
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

public function boolean wf_make_team (string as_str);// as_str  string  value
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

string   ls_groupno, ls_cust_name, ls_scene_name, ls_dcdate, ls_username
string	ls_app1,  ls_app2,  ls_app3,  ls_app4,  ls_app5,  ls_apph	// ID
string	ls_rank1, ls_rank2, ls_rank3, ls_rank4, ls_rank5, ls_rankh	// 직위
string	ls_user1, ls_user2, ls_user3, ls_user4, ls_user5, ls_userh	// 이름
string	ls_teamnm, ls_balteam, ls_hyupteam, ls_hyundt
string   ls_dctype, ls_dctitle, ls_content, ls_totprice, ls_applyid	// 팀명

debugbreak()

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
	if dw_5.object.dc_groupno[ll_row] = "" then continue
	
	if ll_line = 0 then
      ls_groupno    = dw_1.object.dc_groupno[1]
      ls_dcdate     = string(dw_1.object.dc_date[1],"yyyy/mm/dd")
      ls_teamnm     = dw_1.object.team_name[1]
      ls_username   = dw_1.object.user_name[1]

		ls_userh      = dw_1.object.dc_hyupuser[1]
      ls_hyundt     = string(dw_1.object.dc_hyupdt[1],"mm/dd")
		
      ls_rank1      = dw_1.object.rank1[1]
      ls_user1      = dw_1.object.user1[1]
      ls_app1       = string(dw_1.object.dc_appdt1[1],"mm/dd")
      ls_rank2      = dw_1.object.rank2[1]
      ls_user2      = dw_1.object.user2[1]
      ls_app2       = string(dw_1.object.dc_appdt2[1],"mm/dd")
      ls_rank3      = dw_1.object.rank3[1]
      ls_user3      = dw_1.object.user3[1]
      ls_app3       = string(dw_1.object.dc_appdt3[1],"mm/dd")
      ls_rank4      = dw_1.object.rank4[1]
      ls_user4      = dw_1.object.user4[1]
      ls_app4       = string(dw_1.object.dc_appdt4[1],"mm/dd")
      ls_rank5      = dw_1.object.rank5[1]
      ls_user5      = dw_1.object.user5[1]
      ls_app5       = string(dw_1.object.dc_appdt5[1],"mm/dd")
                    
      ls_balteam    = dw_1.object.dc_balteam[1]
      ls_hyupteam   = dw_1.object.dc_hyupteam[1]
                    
      ls_cust_name  = dw_5.object.cust_name[1]
      ls_dctype     = dw_1.object.dc_type[1]
      ls_content    = dw_1.object.dc_content[1]
      ls_totprice   = string(dw_1.object.totprice[1],"#,##0")
		
      arg_dw.object.dc_groupno[1]  = ls_groupno    
      arg_dw.object.dc_date[1]     = ls_dcdate     
      arg_dw.object.team_name[1]   = ls_teamnm     
      arg_dw.object.user_name[1]   = ls_username   

      arg_dw.object.dc_hyupuser[1] = ls_userh   
      arg_dw.object.dc_hyupdt[1]   = ls_hyundt

      arg_dw.object.rank1[1]       = ls_rank1      
      arg_dw.object.user1[1]       = ls_user1      
      arg_dw.object.dc_appdt1[1]   = ls_app1       
      arg_dw.object.rank2[1]       = ls_rank2      
      arg_dw.object.user2[1]       = ls_user2      
      arg_dw.object.dc_appdt2[1]   = ls_app2       
      arg_dw.object.rank3[1]       = ls_rank3      
      arg_dw.object.user3[1]       = ls_user3      
      arg_dw.object.dc_appdt3[1]   = ls_app3       
      arg_dw.object.rank4[1]       = ls_rank4      
      arg_dw.object.user4[1]       = ls_user4      
      arg_dw.object.dc_appdt4[1]   = ls_app4       
      arg_dw.object.rank5[1]       = ls_rank5      
      arg_dw.object.user5[1]       = ls_user5      
      arg_dw.object.dc_appdt5[1]   = ls_app5       

      SELECT team_name INTO :ls_balteam  FROM team   WHERE team_code = :ls_balteam;                                                 
      arg_dw.object.dc_balteam[1]  = ls_balteam    
      SELECT team_name INTO :ls_hyupteam FROM team   WHERE team_code = :ls_hyupteam;                                                 
      arg_dw.object.dc_hyupteam[1] = ls_hyupteam   
                                                 
      arg_dw.object.cust_name[1]   = ls_cust_name  
      SELECT item_nm INTO :ls_dctype    FROM codemst WHERE type = '매출할인_유형' AND item_cd = :ls_dctype;                                                 
      arg_dw.object.dc_type[1]     = ls_dctype     

		arg_dw.object.cap_name[1]     = dw_1.object.cap_name[1]    
		arg_dw.object.level_credit[1] = dw_1.object.level_credit[1]
		arg_dw.object.price_level[1]  = dw_1.object.price_level[1] 
		arg_dw.object.terms[1]        = dw_1.object.terms[1]       
		arg_dw.object.shipamt_case[1] = dw_1.object.shipamt_case[1]
		arg_dw.object.credit_limit[1] = string(dw_1.object.credit_limit[1],"#,##0")
		arg_dw.object.balance_amt[1]  = string(dw_1.object.balance_amt[1] ,"#,##0")
		arg_dw.object.main_co[1]      = dw_1.object.main_co[1]     
		arg_dw.object.license_name[1] = dw_1.object.license_name[1]
      arg_dw.object.dc_content[1]   = ls_content    
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

on w_oidcgroup_m2.create
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
this.cb_4=create cb_4
this.cbx_1=create cbx_1
this.cb_6=create cb_6
this.st_2=create st_2
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.dw_4=create dw_4
this.dw_6=create dw_6
this.gb_4=create gb_4
this.pb_add=create pb_add
this.cbx_2=create cbx_2
this.dw_7=create dw_7
this.dw_5=create dw_5
this.tab_1=create tab_1
this.pb_del=create pb_del
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
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
this.Control[iCurrent+15]=this.cb_4
this.Control[iCurrent+16]=this.cbx_1
this.Control[iCurrent+17]=this.cb_6
this.Control[iCurrent+18]=this.st_2
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.st_7
this.Control[iCurrent+22]=this.dw_4
this.Control[iCurrent+23]=this.dw_6
this.Control[iCurrent+24]=this.gb_4
this.Control[iCurrent+25]=this.pb_add
this.Control[iCurrent+26]=this.cbx_2
this.Control[iCurrent+27]=this.dw_7
this.Control[iCurrent+28]=this.dw_5
this.Control[iCurrent+29]=this.tab_1
this.Control[iCurrent+30]=this.pb_del
this.Control[iCurrent+31]=this.rb_1
this.Control[iCurrent+32]=this.rb_2
this.Control[iCurrent+33]=this.rb_3
this.Control[iCurrent+34]=this.rb_4
this.Control[iCurrent+35]=this.ddlb_op
this.Control[iCurrent+36]=this.gb_5
end on

on w_oidcgroup_m2.destroy
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
destroy(this.cb_4)
destroy(this.cbx_1)
destroy(this.cb_6)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.dw_4)
destroy(this.dw_6)
destroy(this.gb_4)
destroy(this.pb_add)
destroy(this.cbx_2)
destroy(this.dw_7)
destroy(this.dw_5)
destroy(this.tab_1)
destroy(this.pb_del)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.ddlb_op)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)
dw_7.SetTransObject(SQLCA)		// 조직도
tab_1.tabpage_1.dw_8.SetTransObject(SQLCA)		// 조직도(팀원)

dw_2.visible  = false	// UPDATE용
dw_4.visible  = false	// 프린트
dw_7.visible  = false	// 조직도
tab_1.visible = false 	// 조직도

dw_7.retrieve("00000")
wf_Make_team1( "00000" )

////////////////////////////////////////////////////////////////
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )
////////////////////////////////////////////////////////////////


em_1.text = string(RelativeDate(today(), - 30), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

rb_2.enabled = false 	// 선수금공제
if GF_PERMISSION("매출할인_유형(선수금공제)", gs_userid) = "Y" then
	rb_2.enabled = true
end if

if GF_PERMISSION("매출할인(선수금공제)_결재자", gs_userid) = "Y" then
	rb_1.enabled = false
	rb_2.checked = true
	rb_2.enabled = true
end if

////	출력
//dw_1.getchild("cust_no", idwc_cust)
//idwc_cust.settransobject(sqlca)

pb_retrieve.postevent( clicked! )


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 87
gb_2.height = newheight - 408

dw_3.height = newheight - 500

dw_1.width  = newwidth  - 1774
dw_5.width  = newwidth  - 1774
dw_6.width  = newwidth  - 1774
dw_6.height = dw_3.height - dw_1.height - dw_5.height - 15

tab_1.x      = dw_1.x
tab_1.y      = dw_1.y

end event

type pb_save from w_inheritance`pb_save within w_oidcgroup_m2
integer x = 4695
integer y = 60
integer taborder = 50
end type

event pb_save::clicked;call super::clicked;///////////////////////////////////////////////////////////////////
// 품목: 매출에누리, 선수금공제(DC10), 선수금(DC11) codemst 처리 
///////////////////////////////////////////////////////////////////
// 저장
string	ls_groupno, ls_itemno, ls_qa, ls_qa_cust, ls_uom, ls_magamyn, ls_yyyymm
string	ls_sale_no, ls_rem, ls_do_rem, ls_coil_no, ls_loc_no, ls_dc_content, ls_app1
string   ls_rem1, ls_rem2, ls_rem3, ls_rem4, ls_rem5, ls_remh, ls_dctype
long		ll_row, ll_oi_no, ll_seq_no, ll_ship_qty, ll_price, ll_rate_cash, ll_cnt, ll_stock_qty
date		ld_date
decimal  ld_totamt

dw_1.accepttext()
dw_5.accepttext()
if dw_1.rowcount() < 1 then RETURN

debugbreak()

ld_totamt = dw_5.object.tot_price[1]
if ld_totamt > 10000000 then
	if MessageBox("확인", "할인 총금액이 " + string(ld_totamt, "#,###0") + " 입니다.~n~n" + &
	              "다시한번 확인 하시기 바랍니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
   end if		
end if

if dw_5.rowcount() > 10 then
	MessageBox("확인", "거래처 10개 이상의 현장은 한번에 처리 안됩니다.",Stopsign!)
	dw_5.setcolumn("scene_code")
	dw_5.setfocus()
	RETURN
end if

//-- PK 생성(dc_no) --//
// DC_GROUP 체크
ld_date = date(dw_1.object.dc_date[1])


if string(ld_date,"yyyy/mm/dd") > string(gf_today(),"yyyy/mm/dd") then
	MessageBox('확인','매출할인일자는 ' + string(gf_today(),"yyyy/mm/dd") + ' 까지 입니다.',Stopsign!)
	dw_1.setcolumn("dc_date")
	dw_1.setfocus()
	return
end if

ls_yyyymm = string(dw_1.object.dc_date[1],"yyyymm")
SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '00';
if ls_magamyn <> "N" then
	MessageBox('확인','해당년월은 마감되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("dc_date")
	dw_1.setfocus()
	return
end if

if isnull(ld_date) then
	MessageBox('확인','출고일자가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("dc_date")
	dw_1.setfocus()
	return
end if

if isnull(dw_1.object.cust_no[1]) then
	MessageBox('확인','거래처가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("cust_name")
	dw_1.setfocus()
	return
end if

if isnull(dw_1.object.dc_type[1]) then
	MessageBox('확인','매출할인 유형이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("dc_type")
	dw_1.setfocus()
	return
end if

if isnull(dw_1.object.shipamt_case[1]) then
	MessageBox('확인','운반비 부담조건이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("shipamt_case")
	dw_1.setfocus()
	return
end if

if isnull(dw_1.object.dc_content[1]) then
	MessageBox('확인','발생사유가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
	dw_1.setcolumn("dc_title")
	dw_1.setfocus()
	return
end if

// DC_GROUPDET 체크
for ll_row = 1 to dw_5.rowcount()
	if isnull(dw_5.object.scene_code[ll_row]) then
		MessageBox('확인','현장이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("scene_code")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.price[ll_row]) then
		MessageBox('확인','할인금액이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("price")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.calc_amt[ll_row]) then
		MessageBox('확인','산출금액이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("calc_amt")
		dw_5.setfocus()
		RETURN
	end if
	
	if isnull(dw_5.object.calc_rate[ll_row]) then
		MessageBox('확인','할인율이 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("calc_rate")
		dw_5.setfocus()
	end if
	
	if isnull(dw_5.object.rem[ll_row]) then
		MessageBox('확인','비고가 누락되었습니다.~n~n확인 후 다시 등록하여 주십시요.',Stopsign!)
		dw_5.setcolumn("rem")
		dw_5.setfocus()
		RETURN
	end if
	
	
	dw_5.object.dc_groupno[ll_row] = dw_1.object.dc_groupno[1]
	dw_5.object.cust_no[ll_row]    = dw_1.object.cust_no[1]
	dw_5.object.seq_no[ll_row]     = ll_row			// 순번
	dw_5.object.do_no[ll_row]      = ""	
	dw_5.object.oi_no[ll_row]      = 1	
	
	///////////////////////////////////////////////////////////////////////////////////
	ls_dctype = dw_1.object.dc_type[1]	
	if rb_1.checked = true then		// 매출할인
		if ls_dctype = "DC10" OR ls_dctype = "DC11" then
			MessageBox('확인','매출할인_유형(선수금공제, 선수금) 오류입니다.',Stopsign!)
			dw_5.setcolumn("dc_type")
			dw_5.setfocus()
			RETURN
		end if	
	elseif rb_2.checked = true then	// 선수금공제
		if ls_dctype <> "DC10" then
			MessageBox('확인','매출할인_유형(선수금공제, 선수금) 오류입니다.',Stopsign!)
			dw_5.setcolumn("dc_type")
			dw_5.setfocus()
			RETURN
		end if	
	elseif rb_3.checked = true then	// 선수금
		if ls_dctype <> "DC11" then
			MessageBox('확인','매출할인_유형 오류입니다.',Stopsign!)
			dw_5.setcolumn("dc_type")
			dw_5.setfocus()
			RETURN
		end if	
	end if
	
	if ls_dctype = "DC11" then
		dw_5.object.item_no[ll_row] = 'PZZZPB1ZZZ'	// 선수금
	elseif ls_dctype = "DC10" then
   	if GF_PERMISSION("매출할인_유형(선수금공제)", gs_userid) = "Y" THEN
			dw_5.object.item_no[ll_row] = 'PZZZPB2ZZZ'	// 선수금공제
		else
			MessageBox('확인','매출할인_유형(선수금공제).~n~n권한이 존재하지 않습니다.',Stopsign!)
			dw_5.setcolumn("dc_type")
			dw_5.setfocus()
			RETURN
		end if
	else
		dw_5.object.item_no[ll_row]    = 'PZZZPP4ZZZ'	// 매출에누리
	end if
	///////////////////////////////////////////////////////////////////////////////////

	dw_5.object.qa[ll_row]         = '000X0000X0000X00000'	
	dw_5.object.ship_qty[ll_row]   = 1		// 수량
	
	//--불필요하지만 필수항목
	dw_5.object.rate_cash[ll_row]  = 0
	dw_5.object.sale_no[ll_row]    = ""
	dw_5.object.uom[ll_row]        = ""
	dw_5.object.aroi_qty[ll_row]   = 0	
next

// 등록과 동시에 본인결재
ls_app1 = dw_1.object.dc_app1[1]
if isnull(ls_app1) then ls_app1 = ""

if ls_app1 = "" then
	dw_1.object.dc_appdt2[1] = Date(gdt_today)
else
	dw_1.object.dc_appdt1[1] = Date(gdt_today)
end if


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_groupno = dw_1.object.dc_groupno[1]
if isNULL(ls_groupno) or ls_groupno = "" then	// 신규모드
	SELECT isnull(max(dc_groupno),'') INTO :ls_groupno FROM dc_group WHERE dc_date = :ld_date;
	if isnull(ls_groupno) then ls_groupno = ""
	if ls_groupno = "" then
		ls_groupno = "DC" + string(ld_date,"yyyymmdd") + "-001"
	else
		ls_groupno = LeftA(ls_groupno,11) + string(long(RightA(ls_groupno,3)) + 1,"000")
	end if
	dw_1.object.dc_groupno[1] = ls_groupno
else
	// 수정모드	(할인일자 변경한 경우)
	if string(ld_date,"yyyymmdd") <> MidA(ls_groupno,3,8) then
		if MessageBox("일자변경","매출할인일자를 변경 하시겠습니까?",Exclamation!, YesNo!, 2) = 2 then
			RETURN
		end if
	
		SELECT isnull(max(dc_groupno),'') INTO :ls_groupno FROM dc_group WHERE dc_date = :ld_date;
		if isnull(ls_groupno) then ls_groupno = ""
		if ls_groupno = "" then
			ls_groupno = "DC" + string(ld_date,"YYYYMMDD") + "-001"
		else
			ls_groupno = LeftA(ls_groupno,11) + string(long(RightA(ls_groupno,3)) + 1,"000")
		end if
		dw_1.object.dc_groupno[1] = ls_groupno
	end if
end if

// 일자변경 할수도 있음
for ll_row = 1 to dw_5.rowcount()
	dw_5.object.dc_groupno[ll_row] = ls_groupno
	dw_5.object.seq_no[ll_row]     = ll_row			// 순번
next
dw_1.object.totprice[1]  = dw_5.object.tot_price[1]	// 할인총액

dw_1.AcceptText()
dw_5.AcceptText()
dw_6.AcceptText()

ls_rem1 = dw_6.object.dc_rem1[1]		// 설명
ls_rem2 = dw_6.object.dc_rem2[1]
ls_rem3 = dw_6.object.dc_rem3[1]
ls_rem4 = dw_6.object.dc_rem4[1]
ls_rem5 = dw_6.object.dc_rem5[1]
ls_remh = dw_6.object.dc_remh[1]

///////////////////////////////////////////////////////////
if wf_update2( dw_1, dw_5, "Y") = true then
	UPDATE DC_GROUP
	   SET dc_rem1 = :ls_rem1, dc_rem2 = :ls_rem2
		  , dc_rem3 = :ls_rem3, dc_remh = :ls_remh
		  , dc_rem4 = :ls_rem4, dc_rem5 = :ls_rem5
	 WHERE dc_groupno  = :ls_groupno;
	if sqlca.sqlcode <> 0 then
		COMMIT;
	end if
	
	pb_retrieve.triggerevent(clicked!)
else
	MessageBox('확인','매출할인 작성중 오류가 발생 하였습니다.',Stopsign!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oidcgroup_m2
integer x = 1701
integer y = 452
integer width = 3365
integer height = 1280
integer taborder = 0
string dataobject = "d_oidcgroup_m1"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::clicked;call super::clicked;//
string ls_apply

if this.RowCount() < 1 then return

ls_apply = this.object.cc_flag[1]
if ls_apply = "0" then
	choose case dwo.name
		case "rank2", "rank3", "rank4"
			is_user  = dwo.name		// 결재라인 변경대상
			if MessageBox("확인","결재라인 수정을 변경 하겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
				return
			else
				// 결재자 선택
				tab_1.visible = true
				tab_1.tabpage_1.tv_1.setfocus()
			end if
	end choose
end if

end event

event dw_1::itemchanged;call super::itemchanged;// 거래처 변경
string  ls_where, ls_sql, ls_data, ls_null
string  ls_content,  ls_custno, ls_grade, ls_captain, ls_limit, ls_balance, ls_terms
string  ls_price_level, ls_custmain, ls_license
string  ls_trans_no, ls_dono
long    ll_row,   ll_cnt
datetime ld_dodate
decimal ld_credit_limit, ld_balance_amt

setnull( ls_null )
this.AcceptText()

this.getchild("cust_no", idwc_cust)		// 거래처
idwc_cust.SetTransObject(SQLCA)

choose case dwo.name
	case "cust_no"
		ls_custno = data
      SELECT captain_name  = isnull(a.captain_name,'')
           , level         = isnull(a.level_grade,'') + isnull(a.credit_level,'')
           , credit_limit  = isnull(a.credit_limit,0)
           , balance_amt   = isnull(a.balance_amt,0)
           , terms         = isnull(a.terms,'')
           , price_level   = isnull(a.price_level,'')
           , custmain      = isnull(b.main_co,'')
           , licensenm     = isnull(b.license_name,'')
        INTO :ls_captain,  :ls_grade, :ld_credit_limit, :ld_balance_amt, :ls_terms, :ls_price_level
		     , :ls_custmain, :ls_license
        FROM customer  a
             LEFT OUTER JOIN custinfo b  ON a.cust_no = b.cust_no
       WHERE a.cust_no  = :ls_custno;
		 
		ls_content = "1. 발생사유 : " + CharA(13) + CharA(10) + &
						 "2. 업체현황 : " + CharA(13) + CharA(10)

		dw_1.object.cap_name[1]     = ls_captain    
		dw_1.object.level_credit[1] = ls_grade
		dw_1.object.price_level[1]  = ls_price_level 
		dw_1.object.terms[1]        = ls_terms       
		dw_1.object.shipamt_case[1] = "당사기준 적용"
		dw_1.object.credit_limit[1] = ld_credit_limit
		dw_1.object.balance_amt[1]  = ld_balance_amt 
		dw_1.object.main_co[1]      = ls_custmain     
		dw_1.object.license_name[1] = ls_license
		dw_1.object.totprice[1]     = 0
						 
		dw_1.object.dc_content[1] = ls_content		

		dw_5.enabled = true
		dw_5.getchild("scene_code",idwc_scene)		// 현장명
		idwc_scene.SetTransObject(SQLCA)
		idwc_scene.Retrieve( ls_custno )

		dw_5.insertrow(0)     

		dw_5.object.scene_code.protect  = false	// 현장
		dw_5.object.price.protect       = false	// 금액
		dw_5.object.rem.protect         = false	// 비고		

	case "dc_type"
		if rb_1.checked = true then
			if data = "DC10" then
				MessageBox("확인","선수금공제 항목은 선택할 수 없습니다.")
				RETURN
			end if
		end if
end choose

end event

event dw_1::rbuttondown;call super::rbuttondown;//
string ls_date, ls_apply

if this.RowCount() < 1 then return

ls_apply = this.object.cc_flag[1]
if ls_apply = "0" then	
	if dwo.name = "dc_date" then
		OpenWithParm(w_calendar, message.stringparm)
		if Message.StringParm <> 'N' then
			ls_date = string(date(Message.StringParm))
			this.object.dc_date[1] = date(ls_date)
		end if
	end if
end if

end event

event dw_1::doubleclicked;call super::doubleclicked;//
choose case dwo.name
	case "user1", "user2", "user3", "user4", "user5"
//		MessageBox("확인","결재 작업은 '매출할인 결재관리' 에서 진행하시기 바랍니다.")
		
	case "dc_content"
//		MessageBox("확인","본문 수정은 '매출할인 결재관리' 에서 결재취소 후 작업하시기 바랍니다.")
end choose

//MessageBox("확인","결재 작업은 '매출할인 결재관리' 에서 진행하시기 바랍니다.")

end event

type st_title from w_inheritance`st_title within w_oidcgroup_m2
integer x = 50
integer y = 40
integer width = 1440
string text = "매출할인 관리(거래처)"
end type

type st_tips from w_inheritance`st_tips within w_oidcgroup_m2
end type

type pb_compute from w_inheritance`pb_compute within w_oidcgroup_m2
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidcgroup_m2
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

type pb_close from w_inheritance`pb_close within w_oidcgroup_m2
integer x = 4896
integer y = 60
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidcgroup_m2
integer x = 4489
integer y = 60
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
string     ls_groupno

if dw_5.rowcount() < 1 then RETURN

if PrintSetup() <> 1 then RETURN
dw_4.Modify('DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100')
dw_4.settransobject(sqlca)

dw_4.Reset()
dw_4.InsertRow(0)
wf_print( dw_4 )

ls_groupno = dw_1.object.dc_groupno[1]
if isnull(ls_groupno) or ls_groupno = "" then
	// 10, 20... 페이지 공난출력 방지
else
	dw_4.print()
end if

//l_print.st_datawindow  = dw_4
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 매출할인 결재관리를 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oidcgroup_m2
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oidcgroup_m2
integer x = 4073
integer y = 60
integer taborder = 110
end type

event pb_delete::clicked;call super::clicked;string	ls_groupno, ls_flag
long		ll_cnt

if dw_1.RowCount() < 1 then return
if MessageBox("삭제","삭제 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

ls_groupno = dw_1.Object.dc_groupno[1]
if isnull(ls_groupno) or ls_groupno = "" then RETURN

ls_flag = dw_1.Object.cc_flag[1]
if isnull(ls_flag) then ls_flag = "0"	// 신규등록 자료표시

if ls_flag <> "0" then
	MessageBox("확인", "결재가 진행중인 자료입니다.~n~n승인취소 후 다시 진행해 주시기 바랍니다.~n", StopSign!)
	return
end if


DELETE FROM dc_groupdet WHERE dc_groupno = :ls_groupno;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("확인","[dc_groupdet] 삭제할 수 없는 에러가 발생하였습니다.",stopsign!)
	return
else
	DELETE FROM dc_group WHERE dc_groupno = :ls_groupno;
	if sqlca.sqlcode <> 0 then
		ROLLBACK;
		MessageBox("확인","[dc_group] 삭제할 수 없는 에러가 발생하였습니다.",stopsign!)
		return
	else
		COMMIT;	
		MessageBox("확인","삭제완료 하였습니다.",stopsign!)
		
		pb_retrieve.triggerevent(clicked!)
	end if
end if

end event

type pb_insert from w_inheritance`pb_insert within w_oidcgroup_m2
integer x = 3867
integer y = 60
integer taborder = 120
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_insert::clicked;call super::clicked;// 
string	ls_app1,  ls_app2,  ls_app3,  ls_app4,  ls_app5,  ls_apph	// ID
string	ls_rank1, ls_rank2, ls_rank3, ls_rank4, ls_rank5, ls_rankh	// 직위
string	ls_user1, ls_user2, ls_user3, ls_user4, ls_user5, ls_userh	// 이름
string	ls_teamnm, ls_applyid, ls_content									// 팀명
string   ls_message

long     ll_apply

dw_1.Reset()	// DC_GROUP
dw_2.Reset()	// DC_GROUPDET
dw_5.Reset()	// 현장
dw_6.Reset()	// 설명

/////////////////////////////////////////////////////////////////////////
// 매출할인(선수금공제)_결재자
/////////////////////////////////////////////////////////////////////////
if rb_3.checked = true then		// 선수금
	if MessageBox("확인", "선수금 작업 입니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
   end if		
	
	dw_1.getchild("dc_type", idwc_type)
	idwc_type.setfilter( " item_cd = 'DC11'"  )
	idwc_type.filter()		
elseif rb_2.checked = true then		// 선수금공제
	if MessageBox("확인", "선수금공제 작업 입니다. 계속하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
   end if		
	
	dw_1.getchild("dc_type", idwc_type)
	idwc_type.setfilter( "" )
	idwc_type.filter()		
else
	dw_1.getchild("dc_type", idwc_type)
	idwc_type.setfilter( " item_cd <> 'DC10' AND item_cd <> 'DC11' " )		// 선수금공제 제외
	idwc_type.filter()	
end if
/////////////////////////////////////////////////////////////////////////

SELECT count(*) INTO :ll_apply FROM salehp a WHERE a.appyn = 'Y' AND a.user_id  = :gs_userid;
if ll_apply <> 1 then
	MessageBox("확인","매출할인 관리를 작성할 수 없습니다.(영업사원 HP관리 미등록)" )
	RETURN
end if

// 담당자 거래처만 보여주기
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.retrieve( "%" )

if cbx_1.checked = true then	// 전체 거래처
	idwc_cust.setsort( " cust_name A, user_name A")
	idwc_cust.sort()
else
	idwc_cust.setsort( " user_name A, cust_name A")
	idwc_cust.sort()

	idwc_cust.setfilter( " user_name LIKE '" + gs_username + "%'")
	idwc_cust.filter()	
end if
dw_1.setcolumn("cust_no")
dw_1.setfocus()


dw_1.insertrow(0)
dw_1.enabled    = true

dw_6.insertrow(0)
dw_6.enabled    = true

pb_save.enabled = true
dw_1.object.cc_flag[1] = '0'	// DW활성화

// 기본값
SELECT team_name INTO :ls_teamnm FROM team WHERE team_code = :gs_team;

dw_1.object.dc_date[1]     = Date(gdt_today)	// 출고일자
dw_1.object.dc_balteam[1]  = "70000"			// 발신(영업본부)
dw_1.object.dc_hyupteam[1] = "10000"			// 협조(관리본부)

dw_1.object.team_code[1]   = gs_team			// 기안부서
dw_1.object.team_name[1]   = ls_teamnm			// 기안부서 명
dw_1.object.user_id[1]     = gs_userid			// 기안자 ID
dw_1.object.user_name[1]   = gs_username		// 기안자 명

/*
// 결재관련사항
SELECT user1_rank  = a.rank1
     , user1_id    = a.apply1
     , user1_name  = isnull(c1.user_name,'')
     , user2_rank  = a.rank2
     , user2_id    = a.apply2
     , user2_name  = isnull(c2.user_name,'')
     , user3_rank  = a.rank3
     , user3_id    = a.apply3
     , user3_name  = isnull(c3.user_name,'')
  INTO :ls_rank1, :ls_app1, :ls_user1, :ls_rank2, :ls_app2, :ls_user2, :ls_rank3, :ls_app3, :ls_user3
  FROM salehp a
       LEFT OUTER JOIN login c1  on a.apply1 = c1.user_id
       LEFT OUTER JOIN login c2  on a.apply2 = c2.user_id
       LEFT OUTER JOIN login c3  on a.apply3 = c3.user_id
 WHERE a.appyn    = 'Y'
   AND a.user_id  = :gs_userid;
*/
// 결재관련사항
SELECT user1_rank  = a.rank1, user1_id  = a.apply1, user1_name  = isnull(c1.user_name,'')
     , user2_rank  = a.rank2, user2_id  = a.apply2, user2_name  = isnull(c2.user_name,'')
     , user3_rank  = a.rank3, user3_id  = a.apply3, user3_name  = isnull(c3.user_name,'')
     , user4_rank  = a.rank4, user4_id  = a.apply4, user4_name  = isnull(c4.user_name,'')
     , user5_rank  = a.rank5, user5_id  = a.apply5, user5_name  = isnull(c5.user_name,'')
  INTO :ls_rank1, :ls_app1, :ls_user1, :ls_rank2, :ls_app2, :ls_user2, :ls_rank3, :ls_app3, :ls_user3
     , :ls_rank4, :ls_app4, :ls_user4, :ls_rank5, :ls_app5, :ls_user5
  FROM salehp a
       LEFT OUTER JOIN login c1  on a.apply1 = c1.user_id
       LEFT OUTER JOIN login c2  on a.apply2 = c2.user_id
       LEFT OUTER JOIN login c3  on a.apply3 = c3.user_id
       LEFT OUTER JOIN login c4  on a.apply4 = c4.user_id
       LEFT OUTER JOIN login c5  on a.apply5 = c5.user_id
 WHERE a.appyn    = 'Y'
   AND a.user_id  = :gs_userid;
if isnull(ls_rank1) or ls_rank1 = "" then
	SELECT user1_rank  = a.rank,  user1_id  = a.user_id, user1_name  = isnull(a.user_name,'')
		  , user2_rank  = '',      user2_id  = '',        user2_name  = ''
		  , user3_rank  = '',      user3_id  = '',        user3_name  = ''
		  , user4_rank  = '',      user4_id  = '',        user4_name  = ''
		  , user5_rank  = '회장',  user5_id  = 'TOP',     user5_name  = '조용선'
	  INTO :ls_rank1, :ls_app1, :ls_user1, :ls_rank2, :ls_app2, :ls_user2, :ls_rank3, :ls_app3, :ls_user3
		  , :ls_rank4, :ls_app4, :ls_user4, :ls_rank5, :ls_app5, :ls_user5
	  FROM login a
	 WHERE a.user_id  = :gs_userid;
end if

// 결재자 직책
dw_1.object.rank1[1]   = ls_rank1 ; dw_1.object.rank2[1]   = ls_rank2
dw_1.object.rank3[1]   = ls_rank3 ; dw_1.object.rank4[1]   = ls_rank4
dw_1.object.rank5[1]   = ls_rank5	// 화면

// 결재자 비고
dw_6.object.rank1[1]   = ls_rank1 ; dw_6.object.rank2[1]   = ls_rank2
dw_6.object.rank3[1]   = ls_rank3 ; dw_6.object.rankh[1]   = ls_rankh
dw_6.object.rank4[1]   = ls_rank4 ; dw_6.object.rank5[1]   = ls_rank5	// 결재설명

// 결재자 이름
if ls_user1 <> "" then dw_1.object.user1[1] = ls_user1 + "인"
if ls_user2 <> "" then dw_1.object.user2[1] = ls_user2 + "인"
if ls_user3 <> "" then dw_1.object.user3[1] = ls_user3 + "인"
if ls_user4 <> "" then dw_1.object.user4[1] = ls_user4 + "인"
if ls_user5 <> "" then dw_1.object.user5[1] = ls_user5 + "인"

// 결재자 ID
dw_1.object.dc_app1[1] = ls_app1  ; dw_1.object.dc_app2[1] = ls_app2
dw_1.object.dc_app3[1] = ls_app3  ; dw_1.object.dc_apph[1] = ls_apph
dw_1.object.dc_app4[1] = ls_app4  ; dw_1.object.dc_app5[1] = ls_app5

dw_1.object.cust_no.protect     = false	// 거래처
dw_1.object.dc_date.protect     = false	// 출고일자
dw_1.object.dc_balteam.protect  = false	// 발신부서
dw_1.object.dc_hyupteam.protect = false	// 협조부서

// 협조자
SELECT item_cd, item_nm, '팀장' INTO :ls_apph, :ls_userh, :ls_rankh 
  FROM codemst 
 WHERE type = '매출할인_협조자' AND use_yn = 'Y';

debugbreak()
/////////////////////////////////////////////////////////////////////////
// 선수금
if rb_3.checked = true then
//	dw_1.object.rankh[1]         = ls_rankh// 협조자 직책
	dw_1.object.dc_hyupuser[1]   = ls_apph // 협조자 ID

	dw_1.object.dc_type[1]  	  = "DC11"	// 할인유형(선수금)
	dw_1.object.dc_type.protect  = true		// 할인유형(선수금)
// 선수금공제
elseif rb_2.checked = true then
//	dw_1.object.rankh[1]         = ls_rankh// 협조자 직책
	dw_1.object.dc_hyupuser[1]   = ls_apph // 협조자 ID

	dw_1.object.dc_type[1]  	  = "DC10"	// 할인유형(선수금공제)
	dw_1.object.dc_type.protect  = true		// 할인유형(선수금공제)
	dw_1.object.dc_type.protect  = false	// 할인유형
// 매출할인
elseif rb_1.checked = true then
//	dw_1.object.rankh[1]         = ls_rankh// 협조자 직책
	dw_1.object.dc_hyupuser[1]   = ls_apph // 협조자 ID
end if
/////////////////////////////////////////////////////////////////////////
dw_1.object.shipamt_case.protect= false	// 운반비 부담조건
dw_1.object.dc_content.protect  = false	// 본문

/////////////////////////////////////////////////////////////////////////
if dw_5.rowcount() > 0 then
	dw_5.object.scene_code.protect = false	// 현장
	dw_5.object.price.protect      = false	// 금액
	dw_5.object.rem.protect        = false	// 산출근거
end if
//////////////////////////////////////////////////////////////
if dw_6.rowcount() > 0 then
	dw_6.object.dc_rem1.protect    = false	// 결재자1
	dw_6.object.dc_rem2.protect    = false	// 결재자2
	dw_6.object.dc_rem3.protect    = false	// 결재자3
	dw_6.object.dc_rem4.protect    = false	// 결재자4
	dw_6.object.dc_rem5.protect    = false	// 결재자5
	dw_6.object.dc_remh.protect    = false	// 협조자
end if
//////////////////////////////////////////////////////////////

// 결재난 
for ll_apply = 1 to 5
	ls_applyid = dw_1.GetItemString( 1, "dc_app"+string(ll_apply) )
	if gs_userid = ls_applyid then
		dw_1.Modify("user"   + string(ll_apply) + ".background.Mode=1")
		dw_1.Modify("user"   + string(ll_apply) + ".background.color=65535")		// Yellow
		dw_1.Modify("user"   + string(ll_apply) + ".Protect=0")			

		dw_6.Modify("dc_rem" + string(ll_apply) + ".background.Mode=1")
		dw_6.Modify("dc_rem" + string(ll_apply) + ".background.color=65535")
		dw_6.Modify("dc_rem" + string(ll_apply) + ".Protect=0")			

		// 협조자
		dw_1.Modify("user"   + "h"              + ".background.Mode=1")
		dw_1.Modify("user"   + "h"              + ".background.color=65535")		// Yellow
		dw_1.Modify("user"   + "h"              + ".Protect=0")			

		dw_6.Modify("dc_rem" + "h"              + ".background.Mode=1")
		dw_6.Modify("dc_rem" + "h"              + ".background.color=65535")
		dw_6.Modify("dc_rem" + "h"              + ".Protect=0")			
	else
		dw_1.Modify("user"   + string(ll_apply) + ".background.Mode=1")
		dw_1.Modify("user"   + string(ll_apply) + ".background.color=12632256")	// Light gray
		dw_1.Modify("user"   + string(ll_apply) + ".Protect=1")			

		dw_6.Modify("dc_rem" + string(ll_apply) + ".background.Mode=1")
		dw_6.Modify("dc_rem" + string(ll_apply) + ".background.color=12632256")
		dw_6.Modify("dc_rem" + string(ll_apply) + ".Protect=1")			

		// 협조자
		dw_1.Modify("user"   + "h"              + ".background.Mode=1")
		dw_1.Modify("user"   + "h"              + ".background.color=12632256")	// Light gray
		dw_1.Modify("user"   + "h"              + ".Protect=1")			

		dw_6.Modify("dc_rem" + "h"              + ".background.Mode=1")
		dw_6.Modify("dc_rem" + "h"              + ".background.color=12632256")
		dw_6.Modify("dc_rem" + "h"              + ".Protect=1")			
	end if
next

ls_content = "1. 발생사유 : " + CharA(13) + CharA(10) + &
				 "2. 업체현황 : " + CharA(13) + CharA(10)
dw_1.object.dc_content[1] = ls_content

MessageBox("확인","본문작성시 줄 바꿈은 엔터키로 작업하시기 바랍니다.~n~r~r" + &
           "직책난 2, 3번 결재라인은 클릭하여 변경할 수 있습니다.~n~r~r" + &
			  "1.발생사유와 2.업체현황은 4줄이내 작성 바랍니다. (결재시 안보임)" )

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oidcgroup_m2
integer x = 3662
integer y = 60
integer taborder = 10
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_dctype, ls_sdate, ls_edate, ls_userid, ls_value
long    ll_row
decimal ld_price

ls_sdate = em_1.text
ls_edate = em_2.text

// 그룹별 필터링
if GF_PERMISSION("매출할인_전체보기", gs_userid) = "Y" then
	ls_userid = "%"
else
	ls_userid = gs_userid
end if

// 작업구분
if rb_4.checked = true then		// 전체
	ls_dctype = "%"
elseif rb_3.checked = true then	// 선수금
	ls_dctype = "DC11"
elseif rb_2.checked = true then	// 선수금공제
	ls_dctype = "DC10"
else										// 매출할인
	ls_dctype = ""
end if

dw_1.reset() ; dw_2.reset() ; dw_3.reset()
dw_4.reset() ; dw_5.reset() ; dw_6.reset()	// 7,8 조직도

ll_row   = dw_3.retrieve( ls_dctype, ls_sdate, ls_edate, ls_userid )
if ll_row < 1 then 
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oidcgroup_m2
integer x = 2130
integer y = 12
integer width = 782
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oidcgroup_m2
integer x = 37
integer y = 392
integer width = 5083
integer height = 2388
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oidcgroup_m2
integer x = 2930
integer width = 2190
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidcgroup_m2
integer x = 64
integer y = 12
integer width = 128
integer height = 100
integer taborder = 0
boolean enabled = false
string dataobject = "d_oidcgroupdet_m"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_oidcgroup_m2
integer x = 2158
integer y = 132
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

type em_2 from editmask within w_oidcgroup_m2
integer x = 2523
integer y = 132
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

type dw_3 from datawindow within w_oidcgroup_m2
event keydown pbm_dwnkey
integer x = 73
integer y = 452
integer width = 1609
integer height = 2296
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_oidcgroup_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
/////////////////////////////////////////////////////////////////////////////////

//
long     ll_row, ll_cnt, ll_app
string   ls_groupno, ls_custno, ls_flag, ls_userid, ls_applyid
date     ld_approval
datetime ld_applydt, ld_null
boolean  lb_chk

setnull(ld_null)

ll_row = row	// currentrow
if ll_row < 1 or ll_row > this.rowcount() then return

if this.object.user_id[ll_row] <> gs_userid then 
	pb_delete.enabled = false
else
	pb_delete.enabled = true
end if

ls_groupno = this.object.dc_groupno[ll_row]
if isnull(ls_groupno) or ls_groupno = "" then return

dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)

ls_custno  = this.object.cust_no[ll_row]
dw_5.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.retrieve( ls_custno )

ll_cnt     = dw_1.retrieve( ls_groupno )	// 헤더 
ll_cnt     = dw_5.retrieve( ls_groupno )	// 본문
ll_cnt     = dw_6.retrieve( ls_groupno )	// 결재 특이사항
if ll_cnt > 0 then
	ls_flag = dw_1.object.cc_flag[1]
	if ls_flag = "1" then		// 수정시
		dw_1.object.dc_date.protect     = true		// 출고일자
		dw_1.object.dc_balteam.protect  = true		// 발신
		dw_1.object.dc_hyupteam.protect = true		// 협조
		
		dw_1.object.cust_no.protect     = true		// 거래처
		dw_1.object.dc_type.protect     = true		// 할인유형
		dw_1.object.shipamt_case.protect= true    // 운반비 부담조건
		dw_1.object.dc_content.protect  = true		// 본문

		dw_5.object.scene_code.protect  = true		// 현장
		dw_5.object.price.protect       = true		// 금액
		dw_5.object.rem.protect         = true		// 비고

		dw_6.object.dc_rem1.protect     = true		// 결재자1
		dw_6.object.dc_rem2.protect     = true		// 결재자2
		dw_6.object.dc_rem3.protect     = true		// 결재자3
		dw_6.object.dc_rem4.protect     = true		// 결재자4
		dw_6.object.dc_rem5.protect     = true		// 결재자5
	else								// 등록시
		dw_1.enabled = true
		dw_1.object.dc_date.protect     = false	// 출고일자
		dw_1.object.dc_balteam.protect  = false	// 발신
		dw_1.object.dc_hyupteam.protect = false	// 협조
		
		dw_1.object.cust_no.protect     = false	// 거래처
		dw_1.object.dc_type.protect     = false	// 할인유형		
		dw_1.object.shipamt_case.protect= false   // 운반비 부담조건
		dw_1.object.dc_content.protect  = false	// 본문

		dw_5.enabled = true
		dw_5.object.scene_code.protect  = false	// 현장
		dw_5.object.price.protect       = false	// 금액
		dw_5.object.rem.protect         = false	// 비고

		dw_6.enabled = true
		dw_6.object.dc_rem1.protect     = false	// 결재자1
		dw_6.object.dc_rem2.protect     = false	// 결재자2
		dw_6.object.dc_rem3.protect     = false	// 결재자3
		dw_6.object.dc_rem4.protect     = false	// 결재자4
		dw_6.object.dc_rem5.protect     = false	// 결재자5
	end if

	// 결재난 당사자 포함
	lb_chk = false
	for ll_cnt = 1 to 5
		ls_userid = dw_1.getitemstring( 1, "dc_app" + string(ll_cnt) )			
		if ls_userid = gs_userid then 
			lb_chk = true
			exit
		end if
	next
	
	// 결재난 당사자 포함이고 상급자 결재인 경우 체크
	string   ls_field
	long     ll_upcheck
	datetime ldt_appdt
	
	if lb_chk = true then
		for ll_upcheck = ll_cnt + 1 to 5
			ls_field = "dc_appdt" + string(ll_upcheck)
			ldt_appdt = dw_1.getitemdatetime( 1, ls_field )			
			if isnull(ldt_appdt) then 
				lb_chk = true
			else
				lb_chk = false
				exit
			end if
		next		
	end if

	// 저장
	pb_save.enabled = lb_chk
end if

// 결재난 프로텍트
for ll_cnt = 1 to 5
	dw_1.Modify("rank"     + string(ll_cnt) + ".Protect=1")			
	dw_1.Modify("user"     + string(ll_cnt) + ".Protect=1")			
	dw_1.Modify("dc_appdt" + string(ll_cnt) + ".Protect=1")			
next

// 최종 결재후 전결처리건 화면에서 지움 
long ll_userid

debugbreak()
dw_1.setredraw( false )
if Not isnull(dw_1.object.dc_appdt5[1]) then
	ls_applyid = upper(dw_1.object.dc_app5[1])
	
	choose case ls_applyid
		case "TOP", "LEEWY"
		case else	// 전결인 경우
			if dw_1.object.dc_type[1] = "DC10" then
			else
				for ll_cnt = 4 to 2 step -1
					ls_applyid = dw_1.getitemstring( 1, "dc_app" + string(ll_cnt) )
					if dw_1.object.dc_app5[1] = ls_applyid then
						dw_1.setitem( 1, "rank" + string(ll_cnt), "" )
						dw_1.setitem( 1, "user" + string(ll_cnt), "" )
						dw_1.setitem( 1, "dc_appdt" + string(ll_cnt), ld_null )
						exit
					else
						dw_1.setitem( 1, "rank" + string(ll_cnt), "" )
						dw_1.setitem( 1, "user" + string(ll_cnt), "" )
						dw_1.setitem( 1, "dc_appdt" + string(ll_cnt), ld_null )
					end if
				next
			end if
	end choose
end if
dw_1.setredraw( true )

dw_1.accepttext()

end event

event rowfocuschanging;//

end event

type st_3 from statictext within w_oidcgroup_m2
integer x = 101
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_oidcgroup_m2
integer x = 288
integer y = 276
integer width = 480
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

type ddlb_dwtitles from dropdownlistbox within w_oidcgroup_m2
integer x = 352
integer y = 288
integer width = 311
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

type st_4 from statictext within w_oidcgroup_m2
integer x = 786
integer y = 292
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

type sle_value from singlelineedit within w_oidcgroup_m2
integer x = 1275
integer y = 284
integer width = 567
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

type cb_1 from commandbutton within w_oidcgroup_m2
integer x = 1847
integer y = 284
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

arg_dw = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidcgroup_m2
integer x = 2011
integer y = 284
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

arg_dw = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oidcgroup_m2
integer x = 2176
integer y = 284
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

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidcgroup_m2
integer x = 2341
integer y = 284
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

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_oidcgroup_m2
event mousemove pbm_mousemove
integer x = 4283
integer y = 60
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

type st_1 from statictext within w_oidcgroup_m2
integer x = 2158
integer y = 52
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
string text = "기안일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_oidcgroup_m2
integer x = 3319
integer y = 60
integer width = 325
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

event clicked;gs_where        lstr_where
string ls_cust_no, ls_cust_name

if dw_1.rowcount() < 1 then RETURN
ls_cust_no   = dw_1.object.cust_no[1]
ls_cust_name = dw_1.object.cust_name[1]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
OpenWithParm( w_whopeom_w, lstr_where )

end event

type cbx_1 from checkbox within w_oidcgroup_m2
integer x = 2537
integer y = 268
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
	idwc_cust.setsort( " cust_name A, user_name A ")
	idwc_cust.sort()
	
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setsort( " user_name A, cust_name A")
	idwc_cust.sort()
	
	idwc_cust.setfilter( " user_name LIKE '" + gs_username + "%'")
	idwc_cust.filter()
end if

end event

type cb_6 from commandbutton within w_oidcgroup_m2
integer x = 2958
integer y = 60
integer width = 347
integer height = 144
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전자결재"
end type

event clicked;// 전자결재

if IsValid(w_o_main) then 
	OpenSheet(w_oidcgroupcon_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_oidcgroupcon_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_oidcgroupcon_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_oidcgroupcon_m,  w_all_main, 5, original!)
end if

end event

type st_2 from statictext within w_oidcgroup_m2
integer x = 3374
integer y = 268
integer width = 1440
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "결재취소는 ~'매출할인 결재관리(전자결재)~'"
boolean focusrectangle = false
end type

type st_5 from statictext within w_oidcgroup_m2
integer x = 73
integer y = 400
integer width = 475
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "매출할인_전체보기"
boolean focusrectangle = false
end type

type st_6 from statictext within w_oidcgroup_m2
integer x = 3374
integer y = 324
integer width = 1440
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
string text = "[전결]본부장 10만원, 팀장 5만원까지 가능"
boolean focusrectangle = false
end type

type st_7 from statictext within w_oidcgroup_m2
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

type dw_4 from datawindow within w_oidcgroup_m2
integer x = 206
integer y = 12
integer width = 128
integer height = 100
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidcgroup_r"
boolean livescroll = true
end type

type dw_6 from datawindow within w_oidcgroup_m2
integer x = 1701
integer y = 2592
integer width = 3365
integer height = 156
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidcgroup_m3"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_oidcgroup_m2
integer x = 37
integer y = 228
integer width = 5083
integer height = 164
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type pb_add from picturebutton within w_oidcgroup_m2
integer x = 4805
integer y = 264
integer width = 146
integer height = 108
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

event clicked;// 줄 삽입
string ls_custno

if dw_1.rowcount() < 1 then RETURN

ls_custno = dw_1.object.cust_no[1]
if isnull( ls_custno ) or ls_custno = "" then
else
	dw_5.getchild("scene_code",idwc_scene)		// 현장명
	idwc_scene.SetTransObject(SQLCA)
	idwc_scene.Retrieve( ls_custno )
	
	if dw_5.rowcount() > 10 then
		MessageBox("확인", "거래처 10개 이상의 현장은 한번에 처리 안됩니다.")
	else
		dw_5.insertrow(0)     
	end if
end if

end event

type cbx_2 from checkbox within w_oidcgroup_m2
integer x = 2537
integer y = 324
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

type dw_7 from datawindow within w_oidcgroup_m2
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

type dw_5 from datawindow within w_oidcgroup_m2
event keydown pbm_dwnkey
integer x = 1701
integer y = 1736
integer width = 3365
integer height = 852
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidcgroup_m2"
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

event itemchanged;//
this.accepttext( )

//string ls_scenecode
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

type tab_1 from tab within w_oidcgroup_m2
event create ( )
event destroy ( )
integer x = 123
integer y = 1832
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
end type

on tabpage_1.create
this.cb_7=create cb_7
this.dw_8=create dw_8
this.tv_1=create tv_1
this.cb_8=create cb_8
this.cb_9=create cb_9
this.Control[]={this.cb_7,&
this.dw_8,&
this.tv_1,&
this.cb_8,&
this.cb_9}
end on

on tabpage_1.destroy
destroy(this.cb_7)
destroy(this.dw_8)
destroy(this.tv_1)
destroy(this.cb_8)
destroy(this.cb_9)
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
string ls_rank, ls_usernm, ls_userid
long   ll_row

if isnull(is_user) or is_user = "" then RETURN

ll_row    = tab_1.tabpage_1.dw_8.getrow()
if ll_row < 1 then return

ls_rank   = tab_1.tabpage_1.dw_8.object.rank[ll_row]
ls_usernm = tab_1.tabpage_1.dw_8.object.user_name[ll_row] + "인"
ls_userid = tab_1.tabpage_1.dw_8.object.user_id[ll_row]

choose case is_user
	case "rank2"
		dw_1.object.rank2[1]   = ls_rank		// 결재자 직위
		dw_1.object.user2[1]   = ls_usernm	// 결재자 이름
		dw_1.object.dc_app2[1] = ls_userid	// 결재자 ID
		dw_6.object.rank2[1]   = ls_rank
		
	case "rank3"
		dw_1.object.rank3[1]   = ls_rank		// 결재자 직위
		dw_1.object.user3[1]   = ls_usernm	// 결재자 이름
		dw_1.object.dc_app3[1] = ls_userid	// 결재자 ID
		dw_6.object.rank3[1]   = ls_rank

	case "rank4"
		dw_1.object.rank4[1]   = ls_rank		// 결재자 직위
		dw_1.object.user4[1]   = ls_usernm	// 결재자 이름
		dw_1.object.dc_app4[1] = ls_userid	// 결재자 ID
		dw_6.object.rank4[1]   = ls_rank
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
string text = "취소"
end type

event clicked;//
tab_1.visible = false

end event

type cb_9 from commandbutton within tabpage_1
integer x = 1161
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
string ls_rank, ls_usernm, ls_userid
long   ll_row

if isnull(is_user) or is_user = "" then RETURN

ls_rank   = ""
ls_usernm = ""
ls_userid = ""

choose case is_user
	case "rank2"
		dw_1.object.rank2[1]   = ls_rank		// 결재자 직위
		dw_1.object.user2[1]   = ls_usernm	// 결재자 이름
		dw_1.object.dc_app2[1] = ls_userid	// 결재자 ID
		dw_6.object.rank2[1]   = ls_rank
		
	case "rank3"
		dw_1.object.rank3[1]   = ls_rank		// 결재자 직위
		dw_1.object.user3[1]   = ls_usernm	// 결재자 이름
		dw_1.object.dc_app3[1] = ls_userid	// 결재자 ID
		dw_6.object.rank3[1]   = ls_rank
end choose

tab_1.visible = false

end event

type pb_del from picturebutton within w_oidcgroup_m2
integer x = 4955
integer y = 264
integer width = 146
integer height = 108
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
dw_5.deleterow( dw_5.getrow() )     

end event

type rb_1 from radiobutton within w_oidcgroup_m2
integer x = 1591
integer y = 64
integer width = 402
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "매출할인"
boolean checked = true
end type

event clicked;//
dw_1.Reset()	// DC_GROUP
dw_2.Reset()	// DC_GROUPDET
dw_5.Reset()	// 현장
dw_6.Reset()	// 설명

pb_retrieve.triggerevent( clicked! )

end event

type rb_2 from radiobutton within w_oidcgroup_m2
integer x = 1591
integer y = 116
integer width = 402
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "선수금공제"
end type

event clicked;//
dw_1.Reset()	// DC_GROUP
dw_2.Reset()	// DC_GROUPDET
dw_5.Reset()	// 현장
dw_6.Reset()	// 설명

pb_retrieve.triggerevent( clicked! )

end event

type rb_3 from radiobutton within w_oidcgroup_m2
integer x = 1591
integer y = 168
integer width = 402
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "선수금"
end type

event clicked;//
dw_1.Reset()	// DC_GROUP
dw_2.Reset()	// DC_GROUPDET
dw_5.Reset()	// 현장
dw_6.Reset()	// 설명

pb_retrieve.triggerevent( clicked! )

end event

type rb_4 from radiobutton within w_oidcgroup_m2
integer x = 1883
integer y = 168
integer width = 219
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체"
end type

event clicked;//
dw_1.Reset()	// DC_GROUP
dw_2.Reset()	// DC_GROUPDET
dw_5.Reset()	// 현장
dw_6.Reset()	// 설명

pb_retrieve.triggerevent( clicked! )

end event

type ddlb_op from dropdownlistbox within w_oidcgroup_m2
integer x = 960
integer y = 276
integer width = 302
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

type gb_5 from groupbox within w_oidcgroup_m2
integer x = 1559
integer y = 12
integer width = 562
integer height = 216
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "작업구분"
borderstyle borderstyle = stylebox!
end type

