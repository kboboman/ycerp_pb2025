$PBExportHeader$w_iitemstock_r2.srw
$PBExportComments$구매 일일마감 재고(재고관리/조원석)
forward
global type w_iitemstock_r2 from w_inheritance
end type
type dw_3 from datawindow within w_iitemstock_r2
end type
type em_1 from editmask within w_iitemstock_r2
end type
type ddlb_dwtitles from dropdownlistbox within w_iitemstock_r2
end type
type st_4 from statictext within w_iitemstock_r2
end type
type ddlb_op from dropdownlistbox within w_iitemstock_r2
end type
type sle_value from singlelineedit within w_iitemstock_r2
end type
type cb_1 from commandbutton within w_iitemstock_r2
end type
type cb_2 from commandbutton within w_iitemstock_r2
end type
type cb_3 from commandbutton within w_iitemstock_r2
end type
type cb_5 from commandbutton within w_iitemstock_r2
end type
type ddlb_fld from dropdownlistbox within w_iitemstock_r2
end type
type st_7 from statictext within w_iitemstock_r2
end type
type dw_area from datawindow within w_iitemstock_r2
end type
type cbx_o08 from checkbox within w_iitemstock_r2
end type
type cbx_o09 from checkbox within w_iitemstock_r2
end type
type gb_4 from groupbox within w_iitemstock_r2
end type
type gb_6 from groupbox within w_iitemstock_r2
end type
type pb_1 from picturebutton within w_iitemstock_r2
end type
type pb_multi from picturebutton within w_iitemstock_r2
end type
type dw_4 from datawindow within w_iitemstock_r2
end type
type dw_5 from datawindow within w_iitemstock_r2
end type
type st_3 from statictext within w_iitemstock_r2
end type
type cbx_op from checkbox within w_iitemstock_r2
end type
type dw_6 from datawindow within w_iitemstock_r2
end type
type cbx_user from checkbox within w_iitemstock_r2
end type
type cbx_all from checkbox within w_iitemstock_r2
end type
type hpb_1 from hprogressbar within w_iitemstock_r2
end type
type st_1 from statictext within w_iitemstock_r2
end type
type ddlb_gubun from dropdownlistbox within w_iitemstock_r2
end type
type cbx_cqty from checkbox within w_iitemstock_r2
end type
type cbx_qoh from checkbox within w_iitemstock_r2
end type
type cb_4 from commandbutton within w_iitemstock_r2
end type
type st_2 from statictext within w_iitemstock_r2
end type
type ddlb_grade from dropdownlistbox within w_iitemstock_r2
end type
end forward

global type w_iitemstock_r2 from w_inheritance
integer width = 5710
integer height = 2468
string title = "수불현황(w_iitemstock_r2)"
string icon = "Hand!"
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
pb_multi pb_multi
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
cb_4 cb_4
st_2 st_2
ddlb_grade ddlb_grade
end type
global w_iitemstock_r2 w_iitemstock_r2

type variables
//
DataWindow idw_view
DataWindowChild idwc_area, idwc_locno, idwc_wcno, idwc_qa, idwc_stock

string is_itemno, is_qa, is_dw
string is_ritype, is_rtype, is_itype	// 입,출고 형태


end variables

forward prototypes
public subroutine wf_item_stock_generate (string ls_item_no, string ls_qa)
end prototypes

