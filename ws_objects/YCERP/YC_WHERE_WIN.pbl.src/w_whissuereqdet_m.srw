$PBExportHeader$w_whissuereqdet_m.srw
$PBExportComments$출고의뢰추가관리(상세)(2003/08/20, 이인호)
forward
global type w_whissuereqdet_m from w_inheritance
end type
type dw_4 from datawindow within w_whissuereqdet_m
end type
type st_text from statictext within w_whissuereqdet_m
end type
type cb_1 from commandbutton within w_whissuereqdet_m
end type
type st_1 from statictext within w_whissuereqdet_m
end type
type st_4 from statictext within w_whissuereqdet_m
end type
type ddlb_fld from dropdownlistbox within w_whissuereqdet_m
end type
type st_5 from statictext within w_whissuereqdet_m
end type
type ddlb_op from dropdownlistbox within w_whissuereqdet_m
end type
type sle_1 from singlelineedit within w_whissuereqdet_m
end type
type cb_2 from commandbutton within w_whissuereqdet_m
end type
type cb_3 from commandbutton within w_whissuereqdet_m
end type
type cb_4 from commandbutton within w_whissuereqdet_m
end type
type cb_5 from commandbutton within w_whissuereqdet_m
end type
type ddlb_dwtitles from dropdownlistbox within w_whissuereqdet_m
end type
type cbx_fix from checkbox within w_whissuereqdet_m
end type
type st_2 from statictext within w_whissuereqdet_m
end type
type cb_up from commandbutton within w_whissuereqdet_m
end type
type cb_dn from commandbutton within w_whissuereqdet_m
end type
type dw_3 from datawindow within w_whissuereqdet_m
end type
type dw_5 from datawindow within w_whissuereqdet_m
end type
type dw_6 from datawindow within w_whissuereqdet_m
end type
type cbx_1 from checkbox within w_whissuereqdet_m
end type
type dw_7 from datawindow within w_whissuereqdet_m
end type
type st_save from statictext within w_whissuereqdet_m
end type
type cbx_2 from checkbox within w_whissuereqdet_m
end type
type cbx_3 from checkbox within w_whissuereqdet_m
end type
type st_horizontal from u_splitbar_horizontal within w_whissuereqdet_m
end type
type cbx_4 from checkbox within w_whissuereqdet_m
end type
type cbx_5 from checkbox within w_whissuereqdet_m
end type
type ov_1 from oval within w_whissuereqdet_m
end type
end forward

global type w_whissuereqdet_m from w_inheritance
string tag = "출고의뢰 내역(w_whissuereqdet_m)"
integer x = 599
integer y = 864
integer width = 5189
integer height = 2828
string title = "출고의뢰 내역(w_whissuereqdet_m)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
dw_4 dw_4
st_text st_text
cb_1 cb_1
st_1 st_1
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
ddlb_op ddlb_op
sle_1 sle_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
cbx_fix cbx_fix
st_2 st_2
cb_up cb_up
cb_dn cb_dn
dw_3 dw_3
dw_5 dw_5
dw_6 dw_6
cbx_1 cbx_1
dw_7 dw_7
st_save st_save
cbx_2 cbx_2
cbx_3 cbx_3
st_horizontal st_horizontal
cbx_4 cbx_4
cbx_5 cbx_5
ov_1 ov_1
end type
global w_whissuereqdet_m w_whissuereqdet_m

type variables
gs_where ist_where
string  is_locnosql, i_itemchange
long    il_dw1row, il_scrollpos, il_crow, il_nrow, il_cseq, il_nseq, il_chk_silver
boolean ib_sort, ib_up, ib_save		// 출고예정 공난 CHK
end variables

forward prototypes
public subroutine wf_sel ()
public subroutine wf_visfalse ()
public subroutine wf_issueqty_save (long al_row)
public subroutine wf_issueqty_sort (long al_row, long al_seq, datawindow adw)
public subroutine wf_totalqty ()
public function boolean wf_retrieve (datawindow as_dw, datetime as_reqdate, string as_salesman, integer as_reqseq, integer as_seq, string as_orderno, string as_issue_flag)
end prototypes

public subroutine wf_sel ();//
string   ls_locno, ls_locno_det
long     ll_dw2cnt
decimal  ld_totissueqty

string  ls_flag
long    ll_row
decimal ld_orderqty, ld_rlseqty, ld_issueqty

dw_2.accepttext()
dw_4.accepttext()

ll_row = dw_2.rowcount()
if ll_row < 1 then RETURN

ls_locno       = dw_4.object.loc_no[1]
ld_totissueqty = 0

// 저장소별 수량체크
for ll_row = 1 to dw_2.rowcount()
	ls_locno_det = dw_2.object.saledet_loc_no[ll_row]

	if ls_locno = ls_locno_det then
		ld_totissueqty = ld_totissueqty + dw_2.object.saledet_issue_qty[ll_row]
	end if
next
//dw_2.Modify("tot_issueqty.Text='"+string(ld_totissueqty,"#,##0.00")+"'")

//
ls_flag = 'A'
for ll_row = 1 to dw_2.rowcount()
	if dw_2.object.sel[ll_row] = 'N' then
		ls_flag = 'P'
		exit
	end if
	
  	ld_orderqty  = dw_2.object.saledet_order_qty[ll_row]
	ld_rlseqty   = dw_2.object.saledet_rlse_qty[ll_row]
	ld_issueqty  = dw_2.object.saledet_issue_qty[ll_row]
	
	if ld_orderqty - ld_rlseqty >	ld_issueqty then
		ls_flag = 'P'
		exit
	end if
	
	if ld_rlseqty > 0 and ls_flag <> 'R' then
		ls_flag = 'R'
	end if	
next

//
ll_row = dw_1.getrow()
dw_1.object.issueqty[ll_row] = ld_totissueqty		// 선정수량 보여주기			
dw_1.object.issuereqdet_issue_flag[ll_row] = ls_flag
dw_1.accepttext()

end subroutine

public subroutine wf_visfalse ();dw_1.enabled = false
pb_insert.enabled = false
pb_delete.enabled = false
cb_1.enabled = false

end subroutine

public subroutine wf_issueqty_save (long al_row);//////////////////////////////////////////
// 선정수량 저장하기
//////////////////////////////////////////
long	   ll_row, ll_dw2cnt, ll_dw6cnt, ll_reqseq, ll_seq, ll_seqno
decimal  ld_issueqty, ld_sale_issueqty, ld_original_issueqty, ld_old_issue_qty, ld_sum_issueqty
datetime ldt_reqdate
string   ls_reqdate, ls_salesman, ls_orderno, ls_itemno, ls_qa, ls_locno

dw_1.accepttext() ; 
dw_2.accepttext() ;
dw_4.accepttext() ;
ls_locno   = dw_4.object.loc_no[1]

// 행 삭제한 경우
if isnull(al_row) OR al_row < 1 then RETURN

ldt_reqdate = dw_1.object.issuereqdet_req_date[al_row]
ls_reqdate  = string(ldt_reqdate,"yyyy/mm/dd")
ls_salesman = dw_1.object.issuereqdet_salesman[al_row]
ll_reqseq   = dw_1.object.issuereqdet_req_seq[al_row]
ll_seq      = al_row
ll_seq      = dw_1.object.issuereqdet_seq[al_row]
ls_orderno  = dw_1.object.issuereqdet_sale_no[al_row]



dw_6.retrieve( ls_reqdate, ls_salesman, ll_reqseq, ll_seq )

if dw_6.rowcount() > 0 then
	// 수정하기(Delete => Insert)
	for ll_row = dw_6.rowcount() to 1 step -1
		dw_6.deleterow( ll_row )
	next
	wf_update1(dw_6, "N")
end if


//delete issuereqdet_sale
//where req_date = :ls_reqdate
//and salesman = :ls_salesman
//and req_seq = :ll_reqseq
//and seq = :ll_seq;


//// 저장하기
//dw_2.setredraw( false )
//dw_2.retrieve( ls_orderno, ls_locno )
//dw_2.setredraw( true )

for ll_row = 1 to dw_2.rowcount()
	
	ld_sale_issueqty = 0
	/*if dw_2.object.sel[ll_row] <> "Y" then CONTINUE	*/
	if dw_2.object.sel[ll_row] = "Y" then
		ls_orderno  = dw_2.object.saledet_order_no[ll_row]
		ll_seqno    = dw_2.object.saledet_seq_no[ll_row]
		ls_itemno   = dw_2.object.saledet_item_no[ll_row]
		ls_qa       = dw_2.object.saledet_qa[ll_row]
		ld_issueqty = dw_2.object.saledet_issue_qty[ll_row]
		
		
/*		insert into issuereqdet_sale
		values (:ldt_reqdate, :ls_salesman, :ll_reqseq, :ll_seq, :ls_orderno, :ll_seqno, :ls_itemno, :ls_qa, :ld_issueqty, getdate() );
*/		
	
//	/*2018-05-31 jowonsuk 추가 로직 반영 */
//	SELECT ISNULL(issue_qty,0) issue_qty
//	       INTO :ld_sale_issueqty
//	FROM SALEDET
//	where order_no = :ls_orderno
//	   and  seq_NO = :ll_seqno;
//	
//	IF ld_sale_issueqty <> ld_issueqty THEN		
//			update SALEDET
//				  set issue_qty  = isnull(:ld_issueqty,0)
//			FROM SALEDET
//			where order_no = :ls_orderno
//				and  seq_NO = :ll_seqno;			
//				
//	end if
//	
//	commit;

		ll_dw6cnt   = dw_6.InsertRow(0)
		dw_6.object.req_date[ll_dw6cnt]  = ldt_reqdate		// 의뢰일자
		dw_6.object.salesman[ll_dw6cnt]  = ls_salesman		// 의뢰자
		dw_6.object.req_seq[ll_dw6cnt]   = ll_reqseq			// 차수
		dw_6.object.seq[ll_dw6cnt]       = ll_seq				// 순번
		
		dw_6.object.order_no[ll_dw6cnt]  = ls_orderno		// 수주번호
		dw_6.object.seq_no[ll_dw6cnt]    = ll_seqno 	      // 수주순번
		dw_6.object.item_no[ll_dw6cnt]   = ls_itemno			// 품목
		dw_6.object.qa[ll_dw6cnt]        = ls_qa			   // 규격
		dw_6.object.issue_qty[ll_dw6cnt] = ld_issueqty		// 선정수량
		dw_6.object.sys_date[ll_dw6cnt]  = gf_today()		// 등록일자

	end if
	
next

wf_update1(dw_6, "N")

//ls_orderno  = dw_1.object.issuereqdet_sale_no[dw_1.getrow()]
//
//UPDATE SALEDET
//SET issue_qty = b.sum_qty
//FROM SALEDET a inner join (
//											select order_no, seq_no, item_no, qa, sum( isnull(issue_qty,0) ) sum_qty
//											 from issuereqdet_sale
//											where order_no = :ls_orderno
//											group by order_no, seq_no, item_no, qa
//									  ) b
//ON  a.order_no = b.order_no and a.seq_no = b.seq_no and a.item_no = b.item_no and a.qa = b.qa
//where a.order_no = :ls_orderno;
//	
//commit;

//dw_2.object.old_issue_qty[dw_1.getrow()] = ld_sum_issueqty	

/*로직 추가 20180531 jowonsuk */
for ll_row = 1 to dw_2.rowcount()
	
	ls_orderno  = dw_2.object.saledet_order_no[ll_row]
	ll_seqno    = dw_2.object.saledet_seq_no[ll_row]
	ls_itemno   = dw_2.object.saledet_item_no[ll_row]
	ls_qa       = dw_2.object.saledet_qa[ll_row]
	/*jowonsuk 2018.08.07 수정시에 기존 선정 수량을 삭제한다. 시작 */
