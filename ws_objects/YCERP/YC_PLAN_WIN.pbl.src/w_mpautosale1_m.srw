$PBExportHeader$w_mpautosale1_m.srw
$PBExportComments$자동생산계획생성(1998/04/07,곽용덕)
forward
global type w_mpautosale1_m from w_inheritance
end type
type dw_3 from datawindow within w_mpautosale1_m
end type
type dw_4 from datawindow within w_mpautosale1_m
end type
type st_1 from statictext within w_mpautosale1_m
end type
type st_2 from statictext within w_mpautosale1_m
end type
type st_info from statictext within w_mpautosale1_m
end type
type cb_4 from commandbutton within w_mpautosale1_m
end type
type st_3 from statictext within w_mpautosale1_m
end type
type st_4 from statictext within w_mpautosale1_m
end type
type st_5 from statictext within w_mpautosale1_m
end type
type st_6 from statictext within w_mpautosale1_m
end type
type st_7 from statictext within w_mpautosale1_m
end type
type st_vertical from u_splitbar_vertical within w_mpautosale1_m
end type
type dw_5 from datawindow within w_mpautosale1_m
end type
type cb_2 from commandbutton within w_mpautosale1_m
end type
type cb_1 from commandbutton within w_mpautosale1_m
end type
end forward

global type w_mpautosale1_m from w_inheritance
integer width = 4978
integer height = 2300
string title = "자동생산계획생성:시화(w_mpautosale1_m)"
event ue_1 pbm_custom01
dw_3 dw_3
dw_4 dw_4
st_1 st_1
st_2 st_2
st_info st_info
cb_4 cb_4
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
st_vertical st_vertical
dw_5 dw_5
cb_2 cb_2
cb_1 cb_1
end type
global w_mpautosale1_m w_mpautosale1_m

type variables
string is_select, is_clause, is_where, is_loc
datawindowchild idwc_item, idwc_qa
real ir_qty=0,ir_oldsolqty
long il_caparate = 0

end variables

forward prototypes
public function boolean wf_alter (long arg_cnt)
public function boolean wf_plandet (long arg_cnt)
public function boolean wf_onecalc (long arg_cnt)
end prototypes

event ue_1;//
is_select = dw_2.Describe("DataWindow.Table.Select")
pb_retrieve.postevent(clicked!)

end event

public function boolean wf_alter (long arg_cnt);// 
long     ll_row, ll_ins
string   ls_itemno, ls_itemnm, ls_qa
datetime ldt_sysdate

ldt_sysdate = gf_today()

for ll_row = 1 to arg_cnt
	// itemjaego: 재고물품이면 무조건 생산계획을 생성하지 않는다.
	ls_itemno = dw_1.object.itemjaego_item_no[ll_row]
	ls_itemnm = dw_1.object.groupitem_item_name[ll_row]
	ls_qa     = trim(dw_1.object.qa[ll_row])
	
	if isnull(ls_itemno) OR trim(ls_itemno) = "" then
	else
		// 재고물품인 경우 saledet.sol_qty에 가용량을 넣지 않고
		// 출고시에 수동으로 가용량을 설정후 출고할 수 있도록함.
		dw_1.object.saledet_text[ll_row] = 'X'

		ll_ins  = dw_4.insertrow(0)
		dw_4.object.rout_date[ll_ins] = ldt_sysdate
		dw_4.object.area_no[ll_ins]   = "S0001"
		dw_4.object.user_id[ll_ins]   = gs_userid
		dw_4.object.rout_msg[ll_ins]  = "SKIP  - [" + ls_itemnm + "][" + ls_qa + "] '재고물품 테이블에 존재함' " + STRING(now())		
	end if
next

RETURN true

end function

public function boolean wf_plandet (long arg_cnt);////////////////////////////////////////////////////////////////////////
// routtempnew.plan_flag    = "Y" : 생산계획반영
//								    = "N" : 생산계획에 반영하지않는다.
//	2018.05.17 jowonsuk 이아래건은 모두 Y로 해야 한다.
// routtempnew.process_flag = "Y" : 첫번째공정인경우
//								    = "N" : 첫번째공정이 아닌경우
////////////////////////////////////////////////////////////////////////
long     ll_ins, ll_row, l_qa_check
string   ls_source, ls_error, ls_order, ls_item, ls_itemnm, ls_qa, ls_rem, ls_qa1, ls_like, ls_color
string   ls_cust, ls_scene, ls_uom, ls_suju, ls_wc, ls_assyitem, ls_assyqa, ls_flag, ls_represent
real     lr_qpa,lr_notqty, lr_setuptime, lr_runtime, lr_planqty, lr_qoh, lr_saleqty, lr_prodqty
datetime ldt_duedate
long     ll_cnt, j
int      li_count, li_seq, li_bom, li_workper, li_operation, li_op
string   ls_itemname, ls_mpuom, ls_qa2, ls_str, ls_qa3, ls_temp, ls_area, ls_sos, ls_text
datetime ldt_sysdate

ldt_sysdate = gf_today()

//OPEN(W_ICPROCESS)
dw_1.accepttext()

for ll_row = 1 to arg_cnt
	
//	w_icprocess.hpb_1.position = (ll_row / arg_cnt) * 100
	
	ls_error    = ""
	ls_order    = trim(dw_1.object.order_no[ll_row])  
	ls_item     = trim(dw_1.object.item_no[ll_row])
	ls_itemnm   = trim(dw_1.object.groupitem_item_name[ll_row])
	ls_qa       = trim(dw_1.object.qa[ll_row])
	ls_rem      = trim(dw_1.object.rem[ll_row])
	
	// 표준공정의 규격은 길이를 "00000"으로한 대표 공정만이 들어있다.
	ls_qa1      = MidA(ls_qa,1,13) + "X00000"
	ls_like     = MidA(ls_qa,1,13) + "%"
	ls_color    = trim(dw_1.object.color[ll_row])
	ls_cust     = trim(dw_1.object.sale_cust_no[ll_row])
	ls_scene    = trim(dw_1.object.sale_scene_code[ll_row])
	ls_uom      = trim(dw_1.object.uom[ll_row])
	ldt_duedate = dw_1.object.sale_due_date[ll_row]
	li_seq      = dw_1.object.seq_no[ll_row]
	
   // 생산계획수량을 주문수량 전체로 계획반영함
	lr_notqty   = dw_1.object.order_qty[ll_row]
	
	// 물품출처(groupitem_source) "B": 구매품은 무조건 생산계획을 생성하지 않는다. 
	// 생산계획여부(saledet_text) "N": 불가, "X": 가능
	// 가용량(sol_qty > 0, "부분", "생산")
	
	if dw_1.object.groupitem_source[ll_row] = "B" OR dw_1.object.saledet_text[ll_row] = "X" then
		
		ll_ins  = dw_4.insertrow(0)
		dw_4.object.rout_date[ll_ins] = ldt_sysdate
		dw_4.object.area_no[ll_ins]   = "S0001"
		dw_4.object.user_id[ll_ins]   = gs_userid
		
		dw_4.object.rout_msg[ll_ins]  = "SKIP  - [" + ls_itemnm + "][" + ls_qa1 + "] '" + ls_sos + "구매품', '" + ls_text + "생산완료' " + STRING(now())		
		
		CONTINUE
		
	end if

	ls_suju = "Y" // 2004/08/12 'E' => 'Y' 로 변경	
	
	/* 2020-04-08 jowonsuk 대표공정 반영이 제대로 안되어 있었음 */
	
	

	long l_row
	
	l_row = 0
	
	select count(*)
	into :l_row
	from rout
	where item_no = :ls_item
          and qa like :ls_like;		 
		 
	IF l_row > 0 THEN
		dw_3.dataobject = 'd_mproutnew_m'
		dw_3.settransobject(sqlca)		
		ll_cnt  = dw_3.retrieve( ls_item, ls_like )			
	ELSE		
		dw_3.dataobject = 'd_mproutnew_m_represent'
		dw_3.settransobject(sqlca)		
		ll_cnt  = dw_3.retrieve( ls_item, ls_qa)
	END IF
		 
