$PBExportHeader$w_qcsfcaudit_r.srw
$PBExportComments$성형 중간검사 성적서(2005/05/23, 이인호)
forward
global type w_qcsfcaudit_r from w_inheritance
end type
type em_1 from editmask within w_qcsfcaudit_r
end type
type em_2 from editmask within w_qcsfcaudit_r
end type
type st_1 from statictext within w_qcsfcaudit_r
end type
type dw_area from datawindow within w_qcsfcaudit_r
end type
type dw_3 from datawindow within w_qcsfcaudit_r
end type
type dw_4 from datawindow within w_qcsfcaudit_r
end type
type dw_5 from datawindow within w_qcsfcaudit_r
end type
type dw_6 from datawindow within w_qcsfcaudit_r
end type
type dw_7 from datawindow within w_qcsfcaudit_r
end type
type dw_8 from datawindow within w_qcsfcaudit_r
end type
type st_2 from statictext within w_qcsfcaudit_r
end type
type st_3 from statictext within w_qcsfcaudit_r
end type
type st_4 from statictext within w_qcsfcaudit_r
end type
end forward

global type w_qcsfcaudit_r from w_inheritance
integer width = 3616
integer height = 2272
string title = "성형 중간검사 성적서(w_qcsfcaudit_r)"
em_1 em_1
em_2 em_2
st_1 st_1
dw_area dw_area
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
dw_6 dw_6
dw_7 dw_7
dw_8 dw_8
st_2 st_2
st_3 st_3
st_4 st_4
end type
global w_qcsfcaudit_r w_qcsfcaudit_r

type variables
st_print i_print

end variables

forward prototypes
public subroutine wf_ret (string as_area, string as_wc, date ad_start, date ad_end)
public subroutine wf_qamove (datawindow adw_dw, long al_row, long al_tot, integer al_cnt)
public subroutine wf_lotmove (datawindow al_dw, long al_row, long al_dw4row, integer al_cnt)
public subroutine wf_dw6move (string as_area, string as_name, string as_qacode, long al_dw3row, long al_dw1row1, string as_item, string as_wc, date ad_date)
public subroutine wf_dw7move (string as_area, string as_name, string as_qacode, long al_dw3row, long al_dw1row1, string as_item, string as_wc, date ad_date, string as_flag)
public subroutine wf_dw8move (string as_area, string as_name, string as_qacode, long al_dw3row, long al_dw1row1, string as_item, string as_wc, date ad_date)
public subroutine wf_dw7tmp (string as_area, integer al_dw3row, integer al_dw6row, string as_wc, string as_item, string as_flag)
public subroutine wf_dw8tmp (string as_area, integer al_dw3row, integer al_dw6row, string as_wc, string as_item)
protected subroutine wf_dw6tmp (string as_area, long al_dw3row, long al_dw6row, string as_wc, string as_item)
end prototypes

public subroutine wf_ret (string as_area, string as_wc, date ad_start, date ad_end);boolean lb_found
long ll_breakrow, ll_dw6row1, ll_dw6row2, ll_dw3row, ll_dw4row 
long ll_row, ll_samegroup, ll_cnt1, ll_cnt2, ll_dw3rowcount, ll_nextbreakrow
string ls_name, ls_qacode
string ls_arryqa[], ls_null, ls_item, ls_flag
date ld_date

DataWindowChild   ldwc_1,ldwc_2 ,ldwc_3 
datawindow ldw_qa

setnull(ls_null)
dw_1.DataObject = "d_qcaudittot_r"    // "composite_report_name" 
dw_1.GetChild ("dw_1", ldwc_1)        // ("embedded_report_name", dwc) 
dw_1.GetChild ("dw_2", ldwc_2) 
dw_1.GetChild ("dw_3", ldwc_3) 
dw_6.ShareData (ldwc_1) 
dw_7.ShareData (ldwc_2) 
dw_8.ShareData (ldwc_3) 

select work_name into :ls_name from wc
 where work_no = :as_wc;
select mc_code into :ls_qacode from qcmctype
 where wc_no = :as_wc;
//select user_name into :ls_user from login
// where user_id = :gs_userid;

ll_breakrow = 0
ll_samegroup = 0  // 같은 그룹이면서 규격의 갯수가 20개를 넘을때 +1
ll_cnt1 = 1 // 규격의 1~20의 위치
ll_cnt2 = 1 // lot_no 의 1~ 12 위치
ll_dw3rowcount = dw_3.rowcount()
for ll_dw3row = 1 to ll_dw3rowcount
	ll_breakrow = dw_3.FindGroupChange( ll_dw3row, 1)
	IF (ll_breakrow <> 0 and ll_breakrow = ll_dw3row) or mod(ll_dw3row,20) = 1 THEN //그룹이 바뀜 또는 20개가 넘음
		if ll_breakrow <> 0 then
			ll_samegroup = 0
		end if
		ll_nextbreakrow = dw_3.FindGroupChange( ll_breakrow + 1, 1)
		if ll_nextbreakrow = 0 then ll_nextbreakrow = dw_3.rowcount()
		ll_samegroup = ll_samegroup + 1
		ls_flag = dw_3.object.flag[ll_dw3row]
		if ll_dw6row2 > ll_dw6row1 then  //이전에 작업한 lot가 12개를 넘어 row를 추가함
