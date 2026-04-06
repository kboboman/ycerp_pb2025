$PBExportHeader$w_mpautosale3_m.srw
$PBExportComments$자동생산계획생성(1998/04/07,곽용덕)
forward
global type w_mpautosale3_m from w_inheritance
end type
type dw_3 from datawindow within w_mpautosale3_m
end type
type dw_4 from datawindow within w_mpautosale3_m
end type
end forward

global type w_mpautosale3_m from w_inheritance
integer width = 3680
integer height = 2276
string title = "자동생산계획생성:화성(w_mpautosale3_m)"
event ue_1 pbm_custom01
dw_3 dw_3
dw_4 dw_4
end type
global w_mpautosale3_m w_mpautosale3_m

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

event ue_1;is_select = dw_2.Describe("DataWindow.Table.Select")
pb_retrieve.postevent(clicked!)

end event

public function boolean wf_alter (long arg_cnt);long ll_row

for ll_row = 1 to arg_cnt
	 // itemjaego: 재고물품 테이블 - 이테이블에 있으면 무조건 생산계획을 생성하지 않는다.
	if isnull(dw_1.object.itemjaego_item_no[ll_row]) &
		or trim(dw_1.object.itemjaego_item_no[ll_row]) = '' then
	else
		//윤용수 차장님의 의견에 따라 재고 물품인경우에는 saledet.sol_qty에 가용량을
		// 넣지 않고 출고시에 수동으로 가용량 을 설정후에 출고 할수 있도록함.
		dw_1.object.saledet_text[ll_row] = 'X'
	end if
next
return true

end function

public function boolean wf_plandet (long arg_cnt);// routtempnew.plan_flag = "Y" : 생산계획반영
//								 = "N" : 생산계획에 반영하지않는다.
// routtempnew.process_flag = "Y" : 첫번째공정인경우
//								    = "N" : 첫번째공정이 아닌경우

long ll_ins, ll_row
string ls_source, ls_error, ls_order, ls_item, ls_qa, ls_rem, ls_qa1, ls_like, ls_color
string ls_cust, ls_scene, ls_uom, ls_suju, ls_wc, ls_assyitem, ls_assyqa, ls_flag
real lr_qpa,lr_notqty, lr_setuptime, lr_runtime, lr_planqty, lr_qoh, lr_saleqty, lr_prodqty
datetime ldt_duedate
long ll_cnt, j
int  li_count, li_seq, li_bom, li_workper, li_operation, li_op
string ls_itemname, ls_mpuom, ls_qa2, ls_str, ls_qa3, ls_temp, ls_area

OPEN(W_ICPROCESS)
dw_1.accepttext()
for ll_row = 1 to arg_cnt
	w_icprocess.hpb_1.position = (ll_row / arg_cnt) * 100
	 // source = 'B' : 구매품은 무조건 생산계획을 생성하지 않는다.
	if dw_1.object.groupitem_source[ll_row] = 'B' or dw_1.object.saledet_text[ll_row] = 'X' then
		continue
	end if
	ls_error = ''
	ls_order = trim(dw_1.object.order_no[ll_row])  
	ls_item = trim(dw_1.object.item_no[ll_row])
	ls_qa   = trim(dw_1.object.qa[ll_row])
	ls_rem   = trim(dw_1.object.rem[ll_row])
	// 표준공정의 규격은 길이를 "00000"으로한 대표 공정만이 들어있다.
	ls_qa1 = MidA(ls_qa,1,13) + 'X00000'
	ls_like = MidA(ls_qa,1,13) + '%'
	ls_color   = trim(dw_1.object.color[ll_row])
	ls_cust    = trim(dw_1.object.sale_cust_no[ll_row])
	ls_scene   = trim(dw_1.object.sale_scene_code[ll_row])
	ls_uom     = trim(dw_1.object.uom[ll_row])
	ldt_duedate = dw_1.object.sale_due_date[ll_row]
	li_seq  = dw_1.object.seq_no[ll_row]
// 생산계획을 주문수량 전체로 계획이 잡히게 함.
//	lr_notqty = dw_1.object.notqty[ll_row]
	lr_notqty = dw_1.object.order_qty[ll_row]
	
	ls_suju = 'Y'// 2004/08/12 'E' => 'Y' 로 변경
	ll_cnt = dw_3.retrieve(ls_item,ls_like)
	if ll_cnt < 1 then
		ll_ins  = dw_4.insertrow(0)
		dw_4.object.msg1[ll_ins] = "오류  - [" + ls_item + "][" + ls_qa1 + "] 물품의 공정이 등록되지 않았습니다. " + STRING(now())
		rollback;
		continue
	else
	    for j =  1 to ll_cnt
			 lr_qpa       = dw_3.object.qpa[j]     
			 li_bom       = dw_3.object.bom_no[j]
		    ls_wc = trim(dw_3.object.wc_no[j])
			 lr_setuptime = dw_3.object.setup_time[j]
		    lr_runtime   = dw_3.object.run_time[j]
			 li_workper   = dw_3.object.work_per[j]
			 ls_area = dw_3.object.wc_area_no[j]
		    li_operation = dw_3.object.operation[j]   // order_qty - ( sol_qty  +  rlse_qty  +  planqty )