//	ld_issueqty = dw_2.object.saledet_issue_qty[ll_row]
//	ld_issueqty = dw_2.GetItemdecimal(ll_row, "saledet_issue_qty", Primary!, FALSE) 
//	ld_original_issueqty = dw_2.GetItemdecimal(ll_row, "saledet_issue_qty", Primary!, TRUE) 
	
	/*2018-05-31 jowonsuk 추가 로직 반영 */
	/*2018.08월초  jowonsuk   선정수량 변경시 업데이트로 변경  */
	/*  실제로는 기선정수량은 의미가 없다. dodet 삭제시에도 기선정수량 반영 안됨.  송장 등록시, saledet , issue_qty 기선정수량  = 기선정수량  - 출고량, 0보다 작으면 0이 들어감.   */
			/*
					H 지점이송, 예) 시화 -> 화성 -> 현장 
					
										시화 -> 화성  ( 지점이송 ): 선정수량 반영 안함, 출고의뢰는 일어남.
										화성 -> 현장                    : 선정수량 반영, 		출고의뢰	 일어남.
				
				
					※ saledet issue_qty는 의미가 없음, issuereqdet_sale 의 issue_qty가 중요하다. 
		      */
	
		select sum( isnull(issue_qty,0) )
		into :ld_sum_issueqty
		from issuereqdet_sale
			where order_no = :ls_orderno
			  and  seq_no = :ll_seqno
			  and  item_no = :ls_itemno
			  and qa = :ls_qa;
			  
	
//		update SALEDET
//			 set issue_qty  = :ld_sum_issueqty
//		where order_no = :ls_orderno
//			and  seq_NO = :ll_seqno
//			  and  item_no = :ls_itemno
//			  and qa = :ls_qa;					
			  
		
		dw_2.object.old_issue_qty[ll_row] = ld_sum_issueqty	
		
		
//		UPDATE SALEDET
//		SET issue_qty = b.sum_qty
//		FROM SALEDET a inner join (
//													select order_no, sum( isnull(issue_qty,0) ) sum_qty
//												  	   into :ld_sum_issueqty
//													 from issuereqdet_sale
//													where order_no = :ls_orderno
//											  ) b
//		ON  a.order_no = b.order_no and a.seq_no = b.seq_no and a.item_no = b.item_no and a.qa = b.qa
//		where a.order_no = :ls_orderno;
		
		
		
		
	
//	commit;
	

	/*2018.08.07 jowonsuk 주석처리  
	update SALEDET
		  set issue_qty  = ( case when isnull(order_qty,0) <= isnull(:ld_issueqty,0) then  isnull(order_qty,0)  else isnull(:ld_issueqty,0)  end )	/*촐고의뢰의 선정수량이 수주 주문량보다 많으면 수주주문량을 수주 선정량에 등록. 선정수량은 거래명세서 발행쪽에서 출고 기보수량으로 잡힌다.. */
	where order_no = :ls_orderno
		and  seq_NO = :ll_seqno
		  and  item_no = :ls_itemno
		  and qa = :ls_qa;				  
     */
		
next

ls_orderno  = dw_1.object.issuereqdet_sale_no[dw_1.getrow()]

UPDATE SALEDET
SET issue_qty = b.sum_qty
FROM SALEDET a inner join (
											select order_no, seq_no, item_no, qa, sum( isnull(issue_qty,0) ) sum_qty
											 from issuereqdet_sale
											where order_no = :ls_orderno
											group by order_no, seq_no, item_no, qa
									  ) b
ON  a.order_no = b.order_no and a.seq_no = b.seq_no and a.item_no = b.item_no and a.qa = b.qa
where a.order_no = :ls_orderno;
	
commit;


end subroutine

public subroutine wf_issueqty_sort (long al_row, long al_seq, datawindow adw);//////////////////////////////////////////
// 선정수량 저장하기
//////////////////////////////////////////
long	   ll_row, ll_dw2cnt, ll_dw6cnt, ll_reqseq, ll_seq, ll_seqno
decimal  ld_issueqty
datetime ldt_reqdate
string   ls_reqdate, ls_salesman, ls_orderno, ls_itemno, ls_qa

dw_1.accepttext() ; dw_2.accepttext()

// 행 삭제한 경우
if adw.rowcount() < 1 then RETURN

debugbreak()

ldt_reqdate = dw_1.object.issuereqdet_req_date[al_row]
ls_reqdate  = string(ldt_reqdate,"yyyy/mm/dd")
ls_salesman = dw_1.object.issuereqdet_salesman[al_row]
ll_reqseq   = dw_1.object.issuereqdet_req_seq[al_row]
ll_seq      = dw_1.object.issuereqdet_seq[al_row]
ls_orderno  = dw_1.object.issuereqdet_sale_no[al_row]

dw_6.retrieve( ls_reqdate, ls_salesman, ll_reqseq, ll_seq )
if dw_6.rowcount() > 0 then
	for ll_row = dw_6.rowcount() to 1 step -1
		dw_6.deleterow( ll_row )
	next
	wf_update1(dw_6, "N")
end if

for ll_row = 1 to adw.rowcount()
	if adw.object.sel[ll_row] <> "Y" then CONTINUE

	ls_orderno  = adw.object.saledet_order_no[ll_row]
	ll_seqno    = adw.object.saledet_seq_no[ll_row]
	ls_itemno   = adw.object.saledet_item_no[ll_row]
	ls_qa       = adw.object.saledet_qa[ll_row]
	ld_issueqty = adw.object.saledet_issue_qty[ll_row]
	
	ll_dw6cnt   = dw_6.InsertRow(0)
	dw_6.object.req_date[ll_dw6cnt]  = ldt_reqdate		// 의뢰일자
	dw_6.object.salesman[ll_dw6cnt]  = ls_salesman		// 의뢰자
	dw_6.object.req_seq[ll_dw6cnt]   = ll_reqseq			// 차수
	dw_6.object.seq[ll_dw6cnt]       = al_seq				// 순번
	
	dw_6.object.order_no[ll_dw6cnt]  = ls_orderno		// 수주번호
	dw_6.object.seq_no[ll_dw6cnt]    = ll_seqno 	      // 수주순번
	dw_6.object.item_no[ll_dw6cnt]   = ls_itemno			// 품목
	dw_6.object.qa[ll_dw6cnt]        = ls_qa			   // 규격
	dw_6.object.issue_qty[ll_dw6cnt] = ld_issueqty		// 선정수량
	dw_6.object.sys_date[ll_dw6cnt]  = gf_today()		// 등록일자
next
wf_update1(dw_6, "N")


/*로직 추가 20180531 jowonsuk */
for ll_row = 1 to dw_2.rowcount()
	
	ls_orderno  = dw_2.object.saledet_order_no[ll_row]
	ll_seqno    = dw_2.object.saledet_seq_no[ll_row]
	ls_itemno   = dw_2.object.saledet_item_no[ll_row]
	ls_qa       = dw_2.object.saledet_qa[ll_row]
	ld_issueqty = dw_2.object.saledet_issue_qty[ll_row]
	
	/*2018-05-31 jowonsuk 추가 로직 반영 */
	select sum( isnull(issue_qty,0) )
	into :ld_issueqty
	from issuereqdet_sale
		where order_no = :ls_orderno
			and  seq_NO = :ll_seqno
		  and  item_no = :ls_itemno
		  and qa = :ls_qa;


	update SALEDET
		  set issue_qty  = isnull(:ld_issueqty,0)
	FROM SALEDET
	where order_no = :ls_orderno
		and  seq_NO = :ll_seqno
		  and  item_no = :ls_itemno
		  and qa = :ls_qa;				
		
next

end subroutine

public subroutine wf_totalqty ();//
decimal ld_totissueqty
long    ll_dw2cnt
string  ls_locno, ls_locno_det

// 저장소
dw_2.accepttext()			
dw_4.accepttext()

if dw_4.rowcount() < 1 then RETURN

ls_locno = dw_4.object.loc_no[1]

// 저장소별 수량체크
ld_totissueqty = 0
for ll_dw2cnt = 1 to dw_2.rowcount()
	ls_locno_det = dw_2.object.saledet_loc_no[ll_dw2cnt]
	
	if ls_locno = ls_locno_det then
		ld_totissueqty = ld_totissueqty + dw_2.object.saledet_issue_qty[ll_dw2cnt]
	end if
next

dw_1.object.issueqty[il_dw1row] = ld_totissueqty		// 선정수량 보여주기			
//dw_2.Modify("tot_issueqty.Text='"+string(ld_totissueqty,"#,##0.00")+"'")
//dw_2.accepttext()			
//
end subroutine

public function boolean wf_retrieve (datawindow as_dw, datetime as_reqdate, string as_salesman, integer as_reqseq, integer as_seq, string as_orderno, string as_issue_flag);/* 2018.05.30 jowonsuk 추가로직  

  출고의뢰상세 테이블에 저장되어 있으면 
  해당하는 내용을 가져와서 보여줘야한다.
  saledet에만 있는걸 수주번호로만 가져오면 
  동일수주의 품목을 나누어서 출고의뢰시 제대로 조회가 
  되지 않고 중복 발생하여, 내용 수정함
*/
long l_count, ll_row, l_seq_no, ll_dw2row
string ls_order_no, ls_item_no, ls_qa, ls_uom, ls_saledet_text, ls_action, ls_loc_no, ls_rem, ls_color, ls_item_name, ls_do_rem, ls_sel, ls_saledet_locno_org, ls_issueqty_chk
string ls_sqlerrtext, ls_locno
decimal l_order_qty, l_price, l_acc_qty, l_sol_qty, l_issue_qty, l_rlse_qty, l_plan_qty, l_price_be, l_stock_qty, l_stock_issue, l_stock_do, l_issueqty_org, l_old_issue_qty
datetime ldt_rlse_date, ldt_plan_close


/*선택한것만 2018-05-28 jowonsuk */
DECLARE issuereqdet1_cursor CURSOR FOR  
SELECT DISTINCT  saledet.order_no   
						 , saledet.seq_no   
						 , saledet.item_no   
						 , saledet.qa   
						 , saledet.uom   
						 , saledet.order_qty   
						 , saledet.price   
						 , saledet.acc_qty   
						 , saledet.saledet_text   
						 , saledet.action   
						 , saledet.sol_qty   
						 , saledet.loc_no   
						 , isnull(saledet.order_qty,0) - isnull(saledet.rlse_qty,0) issue_qty   			/*2018.08.23 jowonsuk 수정 saledet.issue_qty -> isnull(saledet.order_qty,0) - isnull(saledet.rlse_qty,0) */
						 , saledet.issue_qty old_issue_qty 						 
						 , saledet.rlse_date   
						 , isnull(saledet.rlse_qty,0) rlse_qty
						 , saledet.rem   
						 , saledet.plan_qty   
						 , saledet.plan_close   
						 , saledet.color   
						 , saledet.price_be   
						 , groupitem.item_name   
						 , saledet.do_rem   
						 , saledet.stock_qty   
						 , saledet.stock_issue   
						 , sel   = (case when :as_issue_flag = 'A' THEN 'Y'  
						                        when :as_issue_flag = 'R' then  (case when isnull(saledet.order_qty,0) - isnull(saledet.rlse_qty,0) > 0 then 'Y' else 'N' end ) 
				                            else 'N' END ) /* (case when saledet.issue_qty > 0 then 'Y' else 'N' end) */
						 , saledet.stock_do
						 , issueqty_org      = saledet.issue_qty
						 , saledet_locno_org = saledet.loc_no
						 , issueqty_chk = (case when :ls_locno  = isnull(saledet.loc_no, :ls_locno) then 'N'  else 'Y' end )	
    FROM  saledet with(nolock) LEFT OUTER JOIN groupitem with(nolock) ON saledet.item_no = groupitem.item_no  
   WHERE ( saledet.order_no  = :as_orderno      )
     AND ( saledet.order_qty > saledet.rlse_qty );    
	  
/*전체가 나오고 표시  2018-05-28 jowonsuk */	  
DECLARE issuereqdet_cursor CURSOR FOR  
SELECT DISTINCT  saledet.order_no   
						 , saledet.seq_no   
						 , saledet.item_no   
						 , saledet.qa   
						 , saledet.uom   
						 , saledet.order_qty   
						 , saledet.price   
						 , saledet.acc_qty   
						 , saledet.saledet_text   
						 , saledet.action   
						 , saledet.sol_qty   
						 , isnull(saledet.loc_no, :ls_locno ) loc_no
/*						 , saledet.issue_qty */,  ( case when :l_count  > 0 then isnull( issuereqdet_sale.issue_qty, 0) else 0  end ) issue_qty /* 기 선정 수량이 있으면 그 양을 표시, 기선정수량이 없으면 0 */
						 , saledet.issue_qty old_issue_qty 	
						 , saledet.rlse_date   
						 , isnull(saledet.rlse_qty,0) rlse_qty
						 , saledet.rem   
						 , saledet.plan_qty   
						 , saledet.plan_close   
						 , saledet.color   
						 , saledet.price_be   
						 , groupitem.item_name   
						 , saledet.do_rem   
						 , saledet.stock_qty   
						 , saledet.stock_issue   
