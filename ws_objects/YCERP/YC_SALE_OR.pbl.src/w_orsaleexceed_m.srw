$PBExportHeader$w_orsaleexceed_m.srw
$PBExportComments$판매수주관리(1998/03/30, 정재수)
forward
global type w_orsaleexceed_m from w_inheritance
end type
type gb_6 from groupbox within w_orsaleexceed_m
end type
type dw_4 from datawindow within w_orsaleexceed_m
end type
type dw_6 from datawindow within w_orsaleexceed_m
end type
type em_3 from editmask within w_orsaleexceed_m
end type
type em_2 from editmask within w_orsaleexceed_m
end type
type em_1 from editmask within w_orsaleexceed_m
end type
type em_4 from editmask within w_orsaleexceed_m
end type
type st_2 from statictext within w_orsaleexceed_m
end type
type dw_3 from datawindow within w_orsaleexceed_m
end type
type cb_1 from commandbutton within w_orsaleexceed_m
end type
type cb_2 from commandbutton within w_orsaleexceed_m
end type
type dw_5 from datawindow within w_orsaleexceed_m
end type
type pb_4 from picturebutton within w_orsaleexceed_m
end type
type cb_4 from commandbutton within w_orsaleexceed_m
end type
type cb_7 from commandbutton within w_orsaleexceed_m
end type
type cb_filteroff from commandbutton within w_orsaleexceed_m
end type
type cb_filteron from commandbutton within w_orsaleexceed_m
end type
type sle_value from singlelineedit within w_orsaleexceed_m
end type
type ddlb_2 from dropdownlistbox within w_orsaleexceed_m
end type
type st_9 from statictext within w_orsaleexceed_m
end type
type ddlb_col from dropdownlistbox within w_orsaleexceed_m
end type
type st_8 from statictext within w_orsaleexceed_m
end type
type pb_7 from picturebutton within w_orsaleexceed_m
end type
type st_1 from statictext within w_orsaleexceed_m
end type
type st_6 from statictext within w_orsaleexceed_m
end type
type st_vertical from u_splitbar_vertical within w_orsaleexceed_m
end type
type st_vertical1 from u_splitbar_vertical within w_orsaleexceed_m
end type
type dw_7 from datawindow within w_orsaleexceed_m
end type
type st_3 from statictext within w_orsaleexceed_m
end type
type st_4 from statictext within w_orsaleexceed_m
end type
type st_5 from statictext within w_orsaleexceed_m
end type
type st_7 from statictext within w_orsaleexceed_m
end type
type gb_5 from groupbox within w_orsaleexceed_m
end type
type dw_8 from datawindow within w_orsaleexceed_m
end type
type st_10 from statictext within w_orsaleexceed_m
end type
type ddlb_gubun from dropdownlistbox within w_orsaleexceed_m
end type
type cb_cancel from commandbutton within w_orsaleexceed_m
end type
type cb_save from commandbutton within w_orsaleexceed_m
end type
type pb_1 from picturebutton within w_orsaleexceed_m
end type
end forward

global type w_orsaleexceed_m from w_inheritance
integer x = 5
integer y = 148
integer width = 7657
integer height = 2668
string title = "한도승인수주(w_orsaleexceed_m)"
boolean hscrollbar = true
boolean vscrollbar = true
gb_6 gb_6
dw_4 dw_4
dw_6 dw_6
em_3 em_3
em_2 em_2
em_1 em_1
em_4 em_4
st_2 st_2
dw_3 dw_3
cb_1 cb_1
cb_2 cb_2
dw_5 dw_5
pb_4 pb_4
cb_4 cb_4
cb_7 cb_7
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
ddlb_2 ddlb_2
st_9 st_9
ddlb_col ddlb_col
st_8 st_8
pb_7 pb_7
st_1 st_1
st_6 st_6
st_vertical st_vertical
st_vertical1 st_vertical1
dw_7 dw_7
st_3 st_3
st_4 st_4
st_5 st_5
st_7 st_7
gb_5 gb_5
dw_8 dw_8
st_10 st_10
ddlb_gubun ddlb_gubun
cb_cancel cb_cancel
cb_save cb_save
pb_1 pb_1
end type
global w_orsaleexceed_m w_orsaleexceed_m

type variables
st_print i_print
datawindowchild idwc_cust_no, idwc_scene
datawindowchild idwc_area
datawindowchild idwc_qa, idwc_cust, idwc_item
datawindowchild idwc_color

string is_scenesql, is_qasql, is_flag, is_import_chk = 'X'
string is_custconst

end variables

forward prototypes
public subroutine wf_sceneretrieve (string as_cust)
public function boolean wf_confirm (string as_mess)
public subroutine wf_calc ()
public subroutine wf_ret (string as_order)
public function string wf_color (string as_item)
public function decimal wf_saleamt (string as_cust, string as_start, string as_end)
end prototypes

public subroutine wf_sceneretrieve (string as_cust);// 선택한 거래처의 현장만 보여주기
string ls_where, ls_sql

ls_where = "WHERE scene.cust_no = ~~'" + as_cust + "~~'"
ls_sql   = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

dw_2.getchild("scene_code", idwc_scene)
idwc_scene.SetTransObject(sqlca)
idwc_scene.Modify(ls_sql)
idwc_scene.Retrieve()

end subroutine

public function boolean wf_confirm (string as_mess);string ls_order, ls_confirm_flag

dw_2.accepttext()
if dw_2.rowcount() < 1 then return false

ls_order = dw_2.object.order_no[1]
SELECT confirm_flag INTO :ls_confirm_flag FROM sale
 WHERE order_no = :ls_order;

if ls_confirm_flag = 'Y' then
	if as_mess = 'Y' then
		MessageBox("확인","이미 확정된 수주입니다.~r~n작업을 진행하실수 없습니다.",information!)
	end if
   return false
end if

return true
end function

public subroutine wf_calc ();long    ll_row
decimal lr_amt
string  ls_tax_sign

dw_2.setredraw(false)
dw_3.accepttext()
dw_2.accepttext()
if dw_2.rowcount() < 1 then return

//공급가액, V.A.T계산
if dw_3.rowcount() > 0 then
	for ll_row = 1 to dw_3.rowcount() step 1
		lr_amt = lr_amt + dw_3.getitemdecimal(ll_row, "amount")
	next
	
	dw_2.object.sale_amount[1] = lr_amt
	ls_tax_sign = dw_2.getitemstring(1, "tax_sign")
	if ls_tax_sign = 'Y' then
		dw_2.object.sale_tax[1] = 0
		// 20080123 부가세 계산방식 변경
		IF dw_2.object.curr_code[1] = 'WON' then
		   dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 0 )
		else
		   dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 2 )
		end if
		
///*		
//		IF dw_2.object.curr_code[1] = 'WON' then
////		   dw_2.object.sale_tax[1] = truncate(lr_amt / 10, 0)
//			for ll_row = 1 to dw_3.rowcount()
//			    dw_2.object.sale_tax[1] = dw_2.object.sale_tax[1] + TRUNCATE((dw_3.object.amount[ll_row] / 10) + 0.0000001, 0 )
//			next
//		else
////		   dw_2.object.sale_tax[1] = lr_amt / 10
//			for ll_row = 1 to dw_3.rowcount()
//			    dw_2.object.sale_tax[1] = dw_2.object.sale_tax[1] + TRUNCATE((dw_3.object.amount[ll_row] / 10) + 0.0000001, 2 )
//			next
//		end if
//*/
	else
		dw_2.object.sale_tax[1] = 0
	end if
else
	dw_2.object.sale_amount[1] = 0
	dw_2.object.sale_tax[1] = 0
end if
dw_2.setredraw(true)

end subroutine

public subroutine wf_ret (string as_order);string ls_confirm_flag, ls_scene_code, ls_scene_name

dw_2.setredraw(false)
dw_2.retrieve(as_order)

setnull(ls_scene_code)
setnull(ls_scene_name)
if dw_2.rowcount() < 1 then return

ls_scene_code = dw_2.object.scene_code[1]
SELECT scene_desc INTO :ls_scene_name FROM scene
 WHERE scene_code = :ls_scene_code;
idwc_scene.SetItem(1, "scene_code", ls_scene_code)
idwc_scene.SetItem(1, "scene_desc", ls_scene_name)
dw_2.setredraw(true)

dw_3.retrieve(as_order)

end subroutine

public function string wf_color (string as_item);string ls_ret

setnull(ls_ret)
		//색상선택
choose case RightA(as_item, 1)
case '0', 'R', 'I', 'K', 'S', 'F', 'G', 'W', 'L', 'B', '1', '3', '4'
	ls_ret = RightA(as_item, 1) + '000'
case 'Z'
	dw_3.getchild("color", idwc_color)
	idwc_color.settransobject(sqlca)
	idwc_color.setfilter("left(color_code,1) = 'Z' " &
				+ "or (color_code not in ('0000','1000','3000','4000','B000','F000','G000','I000'," &
				+ "'K000','L000','R000','S000','W000') )")
	idwc_color.filter()
	ls_ret = 'Z000'
end choose
return ls_ret
end function

public function decimal wf_saleamt (string as_cust, string as_start, string as_end);//decimal amt
//
//SELECT AMT   = SUM(A.AMOUNT)  INTO :amt
//  FROM (
//       SELECT CUST_NO      = B.CUST_NO
//            , CUST_NAME    = C.CUST_NAME   
//            , ORDER_NO     = B.ORDER_NO        
//            , SEQ_NO       = A.SEQ_NO       
//            , SCENE_CODE   = B.SCENE_CODE      
//            , SCENE_DESC   = E.SCENE_DESC     
//            , SALE_FLAG    = B.SALE_FLAG       
//            , ORDER_DATE   = CONVERT(CHAR(10),B.ORDER_DATE,111)     
//            , CUST_PO_DATE = CONVERT(CHAR(10),B.CUST_PO_DATE,111)   
//            , DUE_DATE     = CONVERT(CHAR(10),B.DUE_DATE,111)       
//            , ITEM_NO      = A.ITEM_NO       
//            , ITEM_NAME    = F.ITEM_NAME   
//            , QA           = A.QA            
//            , UOM          = A.UOM           
//            , ORDER_QTY    = A.ORDER_QTY     
//            , ACC_QTY      = A.ACC_QTY       
//            , PRICE        = A.PRICE         
//            , AMOUNT       = A.ACC_QTY * A.PRICE
//            , RLSE_QTY     = ISNULL(A.RLSE_QTY,0)        
//            , SHIP_FLAG    = DBO.UF_GETSHIPFLAG(B.SHIP_FLAG)   
//            , COLOR_NAME   = ISNULL(D.COLOR_NAME,'')       
//            , WORK_NAME    = H.WORK_NAME
//         FROM SALEDET A
//              LEFT OUTER JOIN SALE B      ON A.ORDER_NO = B.ORDER_NO
//              LEFT OUTER JOIN CUSTOMER C  ON B.CUST_NO     = C.CUST_NO
//              LEFT OUTER JOIN COLOR D     ON A.COLOR    = D.COLOR_CODE
//              LEFT OUTER JOIN SCENE E     ON B.SCENE_CODE  = E.SCENE_CODE
//              LEFT OUTER JOIN GROUPITEM F ON A.ITEM_NO  = F.ITEM_NO
//              LEFT OUTER JOIN ROUT  G     ON A.ITEM_NO  = G.ITEM_NO  AND SUBSTRING(A.QA,1,14) + '00000' = G.QA
//              LEFT OUTER JOIN WC    H     ON G.WC_NO       = H.WORK_NO         
///*	 WHERE ( B.OPEN_CLOSE     NOT IN ('X','C')     ) 	*/
//   WHERE ( B.OPEN_CLOSE     = 'O'     ) /* jowonsuk 2022-05-25  한도초과건 */
//          AND ( B.CUST_NO          LIKE :as_cust      ) 
//          AND ( B.SALE_FLAG          IN ('D','L','E') ) 
//          AND ( CONVERT(CHAR(10),B.ORDER_DATE,111)  BETWEEN :as_start AND :as_end ) 
//          AND ( B.CONFIRM_FLAG       IN ('N','T','Y') ) 
//          AND ( G.OPERATION   = 1    OR G.OPERATION IS NULL )
//       ) A
//   GROUP BY CUST_NO;
//	
//RETURN AMT