// 실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
		    lr_planqty   = lr_qpa * lr_notqty      
			 ls_assyitem  = trim(dw_3.object.assembly[j])
          ls_assyqa  = trim(dw_3.object.assy_qa[j])		
			 
			 if li_operation = 1 then
			    ls_flag = 'Y'
		    else
			    ls_flag = 'N'
		    end if
		 
		    select item_name,uom,source,mp_uom 
			 	into :ls_itemname,:ls_uom,:ls_source,:ls_mpuom 
				from groupitem 
			  where item_no = :ls_assyitem;
		    if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
				ll_ins  = dw_4.insertrow(0)
				dw_4.object.msg1[ll_ins] = "오류  - [" + ls_assyitem + "] 물품구성이 잘못되었습니다. " + STRING(now())
				rollback;
				ls_error = 'Y'
				exit
		    end if
			 
			 ls_qa2 = ls_qa
          if MidA(ls_assyitem,1,1) = 'P' then
				 ls_str = MidA(ls_assyqa,1,14)
				 CHOOSE CASE MidA(ls_item,5,3)
					case '0LT'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 138),5)						
					CASE '0LC'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0C1'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0C2'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0C4'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0C5'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0CT'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0GC'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0GM'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 52),5)						
					CASE 'OMT'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 52),5)
				 END CHOOSE
			 end if
			 if MidA(ls_assyitem,1,1) = 'M' then
				 ls_qa2 = ls_assyqa
// 실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
				 lr_planqty = lr_planqty * (real(MidA(ls_qa,15,5)) / 1000.0) 
			 end if
			 select count(*) into :li_count from item where item_no = :ls_assyitem and qa = :ls_qa2;
			 if li_count = 0 then
				 ls_qa3 = MidA(ls_qa2,1,14) + '00000'
			    insert into item
			     (item_no,qa,loc_no,item_name,uom,source,leadtime,count_code,qoh,sales_reserved,
			      prodn_reserved,pur_reserved,reorder,safety_stock,lot,obsolete_code,scrap_qty,
			      price_a,price_b,price_c,std_setup,std_material,std_labor,std_burden,std_subcontract,
			      std_machine,month_qty,safety_day,qa1, use_flag)
			    values(:ls_assyitem,:ls_qa2,'WS00000000',:ls_itemname,:ls_uom,:ls_source,0,'M',0,0,
			           0,0,0,0,0,'N',0,0,0,0,0,0,0,0,0,0,0,0,:ls_qa3, 'Y');
			    if sqlca.sqlcode < 0 then
					ll_ins  = dw_4.insertrow(0)
					dw_4.object.msg1[ll_ins] = "오류4  - " + string(sqlca.sqlerrtext) + STRING(now())
					rollback;
					ls_error = 'Y'
					exit
			    end if
			    select count(*) into :li_count from itempattern where item_no = :ls_assyitem and qa1 = :ls_qa3;
			    if li_count = 0 then
			       insert into itempattern (item_no,qa1) values(:ls_assyitem,:ls_qa3);
					if sqlca.sqlcode < 0 then
						ll_ins  = dw_4.insertrow(0)
						dw_4.object.msg1[ll_ins] = "오류5  - [" + ls_assyitem + "][" + ls_qa3 + "] 물품코드 저장중 오류가 발생하였습니다 " + STRING(now())
						rollback;
						ls_error = 'Y'
						exit
					end if
		       end if				 
			 end if
			 
			 if j = 1 then // 마지막공정이면(완제품공정)
   			  if lr_runtime = 0 then
				  else
		           choose case trim(ls_mpuom)
			          case 'M'
						    if MidA(ls_assyitem,1,1) = 'M' then
				             lr_runtime = (60.0 * (real(long(MidA(ls_qa,15,5)) / 1000000.0) * lr_planqty)) / lr_runtime
						    else
							    lr_runtime = (60.0 * (real(long(MidA(ls_qa2,15,5)) / 1000000.0) * lr_planqty)) / lr_runtime 
						    end if
			          case else
				          lr_runtime = (60.0 * lr_planqty) / lr_runtime
		           end choose
				  end if
				  if lr_runtime > 9999 then lr_runtime = 1
				  // insert routtempnew #-1
		       insert into routtempnew
		         (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
			       cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
			       assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem, area_no)
		       values (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
		          :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
		          :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem, :ls_area);
			    if sqlca.sqlcode < 0 then
