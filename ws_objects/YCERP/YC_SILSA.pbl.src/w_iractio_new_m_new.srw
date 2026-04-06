$PBExportHeader$w_iractio_new_m_new.srw
$PBExportComments$실사입력 및 갱신(2000/09/02)
forward
global type w_iractio_new_m_new from w_inheritance
end type
type gb_7 from groupbox within w_iractio_new_m_new
end type
type gb_4 from groupbox within w_iractio_new_m_new
end type
type sle_1 from singlelineedit within w_iractio_new_m_new
end type
type rb_1 from radiobutton within w_iractio_new_m_new
end type
type rb_2 from radiobutton within w_iractio_new_m_new
end type
type em_1 from editmask within w_iractio_new_m_new
end type
type dw_3 from datawindow within w_iractio_new_m_new
end type
type cbx_2 from checkbox within w_iractio_new_m_new
end type
type hpb_1 from hprogressbar within w_iractio_new_m_new
end type
type st_3 from statictext within w_iractio_new_m_new
end type
type ddlb_fld from dropdownlistbox within w_iractio_new_m_new
end type
type ddlb_dwtitles from dropdownlistbox within w_iractio_new_m_new
end type
type st_2 from statictext within w_iractio_new_m_new
end type
type ddlb_op from dropdownlistbox within w_iractio_new_m_new
end type
type sle_value from singlelineedit within w_iractio_new_m_new
end type
type cb_2 from commandbutton within w_iractio_new_m_new
end type
type cb_3 from commandbutton within w_iractio_new_m_new
end type
type cb_4 from commandbutton within w_iractio_new_m_new
end type
type cb_5 from commandbutton within w_iractio_new_m_new
end type
type cb_1 from commandbutton within w_iractio_new_m_new
end type
type cb_6 from commandbutton within w_iractio_new_m_new
end type
type st_4 from statictext within w_iractio_new_m_new
end type
type st_6 from statictext within w_iractio_new_m_new
end type
type st_12 from statictext within w_iractio_new_m_new
end type
type cb_9 from commandbutton within w_iractio_new_m_new
end type
type dwxls from datawindow within w_iractio_new_m_new
end type
type rb_10 from radiobutton within w_iractio_new_m_new
end type
type rb_11 from radiobutton within w_iractio_new_m_new
end type
type ddlb_gubun from dropdownlistbox within w_iractio_new_m_new
end type
type pb_retrieve1 from picturebutton within w_iractio_new_m_new
end type
type rb_12 from radiobutton within w_iractio_new_m_new
end type
type dw_4 from datawindow within w_iractio_new_m_new
end type
type pb_1 from picturebutton within w_iractio_new_m_new
end type
type cb_10 from commandbutton within w_iractio_new_m_new
end type
type cb_7 from commandbutton within w_iractio_new_m_new
end type
type cb_8 from commandbutton within w_iractio_new_m_new
end type
type st_1 from statictext within w_iractio_new_m_new
end type
type gb_5 from groupbox within w_iractio_new_m_new
end type
type gb_6 from groupbox within w_iractio_new_m_new
end type
end forward

global type w_iractio_new_m_new from w_inheritance
integer y = 36
integer width = 8599
integer height = 2568
string title = "실사 마감(w_iractio_new_m_new)"
gb_7 gb_7
gb_4 gb_4
sle_1 sle_1
rb_1 rb_1
rb_2 rb_2
em_1 em_1
dw_3 dw_3
cbx_2 cbx_2
hpb_1 hpb_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_1 cb_1
cb_6 cb_6
st_4 st_4
st_6 st_6
st_12 st_12
cb_9 cb_9
dwxls dwxls
rb_10 rb_10
rb_11 rb_11
ddlb_gubun ddlb_gubun
pb_retrieve1 pb_retrieve1
rb_12 rb_12
dw_4 dw_4
pb_1 pb_1
cb_10 cb_10
cb_7 cb_7
cb_8 cb_8
st_1 st_1
gb_5 gb_5
gb_6 gb_6
end type
global w_iractio_new_m_new w_iractio_new_m_new

type variables
string ls_click = ''
st_print i_print
datawindowchild  idwc_qa, idwc_item, idwc_loc
 
end variables

forward prototypes
public subroutine wf_silsa_itemstock_create ()
public subroutine wf_silsa_create ()
end prototypes

public subroutine wf_silsa_itemstock_create ();
end subroutine

public subroutine wf_silsa_create ();string ls_sqlerrtext
string arg_yyyymm, arg_item_no, arg_loc_no, arg_item_name
string ls_yyyymm, ls_loc_no, ls_loc_name, ls_item_no, ls_item_name, ls_qa, ls_uom
decimal l_pre_qty, l_plus_qty, l_minus_qty, l_stock_qty, l_silsa_qty, l_ERP_PRE_QTY
long   ll_row

 	  
arg_yyyymm = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)
arg_loc_no = trim(dw_2.object.loc_no[1])

//choose case rb_1.checked		// 코드
//	case true
//		arg_item_no = sle_1.text + "%"
//		arg_item_name = "%"
//	case else
//		if trim(sle_1.text) = '' or isnull(sle_1.text) then
//			arg_item_name = "%"
//		else
//			arg_item_name = "%" + sle_1.text + "%"
//		end if
//		arg_item_no = "%"
//end choose

DECLARE dt_silsa_itemstock procedure for dt_silsa_itemstock :arg_yyyymm, :arg_loc_no using sqlca;

EXECUTE dt_silsa_itemstock ;

if sqlca.sqlcode > 0 then
		
//	select  convert(char(10), dateadd(day, -1, convert(char(6),dateadd(month, -1,   convert(date, :ls_day ) ),112)+'01'),121 ) + ' ~ ' +  convert(char(10),  convert(date, :ls_day ),121) 
//	    into :ls_gigan
//	from dual;
//	messagebox('알림', '['+ ls_gigan + '] 기간의 일수불을 생성이 완료 되었습니다.')

else
	messagebox('오류','생성시 오류가 있습니다.')
end if

CLOSE dt_silsa_itemstock;
COMMIT using sqlca;




