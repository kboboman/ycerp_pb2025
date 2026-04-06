$PBExportHeader$w_iitemstock_r.srw
$PBExportComments$시화공장 재고(재고관리/조원석)
forward
global type w_iitemstock_r from w_inheritance
end type
type dw_3 from datawindow within w_iitemstock_r
end type
type em_1 from editmask within w_iitemstock_r
end type
type ddlb_dwtitles from dropdownlistbox within w_iitemstock_r
end type
type st_4 from statictext within w_iitemstock_r
end type
type ddlb_op from dropdownlistbox within w_iitemstock_r
end type
type sle_value from singlelineedit within w_iitemstock_r
end type
type cb_1 from commandbutton within w_iitemstock_r
end type
type cb_2 from commandbutton within w_iitemstock_r
end type
type cb_3 from commandbutton within w_iitemstock_r
end type
type cb_5 from commandbutton within w_iitemstock_r
end type
type ddlb_fld from dropdownlistbox within w_iitemstock_r
end type
type st_7 from statictext within w_iitemstock_r
end type
type dw_area from datawindow within w_iitemstock_r
end type
type cbx_o08 from checkbox within w_iitemstock_r
end type
type cbx_o09 from checkbox within w_iitemstock_r
end type
type gb_4 from groupbox within w_iitemstock_r
end type
type gb_6 from groupbox within w_iitemstock_r
end type
type pb_1 from picturebutton within w_iitemstock_r
end type
type st_6 from statictext within w_iitemstock_r
end type
type pb_ewol from picturebutton within w_iitemstock_r
end type
type dw_4 from datawindow within w_iitemstock_r
end type
type dw_5 from datawindow within w_iitemstock_r
end type
type st_3 from statictext within w_iitemstock_r
end type
type cbx_op from checkbox within w_iitemstock_r
end type
type dw_6 from datawindow within w_iitemstock_r
end type
type cbx_user from checkbox within w_iitemstock_r
end type
type cbx_all from checkbox within w_iitemstock_r
end type
type hpb_1 from hprogressbar within w_iitemstock_r
end type
type st_1 from statictext within w_iitemstock_r
end type
type ddlb_gubun from dropdownlistbox within w_iitemstock_r
end type
type cbx_cqty from checkbox within w_iitemstock_r
end type
type cbx_qoh from checkbox within w_iitemstock_r
end type
type pb_2 from picturebutton within w_iitemstock_r
end type
type cb_4 from commandbutton within w_iitemstock_r
end type
type st_2 from statictext within w_iitemstock_r
end type
type ddlb_grade from dropdownlistbox within w_iitemstock_r
end type
type st_5 from statictext within w_iitemstock_r
end type
type ddlb_not_out from dropdownlistbox within w_iitemstock_r
end type
type st_8 from statictext within w_iitemstock_r
end type
type cb_6 from commandbutton within w_iitemstock_r
end type
type ddlb_area_name from dropdownlistbox within w_iitemstock_r
end type
type st_9 from statictext within w_iitemstock_r
end type
type rb_1 from radiobutton within w_iitemstock_r
end type
type rb_2 from radiobutton within w_iitemstock_r
end type
type rb_3 from radiobutton within w_iitemstock_r
end type
type rb_4 from radiobutton within w_iitemstock_r
end type
type rb_5 from radiobutton within w_iitemstock_r
end type
type rb_0 from radiobutton within w_iitemstock_r
end type
type rb_6 from radiobutton within w_iitemstock_r
end type
type cbx_1 from checkbox within w_iitemstock_r
end type
type cb_7 from commandbutton within w_iitemstock_r
end type
end forward

global type w_iitemstock_r from w_inheritance
integer width = 6729
integer height = 2732
string title = "일수불현황관리(w_iitemstock_r)"
string icon = "Window!"
dw_3 dw_3
em_1 em_1
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_fld ddlb_fld
st_7 st_7
dw_area dw_area
cbx_o08 cbx_o08
cbx_o09 cbx_o09
gb_4 gb_4
gb_6 gb_6
pb_1 pb_1
st_6 st_6
pb_ewol pb_ewol
dw_4 dw_4
dw_5 dw_5
st_3 st_3
cbx_op cbx_op
dw_6 dw_6
cbx_user cbx_user
cbx_all cbx_all
hpb_1 hpb_1
st_1 st_1
ddlb_gubun ddlb_gubun
cbx_cqty cbx_cqty
cbx_qoh cbx_qoh
pb_2 pb_2
cb_4 cb_4
st_2 st_2
ddlb_grade ddlb_grade
st_5 st_5
ddlb_not_out ddlb_not_out
st_8 st_8
cb_6 cb_6
ddlb_area_name ddlb_area_name
st_9 st_9
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
rb_0 rb_0
rb_6 rb_6
cbx_1 cbx_1
cb_7 cb_7
end type
global w_iitemstock_r w_iitemstock_r

type variables
//
DataWindow idw_view
DataWindowChild idwc_area, idwc_locno, idwc_wcno, idwc_qa, idwc_stock

string is_itemno, is_qa, is_dw
string is_ritype, is_rtype, is_itype	// 입,출고 형태


end variables

forward prototypes
public function integer wf_inaudit_create ()
public function integer wf_inaudit_test ()
public function integer wf_itemlocupdate ()
public subroutine wf_silsa_upload ()
public subroutine wf_pre_itemstock_upload ()
public subroutine wf_item_stock_generate (string ls_loc_no, string ls_item_no, string ls_qa)
public subroutine wf_item_stock_day (string ls_sdate)
public subroutine wf_silsa_check (string ls_loc_no, string ls_item_no, string ls_qa)
end prototypes

public function integer wf_inaudit_create ();// 전일재고 집계작업
string  ls_ITEM_NO, ls_QA, ls_loc_no, ls_st_date, LS_GUBUN, LS_TYPE, ls_sqlerrtext
DECIMAL L_STOCK_QTY, L_RX_qty, L_LX_qty
LONG L_ROW, l_count, i_count
datetime l_pre_date
long        l_id

i_count = 0

ls_st_date = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)

//DECLARE item_inaudit_cursor CURSOR FOR  
//SELECT id, RCPT_QTY
//FROM   inaudit   
//where inaudit_type = 'IW'
//AND INAUDIT_DATE BETWEEN '2018-05-23' AND  '2018-05-24'
//AND REM = '자재사용[도장]'
//AND RCPT_QTY <> 0;

//DECLARE item_stock_cursor CURSOR FOR  
//select  convert(char(8), dateadd(dd, -1, dateadd( dd,   1, dateadd(dd,-datepart(dd,getdate()),getdate()) )) ,112) pre_date, inaudit_item, qa, INAUDIT_TYPE, -1*rcpt_qty, 0 issue_qty
//from inaudit 
//where INAUDIT_TYPE IN ( 'RX')
//AND INAUDIT_DATE = '2018-04-30 00:00:00'
//AND INAUDIT_ITEM LIKE 'M%'
//AND LOC_NO = 'WS00000000'
//UNION ALL
//select  convert(char(8), dateadd(dd, -1, dateadd( dd,   1, dateadd(dd,-datepart(dd,getdate()),getdate()) )) ,112) pre_date, inaudit_item, qa, INAUDIT_TYPE, 0 rcpt_qty, -1*issue_qty
//from inaudit 
//where INAUDIT_TYPE IN ( 'IX')
//AND INAUDIT_DATE = '2018-04-30 00:00:00'
//AND INAUDIT_ITEM LIKE 'M%'
//AND LOC_NO = 'WS00000000';
////

DECLARE item_stock_cursor CURSOR FOR 
select  inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no, rcpt_qty, sum(issue_qty) issue_qty, sum(cost) cost, destination, serial_id, '복구' rem, unit_qty, sum(cnt) cnt, sum(com_qty) com_qty
from inaudit_20180611
group by inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no, rcpt_qty, destination, serial_id, rem, unit_qty;



//DECLARE saledet CURSOR FOR  
//select  a.order_no, a.seq_no, a.item_no, a.qa, b.order_qty
//from 
//(
//  select order_no, seq_no, item_no, qa, sum(issue_qty) issue_qty
//  from issuereqdet_sale
//  where req_date >= '2018-06-01'
//  group by order_no, seq_no, item_no, qa
//) a inner join saledet b on a.order_no = b.order_no and a.seq_no = b.seq_no and a.item_no = b.item_no and  a.qa = b.qa
//	  left outer join ( select item_no, qa, sale_no, sum(ship_qty) ship_qty from dodet  group by item_no, qa, sale_no )  c on a.item_no = c.item_no and a.qa = c.qa and a.order_no = c.sale_no
//where b.issue_qty <> 0
//and ship_qty is null
//and b.issue_qty > b.order_qty
//and abs( b.issue_qty - b.order_qty ) >= 1;

// SELECT  convert(char(8), dateadd(dd, -1, dateadd( dd,   1, dateadd(dd,-datepart(dd,getdate()),getdate()) )) ,112) pre_date,
//                A.ITEM_NO,
//                A.QA,
//                (CASE WHEN A.RX_QTY > 0 THEN 'RX' ELSE 'IX' END) IOTYPE,
//                A.RX_QTY,
//                A.IX_QTY
// FROM 
//(        
//        select  a.item_no, 
//                    a.qa, 
//        //            sum(a.pre_qty) pre_qty,
//        //            sum(a.stock_qty) - sum(a.in_qty) + sum(a.out_qty) erp_pre_qty,            
//                    ABS(CASE WHEN 0 > sum(a.pre_qty) - (sum(a.stock_qty) - sum(a.in_qty) + sum(a.out_qty)) THEN 0
//                    ELSE sum(a.pre_qty) - (sum(a.stock_qty) - sum(a.in_qty) + sum(a.out_qty)) END ) RX_qty,
//                    ABS(CASE WHEN 0 < sum(a.pre_qty) - (sum(a.stock_qty) - sum(a.in_qty) + sum(a.out_qty)) THEN 0
//                    ELSE sum(a.pre_qty) - (sum(a.stock_qty) - sum(a.in_qty) + sum(a.out_qty)) END ) IX_qty
//        //            sum(a.in_qty) in_qty,
//        //            sum(a.out_qty) out_qty,
//        //            sum(a.stock_qty) stock_qty
//        from 
//        (
//              select item_no, 
//                        qa, 
//                        stock_qty pre_qty,
//                        0 in_qty,
//                        0 out_qty,
//                        0 stock_qty
//              from item_stock
//              where loc_no = 'WS00000000'
//               AND STOCK_DATE =  convert(char(8), dateadd(dd, -1, dateadd( dd,   1, dateadd(dd,-datepart(dd,getdate()),getdate()) )) ,112)  /*실사재고조사월_마지막날*/
//              union all
//              select item_no, 
//                        qa, 
//                        0 pre_qty,
//                        sum(rcpt_qty)  in_qty,
//                        sum(issue_qty)  out_qty,
//                        0 stock_qty
//              from ineoday
//              where loc_no = 'WS00000000'
//              AND CDATE BETWEEN convert(char(8), dateadd( dd,   1, dateadd(dd,-datepart(dd,getdate()),getdate()) ) ,112) AND convert(char(8), getdate() ,112)
//              group  by item_no, 
//                               qa
//              union all                 
//              select item_no, 
//                        qa,
//                        0 pre_qty,
//                        0 in_qty,
//                        0 out_qty,
//                        qoh stock_qty
//              from itemloc
//              where loc_no = 'WS00000000'
//              and isnull(qoh,0) <> 0
//        )  a 
//        group by a.item_no,
//                            a.qa
//        HAVING sum(a.pre_qty) - (sum(a.stock_qty) - sum(a.in_qty) + sum(a.out_qty)) <> 0
//) A 
//ORDER BY A.ITEM_NO, A.QA;
	
	
DEBUGBREAK()

// 전일
//ls_loc_no = dw_3.object.loc_no[1]

/*
if MessageBox("확인", "실사 작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then

	OPEN item_stock_cursor;

		FETCH item_stock_cursor INTO :l_pre_date, :ls_ITEM_NO, :ls_QA, :LS_TYPE, :L_RX_qty, :L_LX_qty;
		
		Do While sqlca.sqlcode = 0
	
		
			 INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, order_no, loc_no, inaudit_type, rcpt_qty, issue_qty, cost, destination, rem, user_id )  
					 VALUES ( getdate(), :l_pre_date, :ls_ITEM_NO, :ls_QA, 'SX20180430',  :ls_loc_no, :LS_TYPE, :L_RX_qty, :L_LX_qty, 0, :ls_loc_no,  '실사복구',  :gs_userid  );
					 
					 
			if sqlca.sqlcode < 0 then
				ls_sqlerrtext = string(sqlca.sqlerrtext)
				ROLLBACK;				
				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
				RETURN 0
			end if					 
		
				
			FETCH item_stock_cursor INTO :l_pre_date, :ls_ITEM_NO, :ls_QA, :LS_TYPE, :L_RX_qty, :L_LX_qty;
		
			i_count = i_count + 1;
			
		Loop
		
	
	CLOSE item_stock_cursor;
			  
	commit;

	MessageBox("확인",string(i_count) + "건 실사작업 집계작업 완료!!!" )
		
end if
*/
string  ls_destination, ls_serial_id,   ls_rem, ls_order_no 
decimal l_unit_qty,  l_cnt,  l_com_qty, l_cost
 
if MessageBox("확인", "실사 작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then

	OPEN item_stock_cursor;

		FETCH item_stock_cursor INTO :l_pre_date, :ls_ITEM_NO, :ls_QA, :ls_loc_no, :LS_TYPE, :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem, :l_unit_qty, :l_cnt, :l_com_qty;

		Do While sqlca.sqlcode = 0
	
		
			 INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item,     qa,     loc_no,			 inaudit_type, order_no,       rcpt_qty,     issue_qty,  cost,    destination,       serial_id,         rem,       unit_qty,     cnt,      com_qty,     user_id )
		 			           VALUES ( getdate(),     :l_pre_date,    :ls_ITEM_NO, :ls_QA, :ls_loc_no,     :ls_type,       :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id,   :ls_rem, :l_unit_qty,  :l_cnt,  :l_com_qty, :gs_userid  );
					 
					 
			if sqlca.sqlcode < 0 then
				ls_sqlerrtext = string(sqlca.sqlerrtext)
				ROLLBACK;				
				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
				RETURN 0
			end if					 
		
				
			FETCH item_stock_cursor INTO :l_pre_date, :ls_ITEM_NO, :ls_QA, :ls_loc_no, :LS_TYPE, :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem, :l_unit_qty, :l_cnt, :l_com_qty;
		
			i_count = i_count + 1;
			
		Loop
		
	
	CLOSE item_stock_cursor;
			  
	commit;

	MessageBox("확인",string(i_count) + "건 실사작업 집계작업 완료!!!" )
		
end if

//string ls_order_no
//long l_seq_no
//decimal l_order_qty
//	
//if MessageBox("확인", "실사 작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
//
//	OPEN saledet;
//
//		FETCH saledet INTO :ls_order_no, :l_seq_no, :ls_item_no, :ls_qa, :l_order_qty;
//		
//		Do While sqlca.sqlcode = 0
//	
//		
//			 	update saledet
//				 	set issue_qty = :l_order_qty
//				where order_no = :ls_order_no
//				    and seq_no = :l_seq_no
//				    and item_no = :ls_item_no
//				    and qa = :ls_qa;
//					 
//					 
//			if sqlca.sqlcode < 0 then
//				ls_sqlerrtext = string(sqlca.sqlerrtext)
//				ROLLBACK;				
//				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
//				RETURN 0
//			end if					 
//		
//				
//			FETCH saledet INTO :ls_order_no, :l_seq_no, :ls_item_no, :ls_qa, :l_order_qty;
//		
//			i_count = i_count + 1;
//			
//		Loop
//		
//	
//	CLOSE saledet;
//			  
//	commit;
//
//	MessageBox("확인",string(i_count) + "건 실사작업 집계작업 완료!!!" )
//		
//end if	 








end function

public function integer wf_inaudit_test ();// 전일재고 집계작업
string  ls_ITEM_NO, ls_QA, ls_loc_no, ls_st_date, LS_GUBUN, LS_TYPE, ls_sqlerrtext
DECIMAL L_STOCK_QTY, L_RX_qty, L_LX_qty
LONG L_ROW, l_count, i_count
datetime l_pre_date
long        l_id
string  ls_destination, ls_serial_id,   ls_rem, ls_order_no 
decimal l_unit_qty,  l_cnt,  l_com_qty, l_cost

DECLARE real_INTEMP_cursor CURSOR FOR 
SELECT DISTINCT rtrim(intemp_no) intemp_no, seq
FROM INTEMP
where convert(char(8), intemp_date, 112)  between   convert(char(6), dateadd(month, -2,  getdate()), 112)+'01' and  convert(char(8), dateadd(day, -1,  getdate()), 112);


 /*가입고 백업테이블 백업*/
 insert into intemp_backup
 SELECT intemp_no, seq, intemp_date, loc_no, item_no, qa, qty, flag, user_id, user_date, area_no, rem, order_no, seq_no, type, getdate()
 FROM INTEMP
where convert(char(8), intemp_date, 112)  between   convert(char(6), dateadd(month, -2,  getdate()), 112)+'01' and  convert(char(8), dateadd(day, -1,  getdate()), 112);

 OPEN real_INTEMP_cursor;

 FETCH real_INTEMP_cursor INTO :ls_ITEM_NO, :ls_qa;


		Do While sqlca.sqlcode = 0	
			
			 delete intemp
			 where  intemp_no = :ls_ITEM_NO
					  and seq      = :ls_qa;
					  
			if sqlca.sqlcode < 0 then
				ls_sqlerrtext = string(sqlca.sqlerrtext)
				ROLLBACK;				
				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' +' item_no: ' + ls_ITEM_NO + ' qa: ' + ls_qa, exclamation!)
				RETURN 0
			end if									  
		
			FETCH real_INTEMP_cursor INTO :ls_ITEM_NO, :ls_qa;
			
			if sqlca.sqlcode < 0 then
				ls_sqlerrtext = string(sqlca.sqlerrtext)
				ROLLBACK;				
				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' +' item_no: ' + ls_ITEM_NO + ' qa: ' + ls_qa, exclamation!)
				RETURN 0
			end if				
			 
		Loop


 CLOSE real_INTEMP_cursor;
 
 commit;
 

RETURN 1

//i_count = 0
//
//ls_st_date = mid(em_1.text, 1,4) + mid(em_1.text, 6,2) + mid(em_1.text, 9,2)
//
//
//DECLARE real_itemloc_cursor CURSOR FOR 
//select    convert(datetime, :ls_st_date) inaudit_date,
//              a.item_no,
//              a.qa,
//              a.loc_no,
///*           a.itemloc_qty,				*/
///*           a.stock_qty ,				*/
//              ( case when a.itemloc_qty - a.stock_qty > 0 then  'RX' else  'IX'  end ) inaudit_type,
//		    ( case when a.itemloc_qty - a.stock_qty > 0 then  'RX' else  'IX'  end )+:ls_st_date order_no,
//              ( case when a.itemloc_qty - a.stock_qty > 0 then  abs(a.itemloc_qty - a.stock_qty) else  0 end ) rcpt_qty,
//              ( case when a.itemloc_qty - a.stock_qty < 0 then  abs(a.itemloc_qty - a.stock_qty) else 0 end ) issue_qty,
//		    0 cost,
//		    a.loc_no destination,
//		    null serial_id,
//		    '실사작업' rem,
//		     null unit_qty,
//		     null cnt,
//		     null com_qty		     
//from 
//(
//      select      a.item_no,
//                      a.qa,
//                      a.loc_no,
//                      sum(a.rcpt_qty) rcpt_qty,
//                      sum(a.issue_qty) issue_qty,
//                      sum(a.stock_qty) stock_qty,
//                      sum(a.itemstock_qty) itemloc_qty            
//      from 
//      (
//            SELECT INAUDIT.INAUDIT_ITEM ITEM_NO, 
//                                 INAUDIT.QA, 
//                                INAUDIT.LOC_NO, 
//                                SUM(ISNULL(inaudit.RCPT_QTY,0)) RCPT_QTY, 
//                                SUM(ISNULL(inaudit.ISSUE_QTY,0)) ISSUE_QTY, 
//                                SUM(ISNULL(inaudit.RCPT_QTY,0) - ISNULL(inaudit.ISSUE_QTY,0)) stock_qty,
//                                 0 itemstock_qty
//                  FROM INAUDIT WITH(NOLOCK)           
//                  where inaudit_date  <= convert(datetime, :ls_st_date)
////                       and loc_no <> 'WS00000000'
//			  GROUP BY  INAUDIT.INAUDIT_ITEM, 
//						 	   INAUDIT.QA, 
//							   INAUDIT.LOC_NO
//                    union 
//                    select item_no, 
//					 qa, 
//					 loc_no, 
//					 0 rcpt_qty,
//					 0 issue_qty,
//					 0 stock_qty,
//					 stock_qty  itemstock_qty
//             from pre_itemstock   WITH(NOLOCK) 
//             where yymm = substring(:ls_st_date,1,6)
////                      and loc_no <> 'WS00000000'
//      ) a 
//      group by a.item_no,
//                  a.qa,
//                  a.loc_no
//      having   sum(a.stock_qty) <>  sum(a.itemstock_qty)
//) a;
//
//
//
// 
//if MessageBox("확인", "실사 작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
//
//	OPEN real_itemloc_cursor;
//
//		FETCH real_itemloc_cursor INTO :l_pre_date, :ls_ITEM_NO, :ls_QA, :ls_loc_no, :LS_TYPE, :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem, :l_unit_qty, :l_cnt, :l_com_qty;
//
//		Do While sqlca.sqlcode = 0	
//		
//			 INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item,     qa,     loc_no,			 inaudit_type, order_no,       rcpt_qty,     issue_qty,  cost,    destination,       serial_id,         rem,       unit_qty,     cnt,      com_qty,     user_id )
//		 			           VALUES ( getdate(),     :l_pre_date,    :ls_ITEM_NO, :ls_QA, :ls_loc_no,     :ls_type,       :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id,   :ls_rem, :l_unit_qty,  :l_cnt,  :l_com_qty, :gs_userid  );
//					 
//					 
//			if sqlca.sqlcode < 0 then
//				ls_sqlerrtext = string(sqlca.sqlerrtext)
//				ROLLBACK;				
//				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
//				RETURN 0
//			end if					 
//		
//				
//			FETCH real_itemloc_cursor INTO :l_pre_date, :ls_ITEM_NO, :ls_QA, :ls_loc_no, :LS_TYPE, :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem, :l_unit_qty, :l_cnt, :l_com_qty;
//		
//			i_count = i_count + 1;
//			
//		Loop
//		
//	
//	CLOSE real_itemloc_cursor;
//			  
//	commit;
//
//	MessageBox("확인",string(i_count) + "건 실사작업 집계작업 완료!!!" )
//		
//end if







end function

public function integer wf_itemlocupdate ();// 전일재고 집계작업
string  ls_ITEM_NO, ls_QA, ls_loc_no, ls_st_date, LS_GUBUN, LS_TYPE, ls_sqlerrtext
DECIMAL L_STOCK_QTY, L_RX_qty, L_LX_qty
LONG L_ROW, l_count, i_count
datetime l_pre_date
long        l_id
string  ls_destination, ls_serial_id,   ls_rem, ls_order_no 
decimal l_unit_qty,  l_cnt,  l_com_qty, l_cost

i_count = 0

ls_st_date = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)


DECLARE real_itemloc_cursor CURSOR FOR 
select    convert(datetime, :ls_st_date) inaudit_date,
              a.item_no,
              a.qa,
              a.loc_no,
/*           a.itemloc_qty,				*/
/*           a.stock_qty ,				*/
              ( case when a.itemloc_qty - a.stock_qty > 0 then  'RX' else  'IX'  end ) inaudit_type,
		    ( case when a.itemloc_qty - a.stock_qty > 0 then  'RX' else  'IX'  end )+:ls_st_date order_no,
              ( case when a.itemloc_qty - a.stock_qty > 0 then  abs(a.itemloc_qty - a.stock_qty) else  0 end ) rcpt_qty,
              ( case when a.itemloc_qty - a.stock_qty < 0 then  abs(a.itemloc_qty - a.stock_qty) else 0 end ) issue_qty,
		    0 cost,
		    a.loc_no destination,
		    null serial_id,
		    '실사작업' rem,
		     null unit_qty,
		     null cnt,
		     null com_qty		     
from 
(
      select      a.item_no,
                      a.qa,
                      a.loc_no,
                      sum(a.rcpt_qty) rcpt_qty,
                      sum(a.issue_qty) issue_qty,
                      sum(a.stock_qty) stock_qty,
                      sum(a.itemstock_qty) itemloc_qty            
      from 
      (
                  SELECT INAUDIT.INAUDIT_ITEM ITEM_NO, 
                                 INAUDIT.QA, 
                                INAUDIT.LOC_NO, 
                                ISNULL(inaudit.RCPT_QTY,0) RCPT_QTY, 
                                ISNULL(inaudit.ISSUE_QTY,0) ISSUE_QTY, 
                                ISNULL(inaudit.RCPT_QTY,0) - ISNULL(inaudit.ISSUE_QTY,0) stock_qty,
                                 0 itemstock_qty
                  FROM INAUDIT WITH(NOLOCK)           
                  where inaudit_date  <= convert(datetime, :ls_st_date)
                    union 
                    select item_no, 
                                              qa, 
                                              loc_no, 
                                              0 rcpt_qty,
                                              0 issue_qty,
                                              0 stock_qty,
                                              stock_qty  itemstock_qty
             from pre_itemstock   WITH(NOLOCK) 
             where yymm = substring(:ls_st_date,1,6)
      ) a 
      group by a.item_no,
                  a.qa,
                  a.loc_no
      having   sum(a.stock_qty) <>  sum(a.itemstock_qty)
) a;



 
if MessageBox("확인", "실사 작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then

	OPEN real_itemloc_cursor;

		FETCH real_itemloc_cursor INTO :l_pre_date, :ls_ITEM_NO, :ls_QA, :ls_loc_no, :LS_TYPE, :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem, :l_unit_qty, :l_cnt, :l_com_qty;

		Do While sqlca.sqlcode = 0	
		
			 INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item,     qa,     loc_no,			 inaudit_type, order_no,       rcpt_qty,     issue_qty,  cost,    destination,       serial_id,         rem,       unit_qty,     cnt,      com_qty,     user_id )
		 			           VALUES ( getdate(),     :l_pre_date,    :ls_ITEM_NO, :ls_QA, :ls_loc_no,     :ls_type,       :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id,   :ls_rem, :l_unit_qty,  :l_cnt,  :l_com_qty, :gs_userid  );
					 
					 
			if sqlca.sqlcode < 0 then
				ls_sqlerrtext = string(sqlca.sqlerrtext)
				ROLLBACK;				
				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
				RETURN 0
			end if					 
		
				
			FETCH real_itemloc_cursor INTO :l_pre_date, :ls_ITEM_NO, :ls_QA, :ls_loc_no, :LS_TYPE, :ls_order_no,  :L_RX_qty, :L_LX_qty, :l_cost, :ls_destination, :ls_serial_id, :ls_rem, :l_unit_qty, :l_cnt, :l_com_qty;
		
			i_count = i_count + 1;
			
		Loop
		
	
	CLOSE real_itemloc_cursor;
			  
	commit;

	MessageBox("확인",string(i_count) + "건 실사작업 집계작업 완료!!!" )
		
