$PBExportHeader$w_irbatchstock_m.srw
$PBExportComments$시화공장 재고(BATCH TIME)
forward
global type w_irbatchstock_m from w_inheritance
end type
type dw_3 from datawindow within w_irbatchstock_m
end type
type em_1 from editmask within w_irbatchstock_m
end type
type ddlb_dwtitles from dropdownlistbox within w_irbatchstock_m
end type
type st_4 from statictext within w_irbatchstock_m
end type
type ddlb_op from dropdownlistbox within w_irbatchstock_m
end type
type sle_value from singlelineedit within w_irbatchstock_m
end type
type cb_1 from commandbutton within w_irbatchstock_m
end type
type cb_2 from commandbutton within w_irbatchstock_m
end type
type cb_3 from commandbutton within w_irbatchstock_m
end type
type cb_5 from commandbutton within w_irbatchstock_m
end type
type ddlb_fld from dropdownlistbox within w_irbatchstock_m
end type
type st_7 from statictext within w_irbatchstock_m
end type
type dw_area from datawindow within w_irbatchstock_m
end type
type cbx_iall from checkbox within w_irbatchstock_m
end type
type cbx_i01 from checkbox within w_irbatchstock_m
end type
type cbx_i02 from checkbox within w_irbatchstock_m
end type
type cbx_i03 from checkbox within w_irbatchstock_m
end type
type cbx_i04 from checkbox within w_irbatchstock_m
end type
type cbx_i05 from checkbox within w_irbatchstock_m
end type
type cbx_i06 from checkbox within w_irbatchstock_m
end type
type cbx_i07 from checkbox within w_irbatchstock_m
end type
type cbx_oall from checkbox within w_irbatchstock_m
end type
type cbx_o01 from checkbox within w_irbatchstock_m
end type
type cbx_o02 from checkbox within w_irbatchstock_m
end type
type cbx_o03 from checkbox within w_irbatchstock_m
end type
type cbx_o04 from checkbox within w_irbatchstock_m
end type
type cbx_o05 from checkbox within w_irbatchstock_m
end type
type cbx_o06 from checkbox within w_irbatchstock_m
end type
type cbx_o07 from checkbox within w_irbatchstock_m
end type
type cbx_o08 from checkbox within w_irbatchstock_m
end type
type cbx_o09 from checkbox within w_irbatchstock_m
end type
type gb_4 from groupbox within w_irbatchstock_m
end type
type gb_5 from groupbox within w_irbatchstock_m
end type
type gb_6 from groupbox within w_irbatchstock_m
end type
type pb_1 from picturebutton within w_irbatchstock_m
end type
type pb_multi from picturebutton within w_irbatchstock_m
end type
type cbx_iotype from checkbox within w_irbatchstock_m
end type
type st_1 from statictext within w_irbatchstock_m
end type
type st_5 from statictext within w_irbatchstock_m
end type
type st_6 from statictext within w_irbatchstock_m
end type
type pb_ewol from picturebutton within w_irbatchstock_m
end type
type cb_4 from commandbutton within w_irbatchstock_m
end type
type st_2 from statictext within w_irbatchstock_m
end type
type st_9 from statictext within w_irbatchstock_m
end type
type cbx_stock from checkbox within w_irbatchstock_m
end type
type cbx_qoh from checkbox within w_irbatchstock_m
end type
type cbx_savestock from checkbox within w_irbatchstock_m
end type
type st_8 from statictext within w_irbatchstock_m
end type
type dw_4 from datawindow within w_irbatchstock_m
end type
type cbx_1 from checkbox within w_irbatchstock_m
end type
type dw_5 from datawindow within w_irbatchstock_m
end type
type cbx_source from checkbox within w_irbatchstock_m
end type
type st_3 from statictext within w_irbatchstock_m
end type
type cbx_op from checkbox within w_irbatchstock_m
end type
type st_10 from statictext within w_irbatchstock_m
end type
type cbx_cqty from checkbox within w_irbatchstock_m
end type
type dw_6 from datawindow within w_irbatchstock_m
end type
type cbx_2 from checkbox within w_irbatchstock_m
end type
type cbx_user from checkbox within w_irbatchstock_m
end type
type cbx_all from checkbox within w_irbatchstock_m
end type
type hpb_1 from hprogressbar within w_irbatchstock_m
end type
end forward

global type w_irbatchstock_m from w_inheritance
integer width = 4823
integer height = 2604
string title = "BatchTime 재고(w_irbatchstock_m)"
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
cbx_iall cbx_iall
cbx_i01 cbx_i01
cbx_i02 cbx_i02
cbx_i03 cbx_i03
cbx_i04 cbx_i04
cbx_i05 cbx_i05
cbx_i06 cbx_i06
cbx_i07 cbx_i07
cbx_oall cbx_oall
cbx_o01 cbx_o01
cbx_o02 cbx_o02
cbx_o03 cbx_o03
cbx_o04 cbx_o04
cbx_o05 cbx_o05
cbx_o06 cbx_o06
cbx_o07 cbx_o07
cbx_o08 cbx_o08
cbx_o09 cbx_o09
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
pb_1 pb_1
pb_multi pb_multi
cbx_iotype cbx_iotype
st_1 st_1
st_5 st_5
st_6 st_6
pb_ewol pb_ewol
cb_4 cb_4
st_2 st_2
st_9 st_9
cbx_stock cbx_stock
cbx_qoh cbx_qoh
cbx_savestock cbx_savestock
st_8 st_8
dw_4 dw_4
cbx_1 cbx_1
dw_5 dw_5
cbx_source cbx_source
st_3 st_3
cbx_op cbx_op
st_10 st_10
cbx_cqty cbx_cqty
dw_6 dw_6
cbx_2 cbx_2
cbx_user cbx_user
cbx_all cbx_all
hpb_1 hpb_1
end type
global w_irbatchstock_m w_irbatchstock_m

type variables
//
DataWindow idw_view
DataWindowChild idwc_area, idwc_locno, idwc_wcno, idwc_qa, idwc_stock

string is_itemno, is_qa, is_dw
string is_ritype, is_rtype, is_itype	// 입,출고 형태


end variables