public subroutine wf_item_stock_generate (string ls_item_no, string ls_qa);// 전일재고 집계작업
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
                                         sum(isnull(a.make_qty,0)) in_qty,                                                              /*입고(생산, 구매, 가입고, 반품, 물품요청입고, 코일이동입고 )*/
                                         sum(isnull(a.ship_qty,0)) out_qty,                                                             /*출고(생산투입, 판매, 대체물품,  물품요청출고, 코일이동출고,  기타(제품폐기, 기타출고 유형) )*/
							    sum(isnull(a.jaje_qty,0)) jaje_qty,
                                         sum(isnull(a.intemp_qty,0)) intemp_qty,                                              /*가입고*/
                                         sum(isnull(a.ret_qty,0)) ret_qty,                                                                 /*반품     */
                                         sum(isnull(a.etc_qty,0)) etc_qty,                                                                 /*기타출고 (제품폐기, 기타출고유형 추가 )*/
						          sum(
                                                     isnull(a.before_qty,0) +                                                                         /* 당일재고 = 전일재고 + 입고+가입고+반품-출고-기타 */
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
                                                    where stock_date   = :ls_date
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
											 WHERE convert(char(10), s.sfc_date, 112)   =   replace(:ls_sdate, '-', '')
											 group by s.loc_no, rtrim(s.wc_no),/* convert(char(10), s.sfc_date, 111),*/ s.assembly, s.assembly_qa
                                                                   union all
                                                                   select               s.loc_no
                                                                                             , s.wc_no
                                                                                             , s.item_no
                                                                                             , s.qa
                                                                                             , before_qty = 0 
                                                                                             , make_qty = 0
                                                                                             , ship_qty = 0
																	    , jaje_qty =  sum(isnull(s.use_qty,0))
                                                                                             , ret_qty = 0
                                                                                             , etc_qty = 0             
                                                                                             , intemp_qty = 0        
                                                                                             , plan_out_qty = 0
                                                                                             , plan_make_qty = 0
                                                                  from sfcuse S WITH (NOLOCK)
                                                                				               					 LEFT OUTER JOIN wc  W WITH (NOLOCK) ON s.wc_no   = w.work_no
                                                                  where convert(char(10), s.use_date, 112)   =   replace(:ls_sdate, '-', '')
                                                                  group by s.loc_no
                                                                                      , s.wc_no
                                                                                  /*    , convert(char(10), s.use_date, 111)*/
                                                                                      , s.item_no
                                                                                      , s.qa
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
														  WHERE  convert(char(10), h.insp_date, 112)   =   replace(:ls_sdate, '-', '')
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
															 WHERE convert(char(10),b.issue_date,112)  = replace(:ls_sdate, '-', '')
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
													  WHERE convert(char(10), d.alter_date, 112)   =   replace(:ls_sdate, '-', '')
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
												 WHERE convert(char(10), d.alter_date, 112)   =  replace(:ls_sdate, '-', '')
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
													WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')
													group by a.loc_no,  /*convert(char(10),a.rlse_date,111)   ,*/ a.item_no, a.qa																														 
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
											WHERE convert(char(10), a.rlse_date, 112)   =   replace(:ls_sdate, '-', '')
											group by b.ask_loc, /* convert(char(10),a.rlse_date,111)   ,*/ a.item_no,  a.qa                                  
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
											WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')
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
										WHERE convert(char(10), b.move_date, 112)   =   replace(:ls_sdate, '-', '')
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
                                                                    WHERE convert(char(10), intemp_date, 112)   =   replace(:ls_sdate, '-', '')
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
															   , ret_qty   = sum(isnull(a.ret_qty,0))
															    , etc_qty  = 0                                                                                               
                                                                                   , intemp_qty = 0
                                                                                   , plan_out_qty = 0
                                                                                   , plan_make_qty = 0
                                                                    FROM retdet a WITH(NOLOCK) inner join ret b WITH(NOLOCK) on a.ret_no = b.ret_no
                                                                    where convert(char(10), b.ret_date, 112)   =   replace(:ls_sdate, '-', '')
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
                                                                  where convert(char(10), ret_date, 112)   =   replace(:ls_sdate, '-', '')
                                                                  group by loc_no, wc_no,/* convert(char(10), ret_date, 111),*/ item_no, qa
                                                                  union all
                                                             SELECT loc_no         = isnull( l.loc_no, (  case when a.accept_area = 'B0001'    then 'WS00000006'
                                                                                                                                                           when a.accept_area = 'H0001'    then 'WS00000007'
                                                                                                                                                           when a.accept_area = 'S0001'    then 'WS00000000'
                                                                                                                                                           when a.accept_area = 'T0001'    then 'WS00000008'
                                                                                                                                                           when a.accept_area = 'Z0001'    then 'WS00000011'
                                                                                                                                                           else 'WS99999999'
                                                                                                                                                end )
                                                                                                                          )
                                                                  , WC_NO = null
                                                                  , c.item_no
                                                                  , qa             = c.qa
                                                                  , before_qty = 0 
												   , make_qty   = 0
											        , ship_qty   = 0
												   , jaje_qty = 0													  
												   , ret_qty    = 0
												   , etc_qty    = 0
                                                                  , intemp_qty = 0
                                                                  , PLAN_OUT_qty      = ISNULL(c.issue_qty,0)
                                                                  , plan_make_qty = 0
                                                               FROM issuereq   A WITH (NOLOCK)
                                                                    LEFT OUTER JOIN issuereqdet   B WITH (NOLOCK)
                                                                      ON a.req_date  = b.req_date AND a.salesman = b.salesman AND a.req_seq = b.req_seq
                                                                    LEFT OUTER JOIN saledet  C WITH (NOLOCK) ON b.sale_no = c.order_no
                                                                    LEFT OUTER JOIN location L WITH (NOLOCK) ON a.accept_user = l.loc_manager
                                                              WHERE ( convert(char(10), a.req_date, 112)   =   replace(:ls_sdate, '-', '') )
                                                                AND ( c.item_no    is not null         )
                                                                AND ( b.req_flag    = 'A'              ) /* 출고의뢰 */
                                                                AND ( a.confirm_flag= 'Y'              ) /* 확정     */
                                                                UNION ALL
                                                             /* 수주출고예정 */
                                                             SELECT          ISNULL( l.loc_no,     ( case when a.area_no = 'B0001'    then 'WS00000006'
                                                                                                                                                     when a.area_no = 'H0001'    then 'WS00000007'
                                                                                                                                                     when a.area_no = 'S0001'    then 'WS00000000'
                                                                                                                                                     when a.area_no = 'T0001'    then 'WS00000008'
                                                                                                                                                     when a.area_no = 'Z0001'    then 'WS00000011'
                                                                                                                                                     else 'WS99999999'
                                                                                                                                        end )
                                                                                                           )  loc
                                                                  ,  WC_NO = null
                                                                  , b.item_no
                                                                  , qa             = b.qa
                                                                  , before_qty = 0 
												   , make_qty   = 0
												   , ship_qty   = 0
												   , jaje_qty = 0													
												   , ret_qty    = 0
												   , etc_qty    = 0
                                                                  , intemp_qty = 0
                                                                  , plan_out_qty      = isnull(b.order_qty,0) - isnull(b.rlse_qty,0)
                                                                  , plan_make_qty = 0
                                                               FROM sale   A WITH (NOLOCK)
                                                                    LEFT OUTER JOIN saledet  B WITH (NOLOCK) ON a.order_no = b.order_no
                                                                    LEFT OUTER JOIN location L WITH (NOLOCK) ON a.org_user = l.loc_manager
                                                              WHERE ( convert(char(10), a.order_date, 112)   =   replace(:ls_sdate, '-', '')  )
                                                                AND ( b.item_no    IS NOT NULL         )
                                                                AND ( a.do_reserved = 'Y'              ) /* 출고예정 */
                                                               UNION ALL
                                                               /* 물품요청예정 */
                                                               SELECT loc_no   = ask_det.loc_no         
                                                                     , wc_no = null
                                                                    , ask_det.item_no
                                                                    , qa       = ask_det.qa             
                                                                  , before_qty = 0 
											  	   , make_qty   = 0
												   , ship_qty   = 0
												   , jaje_qty = 0													
												   , ret_qty    = 0
												   , etc_qty    = 0
                                                                  , intemp_qty = 0                                                    
                                                                  , plan_out_qty  = isnull(ask_det.ask_qty,0)  - isnull(ask_det.rlse_qty,0)
                                                                  , plan_make_qty = 0
                                                                 FROM ask_det   WITH (NOLOCK)  
                                                                      LEFT OUTER JOIN ask_head  WITH (NOLOCK) ON ask_det.ask_no = ask_head.ask_no
                                                                WHERE ( convert(char(10), ask_head.ask_date, 112)   =   replace(:ls_sdate, '-', '')   ) 
                                                                  AND ( ask_head.proc_flag <> 'Y' )  /* 완료(Y), 부분(P), 요청(N) */ 
                                                                  AND ( ask_det.rlse_flag   = 'N'  ) /* 완료(Y), 진행(N) */
                                                                  AND ( ask_det.loc_no = (case when ask_head.f_area = 'T0001' then 'WS00000008' 
                                                                                                                                     when ask_head.f_area = 'S0001' then 'WS00000000' 
                                                                                               else  'WS99999999' 
                                                                                          end)
                                                                                ) 
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
                                                                WHERE convert(char(10), b.aban_date, 112)   =  replace(:ls_sdate, '-', '')
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
											  where convert(char(10), etcout_date, 112) =  replace(:ls_sdate, '-', '')
											group by loc_no, item_no, qa
                                                                /*                
                                                                                      and     b.process_flag   = 'Y'
                                                                                      and     ( ( case when ( b.approve_team is null ) or (b.approve_team = '') then 'N' else 'Y' end ) ) = 'Y'
                                                                */                                                                
                                                                UNION ALL
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
                                                                                                  , plan_make_qty =  sum(isnull(D.PLAN_QTY,0))
														FROM MPSDET A WITH(NOLOCK) LEFT OUTER JOIN MPSORDER B WITH(NOLOCK) ON A.mpsorder_order = B.ORDER_NO
																			  INNER JOIN WC C WITH(NOLOCK) ON A.WC_NO = C.WORK_NO		
																			  		 INNER JOIN routtempnew D WITH(NOLOCK) ON D.division        = A.division AND
																																					D.sale_no         = A.sale_no AND
																																					D.seq_no          = A.seq_no AND
																																					D.wc_no           = A.wc_no AND
																																					D.assy_item       = A.item_no AND
																																					D.assy_qa         = A.qa
                                                                              WHERE  convert(char(10), B.ORDER_DATE, 112)   =   replace(:ls_sdate, '-', '')
                                                                              GROUP BY C.DEF_LOC, 
                                                                                                       A.WC_NO, 
                                                                                                       A.ITEM_NO, 
                                                                                                       A.QA
                												) a inner join groupitem  b on a.item_no = b.item_no
                                                 where a.item_no = :ls_item_no
			                                    and a.qa = :ls_qa													 									  
                                          group by    a.loc_no,
											a.item_no,
											 a.qa                                      
                                        having         abs(sum(isnull(a.make_qty,0))) +
                                                           abs(sum(isnull(a.ship_qty,0)))   +
											  abs(sum(isnull(a.jaje_qty,0)))   +
                                                           abs(sum(isnull(a.intemp_qty,0))) +
                                                           abs(sum(isnull(a.ret_qty,0))) +
                                                           abs(sum(isnull(a.plan_out_qty,0))) +
                                                           abs(sum(isnull(a.plan_make_qty,0))) +
                                                           abs(sum(isnull(a.etc_qty,0)) )  +
          										 abs(sum( isnull(a.before_qty,0) ) ) <> 0																										                        
                    );	 
	      
			  
		commit;

		MessageBox("확인", "[" + ls_item_name + "] 재고 집계작업 완료!!!" )
			
	end if