end if







end function

public subroutine wf_silsa_upload ();// 전일재고 집계작업
string  ls_ITEM_NO, ls_QA, ls_loc_no, ls_st_date, LS_GUBUN, ls_area_name
DECIMAL L_STOCK_QTY
LONG L_ROW, l_count, i_count

//ls_loc_no = trim(dw_3.object.loc_no[1])
ls_st_date = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)

if TRIM(ddlb_gubun.TEXT) = '전체' then
	ls_gubun = '%'
elseif TRIM(ddlb_gubun.TEXT) = '제품' then
	ls_gubun = 'P'
elseif TRIM(ddlb_gubun.TEXT) = '상품' then
	ls_gubun = 'G'	
elseif TRIM(ddlb_gubun.TEXT) = '자재' then
	ls_gubun = 'M'	
elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
	ls_gubun = 'E'		
end if

DECLARE silsa_cursor CURSOR FOR  
select  a.loc_no, a.item_no, a.qa, sum(isnull(a.silsa_qty,0)) stock_qty
from silsa_itemstock a with(nolock) left outer  join  groupitem b with(nolock) on a.item_no = b.item_no
                                       left outer join item c with(nolock) on a.item_no = c.item_no and a.qa =c.qa 
							  inner join financial_location d with(nolock) on a.loc_no = d.loc_no
WHERE  SUBSTRING(a.ITEM_NO,1,1) LIKE :LS_GUBUN
AND a.yyyymm = substring(:ls_st_date,1,6)			
AND ISNULL(A.CLOSE_YN,'O') <> 'O'																		/*재고조정이 되었거나, 마감인거 미진행은 제외*/
AND c.item_no  is not null
AND d.area_name like :ls_area_name
/*AND A.ITEM_NO = 'PACSMBDB00'
AND A.QA = '000X0045X0019X04000'
*/
group by a.LOC_NO, a.item_no, a.qa;
	
	
DEBUGBREAK()

dw_3.accepttext()

// 전일
//ls_loc_no = dw_3.object.loc_no[1]

ls_area_name = trim(ddlb_area_name.text)

if ls_area_name  = '전체' then
	ls_area_name = '%'
else
	ls_area_name = ls_area_name
end if


if TRIM(ddlb_gubun.TEXT) = '전체' then
	ls_gubun = '%'
elseif TRIM(ddlb_gubun.TEXT) = '제품' then
	ls_gubun = 'P'
elseif TRIM(ddlb_gubun.TEXT) = '상품' then
	ls_gubun = 'G'	
elseif TRIM(ddlb_gubun.TEXT) = '자재' then
	ls_gubun = 'M'	
elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
	ls_gubun = 'E'		
end if


if MessageBox("확인", "기초재고 작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then

	OPEN silsa_cursor;

	FETCH silsa_cursor INTO :ls_loc_no, :ls_ITEM_NO, :ls_QA, :L_STOCK_QTY;
	
	Do While sqlca.sqlcode = 0
	
			l_count = 0
			
			select  count(*)
				 into :l_count
				from item_stock
			where loc_no = :ls_loc_no
				and item_no = :ls_item_no
				  and qa  = :ls_qa
				and stock_date = :ls_st_date;
				  
			
			if l_count > 0 then
				
				update item_stock
					 set before_qty = 0,
					 	  in_qty        = 0,
						  out_qty     = 0,
						  intemp_qty = 0,
						  ret_qty        = 0,
						  etc_qty       = 0,
					 	  stock_qty = :L_STOCK_QTY,				
						  sysdate  = getdate()
				where loc_no    = :ls_loc_no
					and item_no = :ls_item_no
					and qa  		= :ls_qa
					and stock_date = :ls_st_date;		
				
			else
			
				 insert into item_stock (loc_no,        item_no,        qa,       stock_date, before_qty, in_qty, out_qty, intemp_qty, ret_qty, etc_qty,                 stock_qty,              stock_m_qty, gab_qty,  sysdate )	
					 VALUES (             :ls_loc_no,  :ls_item_no,   :ls_qa,       :ls_st_date,                 0,        0,           0,                 0,          0,          0,               :L_STOCK_QTY,                     0,           0,   getdate() );
		
			end if
			
				
			FETCH silsa_cursor INTO :ls_loc_no, :ls_ITEM_NO, :ls_QA, :L_STOCK_QTY;
		
			i_count = i_count + 1;
		
	Loop
	CLOSE silsa_cursor;
			  
	commit;

	MessageBox("확인",string(i_count) + "건 기초 재고 집계작업 완료!!!" )
		
end if
	
	 








end subroutine

public subroutine wf_pre_itemstock_upload ();// 전일재고 집계작업
string  ls_ITEM_NO, ls_QA, ls_loc_no, ls_st_date, LS_GUBUN
DECIMAL L_STOCK_QTY
LONG L_ROW, l_count, i_count


ls_st_date = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)


if TRIM(ddlb_gubun.TEXT) = '전체' then
	ls_gubun = '%'
elseif TRIM(ddlb_gubun.TEXT) = '제품' then
	ls_gubun = 'P'
elseif TRIM(ddlb_gubun.TEXT) = '상품' then
	ls_gubun = 'G'	
elseif TRIM(ddlb_gubun.TEXT) = '자재' then
	ls_gubun = 'M'	
elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
	ls_gubun = 'E'		
end if

/*2018.05.03 조원석 개선 작업 코드, 규격 없는것 제외 로직 반영 */	
/*2018.05.11 임시 주석*/
DECLARE pre_itemstock_cursor CURSOR FOR  
select  a.LOC_NO, a.item_no, a.qa, sum(isnull(a.stock_qty,0)) stock_qty
from pre_itemstock a left outer  join  groupitem b on a.item_no = b.item_no
                                    left outer join item c on a.item_no = c.item_no and a.qa =c.qa 
WHERE  SUBSTRING(a.ITEM_NO,1,1) LIKE :LS_GUBUN
AND a.YYMM = substring(:ls_st_date,1,6)			
 AND c.item_no  is not null
group by a.LOC_NO, a.item_no, a.qa;
	
DEBUGBREAK()

dw_3.accepttext()

if TRIM(ddlb_gubun.TEXT) = '전체' then
	ls_gubun = '%'
elseif TRIM(ddlb_gubun.TEXT) = '제품' then
	ls_gubun = 'P'
elseif TRIM(ddlb_gubun.TEXT) = '상품' then
	ls_gubun = 'G'	
elseif TRIM(ddlb_gubun.TEXT) = '자재' then
	ls_gubun = 'M'	
elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
	ls_gubun = 'E'		
end if

/*2018.05.11 임시 주석*/
DELETE item_stock
WHERE stock_date = :ls_st_date
     AND SUBSTRING(ITEM_NO,1,1) LIKE :LS_GUBUN;
//	AND LOC_NO = :ls_loc_no;

if MessageBox("확인", "기초재고 작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then

	OPEN pre_itemstock_cursor;

	FETCH pre_itemstock_cursor INTO :ls_loc_no, :ls_ITEM_NO, :ls_QA, :L_STOCK_QTY;
	
	Do While sqlca.sqlcode = 0
	
		 insert into item_stock (loc_no,        item_no,        qa,       stock_date, before_qty, in_qty, out_qty, intemp_qty, ret_qty, etc_qty,                 stock_qty,              stock_m_qty, gab_qty,  sysdate )	
			 VALUES (             :ls_loc_no,  :ls_item_no,   :ls_qa,       :ls_st_date,                 0,        0,           0,                 0,          0,          0,               :L_STOCK_QTY,                     0,           0,   getdate() );


	
		
	FETCH pre_itemstock_cursor INTO :ls_loc_no, :ls_ITEM_NO, :ls_QA, :L_STOCK_QTY;


	i_count = i_count + 1;
		
	Loop
	CLOSE pre_itemstock_cursor;
			  
	commit;

	MessageBox("확인",string(i_count) + "건 기초 재고 집계작업 완료!!!" )
		
end if
	
	 








end subroutine

public subroutine wf_item_stock_generate (string ls_loc_no, string ls_item_no, string ls_qa);// 전일재고 집계작업
string  ls_area,  ls_sdate, ls_edate,  ls_errtext, ls_defno, ls_date
string  ls_locno, ls_itemno, ls_savestock, ls_userid, ls_item_name
decimal ld_bqty,  ld_rqty,  ld_iqty,   ld_retqty,  ld_etcqty, ld_qoh, ld_safetystock
long    ll_row,   ll_cnt,   ll_icnt,   ll_ucnt

datetime ld_date

DEBUGBREAK()

dw_3.accepttext()

// 전일
ls_sdate = string(date(em_1.text), "yyyy-mm-dd")

//ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]

select item_name
into :ls_item_name
from groupitem
where item_no = :ls_item_no;

if MessageBox("확인", ls_sdate + "일["+  ls_item_name + "] 제품 재고~n~r" + " 집계작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then

//          ls_item_no = 'PZAAM21B1Z'
//		ls_qa	        = '120X0095X0038X02950'
		
		SELECT convert(char(10), dateadd(day, -1, convert(datetime, :ls_sdate) ),112) INTO :ls_date from login;
	
	     DELETE item_stock
           where stock_date   = replace(:ls_sdate, '-', '')
		  and  item_no = :ls_item_no
	  	  and qa = :ls_qa;		

         insert into item_stock (loc_no, item_no, qa, stock_date, before_qty, in_qty, out_qty, jaje_qty, intemp_qty, ret_qty, etc_qty, stock_qty, stock_m_qty, gab_qty,  sysdate )
                 (
                           select 
                                         a.loc_no,
                				    a.item_no,
                				    a.qa,
                                         replace(:ls_sdate, '-', '') stock_date,           
                                         sum(isnull(a.before_qty,0)) before_qty,
                                         sum(isnull(a.make_qty,0)) in_qty,                                                         /*입고(생산, 구매, 가입고, 반품, 물품요청입고, 코일이동입고 )								  	    */
                                         sum(isnull(a.ship_qty,0)) out_qty,                                                         /*출고(생산투입, 판매, 대체물품,  물품요청출고, 코일이동출고,  기타(제품폐기, 기타출고 유형) ) */
							    sum(isnull(a.jaje_qty,0)) jaje_qty,
                                         sum(isnull(a.intemp_qty,0)) intemp_qty,                                              /*가입고*/
                                         sum(isnull(a.ret_qty,0)) ret_qty,                                                           /*반품     */
                                         sum(isnull(a.etc_qty,0)) etc_qty,                                                          /*기타출고 (제품폐기, 기타출고유형 추가 )*/
						          sum(
                                                     isnull(a.before_qty,0) +                                                             /* 당일재고 = 전일재고 + 입고+가입고+반품-출고-기타 */
                      						 isnull(a.make_qty,0) +
                                                      isnull(a.intemp_qty,0) -
										 isnull(a.ship_qty,0) -
										 isnull(a.jaje_qty,0) +
										 isnull(a.ret_qty,0)  -
										 isnull(a.etc_qty,0) 
                					   	   ) stock_qty,
                                                  0 stock_m_qty,
                                                  0 gab_qty,
                                                  getdate()
						from 
						(                              
                                                        select   loc_no,
                                                              wc_no = null,
                                                              item_no,
                                                              qa,
                                                              stock_qty before_qty,
                                                              make_qty = 0,                                              
                                                              ship_qty = 0,
											     jaje_qty = 0,
                                                              ret_qty =0,
                                                              etc_qty =0,
                                                               intemp_qty = 0,
                                                               plan_out_qty =0,
                                                               plan_make_qty = 0
                                              from item_stock WITH(NOLOCK)
                                                    where stock_date   =  convert(char(10), dateadd(day, -1, convert(datetime, :ls_sdate) ),112)
											union all
									/*2018.07.03 jowonsuk 추가 */
									select  /*convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime, substring(:as_date,1,6)+'01') ) ),112) date, */            
											 loc_no,
											 wc_no = null,
											 item_no,
											 qa,             
											 before_qty = 0,
											 make_qty = plus_qty,                                                      /*생산*/
											 ship_qty = 0,							                               /*판매출고       */
											 JAJE_QTY = 0,						                               /*자재투입출고*/
											 ret_qty =0,                                                                      /*반품입고*/
											 etc_qty =minus_qty,                                                      /*기타출고*/
											 intemp_qty = 0,                                                             /*가입고*/
											 plan_out_qty =0,                                                           /*출고예정량*/
											 plan_make_qty = 0                                                       /*생산예정량*/
									  from silsa_itemstock
									where convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime,  ltrim(rtrim(yyyymm))+'01' ) ) ),112) =  :ls_sdate
									and ISNULL(close_yn,'O') <> 'O'
									and plus_qty + minus_qty <> 0
                                                          union all       
									select   loc_no
											 , null wc
											 , inaudit_item item_no
											 , qa     
											 , before_qty = 0 
											 , make_qty   = 0
											 , ship_qty   = sum(ISNULL(RCPT_QTY,0) + ISNULL(ISSUE_QTY,0))
											 , jaje_qty = 0
											 , ret_qty    = 0
											 , etc_qty    = 0
											 , intemp_qty = 0
											 , plan_out_qty = 0
											 , plan_make_qty = 0				
									  from inaudit with(nolock)
									where inaudit_date  BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
										AND inaudit_type = 'IO'
									group by loc_no
											 , inaudit_item
											 , qa     
										union all
										  SELECT loc_no     = s.loc_no
													  , wc_no      = rtrim(s.wc_no)
													  , item_no    = s.assembly
													  , qa         = s.assembly_qa
													  , before_qty = 0 
													  , make_qty   = sum(isnull(s.make_qty,0))
													  , ship_qty   = 0
													  , jaje_qty = 0
													  , ret_qty    = 0
													  , etc_qty    = 0
                                                                      , intemp_qty = 0
                                                                      , plan_out_qty = 0
                                                                      , plan_make_qty = 0
											  FROM sfcday S WITH (NOLOCK)
													 LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
/*											 WHERE convert(char(10), s.sfc_date, 112)   =   replace(:ls_sdate, '-', '')*/
											 where s.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
											 group by s.loc_no, rtrim(s.wc_no),/* convert(char(10), s.sfc_date, 111),*/ s.assembly, s.assembly_qa
                                                                   union all
                                                                   select               s.loc_no
                                                                                             , s.wc_no
                                                                                             , s.item_no
                                                                                             , s.qa
                                                                                             , before_qty = 0 
                                                                                             , make_qty = 0
                                                                                             , ship_qty = 0
/*																	    , jaje_qty =  sum(isnull(s.use_qty,0) - isnull(s.rem_qty,0)) 		*/
																		 , JAJE_QTY =  sum(    case when g.p4 = '1' then isnull(s.mod_qty,0) /*- isnull(s.rem_qty,0)*/
																											 when g.p4 = '2' then isnull(s.use_qty,0) /*- isnull(s.rem_cnt,0)*/
																											 else  isnull(s.use_qty,0) /*- isnull(s.rem_qty,0)*/
																											 end 
																								  )
                                                                                             , ret_qty = 0
                                                                                             , etc_qty = 0             
                                                                                             , intemp_qty = 0        
                                                                                             , plan_out_qty = 0
                                                                                             , plan_make_qty = 0
                                                                  from sfcuse S WITH (NOLOCK)	LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
																							INNER JOIN GROUPITEM g WITH(NOLOCK) ON s.item_no = g.item_no
/*                                                                  where convert(char(10), s.use_date, 112)   =   replace(:ls_sdate, '-', '')			*/
													where s.use_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
                                                                  group by s.loc_no
                                                                                      , s.wc_no
                                                                                  /*    , convert(char(10), s.use_date, 111)*/
                                                                                      , s.item_no
                                                                                      , s.qa
															  union all
													 SELECT   a.loc_no            
																  ,  a.wc_no          
															    , a.item_no                       
																 , a.qa         
																 , before_qty = 0 
																  , make_qty = 0
																  , ship_qty = 0
																  , jaje_qty =  sum(jaje_qty)
																  , ret_qty = 0
																  , etc_qty = 0             
																  , intemp_qty = 0        
																  , plan_out_qty = 0
																  , plan_make_qty = 0  
																from                
															  (     
																	 SELECT    distinct       
																							  coilmst.loc_no            
																						  ,  coilsfcday.wc_no          
																							 , coilmst.item_no                       
																						 , coilmst.qa 
																						 , coilsfcday.W_COIL_NO
																						 , before_qty = 0 
																						  , make_qty = 0
																						  , ship_qty = 0
																						  , jaje_qty =  (coilmst.unit_qty*coilorderdet.cnt)
																						  , ret_qty = 0
																						  , etc_qty = 0             
																						  , intemp_qty = 0        
																						  , plan_out_qty = 0
																						  , plan_make_qty = 0  
																				 FROM coilsfcday with(nolock) inner join coilmst with(nolock)   on coilsfcday.w_coil_no      = coilmst.coil_no and coilsfcday.wloc_no        = coilmst.loc_no
																														inner join coilorderdet with(nolock) on coilsfcday.order_no       = coilorderdet.order_no
						/*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   	*/
																				 where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
						
																  ) a
														  group by  a.loc_no 
														  			 , a.wc_no
																	 , a.item_no                       
																      , a.qa         
															  union all															  
															  SELECT 
																coilsfcday.loc_no    
																 ,  coilsfcday.wc_no          
															 , coilsfcday.item_no                       
																 , coilsfcday.qa         
																	 , before_qty = 0 
																  , make_qty = sum(coilsfcday.unit_qty*coilsfcday.cnt)
																  , ship_qty = 0
																	 , jaje_qty =  0
																  , ret_qty = 0
																  , etc_qty = 0             
																  , intemp_qty = 0        
																  , plan_out_qty = 0
																  , plan_make_qty = 0 
														 FROM coilsfcday with(nolock) inner join coilmst with(nolock)   on coilsfcday.w_coil_no      = coilmst.coil_no and coilsfcday.wloc_no        = coilmst.loc_no
/*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   		*/
														 where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
														  group by    coilsfcday.loc_no                           
																		  ,  coilsfcday.wc_no          																		  
																		, coilsfcday.item_no                       
																		, coilsfcday.qa  
															  union all
															select 
																	  loc_no
																	, null wc_no
																	, item_no
																	, qa
																	, before_qty = 0 
																	, make_qty   = sum(isnull(rcpt_qty,0)) 
																      , ship_qty = 0
																	 , jaje_qty =  0
																  	 , ret_qty = 0
																  	 , etc_qty = 0             
																  	 , intemp_qty = 0        
																  	 , plan_out_qty = 0
																  	 , plan_make_qty = 0 
																from coilmst
/*																WHERE CONVERT(CHAR(10), RCPT_DATE , 112) = replace(:ls_sdate, '-', '')		*/
																where rcpt_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
																and ( rem like '%잔량%' AND rem like '%입고%' )
																group by   item_no,
																			  qa,
																			  loc_no				
															  union all
															 SELECT loc_no  = d.loc_no
																	, null wc_no                                     
																	, d.item_no
																	, qa         = d.qa     
																	, before_qty = 0
																	, make_qty   = sum(isnull(d.rcpt_qty, 0))
																	, ship_qty   = 0
														     		     , jaje_qty = 0
																	, ret_qty    = 0
																	, etc_qty    = 0
																	 , intemp_qty = 0
																	 , plan_out_qty = 0
																	 , plan_make_qty = 0
															FROM inspdet D WITH (NOLOCK)
																  inner JOIN insp  H WITH (NOLOCK) ON d.insp_no = h.insp_no
/*														  WHERE  convert(char(10), h.insp_date, 112)   =   replace(:ls_sdate, '-', '')*/
														where h.insp_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
														  group by d.loc_no,/* convert(char(10),h.insp_date,111), */d.item_no, d.qa																															 
															union all	
															SELECT loc_no     = a.loc_no
																  , null wc_no                                            
																  , a.item_no
																  , qa         = a.qa      
																  , BEFORE_QTY = 0
																  , MAKE_QTY = 0
																  , ship_qty   = sum(isnull(a.ship_qty,0))
												 				  , jaje_qty = 0
																  , ret_qty    = 0
																  , etc_qty    = 0
																  , intemp_qty = 0           
																  , plan_out_qty = 0
																  , plan_make_qty = 0
															  FROM dodet  A with(nolock)
																	 inner JOIN do  B WITH (NOLOCK) ON a.do_no   = b.do_no                                                                                                                                  
/*															 WHERE convert(char(10),b.issue_date,112)  = replace(:ls_sdate, '-', '')*/
															 where b.issue_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
																AND a.ship_qty > 0     /* 반품정리시 -수량 발생함 */
															/*   AND b.ewol    <> 'Y' */  /* 송장이월 SKIP  JOWONSUK 2018.06.13 주석처리 */
																group by a.loc_no, /*convert(char(10),b.do_date,111),*/ a.item_no, a.qa
															union all																	
															 SELECT loc_no     = d.src_loc
																	, null wc_no
											
																	, d.src_item item_no
																	, qa         = d.src_qa   
																	, before_qty = 0
																	, make_qty = 0
																	, ship_qty = sum( isnull(d.src_qty, 0))
																	, jaje_qty = 0
																	, ret_qty   = 0   
																	, etc_qty  = 0
															   	     , intemp_qty = 0              
																     , plan_out_qty = 0
																     , plan_make_qty = 0
														FROM itemalter D WITH (NOLOCK)
/*													  WHERE convert(char(10), d.alter_date, 112)   =   replace(:ls_sdate, '-', '')*/
													 where d.alter_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
														 AND d.issue_flag  = 'Y'
														 group by d.src_loc,/* convert(char(10),d.alter_date,111), */d.src_item, d.src_qa                                                                         
                                                                    union all
                                                                    	SELECT loc_no      = d.tar_loc
															  ,  null wc_no
															  , item_no    = d.tar_item
															  , qa          = d.tar_qa   
															  , before_qty = 0
															  , make_qty = sum(isnull(d.tar_qty, 0))
															  , ship_qty    = 0
															  , jaje_qty = 0
															  , ret_qty   = 0
															  , etc_qty   = 0
                                                                            	  , intemp_qty = 0                               
                                                                            	  , plan_out_qty = 0
                                                                                 , plan_make_qty = 0
												  FROM itemalter D WITH (NOLOCK)
/*												 WHERE convert(char(10), d.alter_date, 112)   =  replace(:ls_sdate, '-', '')*/
												 where d.alter_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                         group by d.tar_loc, d.tar_item, d.tar_qa
													union all																														 
												  SELECT loc_no     = a.loc_no   
															 , null wc_no
															 , a.item_no
															 , qa         = a.qa   
															 , before_qty = 0
															 , make_qty = 0
															 , ship_qty = sum(isnull(a.rlse_qty,0)) 
															  , jaje_qty = 0															 
															 , ret_qty   = 0   
															 , etc_qty  = 0
                                                           	                 , intemp_qty = 0                          
                                                              	       	      , plan_out_qty = 0
                                                              		           , plan_make_qty = 0
													 FROM ask_det A WITH (NOLOCK)
															LEFT OUTER JOIN ask_head B WITH (NOLOCK) ON a.ask_no = b.ask_no
/*													WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')			*/
													where a.rlse_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )															   
													     and  a.loc_no  is not null
													group by a.loc_no,  /*convert(char(10),a.rlse_date,111)   ,*/ a.item_no, a.qa																												
													   having sum(isnull(a.rlse_qty,0)) <> 0
												 union all														 
											  SELECT  loc_no     = b.ask_loc   
														 , null wc_no                                  
														 , a.item_no
														 , qa         = a.qa   
														 , before_qty = 0
														 , make_qty = sum(isnull(a.rlse_qty,0))
														 , ship_qty = 0
														 , jaje_qty = 0														 
														 , ret_qty   =  0
														 , etc_qty  = 0
                                                                         , intemp_qty = 0       
                                                                         , plan_out_qty = 0
                                                                         , plan_make_qty = 0
											 FROM ask_det A WITH (NOLOCK)
													LEFT OUTER JOIN ask_head B ON a.ask_no = b.ask_no
/*											WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')	*/
											where a.rlse_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
													     and  b.ask_loc   is not  null											
											group by b.ask_loc, /* convert(char(10),a.rlse_date,111)   ,*/ a.item_no,  a.qa                                  
											   having sum(isnull(a.rlse_qty,0)) <> 0											
											union all
										SELECT loc_no     = b.src_loc                         
												 , null wc_no                                              
												 , a.item_no
												 , qa         = a.qa             
												 , before_qty = 0
												 , make_qty = 0
												 , ship_qty = sum( case when substring(a.item_no,4,1) = '1' then (isnull(a.move_qty*a.cnt,0)) else (isnull(a.cnt,0))  end )
												 , jaje_qty = 0
												 , ret_qty   = 0                                                 
												 , etc_qty  = 0
                                                                , intemp_qty = 0       
                                                                , plan_out_qty = 0
                                                                , plan_make_qty = 0
											 FROM itemmovedet A WITH (NOLOCK)  
													LEFT OUTER JOIN itemmove B WITH (NOLOCK) ON a.move_no = b.move_no
/*											WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')	*/
											where b.move_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
										  group by b.src_loc, /*convert(char(10),b.move_date,111),*/a.item_no,a.qa                                         
											union all
										 SELECT loc_no     = b.tar_loc               
												 , null wc_no                                  
												 , a.item_no
												 , qa         = a.qa      
												 , before_qty = 0
												 , make_qty = sum( case when substring(a.item_no,4,1) = '1' then (isnull(a.move_qty*a.cnt,0)) else (isnull(a.cnt,0))  end )
												 , ship_qty = 0
												 , jaje_qty = 0												 
												 , ret_qty   = 0
												 , etc_qty  = 0           
												 , intemp_qty = 0
												 , plan_out_qty = 0
												 , plan_make_qty = 0
										 FROM itemmovedet A WITH (NOLOCK)                 
										 LEFT OUTER JOIN itemmove B ON a.move_no = b.move_no              