on w_irbatchstock_m.create
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
this.cbx_iall=create cbx_iall
this.cbx_i01=create cbx_i01
this.cbx_i02=create cbx_i02
this.cbx_i03=create cbx_i03
this.cbx_i04=create cbx_i04
this.cbx_i05=create cbx_i05
this.cbx_i06=create cbx_i06
this.cbx_i07=create cbx_i07
this.cbx_oall=create cbx_oall
this.cbx_o01=create cbx_o01
this.cbx_o02=create cbx_o02
this.cbx_o03=create cbx_o03
this.cbx_o04=create cbx_o04
this.cbx_o05=create cbx_o05
this.cbx_o06=create cbx_o06
this.cbx_o07=create cbx_o07
this.cbx_o08=create cbx_o08
this.cbx_o09=create cbx_o09
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
this.pb_1=create pb_1
this.pb_multi=create pb_multi
this.cbx_iotype=create cbx_iotype
this.st_1=create st_1
this.st_5=create st_5
this.st_6=create st_6
this.pb_ewol=create pb_ewol
this.cb_4=create cb_4
this.st_2=create st_2
this.st_9=create st_9
this.cbx_stock=create cbx_stock
this.cbx_qoh=create cbx_qoh
this.cbx_savestock=create cbx_savestock
this.st_8=create st_8
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.cbx_source=create cbx_source
this.st_3=create st_3
this.cbx_op=create cbx_op
this.st_10=create st_10
this.cbx_cqty=create cbx_cqty
this.dw_6=create dw_6
this.cbx_2=create cbx_2
this.cbx_user=create cbx_user
this.cbx_all=create cbx_all
this.hpb_1=create hpb_1
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
this.Control[iCurrent+14]=this.cbx_iall
this.Control[iCurrent+15]=this.cbx_i01
this.Control[iCurrent+16]=this.cbx_i02
this.Control[iCurrent+17]=this.cbx_i03
this.Control[iCurrent+18]=this.cbx_i04
this.Control[iCurrent+19]=this.cbx_i05
this.Control[iCurrent+20]=this.cbx_i06
this.Control[iCurrent+21]=this.cbx_i07
this.Control[iCurrent+22]=this.cbx_oall
this.Control[iCurrent+23]=this.cbx_o01
this.Control[iCurrent+24]=this.cbx_o02
this.Control[iCurrent+25]=this.cbx_o03
this.Control[iCurrent+26]=this.cbx_o04
this.Control[iCurrent+27]=this.cbx_o05
this.Control[iCurrent+28]=this.cbx_o06
this.Control[iCurrent+29]=this.cbx_o07
this.Control[iCurrent+30]=this.cbx_o08
this.Control[iCurrent+31]=this.cbx_o09
this.Control[iCurrent+32]=this.gb_4
this.Control[iCurrent+33]=this.gb_5
this.Control[iCurrent+34]=this.gb_6
this.Control[iCurrent+35]=this.pb_1
this.Control[iCurrent+36]=this.pb_multi
this.Control[iCurrent+37]=this.cbx_iotype
this.Control[iCurrent+38]=this.st_1
this.Control[iCurrent+39]=this.st_5
this.Control[iCurrent+40]=this.st_6
this.Control[iCurrent+41]=this.pb_ewol
this.Control[iCurrent+42]=this.cb_4
this.Control[iCurrent+43]=this.st_2
this.Control[iCurrent+44]=this.st_9
this.Control[iCurrent+45]=this.cbx_stock
this.Control[iCurrent+46]=this.cbx_qoh
this.Control[iCurrent+47]=this.cbx_savestock
this.Control[iCurrent+48]=this.st_8
this.Control[iCurrent+49]=this.dw_4
this.Control[iCurrent+50]=this.cbx_1
this.Control[iCurrent+51]=this.dw_5
this.Control[iCurrent+52]=this.cbx_source
this.Control[iCurrent+53]=this.st_3
this.Control[iCurrent+54]=this.cbx_op
this.Control[iCurrent+55]=this.st_10
this.Control[iCurrent+56]=this.cbx_cqty
this.Control[iCurrent+57]=this.dw_6
this.Control[iCurrent+58]=this.cbx_2
this.Control[iCurrent+59]=this.cbx_user
this.Control[iCurrent+60]=this.cbx_all
this.Control[iCurrent+61]=this.hpb_1
end on

on w_irbatchstock_m.destroy
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
destroy(this.cbx_iall)
destroy(this.cbx_i01)
destroy(this.cbx_i02)
destroy(this.cbx_i03)
destroy(this.cbx_i04)
destroy(this.cbx_i05)
destroy(this.cbx_i06)
destroy(this.cbx_i07)
destroy(this.cbx_oall)
destroy(this.cbx_o01)
destroy(this.cbx_o02)
destroy(this.cbx_o03)
destroy(this.cbx_o04)
destroy(this.cbx_o05)
destroy(this.cbx_o06)
destroy(this.cbx_o07)
destroy(this.cbx_o08)
destroy(this.cbx_o09)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.pb_1)
destroy(this.pb_multi)
destroy(this.cbx_iotype)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.pb_ewol)
destroy(this.cb_4)
destroy(this.st_2)
destroy(this.st_9)
destroy(this.cbx_stock)
destroy(this.cbx_qoh)
destroy(this.cbx_savestock)
destroy(this.st_8)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.cbx_source)
destroy(this.st_3)
destroy(this.cbx_op)
destroy(this.st_10)
destroy(this.cbx_cqty)
destroy(this.dw_6)
destroy(this.cbx_2)
destroy(this.cbx_user)
destroy(this.cbx_all)
destroy(this.hpb_1)
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

// 분류
dw_1.getchild("save_stock", idwc_stock)
idwc_stock.settransobject(sqlca)
idwc_stock.retrieve("SAVE_STOCK")

dw_1.object.user_id.TabSequence = 0 		// 담당자
dw_1.object.save_stock.TabSequence = 0		// 분류
dw_1.object.safety_stock.TabSequence = 0	// 안전재고

/////////////////////////////////
// 사업장
/////////////////////////////////
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = " "

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_area.object.area[1] = gs_area		// 기본값을 변경	
dw_area.accepttext()

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

//////////////////////////////////////////////////////////
// 기본사업장에 다수의 저장소 존재시(기본저장소)			
//////////////////////////////////////////////////////////
string ls_area, ls_locno, ls_loc

ls_area = gs_area

SELECT rtrim(bigo) INTO :ls_loc FROM codemst 
 WHERE type = '사업장기본저장소' AND item_cd = :gs_userid AND use_yn = 'Y';
if isnull(ls_loc) OR ls_loc = "" then
	SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :ls_area;
	if isnull(ls_loc) or ls_loc = "" then ls_loc = "WS00000000"		// 시화저장소
end if

idwc_locno.setfilter( "area_no = '" + gs_area + "'" )
idwc_locno.filter()

dw_3.object.loc_no[1] = ls_loc
dw_3.accepttext()
//////////////////////////////////////////////////////////	

cbx_all.enabled   = false			// 전체품목
cbx_user.enabled  = false			// 담당자변경
cbx_savestock.enabled = false  	// 분류/안전재고
cbx_qoh.enabled   = false  		// 전산재고 => 실사재고 반영
cbx_cqty.enabled  = false        // 실사재고 => 전산재고 반영

pb_multi.enabled  = false  		// 다중추가
pb_ewol.enabled   = false 			// 전일재고 집계작업
pb_save.enabled   = false 			// 저장
pb_delete.enabled = false 			// 삭제

// 배치재고_관리
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '배치재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" OR ls_locno = ls_loc then
	cbx_user.enabled  = true		// 담당자변경
	cbx_savestock.enabled = true  // 분류/안전재고
	cbx_qoh.enabled   = true  		// 전산재고 => 실사재고 반영
	cbx_cqty.enabled  = true  		// 실사재고 => 전산재고 반영
	
	pb_multi.enabled  = true  		// 다중추가
	pb_ewol.enabled   = true 		// 전일재고 집계작업
	pb_save.enabled   = true 		// 저장
	pb_delete.enabled = true 		// 삭제
end if	


//if dw_area.event itemchanged(1, dw_area.object.area, "S0001") = 1 then
//	dw_area.event itemerror( 1, dw_area.object.area, "S0001" )
//end if