//						 , sel   = (case when isnull(issuereqdet_sale.issue_qty, saledet.issue_qty) > 0 then 'N' else 'Y' end) /* 기출고면 N 이고, 미출고면 Y로 이게 맞다. */
						 , sel   = ( case when ( case when :l_count  > 0 then isnull( issuereqdet_sale.issue_qty, 0) else 0  end )  > 0 then 'Y' else 'N' end )
						 , saledet.stock_do
						 , issueqty_org      = ( case when :l_count  > 0 then isnull( issuereqdet_sale.issue_qty, 0) else 0  end )
						 , saledet_locno_org = saledet.loc_no
/*						 ,  issueqty_chk = (case when :ls_locno  = isnull(saledet.loc_no, :ls_locno) then 'N'  else 'Y' end )																					*/
/*						 , issueqty_chk   = ( case when (  case when :l_count  <> 0 then isnull( issuereqdet_sale.issue_qty, 0) else isnull(saledet.order_qty,0)  - isnull(saledet.issue_qty,0) end )  <= 0 then 'Y' else 'N' end )			 */
						 , issueqty_chk = 'N'																								
    FROM saledet with(nolock) left outer join  (     
															 select order_no, seq_no, item_no, qa,  sum(isnull(issue_qty,0)) issue_qty 
																	from  issuereqdet_sale with(nolock) 
																where   ( issuereqdet_sale.req_date  = :as_reqdate )
																		  AND ( issuereqdet_sale.salesman  = :as_salesman )
																		  AND ( issuereqdet_sale.req_seq  = :as_reqseq )
																		  AND ( issuereqdet_sale.seq  = :as_seq )
																		  AND ( issuereqdet_sale.order_no  = :as_orderno ) 	 
																 group by  order_no, seq_no, item_no, qa																	
	                                                                    ) issuereqdet_sale on saledet.order_no = issuereqdet_sale.order_no  and   saledet.seq_no = issuereqdet_sale.seq_no
                                             LEFT OUTER JOIN groupitem with(nolock) ON saledet.item_no = groupitem.item_no  
   WHERE (saledet.order_no = :as_orderno )
     AND ( saledet.order_qty > saledet.rlse_qty );
	  
	ls_locno  = dw_4.object.loc_no[1]
	
	l_count = 0
	
	select  count(*)
	into :l_count
	  from issuereqdet_sale
	where req_date = :as_reqdate
		and salesman = :as_salesman
		and req_seq = :as_reqseq
		and seq = :as_seq
		and order_no = :as_orderno;


	if l_count > 0 then
			
			as_dw.reset();
			
			OPEN issuereqdet_cursor;

			
					FETCH issuereqdet_cursor INTO  	 :ls_order_no,   
																 :l_seq_no,   
																 :ls_item_no,   
																 :ls_qa,
																 :ls_uom,   
																 :l_order_qty,   
																 :l_price,   
																 :l_acc_qty,   
																 :ls_saledet_text,   
																 :ls_action,   
																 :l_sol_qty,   
																 :ls_loc_no,  
																 :l_issue_qty,   
																 :l_old_issue_qty,   																 
																 :ldt_rlse_date,   
																 :l_rlse_qty,   
																 :ls_rem,   
																 :l_plan_qty,   
																 :ldt_plan_close,   
																 :ls_color,   
																 :l_price_be,   
																 :ls_item_name,   
																 :ls_do_rem,   
																 :l_stock_qty,   
																 :l_stock_issue ,  
																 :ls_sel,
																 :l_stock_do,
																 :l_issueqty_org,
																 :ls_saledet_locno_org,
																 :ls_issueqty_chk;
					
					Do While sqlca.sqlcode = 0
								 
						if sqlca.sqlcode < 0 then
							ls_sqlerrtext = string(sqlca.sqlerrtext)
							ROLLBACK;				
							MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
							RETURN false
						end if
						
						
						ll_row = as_dw.insertrow(0)
						
						as_dw.object.saledet_order_no[ll_row]						=				ls_order_no
						as_dw.object.saledet_seq_no[ll_row]							=				l_seq_no
						as_dw.object.saledet_item_no[ll_row]							=				ls_item_no
						as_dw.object.saledet_qa[ll_row]   								=				ls_qa                                                 
						as_dw.object.saledet_uom[ll_row]								=				ls_uom                                            
						as_dw.object.saledet_order_qty[ll_row]   						=				l_order_qty
						as_dw.object.saledet_price[ll_row]								=				l_price
						as_dw.object.saledet_acc_qty[ll_row]   						=				l_acc_qty
						as_dw.object.saledet_saledet_text[ll_row]   					=				ls_saledet_text
						as_dw.object.saledet_action[ll_row]   							=				ls_action
						as_dw.object.saledet_sol_qty[ll_row]   						=				l_sol_qty
						as_dw.object.saledet_loc_no[ll_row]   							=				ls_loc_no
						as_dw.object.saledet_issue_qty[ll_row]						=				l_issue_qty
						as_dw.object.old_issue_qty[ll_row]								=				l_old_issue_qty
						as_dw.object.saledet_rlse_date[ll_row]   						=				ldt_rlse_date
						as_dw.object.saledet_rlse_qty[ll_row]   						=				l_rlse_qty
						as_dw.object.saledet_rem[ll_row]   							=				ls_rem
						as_dw.object.saledet_plan_qty[ll_row]   						=				l_plan_qty
						as_dw.object.saledet_plan_close[ll_row]   					=				ldt_plan_close
						as_dw.object.color[ll_row]										=				ls_color
						as_dw.object.saledet_price_be[ll_row]  						=				l_price_be
						as_dw.object.item_item_name[ll_row]   						=				ls_item_name
						as_dw.object.saledet_do_rem[ll_row]   						=				ls_do_rem
						as_dw.object.saledet_stock_qty[ll_row]   						=				l_stock_qty
						as_dw.object.saledet_stock_issue[ll_row]   					=				l_stock_issue
						as_dw.object.sel[ll_row]											=				ls_sel
						as_dw.object.saledet_stock_do[ll_row]						=				l_stock_do
						as_dw.object.issueqty_org[ll_row]								=				l_issueqty_org
						as_dw.object.saledet_locno_org[ll_row]						=				ls_saledet_locno_org
						as_dw.object.issueqty_chk[ll_row]								=				ls_issueqty_chk

						as_dw.setItemStatus(ll_row, 0, Primary!, DataModified!)
							
						FETCH issuereqdet_cursor INTO  	 :ls_order_no,   
																	 :l_seq_no,   
																	 :ls_item_no,   
																	 :ls_qa,
																	 :ls_uom,   
																	 :l_order_qty,   
																	 :l_price,   
																	 :l_acc_qty,   
																	 :ls_saledet_text,   
																	 :ls_action,   
																	 :l_sol_qty,   
																	 :ls_loc_no,  
																	 :l_issue_qty, 
																	 :l_old_issue_qty,
																	 :ldt_rlse_date,   
																	 :l_rlse_qty,   
																	 :ls_rem,   
																	 :l_plan_qty,   
																	 :ldt_plan_close,   
																	 :ls_color,   
																	 :l_price_be,   
																	 :ls_item_name,   
																	 :ls_do_rem,   
																	 :l_stock_qty,   
																	 :l_stock_issue ,  
																	 :ls_sel,
																	 :l_stock_do,
																	 :l_issueqty_org,
																	 :ls_saledet_locno_org,
																	 :ls_issueqty_chk;
						
					
					Loop
					
				
					CLOSE issuereqdet_cursor;
					

	else
		as_dw.reset();
			
			OPEN issuereqdet1_cursor;

			
					FETCH issuereqdet1_cursor INTO  :ls_order_no,   
																 :l_seq_no,   
																 :ls_item_no,   
																 :ls_qa,
																 :ls_uom,   
																 :l_order_qty,   
																 :l_price,   
																 :l_acc_qty,   
																 :ls_saledet_text,   
																 :ls_action,   
																 :l_sol_qty,   
																 :ls_loc_no,  
																 :l_issue_qty, 
																 :l_old_issue_qty,
																 :ldt_rlse_date,   
																 :l_rlse_qty,   
																 :ls_rem,   
																 :l_plan_qty,   
																 :ldt_plan_close,   
																 :ls_color,   
																 :l_price_be,   
																 :ls_item_name,   
																 :ls_do_rem,   
																 :l_stock_qty,   
																 :l_stock_issue ,  
																 :ls_sel,
																 :l_stock_do,
																 :l_issueqty_org,
																 :ls_saledet_locno_org,
																 :ls_issueqty_chk;
					
					Do While sqlca.sqlcode = 0
								 
						if sqlca.sqlcode < 0 then
							ls_sqlerrtext = string(sqlca.sqlerrtext)
							ROLLBACK;				
							MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
							RETURN false
						end if
						
						
						ll_row = as_dw.insertrow(0)
						
						as_dw.object.saledet_order_no[ll_row]						=				ls_order_no
						as_dw.object.saledet_seq_no[ll_row]							=				l_seq_no
						as_dw.object.saledet_item_no[ll_row]							=				ls_item_no
						as_dw.object.saledet_qa[ll_row]   								=				ls_qa                                                 
						as_dw.object.saledet_uom[ll_row]								=				ls_uom                                            
						as_dw.object.saledet_order_qty[ll_row]   						=				l_order_qty
						as_dw.object.saledet_price[ll_row]								=				l_price
						as_dw.object.saledet_acc_qty[ll_row]   						=				l_acc_qty
						as_dw.object.saledet_saledet_text[ll_row]   					=				ls_saledet_text
						as_dw.object.saledet_action[ll_row]   							=				ls_action
						as_dw.object.saledet_sol_qty[ll_row]   						=				l_sol_qty
						as_dw.object.saledet_loc_no[ll_row]   							=				ls_loc_no
						as_dw.object.saledet_issue_qty[ll_row]						=				l_issue_qty
						as_dw.object.old_issue_qty[ll_row]								=				l_old_issue_qty
						as_dw.object.saledet_rlse_date[ll_row]   						=				ldt_rlse_date
						as_dw.object.saledet_rlse_qty[ll_row]   						=				l_rlse_qty
						as_dw.object.saledet_rem[ll_row]   							=				ls_rem
						as_dw.object.saledet_plan_qty[ll_row]   						=				l_plan_qty
						as_dw.object.saledet_plan_close[ll_row]   					=				ldt_plan_close
						as_dw.object.color[ll_row]										=				ls_color
						as_dw.object.saledet_price_be[ll_row]  						=				l_price_be
						as_dw.object.item_item_name[ll_row]   						=				ls_item_name
						as_dw.object.saledet_do_rem[ll_row]   						=				ls_do_rem
						as_dw.object.saledet_stock_qty[ll_row]   						=				l_stock_qty
						as_dw.object.saledet_stock_issue[ll_row]   					=				l_stock_issue
						as_dw.object.sel[ll_row]											=				ls_sel
						as_dw.object.saledet_stock_do[ll_row]						=				l_stock_do
						as_dw.object.issueqty_org[ll_row]								=				l_issueqty_org
						as_dw.object.saledet_locno_org[ll_row]						=				ls_saledet_locno_org
						as_dw.object.issueqty_chk[ll_row]								=				ls_issueqty_chk

						as_dw.setItemStatus(ll_row, 0, Primary!, DataModified!)
							
						FETCH issuereqdet1_cursor INTO  :ls_order_no,   
																	 :l_seq_no,   
																	 :ls_item_no,   
																	 :ls_qa,
																	 :ls_uom,   
																	 :l_order_qty,   
																	 :l_price,   
																	 :l_acc_qty,   
																	 :ls_saledet_text,   
																	 :ls_action,   
																	 :l_sol_qty,   
																	 :ls_loc_no,  
																	 :l_issue_qty,   
																	 :l_old_issue_qty,
																	 :ldt_rlse_date,   
																	 :l_rlse_qty,   
																	 :ls_rem,   
																	 :l_plan_qty,   
																	 :ldt_plan_close,   
																	 :ls_color,   
																	 :l_price_be,   
																	 :ls_item_name,   
																	 :ls_do_rem,   
																	 :l_stock_qty,   
																	 :l_stock_issue ,  
																	 :ls_sel,
																	 :l_stock_do,
																	 :l_issueqty_org,
																	 :ls_saledet_locno_org,
																	 :ls_issueqty_chk;
						
					
					Loop
									
			CLOSE issuereqdet1_cursor;
	end if


return true
end function