/*										WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')	*/
										where b.move_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
										group by b.tar_loc, /*convert(char(10),b.move_date,111)  ,*/ a.item_no, a.qa        
                                                                      union all
                                                                      SELECT loc_no
																 , null wc_no
																, item_no
																, qa
																 , before_qty = 0
																 , make_qty = 0
																 , ship_qty = 0
															      , jaje_qty = 0																 
																 , ret_qty   = 0
																 , etc_qty  = 0                                                                                               
                                                                                     , intemp_qty = sum(isnull(qty ,0))
                                                                                     , plan_out_qty = 0
                                                                                     , plan_make_qty = 0
                                                                    FROM INTEMP WITH(NOLOCK)
/*                                                                    WHERE convert(char(10), intemp_date, 112)   =   replace(:ls_sdate, '-', '')	*/
													where intemp_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                    group by  loc_no, /*convert(char(10),intemp_date,111), */item_no, qa
                                                                    union all
                                                                    select   a.loc_no
                                                                                   , null wc_no
                                                                                 /*  , batchdate  = convert(char(10),b.ret_date,111)*/
                                                                                   , item_no
                                                                                   , qa
                                                   						    , before_qty = 0
															   , make_qty = 0
															   , ship_qty = 0
															   , jaje_qty = 0
															   , ret_qty   = sum(isnull(a.acc_qty,0)+isnull(a.free_qty,0))
															    , etc_qty  = 0                                                                                               
                                                                                   , intemp_qty = 0
                                                                                   , plan_out_qty = 0
                                                                                   , plan_make_qty = 0
                                                                    FROM retdet a WITH(NOLOCK) inner join ret b WITH(NOLOCK) on a.ret_no = b.ret_no
/*                                                                    where convert(char(10), b.ret_date, 112)   =   replace(:ls_sdate, '-', '')		*/
													   where b.ret_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                    group by a.loc_no,/* convert(char(10),b.ret_date,111),*/ item_no, qa
                                                                    union all
                                                                    select   loc_no
                                                                                   , wc_no
                                                                                   , item_no
                                                                                   , qa
                                                                                   , before_qty = 0
                                                                                   , make_qty = sum(isnull(ret_qty,0)) 
                                                                                   , ship_qty = 0
															    , jaje_qty = 0																											  
                                                                                   , ret_qty = 0
                                                                                   , etc_qty = 0                           
                                                                                   , intemp_qty = 0
                                                                                   , plan_out_qty = 0
                                                                                   , plan_make_qty = 0
                                                                  from sfcret WITH(NOLOCK)
/*                                                                  where convert(char(10), ret_date, 112)   =   replace(:ls_sdate, '-', '')*/
												     where ret_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                  group by loc_no, wc_no,/* convert(char(10), ret_date, 111),*/ item_no, qa

                                                                  union all

                                                                SELECT   a.LOC_NO
                                                                                   , WC_NO  = null
                                                                                   , a.ITEM_NO
                                                                                   , a.QA
                                                                                   , before_qty = 0 
																, make_qty   = 0
																, ship_qty   = 0
															     , jaje_qty = 0																
																, ret_qty    = 0
																, etc_qty    = ISNULL(a.QTY,0)
                                                                                    , intemp_qty = 0
                                                                                    , plan_out_qty  = 0
                                                                                    , plan_make_qty = 0
                                                                FROM itemabandet a WITH(NOLOCK) inner join itemaban b WITH(NOLOCK) on a.aban_no = b.aban_no
/*                                                                WHERE convert(char(10), b.aban_date, 112)   =  replace(:ls_sdate, '-', '')	*/
													where b.aban_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
												union all												
												 select     loc_no
												 		  , wc_no = null	
														  , item_no
														  , qa
														  , before_qty = 0 
														  , make_qty   = 0
														  , ship_qty   = 0
														  , jaje_qty = 0														  
														  , ret_qty    = 0
														  , etc_qty    = sum(ISNULL(QTY,0))
														  , intemp_qty = 0
														  , plan_out_qty  = 0
														  , plan_make_qty = 0    
												from etcout WITH(NOLOCK)
/*											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')			*/
											  where etcout_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                  AND ETC_KIND  <= '50'				/*50까지 기타출고유형 */									  
											group by loc_no, item_no, qa
											union all												
												 select     loc_no
												 		  , wc_no = null	
														  , item_no
														  , qa
														  , before_qty = 0 
														  , make_qty   =  sum(ISNULL(QTY,0))
														  , ship_qty   = 0
														  , jaje_qty = 0														  
														  , ret_qty    = 0
														  , etc_qty    =0
														  , intemp_qty = 0
														  , plan_out_qty  = 0
														  , plan_make_qty = 0    
												from etcout WITH(NOLOCK)
/*											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')	*/
											  where etcout_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                 AND ETC_KIND  > '50'				/*50이상 기타입고 유형 */	  
											group by loc_no, item_no, qa											
                                                                /*                
                                                                                      and     b.process_flag   = 'Y'
                                                                                      and     ( ( case when ( b.approve_team is null ) or (b.approve_team = '') then 'N' else 'Y' end ) ) = 'Y'
                                                                */                                                                
                   								 union all
											  SELECT   C.DEF_LOC
														  , A.WC_NO
														  ,  A.ITEM_NO 
														  ,  A.QA
														  ,  before_qty = 0 
														  , make_qty   = 0
														  , ship_qty   = 0
														  , jaje_qty = 0                                                                                                  
														  , ret_qty    = 0
														  , etc_qty    = 0
														  , intemp_qty = 0
														  , plan_out_qty  = 0                                                                                   
														  , plan_make_qty =  sum(isnull(A.ORDER_QTY,0))
												FROM MPSDET A LEFT OUTER JOIN MPSORDER B ON A.mpsorder_order = B.ORDER_NO
																						  INNER JOIN WC C ON A.WC_NO = C.WORK_NO							
										WHERE  convert(char(10), B.ORDER_DATE, 112)   =  :ls_sdate
										GROUP BY C.DEF_LOC, 
																		 A.WC_NO, 
																		 A.ITEM_NO, 
																		 A.QA
                												) a inner join groupitem  b with(nolock) on a.item_no = b.item_no
														           inner join financial_location c with(nolock) on a.loc_no = c.loc_no
																	 
                                                 where a.loc_no = :ls_loc_no 
					                         and a.item_no = :ls_item_no
			                                    and a.qa = :ls_qa	
										
                                          group by   a.loc_no,
											  a.item_no,
											  a.qa                                      
 /*                                       having         abs(sum(isnull(a.make_qty,0))) +
                                                           abs(sum(isnull(a.ship_qty,0)))   +
											  abs(sum(isnull(a.jaje_qty,0)))   +
                                                           abs(sum(isnull(a.intemp_qty,0))) +
                                                           abs(sum(isnull(a.ret_qty,0))) +
                                                           abs(sum(isnull(a.plan_out_qty,0))) +
                                                           abs(sum(isnull(a.plan_make_qty,0))) +
                                                           abs(sum(isnull(a.etc_qty,0)) )  +
          										 abs(sum( isnull(a.before_qty,0) ) ) <> 0			
*/													  
                    );	
	      
//			insert into item_stock (loc_no, item_no, qa, stock_date, before_qty, in_qty, out_qty, jaje_qty, intemp_qty, ret_qty, etc_qty, stock_qty, stock_m_qty, gab_qty,  sysdate )
//                 (
//                            select 
//                                         a.loc_no,
//                				    a.item_no,
//                				    a.qa,
//                                         replace(:ls_sdate, '-', '') stock_date,           
//                                         sum(isnull(a.before_qty,0)) before_qty,
//                                         sum(isnull(a.make_qty,0)) in_qty,                                                              /*입고(생산, 구매, 가입고, 반품, 물품요청입고, 코일이동입고 )*/
//                                         sum(isnull(a.ship_qty,0)) out_qty,                                                             /*출고(생산투입, 판매, 대체물품,  물품요청출고, 코일이동출고,  기타(제품폐기, 기타출고 유형) )*/
//							    sum(isnull(a.jaje_qty,0)) jaje_qty,
//                                         sum(isnull(a.intemp_qty,0)) intemp_qty,                                              /*가입고*/
//                                         sum(isnull(a.ret_qty,0)) ret_qty,                                                                 /*반품     */
//                                         sum(isnull(a.etc_qty,0)) etc_qty,                                                                 /*기타출고 (제품폐기, 기타출고유형 추가 )*/
//						          sum(
//                                                     isnull(a.before_qty,0) +                                                                         /* 당일재고 = 전일재고 + 입고+가입고+반품-출고-기타 */
//                      						 isnull(a.make_qty,0) +
//                                                      isnull(a.intemp_qty,0) -
//										 isnull(a.ship_qty,0) -
//										 isnull(a.jaje_qty,0) +
//										 isnull(a.ret_qty,0)  -
//										 isnull(a.etc_qty,0) 
//                					   	   ) stock_qty,
//                                                  0 stock_m_qty,
//                                                  0 gab_qty,
//                                                  getdate()
//						from 
//						(                              
//                                                        select   loc_no,
//                                                              wc_no = null,
//                                                              item_no,
//                                                              qa,
//                                                              stock_qty before_qty,
//                                                              make_qty = 0,                                              
//                                                              ship_qty = 0,
//											     jaje_qty = 0,
//                                                              ret_qty =0,
//                                                              etc_qty =0,
//                                                               intemp_qty = 0,
//                                                               plan_out_qty =0,
//                                                               plan_make_qty = 0
//                                              from item_stock WITH(NOLOCK)
//                                                    where stock_date   = :ls_date
//										     union all
//							select  /*convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime, substring(:as_date,1,6)+'01') ) ),112) date, */            
//								 loc_no,
//								 wc_no = null,
//								 item_no,
//								 qa,             
//								 before_qty = 0,
//								 make_qty = plus_qty,                                                                /*생산*/
//								 ship_qty = 0,							                                                     /*판매출고       */
//								 JAJE_QTY = 0,						                                                    /*자재투입출고*/
//								 ret_qty =0,                                                                      /*반품입고*/
//								 etc_qty =minus_qty,                                                                      /*기타출고*/
//								 intemp_qty = 0,                                                             /*가입고*/
//								 plan_out_qty =0,                                                           /*출고예정량*/
//								 plan_make_qty = 0                                                        /*생산예정량*/
//						  from silsa_itemstock
//						where convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime,  ltrim(rtrim(yyyymm))+'01' ) ) ),121)    = :ls_sdate
//						and isnull(close_yn,'O') <> 'O'
//						and plus_qty + minus_qty <> 0
//                                                          union all                                           
//							  SELECT loc_no     = s.loc_no
//													  , wc_no      = rtrim(s.wc_no)
//													  , item_no    = s.assembly
//													  , qa         = s.assembly_qa
//													  , before_qty = 0 
//													  , make_qty   = sum(isnull(s.make_qty,0))
//													  , ship_qty   = 0
//													  , jaje_qty = 0
//													  , ret_qty    = 0
//													  , etc_qty    = 0
//                                                                      , intemp_qty = 0
//                                                                      , plan_out_qty = 0
//                                                                      , plan_make_qty = 0
//											  FROM sfcday S WITH (NOLOCK)
//													 LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
///*											 WHERE convert(char(10), s.sfc_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//											  where s.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//											 group by s.loc_no, rtrim(s.wc_no),/* convert(char(10), s.sfc_date, 111),*/ s.assembly, s.assembly_qa
//                                                                   union all
//                                                                   select               s.loc_no
//                                                                                             , s.wc_no
//                                                                                             , s.item_no
//                                                                                             , s.qa
//                                                                                             , before_qty = 0 
//                                                                                             , make_qty = 0
//                                                                                             , ship_qty = 0
///*																	    , jaje_qty =  sum(isnull(s.use_qty,0) - isnull(s.rem_qty,0)) 		*/
//																	    , JAJE_QTY =  sum(    case when g.p4 = '1' then isnull(s.mod_qty,0) - isnull(s.rem_qty,0)
//																										    when g.p4 = '2' then isnull(s.use_qty,0) - isnull(s.rem_cnt,0)
//  																										      else  isnull(s.use_qty,0) - isnull(s.rem_qty,0)
//																											 end 
//																		                                )
//                                                                                             , ret_qty = 0
//                                                                                             , etc_qty = 0             
//                                                                                             , intemp_qty = 0        
//                                                                                             , plan_out_qty = 0
//                                                                                             , plan_make_qty = 0
//                                                                  from sfcuse S WITH (NOLOCK)	LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
//																							INNER JOIN GROUPITEM g WITH(NOLOCK) ON s.item_no = g.item_no
///*                                                                  where convert(char(10), s.use_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//													 where s.use_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//                                                                  group by s.loc_no
//                                                                                      , s.wc_no
//                                                                                  /*    , convert(char(10), s.use_date, 111)*/
//                                                                                      , s.item_no
//                                                                                      , s.qa
//															  union all
//												    SELECT    distinct coilmst.loc_no            
//																		        ,  coilsfcday.wc_no          
//																			 , coilmst.item_no                       
//																				 , coilmst.qa         
//																					 , before_qty = 0 
//																				  , make_qty = 0
//																				  , ship_qty = 0
//																					 , jaje_qty =   (isnull(coilmst.unit_qty,0)*isnull(coilorderdet.cnt,0))
//																				  , ret_qty = 0
//																				  , etc_qty = 0             
//																				  , intemp_qty = 0        
//																				  , plan_out_qty = 0
//																				  , plan_make_qty = 0  
//																		 FROM coilsfcday with(nolock) inner join coilmst with(nolock)   on coilsfcday.w_coil_no      = coilmst.coil_no and coilsfcday.wloc_no        = coilmst.loc_no
//																																			  inner join coilorderdet with(nolock) on coilsfcday.order_no       = coilorderdet.order_no
///*																		WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   		*/
//																		where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//																			  
//															  union all
//															  
//															  SELECT 
//																coilsfcday.loc_no    
//																 ,  coilsfcday.wc_no          
//															 , coilsfcday.item_no                       
//																 , coilsfcday.qa         
//																	 , before_qty = 0 
//																  , make_qty = sum(coilsfcday.unit_qty*coilsfcday.cnt)
//																  , ship_qty = 0
//																	 , jaje_qty =  0
//																  , ret_qty = 0
//																  , etc_qty = 0             
//																  , intemp_qty = 0        
//																  , plan_out_qty = 0
//																  , plan_make_qty = 0 
//														 FROM coilsfcday with(nolock) inner join coilmst with(nolock)   on coilsfcday.w_coil_no      = coilmst.coil_no and coilsfcday.wloc_no        = coilmst.loc_no
///*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   																				 */
//															where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//														  group by    coilsfcday.loc_no                           
//																		  ,  coilsfcday.wc_no          																		  
//																		, coilsfcday.item_no                       
//																		, coilsfcday.qa  			
//															union all
//															select 
//																	  loc_no
//																	, null wc_no
//																	, item_no
//																	, qa
//																	, before_qty = 0 
//																	, make_qty   = sum(isnull(rcpt_qty,0)) 
//																      , ship_qty = 0
//																	 , jaje_qty =  0
//																  	 , ret_qty = 0
//																  	 , etc_qty = 0             
//																  	 , intemp_qty = 0        
//																  	 , plan_out_qty = 0
//																  	 , plan_make_qty = 0 
//																from coilmst
///*																WHERE CONVERT(CHAR(10), RCPT_DATE , 112) = replace(:ls_sdate, '-', '')	*/
//																where rcpt_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//																and ( rem like '%잔량%' AND rem like '%입고%' )
//																group by   item_no,
//																			  qa,
//																			  loc_no																						
//																		
//															  union all
//															 SELECT loc_no  = d.loc_no
//																	, null wc_no                                     
//																	, d.item_no
//																	, qa         = d.qa     
//																	, before_qty = 0
//																	, make_qty   = sum(isnull(d.rcpt_qty, 0))
//																	, ship_qty   = 0
//														     		     , jaje_qty = 0
//																	, ret_qty    = 0
//																	, etc_qty    = 0
//																	 , intemp_qty = 0
//																	 , plan_out_qty = 0
//																	 , plan_make_qty = 0
//															FROM inspdet D WITH (NOLOCK)
//																  inner JOIN insp  H WITH (NOLOCK) ON d.insp_no = h.insp_no
///*														  WHERE  convert(char(10), h.insp_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//														  where h.insp_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//														  group by d.loc_no,/* convert(char(10),h.insp_date,111), */d.item_no, d.qa																															 
//															union all	
//															SELECT loc_no     = a.loc_no
//																  , null wc_no                                            
//																  , a.item_no
//																  , qa         = a.qa      
//																  , BEFORE_QTY = 0
//																  , MAKE_QTY = 0
//																  , ship_qty   = sum(isnull(a.ship_qty,0))
//												 				  , jaje_qty = 0
//																  , ret_qty    = 0
//																  , etc_qty    = 0
//																  , intemp_qty = 0           
//																  , plan_out_qty = 0
//																  , plan_make_qty = 0
//															  FROM dodet  A with(nolock)
//																	 inner JOIN do  B WITH (NOLOCK) ON a.do_no   = b.do_no                                                                                                                                  
///*															 WHERE convert(char(10),b.do_date,112)  = replace(:ls_sdate, '-', '')	*/
//															 where b.do_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//																AND a.ship_qty > 0     /* 반품정리시 -수량 발생함 */
//															/*   AND b.ewol    <> 'Y' */  /* 송장이월 SKIP  JOWONSUK 2018.06.13 주석처리 */
//																group by a.loc_no, /*convert(char(10),b.do_date,111),*/ a.item_no, a.qa
//															union all																	
//															 SELECT loc_no     = d.src_loc
//																	, null wc_no
//											
//																	, d.src_item item_no
//																	, qa         = d.src_qa   
//																	, before_qty = 0
//																	, make_qty = 0
//																	, ship_qty = sum( isnull(d.src_qty, 0))
//																	, jaje_qty = 0
//																	, ret_qty   = 0   
//																	, etc_qty  = 0
//															   	     , intemp_qty = 0              
//																     , plan_out_qty = 0
//																     , plan_make_qty = 0
//														FROM itemalter D WITH (NOLOCK)
///*													  WHERE convert(char(10), d.alter_date, 112)   =   replace(:ls_sdate, '-', '')			*/
//													  where d.alter_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//														 AND d.issue_flag  = 'Y'
//														 group by d.src_loc,/* convert(char(10),d.alter_date,111), */d.src_item, d.src_qa                                                                         
//                                                                    union all
//                                                                    	SELECT loc_no      = d.tar_loc
//															  ,  null wc_no
//															  , item_no    = d.tar_item
//															  , qa          = d.tar_qa   
//															  , before_qty = 0
//															  , make_qty = sum(isnull(d.tar_qty, 0))
//															  , ship_qty    = 0
//															  , jaje_qty = 0
//															  , ret_qty   = 0
//															  , etc_qty   = 0
//                                                                            	  , intemp_qty = 0                               
//                                                                            	  , plan_out_qty = 0
//                                                                                 , plan_make_qty = 0
//												  FROM itemalter D WITH (NOLOCK)
///*												 WHERE convert(char(10), d.alter_date, 112)   =  replace(:ls_sdate, '-', '')		*/
//												 where d.alter_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//                                                                         group by d.tar_loc, d.tar_item, d.tar_qa
//													union all																														 
//												  SELECT loc_no     = a.loc_no   
//															 , null wc_no
//															 , a.item_no
//															 , qa         = a.qa   
//															 , before_qty = 0
//															 , make_qty = 0
//															 , ship_qty = sum(isnull(a.rlse_qty,0)) 
//															  , jaje_qty = 0															 
//															 , ret_qty   = 0   
//															 , etc_qty  = 0
//                                                           	                 , intemp_qty = 0                          
//                                                              	       	      , plan_out_qty = 0
//                                                              		           , plan_make_qty = 0
//													 FROM ask_det A WITH (NOLOCK)
//															LEFT OUTER JOIN ask_head B WITH (NOLOCK) ON a.ask_no = b.ask_no
///*													WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//													where a.rlse_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//													     and  a.loc_no   is not null														
//													group by a.loc_no,  /*convert(char(10),a.rlse_date,111)   ,*/ a.item_no, a.qa
//													having sum(isnull(a.rlse_qty,0))    <> 0
//												 union all														 
//											  SELECT  loc_no     = b.ask_loc   
//														 , null wc_no                                  
//														 , a.item_no
//														 , qa         = a.qa   
//														 , before_qty = 0
//														 , make_qty = sum(isnull(a.rlse_qty,0))
//														 , ship_qty = 0
//														 , jaje_qty = 0														 
//														 , ret_qty   =  0
//														 , etc_qty  = 0
//                                                                         , intemp_qty = 0       
//                                                                         , plan_out_qty = 0
//                                                                         , plan_make_qty = 0
//											 FROM ask_det A WITH (NOLOCK)
//													LEFT OUTER JOIN ask_head B ON a.ask_no = b.ask_no
///*											WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//											where a.rlse_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//											     and  b.ask_loc   is not null												
//											group by b.ask_loc, /* convert(char(10),a.rlse_date,111)   ,*/ a.item_no,  a.qa                                  
//											having sum(isnull(a.rlse_qty,0))    <> 0											
//											union all
//										SELECT loc_no     = b.src_loc                         
//												 , null wc_no                                              
//												 , a.item_no
//												 , qa         = a.qa             
//												 , before_qty = 0
//												 , make_qty = 0
//												 , ship_qty = sum( case when substring(a.item_no,4,1) = '1' then (isnull(a.move_qty*a.cnt,0)) else (isnull(a.cnt,0))  end )
//												 , jaje_qty = 0
//												 , ret_qty   = 0                                                 
//												 , etc_qty  = 0
//                                                                , intemp_qty = 0       
//                                                                , plan_out_qty = 0
//                                                                , plan_make_qty = 0
//											 FROM itemmovedet A WITH (NOLOCK)  
//													LEFT OUTER JOIN itemmove B WITH (NOLOCK) ON a.move_no = b.move_no
///*										WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//										where b.move_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//										  group by b.src_loc, /*convert(char(10),b.move_date,111),*/a.item_no,a.qa                                         
//											union all
//										 SELECT loc_no     = b.tar_loc               
//												 , null wc_no                                  
//												 , a.item_no
//												 , qa         = a.qa      
//												 , before_qty = 0
//												 , make_qty = sum( case when substring(a.item_no,4,1) = '1' then (isnull(a.move_qty*a.cnt,0)) else (isnull(a.cnt,0))  end )
//												 , ship_qty = 0
//												 , jaje_qty = 0												 
//												 , ret_qty   = 0
//												 , etc_qty  = 0           
//												 , intemp_qty = 0
//												 , plan_out_qty = 0
//												 , plan_make_qty = 0
//										 FROM itemmovedet A WITH (NOLOCK)                 
//										 LEFT OUTER JOIN itemmove B ON a.move_no = b.move_no              
///*										WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//										where b.move_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//										group by b.tar_loc, /*convert(char(10),b.move_date,111)  ,*/ a.item_no, a.qa        
//                                                                      union all
//                                                                      SELECT loc_no
//																 , null wc_no
//																, item_no
//																, qa
//																 , before_qty = 0
//																 , make_qty = 0
//																 , ship_qty = 0
//															      , jaje_qty = 0																 
//																 , ret_qty   = 0
//																 , etc_qty  = 0                                                                                               
//                                                                                     , intemp_qty = sum(isnull(qty ,0))
//                                                                                     , plan_out_qty = 0
//                                                                                     , plan_make_qty = 0
//                                                                    FROM INTEMP WITH(NOLOCK)
///*                                                                    WHERE convert(char(10), intemp_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//													where intemp_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//                                                                    group by  loc_no, /*convert(char(10),intemp_date,111), */item_no, qa
//                                                                    union all
//                                                                    select   a.loc_no
//                                                                                   , null wc_no
//                                                                                 /*  , batchdate  = convert(char(10),b.ret_date,111)*/
//                                                                                   , item_no
//                                                                                   , qa
//                                                   						    , before_qty = 0
//															   , make_qty = 0
//															   , ship_qty = 0
//															   , jaje_qty = 0
//															   , ret_qty   = sum(isnull(a.acc_qty,0)+isnull(a.free_qty,0))
//															    , etc_qty  = 0                                                                                               
//                                                                                   , intemp_qty = 0
//                                                                                   , plan_out_qty = 0
//                                                                                   , plan_make_qty = 0
//                                                                    FROM retdet a WITH(NOLOCK) inner join ret b WITH(NOLOCK) on a.ret_no = b.ret_no
///*                                                                    where convert(char(10), b.ret_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//													  where b.ret_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//                                                                    group by a.loc_no,/* convert(char(10),b.ret_date,111),*/ item_no, qa
//                                                                    union all
//                                                                    select   loc_no
//                                                                                   , wc_no
//                                                                                   , item_no
//                                                                                   , qa
//                                                                                   , before_qty = 0
//                                                                                   , make_qty = sum(isnull(ret_qty,0)) 
//                                                                                   , ship_qty = 0
//															    , jaje_qty = 0																											  
//                                                                                   , ret_qty = 0
//                                                                                   , etc_qty = 0                           
//                                                                                   , intemp_qty = 0
//                                                                                   , plan_out_qty = 0
//                                                                                   , plan_make_qty = 0
//                                                                  from sfcret WITH(NOLOCK)
///*                                                                  where convert(char(10), ret_date, 112)   =   replace(:ls_sdate, '-', '')		*/
//													where ret_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//                                                                  group by loc_no, wc_no,/* convert(char(10), ret_date, 111),*/ item_no, qa
//
//                                                                  union all
//
//                                                                SELECT   a.LOC_NO
//                                                                                   , WC_NO  = null
//                                                                                   , a.ITEM_NO
//                                                                                   , a.QA
//                                                                                   , before_qty = 0 
//																, make_qty   = 0
//																, ship_qty   = 0
//															     , jaje_qty = 0																
//																, ret_qty    = 0
//																, etc_qty    = ISNULL(a.QTY,0)
//                                                                                    , intemp_qty = 0
//                                                                                    , plan_out_qty  = 0
//                                                                                    , plan_make_qty = 0
//                                                                FROM itemabandet a WITH(NOLOCK) inner join itemaban b WITH(NOLOCK) on a.aban_no = b.aban_no
///*                                                                WHERE convert(char(10), b.aban_date, 112)   =  replace(:ls_sdate, '-', '')		*/
//												    where b.aban_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//												union all												
//												 select     loc_no
//												 		  , wc_no = null	
//														  , item_no
//														  , qa
//														  , before_qty = 0 
//														  , make_qty   = 0
//														  , ship_qty   = 0
//														  , jaje_qty = 0														  
//														  , ret_qty    = 0
//														  , etc_qty    = sum(ISNULL(QTY,0))
//														  , intemp_qty = 0
//														  , plan_out_qty  = 0
//														  , plan_make_qty = 0    
//												from etcout WITH(NOLOCK)
///*											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')		*/
//											  where etcout_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//                                                                  AND ETC_KIND  <= '50'				/*50까지 기타출고유형 */									  
//											group by loc_no, item_no, qa
//											union all												
//												 select     loc_no
//												 		  , wc_no = null	
//														  , item_no
//														  , qa
//														  , before_qty = 0 
//														  , make_qty   =  sum(ISNULL(QTY,0))
//														  , ship_qty   = 0
//														  , jaje_qty = 0														  
//														  , ret_qty    = 0
//														  , etc_qty    =0
//														  , intemp_qty = 0
//														  , plan_out_qty  = 0
//														  , plan_make_qty = 0    
//												from etcout WITH(NOLOCK)
///*											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')		*/
//											  where etcout_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
//                                                                 AND ETC_KIND  > '50'				/*50이상 기타입고 유형 */	  
//											group by loc_no, item_no, qa											
//                                                                /*                
//                                                                                      and     b.process_flag   = 'Y'
//                                                                                      and     ( ( case when ( b.approve_team is null ) or (b.approve_team = '') then 'N' else 'Y' end ) ) = 'Y'
//                                                                */                                                                
//            
//                												) a inner join groupitem  b on a.item_no = b.item_no
//																	 
//                                                 where a.item_no = :ls_item_no
//			                                    and a.qa = :ls_qa													 									  
//										and a.loc_no is not null					
//                                          group by    a.loc_no,
//											 a.item_no,
//											 a.qa                                      
//                                        having         abs(sum(isnull(a.make_qty,0))) +
//                                                           abs(sum(isnull(a.ship_qty,0)))   +
//											  abs(sum(isnull(a.jaje_qty,0)))   +
//                                                           abs(sum(isnull(a.intemp_qty,0))) +
//                                                           abs(sum(isnull(a.ret_qty,0))) +
//                                                           abs(sum(isnull(a.plan_out_qty,0))) +
//                                                           abs(sum(isnull(a.plan_make_qty,0))) +
//                                                           abs(sum(isnull(a.etc_qty,0)) )  +
//          										 abs(sum( isnull(a.before_qty,0) ) ) <> 0																										                        
//                    );		
						  
		commit;

		MessageBox("확인", "[" + ls_item_name + "] 재고 집계작업 완료!!!" )
			
	end if



