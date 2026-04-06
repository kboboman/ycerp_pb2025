$PBExportHeader$w_apoi_duzon_r.srw
$PBExportComments$회계전표내보내기(더존)
forward
global type w_apoi_duzon_r from w_inheritance
end type
type em_1 from editmask within w_apoi_duzon_r
end type
type st_3 from statictext within w_apoi_duzon_r
end type
type cbx_all from checkbox within w_apoi_duzon_r
end type
type cb_trans from commandbutton within w_apoi_duzon_r
end type
type st_4 from statictext within w_apoi_duzon_r
end type
type ddlb_fld from dropdownlistbox within w_apoi_duzon_r
end type
type ddlb_dwtitles from dropdownlistbox within w_apoi_duzon_r
end type
type st_6 from statictext within w_apoi_duzon_r
end type
type ddlb_op from dropdownlistbox within w_apoi_duzon_r
end type
type sle_value from singlelineedit within w_apoi_duzon_r
end type
type cb_3 from commandbutton within w_apoi_duzon_r
end type
type cb_4 from commandbutton within w_apoi_duzon_r
end type
type cb_5 from commandbutton within w_apoi_duzon_r
end type
type cb_6 from commandbutton within w_apoi_duzon_r
end type
type st_horizontal from u_splitbar_horizontal within w_apoi_duzon_r
end type
type dw_3 from datawindow within w_apoi_duzon_r
end type
type dw_4 from datawindow within w_apoi_duzon_r
end type
type cbx_1 from checkbox within w_apoi_duzon_r
end type
type em_2 from editmask within w_apoi_duzon_r
end type
type st_2 from statictext within w_apoi_duzon_r
end type
type ddlb_1 from dropdownlistbox within w_apoi_duzon_r
end type
type rb_1 from radiobutton within w_apoi_duzon_r
end type
type rb_2 from radiobutton within w_apoi_duzon_r
end type
type cbx_bitem from checkbox within w_apoi_duzon_r
end type
type st_5 from statictext within w_apoi_duzon_r
end type
type st_7 from statictext within w_apoi_duzon_r
end type
type em_num from editmask within w_apoi_duzon_r
end type
type st_8 from statictext within w_apoi_duzon_r
end type
type em_buseo from editmask within w_apoi_duzon_r
end type
type cb_export from commandbutton within w_apoi_duzon_r
end type
type gb_4 from groupbox within w_apoi_duzon_r
end type
type hpb_1 from hprogressbar within w_apoi_duzon_r
end type
type st_9 from statictext within w_apoi_duzon_r
end type
type dw_salesman from datawindow within w_apoi_duzon_r
end type
type gb_5 from groupbox within w_apoi_duzon_r
end type
end forward

global type w_apoi_duzon_r from w_inheritance
integer width = 4859
integer height = 2392
string title = "매입전표 만들기(더존용)(w_apoi_duzon_r)"
boolean center = true
em_1 em_1
st_3 st_3
cbx_all cbx_all
cb_trans cb_trans
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
st_horizontal st_horizontal
dw_3 dw_3
dw_4 dw_4
cbx_1 cbx_1
em_2 em_2
st_2 st_2
ddlb_1 ddlb_1
rb_1 rb_1
rb_2 rb_2
cbx_bitem cbx_bitem
st_5 st_5
st_7 st_7
em_num em_num
st_8 st_8
em_buseo em_buseo
cb_export cb_export
gb_4 gb_4
hpb_1 hpb_1
st_9 st_9
dw_salesman dw_salesman
gb_5 gb_5
end type
global w_apoi_duzon_r w_apoi_duzon_r

type variables
//
DataWindowChild idwc_user
string is_dw, xlsFile
long   il_slipseq, il_comqty, il_ship_amount, il_insp_cash, il_insp_rate, il_insp_total

end variables

forward prototypes
public subroutine wf_multi_select (datawindow a_dw, long al_row)
public subroutine wf_14900 (integer a)
public subroutine wf_13108 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate)
public subroutine wf_14600 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add)
public subroutine wf_14900 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add)
public subroutine wf_50200 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add)
public subroutine wf_53001 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add)
public subroutine wf_53300 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add)
public subroutine wf_99999 (long ll_slipno, long ly_save, string ls_teamname, string ls_partno, string ls_getdate)
end prototypes

public subroutine wf_multi_select (datawindow a_dw, long al_row);//**************************************//
// 함수명 : wf_multi_select NONE
// 전달값 : a_dw(datawindow),al_row(현재row)
// 
// 이 함수를 해당 Datawindow의 Clicked Event에서 부르면 됩니다.
// Clicked Event Script
// 
// if row < 1 then return
// wf_multi_select(this,row)
// 
//**************************************//

long  w_selrow, i

if al_row <= 0 then return

if keydown(keyshift!)then
   w_selrow = a_dw.GetSelectedRow(0)
   if w_selrow > 0 then
      for i = min(w_selrow,al_row) to max(w_selrow, al_row)
         a_dw.SelectRow(i, true)
			a_dw.object.chk[i] = 1			
      next
   else
		a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1			
   end if
elseif keydown(KeyControl!) then
   if a_dw.isSelected(al_row) then
      a_dw.SelectRow(al_row, false)
		a_dw.object.chk[al_row] = 0			
   else
      a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1
   end if
 else
   if a_dw.isSelected(al_row) then
      a_dw.SelectRow(0, false)
		a_dw.object.chk[al_row] = 0			
   else
      a_dw.SelectRow(0,false)
      a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1			
   end if
 end if  
//**************************************//

end subroutine

public subroutine wf_14900 (integer a);
end subroutine

public subroutine wf_13108 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate);//
string ls_insp_flag, ls_icubeno, ls_supp_no, ls_supp_name, ls_item_name, ls_prepayment, ls_weight, ls_desc
long   ll_dw2row, ll_slipseq, ll_comqty, ll_ship_amount, ll_insp_cash, ll_insp_rate, ll_insp_total

ls_insp_flag   = dw_1.object.insp_flag[lY]				// 수금유형
ls_icubeno     = dw_1.object.icube_no[lY]					// 더존코드 
ls_supp_no     = dw_1.object.supp_no[lY]				   // 거래처
ls_supp_name   = dw_1.object.supp_name[lY]				// 거래처명
ls_prepayment  = dw_1.object.prepayment[lY]				// 선급금
ls_weight      = dw_1.object.weight[lY]					// 중량
ls_item_name   = dw_1.object.item_name[lY]            // 품명
ll_comqty      = dw_1.object.comqty[lY]               // 환산수량
ll_ship_amount = dw_1.object.ship_amount[lY]          // 운송비용
ll_insp_cash   = dw_1.object.insp_cash[lY]            // 입고금액
ll_insp_rate   = dw_1.object.insp_rate[lY]            // 부가세
ll_insp_total  = dw_1.object.insp_total[lY]           // 합계금액

// 운반비용 계산
if ll_ship_amount > 0 then
	ll_insp_cash = ll_insp_cash + (ll_ship_amount * 0.9)
	ll_insp_rate = ll_insp_rate + (ll_ship_amount * 0.1)
end if

if ls_weight = "Y" then
	ls_desc     = "[" + ls_supp_name + "]매입("+string(ll_comqty,"#,##0")+"Ton)"
else
	ls_desc     = "[" + ls_supp_name + "]"+ls_item_name+" 원자재 구입대"
end if

// 선급금
ll_slipseq   = ll_slipseq + 1			// 라인번호

ll_dw2row = dw_2.insertrow(0)
dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
dw_2.object.isu_dt[ll_dw2row]    = ls_getdate  						   // '결의일자'               
dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'               
dw_2.object.acct_cd[ll_dw2row]   = "13108"      						// '계정과목(선급금)'               
dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
dw_2.object.acct_am[ll_dw2row]   = ll_insp_total                  // '금액'                   

dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
dw_2.object.ct_dept[ll_dw2row]   = ""                             // 'C관리'
dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
dw_2.object.ct_nb[ll_dw2row]     = ""										// 'E관리'
dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
dw_2.object.ct_user1[ll_dw2row]  = ""                             // '사용자정의1'            
dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형(11:일반,21:매입,31:매출,41:수금,51:반제)'               
dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     

dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'

// 미지급금(일반)
ll_slipseq   = ll_slipseq + 1			// 라인번호

ll_dw2row = dw_2.insertrow(0)
dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'               
dw_2.object.acct_cd[ll_dw2row]   = "25301"  	   						// '계정과목[미지급금(일반)]'               
dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
dw_2.object.acct_am[ll_dw2row]   = ll_insp_total                  // '금액'

dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno  		               // '관리항목'               
dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
dw_2.object.ct_nb[ll_dw2row]     = ""                             // 'E관리'                  
dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
	
dw_2.object.user_name[ll_dw2row] = ""										// '사원명'     
dw_2.object.dept_name[ll_dw2row] = ""										// '부서명'     							


end subroutine

public subroutine wf_14600 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add);//
string ls_insp_flag, ls_icubeno, ls_supp_no, ls_supp_name, ls_item_name, ls_prepayment, ls_weight, ls_desc
long   ll_dw2row, ll_comqty, ll_ship_amount, ll_insp_cash, ll_insp_rate, ll_insp_total