///* 기말재고를 insert  */
//insert into silsa_itemstock
//	select  a.yyyymm, 
//		 a.loc_no,
//		 a.item_no,
//		 a.qa,
//		 sum(a.pre_qty) pre_qty,										
//		 0 plus_qty,
//		 0 minus_qty,
//		 sum(a.pre_qty) + sum(a.in_qty) - sum(a.out_qty) stock_qty,
//		 sum(a.pre_qty) + sum(a.in_qty) - sum(a.out_qty) silsa_qty,
//		 'O' close_yn,
//		 c.user_id user_id,
//		 null save_date
//	from 
//	(
//			select  substring(cdate,1,6) yyyymm,
//					  loc_no, 
//					  item_no, 
//					  qa, 
//					  sum(isnull(rcpt_qty,0)) in_qty,  
//					  sum(isnull(issue_qty ,0)) out_qty,
//					  0 pre_qty
//			from ineoday with(nolock)
//			where cdate between :arg_yyyymm+'01' and   convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime, :arg_yyyymm+'01') )),112)
//			   and RTRIM(LTRIM(loc_no)) like  :arg_loc_no
//			group by substring(cdate,1,6), loc_no, item_no, qa
//			union all
//			select  :arg_yyyymm yyyymm,
//					  loc_no,                                 
//					  item_no,
//					  qa,
//					  0 in_qty,
//					  0 out_qty,
//					  stock_qty pre_qty
//			from item_stock with(nolock)
//			where stock_date = convert(char(10), dateadd(day, -1, convert(datetime, :arg_yyyymm+'01') ),112)					
//			    and RTRIM(LTRIM(loc_no)) like  :arg_loc_no
//	) a  inner join groupitem with(nolock) on a.item_no = groupitem.item_no
//      	left outer join  (
//                      								 select loc_no, item_no, qa, user_id
//                      								  from silsa_itemstock  with(nolock) 
//                      								where yyyymm = convert(char(6), dateadd( month, -1, :arg_yyyymm+'01' ), 112 )
//                      						) c on  a.loc_no  = c.loc_no and  a.item_no = c.item_no and  a.qa = c.qa
//where not exists  ( select * 
//                                from silsa_itemstock b with(nolock)
//                                where  b.yyyymm = a.yyyymm  and   b.loc_no  = a.loc_no and  b.item_no = a.item_no and  b.qa = a.qa 
//                               )	/*기존재하는 데이터 제외 */
//		 and groupitem.cost_yn <> 'Y'
//		 and not exists (
//                      								select b.item_no
//                      								from
//                      								  (
//                      												 SELECT  item_no
//                      												  FROM groupitem
//                      												  WHERE groupitem.ITEM_NAME LIKE '%샘플%' or groupitem.item_name like '%LOSS%' or groupitem.item_name = '계산서정정' or groupitem.item_name = '금형비' /* jowonsuk 2018.07.09 , 계산서정정,  금형비 */											  
//                      												  union all
//                      												  select item_no
//                      													from item_cost
//                      								 ) b 
//                      								 where  b.item_no = a.item_no
//            					   	    )															 
//	group by a.yyyymm,
//			 a.loc_no,
//			 a.item_no,
//			 a.qa,
//			 c.user_id
//having abs(sum(a.pre_qty)) + abs(sum(a.pre_qty) + sum(a.in_qty) - sum(a.out_qty)) <> 0 /*2018.10.29 jowonsuk 기초수량, 재고수량이 모두 0이 아닌것만 */
//
///*커서 돌리는걸로 변경 너무 느려서 수정 jowonsuk 2019.03.26*/
//
////DECLARE real_inaudit_cursor CURSOR FOR 
////SELECT  YYYYMM, LOC_NO, ITEM_NO, QA, ERP_PRE_QTY, STOCK_QTY
////  FROM UF_SILSA_INAUDIT(:arg_yyyymm, :arg_loc_no);
////
////
//// OPEN real_inaudit_cursor;
////
//// FETCH real_inaudit_cursor INTO :ls_YYYYMM, :ls_LOC_NO, :ls_ITEM_NO, :ls_qa, :l_ERP_PRE_QTY, :l_STOCK_QTY;
////
////
////		Do While sqlca.sqlcode = 0	
////			
////			update silsa_itemstock
////				set pre_qty     = :l_ERP_PRE_QTY,
////						stock_qty = :l_STOCK_QTY,																			/*실사보정을 제외한 inaudit 수불을 가져옴 																*/
////						silsa_qty   = ( case when save_date is null then :l_STOCK_QTY else silsa_qty end )	/*수정일이 없으면  아직 미반영이므로 현재재고량을 실사량에 반영, 수정을 한건 실사 값을  변경하지 않고 기존것을 그대로 반영 */			
////			where yyyymm = :ls_yyyymm
////			   and loc_no    = :ls_loc_no
////			   and item_no  = :ls_item_no
////			   and qa           = :ls_qa
////			   and close_yn = 'O';
////					  
////			if sqlca.sqlcode < 0 then
////				ls_sqlerrtext = string(sqlca.sqlerrtext)
////				ROLLBACK;				
////				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' +' item_no: ' + ls_ITEM_NO + ' qa: ' + ls_qa, exclamation!)
////
////			end if									  
////		
////			FETCH real_inaudit_cursor INTO :ls_YYYYMM, :ls_LOC_NO, :ls_ITEM_NO, :ls_qa, :l_ERP_PRE_QTY, :l_STOCK_QTY;
////			
////			if sqlca.sqlcode < 0 then
////				ls_sqlerrtext = string(sqlca.sqlerrtext)
////				ROLLBACK;				
////				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' +' item_no: ' + ls_ITEM_NO + ' qa: ' + ls_qa, exclamation!)
////
////			end if				
////			 
////		Loop
////
////
//// CLOSE real_inaudit_cursor;
//// 
//// commit;
// 
// 
//		 
///*최신 월말 재고량으로 업데이트 */			 
//
//update silsa_itemstock
//   set pre_qty     = b.erp_pre_qty,
//         stock_qty = ( case when a.save_date is null then b.stock_qty else a.stock_qty end ),	/*실사보정을 제외한 inaudit 수불을 가져옴 																*/
//         silsa_qty   = ( case when a.save_date is null then b.stock_qty else a.silsa_qty end )	/*수정일이 없으면  아직 미반영이므로 현재재고량을 실사량에 반영, 수정을 한건 실사 값을  변경하지 않고 기존것을 그대로 반영 */			
//from silsa_itemstock a  inner join UF_SILSA_INAUDIT(:arg_yyyymm, :arg_loc_no) b  on a.yyyymm = b.yyyymm and a.loc_no = b.loc_no and a.item_no = b.item_no and a.qa = b.qa
// where a.close_yn = 'O'
///*
// from  silsa_itemstock a with(nolock) inner join (
//																	select  a.yyyymm, 
//																		 a.loc_no,
//																		 a.item_no,
//																		 a.qa,
//																		 sum(a.pre_qty) + sum(a.in_qty) - sum(a.out_qty) stock_qty,
//																		 sum(a.pre_qty) erp_pre_qty
//																	from 
//																	(
//																	
//																			select  :arg_yyyymm yyyymm,
//																					  loc_no, 
//																					  item_no, 
//																					  qa, 
//																					  sum(isnull(rcpt_qty,0)) in_qty,  
//																					  sum(isnull(issue_qty ,0)) out_qty,
//																					  0 pre_qty
//																			from ineoday with(nolock)
//																			where cdate between :arg_yyyymm+'01' and   convert(char(8), dateadd(day, -1, dateadd(month, 1, convert(datetime, :arg_yyyymm+'01') )),112)
//																				 and loc_no like  :arg_loc_no
//																			group by substring(cdate,1,6), loc_no, item_no, qa
//		
//																			union all																																		
//																			select :arg_yyyymm yyyymm, 
//																					loc_no, 
//																					inaudit_item, 
//																					qa, 
//																					sum(isnull(rcpt_qty,0))*-1 in_qty, 
//																					sum(isnull(issue_qty,0))*-1 out_qty,
//																					0 pre_qty
//																			from inaudit with(nolock)
//																			where convert(char(8),inaudit_date,112) = convert(char(8), dateadd(day, -1, dateadd(month, 1, convert(datetime, :arg_yyyymm+'01') )),112)
//																			and inaudit_type in ('RX', 'IX')
//																			and rem IN ('실사보정작업', '실사보정취소')
//																			and loc_no like :arg_loc_no
//																			group by loc_no, 
//																						inaudit_item, 
//																						qa
//																			union all
//																			select  :arg_yyyymm yyyymm,
//																					  loc_no,                                 
//																					  item_no,
//																					  qa,
//																					  0 in_qty,
//																					  0 out_qty,
//																					  stock_qty pre_qty
//																			from item_stock with(nolock)
//																			where stock_date = convert(char(8), dateadd(day, -1, convert(datetime, :arg_yyyymm+'01') ),112)					
//																				and loc_no like  :arg_loc_no
//																	) a
//																	group by a.yyyymm,
//																			 a.loc_no,
//																			 a.item_no,
//																			 a.qa
//
//											  				 ) b  on a.yyyymm = b.yyyymm and a.loc_no = b.loc_no and a.item_no = b.item_no and a.qa = b.qa																								
//     where a.close_yn = 'O'
//	    and a.yyyymm = :arg_yyyymm;/* jowonsuk 2018.06.29 주석처리 */
//*/

end subroutine

on w_iractio_new_m_new.create
int iCurrent
call super::create
this.gb_7=create gb_7
this.gb_4=create gb_4
this.sle_1=create sle_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.em_1=create em_1
this.dw_3=create dw_3
this.cbx_2=create cbx_2
this.hpb_1=create hpb_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_1=create cb_1
this.cb_6=create cb_6
this.st_4=create st_4
this.st_6=create st_6
this.st_12=create st_12
this.cb_9=create cb_9
this.dwxls=create dwxls
this.rb_10=create rb_10
this.rb_11=create rb_11
this.ddlb_gubun=create ddlb_gubun
this.pb_retrieve1=create pb_retrieve1
this.rb_12=create rb_12
this.dw_4=create dw_4
this.pb_1=create pb_1
this.cb_10=create cb_10
this.cb_7=create cb_7
this.cb_8=create cb_8
this.st_1=create st_1
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_7
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.cbx_2
this.Control[iCurrent+9]=this.hpb_1
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.ddlb_op
this.Control[iCurrent+15]=this.sle_value
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_4
this.Control[iCurrent+19]=this.cb_5
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_6
this.Control[iCurrent+22]=this.st_4
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.st_12
this.Control[iCurrent+25]=this.cb_9
this.Control[iCurrent+26]=this.dwxls
this.Control[iCurrent+27]=this.rb_10
this.Control[iCurrent+28]=this.rb_11
this.Control[iCurrent+29]=this.ddlb_gubun
this.Control[iCurrent+30]=this.pb_retrieve1
this.Control[iCurrent+31]=this.rb_12
this.Control[iCurrent+32]=this.dw_4
this.Control[iCurrent+33]=this.pb_1
this.Control[iCurrent+34]=this.cb_10
this.Control[iCurrent+35]=this.cb_7
this.Control[iCurrent+36]=this.cb_8
this.Control[iCurrent+37]=this.st_1
this.Control[iCurrent+38]=this.gb_5
this.Control[iCurrent+39]=this.gb_6
end on

on w_iractio_new_m_new.destroy
call super::destroy
destroy(this.gb_7)
destroy(this.gb_4)
destroy(this.sle_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.cbx_2)
destroy(this.hpb_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_1)
destroy(this.cb_6)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.st_12)
destroy(this.cb_9)
destroy(this.dwxls)
destroy(this.rb_10)
destroy(this.rb_11)
destroy(this.ddlb_gubun)
destroy(this.pb_retrieve1)
destroy(this.rb_12)
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.cb_10)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.st_1)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_loc, ls_defloc, ls_pre_yyyymm, ls_area
int      l_day, l_st_day

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_3.SetTransObject(sqlca)
dw_4.SetTransObject(sqlca)
dwxls.SetTransObject(sqlca)
/*(dw_1.dataobject = 'd_iractio_new_m'*/
dw_1.SetTransObject( SQLCA)


dw_3.visible  = false
hpb_1.visible = false

setnull(ls_area)

em_1.text = string(gf_today() ,'yyyy mm dd') 


select Day(getdate()) into :l_day from dual;

if l_day >= l_st_day then
	em_1.text = string(gf_today() ,'yyyy mm dd') 	
else
	select convert(char(10),DATEADD(Month, -1, getdate()),102)  into :ls_pre_yyyymm from dual;
	em_1.text = ls_pre_yyyymm
end if


// 저장소
SELECT def_loc INTO :ls_defloc FROM AREA WHERE area_no = :gs_area;

dw_2.getchild("loc_no", idwc_loc)
//idwc_loc.setfilter("loc_type = 'N'")
//idwc_loc.filter()


// 실사마감(재고조정)
dw_4.visible = false

pb_compute.enabled = false		// 재고변경
pb_save.enabled    = false		// 저장
st_6.text = gs_username

dw_2.insertrow(0)

if GF_PERMISSION("실사마감(재고조정)저장권한", gs_userid) = "Y" then	
	pb_save.enabled    = true		// 저장
	dw_2.object.loc_no[1] =ls_defloc
end if

if GF_PERMISSION("실사마감(재고조정)조정권한", gs_userid) = "Y" then	
	cb_1.enabled  = true
	cb_6.enabled  = true		
	
//	dw_2.insertrow(0)
	dw_2.object.loc_no[1] = '%'	
else		
	cb_1.enabled  = false	
	cb_6.enabled  = false
	
//	dw_2.insertrow(0)
	dw_2.object.loc_no[1] =ls_defloc
end if 

if GF_PERMISSION("실사마감(재고조정)마감권한", gs_userid) = "Y" then	
	cb_7.enabled = true
	cb_8.enabled = true

	pb_save.enabled    = false		// 저장