end subroutine

public subroutine wf_item_stock_day (string ls_sdate);// 전일재고 집계작업
string  ls_area,  ls_edate,  ls_errtext, ls_defno, ls_date, ls_item_no, ls_yymm
string  ls_locno, ls_itemno, ls_qa,    ls_savestock, ls_userid, ls_area_name
decimal ld_bqty,  ld_rqty,  ld_iqty,   ld_retqty,  ld_etcqty, ld_qoh, ld_safetystock
long    ll_row,   ll_cnt,   ll_icnt,   ll_ucnt, l_net

datetime ld_date

DEBUGBREAK()

dw_3.accepttext()

ls_date = ''

/*말일 점검*/
select convert(char(10), dateadd(d,-1,dateadd(m,1,dateadd(dd,1,dateadd(dd,-datepart(dd,  convert(datetime, :ls_sdate) ),convert(datetime, :ls_sdate) )))),121) 
into :ls_date
from dual;




ls_area_name = trim(ddlb_area_name.text)

if ls_area_name  = '전체' then
	ls_area_name = '%'
else
	ls_area_name = ls_area_name
end if

	/*2018.09.12 jowonsuk */
       delete item_stock
        where item_stock.stock_date   = replace(:ls_sdate, '-', '')	
		 and exists (
						     select * 
							from financial_location
							where rtrim(ltrim(financial_location.area_name)) like :ls_area_name
							and financial_location.loc_no = item_stock.loc_no
					    );
													
	
         insert into item_stock (loc_no, item_no, qa, stock_date, before_qty, in_qty, out_qty, jaje_qty, intemp_qty, ret_qty, etc_qty, stock_qty, stock_m_qty, gab_qty,  sysdate )
                 (
                           select 
                                         a.loc_no,
                				    a.item_no,
                				    a.qa,
                                         replace(:ls_sdate, '-', '') stock_date,           
                                         sum(isnull(a.before_qty,0)) before_qty,
                                         sum(isnull(a.make_qty,0)) in_qty,                                                         /*입고(생산, 구매, 가입고, 반품, 물품요청입고, 코일이동입고 )								  	    */
                                         sum(isnull(a.ship_qty,0)) out_qty,                                                         /*출고(생산투입, 판매, 대체물품,  물품요청출고, 코일이동출고,  기타(제품폐기, 기타출고 유형) ) */
							    sum(isnull(a.jaje_qty,0)) jaje_qty,
                                         sum(isnull(a.intemp_qty,0)) intemp_qty,                                              /*가입고*/
                                         sum(isnull(a.ret_qty,0)) ret_qty,                                                           /*반품     */
                                         sum(isnull(a.etc_qty,0)) etc_qty,                                                          /*기타출고 (제품폐기, 기타출고유형 추가 )*/
						          sum(
                                                     isnull(a.before_qty,0) +                                                             /* 당일재고 = 전일재고 + 입고+가입고+반품-출고-기타 */
                      						 isnull(a.make_qty,0) +
                                                      isnull(a.intemp_qty,0) -
										 isnull(a.ship_qty,0) -
										 isnull(a.jaje_qty,0) +
										 isnull(a.ret_qty,0)  -
										 isnull(a.etc_qty,0) 
                					   	   ) stock_qty,
                                                  0 stock_m_qty,
                                                  0 gab_qty,
                                                  getdate()
						from 
						(                              
                                                        select   loc_no,
                                                              wc_no = null,
                                                              item_no,
                                                              qa,
                                                              stock_qty before_qty,
                                                              make_qty = 0,                                              
                                                              ship_qty = 0,
											     jaje_qty = 0,
                                                              ret_qty =0,
                                                              etc_qty =0,
                                                               intemp_qty = 0,
                                                               plan_out_qty =0,
                                                               plan_make_qty = 0
                                              from item_stock WITH(NOLOCK)
                                                    where stock_date   =  convert(char(10), dateadd(day, -1, convert(datetime, :ls_sdate) ),112)
								          and isnull(stock_qty,0) <> 0
											union all
									/*2018.07.03 jowonsuk 추가 */
									select  /*convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime, substring(:as_date,1,6)+'01') ) ),112) date, */            
											 loc_no,
											 wc_no = null,
											 item_no,
											 qa,             
											 before_qty = 0,
											 make_qty = plus_qty,                                                      /*생산*/
											 ship_qty = 0,							                               /*판매출고       */
											 JAJE_QTY = 0,						                               /*자재투입출고*/
											 ret_qty =0,                                                                      /*반품입고*/
											 etc_qty =minus_qty,                                                      /*기타출고*/
											 intemp_qty = 0,                                                             /*가입고*/
											 plan_out_qty =0,                                                           /*출고예정량*/
											 plan_make_qty = 0                                                       /*생산예정량*/
									  from silsa_itemstock
									where convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime,  ltrim(rtrim(yyyymm))+'01' ) ) ),112) =  :ls_sdate
									and ISNULL(close_yn,'O') <> 'O'
									and plus_qty + minus_qty <> 0
                                                          union all       
									select   loc_no
											 , null wc
											 , inaudit_item item_no
											 , qa     
											 , before_qty = 0 
											 , make_qty   = 0
											 , ship_qty   = sum(ISNULL(RCPT_QTY,0) + ISNULL(ISSUE_QTY,0))
											 , jaje_qty = 0
											 , ret_qty    = 0
											 , etc_qty    = 0
											 , intemp_qty = 0
											 , plan_out_qty = 0
											 , plan_make_qty = 0				
									  from inaudit with(nolock)
									where inaudit_date  BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
										AND inaudit_type = 'IO'
									group by loc_no
											 , inaudit_item
											 , qa     
										union all
										  SELECT loc_no     = s.loc_no
													  , wc_no      = rtrim(s.wc_no)
													  , item_no    = s.assembly
													  , qa         = s.assembly_qa
													  , before_qty = 0 
													  , make_qty   = sum(isnull(s.make_qty,0))
													  , ship_qty   = 0
													  , jaje_qty = 0
													  , ret_qty    = 0
													  , etc_qty    = 0
                                                                      , intemp_qty = 0
                                                                      , plan_out_qty = 0
                                                                      , plan_make_qty = 0
											  FROM sfcday S WITH (NOLOCK)
													 LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
/*											 WHERE convert(char(10), s.sfc_date, 112)   =   replace(:ls_sdate, '-', '')*/
											 where s.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
											 group by s.loc_no, rtrim(s.wc_no),/* convert(char(10), s.sfc_date, 111),*/ s.assembly, s.assembly_qa
                                                                   union all
                                                                   select               s.loc_no
                                                                                             , s.wc_no
                                                                                             , s.item_no
                                                                                             , s.qa
                                                                                             , before_qty = 0 
                                                                                             , make_qty = 0
                                                                                             , ship_qty = 0
/*																	    , jaje_qty =  sum(isnull(s.use_qty,0) - isnull(s.rem_qty,0)) 		*/
																		 , JAJE_QTY =  sum(    case when g.p4 = '1' then isnull(s.mod_qty,0) /*- isnull(s.rem_qty,0)*/
																											 when g.p4 = '2' then isnull(s.use_qty,0) /*- isnull(s.rem_cnt,0)*/
																											 else  isnull(s.use_qty,0) /*- isnull(s.rem_qty,0)*/
																											 end 
																								  )
                                                                                             , ret_qty = 0
                                                                                             , etc_qty = 0             
                                                                                             , intemp_qty = 0        
                                                                                             , plan_out_qty = 0
                                                                                             , plan_make_qty = 0
                                                                  from sfcuse S WITH (NOLOCK)	LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
																							INNER JOIN GROUPITEM g WITH(NOLOCK) ON s.item_no = g.item_no
/*                                                                  where convert(char(10), s.use_date, 112)   =   replace(:ls_sdate, '-', '')			*/
													where s.use_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
                                                                  group by s.loc_no
                                                                                      , s.wc_no
                                                                                  /*    , convert(char(10), s.use_date, 111)*/
                                                                                      , s.item_no
                                                                                      , s.qa
															  union all
													 SELECT   a.loc_no            
																  ,  a.wc_no          
															    , a.item_no                       
																 , a.qa         
																 , before_qty = 0 
																  , make_qty = 0
																  , ship_qty = 0
																  , jaje_qty =  sum(jaje_qty)
																  , ret_qty = 0
																  , etc_qty = 0             
																  , intemp_qty = 0        
																  , plan_out_qty = 0
																  , plan_make_qty = 0  
																from                
															  (     
																	 SELECT    distinct       
																							  coilmst.loc_no            
																						  ,  coilsfcday.wc_no          
																							 , coilmst.item_no                       
																						 , coilmst.qa 
																						 , coilorderdet.COIL_NO
																						 , before_qty = 0 
																						  , make_qty = 0
																						  , ship_qty = 0
																						  , jaje_qty =  (coilmst.unit_qty*coilorderdet.cnt)
																						  , ret_qty = 0
																						  , etc_qty = 0             
																						  , intemp_qty = 0        
																						  , plan_out_qty = 0
																						  , plan_make_qty = 0  
																				 FROM coilsfcday with(nolock) inner join coilorderdet with(nolock) on coilsfcday.order_no  = coilorderdet.order_no
																														inner join coilmst with(nolock)   on coilorderdet.coil_no      = coilmst.coil_no and coilorderdet.loc_no        = coilmst.loc_no
						/*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   	*/
																				 where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
																	union all
																		 SELECT    distinct       
																						  coilmst.loc_no            
																					  ,  coilsfcday.wc_no          
																						 , coilmst.item_no                       
																					 , coilmst.qa 
																					 , coilordersum.COIL_NO
																					 , before_qty = 0 
																					  , make_qty = 0
																					  , ship_qty = 0
																					  , jaje_qty =  (coilmst.unit_qty*coilordersum.cnt)
																					  , ret_qty = 0
																					  , etc_qty = 0             
																					  , intemp_qty = 0        
																					  , plan_out_qty = 0
																					  , plan_make_qty = 0  
																			 FROM coilsfcday with(nolock) inner join coilordersum with(nolock) on coilsfcday.order_no  = coilordersum.order_no
																													inner join coilmst with(nolock)   on coilordersum.coil_no      = coilmst.coil_no and coilordersum.loc_no        = coilmst.loc_no
					/*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   	*/
																			 where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
						
																  ) a
														  group by  a.loc_no 
														  			 , a.wc_no
																	 , a.item_no                       
																      , a.qa         
															  union all															  
															  SELECT 
																coilsfcday.loc_no    
																 ,  coilsfcday.wc_no          
															 , coilsfcday.item_no                       
																 , coilsfcday.qa         
																	 , before_qty = 0 
																  , make_qty = sum(coilsfcday.unit_qty*coilsfcday.cnt)
																  , ship_qty = 0
																	 , jaje_qty =  0
																  , ret_qty = 0
																  , etc_qty = 0             
																  , intemp_qty = 0        
																  , plan_out_qty = 0
																  , plan_make_qty = 0 
														 FROM coilsfcday with(nolock) inner join coilmst with(nolock)   on coilsfcday.w_coil_no      = coilmst.coil_no and coilsfcday.wloc_no        = coilmst.loc_no
/*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   		*/
														 where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
														  group by    coilsfcday.loc_no                           
																		  ,  coilsfcday.wc_no          																		  
																		, coilsfcday.item_no                       
																		, coilsfcday.qa  
															  union all
															select 
																	  loc_no
																	, null wc_no
																	, item_no
																	, qa
																	, before_qty = 0 
																	, make_qty   = sum(isnull(rcpt_qty,0)) 
																      , ship_qty = 0
																	 , jaje_qty =  0
																  	 , ret_qty = 0
																  	 , etc_qty = 0             
																  	 , intemp_qty = 0        
																  	 , plan_out_qty = 0
																  	 , plan_make_qty = 0 
																from coilmst
/*																WHERE CONVERT(CHAR(10), RCPT_DATE , 112) = replace(:ls_sdate, '-', '')		*/
																where rcpt_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
																and ( rem like '%잔량%' AND rem like '%입고%' )
																group by   item_no,
																			  qa,
																			  loc_no				
															  union all
															 SELECT loc_no  = d.loc_no
																	, null wc_no                                     
																	, d.item_no
																	, qa         = d.qa     
																	, before_qty = 0
																	, make_qty   = sum(isnull(d.rcpt_qty, 0))
																	, ship_qty   = 0
														     		     , jaje_qty = 0
																	, ret_qty    = 0
																	, etc_qty    = 0
																	 , intemp_qty = 0
																	 , plan_out_qty = 0
																	 , plan_make_qty = 0
															FROM inspdet D WITH (NOLOCK)
																  inner JOIN insp  H WITH (NOLOCK) ON d.insp_no = h.insp_no
/*														  WHERE  convert(char(10), h.insp_date, 112)   =   replace(:ls_sdate, '-', '')*/
														where h.insp_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
														  group by d.loc_no,/* convert(char(10),h.insp_date,111), */d.item_no, d.qa																															 
															union all	
															SELECT loc_no     = a.loc_no
																  , null wc_no                                            
																  , a.item_no
																  , qa         = a.qa      
																  , BEFORE_QTY = 0
																  , MAKE_QTY = 0
																  , ship_qty   = sum(isnull(a.ship_qty,0))
												 				  , jaje_qty = 0
																  , ret_qty    = 0
																  , etc_qty    = 0
																  , intemp_qty = 0           
																  , plan_out_qty = 0
																  , plan_make_qty = 0
															  FROM dodet  A with(nolock)
																	 inner JOIN do  B WITH (NOLOCK) ON a.do_no   = b.do_no                                                                                                                                  
/*															 WHERE convert(char(10),b.issue_date,112)  = replace(:ls_sdate, '-', '')*/
															 where b.issue_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
																AND a.ship_qty > 0     /* 반품정리시 -수량 발생함 */
															/*   AND b.ewol    <> 'Y' */  /* 송장이월 SKIP  JOWONSUK 2018.06.13 주석처리 */
																group by a.loc_no, /*convert(char(10),b.do_date,111),*/ a.item_no, a.qa
															union all																	
															 SELECT loc_no     = d.src_loc
																	, null wc_no
											
																	, d.src_item item_no
																	, qa         = d.src_qa   
																	, before_qty = 0
																	, make_qty = 0
																	, ship_qty = sum( isnull(d.src_qty, 0))
																	, jaje_qty = 0
																	, ret_qty   = 0   
																	, etc_qty  = 0
															   	     , intemp_qty = 0              
																     , plan_out_qty = 0
																     , plan_make_qty = 0
														FROM itemalter D WITH (NOLOCK)
/*													  WHERE convert(char(10), d.alter_date, 112)   =   replace(:ls_sdate, '-', '')*/
													 where d.alter_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
														 AND d.issue_flag  = 'Y'
														 group by d.src_loc,/* convert(char(10),d.alter_date,111), */d.src_item, d.src_qa                                                                         
                                                                    union all
                                                                    	SELECT loc_no      = d.tar_loc
															  ,  null wc_no
															  , item_no    = d.tar_item
															  , qa          = d.tar_qa   
															  , before_qty = 0
															  , make_qty = sum(isnull(d.tar_qty, 0))
															  , ship_qty    = 0
															  , jaje_qty = 0
															  , ret_qty   = 0
															  , etc_qty   = 0
                                                                            	  , intemp_qty = 0                               
                                                                            	  , plan_out_qty = 0
                                                                                 , plan_make_qty = 0
												  FROM itemalter D WITH (NOLOCK)
/*												 WHERE convert(char(10), d.alter_date, 112)   =  replace(:ls_sdate, '-', '')*/
												 where d.alter_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                         group by d.tar_loc, d.tar_item, d.tar_qa
													union all																														 
												  SELECT loc_no     = a.loc_no   
															 , null wc_no
															 , a.item_no
															 , qa         = a.qa   
															 , before_qty = 0
															 , make_qty = 0
															 , ship_qty = sum(isnull(a.rlse_qty,0)) 
															  , jaje_qty = 0															 
															 , ret_qty   = 0   
															 , etc_qty  = 0
                                                           	                 , intemp_qty = 0                          
                                                              	       	      , plan_out_qty = 0
                                                              		           , plan_make_qty = 0
													 FROM ask_det A WITH (NOLOCK)
															LEFT OUTER JOIN ask_head B WITH (NOLOCK) ON a.ask_no = b.ask_no
/*													WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')			*/
													where a.rlse_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )															   
													     and  a.loc_no  is not null
													group by a.loc_no,  /*convert(char(10),a.rlse_date,111)   ,*/ a.item_no, a.qa																												
													   having sum(isnull(a.rlse_qty,0)) <> 0
												 union all														 
											  SELECT  loc_no     = b.ask_loc   
														 , null wc_no                                  
														 , a.item_no
														 , qa         = a.qa   
														 , before_qty = 0
														 , make_qty = sum(isnull(a.rlse_qty,0))
														 , ship_qty = 0
														 , jaje_qty = 0														 
														 , ret_qty   =  0
														 , etc_qty  = 0
                                                                         , intemp_qty = 0       
                                                                         , plan_out_qty = 0
                                                                         , plan_make_qty = 0
											 FROM ask_det A WITH (NOLOCK)
													LEFT OUTER JOIN ask_head B ON a.ask_no = b.ask_no
/*											WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')	*/
											where a.rlse_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
													     and  b.ask_loc   is not  null											
											group by b.ask_loc, /* convert(char(10),a.rlse_date,111)   ,*/ a.item_no,  a.qa                                  
											   having sum(isnull(a.rlse_qty,0)) <> 0											
											union all
										SELECT loc_no     = b.src_loc                         
												 , null wc_no                                              
												 , a.item_no
												 , qa         = a.qa             
												 , before_qty = 0
												 , make_qty = 0
												 , ship_qty = sum( case when substring(a.item_no,4,1) = '1' then (isnull(a.move_qty*a.cnt,0)) else (isnull(a.cnt,0))  end )
												 , jaje_qty = 0
												 , ret_qty   = 0                                                 
												 , etc_qty  = 0
                                                                , intemp_qty = 0       
                                                                , plan_out_qty = 0
                                                                , plan_make_qty = 0
											 FROM itemmovedet A WITH (NOLOCK)  
													LEFT OUTER JOIN itemmove B WITH (NOLOCK) ON a.move_no = b.move_no
/*											WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')	*/
											where b.move_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
										  group by b.src_loc, /*convert(char(10),b.move_date,111),*/a.item_no,a.qa                                         
											union all
										 SELECT loc_no     = b.tar_loc               
												 , null wc_no                                  
												 , a.item_no
												 , qa         = a.qa      
												 , before_qty = 0
												 , make_qty = sum( case when substring(a.item_no,4,1) = '1' then (isnull(a.move_qty*a.cnt,0)) else (isnull(a.cnt,0))  end )
												 , ship_qty = 0
												 , jaje_qty = 0												 
												 , ret_qty   = 0
												 , etc_qty  = 0           
												 , intemp_qty = 0
												 , plan_out_qty = 0
												 , plan_make_qty = 0
										 FROM itemmovedet A WITH (NOLOCK)                 
										 LEFT OUTER JOIN itemmove B ON a.move_no = b.move_no              
/*										WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')	*/
										where b.move_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
										group by b.tar_loc, /*convert(char(10),b.move_date,111)  ,*/ a.item_no, a.qa        
                                                                      union all
                                                                      SELECT loc_no
																 , null wc_no
																, item_no
																, qa
																 , before_qty = 0
																 , make_qty = 0
																 , ship_qty = 0
															      , jaje_qty = 0																 
																 , ret_qty   = 0
																 , etc_qty  = 0                                                                                               
                                                                                     , intemp_qty = sum(isnull(qty ,0))
                                                                                     , plan_out_qty = 0
                                                                                     , plan_make_qty = 0
                                                                    FROM INTEMP WITH(NOLOCK)
/*                                                                    WHERE convert(char(10), intemp_date, 112)   =   replace(:ls_sdate, '-', '')	*/
													where intemp_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                    group by  loc_no, /*convert(char(10),intemp_date,111), */item_no, qa
                                                                    union all
                                                                    select   a.loc_no
                                                                                   , null wc_no
                                                                                 /*  , batchdate  = convert(char(10),b.ret_date,111)*/
                                                                                   , item_no
                                                                                   , qa
                                                   						    , before_qty = 0
															   , make_qty = 0
															   , ship_qty = 0
															   , jaje_qty = 0
															   , ret_qty   = sum(isnull(a.acc_qty,0)+isnull(a.free_qty,0))
															    , etc_qty  = 0                                                                                               
                                                                                   , intemp_qty = 0
                                                                                   , plan_out_qty = 0
                                                                                   , plan_make_qty = 0
                                                                    FROM retdet a WITH(NOLOCK) inner join ret b WITH(NOLOCK) on a.ret_no = b.ret_no
/*                                                                    where convert(char(10), b.ret_date, 112)   =   replace(:ls_sdate, '-', '')		*/
													   where b.ret_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                    group by a.loc_no,/* convert(char(10),b.ret_date,111),*/ item_no, qa
                                                                    union all
                                                                    select   loc_no
                                                                                   , wc_no
                                                                                   , item_no
                                                                                   , qa
                                                                                   , before_qty = 0
                                                                                   , make_qty = sum(isnull(ret_qty,0)) 
                                                                                   , ship_qty = 0
															    , jaje_qty = 0																											  
                                                                                   , ret_qty = 0
                                                                                   , etc_qty = 0                           
                                                                                   , intemp_qty = 0
                                                                                   , plan_out_qty = 0
                                                                                   , plan_make_qty = 0
                                                                  from sfcret WITH(NOLOCK)
/*                                                                  where convert(char(10), ret_date, 112)   =   replace(:ls_sdate, '-', '')*/
												     where ret_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                  group by loc_no, wc_no,/* convert(char(10), ret_date, 111),*/ item_no, qa

                                                                  union all

                                                                SELECT   a.LOC_NO
                                                                                   , WC_NO  = null
                                                                                   , a.ITEM_NO
                                                                                   , a.QA
                                                                                   , before_qty = 0 
																, make_qty   = 0
																, ship_qty   = 0
															     , jaje_qty = 0																
																, ret_qty    = 0
																, etc_qty    = ISNULL(a.QTY,0)
                                                                                    , intemp_qty = 0
                                                                                    , plan_out_qty  = 0
                                                                                    , plan_make_qty = 0
                                                                FROM itemabandet a WITH(NOLOCK) inner join itemaban b WITH(NOLOCK) on a.aban_no = b.aban_no
/*                                                                WHERE convert(char(10), b.aban_date, 112)   =  replace(:ls_sdate, '-', '')	*/
													where b.aban_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
												union all												
												 select     loc_no
												 		  , wc_no = null	
														  , item_no
														  , qa
														  , before_qty = 0 
														  , make_qty   = 0
														  , ship_qty   = 0
														  , jaje_qty = 0														  
														  , ret_qty    = 0
														  , etc_qty    = sum(ISNULL(QTY,0))
														  , intemp_qty = 0
														  , plan_out_qty  = 0
														  , plan_make_qty = 0    
												from etcout WITH(NOLOCK)
/*											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')			*/
											  where etcout_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                  AND ETC_KIND  <= '50'				/*50까지 기타출고유형 */									  
											group by loc_no, item_no, qa
											union all												
												 select     loc_no
												 		  , wc_no = null	
														  , item_no
														  , qa
														  , before_qty = 0 
														  , make_qty   =  sum(ISNULL(QTY,0))
														  , ship_qty   = 0
														  , jaje_qty = 0														  
														  , ret_qty    = 0
														  , etc_qty    =0
														  , intemp_qty = 0
														  , plan_out_qty  = 0
														  , plan_make_qty = 0    
												from etcout WITH(NOLOCK)