//					 MESSAGEBOX("", string(sqlca.sqlerrtext))
					 int ll_int3
					 select count(*) into :ll_int3 from routtempnew
					  where operation = :li_operation
						   and wc_no = :ls_wc
						   and sale_no = :ls_order
  					      and seq_no = :li_seq
						   and division = 1;
				   if ll_int3 > 0 then
						delete from routtempnew
					    where operation = :li_operation
						   and wc_no = :ls_wc
						   and sale_no = :ls_order
  					      and seq_no = :li_seq
						   and division = 1;
			           if sqlca.sqlcode < 0 then
								ll_ins  = dw_4.insertrow(0)
								dw_4.object.msg1[ll_ins] = "오류5-1  - routtempnew DELETE 중 오류가 발생하였습니다 전산실로 연락바랍니다." + STRING(now())
		                 rollback;
				           ls_error = 'Y'
		              end if					 
						 insert into routtempnew
							(work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
							 cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
							 assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem,area_no)
						 values (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
							 :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
							 :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem,:ls_area);
			           if sqlca.sqlcode < 0 then
								ll_ins  = dw_4.insertrow(0)
								dw_4.object.msg1[ll_ins] = "오류5-2  - routtempnew INSERT 중 오류가 발생하였습니다 전산실로 연락바랍니다" + STRING(now())
		                 rollback;
				           ls_error = 'Y'
		              end if					 
					else
						ll_ins  = dw_4.insertrow(0)
						dw_4.object.msg1[ll_ins] = "오류6 - [" + ls_item + "][" + ls_qa +  string(sqlca.sqlerrtext)  + STRING(now())
		             rollback;
				       ls_error = 'Y'
				       exit
					end if
			    end if
			 else
	// // 중간공정이면
				 select item_no into :ls_temp from itemjaego where item_no = :ls_assyitem AND qa = :ls_qa2;
	          choose case sqlca.sqlcode
					case 0
//   				  select qoh, sales_reserved, prodn_reserved into :lr_qoh,:lr_saleqty,:lr_prodqty
//				       from item
//				      where item_no = :ls_assyitem and qa = :ls_qa2;
//			        if sqlca.sqlcode <> 0 then
//								ll_ins  = dw_4.insertrow(0)
//								dw_4.object.msg1[ll_ins] = "오류7 - [" + ls_item + "][" + ls_qa + "] 에 대한 검색중 오류가 발생했습니다. " + STRING(now())
//		              rollback;
//				        ls_error = 'Y'
//				        exit
//			        end if		
						select qoh into :lr_qoh from itemloc
						 where loc_no = :is_loc and item_no = :ls_assyitem and qa = :ls_qa2;
						if isnull(lr_qoh) then lr_qoh = 0
					  //가용량 = 현재고  //- 판매예약량 - 생산예약량
				     lr_qoh = lr_qoh // - lr_saleqty - lr_prodqty	  // 가용량
					  
// 실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
					  // 실계획수량 <= 가용량
				     if lr_planqty <= lr_qoh then
					     li_op = li_operation + 1
			// routtempnew update_1
					     update routtempnew set process_flag = 'Y'
					      where sale_no = :ls_order and seq_no = :li_seq and operation = :li_op;
			           if sqlca.sqlcode <> 0 then
									ll_ins  = dw_4.insertrow(0)
									dw_4.object.msg1[ll_ins] = "오류8  - " + string(sqlca.sqlerrtext) + STRING(now())
		                 rollback;
				           ls_error = 'Y'
		              end if					 
					     exit
					  else
// 윤용수 차장님의 요구로 중간공정의 물품이 재고물품관리(itemjaeho)에 있으면서 재고수량이
//					부족하면 전체생산계획 취소 1998/12/11 lee in ho
// insert 3 line start
		              rollback;
				        ls_error = 'Y'
					     exit
					  end if
////------------ 생산예약량을 설정하는 부분 --------------------------------					  
					case 100
						  if lr_runtime = 0 then
							  
						  else
		                 choose case trim(ls_mpuom)
			                case 'M'
						         if MidA(ls_assyitem,1,1) = 'M' then
				                  lr_runtime = (60.0 * (real(long(MidA(ls_qa,15,5)) / 1000.0) * lr_planqty)) / lr_runtime
						         else
							         lr_runtime = (60.0 * (real(long(MidA(ls_qa2,15,5)) / 1000.0) * lr_planqty)) / lr_runtime 
						         end if
			                case else
				               lr_runtime = (60.0 * lr_planqty) / lr_runtime
		                 end choose
						  end if				
				  // insert routtempnew #-3
		              insert into routtempnew
		               (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
			             cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
			             assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem,area_no)
		              values (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
		                :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
		                :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem,:ls_area);
			           if sqlca.sqlcode <> 0 then
		      	         rollback;
								ll_ins  = dw_4.insertrow(0)
								dw_4.object.msg1[ll_ins] = "오류9 - [" + ls_item + "][" + ls_qa + "] 에 대한 공정 구성중 오류가 발생했습니다. " + STRING(now())
				   	      ls_error = 'Y'
				      	    exit
			           end if