//	dw_2.insertrow(0)
	dw_2.object.loc_no[1] = '%'
else		
	cb_7.enabled = false
	cb_8.enabled = false
	
	pb_save.enabled    = true	
	
end if

STRING ls_doc_no, ls_where

setnull(ls_area)

select distinct area_name
  into :ls_area
from financial_location
where area = :gs_area;

if isnull(ls_area) or ls_area = ''  then
	ddlb_gubun.text  = '시화공장'
	ls_area =  '시화공장'
else
	ddlb_gubun.text = ls_area
end if 

DECLARE csr_ct_code01 CURSOR FOR
select '%' loc_no from dual
union all
 select loc_no
 from financial_location
 where area_name = :ls_area;
 
 OPEN csr_ct_code01;

do while sqlca.sqlcode = 0	
	
	FETCH csr_ct_code01 INTO :ls_doc_no;
	if SQLCA.SQLCODE < 0 then		
		return
	elseif SQLCA.SQLCODE = 100 then
		exit
	end if
	
     ls_where = ls_where + "'" + ls_doc_no + "',"

loop

close csr_ct_code01;

ls_where = MidA(ls_where,1, LenA(ls_where)-1)

idwc_loc.setfilter("loc_no in ( " + ls_where + " )")
idwc_loc.filter()
idwc_loc.sort()
end event

event resize;call super::resize;//
gb_6.width   = newwidth  - (gb_6.x * 2)

dw_1.width   = newwidth  - (gb_6.x * 2)
dw_1.height  = newheight  - dw_1.y - gb_6.x

dw_3.width   = 2295
dw_3.height  = dw_1.height
dw_3.x       = dw_1.width - dw_3.width + 22
dw_3.y       = dw_1.y

end event

type pb_save from w_inheritance`pb_save within w_iractio_new_m_new
integer x = 4425
integer y = 56
integer taborder = 40
boolean enabled = false
end type

event pb_save::clicked;// 저장
dwItemStatus l_status
long   ll_row, ll_cnt, ll_count
real   lr_countqoh, l_gab_qty, l_silsa_qty
string ls_location,ls_item,ls_qa, ls_year, ls_mon, ls_update

ls_year = MidA(em_1.text,1,4)
ls_mon  = MidA(em_1.text,6,2)

dw_1.accepttext()
dw_2.accepttext()

ls_location = trim(dw_2.object.loc_no[1])
if trim(ls_location) = '' or isnull(ls_location) then
	MessageBox("확인","저장소를 선택 하십시요")
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//hpb_1.width    = ddlb_2.width
//hpb_1.position = 0
//hpb_1.visible  = true
//

ll_row = dw_1.rowcount()

for ll_cnt = 1 to ll_row
////	hpb_1.position = (ll_cnt / ll_row) * 100
////
//	l_status = dw_1.GetItemStatus(ll_cnt, 'silsa_qty', Primary!)
////	ls_item  = trim(dw_1.object.item_no[ll_cnt])
////	ls_qa    = trim(dw_1.object.qa[ll_cnt])

	l_gab_qty = 0
	l_silsa_qty = 0
	
	l_silsa_qty = dw_1.object.silsa_qty[ll_cnt]	
	
	if l_silsa_qty < 0 then
		MessageBox('오류', string(ll_cnt) + '행의 실사재고량은 (-)수량이 될 수 없습니다.')
		return 0
	end if


	l_gab_qty = dw_1.object.gab_qty[ll_cnt]
	
	if l_gab_qty <> 0 then
		if isnull(dw_1.object.comment[ll_cnt]) or  trim(dw_1.object.comment[ll_cnt]) = '' then 
			MessageBox('오류',  string(ll_cnt) + '행 차이량이 있는 건은 사유 등록이 필수 입니다.')
			return 0
		end if		
	end if


next


//hpb_1.visible  = false

wf_update1( dw_1, 'Y' );

if ls_click = 'normal' then
	pb_retrieve.PostEvent(Clicked!)
else
	pb_retrieve1.PostEvent(Clicked!)
end if
end event

type dw_1 from w_inheritance`dw_1 within w_iractio_new_m_new
event itemchanging pbm_dwnchanging
integer x = 32
integer y = 572
integer width = 4119
integer height = 1848
integer taborder = 60
string dataobject = "d_iractio_new_m"
end type

event dw_1::itemchanging;long ll_row, ll_row1, ll_found
string ls_item_no, ls_qa, ls_date, ls_item_name,  ls_data, ls_uom, ls_user_id, ls_silsa_qty, ls_save_date
decimal l_silsa_qty

//this.accepttext()
dw_2.accepttext()
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

choose case dwo.name	
	case 'silsa_qty'
		l_silsa_qty = dec(data)
		ls_silsa_qty = data
		
		if isnull(ls_silsa_qty) then
			setnull(ls_user_id)
			setnull(l_silsa_qty)
			this.object.user_id[row] = ls_user_id
			this.object.user_name[row] = ''
			this.object.silsa_qty[row] = l_silsa_qty		
		else
			this.object.user_id[row] = gs_userid
			this.object.user_name[row] = gs_username	
//			this.object.silsa_qty[row] = dec(ls_silsa_qty)
		end if				
		
		if ls_silsa_qty = '' or LenA(trim(ls_silsa_qty)) = 0 then
			setnull(ls_user_id)
			setnull(l_silsa_qty)			
			setnull(ls_save_date)
			this.object.user_id[row] = ls_user_id
			this.object.user_name[row] = ''
			
			if ls_silsa_qty = '' then
				this.object.silsa_qty[row] = l_silsa_qty /* null 을 너음 주석처리하고 0으로 대체  */
//				this.object.silsa_qty[row] = 0				
			elseif ls_silsa_qty = '0' then
				this.object.silsa_qty[row] = 0
			end if
			
			this.object.save_date[row] = ls_save_date													/*신규추가 로직 2018.07.31 jowonsuk*/
			
		else
			this.object.user_id[row] = gs_userid
			this.object.user_name[row] = gs_username			
//			this.object.silsa_qty[row] = dec(ls_silsa_qty)

			this.object.save_date[row] = string(gf_today() ,'yyyymmdd')								/*신규추가 로직 2018.07.31 jowonsuk*/
		end if		
		

end choose

end event

event dw_1::itemchanged;long ll_row, ll_row1, ll_found
string ls_item_no, ls_qa, ls_date, ls_item_name,  ls_data, ls_uom, ls_user_id
decimal l_silsa_qty

//this.accepttext()
dw_2.accepttext()
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

choose case dwo.name
	case 'item_no'

		this.object.qa[row] = ''
		this.object.qa.tabsequence = 0
		
		ls_data = data
  	     ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		select item_name, uom into :ls_item_name, :ls_uom from groupitem 
		 where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
			return 1
		end if
		this.object.item_name[row] = ls_item_name
		this.object.uom[row] = ls_uom
		if ls_item_no <> '' then
			this.getchild("qa", idwc_qa)
//			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
			
			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
				this.setcolumn("qa")
				this.setfocus()
			else
				this.object.qa.tabsequence = 0
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if
		
	case 'qa'
		ls_data = data
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
				+ "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 THEN
				if gf_iteminsert(ls_item_no, ls_data) = false then return 1
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			else
				return 1
			end if
		end if
		
//	case 'silsa_qty'
//		setnull(l_silsa_qty)
//		if isnull(data) = false  or data <> '' then
//			this.object.user_id[row] = gs_userid
//			this.object.user_name[row] = gs_username
//			this.object.silsa_qty[row]  = l_silsa_qty
//		else
//			setnull(ls_user_id)
//			this.object.user_id[row] = ls_user_id
//			this.object.user_name[row] = ''
//		end if			
end choose

end event

event dw_1::itemerror;
CHOOSE CASE dwo.name
	CASE 'item_no'
			this.object.item_no[this.getrow()] = ''
	CASE 'qa'
			this.object.qa[this.getrow()] = ''	
END CHOOSE
		
return 2
end event

event dw_1::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if row < 1 then return
this.scrolltorow(row)

dwItemStatus l_status
string  ls_item_no

if dwo.name = 'qa' then
//	l_status = dw_1.GetItemStatus(row, 'itemloc_qa', Primary!)
//	if l_status = new! or l_status = newmodified! then
//		this.setredraw(false)
//		this.Modify("itemloc_qa.dddw.Name='d_cditemqa_c'")
//		this.Modify("itemloc_qa.dddw.allowedit=yes")
//		this.Modify("itemloc_qa.dddw.percentwidth='120'")
//		this.Modify("itemloc_qa.dddw.displayColumn='qa'")
//		this.Modify("itemloc_qa.dddw.DataColumn='qa'")
//		this.Modify("itemloc_qa.dddw.vscrollbar=yes")
//		this.getchild('coil_no',idwc_qa)
//		idwc_qa.settransobject(sqlca)

		this.getchild("qa", idwc_qa)
		idwc_qa.setredraw(false)
		gs_ds_qaall.ShareData(idwc_qa)
		
		this.accepttext()
		ls_item_no = this.object.item_no[row]
		if ls_item_no = '' or isnull(ls_item_no) then
			return
		else
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
		end if
		this.setcolumn('qa')
		idwc_qa.setredraw(true)
		this.setredraw(true)
	
//	else
////		dw_1.Modify("itemloc_qa.edit.case=any")
////		dw_1.Modify("itemloc_qa.edit.autoselect=yes")
//////		dw_1.Modify("itemloc_qa.edit.nilisnull=yes")
////		dw_1.Modify("itemloc_qa.edit.display only=yes")
//	end if
end if

end event

event dw_1::rbuttondown;string ls_location
long ll_row, ll_cnt