//		SELECT DISTINCT ROUT.ASSEMBLY ITEM_NO, :ls_qa QA
//			into :ls_assy_item, :ls_assy_qa
//		FROM ROUT INNER JOIN 
//								(
//									 select ITEM_NO, QA, (OPERATION - 1) OPERATION
//									 from rout
//									 where assembly = :ls_item
//										and represent = 'Y'
//								)   ROUT1  ON ROUT.ITEM_NO = ROUT1.ITEM_NO AND ROUT.OPERATION = ROUT1.OPERATION
//		  WHERE represent = 'Y';	
	
	// 품목+규격의 공정관리 확인 
//	ll_cnt  = dw_3.retrieve( ls_item, ls_like )
	
	if ll_cnt < 1 then
		ROLLBACK;

		ll_ins  = dw_4.insertrow(0)
		dw_4.object.rout_date[ll_ins] = ldt_sysdate
		dw_4.object.area_no[ll_ins]   = "S0001"
		dw_4.object.user_id[ll_ins]   = gs_userid
		dw_4.object.rout_msg[ll_ins]  = "오류  - [" + ls_itemnm + "][" + ls_qa1 + "] 물품의 공정이 등록되지[제품별 공정관리(w_cditemwc)] 않았습니다. " + STRING(now())
		CONTINUE
		
	else
		
		for j =  1 to ll_cnt		// 공정단계까지
			ls_wc        = trim(dw_3.object.wc_no[j])
			lr_setuptime = dw_3.object.setup_time[j]
			lr_runtime   = dw_3.object.run_time[j]
			li_workper   = dw_3.object.work_per[j]
			ls_area      = dw_3.object.area_no[j]
			li_operation = dw_3.object.operation[j]   // order_qty - ( sol_qty + rlse_qty + planqty )
			ls_flag = dw_3.object.flag[j] 				  // 2018.05.10  조원석 수정 dw_3의 데이터윈도우에 쿼리 넣음.		
			ls_assyitem  = trim(dw_3.object.assembly[j])
			ls_assyqa    = trim(dw_3.object.assy_qa[j])
			lr_qpa       = dw_3.object.qpa[j]     
			li_bom       = dw_3.object.bom_no[j]
			//			2018.05.10  조원석 수정 dw_3의 데이터윈도우에 쿼리 넣음.				
			ls_itemname  = dw_3.object.item_name[j]
			ls_uom          = dw_3.object.uom[j]
			ls_source      = dw_3.object.source[j]
			ls_mpuom     = dw_3.object.mp_uom[j]
			
			//			2018.01.15  조원석 수정 dw_3의 데이터윈도우에 쿼리 넣음.	
/*			
			setnull(ls_itemname)
			ls_itemname  = dw_3.object.item_name[j]
			ls_uom       = dw_3.object.uom[j]			
			ls_source    = dw_3.object.source[j]						
			ls_mpuom     = dw_3.object.mpuom[j]				
*/			
  		   //실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
			lr_planqty   = lr_qpa * lr_notqty      

/*			2018.01.15  조원석 수정 dw_3의 데이터윈도우에 쿼리 넣음. 주석처리
			if li_operation = 1 then리
				ls_flag = "Y"
			else
				ls_flag = "N"
			end if
*/

/*			2018.01.15  조원석 수정 dw_3의 데이터윈도우에 쿼리 넣음. 주석처리 
			SELECT item_name, uom, source, mp_uom 
			  INTO :ls_itemname, :ls_uom, :ls_source, :ls_mpuom 
			  FROM groupitem 
			 WHERE item_no = :ls_assyitem;
*/			 
//			ls_represent = dw_3.object.represent[j] /*2019.12.24 jowonsuk 대표공정 = 'Y' 일때 완제품의 qa를 사용하는 것*/ 
	