on w_whissuereqdet_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.st_text=create st_text
this.cb_1=create cb_1
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.cbx_fix=create cbx_fix
this.st_2=create st_2
this.cb_up=create cb_up
this.cb_dn=create cb_dn
this.dw_3=create dw_3
this.dw_5=create dw_5
this.dw_6=create dw_6
this.cbx_1=create cbx_1
this.dw_7=create dw_7
this.st_save=create st_save
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.st_horizontal=create st_horizontal
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.ov_1=create ov_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.st_text
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.cbx_fix
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.cb_up
this.Control[iCurrent+18]=this.cb_dn
this.Control[iCurrent+19]=this.dw_3
this.Control[iCurrent+20]=this.dw_5
this.Control[iCurrent+21]=this.dw_6
this.Control[iCurrent+22]=this.cbx_1
this.Control[iCurrent+23]=this.dw_7
this.Control[iCurrent+24]=this.st_save
this.Control[iCurrent+25]=this.cbx_2
this.Control[iCurrent+26]=this.cbx_3
this.Control[iCurrent+27]=this.st_horizontal
this.Control[iCurrent+28]=this.cbx_4
this.Control[iCurrent+29]=this.cbx_5
this.Control[iCurrent+30]=this.ov_1
end on

on w_whissuereqdet_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.st_text)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.cbx_fix)
destroy(this.st_2)
destroy(this.cb_up)
destroy(this.cb_dn)
destroy(this.dw_3)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.cbx_1)
destroy(this.dw_7)
destroy(this.st_save)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.st_horizontal)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.ov_1)
end on

event open;/* Message.PowerObjectParm 정보
lstr_where.str1 // 의뢰일자
lstr_where.str2 // 의뢰자 
lstr_where.str3 // 차수
lstr_where.str4 // 의뢰구분

if dw_1.getrow() > 0 then
	lstr_where.str5 = string(dw_1.getrow())	// 선택행
else
	lstr_where.str5 = '0'							// 출고수주건 수
end if

lstr_where.chk  = 'Y'
if dw_1.rowcount() > 0 then
	lstr_where.name // 수신자
else
	lstr_where.name = ""
end if
*/

////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject( dw_1 )
st_horizontal.of_set_bottomobject( dw_2 )
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////
string  ls_area, ls_locno, ls_accept
integer li_row

/* reg_flag 받는 타임 여기서 'A', 'P' 받는 타임  */ist_where = Message.PowerObjectParm

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

////////////////////////////////////////////////////
// 순위조정후 선정수량 틀어진것 DEBUG용
////////////////////////////////////////////////////
pb_insert.visible = false

st_save.visible = false 
//cb_up.enabled   = false
//cb_dn.enabled   = false

dw_3.visible = false		// 현재행
dw_5.visible = false		// 대상행
dw_6.visible = false		// 선정수량 
dw_7.visible = false

dw_3.x      = dw_2.x
dw_3.y      = dw_2.y
dw_3.height = dw_2.height

dw_5.x      = dw_3.x + dw_3.width
dw_5.y      = dw_2.y
dw_5.width  = dw_3.width
dw_5.height = dw_3.height
////////////////////////////////////////////////////

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)		
dw_4.settransobject(sqlca)		// 저장소
dw_5.SetTransObject(SQLCA)		
dw_6.SetTransObject(SQLCA)		
dw_7.SetTransObject(SQLCA)		

ls_accept = ist_where.name		// 수신자

dw_4.insertrow(0)

if IsValid( w_whissuereq_m ) = true AND ls_accept = "" then
	ls_accept = w_whissuereq_m.dw_1.object.accept_user[1]
	ls_locno  = w_whissuereq_m.dw_1.object.loc_no[1]
	if isnull(ls_locno) OR ls_locno = "" then
	else
		dw_4.object.loc_no[1] = ls_locno
	end if
else
	
// 2017/12/18 조원석 수정 기존 로직에 union all 부분 추가 시작.
//	SELECT loc_no INTO :ls_locno FROM location WHERE loc_manager = :ls_accept;

  select loc_no
    into :ls_locno
  from 
  (
		SELECT loc_no, loc_manager FROM location
			union all
		SELECT  'WS00000000' loc_no, item_cd  
		  FROM  CODEMST	
		 WHERE TYPE LIKE '출고의뢰서_보조자(시화)' AND  USE_YN = 'Y'
  ) a
  WHERE a.loc_manager = :ls_accept;
// 2017/12/18 조원석 수정 기존 로직에 union all 부분 추가 끝.

	if isnull(ls_locno) OR ls_locno = "" then
		ls_locno = "WS00000000"			// 시화저장소 
		MessageBox("확인","접수자의 저장소를 확인할 수 없어 기본값으로 변경합니다.")
		//RETURN
	end if
	dw_4.object.loc_no[1] = ls_locno	
end if


//ls_area = ist_where.name
//SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :ls_area;
//if isnull(ls_locno) or ls_locno = "" then ls_locno = "WS00000000"
//
//dw_4.object.loc_no[1] = ls_locno	//'WS00000000'		// 시화저장소 
dw_4.enabled = false

///////////////////////////////////////////////////////////////////
// issuereqdet.req_flag = 'A' : 출고의뢰 .
// issuereqdet.req_flag = 'B' : "생산확인" text
// issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
// issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
///////////////////////////////////////////////////////////////////
if ist_where.str4 = "A" then
	st_text.text      = "출고의뢰 내역"
else
	dw_2.object.sel.protect                    = 1
	dw_2.object.saledet_issue_qty.protect      = 1
	dw_2.object.saledet_stock_issue.protect    = 1
	dw_1.object.issuereqdet_issue_flag.protect = 1
	
	cb_1.enabled      = false
	st_text.backcolor = rgb(0,128,0)
	st_text.text      = "생산확인 내역"
end if

if ist_where.chk = "N" then
	pb_retrieve.enabled = false
	pb_delete.enabled   = false
	pb_save.enabled     = false
	pb_insert.enabled   = false
	cb_1.enabled        = false
end if

li_row = integer(ist_where.str3)		// 선택행

dw_2.object.saledet_loc_no.protect = 1
dw_2.reset() ; dw_3.reset() ; dw_6.reset()

dw_1.retrieve( date(ist_where.str1), ist_where.str2, li_row, ist_where.str4, ls_locno )

/* dw_1. UPDATE 속성
Unique Key Column(s)
	issuereqdet_req_date
	issuereqdet_salesman
	issuereqdet_req_seq
	issuereqdet_req_flag
	issuereqdet_seq
	
	//issuereqdet_cust_no
	//issuereqdet_scene_code
	//issuereqdet_add_scene

Updateable Column(s)
	issuereqdet_req_date
	issuereqdet_salesman
	issuereqdet_req_seq
	issuereqdet_req_flag
	issuereqdet_seq
	issuereqdet_cust_no
	issuereqdet_scene_code
	issuereqdet_add_scene
	issuereqdet_sale_no
	issuereqdet_item_name
	issuereqdet_uom
	issuereqdet_issue_flag
	issuereqdet_issue_schedule
	issuereqdet_ship_flag
	issuereqdet_ship_case
	issuereqdet_tel
	issuereqdet_rem
	issuereqdet_sys_date
*/

end event

event mousemove;//
end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)

st_horizontal.y     = dw_1.y + dw_1.height
st_horizontal.width = dw_1.width

dw_2.y      = st_horizontal.y + st_horizontal.height 
dw_2.width  = dw_1.width

end event

event close;call super::close;//
ist_where.chk = "N"
CloseWithReturn( this, ist_where)

end event

type pb_save from w_inheritance`pb_save within w_whissuereqdet_m
integer x = 2171
integer width = 274
integer height = 136
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::clicked;// 저장
boolean  lb_update
long     ll_row, ll_cnt, ll_seqno, ll_reqseq, ll_seq,  l_Net
decimal  ld_issueqty, ld_totissueqty
datetime ldt_reqdate, ldt_sysdate
string   ls_salesman, ls_schedule, ls_issueflag, ls_today, ls_sqlerrtext
string   ls_reqflag

if dw_1.rowcount() < 1 then RETURN

for ll_row = 1 to dw_1.rowcount()
	ls_reqflag   = dw_1.object.issuereqdet_req_flag[ll_row]
	ls_schedule  = dw_1.object.issuereqdet_issue_schedule[ll_row]
	ls_issueflag = dw_1.object.issuereqdet_issue_flag[ll_row]
	ld_totissueqty  = dw_1.object.tot_issueqty[ll_row]
		
	if ls_reqflag = "A" then	// 출고의뢰
		if ld_totissueqty = 0 then
			l_Net = MessageBox("확인", string(ll_row) + " 행 출고 선정수량이 ZERO 입니다. 저장 하시겠습니까?", Exclamation!, OKCancel!, 2)
			if l_Net = 1 then
			else
				RETURN	
			end if 
			
		end if

		if isnull(ls_schedule) OR ls_schedule = "" OR isnull(ls_issueflag) OR ls_issueflag = "" then
			MessageBox("확인", string(ll_row) + " 행 출고예정과 출고형태는 공난처리 할 수 없습니다.")
			ib_save = false
			RETURN
		end if
	end if

	if ls_schedule = "C" then
		MessageBox("확인", string(ll_row) + " 행 '자동작성'은 사용 할 수 없습니다.")
		ib_save = false
		RETURN
	end if
next

ib_save = true

ls_today = string(gf_today(),"yyyy/mm/dd")		

/////////////////////////////////////////////////////////////////////////////////////
// A: 출고의뢰, P: 생산확인
/////////////////////////////////////////////////////////////////////////////////////
if ist_where.str4 = "A" then
	ib_save = true

	if dw_1.rowcount() > 0 then
		ld_totissueqty  = dw_1.object.tot_issueqty[1]
		ldt_sysdate     = gf_today()
	end if

	wf_sel()
	
	for ll_row = 1 to dw_1.rowcount()
		ls_schedule  = dw_1.object.issuereqdet_issue_schedule[ll_row]
		ls_issueflag = dw_1.object.issuereqdet_issue_flag[ll_row]

		if ls_schedule = "C" then
			MessageBox("확인", string(ll_row) + " 행 '자동작성'은 사용 할 수 없습니다.")
			ib_save = false
			RETURN
		end if

		if isnull(ls_schedule) OR ls_schedule = "" OR isnull(ls_issueflag) OR ls_issueflag = "" then
			ib_save = false
		end if

		dw_1.object.issuereqdet_sys_date[ll_row] = ldt_sysdate
	next
	
	dw_1.accepttext(); 
	dw_2.accepttext();

	WF_Update2( dw_1, dw_2, "N" )	
	
	// 출고집계 LOG저장
	WF_IssueQTY_SAVE( dw_1.getrow() )
	
else
	dw_1.accepttext()
	WF_Update1( dw_1, "N" )
end if

if dw_1.rowcount() > 0 then
	if ib_save = false then
		MessageBox("확인","출고예정 확인 후 다시 저장하시기 바랍니다.")
		RETURN
	end if
end if

i_itemchange = 'N'

MessageBox("확인","저장했습니다.")
if ist_where.str4 = "A" then
	if il_chk_silver > 0  then
		il_chk_silver = 0
		string ls_return,ls_parm  
		ls_parm = '시공안내요망,실버타일 : 화살표 방향으로 시공요망,'
		openwithparm(w_messagebox,ls_parm)  
		ls_return = message.stringparm  		
	end if
end if
end event

type dw_1 from w_inheritance`dw_1 within w_whissuereqdet_m
integer x = 37
integer y = 404
integer width = 5019
integer height = 904
string dataobject = "d_whissuereqdet_m"
boolean hsplitscroll = true
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////
// Row 변경전후에 출고상세내역을 저장함
//////////////////////////////////////////////////////////
// issuereqdet.req_flag = 'A' : 출고의뢰 .
// issuereqdet.req_flag = 'B' : "생산확인" text
// issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
// issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

datetime ldt_sysdate, ldt_reqdate
string   ls_orderno, ls_reqdate, ls_salesman
long     ll_row, ll_reqseq, ll_seq
string   ls_locno, ls_issue_flag

dw_4.accepttext()
ls_locno   = dw_4.object.loc_no[1]

ll_row = this.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN
il_dw1row  = ll_row
ls_orderno = this.object.issuereqdet_sale_no[ll_row]