ls_insp_flag   = dw_1.object.insp_flag[lY]				// 수금유형
ls_icubeno     = dw_1.object.icube_no[lY]					// 더존코드 
ls_supp_no     = dw_1.object.supp_no[lY]				   // 거래처
ls_supp_name   = dw_1.object.supp_name[lY]				// 거래처명
ls_prepayment  = dw_1.object.prepayment[lY]				// 선급금
ls_weight      = dw_1.object.weight[lY]					// 중량
ls_item_name   = dw_1.object.item_name[lY]            // 품명
ll_comqty      = dw_1.object.comqty[lY]               // 환산수량
ll_ship_amount = dw_1.object.ship_amount[lY]          // 운송비용
ll_insp_cash   = dw_1.object.insp_cash[lY]            // 입고금액
ll_insp_rate   = dw_1.object.insp_rate[lY]            // 부가세
ll_insp_total  = dw_1.object.insp_total[lY]           // 합계금액

// 운반비용 계산
if ll_ship_amount > 0 then
	ll_insp_cash = ll_insp_cash + (ll_ship_amount * 0.9)
	ll_insp_rate = ll_insp_rate + (ll_ship_amount * 0.1)
end if

if ls_weight = "Y" then
	ls_desc     = "[" + ls_supp_name + "]매입("+string(ll_comqty,"#,##0")+"Ton)"
else
	ls_desc     = "[" + ls_supp_name + "]"+ls_item_name+" 원자재 구입대"
end if

if lb_add = true then
	// 상품
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "14600"  	   						// '계정과목(상품)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'
	dw_2.object.acct_am[ll_dw2row]   = ll_insp_cash                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno  		               // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							
else
	// 부가세대금급
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "13500"      						// '계정과목(부가세대금급)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc + " VAT"               // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_rate                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = "1"  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     	
	
	// 외상매입금
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "25100"  	   						// '계정과목(외상매입금)'
	dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_total                  // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							
end if
end subroutine

public subroutine wf_14900 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add);//
string ls_insp_flag, ls_icubeno, ls_supp_no, ls_supp_name, ls_item_name, ls_prepayment, ls_weight, ls_desc
long   ll_dw2row, ll_comqty, ll_ship_amount, ll_insp_cash, ll_insp_rate, ll_insp_total

ls_insp_flag   = dw_1.object.insp_flag[lY]				// 수금유형
ls_icubeno     = dw_1.object.icube_no[lY]					// 더존코드 
ls_supp_no     = dw_1.object.supp_no[lY]				   // 거래처
ls_supp_name   = dw_1.object.supp_name[lY]				// 거래처명
ls_prepayment  = dw_1.object.prepayment[lY]				// 선급금
ls_weight      = dw_1.object.weight[lY]					// 중량
ls_item_name   = dw_1.object.item_name[lY]            // 품명
ll_comqty      = dw_1.object.comqty[lY]               // 환산수량
ll_ship_amount = dw_1.object.ship_amount[lY]          // 운송비용
ll_insp_cash   = dw_1.object.insp_cash[lY]            // 입고금액
ll_insp_rate   = dw_1.object.insp_rate[lY]            // 부가세
ll_insp_total  = dw_1.object.insp_total[lY]           // 합계금액

// 운반비용 계산
if ll_ship_amount > 0 then
	ll_insp_cash = ll_insp_cash + (ll_ship_amount * 0.9)
	ll_insp_rate = ll_insp_rate + (ll_ship_amount * 0.1)
end if

if ls_weight = "Y" then
	ls_desc     = "[" + ls_supp_name + "]매입("+string(ll_comqty,"#,##0")+"Ton)"
else
	ls_desc     = "[" + ls_supp_name + "]"+ls_item_name+" 원자재 구입대"
end if

if lb_add = true then
	// 원재료
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate  						   // '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "14900"      						// '계정과목(원재료)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = ll_insp_cash                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]      // 'C관리'
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""										// 'E관리'
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = ""                             // '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형(11:일반,21:매입,31:매출,41:수금,51:반제)'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
	
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'
else
	// 부가세대급금 추가
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "13500"  	   						// '계정과목(부가세대급금)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc + " VAT"	            // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_rate                   // '금액'
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""                             // 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = "1"  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""										// '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""										// '부서명'     							
	
	// 외상매입금
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "25100"  	   						// '계정과목(외상매입금)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_total                  // '금액'
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""                             // 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""										// '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""										// '부서명'     							
end if

end subroutine

public subroutine wf_50200 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add);//
string ls_insp_flag, ls_icubeno, ls_supp_no, ls_supp_name, ls_item_name, ls_prepayment, ls_weight, ls_desc
long   ll_dw2row, ll_comqty, ll_ship_amount, ll_insp_cash, ll_insp_rate, ll_insp_total

ls_insp_flag   = dw_1.object.insp_flag[lY]				// 수금유형
ls_icubeno     = dw_1.object.icube_no[lY]					// 더존코드 
ls_supp_no     = dw_1.object.supp_no[lY]				   // 거래처
ls_supp_name   = dw_1.object.supp_name[lY]				// 거래처명
ls_prepayment  = dw_1.object.prepayment[lY]				// 선급금
ls_weight      = dw_1.object.weight[lY]					// 중량
ls_item_name   = dw_1.object.item_name[lY]            // 품명
ll_comqty      = dw_1.object.comqty[lY]               // 환산수량
ll_ship_amount = dw_1.object.ship_amount[lY]          // 운송비용
ll_insp_cash   = dw_1.object.insp_cash[lY]            // 입고금액
ll_insp_rate   = dw_1.object.insp_rate[lY]            // 부가세
ll_insp_total  = dw_1.object.insp_total[lY]           // 합계금액

// 운반비용 계산
if ll_ship_amount > 0 then
	ll_insp_cash = ll_insp_cash + (ll_ship_amount * 0.9)
	ll_insp_rate = ll_insp_rate + (ll_ship_amount * 0.1)
end if

if ls_weight = "Y" then
	ls_desc     = "[" + ls_supp_name + "]매입("+string(ll_comqty,"#,##0")+"Ton)"
else
	ls_desc     = "[" + ls_supp_name + "]"+ls_item_name+" 원자재 구입대"
end if

if lb_add = true then
	// 부재료비(제)
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "50200"  	   						// '계정과목[부재료비(제)]'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = ll_insp_cash                   // '금액'
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""                             // 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""										// '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""										// '부서명'     							
else
	// 부가세대금급
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "13500"  	   						// '계정과목(부가세대금급)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc + " VAT"               // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_rate                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = "1"  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							
	
	// 외상매입금
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "25100"  	   						// '계정과목(외상매입금)'
	dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_total                  // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							
end if

end subroutine

public subroutine wf_53001 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add);//
string ls_insp_flag, ls_icubeno, ls_supp_no, ls_supp_name, ls_item_name, ls_prepayment, ls_weight, ls_desc
long   ll_dw2row, ll_comqty, ll_ship_amount, ll_insp_cash, ll_insp_rate, ll_insp_total

ls_insp_flag   = dw_1.object.insp_flag[lY]				// 수금유형
ls_icubeno     = dw_1.object.icube_no[lY]					// 더존코드 
ls_supp_no     = dw_1.object.supp_no[lY]				   // 거래처
ls_supp_name   = dw_1.object.supp_name[lY]				// 거래처명
ls_prepayment  = dw_1.object.prepayment[lY]				// 선급금
ls_weight      = dw_1.object.weight[lY]					// 중량
ls_item_name   = dw_1.object.item_name[lY]            // 품명
ll_comqty      = dw_1.object.comqty[lY]               // 환산수량
ll_ship_amount = dw_1.object.ship_amount[lY]          // 운송비용
ll_insp_cash   = dw_1.object.insp_cash[lY]            // 입고금액
ll_insp_rate   = dw_1.object.insp_rate[lY]            // 부가세
ll_insp_total  = dw_1.object.insp_total[lY]           // 합계금액

// 운반비용 계산
if ll_ship_amount > 0 then
	ll_insp_cash = ll_insp_cash + (ll_ship_amount * 0.9)
	ll_insp_rate = ll_insp_rate + (ll_ship_amount * 0.1)
end if

if ls_weight = "Y" then
	ls_desc     = "[" + ls_supp_name + "]매입("+string(ll_comqty,"#,##0")+"Ton)"
else
	ls_desc     = "[" + ls_supp_name + "]"+ls_item_name+" 구입대"
end if

if lb_add = true then
	// 소모품비(제)
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "53001"  	   						// '계정과목[외주가공비(제)]'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = ll_insp_cash                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							
else
	// 부가세대금급
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "13500"      						// '계정과목(부가세대금급)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc + " VAT"               // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_rate                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = "1"  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     	
	
	// 외상매입금
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "25100"  	   						// '계정과목(외상매입금)'
	dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_total                  // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							
end if

end subroutine

public subroutine wf_53300 (long ll_slipno, long ly, string ls_teamname, string ls_partno, string ls_getdate, boolean lb_add);//
string ls_insp_flag, ls_icubeno, ls_supp_no, ls_supp_name, ls_item_name, ls_prepayment, ls_weight, ls_desc
long   ll_dw2row, ll_comqty, ll_ship_amount, ll_insp_cash, ll_insp_rate, ll_insp_total