/*			if sqlca.sqlcode = 100 OR sqlca.sqlcode < 0 then*/ /* 2018.01.15  조원석 수정 dw_3의 데이터윈도우에 쿼리 넣음.	*/
			if isnull(ls_itemname) or ls_itemname  = '' then
				ROLLBACK;

				ll_ins  = dw_4.insertrow(0)
				dw_4.object.rout_date[ll_ins] = ldt_sysdate
				dw_4.object.area_no[ll_ins]   = "S0001"
				dw_4.object.user_id[ll_ins]   = gs_userid
				dw_4.object.rout_msg[ll_ins]  = "오류  - [" + ls_assyitem + "] 물품구성이[제품별 공정관리(w_cditemwc)] 잘못되었습니다. " + STRING(now())
				
				ls_error = "Y"
				EXIT
				
			end if
			 
			ls_qa2 = ls_qa
			
			if MidA(ls_assyitem,1,1) = "P" then
				
				ls_str = MidA(ls_assyqa,1,14)
				
				choose case MidA(ls_item,5,3)
					case "0LT"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 138),5)						
					case "0LC"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0C1"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0C2"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0C4"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0C5"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0CT"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0GC"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0GM"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 52),5)						
					case "OMT"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 52),5)
				end choose
			end if
			 
			if MidA(ls_assyitem,1,1) = "M" then
				ls_qa2 = ls_assyqa
				// 실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
				lr_planqty = lr_planqty * (real(MidA(ls_qa,15,5)) / 1000.0) 
			end if
			/* 제품별공정관리 반제품코드가 없는게 등록되어 있으면  제품코드를 만드는 로직으로 말도 안되는 로직이다. 주석처리  2018.05.10 jowonsuk  */ 

			SELECT count(*) INTO :li_count FROM item WHERE item_no = :ls_assyitem AND qa = :ls_qa2;
			
			if li_count = 0 then
				
				ls_qa3 = MidA(ls_qa2,1,14) + "00000"
				
				INSERT INTO item (item_no,qa,loc_no,item_name,uom,source,leadtime,count_code,qoh,sales_reserved,
			          prodn_reserved,pur_reserved,reorder,safety_stock,lot,obsolete_code,scrap_qty,
			          price_a,price_b,price_c,std_setup,std_material,std_labor,std_burden,std_subcontract,
			          std_machine,month_qty,safety_day,qa1, use_flag)
				VALUES (:ls_assyitem,:ls_qa2,'WS00000000',:ls_itemname,:ls_uom,:ls_source,0,'M',0,0,
			          0,0,0,0,0,'N',0,0,0,0,0,0,0,0,0,0,0,0,:ls_qa3, 'Y');
						 
			   if sqlca.sqlcode < 0 then
					ROLLBACK;

					ll_ins  = dw_4.insertrow(0)
					dw_4.object.rout_date[ll_ins] = ldt_sysdate
					dw_4.object.area_no[ll_ins]   = "S0001"
					dw_4.object.user_id[ll_ins]   = gs_userid
					dw_4.object.rout_msg[ll_ins]  = "오류4  - " + string(sqlca.sqlerrtext) + STRING(now())

					ls_error = "Y"
					EXIT
			   end if
				 
			   SELECT count(*) INTO :li_count FROM itempattern WHERE item_no = :ls_assyitem AND qa1 = :ls_qa3;
				
			   if li_count = 0 then
					
			      INSERT INTO itempattern (item_no,qa1) VALUES (:ls_assyitem,:ls_qa3);
					if sqlca.sqlcode < 0 then
						ROLLBACK;

						ll_ins  = dw_4.insertrow(0)
						dw_4.object.rout_date[ll_ins] = ldt_sysdate
						dw_4.object.area_no[ll_ins]   = "S0001"
						dw_4.object.user_id[ll_ins]   = gs_userid
						dw_4.object.rout_msg[ll_ins]  = "오류5  - [" + ls_assyitem + "][" + ls_qa3 + "] 물품코드 저장중 오류가 발생하였습니다 " + STRING(now())

						ls_error = "Y"
						EXIT
					end if
					
				end if				 
				
			end if
	 
			if j = 1 then 		// 마지막공정이면(완제품공정)
			
				if lr_runtime = 0 then
				else
				    choose case trim(ls_mpuom)
			         case "M"
					      if MidA(ls_assyitem,1,1) = "M" then
				            lr_runtime = (60.0 * (real(long(MidA(ls_qa, 15,5)) / 1000000.0) * lr_planqty)) / lr_runtime
						   else
							   lr_runtime = (60.0 * (real(long(MidA(ls_qa2,15,5)) / 1000000.0) * lr_planqty)) / lr_runtime 
						   end if
							
			         case else
				         lr_runtime = (60.0 * lr_planqty) / lr_runtime
					end choose
				end if
				  
				if lr_runtime > 9999 then lr_runtime = 1
				 /* 2019-10-23 jowonsuk 생산납기일자 반영 기존 예정일자 */
//				// insert routtempnew #-1
				INSERT INTO routtempnew (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
			          cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
			          assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem, area_no)
		     			 VALUES (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
		              :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
		              :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem, :ls_area);
						  
				if sqlca.sqlcode < 0 then
					
					int ll_int3
					
					SELECT count(*) INTO :ll_int3 FROM routtempnew
					 WHERE operation = :li_operation	AND wc_no  = :ls_wc
					   AND sale_no = :ls_order AND seq_no = :li_seq AND division = 1;
						
				   if ll_int3 > 0 then
						
						DELETE FROM routtempnew
					    WHERE operation = :li_operation AND wc_no = :ls_wc
						   AND sale_no = :ls_order AND seq_no = :li_seq AND division = 1;
							
						if sqlca.sqlcode < 0 then
							ROLLBACK;

							ll_ins  = dw_4.insertrow(0)
							dw_4.object.rout_date[ll_ins] = ldt_sysdate
							dw_4.object.area_no[ll_ins]   = "S0001"
							dw_4.object.user_id[ll_ins]   = gs_userid
							dw_4.object.rout_msg[ll_ins]  = "오류5-1  - routtempnew DELETE 중 오류가 발생 하였습니다." + STRING(now())

							ls_error = "Y"
						end if					 
						/* 2019-10-23 jowonsuk 생산납기일자 반영 기존 예정일자 */  
						INSERT INTO routtempnew (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
							    cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
							    assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem,area_no)
						VALUES (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
						        :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
							     :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem,:ls_area);
								  
			         if sqlca.sqlcode < 0 then
							ROLLBACK;

							ll_ins  = dw_4.insertrow(0)
							dw_4.object.rout_date[ll_ins] = ldt_sysdate
							dw_4.object.area_no[ll_ins]   = "S0001"
							dw_4.object.user_id[ll_ins]   = gs_userid
							dw_4.object.rout_msg[ll_ins]  = "오류5-2  - routtempnew INSERT 중 오류가 발생 하였습니다." + STRING(now())

							ls_error = "Y"
		            end if					 
					else
						ROLLBACK;

						ll_ins  = dw_4.insertrow(0)
						dw_4.object.rout_date[ll_ins] = ldt_sysdate
						dw_4.object.area_no[ll_ins]   = "S0001"
						dw_4.object.user_id[ll_ins]   = gs_userid
						dw_4.object.rout_msg[ll_ins]  = "오류6 - [" + ls_itemnm + "][" + ls_qa +  string(sqlca.sqlerrtext)  + STRING(now())

						ls_error = "Y"
						EXIT
					end if
				end if

			ELSE // 첫공정, 중간공정이면
				
				/*2019.12.24 jowonsuk 대표공정일때는 완제품의 규격을 따라간다. */
				/*2020.04.08 jowonsuk 대표공정일때는 완제품의 규격을 따라간다. */