CHOOSE CASE dwo.name
	CASE 'item_no', 'item_name', 'qa'
		gs_where2 lstr_where
		
		dw_2.accepttext()
		
		ls_location = trim(dw_2.object.loc_no[1])
		if trim(ls_location) = '' or isnull(ls_location) then
			messagebox("확인","저장소를 선택하십시요")
			return
		end if
		
		lstr_where.chk = 'M' // M:nulti S:Single
		lstr_where.chk1 = ls_location
		openwithparm(w_whitemlocqohmulti_w, lstr_where)
		lstr_where = Message.PowerObjectParm
		if lstr_where.chk <> "Y" then return
		
		dw_2.accepttext()
		dw_1.accepttext()
		
		dw_1.setredraw(false)
		for ll_row = 1 to UpperBound(lstr_where.str1)						
			ll_cnt = dw_1.insertrow(dw_1.getrow())
			dw_1.object.item_no[ll_cnt]     = trim(lstr_where.str1[ll_row])
			dw_1.object.qa[ll_cnt]          = trim(lstr_where.str2[ll_row])
			dw_1.object.uom[ll_cnt]       = trim(lstr_where.str3[ll_row])
			dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])		
		
			dw_1.object.pre_qty[ll_cnt] = 0
			dw_1.object.plus_qty[ll_cnt] = 0
			dw_1.object.minus_qty[ll_cnt] = 0
			dw_1.object.stock_qty[ll_cnt] = 0
			
		next
		
		dw_1.scrolltorow(ll_cnt)
		idwc_qa.setfilter("item_no = '" + dw_1.object.item_no[ll_cnt] + "'")
		idwc_qa.filter()
		dw_1.setcolumn('silsa_qty')
		dw_1.setfocus()
		dw_1.setredraw(true)
		
END CHOOSE

//w_frame.PointerX(), w_frame.PointerY())

end event

event dw_1::keydown;call super::keydown;//string ls_user_id
//decimal l_silsa_qty
//
//setnull(l_silsa_qty)
//	
//if key = keydelete! then
//	setnull(ls_user_id)
//	setnull(l_silsa_qty)
//	this.accepttext()		
//	l_silsa_qty = dw_1.object.silsa_qty[getrow()]
//	messagebox('알림', string(l_silsa_qty) )	
//	this.accepttext()	
////	dw_1.object.user_id[getrow()] = ls_user_id
////	dw_1.object.user_name[getrow()] = ''
////	dw_1.object.silsa_qty[getrow()] = l_silsa_qty
//elseif key = keyback! then	
//	this.accepttext()		
//	l_silsa_qty = dw_1.object.silsa_qty[getrow()]
//	messagebox('알림', string(l_silsa_qty) )
//	this.accepttext()		
//end if
//
end event

event dw_1::doubleclicked;call super::doubleclicked;string ls_user_id, ls_null_user_id, ls_close_yn, ls_null_save_date
decimal l_null_silsa_qty
long l_erp_stock_qty

if	dwo.name = 'user_name' then
	
	ls_close_yn = this.object.close_yn[row] 
	
	if ls_close_yn = 'O' then
	
			ls_user_id = this.object.user_id[row] 
			
			
			
			if 	ls_user_id = '' or 	isnull(ls_user_id) then
				
				l_erp_stock_qty =  this.object.erp_stock_qty[row]
				this.object.user_id[row] = gs_userid
				this.object.user_name[row] = gs_username
				this.object.save_date[row] = string(gf_today() ,'yyyymmdd')								/*신규추가 로직 2018.07.31 jowonsuk*/				
				
				if isnull(this.object.silsa_qty[row])  and this.object.silsa_qty[row] = 0 then
					this.object.silsa_qty[row] = l_erp_stock_qty
				end if				
				
			else
				
					setnull(ls_user_id)
					setnull(l_null_silsa_qty)
					setnull(ls_null_save_date)
					this.object.user_id[row] = ls_null_user_id
					this.object.user_name[row] = ''
	/*				this.object.silsa_qty[row] = l_null_silsa_qty*/
					this.object.save_date[row] = ls_null_save_date								/*신규추가 로직 2018.07.31 jowonsuk*/					
					
					if isnull(this.object.silsa_qty[row])  and this.object.silsa_qty[row] = 0 then
						this.object.silsa_qty[row] = 0
					end if
				
			end if
			
			
	end if
	
end if
end event

type st_title from w_inheritance`st_title within w_iractio_new_m_new
integer x = 23
integer y = 28
integer width = 1239
string text = "실사마감(재고조정)"
end type

type st_tips from w_inheritance`st_tips within w_iractio_new_m_new
end type

type pb_compute from w_inheritance`pb_compute within w_iractio_new_m_new
boolean visible = false
integer x = 5554
integer y = 64
integer height = 148
integer taborder = 310
boolean enabled = false
end type

event pb_compute::constructor;//update itemloc set balbf = 0, 
//						receipt_qty = 0,
//						issue_qty = 0,
//						itemloc.qoh = 0
// where substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '2'
// 	 or substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '1';
//
//update item set qoh = 0
// where substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '2'
// 	 or substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '1';
//
//	update itemloc set balbf = isnull((select sum(coilmst.unit_qty * coilmst.qcnt) 												
//										  from coilmst	
//										 where open_close <> 'C'	
//											and coilmst.item_no = itemloc.item_no
//											and coilmst.qa = itemloc.qa
//											and coilmst.loc_no = itemloc.loc_no), 0 ),
//							 receipt_qty = 0,
//							 issue_qty = 0,
//							 itemloc.qoh = isnull((select sum(coilmst.unit_qty * coilmst.qcnt) 												
//												  from coilmst	
//												 where open_close <> 'C'	
//													and coilmst.item_no = itemloc.item_no
//													and coilmst.qa = itemloc.qa
//													and coilmst.loc_no = itemloc.loc_no), 0 )
//	
//	where itemloc.item_no like 'M%';
//
//	update itemloc set balbf = isnull((select sum(sheetmst.qcnt) 												
//										  from sheetmst	
//										 where open_close <> 'C'	
//											and substring(sheetmst.item_no,4,1) = '2'
//											and sheetmst.item_no = itemloc.item_no
//											and sheetmst.qa = itemloc.qa
//											and sheetmst.loc_no = itemloc.loc_no), 0 ),
//							 receipt_qty = 0,
//							 issue_qty = 0,
//							 itemloc.qoh = isnull((select sum(sheetmst.qcnt) 												
//												  from sheetmst	
//												 where open_close <> 'C'	
//													and sheetmst.item_no = itemloc.item_no
//													and sheetmst.qa = itemloc.qa
//													and sheetmst.loc_no = itemloc.loc_no), 0 )
//	
//	where itemloc.item_no like 'M%';
//
//	update item set item.qoh = isnull((select sum(coilmst.unit_qty * coilmst.qcnt) 												
//												  from coilmst	
//												 where open_close <> 'C'	
//													and coilmst.item_no = item.item_no
//													and coilmst.qa = item.qa), 0 )
//	where item.item_no like 'M%';	
//
//	update item set item.qoh = isnull((select sum(sheetmst.qcnt) 												
//												  from sheetmst	
//												 where open_close <> 'C'	
//													and substring(sheetmst.item_no,4,1) = '2'
//													and sheetmst.item_no = item.item_no
//													and sheetmst.qa = item.qa), 0 )
//	where item.item_no like 'M%';	
//
//
end event

type pb_print_part from w_inheritance`pb_print_part within w_iractio_new_m_new
boolean visible = false
integer x = 2487
integer y = 424
integer width = 343
integer height = 92
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "다중추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;// 다중추가
long   ll_row, ll_cnt
string ls_location
gs_where2 lstr_where

dw_2.accepttext()

ls_location = trim(dw_2.object.loc_no[1])
if trim(ls_location) = '' or isnull(ls_location) then
	messagebox("확인","저장소를 선택하십시요")
	return
end if

lstr_where.chk = 'M' // M:nulti S:Single
lstr_where.chk1 = ls_location
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_2.accepttext()
dw_1.accepttext()

dw_1.setredraw(false)
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(dw_1.getrow())
	dw_1.object.item_no[ll_cnt]     = trim(lstr_where.str1[ll_row])
	dw_1.object.qa[ll_cnt]          = trim(lstr_where.str2[ll_row])
	dw_1.object.uom[ll_cnt]       = trim(lstr_where.str3[ll_row])
	dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])

	dw_1.object.pre_qty[ll_cnt] = 0
	dw_1.object.plus_qty[ll_cnt] = 0
	dw_1.object.minus_qty[ll_cnt] = 0
	dw_1.object.stock_qty[ll_cnt] = 0
	
next

dw_1.scrolltorow(ll_cnt)
idwc_qa.setfilter("item_no = '" + dw_1.object.item_no[ll_cnt] + "'")
idwc_qa.filter()
dw_1.setcolumn('silsa_qty')
dw_1.setfocus()
dw_1.setredraw(true)


end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_iractio_new_m_new
integer x = 4805
integer y = 56
integer taborder = 330
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iractio_new_m_new
integer x = 4224
integer y = 56
integer taborder = 350
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_location, ls_year, ls_code, ls_name

ls_location = trim(dw_2.object.loc_no[1])
if isnull(ls_location) then
	MessageBox('오류','저장소를 선택하십시오.',exclamation!)
	return	
end if

ls_year = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)

choose case rb_1.checked		// 코드
	case true
		ls_code = sle_1.text + "%"
		ls_name = "%"
	case else
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
end choose

dw_4.retrieve(ls_location, ls_year , '%', '%')

w_repsuper w_print
 
i_print.st_datawindow  = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 실사목록 리스트를 출력합니다." 
//i_print.name = 'd_irincoun_r'

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=71'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)
end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"실사목록",parent, li_x, li_y)


end event

type pb_cancel from w_inheritance`pb_cancel within w_iractio_new_m_new
boolean visible = false
integer x = 4265
integer y = 1436
integer width = 251
integer height = 92
integer taborder = 360
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "정렬"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::mousemove;call super::mousemove;//
end event

event pb_cancel::clicked;
dw_1.setsort('item_no , qa')
dw_1.sort()
end event

type pb_delete from w_inheritance`pb_delete within w_iractio_new_m_new
boolean visible = false
integer x = 5810
integer y = 64
integer taborder = 440
boolean enabled = false
end type