end subroutine

on w_iitemstock_r2.create
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
this.pb_multi=create pb_multi
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
this.cb_4=create cb_4
this.st_2=create st_2
this.ddlb_grade=create ddlb_grade
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
this.Control[iCurrent+19]=this.pb_multi
this.Control[iCurrent+20]=this.dw_4
this.Control[iCurrent+21]=this.dw_5
this.Control[iCurrent+22]=this.st_3
this.Control[iCurrent+23]=this.cbx_op
this.Control[iCurrent+24]=this.dw_6
this.Control[iCurrent+25]=this.cbx_user
this.Control[iCurrent+26]=this.cbx_all
this.Control[iCurrent+27]=this.hpb_1
this.Control[iCurrent+28]=this.st_1
this.Control[iCurrent+29]=this.ddlb_gubun
this.Control[iCurrent+30]=this.cbx_cqty
this.Control[iCurrent+31]=this.cbx_qoh
this.Control[iCurrent+32]=this.cb_4
this.Control[iCurrent+33]=this.st_2
this.Control[iCurrent+34]=this.ddlb_grade
end on

on w_iitemstock_r2.destroy
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
destroy(this.pb_multi)
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
destroy(this.cb_4)
destroy(this.st_2)
destroy(this.ddlb_grade)
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

em_1.text = string(today(), 'yyyy/mm/dd')