//				if ls_represent = 'Y'  then
				if l_row > 0 then
					
					ls_qa2 = ls_qa2					
					
				else
					
					ls_qa2 = ls_qa
					
					l_qa_check = 0
					
					SELECT count(*) INTO :l_qa_check FROM item WHERE item_no = :ls_item AND qa = :ls_qa;
					
					if l_qa_check = 0 then
						if GF_ItemINSERT(ls_item, ls_qa) = true then
						end if
					end if								

				end if				
				
				/*   이테이블을 재고 테이블로 사용하지 않음. 2018.05.10. 로직 주석 처리 jowonsuk
				SELECT item_no INTO :ls_temp FROM itemjaego WHERE item_no = :ls_assyitem AND qa = :ls_qa2;
				*/
				
				/*   이테이블을 재고 테이블로 사용하지 않음. 2018.05.10. 로직 주석 처리 jowonsuk
				choose case sqlca.sqlcode										
					case 0
			
					// SELECT qoh, sales_reserved, prodn_reserved INTO :lr_qoh,:lr_saleqty,:lr_prodqty
				   //   FROM item
				   //  WHERE item_no = :ls_assyitem AND qa = :ls_qa2;
			      // if sqlca.sqlcode <> 0 then
					// 	ll_ins  = dw_4.insertrow(0)
					// 	dw_4.object.msg1[ll_ins] = "오류7 - [" + ls_item + "][" + ls_qa + "] 에 대한 검색중 오류가 발생했습니다. " + STRING(now())
					// 	ROLLBACK;
					// 	ls_error = "Y"
					// 	EXIT
					// end if		

						ll_ins  = dw_4.insertrow(0)
						dw_4.object.rout_date[ll_ins] = ldt_sysdate
						dw_4.object.area_no[ll_ins]   = "S0001"
						dw_4.object.user_id[ll_ins]   = gs_userid
						dw_4.object.rout_msg[ll_ins]  = "SKIP  - [" + ls_itemnm + "][" + ls_qa1 + "] " + ls_order + "|" + string(li_seq) + " 재고물품관리 품목 입니다. " + STRING(now())

						SELECT isnull(qoh,0) INTO :lr_qoh 
						  FROM itemloc 
						 WHERE loc_no = :is_loc AND item_no = :ls_assyitem AND qa = :ls_qa2;
						if isnull(lr_qoh) then lr_qoh = 0

						// 가용량 = 현재고   // - 판매예약량 - 생산예약량
						lr_qoh = lr_qoh 		// - lr_saleqty - lr_prodqty	  // 가용량
						
						// 실계획수량  = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
						// 실계획수량 <= 가용량
						if lr_planqty <= lr_qoh then
							li_op = li_operation + 1

			            // routtempnew update_1
					      UPDATE routtempnew 
						      SET process_flag = 'Y'
					       WHERE sale_no = :ls_order AND seq_no = :li_seq AND operation = :li_op;
							 
			         		  if sqlca.sqlcode <> 0 then
								ROLLBACK;

								ll_ins  = dw_4.insertrow(0)
								dw_4.object.rout_date[ll_ins] = ldt_sysdate
								dw_4.object.area_no[ll_ins]   = "S0001"
								dw_4.object.user_id[ll_ins]   = gs_userid
								dw_4.object.rout_msg[ll_ins]  = "오류8  - " + string(sqlca.sqlerrtext) + STRING(now())

								ls_error = "Y"
							end if
							EXIT
						else
							// 윤용수 차장님의 요구로 중간공정의 물품이 재고물품관리(itemjaego)에 있으면서 
							// 재고수량이 부족하면 전체생산계획 취소 1998/12/11 lee in ho
							// insert 3 line start
							
							ROLLBACK;

							ll_ins  = dw_4.insertrow(0)
							dw_4.object.rout_date[ll_ins] = ldt_sysdate
							dw_4.object.area_no[ll_ins]   = "S0001"
							dw_4.object.user_id[ll_ins]   = gs_userid
							dw_4.object.rout_msg[ll_ins]  = "SKIP  - [" + ls_itemnm + "][" + ls_qa1 + "] 재고물품관리에 등록된 품목 입니다. " + STRING(now())

							ls_error = "Y"
							EXIT
							
						end if
					  
  
					case 100
*/						
             ////------------ 생산예약량을 설정하는 부분 --------------------------------					  
						if lr_runtime = 0 then							  
						else
							choose case trim(ls_mpuom)
								case "M"
										if MidA(ls_assyitem,1,1) = "M" then
												 lr_runtime = (60.0 * (real(long(MidA(ls_qa, 15,5)) / 1000.0) * lr_planqty)) / lr_runtime
										else
											lr_runtime = (60.0 * (real(long(MidA(ls_qa2,15,5)) / 1000.0) * lr_planqty)) / lr_runtime 
										end if
									
								case else
				               			lr_runtime = (60.0 * lr_planqty) / lr_runtime
							end choose
						end if			
						
						/* 2019-10-23 jowonsuk 생산납기일자 반영 기존 예정일자 */  
						// insert routtempnew #-3
						INSERT INTO routtempnew (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
			                cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
			                assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem,area_no)
						VALUES (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
		                    :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
		                    :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem,:ls_area);
								  
						if sqlca.sqlcode <> 0 then
							ROLLBACK;
							
							ll_ins  = dw_4.insertrow(0)
							dw_4.object.rout_date[ll_ins] = ldt_sysdate
							dw_4.object.area_no[ll_ins]   = "S0001"
							dw_4.object.user_id[ll_ins]   = gs_userid
							dw_4.object.rout_msg[ll_ins]  = "오류9 - [" + ls_itemnm + "][" + ls_qa + "] 에 대한 공정구성중 오류가 발생했습니다. " + STRING(now())
							
							ls_error = "Y"
							EXIT
						end if						  
               ////---------------- 생산예약량 설정하는 부분 -------------------------------------------						  
/*					
					case else
						ROLLBACK;
						
						ll_ins  = dw_4.insertrow(0)
						dw_4.object.rout_date[ll_ins] = ldt_sysdate
						dw_4.object.area_no[ll_ins]   = "S0001"
						dw_4.object.user_id[ll_ins]   = gs_userid
						dw_4.object.rout_msg[ll_ins]  = "오류10 - [" + ls_itemnm + "][" + ls_qa + "] 에 대한 공정구성중 오류가 발생했습니다. " + STRING(now())
						
						ls_error = "Y"
						EXIT						
				end choose
*/				
			end if
		next
		 
		if ls_error = "Y" then CONTINUE
	end if
	
	COMMIT;
next

RETURN true

end function

public function boolean wf_onecalc (long arg_cnt);////////////////////////////////////////////////////////////////////////
// routtempnew.plan_flag    = "Y" : 생산계획반영
//								    = "N" : 생산계획에 반영하지않는다.
// routtempnew.process_flag = "Y" : 첫번째공정인경우
//								    = "N" : 첫번째공정이 아닌경우
////////////////////////////////////////////////////////////////////////
string ls_error, ls_item, ls_qa, ls_source, ls_order, ls_rem, ls_qa1, ls_like
string ls_color, ls_cust, ls_scene, ls_uom, ls_suju, ls_wc, ls_assyitem, ls_assyqa
string ls_flag, ls_itemname, ls_source1, ls_mpuom, ls_qa2, ls_qa3, ls_str, ls_area
datetime ldt_duedate
long   ll_maxrow, ll_cnt, ll_jcnt
int    li_chk, li_seq, li_bom, li_workper, li_operation, li_count
real   lr_notqty, lr_qpa, lr_setuptime, lr_runtime, lr_planqty

ls_error = "N"
ls_item  = trim(dw_2.object.item_no[arg_cnt])
ls_qa    = trim(dw_2.object.qa[arg_cnt])

dw_2.object.saledet_text[arg_cnt] = "P"	// 가능:Y, 불가:N, 완료:E, 진행:P
dw_2.object.sol_qty[arg_cnt] = 0	

if ls_error <> "Y" then 
	if dw_2.update() = 1 then
		COMMIT;
	else
		ROLLBACK;
	end if
end if