/*
SELECT loc_no    = a.loc_no  
     , item_no   = a.item_no 
     , item_nm   = b.item_name
     , qa        = a.qa      
     , cdate     = a.cdate
     , qoh       = (case when seq = '1' then a.qoh else 0 end)
     , in_qty    = a.in_qty  
     , out_qty   = a.out_qty 
     , bigo      = a.bigo
     , key_no    = a.key_no
     , tbl_name  = a.tbl_name
  FROM ( /*전월이월수량[재고조사량]*/
       SELECT seq       = '1'
            , loc_no    = y.loc_no 
            , item_no   = y.item_no  
            , qa        = y.qa       
            , cdate     = '이월수량' 
            , qoh       = isnull(y.qoh, 0)     
            , in_qty    = 0
            , out_qty   = 0
            , bigo      = ''
            , key_no    = ''
            , tbl_name  = 'INEOYM'
         FROM ineoym y
        WHERE y.cyear       = convert(char(4), datepart(year, :as_sdate))
          AND y.cmon        = right('00' + convert(char(2),dateadd(month, -1, :as_sdate)),2)
          AND y.loc_no   LIKE :as_locno

       UNION ALL
       SELECT seq       = '2'   
            , loc_no    = b.loc_no
            , item_no   = b.item_no
            , qa        = b.qa
            , cdate     = b.cdate
            , qoh       = 0
            , in_qty    = b.in_qty          /* 당월 1일 부터 현재까지 */
            , out_qty   = b.out_qty
            , bigo      = b.bigo
            , key_no    = b.key_no
            , tbl_name  = b.tbl_name
         FROM ( /* 입고 : 생산입고, 대체입고, 저장소이동입고, 반품입고, 무상입고, 가공입고, 가입고 */
                /* 출고 : 정상출고, 대체출고, 저장소이동출고, 샘플출고, 폐기,     가공출고, 작업일보사용, 재고생산출고*/
                /* 재고조정(감모손실), 물품대체 ? */ 
               SELECT loc_no      = d.loc_no
                    , item_no     = d.assembly    
                    , qa          = d.assembly_qa 
                    , cdate       = convert(char(10),d.sfc_date,111)
                    , in_qty      = d.make_qty
                    , out_qty     = 0
                    , bigo        = '생산입고'
                    , key_no      = d.order_no
                    , tbl_name    = 'SFCDAY'
                 FROM sfcday D
                WHERE convert(char(10),d.sfc_date,111)  = :as_sdate
                  AND d.loc_no   LIKE :as_locno
                  
               UNION ALL
               SELECT loc_no      = d.tar_loc
                    , item_no     = d.tar_item 
                    , qa          = d.tar_qa   
                    , cdate       = convert(char(10),d.alter_date,111)
                    , in_qty      = isnull(d.tar_qty, 0)
                    , out_qty     = 0
                    , bigo        = '대체입고'
                    , key_no      = d.order_no
                    , tbl_name    = 'ITEMALTER'
                 FROM itemalter D
                WHERE convert(char(10),d.alter_date,111)  = :as_sdate
                  AND d.tar_loc   LIKE :as_locno
               
               UNION ALL
               SELECT loc_no      = h.ask_loc
                    , item_no     = d.item_no 
                    , qa          = d.qa      
                    , cdate       = convert(char(10),d.rlse_date,111)
                    , in_qty      = isnull(d.rlse_qty, 0)
                    , out_qty     = 0
                    , bigo        = '저장소이동입고'
                    , key_no      = d.ask_no
                    , tbl_name    = 'ASK_DET'
                 FROM ask_head H
                    , ask_det  D
                WHERE h.ask_no          = d.ask_no
                  AND convert(char(10),d.rlse_date,111) = :as_sdate
                  AND h.ask_loc      LIKE :as_locno
               
               UNION ALL
               SELECT loc_no      = d.loc_no
                    , item_no     = d.item_no 
                    , qa          = d.qa      
                    , cdate       = convert(char(10),h.issue_date,111)
                    , in_qty      = isnull(d.ship_qty, 0) * -1
                    , out_qty     = 0
                    , bigo        = '반품입고'
                    , key_no      = d.do_no
                    , tbl_name    = 'DODET'
                 FROM do    H
                    , dodet D
                WHERE h.do_no           = d.do_no
                  AND h.do_case         = 'D'
                  AND convert(char(10),h.issue_date,111) = :as_sdate
                  AND d.loc_no          = :as_locno
                 
               UNION ALL
               SELECT loc_no      = d.loc_no 
                    , item_no     = d.item_no 
                    , qa          = d.qa      
                    , cdate       = convert(char(10),h.ret_date,111)
                    , in_qty      = isnull(d.free_qty, 0)
                    , out_qty     = 0
                    , bigo        = '무상입고'
                    , key_no      = d.ret_no
                    , tbl_name    = 'RETDET'
                 FROM ret    H
                    , retdet D
                WHERE convert(char(10),h.ret_date,111)    = :as_sdate
                  AND h.ret_no          = d.ret_no
                  AND h.process_flag NOT IN ('O', 'Y')
                  AND d.loc_no          = :as_locno
              
               UNION ALL
               SELECT loc_no      = d.loc_no
                    , item_no     = d.item_no
                    , qa          = d.qa     
                    , cdate       = convert(char(10),h.insp_date,111)
                    , in_qty      = isnull(d.rcpt_qty, 0)
                    , out_qty     = 0
                    , bigo        = '가공입고'
                    , key_no      = D.INSP_NO
                    , tbl_name    = 'INSPDET'
                 FROM insp    H
                    , inspdet D
                WHERE convert(char(10),h.insp_date,111) = :as_sdate
                  AND h.insp_no         = d.insp_no
                  AND d.loc_no          = :as_locno
              
               UNION ALL
               SELECT loc_no      = h.loc_no
                    , item_no     = h.item_no 
                    , qa          = h.qa      
                    , cdate       = convert(char(10),h.intemp_date,111)
                    , in_qty      = isnull(h.qty, 0)
                    , out_qty     = 0
                    , bigo        = '가입고'
                    , key_no      = h.intemp_no
                    , tbl_name    = 'INTEMP'
                 FROM intemp H
                WHERE convert(char(10),h.intemp_date,111) = :as_sdate
                  AND h.loc_no          = :as_locno
                
               UNION ALL
               SELECT loc_no      = d.loc_no
                    , item_no     = d.item_no
                    , qa          = d.qa     
                    , cdate       = convert(char(10),h.issue_date,111)
                    , in_qty      = 0
                    , out_qty     = isnull(d.ship_qty, 0)
                    , bigo        = '정상출고'
                    , key_no      = d.do_no
                    , tbl_name    = 'DODET'
                 FROM do    H
                    , dodet D
                WHERE convert(char(10),h.issue_date,111) = :as_sdate
                  AND h.do_no           = d.do_no
                  AND h.do_case        IN ('A', 'B', 'C')
                  AND d.loc_no          = :as_locno
              
               UNION ALL
               SELECT loc_no      = d.src_loc
                    , item_no     = d.src_item 
                    , qa          = d.src_qa   
                    , cdate       = convert(char(10),d.alter_date,111)
                    , in_qty      = 0
                    , out_qty     = isnull(d.src_qty, 0)
                    , bigo        = '대체출고'
                    , key_no      = d.order_no
                    , tbl_name    = 'ITEMALTER'
                 FROM itemalter D
                WHERE convert(char(10),d.alter_date,111) = :as_sdate
                  AND d.issue_flag      = 'Y'
                  AND d.src_loc         = :as_locno
              
               UNION ALL
               SELECT loc_no      = d.loc_no
                    , item_no     = d.item_no 
                    , qa          = d.qa      
                    , cdate       = convert(char(10),d.rlse_date,111)
                    , in_qty      = 0
                    , out_qty     = isnull(d.rlse_qty, 0)
                    , bigo        = '저장소이동출고'
                    , key_no      = d.ask_no
                    , tbl_name    = 'ASK_DET'
                 FROM ask_head H
                    , ask_det  D
                WHERE h.ask_no          = d.ask_no
                  AND convert(char(10),d.rlse_date,111) = :as_sdate
                  AND d.loc_no          = :as_locno
                 
               UNION ALL
               SELECT loc_no      = d.loc_no
                    , item_no     = d.item_no 
                    , qa          = d.qa      
                    , cdate       = convert(char(10),h.order_date,111)
                    , in_qty      = 0
                    , out_qty     = isnull(d.issue_qty, 0)
                    , bigo        = '샘플출고'
                    , key_no      = d.samp_no
                    , tbl_name    = 'SAMPDET'
                 FROM samp    H
                    , sampdet D
                WHERE h.samp_no         = d.samp_no
                  AND convert(char(10),h.order_date,111) = :as_sdate
                  AND d.loc_no          = :as_locno
                
               UNION ALL
               SELECT loc_no      = h.loc_no
                    , item_no     = d.item_no  
                    , qa          = d.qa       
                    , cdate       = convert(char(10),h.aban_date,111)
                    , in_qty      = 0
                    , out_qty     = isnull(d.qty, 0)
                    , bigo        = '폐기'
                    , key_no      = d.aban_no
                    , tbl_name    = 'ITEMABANDET'
                 FROM itemaban    H
                    , itemabandet D
                WHERE convert(char(10),h.aban_date,111) = :as_sdate
                  AND h.loc_no          = :as_locno
                
               UNION ALL
               SELECT loc_no      = d.issue_loc
                    , item_no     = d.component    
                    , qa          = d.component_qa 
                    , cdate       = convert(char(10),d.issue_date,111)
                    , in_qty      = 0
                    , out_qty     = isnull(d.issue_qty, 0)
                    , bigo        = '가공출고'
                    , key_no      = d.order_no
                    , tbl_name    = 'SUDODET'
                 FROM sudodet D
                WHERE convert(char(10),d.issue_date,111) = :as_sdate
                  AND d.issue_loc       = :as_locno
                
               UNION ALL
               SELECT loc_no      = d.loc_no
                    , item_no     = d.item_no 
                    , qa          = d.qa      
                    , cdate       = convert(char(10),d.use_date,111)
                    , in_qty      = 0
                    , out_qty     = isnull(d.use_qty, 0)
                    , bigo        = '작업일보사용'
                    , key_no      = d.order_no
                    , tbl_name    = 'SFCUSE'
                 FROM sfcuse d
                WHERE convert(char(10),d.use_date,111) = :as_sdate
                  AND d.loc_no          = :as_locno
                
               UNION ALL
               SELECT loc_no      = d.issue_loc
                    , item_no     = d.assy_item 
                    , qa          = d.assy_qa   
                    , cdate       = convert(char(10),d.order_dt,111)
                    , in_qty      = 0
                    , qty         = isnull(d.out_qty, 0)
                    , bigo        = '재고생산출고'
                    , key_no      = d.order_no
                    , tbl_name    = 'JAJAESUDO'
                 FROM jajaesudo D
                WHERE convert(char(10),d.order_dt,111)  = :as_sdate
                  AND d.issue_loc       = :as_locno
              ) B
       ) A
        LEFT OUTER JOIN groupitem B  ON a.item_no = b.item_no
  ORDER BY a.loc_no
         , a.item_nm
         , a.qa
         , a.seq
         , a.cdate