dw_2.visible = false				// 전일재고
dw_4.visible  = false 			// 가용량보기
dw_5.visible  = false 			// 상세보기
dw_6.visible  = false 			// 출고예정

dw_4.SetTransObject(sqlca)		// 가용량
dw_5.SetTransObject(sqlca)		// 상세보기
dw_6.SetTransObject(sqlca)		// 출고예정
ddlb_gubun.text = '전체'
ddlb_grade.text = '전체'

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
string ls_area, ls_locno, ls_loc, ls_sdate, ls_edate
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

pb_multi.enabled  = false  		// 다중추가
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
	
	pb_multi.enabled  = true  		// 다중추가
//	pb_ewol.enabled   = true 		// 전일재고 집계작업
	pb_save.enabled   = true 		// 저장
	pb_delete.enabled = true 		// 삭제
end if	

				  





     
end event

event resize;call super::resize;//
//gb_5.width  = newwidth  - (gb_5.x * 2)

//hpb_1.width = newwidth  - (gb_5.x * 2)

//gb_6.width  = newwidth  - (gb_5.x * 2)

dw_1.width  = newwidth  
dw_1.height = newheight - dw_1.y

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

type pb_save from w_inheritance`pb_save within w_iitemstock_r2
integer x = 3488
integer y = 72
integer taborder = 50
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

type dw_1 from w_inheritance`dw_1 within w_iitemstock_r2
integer x = 32
integer y = 432
integer width = 4718
integer height = 1920
integer taborder = 80
string dataobject = "d_iitemstock2_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rbuttondown;call super::rbuttondown;m_manager manager
date   ld_start,  ld_end
string ls_itemnm, ls_itemno, ls_qa
string ls_sdate, ls_locno, ls_gubun, ls_locname
	
	
manager = CREATE m_manager