ll_maxrow = dw_2.retrieve()
if ll_maxrow > 0 then
	li_chk = 0
	ls_source = trim(dw_2.object.groupitem_source[arg_cnt])
	
	// source = "B" : 구매품은 무조건 생산계획을 생성하지 않는다.
	if ls_source = "B" then 
      MessageBox("오류3","[" + ls_item + "][" + ls_qa + "]구매품은 무조건 생산계획을 생성하지 않습니다.",exclamation!)
		RETURN false
	end if
	 
	ls_error = ""
	ls_order = trim(dw_2.object.order_no[arg_cnt])  
	ls_item  = trim(dw_2.object.item_no[arg_cnt])
	ls_qa    = trim(dw_2.object.qa[arg_cnt])
	ls_rem   = trim(dw_2.object.rem[arg_cnt])
	
	// 표준공정의 규격은 길이를 "00000"으로한 대표 공정만이 들어있다.
	ls_qa1   = MidA(ls_qa,1,13) + "X00000"
	ls_like  = MidA(ls_qa,1,13) + "%"
	ls_color = trim(dw_2.object.color[arg_cnt])
	ls_cust  = trim(dw_2.object.sale_cust_no[arg_cnt])
	ls_scene = trim(dw_2.object.sale_scene_code[arg_cnt])
	ls_uom   = trim(dw_2.object.uom[arg_cnt])

	ldt_duedate = dw_2.object.sale_due_date[arg_cnt]
	li_seq      = dw_2.object.seq_no[arg_cnt]
	// itemjaego: 재고물품 테이블 - 이테이블에 있으면 무조건 생산계획을 생성하지 않는다.
	lr_notqty   = dw_2.object.order_qty[arg_cnt]
	
	ls_suju = "Y" // 2004/08/12 "E" => "Y" 로 변경
	ll_cnt  = dw_3.retrieve( ls_item, ls_like )
	if sqlca.sqlcode < 0 then
	    ROLLBACK;
		 MessageBox("오류1",ls_item + ", " + ls_qa1 + " ROUT가 등록되지 않았습니다.",exclamation!)
		 RETURN false
	end if
	
	if ll_cnt < 1 then
		ROLLBACK;
		MessageBox("오류2", ls_item + "," + ls_qa1  + "item에 공정이 등록되지 않았습니다.",exclamation!)
		RETURN false
	else
		for ll_jcnt =  1 to ll_cnt
			lr_qpa       = dw_3.object.qpa[ll_jcnt]     
			li_bom       = dw_3.object.bom_no[ll_jcnt]
			ls_wc        = trim(dw_3.object.wc_no[ll_jcnt])
			lr_setuptime = dw_3.object.setup_time[ll_jcnt]
			lr_runtime   = dw_3.object.run_time[ll_jcnt]
			li_workper   = dw_3.object.work_per[ll_jcnt]
			ls_area      = dw_3.object.wc_area_no[ll_jcnt]
			li_operation = dw_3.object.operation[ll_jcnt]   // order_qty - ( sol_qty  +  rlse_qty  +  planqty )
			// 실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
			lr_planqty   = lr_qpa * lr_notqty      
			ls_assyitem  = trim(dw_3.object.assembly[ll_jcnt])
			ls_assyqa    = trim(dw_3.object.assy_qa[ll_jcnt])		
			
			if li_operation = 1 then
				ls_flag = "Y"    // 첫번째공정     가능
			else
				ls_flag = "N"    // 첫번째공정아님 불가능
			end if
		 
			SELECT item_name, uom, source, mp_uom
			  INTO :ls_itemname,:ls_uom,:ls_source1,:ls_mpuom 
			  FROM groupitem 
			 WHERE item_no = :ls_assyitem;
		   if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
				ROLLBACK;
				MessageBox("오류3",ls_assyitem + " : " + ls_qa + "BOM구성이 잘못되었습니다.",exclamation!)
				ls_error = "Y"
				EXIT
		   end if
			 
			ls_qa2 = ls_qa
			if MidA(ls_assyitem,1,1) = "P" then
				ls_str = MidA(ls_assyqa,1,14)
				choose case MidA(ls_item,5,3)
					case "0LT"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 138),5)						
					case "0LC"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0C1"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0C2"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0C4"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0C5"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0CT"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0GC"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 35),5)						
					case "0GM"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 52),5)						
					case "OMT"
				      ls_qa2 = ls_str + RightA("00000" + string(long(MidA(ls_qa,15,5)) + 52),5)
				end choose
			end if
			 
			if MidA(ls_assyitem,1,1) = "M" then
				ls_qa2 = ls_assyqa
				// 실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
				lr_planqty = lr_planqty * (real(MidA(ls_qa,15,5)) / 1000.0) 
			end if
			 
			SELECT count(*) into :li_count from item where item_no = :ls_assyitem and qa = :ls_qa2;
			if li_count = 0 then
				ls_qa3 = MidA(ls_qa2,1,14) + "00000"
				INSERT INTO item (item_no,qa,loc_no,item_name,uom,source,leadtime,count_code,qoh,sales_reserved,
		           	 prodn_reserved,pur_reserved,reorder,safety_stock,lot,obsolete_code,scrap_qty,
			       	 price_a,price_b,price_c,std_setup,std_material,std_labor,std_burden,std_subcontract,
			        	 std_machine,month_qty,safety_day,qa1, use_flag)
		      VALUES (:ls_assyitem,:ls_qa2,'WS00000000',:ls_itemname,:ls_uom,:ls_source1,0,'M',0,0,
			          0,0,0,0,0,'N',0,0,0,0,0,0,0,0,0,0,0,0,:ls_qa3, "Y");
			   if sqlca.sqlcode < 0 then
					ROLLBACK;
					MessageBox("오류4",sqlca.sqlerrtext,exclamation!)
					ls_error = "Y"
					EXIT
			   end if
				 
				SELECT count(*) INTO :li_count FROM itempattern WHERE item_no = :ls_assyitem AND qa1 = :ls_qa3;
			   if li_count = 0 then
					INSERT INTO itempattern (item_no,qa1) VALUES (:ls_assyitem,:ls_qa3);
					if sqlca.sqlcode < 0 then
						ROLLBACK;
						MessageBox("오류5","물품코드 저장중 오류가 발생하였습니다.",exclamation!)
						ls_error = "Y"
						EXIT
					end if
				end if				 
			end if
			 
			if ll_jcnt = 1 then // 마지막공정이면(완제품공정)
				if lr_runtime = 0 then					  
				else
					choose case trim(ls_mpuom)
						case "M"
							if MidA(ls_assyitem,1,1) = "M" then
								lr_runtime = (60.0 * (real(long(MidA(ls_qa, 15,5)) / 1000.0) * lr_planqty)) / lr_runtime
							else
								lr_runtime = (60.0 * (real(long(MidA(ls_qa2,15,5)) / 1000.0) * lr_planqty)) / lr_runtime 
							end if

						case else
							lr_runtime = (60.0 * lr_planqty) / lr_runtime
					end choose
				end if
				  
				// insert routtempnew #-1
				INSERT INTO routtempnew (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
			          cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
			          assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem,area_no)
		      VALUES (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
		             :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
		             :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem, :ls_area);
			   if sqlca.sqlcode < 0 then
					int ll_int3
					SELECT count(*) INTO :ll_int3 FROM routtempnew
					 WHERE operation = :li_operation AND wc_no = :ls_wc
					   AND sale_no = :ls_order	AND seq_no = :li_seq AND division = 1;
				   if ll_int3 > 0 then
						DELETE FROM routtempnew
					    WHERE operation = :li_operation AND wc_no  = :ls_wc 
						   AND sale_no = :ls_order	AND seq_no = :li_seq AND division = 1;
						INSERT INTO routtempnew (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
						      cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
						      assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem, area_no)
						VALUES (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
						      :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
						      :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem, :ls_area);
					else
						ROLLBACK;
						MessageBox("오류6",ls_item + "," + ls_qa + "에 대한 공정 구성중 오류가 발생했습니다.",exclamation!)  
						ls_error = "Y"
						EXIT
					end if
				end if
				 
			// 중간공정이면
			else
				if lr_runtime = 0 then							  
				else
					choose case trim(ls_mpuom)
						case "M"
							if MidA(ls_assyitem,1,1) = "M" then
								lr_runtime = (60.0 * (real(long(MidA(ls_qa,15,5)) / 1000.0) * lr_planqty)) / lr_runtime
							else
								lr_runtime = (60.0 * (real(long(MidA(ls_qa2,15,5)) / 1000.0) * lr_planqty)) / lr_runtime 
							end if
							
						case else
							lr_runtime = (60.0 * lr_planqty) / lr_runtime
					end choose
				end if				
				  
				// insert routtempnew #-3
				INSERT INTO routtempnew (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
						cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
						assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem,area_no)
				VALUES (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
						:ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
						:ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem,:ls_area);
				if sqlca.sqlcode < 0 then
					ROLLBACK;
					MessageBox("오류9",string(sqlca.sqlerrtext) + "~r~n" + ls_item + "," + ls_qa + "에 대한 공정 구성중 오류가 발생했습니다.",exclamation!)  
					ls_error = "Y"
					EXIT
				end if
			end if
		next

		if ls_error = "Y" then RETURN false
	end if

	COMMIT;