*/
     
end event

event resize;call super::resize;//
gb_5.width  = newwidth  - (gb_5.x * 2)

hpb_1.width = newwidth  - (gb_5.x * 2)

gb_6.width  = newwidth  - (gb_5.x * 2)

dw_1.width  = newwidth  - (gb_5.x * 2)
dw_1.height = newheight - dw_1.y - gb_5.x

// 전일재고 집계(±7일)
dw_2.x      = dw_1.x
dw_2.y      = dw_1.y
dw_2.width  = dw_1.width
dw_2.height = dw_1.height

// 가용량
dw_4.width  = dw_1.width * 0.6
dw_4.height = dw_1.height* 0.7
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

type pb_save from w_inheritance`pb_save within w_irbatchstock_m
integer x = 4347
integer y = 76
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
if cbx_savestock.checked = true then cbx_savestock.checked = false

pb_retrieve.triggerevent( clicked! )

end event

type dw_1 from w_inheritance`dw_1 within w_irbatchstock_m
integer x = 32
integer y = 880
integer width = 4718
integer height = 1588
string dataobject = "d_irbatchstock_m1"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;//
//choose case dwo.name
//	case "safety_stock", "qoh", "ret_qty", "etc_qty"
//		this.SelectText(1, Len(this.GetText()) + 5)
//end choose

end event

event dw_1::rbuttondown;call super::rbuttondown;//
date   ld_start,  ld_end
string ls_itemnm, ls_itemno, ls_qa

if isnull(row) OR row < 1 then RETURN

string ls_edate, ls_sdate
SELECT top 1 convert(varchar(10), getdate(), 121),  convert(varchar(10), dateadd(day, -61, getdate()), 121)
  INTO :ls_edate, :ls_sdate
  FROM login;
  
ld_start = date(ls_sdate)
ld_end   = date(em_1.text)

ls_itemno = dw_1.object.item_no[dw_1.getrow()]
ls_itemnm = dw_1.object.item_name[dw_1.getrow()]
ls_qa     = dw_1.object.qa[dw_1.getrow()]


dw_4.reset()
dw_4.title = "가용량 확인: " + ls_itemnm + " | " + ls_qa

dw_4.setredraw( false )
dw_4.visible    = true 
dw_4.bringtotop = true
dw_4.retrieve('S0001', ld_start, ld_end, ls_itemno, ls_qa)
dw_4.setfilter('corder <> 0')
dw_4.filter()
dw_4.setredraw( true )

end event

event dw_1::itemchanged;call super::itemchanged;choose case dwo.name
	case "safety_stock", "qoh", "ret_qty", "etc_qty"
		this.SelectText(1, LenA(this.GetText()) + 5)
end choose
end event

type st_title from w_inheritance`st_title within w_irbatchstock_m
integer x = 41
integer y = 48
integer width = 1061
string text = "BATCH TIME 재고"
end type

type st_tips from w_inheritance`st_tips within w_irbatchstock_m
end type

type pb_compute from w_inheritance`pb_compute within w_irbatchstock_m
boolean visible = false
integer x = 4178
integer y = 252
integer height = 88
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

type pb_print_part from w_inheritance`pb_print_part within w_irbatchstock_m
boolean visible = false
integer x = 3982
integer y = 252
integer height = 88
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

type pb_close from w_inheritance`pb_close within w_irbatchstock_m
integer x = 4539
integer y = 76
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_irbatchstock_m
integer x = 4155
integer y = 76
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

type pb_cancel from w_inheritance`pb_cancel within w_irbatchstock_m
boolean visible = false
integer x = 4375
integer y = 252
integer height = 88
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

type pb_delete from w_inheritance`pb_delete within w_irbatchstock_m
integer x = 3963
integer y = 76
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

type pb_insert from w_inheritance`pb_insert within w_irbatchstock_m
boolean visible = false
integer x = 3534
integer y = 64
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_irbatchstock_m
integer x = 3575
integer y = 76
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_locno, ls_sdate, ls_edate, ls_year, ls_month, ls_defno, ls_mindate
string ls_itemno = "%", ls_qa = "%",  ls_rall, ls_iall,  ls_ralls[7], ls_ialls[9], ls_ritype, ls_rtype, ls_itype
long   ll_row, ll_cnt,  ll_iX

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( dw_1 )

dw_3.accepttext()			// 저장소
dw_area.accepttext()

ls_sdate = em_1.text
ls_edate = em_1.text

ls_area  = trim(dw_area.object.area[1])
if ls_area = "" then ls_area = "%"

ls_locno = trim(dw_3.object.loc_no[1])
if ls_locno = "" then
	ls_locno = "%"

	cbx_savestock.enabled = false  	// 분류/안전재고
	cbx_qoh.enabled   = false  		// 전산재고 => 현재고 만들기
	pb_multi.enabled  = false  		// 다중추가
	pb_ewol.enabled   = false 			// 전일재고 집계작업
	pb_save.enabled   = false 			// 저장
	pb_delete.enabled = false 			// 삭제

	MessageBox("확인", "전체저장소 는 작업을 할 수 없습니다.")
	RETURN
end if

// 기초재고 일자
SELECT Distinct top 1 convert(char(10),min(a.batchdate),111) INTO :ls_mindate
  FROM item_batchstock a 
 WHERE a.loc_no = :ls_locno GROUP BY a.batchdate;
if em_1.text < ls_mindate then 
	MessageBox("확인", "저장소의 기초재고 일자(" + ls_mindate + ")~n~n이전 자료는 조회할 수 없습니다.")
	RETURN
end if

if ls_area = "%" AND ls_locno = "%" then
else
	SELECT loc_no  INTO :ls_defno FROM location WHERE area_no = :ls_area AND loc_no = :ls_locno;
	if ls_defno <> ls_locno then
		MessageBox("확인", "사업장과 저장소가 일치하지 않습니다.")
		RETURN
	end if
end if