/*											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')	*/
											  where etcout_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                 AND ETC_KIND  > '50'				/*50이상 기타입고 유형 */	  
											group by loc_no, item_no, qa											
                                                                /*                
                                                                                      and     b.process_flag   = 'Y'
                                                                                      and     ( ( case when ( b.approve_team is null ) or (b.approve_team = '') then 'N' else 'Y' end ) ) = 'Y'
                                                                */                                                                
                   								 union all
											  SELECT   C.DEF_LOC
														  , A.WC_NO
														  ,  A.ITEM_NO 
														  ,  A.QA
														  ,  before_qty = 0 
														  , make_qty   = 0
														  , ship_qty   = 0
														  , jaje_qty = 0                                                                                                  
														  , ret_qty    = 0
														  , etc_qty    = 0
														  , intemp_qty = 0
														  , plan_out_qty  = 0                                                                                   
														  , plan_make_qty =  sum(isnull(A.ORDER_QTY,0))
												FROM MPSDET A LEFT OUTER JOIN MPSORDER B ON A.mpsorder_order = B.ORDER_NO
																						  INNER JOIN WC C ON A.WC_NO = C.WORK_NO							
										WHERE  convert(char(10), B.ORDER_DATE, 112)   =  :ls_sdate
										GROUP BY C.DEF_LOC, 
																		 A.WC_NO, 
																		 A.ITEM_NO, 
																		 A.QA
                												) a inner join groupitem  b with(nolock) on a.item_no = b.item_no
														           inner join financial_location c with(nolock) on a.loc_no = c.loc_no
									 where rtrim(ltrim(c.area_name)) like :ls_area_name
/*																	 
                                                 where a.item_no = :ls_item_no
			                                    and a.qa = :ls_qa													 									  
*/															
                                          group by   a.loc_no,
											  a.item_no,
											  a.qa                                      
												  
                    );	 
	      
			  

			  
			
			
			//if l_net = 1 then		/*2018.11.01 jowonsuk 기초데이터 업로드 반영 1이면 yes로 반영, 2면 no로 미반영*/  
			
			if ls_sdate = ls_date then
		
					// 전일재고 집계작업
					string ls_loc_no, ls_st_date, LS_GUBUN 
					DECIMAL L_STOCK_QTY
					LONG L_ROW, l_count, i_count
					
					//ls_loc_no = trim(dw_3.object.loc_no[1])
					ls_st_date = MidA(ls_sdate, 1,4) + MidA(ls_sdate, 6,2) + MidA(ls_sdate, 9,2)
					
					if TRIM(ddlb_gubun.TEXT) = '전체' then
						ls_gubun = '%'
					elseif TRIM(ddlb_gubun.TEXT) = '제품' then
						ls_gubun = 'P'
					elseif TRIM(ddlb_gubun.TEXT) = '상품' then
						ls_gubun = 'G'	
					elseif TRIM(ddlb_gubun.TEXT) = '자재' then
						ls_gubun = 'M'	
					elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
						ls_gubun = 'E'		
					end if
					
					DECLARE silsa_cursor CURSOR FOR  
					select  a.loc_no, a.item_no, a.qa, sum(isnull(a.silsa_qty,0)) stock_qty
					from silsa_itemstock a with(nolock) left outer  join  groupitem b with(nolock) on a.item_no = b.item_no
																		left outer join item c with(nolock) on a.item_no = c.item_no and a.qa =c.qa 
												 						inner join financial_location d with(nolock) on a.loc_no = d.loc_no
					WHERE  SUBSTRING(a.ITEM_NO,1,1) LIKE :LS_GUBUN
					AND a.yyyymm = substring(:ls_st_date,1,6)			
					AND ISNULL(A.CLOSE_YN,'O') <> 'O'																		/*재고조정이 되었거나, 마감인거 미진행은 제외*/
					AND c.item_no  is not null
					AND d.area_name like :ls_area_name
					group by a.LOC_NO, a.item_no, a.qa;
						
						
					DEBUGBREAK()
					
					dw_3.accepttext()
					
					// 전일
					//ls_loc_no = dw_3.object.loc_no[1]
					
					ls_area_name = trim(ddlb_area_name.text)
					
					if ls_area_name  = '전체' then
						ls_area_name = '%'
					else
						ls_area_name = ls_area_name
					end if
					
					
					if TRIM(ddlb_gubun.TEXT) = '전체' then
						ls_gubun = '%'
					elseif TRIM(ddlb_gubun.TEXT) = '제품' then
						ls_gubun = 'P'
					elseif TRIM(ddlb_gubun.TEXT) = '상품' then
						ls_gubun = 'G'	
					elseif TRIM(ddlb_gubun.TEXT) = '자재' then
						ls_gubun = 'M'	
					elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
						ls_gubun = 'E'		
					end if
					
				
		
			
					OPEN silsa_cursor;
				
					FETCH silsa_cursor INTO :ls_loc_no, :ls_ITEM_NO, :ls_QA, :L_STOCK_QTY;
					
					Do While sqlca.sqlcode = 0
					
							l_count = 0

							
							select  count(*)
								 into :l_count
								from item_stock
							where loc_no = :ls_loc_no
								and item_no = :ls_item_no
								  and qa  = :ls_qa
								and stock_date = :ls_st_date;
								  
							
							if l_count > 0 then
								
								update item_stock
									 set before_qty = 0,
										  in_qty        = 0,
										  out_qty     = 0,
										  intemp_qty = 0,
										  ret_qty        = 0,
										  etc_qty       = 0,
										  stock_qty = :L_STOCK_QTY,				
										  sysdate  = getdate()
								where loc_no    = :ls_loc_no
									and item_no = :ls_item_no
									and qa  		= :ls_qa
									and stock_date = :ls_st_date;		
								
							else
							
								 insert into item_stock (loc_no,        item_no,        qa,       stock_date, before_qty, in_qty, out_qty, intemp_qty, ret_qty, etc_qty,                 stock_qty,              stock_m_qty, gab_qty,  sysdate )	
									 VALUES (             :ls_loc_no,  :ls_item_no,   :ls_qa,       :ls_st_date,                 0,        0,           0,                 0,          0,          0,               :L_STOCK_QTY,                     0,           0,   getdate() );
						
							end if
							
								
							FETCH silsa_cursor INTO :ls_loc_no, :ls_ITEM_NO, :ls_QA, :L_STOCK_QTY;
						
							i_count = i_count + 1;
						
					Loop
					CLOSE silsa_cursor;
							  
					
			end if

end subroutine

public subroutine wf_silsa_check (string ls_loc_no, string ls_item_no, string ls_qa);
/* 실사누락 자동 조정        */
/*2022-01-19 jowonsuk */

// 전일재고 집계작업
string  ls_area,  ls_sdate, ls_edate,  ls_errtext, ls_defno, ls_date
string  ls_locno, ls_itemno, ls_savestock, ls_userid, ls_item_name
decimal ld_bqty,  ld_rqty,  ld_iqty,   ld_retqty,  ld_etcqty, ld_qoh, ld_safetystock
long    ll_row,   ll_cnt,   ll_icnt,   ll_ucnt

datetime ld_date

DEBUGBREAK()

dw_3.accepttext()

// 전일
ls_sdate = string(date(em_1.text), "yyyymm")

ls_locno = dw_3.object.loc_no[1]

select item_name
into :ls_item_name
from groupitem
where item_no = :ls_item_no;

if MessageBox("확인", ls_sdate + "일["+  ls_item_name + "] 제품 erp재고 조정~n~r" + " 작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then

		insert into inaudit ( inaudit_time,           inaudit_date, 		  inaudit_item,            qa,                  loc_no,		            inaudit_type,                  order_no,                 rcpt_qty,      issue_qty,       cost,    destination,                     rem,              user_id )
		(
				  select getdate() inaudit_time, 
								dateadd(day, -1, dateadd(month, 1, convert(datetime, a.yyyymm+'01 00:00:00') ) ) inaudit_date, 
								a.item_no inaudit_item, 
								a.qa, 
								a.loc_no,
								 ( case when ISNULL(a.silsa_qty,0) - isnull(a.inaudit_qty,0) > 0 then 'RX' 
														 when ISNULL(a.silsa_qty,0) - isnull(a.inaudit_qty,0) <  0 then 'IX' 
														else '' end ) inaudit_type,
								 'RXIX'+ a.yyyymm  order_no,
								 ( case when ISNULL(a.silsa_qty,0) - isnull(a.inaudit_qty,0) > 0 then  abs(ISNULL(a.silsa_qty,0) -  isnull(a.inaudit_qty,0)) else  0 end ) rcpt_qty,
								 ( case when ISNULL(a.silsa_qty,0) - isnull(a.inaudit_qty,0) < 0 then  abs(ISNULL(a.silsa_qty,0) -  isnull(a.inaudit_qty,0)) else  0 end ) issue_qty,
								 0 cost,
								 a.loc_no destination,
								 'erp재고조정' rem,
								 '1999010s' user_id
				  from
				  (          
							select  a.loc_no, rtrim(ltrim(a.yyyymm)) yyyymm, a.item_no, a.qa, a.silsa_qty, dbo.silsa_stock_qty( a.yyyymm,  a.loc_no, a.item_no, a.qa) inaudit_qty
							from
						  (          
										select loc_no, yyyymm, item_no, qa, silsa_qty
										from silsa_itemstock
										where yyyymm between '201801' and :ls_sdate
										 and ISNULL(CLOSE_YN,'O') <> 'O'
										 and loc_no = :ls_locno
		                         and item_no = :ls_item_no
		                         and qa = :ls_qa
						  ) a          
				  ) a      
				  where a.silsa_qty <> a.inaudit_qty
		);
						  
		commit;

		MessageBox("확인", "[" + ls_item_name + "] erp재고 조정 완료!!!" )
			
end if



end subroutine

on w_iitemstock_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_fld=create ddlb_fld
this.st_7=create st_7
this.dw_area=create dw_area
this.cbx_o08=create cbx_o08
this.cbx_o09=create cbx_o09
this.gb_4=create gb_4
this.gb_6=create gb_6
this.pb_1=create pb_1
this.st_6=create st_6
this.pb_ewol=create pb_ewol
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_3=create st_3
this.cbx_op=create cbx_op
this.dw_6=create dw_6
this.cbx_user=create cbx_user
this.cbx_all=create cbx_all
this.hpb_1=create hpb_1
this.st_1=create st_1
this.ddlb_gubun=create ddlb_gubun
this.cbx_cqty=create cbx_cqty
this.cbx_qoh=create cbx_qoh
this.pb_2=create pb_2
this.cb_4=create cb_4
this.st_2=create st_2
this.ddlb_grade=create ddlb_grade
this.st_5=create st_5
this.ddlb_not_out=create ddlb_not_out
this.st_8=create st_8
this.cb_6=create cb_6
this.ddlb_area_name=create ddlb_area_name
this.st_9=create st_9
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_0=create rb_0
this.rb_6=create rb_6
this.cbx_1=create cbx_1
this.cb_7=create cb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_op
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.dw_area
this.Control[iCurrent+14]=this.cbx_o08
this.Control[iCurrent+15]=this.cbx_o09
this.Control[iCurrent+16]=this.gb_4
this.Control[iCurrent+17]=this.gb_6
this.Control[iCurrent+18]=this.pb_1
this.Control[iCurrent+19]=this.st_6
this.Control[iCurrent+20]=this.pb_ewol
this.Control[iCurrent+21]=this.dw_4
this.Control[iCurrent+22]=this.dw_5
this.Control[iCurrent+23]=this.st_3
this.Control[iCurrent+24]=this.cbx_op
this.Control[iCurrent+25]=this.dw_6
this.Control[iCurrent+26]=this.cbx_user
this.Control[iCurrent+27]=this.cbx_all
this.Control[iCurrent+28]=this.hpb_1
this.Control[iCurrent+29]=this.st_1
this.Control[iCurrent+30]=this.ddlb_gubun
this.Control[iCurrent+31]=this.cbx_cqty
this.Control[iCurrent+32]=this.cbx_qoh
this.Control[iCurrent+33]=this.pb_2
this.Control[iCurrent+34]=this.cb_4
this.Control[iCurrent+35]=this.st_2
this.Control[iCurrent+36]=this.ddlb_grade
this.Control[iCurrent+37]=this.st_5
this.Control[iCurrent+38]=this.ddlb_not_out
this.Control[iCurrent+39]=this.st_8
this.Control[iCurrent+40]=this.cb_6
this.Control[iCurrent+41]=this.ddlb_area_name
this.Control[iCurrent+42]=this.st_9
this.Control[iCurrent+43]=this.rb_1
this.Control[iCurrent+44]=this.rb_2
this.Control[iCurrent+45]=this.rb_3
this.Control[iCurrent+46]=this.rb_4
this.Control[iCurrent+47]=this.rb_5
this.Control[iCurrent+48]=this.rb_0
this.Control[iCurrent+49]=this.rb_6
this.Control[iCurrent+50]=this.cbx_1
this.Control[iCurrent+51]=this.cb_7
end on

on w_iitemstock_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_fld)
destroy(this.st_7)
destroy(this.dw_area)
destroy(this.cbx_o08)
destroy(this.cbx_o09)
destroy(this.gb_4)
destroy(this.gb_6)
destroy(this.pb_1)
destroy(this.st_6)
destroy(this.pb_ewol)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.cbx_op)
destroy(this.dw_6)
destroy(this.cbx_user)
destroy(this.cbx_all)
destroy(this.hpb_1)
destroy(this.st_1)
destroy(this.ddlb_gubun)
destroy(this.cbx_cqty)
destroy(this.cbx_qoh)
destroy(this.pb_2)
destroy(this.cb_4)
destroy(this.st_2)
destroy(this.ddlb_grade)
destroy(this.st_5)
destroy(this.ddlb_not_out)
destroy(this.st_8)
destroy(this.cb_6)
destroy(this.ddlb_area_name)
destroy(this.st_9)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_0)
destroy(this.rb_6)
destroy(this.cbx_1)
destroy(this.cb_7)
end on

event open;call super::open;//=============================================================================================
// 반품증 없이 입고되는 품목(보관, 정상반품) 들에 대한 업무정의가 되어야 함
//=============================================================================================
// SYSTEM Schedule JOB 03:00 AM SQL Agent 실행

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

hpb_1.visible = false
//cb_4.visible  = false			// 재고이력



if GF_PERMISSION("일수불관리[일수불집계]", gs_userid) = "Y" then	
/*	pb_3.visible = true	앞으로 안씀*/ 
	st_9.visible = true
	ddlb_area_name.visible = true
	pb_ewol.visible = true
	pb_2.visible = true
	st_8.visible = true
	ddlb_area_name.visible = true		
	rb_0.visible = false
	rb_1.visible = false
	rb_2.visible = false
	rb_3.visible = false
	rb_4.visible = false
	rb_5.visible = false		
	rb_6.visible = false		
else
/*	pb_3.visible = false  앞으로 안씀*/ 
	st_9.visible = false
	ddlb_area_name.visible = false
	pb_ewol.visible = false
	pb_2.visible = false	
	st_8.visible = false
	ddlb_area_name.visible = false		
	rb_0.visible = true
	rb_1.visible = true
	rb_2.visible = true
	rb_3.visible = true
	rb_4.visible = true
	rb_5.visible = true		
	rb_6.visible = true	
	rb_0.Y = 292
	rb_1.Y = 292	
	rb_2.Y = 292		
	rb_3.Y = 292			
	rb_4.Y = 292			
	rb_5.Y = 292			
	rb_6.Y = 292			
end if

//if GF_PERMISSION("일수불관리[기초데이터업로드]", gs_userid) = "Y" then	
//	st_9.visible = true
//	ddlb_area_name.visible = true
////	pb_2.visible = true
//	st_8.visible = true
//	ddlb_area_name.visible = true		
//else
//	st_9.visible = false
//	ddlb_area_name.visible = false	
//	pb_2.visible = false	
//	st_8.visible = false
//	ddlb_area_name.visible = false	
//end if

em_1.text = string(today(), 'yyyy/mm/dd')

dw_2.visible = false			// 전일재고
dw_4.visible  = false 			// 가용량보기
dw_5.visible  = false 			// 상세보기
dw_6.visible  = false 			// 출고예정

dw_4.SetTransObject(sqlca)		// 가용량
dw_5.SetTransObject(sqlca)		// 상세보기
dw_6.SetTransObject(sqlca)		// 출고예정
ddlb_gubun.text = '전체'
ddlb_grade.text = '전체'
ddlb_area_name.text = '전체'
ddlb_not_out.text = '조회안함'

// 분류
//dw_1.getchild("save_stock", idwc_stock)
//idwc_stock.settransobject(sqlca)
//idwc_stock.retrieve("SAVE_STOCK")

//dw_1.object.user_id.TabSequence = 0 		// 담당자
//dw_1.object.save_stock.TabSequence = 0		// 분류
//dw_1.object.safety_stock.TabSequence = 0	// 안전재고

/////////////////////////////////
// 사업장
/////////////////////////////////
//dw_area.settransobject(sqlca)
//dw_area.insertrow(0)  
//dw_area.object.area[1] = " "

//dw_area.getchild("area", idwc_area)
//idwc_area.setredraw(false)
//idwc_area.settransobject(sqlca)
//idwc_area.insertrow(1)
//idwc_area.setitem(1, 'area_no', ' ')
//idwc_area.setitem(1, 'area_name', '전체사업장')

//idwc_area.accepttext()
//idwc_area.setredraw(false)

//dw_area.object.area[1] = gs_area		// 기본값을 변경	
//dw_area.accepttext()

/////////////////////////////////
// 저장소
/////////////////////////////////
dw_3.SetTransObject(sqlca)		
dw_3.insertrow(0)  
dw_3.object.loc_no[1] = " "

dw_3.getchild("loc_no", idwc_locno)
idwc_locno.setredraw(false)
idwc_locno.settransobject(sqlca)
idwc_locno.insertrow(1)
idwc_locno.setitem(1, 'loc_no', ' ')
idwc_locno.setitem(1, 'loc_name', '전체저장소')

idwc_locno.accepttext()
idwc_locno.setredraw(false)

dw_3.object.loc_no[1] = " "		// 기본값을 변경	
dw_3.accepttext()

////////////////////////////////////////////////////////////
//// 기본사업장에 다수의 저장소 존재시(기본저장소)			
////////////////////////////////////////////////////////////
string ls_area, ls_locno, ls_loc
//
//ls_area = gs_area
//
//SELECT rtrim(bigo) INTO :ls_loc FROM codemst 
// WHERE type = '사업장기본저장소' AND item_cd = :gs_userid AND use_yn = 'Y';
//if isnull(ls_loc) OR ls_loc = "" then
//	
//	SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :ls_area;
//	
//	if isnull(ls_loc) or ls_loc = "" then ls_loc = "WS00000000"		// 시화저장소
//	
//end if
//
//idwc_locno.setfilter( "area_no = '" + gs_area + "'" )
//idwc_locno.filter()

ls_loc = 'WS00000000'
dw_3.object.loc_no[1] = ls_loc
dw_3.accepttext()
//////////////////////////////////////////////////////////	

cbx_all.enabled   = false			// 전체품목
cbx_user.enabled  = false			// 담당자변경
//cbx_savestock.enabled = false  	// 분류/안전재고
cbx_qoh.enabled   = false  		// 전산재고 => 실사재고 반영
cbx_cqty.enabled  = false        // 실사재고 => 전산재고 반영

//pb_ewol.enabled   = false 			// 전일재고 집계작업
pb_save.enabled   = false 			// 저장
pb_delete.enabled = false 			// 삭제

// 배치재고_관리
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '배치재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" OR ls_locno = ls_loc then
	cbx_user.enabled  = true		// 담당자변경
//	cbx_savestock.enabled = true  // 분류/안전재고
	cbx_qoh.enabled   = true  		// 전산재고 => 실사재고 반영
	cbx_cqty.enabled  = true  		// 실사재고 => 전산재고 반영
	
//	pb_ewol.enabled   = true 		// 전일재고 집계작업
	pb_save.enabled   = true 		// 저장
	pb_delete.enabled = true 		// 삭제
end if	



end event

event resize;call super::resize;//
//gb_5.width  = newwidth  - (gb_5.x * 2)

//hpb_1.width = newwidth  - (gb_5.x * 2)

//gb_6.width  = newwidth  - (gb_5.x * 2)

dw_1.width  = newwidth - 50
dw_1.height = newheight - dw_1.y

gb_6.width = dw_1.width

// 전일재고 집계(±7일)
dw_2.x      = dw_1.x
dw_2.y      = dw_1.y
dw_2.width  = dw_1.width
dw_2.height = dw_1.height

// 가용량
dw_4.width  = dw_1.width * 0.5
dw_4.height = dw_1.height* 0.9
dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
dw_4.y      = dw_1.y

// 상세보기
dw_5.x      = dw_4.x
dw_5.y      = dw_4.y
dw_5.width  = dw_4.width
dw_5.height = dw_4.height

// 출고예정
dw_6.x      = dw_4.x
dw_6.y      = dw_4.y
dw_6.width  = dw_4.width
dw_6.height = dw_4.height

end event

type pb_save from w_inheritance`pb_save within w_iitemstock_r
boolean visible = false
integer x = 5157
integer y = 72
integer taborder = 80
boolean enabled = false
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_locno, ls_iodate, ls_iotype, ls_itemno, ls_qa, ls_io, ls_bigo, ls_custno, ls_errtext
string  ls_area, ls_defno, ls_userid, ls_sdate

long    ll_row, ll_rowsave, ll_qty, ll_ucnt
decimal ld_rcptqty, ld_issueqty, ld_tcqty, ld_tqoh

if GF_Permission( "배치재고_관리", gs_userid ) = "Y" then
else
	MessageBox("확인", "배치재고_관리 권한이 존재하지 않습니다.")
	RETURN
end if

dw_1.accepttext()
dw_3.accepttext()
dw_area.accepttext()

ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]
ls_sdate = em_1.text

//////////////////////////////////////////////////////////////////////////
// 담당자 변경
//////////////////////////////////////////////////////////////////////////
if cbx_user.checked = true then
	if dw_1.FilteredCount() > 0 then	
		for ll_row = 1 to dw_1.rowcount()
			ls_userid = dw_1.object.user_id[ll_row]
			ls_itemno = dw_1.object.item_no[ll_row]
			ls_qa     = dw_1.object.qa[ll_row]
			
			if isnull(ls_userid) OR ls_userid = "" then
			else
				UPDATE item_batchstock
				   SET user_id    = :ls_userid, rem = '담당자변경'
				 WHERE loc_no     = :ls_locno AND batchdate >= :ls_sdate	AND item_no = :ls_itemno AND qa = :ls_qa;
				if sqlca.sqlcode <> 0 then
					ls_errtext = SQLCA.SQLErrText
					rollback;
					MessageBox("확인","담당자변경 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)
					RETURN
				else
					ll_ucnt = ll_ucnt + 1
					COMMIT;
				end if						 
			end if
		next
		
		// 필터해지
		cb_2.triggerevent( clicked! )
	else
		MessageBox("확인","담당자 변경작업은 해당하는 담당자만 필터링한 후 저장 하시기 바랍니다.")
	end if

	dw_1.object.user_id.TabSequence = 0 		// 담당자
	cbx_user.checked = false
	RETURN
end if
//////////////////////////////////////////////////////////////////////////

SELECT bigo INTO :ls_defno FROM codemst 
 WHERE type = '배치재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_defno = "ALL" then
else
	if ls_locno = ls_defno then
	else
		MessageBox("확인", "배치재고_관리 의 저장소가 다르면 저장할 수 없습니다.")
		RETURN
	end if
end if

ld_tcqty = dw_1.object.tcqty[1] 
ld_tqoh  = dw_1.object.tqoh[1] 
if ld_tcqty <> ld_tqoh then
	MessageBox("확인", "전산재고: " + string(ld_tcqty,"#,##0") + " 와~n~n   현재고: " + string(ld_tqoh,"#,##0") + &
	           " 는~n~n~n일치해야 저장할 수 있습니다.")
	RETURN
end if

if MessageBox("확인", "저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
	//
	WF_Update1(dw_1, "Y")
end if

// 전산재고=> 실사재고 반영
if cbx_qoh.checked = true       then cbx_qoh.checked = false
// 실사재고=> 전산재고 반영
if cbx_cqty.checked = true      then cbx_cqty.checked = false
// 분류/안전재고
//if cbx_savestock.checked = true then cbx_savestock.checked = false

pb_retrieve.triggerevent( clicked! )

end event

type dw_1 from w_inheritance`dw_1 within w_iitemstock_r
integer x = 32
integer y = 432
integer width = 4718
integer height = 1920
integer taborder = 110
string dataobject = "d_iitemstock_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rbuttondown;call super::rbuttondown;m_manager manager
string ls_itemnm, ls_itemno, ls_qa, ls_s_date, ls_e_date
string ls_sdate, ls_locno, ls_gubun, ls_locname, ls_grade
long   ll_row = 0, ll_out_gigan
gs_where lst_where
	
ls_locno = trim(dw_3.object.loc_no[1])
if ls_locno = "" then
	ls_locno = "%"

end if
	
	
manager = CREATE m_manager

ls_grade = trim(ddlb_grade.text)

if ls_grade = '성형류' then	
	manager.m_itemstock.m_paint_sale.visible = false
elseif ls_grade = '도료류' then	 /*2019.07.22 jowonsuk 도료류 추가*/
	manager.m_itemstock.m_paint_sale.visible = true
else
	manager.m_itemstock.m_paint_sale.visible = false
end if

manager.m_itemstock.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())

choose case gs_print_control
	case 'item_paint_sale'				
		
		if isnull(row) OR row < 1 then RETURN
		
		ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)
		
		ls_locno = trim(dw_3.object.loc_no[1])
		
		if ls_locno = "" then
			ls_locno = "%"
		end if
		
		ls_locno = trim(dw_1.object.loc_no[row])
		ls_itemno = dw_1.object.item_no[row]
		ls_qa     = dw_1.object.qa[row]		
		ls_itemnm = dw_1.object.item_name[row]
		
		
		lst_where.str1 = ls_itemno
		lst_where.str2 = ls_qa
		lst_where.str3 = ls_locno