// 선정수량
ldt_reqdate = dw_1.object.issuereqdet_req_date[ll_row]
ls_reqdate  = string(ldt_reqdate,"yyyy/mm/dd")
ls_salesman = dw_1.object.issuereqdet_salesman[ll_row]
ll_reqseq   = dw_1.object.issuereqdet_req_seq[ll_row]
ll_seq      = dw_1.object.issuereqdet_seq[ll_row]
ls_issue_flag = dw_1.object.issuereqdet_issue_flag[ll_row]
dw_2.setredraw( false )
wf_retrieve(dw_2, ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno, ls_issue_flag)
dw_2.setredraw( true )

dw_6.retrieve( ls_reqdate, ls_salesman, ll_reqseq, ll_seq )
end event

event dw_1::doubleclicked;call super::doubleclicked;gs_where lstr_where2

if isnull(row) OR row < 1 then RETURN

lstr_where2.str1 = 'A'
lstr_where2.str2 = dw_1.object.issuereqdet_sale_no[row]
OpenWithParm( w_whissueheader_w, lstr_where2 )

end event

event dw_1::losefocus;call super::losefocus;this.accepttext()

end event

event dw_1::itemchanged;call super::itemchanged;string ls_orderno, ls_locno, ls_reqdate, ls_salesman, ls_issue_flag
long   ll_rowcnt, ll_row, ll_reqseq, ll_seq, l_count
datetime ldt_reqdate

this.accepttext()

ls_locno   = dw_4.object.loc_no[1]
ls_orderno = this.object.issuereqdet_sale_no[row]
ldt_reqdate = this.object.issuereqdet_req_date[row]
ls_reqdate  = string(ldt_reqdate,"yyyy/mm/dd")
ls_salesman = this.object.issuereqdet_salesman[row]
ll_reqseq   = this.object.issuereqdet_req_seq[row]
ll_seq      = this.object.issuereqdet_seq[row]

choose case dwo.name
	case "issuereqdet_issue_flag"				// 형태
		if data = "A" OR data = "R" then		// 전량, 잔여분 			
			dw_2.setredraw( false )
			ls_issue_flag = data
			wf_retrieve(dw_2, ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno, ls_issue_flag)
			
			if data = "A" then
				dw_2.accepttext()
				wf_update1(dw_2, 'N')
				WF_IssueQTY_SAVE( row )			
			end if
			
			dw_2.setredraw( true )
		
			cb_1.triggerevent(clicked!)
		end if
end choose


end event

event dw_1::retrieveend;call super::retrieveend;if isnull(rowcount) OR rowcount < 1 then
else
	if this.object.confirm_flag[1] = 'Y' then
		pb_retrieve.enabled = false
		pb_insert.enabled   = false
		pb_delete.enabled   = false
		pb_save.enabled     = false
		cb_1.enabled        = false
	else
		pb_retrieve.enabled = true
		pb_insert.enabled   = true
		pb_delete.enabled   = true
		pb_save.enabled     = true
		cb_1.enabled        = true
	end if
end if

end event

event dw_1::clicked;call super::clicked;if isnull(row) OR row < 1 then RETURN

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_1, row, dwo.name, ddlb_dwtitles)

il_dw1row  = row

end event

event dw_1::rowfocuschanging;call super::rowfocuschanging;string  ls_orderno, ls_itemno, ls_qa
decimal ld_issueqty
integer ll_seqno, ll_row

IF i_itemchange = 'Y' THEN
	dw_2.accepttext()
	wf_update1(dw_2, 'N')
	WF_IssueQTY_SAVE( currentrow )
END IF	

i_itemchange = 'N'

end event

type st_title from w_inheritance`st_title within w_whissuereqdet_m
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whissuereqdet_m
end type

type pb_compute from w_inheritance`pb_compute within w_whissuereqdet_m
boolean visible = false
integer x = 448
integer y = 1704
integer width = 133
integer height = 96
string picturename = ""
end type

type pb_print_part from w_inheritance`pb_print_part within w_whissuereqdet_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_whissuereqdet_m
integer x = 2450
integer width = 274
integer height = 136
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;//
if IsValid( w_oiissuereq_m ) then
	w_oiissuereq_m.pb_retrieve.PostEvent( clicked! )
end if

ist_where.chk = "Y"
CloseWithReturn(parent, ist_where)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whissuereqdet_m
boolean visible = false
integer x = 3109
integer y = 24
integer width = 261
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

type pb_cancel from w_inheritance`pb_cancel within w_whissuereqdet_m
boolean visible = false
integer x = 608
integer y = 1704
integer width = 133
integer height = 96
string picturename = ""
end type

type pb_delete from w_inheritance`pb_delete within w_whissuereqdet_m
boolean visible = false
integer x = 2176
integer width = 169
integer height = 136
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_delete::clicked;call super::clicked;//// 삭제
//string   ls_orderno, ls_salesman
//long     ll_row, ll_dw7cnt, ll_reqseq, ll_seq
//datetime ldt_reqdate
//
//string   ls_locno, ls_locno_det
//long     ll_dw2cnt
//
//if gs_userid = "1999010s" then
//	MessageBox("확인","출고내역 삭제시 상세내역 오류발생함")
//else
//	MessageBox("확인","출고내역 삭제는 '출고의뢰서 작성'에서 하시기 바랍니다.")
//	RETURN
//end if
//
//// dw_1 행삭제시 seq 번호가 issuereqdet, issuereqdeq_sale 과 다른번호 부여되는 오류발생
//// 150911
//dw_1.accepttext()
//
//ll_row = dw_1.getrow()
//if isnull(ll_row) OR ll_row < 1 then RETURN
//
//ldt_reqdate = dw_1.object.issuereqdet_req_date[ll_row]
//ls_salesman = dw_1.object.issuereqdet_salesman[ll_row]         
//ll_reqseq   = dw_1.object.issuereqdet_req_seq[ll_row]          
//ll_seq      = dw_1.object.issuereqdet_seq[ll_row]            
//		 
//ll_dw7cnt = dw_7.insertrow(0)
//dw_7.object.req_date[ll_dw7cnt] = ldt_reqdate
//dw_7.object.salesman[ll_dw7cnt] = ls_salesman
//dw_7.object.req_seq[ll_dw7cnt]  = ll_reqseq
//dw_7.object.seq[ll_dw7cnt]      = ll_seq
//
//dw_1.deleterow(ll_row)
//
//if dw_1.rowcount() < 1 then
//	dw_2.reset()
//else
//	// 상세내역 보여주기
//	ls_orderno = dw_1.object.issuereqdet_sale_no[ll_row]
//	
//	dw_2.setredraw( false )
//	dw_2.retrieve( ls_orderno )
//
//	ls_locno  = dw_4.object.loc_no[1]
//	
//	for ll_dw2cnt = 1 to dw_2.rowcount()
//		ls_locno_det = dw_2.object.saledet_loc_no[ll_dw2cnt]
//		
//		if (ls_locno = ls_locno_det) OR isnull(ls_locno_det) then
//			//
//		else
//			dw_2.object.issueqty_chk[ll_dw2cnt] = "Y"
//		end if
//	next
//	dw_2.setredraw( true )
//end if
//
//
end event

type pb_insert from w_inheritance`pb_insert within w_whissuereqdet_m
string tag = "저장"
integer x = 3913
integer width = 169
integer height = 136
integer textsize = -12
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::mousemove;//
end event

event pb_insert::clicked;call super::clicked;//// 저장
//boolean  lb_update
//long     ll_row, ll_cnt, ll_seqno, ll_reqseq, ll_seq
//decimal  ld_issueqty, ld_totissueqty
//datetime ldt_reqdate, ldt_sysdate
//string   ls_salesman, ls_schedule, ls_issueflag, ls_today, ls_sqlerrtext
//
//ls_today = string(gf_today(),"yyyy/mm/dd")		
//
///////////////////////////////////////////////////////////////////////////////////////
//// A: 출고의뢰, P: 생산확인
///////////////////////////////////////////////////////////////////////////////////////
//if ist_where.str4 = "A" then
//	ib_save = true
//
//	if dw_1.rowcount() > 0 then
//		ld_totissueqty  = dw_1.object.tot_issueqty[1]
//		ldt_sysdate     = gf_today()
//	end if
//
////	if ld_totissueqty = 0 then
////		MessageBox("확인","출고 선정수량이 ZERO 입니다. 확인 후 다시 저장하시기 바랍니다.")
////		RETURN
////	end if
//	
//	for ll_row = 1 to dw_1.rowcount()
//		ls_schedule  = dw_1.object.issuereqdet_issue_schedule[ll_row]
//		ls_issueflag = dw_1.object.issuereqdet_issue_flag[ll_row]
//
//		if ls_schedule = "C" then
//			MessageBox("확인", string(ll_row) + " 행 '자동작성'은 사용 할 수 없습니다.")
//			ib_save = false
//			RETURN
//		end if
//
//		if isnull(ls_schedule) OR ls_schedule = "" OR isnull(ls_issueflag) OR ls_issueflag = "" then
//			ib_save = false
//		end if
//
//		dw_1.object.issuereqdet_sys_date[ll_row] = ldt_sysdate
//	next
//	
//	dw_1.accepttext() ; dw_2.accepttext()	
//	WF_Update2( dw_1, dw_2, "N" )
//	
//	// 출고집계 LOG저장
//	WF_IssueQTY_SAVE( dw_1.getrow() )	
//else
//	dw_1.accepttext()
//	WF_Update1( dw_1, "N" )
//end if
//
//////////////////////////////////////////////////////
//// 순서조정후 선정수량 틀어진것 수량 수정하기
//////////////////////////////////////////////////////
//string  ls_orderno,   ls_sel
//decimal ld_issue_qty, ld_stock_issue		
//string  ls_locno, ls_locno_det
//long    ll_dw2cnt
//
//dw_4.accepttext()
//ls_locno = dw_4.object.loc_no[1]
//
//if ib_sort = true then
//	if dw_3.rowcount() > 0 then
//		ls_orderno = dw_3.object.saledet_order_no[1]		// 대상행
//
//		dw_2.setredraw( false )
//		dw_2.retrieve( ls_orderno, ls_locno )
//		dw_2.setredraw( true )
//	
//		// 현재행
//		for ll_row = 1 to dw_3.rowcount()
//			ls_sel         = dw_3.object.sel[ll_row]
//			ld_issue_qty   = dw_3.object.saledet_issue_qty[ll_row]
//			ld_stock_issue	= dw_3.object.saledet_stock_issue[ll_row]	
//			
//			dw_2.object.sel[ll_row]                 = ls_sel
//			dw_2.object.saledet_issue_qty[ll_row]   = ld_issue_qty
//			dw_2.object.saledet_stock_issue[ll_row] = ld_stock_issue
//		next
//		WF_Update1( dw_2, "N" )
//
//		// 출고집계 LOG저장
//		WF_IssueQTY_SORT( il_nrow, il_nseq, dw_3 )	
//		dw_3.reset()
//	end if
//
//
//	// 이동행(상,하)
//	if dw_5.rowcount() > 0 then
//		ls_orderno = dw_5.object.saledet_order_no[1]
//
//		dw_2.setredraw( false )
//		dw_2.retrieve( ls_orderno, ls_locno )
//		dw_2.setredraw( true )
//		
//		for ll_row = 1 to dw_5.rowcount()		
//			ls_sel         = dw_5.object.sel[ll_row]
//			ld_issue_qty   = dw_5.object.saledet_issue_qty[ll_row]
//			ld_stock_issue	= dw_5.object.saledet_stock_issue[ll_row]	
//			
//			dw_2.object.sel[ll_row]                 = ls_sel
//			dw_2.object.saledet_issue_qty[ll_row]   = ld_issue_qty
//			dw_2.object.saledet_stock_issue[ll_row] = ld_stock_issue
//		next
//		WF_Update1( dw_2, "N" )
//
//		// 출고집계 LOG저장
//		WF_IssueQTY_SORT( il_crow, il_cseq, dw_5 )	
//		dw_5.reset()
//	end if
//	
//	ib_sort = false
//else
//	dw_3.reset()
//	dw_5.reset()
//end if
//////////////////////////////////////////////////////
//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_whissuereqdet_m
integer x = 1998
integer width = 169
integer height = 136
string picturename = "c:\bmp\pencil.bmp"
end type

event pb_retrieve::mousemove;//
end event

event pb_retrieve::clicked;call super::clicked;//
gs_where lstr_where2
string ls_orderno, ls_reqdate, ls_salesman, ls_issue_flag
long   ll_row, ll_reqseq, ll_seq
datetime  ldt_reqdate