////---------------- 생산예약량 설정하는 부분 -------------------------------------------						  
					case else
		             rollback;
							ll_ins  = dw_4.insertrow(0)
							dw_4.object.msg1[ll_ins] = "오류10 - [" + ls_item + "][" + ls_qa + "] 에 대한 공정 구성중 오류가 발생했습니다. " + STRING(now())
				       ls_error = 'Y'
				       exit						
				 end choose
          end if
	    next
		 if ls_error = 'Y' then continue
	 end if
	 COMMIT;
next

return true

end function

public function boolean wf_onecalc (long arg_cnt);string ls_error, ls_item, ls_qa, ls_source, ls_order, ls_rem, ls_qa1, ls_like
string ls_color, ls_cust, ls_scene, ls_uom, ls_suju, ls_wc, ls_assyitem, ls_assyqa
string ls_flag, ls_itemname, ls_source1, ls_mpuom, ls_qa2, ls_qa3, ls_str, ls_area
datetime ldt_duedate
long ll_maxrow, ll_cnt, ll_jcnt
int li_chk, li_seq, li_bom, li_workper, li_operation, li_count
real lr_notqty, lr_qpa, lr_setuptime, lr_runtime, lr_planqty

    ls_error = 'N'
    ls_item = trim(dw_2.object.item_no[arg_cnt])
	 ls_qa = trim(dw_2.object.qa[arg_cnt])

//	 select sum(itemloc.qoh) into :lr_canqoh1 from itemloc,location
//	 where itemloc.loc_no = location.loc_no 
//	   and itemloc.item_no = :ls_item and itemloc.qa = :ls_qa and location.loc_type = 'N';
//	 if sqlca.sqlcode < 0 then
//		 messagebox('오류2',"[" + ls_item + "][" + ls_qa + "]물품테이블에서 검색되지 않았습니다.",exclamation!)
//		 rollback;
//		 return false
//	 end if		
//	 if isnull(lr_canqoh1) then lr_canqoh1 = 0
//	 select sales_reserved into :lr_canqoh2 from item
//	 where item_no = :ls_item and qa = :ls_qa;
//	 if sqlca.sqlcode < 0 then
//		 messagebox('오류3',"[" + ls_item + "][" + ls_qa + "]물품테이블에서 검색되지 않았습니다.",exclamation!)
//		 rollback;
//		 return false
//	 end if
//	 if isnull(lr_canqoh2) then lr_canqoh2 = 0
//	 lr_canqoh = lr_canqoh1 - lr_canqoh2
//    
//    lr_solqty = dw_2.object.sol_qty[arg_cnt]
//	 
//	 // itemjaego: 재고물품 테이블 - 이테이블에 있으면 무조건 생산계획을 생성하지 않는다.
//	 select count(*) into :li_count from itemjaego 
//	  where item_no = :ls_item AND qa = :ls_qa;
//	 if li_count > 0 then
//		 lr_notqty = dw_2.object.order_qty[arg_cnt]
//	 else
//	 	 lr_notqty = dw_2.object.notqty[arg_cnt]
//	 end if
//	 
//	 if lr_canqoh >= lr_notqty then
//		 update item set sales_reserved = sales_reserved + :lr_notqty
//		 where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류2',"[" + ls_item + "][" + ls_qa + "]판매예약량이 저장되지 않았습니다.",exclamation!)
//			 rollback;
//			 return false
//	    end if		 
//		 dw_2.object.saledet_text[arg_cnt] = 'X'
//		 dw_2.object.sol_qty[arg_cnt] = lr_solqty + lr_notqty
////		 ls_saledet_text = "X"
//	 else 
//		 update item set sales_reserved = sales_reserved + :lr_canqoh
//		 where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류3',"[" + ls_item + "][" + ls_qa + "]판매예약량이 저장되지 않았습니다.",exclamation!)
//			 rollback;
//			 return false
//	    end if		 
		 dw_2.object.saledet_text[arg_cnt] = 'P'
		 dw_2.object.sol_qty[arg_cnt] = 0	
//		 dw_2.object.sol_qty[arg_cnt] = lr_solqty + lr_canqoh		
//		 ls_saledet_text = "P"
//	 end if

// routtempnew.plan_flag = "Y" : 생산계획반영
//								 = "N" : 생산계획에 반영하지않는다.
// routtempnew.process_flag = "Y" : 첫번째공정인경우
//								    = "N" : 첫번째공정이 아닌경우


////////////////////////////////////////////////////////////
	if ls_error <> 'Y' then 
	   if dw_2.update() = 1 then
	      commit;
	   else
	      rollback;
	   end if
	end if