//		lst_where.str4 = mid(ls_sdate,1,4)+'/'+mid(ls_sdate,5,2) + '/' +  mid(ls_sdate,7,2) // 시작
		lst_where.str4 = MidA(ls_sdate,1,4)+'/'+MidA(ls_sdate,5,2) + '/' +  '01'  // 시작
		lst_where.str5 = MidA(ls_sdate,1,4)+'/'+MidA(ls_sdate,5,2) + '/' +  MidA(ls_sdate,7,2)  // 종료
		
		lst_where.name = ls_itemnm
		lst_where.chk  = "DO"
		
		OpenWithParm(w_whinaudit_w, lst_where)
		w_whinaudit_w.WindowState = Normal!
		lst_where = Message.PowerObjectParm		
	
	case 'item_generate'
		
		ls_itemno = dw_1.object.item_no[row]		
		ls_qa     = dw_1.object.qa[row]
	     ls_locno = trim(dw_1.object.loc_no[row])
		
		wf_item_stock_generate(ls_locno, ls_itemno, ls_qa)
		
//	case 'erp_silsa_check'		
//		
//		ls_itemno = dw_1.object.item_no[row]		
//		ls_qa     = dw_1.object.qa[row]
//	     ls_locno = trim(dw_1.object.loc_no[row])
//		
//		wf_silsa_check(ls_locno, ls_itemno, ls_qa)		
		
	case 'item_research'
		
		/* 2018.08.29 jowonsuk   d_iitemstock_m1
		dw_4.width  = dw_1.width * 0.51
		dw_4.height = dw_1.height* 0.9
		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
		dw_4.y      = dw_1.y		
		*/
		
		/* 2018.08.29 jowonsuk d_iitemstock_m1_new		*/		
		dw_4.width  = dw_1.width *0.8
		dw_4.height = dw_1.height * 0.9
		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
		dw_4.y      = dw_1.y		

		if isnull(row) OR row < 1 then RETURN
		
		ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)
		
		ls_locno = trim(dw_1.object.loc_no[row])
		
		if ls_locno = "" then
			ls_locno = "%"
		end if
		
		if TRIM(ddlb_gubun.TEXT) = '전체' then
			ls_gubun = '%'
		elseif TRIM(ddlb_gubun.TEXT) = '제품[자재제외]' then
			ls_gubun = '%'			
		elseif TRIM(ddlb_gubun.TEXT) = '제품' then
			ls_gubun = 'P'
		elseif TRIM(ddlb_gubun.TEXT) = '상품' then
			ls_gubun = 'G'	
		elseif TRIM(ddlb_gubun.TEXT) = '자재' then
			ls_gubun = 'M'	
		elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
			ls_gubun = 'E'		
		end if
		
		ls_locno = trim(dw_1.object.loc_no[row])
		ls_locname = dw_1.object.loc_name[row]
		ls_itemno = dw_1.object.item_no[row]
		ls_itemnm = dw_1.object.item_name[row]
		ls_qa     = dw_1.object.qa[row]
		
		dw_4.dataobject = 'd_iitemstock_m1_new' /*신규 장표 2018.08.29 jowonsuk */
		dw_4.SetTransObject(sqlca)	
		
		dw_4.reset()
		dw_4.title = "품목 일일수불 확인: [" + ls_locname+ "] " + ls_itemnm + " | " + ls_qa
		
		dw_4.setredraw( false )
		dw_4.visible    = true 
		dw_4.bringtotop = true
		dw_4.retrieve(ls_gubun, ls_locno, ls_sdate, ls_itemno, ls_qa)
		dw_4.setredraw( true )	
		
	case 'item_inaudit_research'
		
		dw_4.width  = dw_1.width * 0.51
		dw_4.height = dw_1.height* 0.9
		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
		dw_4.y      = dw_1.y		
		
		if isnull(row) OR row < 1 then RETURN
		
		ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)
		
		ls_locno = trim(dw_1.object.loc_no[row])
		
		if ls_locno = "" then
			ls_locno = "%"
		end if
		
		if TRIM(ddlb_gubun.TEXT) = '전체' then
			ls_gubun = '%'
		elseif TRIM(ddlb_gubun.TEXT) = '제품[자재제외]' then
			ls_gubun = '%'			
		elseif TRIM(ddlb_gubun.TEXT) = '제품' then
			ls_gubun = 'P'
		elseif TRIM(ddlb_gubun.TEXT) = '상품' then
			ls_gubun = 'G'	
		elseif TRIM(ddlb_gubun.TEXT) = '자재' then
			ls_gubun = 'M'	
		elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
			ls_gubun = 'E'		
		end if
		
		ls_locname = dw_1.object.loc_name[row]
		ls_itemno = dw_1.object.item_no[row]
		ls_itemnm = dw_1.object.item_name[row]
		ls_qa     = dw_1.object.qa[row]
		
		dw_4.dataobject = 'd_iractio_day_new'
		dw_4.SetTransObject(sqlca)	
		
		dw_4.reset()
		dw_4.title = "품목 ERP수불 확인: [" + ls_locname+ "] " + ls_itemnm + " | " + ls_qa
		
		dw_4.setredraw( false )
		dw_4.visible    = true 
		dw_4.bringtotop = true
		dw_4.retrieve(ls_gubun, ls_locno, ls_sdate, ls_itemno, ls_qa)
		dw_4.setredraw( true )			
		
	case 'sale_search'		
		
		dw_4.width  = dw_1.width * 0.52
		dw_4.height = dw_1.height* 0.8
		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
		dw_4.y      = dw_1.y		
		
		
		if isnull(row) OR row < 1 then RETURN
		
		ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)

		
		if  trim(ddlb_not_out.text) = '조회안함' then
			ll_out_gigan = -30					/*우클릭시 조희는 기본 -30일 */
		else
			ll_out_gigan = long(LeftA(ddlb_not_out.text,2))*-1
		end if
		
		ls_locno = trim(dw_1.object.loc_no[row])
		ls_locname = dw_1.object.loc_name[row]
		ls_itemno = dw_1.object.item_no[row]
		ls_itemnm = dw_1.object.item_name[row]
		ls_qa     = dw_1.object.qa[row]
		
		
		select top 1 convert(char(8), dateadd(day, :ll_out_gigan, :ls_sdate),112), convert(char(8), convert(datetime, :ls_sdate,111), 112)
		    into :ls_s_date, :ls_e_date
		from login;
		
		
		dw_4.dataobject =  'd_whsale_w1'
		dw_4.SetTransObject(sqlca)	
				
		dw_4.reset()
		dw_4.title = "수주별 미출고량  확인: [" + ls_locname+ "] " + ls_itemnm + " | " + ls_qa
		
		dw_4.setredraw( false )
		dw_4.visible    = true 
		dw_4.bringtotop = true
				
		dw_4.retrieve( ls_locno, ls_s_date,  ls_e_date, ls_itemno, ls_qa )
				
		dw_4.setredraw( true )
		
	case 'planout_search'		
		
		// 가용량
//		dw_4.width  = dw_1.width * 0.4
//		dw_4.height = dw_1.height* 0.8
		dw_4.width  = dw_1.width * 0.84
		dw_4.height = dw_1.height* 0.8
		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
		dw_4.y      = dw_1.y		
		
		
		if isnull(row) OR row < 1 then RETURN
		
		ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)
		
		ls_locno = trim(dw_3.object.loc_no[1])
		
		if ls_locno = "" then
			ls_locno = "%"
		end if
		
		ls_locno = trim(dw_1.object.loc_no[row])
		ls_locname = dw_1.object.loc_name[row]
		ls_itemno = dw_1.object.item_no[row]
		ls_itemnm = dw_1.object.item_name[row]
		ls_qa     = dw_1.object.qa[row]
		
		
		//dw_4.dataobject =  'd_itemstock_planout_r'
		dw_4.dataobject =  'd_silsa_oiissuereq_r'
		dw_4.SetTransObject(sqlca)	
				
		dw_4.reset()
		dw_4.title = "수주별 출고예정량  확인: " + ls_itemnm + " | " + ls_qa
		
		dw_4.setredraw( false )
		dw_4.visible    = true 
		dw_4.bringtotop = true
				
		dw_4.retrieve(ls_locno, ls_sdate,  ls_itemno, ls_qa )
						
		dw_4.setredraw( true )		
		
	case 'item_stock_end'	
		
	case 'item_inaudit_history'
				
		if isnull(row) OR row < 1 then RETURN
		
		ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)
		
		ls_locno = trim(dw_3.object.loc_no[1])
		
		if ls_locno = "" then
			ls_locno = "%"
		end if
		
		ls_locno = trim(dw_1.object.loc_no[row])
		ls_itemno = dw_1.object.item_no[row]
		ls_qa     = dw_1.object.qa[row]		
		ls_itemnm = dw_1.object.item_name[row]
		
		
		lst_where.str1 = ls_itemno
		lst_where.str2 = ls_qa
		lst_where.str3 = ls_locno
//		lst_where.str4 = mid(ls_sdate,1,4)+'/'+mid(ls_sdate,5,2) + '/' +  mid(ls_sdate,7,2) // 시작
		lst_where.str4 = MidA(ls_sdate,1,4)+'/'+MidA(ls_sdate,5,2) + '/' +  '01'  // 시작
		lst_where.str5 = MidA(ls_sdate,1,4)+'/'+MidA(ls_sdate,5,2) + '/' +  MidA(ls_sdate,7,2)  // 종료
		
		lst_where.name = ls_itemnm
		lst_where.chk  = "DO"
		
		OpenWithParm(w_whinaudit_w, lst_where)
		w_whinaudit_w.WindowState = Normal!
		lst_where = Message.PowerObjectParm

end choose







end event

event dw_1::itemchanged;call super::itemchanged;choose case dwo.name
	case "stock_qty", "ret_qty", "etc_qty"
		this.SelectText(1, LenA(this.GetText()) + 5)
end choose
end event

type st_title from w_inheritance`st_title within w_iitemstock_r
integer x = 41
integer y = 48
integer width = 1061
string text = "일수불현황관리"
end type

type st_tips from w_inheritance`st_tips within w_iitemstock_r
end type

type pb_compute from w_inheritance`pb_compute within w_iitemstock_r
boolean visible = false
integer x = 5129
integer y = 552
integer height = 88
integer taborder = 190
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_iitemstock_r
boolean visible = false
integer x = 4933
integer y = 552
integer height = 88
integer taborder = 70
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_iitemstock_r
integer x = 5349
integer y = 76
integer taborder = 210
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iitemstock_r
integer x = 5161
integer y = 76
integer taborder = 240
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then RETURN

debugbreak()

//dw_1.getchild("save_stock", idwc_stock)
//idwc_stock.settransobject(sqlca)
//idwc_stock.retrieve("SAVE_STOCK")



// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4


gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=77'	


l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 배치재고 리스트를 출력합니다." 

OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

w_print.dw_1.object.t_3.text = '(조회일자:' + MidA(em_1.text, 1,4)  +'.'+ MidA(em_1.text, 6,2) + '.' + MidA(em_1.text, 9,2) + ')' 			
w_print.dw_1.object.t_3.page_1.visible = true

end event

type pb_cancel from w_inheritance`pb_cancel within w_iitemstock_r
boolean visible = false
integer x = 5326
integer y = 552
integer height = 88
integer taborder = 280
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_iitemstock_r
boolean visible = false
integer x = 5353
integer y = 68
integer taborder = 310
boolean enabled = false
end type

event pb_delete::clicked;call super::clicked;// 삭제
string ls_locno, ls_itemname, ls_itemno, ls_qa, ls_errtext
long   ll_row

if dw_1.rowcount() < 1 then return	

dw_3.accepttext()
dw_1.accepttext()

ll_row = dw_1.getrow()

ls_locno    = dw_3.object.loc_no[1]
ls_itemname = dw_1.object.item_name[ll_row]
ls_itemno   = dw_1.object.item_no[ll_row]
ls_qa       = dw_1.object.qa[ll_row]