event pb_delete::clicked;//
if dw_1.getrow() < 1 then return

dw_1.accepttext()
dw_1.deleterow(dw_1.getrow())

end event

type pb_insert from w_inheritance`pb_insert within w_iractio_new_m_new
integer x = 4032
integer y = 56
integer taborder = 460
end type

event pb_insert::clicked;// 다중추가
long   ll_row, ll_cnt
string ls_location, ls_yyyymm, ls_loc_name
gs_where2 lstr_where

dw_2.accepttext()

ls_location = trim(dw_2.object.loc_no[1])
ls_yyyymm = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)

if trim(ls_location) = '' or isnull(ls_location) then
	messagebox("확인","저장소를 선택하십시요")
	return
end if

lstr_where.chk = 'M' // M:nulti S:Single
lstr_where.chk1 = ls_location
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_2.accepttext()
dw_1.accepttext()

dw_1.setredraw(false)

for ll_row = 1 to UpperBound(lstr_where.str1)	
	
	ll_cnt = dw_1.insertrow(dw_1.getrow())
	dw_1.object.item_no[ll_cnt]     = trim(lstr_where.str1[ll_row])
	dw_1.object.qa[ll_cnt]          = trim(lstr_where.str2[ll_row])
	dw_1.object.uom[ll_cnt]       = trim(lstr_where.str3[ll_row])
	dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
	dw_1.object.loc_no[ll_cnt] = trim(lstr_where.chk1)
	
	select loc_name
	  into :ls_loc_name
	from location 
	where loc_no = rtrim(:lstr_where.chk1);
	
	
	dw_1.object.loc_name[ll_cnt] = ls_loc_name
	dw_1.object.yyyymm[ll_cnt] = ls_yyyymm
	dw_1.object.close_yn[ll_cnt] = 'O'	

	dw_1.object.erp_pre_qty[ll_cnt] = 0
	dw_1.object.erp_plus_qty[ll_cnt] = 0
	dw_1.object.erp_minus_qty[ll_cnt] = 0
	dw_1.object.stock_qty[ll_cnt] = 0
	
next

dw_1.scrolltorow(ll_cnt)
idwc_qa.setfilter("item_no = '" + dw_1.object.item_no[ll_cnt] + "'")
idwc_qa.filter()
dw_1.setcolumn('silsa_qty')
dw_1.setfocus()
dw_1.setredraw(true)


//long ll_row
//string ls_item_no, ls_location
//
//dw_2.accepttext()
//dw_1.accepttext()
//
//ls_location = trim(dw_2.object.loc_no[1])
//if trim(ls_location) = '' or isnull(ls_location) then
//	messagebox("확인","저장소를 선택하십시요")
//	return
//end if
//
//if dw_1.getrow() < 1 then
//	ll_row = 0
//else
//	ll_row = dw_1.getrow() + 1
//end if 
//
//dw_1.getchild("item_no", idwc_item)
//gs_ds_itemall.ShareData(idwc_item)
//
//dw_1.getchild("qa", idwc_qa)
//gs_ds_qaall.ShareData(idwc_qa)
//
//ll_row = dw_1.insertrow(ll_row)
//dw_1.setredraw(false)
//
//if ll_row > 1 then
//	ls_item_no = dw_1.object.item_no[ll_row]
//	
//	dw_1.getchild("qa", idwc_qa)
//	
//	gs_ds_qaall.ShareData(idwc_qa)
//	idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//	idwc_qa.filter()
//end if
//
//dw_1.scrolltorow(ll_row)
//
//dw_1.setcolumn('silsa_qty')
//dw_1.setfocus()
//dw_1.setredraw(true)




end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iractio_new_m_new
integer x = 3840
integer y = 56
integer taborder = 450
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_year, ls_mon, ls_day, ls_date, ls_location, ls_code, ls_name, ls_factory
long  l_count 

ls_click = 'normal'

dw_2.accepttext() 

ls_location = trim(dw_2.object.loc_no[1])
ls_factory = trim(ddlb_gubun.text)

if isnull(ls_location) then
	MessageBox('오류','저장소를 선택하십시오.',exclamation!)
	return	
end if

ls_year = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)

pb_retrieve.default = false
dw_1.reset()
dw_4.reset()

choose case rb_1.checked		// 코드
	case true
		ls_code = sle_1.text + "%"
		ls_name = "%"
	case else
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
end choose

/*2018.09.27 jowonsuk 마감이 있으면 wf_silsa_create() 반영 안함 */

l_count = 0;

select COUNT(*)
INTO :l_count
from silsa_itemstock				
where yyyymm =  convert(char(6), convert(datetime, :ls_year+'01' ),112)
and loc_no like :ls_location
and ISNULL(close_yn,'O') = 'C'; /*상태값 : O:재고조정전, I:재고조정후, C:마감  */

if l_count = 0 then
	wf_silsa_create()
end if	


/*2018.09.27 JOWONSUK 조회로직 변경 속도 느려 변경, 조건중에서 공장별 조회 조건과 구분해서 DATAWINDOW를 만들어 조회*/

//dw_1.getchild("item_no", idwc_item)
//gs_ds_itemall.ShareData(idwc_item)
//dw_1.getchild("qa", idwc_qa)
//idwc_qa.insertrow(1)

dw_1.SetRedraw(FALSE)
dw_1.retrieve(ls_location, ls_year , ls_code, ls_name, ls_factory)
dw_1.SetRedraw(TRUE)

if rb_10.checked then
	dw_1.setfilter(" p4 in ( '1', '2' ) ")
elseif rb_11.checked then	
	dw_1.setfilter(" p4 in ( '0', '5', '8', 'A', 'C', 'G', 'M', 'P', 'S', 'U', 'Z') ")	
elseif rb_12.checked then	
	dw_1.setfilter(" p4 in ( '0', '1', '2', '5', '8', 'A', 'C', 'G', 'M', 'P', 'S', 'U', 'Z') ")
end if

dw_1.filter()

//dw_1.sharedata(dw_4)
dw_1.setcolumn( "silsa_qty")
dw_1.setfocus()
end event

type gb_3 from w_inheritance`gb_3 within w_iractio_new_m_new
integer x = 4238
integer y = 1372
integer width = 2176
integer height = 176
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iractio_new_m_new
integer x = 1326
integer y = 8
integer width = 2469
integer height = 212
integer taborder = 100
integer textsize = -9
long textcolor = 16711680
string text = "실사월"
end type

type gb_1 from w_inheritance`gb_1 within w_iractio_new_m_new
integer x = 3813
integer y = 8
integer width = 1413
integer height = 212
integer taborder = 50
integer textsize = -10
end type

type dw_2 from w_inheritance`dw_2 within w_iractio_new_m_new
integer x = 2706
integer y = 84
integer width = 1006
integer height = 84
integer taborder = 70
string dataobject = "d_irsilsainput_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;string ls_defloc

//dw_1.reset()
this.accepttext( )

//if this.object.loc_no[row]  = '%' then
//	cb_1.enabled = false
//	cb_6.enabled = false	
//	pb_save.enabled = false
//else
//	cb_1.enabled = true
//	cb_6.enabled = true
//	pb_save.enabled = true	
//end if

// 저장소
SELECT def_loc INTO :ls_defloc FROM AREA WHERE area_no = :gs_area;

if GF_PERMISSION("실사마감(재고조정)마감권한", gs_userid) = "Y" then	
	cb_7.enabled = true
	cb_8.enabled = true
	cb_1.enabled  = false
	cb_6.enabled  = false		
	pb_save.enabled    = false		// 저장

	dw_2.insertrow(0)
	dw_2.object.loc_no[1] = '%'
else		
	cb_7.enabled = false
	cb_8.enabled = false
	cb_1.enabled  = true	
	cb_6.enabled  = true
	pb_save.enabled    = true		
	
	dw_2.insertrow(0)
	dw_2.object.loc_no[1] = ls_defloc 	
end if 
end event

type gb_7 from groupbox within w_iractio_new_m_new
integer x = 32
integer y = 236
integer width = 1577
integer height = 180
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "재무재고조사표출력"
end type

type gb_4 from groupbox within w_iractio_new_m_new
integer x = 2414
integer y = 236
integer width = 841
integer height = 172
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "재고조정"
end type

type sle_1 from singlelineedit within w_iractio_new_m_new
boolean visible = false
integer x = 4462
integer y = 1228
integer width = 617
integer height = 84
integer taborder = 320
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;pb_retrieve.DEFAULT = true

end event

type rb_1 from radiobutton within w_iractio_new_m_new
boolean visible = false
integer x = 4247
integer y = 1216
integer width = 210
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "코드"
boolean checked = true
end type

event clicked;dw_1.setsort ( "itemloc_item_no , itemloc_qa")
dw_1.Sort( )

end event

type rb_2 from radiobutton within w_iractio_new_m_new
boolean visible = false
integer x = 4247
integer y = 1272
integer width = 210
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "명"
end type

event clicked;dw_1.setsort ( "groupitem_item_name, itemloc_qa")
dw_1.Sort( )

end event

type em_1 from editmask within w_iractio_new_m_new
integer x = 1358
integer y = 84
integer width = 498
integer height = 84
integer taborder = 340
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = trim(message.stringparm)
end if

end event

type dw_3 from datawindow within w_iractio_new_m_new
integer x = 2656
integer y = 1208
integer width = 1481
integer height = 1072
integer taborder = 110
boolean bringtotop = true
boolean titlebar = true
string title = "저장소 실사일자"
string dataobject = "d_loc_countday"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_iractio_new_m_new
boolean visible = false
integer x = 2930
integer y = 448
integer width = 603
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "실사일자 보기"
boolean automatic = false
end type

event clicked;// 실사일자 보기
string ls_location

dw_2.accepttext() 
ls_location = trim(dw_2.object.loc_no[1])

dw_3.reset()
dw_3.visible = false

if this.checked = true then
	dw_3.retrieve(ls_location)
	dw_3.visible = true
end if

end event