ll_maxrow = dw_2.retrieve()
if ll_maxrow > 0 then
//if ls_saledet_text = "P" then
////////////////////////////////////////////////////////////////////

	 li_chk = 0
	 ls_source   = trim(dw_2.object.groupitem_source[arg_cnt])
	 // source = 'B' : 구매품은 무조건 생산계획을 생성하지 않는다.
    if ls_source = 'B' then 
		return false
	end if
	 
    ls_error = ''
	 ls_order = trim(dw_2.object.order_no[arg_cnt])  
	 ls_item = trim(dw_2.object.item_no[arg_cnt])
	 ls_qa   = trim(dw_2.object.qa[arg_cnt])
	 ls_rem   = trim(dw_2.object.rem[arg_cnt])
			 
	 // 표준공정의 규격은 길이를 "00000"으로한 대표 공정만이 들어있다.
	 ls_qa1 = MidA(ls_qa,1,13) + 'X00000'
	 ls_like = MidA(ls_qa,1,13) + '%'
	 ls_color   = trim(dw_2.object.color[arg_cnt])
	 ls_cust    = trim(dw_2.object.sale_cust_no[arg_cnt])
	 ls_scene   = trim(dw_2.object.sale_scene_code[arg_cnt])
	 ls_uom     = trim(dw_2.object.uom[arg_cnt])
//	 if ls_uom = 'M' then
//		 ls_like = mid(ls_qa,1,13) + '%'
//	 else
//		 ls_like = ls_qa + '%'
//	 end if
	 ldt_duedate = dw_2.object.sale_due_date[arg_cnt]
	 li_seq  = dw_2.object.seq_no[arg_cnt]
	 // itemjaego: 재고물품 테이블 - 이테이블에 있으면 무조건 생산계획을 생성하지 않는다.
//	 select count(*) into :li_count from itemjaego 
//	  where item_no = :ls_item AND qa = :ls_qa;
//	 if li_count > 0 then
		 lr_notqty = dw_2.object.order_qty[arg_cnt]
//	 else
//	 	 lr_notqty = dw_2.object.notqty[arg_cnt]
//	 end if
//	 
		 ls_suju = 'Y' // 2004/08/12 'E' => 'Y' 로 변경
    ll_cnt = dw_3.retrieve(ls_item,ls_like)
	 if sqlca.sqlcode < 0 then
		    messagebox('오류1',ls_item + ", " + ls_qa1 + ' ROUT가 등록되지 않았습니다.',exclamation!)
	   rollback;
		return	 false
	 END IF
	 if ll_cnt < 1 then
		    messagebox('오류2', ls_item + "," + ls_qa1  + 'item에 공정이 등록되지 않았습니다.',exclamation!)
	    rollback;
		return	 false
	 else
	    for ll_jcnt =  1 to ll_cnt
			 lr_qpa       = dw_3.object.qpa[ll_jcnt]     
			 li_bom       = dw_3.object.bom_no[ll_jcnt]
		    ls_wc = trim(dw_3.object.wc_no[ll_jcnt])
			 lr_setuptime = dw_3.object.setup_time[ll_jcnt]
		    lr_runtime   = dw_3.object.run_time[ll_jcnt]
			 li_workper   = dw_3.object.work_per[ll_jcnt]
			 ls_area = dw_3.object.wc_area_no[ll_jcnt]
		    li_operation = dw_3.object.operation[ll_jcnt]   // order_qty - ( sol_qty  +  rlse_qty  +  planqty )
// 실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
		    lr_planqty   = lr_qpa * lr_notqty      
			 ls_assyitem  = trim(dw_3.object.assembly[ll_jcnt])
          ls_assyqa  = trim(dw_3.object.assy_qa[ll_jcnt])		
			 
			 if li_operation = 1 then
			    ls_flag = 'Y'    //첫번째공정이므로 가능
		    else
			    ls_flag = 'N'    //첫번째공정이 아니므로 불가능
		    end if
		 
		    select item_name,uom,source,mp_uom
			 	into :ls_itemname,:ls_uom,:ls_source1,:ls_mpuom 
				from groupitem 
			  where item_no = :ls_assyitem;
		    if sqlca.sqlcode = 100 or sqlca.sqlcode < 0 then
				    messagebox('오류3',ls_assyitem + ' : ' + ls_qa + 'BOM구성이 잘못되었습니다.',exclamation!)
			    rollback;
			    ls_error = 'Y'
				 exit
		    end if
			 
			 ls_qa2 = ls_qa
          if MidA(ls_assyitem,1,1) = 'P' then
				 ls_str = MidA(ls_assyqa,1,14)
				 CHOOSE CASE MidA(ls_item,5,3)
					case '0LT'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 138),5)						
					CASE '0LC'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0C1'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0C2'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0C4'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0C5'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0CT'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0GC'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 35),5)						
					CASE '0GM'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 52),5)						
					CASE 'OMT'
				      ls_qa2 = ls_str + RightA('00000' + string(long(MidA(ls_qa,15,5)) + 52),5)
				 END CHOOSE
			 end if
			 if MidA(ls_assyitem,1,1) = 'M' then
				 ls_qa2 = ls_assyqa