ls_insp_flag   = dw_1.object.insp_flag[lY]				// 수금유형
ls_icubeno     = dw_1.object.icube_no[lY]					// 더존코드 
ls_supp_no     = dw_1.object.supp_no[lY]				   // 거래처
ls_supp_name   = dw_1.object.supp_name[lY]				// 거래처명
ls_prepayment  = dw_1.object.prepayment[lY]				// 선급금
ls_weight      = dw_1.object.weight[lY]					// 중량
ls_item_name   = dw_1.object.item_name[lY]            // 품명
ll_comqty      = dw_1.object.comqty[lY]               // 환산수량
ll_ship_amount = dw_1.object.ship_amount[lY]          // 운송비용
ll_insp_cash   = dw_1.object.insp_cash[lY]            // 입고금액
ll_insp_rate   = dw_1.object.insp_rate[lY]            // 부가세
ll_insp_total  = dw_1.object.insp_total[lY]           // 합계금액

// 운반비용 계산
if ll_ship_amount > 0 then
	ll_insp_cash = ll_insp_cash + (ll_ship_amount * 0.9)
	ll_insp_rate = ll_insp_rate + (ll_ship_amount * 0.1)
end if

if ls_weight = "Y" then
	ls_desc     = "[" + ls_supp_name + "]매입("+string(ll_comqty,"#,##0")+"Ton)"
else
	ls_desc     = "[" + ls_supp_name + "]"+ls_item_name+" 원자재 구입대"
end if

if lb_add = true then
	// 외주가공비(제)
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "53300"  	   						// '계정과목[외주가공비(제)]'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = ll_insp_cash                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							
else
	// 부가세대금급
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "13500"      						// '계정과목(부가세대금급)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc + " VAT"               // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_rate                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = "1"  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     	
	
	// 외상매입금
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "25100"  	   						// '계정과목(외상매입금)'
	dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_total                  // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY]  		// '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							
end if

end subroutine

public subroutine wf_99999 (long ll_slipno, long ly_save, string ls_teamname, string ls_partno, string ls_getdate);//
string ls_insp_flag, ls_icubeno, ls_supp_no, ls_supp_name, ls_item_name, ls_prepayment, ls_weight, ls_desc
long   ll_dw2row, ll_comqty, ll_ship_amount, ll_insp_cash, ll_insp_rate, ll_insp_total

	ls_supp_name   = dw_1.object.supp_name[lY_SAVE]					// 거래처명
	ls_weight      = dw_1.object.weight[lY_SAVE]						// 중량
	ls_item_name   = dw_1.object.item_name[lY_SAVE]            	// 품명
	ll_comqty      = dw_1.object.comqty[lY_SAVE]               	// 환산수량

	if ls_weight = "Y" then
		ls_desc     = "[" + ls_supp_name + "]매입("+string(il_comqty,"#,##0")+"Ton)"
	else
		ls_desc     = "[" + ls_supp_name + "]구입대"
	end if

	// 부가세대금급
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "13500"      						// '계정과목(부가세대금급)'               
	dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc + " VAT"               // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_rate                   // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY_SAVE] // 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY_SAVE]  // '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = "1"  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     	
	
	// 외상매입금
	il_slipseq   = il_slipseq + 1			// 라인번호
	
	ll_dw2row = dw_2.insertrow(0)
	dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
	dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
	dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
	dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'
	dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
	dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
	dw_2.object.ln_sq[ll_dw2row]     = string(il_slipseq)					// '라인번호'               
	dw_2.object.acct_cd[ll_dw2row]   = "25100"  	   						// '계정과목(외상매입금)'
	dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
	dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
	dw_2.object.acct_am[ll_dw2row]   = il_insp_total                  // '금액'                   
	
	dw_2.object.tr_cd[ll_dw2row]     = ls_icubeno                     // '관리항목'               
	dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY_SAVE] // 'C관리' =영업사원                  
	dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
	dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
	dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
	dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
	dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
	dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
	dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
	dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
	dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.login_id[lY_SAVE]  // '사용자정의1'            
	dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
	dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
	dw_2.object.isu_doc[ll_dw2row]   = ls_desc                        // '품의내역'               
	dw_2.object.logic_cd[ll_dw2row]  = "21"  									// '전표유형'               
	dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
	dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
	dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
		
	dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
	dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							

end subroutine

on w_apoi_duzon_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_3=create st_3
this.cbx_all=create cbx_all
this.cb_trans=create cb_trans
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.st_horizontal=create st_horizontal
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.em_2=create em_2
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cbx_bitem=create cbx_bitem
this.st_5=create st_5
this.st_7=create st_7
this.em_num=create em_num
this.st_8=create st_8
this.em_buseo=create em_buseo
this.cb_export=create cb_export
this.gb_4=create gb_4
this.hpb_1=create hpb_1
this.st_9=create st_9
this.dw_salesman=create dw_salesman
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.cbx_all
this.Control[iCurrent+4]=this.cb_trans
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.cb_6
this.Control[iCurrent+15]=this.st_horizontal
this.Control[iCurrent+16]=this.dw_3
this.Control[iCurrent+17]=this.dw_4
this.Control[iCurrent+18]=this.cbx_1
this.Control[iCurrent+19]=this.em_2
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.ddlb_1
this.Control[iCurrent+22]=this.rb_1
this.Control[iCurrent+23]=this.rb_2
this.Control[iCurrent+24]=this.cbx_bitem
this.Control[iCurrent+25]=this.st_5
this.Control[iCurrent+26]=this.st_7
this.Control[iCurrent+27]=this.em_num
this.Control[iCurrent+28]=this.st_8
this.Control[iCurrent+29]=this.em_buseo
this.Control[iCurrent+30]=this.cb_export
this.Control[iCurrent+31]=this.gb_4
this.Control[iCurrent+32]=this.hpb_1
this.Control[iCurrent+33]=this.st_9
this.Control[iCurrent+34]=this.dw_salesman
this.Control[iCurrent+35]=this.gb_5
end on

on w_apoi_duzon_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_3)
destroy(this.cbx_all)
destroy(this.cb_trans)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.st_horizontal)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cbx_bitem)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.em_num)
destroy(this.st_8)
destroy(this.em_buseo)
destroy(this.cb_export)
destroy(this.gb_4)
destroy(this.hpb_1)
destroy(this.st_9)
destroy(this.dw_salesman)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)

dw_3.visible = false ; dw_3.width = 2112
dw_4.visible = false ; dw_4.width = 2700

cb_trans.enabled   = false	// 매입전표_이관작업
cb_export.enabled = false	// 회계(더존) 자동전표 만들기

// 담당자
dw_salesman.settransobject(sqlca)
dw_salesman.insertrow(0)  

dw_salesman.getchild("salesman", idwc_user)
idwc_user.settransobject(sqlca)
idwc_user.insertrow(1)
idwc_user.setitem(1, "salesman", "%")
idwc_user.setitem(1, "user_name", "전체")
idwc_user.accepttext()
dw_salesman.object.salesman[1] = "%"

//
if GF_Permission('매입전표_만들기(더존용)', gs_userid) = 'Y' then
else
	pb_print.enabled = false
end if

// 전월
datetime ldt_sdate, ldt_edate, ldt_date

SELECT top 1 DateAdd(month, -1, getdate()) INTO :ldt_sdate FROM login;

em_1.text = string(ldt_sdate,"yyyy/mm/01")

ldt_date  = datetime( date(em_1.text), time("00:00:00.000") )
SELECT top 1 dbo.UF_GetLastDate( DateAdd(Month, 0, :ldt_date) ) 
  INTO :ldt_edate
  FROM login;

em_2.text = string(ldt_edate, "yyyy/mm/dd")

// 자동전표
//long   ll_insq
// SELECT in_sq INTO :ll_insq FROM sautodocud WHERE co_cd = '1000' AND in_dt = '20170331'
em_num.text = "300"

// 조업자재
cbx_bitem.checked = false
cbx_bitem.TriggerEvent( clicked! )

ddlb_1.text   = "전체"
hpb_1.position = 0
hpb_1.visible = false

//////////////////////////////////////////////////////////////////////////////////////
// 더존 iCube 데이터베이스 OPEN
//////////////////////////////////////////////////////////////////////////////////////
string ls_getdate ; long ll_max_insq
SQLCA2 = CREATE Transaction 

// Profile iCube DB
SQLCA2.DBMS       = "MSS Microsoft SQL Server 6.x"
SQLCA2.ServerName = "192.168.1.12"
SQLCA2.Database   = "DZICUBE"
SQLCA2.LogId      = "dzicube"
SQLCA2.LogPass    = 'ejwhs123$'
SQLCA2.AutoCommit = False
SQLCA2.DBParm     = "CommitOnDisconnect='No',DateTimeAllowed='Yes',Host=" + gs_userid

CONNECT USING SQLCA2; 		// SQLCA 가 아님에 주의!

SELECT max(in_sq) INTO :ll_max_insq 
  FROM SAUTODOCUD 
 WHERE co_cd = '1000' AND in_dt = :ls_getdate USING SQLCA2;
if isnull(ll_max_insq) then em_num.text = "2000"

if em_num.text < "2000" then
	ll_max_insq = 2000
	em_num.text = string(ll_max_insq)
else
	em_num.text = string(ll_max_insq)
end if

DISCONNECT USING SQLCA2; 
DESTROY SQLCA2 				// 사용이 끝났으면 DESTROY를 해줄 것. 
//////////////////////////////////////////////////////////////////////////////////////

