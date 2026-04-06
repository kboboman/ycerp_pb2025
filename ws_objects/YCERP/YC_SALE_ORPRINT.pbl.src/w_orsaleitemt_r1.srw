$PBExportHeader$w_orsaleitemt_r1.srw
$PBExportComments$전략제품 출고내역
forward 
global type w_orsaleitemt_r1 from w_inheritance
end type
type gb_4 from groupbox within w_orsaleitemt_r1
end type
type pb_1 from picturebutton within w_orsaleitemt_r1
end type
type mle_1 from multilineedit within w_orsaleitemt_r1
end type
type cb_2 from commandbutton within w_orsaleitemt_r1
end type
type st_info from statictext within w_orsaleitemt_r1
end type
end forward

global type w_orsaleitemt_r1 from w_inheritance
integer x = 5
integer y = 36
integer width = 4695
integer height = 2884
string title = "물품그룹별 출고내역(w_orsaleitemt_r1)"
gb_4 gb_4
pb_1 pb_1
mle_1 mle_1
cb_2 cb_2
st_info st_info
end type
global w_orsaleitemt_r1 w_orsaleitemt_r1

type variables
date id_start, id_end
string is_ret
st_print i_print
end variables

on w_orsaleitemt_r1.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.pb_1=create pb_1
this.mle_1=create mle_1
this.cb_2=create cb_2
this.st_info=create st_info
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.st_info
end on

on w_orsaleitemt_r1.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.pb_1)
destroy(this.mle_1)
destroy(this.cb_2)
destroy(this.st_info)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_chk, ls_date
SELECT TOP 1 CONVERT(CHAR(16),sys_date,120) INTO :ls_date FROM DOITEM_SUM;
st_info.text = "최근 조회일자 : " + ls_date

mle_1.y = dw_1.y
mle_1.visible = false
dw_2.visible  = false

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_1.sharedata(dw_2)

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 69
gb_2.height = this.height - 344

dw_1.width  = this.width  - 106
dw_1.height = this.height - 420

end event

type pb_save from w_inheritance`pb_save within w_orsaleitemt_r1
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleitemt_r1
integer x = 32
integer y = 300
integer width = 4571
integer height = 2432
integer taborder = 50
string dataobject = "d_orsaleitemt_r11"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_orsaleitemt_r1
integer x = 32
integer y = 40
integer width = 1627
string text = "물품그룹별 출고내역"
end type

type st_tips from w_inheritance`st_tips within w_orsaleitemt_r1
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleitemt_r1
boolean visible = false
integer x = 3008
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaleitemt_r1
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_orsaleitemt_r1
integer x = 4398
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleitemt_r1
integer x = 4014
integer y = 56
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

dw_1.Modify("DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80")
i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 전략제품 출고내역을  출력합니다." 

// cross tab은 sharedata가 안됨으로 직접프린트함.easthero
OpenWithParm(w_printsetup, i_print) 

//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)
//

end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleitemt_r1
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleitemt_r1
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleitemt_r1
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleitemt_r1
integer x = 3822
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_custdo_str lst_code
string  ls_cust,  SQL
long    ll_row
date    ld_date
st_security lst_security

ld_date = date('2012/01/31')
choose case gs_level
	case "A", "B"
		is_ret = '%'
	case "C"
		is_ret = gs_userid
end choose


Integer iNet
String  YYYY
SELECT TOP 1 CONVERT(CHAR(4),DATEADD(YEAR, -3, GETDATE()),112) INTO :YYYY FROM DOITEM_SUM;