// 실계획수량 = 물품단위당수량 * 미계획수량(수주수량 - (수주가용량 + 출고수량 + 생산계획수량)
				 lr_planqty = lr_planqty * (real(MidA(ls_qa,15,5)) / 1000.0) 
			 end if
			 select count(*) into :li_count from item where item_no = :ls_assyitem and qa = :ls_qa2;
			 if li_count = 0 then
				 ls_qa3 = MidA(ls_qa2,1,14) + '00000'
			    insert into item
			     (item_no,qa,loc_no,item_name,uom,source,leadtime,count_code,qoh,sales_reserved,
			      prodn_reserved,pur_reserved,reorder,safety_stock,lot,obsolete_code,scrap_qty,
			      price_a,price_b,price_c,std_setup,std_material,std_labor,std_burden,std_subcontract,
			      std_machine,month_qty,safety_day,qa1, use_flag)
			    values(:ls_assyitem,:ls_qa2,'WS00000000',:ls_itemname,:ls_uom,:ls_source1,0,'M',0,0,
			           0,0,0,0,0,'N',0,0,0,0,0,0,0,0,0,0,0,0,:ls_qa3, "Y");
			    if sqlca.sqlcode < 0 then
				       messagebox('오류4',sqlca.sqlerrtext,exclamation!)
			       rollback;
				    ls_error = 'Y'
				    exit
			    end if
			    select count(*) into :li_count from itempattern where item_no = :ls_assyitem and qa1 = :ls_qa3;
			    if li_count = 0 then
			       insert into itempattern (item_no,qa1)
			       values(:ls_assyitem,:ls_qa3);
			       if sqlca.sqlcode < 0 then
					       messagebox('오류5','물품코드 저장중 오류가 발생하였습니다.',exclamation!)
				       rollback;
				       ls_error = 'Y'
				       exit
		           end if
		       end if				 
			 end if
			 
			 if ll_jcnt = 1 then // 마지막공정이면(완제품공정)
   			  if lr_runtime = 0 then
					  
				  else
		           choose case trim(ls_mpuom)
			          case 'M'
						    if MidA(ls_assyitem,1,1) = 'M' then
				             lr_runtime = (60.0 * (real(long(MidA(ls_qa,15,5)) / 1000.0) * lr_planqty)) / lr_runtime
						    else
							    lr_runtime = (60.0 * (real(long(MidA(ls_qa2,15,5)) / 1000.0) * lr_planqty)) / lr_runtime 
						    end if
			          case else
				          lr_runtime = (60.0 * lr_planqty) / lr_runtime
		           end choose
				  end if
				  // insert routtempnew #-1
		       insert into routtempnew
		         (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
			       cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
			       assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem,area_no)
		       values (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
		          :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
		          :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem, :ls_area);
			    if sqlca.sqlcode < 0 then
					 int ll_int3
					 select count(*) into :ll_int3 from routtempnew
					  where operation = :li_operation
						and wc_no = :ls_wc
						and sale_no = :ls_order
						and seq_no = :li_seq
						and division = 1;
				   if ll_int3 > 0 then
						delete from routtempnew
					    where operation = :li_operation
						   and wc_no = :ls_wc
						   and sale_no = :ls_order
  					      and seq_no = :li_seq
						   and division = 1;
						 insert into routtempnew
							(work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
							 cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
							 assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem, area_no)
						 values (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
							 :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
							 :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem, :ls_area);
					else
				       messagebox('오류6',ls_item + ',' + ls_qa + '에 대한 공정 구성중 오류가 발생했습니다.',exclamation!)  
		             rollback;
				       ls_error = 'Y'
				       exit
					end if
			    end if
			 else
	// // 중간공정이면
						  if lr_runtime = 0 then
							  
						  else
		                 choose case trim(ls_mpuom)
			                case 'M'
						         if MidA(ls_assyitem,1,1) = 'M' then
				                  lr_runtime = (60.0 * (real(long(MidA(ls_qa,15,5)) / 1000.0) * lr_planqty)) / lr_runtime
						         else
							         lr_runtime = (60.0 * (real(long(MidA(ls_qa2,15,5)) / 1000.0) * lr_planqty)) / lr_runtime 
						         end if
			                case else
				               lr_runtime = (60.0 * lr_planqty) / lr_runtime
		                 end choose
						  end if				
				  // insert routtempnew #-3
		              insert into routtempnew
		               (work_date,division,wc_no,operation,process_flag,work_per,sale_no,seq_no,
			             cust_no,scene_code,napgi_date,suju_type,item_no,qa,item_color,order_qty,
			             assy_item,assy_qa,bom_no,uom,plan_qty,setup_time,work_time,make_qty,plan_flag,qpa,reserved_qty,rem,area_no)
		              values (:ldt_duedate,1,:ls_wc,:li_operation,:ls_flag,:li_workper,:ls_order,:li_seq,
		                :ls_cust,:ls_scene,:ldt_duedate,:ls_suju,:ls_item,:ls_qa,:ls_color,:lr_notqty,
		                :ls_assyitem,:ls_qa2,:li_bom,:ls_uom,:lr_planqty,:lr_setuptime,:lr_runtime,0,'N',:lr_qpa,0,:ls_rem,:ls_area);
			           if sqlca.sqlcode < 0 then
				      	     messagebox('오류9',string(sqlca.sqlerrtext) + "~r~n" + ls_item + ',' + ls_qa + '에 대한 공정 구성중 오류가 발생했습니다.',exclamation!)  
		      	         rollback;
				   	      ls_error = 'Y'
				      	    exit
			           end if
          end if
	    next
		 if ls_error = 'Y' then 
			return false
		end if
	 end if
	 COMMIT;