lstr_where2.str1 = "D"
OpenWithParm( w_whissueheader_w, lstr_where2 )

if dw_1.rowcount() > 0 then
	st_save.visible   = false
	pb_insert.enabled = true
	pb_save.enabled   = true
	
	dw_1.accepttext()
	
	dw_1.scrolltorow( dw_1.rowcount() )		// 마지막행 이동 
	
	ll_row     = dw_1.getrow()
	ls_orderno = dw_1.object.issuereqdet_sale_no[ll_row]	
	ldt_reqdate = dw_1.object.issuereqdet_req_date[ll_row]
	ls_reqdate  = string(ldt_reqdate, "yyyy/mm/dd")
	ls_salesman = dw_1.object.issuereqdet_salesman[ll_row]
	ll_reqseq   = dw_1.object.issuereqdet_req_seq[ll_row]
	ll_seq      = dw_1.object.issuereqdet_seq[ll_row]	
	ls_issue_flag = dw_1.object.issuereqdet_issue_flag[ll_row]
	
	dw_2.setredraw( false )
//	dw_2.retrieve(ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno )
//	dw_2.retrieve(ls_orderno )																/* 2018.05. 31 jowonsuk 주석처리  */
	wf_retrieve(dw_2, ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno, ls_issue_flag)		/* 2018.05. 31 jowonsuk 추가 */
	dw_2.setredraw( true )
end if

end event

type gb_3 from w_inheritance`gb_3 within w_whissuereqdet_m
integer x = 37
integer y = 212
integer width = 5019
integer height = 180
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whissuereqdet_m
integer x = 1038
integer y = 12
integer width = 910
integer height = 196
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_whissuereqdet_m
integer x = 1961
integer width = 800
integer height = 196
integer weight = 400
long textcolor = 0
end type

type dw_2 from w_inheritance`dw_2 within w_whissuereqdet_m
integer x = 37
integer y = 1356
integer width = 5019
integer height = 1328
string title = "수주상세"
string dataobject = "d_whissuereqdet_m2"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::itemchanged;call super::itemchanged;string  ls_orderno, ls_locno, ls_locno_det, ls_locno_org, ls_null
integer ll_row
long    ll_dw2cnt, ll_found
decimal ld_issueqty_org, ld_orderqty, ld_rlseqty, ld_stockqty, ld_totissueqty

setnull(ls_null)

// 저장소
dw_4.accepttext()
if dw_4.rowcount() < 1 then RETURN

ls_locno = dw_4.object.loc_no[1]

this.accepttext()
ll_row = this.getrow()

choose case dwo.name
	case "sel"
		ls_locno_org    = this.object.saledet_locno_org[ll_row]
		ld_issueqty_org = this.object.issueqty_org[ll_row]
		
		if data = "Y" then
			this.object.sel[ll_row] = "Y"
			this.object.saledet_loc_no[ll_row] = ls_locno
			
			ld_orderqty = this.object.saledet_order_qty[ll_row]
			ld_rlseqty  = this.object.saledet_rlse_qty[ll_row]
			ld_stockqty = this.object.saledet_stock_qty[ll_row]
			
			if ( ld_orderqty > ld_rlseqty ) then
				this.setitem(ll_row, "saledet_issue_qty", ( ld_orderqty - ld_rlseqty ))
				this.setitem(ll_row, "saledet_stock_issue", ( ld_stockqty - this.object.saledet_stock_do[ll_row] ))
			end if		
			
		else
			this.object.saledet_loc_no[ll_row]      = ls_null
			this.object.saledet_issue_qty[ll_row]   = 0
			this.object.saledet_stock_issue[ll_row] = 0
		end if
		
	case "saledet_stock_issue"
		if this.getitemdecimal(ll_row, "saledet_stock_issue") > this.getitemdecimal(ll_row, "saledet_issue_qty") then
			messagebox("확인", "장기재고수량이 선정수량보다 클수 없습니다.")
			RETURN 1
		end if
end choose

WF_SEL()

i_itemchange = 'Y'
end event

event dw_2::clicked;call super::clicked;if isnull(row) OR row < 1 then RETURN
this.scrolltorow( row )

end event

event dw_2::itemerror;call super::itemerror;integer ll_row

this.setredraw(false)
ll_row = this.getrow()

choose case dwo.name
	case 'saledet_stock_issue'
		this.object.saledet_stock_issue[ll_row] = 0
	case else
		this.object.saledet_issue_qty[ll_row] = 0
end choose

this.accepttext()
this.setredraw(true)

return 1
end event

event dw_2::losefocus;call super::losefocus;this.accepttext()

end event

event dw_2::updatestart;call super::updatestart;dwitemstatus	 ldwstatus
Long		ll_row, ll_cnt
string	ls_temp

for ll_row = 1 to this.rowcount()
	if this.getitemstring(ll_row, 'sel') = 'N' then continue	//선택된것만 확인

	ls_temp	= this.getitemstring(ll_row, 'saledet_item_no')
	select 
		count(*)
	into
		:ll_cnt
	from 
		yc_codemst 
	where 
		mast_cd = 'E002' 
	and 
		detl_cd <> 'ROOT' 
	and 
		detl_nm = :ls_temp
	using sqlca;	
				
	if ll_cnt > 0 then
		il_chk_silver = 1
		exit
	end if
next
end event

type dw_4 from datawindow within w_whissuereqdet_m
integer x = 1070
integer y = 76
integer width = 841
integer height = 88
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type st_text from statictext within w_whissuereqdet_m
integer width = 937
integer height = 128
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "출고의뢰 내역"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_whissuereqdet_m
integer x = 3456
integer y = 268
integer width = 357
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체선택"
end type

event clicked;// 전체선택
decimal  ld_orderqty, ld_rlseqty
long     ll_dw2row, ll_dw5row, ll_cnt
string   ls_flag,   ls_locno, ls_locno_det
boolean  lb_update
long     ll_row, ll_seqno, ll_reqseq, ll_seq
decimal  ld_issueqty, ld_totissueqty
datetime ldt_reqdate, ldt_sysdate
string   ls_salesman, ls_schedule, ls_issueflag, ls_today, ls_sqlerrtext

dw_4.accepttext()
if dw_4.rowcount() < 1 then RETURN

dw_2.accepttext()
if dw_2.rowcount() < 1 then RETURN

// 저장소
ls_locno = dw_4.object.loc_no[1]		
ls_flag  = "A"								// 출고의뢰

dw_2.setredraw( false )
for ll_dw2row = 1 to dw_2.rowcount()
	ls_locno_det = dw_2.object.saledet_loc_no[ll_dw2row]

	// 저장소 NULL이거나 동일한 저장소인 경우만
	if isnull(ls_locno_det) OR ls_locno = ls_locno_det then		
		dw_2.object.sel[ll_dw2row]  = "Y"
		dw_2.object.saledet_loc_no[ll_dw2row]      = ls_locno
		dw_2.object.saledet_stock_issue[ll_dw2row] = dw_2.object.saledet_stock_qty[ll_dw2row]
	
		ld_orderqty = dw_2.object.saledet_order_qty[ll_dw2row]
		ld_rlseqty  = dw_2.object.saledet_rlse_qty[ll_dw2row]
		if ld_rlseqty > 0 and ls_flag <> "R" then
			ls_flag = "R"
		end if
	
		if ld_orderqty > ld_rlseqty then
			dw_2.setitem(ll_dw2row, "saledet_issue_qty", ( ld_orderqty - ld_rlseqty ))
		end if
	end if
next
dw_2.setredraw( true )

// 선정수량 UPDATE
for ll_dw2row = 1 to dw_2.rowcount()
	ls_locno_det = dw_2.object.saledet_loc_no[ll_dw2row]

	if ls_locno = ls_locno_det then		
		ld_issueqty = ld_issueqty + dw_2.object.saledet_issue_qty[ll_dw2row]
	end if

next
//dw_2.Modify("tot_issueqty.Text='"+string(ld_issueqty,"#,##0.00")+"'")

ll_cnt = dw_1.getrow()
dw_1.object.issueqty[ll_cnt] = ld_issueqty				// 선정수량
dw_1.object.issuereqdet_issue_flag[ll_cnt] = ls_flag

dw_1.accepttext() ; dw_2.accepttext()

// 저장
ls_today = string(gf_today(),"yyyy/mm/dd")	

wf_update1(dw_2, 'N')
WF_IssueQTY_SAVE( dw_1.getrow() )


/////////////////////////////////////////////////////////////////////////////////////////
////// A: 출고의뢰, P: 생산확인
/////////////////////////////////////////////////////////////////////////////////////////
//if ist_where.str4 = "A" then
//	ib_save = true
//
//	if dw_1.rowcount() > 0 then
//		ld_totissueqty  = dw_1.object.tot_issueqty[1]
//		ldt_sysdate     = gf_today()
//	end if
//
////	if ld_totissueqty = 0 then
////		MessageBox("확인","출고 선정수량이 ZERO 입니다. 확인 후 다시 저장하시기 바랍니다.")
////		RETURN
////	end if
//	
//	for ll_row = 1 to dw_1.rowcount()
//		ls_schedule  = dw_1.object.issuereqdet_issue_schedule[ll_row]
//		ls_issueflag = dw_1.object.issuereqdet_issue_flag[ll_row]
//
//		if ls_schedule = "C" then
//			MessageBox("확인", string(ll_row) + " 행 '자동작성'은 사용 할 수 없습니다.")
//			ib_save = false
//			RETURN
//		end if
//
//		if isnull(ls_schedule) OR ls_schedule = "" OR isnull(ls_issueflag) OR ls_issueflag = "" then
//			ib_save = false
//		end if
//
//		dw_1.object.issuereqdet_sys_date[ll_row] = ldt_sysdate
//	next
//	
//	dw_1.accepttext() ; dw_2.accepttext()	
//	WF_Update2( dw_1, dw_2, "N" )
//	
//	// 출고집계 LOG저장
//	WF_IssueQTY_SAVE( dw_1.getrow() )	
//else
//	dw_1.accepttext()
//	WF_Update1( dw_1, "N" )
//end if


/*2018.08.23 jowonsuk 주석처리 */
//////////////////////////////////////////////////////
//// 순서조정후 선정수량 틀어진것 수량 수정하기
//////////////////////////////////////////////////////
//string  ls_orderno,   ls_sel
//decimal ld_issue_qty, ld_stock_issue		
//long    ll_dw2cnt
//
//dw_4.accepttext()
//ls_locno = dw_4.object.loc_no[1]
//
//if ib_sort = true then
//	if dw_3.rowcount() > 0 then
//		ls_orderno = dw_3.object.saledet_order_no[1]		// 대상행
//
////		dw_2.setredraw( false )
////		dw_2.retrieve( ls_orderno, ls_locno )
////		dw_2.setredraw( true )
//	
//		// 현재행
//		for ll_row = 1 to dw_3.rowcount()
//			ls_sel         = dw_3.object.sel[ll_row]
//			ld_issue_qty   = dw_3.object.saledet_issue_qty[ll_row]
//			ld_stock_issue	= dw_3.object.saledet_stock_issue[ll_row]	
//			
//			dw_2.object.sel[ll_row]                 = ls_sel
//			dw_2.object.saledet_issue_qty[ll_row]   = ld_issue_qty
//			dw_2.object.saledet_stock_issue[ll_row] = ld_stock_issue
//		next
//		WF_Update1( dw_2, "N" )
//
//		// 출고집계 LOG저장
//		WF_IssueQTY_SORT( il_nrow, il_nseq, dw_3 )	
//		dw_3.reset()
//	end if
//
//
//	// 이동행(상,하)
//	if dw_5.rowcount() > 0 then
//		ls_orderno = dw_5.object.saledet_order_no[1]
//
////		dw_2.setredraw( false )
////		dw_2.retrieve( ls_orderno, ls_locno )
////		dw_2.setredraw( true )
//		
//		for ll_row = 1 to dw_5.rowcount()		
//			ls_sel         = dw_5.object.sel[ll_row]
//			ld_issue_qty   = dw_5.object.saledet_issue_qty[ll_row]
//			ld_stock_issue	= dw_5.object.saledet_stock_issue[ll_row]	
//			
//			dw_2.object.sel[ll_row]                 = ls_sel
//			dw_2.object.saledet_issue_qty[ll_row]   = ld_issue_qty
//			dw_2.object.saledet_stock_issue[ll_row] = ld_stock_issue
//		next
//		WF_Update1( dw_2, "N" )
//
//		// 출고집계 LOG저장
//		WF_IssueQTY_SORT( il_crow, il_cseq, dw_5 )	
//		dw_5.reset()
//	end if
//	
//	ib_sort = false
//else
//	dw_3.reset()
//	dw_5.reset()
//end if
////////////////////////////////////////////////////