end event

event resize;call super::resize;//
long  ll_height

ll_height   = newheight - dw_1.y - gb_2.x

gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = ll_height * 0.6

st_horizontal.y      = dw_1.y + dw_1.height
st_horizontal.width  = dw_1.width

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_2.x * 2)
dw_2.height = newheight - dw_2.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_apoi_duzon_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_apoi_duzon_r
integer x = 32
integer y = 440
integer width = 4247
integer height = 952
integer taborder = 60
string title = "d_glapoivc_s1"
string dataobject = "d_glapoivc_s"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string  ls_icubeno
long    ll_find

if dw_2.rowcount() > 0 then
	ls_icubeno = dw_1.object.icube_no[row]
	ll_find    = dw_2.find( "tr_cd = '"+ls_icubeno+"'", 1, dw_2.rowcount() )
	if ll_find > 0 then
		dw_2.ScrollToRow( ll_find )
	end if
end if

end event

event dw_1::doubleclicked;call super::doubleclicked;//
string  ls_suppno, ls_username

if isnull(row) OR row < 1 then RETURN

choose case dwo.name
	case "icube_no", "supp_no", "supp_name"
		dw_4.visible = true
		
		dw_4.x  = (Parent.width  - dw_4.width)  / 2
		dw_4.y  = (Parent.height - dw_4.height) / 2
		
		ls_suppno  = this.object.supp_no[row]
		dw_4.retrieve( ls_suppno )
		
	case "login_id", "team_name"
		dw_3.visible = true
		
		dw_3.x  = (Parent.width  - dw_3.width)  / 2
		dw_3.y  = (Parent.height - dw_3.height) / 2
		
		ls_username  = this.object.user_name1[row]
		dw_3.retrieve( ls_username )
end choose

end event

event dw_1::itemchanged;call super::itemchanged;//
string  ls_supp_name, ls_chk
long    ll_row_plus, ll_row_minus

dw_1.accepttext()
ls_supp_name = dw_1.object.supp_name[row]

choose case dwo.name
	case "chk"
		ls_chk = data
		
		if row = this.rowcount() then 
			ll_row_plus = this.rowcount()
		else
			ll_row_plus  = row + 1
		end if

		if row = 1 then 
			ll_row_minus = row
		else
			ll_row_minus = row - 1
		end if

		//
		if ls_chk = "Y" then
			if ls_supp_name = this.object.supp_name[ll_row_plus] then
				this.object.chk[ll_row_plus] = "Y" 
			end if

			if ls_supp_name = this.object.supp_name[ll_row_minus] then
				this.object.chk[ll_row_minus] = "Y"
			end if
		else
			if ls_supp_name = this.object.supp_name[ll_row_plus] then
				this.object.chk[ll_row_plus] = "N" 
			end if

			if ls_supp_name = this.object.supp_name[ll_row_minus] then
				this.object.chk[ll_row_minus] = "N"
			end if
		end if
end choose

end event

type st_title from w_inheritance`st_title within w_apoi_duzon_r
integer y = 20
integer width = 1541
integer height = 132
string text = "매입전표 만들기(더존용)"
end type

type st_tips from w_inheritance`st_tips within w_apoi_duzon_r
end type