manager.m_itemstock.m_item_generate.visible = false
manager.m_itemstock.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())

choose case gs_print_control
//	case 'item_generate'
//		
//		ls_itemno = dw_1.object.item_no[row]		
//		ls_qa     = dw_1.object.qa[row]
//		
//		wf_item_stock_generate(ls_itemno, ls_qa)
		
	case 'item_research'
		
		if isnull(row) OR row < 1 then RETURN
		
		ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)
		
		ls_locno = trim(dw_3.object.loc_no[1])
		
		if ls_locno = "" then
			ls_locno = "%"
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
		
		ls_locname = dw_1.object.loc_name[row]
		ls_itemno = dw_1.object.item_no[row]
		ls_itemnm = dw_1.object.item_name[row]
		ls_qa     = dw_1.object.qa[row]
		
		
		dw_4.reset()
		dw_4.title = "품목 일일수불 확인: [" + ls_locname+ "] " + ls_itemnm + " | " + ls_qa
		
		dw_4.setredraw( false )
		dw_4.visible    = true 
		dw_4.bringtotop = true
		dw_4.retrieve(ls_gubun, ls_locno, ls_sdate, ls_itemno, ls_qa)
		dw_4.setredraw( true )	
		
	case 'item_stock_end'		
		
end choose







end event

event dw_1::itemchanged;call super::itemchanged;choose case dwo.name
	case "stock_qty", "ret_qty", "etc_qty"
		this.SelectText(1, LenA(this.GetText()) + 5)
end choose
end event

type st_title from w_inheritance`st_title within w_iitemstock_r2
integer x = 41
integer y = 48
integer width = 1061
string text = "구매 일일마감관리"
end type

type st_tips from w_inheritance`st_tips within w_iitemstock_r2
end type

type pb_compute from w_inheritance`pb_compute within w_iitemstock_r2
boolean visible = false
integer x = 4178
integer y = 252
integer height = 88
integer taborder = 170
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

type pb_print_part from w_inheritance`pb_print_part within w_iitemstock_r2
boolean visible = false
integer x = 3982
integer y = 252
integer height = 88
integer taborder = 40
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

type pb_close from w_inheritance`pb_close within w_iitemstock_r2
integer x = 3685
integer y = 76
integer taborder = 190
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iitemstock_r2
integer x = 4224
integer y = 68
integer taborder = 220
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then RETURN

debugbreak()

dw_1.getchild("save_stock", idwc_stock)
idwc_stock.settransobject(sqlca)
idwc_stock.retrieve("SAVE_STOCK")

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 배치재고 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=77'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iitemstock_r2
boolean visible = false
integer x = 4375
integer y = 252
integer height = 88
integer taborder = 260
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

type pb_delete from w_inheritance`pb_delete within w_iitemstock_r2
integer x = 3113
integer y = 80
integer taborder = 290
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