end if

//update item set sales_reserved = 0 where sales_reserved < 0;
//commit;
messagebox('확인','자동생산계획이 완료되었습니다.',information!)
dw_1.retrieve()
return true
//
end function

on w_mpautosale3_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
end on

on w_mpautosale3_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_2.visible = false
dw_3.visible = false

select def_loc into :is_loc from area where area_no = :gs_area;
IF GF_PERMISSION("자동생산계획생성(화성)", gs_userid) = "Y" AND gs_area = "T0001" THEN
	THIS.postevent('ue_1')
	// 자동생산계획 automatic time = 30분 = 30 * 60초 = 1800초
	//Timer(0.05)
ELSE
	PB_COMPUTE.VISIBLE = FALSE
	MessageBox("사업장권한","'자동생산계획생성(화성)' 권한과, 기본사업장이 일치하지 않습니다.")
END IF
end event

event resize;call super::resize;dw_4.width  = this.width  - 105
dw_1.width  = this.width  - 105
dw_1.height = this.height - 1132

end event

type pb_save from w_inheritance`pb_save within w_mpautosale3_m
boolean visible = false
integer x = 3022
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_mpautosale3_m
integer x = 32
integer y = 992
integer width = 3575
integer height = 1144
integer taborder = 60
string dataobject = "d_mpautosale3_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rbuttondown;//These statements in the RButtonDown script 
//for the window display a popup menu at the cursor position. 
//Menu4 was created in the Menu painter and includes a menu called m_language. 
//Menu4 is not the menu for the active window and therefore needs to be created. 
//NewMenu is an instance of Menu4 (data type Menu4):
////
if row <1 then return

int li_int, li_seq
string ls_order, ls_login, ls_name, ls_qa1
long ll_found, ll_row, ll_cnt
string ls_item,ls_itemname,ls_qa

this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_man.PopMenu(parent.parentwindow().PointerX(),  parent.parentwindow().PointerY())
CHOOSE CASE gs_print_control
	CASE "plan"
	   if messagebox("확인", string(row) + " 번째 자료를 생산계획으로 변환하시겠습니까", &
			Exclamation!, OKCancel!, 2) = 1 then
			ls_order = this.object.order_no[row]
			li_seq = this.object.seq_no[row]
			is_clause = " and sale.order_no = ~~'" + ls_order + "~~'" &
						 + " and saledet.seq_no = " + string(li_seq)  &
			          + " and sale.confirm_flag = ~~'Y~~'" &
			          + " and sale.open_close = ~~'O~~'" &
			          + " and saledet.saledet_text in (~~'N~~',~~'P~~',~~'Q~~')" &
						 + " and saledet.order_qty > (saledet.rlse_qty + saledet.sol_qty + saledet.plan_qty)" &
			          + " and routtempnew.division = 1" &
						 + " and saledet.item_no like ~~'P%~~'" &
						 + " and saledet.item_no not in (~~'PZZZPP1ZZZ~~',~~'PZZZPP2ZZZ~~')"
			is_where = "DataWindow.Table.Select='"  + is_select + is_clause + "'"
			dw_2.Modify(is_where)
			dw_2.settransobject(sqlca)
			if dw_2.retrieve() > 0 then
				wf_onecalc(1)
			end if
		end if
	CASE "mess"
		ls_order = this.object.order_no[row]
		li_seq = this.object.seq_no[row]
		ls_login = this.object.sale_login_id[row]
		gs_custper_str lstr_where
		lstr_where.str_ok = false
		lstr_where.str_where = LeftA((ls_login + SPACE(10)),10) + "수주번호 [" + ls_order + "]" &
								+ "의 " + STRING(li_seq) + "번째 내역을 재확인요망"
		openwithparm(w_sysmsg_m,lstr_where)
		w_sysmsg_m.WindowState = Normal!
	CASE 'rout'

		open(w_mprout_r)

		row = this.getrow()
		if row < 1 then return
		w_mprout_r.dw_3.setredraw(false)
		w_mprout_r.dw_1.setredraw(false)
		for ll_row = 1 to this.rowcount()
			ls_item = trim(this.object.item_no[ll_row])
			ls_qa1 = LeftA(this.object.qa[ll_row], 13) + "X00000"
		   ll_found = w_mprout_r.dw_3.Find( "item_no = '"+ ls_item + "' and qa1 = '" + ls_qa1 +"'", 1, w_mprout_r.dw_3.rowcount())
			if ll_found > 0 then continue
			ll_cnt = w_mprout_r.dw_3.insertrow(0)
			w_mprout_r.dw_3.object.item_no[ll_cnt] = ls_item
			w_mprout_r.dw_3.object.item_item_name[ll_cnt] = trim(this.object.groupitem_item_name[ll_row])
			w_mprout_r.dw_3.object.qa1[ll_cnt] = ls_qa1
		next
		ls_item = trim(this.object.item_no[row])
		ls_qa1 = LeftA(this.object.qa[row], 13) + "X00000"
		ll_found = w_mprout_r.dw_3.Find( "item_no = '"+ ls_item + "' and qa1 = '" + ls_qa1 +"'", 1, w_mprout_r.dw_3.rowcount())
		w_mprout_r.dw_3.scrolltorow(ll_found)
		w_mprout_r.dw_1.retrieve(ls_item)
		w_mprout_r.dw_3.setredraw(true)
		w_mprout_r.dw_1.setredraw(true)
		w_mprout_r.sle_1.text = ls_item
	CASE 'item'

		open(w_mpjaegoc_r)

		row = this.getrow()
		if row < 1 then return
		ls_item = trim(this.object.item_no[row])
		ls_itemname = trim(this.object.groupitem_item_name[row])
		ls_qa   = trim(this.object.qa[row])
		w_mpjaegoc_r.dw_1.object.item_no[1] = ls_item
		w_mpjaegoc_r.dw_1.object.item_name[1] = ls_itemname
		w_mpjaegoc_r.dw_2.retrieve(ls_item)
		ll_found = w_mpjaegoc_r.dw_2.Find( "qa = '" + ls_qa + "'",1, w_mpjaegoc_r.dw_2.RowCount())
		if ll_found > 0 then
			w_mpjaegoc_r.dw_2.scrolltorow(ll_found)
		end if
END CHOOSE

//w_frame.PointerX(), w_frame.PointerY())

end event

type dw_2 from w_inheritance`dw_2 within w_mpautosale3_m
integer x = 1760
integer y = 72
integer width = 128
integer height = 108
integer taborder = 70
string dataobject = "d_mpautosale1_m"
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_mpautosale3_m
integer x = 46
integer width = 1522
integer height = 128
string text = "자동생산계획생성(화성)"
end type