type hpb_1 from hprogressbar within w_iractio_new_m_new
boolean visible = false
integer x = 4142
integer y = 236
integer width = 585
integer height = 80
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_3 from statictext within w_iractio_new_m_new
integer x = 59
integer y = 460
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

type ddlb_fld from dropdownlistbox within w_iractio_new_m_new
integer x = 247
integer y = 444
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_iractio_new_m_new
integer x = 288
integer y = 456
integer width = 311
integer height = 88
integer taborder = 110
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

type st_2 from statictext within w_iractio_new_m_new
integer x = 745
integer y = 460
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

type ddlb_op from dropdownlistbox within w_iractio_new_m_new
integer x = 914
integer y = 444
integer width = 297
integer height = 512
integer taborder = 110
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

type sle_value from singlelineedit within w_iractio_new_m_new
integer x = 1234
integer y = 452
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

type cb_2 from commandbutton within w_iractio_new_m_new
integer x = 1806
integer y = 452
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_iractio_new_m_new
integer x = 1970
integer y = 452
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_iractio_new_m_new
integer x = 2135
integer y = 452
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_iractio_new_m_new
integer x = 2299
integer y = 452
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_1 from commandbutton within w_iractio_new_m_new
integer x = 2469
integer y = 288
integer width = 366
integer height = 92
integer taborder = 330
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고조정"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////  
// ineoymu(담당자별실사)를 ineoym(저장소월별 물품재고)으로 sum함
// UPDATE ineoym 
//    SET ineoym.qoh = (SELECT isnull(sum(ineoymu.qoh),0) 
//                        FROM ineoymu 
//                       WHERE ineoym.cyear   = ineoymu.cyear 
//                         AND ineoym.cmon    = ineoymu.cmon
//                         AND ineoym.item_no = ineoymu.item_no 
//                         AND ineoym.qa      = ineoymu.qa
//                         AND ineoym.loc_no  = ineoymu.loc_no)
//  WHERE ineoym.cyear = '2003' 
//    AND ineoym.cmon  = '08' ;
///////////////////////////////////////////////////////////////////////////////  

dwItemStatus l_status
real     lr_countqoh,  lr_mqty, lr_locqoh, lr_stock
long     ll_row,  ll_cnt,  ll_ycnt,   ll_count, i_count
string   ls_loc,  ls_item,  ls_qa, ls_year, ls_mon, ls_day, ls_date, ls_old_time
string   ls_chk1_user, ls_chk2_user, ls_sqlerrtext
datetime ldt_date, ldt_time, ldt_countdate, ldt_inaudit_date
string arg_loc_no, arg_yyyymm, ls_user_id, ls_magam_yn
string 		ls_loc_no, ls_ITEM_NO,  LS_TYPE,  ls_order_no, ls_serial_id, ls_close_yn, ls_factory
decimal L_RX_qty, L_LX_qty, l_unit_qty,  l_cnt,  l_com_qty, l_gab_qty

arg_loc_no = trim(dw_2.object.loc_no[1])
arg_yyyymm = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)
ls_factory = trim(ddlb_gubun.text)

/*2019-08-27 jowonsuk 속도가 느려 프로시져 대체 */
//DECLARE silsa_itemstock_cursor CURSOR FOR 
//select convert(char(10), dateadd(day, -1, dateadd(month, 1, convert(datetime, :arg_yyyymm+'01') )),112) yyyymm, 
//              a.loc_no, 
//              a.item_no,
//               a.qa, 
//                ( case when ISNULL(a.silsa_qty,0) - isnull(erp.stock_qty,0) > 0 then 'RX' 
//                           when ISNULL(a.silsa_qty,0) - isnull(erp.stock_qty,0) <  0 then 'IX' 
//                          else '' end ) INAUDIT_TYPE,
//              ( case when ISNULL(a.silsa_qty,0) - isnull(erp.stock_qty,0) > 0 then  abs(ISNULL(a.silsa_qty,0) -  isnull(erp.stock_qty,0)) else  0 end ) rcpt_qty,
//              ( case when ISNULL(a.silsa_qty,0) - isnull(erp.stock_qty,0) < 0 then  abs(ISNULL(a.silsa_qty,0) -  isnull(erp.stock_qty,0)) else  0 end ) issue_qty,
//                user_id,
//	            		'RXIX'+:arg_yyyymm order_no
//from silsa_itemstock  a	left outer join (
//													 SELECT  YYYYMM, LOC_NO, ITEM_NO, QA, ERP_PRE_QTY, ERP_PLUS_QTY, ERP_MINUS_QTY, STOCK_QTY
//													FROM UF_SILSA_INAUDIT(:arg_yyyymm, '%')
//												) erp on a.yyyymm = erp.yyyymm and a.loc_no = erp.loc_no and a.item_no = erp.item_no and a.qa = erp.qa		
//								inner join financial_location b with(nolock) on a.loc_no = b.loc_no and b.area_name = :ls_factory
//where a.yyyymm = :arg_yyyymm
//     /*and (case when :gs_userid = '1999010s' then '1999010s' else  a.user_id end) = :gs_userid*/ /* 2019.06.07 jowonsuk 전산관리자는 재고조정과 마감을 할 수 있게 할 수 있다. */
//	and ISNULL(a.close_yn, 'O') = 'O'
//      and abs(ISNULL(a.silsa_qty,0) -  isnull(erp.stock_qty,0) ) <> 0;


dw_1.accepttext()
//if dw_1.modifiedcount() > 0 then
//   MessageBox("확인", "저장 후에 작업 하십시요")
//   RETURN
//end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "U", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 저장소
dw_2.accepttext()		

ll_row      = dw_1.rowcount()
ls_loc      = trim(dw_2.object.loc_no[1])
ls_date     = ls_year + ls_mon + ls_day
ldt_date    = datetime(date(em_1.text))

ls_old_time = string(now(),'hh:mm:ss:fff')

setnull(ls_chk1_user) ; setnull(ls_chk2_user)

//hpb_1.width    = ddlb_2.width
//hpb_1.position = 0
//hpb_1.visible  = true
//
//   for ll_count = 1 to 100000
//      if ls_old_time <> string(now(),'hh:mm:ss:fff') then
//         ls_old_time  = string(now(),'hh:mm:ss:fff')   
//         EXIT
//      end if
//   next
	
if MessageBox("확인", MidA(arg_yyyymm,1,4) + "년 " + MidA(arg_yyyymm,5,2) + " 월 실사재고를 현재고로 반영 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
	
	/*2018.09.13 JOWONSUK 마감여부체크 로직 반영 */
	ls_magam_yn = 'Y';
	
	SELECT mmagam.magam_yn
	     into :ls_magam_yn
	FROM mmagam
     Where mmagam.yyyymm = :arg_yyyymm
	and  mmagam.sys_gb  = '00'; /*수불*/

	
	IF ls_magam_yn = 'Y' then 
		messagebox('알림','월마감되었습니다. 전산팀에 마감해제를 요청해 주세요.')
		return 0
	end if
	
	
	DECLARE dt_silsa_itemstock_run procedure for dt_silsa_itemstock_run :arg_yyyymm, :ls_factory, :gs_userid using sqlca;
	
	EXECUTE dt_silsa_itemstock_run ;
	
	if sqlca.sqlcode > 0 then
			
	else
		messagebox('오류','생성시 오류가 있습니다.')
	end if
	
	CLOSE dt_silsa_itemstock_run;
	COMMIT using sqlca;	
	
//	i_count = 0;
//	
//	select COUNT(*)
//	INTO :i_count
//	from silsa_itemstock				
//	where yyyymm = convert(char(6),  dateadd(month, -1, convert(datetime, :arg_yyyymm+'01' ) ),112)
//	and loc_no = :ls_loc
//	and ISNULL(close_yn,'O') = 'C'; /*상태값 : O:재고조정전, I:재고조정후, C:마감  */

/*2019-08-27 jowonsuk 속도가 너무 느려 프로시져로 대체 */
//	OPEN silsa_itemstock_cursor;
//
//		FETCH silsa_itemstock_cursor INTO :ldt_inaudit_date, :ls_loc_no, :ls_ITEM_NO, :ls_QA, :LS_TYPE,  :L_RX_qty, :L_LX_qty, :ls_user_id, :ls_order_no;
//
//		Do While sqlca.sqlcode = 0	
//		
//			 INSERT INTO inaudit ( inaudit_time, inaudit_date, 		  inaudit_item,     qa,        loc_no,		   inaudit_type,   order_no,       rcpt_qty,     issue_qty,  cost,    destination,        serial_id,         rem,       	unit_qty,     cnt,      com_qty,     user_id )
//		 			           VALUES ( getdate(),     :ldt_inaudit_date,    :ls_item_no,     :ls_QA, :ls_loc_no,        :ls_type,         :ls_order_no,  :L_RX_qty, :L_LX_qty,  0, 		:ls_loc_no, 		:ls_serial_id,   '실사보정작업', 	:l_unit_qty,  :l_cnt,  :l_com_qty, :ls_user_id  );
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
//				update silsa_itemstock
//					set   plus_qty =  :L_RX_qty,
//						   minus_qty = :L_LX_qty,
//						   close_yn = 'I'					/*상태값 : O:재고조정전, I:재고조정후, C:마감  */
//				where yyyymm = :arg_yyyymm
//				and loc_no = :ls_loc_no
//				and item_no = :ls_ITEM_NO
//				and qa = :ls_QA
//				and user_id = :ls_user_id;
//					 
//					 
//			if sqlca.sqlcode < 0 then
//				ls_sqlerrtext = string(sqlca.sqlerrtext)
//				ROLLBACK;				
//				MessageBox('오류32','[pb_save][silsa_itemstock] update중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
//				RETURN 0
//			end if						
//		
//				
//			FETCH silsa_itemstock_cursor INTO :ldt_inaudit_date, :ls_loc_no, :ls_ITEM_NO, :ls_QA, :LS_TYPE,  :L_RX_qty, :L_LX_qty, :ls_user_id, :ls_order_no;
//		
////			i_count = i_count + 1;
//			
//		Loop
//		
//	
//	CLOSE silsa_itemstock_cursor;
//			  
//	commit;
//
////	MessageBox("확인",string(i_count) + "건 실사작업 집계작업 완료!!!" )
//
//	update silsa_itemstock
//		 SET  close_yn = 'I'					/*상태값 : O:재고조정전, I:재고조정후, C:마감  */
//	where yyyymm = :arg_yyyymm
//	  and loc_no in (
//							  select loc_no
//								from financial_location
//								where area_name = :ls_factory
//	  				    )
//	/*and loc_no = :arg_loc_no
//	and (case when :gs_userid = '1999010s' then '1999010s' else  user_id end ) = :gs_userid*/
//	and isnull(close_yn, 'O') = 'O';
	
	COMMIT;
	
	MessageBox("확인","실사작업 집계작업 완료!!!" )	
		
end if


//wf_update1( dw_1, 'Y' );

//if ls_click = 'normal' then
	pb_retrieve.PostEvent(Clicked!)
//else
//	pb_retrieve1.PostEvent(Clicked!)
//end if

end event

type cb_6 from commandbutton within w_iractio_new_m_new
integer x = 2834
integer y = 288
integer width = 366
integer height = 92
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////  
// ineoymu(담당자별실사)를 ineoym(저장소월별 물품재고)으로 sum함
// UPDATE ineoym 
//    SET ineoym.qoh = (SELECT isnull(sum(ineoymu.qoh),0) 
//                        FROM ineoymu 
//                       WHERE ineoym.cyear   = ineoymu.cyear 
//                         AND ineoym.cmon    = ineoymu.cmon
//                         AND ineoym.item_no = ineoymu.item_no 
//                         AND ineoym.qa      = ineoymu.qa
//                         AND ineoym.loc_no  = ineoymu.loc_no)
//  WHERE ineoym.cyear = '2003' 
//    AND ineoym.cmon  = '08' ;
///////////////////////////////////////////////////////////////////////////////  

dwItemStatus l_status
string arg_loc_no, arg_yyyymm, ls_magam_yn
string ls_loc_no, ls_date, ls_item_no, ls_qa, ls_type, ls_order_no, ls_destination, ls_serial_id, ls_rem, ls_factory
string ls_sqlerrtext
long l_id, ll_row, i_count
decimal l_rcpt_qty, l_issue_qty, l_unit_qty, l_cnt, l_com_qty, l_cost
datetime ldt_date, ldt_inaudit_date

arg_loc_no = trim(dw_2.object.loc_no[1])
arg_yyyymm = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)
ls_factory = trim(ddlb_gubun.text)