decimal amt, l_amt1, l_amt2

setnull(amt)
setnull(l_amt1)
setnull(l_amt2)


/* 2022-04-05 jowonsuk 당월 수주액??? */	
//SELECT AMT   = SUM(A.AMOUNT)  INTO :amt
//  FROM (
//				 SELECT CUST_NO      = B.CUST_NO
//						, CUST_NAME    = C.CUST_NAME   
//						, ORDER_NO     = B.ORDER_NO        
//						, SEQ_NO       = A.SEQ_NO       
//						, SCENE_CODE   = B.SCENE_CODE      
//						, SCENE_DESC   = E.SCENE_DESC     
//						, SALE_FLAG    = B.SALE_FLAG       
//						, ORDER_DATE   = CONVERT(CHAR(10),B.ORDER_DATE,111)     
//						, CUST_PO_DATE = CONVERT(CHAR(10),B.CUST_PO_DATE,111)   
//						, DUE_DATE     = CONVERT(CHAR(10),B.DUE_DATE,111)       
//						, ITEM_NO      = A.ITEM_NO       
//						, ITEM_NAME    = F.ITEM_NAME   
//						, QA           = A.QA            
//						, UOM          = A.UOM           
//						, ORDER_QTY    = A.ORDER_QTY     
//						, ACC_QTY      = A.ACC_QTY       
//						, PRICE        = A.PRICE         
//						, AMOUNT       = A.ACC_QTY * A.PRICE
//						, RLSE_QTY     = ISNULL(A.RLSE_QTY,0)        
//						, SHIP_FLAG    = DBO.UF_GETSHIPFLAG(B.SHIP_FLAG)   
//						, COLOR_NAME   = ISNULL(D.COLOR_NAME,'')       
//						, WORK_NAME    = H.WORK_NAME
//					FROM SALEDET A with(nolock)
//						  LEFT OUTER JOIN SALE B  with(nolock)    ON A.ORDER_NO = B.ORDER_NO
//						  LEFT OUTER JOIN CUSTOMER C with(nolock) ON B.CUST_NO     = C.CUST_NO
//						  LEFT OUTER JOIN COLOR D  with(nolock)   ON A.COLOR    = D.COLOR_CODE
//						  LEFT OUTER JOIN SCENE E   with(nolock)  ON B.SCENE_CODE  = E.SCENE_CODE
//						  LEFT OUTER JOIN GROUPITEM F with(nolock) ON A.ITEM_NO  = F.ITEM_NO
//						  LEFT OUTER JOIN ROUT  G  with(nolock)   ON A.ITEM_NO  = G.ITEM_NO  AND SUBSTRING(A.QA,1,14) + '00000' = G.QA
//						  LEFT OUTER JOIN WC    H    with(nolock) ON G.WC_NO       = H.WORK_NO         
///*				  WHERE ( B.OPEN_CLOSE     NOT IN ('X','C')     ) 	*/
//				  WHERE ( B.OPEN_CLOSE     = 'O'     ) /* jowonsuk 2022-05-25  한도초과건 */
//					 AND ( B.CUST_NO          LIKE :as_cust      ) 
//					 AND ( B.SALE_FLAG          IN ('D','L','E') ) 
//					 AND ( CONVERT(CHAR(10),B.ORDER_DATE,111)  BETWEEN :as_start AND CONVERT(CHAR(10), DATEADD( DAY, -DATEPART(DD,GETDATE()), DATEADD(MONTH,1,GETDATE()) ), 111) ) 
//					 AND ( B.CONFIRM_FLAG       IN ('N','T','Y') ) 
//					 AND ( G.OPERATION   = 1    OR G.OPERATION IS NULL )
//       ) A
//   GROUP BY CUST_NO;


			   /*2022-06-07 jowonsuk 미수잔액+어음잔액으로 수정 */
				
			/*미수잔액*/	
                   select 
                      (case substring(:as_start,6,2)
											 when '01' then a.inv_01 - a.coll_01
											 when '02' then a.inv_01 + a.inv_02 
															  - a.coll_01 - a.coll_02
											 when '03' then a.inv_01 + a.inv_02 + a.inv_03 
															  - a.coll_01 - a.coll_02 - a.coll_03
											 when '04' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04
											 when '05' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 + a.inv_05 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04 - a.coll_05
											 when '06' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 + a.inv_05 + a.inv_06 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04 - a.coll_05 - a.coll_06
											 when '07' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 + a.inv_05 + a.inv_06 + a.inv_07 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04 - a.coll_05 - a.coll_06 - a.coll_07
											 when '08' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 + a.inv_05 + a.inv_06 + a.inv_07 + a.inv_08 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04 - a.coll_05 - a.coll_06 - a.coll_07 - a.coll_08
											 when '09' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 + a.inv_05 + a.inv_06 + a.inv_07 + a.inv_08 + a.inv_09 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04 - a.coll_05 - a.coll_06 - a.coll_07 - a.coll_08 - a.coll_09
											 when '10' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 + a.inv_05 + a.inv_06 + a.inv_07 + a.inv_08 + a.inv_09 + a.inv_10 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04 - a.coll_05 - a.coll_06 - a.coll_07 - a.coll_08 - a.coll_09 - a.coll_10
											 when '11' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 + a.inv_05 + a.inv_06 + a.inv_07 + a.inv_08 + a.inv_09 + a.inv_10 + a.inv_11 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04 - a.coll_05 - a.coll_06 - a.coll_07 - a.coll_08 - a.coll_09 - a.coll_10 - a.coll_11
											 when '12' then a.inv_01 + a.inv_02 + a.inv_03 + a.inv_04 + a.inv_05 + a.inv_06 + a.inv_07 + a.inv_08 + a.inv_09 + a.inv_10 + a.inv_11 + a.inv_12 
															  - a.coll_01 - a.coll_02 - a.coll_03 - a.coll_04 - a.coll_05 - a.coll_06 - a.coll_07 - a.coll_08 - a.coll_09 - a.coll_10 - a.coll_11 - a.coll_12
									  end) + a.balbf_amount remainder_amt into :l_amt1
                    from opeom a
                    where cust_no = :as_cust
                    and datepart(year,a.eom_year)    = substring(:as_start,1,4);                       
                       
                       
				/*어음잔액*/								  
                     select  sum(bill_amount) bill_amount
				    into :l_amt2
                     from 
                    (  
                      SELECT cust_no    = a.cust_no
                    				 , bill_amount= a.bill_amount
                    			 FROM glbill A with (nolock) 
                            WHERE  a.cust_no = :as_cust
                            and (a.bill_class   IN ('R','D')) /*받을,부도*/
                    				OR (a.bill_class    = 'P' AND convert(char(10),a.close_date,111) >= convert(char(10),getdate(),111) )
                        union all
                    	  SELECT a.cust_no, bill_amount = a.amount         
                    			 FROM aroivc a with (nolock) 
                    			  where  a.cust_no = :as_cust
                            AND a.rcpt_type  = 'G'
                    			  AND a.delete_key  = 'N'
                    			  AND a.amount  > 0
                    ) a;                       


			   IF ISNULL(l_amt1) then l_amt1 = 0 
			   IF ISNULL(l_amt2) then l_amt2 = 0 				
				
			   amt =  l_amt1  +  l_amt2
	
RETURN AMT


end function

on w_orsaleexceed_m.create
int iCurrent
call super::create
this.gb_6=create gb_6
this.dw_4=create dw_4
this.dw_6=create dw_6
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.em_4=create em_4
this.st_2=create st_2
this.dw_3=create dw_3
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_5=create dw_5
this.pb_4=create pb_4
this.cb_4=create cb_4
this.cb_7=create cb_7
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.sle_value=create sle_value
this.ddlb_2=create ddlb_2
this.st_9=create st_9
this.ddlb_col=create ddlb_col
this.st_8=create st_8
this.pb_7=create pb_7
this.st_1=create st_1
this.st_6=create st_6
this.st_vertical=create st_vertical
this.st_vertical1=create st_vertical1
this.dw_7=create dw_7
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_7=create st_7
this.gb_5=create gb_5
this.dw_8=create dw_8
this.st_10=create st_10
this.ddlb_gubun=create ddlb_gubun
this.cb_cancel=create cb_cancel
this.cb_save=create cb_save
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_6
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_6
this.Control[iCurrent+4]=this.em_3
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.em_4
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.dw_3
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.dw_5
this.Control[iCurrent+13]=this.pb_4
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.cb_7
this.Control[iCurrent+16]=this.cb_filteroff
this.Control[iCurrent+17]=this.cb_filteron
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.ddlb_2
this.Control[iCurrent+20]=this.st_9
this.Control[iCurrent+21]=this.ddlb_col
this.Control[iCurrent+22]=this.st_8
this.Control[iCurrent+23]=this.pb_7
this.Control[iCurrent+24]=this.st_1
this.Control[iCurrent+25]=this.st_6
this.Control[iCurrent+26]=this.st_vertical
this.Control[iCurrent+27]=this.st_vertical1
this.Control[iCurrent+28]=this.dw_7
this.Control[iCurrent+29]=this.st_3
this.Control[iCurrent+30]=this.st_4
this.Control[iCurrent+31]=this.st_5
this.Control[iCurrent+32]=this.st_7
this.Control[iCurrent+33]=this.gb_5
this.Control[iCurrent+34]=this.dw_8
this.Control[iCurrent+35]=this.st_10
this.Control[iCurrent+36]=this.ddlb_gubun
this.Control[iCurrent+37]=this.cb_cancel
this.Control[iCurrent+38]=this.cb_save
this.Control[iCurrent+39]=this.pb_1
end on