type pb_insert from w_inheritance`pb_insert within w_iitemstock_r2
boolean visible = false
integer x = 1353
integer y = 76
integer taborder = 320
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iitemstock_r2
integer x = 2720
integer y = 76
integer taborder = 310
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_locno, ls_sdate, ls_year, ls_month, ls_defno, ls_mindate, ls_gubun, ls_grade
string ls_itemno = "%", ls_qa = "%",  ls_rall, ls_iall,  ls_ralls[7], ls_ialls[9], ls_ritype, ls_rtype, ls_itype
long   ll_row, ll_cnt,  ll_iX

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
ls_grade = trim(ddlb_grade.text)

GF_DW2UnFilter( dw_1 )

dw_3.accepttext()			// 저장소
dw_area.accepttext()


ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)


//ls_area  = trim(dw_area.object.area[1])
//if ls_area = "" then ls_area = "%"

ls_locno = trim(dw_3.object.loc_no[1])
if ls_locno = "" then
	ls_locno = "%"

//	cbx_savestock.enabled = false  	// 분류/안전재고
//	cbx_qoh.enabled   = false  		// 전산재고 => 현재고 만들기
//	pb_multi.enabled  = false  		// 다중추가
//	pb_ewol.enabled   = false 			// 전일재고 집계작업
//	pb_save.enabled   = false 			// 저장
//	pb_delete.enabled = false 			// 삭제
//
//	MessageBox("확인", "전체저장소 는 작업을 할 수 없습니다.")
//	RETURN
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

// 기초재고 일자
/*
SELECT Distinct top 1 a.stock_date INTO :ls_mindate
  FROM item_stock a 
 WHERE a.loc_no = :ls_locno GROUP BY a.stock_date;
*/ 
 
SELECT TOP 1 A.STOCK_DATE INTO :LS_MINDATE
FROM item_stock a 
 WHERE a.loc_no like :ls_locno 
ORDER BY  a.stock_date ASC;
 
if ls_sdate < ls_mindate then 
	MessageBox("확인", "저장소의 기초재고 일자(" + ls_mindate + ")~n~n이전 자료는 조회할 수 없습니다.")
	RETURN
end if

//if ls_area = "%" AND ls_locno = "%" then
//else
//	SELECT loc_no  INTO :ls_defno FROM location WHERE area_no = :ls_area AND loc_no = :ls_locno;
//	if ls_defno <> ls_locno then
//		MessageBox("확인", "사업장과 저장소가 일치하지 않습니다.")
//		RETURN
//	end if
//end if


//cbx_stock.checked = false
dw_1.visible = true
is_dw = "dw_1"
dw_1.reset()
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

////////////////////////////////////////////////////////////////////
dw_1.setredraw( false )
dw_1.retrieve( ls_gubun, ls_locno, ls_sdate )		// 현재고

//// 기초재고 이전자료 무시하기
//if ls_sdate <= ls_mindate then
//	for ll_row = 1 to dw_1.rowcount()
//		dw_1.object.rcpt_qty[ll_row]   = 0
//		dw_1.object.issue_qty[ll_row]  = 0
//		dw_1.object.ret_qty[ll_row]    = 0
//		dw_1.object.etc_qty[ll_row]    = 0
//	next
//end if
//
dw_1.setredraw( true )
////////////////////////////////////////////////////////////////////

SELECT count(*) INTO :ll_cnt FROM item_stock WHERE loc_no like :ls_locno AND stock_date = convert(char(10), dateadd(day, -1, convert(datetime, :ls_sdate) ),112);

if ll_cnt < 1 then
	//pb_ewol.setfocus()
	MessageBox("확인","전일재고 데이터가 존재하지 않습니다.~n~n'전일재고 집계작업'을 실행하시기 바랍니다.")
else
	MessageBox("확인","조회완료")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iitemstock_r2
integer x = 2149
integer y = 16
integer width = 517
integer height = 232
integer taborder = 100
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회일자"
end type

type gb_2 from w_inheritance`gb_2 within w_iitemstock_r2
integer x = 1225
integer y = 16
integer width = 910
integer height = 232
integer taborder = 130
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_iitemstock_r2
integer x = 2683
integer y = 16
integer width = 1883
integer height = 232
integer taborder = 60
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_iitemstock_r2
integer x = 1161
integer y = 28
integer width = 128
integer height = 80
integer taborder = 90
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

type dw_3 from datawindow within w_iitemstock_r2
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
pb_multi.enabled  = false  		// 다중추가
pb_save.enabled   = false 			// 저장
pb_delete.enabled = false 			// 삭제

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
		if ls_loc = " " then MessageBox("확인","저장소를 선택하시기 바랍니다.")
	end if	