//			ll_dw6row1 = ll_dw6row2			//20060522작업
		else
			choose case LeftA(ls_flag,1)
				case '1'
					ll_dw6row1 = dw_6.insertrow(0)
				case '2'
					ll_dw6row1 = dw_7.insertrow(0)
				case '3'
					ll_dw6row1 = dw_8.insertrow(0)
			end choose
		end if
		ls_item = dw_3.object.item_no[ll_dw3row]
		ld_date = date(dw_3.object.cdate[ll_dw3row])
		choose case LeftA(ls_flag,1)
			case '1'
				ldw_qa = dw_6
				wf_dw6move(as_area, ls_name, ls_qacode, ll_dw3row, ll_dw6row1, ls_item, as_wc, ld_date)
			case '2'
				ldw_qa = dw_7
				wf_dw7move(as_area, ls_name, ls_qacode, ll_dw3row, ll_dw6row1, ls_item, as_wc, ld_date, ls_flag)
			case '3'
				ldw_qa = dw_8
				wf_dw8move(as_area, ls_name, ls_qacode, ll_dw3row, ll_dw6row1, ls_item, as_wc, ld_date)
		end choose
		for ll_row = 1 to UPPERBOUND(ls_arryqa)
			ls_arryqa[ll_row] = ls_null 
		next
		ll_cnt1 = 1
	end if
	wf_qamove(ldw_qa, ll_dw6row1, ll_dw3row, ll_cnt1)
	ls_arryqa[ll_cnt1] = LeftA(dw_3.object.qa[ll_dw3row],13)  // 길이를 뺸 규격만 모은다.
	if ll_dw3row = ll_nextbreakrow -1 then  // 그룹이 바뀌기 바로전 = 그룹의 마지막 로우.
		dw_4.retrieve(as_area, as_wc, ld_date, ls_item, ls_arryqa[] )
		ll_cnt2 = 1
		for ll_dw4row = 1 to dw_4.rowcount()
			if ll_dw4row <= dw_4.rowcount() then
				IF mod(ll_dw4row, 12) = 1 THEN //lot row가  1이거나 12이면서 dw_6이 row =0 일떄
					choose case LeftA(ls_flag,1)
						case '1'
							ldw_qa = dw_6
							if dw_6.rowcount() = 0 then
								ll_dw6row2 = dw_6.insertrow(0)
								wf_dw6move(as_area, ls_name, ls_qacode, ll_dw3row, ll_dw6row1, ls_item, as_wc, ld_date)
								ll_cnt2 = 1
							else
								ll_dw6row2 = ll_dw6row1 - (ll_samegroup -1)
							end if
						case '2'
							ldw_qa = dw_7
							if dw_7.rowcount() = 0 then
								ll_dw6row2 = dw_7.insertrow(0)
								wf_dw7move(as_area, ls_name, ls_qacode, ll_dw3row, ll_dw6row1, ls_item, as_wc, ld_date, ls_flag)
								ll_cnt2 = 1
							else
								ll_dw6row2 = ll_dw6row1 - (ll_samegroup -1)
							end if
						case '3'
							ldw_qa = dw_8
							if dw_8.rowcount() = 0 then
								ll_dw6row2 = dw_8.insertrow(0)
								wf_dw8move(as_area, ls_name, ls_qacode, ll_dw3row, ll_dw6row1, ls_item, as_wc, ld_date)
								ll_cnt2 = 1
							else
								ll_dw6row2 = ll_dw6row1 - (ll_samegroup -1)
							end if
					end choose
				end if
				wf_lotmove(ldw_qa, ll_dw6row2, ll_dw4row, ll_cnt2)
				ll_cnt2 = ll_cnt2 + 1
			end if
		next
	end if
	ll_cnt1 = ll_cnt1 + 1
	
	if dw_7.rowcount() = 1 then
		int i
		i = dw_7.rowcount()
	end if

/*
	2006.05.18
	규격별 실측정값
	<-- 원본소스시작 -->						

	<-- 원본소스끝 -->						

	<-- 소스변경시작 -->						
*/					
		choose case LeftA(ls_flag,1)
			case '1'
				ldw_qa = dw_6
				wf_dw6tmp(as_area, ll_dw3row, ll_dw6row1, as_wc, ls_item)
			case '2'
				ldw_qa = dw_7
				wf_dw7tmp(as_area, ll_dw3row, ll_dw6row1, as_wc, ls_item, ls_flag)
			case '3'
				ldw_qa = dw_8
				wf_dw8tmp(as_area, ll_dw3row, ll_dw6row1, as_wc, ls_item)
		end choose
/*
	<-- 소스변경끝 -->
*/	
next
end subroutine