on w_orsaleexceed_m.destroy
call super::destroy
destroy(this.gb_6)
destroy(this.dw_4)
destroy(this.dw_6)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.em_4)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_5)
destroy(this.pb_4)
destroy(this.cb_4)
destroy(this.cb_7)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.sle_value)
destroy(this.ddlb_2)
destroy(this.st_9)
destroy(this.ddlb_col)
destroy(this.st_8)
destroy(this.pb_7)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.st_vertical)
destroy(this.st_vertical1)
destroy(this.dw_7)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.gb_5)
destroy(this.dw_8)
destroy(this.st_10)
destroy(this.ddlb_gubun)
destroy(this.cb_cancel)
destroy(this.cb_save)
destroy(this.pb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_4 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)

st_vertical1.of_set_leftobject( dw_2 )
st_vertical1.of_set_rightobject( dw_7 )
st_vertical1.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////
//01.dw_1
dw_1.getchild("cust_no", idwc_cust_no)
idwc_cust_no.settransobject(sqlca)
idwc_cust_no.retrieve( )
dw_1.insertrow(0)


// 공무관리담당자는 거래처변경 못함
if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
	SELECT rtrim(bigo) INTO :is_custconst FROM codemst 
	 WHERE type = '공무관리담당자' AND use_yn = 'Y' AND item_cd = :gs_userid;	
	if isnull(is_custconst) OR is_custconst = "" OR LenA(is_custconst) <> 4 then
		MessageBox("확인","공무관리담당자의 기준정보(codemst) 거래처가 누락 되었습니다")
		RETURN
	end if

	dw_1.object.cust_no[1] = is_custconst
end if

//02.dw_2
dw_2.getchild("cust_no", idwc_cust)
idwc_cust.settransobject( sqlca)
idwc_cust.retrieve( )
dw_2.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.retrieve()
idwc_scene.insertrow(0)  
is_scenesql = idwc_scene.describe("datawindow.table.select")

//03.dw_3
dw_3.getchild("item_no", idwc_item)
idwc_item.settransobject(sqlca)
idwc_item.retrieve()
dw_3.getchild("qa", idwc_qa)
GS_DS_QAALL.ShareData(idwc_qa)

//04.SetTransObject
dw_2.SetTransObject(SQLCA)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_7.settransobject(sqlca)

//05.초기화
em_1.text		= string(RelativeDate(today(), - 10), "yyyy/mm/dd")
em_2.text		= string(RelativeDate(today(), + 10), "yyyy/mm/dd")
ddlb_col.text	= "현장명"
ddlb_2.text		= "LIKE"
ddlb_gubun.text= '초과     Z'

//06.조회
pb_retrieve.PostEvent(Clicked!)

end event