//// 입고
//if cbx_i01.checked = true then ls_ralls[1] = "Y"		// 생산
//if cbx_i02.checked = true then ls_ralls[2] = "Y"		// 대체
//if cbx_i03.checked = true then ls_ralls[3] = "Y"		// 저장소이동
//if cbx_i04.checked = true then ls_ralls[4] = "Y"		// 반품
//if cbx_i05.checked = true then ls_ralls[5] = "Y"		// 무상
//if cbx_i06.checked = true then ls_ralls[6] = "Y"		// 가공
//if cbx_i07.checked = true then ls_ralls[7] = "Y"		// 가입고
//for ll_iX = 1 to upperbound(ls_ralls)
//	if ls_ralls[ll_iX] = "Y" then
//		ls_rall = ls_rall + "Y"
//	else
//		ls_rall = ls_rall + "N"
//	end if
//next
//
///* 입고: 생산입고RW, 대체입고RA, 저장소이동입고RK, 반품입고RF, 무상입고RT, 가공입고RO,RP, 가입고  NYYYYNY  */
//ls_rtype = "'RX', "
//for ll_ix = 1 to 7
//	choose case ll_ix
//		case 1
//			ls_rtype = ls_rtype + "'RW', "
//		case 2
//			ls_rtype = ls_rtype + "'RA', "
//		case 3
//			ls_rtype = ls_rtype + "'RK', "
//		case 4
//			ls_rtype = ls_rtype + "'RF', "
//		case 5
//			ls_rtype = ls_rtype + "'RT', "
//		case 6
//			ls_rtype = ls_rtype + "'RO', 'RP', "
//		case 7
//			ls_rtype = ls_rtype + " "
//	end choose
//next
//if len(ls_rtype) > 1 then
//	ls_rtype = left(ls_rtype, len(ls_rtype) - 3)
//end if
//
//// 출고
//if cbx_o01.checked = true then ls_ialls[1] = "Y"		// 정상
//if cbx_o02.checked = true then ls_ialls[2] = "Y"		// 대체
//if cbx_o03.checked = true then ls_ialls[3] = "Y"		// 저장소이동
//if cbx_o04.checked = true then ls_ialls[4] = "Y"		// 샘플
//if cbx_o05.checked = true then ls_ialls[5] = "Y"		// 폐기
//if cbx_o06.checked = true then ls_ialls[6] = "Y"		// 가공
//if cbx_o07.checked = true then ls_ialls[7] = "Y"		// 가출고
//if cbx_o08.checked = true then ls_ialls[8] = "Y"		// 작업일보사용
//if cbx_o09.checked = true then ls_ialls[9] = "Y"		// 재고생산출고
//for ll_iX = 1 to upperbound(ls_ialls)
//	if ls_ialls[ll_iX] = "Y" then
//		ls_iall = ls_iall + "Y"
//	else
//		ls_iall = ls_iall + "N"
//	end if
//next
//
///* 출고: 정상출고IS, 대체출고IA, 저장소이동출고IK, 샘플출고IQ, 폐기IB, 가공출고IO,IP, 가출고, 작업일보사용IW, 재고생산출고 YYYYYNNN */
//ls_itype = ""
//for ll_ix = 1 to 9
//	choose case ll_ix
//		case 1
//			ls_itype = ls_itype + "'IS', "
//		case 2
//			ls_itype = ls_itype + "'IA', "
//		case 3
//			ls_itype = ls_itype + "'IK', "
//		case 4
//			ls_itype = ls_itype + "'IQ', "
//		case 5
//			ls_itype = ls_itype + "'IB', "
//		case 6
//			ls_itype = ls_itype + "'IO', 'IP', "
//		case 7
//			ls_itype = ls_itype + " "
//		case 8
//			ls_itype = ls_itype + "'IW', "
//		case 9
//			ls_itype = ls_itype + " "
//	end choose
//next
//if len(ls_itype) > 1 then
//	ls_itype = left(ls_itype, len(ls_itype) - 3)
//end if
//
//if len(ls_itype) > 1 then
//	ls_ritype = " iotype in ( " + ls_rtype + ", " + ls_itype + " ) "
//else
//	ls_ritype = " iotype in ( " + ls_rtype + " ) "
//end if
//is_ritype = ls_ritype

cbx_stock.checked = false
dw_1.visible = true
is_dw = "dw_1"
dw_1.reset()
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

////////////////////////////////////////////////////////////////////
dw_1.setredraw( false )
dw_1.retrieve( ls_locno, ls_sdate )		// 현재고

// 기초재고 이전자료 무시하기
if ls_sdate <= ls_mindate then
	for ll_row = 1 to dw_1.rowcount()
		dw_1.object.rcpt_qty[ll_row]   = 0
		dw_1.object.issue_qty[ll_row]  = 0
		dw_1.object.ret_qty[ll_row]    = 0
		dw_1.object.etc_qty[ll_row]    = 0
	next
end if

dw_1.setredraw( true )
////////////////////////////////////////////////////////////////////

SELECT count(*) INTO :ll_cnt FROM item_batchstock WHERE loc_no = :ls_locno AND batchdate = :ls_sdate + ' 00:00:00.000';
if ll_cnt < 1 then
	pb_ewol.setfocus()
	MessageBox("확인","전일재고 데이터가 존재하지 않습니다.~n~n'전일재고 집계작업'을 실행하시기 바랍니다.")
else
	MessageBox("확인","조회완료")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_irbatchstock_m
integer x = 3022
integer y = 16
integer width = 503
integer height = 232
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회일자"
end type