iNet = MessageBox("집계작업", "물품그룹별 집계작업을 " + YYYY + "년 부터 재집계 작업 후 조회 하시겠습니까?", Exclamation!, OKCancel!, 2)
IF iNet = 1 THEN
   // 전략별 출고내역 //                                                                                                      
   DELETE DOITEM_SUM;                                                                                                         
   INSERT INTO DOITEM_SUM( SALESMAN,DO_DATE,ITEM_NAME,CALC_QTY,AMOUNT )
   SELECT '담당' = B.USER_ID
        , '년월' = A.DO_DATE                                                                                                  
        , '품목' = A.ITEM                                                                                                     
        , '수량' = SUM(A.CALC_QTY)
        , '금액' = SUM(A.AMOUNT)
     FROM (                                                                                                        
          SELECT DO_DATE  = AA.DO_DATE                                                                                        
               , ITEM     = AA.ITEM                                                                                           
               , CUST_NO  = AA.CUST_NO
               , CALC_QTY = SUM(AA.CALC_QTY)                                                                                  
               , AMOUNT   = SUM(AA.AMOUNT)                                                                                    
            FROM (                                                                                                            
                 SELECT DO_DATE  = CONVERT(DATETIME, (CONVERT(CHAR(7), DO.DO_DATE, 111) + '/01'), 120)                        
                      , ITEM     = ITEMTOP10.CATEGORY
                      , CALC_QTY = ROUND(DBO.UF_GETQTY(DODET.ITEM_NO, DODET.QA, DODET.UOM, DODET.SHIP_QTY),2,1)               
                      , AMOUNT   = ROUND(DBO.UF_GETQTY(DODET.ITEM_NO, DODET.QA, DODET.UOM, DODET.SHIP_QTY),2,1) * DODET.PRICE 
                      , CUST_NO  = DO.CUST_NO
                   FROM DO                                                                                                    
                      , DODET                                                                                                 
                      , GROUPITEM                                                                                             
                      , ITEMTOP10
                  WHERE ( DO.DO_NO               = DODET.DO_NO        )                                                       
                    AND ( DODET.ITEM_NO          = GROUPITEM.ITEM_NO  )                                                       
                    AND ( DODET.ITEM_NO          = ITEMTOP10.ITEM_NO  )   
                    AND ( YEAR(DO.DO_DATE)      IN ( YEAR(:ld_date) - 1, YEAR(:ld_date) ) )
                 ) AA
             GROUP BY AA.DO_DATE, AA.ITEM, AA.CUST_NO
          ) A
          LEFT OUTER JOIN (
                 SELECT A.CUST_NO, B.USER_ID  FROM CUSTOMER A  LEFT OUTER JOIN LOGIN B  ON A.SALESMAN = B.USER_ID
          ) B  ON A.CUST_NO = B.CUST_NO
    GROUP BY B.USER_ID, A.DO_DATE, A.ITEM;
   IF SQLCA.SQLCODE < 0 THEN
      MessageBox('오류 DOITEM_SUM',SQLCA.SQLERRTEXT,EXCLAMATION!)
      ROLLBACK;
   END IF    
   COMMIT;
END IF

ll_row = dw_1.retrieve( ld_date )
if ll_row < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_orsaleitemt_r1
boolean visible = false
integer x = 37
integer y = 224
integer width = 3397
integer height = 176
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleitemt_r1
integer x = 18
integer y = 244
integer width = 4608
integer height = 2508
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleitemt_r1
integer x = 3195
integer y = 16
integer width = 1431
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleitemt_r1
integer x = 1481
integer y = 4
integer width = 105
integer height = 76
integer taborder = 60
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;datawindowchild ldwc_pur
string ls_pur
this.accepttext()
ls_pur = trim(this.object.pur_no[1])
dw_1.retrieve(ls_pur)
choose case dwo.name
	case 'pur_no'
        this.getchild('pur_no',ldwc_pur)
        this.object.sign_date[1] = ldwc_pur.getitemdatetime(ldwc_pur.getrow(),'sign_date')
end choose
end event

type gb_4 from groupbox within w_orsaleitemt_r1
boolean visible = false
integer x = 1851
integer y = 40
integer width = 133
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
end type

type pb_1 from picturebutton within w_orsaleitemt_r1
event mousemove pbm_mousemove
integer x = 4206
integer y = 56
integer width = 187
integer height = 144
integer taborder = 130
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long ll_cnt

ll_cnt = dw_1.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV," + &
		"Html(웹문서), *.HTML,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" OR ls_ExpandName = "html" OR ls_ExpandName = "HTML" then
						dw_1.SaveAs(ls_DocName, HTMLTable!	, TRUE)
			end if
	end if
end if	

end event

type mle_1 from multilineedit within w_orsaleitemt_r1
integer x = 567
integer y = 592
integer width = 3593
integer height = 2064
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "                                      "
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
boolean ignoredefaultbutton = true
end type

event modified;this.visible = false
end event

type cb_2 from commandbutton within w_orsaleitemt_r1
integer x = 3250
integer y = 56
integer width = 512
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "전략품목 관리"
end type

event clicked;// 전략품목 관리
string ls_itemno, ls_itemnm
long   ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_itemno = dw_1.object.item_no[ll_row]
ls_itemnm = dw_1.object.item_name[ll_row]
if ls_itemno = "" or isnull(ls_itemno) then return

if IsValid(w_o_main) then 
	OpenSheet(w_cditemtop10_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cditemtop10_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cditemtop10_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cditemtop10_m,  w_all_main, 5, original!)
end if

w_cditemtop10_m.sle_no.text = ls_itemno
w_cditemtop10_m.sle_nm.text = ls_itemnm

end event

type st_info from statictext within w_orsaleitemt_r1
integer x = 1710
integer y = 108
integer width = 1445
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79741120
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