end if

//update item set sales_reserved = 0 where sales_reserved < 0;
//commit;
dw_1.retrieve()

MessageBox("확인","자동생산계획이 완료되었습니다.",information!)
RETURN true

end function

on w_mpautosale1_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_1=create st_1
this.st_2=create st_2
this.st_info=create st_info
this.cb_4=create cb_4
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.st_vertical=create st_vertical
this.dw_5=create dw_5
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_info
this.Control[iCurrent+6]=this.cb_4
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.st_vertical
this.Control[iCurrent+13]=this.dw_5
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_1
end on

on w_mpautosale1_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_info)
destroy(this.cb_4)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_vertical)
destroy(this.dw_5)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_2.visible = false
dw_3.visible = false
dw_5.visible = false


SELECT def_loc INTO :is_loc FROM area WHERE area_no = :gs_area;

if GF_PERMISSION("자동생산계획생성(시화)", gs_userid) = "Y" AND gs_area <> "T0001" then
	//////////////////////////////////////////////////////////////////
	// 자동생산계획 automatic time : 30분 = 30 * 60초 = 1800초
	// Timer(0.05)
	//////////////////////////////////////////////////////////////////
	// this.PostEvent('ue_1')
	//////////////////////////////////////////////////////////////////

	is_select = dw_2.Describe("DataWindow.Table.Select")
	pb_retrieve.postevent(clicked!)	
else
	pb_compute.visible = false
	MessageBox("사업장권한","'자동생산계획생성(시화)' 권한과, 기본사업장이 일치하지 않습니다.")
end if

end event

event resize;call super::resize;//
dw_4.height = newheight - dw_4.y - dw_4.x		// LOG

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - dw_4.x 
dw_1.height = newheight - dw_1.y - dw_4.x

dw_5.width  = dw_1.width * 0.6
dw_5.height = newheight - 1240

end event

type pb_save from w_inheritance`pb_save within w_mpautosale1_m
boolean visible = false
integer x = 3022
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_mpautosale1_m
integer x = 1851
integer y = 328
integer width = 2752
integer height = 1812
integer taborder = 110
string dataobject = "d_mpautosale0_m"
boolean hsplitscroll = true
end type

event dw_1::rbuttondown;//
int    li_int, li_seq
string ls_order, ls_login, ls_name, ls_qa1, ls_temp
long   ll_idx, ll_row, ll_cnt, ll_dw3cnt
string ls_item, ls_itemname, ls_qa

if isnull(row) OR row < 1 then RETURN
this.scrolltorow( row )

m_manager NewMenu
NewMenu = CREATE m_manager

gs_print_control = ""
li_int = m_manager.m_man.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())
choose case gs_print_control
	case "plan"		// 생산계획 생성
		ls_temp = string(row) + " 번째 자료를 생산계획으로 변환하시겠습니까?"
	   if MessageBox("확인", ls_temp, Exclamation!, OKCancel!, 2) = 1 then
			ls_order = this.object.order_no[row]
			li_seq   = this.object.seq_no[row]
			is_clause = " and sale.order_no     = ~~'" + ls_order + "~~'" &
						 + " and saledet.seq_no    = " + string(li_seq)  &
			          + " and sale.confirm_flag = ~~'Y~~'" &
			          + " and sale.open_close   = ~~'O~~'" &
			          + " and saledet.saledet_text in (~~'N~~',~~'P~~',~~'Q~~')" &
						 + " and saledet.order_qty > (saledet.rlse_qty + saledet.sol_qty + saledet.plan_qty) " &
			          + " and routtempnew.division = 1 " &
						 + " and saledet.item_no   LIKE ~~'P%~~'" &
						 + " and saledet.item_no    NOT IN (~~'PZZZPP1ZZZ~~',~~'PZZZPP2ZZZ~~')"
			is_where = "DataWindow.Table.Select='"  + is_select + is_clause + "'"
			dw_2.Modify(is_where)
			dw_2.settransobject(sqlca)
			
			if dw_2.retrieve() > 0 then wf_onecalc(1)
		end if
		
	case "mess"		// 메시지 보내기
		ls_order = this.object.order_no[row]
		li_seq   = this.object.seq_no[row]
		ls_login = this.object.sale_login_id[row]
		
		gs_custper_str lstr_where
		lstr_where.str_ok    = false
		lstr_where.str_where = LeftA((ls_login + SPACE(10)),10) + "수주번호 [" + ls_order + "]의 " &
								   + string(li_seq) + "번째 내역을 재확인요망"
		OpenWithParm( w_sysmsg_m, lstr_where )
		w_sysmsg_m.WindowState = Normal!
		
	case "rout"		// 공정관리
		row = this.getrow()
		if row < 1 then return
		
		Open( w_mprout_r )

		// 자동생산계획생성(시화) 미 반영분 중 중복된 품목+규격(길이=00000)은 SKIP
		for ll_row = 1 to this.rowcount()
			ls_item   = trim(this.object.item_no[ll_row])
			ls_qa1    = LeftA(this.object.qa[ll_row], 13) + "X00000"
			
			ll_dw3cnt = w_mprout_r.dw_3.rowcount()
		   ll_idx    = w_mprout_r.dw_3.Find( "item_no = '"+ ls_item + "' and qa1 = '" + ls_qa1 +"'", 1, ll_dw3cnt )
			if ll_idx > 0 then continue
			
			ll_cnt    = w_mprout_r.dw_3.insertrow(0)
			w_mprout_r.dw_3.object.item_no[ll_cnt]        = ls_item
			w_mprout_r.dw_3.object.item_item_name[ll_cnt] = trim(this.object.groupitem_item_name[ll_row])
			w_mprout_r.dw_3.object.qa1[ll_cnt]            = ls_qa1
		next
		
		ls_item = trim(this.object.item_no[row])
		ls_qa1  = LeftA(this.object.qa[row], 13) + "X00000"
		
		ll_dw3cnt = w_mprout_r.dw_3.rowcount()
		ll_idx    = w_mprout_r.dw_3.Find( "item_no = '"+ ls_item + "' and qa1 = '" + ls_qa1 +"'", 1, ll_dw3cnt )

		w_mprout_r.dw_3.scrolltorow(ll_idx)		
		w_mprout_r.dw_1.retrieve( ls_item )		
		w_mprout_r.sle_1.text = ls_item
		
	case "item"		// 재고내역
		row = this.getrow()
		if row < 1 then return

		open( w_mpjaegoc_r )

		ls_item     = trim(this.object.item_no[row])
		ls_itemname = trim(this.object.groupitem_item_name[row])
		ls_qa       = trim(this.object.qa[row])
		
		w_mpjaegoc_r.dw_1.object.item_no[1]   = ls_item
		w_mpjaegoc_r.dw_1.object.item_name[1] = ls_itemname
		w_mpjaegoc_r.dw_2.retrieve( ls_item )
		
		ll_idx = w_mpjaegoc_r.dw_2.Find( "qa = '" + ls_qa + "'",1, w_mpjaegoc_r.dw_2.RowCount())
		if ll_idx > 0 then
			w_mpjaegoc_r.dw_2.scrolltorow(ll_idx)
		end if
end choose

//w_frame.PointerX(), w_frame.PointerY())

end event

type st_title from w_inheritance`st_title within w_mpautosale1_m
integer x = 46
integer y = 24
integer width = 1417
integer height = 128
string text = "자동생산계획생성(시화)"
end type