end event

type st_1 from statictext within w_whissuereqdet_m
integer x = 2784
integer y = 16
integer width = 1079
integer height = 108
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "연락처 입력시 한칸씩 띄어쓰기를 하시면 여러줄로 나옵니다."
boolean focusrectangle = false
end type

event clicked;st_1.visible = false
end event

type st_4 from statictext within w_whissuereqdet_m
integer x = 393
integer y = 288
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
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_whissuereqdet_m
integer x = 571
integer y = 272
integer width = 480
integer height = 632
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

type st_5 from statictext within w_whissuereqdet_m
integer x = 1083
integer y = 288
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

type ddlb_op from dropdownlistbox within w_whissuereqdet_m
integer x = 1253
integer y = 272
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_1 from singlelineedit within w_whissuereqdet_m
integer x = 1568
integer y = 280
integer width = 567
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_whissuereqdet_m
integer x = 2139
integer y = 280
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_1, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_whissuereqdet_m
integer x = 2304
integer y = 280
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_op.text  = ""
ddlb_fld.text = ""
sle_1.text    = ""

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_whissuereqdet_m
integer x = 2469
integer y = 280
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_whissuereqdet_m
integer x = 2633
integer y = 280
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_whissuereqdet_m
integer x = 594
integer y = 284
integer width = 366
integer height = 88
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type cbx_fix from checkbox within w_whissuereqdet_m
integer x = 2816
integer y = 244
integer width = 288
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx

if this.checked = true then
	ls_colx = string(dw_1.object.issuereqdet_add_scene.x)
else
	ls_colx = "0"
end if
dw_1.object.datawindow.horizontalscrollsplit= ls_colx

end event

type st_2 from statictext within w_whissuereqdet_m
integer x = 2784
integer y = 148
integer width = 535
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
string text = "출고예정은 필수"
boolean focusrectangle = false
end type

type cb_up from commandbutton within w_whissuereqdet_m
integer x = 64
integer y = 268
integer width = 151
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;// ▲
string   ls_orderno, ls_orderno_save, ls_reqdate, ls_salesman, ls_itemno, ls_qa, ls_sqlerrtext, ls_issue_flag
long     ll_row, ll_dw6row, ll_seqno, ll_dw6cnt, ll_reqseq, ll_seq, ll_cseq, ll_nseq
datetime ldt_reqdate

dw_3.reset() ; dw_5.reset() ; dw_6.reset()
dw_1.accepttext()

ll_row = dw_1.getrow()
if isnull(ll_row) OR ll_row <= 1 then RETURN

// 현재순번
ll_cseq = dw_1.object.issuereqdet_seq[ll_row]
if ll_cseq = 1 OR ll_cseq = 0 then RETURN

il_crow = ll_row
il_cseq = ll_cseq

// 대상순번
ll_nseq = dw_1.object.issuereqdet_seq[ll_row - 1]
il_nrow = ll_row - 1 
il_nseq = ll_nseq

st_save.visible   = true
pb_insert.enabled = false
pb_save.enabled   = false

//////////////////////////////////////////////////////////////
// 현재행 dw_3에 복사 
//////////////////////////////////////////////////////////////
ls_orderno  = dw_1.object.issuereqdet_sale_no[ll_row]
//dw_3.retrieve( ls_orderno ) 2018.05.30 jowonsuk 주석처리 

// 출고상세내역(현재행)
ldt_reqdate = dw_1.object.issuereqdet_req_date[ll_row]
ls_reqdate  = string(ldt_reqdate, "yyyy/mm/dd")
ls_salesman = dw_1.object.issuereqdet_salesman[ll_row]
ll_reqseq   = dw_1.object.issuereqdet_req_seq[ll_row]
ll_seq      = dw_1.object.issuereqdet_seq[ll_row]
ls_issue_flag = dw_1.object.issuereqdet_issue_flag[ll_row]

wf_retrieve(dw_3, ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno, ls_issue_flag) /*2018.05.30 jowonsuk 추가 로직 */

dw_6.retrieve( ls_reqdate, ls_salesman, ll_reqseq, ll_seq )
for ll_dw6row = dw_6.rowcount() to 1 step - 1
	dw_6.deleterow( ll_dw6row )
next
WF_Update1(dw_6, "N")

// 현재행 순번변경하기
dw_1.object.issuereqdet_seq[ll_row]     = ll_nseq		// 현재행에 대상순번
//////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////
// 대상행 dw_5에 복사
//////////////////////////////////////////////////////////////
ls_orderno  = dw_1.object.issuereqdet_sale_no[ll_row - 1]
//dw_5.retrieve( ls_orderno ) 2018.05.30 jowonsuk 주석처리 

ldt_reqdate = dw_1.object.issuereqdet_req_date[ll_row - 1]
ls_reqdate  = string(ldt_reqdate, "yyyy/mm/dd")
ls_salesman = dw_1.object.issuereqdet_salesman[ll_row - 1]
ll_reqseq   = dw_1.object.issuereqdet_req_seq[ll_row - 1]
ll_seq      = dw_1.object.issuereqdet_seq[ll_row - 1]
ls_issue_flag = dw_1.object.issuereqdet_issue_flag[ll_row -1]

wf_retrieve(dw_5, ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno, ls_issue_flag)		/*2018.05.30 jowonsuk 추가 로직 */

dw_6.retrieve( ls_reqdate, ls_salesman, ll_reqseq, ll_seq )
for ll_dw6row = dw_6.rowcount() to 1 step - 1
	dw_6.deleterow( ll_dw6row )
next
WF_Update1(dw_6, "N")

// 출고상세내역(대상행)
dw_1.object.issuereqdet_seq[ll_row - 1] = ll_cseq		// 대상행에 현재순번
//////////////////////////////////////////////////////////////

dw_1.setredraw( false )
dw_1.sort()
dw_1.scrolltorow( ll_row - 1 )
dw_1.setredraw( true )

////////////////////////////////////////////////////
// 순위조정후 선정수량 틀어진것 수량 수정하기
////////////////////////////////////////////////////
ib_sort = true
//pb_insert.triggerevent( clicked! )
////////////////////////////////////////////////////
// 저장
boolean  lb_update
long     ll_cnt
decimal  ld_issueqty, ld_totissueqty
datetime ldt_sysdate
string   ls_schedule, ls_issueflag, ls_today

ls_today = string(gf_today(),"yyyy/mm/dd")		

/////////////////////////////////////////////////////////////////////////////////////
// A: 출고의뢰, P: 생산확인
/////////////////////////////////////////////////////////////////////////////////////
if ist_where.str4 = "A" then
	ib_save = true

	if dw_1.rowcount() > 0 then
		ld_totissueqty  = dw_1.object.tot_issueqty[1]
		ldt_sysdate     = gf_today()
	end if

//	if ld_totissueqty = 0 then
//		MessageBox("확인","출고 선정수량이 ZERO 입니다. 확인 후 다시 저장하시기 바랍니다.")
//		RETURN
//	end if
	
	for ll_row = 1 to dw_1.rowcount()
		ls_schedule  = dw_1.object.issuereqdet_issue_schedule[ll_row]
		ls_issueflag = dw_1.object.issuereqdet_issue_flag[ll_row]

		if ls_schedule = "C" then
			MessageBox("확인", string(ll_row) + " 행 '자동작성'은 사용 할 수 없습니다.")
			ib_save = false
			RETURN
		end if

		if isnull(ls_schedule) OR ls_schedule = "" OR isnull(ls_issueflag) OR ls_issueflag = "" then
			ib_save = false
		end if

		dw_1.object.issuereqdet_sys_date[ll_row] = ldt_sysdate
	next
	
	dw_1.accepttext() ; dw_2.accepttext()	
	WF_Update2( dw_1, dw_2, "N" )
	
	// 출고집계 LOG저장
	WF_IssueQTY_SAVE( dw_1.getrow() )	
else
	dw_1.accepttext()
	WF_Update1( dw_1, "N" )
end if

////////////////////////////////////////////////////
// 순서조정후 선정수량 틀어진것 수량 수정하기
////////////////////////////////////////////////////
string  ls_sel
decimal ld_issue_qty, ld_stock_issue		
string  ls_locno, ls_locno_det
long    ll_dw2cnt

dw_4.accepttext()
ls_locno = dw_4.object.loc_no[1]

if ib_sort = true then
	if dw_3.rowcount() > 0 then
		ls_orderno = dw_3.object.saledet_order_no[1]		// 대상행

//		dw_2.setredraw( false )
//		dw_2.retrieve( ls_orderno, ls_locno )
//		dw_2.setredraw( true )
	
		// 현재행
		for ll_row = 1 to dw_3.rowcount()
			ls_sel         = dw_3.object.sel[ll_row]
			ld_issue_qty   = dw_3.object.saledet_issue_qty[ll_row]
			ld_stock_issue	= dw_3.object.saledet_stock_issue[ll_row]	
			
			dw_2.object.sel[ll_row]                 = ls_sel
			dw_2.object.saledet_issue_qty[ll_row]   = ld_issue_qty
			dw_2.object.saledet_stock_issue[ll_row] = ld_stock_issue
			dw_2.setItemStatus(ll_row, 0, Primary!, DataModified!)						
		next
		WF_Update1( dw_2, "N" )

		// 출고집계 LOG저장
		WF_IssueQTY_SORT( il_nrow, il_nseq, dw_3 )	
		dw_3.reset()
	end if


	// 이동행(상,하)
	if dw_5.rowcount() > 0 then
		ls_orderno = dw_5.object.saledet_order_no[1]

//		dw_2.setredraw( false )
//		dw_2.retrieve( ls_orderno, ls_locno )
//		dw_2.setredraw( true )
		
		for ll_row = 1 to dw_5.rowcount()		
			ls_sel         = dw_5.object.sel[ll_row]
			ld_issue_qty   = dw_5.object.saledet_issue_qty[ll_row]
			ld_stock_issue	= dw_5.object.saledet_stock_issue[ll_row]	
			
			dw_2.object.sel[ll_row]                 = ls_sel
			dw_2.object.saledet_issue_qty[ll_row]   = ld_issue_qty
			dw_2.object.saledet_stock_issue[ll_row] = ld_stock_issue
			dw_2.setItemStatus(ll_row, 0, Primary!, DataModified!)						
		next
		WF_Update1( dw_2, "N" )

		// 출고집계 LOG저장
		WF_IssueQTY_SORT( il_crow, il_cseq, dw_5 )	
		dw_5.reset()
	end if
	
	ib_sort = false
else
	dw_3.reset()
	dw_5.reset()
end if
////////////////////////////////////////////////////


end event

type cb_dn from commandbutton within w_whissuereqdet_m
integer x = 219
integer y = 268
integer width = 151
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;// ▼
string   ls_orderno, ls_orderno_save, ls_reqdate, ls_salesman, ls_itemno, ls_qa, ls_sqlerrtext, ls_issue_flag
long     ll_row, ll_dw6row, ll_seqno, ll_dw6cnt, ll_reqseq, ll_seq, ll_cseq, ll_nseq
datetime ldt_reqdate

dw_3.reset() ; dw_5.reset() ; dw_6.reset()
dw_1.accepttext()

ll_row = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 OR ll_row = dw_1.rowcount() then RETURN

// 현재순번
ll_cseq = dw_1.object.issuereqdet_seq[ll_row]
if ll_cseq = 0 OR ll_cseq = dw_1.rowcount() then RETURN
if ll_row + 1 > dw_1.rowcount() then RETURN

il_crow = ll_row
il_cseq = ll_cseq

if dw_1.object.issuereqdet_req_flag[ll_row + 1] = "B" OR &
	dw_1.object.issuereqdet_req_flag[ll_row + 1] = "Z" then RETURN

// 대상순번
ll_nseq = dw_1.object.issuereqdet_seq[ll_row + 1]
il_nrow = ll_row + 1 
il_nseq = ll_nseq

st_save.visible   = true
pb_insert.enabled = false
pb_save.enabled   = false

//////////////////////////////////////////////////////////////
// 현재행 dw_3에 복사 
//////////////////////////////////////////////////////////////
ls_orderno = dw_1.object.issuereqdet_sale_no[ll_row]
///dw_3.retrieve( ls_orderno ) 2018.05.30 jowonsuk 주석처리 