type gb_2 from w_inheritance`gb_2 within w_irbatchstock_m
integer x = 2103
integer y = 16
integer width = 896
integer height = 232
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_irbatchstock_m
integer x = 3543
integer y = 16
integer width = 1207
integer height = 232
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_irbatchstock_m
integer x = 878
integer y = 8
integer width = 128
integer height = 80
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

type dw_3 from datawindow within w_irbatchstock_m
integer x = 2130
integer y = 148
integer width = 846
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 저장소
dw_area.accepttext()
this.accepttext()

cbx_savestock.enabled = false  	// 분류/안전재고
cbx_qoh.enabled   = false  		// 전산재고 => 현재고 만들기
pb_multi.enabled  = false  		// 다중추가
pb_ewol.enabled   = false 			// 전일재고 집계작업
pb_save.enabled   = false 			// 저장
pb_delete.enabled = false 			// 삭제

debugbreak()

//////////////////////////////////////////////////////////
// 기본사업장에 다수의 저장소 존재시(기본저장소)			
//////////////////////////////////////////////////////////
string ls_area, ls_areachk, ls_locno, ls_loc

ls_loc  = data
//////////////////////////////////////////////////////////

// 배치재고_관리
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '배치재고_관리' AND item_cd = :gs_userid AND rtrim(bigo) = :ls_loc AND use_yn = 'Y';
if ls_locno = "ALL" then
	cbx_savestock.enabled = true  // 분류/안전재고
	cbx_qoh.enabled   = true  		// 전산재고 => 현재고 만들기
	pb_multi.enabled  = true  		// 다중추가
	pb_ewol.enabled   = true 		// 전일재고 집계작업
	pb_save.enabled   = true 		// 저장
	pb_delete.enabled = true 		// 삭제
else
	SELECT area_no INTO :ls_areachk FROM location WHERE loc_no = :ls_loc;
	if gs_area = ls_areachk then
		cbx_savestock.enabled = true  // 분류/안전재고
		cbx_qoh.enabled   = true  		// 전산재고 => 현재고 만들기
		pb_multi.enabled  = true  		// 다중추가
		pb_ewol.enabled   = true 		// 전일재고 집계작업
		pb_save.enabled   = true 		// 저장
		pb_delete.enabled = true 		// 삭제
	else
		if ls_loc = " " then MessageBox("확인","저장소를 선택하시기 바랍니다.")
	end if	
end if	

end event

type em_1 from editmask within w_irbatchstock_m
integer x = 3054
integer y = 112
integer width = 443
integer height = 80
integer taborder = 30
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

type ddlb_dwtitles from dropdownlistbox within w_irbatchstock_m
integer x = 283
integer y = 760
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

type st_4 from statictext within w_irbatchstock_m
integer x = 722
integer y = 764
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

type ddlb_op from dropdownlistbox within w_irbatchstock_m
integer x = 891
integer y = 748
integer width = 274
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_irbatchstock_m
integer x = 1184
integer y = 756
integer width = 535
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_irbatchstock_m
integer x = 1934
integer y = 756
integer width = 146
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

type cb_2 from commandbutton within w_irbatchstock_m
integer x = 2085
integer y = 756
integer width = 146
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

type cb_3 from commandbutton within w_irbatchstock_m
integer x = 2235
integer y = 756
integer width = 146
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_irbatchstock_m
integer x = 2386
integer y = 756
integer width = 146
integer height = 76
integer taborder = 110
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

type ddlb_fld from dropdownlistbox within w_irbatchstock_m
integer x = 251
integer y = 748
integer width = 443
integer height = 632
integer taborder = 90
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

type st_7 from statictext within w_irbatchstock_m
integer x = 2130
integer y = 64
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

type dw_area from datawindow within w_irbatchstock_m
integer x = 2341
integer y = 64
integer width = 549
integer height = 80
integer taborder = 70
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

cbx_all.enabled   = false			// 전체품목
cbx_savestock.enabled = false  	// 분류/안전재고
cbx_qoh.enabled   = false  		// 전산재고 => 현재고 만들기
pb_multi.enabled  = false  		// 다중추가
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

// 배치재고_관리
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '배치재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" then
	cbx_savestock.enabled = true  // 분류/안전재고
	cbx_qoh.enabled   = true  		// 전산재고 => 현재고 만들기
	
	pb_multi.enabled  = true  		// 다중추가
	pb_ewol.enabled   = true 		// 전일재고 집계작업
	pb_save.enabled   = true 		// 저장
	pb_delete.enabled = true 		// 삭제
else
	SELECT area_no INTO :ls_areachk FROM location WHERE loc_no = :ls_loc;
	if ls_area = ls_areachk then
		cbx_savestock.enabled = true  // 분류/안전재고
		cbx_qoh.enabled   = true  		// 전산재고 => 현재고 만들기
		
		pb_multi.enabled  = true  		// 다중추가
		pb_ewol.enabled   = true 		// 전일재고 집계작업
		pb_save.enabled   = true 		// 저장
		pb_delete.enabled = true 		// 삭제
	else
		MessageBox("확인","저장소를 선택하시기 바랍니다.")
	end if	
end if	

end event

event rowfocuschanged;// 사업장

dw_area.accepttext()

end event

type cbx_iall from checkbox within w_irbatchstock_m
integer x = 82
integer y = 340
integer width = 379
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "입고전체"
end type

event clicked;// 입고전체
string ls_area

ls_area = dw_area.object.area[1]

if this.checked = true then	
	cbx_i01.checked = false		// 생산
	cbx_i02.checked = true		// 대체
	cbx_i03.checked = true		// 저장소이동
	cbx_i04.checked = true		// 반품
	cbx_i05.checked = true		// 무상
	cbx_i06.checked = false		// 가공
	cbx_i07.checked = true		// 가입고
else
	cbx_i01.checked = false
	cbx_i02.checked = false
	cbx_i03.checked = false
	cbx_i04.checked = false
	cbx_i05.checked = false
	cbx_i06.checked = false
	cbx_i07.checked = false
end if

end event

type cbx_i01 from checkbox within w_irbatchstock_m
integer x = 503
integer y = 340
integer width = 293
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "생산"
boolean checked = true
end type

type cbx_i02 from checkbox within w_irbatchstock_m
integer x = 786
integer y = 340
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "대체"
boolean checked = true
end type

type cbx_i03 from checkbox within w_irbatchstock_m
integer x = 1079
integer y = 340
integer width = 453
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "요청, 이동"
boolean checked = true
end type

type cbx_i04 from checkbox within w_irbatchstock_m
integer x = 1527
integer y = 340
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "반품"
end type

type cbx_i05 from checkbox within w_irbatchstock_m
integer x = 1810
integer y = 340
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "무상"
end type

type cbx_i06 from checkbox within w_irbatchstock_m
integer x = 2103
integer y = 340
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "가공"
boolean checked = true
end type

type cbx_i07 from checkbox within w_irbatchstock_m
integer x = 2405
integer y = 340
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "기타입고"
end type

type cbx_oall from checkbox within w_irbatchstock_m
integer x = 82
integer y = 420
integer width = 384
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
string text = "출고전체"
end type

event clicked;// 출고전체
if this.checked = true then
	cbx_o01.checked = true		// 정상
	cbx_o02.checked = true		// 대체
	cbx_o03.checked = true		// 저장소이동
	cbx_o04.checked = true		// 샘플
	cbx_o05.checked = true		// 폐기
	cbx_o06.checked = false		// 가공
	cbx_o07.checked = true		// 가출고
	cbx_o08.checked = false		// 작업일보사용
	cbx_o09.checked = false		// 재고생산출고
else
	cbx_o01.checked = false
	cbx_o02.checked = false
	cbx_o03.checked = false
	cbx_o04.checked = false
	cbx_o05.checked = false
	cbx_o06.checked = false
	cbx_o07.checked = false
	cbx_o08.checked = false
	cbx_o09.checked = false
end if

end event

type cbx_o01 from checkbox within w_irbatchstock_m
integer x = 503
integer y = 420
integer width = 293
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
string text = "정상"
boolean checked = true
end type

type cbx_o02 from checkbox within w_irbatchstock_m
integer x = 786
integer y = 420
integer width = 293
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
string text = "대체"
boolean checked = true
end type

type cbx_o03 from checkbox within w_irbatchstock_m
integer x = 1079
integer y = 420
integer width = 453
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
string text = "요청, 이동"
boolean checked = true
end type

type cbx_o04 from checkbox within w_irbatchstock_m
integer x = 1527
integer y = 420
integer width = 293
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
string text = "샘플"
end type

type cbx_o05 from checkbox within w_irbatchstock_m
integer x = 1810
integer y = 420
integer width = 293
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
string text = "폐기"
end type

type cbx_o06 from checkbox within w_irbatchstock_m
integer x = 2103
integer y = 420
integer width = 293
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
string text = "가공"
end type

type cbx_o07 from checkbox within w_irbatchstock_m
integer x = 2405
integer y = 420
integer width = 352
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
string text = "출고의뢰"
end type

type cbx_o08 from checkbox within w_irbatchstock_m
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

type cbx_o09 from checkbox within w_irbatchstock_m
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

type gb_4 from groupbox within w_irbatchstock_m
integer x = 1600
integer y = 16
integer width = 485
integer height = 232
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_irbatchstock_m
integer x = 32
integer y = 276
integer width = 4718
integer height = 244
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "입,출고 형태"
end type

type gb_6 from groupbox within w_irbatchstock_m
integer x = 32
integer y = 704
integer width = 4718
integer height = 160
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_1 from picturebutton within w_irbatchstock_m
event mousemove pbm_mousemove
integer x = 3771
integer y = 76
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

if cbx_stock.checked = true then
	dwxls = dw_2
else
	dwxls = dw_1
end if

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

type pb_multi from picturebutton within w_irbatchstock_m
integer x = 4338
integer y = 744
integer width = 389
integer height = 104
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
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

type cbx_iotype from checkbox within w_irbatchstock_m
integer x = 64
integer y = 268
integer width = 526
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "입,출고 형태"
end type

event clicked;//
string ls_ritype

debugbreak()

if this.checked = true then
	cbx_iall.checked = true 
	cbx_iall.triggerevent( clicked! )
	cbx_oall.checked = true 
	cbx_oall.triggerevent( clicked! )
	
	ls_ritype = is_ritype
	dw_1.setfilter( ls_ritype ) 
else
	cbx_iall.checked = false 
	cbx_iall.triggerevent( clicked! )
	cbx_oall.checked = false 
	cbx_oall.triggerevent( clicked! )
	
	ls_ritype = ""
	dw_1.setfilter( ls_ritype ) 
end if
dw_1.filter()

end event

type st_1 from statictext within w_irbatchstock_m
integer x = 46
integer y = 564
integer width = 1582
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "1) 입고(+)는 가공입고나, 생산라인 등록시 발생"
boolean focusrectangle = false
end type

type st_5 from statictext within w_irbatchstock_m
integer x = 1627
integer y = 564
integer width = 1970
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "2) 출고(-)는 출고송장 발생시 생성됨(반품정리, 이월 제외)"
boolean focusrectangle = false
end type

type st_6 from statictext within w_irbatchstock_m
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
string text = "배치타임_재고"
boolean focusrectangle = false
end type

type pb_ewol from picturebutton within w_irbatchstock_m
integer x = 4050
integer y = 400
integer width = 677
integer height = 104
integer taborder = 290
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전일재고 집계작업"
vtextalign vtextalign = vcenter!
end type

event clicked;// 전일재고 집계작업
string  ls_area,  ls_sdate, ls_edate,  ls_errtext, ls_defno
string  ls_locno, ls_itemno, ls_qa,    ls_savestock, ls_userid
decimal ld_bqty,  ld_rqty,  ld_iqty,   ld_retqty,  ld_etcqty, ld_qoh, ld_safetystock
long    ll_row,   ll_cnt,   ll_icnt,   ll_ucnt

datetime ld_date

DEBUGBREAK()

dw_area.accepttext()
dw_3.accepttext()

// 전일
ls_sdate = string(RelativeDate(date(em_1.text),  -1), "yyyy/mm/dd")

ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]

SELECT rtrim(bigo) INTO :ls_defno FROM codemst 
 WHERE type = '배치재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_defno = "ALL" then
else
	if ls_locno = ls_defno then
	else
		MessageBox("확인", "배치재고_관리 의 저장소 권한이 존재하지 않습니다.")
		RETURN
	end if
end if

/////////////////////////////////////////////
// 시화사업장은 담당자별로 집계작업하기
/////////////////////////////////////////////
if ls_area = "S0001" then
	if cbx_all.checked = true then
		if MessageBox("확인", "시화사업장 전체 품목을 집계 작업합니다.~n~n" + &
		              "계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
			RETURN
		end if
	else
		if MessageBox("확인", "담당자 [" + gs_username + "] 의 품목만 집계 작업합니다.~n~n" + &
		              "계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
			RETURN
		end if
	end if
end if
MessageBox("확인", "[전일재고 집계작업]은~n~n"+ls_sdate+" 의 전산재고를 "+em_1.text+" 의 전일재고로 집계하는 작업입니다.")

///////////////////////////////////////////////////////////////////////
ll_row =	dw_1.retrieve( ls_locno, ls_sdate )		// 전일재고
///////////////////////////////////////////////////////////////////////
if ll_row < 1 then
	MessageBox("확인","해당하는 일자의 전일재고 데이터가 존재하지 않습니다.")
	RETURN
else
	if MessageBox("확인", ls_sdate + "일 전산재고를~n~r" + em_1.text + "일 전일재고로~n~n집계작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
		hpb_1.bringtotop = true
		hpb_1.visible    = true
		
		for ll_row = 1 to dw_1.rowcount()
			hpb_1.position = (ll_row / dw_1.rowcount()) * 100			

			ls_locno       = dw_1.object.loc_no[ll_row] 
			ld_date        = datetime(date(em_1.text), time("00:00:00.000"))	// dw_2.object.batchdate[ll_row] 
			ls_itemno      = dw_1.object.item_no[ll_row] 
			ls_qa          = dw_1.object.qa[ll_row] 
			ls_savestock   = dw_1.object.save_stock[ll_row] 
			ls_userid      = dw_1.object.user_id[ll_row] 
			ld_safetystock = dw_1.object.safety_stock[ll_row] 
			ld_bqty        = dw_1.object.before_qty[ll_row] 
			ld_rqty        = dw_1.object.rcpt_qty[ll_row] 
			ld_iqty        = dw_1.object.issue_qty[ll_row] 
			ld_retqty      = dw_1.object.ret_qty[ll_row] 
			ld_etcqty      = dw_1.object.etc_qty[ll_row] 		
			ld_qoh         = dw_1.object.qoh[ll_row] 				// 실사재고
			ld_qoh         = dw_1.object.cqty[ll_row]				// 전산재고(15/01/16 이수원BUG 발견 수정)

			/////////////////////////////////////////////
			// 시화사업장은 담당자별로 집계작업하기
			/////////////////////////////////////////////
			if ls_area = "S0001" then
				if cbx_all.checked = true then
				else
					if gs_userid <> ls_userid then CONTINUE
				end if
			end if
			/////////////////////////////////////////////
			
         SELECT count(*) INTO :ll_cnt FROM item_batchstock
			 WHERE loc_no = :ls_locno AND batchdate = :ld_date AND item_no = :ls_itemno AND qa = :ls_qa;
			if ll_cnt = 0 then
				INSERT INTO item_batchstock ( loc_no, batchdate, item_no, qa, save_stock, user_id
				       , safety_stock, before_qty, rcpt_qty, issue_qty, ret_qty, etc_qty, qoh, sysdate, rem )
				VALUES ( :ls_locno, :ld_date, :ls_itemno, :ls_qa, :ls_savestock, :ls_userid
				       , :ld_safetystock, :ld_qoh, 0, 0, 0, 0, :ld_qoh + :ld_retqty - :ld_etcqty, getdate(), null );
				if sqlca.sqlcode <> 0 then
					ls_errtext = SQLCA.SQLErrText
					rollback;
					MessageBox("확인","배치재고(item_batchstock) 저장 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)
					hpb_1.bringtotop = false
					hpb_1.visible = false
					RETURN
				else
					ll_icnt = ll_icnt + 1
					COMMIT;
				end if		

			elseif ll_cnt = 1 then
				UPDATE item_batchstock 
					SET save_stock   = :ls_savestock
					  , user_id      = :ls_userid
					  , safety_stock = :ld_safetystock
					  , before_qty   = :ld_qoh
					  , rcpt_qty     = 0
					  , issue_qty    = 0
					  , ret_qty      = 0	// :ld_retqty
				     , etc_qty      = 0	// :ld_etcqty
					  , qoh          = :ld_qoh
					  , sysdate      = getdate()
			   WHERE loc_no = :ls_locno AND batchdate = :ld_date AND item_no = :ls_itemno AND qa = :ls_qa;
				if sqlca.sqlcode <> 0 then
					ls_errtext = SQLCA.SQLErrText
					rollback;
					MessageBox("확인","배치재고(item_batchstock) 수정 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)
					hpb_1.bringtotop = false
					hpb_1.visible = false
					RETURN
				else
					ll_ucnt = ll_ucnt + 1
					COMMIT;
				end if		
			else
				Messagebox("확인","배치재고 중복 loc_no = "+ls_locno+" AND  item_no = "+ls_itemno+" AND qa = "+ls_qa)				
			end if		
		next

		hpb_1.visible = false
		hpb_1.bringtotop = false

//		dw_1.visible = true		// 현재고
//		dw_2.visible = false		// 전일재고(재고조정)

		MessageBox("확인","전일재고 집계작업 완료!!!~n~n" + &
		           "INSERT: " + string(ll_icnt,"#,##0") + "건, UPDATE: " + string(ll_ucnt,"#,##0") +"건" )
      pb_retrieve.triggerevent( clicked! )
	end if
end if


end event

type cb_4 from commandbutton within w_irbatchstock_m
integer x = 1623
integer y = 96
integer width = 439
integer height = 104
integer taborder = 300
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력"
end type

event clicked;/////////////////////////////////////////////////////////////////
// 재고이력(2014/09/03일 오류 발견)
// 출고송장 삭제시 INAUDIT Table에서 수불반영안됨 
// 송장번호: SD20140827-085
/////////////////////////////////////////////////////////////////
string ls_itemno, ls_itemnm, ls_qa, ls_locno
// 전일재고 집계(±14일)
long   ll_row
gs_where lst_where

dw_3.accepttext()

ls_locno  = dw_3.object.loc_no[1]

// 전일재고 집계(±14일)
if cbx_stock.checked = true then
	ll_row    = dw_2.getrow()
	ls_itemnm = dw_2.object.item_name[ll_row]
	ls_qa     = dw_2.object.qa[ll_row]

	SELECT item_no INTO :ls_itemno FROM groupitem WHERE item_name = :ls_itemnm;
else
	ll_row    = dw_1.getrow()
	ls_itemno = dw_1.object.item_no[ll_row]
	ls_itemnm = dw_1.object.item_name[ll_row]
	ls_qa     = dw_1.object.qa[ll_row]
end if

if isnull(ll_row) OR ll_row < 1 then RETURN

lst_where.str1 = ls_itemno
lst_where.str2 = ls_qa
lst_where.str3 = ls_locno
lst_where.str4 = em_1.text  // 시작
lst_where.str5 = em_1.text  // 종료

lst_where.name = ls_itemnm
lst_where.chk  = "DO"

gs_print_control = "INAUDIT"
if gs_print_control = 'INAUDIT' then
	OpenWithParm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = Message.PowerObjectParm
end if

end event

type st_2 from statictext within w_irbatchstock_m
integer x = 1627
integer y = 636
integer width = 1819
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "4) 보정(±)은 실사오류, 불량처리, 손망실, 기타 처리"
boolean focusrectangle = false
end type

type st_9 from statictext within w_irbatchstock_m
integer x = 46
integer y = 632
integer width = 1093
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "3) 반품입고는 출고팀에서 등록"
boolean focusrectangle = false
end type

type cbx_stock from checkbox within w_irbatchstock_m
integer x = 3109
integer y = 764
integer width = 841
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
string text = "전일재고 집계(±14일)"
end type

event clicked;// 전일재고 보기
string ls_area, ls_locno, ls_sdate, ls_edate, ls_year, ls_month, ls_defno
long   ll_row, ll_cnt,  ll_iX

dw_3.accepttext()
dw_area.accepttext()

ls_sdate = em_1.text
ls_locno = dw_3.object.loc_no[1]

if this.checked = true then
	pb_ewol.enabled = false
	pb_save.enabled = false
	
	dw_2.visible = true
	dw_1.visible = false
	dw_2.retrieve( ls_locno, ls_sdate )		// 전일재고 보기	
else
	pb_ewol.enabled = true
	pb_save.enabled = true

	dw_1.visible = true
	dw_2.visible = false
end if

if GF_Permission( "배치재고_관리", gs_userid ) = "Y" then
else
	pb_ewol.enabled = false // 전일재고 집계작업
	pb_save.enabled = false // 저장
end if

if this.checked = true then
	MessageBox("확인", "전일재고 집계보기 조회완료")
end if

end event

type cbx_qoh from checkbox within w_irbatchstock_m
boolean visible = false
integer x = 3685
integer y = 564
integer width = 1042
integer height = 56
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

type cbx_savestock from checkbox within w_irbatchstock_m
integer x = 2551
integer y = 764
integer width = 549
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "분류/안전재고"
end type

event clicked;// 분류,안전재고 수정
if this.checked = true then
	dw_1.object.user_id.TabSequence = 10		// 담당자
	dw_1.object.save_stock.TabSequence = 20	// 분류
	dw_1.object.safety_stock.TabSequence = 30	// 안전재고
else
	dw_1.object.user_id.TabSequence = 0 		// 담당자
	dw_1.object.save_stock.TabSequence = 0		// 분류
	dw_1.object.safety_stock.TabSequence = 0	// 안전재고
end if


end event

type st_8 from statictext within w_irbatchstock_m
integer x = 3186
integer y = 280
integer width = 1545
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "입,출고의 배경색: 재고이력과 차이발생분 표시"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_irbatchstock_m
integer x = 754
integer y = 1164
integer width = 3502
integer height = 1048
integer taborder = 70
boolean bringtotop = true
boolean titlebar = true
string title = "가용량 확인"
string dataobject = "d_whsale_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_4"

end event

type cbx_1 from checkbox within w_irbatchstock_m
integer x = 3685
integer y = 344
integer width = 905
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "가용량 보기(우측마우스)"
end type

event clicked;// 가용량 보기
if this.checked = false then
	dw_4.visible = false 
	RETURN
else
	dw_4.visible = true	
end if

//
date   ld_start,  ld_end
string ls_itemnm, ls_itemno, ls_qa
long   ll_row

ll_row = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then return

string ls_edate, ls_sdate
SELECT top 1 convert(varchar(10), getdate(), 121),  convert(varchar(10), dateadd(day, -61, getdate()), 121)
  INTO :ls_edate, :ls_sdate
  FROM login;
  
ld_start = date(ls_sdate)
ld_end   = date(em_1.text)

ls_itemno = dw_1.object.item_no[dw_1.getrow()]
ls_itemnm = dw_1.object.item_name[dw_1.getrow()]
ls_qa     = dw_1.object.qa[dw_1.getrow()]


dw_4.reset()
dw_4.title = "가용량 확인: " + ls_itemnm + " | " + ls_qa

dw_4.setredraw( false )
dw_4.visible    = true 
dw_4.bringtotop = true
dw_4.retrieve( '%', ld_start, ld_end, ls_itemno, ls_qa )
dw_4.setfilter('corder <> 0')
dw_4.filter()
dw_4.setredraw( true )

end event

type dw_5 from datawindow within w_irbatchstock_m
integer x = 1115
integer y = 1380
integer width = 2770
integer height = 616
integer taborder = 60
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

type cbx_source from checkbox within w_irbatchstock_m
integer x = 3954
integer y = 740
integer width = 379
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "상세보기"
end type

event clicked;// 상세보기
if this.checked = false then
	dw_5.visible = false 
	RETURN
else
	dw_5.visible = true	
end if


dw_3.accepttext()

//
string ls_locno, ls_sdate, ls_itemnm, ls_itemno, ls_qa
long   ll_row

ll_row = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then return

ls_locno  = dw_3.object.loc_no[1]
ls_itemno = dw_1.object.item_no[ll_row]
ls_itemnm = dw_1.object.item_name[ll_row]
ls_qa     = dw_1.object.qa[ll_row]
ls_sdate  = em_1.text

if isnull(ls_locno) OR ls_locno = "" then
	MessageBox("확인","저장소를 선택하시기 바랍니다.")
end if

dw_5.reset()
dw_5.title = "상세보기: " + ls_itemnm + " | " + ls_qa

dw_5.visible    = true 
dw_5.bringtotop = true
dw_5.retrieve( ls_locno, ls_sdate, ls_itemno, ls_qa )

MessageBox("확인","조회완료")

end event

type st_3 from statictext within w_irbatchstock_m
integer x = 73
integer y = 768
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

type cbx_op from checkbox within w_irbatchstock_m
integer x = 1733
integer y = 768
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

type st_10 from statictext within w_irbatchstock_m
integer x = 649
integer y = 276
integer width = 2482
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
string text = "매일 03, 09:00에 시스템에서 전일자 전산재고를 당일자 전일재고로 집계함."
boolean focusrectangle = false
end type

type cbx_cqty from checkbox within w_irbatchstock_m
boolean visible = false
integer x = 3685
integer y = 628
integer width = 1042
integer height = 56
boolean bringtotop = true
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

type dw_6 from datawindow within w_irbatchstock_m
integer x = 1403
integer y = 1664
integer width = 2327
integer height = 396
integer taborder = 150
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

type cbx_2 from checkbox within w_irbatchstock_m
integer x = 3954
integer y = 796
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "출고예정"
end type

event clicked;// 출고예정
if this.checked = false then
	dw_6.visible = false 
	RETURN
else
	dw_6.visible = true	
end if


dw_3.accepttext()

//
string ls_locno, ls_sdate, ls_itemnm, ls_itemno, ls_qa
long   ll_row

ll_row = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then return

ls_locno  = dw_3.object.loc_no[1]
ls_itemno = dw_1.object.item_no[ll_row]
ls_itemnm = dw_1.object.item_name[ll_row]
ls_qa     = dw_1.object.qa[ll_row]
ls_sdate  = em_1.text

if isnull(ls_locno) OR ls_locno = "" then
	MessageBox("확인","저장소를 선택하시기 바랍니다.")
end if

dw_6.reset()
dw_6.title = "출고예정: " + ls_itemnm + " | " + ls_qa

dw_6.visible    = true 
dw_6.bringtotop = true
dw_6.retrieve( ls_locno, ls_sdate, ls_itemno, ls_qa )

MessageBox("확인","조회완료")

end event

type cbx_user from checkbox within w_irbatchstock_m
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
string text = "담당자 변경"
end type

event clicked;// 담당자 변경
string ls_userid

if this.checked = true then
	dw_1.object.user_id.TabSequence = 10		// 담당자
else
	dw_1.object.user_id.TabSequence = 0 		// 담당자
end if

end event

type cbx_all from checkbox within w_irbatchstock_m
integer x = 3817
integer y = 420
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

type hpb_1 from hprogressbar within w_irbatchstock_m
integer x = 32
integer y = 544
integer width = 4718
integer height = 160
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