if MessageBox("확인",ls_itemname + " 품목의 " + ls_qa + " 규격품을~n~n삭제하시겠습니까?",information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.scrolltorow( ll_row )
//dw_1.deleterow( ll_row )
//wf_update1(dw_1,"Y")

DELETE item_batchstock 
 WHERE loc_no = :ls_locno AND item_no = :ls_itemno AND qa = :ls_qa;
if sqlca.sqlcode <> 0 then
	ls_errtext = SQLCA.SQLErrText
	rollback;
	MessageBox("확인","배치재고(item_batchstock) 삭제 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)
	RETURN
else
	COMMIT;
	dw_1.deleterow( ll_row )
end if		

end event

type pb_insert from w_inheritance`pb_insert within w_iitemstock_r
boolean visible = false
integer x = 1353
integer y = 76
integer taborder = 340
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iitemstock_r
integer x = 4800
integer y = 76
integer taborder = 330
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_locno, ls_sdate, ls_year, ls_month, ls_defno, ls_mindate, ls_gubun, ls_grade, ls_sale_group[], ls_sale_grouup_retrieve
string ls_itemno = "%", ls_qa = "%",  ls_rall, ls_iall,  ls_ralls[7], ls_ialls[9], ls_ritype, ls_rtype, ls_itype
long   ll_row, ll_cnt,  ll_iX, ll_out_gigan

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


GF_DW2UnFilter( dw_1 )

dw_3.accepttext()			// 저장소
dw_area.accepttext()


dw_1.SetTransObject( SQLCA)

ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)

ls_locno = trim(dw_3.object.loc_no[1])
if ls_locno = "" then
	ls_locno = "%"
end if


if TRIM(ddlb_gubun.TEXT) = '전체' then
	ls_gubun = '%'
elseif TRIM(ddlb_gubun.TEXT) = '전체[자재제외]' then
	ls_gubun = '%'	
elseif TRIM(ddlb_gubun.TEXT) = '제품' then
	ls_gubun = 'P'
elseif TRIM(ddlb_gubun.TEXT) = '상품' then
	ls_gubun = 'G'	
elseif TRIM(ddlb_gubun.TEXT) = '자재' then
	ls_gubun = 'M'	
elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
	ls_gubun = 'E'		
end if

if trim(ddlb_not_out.text) = '조회안함' then 
 	ll_out_gigan = 1							/*조희를 안하게 값을 오늘 보다 1 + */
else
	ll_out_gigan = long(LeftA(ddlb_not_out.text,2))*-1
end if


if rb_6.checked  then
	ls_sale_group = {'0000', '0100','0200','0300','0400','9999'}		/*'0000' 제외 */
elseif rb_0.checked  then
	ls_sale_group = {'0100','0200','0300','0400','9999'}
else
	
	if rb_1.checked then
		ls_sale_grouup_retrieve = '0300'
	elseif rb_2.checked then
		ls_sale_grouup_retrieve = '0200'	
	elseif rb_3.checked then
		ls_sale_grouup_retrieve = '0400'		
	elseif rb_4.checked then
		ls_sale_grouup_retrieve = '0100'		
	elseif rb_5.checked then
		ls_sale_grouup_retrieve = '9999'						
	end if
	
	ls_sale_group = {ls_sale_grouup_retrieve}
end if

 
SELECT TOP 1 A.STOCK_DATE INTO :LS_MINDATE
FROM item_stock a 
 WHERE a.loc_no like :ls_locno 
ORDER BY  a.stock_date ASC;
 
if ls_sdate < ls_mindate then 
	MessageBox("확인", "저장소의 기초재고 일자(" + ls_mindate + ")~n~n이전 자료는 조회할 수 없습니다.")
	RETURN
end if


dw_1.visible = true
dw_1.reset()
is_dw = "dw_1"
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

////////////////////////////////////////////////////////////////////
dw_1.SetRedraw(FALSE)

dw_1.retrieve( ls_gubun, ls_locno, ls_sdate, ll_out_gigan, ls_sale_group )		// 현재고	

if TRIM(ddlb_gubun.TEXT) = '전체[자재제외]' then
	dw_1.setfilter(" mid(item_no,1,1) <> 'M' " )					
	dw_1.filter() 
end if	


dw_1.SetRedraw( true )
////////////////////////////////////////////////////////////////////

SELECT count(*) INTO :ll_cnt FROM item_stock WHERE loc_no like :ls_locno AND stock_date = convert(char(10), dateadd(day, -1, convert(datetime, :ls_sdate) ),112);

if ll_cnt < 1 then
	pb_ewol.setfocus()
	MessageBox("확인","전일재고 데이터가 존재하지 않습니다.~n~n'전일재고 집계작업'을 실행하시기 바랍니다.")
else
	MessageBox("확인","조회완료")
end if
end event

type gb_3 from w_inheritance`gb_3 within w_iitemstock_r
integer x = 4238
integer y = 16
integer width = 503
integer height = 232
integer taborder = 130
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회일자"
end type

type gb_2 from w_inheritance`gb_2 within w_iitemstock_r
integer x = 1225
integer y = 16
integer width = 2990
integer height = 232
integer taborder = 40
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_iitemstock_r
integer x = 4763
integer y = 16
integer width = 814
integer height = 232
integer taborder = 90
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_iitemstock_r
integer x = 1161
integer y = 28
integer width = 128
integer height = 80
integer taborder = 120
string title = "d_irbatchstock_m1"
string dataobject = "d_irbatchstock_ct"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_2"

//
This.scrolltorow( row )

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type dw_3 from datawindow within w_iitemstock_r
integer x = 1248
integer y = 148
integer width = 846
integer height = 84
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 저장소
dw_area.accepttext()
this.accepttext()

//cbx_savestock.enabled = false  	// 분류/안전재고
//cbx_qoh.enabled   = false  		// 전산재고 => 현재고 만들기
//pb_multi.enabled  = false  		// 다중추가
//pb_ewol.enabled   = false 			// 전일재고 집계작업
//pb_save.enabled   = false 			// 저장
//pb_delete.enabled = false 			// 삭제

debugbreak()

//////////////////////////////////////////////////////////
// 기본사업장에 다수의 저장소 존재시(기본저장소)			
//////////////////////////////////////////////////////////
string ls_area, ls_areachk, ls_locno, ls_loc

ls_loc  = data
//////////////////////////////////////////////////////////

//// 배치재고_관리
//SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
// WHERE type = '배치재고_관리' AND item_cd = :gs_userid AND rtrim(bigo) = :ls_loc AND use_yn = 'Y';
//if ls_locno = "ALL" then
////	cbx_savestock.enabled = true  // 분류/안전재고
////	cbx_qoh.enabled   = true  		// 전산재고 => 현재고 만들기
//	pb_multi.enabled  = true  		// 다중추가
//	pb_ewol.enabled   = true 		// 전일재고 집계작업
//	pb_save.enabled   = true 		// 저장
//	pb_delete.enabled = true 		// 삭제
//else
	SELECT area_no INTO :ls_areachk FROM location WHERE loc_no = :ls_loc;
	
	if gs_area = ls_areachk then
//	//	cbx_savestock.enabled = true  // 분류/안전재고
//		cbx_qoh.enabled   = true  		// 전산재고 => 현재고 만들기
//		pb_multi.enabled  = true  		// 다중추가
//		pb_ewol.enabled   = true 		// 전일재고 집계작업
//		pb_save.enabled   = true 		// 저장
//		pb_delete.enabled = true 		// 삭제
	else
/*		if ls_loc = " " then MessageBox("확인","저장소를 선택하시기 바랍니다.")*/
	end if	
//end if	
//if gs_userid = '1999010s' then
//	pb_2.visible = true
//	pb_ewol.enabled = true
//else
//	pb_2.visible = false	
//	pb_ewol.enabled = false
//end if
end event

type em_1 from editmask within w_iitemstock_r
integer x = 4270
integer y = 112
integer width = 443
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 65535
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;// FROM
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type ddlb_dwtitles from dropdownlistbox within w_iitemstock_r
integer x = 283
integer y = 300
integer width = 311
integer height = 88
integer taborder = 250
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

type st_4 from statictext within w_iitemstock_r
integer x = 722
integer y = 304
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

type ddlb_op from dropdownlistbox within w_iitemstock_r
integer x = 891
integer y = 288
integer width = 274
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_iitemstock_r
integer x = 1184
integer y = 296
integer width = 535
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_iitemstock_r
integer x = 1934
integer y = 296
integer width = 146
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;// 필터(다중필터 추가)
// OPEN Event : GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
// 해지 Click : GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
// cbx_op Control 추가 
// 필터 Click Script 아래 Script로 변경

datawindow arg_dw
integer    li_ret

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2
end choose

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

type cb_2 from commandbutton within w_iitemstock_r
integer x = 2085
integer y = 296
integer width = 146
integer height = 76
integer taborder = 220
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
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_iitemstock_r
integer x = 2235
integer y = 296
integer width = 146
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_iitemstock_r
integer x = 2386
integer y = 296
integer width = 146
integer height = 76
integer taborder = 290
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
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_fld from dropdownlistbox within w_iitemstock_r
integer x = 251
integer y = 288
integer width = 443
integer height = 632
integer taborder = 230
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

type st_7 from statictext within w_iitemstock_r
boolean visible = false
integer x = 5015
integer y = 920
integer width = 210
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_iitemstock_r
boolean visible = false
integer x = 5225
integer y = 920
integer width = 549
integer height = 80
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 사업장
DataWindowChild ldwc_loc
long  ll_cnt

dw_area.accepttext()

dw_3.object.loc_no[1] = " "		// 기본값을 변경	
dw_3.accepttext()

//cbx_all.enabled   = false			// 전체품목
//cbx_savestock.enabled = false  	// 분류/안전재고
//cbx_qoh.enabled   = false  		// 전산재고 => 현재고 만들기
pb_ewol.enabled   = false 			// 전일재고 집계작업
pb_save.enabled   = false 			// 저장
pb_delete.enabled = false 			// 삭제

////////////////////////////////////////////////////////////
//// 기본사업장에 다수의 저장소 존재시(기본저장소)			
////////////////////////////////////////////////////////////
string ls_area, ls_areachk, ls_locno, ls_loc

ls_area = trim(data)
if ls_area = "S0001" then
	cbx_all.enabled = true
end if

// 사업장의 기본저장소
//SELECT loc_no  INTO :ls_defno FROM location WHERE area_no = :ls_area AND loc_no = :ls_locno;

SELECT count(loc_no) INTO :ll_cnt
  FROM location
 WHERE loc_manager is not null
   AND tel_no      is not null
   AND use_yn       = 'Y'
   AND area_no      = :ls_area;
if ll_cnt = 1 then
	SELECT def_loc  INTO :ls_locno FROM area WHERE area_no = :ls_area;
else
	ls_locno = " "
end if

if ls_area = "" then
	idwc_locno.setfilter( "area_no <> ''" )
else
	idwc_locno.setfilter( "area_no = '" + ls_area + "'" )
end if
idwc_locno.filter()

dw_3.object.loc_no[1] = ls_locno		// 기본값을 변경	
dw_3.accepttext()

ls_loc  = dw_3.object.loc_no[1]
////////////////////////////////////////////////////////////	

//// 배치재고_관리
//SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
// WHERE type = '배치재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
//if ls_locno = "ALL" then
////	cbx_savestock.enabled = true  // 분류/안전재고
////	cbx_qoh.enabled   = true  		// 전산재고 => 현재고 만들기
//	
//	pb_multi.enabled  = true  		// 다중추가
//	pb_ewol.enabled   = true 		// 전일재고 집계작업
//	pb_save.enabled   = true 		// 저장
//	pb_delete.enabled = true 		// 삭제
//else
	SELECT area_no INTO :ls_areachk FROM location WHERE loc_no = :ls_loc;
	if ls_area = ls_areachk then
////		cbx_savestock.enabled = true  // 분류/안전재고
//		cbx_qoh.enabled   = true  		// 전산재고 => 현재고 만들기
//		
//		pb_multi.enabled  = true  		// 다중추가
//		pb_ewol.enabled   = true 		// 전일재고 집계작업
//		pb_save.enabled   = true 		// 저장
//		pb_delete.enabled = true 		// 삭제
	else
		MessageBox("확인","저장소를 선택하시기 바랍니다.")
	end if	
//end if	
if gs_userid = '1999010s' then
	pb_2.visible = true
	pb_ewol.enabled = true
else
	pb_2.visible = false	
	pb_ewol.enabled = false
end if

end event

event rowfocuschanged;// 사업장

dw_area.accepttext()

end event

type cbx_o08 from checkbox within w_iitemstock_r
boolean visible = false
integer x = 4946
integer y = 812
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "작업일보사용"
end type

type cbx_o09 from checkbox within w_iitemstock_r
boolean visible = false
integer x = 5463
integer y = 808
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "재고생산출고"
end type

type gb_4 from groupbox within w_iitemstock_r
boolean visible = false
integer x = 1239
integer y = 16
integer width = 846
integer height = 232
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
end type

type gb_6 from groupbox within w_iitemstock_r
integer x = 32
integer y = 244
integer width = 4727
integer height = 160
integer taborder = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_1 from picturebutton within w_iitemstock_r
event mousemove pbm_mousemove
integer x = 4983
integer y = 76
integer width = 187
integer height = 144
integer taborder = 320
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

//if cbx_stock.checked = true then
//	dwxls = dw_2
//else
	dwxls = dw_1
//end if

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

type st_6 from statictext within w_iitemstock_r
boolean visible = false
integer x = 41
integer y = 204
integer width = 379
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "배치타임_재고"
boolean focusrectangle = false
end type

type pb_ewol from picturebutton within w_iitemstock_r
integer x = 3351
integer y = 276
integer width = 635
integer height = 104
integer taborder = 370
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고 집계작업"
vtextalign vtextalign = vcenter!
end type

event clicked;// 전일재고 집계작업
string  ls_area,  ls_sdate, ls_edate,  ls_errtext, ls_defno, ls_date, ls_item_no, ls_yymm
string  ls_locno, ls_itemno, ls_qa,    ls_savestock, ls_userid, ls_area_name
decimal ld_bqty,  ld_rqty,  ld_iqty,   ld_retqty,  ld_etcqty, ld_qoh, ld_safetystock
long    ll_row,   ll_cnt,   ll_icnt,   ll_ucnt, l_net

datetime ld_date

DEBUGBREAK()

dw_3.accepttext()

// 전일
ls_sdate = string(date(em_1.text), "yyyy-mm-dd")
ls_yymm = string(date(em_1.text), "yyyymm")

ls_date = ''

/*말일 점검*/
select convert(char(10), dateadd(d,-1,dateadd(m,1,dateadd(dd,1,dateadd(dd,-datepart(dd,  convert(datetime, :ls_sdate) ),convert(datetime, :ls_sdate) )))),121) 
into :ls_date
from dual;



/*2018.11.01 jowonsuk 기초데이터 업로드를 통합, 월말일을 집계시 기초데이터업로드(재고조정양)를 반영할지 안할지 선택*/
//if ls_sdate = ls_date then		/*말일일때 */
//	
//	ll_cnt = 0
///*	
//	select count(*) 
//	into :ll_cnt
//	from pre_itemstock
//	where yymm = :ls_yymm;
//*/	
//	select count( * ) 
//	into :ll_cnt
//	from silsa_itemstock with(nolock)
//	where  ISNULL(close_yn, 'O') <> 'O'
//			and yyyymm = :ls_yymm;	
//	
//	
//	if ll_cnt > 0 then
//		messagebox('알림', '실사조정량 반영되어 집계 불가합니다.')
//		return
//	end if
//	
//	ll_cnt = 0
//	
//end if	





//ls_area  = dw_area.object.area[1]
//ls_locno = dw_3.object.loc_no[1]

ls_area_name = trim(ddlb_area_name.text)

if ls_area_name  = '전체' then
	ls_area_name = '%'
else
	ls_area_name = ls_area_name
end if

if MessageBox("확인", ls_sdate + "일 재고~n~r" + " 집계작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
	
//	if ls_sdate = ls_date then		/*말일일때 */
	
//			ll_cnt = 0
			
//			select count( * ) 
//			into :ll_cnt
//			from silsa_itemstock with(nolock)
//			where  ISNULL(close_yn, 'O') <> 'O'
//					and yyyymm = :ls_yymm;	
			

//			if ll_cnt > 0 then
//				l_net = messagebox('알림', '실사조정량 업로드를 하시겠습니까?', Exclamation!, OKCancel!, 2)
//			end if
	
//	end if	
	/*2018.11.01 jowonsuk 기초데이터 업로드를 통합, 월말일을 집계시 기초데이터업로드(재고조정양)를 반영할지 안할지 선택*/
		
//		hpb_1.bringtotop = true
//		hpb_1.visible    = true

//        ls_item_no = 'PZAAM21B1Z'
//		ls_qa	        = '120X0095X0038X02950'
		
//	SELECT convert(char(10), dateadd(day, -1, convert(datetime, :ls_sdate) ),112) INTO :ls_date from dual;
	
	/*2018.09.12 jowonsuk */
       delete item_stock
        where item_stock.stock_date   = replace(:ls_sdate, '-', '')	
		 and exists (
						     select * 
							from financial_location
							where rtrim(ltrim(financial_location.area_name)) like :ls_area_name
							and financial_location.loc_no = item_stock.loc_no
					    );
													
	/*
	     DELETE item_stock
           where stock_date   = replace(:ls_sdate, '-', '');
	*/			  
		  /*and  item_no = :ls_item_no
	  	  and qa = :ls_qa;		
		*/
	
         insert into item_stock (loc_no, item_no, qa, stock_date, before_qty, in_qty, out_qty, jaje_qty, intemp_qty, ret_qty, etc_qty, stock_qty, stock_m_qty, gab_qty,  sysdate )
                 (
                           select 
                                         a.loc_no,
                				    a.item_no,
                				    a.qa,
                                         replace(:ls_sdate, '-', '') stock_date,           
                                         sum(isnull(a.before_qty,0)) before_qty,
                                         sum(isnull(a.make_qty,0)) in_qty,                                                         /*입고(생산, 구매, 가입고, 반품, 물품요청입고, 코일이동입고 )								  	    */
                                         sum(isnull(a.ship_qty,0)) out_qty,                                                         /*출고(생산투입, 판매, 대체물품,  물품요청출고, 코일이동출고,  기타(제품폐기, 기타출고 유형) ) */
							    sum(isnull(a.jaje_qty,0)) jaje_qty,
                                         sum(isnull(a.intemp_qty,0)) intemp_qty,                                              /*가입고*/
                                         sum(isnull(a.ret_qty,0)) ret_qty,                                                           /*반품     */
                                         sum(isnull(a.etc_qty,0)) etc_qty,                                                          /*기타출고 (제품폐기, 기타출고유형 추가 )*/
						          sum(
                                                     isnull(a.before_qty,0) +                                                             /* 당일재고 = 전일재고 + 입고+가입고+반품-출고-기타 */
                      						 isnull(a.make_qty,0) +
                                                      isnull(a.intemp_qty,0) -
										 isnull(a.ship_qty,0) -
										 isnull(a.jaje_qty,0) +
										 isnull(a.ret_qty,0)  -
										 isnull(a.etc_qty,0) 
                					   	   ) stock_qty,
                                                  0 stock_m_qty,
                                                  0 gab_qty,
                                                  getdate()
						from 
						(                              
                                                        select   loc_no,
                                                              wc_no = null,
                                                              item_no,
                                                              qa,
                                                              stock_qty before_qty,
                                                              make_qty = 0,                                              
                                                              ship_qty = 0,
											     jaje_qty = 0,
                                                              ret_qty =0,
                                                              etc_qty =0,
                                                               intemp_qty = 0,
                                                               plan_out_qty =0,
                                                               plan_make_qty = 0
                                              from item_stock WITH(NOLOCK)
                                                    where stock_date   =  convert(char(10), dateadd(day, -1, convert(datetime, :ls_sdate) ),112)
									          and isnull(stock_qty,0) <> 0
											union all
									/*2018.07.03 jowonsuk 추가 */
									select  /*convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime, substring(:as_date,1,6)+'01') ) ),112) date, */            
											 loc_no,
											 wc_no = null,
											 item_no,
											 qa,             
											 before_qty = 0,
											 make_qty = plus_qty,                                                      /*생산*/
											 ship_qty = 0,							                               /*판매출고       */
											 JAJE_QTY = 0,						                               /*자재투입출고*/
											 ret_qty =0,                                                                      /*반품입고*/
											 etc_qty =minus_qty,                                                      /*기타출고*/
											 intemp_qty = 0,                                                             /*가입고*/
											 plan_out_qty =0,                                                           /*출고예정량*/
											 plan_make_qty = 0                                                       /*생산예정량*/
									  from silsa_itemstock
									where convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime,  ltrim(rtrim(yyyymm))+'01' ) ) ),112) =  :ls_sdate
									and ISNULL(close_yn,'O') <> 'O'
									and plus_qty + minus_qty <> 0
                                                          union all       
									select   loc_no
											 , null wc
											 , inaudit_item item_no
											 , qa     
											 , before_qty = 0 
											 , make_qty   = 0
											 , ship_qty   = sum(ISNULL(RCPT_QTY,0) + ISNULL(ISSUE_QTY,0))
											 , jaje_qty = 0
											 , ret_qty    = 0
											 , etc_qty    = 0
											 , intemp_qty = 0
											 , plan_out_qty = 0
											 , plan_make_qty = 0				
									  from inaudit with(nolock)
									where inaudit_date  BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
										AND inaudit_type = 'IO'
									group by loc_no
											 , inaudit_item
											 , qa     
										union all
										  SELECT loc_no     = s.loc_no
													  , wc_no      = rtrim(s.wc_no)
													  , item_no    = s.assembly
													  , qa         = s.assembly_qa
													  , before_qty = 0 
													  , make_qty   = sum(isnull(s.make_qty,0))
													  , ship_qty   = 0
													  , jaje_qty = 0
													  , ret_qty    = 0
													  , etc_qty    = 0
                                                                      , intemp_qty = 0
                                                                      , plan_out_qty = 0
                                                                      , plan_make_qty = 0
											  FROM sfcday S WITH (NOLOCK)
													 LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
/*											 WHERE convert(char(10), s.sfc_date, 112)   =   replace(:ls_sdate, '-', '')*/
											 where s.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
											 group by s.loc_no, rtrim(s.wc_no),/* convert(char(10), s.sfc_date, 111),*/ s.assembly, s.assembly_qa
                                                                   union all
                                                                   select               s.loc_no
                                                                                             , s.wc_no
                                                                                             , s.item_no
                                                                                             , s.qa
                                                                                             , before_qty = 0 
                                                                                             , make_qty = 0
                                                                                             , ship_qty = 0
/*																	    , jaje_qty =  sum(isnull(s.use_qty,0) - isnull(s.rem_qty,0)) 		*/
																		 , JAJE_QTY =  sum(    case when g.p4 = '1' then isnull(s.mod_qty,0) - isnull(s.rem_qty,0)
																											 when g.p4 = '2' then isnull(s.use_qty,0) - isnull(s.rem_cnt,0)
																											 else  isnull(s.use_qty,0) - isnull(s.rem_qty,0)
																											 end 
																								  )
                                                                                             , ret_qty = 0
                                                                                             , etc_qty = 0             
                                                                                             , intemp_qty = 0        
                                                                                             , plan_out_qty = 0
                                                                                             , plan_make_qty = 0
                                                                  from sfcuse S WITH (NOLOCK)	LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
																							INNER JOIN GROUPITEM g WITH(NOLOCK) ON s.item_no = g.item_no
/*                                                                  where convert(char(10), s.use_date, 112)   =   replace(:ls_sdate, '-', '')			*/
													where s.use_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
                                                                  group by s.loc_no
                                                                                      , s.wc_no
                                                                                  /*    , convert(char(10), s.use_date, 111)*/
                                                                                      , s.item_no
                                                                                      , s.qa
															  union all
													 SELECT   a.loc_no            
																  ,  a.wc_no          
															    , a.item_no                       
																 , a.qa         
																 , before_qty = 0 
																  , make_qty = 0
																  , ship_qty = 0
																  , jaje_qty =  sum(jaje_qty)
																  , ret_qty = 0
																  , etc_qty = 0             
																  , intemp_qty = 0        
																  , plan_out_qty = 0
																  , plan_make_qty = 0  
																from                
															  (     
																	 SELECT    distinct       /*2019.06.10 jowonsuk coilorderdet 수정  */
																						    coilmst.loc_no            
																						 ,  coilsfcday.wc_no          
																						 , coilmst.item_no                       
																						 , coilmst.qa 
																						 , coilsfcday.W_COIL_NO
																						 , before_qty = 0 
																						  , make_qty = 0
																						  , ship_qty = 0
																						  , jaje_qty =  (coilmst.unit_qty*coilorderdet.cnt)
																						  , ret_qty = 0
																						  , etc_qty = 0             
																						  , intemp_qty = 0        
																						  , plan_out_qty = 0
																						  , plan_make_qty = 0  
																				 FROM coilsfcday with(nolock) inner join coilorderdet with(nolock) on coilsfcday.order_no  = coilorderdet.order_no
																												inner join coilmst with(nolock)   on coilorderdet.coil_no      = coilmst.coil_no and coilorderdet.loc_no        = coilmst.loc_no
						/*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   	*/
																				 where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
																	union all		/*2019.06.10 jowonsuk coilsum 추가 */
																	 SELECT    distinct       
																						    coilmst.loc_no            
																						 ,  coilsfcday.wc_no          
																						 , coilmst.item_no                       
																						 , coilmst.qa 
																						 , coilsfcday.W_COIL_NO
																						 , before_qty = 0 
																						  , make_qty = 0
																						  , ship_qty = 0
																						  , jaje_qty =  (coilmst.unit_qty*coilordersum.cnt)
																						  , ret_qty = 0
																						  , etc_qty = 0             
																						  , intemp_qty = 0        
																						  , plan_out_qty = 0
																						  , plan_make_qty = 0  
																				 FROM coilsfcday with(nolock) inner join coilordersum with(nolock) on coilsfcday.order_no  = coilordersum.order_no
																											inner join coilmst with(nolock)   on coilordersum.coil_no      = coilmst.coil_no and coilordersum.loc_no        = coilmst.loc_no
						/*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   	*/
																				 where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )																	
						
																  ) a
														  group by  a.loc_no 
														  			 , a.wc_no
																	 , a.item_no                       
																      , a.qa         
															  union all															  
															  SELECT 
																coilsfcday.loc_no    
																 ,  coilsfcday.wc_no          
															 , coilsfcday.item_no                       
																 , coilsfcday.qa         
																	 , before_qty = 0 
																  , make_qty = sum(coilsfcday.unit_qty*coilsfcday.cnt)
																  , ship_qty = 0
																	 , jaje_qty =  0
																  , ret_qty = 0
																  , etc_qty = 0             
																  , intemp_qty = 0        
																  , plan_out_qty = 0
																  , plan_make_qty = 0 
														 FROM coilsfcday with(nolock) inner join coilmst with(nolock)   on coilsfcday.w_coil_no      = coilmst.coil_no and coilsfcday.wloc_no        = coilmst.loc_no
/*														WHERE ( ( convert(char(10),coilsfcday.sfc_date, 112) = replace(:ls_sdate, '-', '') ) )   		*/
														 where coilsfcday.sfc_date BETWEEN convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
														  group by    coilsfcday.loc_no                           
																		  ,  coilsfcday.wc_no          																		  
																		, coilsfcday.item_no                       
																		, coilsfcday.qa  
															  union all
/*															  
															select 
																	  loc_no
																	, null wc_no
																	, item_no
																	, qa
																	, before_qty = 0 
																	, make_qty   = sum(isnull(rcpt_qty,0)) 
																      , ship_qty = 0
																	 , jaje_qty =  0
																  	 , ret_qty = 0
																  	 , etc_qty = 0             
																  	 , intemp_qty = 0        
																  	 , plan_out_qty = 0
																  	 , plan_make_qty = 0 
																from coilmst
/*																WHERE CONVERT(CHAR(10), RCPT_DATE , 112) = replace(:ls_sdate, '-', '')		*/
																where rcpt_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
																and ( rem like '%잔량%' AND rem like '%입고%' )
																group by   item_no,
																			  qa,
																			  loc_no																					  
															  union all
*/															  
															 SELECT loc_no  = d.loc_no
																	, null wc_no                                     
																	, d.item_no
																	, qa         = d.qa     
																	, before_qty = 0
																	, make_qty   = sum(isnull(d.rcpt_qty, 0))
																	, ship_qty   = 0
														     		     , jaje_qty = 0
																	, ret_qty    = 0
																	, etc_qty    = 0
																	 , intemp_qty = 0
																	 , plan_out_qty = 0
																	 , plan_make_qty = 0
															FROM inspdet D WITH (NOLOCK)
																  inner JOIN insp  H WITH (NOLOCK) ON d.insp_no = h.insp_no
/*														  WHERE  convert(char(10), h.insp_date, 112)   =   replace(:ls_sdate, '-', '')*/
														where h.insp_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )
														  group by d.loc_no,/* convert(char(10),h.insp_date,111), */d.item_no, d.qa																															 
															union all	
															SELECT loc_no     = a.loc_no
																  , null wc_no                                            
																  , a.item_no
																  , qa         = a.qa      
																  , BEFORE_QTY = 0
																  , MAKE_QTY = 0
																  , ship_qty   = sum(isnull(a.ship_qty,0))
												 				  , jaje_qty = 0
																  , ret_qty    = 0
																  , etc_qty    = 0
																  , intemp_qty = 0           
																  , plan_out_qty = 0
																  , plan_make_qty = 0
															  FROM dodet  A with(nolock)
																	 inner JOIN do  B WITH (NOLOCK) ON a.do_no   = b.do_no                                                                                                                                  
/*															 WHERE convert(char(10),b.issue_date,112)  = replace(:ls_sdate, '-', '')*/
															 where b.issue_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
																AND a.ship_qty > 0     /* 반품정리시 -수량 발생함 */
															/*   AND b.ewol    <> 'Y' */  /* 송장이월 SKIP  JOWONSUK 2018.06.13 주석처리 */
																group by a.loc_no, /*convert(char(10),b.do_date,111),*/ a.item_no, a.qa
															union all																	
															 SELECT loc_no     = d.src_loc
																	, null wc_no
											
																	, d.src_item item_no
																	, qa         = d.src_qa   
																	, before_qty = 0
																	, make_qty = 0
																	, ship_qty = sum( isnull(d.src_qty, 0))
																	, jaje_qty = 0
																	, ret_qty   = 0   
																	, etc_qty  = 0
															   	     , intemp_qty = 0              
																     , plan_out_qty = 0
																     , plan_make_qty = 0
														FROM itemalter D WITH (NOLOCK)
/*													  WHERE convert(char(10), d.alter_date, 112)   =   replace(:ls_sdate, '-', '')*/
													 where d.alter_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
														 AND d.issue_flag  = 'Y'
														 group by d.src_loc,/* convert(char(10),d.alter_date,111), */d.src_item, d.src_qa                                                                         
                                                                    union all
                                                                    	SELECT loc_no      = d.tar_loc
															  ,  null wc_no
															  , item_no    = d.tar_item
															  , qa          = d.tar_qa   
															  , before_qty = 0
															  , make_qty = sum(isnull(d.tar_qty, 0))
															  , ship_qty    = 0
															  , jaje_qty = 0
															  , ret_qty   = 0
															  , etc_qty   = 0
                                                                            	  , intemp_qty = 0                               
                                                                            	  , plan_out_qty = 0
                                                                                 , plan_make_qty = 0
												  FROM itemalter D WITH (NOLOCK)
/*												 WHERE convert(char(10), d.alter_date, 112)   =  replace(:ls_sdate, '-', '')*/
												 where d.alter_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                         group by d.tar_loc, d.tar_item, d.tar_qa
													union all																														 
												  SELECT loc_no     = a.loc_no   
															 , null wc_no
															 , a.item_no
															 , qa         = a.qa   
															 , before_qty = 0
															 , make_qty = 0
															 , ship_qty = sum(isnull(a.rlse_qty,0)) 
															  , jaje_qty = 0															 
															 , ret_qty   = 0   
															 , etc_qty  = 0
                                                           	                 , intemp_qty = 0                          
                                                              	       	      , plan_out_qty = 0
                                                              		           , plan_make_qty = 0
													 FROM ask_det A WITH (NOLOCK)
															LEFT OUTER JOIN ask_head B WITH (NOLOCK) ON a.ask_no = b.ask_no
/*													WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')			*/
													where a.rlse_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )															   
													     and  a.loc_no  is not null
													group by a.loc_no,  /*convert(char(10),a.rlse_date,111)   ,*/ a.item_no, a.qa																												
													   having sum(isnull(a.rlse_qty,0)) <> 0
												 union all														 
											  SELECT  loc_no     = b.ask_loc   
														 , null wc_no                                  
														 , a.item_no
														 , qa         = a.qa   
														 , before_qty = 0
														 , make_qty = sum(isnull(a.rlse_qty,0))
														 , ship_qty = 0
														 , jaje_qty = 0														 
														 , ret_qty   =  0
														 , etc_qty  = 0
                                                                         , intemp_qty = 0       
                                                                         , plan_out_qty = 0
                                                                         , plan_make_qty = 0
											 FROM ask_det A WITH (NOLOCK)
													LEFT OUTER JOIN ask_head B ON a.ask_no = b.ask_no
/*											WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')	*/
											where a.rlse_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
													     and  b.ask_loc   is not  null											
											group by b.ask_loc, /* convert(char(10),a.rlse_date,111)   ,*/ a.item_no,  a.qa                                  
											   having sum(isnull(a.rlse_qty,0)) <> 0											
											union all
										SELECT loc_no     = b.src_loc                         
												 , null wc_no                                              
												 , a.item_no
												 , qa         = a.qa             
												 , before_qty = 0
												 , make_qty = 0
												 , ship_qty = sum( case when substring(a.item_no,4,1) = '1' then (isnull(a.move_qty*a.cnt,0)) else (isnull(a.cnt,0))  end )
												 , jaje_qty = 0
												 , ret_qty   = 0                                                 
												 , etc_qty  = 0
                                                                , intemp_qty = 0       
                                                                , plan_out_qty = 0
                                                                , plan_make_qty = 0
											 FROM itemmovedet A WITH (NOLOCK)  
													LEFT OUTER JOIN itemmove B WITH (NOLOCK) ON a.move_no = b.move_no
/*											WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')	*/
											where b.move_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
										  group by b.src_loc, /*convert(char(10),b.move_date,111),*/a.item_no,a.qa                                         
											union all
										 SELECT loc_no     = b.tar_loc               
												 , null wc_no                                  
												 , a.item_no
												 , qa         = a.qa      
												 , before_qty = 0
												 , make_qty = sum( case when substring(a.item_no,4,1) = '1' then (isnull(a.move_qty*a.cnt,0)) else (isnull(a.cnt,0))  end )
												 , ship_qty = 0
												 , jaje_qty = 0												 
												 , ret_qty   = 0
												 , etc_qty  = 0           
												 , intemp_qty = 0
												 , plan_out_qty = 0
												 , plan_make_qty = 0
										 FROM itemmovedet A WITH (NOLOCK)                 
										 LEFT OUTER JOIN itemmove B ON a.move_no = b.move_no              
/*										WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')	*/
										where b.move_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
										group by b.tar_loc, /*convert(char(10),b.move_date,111)  ,*/ a.item_no, a.qa        
                                                                      union all
                                                                      SELECT loc_no
																 , null wc_no
																, item_no
																, qa
																 , before_qty = 0
																 , make_qty = 0
																 , ship_qty = 0
															      , jaje_qty = 0																 
																 , ret_qty   = 0
																 , etc_qty  = 0                                                                                               
                                                                                     , intemp_qty = sum(isnull(qty ,0))
                                                                                     , plan_out_qty = 0
                                                                                     , plan_make_qty = 0
                                                                    FROM INTEMP WITH(NOLOCK)
/*                                                                    WHERE convert(char(10), intemp_date, 112)   =   replace(:ls_sdate, '-', '')	*/
													where intemp_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                    group by  loc_no, /*convert(char(10),intemp_date,111), */item_no, qa
                                                                    union all
                                                                    select   a.loc_no
                                                                                   , null wc_no
                                                                                 /*  , batchdate  = convert(char(10),b.ret_date,111)*/
                                                                                   , item_no
                                                                                   , qa
                                                   						    , before_qty = 0
															   , make_qty = 0
															   , ship_qty = 0
															   , jaje_qty = 0
															   , ret_qty   = sum(isnull(a.acc_qty,0)+isnull(a.free_qty,0))
															    , etc_qty  = 0                                                                                               
                                                                                   , intemp_qty = 0
                                                                                   , plan_out_qty = 0
                                                                                   , plan_make_qty = 0
                                                                    FROM retdet a WITH(NOLOCK) inner join ret b WITH(NOLOCK) on a.ret_no = b.ret_no
/*                                                                    where convert(char(10), b.ret_date, 112)   =   replace(:ls_sdate, '-', '')		*/
													   where b.ret_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                    group by a.loc_no,/* convert(char(10),b.ret_date,111),*/ item_no, qa
                                                                    union all
                                                                    select   loc_no
                                                                                   , wc_no
                                                                                   , item_no
                                                                                   , qa
                                                                                   , before_qty = 0
                                                                                   , make_qty = sum(isnull(ret_qty,0)) 
                                                                                   , ship_qty = 0
															    , jaje_qty = 0																											  
                                                                                   , ret_qty = 0
                                                                                   , etc_qty = 0                           
                                                                                   , intemp_qty = 0
                                                                                   , plan_out_qty = 0
                                                                                   , plan_make_qty = 0
                                                                  from sfcret WITH(NOLOCK)
/*                                                                  where convert(char(10), ret_date, 112)   =   replace(:ls_sdate, '-', '')*/
												     where ret_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                  group by loc_no, wc_no,/* convert(char(10), ret_date, 111),*/ item_no, qa

                                                                  union all

                                                                SELECT   a.LOC_NO
                                                                                   , WC_NO  = null
                                                                                   , a.ITEM_NO
                                                                                   , a.QA
                                                                                   , before_qty = 0 
																, make_qty   = 0
																, ship_qty   = 0
															     , jaje_qty = 0																
																, ret_qty    = 0
																, etc_qty    = ISNULL(a.QTY,0)
                                                                                    , intemp_qty = 0
                                                                                    , plan_out_qty  = 0
                                                                                    , plan_make_qty = 0
                                                                FROM itemabandet a WITH(NOLOCK) inner join itemaban b WITH(NOLOCK) on a.aban_no = b.aban_no
/*                                                                WHERE convert(char(10), b.aban_date, 112)   =  replace(:ls_sdate, '-', '')	*/
													where b.aban_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
												union all												
												 select     loc_no
												 		  , wc_no = null	
														  , item_no
														  , qa
														  , before_qty = 0 
														  , make_qty   = 0
														  , ship_qty   = 0
														  , jaje_qty = 0														  
														  , ret_qty    = 0
														  , etc_qty    = sum(ISNULL(QTY,0))
														  , intemp_qty = 0
														  , plan_out_qty  = 0
														  , plan_make_qty = 0    
												from etcout WITH(NOLOCK)
/*											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')			*/
											  where etcout_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                  AND ETC_KIND  <= '50'				/*50까지 기타출고유형 */									  
											group by loc_no, item_no, qa
											union all												
												 select     loc_no
												 		  , wc_no = null	
														  , item_no
														  , qa
														  , before_qty = 0 
														  , make_qty   =  sum(ISNULL(QTY,0))
														  , ship_qty   = 0
														  , jaje_qty = 0														  
														  , ret_qty    = 0
														  , etc_qty    =0
														  , intemp_qty = 0
														  , plan_out_qty  = 0
														  , plan_make_qty = 0    
												from etcout WITH(NOLOCK)
/*											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')	*/
											  where etcout_date between convert(datetime,  replace(:ls_sdate, '-', '') + ' 00:00:00' ) and convert(datetime,  replace(:ls_sdate, '-', '') + ' 23:59:59' )		
                                                                 AND ETC_KIND  > '50'				/*50이상 기타입고 유형 */	  
											group by loc_no, item_no, qa											
                                                                /*                
                                                                                      and     b.process_flag   = 'Y'
                                                                                      and     ( ( case when ( b.approve_team is null ) or (b.approve_team = '') then 'N' else 'Y' end ) ) = 'Y'
                                                                */                                                                
                   								 union all
											  SELECT   C.DEF_LOC
														  , A.WC_NO
														  ,  A.ITEM_NO 
														  ,  A.QA
														  ,  before_qty = 0 
														  , make_qty   = 0
														  , ship_qty   = 0
														  , jaje_qty = 0                                                                                                  
														  , ret_qty    = 0
														  , etc_qty    = 0
														  , intemp_qty = 0
														  , plan_out_qty  = 0                                                                                   
														  , plan_make_qty =  sum(isnull(A.ORDER_QTY,0))
												FROM MPSDET A LEFT OUTER JOIN MPSORDER B ON A.mpsorder_order = B.ORDER_NO
																						  INNER JOIN WC C ON A.WC_NO = C.WORK_NO							
										WHERE  convert(char(10), B.ORDER_DATE, 112)   =  :ls_sdate
										GROUP BY C.DEF_LOC, 
																		 A.WC_NO, 
																		 A.ITEM_NO, 
																		 A.QA
                												) a inner join groupitem  b with(nolock) on a.item_no = b.item_no
														           inner join financial_location c with(nolock) on a.loc_no = c.loc_no
									 where rtrim(ltrim(c.area_name)) like :ls_area_name
/*																	 
                                                 where a.item_no = :ls_item_no
			                                    and a.qa = :ls_qa													 									  
*/															
                                          group by   a.loc_no,
											  a.item_no,
											  a.qa                                      
 /*                                       having         abs(sum(isnull(a.make_qty,0))) +
                                                           abs(sum(isnull(a.ship_qty,0)))   +
											  abs(sum(isnull(a.jaje_qty,0)))   +
                                                           abs(sum(isnull(a.intemp_qty,0))) +
                                                           abs(sum(isnull(a.ret_qty,0))) +
                                                           abs(sum(isnull(a.plan_out_qty,0))) +
                                                           abs(sum(isnull(a.plan_make_qty,0))) +
                                                           abs(sum(isnull(a.etc_qty,0)) )  +
          										 abs(sum( isnull(a.before_qty,0) ) ) <> 0			
*/													  
                    );	 
	      
			  
		     commit;
			  
			
			
			//if l_net = 1 then		/*2018.11.01 jowonsuk 기초데이터 업로드 반영 1이면 yes로 반영, 2면 no로 미반영*/  
			
			if ls_sdate = ls_date then
		
					// 전일재고 집계작업
					string ls_loc_no, ls_st_date, LS_GUBUN 
					DECIMAL L_STOCK_QTY
					LONG L_ROW, l_count, i_count
					
					//ls_loc_no = trim(dw_3.object.loc_no[1])
					ls_st_date = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)
					
					if TRIM(ddlb_gubun.TEXT) = '전체' then
						ls_gubun = '%'
					elseif TRIM(ddlb_gubun.TEXT) = '제품' then
						ls_gubun = 'P'
					elseif TRIM(ddlb_gubun.TEXT) = '상품' then
						ls_gubun = 'G'	
					elseif TRIM(ddlb_gubun.TEXT) = '자재' then
						ls_gubun = 'M'	
					elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
						ls_gubun = 'E'		
					end if
					
					DECLARE silsa_cursor CURSOR FOR  
					select  a.loc_no, a.item_no, a.qa, sum(isnull(a.silsa_qty,0)) stock_qty
					from silsa_itemstock a with(nolock) left outer  join  groupitem b with(nolock) on a.item_no = b.item_no
																		left outer join item c with(nolock) on a.item_no = c.item_no and a.qa =c.qa 
												 						inner join financial_location d with(nolock) on a.loc_no = d.loc_no
					WHERE  SUBSTRING(a.ITEM_NO,1,1) LIKE :LS_GUBUN
					AND a.yyyymm = substring(:ls_st_date,1,6)			
					AND ISNULL(A.CLOSE_YN,'O') <> 'O'																		/*재고조정이 되었거나, 마감인거 미진행은 제외*/
					AND c.item_no  is not null
					AND d.area_name like :ls_area_name
					/*AND A.ITEM_NO = 'PACSMBDB00'
					AND A.QA = '000X0045X0019X04000'
					*/
					group by a.LOC_NO, a.item_no, a.qa;
						
						
					DEBUGBREAK()
					
					dw_3.accepttext()
					
					// 전일
					//ls_loc_no = dw_3.object.loc_no[1]
					
					ls_area_name = trim(ddlb_area_name.text)
					
					if ls_area_name  = '전체' then
						ls_area_name = '%'
					else
						ls_area_name = ls_area_name
					end if
					
					
					if TRIM(ddlb_gubun.TEXT) = '전체' then
						ls_gubun = '%'
					elseif TRIM(ddlb_gubun.TEXT) = '제품' then
						ls_gubun = 'P'
					elseif TRIM(ddlb_gubun.TEXT) = '상품' then
						ls_gubun = 'G'	
					elseif TRIM(ddlb_gubun.TEXT) = '자재' then
						ls_gubun = 'M'	
					elseif TRIM(ddlb_gubun.TEXT) = '전단(스)' then
						ls_gubun = 'E'		
					end if
					
				
//					 delete item_stock
//					  where item_stock.stock_date   = replace(:ls_sdate, '-', '')	
//					 and exists (
//										  select * 
//										from financial_location
//										where rtrim(ltrim(financial_location.area_name)) like :ls_area_name
//										and financial_location.loc_no = item_stock.loc_no
//									 );				
			
					OPEN silsa_cursor;
				
					FETCH silsa_cursor INTO :ls_loc_no, :ls_ITEM_NO, :ls_QA, :L_STOCK_QTY;
					
					Do While sqlca.sqlcode = 0
						
						
					IF LS_LOC_NO = 'WS00000007' AND  ls_ITEM_NO = 'GAZAAJKB00' 	AND ls_QA = '000X0000X0024X00000'	THEN
						LS_LOC_NO = 'WS00000007'
					END IF						
					
							l_count = 0
							
							select  count(*)
								 into :l_count
								from item_stock
							where loc_no = :ls_loc_no
								and item_no = :ls_item_no
								  and qa  = :ls_qa
								and stock_date = :ls_st_date;
																		
							
							if l_count > 0 then
								
								update item_stock
									 set before_qty = 0,
										  in_qty        = 0,
										  out_qty     = 0,
										  intemp_qty = 0,
										  ret_qty        = 0,
										  etc_qty       = 0,
										  stock_qty = :L_STOCK_QTY,				
										  sysdate  = getdate()
								where loc_no    = :ls_loc_no
									and item_no = :ls_item_no
									and qa  		= :ls_qa
									and stock_date = :ls_st_date;		
								
							else
							
								 insert into item_stock (loc_no,        item_no,        qa,       stock_date, before_qty, in_qty, out_qty, intemp_qty, ret_qty, etc_qty,                 stock_qty,              stock_m_qty, gab_qty,  sysdate )	
									 VALUES (             :ls_loc_no,  :ls_item_no,   :ls_qa,       :ls_st_date,                 0,        0,           0,                 0,          0,          0,               :L_STOCK_QTY,                     0,           0,   getdate() );
						
							end if
							
								
							FETCH silsa_cursor INTO :ls_loc_no, :ls_ITEM_NO, :ls_QA, :L_STOCK_QTY;
						
							i_count = i_count + 1;
						
					Loop
					CLOSE silsa_cursor;
							  
					commit;
					
			end if
			
			MessageBox("확인","전일재고 집계작업 완료!!!" )
			
	end if



end event

type dw_4 from datawindow within w_iitemstock_r
integer x = 923
integer y = 620
integer width = 3502
integer height = 1048
integer taborder = 180
boolean bringtotop = true
boolean titlebar = true
string title = "품목 일일수불 확인"
string dataobject = "d_iitemstock_m1_new"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_4"

end event

type dw_5 from datawindow within w_iitemstock_r
integer x = 1138
integer y = 956
integer width = 2770
integer height = 616
integer taborder = 150
boolean bringtotop = true
boolean titlebar = true
string title = "상세보기"
string dataobject = "d_irbatchstock_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_5"

end event

type st_3 from statictext within w_iitemstock_r
integer x = 73
integer y = 308
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type cbx_op from checkbox within w_iitemstock_r
integer x = 1733
integer y = 308
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

type dw_6 from datawindow within w_iitemstock_r
integer x = 1047
integer y = 1296
integer width = 3337
integer height = 748
integer taborder = 350
boolean bringtotop = true
boolean titlebar = true
string title = "출고예정"
string dataobject = "d_silsa_oiissuereq_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_6"

end event

type cbx_user from checkbox within w_iitemstock_r
boolean visible = false
integer x = 667
integer y = 204
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
boolean enabled = false
string text = "담당자 변경"
boolean automatic = false
end type

event clicked;// 담당자 변경
string ls_userid

if this.checked = true then
	dw_1.object.user_id.TabSequence = 10		// 담당자
else
	dw_1.object.user_id.TabSequence = 0 		// 담당자
end if

end event

type cbx_all from checkbox within w_iitemstock_r
boolean visible = false
integer x = 4978
integer y = 712
integer width = 224
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "전체"
end type

event clicked;// 담당자 변경
string ls_userid

if this.checked = true then
	dw_1.object.user_id.TabSequence = 10		// 담당자
else
	dw_1.object.user_id.TabSequence = 0 		// 담당자
end if

end event

type hpb_1 from hprogressbar within w_iitemstock_r
integer x = 32
integer y = 268
integer width = 4718
integer height = 160
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_1 from statictext within w_iitemstock_r
integer x = 1248
integer y = 56
integer width = 210
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "구분"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_gubun from dropdownlistbox within w_iitemstock_r
integer x = 1463
integer y = 56
integer width = 530
integer height = 600
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"전체","전체[자재제외]","제품","상품","자재","전단(스)"}
borderstyle borderstyle = stylelowered!
end type

type cbx_cqty from checkbox within w_iitemstock_r
boolean visible = false
integer x = 2725
integer y = 352
integer width = 1042
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 32768
long backcolor = 67108864
boolean enabled = false
string text = "실사재고=> 전산재고 반영"
end type

event clicked;// 실사재고 => 전산재고 반영
long    ll_row
decimal ld_qty

if this.checked = true then
	if MessageBox("확인", "실사재고를 전산재고로 수정 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN

	for ll_row = 1 to dw_1.rowcount()
		if dw_1.object.ccalc[ll_row] <> 0 then
			dw_1.object.etc_qty[ll_row] = dw_1.object.ccalc[ll_row]
			dw_1.object.rem[ll_row]     = "[실사반영]"		
		end if
	next
else
	for ll_row = 1 to dw_1.rowcount()
		if dw_1.object.rem[ll_row] = "[실사반영]" then
			dw_1.object.etc_qty[ll_row] = 0
			dw_1.object.rem[ll_row]     = ""
		end if
	next
end if

end event

type cbx_qoh from checkbox within w_iitemstock_r
boolean visible = false
integer x = 2725
integer y = 288
integer width = 1042
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "전산재고=> 실사재고 반영"
end type

event clicked;// 전산재고 => 현재고 만들기
long  ll_row


if this.checked = true then
	if MessageBox("확인", "전산재고를 현재고로 수정 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN

	for ll_row = 1 to dw_1.rowcount()
		dw_1.object.qoh[ll_row] = dw_1.object.cqty[ll_row]
	next
else
	for ll_row = 1 to dw_1.rowcount()
		dw_1.object.qoh[ll_row] = dw_1.object.qoh_org[ll_row]
	next
end if

end event

type pb_2 from picturebutton within w_iitemstock_r
boolean visible = false
integer x = 4046
integer y = 276
integer width = 622
integer height = 104
integer taborder = 380
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "일괄생성"
vtextalign vtextalign = vcenter!
end type

event clicked;//string ls_check
//
//ls_check = 'silsa_itemstock'
//
//if ls_check = 'silsa_itemstock' then
////	wf_silsa_upload()
//	wf_inaudit_test()
//elseif ls_check = 'pre_itemstock' then
//	wf_pre_itemstock_upload()	
//else
//	
//end if 
int l_pre_day, l_now_day
string ls_st_day, ls_sdate, ls_sqlerrtext, ls_gigan

ls_st_day = string(date(em_1.text), "yyyy-mm-dd")

select  convert(char(10), dateadd(day, -1, convert(char(6),dateadd(month, -1,   convert(date, :ls_st_day ) ),112)+'01'),121 ) + ' ~ ' +  convert(char(10), convert(date, :ls_st_day ),121) 
	 into :ls_gigan
from dual;


if MessageBox("확인", ls_sdate + "일 재고~n~r" + '['+ ls_gigan + "] 집계작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
				
		 select  convert(dec, substring( convert(char(8),dateadd(day, -1, convert(char(6), convert(date, :ls_st_day ), 112)+'01'),112),7,2) ),
				  convert(dec, substring( convert(char(8), convert(date, :ls_st_day), 112), 7, 2))
				  into :l_pre_day, :l_now_day
			 from dual;      
			 
		 DECLARE day_cursor CURSOR FOR  
		  select  substring(a.num,1,4)+'-'+substring(a.num,5,2) + '-' + substring(a.num,7,2)
		  from 
		  (   
		 select convert(char(6),dateadd(day, -1, convert(char(6), dateadd(month, 1,   convert(date, :ls_st_day ) ), 112)+'01'),112)+num num
		 from dbo.UF_NUM_table(:l_now_day)
		 union all
		 select convert(char(6),dateadd(day, -1, convert(char(6), convert(date, :ls_st_day ), 112)+'01'),112)+num 
		 from dbo.UF_NUM_table(:l_pre_day)
		 union all
		 select  convert(char(8), dateadd(day, -1, convert(char(6),dateadd(month, -1,   convert(date, :ls_st_day ) ),112)+'01'),112 )
		 ) a
		 order by a.num;        
					 
		
		OPEN day_cursor;
		
			FETCH day_cursor INTO :ls_sdate;
		
			Do While sqlca.sqlcode = 0
		
				wf_item_stock_day(ls_sdate);
			
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = string(sqlca.sqlerrtext)
					ROLLBACK;				
					MessageBox('오류32','[item_stock] item_stock중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
					RETURN 0
				end if					 
			
					
				FETCH day_cursor INTO :ls_sdate;
					
			Loop
		
		CLOSE day_cursor;
				  
		commit;
		
		select  convert(char(10), dateadd(day, -1, convert(char(6),dateadd(month, -1,   convert(date, :ls_st_day ) ),112)+'01'),121 ) + ' ~ ' +  convert(char(10),  convert(date, :ls_st_day ),121) 
			 into :ls_gigan
		from dual;
		
		
		messagebox('알림', '['+ ls_gigan + '] 기간의 일수불을 생성이 완료 되었습니다.')
		
end if		


///*2019.04.08 jowonsuk 추가 */
//string ls_day
//
//ls_day = mid(em_1.text, 1,4)  +  mid(em_1.text, 6,2) +  mid(em_1.text, 9,2)
//
//DECLARE item_stock_procedure procedure for dt_item_stock :ls_day using sqlca;
//
//EXECUTE item_stock_procedure ;
//
//if sqlca.sqlcode > 0 then
//		
//	select  convert(char(10), dateadd(day, -1, convert(char(6),dateadd(month, -1,   convert(date, :ls_day ) ),112)+'01'),121 ) + ' ~ ' +  convert(char(10),  convert(date, :ls_day ),121) 
//	    into :ls_gigan
//	from dual;
//	
//	
//	messagebox('알림', '['+ ls_gigan + '] 기간의 일수불을 생성이 완료 되었습니다.')
//else
//	messagebox('오류','생성시 오류가 있습니다.')
//end if
//
//CLOSE item_stock_procedure;
//COMMIT using sqlca;

end event

type cb_4 from commandbutton within w_iitemstock_r
boolean visible = false
integer x = 1623
integer y = 88
integer width = 439
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "재고이력"
end type

event clicked;///////////////////////////////////////////////////////////////////
//// 재고이력(2014/09/03일 오류 발견)
//// 출고송장 삭제시 INAUDIT Table에서 수불반영안됨 
//// 송장번호: SD20140827-085
///////////////////////////////////////////////////////////////////
//string ls_itemno, ls_itemnm, ls_qa, ls_locno
//// 전일재고 집계(±14일)
//long   ll_row
//gs_where lst_where
//
//dw_3.accepttext()
//
//ls_locno  = dw_3.object.loc_no[1]
//
//// 전일재고 집계(±14일)
//if cbx_stock.checked = true then
//	ll_row    = dw_2.getrow()
//	ls_itemnm = dw_2.object.item_name[ll_row]
//	ls_qa     = dw_2.object.qa[ll_row]
//
//	SELECT item_no INTO :ls_itemno FROM groupitem WHERE item_name = :ls_itemnm;
//else
//	ll_row    = dw_1.getrow()
//	ls_itemno = dw_1.object.item_no[ll_row]
//	ls_itemnm = dw_1.object.item_name[ll_row]
//	ls_qa     = dw_1.object.qa[ll_row]
//end if
//
//if isnull(ll_row) OR ll_row < 1 then RETURN
//
//lst_where.str1 = ls_itemno
//lst_where.str2 = ls_qa
//lst_where.str3 = ls_locno
//lst_where.str4 = em_1.text  // 시작
//lst_where.str5 = em_1.text  // 종료
//
//lst_where.name = ls_itemnm
//lst_where.chk  = "DO"
//
//gs_print_control = "INAUDIT"
//if gs_print_control = 'INAUDIT' then
//	OpenWithParm(w_whinaudit_w, lst_where)
//	w_whinaudit_w.WindowState = Normal!
//	lst_where = Message.PowerObjectParm
//end if

end event

type st_2 from statictext within w_iitemstock_r
integer x = 2199
integer y = 56
integer width = 210
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "제품류"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_grade from dropdownlistbox within w_iitemstock_r
integer x = 2414
integer y = 56
integer width = 530
integer height = 600
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"전체","성형류","도료류","",""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_grade

ls_grade = trim(ddlb_grade.text)

if ls_grade = '성형류' then	
	dw_1.dataobject = 'd_iitemstock_m2'
elseif ls_grade = '도료류' then	 /*2019.07.22 jowonsuk 도료류 추가*/
	dw_1.dataobject = 'd_iitemstock_m3'	
else
	dw_1.dataobject = 'd_iitemstock_m'		
end if
end event

type st_5 from statictext within w_iitemstock_r
integer x = 2962
integer y = 56
integer width = 521
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "미출고검색기준"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_not_out from dropdownlistbox within w_iitemstock_r
integer x = 3488
integer y = 56
integer width = 695
integer height = 600
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"조회안함","30일 경과 이후","60일 경과 이후","90일 경과 이후",""}
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_iitemstock_r
boolean visible = false
integer x = 4768
integer y = 316
integer width = 1705
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
boolean enabled = false
string text = "※일괄생성은 전전월말일~~전일까지 일수불 일괄 생성"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_iitemstock_r
integer x = 2962
integer y = 140
integer width = 1006
integer height = 92
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주번호 저장소별 재고 조회"
end type

event clicked;open(w_whsaledet_itemloc_w)
end event

type ddlb_area_name from dropdownlistbox within w_iitemstock_r
integer x = 2848
integer y = 292
integer width = 498
integer height = 648
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"전체","시화공장","화성공장(YSP)","화성공장(송천)","동부영업소","화곡영업소","대전영업소"}
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_iitemstock_r
integer x = 2601
integer y = 308
integer width = 233
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사업장"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_iitemstock_r
integer x = 3666
integer y = 520
integer width = 393
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 255
string text = "몰딩류"
end type

type rb_2 from radiobutton within w_iitemstock_r
integer x = 4082
integer y = 520
integer width = 416
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 255
string text = "AL 타일류"
end type

type rb_3 from radiobutton within w_iitemstock_r
integer x = 4521
integer y = 520
integer width = 416
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 255
string text = "STUD류"
end type

type rb_4 from radiobutton within w_iitemstock_r
integer x = 4960
integer y = 520
integer width = 443
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 255
string text = "고정볼트류"
end type

type rb_5 from radiobutton within w_iitemstock_r
integer x = 5426
integer y = 520
integer width = 443
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 255
string text = "기타"
end type

type rb_0 from radiobutton within w_iitemstock_r
integer x = 3049
integer y = 520
integer width = 594
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 255
string text = "즐겨찾기[전체]"
end type

type rb_6 from radiobutton within w_iitemstock_r
integer x = 2583
integer y = 520
integer width = 443
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 134217856
string text = "전체보기"
boolean checked = true
end type

type cbx_1 from checkbox within w_iitemstock_r
integer x = 2194
integer y = 156
integer width = 631
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
string text = "즐겨찾기사용유무"
end type

event clicked;if THIS.CHECKED then		
	st_9.visible = false
	ddlb_area_name.visible = false
	pb_ewol.visible = false
	pb_2.visible = false
	st_8.visible = false
	ddlb_area_name.visible = false			
	
	rb_0.visible = true
	rb_1.visible = true
	rb_2.visible = true
	rb_3.visible = true
	rb_4.visible = true
	rb_5.visible = true		
	rb_6.visible = true	
	
	rb_0.Y = 292
	rb_1.Y = 292	
	rb_2.Y = 292		
	rb_3.Y = 292			
	rb_4.Y = 292			
	rb_5.Y = 292			
	rb_6.Y = 292					
else		
	st_9.visible = true
	ddlb_area_name.visible = true
	pb_ewol.visible = true
	pb_2.visible = true
	st_8.visible = true
	ddlb_area_name.visible = true		
	
	rb_0.visible = false
	rb_1.visible = false
	rb_2.visible = false
	rb_3.visible = false
	rb_4.visible = false
	rb_5.visible = false		
	rb_6.visible = false	
	
	rb_0.Y = 520
	rb_1.Y = 520
	rb_2.Y = 520		
	rb_3.Y = 520			
	rb_4.Y = 520			
	rb_5.Y = 520			
	rb_6.Y = 520						
end if
end event

type cb_7 from commandbutton within w_iitemstock_r
boolean visible = false
integer x = 5614
integer y = 96
integer width = 279
integer height = 92
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "test"
end type

event clicked;/*도장 오류 */
string ls_plan_no, ls_wc_no, ls_assy_item, ls_assy_qa, ls_uom, ls_loc, ls_itemno_color, ls_area_no
datetime ldt_sfc_dt
double ldb_work_qty
string ls_coil_type = 'N'
long l_count, l_qa_check, li_division
string ls_sqlerrtext

declare inaudit_add_cursor cursor for
SELECT a.order_no, a.wc_no, a.ASSEMBLY, a.ASSEMBLY_QA, a.uom, a.loc_no, a.color, a.area_no, a.sfc_date, a.MAKE_QTY
FROM SFCDAY a 
WHERE a.WC_NO LIKE 'P%'
AND CONVERT(CHAR(8), a.SFC_DATE,112) = '20200706';


 OPEN inaudit_add_cursor;

	FETCH inaudit_add_cursor INTO :ls_plan_no, :ls_wc_no, :ls_assy_item, :ls_assy_qa, :ls_uom, :ls_loc, :ls_itemno_color, :ls_area_no, :ldt_sfc_dt, :ldb_work_qty;

	Do While sqlca.sqlcode = 0	

			l_count = 0
			select count(*)
			into :l_count
			from rout
			where item_no = :ls_assy_item
				 and isnull(represent, 'N') = 'Y';
				 
			if l_count > 0 then
				
				SELECT DISTINCT ROUT.ASSEMBLY ITEM_NO, :ls_assy_qa QA
					into :ls_assy_item, :ls_assy_qa
				FROM ROUT INNER JOIN 
										(
											 select ITEM_NO, QA, (OPERATION - 1) OPERATION
											 from rout
											 where assembly = :ls_assy_item
												and represent = 'Y'
										)   ROUT1  ON ROUT.ITEM_NO = ROUT1.ITEM_NO AND ROUT.OPERATION = ROUT1.OPERATION
				  WHERE represent = 'Y';
				  
				l_qa_check = 0
				
				SELECT count(*) INTO :l_qa_check FROM item WHERE item_no = :ls_assy_item AND qa = :ls_assy_qa;
				
				if l_qa_check = 0 then
					if GF_ItemINSERT(ls_assy_item, ls_assy_qa) = true then
					end if
				end if		
			
			else
			
				SELECT ROUT.ASSEMBLY ITEM_NO, ASSY_QA QA
					into :ls_assy_item, :ls_assy_qa
				FROM ROUT INNER JOIN 
										(
											 select ITEM_NO, QA, (OPERATION - 1) OPERATION
											 from rout
											 where assembly = :ls_assy_item
													and assy_qa = :ls_assy_qa
										)   ROUT1  ON ROUT.ITEM_NO = ROUT1.ITEM_NO AND ROUT.QA = ROUT1.QA AND ROUT.OPERATION = ROUT1.OPERATION;
			
			end if
			
			
			ls_coil_type = 'N'
			li_division = 1
			
			if sqlca.sqlcode = 100  then
			else	
				
							 insert into sfcuse (order_no,     wc_no,      use_date,  														                           			    item_no, 		   qa, 	              uom,   	  use_qty,              loc_no,   coil_type,       cnt,  unit_qty, mod_qty,  division,    	   mod_len,   wid, rem_qty, rem_len,  rem_lot, rem_qa, rem_cnt,          area_no,                      color,    auto_rout )
							 values                   (:ls_plan_no, :ls_wc_no, :ldt_sfc_dt, :ls_assy_item,  :ls_assy_qa, :ls_uom, :ldb_work_qty,   :ls_loc,  :ls_coil_type,     0,           0,              0,   :li_division,                0,   null,            0,            0,           null,       null,              0,   :ls_area_no,   :ls_itemno_color,             null );	 
							 
									
							if sqlca.sqlcode <> 0 then
								ls_sqlerrtext = sqlca.sqlerrtext
								rollback;
								MessageBox('오류[자재사용]', '[sfcuse] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
							end if		
	
					
					INSERT INTO inaudit 
							 (inaudit_time,inaudit_date,inaudit_item,qa,order_no,rcpt_qty,issue_qty,loc_no,inaudit_type,cost,destination,rem)
					VALUES (getdate(),:ldt_sfc_dt,:ls_assy_item,:ls_assy_qa,:ls_plan_no,0,:ldb_work_qty,:ls_loc,'IW',0,:ls_wc_no,"현장자재사용[도장]");
					
					if sqlca.sqlcode < 0 then
						ls_sqlerrtext = sqlca.sqlerrtext
						rollback;
						MessageBox('오류23','[inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext,exclamation!)
					end if				
			  
			end if  
			
			setnull(ls_assy_item)
			setnull(ls_assy_qa)
			setnull(ls_uom)
			
			FETCH inaudit_add_cursor INTO :ls_plan_no, :ls_wc_no, :ls_assy_item, :ls_assy_qa, :ls_uom, :ls_loc, :ls_itemno_color, :ls_area_no, :ldt_sfc_dt, :ldb_work_qty;
		
	Loop		
	
	CLOSE inaudit_add_cursor;			

/*2018-05-22 jowonsuk 자재 사용 자동 등록 끝 */

COMMIT;


MessageBox('알림','완료' )
end event