type st_tips from w_inheritance`st_tips within w_mpautosale3_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpautosale3_m
integer x = 3195
integer y = 64
integer taborder = 100
end type

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_maxrow, ll_row

ll_row  = dw_4.insertrow(0)
dw_4.object.msg1[ll_row] = " START 자동계산 : " + STRING(now())
//start 가용재고로 대체
ll_maxrow = dw_1.rowcount()
if ll_maxrow < 1 then goto kkk
if wf_alter(ll_maxrow) = true then
   if dw_1.update() = 1 then
      commit;
   else
      rollback;
   end if
end if

// 계획수량 설정
//ll_maxrow = dw_1.retrieve()
//if ll_maxrow < 1 then goto kkk
if wf_plandet(ll_maxrow) = false then
   rollback;
	return
end if  

kkk:
//update item set sales_reserved = 0 where sales_reserved < 0;
commit;
	ll_row  = dw_4.insertrow(0)
	dw_4.object.msg1[ll_row] = "완료 --------- 자동생산계획이 완료되었습니다 ------------------- " + STRING(now())
	dw_4.insertrow(0)
close(w_icprocess)
dw_1.retrieve()

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpautosale3_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpautosale3_m
integer x = 3387
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpautosale3_m
boolean visible = false
integer x = 2757
integer y = 60
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpautosale3_m
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpautosale3_m
integer x = 457
integer y = 228
integer width = 91
integer height = 92
integer taborder = 140
integer textsize = -9
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
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

type pb_insert from w_inheritance`pb_insert within w_mpautosale3_m
integer x = 32
integer y = 228
integer width = 425
integer height = 92
integer taborder = 160
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

event pb_insert::clicked;IF MESSAGEBOX("확인","처리내역 전체를 지우시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
	DW_4.RESET()
END IF
	

end event

event pb_insert::mousemove;//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpautosale3_m
integer x = 2615
integer y = 64
integer width = 576
integer taborder = 150
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주내역 재조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve()

end event

event pb_retrieve::mousemove;//
end event

type gb_3 from w_inheritance`gb_3 within w_mpautosale3_m
boolean visible = false
integer x = 1792
integer y = 256
integer width = 1641
integer height = 196
integer taborder = 80
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_mpautosale3_m
boolean visible = false
integer x = 544
integer y = 236
integer width = 3026
integer height = 1888
integer taborder = 90
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpautosale3_m
integer x = 2592
integer y = 20
integer width = 1006
integer taborder = 40
end type

type dw_3 from datawindow within w_mpautosale3_m
integer x = 1618
integer y = 72
integer width = 128
integer height = 108
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_mproutnew_m"
boolean resizable = true
end type

type dw_4 from datawindow within w_mpautosale3_m
integer x = 32
integer y = 328
integer width = 3575
integer height = 644
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_msg_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