event resize;call super::resize;gb_2.width  = newwidth  - (gb_2.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_7.width  = newwidth  - dw_7.x - gb_2.x
dw_3.width  = newwidth  - (gb_2.x * 2)
dw_3.height = newheight - dw_3.y - gb_2.x


end event

event key;call super::key;// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
IF keyflags = 2 THEN
	IF key = KeyS! THEN
		if MessageBox("확인", "수주내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			//pb_save.triggerevent(clicked!)
			cb_save.triggerevent(clicked!)			
		end if
	END IF
END IF


end event

type pb_save from w_inheritance`pb_save within w_orsaleexceed_m
event ue_print pbm_custom01
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 280
end type

event pb_save::clicked;string ls_order_no, ls_open_close, ls_temp

if dw_2.rowcount() < 1 then return

ls_order_no	= dw_2.getitemstring(1, 'order_no')

select
	open_close
into
	:ls_open_close
from
	sale
where
	order_no = :ls_order_no
using sqlca;	

if ls_open_close <> 'Z' then
	ls_temp		= "상태가 한도초과건만~r~n확정을 할수 있습니다."
	MessageBox("확인",ls_temp)
	return
end if

if MessageBox("확인","확정 하시겠습니까?",question!,okcancel!,1) = 2 then return

dw_2.setItem(1, 'orexceed_confirm_user', gs_userid)
dw_2.setItem(1, 'orexceed_confirm_date', gf_today())
if dw_2.accepttext() = -1 then 
	messagebox("오류","저장 중 오류가 발생했습니다.~r~n다시 진행해 주시기 바랍니다.")
	return
end if
if wf_update1( dw_2, 'Y') = false then RETURN
//조회
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

pb_retrieve.postevent(clicked!)
end event

type dw_1 from w_inheritance`dw_1 within w_orsaleexceed_m
integer x = 1317
integer y = 108
integer width = 923
integer height = 88
integer taborder = 100
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;cb_filteroff.triggerevent(clicked!)
//pb_retrieve.postevent(clicked!)

end event

event dw_1::keydown;call super::keydown;// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
IF keyflags = 2 THEN
	IF key = KeyS! THEN
		if MessageBox("확인", "수주내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_save.triggerevent(clicked!)
		end if
	END IF
END IF

if key = KeyEnter! then
	//////////////////////////////////////////////////////////////////////
	//// 공무관리담당자는 거래처변경 못함
	//////////////////////////////////////////////////////////////////////
	if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
		if this.object.cust_no[dw_1.getrow()] = is_custconst then
			// 공무관리담당자는 거래처변경 못함
		else
			MessageBox("확인3","공무관리담당자는 해당하는 거래처만 선택할 수 있습니다!",exclamation!)
			this.object.cust_no[dw_1.getrow()] = is_custconst 
		end if
	end if
	//////////////////////////////////////////////////////////////////////	
end if

end event

type st_title from w_inheritance`st_title within w_orsaleexceed_m
integer x = 37
integer y = 32
integer width = 942
string text = "한도승인수주관리"
end type

type st_tips from w_inheritance`st_tips within w_orsaleexceed_m
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleexceed_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 220
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "공정물품조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::mousemove;//
end event

event pb_compute::clicked;//공정물품조회(w_whrout_w)
open(w_whrout_w)
end event

type pb_print_part from w_inheritance`pb_print_part within w_orsaleexceed_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 230
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서작성"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x - 70
li_y = this.y + 156

f_usetips(st_tips,"직거래작성",parent, li_x, li_y)


end event

event pb_print_part::clicked;dwitemstatus l_status
if dw_2.rowcount() < 1 then return

l_status = dw_2.getitemstatus(1, 0, primary!)
if l_status = newmodified! or l_status = new! then
	MessageBox("확인","수주를 저장후에 작업 하십시요")
	return
end if

IF IsValid(w_o_main) = true THEN
	OpenSheet(w_oido_m, w_o_main, 5, original!)
ELSE
	OpenSheet(w_oido_m, w_all_main, 5, original!)
END IF

w_oido_m.setredraw(false)
pb_compute.setfocus()
w_oido_m.em_3.text = LeftA(dw_2.object.order_no[1],10) + RightA(dw_2.object.order_no[1],3)
w_oido_m.pb_compute.postevent(clicked!)
w_oido_m.setredraw(true)

end event

type pb_close from w_inheritance`pb_close within w_orsaleexceed_m
integer x = 4206
integer y = 40
integer width = 178
integer taborder = 290
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleexceed_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 178
integer taborder = 240
end type

event pb_print::clicked;string     ls_where, ls_sql, ls_dw5sql
w_repsuper w_print
st_print   l_print
gs_itembaldo_str  ist_code
 
if dw_2.getrow() > 0 then
	ist_code.start_no = dw_2.object.order_no[1]
	ist_code.end_no   = dw_2.object.order_no[1]
	ist_code.start_date = string(dw_2.object.order_date[dw_2.getrow()],"yyyy/mm/dd")
	ist_code.end_date   = string(dw_2.object.order_date[dw_2.getrow()],"yyyy/mm/dd")
end if

string ls_scenehp
if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if

OpenWithParm(w_whsaledet_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if ist_code.sel_flag = 'S' then	// 수주상황접수부
	l_print.st_print_desc = " 이 프로그램은 수주상황접수부를 출력합니다." 
	dw_5.dataobject = 'd_orsale_print2'
ELSE										// 수주내역 리스트
	l_print.st_print_desc = " 이 프로그램은 수주내역 리스트를 출력합니다." 
	dw_5.dataobject = 'd_orsale_print3'
end if

dw_5.settransobject(sqlca)
ls_dw5sql = dw_5.describe("datawindow.table.select")

//if ist_code.order_flag = 'O' then	// 수주번호
//	ls_where = " and sale.order_no between ~~'" + ist_code.start_no + "~~'" &
//				+ " and ~~'" + ist_code.end_no + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//		
//	dw_5.modify(ls_sql)
//	dw_5.retrieve(	ls_scenehp )
//else											// 수주일자
//	ls_where = " and sale.order_date between ~~'" + ist_code.start_date + "~~'" &
//				+ " and ~~'" + ist_code.end_date + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
//		
//	dw_5.modify(ls_sql)
//	dw_5.retrieve()
//end if


if ist_code.order_flag = 'O' then
// 2017.12.18 조원석	d_orsale_print4 만들고, 데이터윈도우 분리 
// 분리 이유는 알수 없는 like 오류 발생, 쿼리부분 주석처리. 시작
	dw_5.dataobject = 'd_orsale_print2'
	dw_5.settrans( sqlca)
	
	dw_5.retrieve( ls_scenehp, ist_code.start_no,  ist_code.end_no, ist_code.do_flag)
else
	
// 분리 이유는 알수 없는 like 오류 발생, 쿼리부분 주석처리. 끝
	dw_5.dataobject = 'd_orsale_print4'
	dw_5.settrans( sqlca)
	dw_5.retrieve( ls_scenehp, ist_code.start_date,  ist_code.end_date, ist_code.do_flag)
end if

l_print.st_datawindow = dw_5
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleexceed_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 30
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_cancel::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_cancel::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_orderno, ls_custno
long   ll_row

rollback;

pb_cancel.default = false
cb_filteroff.triggerevent(clicked!)

//st_saleamt.text    = "0"
//st_saleamt.visible = false
dw_2.reset()
dw_3.reset()

ls_orderno = TRIM(em_3.TEXT) + '-' + RightA ( '000' + trim(em_4.text), 3)
if isnull(ls_orderno) or ls_orderno = '' then return

/////////////////////////////////////////////////////
// 공무관리담당자는 거래처변경 못함
/////////////////////////////////////////////////////
if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
	SELECT cust_no INTO :ls_custno FROM sale WHERE order_no = :ls_orderno;
	
	if isnull(ls_custno) OR ls_custno = "" OR ls_custno <> is_custconst then RETURN 
end if
/////////////////////////////////////////////////////

SELECT count(*) INTO :ll_row FROM sale WHERE order_no = :ls_orderno;
if ll_row < 1 then
	em_3.SelectText(9, 2)
	em_3.setfocus()
else
	wf_ret(ls_orderno)

	string  ls_start, ls_end
	decimal lr_saleamt
	
	// 당월 수주금액
	ls_start = string(dw_2.object.order_date[1],"yyyy/mm/01")
	SELECT TOP 1 CONVERT(CHAR(10), DATEADD( DAY, -DATEPART(DD,GETDATE()), DATEADD(MONTH,1,GETDATE()) ), 111)
	  INTO :ls_end
	  FROM LOGIN;
	lr_saleamt = wf_saleamt( dw_2.object.cust_no[1], ls_start, ls_end )
//	st_saleamt.text    = string(lr_saleamt, "#,##0")
//	st_saleamt.visible = true

	// YSP 수주건
	if LeftA(dw_2.object.order_no[1],1) = "B" then
		dw_2.object.ysp_qty2.protect = 0
		dw_2.object.ysp_qty2.background.color = rgb(255, 255, 255)
		dw_2.object.ysp_qty.protect  = 0
		dw_2.object.ysp_qty.background.color  = rgb(255, 255, 255)
		dw_2.object.color.protect    = 0
		dw_2.object.color.background.color    = rgb(255, 255, 255)
		dw_2.object.class.protect    = 0
		dw_2.object.class.background.color    = rgb(255, 255, 255)
		dw_2.object.type.protect     = 0
		dw_2.object.type.background.color     = rgb(255, 255, 255)
	else
		dw_2.object.ysp_qty2.protect = 1
		dw_2.object.ysp_qty2.background.color = rgb(192,192,192)
		dw_2.object.ysp_qty.protect  = 1
		dw_2.object.ysp_qty.background.color  = rgb(192,192,192)
		dw_2.object.color.protect    = 1
		dw_2.object.color.background.color    = rgb(192,192,192)
		dw_2.object.class.protect    = 1
		dw_2.object.class.background.color    = rgb(192,192,192)
		dw_2.object.type.protect     = 1
		dw_2.object.type.background.color     = rgb(192,192,192)
	end if
	
	em_4.SelectText(1, 3)
	em_4.setfocus()
end if
end event

type pb_delete from w_inheritance`pb_delete within w_orsaleexceed_m
boolean visible = false
integer x = 4421
integer y = 40
integer width = 178
integer taborder = 270
boolean enabled = false
string picturename = "D:\WORK\BASE_SOURCE\BMP\ArtGal\BMPs\BIGQUEST.BMP"
end type

event pb_delete::clicked;//dwitemstatus l_status
//long   ll_row, ll_count, ll_cnt
//string ls_custno, ls_order_no, ls_esti_no, ls_reqno, ls_chk
//
//if dw_2.rowcount() < 1 then return
//
//dw_2.accepttext()
//dw_3.accepttext()
//
//l_status    = dw_2.getitemstatus(1, 0, primary!)
//ls_custno   = dw_2.object.cust_no[1] 
//ls_esti_no  = trim(dw_2.object.estimate_no[1])
//ls_order_no = dw_2.object.order_no[1] 
//ls_chk      = 'N'
//
//if MessageBox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return
//if wf_confirm('Y') = false then 
//	//messagebox("확인","이미 확정된 수주이므로 삭제할 수 없습니다!",information!)
//	return
//end if
//
//if l_status = newmodified! or l_status = new! then
//	dw_2.reset()
//	dw_3.reset()
//else
//	SELECT COUNT(*) INTO :ll_count FROM saledet WHERE order_no = :ls_order_no AND rlse_qty > 0;
//	IF ll_count > 0 THEN
//		MessageBox("확인","이미 출고된 수주이므로 삭제할 수 없습니다!",information!)
//	else
//		// 주문관리
//		SELECT order_no INTO :ls_reqno FROM saletemp WHERE sale_no = :ls_order_no;
//		if isnull(ls_reqno) or ls_reqno = "" then
//		else
//			// 접수: sale_no = order_no, jupsu_flag = 'Y', jupsu_date = getdate()
//			UPDATE saletemp 
//			   SET sale_no = null, jupsu_flag = null, jupsu_date = null
//			 WHERE sale_no = :ls_order_no;
//			if sqlca.sqlcode <> 0 then
//				rollback;
//				MessageBox("확인","주문상태 변경saletemp 변경중 오류가 발생하였습니다.")
//				return
//			end if
//		end if
//		
//		// 견적서
//		if isnull(ls_esti_no) or trim(ls_esti_no) = "" then
//		else
//			UPDATE estimate_head SET sale_succ = 'N' WHERE estimate_no = :ls_esti_no;
//			if sqlca.sqlcode <> 0 then
//				rollback;
//				MessageBox("삭제","estimate_head UPDATE도중 오류가 발생하였습니다.")
//				return
//			end if
//		end if
//		
//		// 대체물품
//		SELECT count(*) INTO :ll_cnt FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
//		if ll_cnt > 0 then
//			DELETE FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
//			if sqlca.sqlcode <> 0 then
//				rollback;
//				MessageBox("삭제","itemalter삭제도중 오류가 발생하였습니다.")
//				return
//			end if	
//		end if
//		
//		// 수주상세
//		DELETE FROM saledet WHERE order_no = :ls_order_no;
//		if sqlca.sqlcode <> 0 then
//			rollback;
//			MessageBox("삭제","saledet삭제도중 오류가 발생하였습니다.")
//			return
//		end if
//		dw_3.reset()
//		
//		// 수주헤더
//		dw_2.deleterow(1)
//		
//		// 삭제저장
//		if wf_update1(dw_2,'Y') = false then return
//		
//		// 수주목록
//		dw_4.deleterow(dw_4.getrow())
//		dw_4.accepttext()
//		if dw_4.rowcount() > 0 then
//			dw_2.retrieve(dw_4.getitemstring(dw_4.getrow(), "order_no"))
//			dw_3.retrieve(dw_4.getitemstring(dw_4.getrow(), "order_no"))
//		else
//			dw_3.reset()
//		end if		
//	end if
//end if
//
end event

type pb_insert from w_inheritance`pb_insert within w_orsaleexceed_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 178
integer taborder = 250
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;long ll_row

//st_saleamt.text    = "0"
//st_saleamt.visible = false
dw_1.reset()
dw_1.insertrow(0)

dw_4.reset()
dw_2.reset()
dw_3.reset()

//idwc_cust_no.sharedata(idwc_cust)
idwc_scene.insertrow(0) 

dw_2.object.cust_no.protect = 0
dw_2.object.cust_no.background.color = 1087434968
// 사업장
if dw_6.object.area[1] = "B0001" then
	dw_2.object.ysp_qty2.protect = 0
	dw_2.object.ysp_qty2.background.color = rgb(255, 255, 255)
	dw_2.object.ysp_qty.protect  = 0
	dw_2.object.ysp_qty.background.color  = rgb(255, 255, 255)
	dw_2.object.color.protect    = 0
	dw_2.object.color.background.color    = rgb(255, 255, 255)
	dw_2.object.class.protect    = 0
	dw_2.object.class.background.color    = rgb(255, 255, 255)
	dw_2.object.type.protect     = 0
	dw_2.object.type.background.color     = rgb(255, 255, 255)
else
	dw_2.object.ysp_qty2.protect = 1
	dw_2.object.ysp_qty2.background.color = rgb(192,192,192)
	dw_2.object.ysp_qty.protect  = 1
	dw_2.object.ysp_qty.background.color  = rgb(192,192,192)
	dw_2.object.color.protect    = 1
	dw_2.object.color.background.color    = rgb(192,192,192)
	dw_2.object.class.protect    = 1
	dw_2.object.class.background.color    = rgb(192,192,192)
	dw_2.object.type.protect     = 1
	dw_2.object.type.background.color     = rgb(192,192,192)
end if

ll_row = dw_2.insertrow(0)
dw_2.object.order_date[1] = wf_today()
dw_2.object.area_no[1]    = dw_6.object.area[1]
/*2012-09-03(이재형) : 단가변경가능토록 하기 위해 readonly script 제거
dw_3.modify("datawindow.readonly = no")*/
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleexceed_m
integer x = 3154
integer y = 40
integer width = 178
integer taborder = 90
end type

event pb_retrieve::clicked;string ls_custno, ls_sdate, ls_edate, ls_open_close

//////////////////////////////////////////////////////////////////////
//// 공무관리담당자는 거래처변경 못함
//////////////////////////////////////////////////////////////////////
if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
	if dw_1.object.cust_no[dw_1.getrow()] = is_custconst then
		// 공무관리담당자는 거래처변경 못함
	else
		MessageBox("확인2","공무관리담당자는 해당하는 거래처만 선택할 수 있습니다!",exclamation!)
		dw_1.object.cust_no[dw_1.getrow()] = is_custconst 
		return
	end if
end if
//////////////////////////////////////////////////////////////////////


////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================

//st_saleamt.visible = true
cb_filteroff.triggerevent(clicked!)

dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_1.accepttext()

ls_custno  		= trim(dw_1.object.cust_no[1])
if gf_null_chk(ls_custno) then ls_custno = '%'
ls_sdate   		= em_1.text
ls_edate   		= em_2.text
ls_open_close	= RightA(ddlb_gubun.text,1)

dw_4.retrieve( ls_custno, ls_sdate, ls_edate, ls_open_close )
dw_4.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_orsaleexceed_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "사업장"
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleexceed_m
integer y = 204
integer width = 4850
integer height = 172
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleexceed_m
integer x = 3141
integer y = 0
integer width = 1266
integer taborder = 310
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleexceed_m
integer x = 2194
integer y = 396
integer width = 2697
integer height = 1068
integer taborder = 120
string dataobject = "d_orsaleexceed_m"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;//confirm_flag		N: 등록, T: 수주확정, Y: 생산확정
//open_close		O: 등록, C: 마감, X: 취소, Z: 한도초과

if row = 0 then return

choose case dwo.name
	case 'open_close'	
		if data = 'O' then
			this.setitem(row, 'sale_confirm_flag', 'T')
		else
			this.setitem(row, 'sale_confirm_flag', 'N')
		end if
end choose
end event

type gb_6 from groupbox within w_orsaleexceed_m
boolean visible = false
integer width = 50
integer height = 52
integer taborder = 330
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수주번호"
end type

type dw_4 from datawindow within w_orsaleexceed_m
integer x = 32
integer y = 396
integer width = 2112
integer height = 1068
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_ororderexceed_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow = 0 then return

String	ls_cust_no, ls_order_no
Long		ll_ret, ll_rtn
dec		ldc_saleamt

//검색조건
ls_order_no	= this.GetItemString(currentrow, 'order_no')
ls_cust_no	= this.GetItemString(currentrow, 'cust_no')
ll_ret		= dw_2.Retrieve(ls_order_no)		//master

Choose Case ll_ret
	Case is > 0
		dw_3.Retrieve(ls_order_no)					//detail
		dw_7.retrieve(ls_cust_no)					//수주 한도액 리스트
		
		ldc_saleamt	= gf_get_amt_receivable(ls_cust_no, ls_order_no)
		dw_2.object.saleamt[1] = ldc_saleamt
		
	Case 0
		MessageBox("Check", "검색된 자료가 없습니다.")
	Case is < 0
		MessageBox("Error", "Error")
End Choose
end event

event retrieveend;//
// Enter시 수주내용 삭제 예방

dwitemstatus l_status

l_status    = dw_3.getitemstatus(1, 0, primary!)
if l_status = NotModified!	then
	if this.getrow() <= 0 then
		dw_2.reset()
		dw_3.reset()
	end if
end if
end event

event clicked;string ls_col, ls_text

if row < 1 then return
this.scrolltorow(row)

choose case dwo.name
	case "order_no"
		ls_col = "수주번호"
		ls_text = string(this.object.order_no[row])
	case "due_date"
		ls_col = "납기일자"
		ls_text = string(this.object.due_date[row])
	case "scene_name"
		ls_col = "현장명"
		ls_text = string(this.object.scene_name[row])
	case "c_qty"
		ls_col = "미출"
		ls_text = string(this.object.c_qty[row])
end choose		

choose case ls_col
	case "수주번호", "미출"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type dw_6 from datawindow within w_orsaleexceed_m
boolean visible = false
integer width = 50
integer height = 52
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dwitemstatus l_status
string ls_area 

this.accepttext()
// 사업장 선택시

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

l_status = dw_2.getitemstatus(1, 0, primary!)
if l_status = newmodified! or l_status = new! then 
	ls_area = this.object.area[1]
	if dw_2.object.area_no[1] <> ls_area then
		if MessageBox("확인", "수주지역을 사업장으로 변경하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			dw_2.object.area_no[1] = this.object.area[1]
		end if		
	end if
end if

// 사업장
if dw_6.object.area[1] = "B0001" then	// YSP사업장	
	dw_2.object.ysp_qty2.protect = 0
	dw_2.object.ysp_qty2.background.color = rgb(255, 255, 255)
	dw_2.object.ysp_qty.protect  = 0
	dw_2.object.ysp_qty.background.color  = rgb(255, 255, 255)
	dw_2.object.color.protect    = 0
	dw_2.object.color.background.color    = rgb(255, 255, 255)
	dw_2.object.class.protect    = 0
	dw_2.object.class.background.color    = rgb(255, 255, 255)
	dw_2.object.type.protect     = 0
	dw_2.object.type.background.color     = rgb(255, 255, 255)
else												// S0001 //: 시화
	dw_2.object.ysp_qty2.protect = 1
	dw_2.object.ysp_qty2.background.color = rgb(192,192,192)
	dw_2.object.ysp_qty.protect  = 1
	dw_2.object.ysp_qty.background.color  = rgb(192,192,192)
	dw_2.object.color.protect    = 1
	dw_2.object.color.background.color    = rgb(192,192,192)
	dw_2.object.class.protect    = 1
	dw_2.object.class.background.color    = rgb(192,192,192)
	dw_2.object.type.protect     = 1
	dw_2.object.type.background.color     = rgb(192,192,192)
end if

end event

type em_3 from editmask within w_orsaleexceed_m
event keydown pbm_dwnkey
boolean visible = false
integer width = 50
integer height = 52
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
boolean autoskip = true
end type

event keydown;IF keydown(KeyEnter! ) THEN
	IF keyflags = 0 THEN
		pb_cancel.postevent(clicked!)
	END IF
END IF



end event

event modified;//
pb_cancel.default = true

end event

type em_2 from editmask within w_orsaleexceed_m
integer x = 1851
integer y = 32
integer width = 379
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

event modified;//
pb_retrieve.default = true

end event

type em_1 from editmask within w_orsaleexceed_m
integer x = 1321
integer y = 32
integer width = 379
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
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

event modified;//
pb_retrieve.default = true

end event

type em_4 from editmask within w_orsaleexceed_m
boolean visible = false
integer width = 50
integer height = 52
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "1"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
string minmax = "1~~999"
end type

event getfocus;//
pb_cancel.default = true
this.SelectText(1, 3)


end event

event modified;pb_cancel.default = true
end event

event losefocus;// 수주장 2번 저장의 경우 발생함
// pb_cancel.default = true

end event

type st_2 from statictext within w_orsaleexceed_m
boolean visible = false
integer width = 50
integer height = 52
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "-"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_orsaleexceed_m
event keydown pbm_dwnkey
integer x = 23
integer y = 1484
integer width = 4855
integer height = 1032
string dataobject = "d_orsaleexceed_d"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keydown;//dwitemstatus l_status
//long ll_row
//
//ll_row = this.getrow()
//if ll_row < 1 then return
//
//l_status = dw_3.getitemstatus(ll_row, 0, primary!)
//if l_status = new! or l_status = newmodified! then 
//else
//	return
//end if
//
//if keydown(KeyEnter!) then
//	if keyflags = 0 then
//		choose case this.getcolumnname() 
//			case "price" ,"order_qty"
//				if ll_row = this.rowcount() then
//					end if
//		end choose
//	end if
//elseif keydown(KeyControl!) and keydown(KeyZ!) then
//	choose case this.getcolumnname() 
//		case "item_no"
//			if this.rowcount() > 1 then
//				this.object.item_no[ll_row ] = this.object.item_no[ll_row -1]
//				this.object.item_item_name[ll_row] = this.object.item_item_name[ll_row -1]
//				this.object.color[ll_row]    = this.object.color[ll_row -1]
//			end if
//		case "qa"
//			if this.rowcount() > 1 then
//				this.object.qa[ll_row ]  = this.object.qa[ll_row -1]
//				this.object.uom[ll_row ] = this.object.uom[ll_row -1]
//			end if
//		case "order_qty"
//			if this.rowcount() > 1 then
//				this.object.order_qty[ll_row ] = this.object.order_qty[ll_row -1]
//			end if
//		case "rem"
//			if this.rowcount() > 1 then
//				this.object.rem[ll_row ]  = this.object.rem[ll_row -1]
//			end if
//	end choose
//end if
//
//// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
//IF keyflags = 2 THEN
//	IF key = KeyS! THEN
//		if MessageBox("확인", "수주내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
//			pb_save.triggerevent(clicked!)
//		end if
//	END IF
//END IF
//
//return 0
//
end event

event itemchanged;//string  ls_where, ls_sql, ls_item_no, ls_qa, ls_com_qa, ls_item_name, ls_data, ls_color
//string  ls_uom, ls_cust_no, ls_scene_no, ls_null
//long    ll_row, ll_lenth, ll_x, ll_y, ll_row1, ll_found , ll_cnt
//decimal lr_order_qty, lr_acc_qty, lr_price, lr_price_a 
//datawindowchild ldwc_color
//
//this.accepttext()
//dw_2.accepttext()
//setnull(ls_null)
//ll_row     = this.getrow()
//ls_item_no = this.GetItemString(ll_row, "item_no")
//ls_qa      = this.GetItemString(ll_row, "qa")
//
//choose case dwo.name
//   case "color"
//      ls_color = trim(data)
//      SELECT count(*) INTO :ll_found FROM color WHERE color_code = :ls_color;
//      if ll_found < 1 or sqlca.sqlcode = 100  then
//         gs_where lst_code
//         lst_code.str1 = ls_color
//         lst_code.name = ls_color
//         openwithparm(w_whcolor_m, lst_code)
//         lst_code = message.powerobjectparm
//         if lst_code.chk = "N" then return
//			
//         this.object.color[ll_row] = lst_code.str1
//         this.getchild("color", ldwc_color)
//         ldwc_color.retrieve()
//      end if
//      return 1
//
//   case "item_no"
//      this.object.qa[ll_row]           = ls_null
//      this.object.uom[ll_row]          = ls_null
//      this.object.order_qty[ll_row]    = 0
//      this.object.acc_qty[ll_row]      = 0
//      this.object.price[ll_row]        = 0 
//      this.object.item_price_a[ll_row] = 0
//      this.object.rem[ll_row]          = ls_null
//      this.object.color[ll_row]        = ls_null
//      
//      ls_data = data
//      SELECT count(*) INTO :ll_cnt  FROM groupitem  WHERE item_no = :ls_data  AND use_flag = 'C';
//      if ll_cnt > 0 then
//         is_flag = '1'
//         messagebox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
//                  + "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
//         return 1
//      end if
//      ll_row1  = idwc_item.RowCount( )
//      ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
//      
//      if ll_found = 0 then
//         is_flag = '1'
//         messagebox("확인","위와 같은 품목은 존재하지 않습니다!~r~n" &
//                  + "물품RELOAD를 하십시요.!",exclamation!)
//         if is_import_chk = "X" then  // excel import (O) 물품코드 오류시 그냥 넘어감
//            return 1
//         end if
//      end if
//      
//      // 1999/09/02 추가 <탁>
//      SELECT item_name INTO :ls_item_name FROM groupitem WHERE item_no = :ls_data  AND use_flag = 'Y';
//      if sqlca.sqlcode = 100 then 
//        if is_import_chk = 'X' then  // excel import (O) 물품코드 오류시 그냥 넘어감
//           return 1
//        end if
//      end if
//      this.object.item_item_name[ll_row] = ls_item_name
//      
//      if ls_item_no <> "" then
//         SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_item_no  AND use_flag = 'Y';
//         if ll_cnt > 0 then
//            idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//            idwc_qa.filter()
//         end if
//         if ll_cnt > 0 and idwc_qa.rowcount() > 0 then
//            this.setcolumn("qa")
//            this.setfocus()
//         else
//            this.setcolumn("item_no")
//            this.setfocus()
//         end if
//      end if
//      this.object.color[ll_row] = wf_color(this.object.item_no[ll_row])
//      
//   case "qa"      
//      ls_data = data
//		if len(trim(ls_data)) > 10 then
//			string ls_val1, ls_val2, ls_val3, ls_data1, ls_data2, ls_data3, ls_data4
//			//000X0820X2150X00000 
//			//1234567890123456789 
//			//         1
//			ls_data1 = Mid(ls_data,  1, 3)
//			ls_data2 = Mid(ls_data,  5, 4)
//			ls_data3 = Mid(ls_data, 10, 4)
//			ls_data4 = Mid(ls_data, 15, 5)
//
//			ls_val1  = Mid(ls_data,  4, 1)
//			ls_val2  = Mid(ls_data,  9, 1)
//			ls_val3  = Mid(ls_data, 14, 1)
//
//			if ls_val1 = "X" and ls_val2 = "X" and ls_val3 = "X" then
//				// 4, 9, 14 => 'X' 정상포맷
//				if left(this.object.item_no[row],1) = "P" and IsNumber(ls_data1) and IsNumber(ls_data2) and IsNumber(ls_data3) then
//					// 정상규격
//				else
//					if left(this.object.item_no[row],1) = "P" then
//						MessageBox("확인1","제품에는 이 규격 룰이 적용될 수 없습니다.[" + ls_data + "] 확인 바랍니다.",Exclamation!)
//						return 1
//					end if
//				end if
//			else
//				if left(this.object.item_no[row],1) = "P" then
//					MessageBox("확인2","제품에는 이 규격 룰이 적용될 수 없습니다.[" + ls_data + "] 확인 바랍니다.",Exclamation!)
//					return 1
//				end if
//			end if
//		end if
//		
//      SELECT count(*) INTO :ll_cnt FROM item
//       WHERE item_no = :ls_item_no  AND qa = :ls_data  AND use_flag = 'C';
//      if ll_cnt > 0 then
//         is_flag = '2'
//         MessageBox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
//                  + "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
//         return 1
//      end if
//		
//      ll_row1  = idwc_qa.RowCount( )
//      ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)      
//      if ll_found = 0 then
//         is_flag = '2'
//         if MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
//                     + "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 then
//            if GF_ITEMINSERT(ls_item_no, ls_data) = false then return 1
//            idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//            idwc_qa.filter()
//         else
//            if is_import_chk = 'X' then  // excel import (O) 물품코드 오류시 그냥 넘어감
//               return 1
//            end if
//         end if
//      end if
//      
//		// 단위
//      ls_uom = trim(idwc_qa.GetItemString(idwc_qa.getrow(), "uom")) 
//      this.object.uom[ll_row] = ls_uom
//      this.setcolumn("order_qty")
//      this.setfocus()
//		
//      // 표준단가
//      lr_price_a = 0
//      SELECT price_a INTO :lr_price_a  FROM item  WHERE item_no = :ls_item_no  AND qa = :ls_qa;
//         
//      this.object.item_price_a[ll_row] = lr_price_a   
//      lr_order_qty = this.getitemdecimal(ll_row, "order_qty")   
//		choose case ls_uom
//			case "M2", "SS"	// 단위가 평방미터인 제품의 환산수량, "SS" <= 단위는 Sheet이나 계산을 평방미터로 환산
//				ll_x       = long(mid(ls_qa,  5, 4))
//				ll_y       = long(mid(ls_qa, 10, 4))
//				lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001, 2)   
//				ls_com_qa  = left(ls_qa, 3)
//				this.object.acc_qty[ll_row] = lr_acc_qty
//				
//			case "M"				// 단위가 미터인 제품의 환산수량
//				ll_lenth   = long(mid(ls_qa, 15, 5))
//				lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
//				this.object.acc_qty[ll_row] = lr_acc_qty
//				ls_com_qa  = left(ls_qa, 13)
//				
//			case else			// 길이가 없는 제품의 환산수량
//				lr_acc_qty = lr_order_qty
//				this.object.acc_qty[ll_row] = lr_acc_qty 
//				ls_com_qa  = ls_qa
//		end choose
//            
//      // 단가검색
//      ls_scene_no = dw_2.GetItemString(1, "scene_code")
//      ls_cust_no  = dw_2.GetItemString(1, "cust_no")
//		// d_wfprice (현장->거래처->표준)
//		/*
//		 SELECT CONVERT(CHAR(1), '1') seq, price   FROM custscene
//		  WHERE cust_no = :as_cust_no	 AND scene_code = :as_scene_no
//			 AND item_no = :as_item_no	 AND qa = :as_com_qa
//						
//		 UNION		
//		 SELECT CONVERT(CHAR(1), '2') seq, price 	  FROM custitem
//		  WHERE cust_no = :as_cust_no  AND item_no = :as_item_no	 AND qa = :as_com_qa
//							
//		 UNION			
//		 SELECT CONVERT(CHAR(1), '3') seq, price_a  FROM item
//		  WHERE item_no = :as_item_no  AND qa = :as_com_qa1
//		*/
//      lr_price    = gf_custprice(ls_scene_no, ls_cust_no, ls_com_qa, ls_item_no, ls_qa)   
//      this.object.price[ll_row]    = lr_price
//      this.object.price_be[ll_row] = lr_price
//
//      string  ls_q_seq, ls_price_date
//      decimal ldc_q_price
//      ls_q_seq    = ""
//      ldc_q_price = 0      
//
//      // BOLT(전산도금12M/M), BOLT(전산도금16M/M), BOLT(전산도금)
//      IF ls_uom = "M" AND NOT(ls_item_no = "GAZSB12B00" OR ls_item_no = "GAZSB16B00" OR ls_item_no = "GAZSBJDB00") THEN
//         SELECT TOP 1 seq, price, cdate  INTO :ls_q_seq, :ldc_q_price, :ls_price_date
//           FROM (      
//                SELECT seq, price, cdate 
//                  FROM (
//                       SELECT TOP 1 convert(char(1), '1') seq, b.price, convert(char(10),a.do_date,111) AS cdate
//                         FROM do   a, dodet   b
//                        WHERE a.do_no       = b.do_no
//                          AND a.cust_no     = :ls_cust_no
//                          AND a.spot_code   = :ls_scene_no
//                          AND b.item_no     = :ls_item_no
//                          AND left(b.qa,13) = left(:ls_qa,13)
//                        ORDER BY cdate DESC
//                       ) tb_do_scene      
//                UNION
//                
//                SELECT seq, price, cdate
//                  FROM (
//                       SELECT top 1 convert(char(1), '2') seq, b.price, convert(char(10),a.do_date,111) AS cdate
//                         FROM do   a,      dodet   b
//                        WHERE a.do_no       = b.do_no
//                          AND a.cust_no     = :ls_cust_no
//                          AND b.item_no     = :ls_item_no
//                          AND left(b.qa,13) = left(:ls_qa,13)                       
//                        ORDER BY cdate DESC          
//                       ) TB_DO_CUST                  
//                ) TB_TOTAL                           
//          ORDER BY seq;                              
//      ELSE                                           
//         SELECT TOP 1 seq, price, cdate  INTO :ls_q_seq, :ldc_q_price, :ls_price_date
//           FROM (      
//                SELECT seq, price, cdate 
//                  FROM (
//                       SELECT TOP 1 convert(char(1), '1') seq, b.price, convert(char(10),a.do_date,111) AS cdate
//                         FROM do   a, dodet   b
//                        WHERE a.do_no     = b.do_no
//                          AND a.cust_no   = :ls_cust_no
//                          AND a.spot_code = :ls_scene_no
//                          AND b.item_no   = :ls_item_no
//                          AND b.qa        = :ls_qa
//                        ORDER BY cdate DESC
//                       ) tb_do_scene      
//                UNION
//            
//                SELECT seq, price, cdate
//                  FROM (
//                       SELECT TOP 1 convert(char(1), '2') seq, b.price, convert(char(10),a.do_date,111) AS cdate
//                         FROM do   a,      dodet   b
//                        WHERE a.do_no     = b.do_no
//                          AND a.cust_no   = :ls_cust_no
//                          AND b.item_no   = :ls_item_no
//                          AND b.qa        = :ls_qa
//                        ORDER BY cdate DESC
//                       ) tb_do_cust
//                ) tb_total
//          ORDER BY seq;
//      END IF
//      
//      if ldc_q_price > 0 then
//			string ls_fixed_date		// 단가변경 적용일
//			SELECT isnull(ITEM_NM,'') INTO :ls_fixed_date FROM CODEMST 
//			 WHERE ITEM_CD = 'PRICE_RAISING' AND USE_YN = 'Y';
//			 
//   		if IsDate(ls_fixed_date) And ls_price_date >= ls_fixed_date then
//            this.Object.price[ll_row]      = ldc_q_price   // 주문단가
//            this.Object.price_be[ll_row]   = ldc_q_price   // 기존단가
//            this.Object.price_last[ll_row] = ldc_q_price   // 최근단가
//            this.Object.price_date[ll_row] = ls_price_date // 검색일자
//   	   else
//            this.Object.price[ll_row]      = lr_price      // 주문단가
//            this.Object.price_be[ll_row]   = ldc_q_price   // 기존단가
//            this.Object.price_last[ll_row] = ldc_q_price   // 최근단가
//            this.Object.price_date[ll_row] = ls_price_date // 인상일자
//    	   end if
//      else
//         this.object.price_last[ll_row] = 0
//      end if
//      
//   case "uom"
//      ls_uom       = data
//      lr_order_qty = this.getitemdecimal(ll_row, "order_qty")   
//      // update 1999/08/06, uom = "SS" <= 단위는 SHEET이나 계산을 평방미터로 환산하는 단위
//      if ls_uom = "M2" OR ls_uom = "SS" then 		// 단위가 평방미터인 제품의 환산수량
//         ll_x       = long(mid(ls_qa,  5, 4))
//         ll_y       = long(mid(ls_qa, 10, 4))
//         lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001, 2)   
//         this.object.acc_qty[ll_row] = lr_acc_qty
//      elseif ls_uom = "M" then 							// 단위가 미터인 제품의 환산수량
//         ll_lenth   = long(mid(ls_qa, 15, 5))
//         lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
//         this.object.acc_qty[ll_row] = lr_acc_qty
//      else
//         lr_acc_qty = lr_order_qty
//         this.object.acc_qty[ll_row] = lr_acc_qty // 길이가 없는 제품의 환산수량
//      end if
//
//   case "order_qty"
//	// if isnull(data) then return 1
//      lr_order_qty = this.getitemdecimal(ll_row, "order_qty")   
//      ls_uom       = trim(this.GetItemString(ll_row, "uom"))
//            
//      if ls_uom = "M2" OR ls_uom = "SS" then
//         ll_x       = long(mid(ls_qa, 5, 4))
//         ll_y       = long(mid(ls_qa, 10, 4))
//         lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001 , 2)   
//         this.object.acc_qty[ll_row] = lr_acc_qty
//      elseif ls_uom = "M" then
//         ll_lenth   = long(mid(ls_qa, 15, 5))
//         lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
//         this.object.acc_qty[ll_row] = lr_acc_qty
//      else
//         lr_acc_qty = lr_order_qty
//         this.object.acc_qty[ll_row] = lr_acc_qty 		//길이가 없는 제품의 환산수량
//      end if
//      
//      //Y.S.P A/B/D/C TYPE 인 경우 환산수량
//      if left(ls_item_no, 5) = "PCYSZ" then 
//         this.object.acc_qty[ll_row] = lr_order_qty
//         this.object.sol_qty[ll_row] = lr_order_qty
//      end if
//
//		// 단중, 중량
//      string  lsr_gbn
//      decimal ldc_width, ldc_rate, ldc_heft
//      real    ll_dan,    ll_jung
//		
//      ls_item_no = this.object.item_no[row]
//      ls_qa      = this.object.qa[row]
//      ls_uom     = this.object.uom[row]
//      if ls_uom = "M" then
//			// 생산관리 - 품목별 코일규격관리에서 등록함
//         SELECT TOP 1 gbn = substring(itemcoil.coil_item,3,1), itemcoil.width
//           INTO :lsr_gbn, :ldc_width
//           FROM itemcoil
//          WHERE item_no = :ls_item_no AND qa = left(:ls_qa, 13);
//
//         SELECT TOP 1 (case when :lsr_gbn = 'a' then al_rate
//                            when :lsr_gbn = 's' then st_rate
//                            else ''
//                       end)
//           INTO :ldc_rate
//           FROM globals;
//			  
//         ll_dan  = long(left(ls_qa,3)) * 0.01 * ldc_width * long(right(trim(ls_qa),5)) * ldc_rate
//         ll_jung = long(left(ls_qa,3)) * 0.01 * ldc_width * long(right(trim(ls_qa),5)) * ldc_rate * long(data)
//         this.object.danjung[row]  = truncate(ll_dan  * 0.000001 + 0.0000001, 2)
//         this.object.jungrang[row] = truncate(ll_jung * 0.000001 + 0.0000001, 2)
//
////			if ldc_width = 0 then // ITEMCOIL에 없으면
////				// 물품코드관리-단위당 중량 설정한 item
////				SELECT TOP 1 heft INTO :ldc_heft
////				  FROM ITEM
////				 WHERE ITEM_NO = :ls_item_no AND QA = :ls_qa AND UOM = :ls_uom;
////
////				ll_dan  = long(left(ls_qa,3)) * 0.01 * ldc_width * long(right(trim(ls_qa),5)) * ldc_rate
////				ll_jung = long(left(ls_qa,3)) * 0.01 * ldc_width * long(right(trim(ls_qa),5)) * ldc_rate * long(data)
////				this.object.danjung[row]  = truncate(ll_dan  * 0.000001 + 0.0000001, 2)
////				this.object.jungrang[row] = truncate(ll_jung * 0.000001 + 0.0000001, 2)
////			end if			 
//		end if      
//      wf_calc()
//		
//   case "price"
//   // if isnull(data) then return 1
//      wf_calc()
//		
//   case "stock_qty"
//      if isnull(data) then return 1
//      if this.getitemdecimal(ll_row, "stock_qty") > this.getitemdecimal(ll_row, "order_qty") then
//         messagebox("확인", "주문수량보다 클수 없습니다.")
//         return 1
//      end if
//end choose
//
end event

event editchanged;//dwitemstatus l_status
//
//l_status = dw_3.getitemstatus(row, 0, primary!)
//if l_status = new! or l_status = newmodified! then 
//else
//	return
//end if
//
//choose case dwo.name
//	case 'order_qty', 'price', 'uom'
//		 this.accepttext()
//end choose
//
//RETURN 0
end event

event itemerror;//string ls_null
//
//setnull(ls_null)
//choose case dwo.name
//	case 'stock_qty'
//		this.object.stock_qty[row] = 0
//		
//	case 'color'
//		this.object.color[row] = upper(data)
//		
//	case else
//		if is_flag = '1' then
//			this.object.item_no[row] = ls_null
//		else
//			this.object.qa[row] = ls_null
//		end if
//end choose
//
//return 2
//
end event

event rbuttondown;//string ls_color, ls_item, ls_qa, ls_loc, ls_area
//dec    ld_rlse_qty
//gs_where lst_code
//
//this.accepttext()
//if row < 1 then return
//dwitemstatus l_status
//
//l_status = dw_3.getitemstatus(row, 0, primary!)
//if l_status = new! or l_status = newmodified! then 
//else
//	return
//end if
//
//this.scrolltorow(row)
//ls_item = this.object.item_no[row]
//ls_qa = this.object.qa[row]
//ld_rlse_qty = this.object.rlse_qty[row]
//
//choose case dwo.name
//	case 'color'
//		if right( ls_item, 1) <> 'Z' or  ld_rlse_qty > 0 then 
//		else
//			openwithparm(w_whcolor_m, lst_code)
//			lst_code = message.powerobjectparm
//			if lst_code.chk = "N" then return
//			this.getchild("color", idwc_color)
//			idwc_color.SetTransObject(sqlca)
//			this.object.color[row] = lst_code.str1
//		end if
//end choose
//
end event

event getfocus;////pb_1.default = true	// 행추가
////st_4.visible = false
//
////
//// Enter시 수주내용 삭제 예방
//
//pb_cancel.default =  false
//
end event

event losefocus;////
//dwitemstatus l_status
//
//this.accepttext()
//
//l_status    = this.getitemstatus(1, 0, primary!)
//if l_status = NotModified!	then
//else
//	if dw_3.rowcount() > 3 then
//		if MessageBox("확인","3가지 이상 품목을 작업중입니다. 저장후 작업하시기 바랍니다.",Exclamation!, YesNo!, 2) = 1 then
//			pb_save.triggerevent( clicked! )
//		else
//			return 0
//		end if
//	end if
//end if
//
//
end event

event clicked;//if row < 1 then return
//this.scrolltorow(row)
//
//string ls_item_no
//choose case dwo.name
//	case 'qa'
//		ls_item_no = this.object.item_no[row]
//		if ls_item_no = '' or isnull(ls_item_no) then	return
//		
//		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//		idwc_qa.filter()
//		
//	case 'color'
//		if right(this.object.item_no[row], 1) = 'Z' then
//			this.getchild("color", idwc_color)
//			
//			idwc_color.setfilter("left(color_code,1) = 'Z' " &
//						+ "or (color_code not in ('0000','1000','3000','4000','B000','F000','G000','I000'," &
//						+ "'K000','L000','R000','S000','W000') )")
//			idwc_color.filter()
//		end if
//	case else
//end choose
//
//
//
end event

event itemfocuschanged;////// DataWinodw AutoSelection = true 대체
////
//int li_amtunit
//decimal ld_price
//
//ld_price = this.object.price[row]
//choose case dwo.name
//	case "price"
//		choose case ld_price
//			case 1 to 999
//				li_amtunit = 0
//			case 1000 to 9999
//				li_amtunit = 1
//			case 10000 to 99999
//				li_amtunit = 2
//			case 100000 to 999999
//				li_amtunit = 3
//			case 1000000 to 9999999
//				li_amtunit = 4
//		end choose
//
//		this.SelectText( 1, len(GetText()) + li_amtunit )		// 금액전체 선택
//end choose
end event

type cb_1 from commandbutton within w_orsaleexceed_m
boolean visible = false
integer width = 82
integer height = 48
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;em_4.text = string(integer(em_4.text) + 1)
pb_cancel.postevent(clicked!)
end event

type cb_2 from commandbutton within w_orsaleexceed_m
boolean visible = false
integer width = 82
integer height = 48
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;em_4.text = string(integer(em_4.text) - 1)
if em_4.text < '1' then 
	em_4.text = '1'
	return
end if

pb_cancel.postevent(clicked!)
end event

type dw_5 from datawindow within w_orsaleexceed_m
boolean visible = false
integer width = 50
integer height = 52
integer taborder = 300
boolean bringtotop = true
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type pb_4 from picturebutton within w_orsaleexceed_m
boolean visible = false
integer width = 50
integer height = 52
integer taborder = 320
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "매출/  수금내역"
boolean originalsize = true
alignment htextalign = left!
vtextalign vtextalign = multiline!
end type

event clicked;gs_where        lstr_where
string ls_cust_no, ls_cust_name

ls_cust_no   = dw_2.object.cust_no[1]
ls_cust_name = dw_2.object.customer_cust_name[1]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
openwithparm(w_whopeom_w, lstr_where)

end event

type cb_4 from commandbutton within w_orsaleexceed_m
integer x = 2190
integer y = 268
integer width = 178
integer height = 68
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
String ls_col
choose case trim(ddlb_col.text)
	case "수주번호"
		ls_col = "order_no"
	case "납기일자"
		ls_col = "due_date"
	case "현장명"
		ls_col = "scene_name"
	case "미출"
		ls_col = "c_qty"
end choose		

dw_4.SetSort(ls_col + " D")
dw_4.sort()

end event

type cb_7 from commandbutton within w_orsaleexceed_m
integer x = 2007
integer y = 268
integer width = 178
integer height = 68
integer taborder = 170
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
String ls_col
choose case trim(ddlb_col.text)
	case "수주번호"
		ls_col = "order_no"
	case "납기일자"

		ls_col = "due_date"
	case "현장명"
		ls_col = "scene_name"
	case "미출"
		ls_col = "c_qty"
end choose		

dw_4.SetSort(ls_col + " A")
dw_4.sort()

end event

type cb_filteroff from commandbutton within w_orsaleexceed_m
integer x = 1819
integer y = 268
integer width = 178
integer height = 68
integer taborder = 180
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "현장명"
sle_value.text  = ""

dw_4.setfilter("")
dw_4.filter()

end event

type cb_filteron from commandbutton within w_orsaleexceed_m
integer x = 1637
integer y = 268
integer width = 178
integer height = 68
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_4.FilteredCount() > 0 THEN
	dw_4.setfilter(ls_temp)
	dw_4.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "수주번호"
			ls_col = "order_no "
		case "납기일자"
			ls_col = "due_date "
		case "현장명"
			ls_col = "scene_name "
		case "미출"
			ls_col = "c_qty"
	end choose		
	
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "due_date1 " then
			ls_column = ls_col + trim(ddlb_2.text) + " #"  + trim(sle_value.text) + "# "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '"  + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_4.setfilter(ls_temp)
dw_4.filter()

dw_4.scrolltorow(1)
dw_4.triggerevent(rowfocuschanged!)

end event

event getfocus;//

end event

type sle_value from singlelineedit within w_orsaleexceed_m
integer x = 1125
integer y = 264
integer width = 498
integer height = 76
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_2 from dropdownlistbox within w_orsaleexceed_m
integer x = 832
integer y = 260
integer width = 279
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_9 from statictext within w_orsaleexceed_m
integer x = 649
integer y = 280
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_col from dropdownlistbox within w_orsaleexceed_m
integer x = 233
integer y = 260
integer width = 402
integer height = 532
integer taborder = 210
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
string item[] = {"수주번호","납기일자","현장명","미출"}
end type

type st_8 from statictext within w_orsaleexceed_m
integer x = 50
integer y = 280
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

type pb_7 from picturebutton within w_orsaleexceed_m
boolean visible = false
integer width = 50
integer height = 52
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "고객센터 문의"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;long   ll_cnt
string ls_custno, ls_sceneno, ls_salesman, ls_scenenm, ls_orderno

if dw_2.getrow() < 1 then return
if MessageBox("고객센터", "수주내용을 고객센터에 문의 하시겠습니까?~n~n" + &
              "문의시에는 처리담당자를 반드시 지정해야 합니다.", Exclamation!, OKCancel!, 2) = 2 then
	return
end if

ls_custno  = dw_2.object.cust_no[1]
ls_sceneno = trim(dw_2.object.scene_code[dw_2.getrow()])
ls_salesman= trim(dw_2.object.salesman[dw_2.getrow()])
ls_orderno = dw_2.object.order_no[1]

//// 동일한 수주번호에 대하여 동일한 작성자가 하나 이상은 안됨.
SELECT COUNT(*) INTO :ll_cnt FROM ProjectMSG 
 WHERE ORDER_NO = :ls_orderno AND FLOGIN = :gs_userid AND del <> 'Y';
if ll_cnt > 0 then
	if MessageBox("고객센터", "동일한 수주번호의 고객센터 문의사항이 존재합니다.~n~n계속 추가 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		return
	end if
end if

INSERT INTO PROJECTMSG (cust_no,scene_code,salesman,order_no,cat,status,item_no,flogin,msgdate,msg,sms,del)
VALUES (:ls_custno, :ls_sceneno, :ls_salesman, :ls_orderno, '1', '1', '', :gs_userid, getdate(), '','Y','N');
if sqlca.sqldbcode <> 0 then
	MessageBox('고객센터','고객센터 저장중 오류가 발생했습니다. 재시도 해주세요.',Exclamation!)
	rollback;
	return
end if	
COMMIT;

// 메신저
gs_custper_str lstr_where
lstr_where.str_ok = true
OpenWithParm(w_projectmsg,lstr_where)

w_projectmsg.setredraw(false)
w_projectmsg.dw_2.retrieve('%')
w_projectmsg.dw_3.scrolltorow( 1 )
w_projectmsg.dw_3.triggerevent(clicked!)
w_projectmsg.setredraw(true)

end event

type st_1 from statictext within w_orsaleexceed_m
integer x = 1042
integer y = 48
integer width = 265
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "수주일자"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_orsaleexceed_m
integer x = 1042
integer y = 132
integer width = 265
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_orsaleexceed_m
integer x = 2158
integer y = 392
integer height = 984
boolean bringtotop = true
end type

type st_vertical1 from u_splitbar_vertical within w_orsaleexceed_m
integer x = 4905
integer y = 392
integer height = 984
boolean bringtotop = true
end type

type dw_7 from datawindow within w_orsaleexceed_m
integer x = 4937
integer y = 396
integer width = 686
integer height = 1068
integer taborder = 150
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsalelimitexceed_02"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_orsaleexceed_m
integer x = 4430
integer y = 28
integer width = 2766
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "※미수금액기준:외상매출금+거래처별 미 출고 현황(-60 ~~ +30)+어음잔액 + 수주금액 "
boolean focusrectangle = false
end type

type st_4 from statictext within w_orsaleexceed_m
integer x = 4430
integer y = 88
integer width = 2309
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "1)한도초과된 거래처의 수주는 한도초과 체크 해제를 통해 수주 승인."
boolean focusrectangle = false
end type

type st_5 from statictext within w_orsaleexceed_m
integer x = 4430
integer y = 164
integer width = 4352
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "2)거래처한도변경방법 ①판매거래처관리에서 한도금액 수정 ②기간별로 금액 설정 반영.기간 종료시 다시 ①번 한도금액이 기준."
boolean focusrectangle = false
end type

type st_7 from statictext within w_orsaleexceed_m
integer x = 1723
integer y = 44
integer width = 110
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_orsaleexceed_m
integer x = 1015
integer width = 1792
integer height = 204
integer taborder = 350
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type dw_8 from datawindow within w_orsaleexceed_m
boolean visible = false
integer width = 50
integer height = 52
string title = "엑셀데이터(품목,규격,수량,비고)"
string dataobject = "d_orsaledet_error_r"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type st_10 from statictext within w_orsaleexceed_m
integer x = 2263
integer y = 48
integer width = 210
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "구분"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_gubun from dropdownlistbox within w_orsaleexceed_m
integer x = 2496
integer y = 32
integer width = 274
integer height = 324
integer taborder = 290
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string item[] = {"전체     %","초과     Z","정상     O"}
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_orsaleexceed_m
integer x = 3607
integer y = 40
integer width = 256
integer height = 144
integer taborder = 290
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string text = "확정취소"
end type

event clicked;string	ls_temp, ls_order_no, ls_conf, ls_itemno, ls_costyn, ls_recipient, ls_sender, ls_salesman
long		ll_grow, ll_row
int		li_cnt,  li_revision
datetime ldt_null 
string	ls_open_close

setnull(ldt_null)
ll_grow = dw_4.getrow()
if ll_grow = 0 then return

ls_order_no	= dw_4.getitemstring(ll_grow, 'order_no')
if gf_null_chk(ls_order_no) then
	messagebox("주의","수주 번호를 선택하세요.")
	return
end if

select
	open_close
into
	:ls_open_close
from
	sale
where
	order_no = :ls_order_no
using sqlca;	

if ls_open_close <> 'Z' then
	ls_temp		= "상태가 한도초과건만~r~n취소를 할수 있습니다."
	MessageBox("확인",ls_temp)
	return
end if

ls_temp		= "수주번호 : " + ls_order_no + "를 확정 취소를 하시겠습니까?"
if MessageBox("확인",ls_temp,question!,okcancel!,1) = 2 then RETURN

//if LEFT(ls_order_no,1) = 'B' THEN		// YSP 수주
//	SELECT 
//		ysp_confirm 
//	INTO 
//		:ls_conf	
//	FROM 
//		sale 
//	WHERE 
//		order_no = :ls_order_no
//	using sqlca;
//	
//	if ls_conf = 'Y' then
//		MessageBox("확인","이 주문은 YSP수주접수가 완료된 주문입니다. ~r~n" &
//								+ "생산관리자 협의하시기바랍니다.")
//		return
//	end if
//end if
//
//생산중인 물품이 존재하는 수주인지 확인
//li_cnt = 0
//SELECT 
//	count(*) 
//INTO 
//	:li_cnt 
//FROM 
//	mps, mpsdet  
//WHERE 
//	mps.order_no   = mpsdet.order_no
//and 
//	mpsdet.sale_no = :ls_order_no 
//and 
//	mps.open_close = 'P'
//using sqlca;
//
//if li_cnt > 0 then
//	MessageBox("확인","이 주문은 작업지시가 내려진 수주입니다.~r~n생산관리자 협의하시기 바랍니다.")
//	return
//else
//	li_cnt = 0
//	SELECT 
//		count(*) 
//	INTO 
//		:li_cnt
//	FROM 
//		routtempnew 
//	WHERE 
//		sale_no = :ls_order_no 
//	and 
//		process_flag <>'C'
//	using sqlca;
//	
//	IF li_cnt > 0 then
//		MessageBox("확인","이미 생산계획조정에 자료가 있습니다. 생산관리자와 협의하십시요.", exclamation!)
//		return
//	end if
//end if
//
//
//for ll_row = 1 to dw_3.rowcount() 
//	if dw_3.object.saledet_plan_qty[ll_row] > 0 then
//		MessageBox("확인","이미 생산중인 물품이 있는 수주입니다!",information!)
//		return
//	end if
//
//	if dw_3.object.rlse_qty[ll_row] > 0 then
//		MessageBox("확인","이미 출고된 물품이 있는 수주입니다!",information!)
//		return
//	end if
//next
//
//// 가공비 & 타공비 수주확정 취소시
//for ll_row = 1 to dw_3.rowcount()
//	dw_3.object.plan_close[ll_row] = ldt_null		// 수주상황부의 생산완료시점
//	dw_3.setitem(ll_row, "saledet_text", "N")
//	ls_itemno = dw_3.object.item_no[ll_row]
//	SELECT cost_yn INTO :ls_costyn FROM groupitem WHERE item_no = :ls_itemno;
//
//	choose case ls_costyn
//		case "Y"		// 가공비, 타공비 일 경우 가용수량 CLEAR함
//			dw_3.setitem(ll_row, "sol_qty", 0)
//	end choose
//next
//초기화
dw_2.object.sale_confirm_flag[1] = 'N'
dw_2.setitem(1, 'open_close', 'O')
dw_2.setitem(1, 'orexceed_gb', 'O')
dw_2.setitem(1, 'orexceed_confirm_user', '')
dw_2.setitem(1, 'orexceed_confirm_date', ldt_null)
dw_2.setitem(1, 'orexceed_confirm_rem', '')
dw_2.object.sale_confirm_user[1] = ''
dw_2.object.sale_confirm_date[1] = ldt_null

//변경 건수, 일시 저장
li_revision = dw_2.getitemnumber(1, "revision_no")
dw_2.object.revision_no[1]   = li_revision + 1
dw_2.object.revision_date[1] = wf_today()

if dw_2.accepttext( ) = -1 or dw_3.accepttext( ) = -1 then
	pb_retrieve.PostEvent(Clicked!)	
	messagebox("오류","수주 취소시 오류가 발생했습니다.~r~n다시 진행해주세요.")
	return
end if

if WF_Update2( dw_2, dw_3, "N" ) = false then return

//// SMS 발송
//if cbx_sms.checked = true then
//	ls_temp   = "[유창]"+ls_order_no+" 수주취소가 되었습니다."
//	ls_temp   = GF_HANGLE_TR(ls_temp,80)
//	
//	ls_salesman	= dw_2.getitemstring(1, 'salesman')	
//	//받는 사람
//	SELECT 
//		replace(substring(ltrim(rtrim(isnull(a.hp_no,''))),1,13), '-', '') 
//	INTO 
//		:ls_recipient
//	FROM 
//		salehp A
//	WHERE 
//		a.user_id   = :ls_salesman
//	using sqlca;		
//	//보낸 사람
//	SELECT 
//		rtrim(BIGO) 
//	INTO 
//		:ls_sender 
//	FROM 
//		codemst 
//	WHERE 
//		TYPE = 'SMSSEND' 
//	AND 
//		item_cd = :gs_userid
//	using sqlca;	
//	
//	if isnull(ls_sender) OR ls_sender = "" then ls_sender = "0226481998"			
//	choose case left(ls_recipient,3)
//		case "010", "011", "016", "017", "018", "019"
//		case else
//			ls_recipient = ""
//	end choose
//	
//	// 수신처
//	if ls_recipient = "" OR isnull(ls_recipient) then
//	else
//		if cbx_sms.checked = true then
//			GF_MMSSEND( GS_userid, ls_sender, ls_recipient, GS_username, ls_temp )
//		end if
//	end if		
//end if	

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

messagebox("확인","초과 확정 취소를 완료했습니다.")
pb_retrieve.PostEvent(Clicked!)	
end event

type cb_save from commandbutton within w_orsaleexceed_m
integer x = 3342
integer y = 40
integer width = 256
integer height = 144
integer taborder = 290
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string text = "승인"
end type

event clicked;string ls_order_no, ls_open_close, ls_temp

if dw_2.rowcount() < 1 then return

//한도승인 체크 유무 
ls_open_close	= dw_2.getitemstring(1, 'open_close')
if ls_open_close <> 'O' then
	messagebox("확인","한도승인을 체크 하세요.")
	return
end if

//동시 작업 방지
ls_order_no		= dw_2.getitemstring(1, 'order_no')
select
	open_close
into
	:ls_open_close
from
	sale
where
	order_no = :ls_order_no
using sqlca;	

if ls_open_close <> 'Z' then
	ls_temp		= "상태가 한도초과건만~r~n승인을 할수 있습니다."
	MessageBox("확인",ls_temp)
	return
end if

if MessageBox("확인","승인 하시겠습니까?",question!,okcancel!,1) = 2 then return

dw_2.setItem(1, 'orexceed_confirm_user', gs_userid)
dw_2.setItem(1, 'orexceed_confirm_date', gf_today())
if dw_2.accepttext() = -1 then 
	messagebox("오류","저장 중 오류가 발생했습니다.~r~n다시 진행해 주시기 바랍니다.")
	return
end if
if wf_update1( dw_2, 'Y') = false then RETURN
//조회
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

pb_retrieve.postevent(clicked!)
end event

type pb_1 from picturebutton within w_orsaleexceed_m
integer x = 3872
integer y = 40
integer width = 325
integer height = 140
integer taborder = 310
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
string text = "매출/  수금내역"
boolean originalsize = true
alignment htextalign = right!
vtextalign vtextalign = multiline!
end type

event clicked;// 매출/수금내역
gs_where        lstr_where
string ls_cust_no, ls_cust_name

if dw_2.rowcount() < 1 then RETURN

ls_cust_no   = dw_2.object.cust_no[1]
ls_cust_name = dw_2.object.customer_cust_name[1]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
OpenWithParm( w_whopeom_w, lstr_where )

end event