type pb_compute from w_inheritance`pb_compute within w_apoi_duzon_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_apoi_duzon_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_apoi_duzon_r
integer x = 4384
integer y = 64
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoi_duzon_r
integer x = 4192
integer y = 64
integer taborder = 40
string picturename = "CrossTab!"
end type

event pb_print::clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer li_value, li_Pos
long    ll_row

if dw_1.rowcount() < 1 then RETURN

if MessageBox("확인","자동전표(더존)를 엑셀파일로 만들겠습니까?", Exclamation!, OKCancel!, 1) = 2 then RETURN

if dw_2.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//===============================================================//
li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS")
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
//===============================================================//
if li_Value <> 1 then RETURN

dw_2.Modify("compute_1.width=0")
dw_2.Modify("DataWindow.Footer.Height=0")

if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
	dw_2.SaveAsAscII(ls_DocName)

	dw_2.Modify("compute_1.width=160")
	dw_2.Modify("DataWindow.Footer.Height=144")
	MessageBox("확인","엑셀파일 작업완료.")
end if
RETURN

//
if MessageBox("확인","회계 자동전표(더존)를 표준서식으로 만들겠습니까?~n~n" + &
				  "표준서식은 시간이 많이 소요됩니다.", Exclamation!, YesNo!, 2) = 2 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_2.SaveAsAscII(ls_DocName)
		dw_2.Modify("DataWindow.Footer.Height=144")
		MessageBox("확인","엑셀파일 작업완료.")
		RETURN
	end if
end if				  

//				  
Integer iret
long    lY, lX
OLEObject OleExcel

OleExcel = CREATE OLEObject 
iret = OleExcel.ConnectToNewObject( "Excel.Application" ) 
if iret <> 0 then DESTROY OleExcel 

// Visible = True의 경우 엑셀 프로그램이 띄워지며 False인 경우 아이콘화된다. 
OleExcel.Application.Visible = true

// 엑셀을 로드한 후 Empty Sheet를 연다. 
if OleExcel.WorkBooks.Open( ls_DocName ) <> 0 then
	MessageBox("확인","엑셀파일 열기 오류 입니다.")
	RETURN
end if

// 셀서식 텍스트로 변경
// OleExcel.Application.ScreenUpdating = False	
OleExcel.Worksheets(1).Cells.ClearContents
OleExcel.Worksheets(1).Range("A1").Select

OleExcel.Worksheets(1).Columns("A:AE").NumberFormatLocal = "@"			

hpb_1.visible = true	
for ly = 1 to dw_2.rowcount()
	hpb_1.position = (ly / dw_2.rowcount()) * 100
	
	OleExcel.Worksheets(1).Cells(ly,  1).Value = dw_2.object.in_dt[ly]
	OleExcel.Worksheets(1).Cells(ly,  2).Value = dw_2.object.co_cd[ly]
	OleExcel.Worksheets(1).Cells(ly,  3).Value = dw_2.object.div_cd[ly]
	OleExcel.Worksheets(1).Cells(ly,  4).Value = dw_2.object.dept_cd[ly]
	OleExcel.Worksheets(1).Cells(ly,  5).Value = dw_2.object.isu_dt[ly]
	OleExcel.Worksheets(1).Cells(ly,  6).Value = dw_2.object.in_sq[ly]
	OleExcel.Worksheets(1).Cells(ly,  7).Value = dw_2.object.ln_sq[ly]
	OleExcel.Worksheets(1).Cells(ly,  8).Value = dw_2.object.acct_cd[ly]
	OleExcel.Worksheets(1).Cells(ly,  9).Value = dw_2.object.drcr_fg[ly]
	OleExcel.Worksheets(1).Cells(ly, 10).Value = dw_2.object.rmk_dc[ly]
	OleExcel.Worksheets(1).Cells(ly, 11).Value = dw_2.object.acct_am[ly]
	OleExcel.Worksheets(1).Cells(ly, 12).Value = dw_2.object.tr_cd[ly]
	OleExcel.Worksheets(1).Cells(ly, 13).Value = dw_2.object.ct_dept[ly]
	OleExcel.Worksheets(1).Cells(ly, 14).Value = dw_2.object.pjt_cd[ly]
	OleExcel.Worksheets(1).Cells(ly, 15).Value = dw_2.object.ct_nb[ly]
	OleExcel.Worksheets(1).Cells(ly, 16).Value = dw_2.object.fr_dt[ly]
	OleExcel.Worksheets(1).Cells(ly, 17).Value = dw_2.object.to_dt[ly]
	OleExcel.Worksheets(1).Cells(ly, 18).Value = dw_2.object.ct_qt[ly]
	OleExcel.Worksheets(1).Cells(ly, 19).Value = dw_2.object.ct_am[ly]
	OleExcel.Worksheets(1).Cells(ly, 20).Value = dw_2.object.ct_rt[ly]
	OleExcel.Worksheets(1).Cells(ly, 21).Value = dw_2.object.ct_deal[ly]
	OleExcel.Worksheets(1).Cells(ly, 22).Value = dw_2.object.ct_user1[ly]
	OleExcel.Worksheets(1).Cells(ly, 23).Value = dw_2.object.ct_user2[ly]
	OleExcel.Worksheets(1).Cells(ly, 24).Value = dw_2.object.attr_cd[ly]
	OleExcel.Worksheets(1).Cells(ly, 25).Value = dw_2.object.isu_doc[ly]
	OleExcel.Worksheets(1).Cells(ly, 26).Value = dw_2.object.logic_cd[ly]
	OleExcel.Worksheets(1).Cells(ly, 27).Value = dw_2.object.dummy1[ly]
	OleExcel.Worksheets(1).Cells(ly, 28).Value = dw_2.object.dummy2[ly]
	OleExcel.Worksheets(1).Cells(ly, 29).Value = dw_2.object.jeonja_yn[ly]
	OleExcel.Worksheets(1).Cells(ly, 30).Value = dw_2.object.user_name[ly]
	OleExcel.Worksheets(1).Cells(ly, 31).Value = dw_2.object.dept_name[ly]
next
hpb_1.visible = false

OleExcel.Worksheets(1).Rows("1:2").Insert
OleExcel.WorkSheets(1).Cells(1,  1).Value = "IN_DT"
OleExcel.WorkSheets(1).Cells(1,  2).Value = "CO_CD"
OleExcel.WorkSheets(1).Cells(1,  3).Value = "DIV_CD"
OleExcel.WorkSheets(1).Cells(1,  4).Value = "DEPT_CD"
OleExcel.WorkSheets(1).Cells(1,  5).Value = "ISU_DT"
OleExcel.WorkSheets(1).Cells(1,  6).Value = "IN_SQ"
OleExcel.WorkSheets(1).Cells(1,  7).Value = "LN_SQ"
OleExcel.WorkSheets(1).Cells(1,  8).Value = "ACCT_CD"
OleExcel.WorkSheets(1).Cells(1,  9).Value = "DRCR_FG"
OleExcel.WorkSheets(1).Cells(1, 10).Value = "RMK_DC"
OleExcel.WorkSheets(1).Cells(1, 11).Value = "ACCT_AM"
OleExcel.WorkSheets(1).Cells(1, 12).Value = "TR_CD"
OleExcel.WorkSheets(1).Cells(1, 13).Value = "CT_DEPT"
OleExcel.WorkSheets(1).Cells(1, 14).Value = "PJT_CD"
OleExcel.WorkSheets(1).Cells(1, 15).Value = "CT_NB"
OleExcel.WorkSheets(1).Cells(1, 16).Value = "FR_DT"
OleExcel.WorkSheets(1).Cells(1, 17).Value = "TO_DT"
OleExcel.WorkSheets(1).Cells(1, 18).Value = "CT_QT"
OleExcel.WorkSheets(1).Cells(1, 19).Value = "CT_AM"
OleExcel.WorkSheets(1).Cells(1, 20).Value = "CT_RT"
OleExcel.WorkSheets(1).Cells(1, 21).Value = "CT_DEAL"
OleExcel.WorkSheets(1).Cells(1, 22).Value = "CT_USER1"
OleExcel.WorkSheets(1).Cells(1, 23).Value = "CT_USER2"
OleExcel.WorkSheets(1).Cells(1, 24).Value = "ATTR_CD"
OleExcel.WorkSheets(1).Cells(1, 25).Value = "ISU_DOC"
OleExcel.WorkSheets(1).Cells(1, 26).Value = "LOGIC_CD"
OleExcel.WorkSheets(1).Cells(1, 27).Value = "DUMMY1"
OleExcel.WorkSheets(1).Cells(1, 28).Value = "DUMMY2"
OleExcel.WorkSheets(1).Cells(1, 29).Value = "JEONJA_YN"
OleExcel.Worksheets(1).Cells(1, 30).Value = "USER_NAME"
OleExcel.Worksheets(1).Cells(1, 31).Value = "DEPT_NAME"

OleExcel.WorkSheets(1).Cells(2,  1).Value = "처리일자(0)"      
OleExcel.WorkSheets(1).Cells(2,  2).Value = "회사코드(1)"      
OleExcel.WorkSheets(1).Cells(2,  3).Value = "사업장코드(2)"    
OleExcel.WorkSheets(1).Cells(2,  4).Value = "부서코드(3)"      
OleExcel.WorkSheets(1).Cells(2,  5).Value = "결의일자(4)"      
OleExcel.WorkSheets(1).Cells(2,  6).Value = "자동전표번호(5)"  
OleExcel.WorkSheets(1).Cells(2,  7).Value = "라인번호(6)"      
OleExcel.WorkSheets(1).Cells(2,  8).Value = "계정과목(7)"      
OleExcel.WorkSheets(1).Cells(2,  9).Value = "차대구분(8)"      
OleExcel.WorkSheets(1).Cells(2, 10).Value = "적요(9)"          
OleExcel.WorkSheets(1).Cells(2, 11).Value = "금액(10)"         
OleExcel.WorkSheets(1).Cells(2, 12).Value = "관리항목(11)"     
OleExcel.WorkSheets(1).Cells(2, 13).Value = "사용부서등(12)"   
OleExcel.WorkSheets(1).Cells(2, 14).Value = "사업장코드(13)"   
OleExcel.WorkSheets(1).Cells(2, 15).Value = "세무구분(14)"     
OleExcel.WorkSheets(1).Cells(2, 16).Value = "발생일(15)"       
OleExcel.WorkSheets(1).Cells(2, 17).Value = "만기일(16)"       
OleExcel.WorkSheets(1).Cells(2, 18).Value = "H관리(17)"        
OleExcel.WorkSheets(1).Cells(2, 19).Value = "I관리(18)"        
OleExcel.WorkSheets(1).Cells(2, 20).Value = "J관리(19)"        
OleExcel.WorkSheets(1).Cells(2, 21).Value = "K관리(20)"        
OleExcel.WorkSheets(1).Cells(2, 22).Value = "사용자정의1(21)"  
OleExcel.WorkSheets(1).Cells(2, 23).Value = "사용자정의2(22)"  
OleExcel.WorkSheets(1).Cells(2, 24).Value = "증빙코드(23)"     
OleExcel.WorkSheets(1).Cells(2, 25).Value = "품의내역(24)"     
OleExcel.WorkSheets(1).Cells(2, 26).Value = "전표유형(25)"     
OleExcel.WorkSheets(1).Cells(2, 27).Value = "환종(24)"         
OleExcel.WorkSheets(1).Cells(2, 28).Value = "외화금액(25)"     
OleExcel.WorkSheets(1).Cells(2, 29).Value = "전자세금(26)"     
OleExcel.WorkSheets(1).Cells(2, 30).Value = "담당자명"     
OleExcel.WorkSheets(1).Cells(2, 31).Value = "부서명"     

OleExcel.WorkSheets(1).Cells.EntireColumn.AutoFit
OleExcel.WorkSheets(1).Range("A1").Select
OleExcel.Application.ScreenUpdating = True


//다른이름으로 저장 
//	OleExcel.Application.Visible = true
OleExcel.Application.DisplayAlerts = False
OleExcel.Application.Workbooks(1).SaveAs(ls_Docname, 56, "", "", False, False, 2)
OleExcel.Application.DisplayAlerts = True
OleExcel.Application.WorkBooks(1).Close()	

//연결해제
OleExcel.DisConnectObject()
Destroy OleExcel 

dw_2.Modify("DataWindow.Footer.Height=144")

if GF_Permission( "수금전표_이관작업", gs_userid ) = "Y" then	
	cb_trans.triggerevent( clicked! )
end if
MessageBox("확인","엑셀파일 작업완료.")

///*
//Long ll_row, ll_page, ll_row_rem, ll_ii, ll_page1
//Int  ret, pb_Sum, page_row, page_row1
//String out_data, ls_pos, ls_unit, ls_condition
//OLEObject export_object
//
//page_row = 28
//page_row1 = 26
//
//ll_row  = 0
//ll_page = 0
//ll_row_rem = 0
//ll_page1 = 0
//ll_row   = dw_right.rowcount() 
//if ll_row < 1 then return
//
//export_object = Create OLEObject
//ret = export_object.ConnectToNewObject( "Excel.Application" )
//If ret < 0 Then
//	MessageBox("Connect to Excel Failed !",string(ret))
//	Return
//End If
//
//ll_page    = ll_row / page_row
//ll_row_rem = ll_row - ( ll_page * page_row )
//If ll_row_rem > 0 Then 
//	ll_page = ll_page + 1
//End If
//ll_page1 = ll_page + 1
//
//export_object.Application.Workbooks.Open("C:\emart\emart.xlt") //,false,true
//export_object.Application.Visible = True
//export_object.Worksheets[1].Activate;
//
////엑셀의 Line블럭복사
//for ll_ii = 1 to ll_page - 1
//	export_object.Rows('3:'+string(page_row)).Select; // LINE 단위 SELECT
//	export_object.selection.copy;
//	if ll_ii = 1 then
//		export_object.Rows(string(page_row*ll_ii+1)).select;
//	else
//		export_object.Rows(string(page_row1*ll_ii+3)).select;
//	end if 
//	export_object.activesheet.paste;
//Next
//
//If ll_page > 1 and ll_page <> 2 Then
//	export_object.Rows('3:'+string(page_row)).Select; // LINE 단위 SELECT
//	export_object.selection.copy;
//	export_object.Rows(string(page_row1*ll_ii+3)).select;
//	export_object.activesheet.paste;
//end if
//
////엑셀에 전환할때 서식추가 변수
//ls_unit = "@"
//
////dw내용 엑셀로 전환부분
//For ll_ii = 1 To dw_right.rowcount()
//	export_object.Worksheets(1).cells(ll_ii+2,1).value = dw_right.getitemstring(ll_ii,'detail_code') //상세코드
//	export_object.Worksheets(1).cells(ll_ii+2,2).value = dw_right.getitemstring(ll_ii,'nm_kor') //한글명
//	export_object.Worksheets(1).cells(ll_ii+2,3).value = dw_right.getitemstring(ll_ii,'nm_eng') //영문명
//	
//	export_object.Worksheets(1).cells(ll_ii+2,4).value = string(dw_right.getitemNumber(ll_ii,'ref_value')) //참조수치
//	export_object.Worksheets(1).cells(ll_ii+2,4).NumberFormatLocal = '"'+ls_unit+' "' + "#,##0" //엑셀에 전환시 서식추가 부분
//	
//	export_object.Worksheets(1).cells(ll_ii+2,5).value = dw_right.getitemstring(ll_ii,'sort_order') //정렬순서
//	export_object.Worksheets(1).cells(ll_ii+2,6).value = dw_right.getitemstring(ll_ii,'status') //상태
//next
//
//export_object.Rows('3:'+string(page_row*ll_page+2)).Select;
//export_object.range('A3','F'+string(page_row*ll_page+2)).font.size=9
//If ll_page = 1 Then 
//	export_object.activesheet.pagesetup.Printarea = '$A$3:$F$'+string(page_row*ll_page);
//elseif ll_page = 2 then
//	export_object.activesheet.pagesetup.Printarea = '$A$3:$F$'+string(page_row1*ll_page+2);
//else
//	export_object.activesheet.pagesetup.Printarea = '$A$3:$F$'+string(page_row1*ll_page1+2)
//end if
//
//export_object.DisConnectObject() //연결종료
//Destroy export_object //오브젝트 제거
//
//// excel 저장 후 엑셀파일 open
//string ls_excelpath
//integer li_rtn1
//
//RegistryGet("HKEY_CLASSES_ROOT\Excel.Addin\shell\Open\command", "", RegString!, ls_excelpath)
//li_rtn1 = Run(ls_excelpath + ' "' + ls_pathname + '"', Maximized!)
//
////##############################################################
////추가 사항 
////##############################################################
//Long   ll_ret
//String ls_ret
//String ls_string1
//
//oleobject myoleobject
//
//myoleobject = create oleobject
//
//ll_ret = myoleobject.connecttoobject("c:\a.xls")
//Messagebox("Result!",string(ll_ret))
//
//myoleobject.Application.Visible = TRUE
//
//// 쓰기
//myoleobject.application.workbooks(1).worksheets(1).cells(1,1).value="Test"
//// 읽기
//ls_ret = myoleobject.application.workbooks(1).worksheets(1).cells(1,1).value
//
//
////문자형으로 저장
// myoleobject.application.workbooks(1).worksheets(1).Cells.NumberFormatLocal := '@';  
//
//
///* 추가 사항 */
//http://msdn.microsoft.com/ko-kr/library/microsoft.office.interop.excel.range_properties(office.11).aspx
//
//
////Excel File Open
//myOleObject.WorkBooks.Open("c:\a.xls") 
//
//// Sheet Name 
//ls_string1 = myOleObject.sheets[1].Name 
//
//// Sheet 자동마춤
//myOleObject.Worksheets[1].Columns.AutoFit 
//// Sheet의 갯수 읽기
//ll_PageCnt = myOleObject.application.Workbooks(1).Worksheets.Count
////읽기
//ls_ret = myOleobject.application.workbooks(1).worksheets(1).Range( "A1" ).Value 
////쓰기
//myOleobject.application.workbooks(1).worksheets(1).Range( "A1" ).Value = 'Test'
////Row Delete 행삭제
//myOleobject.application.Workbooks(1).Worksheets(1).rows("1").delete
//// 시트의 이름을 지정
//myoleobject.Sheets[1].Name = "Sheet명"
////저장
//myoleobject.application.workbooks(1).Save()
////다른이름으로 저장 
//myoleobject.application.workbooks(1).SaveAs("c:\b.xls")
////다른이름으로 저장 - Sheet 별로 (tab으로 분리된 text파일)
//myoleobject.application.Workbooks(1).Worksheets(i).SaveAs("c:\c.txt",3) 
//
////인자값 (3) 에 따라 저장형식 다름 - 엑셀 도움말 참조
//
//
//// 마지막sheet 뒤에 새로운 sheet추가
//any la_null
//setnull(null)
//myoleobject.ActiveWorkbook.Sheets.Add (la_null, myoleobject.ActiveWorkbook.Sheets(   myoleobject.ActiveWorkbook.Sheets.Count   ))
//
////새로열기
//myoleobject.connecttonewobject("excel.application")
////파일열기
//myoleobject.WorkBooks.Opentext('c:\tmpgoodef.xls')
////타이틀바 바꾸기
//myoleobject.Application.caption = "My Excel"
//
//// 첫번째 Row 선택후 처리
//myoleobject.rows("1:1").select
////굵은글씨
//myoleobject.selection.font.bold = true
////이탤릭으로
//myoleobject.selection.font.italic = true
////글씨색
//myoleobject.selection.font.Color = RGB (128,128,0)
////보더색, 테두리색
//myoleobject.selection.Borders.Color = RGB (0,0,128)
//
//// 엑셀배경색
//myoleobject.selection.Interior.Color = RGB (153,204,255)
//
////워드랩
//myoleobject.selection.wraptext = true
////가로정렬
//myoleobject.selection.horizontalalignment = true
////세로정렬
//myoleobject.selection.verticalalignment = true
//
////상태바 표시
//myoleobject.statusbar = " My Status"
////첫번째Row를 프린트시 반복으로 (헤더로 표시)
//myoleobject.Activesheet.PageSetup.PrintTitleRows = "$1:$1"
//
////첫번째쉬트를 복사 - 자세한 내용은 엑셀도움말을 참조
//myoleobject.Worksheets(1).copy
////저장없이 닫기
//myoleobject.WorkBooks(1).Close(false)
////연결해제
//myoleobject.DisConnectObject()
//
//destroy myoleobject 
//
// 
//
////#############################################################
//// dw > html > excel
////#############################################################
//
//docname = 'test3.pdf'
//li_ret = dw_1.SaveAs("C:\test2.pdf", PDF!, True)
//
//if dw_insert.SaveAs(docname, pdf!, True) = -1 then
//MessageBox("Warning", "Unable to export data. Error writing to file!", Exclamation!)
//return
//end if
//
//OLEObject excel
//excel = CREATE OLEObject
//if excel.ConnectToObject(docname) = 0 then
//excel.application.DisplayAlerts = FALSE
//excel.application.workbooks(1).Parent.Windows(excel.application.workbooks(1).Name).Visible = True
//excel.application.workbooks(1).saveas(docname, 39)
//excel.application.workbooks(1).close()
//end if
//
//DESTROY excel 
//
//*/
//

end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_apoi_duzon_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_apoi_duzon_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_apoi_duzon_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apoi_duzon_r
integer x = 4000
integer y = 64
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_retrieve::clicked;//
string  ls_salesman, ls_date, ls_area, ls_openclose, ls_insp_flag, ls_icubeno
date    ld_sdate, ld_edate
long    ll_row, ll_find, ll_ship, ll_cash, ll_rate, ll_total
integer li_year, li_month

dw_1.reset() ; dw_2.reset()

cbx_all.checked = false	// 전체선택

if em_1.text = "" then
	MessageBox("확인","해당 년월을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
end if

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)
ls_date  = GF_ReplaceAll(em_2.text, "/", "")

SELECT top 1 dbo.UF_GETLASTDAY( :ls_date ) INTO :ls_date FROM login;
//ld_edate = date(ls_date)

//
li_year  = Year(ld_edate)
li_month = Month(ld_edate)

choose case ddlb_1.text
	case "전체"
		ls_area = "%"
	case "(주)유창"
		ls_area = "S01"
	case "(주)유창서울사무소"
		ls_area = "H01"
	case "(주)유창대전영업소"
		ls_area = "Z01"
	case "본.지점"
		ls_area = "D01"
end choose

// 담당자
dw_salesman.accepttext()
ls_salesman  = dw_salesman.object.salesman[1]

if cbx_1.checked = true then	// 회계이관 자료
	ls_openclose = "T"
else
	ls_openclose = "O"
end if

// 조업자재전표 
if cbx_bitem.checked = true then
	ls_area  = "S0001"
	dw_1.retrieve( ls_area, li_year, li_month, ld_sdate, ld_edate )

	if dw_1.rowcount() > 0 then
		cb_export.enabled = true
		MessageBox("확인","작업대상을 선택한 후 '자동전표 만들기'를 클릭 하시기 바랍니다.",information!)
	else
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.",information!)
	end if
	
	RETURN
end if

////////////////////////////////////////////////////////////////////////////////////
// KeySort 만들기
////////////////////////////////////////////////////////////////////////////////////
dw_1.setredraw( false )

dw_1.retrieve( ls_salesman, ld_sdate, ld_edate )

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.keysort[ll_row]  = dw_1.object.compute_1[ll_row] * 10
next

for ll_row = 2 to dw_1.rowcount()
	ls_icubeno = dw_1.object.icube_no[ll_row]
	
	ll_find = dw_1.find( "icube_no = '"+ ls_icubeno +"'", 1, ll_row - 1 )
	if ll_find > 0 then
		dw_1.object.keysort[ll_row]  = (ll_find * 10) + 1
	end if
next
dw_1.SetSort( "keysort A" )
dw_1.Sort()
dw_1.setredraw( true )

cb_5.enabled = false
cb_6.enabled = false
////////////////////////////////////////////////////////////////////////////////////

// 입고금액 + 부가세 = 합계금액
for ll_row = 1 to dw_1.rowcount()
	ll_total = dw_1.object.insp_total[ll_row] 

	ll_ship  = dw_1.object.ship_amount[ll_row] 
	ll_cash  = dw_1.object.insp_cash[ll_row] 
	ll_rate  = dw_1.object.insp_rate[ll_row] 
	
	if ll_total = (ll_ship + ll_cash + ll_rate) then
		//
	else
		//dw_1.object.keycolor[ll_row] = "Y"
	end if
next

//
if dw_1.rowcount() > 0 then
	cb_export.enabled = true
	MessageBox("확인","작업대상을 선택한 후 '자동전표 만들기'를 클릭 하시기 바랍니다.",information!)
else
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.",information!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


end event

type gb_3 from w_inheritance`gb_3 within w_apoi_duzon_r
integer x = 1618
integer y = 16
integer width = 1074
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_apoi_duzon_r
integer y = 256
integer width = 4247
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_apoi_duzon_r
integer x = 3959
integer y = 16
integer width = 645
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_apoi_duzon_r
integer x = 32
integer y = 1444
integer width = 4247
integer height = 812
integer taborder = 0
string dataobject = "d_duzon_excel_r"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string  ls_icubeno
long    ll_find, ll_amount