declare inaudit_add_cursor cursor for
SELECT dateadd(day, -1, dateadd(month, 1, convert(datetime, :arg_yyyymm+'01') )) inaudit_date, 
			a.item_no, 
			a.qa, 
			a.loc_no, 
			(case when a.plus_qty > 0 then 'RX' else 'IX' end ) inaudit_type,  
          		'RXIX'+:arg_yyyymm order_no,			
			a.plus_qty*(-1) RX_QTY, 
			a.minus_qty*(-1) LX_QTY
	FROM  silsa_itemstock a inner join financial_location b with(nolock) on a.loc_no = b.loc_no and b.area_name = :ls_factory
 where a.yyyymm = :arg_yyyymm
/*	and a.loc_no = :ls_loc_no*/
/*	 and user_id = :gs_userid*/
	/*and (case when :gs_userid = '1999010s' then '1999010s' else  user_id end ) = :gs_userid*/ /* 2019.06.07 jowonsuk 전산관리자는 재고조정과 마감을 할 수 있게 할 수 있다. */
	 and ISNULL(close_yn,'O') = 'I'
and abs(plus_qty) + abs(minus_qty) <> 0;

dw_1.accepttext()
if dw_1.modifiedcount() > 0 then
   MessageBox("확인", "재 조회후에 작업 하십시요")
   RETURN
end if


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "U", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 저장소
dw_2.accepttext()		

ll_row      = dw_1.rowcount()
ls_loc_no      = trim(dw_2.object.loc_no[1])
ldt_date    = datetime(date(em_1.text))

/*2018.09.13 JOWONSUK 마감여부체크 로직 반영 */
ls_magam_yn = 'Y';

SELECT mmagam.magam_yn
	  into :ls_magam_yn
  FROM mmagam
  Where mmagam.yyyymm = :arg_yyyymm
       and  mmagam.sys_gb  = '00'; /*수불*/


IF ls_magam_yn = 'Y' then 
	messagebox('알림','월마감되었습니다. 전산팀에 마감해제를 요청해 주세요.')
	return 0
end if