type st_tips from w_inheritance`st_tips within w_mpautosale1_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpautosale1_m
integer x = 4617
integer y = 60
integer taborder = 170
end type

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string   ls_sdate,  ls_edate, ls_message
long     ll_maxrow, ll_row,   ll_dw4row
datetime ldt_sysdate

ldt_sysdate = gf_today()
ls_sdate    = string(ldt_sysdate, "yyyy/mm/dd")
ls_edate    = string(ldt_sysdate, "yyyy/mm/dd")

ll_dw4row = dw_4.insertrow(0)
dw_4.object.rout_date[ll_dw4row] = ldt_sysdate
dw_4.object.area_no[ll_dw4row]   = "S0001"
dw_4.object.user_id[ll_dw4row]   = gs_userid
dw_4.object.rout_msg[ll_dw4row]  = "[자동계산 시작]" + STRING(now())

// start 가용재고로 대체
ll_maxrow = dw_1.rowcount()

if dw_1.rowcount() > 0 then
	
	// 재고물품(itemjaego) 테이블에 존재하는 ITEM 이면 무조건 생산계획을 생성하지 않는다.
//	if WF_Alter(ll_maxrow) = true then		2018.05.10 쯤 jowonsuk 주석처리 관리하지 않는 재고이다. 
		if dw_1.Update() = 1 then
			COMMIT;
		else
			ROLLBACK;
		end if
//	end if
	
	// 계획수량 설정
	if WF_PlanDET(ll_maxrow) = false then
		ROLLBACK;
		RETURN
	end if
	
else
	// 품목규격에 예약수량 지우기
	// update item set sales_reserved = 0 where sales_reserved < 0;
	// COMMIT;
end if

ldt_sysdate = gf_today()

ll_dw4row = dw_4.insertrow(0)
dw_4.object.rout_date[ll_dw4row] = ldt_sysdate
dw_4.object.area_no[ll_dw4row]   = "S0001"
dw_4.object.user_id[ll_dw4row]   = gs_userid
dw_4.object.rout_msg[ll_dw4row]  = "[자동계산 완료]" + STRING(now())

WF_Update1( dw_4, "Y" )

//CLOSE(W_ICPROCESS)

dw_1.retrieve()

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpautosale1_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpautosale1_m
integer x = 4814
integer y = 60
integer taborder = 190
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpautosale1_m
boolean visible = false
integer x = 2757
integer y = 60
integer taborder = 220
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpautosale1_m
boolean visible = false
integer taborder = 230
end type

type pb_delete from w_inheritance`pb_delete within w_mpautosale1_m
integer x = 457
integer y = 228
integer width = 91
integer height = 92
integer taborder = 240
integer textsize = -9
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "▶"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_delete::clicked;//if this.picturename = "c:\bmp\arrowle.bmp" then
//	this.picturename = "c:\bmp\arrowri.bmp"
//	dw_4.width = 517
//else
//	this.picturename = "c:\bmp\arrowle.bmp"
//	dw_4.width = 3550
//end if
end event

event pb_delete::mousemove;//
end event