ls_icubeno = dw_2.object.tr_cd[row]
ll_amount  = dw_2.object.acct_am[row]
//ll_find    = dw_1.find( "icube_no = '"+ls_icubeno+"' AND amount = "+string(ll_amount)+"", 1, dw_1.rowcount() )
ll_find    = dw_1.find( "icube_no = '"+ls_icubeno+"'", 1, dw_1.rowcount() )
if ll_find > 0 then
	dw_1.ScrollToRow( ll_find )
end if

end event

type em_1 from editmask within w_apoi_duzon_r
integer x = 2757
integer y = 60
integer width = 384
integer height = 76
integer taborder = 10
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
string displaydata = "T"
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

//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_3 from statictext within w_apoi_duzon_r
integer x = 37
integer y = 180
integer width = 763
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
string text = "매입전표_만들기(더존용)"
boolean focusrectangle = false
end type

type cbx_all from checkbox within w_apoi_duzon_r
integer x = 82
integer y = 256
integer width = 215
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체"
end type

event clicked;// 전체선택
string ls_rcpt_type
long   ll_row, ll_cnt

if dw_1.rowcount() < 1 then RETURN

for ll_row =  1 to dw_1.rowcount()
	if this.checked = true then
		dw_1.object.chk[ll_row] = "Y"
	else
		dw_1.object.chk[ll_row] = "N"
	end if