// 출고상세내역(현재행)
ldt_reqdate = dw_1.object.issuereqdet_req_date[ll_row]
ls_reqdate  = string(ldt_reqdate, "yyyy/mm/dd")
ls_salesman = dw_1.object.issuereqdet_salesman[ll_row]
ll_reqseq   = dw_1.object.issuereqdet_req_seq[ll_row]
ll_seq      = dw_1.object.issuereqdet_seq[ll_row]
ls_issue_flag = dw_1.object.issuereqdet_issue_flag[ll_row]

wf_retrieve(dw_3, ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno, ls_issue_flag) /* 2018.05.30 jowonsuk 추가로직  */
dw_6.retrieve( ls_reqdate, ls_salesman, ll_reqseq, ll_seq )
for ll_dw6row = 1 to dw_6.rowcount()
	dw_6.deleterow( ll_dw6row )
next
WF_Update1(dw_6, "N")

// 현재행 순번변경하기
dw_1.object.issuereqdet_seq[ll_row]     = ll_nseq
//////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////
// 대상행 dw_5에 복사
//////////////////////////////////////////////////////////////
ls_orderno = dw_1.object.issuereqdet_sale_no[ll_row + 1]
//dw_5.retrieve( ls_orderno ) 2018.05.30 jowonsuk 주석처리 

// 출고상세내역(대상행)
ldt_reqdate = dw_1.object.issuereqdet_req_date[ll_row + 1]
ls_reqdate  = string(ldt_reqdate, "yyyy/mm/dd")
ls_salesman = dw_1.object.issuereqdet_salesman[ll_row + 1]
ll_reqseq   = dw_1.object.issuereqdet_req_seq[ll_row + 1]
ll_seq      = dw_1.object.issuereqdet_seq[ll_row + 1]
ls_issue_flag = dw_1.object.issuereqdet_issue_flag[ll_row +1]

wf_retrieve(dw_5, ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno, ls_issue_flag)		/* 2018.05.30 jowonsuk 추가로직  */

dw_6.retrieve( ls_reqdate, ls_salesman, ll_reqseq, ll_seq )
for ll_dw6row = 1 to dw_6.rowcount()
	dw_6.deleterow( ll_dw6row )
next
WF_Update1(dw_6, "N")

// 대상행 순번변경하기
dw_1.object.issuereqdet_seq[ll_row + 1] = ll_cseq
//////////////////////////////////////////////////////////////

dw_1.setredraw( false )
dw_1.sort()
dw_1.scrolltorow( ll_row + 1 )
dw_1.setredraw( true )

////////////////////////////////////////////////////
// 순위조정후 선정수량 틀어진것 수량 수정하기
////////////////////////////////////////////////////
ib_sort = true
//pb_insert.triggerevent( clicked! )
////////////////////////////////////////////////////
// 저장
boolean  lb_update
long     ll_cnt
decimal  ld_issueqty, ld_totissueqty
datetime ldt_sysdate
string   ls_schedule, ls_issueflag, ls_today

ls_today = string(gf_today(),"yyyy/mm/dd")		

/////////////////////////////////////////////////////////////////////////////////////
// A: 출고의뢰, P: 생산확인
/////////////////////////////////////////////////////////////////////////////////////
if ist_where.str4 = "A" then
	ib_save = true

	if dw_1.rowcount() > 0 then
		ld_totissueqty  = dw_1.object.tot_issueqty[1]
		ldt_sysdate     = gf_today()
	end if

//	if ld_totissueqty = 0 then
//		MessageBox("확인","출고 선정수량이 ZERO 입니다. 확인 후 다시 저장하시기 바랍니다.")
//		RETURN
//	end if
	
	for ll_row = 1 to dw_1.rowcount()
		ls_schedule  = dw_1.object.issuereqdet_issue_schedule[ll_row]
		ls_issueflag = dw_1.object.issuereqdet_issue_flag[ll_row]

		if ls_schedule = "C" then
			MessageBox("확인", string(ll_row) + " 행 '자동작성'은 사용 할 수 없습니다.")
			ib_save = false
			RETURN
		end if

		if isnull(ls_schedule) OR ls_schedule = "" OR isnull(ls_issueflag) OR ls_issueflag = "" then
			ib_save = false
		end if

		dw_1.object.issuereqdet_sys_date[ll_row] = ldt_sysdate
	next
	
	dw_1.accepttext() ; dw_2.accepttext()	
	WF_Update2( dw_1, dw_2, "N" )
	
	// 출고집계 LOG저장
	WF_IssueQTY_SAVE( dw_1.getrow() )	
else
	dw_1.accepttext()
	WF_Update1( dw_1, "N" )
end if

////////////////////////////////////////////////////
// 순서조정후 선정수량 틀어진것 수량 수정하기
////////////////////////////////////////////////////
string  ls_sel
decimal ld_issue_qty, ld_stock_issue		
string  ls_locno, ls_locno_det
long    ll_dw2cnt

dw_4.accepttext()
ls_locno = dw_4.object.loc_no[1]

if ib_sort = true then
	if dw_3.rowcount() > 0 then
		ls_orderno = dw_3.object.saledet_order_no[1]		// 대상행

//		dw_2.setredraw( false )
//		dw_2.retrieve( ls_orderno, ls_locno )
//		dw_2.setredraw( true )
	
		// 현재행
		for ll_row = 1 to dw_3.rowcount()
			ls_sel         = dw_3.object.sel[ll_row]
			ld_issue_qty   = dw_3.object.saledet_issue_qty[ll_row]
			ld_stock_issue	= dw_3.object.saledet_stock_issue[ll_row]	
			
			dw_2.object.sel[ll_row]                 = ls_sel
			dw_2.object.saledet_issue_qty[ll_row]   = ld_issue_qty
			dw_2.object.saledet_stock_issue[ll_row] = ld_stock_issue
			dw_2.setItemStatus(ll_row, 0, Primary!, DataModified!)			
		next
		WF_Update1( dw_2, "N" )

		// 출고집계 LOG저장
		WF_IssueQTY_SORT( il_nrow, il_nseq, dw_3 )	
		dw_3.reset()
	end if


	// 이동행(상,하)
	if dw_5.rowcount() > 0 then
		ls_orderno = dw_5.object.saledet_order_no[1]

//		dw_2.setredraw( false )
//		dw_2.retrieve( ls_orderno, ls_locno )
//		dw_2.setredraw( true )
		
		for ll_row = 1 to dw_5.rowcount()		
			ls_sel         = dw_5.object.sel[ll_row]
			ld_issue_qty   = dw_5.object.saledet_issue_qty[ll_row]
			ld_stock_issue	= dw_5.object.saledet_stock_issue[ll_row]	
			
			dw_2.object.sel[ll_row]                 = ls_sel
			dw_2.object.saledet_issue_qty[ll_row]   = ld_issue_qty
			dw_2.object.saledet_stock_issue[ll_row] = ld_stock_issue
			dw_2.setItemStatus(ll_row, 0, Primary!, DataModified!)						
		next
		WF_Update1( dw_2, "N" )

		// 출고집계 LOG저장
		WF_IssueQTY_SORT( il_crow, il_cseq, dw_5 )	
		dw_5.reset()
	end if
	
	ib_sort = false
else
	dw_3.reset()
	dw_5.reset()
end if
////////////////////////////////////////////////////


end event

type dw_3 from datawindow within w_whissuereqdet_m
integer x = 439
integer y = 136
integer width = 110
integer height = 80
integer taborder = 110
boolean bringtotop = true
string title = "현재행"
string dataobject = "d_whissuereqdet_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_whissuereqdet_m
integer x = 590
integer y = 136
integer width = 110
integer height = 80
integer taborder = 120
boolean bringtotop = true
string title = "이동행"
string dataobject = "d_whissuereqdet_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within w_whissuereqdet_m
integer x = 741
integer y = 136
integer width = 110
integer height = 80
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_whissuereqdetsale_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_whissuereqdet_m
integer x = 4549
integer y = 284
integer width = 471
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "도착지 복사"
end type

event clicked;// 도착지 복사
string ls_scene
long   ll_row,  ll_dw1row

ll_dw1row = dw_1.getrow()
if isnull(ll_dw1row) OR ll_dw1row < 1 then RETURN

ls_scene = dw_1.object.issuereqdet_add_scene[ll_dw1row]
if MessageBox("확인","현재행의 도착지[" + ls_scene + "]를 나머지 행으로 복사합니까?",Exclamation!, OKCancel!, 2) = 2 then RETURN

for ll_row = 1 to dw_1.rowcount()
	if ll_dw1row = ll_row then
	else
		dw_1.object.issuereqdet_add_scene[ll_row] = ls_scene
	end if
next
end event

type dw_7 from datawindow within w_whissuereqdet_m
integer x = 891
integer y = 136
integer width = 110
integer height = 80
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_whissuereqdetsale_delete"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_save from statictext within w_whissuereqdet_m
integer x = 64
integer y = 200
integer width = 311
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "자동저장"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_whissuereqdet_m
integer x = 2816
integer y = 316
integer width = 379
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "강제변경"
end type

event clicked;// 강제변경
string  ls_locno, ls_locno_det, ls_locno_org, ls_chk
long    ll_dw2cnt
decimal ld_totissueqty

ls_locno  = dw_4.object.loc_no[1]

// 강제변경
if this.checked = true then
	ls_chk = "N"
else
	ls_chk = "Y"
end if

//
for ll_dw2cnt = 1 to dw_2.rowcount()
	ls_locno_det = dw_2.object.saledet_loc_no[ll_dw2cnt]
	ls_locno_org = dw_2.object.saledet_locno_org[ll_dw2cnt]
	
	if (ls_locno = ls_locno_det) OR isnull(ls_locno_det) then
		//
	else
		dw_2.object.issueqty_chk[ll_dw2cnt] = ls_chk

		// 첫행 데이터 수정가능상태 강제방지
		dw_2.setcolumn( "saledet_rem" )
		dw_2.setfocus()
		
		dw_2.AcceptText()
	end if
next

//// 저장소별 수량체크
//ld_totissueqty = 0
//for ll_dw2cnt = 1 to dw_2.rowcount()
//	ls_locno_det = dw_2.object.saledet_loc_no[ll_dw2cnt]
//	
//	if ls_locno = ls_locno_det then
//		ld_totissueqty = ld_totissueqty + dw_2.object.saledet_issue_qty[ll_dw2cnt]
//	end if
//next
//dw_2.Modify("tot_issueqty.Text='"+string(ld_totissueqty,"#,##0.00")+"'")

// 첫행 데이터 수정가능상태 강제방지
dw_2.setcolumn( "saledet_rem" )
dw_2.setfocus()


end event

type cbx_3 from checkbox within w_whissuereqdet_m
integer x = 3205
integer y = 316
integer width = 242
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "원복"
end type

type st_horizontal from u_splitbar_horizontal within w_whissuereqdet_m
integer x = 37
integer y = 1324
integer width = 5019
boolean bringtotop = true
end type

type cbx_4 from checkbox within w_whissuereqdet_m
integer x = 3845
integer y = 256
integer width = 517
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "형태복사"
end type

event clicked;// 형태복사
string ls_issueflag
long   ll_row

ll_row  = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_issueflag  = dw_1.object.issuereqdet_issue_flag[ll_row]

for ll_row = dw_1.getrow() + 1 to dw_1.rowcount()
	dw_1.scrolltorow( ll_row )

	if dw_1.event itemchanged(ll_row, dw_1.object.issuereqdet_issue_flag, ls_issueflag) = 1 then
		dw_1.event itemerror( ll_row, dw_1.object.issuereqdet_issue_flag, ls_issueflag )
	end if
next
//
this.checked = false

end event

type cbx_5 from checkbox within w_whissuereqdet_m
integer x = 3845
integer y = 316
integer width = 517
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "출고예정복사"
end type

event clicked;// 출고예정복사
string ls_schedule
long   ll_row

ll_row  = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_schedule  = dw_1.object.issuereqdet_issue_schedule[ll_row]

for ll_row = dw_1.getrow() to dw_1.rowcount()
	dw_1.object.issuereqdet_issue_schedule[ll_row]  = ls_schedule
next

this.checked = false

end event

type ov_1 from oval within w_whissuereqdet_m
integer linethickness = 4
long fillcolor = 16777215
integer x = 2258
integer y = 648
integer width = 329
integer height = 176
end type