public subroutine wf_qamove (datawindow adw_dw, long al_row, long al_tot, integer al_cnt);choose case al_cnt
	case 1
		adw_dw.object.qa1[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty1[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 2
		adw_dw.object.qa2[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty2[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 3
		adw_dw.object.qa3[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty3[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 4
		adw_dw.object.qa4[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty4[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 5
		adw_dw.object.qa5[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty5[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 6
		adw_dw.object.qa6[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty6[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 7
		adw_dw.object.qa7[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty7[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 8
		adw_dw.object.qa8[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty8[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 9
		adw_dw.object.qa9[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty9[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 10
		adw_dw.object.qa10[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty10[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 11
		adw_dw.object.qa11[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty11[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 12
		adw_dw.object.qa12[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty12[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 13
		adw_dw.object.qa13[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty13[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 14
		adw_dw.object.qa14[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty14[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 15
		adw_dw.object.qa15[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty15[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 16
		adw_dw.object.qa16[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty16[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 17
		adw_dw.object.qa17[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty17[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 18
		adw_dw.object.qa18[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty18[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 19
		adw_dw.object.qa19[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty19[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
	case 0
		adw_dw.object.qa20[al_row] = dw_3.object.qa2[al_tot]
		adw_dw.object.qty20[al_row] = string(dw_3.object.qty[al_tot],'##,###,##0')
end choose

end subroutine

public subroutine wf_lotmove (datawindow al_dw, long al_row, long al_dw4row, integer al_cnt);choose case al_cnt
	case 1
		al_dw.object.lot_no1[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt1[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 2
		al_dw.object.lot_no2[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt2[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 3
		al_dw.object.lot_no3[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt3[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 4
		al_dw.object.lot_no4[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt4[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 5
		al_dw.object.lot_no5[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt5[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 6
		al_dw.object.lot_no6[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt6[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 7
		al_dw.object.lot_no7[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt7[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 8
		al_dw.object.lot_no8[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt8[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 9
		al_dw.object.lot_no9[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt9[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 10
		al_dw.object.lot_no10[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt10[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 11
		al_dw.object.lot_no11[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt11[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
	case 0
		al_dw.object.lot_no12[al_row] = dw_4.object.coil_no[al_dw4row]
		al_dw.object.cnt12[al_row] = string(dw_4.object.cnt[al_dw4row],'#,##0')
end choose

end subroutine

public subroutine wf_dw6move (string as_area, string as_name, string as_qacode, long al_dw3row, long al_dw1row1, string as_item, string as_wc, date ad_date);dec ld_lenf, ld_lent, ld_wid1f, ld_wid1t, ld_hig1f, ld_hig1t

dw_5.dataobject = 'd_qcauditsfc_h1'
dw_5.settransobject(sqlca)
dw_5.retrieve(as_area, as_wc, ad_date )

select lenf, lent, wid1f, wid1t, hig1f, hig1t 
  into :ld_lenf, :ld_lent, :ld_wid1f, :ld_wid1t, :ld_hig1f, :ld_hig1t from qcitemstd
 where area_no = :as_area
	and :as_item LIKE RTRIM(item_no);


dw_6.object.wc_name[al_dw1row1] = as_name
dw_6.object.item_name[al_dw1row1] = dw_3.object.item_name[al_dw3row]
dw_6.object.qc_date[al_dw1row1] = date(dw_3.object.cdate[al_dw3row])
//dw_6.object.qc_user[al_dw1row1] = as_user
dw_6.object.qc_type[al_dw1row1] = as_qacode

dw_6.object.std_len[al_dw1row1] = string(ld_lenf, '#0') + " ∼ " + string(ld_lent, '#0')
dw_6.object.std_side[al_dw1row1] = string(ld_wid1f, '##0.0') + " ∼ " + string(ld_wid1t, '##0.0')
dw_6.object.std_height[al_dw1row1] = string(ld_hig1f, '##0.0') + " ∼ " + string(ld_hig1t, '##0.0')
if dw_5.rowcount() > 0 then
	dw_6.object.qc_user[al_dw1row1] = dw_5.object.qc_user[1]
	dw_6.object.len_x1[al_dw1row1] = string(dw_5.object.length1[1])
	dw_6.object.len_x2[al_dw1row1] = string(dw_5.object.length2[1])
	dw_6.object.len_x3[al_dw1row1] = string(dw_5.object.length3[1])
	dw_6.object.side_x1[al_dw1row1] = string(dw_5.object.width1[1])
	dw_6.object.side_x2[al_dw1row1] = string(dw_5.object.width2[1])
	dw_6.object.side_x3[al_dw1row1] = string(dw_5.object.width3[1])
	dw_6.object.height_x1[al_dw1row1] = string(dw_5.object.height1[1])
	dw_6.object.height_x2[al_dw1row1] = string(dw_5.object.height2[1])
	dw_6.object.height_x3[al_dw1row1] = string(dw_5.object.height3[1])
end if 

end subroutine

public subroutine wf_dw7move (string as_area, string as_name, string as_qacode, long al_dw3row, long al_dw1row1, string as_item, string as_wc, date ad_date, string as_flag);
dw_5.dataobject = 'd_qcauditsfc_h2'
dw_5.settransobject(sqlca)
dw_5.retrieve(as_area, as_wc, ad_date )


dw_7.object.wc_name[al_dw1row1] = as_name
dw_7.object.item_name[al_dw1row1] = dw_3.object.item_name[al_dw3row]
dw_7.object.qc_date[al_dw1row1] = date(dw_3.object.cdate[al_dw3row])
//dw_7.object.qc_user[al_dw1row1] = as_user
dw_7.object.qc_type[al_dw1row1] = as_qacode

if dw_5.rowcount() > 0 then
//	dw_7.object.qc_user[al_dw1row1] = dw_5.object.wname[1]
	dw_7.object.qc_user[al_dw1row1] = dw_5.object.qc_user[1]
	dw_7.object.size1[al_dw1row1] = string(dw_5.object.side1[1])
	dw_7.object.size2[al_dw1row1] = string(dw_5.object.side2[1])
	dw_7.object.size3[al_dw1row1] = string(dw_5.object.side3[1])
	dw_7.object.size4[al_dw1row1] = string(dw_5.object.side4[1])
	dw_7.object.size5[al_dw1row1] = string(dw_5.object.side5[1])
	if MidA(as_flag, 2, 1) = 'A' then
		dw_7.object.height_r1[al_dw1row1] = string(dw_5.object.height_r1[1])
		dw_7.object.height_r2[al_dw1row1] = string(dw_5.object.height_r2[1])
		dw_7.object.height_r3[al_dw1row1] = string(dw_5.object.height_r3[1])
		dw_7.object.height_r4[al_dw1row1] = string(dw_5.object.height_r4[1])
		dw_7.object.height_r5[al_dw1row1] = string(dw_5.object.height_r5[1])
		dw_7.object.rib1[al_dw1row1] 		 = string(dw_5.object.rib1[1])
		dw_7.object.rib2[al_dw1row1] 		 = string(dw_5.object.rib2[1])
		dw_7.object.rib3[al_dw1row1] 		 = string(dw_5.object.rib3[1])
		dw_7.object.rib4[al_dw1row1] 		 = string(dw_5.object.rib4[1])
		dw_7.object.rib5[al_dw1row1] 		 = string(dw_5.object.rib5[1])
		dw_7.object.length_r1[al_dw1row1] = string(dw_5.object.length_r1[1])
		dw_7.object.length_r2[al_dw1row1] = string(dw_5.object.length_r2[1])
		dw_7.object.length_r3[al_dw1row1] = string(dw_5.object.length_r3[1])
		dw_7.object.length_r4[al_dw1row1] = string(dw_5.object.length_r4[1])
		dw_7.object.length_r5[al_dw1row1] = string(dw_5.object.length_r5[1])
	else
		dw_7.object.height_k1[al_dw1row1] = string(dw_5.object.height_k1[1])
		dw_7.object.height_k2[al_dw1row1] = string(dw_5.object.height_k2[1])
		dw_7.object.height_k3[al_dw1row1] = string(dw_5.object.height_k3[1])
		dw_7.object.height_k4[al_dw1row1] = string(dw_5.object.height_k4[1])
		dw_7.object.height_k5[al_dw1row1] = string(dw_5.object.height_k5[1])
		dw_7.object.length_k1[al_dw1row1] = string(dw_5.object.length_k1[1])
		dw_7.object.length_k2[al_dw1row1] = string(dw_5.object.length_k2[1])
		dw_7.object.length_k3[al_dw1row1] = string(dw_5.object.length_k3[1])
		dw_7.object.length_k4[al_dw1row1] = string(dw_5.object.length_k4[1])
		dw_7.object.length_k5[al_dw1row1] = string(dw_5.object.length_k5[1])
	end if
end if 

end subroutine

public subroutine wf_dw8move (string as_area, string as_name, string as_qacode, long al_dw3row, long al_dw1row1, string as_item, string as_wc, date ad_date);
dw_5.dataobject = 'd_qcauditsfc_h3'
dw_5.settransobject(sqlca)
dw_5.retrieve(as_area, as_wc, ad_date )

dw_8.object.wc_name[al_dw1row1] = as_name
dw_8.object.item_name[al_dw1row1] = dw_3.object.item_name[al_dw3row]
dw_8.object.qc_date[al_dw1row1] = date(dw_3.object.cdate[al_dw3row])
//dw_8.object.qc_user[al_dw1row1] = as_user
dw_8.object.qc_type[al_dw1row1] = as_qacode

if dw_5.rowcount() > 0 then
	dw_8.object.qc_user[al_dw1row1] = dw_5.object.qc_user[1]
	dw_8.object.length_x1[al_dw1row1] = string(dw_5.object.length_x1[1])
	dw_8.object.length_x2[al_dw1row1] = string(dw_5.object.length_x2[1])
	dw_8.object.length_x3[al_dw1row1] = string(dw_5.object.length_x3[1])
	dw_8.object.length_x4[al_dw1row1] = string(dw_5.object.length_x4[1])
	dw_8.object.length_x5[al_dw1row1] = string(dw_5.object.length_x5[1])
	dw_8.object.width1_x1[al_dw1row1] = string(dw_5.object.width1_x1[1])
	dw_8.object.width1_x2[al_dw1row1] = string(dw_5.object.width1_x2[1])
	dw_8.object.width1_x3[al_dw1row1] = string(dw_5.object.width1_x3[1])
	dw_8.object.width1_x4[al_dw1row1] = string(dw_5.object.width1_x4[1])
	dw_8.object.width1_x5[al_dw1row1] = string(dw_5.object.width1_x5[1])
	dw_8.object.width2_x1[al_dw1row1] = string(dw_5.object.width2_x1[1])
	dw_8.object.width2_x2[al_dw1row1] = string(dw_5.object.width2_x2[1])
	dw_8.object.width2_x3[al_dw1row1] = string(dw_5.object.width2_x3[1])
	dw_8.object.width2_x4[al_dw1row1] = string(dw_5.object.width2_x4[1])
	dw_8.object.width2_x5[al_dw1row1] = string(dw_5.object.width2_x5[1])
	dw_8.object.height1_x1[al_dw1row1] = string(dw_5.object.height1_x1[1])
	dw_8.object.height1_x2[al_dw1row1] = string(dw_5.object.height1_x2[1])
	dw_8.object.height1_x3[al_dw1row1] = string(dw_5.object.height1_x3[1])
	dw_8.object.height1_x4[al_dw1row1] = string(dw_5.object.height1_x4[1])
	dw_8.object.height1_x5[al_dw1row1] = string(dw_5.object.height1_x5[1])
	dw_8.object.height2_x1[al_dw1row1] = string(dw_5.object.height2_x1[1])
	dw_8.object.height2_x2[al_dw1row1] = string(dw_5.object.height2_x2[1])
	dw_8.object.height2_x3[al_dw1row1] = string(dw_5.object.height2_x3[1])
	dw_8.object.height2_x4[al_dw1row1] = string(dw_5.object.height2_x4[1])
	dw_8.object.height2_x5[al_dw1row1] = string(dw_5.object.height2_x5[1])
end if 

end subroutine

public subroutine wf_dw7tmp (string as_area, integer al_dw3row, integer al_dw6row, string as_wc, string as_item, string as_flag);				
	string t_ls_thick, t_ls_wid, t_ls_hig, t_ls_len, t_ls_nameqa, t_ls_nameqty, t_ls_tmp, t_ls_side
	dec t_ld_lend, t_ld_side, t_ld_rib, t_ld_wid, t_ld_hig, t_ld_rand
	integer t_i, t_j, t_qacnt, t_namecnt ,t_rand
	long t_ll_maxcnt, t_ll_cnttmp, t_ll_tmp
	
	t_ll_maxcnt = 0
	t_ll_cnttmp = 0
	t_namecnt   = 0
	
	For t_i = 1 to 20
		t_ls_nameqa  = "qa"  + string(t_i)
		t_ls_nameqty = "qty" + string(t_i)		
		
		If t_ll_maxcnt < long(dw_7.getitemstring( al_dw6row, t_ls_nameqty)) Then
			t_ll_maxcnt = long(dw_7.getitemstring( al_dw6row, t_ls_nameqty))	
			t_ls_thick = ""
			t_ls_wid = ""
			t_ls_hig = ""
			t_ls_len = ""		
			t_qacnt = LenA(dw_7.getitemstring( al_dw6row, t_ls_nameqa))
			For t_j = 1 to t_qacnt		
				t_ls_tmp = MidA(dw_7.getitemstring( al_dw6row, t_ls_nameqa),t_j,1)
				If t_ls_tmp = "*" Then
					t_namecnt++
				Else
					Choose Case t_namecnt
						Case 0
							t_ls_thick = t_ls_thick + t_ls_tmp	//두께
						Case 1
							t_ls_wid = t_ls_wid + t_ls_tmp	//높이
						Case 2
							t_ls_hig = t_ls_hig + t_ls_tmp	//변 + 립
						Case 3
							t_ls_len = t_ls_len + t_ls_tmp	//길이
					End Choose
				End If
			Next
			t_namecnt = 0
		End If
	Next
	t_ls_side = LeftA(t_ls_hig,2)	//변
	t_ls_hig = RightA(t_ls_hig,2)	//립
		
	Randomize(1)
	t_rand = Rand(3)

	select len, side, rib, wid, hig
	into :t_ld_lend, :t_ld_side, :t_ld_rib, :t_ld_wid, :t_ld_hig from qcitemtemp
	where area_no = :as_area
	and :as_item LIKE RTRIM(item_no)
	and rnd = :t_rand;
	

	dw_7.object.qc_user[al_dw6row] = '김양권'
	dw_7.object.size1[al_dw6row] = string(long(t_ls_side) + t_ld_side, '#0.0')
	dw_7.object.size2[al_dw6row] = string(long(t_ls_side) + t_ld_side, '#0.0')
	dw_7.object.size3[al_dw6row] = string(long(t_ls_side) + t_ld_side, '#0.0')
//	dw_7.object.size4[al_dw6row] = string(long(t_ls_side) + t_ld_side, '#0.0')
//	dw_7.object.size5[al_dw6row] = string(long(t_ls_side) + t_ld_side, '#0.0')
	if MidA(as_flag, 2, 1) = 'A' then
		dw_7.object.height_r1[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
		dw_7.object.height_r2[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
		dw_7.object.height_r3[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
//		dw_7.object.height_r4[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
//		dw_7.object.height_r5[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
		dw_7.object.rib1[al_dw6row] 		= string(long(t_ls_hig) + t_ld_rib, '#0.0')
		dw_7.object.rib2[al_dw6row] 		= string(long(t_ls_hig) + t_ld_rib, '#0.0')
		dw_7.object.rib3[al_dw6row] 		= string(long(t_ls_hig) + t_ld_rib, '#0.0')
//		dw_7.object.rib4[al_dw6row] 		= string(long(t_ls_hig) + t_ld_rib, '#0.0')
//		dw_7.object.rib5[al_dw6row] 		= string(long(t_ls_hig) + t_ld_rib, '#0.0')
		dw_7.object.length_r1[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
		dw_7.object.length_r2[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
		dw_7.object.length_r3[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
//		dw_7.object.length_r4[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
//		dw_7.object.length_r5[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
	else
		dw_7.object.height_k1[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
		dw_7.object.height_k2[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
		dw_7.object.height_k3[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
//		dw_7.object.height_k4[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
//		dw_7.object.height_k5[al_dw6row] = string(long(t_ls_wid) + t_ld_hig, '#0.0')
		dw_7.object.length_k1[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
		dw_7.object.length_k2[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
		dw_7.object.length_k3[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
//		dw_7.object.length_k4[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
//		dw_7.object.length_k5[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
	end if
end subroutine

public subroutine wf_dw8tmp (string as_area, integer al_dw3row, integer al_dw6row, string as_wc, string as_item);				
	string t_ls_thick, t_ls_wid, t_ls_hig, t_ls_len, t_ls_nameqa, t_ls_nameqty, t_ls_tmp
	dec t_ld_lend, t_ld_side, t_ld_rib, t_ld_wid, t_ld_hig
	integer t_i, t_j, t_qacnt, t_namecnt, t_rand
	long t_ll_maxcnt, t_ll_cnttmp, t_ll_tmp
	
	t_ll_maxcnt = 0
	t_ll_cnttmp = 0
	t_namecnt   = 0
	
	For t_i = 1 to 20
		t_ls_nameqa  = "qa"  + string(t_i)
		t_ls_nameqty = "qty" + string(t_i)		
		
		If t_ll_maxcnt < long(dw_8.getitemstring( al_dw6row, t_ls_nameqty)) Then
			t_ll_maxcnt = long(dw_8.getitemstring( al_dw6row, t_ls_nameqty))	
			t_ls_thick = ""
			t_ls_wid = ""
			t_ls_hig = ""
			t_ls_len = ""		
			t_qacnt = LenA(dw_8.getitemstring( al_dw6row, t_ls_nameqa))
			For t_j = 1 to t_qacnt		
				t_ls_tmp = MidA(dw_8.getitemstring( al_dw6row, t_ls_nameqa),t_j,1)
				If t_ls_tmp = "*" Then
					t_namecnt++
				Else
					Choose Case t_namecnt
						Case 0
							t_ls_thick = t_ls_thick + t_ls_tmp
						Case 1
							t_ls_wid = t_ls_wid + t_ls_tmp
						Case 2
							t_ls_hig = t_ls_hig + t_ls_tmp
						Case 3
							t_ls_len = t_ls_len + t_ls_tmp
					End Choose
				End If
			Next
			t_namecnt = 0

		End If
	Next
		
	Randomize(1)
	t_rand = Rand(3)

	select len, side, rib, wid, hig
	into :t_ld_lend, :t_ld_side, :t_ld_rib, :t_ld_wid, :t_ld_hig from qcitemtemp
	where area_no = :as_area
	and :as_item LIKE RTRIM(item_no)
	and rnd = :t_rand;
	
	dw_8.object.qc_user[al_dw6row] = "김양권"
	dw_8.object.length_x1[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
	dw_8.object.length_x2[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
	dw_8.object.length_x3[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
//	dw_8.object.length_x4[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
//	dw_8.object.length_x5[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
	dw_8.object.width1_x1[al_dw6row] = string(long(t_ls_wid) + t_ld_wid, '#0.0')
	dw_8.object.width1_x2[al_dw6row] = string(long(t_ls_wid) + t_ld_wid, '#0.0')
	dw_8.object.width1_x3[al_dw6row] = string(long(t_ls_wid) + t_ld_wid, '#0.0')
//	dw_8.object.width1_x4[al_dw6row] = string(long(t_ls_wid) + t_ld_wid, '#0.0')
//	dw_8.object.width1_x5[al_dw6row] = string(long(t_ls_wid) + t_ld_wid, '#0.0')
	dw_8.object.width2_x1[al_dw6row] = ''
	dw_8.object.width2_x2[al_dw6row] = ''
	dw_8.object.width2_x3[al_dw6row] = ''
//	dw_8.object.width2_x4[al_dw6row] = ''
//	dw_8.object.width2_x5[al_dw6row] = ''
	dw_8.object.height1_x1[al_dw6row] = string(long(t_ls_hig) + t_ld_hig, '#0.0')
	dw_8.object.height1_x2[al_dw6row] = string(long(t_ls_hig) + t_ld_hig, '#0.0')
	dw_8.object.height1_x3[al_dw6row] = string(long(t_ls_hig) + t_ld_hig, '#0.0')
//	dw_8.object.height1_x4[al_dw6row] = string(long(t_ls_hig) + t_ld_hig, '#0.0')
//	dw_8.object.height1_x5[al_dw6row] = string(long(t_ls_hig) + t_ld_hig, '#0.0')
	dw_8.object.height2_x1[al_dw6row] = ''
	dw_8.object.height2_x2[al_dw6row] = ''
	dw_8.object.height2_x3[al_dw6row] = ''
//	dw_8.object.height2_x4[al_dw6row] = ''
//	dw_8.object.height2_x5[al_dw6row] = ''




end subroutine

protected subroutine wf_dw6tmp (string as_area, long al_dw3row, long al_dw6row, string as_wc, string as_item);				
	string t_ls_thick, t_ls_wid, t_ls_hig, t_ls_len, t_ls_nameqa, t_ls_nameqty, t_ls_tmp
	dec t_ld_lend, t_ld_side, t_ld_rib, t_ld_wid, t_ld_hig
	integer t_i, t_j, t_qacnt, t_namecnt, t_rand
	long t_ll_maxcnt, t_ll_cnttmp, t_ll_tmp
	
	t_ll_maxcnt = 0
	t_ll_cnttmp = 0
	t_namecnt   = 0
	
	For t_i = 1 to 20
		t_ls_nameqa  = "qa"  + string(t_i)
		t_ls_nameqty = "qty" + string(t_i)		
		
		If t_ll_maxcnt < long(dw_6.getitemstring( al_dw6row, t_ls_nameqty)) Then
			t_ll_maxcnt = long(dw_6.getitemstring( al_dw6row, t_ls_nameqty))	
			t_ls_thick = ""
			t_ls_wid = ""
			t_ls_hig = ""
			t_ls_len = ""		
			t_qacnt = LenA(dw_6.getitemstring( al_dw6row, t_ls_nameqa))
			For t_j = 1 to t_qacnt		
				t_ls_tmp = MidA(dw_6.getitemstring( al_dw6row, t_ls_nameqa),t_j,1)
				If t_ls_tmp = "*" Then
					t_namecnt++
				Else
					Choose Case t_namecnt
						Case 0
							t_ls_thick = t_ls_thick + t_ls_tmp
						Case 1
							t_ls_wid = t_ls_wid + t_ls_tmp
						Case 2
							t_ls_hig = t_ls_hig + t_ls_tmp
						Case 3
							t_ls_len = t_ls_len + t_ls_tmp
					End Choose
				End If
			Next
			t_namecnt = 0
//			t_ls_len = Right(dw_6.getitemstring( al_dw6row, t_ls_nameqa),4)
		End If
	Next
		
	Randomize(1)
	t_rand = Rand(3)

	select len, side, rib, wid, hig
	into :t_ld_lend, :t_ld_side, :t_ld_rib, :t_ld_wid, :t_ld_hig from qcitemtemp
	where area_no = :as_area
	and :as_item LIKE RTRIM(item_no)
	and rnd = :t_rand;
	
	dw_6.object.qc_user[al_dw6row] = "김양권"
	dw_6.object.len_x1[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
	dw_6.object.len_x2[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
	dw_6.object.len_x3[al_dw6row] = string(long(t_ls_len) + t_ld_lend, '#0.0')
	dw_6.object.side_x1[al_dw6row] = string(long(t_ls_wid) + t_ld_wid, '#0.0')
	dw_6.object.side_x2[al_dw6row] = string(long(t_ls_wid) + t_ld_wid, '#0.0')
	dw_6.object.side_x3[al_dw6row] = string(long(t_ls_wid) + t_ld_wid, '#0.0')
	dw_6.object.height_x1[al_dw6row] = string(long(t_ls_hig) + t_ld_hig, '#0.0')
	dw_6.object.height_x2[al_dw6row] = string(long(t_ls_hig) + t_ld_hig, '#0.0')
	dw_6.object.height_x3[al_dw6row] = string(long(t_ls_hig) + t_ld_hig, '#0.0')




end subroutine

on w_qcsfcaudit_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_area=create dw_area
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_7=create dw_7
this.dw_8=create dw_8
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.dw_6
this.Control[iCurrent+9]=this.dw_7
this.Control[iCurrent+10]=this.dw_8
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.st_4
end on

on w_qcsfcaudit_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(), "YYYY/MM/DD")

dw_3.visible = false
dw_4.visible = false
dw_5.visible = false
dw_6.visible = false
dw_7.visible = false
dw_8.visible = false
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

dw_2.insertrow(0)

em_1.setfocus()


dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

end event

type pb_save from w_inheritance`pb_save within w_qcsfcaudit_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_qcsfcaudit_r
integer x = 18
integer y = 356
integer width = 3543
integer height = 1792
integer taborder = 30
string dataobject = "d_qcaudittot_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_qcsfcaudit_r
integer x = 1056
integer y = 248
integer width = 837
integer height = 80
integer taborder = 40
string dataobject = "d_whwc_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::losefocus;call super::losefocus;this.accepttext()
end event

type st_title from w_inheritance`st_title within w_qcsfcaudit_r
integer x = 32
integer width = 1312
string text = "성형 중간검사 성적서"
end type

type st_tips from w_inheritance`st_tips within w_qcsfcaudit_r
end type

type pb_compute from w_inheritance`pb_compute within w_qcsfcaudit_r
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_qcsfcaudit_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_qcsfcaudit_r
integer x = 3337
integer y = 48
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_qcsfcaudit_r
integer x = 3145
integer y = 48
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

i_print.st_datawindow = dw_1
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 여신현황을 출력합니다." 

OpenWithParm(w_printsetup, i_print) 

//IF dw_1.getrow() <= 0 THEN
//   RETURN
//END IF

//i_print.st_datawindow = dw_1
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 중간 검사 성적서을 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_qcsfcaudit_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_qcsfcaudit_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_qcsfcaudit_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_qcsfcaudit_r
integer x = 2953
integer y = 48
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_wc
date ld_start, ld_end

dw_area.accepttext()
dw_2.accepttext()
ls_area = dw_area.object.area[1]
ls_wc = dw_2.object.wc_no[1]

ld_start = date(em_1.text)
ld_end = date(em_2.text)
dw_1.setredraw(false)
dw_1.reset()
dw_6.reset()
dw_7.reset()
dw_8.reset()
pointer oldpointer

oldpointer = SetPointer(HourGlass!)

if dw_3.retrieve(ls_area, ls_wc, ld_start, ld_end ) < 1 then
	messagebox("확인","해당일에 조회한 자료가 없습니다",Exclamation!)
else
	wf_ret(ls_area, ls_wc, ld_start, ld_end )
end if
SetPointer(oldpointer)
dw_1.setredraw(true)
//○ : 양호 ∧ : 요교환 ◇ : 요조정 ∨ : 요수리

end event

type gb_3 from w_inheritance`gb_3 within w_qcsfcaudit_r
boolean visible = false
integer x = 2779
integer y = 40
integer width = 160
integer height = 184
integer taborder = 80
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_qcsfcaudit_r
integer x = 18
integer y = 212
integer width = 3520
integer height = 136
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_qcsfcaudit_r
integer x = 2926
integer y = 8
integer width = 626
integer taborder = 0
end type

type em_1 from editmask within w_qcsfcaudit_r
integer x = 2121
integer y = 248
integer width = 411
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_qcsfcaudit_r
integer x = 2642
integer y = 248
integer width = 407
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_qcsfcaudit_r
integer x = 2551
integer y = 240
integer width = 78
integer height = 88
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_qcsfcaudit_r
integer x = 274
integer y = 248
integer width = 503
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type dw_3 from datawindow within w_qcsfcaudit_r
integer x = 1463
integer y = 4
integer width = 73
integer height = 68
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_qcaudit_h1"
boolean border = false
end type

type dw_4 from datawindow within w_qcsfcaudit_r
integer x = 1554
integer width = 64
integer height = 60
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_qcaudit_h2"
boolean border = false
end type

type dw_5 from datawindow within w_qcsfcaudit_r
integer x = 1632
integer width = 78
integer height = 60
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_qcauditsfc_h1"
boolean border = false
end type

type dw_6 from datawindow within w_qcsfcaudit_r
integer x = 2117
integer width = 78
integer height = 60
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_qcaudit_r1"
boolean border = false
end type

type dw_7 from datawindow within w_qcsfcaudit_r
integer x = 2203
integer width = 78
integer height = 60
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_qcaudit_r2"
boolean border = false
boolean livescroll = true
end type

type dw_8 from datawindow within w_qcsfcaudit_r
integer x = 2295
integer width = 78
integer height = 60
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_qcaudit_r3"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_qcsfcaudit_r
integer x = 37
integer y = 260
integer width = 242
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_qcsfcaudit_r
integer x = 809
integer y = 260
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "작업장:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_qcsfcaudit_r
integer x = 1943
integer y = 260
integer width = 160
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "일자:"
boolean focusrectangle = false
end type