next

end event

type cb_trans from commandbutton within w_apoi_duzon_r
integer x = 4197
integer y = 296
integer width = 498
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "매입이관 작업"
end type

event clicked;//////////////////////////////////////////////////////
// 매입 이관작업 표시
//////////////////////////////////////////////////////
string ls_weekday, ls_sdate, ls_edate, ls_time, ls_errtext
date   ld_sdate, ld_edate
long   ll_row

if dw_1.rowcount() < 1 then RETURN

if GF_Permission( "매입전표_이관작업", gs_userid ) = "Y" then	
	ls_sdate  = GF_ReplaceAll(em_1.text,"/","") + "01"
	SELECT top 1 dbo.UF_GetLastDay( :ls_sdate ) INTO :ls_edate FROM login;
	
	ld_sdate  = date(em_1.text + "/01")
	ld_edate  = date( ls_edate )
	
//	UPDATE aroivc
//		SET open_close = 'T'
//	 WHERE oi_date between :ld_sdate and :ld_edate;
//	if SQLCA.SQLCode = 0 then
//		COMMIT;
//	else
//		ls_errtext = SQLCA.SQLErrText
//		ROLLBACK;
//		MessageBox("확인","DB ERROR가 발생하였습니다.~n~n" + ls_errtext)						
//	end if

	MessageBox("확인","매입전표_이관작업 완료")
end if

end event

type st_4 from statictext within w_apoi_duzon_r
integer x = 87
integer y = 328
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

type ddlb_fld from dropdownlistbox within w_apoi_duzon_r
integer x = 274
integer y = 312
integer width = 443
integer height = 632
integer taborder = 120
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

type ddlb_dwtitles from dropdownlistbox within w_apoi_duzon_r
integer x = 306
integer y = 324
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

type st_6 from statictext within w_apoi_duzon_r
integer x = 745
integer y = 328
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

type ddlb_op from dropdownlistbox within w_apoi_duzon_r
integer x = 914
integer y = 312
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_apoi_duzon_r
integer x = 1234
integer y = 316
integer width = 526
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_apoi_duzon_r
integer x = 1769
integer y = 316
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_apoi_duzon_r
integer x = 1934
integer y = 316
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_apoi_duzon_r
integer x = 2098
integer y = 316
integer width = 160
integer height = 76
integer taborder = 130
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
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_apoi_duzon_r
integer x = 2263
integer y = 316
integer width = 160
integer height = 76
integer taborder = 140
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
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_horizontal from u_splitbar_horizontal within w_apoi_duzon_r
integer x = 32
integer y = 1408
integer width = 4247
boolean bringtotop = true
end type

type dw_3 from datawindow within w_apoi_duzon_r
integer x = 2281
integer y = 804
integer width = 1467
integer height = 820
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "회계부서 수정"
string dataobject = "d_duzon_sabun_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//
string ls_userid, ls_duzon_sabun, ls_duzon_dept

choose case dwo.name
	case "b_1"		
		this.accepttext()
		
		ls_duzon_sabun = this.object.duzon_sabun[row]
		ls_duzon_dept  = this.object.duzon_dept[row]
		
		ls_userid = this.object.user_id[row]
		if isnull(ls_userid) OR ls_userid = "" then RETURN
		
		UPDATE login 
			SET duzon_sabun = :ls_duzon_sabun, duzon_dept  = :ls_duzon_dept 
		 WHERE user_id = :ls_userid;
		
		//
		this.visible = false
		pb_retrieve.TriggerEvent( clicked! )
end choose

end event

event doubleclicked;//

end event

type dw_4 from datawindow within w_apoi_duzon_r
integer x = 814
integer y = 804
integer width = 1367
integer height = 820
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "회계 거래처 수정"
string dataobject = "d_duzon_suppno_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//
string ls_suppno, ls_icubeno, ls_duzon_dept

choose case dwo.name
	case "b_1"		
		this.accepttext()
		
		ls_icubeno = this.object.icube_no[row]
		
		ls_suppno = this.object.supp_no[row]
		if isnull(ls_suppno) OR ls_suppno = "" then RETURN
		
		// 조업자재
		if cbx_bitem.checked = true then
			UPDATE bsupp SET icube_no = :ls_icubeno WHERE supp_no = :ls_suppno;
		else
			UPDATE supp  SET icube_no = :ls_icubeno WHERE supp_no = :ls_suppno;
		end if
	
		//
		this.visible = false
		pb_retrieve.TriggerEvent( clicked! )
end choose

end event

type cbx_1 from checkbox within w_apoi_duzon_r
integer x = 946
integer y = 180
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "회계이관 자료열람"
end type

type em_2 from editmask within w_apoi_duzon_r
integer x = 2757
integer y = 136
integer width = 384
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "T"
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

//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_2 from statictext within w_apoi_duzon_r
integer x = 1646
integer y = 52
integer width = 297
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_apoi_duzon_r
integer x = 1947
integer y = 52
integer width = 718
integer height = 404
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
string item[] = {"전체","(주)유창서울사무소","(주)유창대전영업소","(주)유창","본.지점"}
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_apoi_duzon_r
integer x = 3168
integer y = 72
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전월"
boolean checked = true
end type

event clicked;// 전월
datetime ldt_sdate, ldt_edate, ldt_date

SELECT top 1 DateAdd(month, -1, getdate()) INTO :ldt_sdate FROM login;

em_1.text = string(ldt_sdate,"yyyy/mm/01")

ldt_date  = datetime( date(em_1.text), time("00:00:00.000") )
SELECT top 1 dbo.UF_GetLastDate( DateAdd(Month, 0, :ldt_date) ) 
  INTO :ldt_edate
  FROM login;

em_2.text = string(ldt_edate, "yyyy/mm/dd")


end event

type rb_2 from radiobutton within w_apoi_duzon_r
integer x = 3168
integer y = 140
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "당월"
end type

event clicked;// 당월
string   ls_sdate, ls_edate
datetime ldt_sdate, ldt_edate

SELECT top 1 DateAdd(Day, -0, getdate() )   INTO :ldt_sdate FROM login;

ls_sdate = string(ldt_sdate, "yyyymm01")
SELECT top 1 dbo.UF_GetLastDay( :ls_sdate ) INTO :ldt_edate FROM login;

em_1.text = string(ldt_sdate,"yyyy/mm/01")
em_2.text = string(ldt_edate,"yyyy/mm/dd")

//
em_1.text = string(today(),"yyyy/mm/01")
em_2.text = string(today(),"yyyy/mm/dd")


end event

type cbx_bitem from checkbox within w_apoi_duzon_r
integer x = 3493
integer y = 140
integer width = 407
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "조업자재"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////
// 더존 iCube 데이터베이스 OPEN
//////////////////////////////////////////////////////////////////////////////////////
string ls_getdate ; long ll_max_insq
SQLCA2 = CREATE Transaction 