//end if	


end event

type em_1 from editmask within w_iitemstock_r2
integer x = 2185
integer y = 112
integer width = 443
integer height = 80
integer taborder = 70
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

type ddlb_dwtitles from dropdownlistbox within w_iitemstock_r2
integer x = 283
integer y = 300
integer width = 311
integer height = 88
integer taborder = 230
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

type st_4 from statictext within w_iitemstock_r2
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

type ddlb_op from dropdownlistbox within w_iitemstock_r2
integer x = 891
integer y = 288
integer width = 274
integer height = 512
integer taborder = 240
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

type sle_value from singlelineedit within w_iitemstock_r2
integer x = 1184
integer y = 296
integer width = 535
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

type cb_1 from commandbutton within w_iitemstock_r2
integer x = 1934
integer y = 296
integer width = 146
integer height = 76
integer taborder = 180
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

type cb_2 from commandbutton within w_iitemstock_r2
integer x = 2085
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

type cb_3 from commandbutton within w_iitemstock_r2
integer x = 2235
integer y = 296
integer width = 146
integer height = 76
integer taborder = 250
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

type cb_5 from commandbutton within w_iitemstock_r2
integer x = 2386
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

type ddlb_fld from dropdownlistbox within w_iitemstock_r2
integer x = 251
integer y = 288
integer width = 443
integer height = 632
integer taborder = 210
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

type st_7 from statictext within w_iitemstock_r2
boolean visible = false
integer x = 1221
integer y = 2388
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

type dw_area from datawindow within w_iitemstock_r2
boolean visible = false
integer x = 1431
integer y = 2388
integer width = 549
integer height = 80
integer taborder = 150
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
pb_multi.enabled  = false  		// 다중추가
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


end event

event rowfocuschanged;// 사업장

dw_area.accepttext()

end event

type cbx_o08 from checkbox within w_iitemstock_r2
boolean visible = false
integer x = 2789
integer y = 420
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

type cbx_o09 from checkbox within w_iitemstock_r2
boolean visible = false
integer x = 3291
integer y = 420
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

type gb_4 from groupbox within w_iitemstock_r2
boolean visible = false
integer x = 1239
integer y = 16
integer width = 846
integer height = 232
integer taborder = 110
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

type gb_6 from groupbox within w_iitemstock_r2
integer x = 32
integer y = 244
integer width = 4718
integer height = 160
integer taborder = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_1 from picturebutton within w_iitemstock_r2
event mousemove pbm_mousemove
integer x = 3310
integer y = 84
integer width = 187
integer height = 144
integer taborder = 300
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

type pb_multi from picturebutton within w_iitemstock_r2
boolean visible = false
integer x = 4338
integer y = 284
integer width = 389
integer height = 104
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "다중추가"
vtextalign vtextalign = vcenter!
end type

event clicked;// 다중추가
gs_where2 lstr_where

long    ll_row, ll_cnt, ll_find, ll_skip
string  ls_area, ls_locno, ls_itemno, ls_itemnm, ls_qa, ls_savestock, ls_uom, ls_sdate

dw_3.accepttext()
dw_area.accepttext()

ls_sdate = em_1.text

ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]


/////////////////////////////////////////////////////////////////
// 다중추가 화면
/////////////////////////////////////////////////////////////////
lstr_where.chk     = "M"   // M:multi S:single
lstr_where.chk1    = ls_locno
lstr_where.str8[1] = em_1.text
OpenWithParm( w_whitemlocqohmulti_w2, lstr_where )
lstr_where = Message.PowerObjectParm
/////////////////////////////////////////////////////////////////

if lstr_where.chk <> "Y" then RETURN