type pb_insert from w_inheritance`pb_insert within w_mpautosale1_m
integer x = 32
integer y = 228
integer width = 425
integer height = 92
integer taborder = 260
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "처리내역 CLEAR"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::clicked;//
IF MessageBox("확인","처리내역 전체를 지우시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
	dw_4.reset()
END IF
	

end event

event pb_insert::mousemove;//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpautosale1_m
integer x = 3767
integer y = 60
integer width = 402
integer taborder = 250
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주내역 조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long     ll_row, ll_dw4row
string   ls_sdate, ls_edate, ls_message, ls_time
datetime ldt_sysdate

ldt_sysdate = gf_today()
ls_sdate    = string(ldt_sysdate, "yyyy/mm/dd")
ls_edate    = string(ldt_sysdate, "yyyy/mm/dd")

ls_message = "'물품그룹 관리'에서 사용불가 처리할 대상 입니다.~n~n" + &
             "'물품그룹 관리'에서 비용항목 등록시 자동생산계획 에서 SKIP 됩니다.~n~n" + &
	          "재고수량이 존재한다면 신규품목으로 G코드로 생성하고 실사마감(재고조정) 후 사용해야 합니다.~n~n" + &
	          "원인 : 품목코드 첫자리가 'P'는 제품, 물품그룹 관리에서 출처는 '구매품'으로 등록됨~n~n~n" + &
				 "'자동생산계획생성' 작업에서는 반영하지 않습니다.~n~n~n~n~n~n"

Yield()
Yield()

///////////////////////////////////////////////////
// 작업내역
///////////////////////////////////////////////////
dw_4.retrieve( "S0001", ls_sdate, ls_edate )
///////////////////////////////////////////////////

SELECT top 1 convert(char(20), getdate(), 120) INTO :ls_time FROM login;
st_info.text = ls_time

ll_dw4row = dw_4.insertrow(0)
dw_4.object.rout_date[ll_dw4row] = ldt_sysdate
dw_4.object.area_no[ll_dw4row]   = "S0001"
dw_4.object.user_id[ll_dw4row]   = gs_userid
dw_4.object.user_name[ll_dw4row] = gs_username
dw_4.object.rout_msg[ll_dw4row]  = "[수주내역 시작]" + string(now())

////////////////////////////////////////////////////////////////////////////////
dw_1.retrieve()
////////////////////////////////////////////////////////////////////////////////

ll_dw4row = dw_4.insertrow(0)
dw_4.object.rout_date[ll_dw4row] = ldt_sysdate
dw_4.object.area_no[ll_dw4row]   = "S0001"
dw_4.object.user_id[ll_dw4row]   = gs_userid
dw_4.object.user_name[ll_dw4row] = gs_username
dw_4.object.rout_msg[ll_dw4row]  = "[수주내역 완료]" + string(now())

wf_update1( dw_4, "N" )
MessageBox("확인", "수주내역조회 작업완료.")

end event

event pb_retrieve::mousemove;//
end event

type gb_3 from w_inheritance`gb_3 within w_mpautosale1_m
boolean visible = false
integer x = 1792
integer y = 256
integer width = 1641
integer height = 196
integer taborder = 150
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_mpautosale1_m
boolean visible = false
integer x = 544
integer y = 236
integer width = 3026
integer height = 1888
integer taborder = 160
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpautosale1_m
integer x = 3177
integer y = 16
integer width = 1856
integer height = 208
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpautosale1_m
integer x = 869
integer y = 4
integer width = 187
integer height = 120
integer taborder = 120
string dataobject = "d_mpautosale1_m"
boolean vscrollbar = false
end type

type dw_3 from datawindow within w_mpautosale1_m
integer x = 658
integer y = 4
integer width = 187
integer height = 120
integer taborder = 30
boolean bringtotop = true
string title = "품목공정"
string dataobject = "d_mproutnew_m_represent"
boolean livescroll = true
end type

type dw_4 from datawindow within w_mpautosale1_m
integer x = 32
integer y = 328
integer width = 1778
integer height = 1812
integer taborder = 100
boolean bringtotop = true
string title = "d_msg_s"
string dataobject = "d_routtempnew_his"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_mpautosale1_m
integer x = 37
integer y = 172
integer width = 782
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "자동생산계획생성(시화) 권한"
boolean focusrectangle = false
end type

type st_2 from statictext within w_mpautosale1_m
integer x = 3154
integer y = 272
integer width = 1467
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "우측 마우스: 생산계획생성, 재고내역, 공정관리, 메시지"
boolean focusrectangle = false
end type

type st_info from statictext within w_mpautosale1_m
integer x = 571
integer y = 220
integer width = 901
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "none"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_mpautosale1_m
integer x = 3214
integer y = 60
integer width = 553
integer height = 144
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "제품공정관리"
end type

event clicked;// 제품공정관리
string ls_itemno, ls_itemnm, ls_qa1
long   ll_row, ll_found

if dw_1.rowcount() < 1 then return

ll_row    = dw_1.getrow()
ls_itemno = dw_1.object.item_no[ll_row]
ls_itemnm = dw_1.object.groupitem_item_name[ll_row]
ls_qa1    = LeftA(dw_1.object.qa[ll_row],13) + "X00000"

if ls_itemno = "" OR isnull(ls_itemno) then RETURN
if ls_itemnm = "" OR isnull(ls_itemnm) then RETURN

if IsValid(w_m_main) then 
	OpenSheet(w_cditemwc_m, w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cditemwc_m, w_all_main, 5, original!)
end if


if LeftA(gs_team,1) = "7" then
	w_cditemwc_m.pb_save.enabled = false	// 저장
end if

w_cditemwc_m.setredraw(false)
w_cditemwc_m.sle_1.text = ls_itemno			// 품목번호
w_cditemwc_m.sle_2.text = ls_itemnm			// 물품명
w_cditemwc_m.pb_retrieve.postevent(clicked!)
w_cditemwc_m.setredraw(true)

// 규격찾기
if w_cditemwc_m.dw_1.rowcount() > 0 then
	ll_found = w_cditemwc_m.dw_1.find( "qa1 = '" + ls_qa1 + "' ", 1, w_cditemwc_m.dw_1.rowcount() )
	if ll_found > 0 then
		w_cditemwc_m.dw_1.scrolltorow( ll_found )
	end if
end if

end event

type st_3 from statictext within w_mpautosale1_m
integer x = 1513
integer y = 24
integer width = 1623
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
string text = "1) 품목코드 = ~'P~', 비용계정, 구매품이 아니고"
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpautosale1_m
integer x = 1513
integer y = 208
integer width = 1623
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
string text = "4) 생산확정분 중에서 계획조정에 없는것, "
boolean focusrectangle = false
end type

type st_5 from statictext within w_mpautosale1_m
integer x = 1513
integer y = 80
integer width = 1623
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
string text = "2) 재고생산품 아니고, 공정관리에 있는것"
boolean focusrectangle = false
end type

type st_6 from statictext within w_mpautosale1_m
integer x = 1513
integer y = 144
integer width = 1623
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
string text = "3) 주문수량 > 출고수량+가용량+계획수량"
boolean focusrectangle = false
end type

type st_7 from statictext within w_mpautosale1_m
integer x = 1513
integer y = 272
integer width = 1623
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
string text = "5) 출고: 불가,부분,생산 인것들 "
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_mpautosale1_m
integer x = 1819
integer y = 328
integer height = 1812
boolean bringtotop = true
end type

type dw_5 from datawindow within w_mpautosale1_m
integer x = 686
integer y = 748
integer width = 3323
integer height = 764
integer taborder = 180
boolean bringtotop = true
boolean titlebar = true
string title = "품목코드 오류(첫자리 ~'P~' 이고 구매품인것들...)"
string dataobject = "d_mpautosale0_check"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_mpautosale1_m
integer x = 1536
integer y = 124
integer width = 82
integer height = 48
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;//em_4.text = string(integer(em_4.text) - 1)
//if em_4.text < '1' then 
//	em_4.text = '1'
//	return
//end if
//
//pb_cancel.postevent(clicked!)
end event

type cb_1 from commandbutton within w_mpautosale1_m
integer x = 4169
integer y = 60
integer width = 448
integer height = 144
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "누락수주조회"
end type

event clicked;
string ls_orderno, ls_custno
long   ll_row

Open( w_suju_plan_check_r)



end event