if MessageBox("확인", MidA(arg_yyyymm,1,4) + "년 " + MidA(arg_yyyymm,5,2) + " 월 실사재고계산을 취소 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then

	  OPEN inaudit_add_cursor;

		FETCH inaudit_add_cursor INTO :ldt_inaudit_date, :ls_ITEM_NO, :ls_QA, :ls_loc_no, :LS_TYPE, :ls_order_no,  :l_rcpt_qty, :l_issue_qty;

		Do While sqlca.sqlcode = 0	
		
			 INSERT INTO inaudit ( inaudit_time, inaudit_date,		  inaudit_item,     qa,     	loc_no,			 inaudit_type, order_no,       rcpt_qty,     issue_qty,     cost,    destination,       serial_id,         rem,       		  unit_qty,     cnt,      com_qty,     user_id )
		 			           VALUES ( getdate(),     :ldt_inaudit_date,    :ls_ITEM_NO,  :ls_QA,   :ls_loc_no,     	:ls_type,        :ls_order_no,  :l_rcpt_qty, :l_issue_qty, :l_cost, :ls_destination, :ls_serial_id,   '실사보정취소', :l_unit_qty,  :l_cnt,  :l_com_qty, :gs_userid  );
					 
					 
			if sqlca.sqlcode < 0 then
				ls_sqlerrtext = string(sqlca.sqlerrtext)
				ROLLBACK;				
				MessageBox('오류32','[pb_save][inaudit] insert중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
				RETURN 0
			end if					 
		
				
		FETCH inaudit_add_cursor INTO :ldt_inaudit_date, :ls_item_no, :ls_qa, :ls_loc_no, :LS_TYPE, :ls_order_no,  :l_rcpt_qty, :l_issue_qty;
			
		Loop
		
	
	CLOSE inaudit_add_cursor;
			  		
end if


 update silsa_itemstock
	 set plus_qty = 0,
		  minus_qty = 0,
		  close_yn = 'O' 
 where yyyymm = :arg_yyyymm
	  and loc_no in (
							  select loc_no
								from financial_location
								where area_name = :ls_factory
	  				    ) 
/*	 and loc_no = :ls_loc_no   */
/*	 and user_id = :gs_userid  */
/*	 and  (case when :gs_userid = '1999010s' then '1999010s' else  user_id end ) = :gs_userid*/ /* 2019.06.07 jowonsuk 전산관리자는 재고조정과 마감을 할 수 있게 할 수 있다. */
	 and ISNULL(close_yn,'O') = 'I';	 
	 

commit;

//if ls_click = 'normal' then
	pb_retrieve.PostEvent(Clicked!)
//else
//	pb_retrieve1.PostEvent(Clicked!)
//end if

MessageBox("확인", " 작업을 완료 했습니다!!!" )
end event

type st_4 from statictext within w_iractio_new_m_new
integer x = 1673
integer y = 292
integer width = 265
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388736
long backcolor = 67108864
string text = "담당자"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_iractio_new_m_new
integer x = 1943
integer y = 284
integer width = 425
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_12 from statictext within w_iractio_new_m_new
integer x = 4082
integer y = 332
integer width = 2935
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 255
long backcolor = 79741120
string text = "※ 화면에서 담당자란에 작업자가 등록된것만 실사재고 반영 되므로 담당자 등록 중요!!!"
boolean focusrectangle = false
end type

type cb_9 from commandbutton within w_iractio_new_m_new
integer x = 1243
integer y = 276
integer width = 320
integer height = 112
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재무엑셀"
end type

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
string  ls_location, ls_yyyymm, ls_gubun, ls_location_name
integer ls_Value,   li_Pos,   li_value

long    ll_cnt
//DataWindow dwxls

ls_yyyymm = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)
//ls_location = trim(dw_2.object.loc_no[1])
ls_location = trim(ddlb_gubun.text)

//if ls_location = 'WS00000000' then
	dwxls.dataobject=  'd_iractio_new_excel'
//else
//	dwxls.dataobject=  'd_iractio_new_excel1'	
//end if

dwxls.SetTransObject(sqlca)

//ls_location_name = '전체' /*추가  JOWONSUK */
//ls_location = '%'

if rb_10.checked then
	ls_gubun = '1'	
	ls_location_name = '코일쉬트'
elseif rb_11.checked then
	ls_gubun = '2'		
	ls_location_name = '제품상품자재'
elseif rb_12.checked then
	ls_gubun = '%'		
	ls_location_name = '전체'
end if 

dwxls.retrieve(ls_location, ls_yyyymm, ls_gubun)


ls_Docname = '재무재고조사표_'+ ls_location_name + '_' + ls_location + '_' + ls_yyyymm


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
else
	MessageBox("확인","data가 없습니다.")
end if	
end event

type dwxls from datawindow within w_iractio_new_m_new
boolean visible = false
integer x = 1029
integer y = 180
integer width = 210
integer height = 100
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_iractio_new_excel"
boolean livescroll = true
end type

type rb_10 from radiobutton within w_iractio_new_m_new
integer x = 814
integer y = 300
integer width = 384
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
string text = "코일,쉬트"
end type

type rb_11 from radiobutton within w_iractio_new_m_new
integer x = 279
integer y = 300
integer width = 539
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
string text = "제품/상품/자재"
end type

type ddlb_gubun from dropdownlistbox within w_iractio_new_m_new
integer x = 2139
integer y = 84
integer width = 498
integer height = 648
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
string item[] = {"시화공장","화성공장(YSP)","화성공장(송천)","동부영업소","화곡영업소","대전영업소"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_name, ls_doc_no, ls_where

ls_name = this.text 

DECLARE csr_ct_code01 CURSOR FOR
select '%' loc_no from dual
union all
 select loc_no
 from financial_location
 where area_name like :ls_name;
 
 OPEN csr_ct_code01;

do while sqlca.sqlcode = 0	
	
	FETCH csr_ct_code01 INTO :ls_doc_no;
	if SQLCA.SQLCODE < 0 then		
		return
	elseif SQLCA.SQLCODE = 100 then
		exit
	end if
	
     ls_where = ls_where + "'" + ls_doc_no + "',"

loop

close csr_ct_code01;

ls_where = MidA(ls_where,1, LenA(ls_where)-1)

idwc_loc.setfilter("loc_no in ( " + ls_where + " )")
idwc_loc.filter()
idwc_loc.sort()
end event

type pb_retrieve1 from picturebutton within w_iractio_new_m_new
boolean visible = false
integer x = 5358
integer y = 60
integer width = 155
integer height = 136
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
boolean originalsize = true
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;string ls_location, ls_yyyymm, ls_gubun[]
string ls_year, ls_mon, ls_day, ls_date, ls_code, ls_name
long   l_count

ls_click = 'not normal'

dw_2.accepttext() 

ls_year = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)
ls_location = trim(ddlb_gubun.text)

pb_retrieve.default = false
dw_1.reset()
dw_4.reset()

choose case rb_1.checked		// 코드
	case true
		ls_code = sle_1.text + "%"
		ls_name = "%"
	case else
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
end choose


/*2018.09.27 jowonsuk 마감이 있으면 wf_silsa_create() 반영 안함 */
l_count = 0;

select COUNT(*)
INTO :l_count
from silsa_itemstock a inner join financial_location b with(nolock) on a.loc_no = b.loc_no
where a.yyyymm =  convert(char(6), convert(datetime, :ls_year+'01' ),112)
and rtrim(ltrim(b.area_name)) like :ls_location
and ISNULL(a.close_yn,'O') = 'C'; /*상태값 : O:재고조정전, I:재고조정후, C:마감  */

if l_count = 0 then
	wf_silsa_create()
end if	

/*2018.09.27 JOWONSUK 조회로직 변경 속도 느려 변경, 조건중에서 공장별 조회 조건과 구분해서 DATAWINDOW를 만들어 조회*/
dw_1.SetRedraw(FALSE)
dw_1.retrieve('%', ls_year , ls_code, ls_name, ls_location)
dw_1.SetRedraw(TRUE)

if rb_10.checked then
	dw_1.setfilter(" p4 in ( '0', '5', '8', 'A', 'C', 'G', 'M', 'P', 'S', 'U', 'Z') ")
elseif rb_11.checked then	
	dw_1.setfilter(" p4 in ('1', '2' ) ")	
elseif rb_12.checked then	
	dw_1.setfilter(" p4 in ( '0', '1', '2', '5', '8', 'A', 'C', 'G', 'M', 'P', 'S', 'U', 'Z') ")
end if

dw_1.filter()

//dw_1.sharedata(dw_4)
dw_1.setcolumn( "silsa_qty" )
dw_1.setfocus()
end event

type rb_12 from radiobutton within w_iractio_new_m_new
integer x = 59
integer y = 300
integer width = 215
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
string text = "전체"
boolean checked = true
end type

type dw_4 from datawindow within w_iractio_new_m_new
integer x = 37
integer y = 168
integer width = 128
integer height = 64
integer taborder = 20
string dataobject = "d_silsa_print"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_iractio_new_m_new
event mousemove pbm_mousemove
integer x = 4617
integer y = 56
integer width = 187
integer height = 144
integer taborder = 330
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
DataWindow dw_xls

//if cbx_stock.checked = true then
//	dwxls = dw_2
//else
	dw_xls = dw_1
//end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_xls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_xls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type cb_10 from commandbutton within w_iractio_new_m_new
integer x = 5006
integer y = 60
integer width = 183
integer height = 140
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "도움말"
end type

event clicked;//
string ls_msg

ls_msg  = "1.담당자가 작업자와 동일한지 담당자 확인~n"
ls_msg += "2.실사재고란에 실사량을 등록하고, 작업자와 담당자가~n"
ls_msg += "   동일하게 반영되는지 확인~n"
ls_msg += "   (담당자란만 더블 클릭하면 작업자 이름이 자동등록되며, ~n"
ls_msg += "    다시 더블클릭하면 해제된다.)~n "
ls_msg += "3.담당자에 해당하는 물품의 실사재고를 전부 등록하고~n"
ls_msg += "   저장 버튼을 클릭~n"
ls_msg += "4.재고조정버튼을 클릭하면 실사재고량으로 erp재고가 맞춰진다.~n"
ls_msg += "5.재고조정후, 변경 사항 발생시에 재고조정 취소하고, ~n"
ls_msg += "   2번, 3번, 4번 작업을 반복한다.~n"

MessageBox("확인",ls_msg)


end event

type cb_7 from commandbutton within w_iractio_new_m_new
integer x = 3287
integer y = 288
integer width = 366
integer height = 92
integer taborder = 350
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "마감"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////  
// ineoymu(담당자별실사)를 ineoym(저장소월별 물품재고)으로 sum함
// UPDATE ineoym 
//    SET ineoym.qoh = (SELECT isnull(sum(ineoymu.qoh),0) 
//                        FROM ineoymu 
//                       WHERE ineoym.cyear   = ineoymu.cyear 
//                         AND ineoym.cmon    = ineoymu.cmon
//                         AND ineoym.item_no = ineoymu.item_no 
//                         AND ineoym.qa      = ineoymu.qa
//                         AND ineoym.loc_no  = ineoymu.loc_no)
//  WHERE ineoym.cyear = '2003' 
//    AND ineoym.cmon  = '08' ;
///////////////////////////////////////////////////////////////////////////////  

dwItemStatus l_status
string arg_loc_no, arg_yyyymm
string ls_loc_no, ls_date, ls_item_no, ls_qa, ls_loc, ls_factory
string ls_sqlerrtext
long l_id, ll_row, i_count
decimal l_rcpt_qty, l_issue_qty
datetime ldt_date, ldt_inaudit_date

arg_loc_no = trim(dw_2.object.loc_no[1])
arg_yyyymm = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)
ls_factory = trim(ddlb_gubun.text)

dw_1.accepttext()
if dw_1.modifiedcount() > 0 then
   MessageBox("확인", "재 조회후에 작업 하십시요")
   RETURN
end if


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "U", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 저장소
dw_2.accepttext()		

ll_row      = dw_1.rowcount()
ls_loc_no  = trim(dw_2.object.loc_no[1])
ldt_date    = datetime(date(em_1.text))

update  silsa_itemstock
set close_yn = 'C'
where yyyymm = :arg_yyyymm
  and loc_no in (
						  select loc_no
							from financial_location
							where area_name = :ls_factory
					 )
and close_yn <> 'C';

if ls_click = 'normal' then
	pb_retrieve.PostEvent(Clicked!)
else
	pb_retrieve1.PostEvent(Clicked!)
end if
end event

type cb_8 from commandbutton within w_iractio_new_m_new
integer x = 3653
integer y = 288
integer width = 366
integer height = 92
integer taborder = 360
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "마감취소"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////  
// ineoymu(담당자별실사)를 ineoym(저장소월별 물품재고)으로 sum함
// UPDATE ineoym 
//    SET ineoym.qoh = (SELECT isnull(sum(ineoymu.qoh),0) 
//                        FROM ineoymu 
//                       WHERE ineoym.cyear   = ineoymu.cyear 
//                         AND ineoym.cmon    = ineoymu.cmon
//                         AND ineoym.item_no = ineoymu.item_no 
//                         AND ineoym.qa      = ineoymu.qa
//                         AND ineoym.loc_no  = ineoymu.loc_no)
//  WHERE ineoym.cyear = '2003' 
//    AND ineoym.cmon  = '08' ;
///////////////////////////////////////////////////////////////////////////////  

dwItemStatus l_status
string arg_loc_no, arg_yyyymm
string ls_loc_no, ls_date, ls_item_no, ls_qa, ls_loc, ls_factory
string ls_sqlerrtext
long l_id, ll_row, i_count
decimal l_rcpt_qty, l_issue_qty
datetime ldt_date, ldt_inaudit_date

arg_loc_no = trim(dw_2.object.loc_no[1])
arg_yyyymm = MidA(em_1.text,1,4)+MidA(em_1.text,6,2)
ls_factory = trim(ddlb_gubun.text)

dw_1.accepttext()
if dw_1.modifiedcount() > 0 then
   MessageBox("확인", "재 조회후에 작업 하십시요")
   RETURN
end if


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "U", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 저장소
dw_2.accepttext()		

ll_row      = dw_1.rowcount()
ls_loc_no      = trim(dw_2.object.loc_no[1])
ldt_date    = datetime(date(em_1.text))


update  silsa_itemstock
set close_yn = 'I'
where yyyymm = :arg_yyyymm
and loc_no like :arg_loc_no
and user_id is not null
and silsa_qty is not null
and close_yn = 'C';

commit;

update  silsa_itemstock
set close_yn = 'O'
where yyyymm = :arg_yyyymm
  and loc_no in (
					  select loc_no
						from financial_location
						where area_name = :ls_factory
				    )
and user_id is null
and close_yn = 'C';

commit;

if ls_click = 'normal' then
	pb_retrieve.PostEvent(Clicked!)
else
	pb_retrieve1.PostEvent(Clicked!)
end if
end event

type st_1 from statictext within w_iractio_new_m_new
integer x = 1893
integer y = 88
integer width = 242
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "공장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_iractio_new_m_new
integer x = 3264
integer y = 236
integer width = 805
integer height = 172
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "마감"
end type

type gb_6 from groupbox within w_iractio_new_m_new
integer x = 32
integer y = 396
integer width = 4110
integer height = 168
integer taborder = 330
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