ll_skip  = dw_1.rowcount()
//=============================================================//
// 다중추가 품목 반영하기
//=============================================================//
//					SET before_qty = :ld_qoh
//					  , rcpt_qty   = 0
//					  , issue_qty  = 0
//					  , ret_qty    = 0
//				     , etc_qty    = 0
//					  , qoh        = :ld_qoh
//
for ll_row = 1 to UpperBound(lstr_where.str1)                  
   ls_itemno = trim(lstr_where.str1[ll_row])
   ls_itemnm = Trim(lstr_where.name[ll_row])
   ls_qa     = trim(lstr_where.str2[ll_row])
   ls_uom    = trim(lstr_where.str3[ll_row])
	
	ll_find = dw_1.Find( "item_no = '"+ls_itemno+"' and qa = '"+ls_qa+"'", 1, dw_1.RowCount())
	if ll_find > 0 AND ll_find <= dw_1.rowcount() then
		ll_cnt = ll_find
	else
		ll_cnt = dw_1.InsertRow(0)
		dw_1.Object.loc_no[ll_cnt]    = ls_locno						// 저장소
		dw_1.Object.batchdate[ll_cnt] = datetime(date(em_1.text), time("00:00:00.000")) 	// 일자
		dw_1.Object.item_no[ll_cnt]   = ls_itemno						// 품목
		dw_1.Object.item_name[ll_cnt] = ls_itemnm						// 품명
		dw_1.Object.qa[ll_cnt]        = ls_qa							// 규격
		
		setnull( ls_savestock )
		SELECT top 1 save_stock INTO :ls_savestock
		  FROM item_batchstock 
		 WHERE loc_no = :ls_locno AND item_no = :ls_itemno AND qa = :ls_qa
		 ORDER BY batchdate DESC;
		 
		dw_1.Object.save_stock[ll_cnt]= ls_savestock             // 분류
		dw_1.Object.before_qty[ll_cnt]= 0								// 전일재고
		dw_1.Object.rcpt_qty[ll_cnt]  = 0								// 생산(+)
		dw_1.Object.issue_qty[ll_cnt] = 0								// 출고(-)
		dw_1.Object.ret_qty[ll_cnt]   = 0								// 반품(+)
		dw_1.Object.etc_qty[ll_cnt]   = 0								// 기타(-)
		dw_1.Object.qoh[ll_cnt]       = 0								// 현재고
		dw_1.Object.sysdate[ll_cnt]   = GF_Today()               // 등록일자
		dw_1.Object.rem[ll_cnt]       = "[추가]" + gs_username   // 등록일자
	end if
	dw_1.ScrollToRow( ll_cnt )
next
//=============================================================//

//dw_1.ScrollToRow( ll_skip + 1 )

dw_1.SetColumn('ret_qty')
dw_1.SetFocus()

end event

type dw_4 from datawindow within w_iitemstock_r2
integer x = 923
integer y = 620
integer width = 3502
integer height = 1048
integer taborder = 160
boolean bringtotop = true
boolean titlebar = true
string title = "품목 일일수불 확인"
string dataobject = "d_iitemstock_m1"
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

type dw_5 from datawindow within w_iitemstock_r2
integer x = 1115
integer y = 1136
integer width = 2770
integer height = 616
integer taborder = 120
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

type st_3 from statictext within w_iitemstock_r2
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

type cbx_op from checkbox within w_iitemstock_r2
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

type dw_6 from datawindow within w_iitemstock_r2
integer x = 1403
integer y = 1420
integer width = 2327
integer height = 396
integer taborder = 330
boolean bringtotop = true
boolean titlebar = true
string title = "출고예정"
string dataobject = "d_oiissuereq_s_sale"
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

type cbx_user from checkbox within w_iitemstock_r2
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

type cbx_all from checkbox within w_iitemstock_r2
boolean visible = false
integer x = 3817
integer y = 316
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

type hpb_1 from hprogressbar within w_iitemstock_r2
integer x = 32
integer y = 268
integer width = 4718
integer height = 160
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_1 from statictext within w_iitemstock_r2
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

type ddlb_gubun from dropdownlistbox within w_iitemstock_r2
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
string item[] = {"전체","제품","상품","자재","전단(스)"}
borderstyle borderstyle = stylelowered!
end type

type cbx_cqty from checkbox within w_iitemstock_r2
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

type cbx_qoh from checkbox within w_iitemstock_r2
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

type cb_4 from commandbutton within w_iitemstock_r2
boolean visible = false
integer x = 1623
integer y = 88
integer width = 439
integer height = 104
integer taborder = 30
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

type st_2 from statictext within w_iitemstock_r2
boolean visible = false
integer x = 2062
integer y = 2388
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

type ddlb_grade from dropdownlistbox within w_iitemstock_r2
boolean visible = false
integer x = 2277
integer y = 2388
integer width = 530
integer height = 600
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
string item[] = {"전체","성형류","","",""}
borderstyle borderstyle = stylelowered!
end type