// Profile iCube DB
SQLCA2.DBMS       = "MSS Microsoft SQL Server 6.x"
SQLCA2.ServerName = "192.168.1.12"
SQLCA2.Database   = "DZICUBE"
SQLCA2.LogId      = "dzicube"
SQLCA2.LogPass    = 'ejwhs123$'
SQLCA2.AutoCommit = False
SQLCA2.DBParm     = "CommitOnDisconnect='No',DateTimeAllowed='Yes',Host=" + gs_userid

CONNECT USING SQLCA2; 		// SQLCA 가 아님에 주의!

SELECT max(in_sq) INTO :ll_max_insq 
  FROM SAUTODOCUD 
 WHERE co_cd = '1000' AND in_dt = :ls_getdate USING SQLCA2;

if this.checked = true then
	if isnull(ll_max_insq) then em_num.text = "3000"

	if em_num.text < "3000" then
		ll_max_insq = 3000
		em_num.text = string(ll_max_insq)
	else
		em_num.text = string(ll_max_insq)
	end if
else
	if isnull(ll_max_insq) then em_num.text = "2000"

	if em_num.text < "2000" then
		ll_max_insq = 2000
		em_num.text = string(ll_max_insq)
	else
		em_num.text = string(ll_max_insq)
	end if
end if

DISCONNECT USING SQLCA2; 
DESTROY SQLCA2 				// 사용이 끝났으면 DESTROY를 해줄 것. 
//////////////////////////////////////////////////////////////////////////////////////

// 조업자재 전표
if this.checked = true then
	dw_1.dataobject = "d_glapoivc_s1"
	dw_4.dataobject = "d_duzon_suppno_r1"
else
	dw_1.dataobject = "d_glapoivc_s"
	dw_4.dataobject = "d_duzon_suppno_r"
end if

dw_2.reset()
dw_1.SetTransObject( SQLCA )
dw_4.SetTransObject( SQLCA )


end event

type st_5 from statictext within w_apoi_duzon_r
integer x = 3465
integer y = 72
integer width = 457
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "조업자재 전표"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_apoi_duzon_r
integer x = 2450
integer y = 324
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "자동전표"
boolean focusrectangle = false
end type

type em_num from editmask within w_apoi_duzon_r
integer x = 2793
integer y = 320
integer width = 192
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
string text = "2000"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type st_8 from statictext within w_apoi_duzon_r
integer x = 2450
integer y = 248
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "회계부서"
boolean focusrectangle = false
end type

type em_buseo from editmask within w_apoi_duzon_r
integer x = 2793
integer y = 240
integer width = 192
integer height = 68
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
string text = "9101"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
end type

type cb_export from commandbutton within w_apoi_duzon_r
integer x = 3013
integer y = 304
integer width = 1152
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "회계(더존) 자동전표 만들기"
end type

event clicked;// 회계(더존) 자동전표 만들기
string  ls_getdate, ls_esero, ls_partno, ls_teamname, ls_acctdate, ls_insp_flag
string  ls_desc, ls_icubeno, ls_icubeno_save, ls_supp_no, ls_supp_name, ls_item_name, ls_prepayment, ls_weight
long	  ll_row, ll_row_save, ll_tchk, lY, lY_SAVE, ll_dw2row, ll_find, ll_slipno, ll_max_insq
long    ll_comqty, ll_ship_amount, ll_insp_cash, ll_insp_rate, ll_insp_total
boolean lb_add
string 	ls_yyyymm, ls_magamyn // 2017.10.23 조원석

if dw_1.rowcount() < 1 then
	MessageBox("확인","매입 데이터가 존재하지 않습니다.")
	RETURN
end if

ll_tchk  = dw_1.object.tchk[1]
if ll_tchk < 1 then
	MessageBox("확인","작업할 대상을 선택하시기 바랍니다.")
	RETURN
end if

if em_buseo.text = "" then
	MessageBox("확인","회계부서코드를 입력하시기 바랍니다.")
	RETURN
end if

// 회계일자
ls_getdate    = GF_ReplaceAll(em_2.text,"/","")

/* 마감관리 로직 반영 2017.10.23 조원석 */
/* sys_gb = '10' (10)구매 마감 로직 	 시작 */
ls_yyyymm = LeftA(ls_getdate,6)

SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '10';

//if ls_magamyn <> "N" then
//	MessageBox('확인','해당년월은 마감되었습니다.~n~n',Stopsign!)
//	return
//end if

/* 마감관리 로직 반영 2017.10.23 조원석  끝 */


 
//
ll_slipno     = long(em_num.text) + 1	// 미결 시작번호 
il_slipseq    = 0								// 라인번호
hpb_1.visible = true

//////////////////////////////////////////////////////////////////////////////////////////////
// 계정 만들기
//////////////////////////////////////////////////////////////////////////////////////////////
//	 when 'W' then '1.원자재'    when 'B' then '2.부자재' 
//	 when 'S' then '3.상품'      when 'Y' then '4.외주가공'
//	 else '5.' + insp.insp_flag
//////////////////////////////////////////////////////////////////////////////////////////////

dw_2.reset()
dw_2.setredraw( false )

debugbreak()
//////////////////////////////////////////////////////////////////////////////////////////////
for lY = 1 to dw_1.rowcount()
	hpb_1.position = (lY / dw_1.rowcount()) * 100
	if dw_1.object.chk[lY] = "N" then CONTINUE

	//
	if ls_icubeno_save = "" then ls_icubeno_save = dw_1.object.icube_no[lY]	

	ls_icubeno  = dw_1.object.icube_no[lY]						// 더존코드 
	if ls_icubeno_save <> ls_icubeno then 
		ls_partno      = "1000"	                             		// 사업장 구분
		ls_teamname    = string(em_buseo.text)                	// 부서명(구매팀)
	//	ls_acctdate  = string(dw_1.object.oi_date[1],"yyyymmdd") // 계산서일자
		
		WF_99999( ll_slipno, lY_SAVE, ls_teamname, ls_partno, ls_getdate )

		ls_icubeno_save = ls_icubeno
		ll_slipno       = ll_slipno + 1
		il_slipseq      = 0
		
		il_comqty       = 0			// 환산수량
		il_ship_amount  = 0        // 운송비용
		il_insp_cash    = 0        // 입고금액
		il_insp_rate    = 0        // 부가세
		il_insp_total   = 0        // 합계금액		
	end if

	//
	ls_partno      = "1000"	                             		// 사업장 구분
	ls_teamname    = string(em_buseo.text)                	// 부서명(구매팀)
//	ls_acctdate  = string(dw_1.object.oi_date[1],"yyyymmdd") // 계산서일자
	
	lY_SAVE        = lY
	ls_insp_flag   = dw_1.object.insp_flag[lY]					// 수금유형

	lb_add  = true
	choose case ls_insp_flag
		case "1.원자재"
			if ls_prepayment = "Y" then		// (주)포스코강판 
				WF_13108( ll_slipno, lY, ls_teamname, ls_partno, ls_getdate )
			else
				WF_14900( ll_slipno, lY, ls_teamname, ls_partno, ls_getdate, lb_add )
			end if
		
		case "2.부자재"	
			WF_50200( ll_slipno, lY, ls_teamname, ls_partno, ls_getdate, lb_add )

		case "3.상품"
			WF_14600( ll_slipno, lY, ls_teamname, ls_partno, ls_getdate, lb_add )

		case "4.외주가공"
			WF_53300( ll_slipno, lY, ls_teamname, ls_partno, ls_getdate, lb_add )

		case "9.조업자재"
			WF_53001( ll_slipno, lY, ls_teamname, ls_partno, ls_getdate, lb_add )
	end choose
	
	// 환산수량, 금액 누적하기
	il_comqty      = il_comqty      + dw_1.object.comqty[lY]               // 환산수량
	il_ship_amount = il_ship_amount + dw_1.object.ship_amount[lY]          // 운송비용
	il_insp_cash   = il_insp_cash   + dw_1.object.insp_cash[lY]            // 입고금액
	il_insp_rate   = il_insp_rate   + dw_1.object.insp_rate[lY]            // 부가세
	il_insp_total  = il_insp_total  + dw_1.object.insp_total[lY]           // 합계금액
next

if lY_SAVE <> 0 then
	ls_partno      = "1000"	                             		// 사업장 구분
	ls_teamname    = string(em_buseo.text)                	// 부서명(구매팀)
	//	ls_acctdate  = string(dw_1.object.oi_date[1],"yyyymmdd") // 계산서일자

	WF_99999( ll_slipno, lY_SAVE, ls_teamname, ls_partno, ls_getdate )
end if

hpb_1.visible = false
dw_2.setredraw( true )

if GF_Permission( "매입전표_이관작업", gs_userid ) = "Y" then	
	cb_trans.enabled = true
end if

end event

type gb_4 from groupbox within w_apoi_duzon_r
integer x = 3447
integer y = 16
integer width = 489
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type hpb_1 from hprogressbar within w_apoi_duzon_r
integer x = 3077
integer y = 312
integer width = 1006
integer height = 72
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_9 from statictext within w_apoi_duzon_r
integer x = 1646
integer y = 140
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_salesman from datawindow within w_apoi_duzon_r
integer x = 1947
integer y = 136
integer width = 535
integer height = 80
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_apsupp_sales_s"
boolean border = false
boolean livescroll = true
end type

type gb_5 from groupbox within w_apoi_duzon_r
integer x = 2715
integer y = 16
integer width = 709
integer height = 216
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

