$PBExportHeader$w_orsale_m.srw
$PBExportComments$판매수주관리(1998/03/30, 정재수)
forward
global type w_orsale_m from w_inheritance
end type
type gb_6 from groupbox within w_orsale_m
end type
type dw_4 from datawindow within w_orsale_m
end type
type pb_1 from picturebutton within w_orsale_m
end type
type pb_2 from picturebutton within w_orsale_m
end type
type rb_1 from radiobutton within w_orsale_m
end type
type rb_2 from radiobutton within w_orsale_m
end type
type rb_3 from radiobutton within w_orsale_m
end type
type dw_6 from datawindow within w_orsale_m
end type
type em_3 from editmask within w_orsale_m
end type
type st_1 from statictext within w_orsale_m
end type
type em_2 from editmask within w_orsale_m
end type
type em_1 from editmask within w_orsale_m
end type
type em_4 from editmask within w_orsale_m
end type
type st_2 from statictext within w_orsale_m
end type
type st_4 from statictext within w_orsale_m
end type
type cb_5 from commandbutton within w_orsale_m
end type
type cb_6 from commandbutton within w_orsale_m
end type
type cb_3 from commandbutton within w_orsale_m
end type
type dw_8 from datawindow within w_orsale_m
end type
type pb_3 from picturebutton within w_orsale_m
end type
type dw_3 from datawindow within w_orsale_m
end type
type cb_1 from commandbutton within w_orsale_m
end type
type cb_2 from commandbutton within w_orsale_m
end type
type st_5 from statictext within w_orsale_m
end type
type dw_5 from datawindow within w_orsale_m
end type
type pb_4 from picturebutton within w_orsale_m
end type
type cb_4 from commandbutton within w_orsale_m
end type
type cb_7 from commandbutton within w_orsale_m
end type
type cb_filteroff from commandbutton within w_orsale_m
end type
type cb_filteron from commandbutton within w_orsale_m
end type
type sle_value from singlelineedit within w_orsale_m
end type
type ddlb_2 from dropdownlistbox within w_orsale_m
end type
type st_9 from statictext within w_orsale_m
end type
type ddlb_col from dropdownlistbox within w_orsale_m
end type
type st_8 from statictext within w_orsale_m
end type
type pb_5 from picturebutton within w_orsale_m
end type
type pb_6 from picturebutton within w_orsale_m
end type
type pb_7 from picturebutton within w_orsale_m
end type
type st_saleamt from statictext within w_orsale_m
end type
type pb_9 from picturebutton within w_orsale_m
end type
type st_3 from statictext within w_orsale_m
end type
type st_6 from statictext within w_orsale_m
end type
type dw_export from datawindow within w_orsale_m
end type
type cb_8 from commandbutton within w_orsale_m
end type
type gb_4 from groupbox within w_orsale_m
end type
end forward

global type w_orsale_m from w_inheritance
integer x = 5
integer y = 148
integer width = 5038
integer height = 2844
string title = "판매수주관리(w_orsale_m)"
boolean hscrollbar = true
boolean vscrollbar = true
gb_6 gb_6
dw_4 dw_4
pb_1 pb_1
pb_2 pb_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_6 dw_6
em_3 em_3
st_1 st_1
em_2 em_2
em_1 em_1
em_4 em_4
st_2 st_2
st_4 st_4
cb_5 cb_5
cb_6 cb_6
cb_3 cb_3
dw_8 dw_8
pb_3 pb_3
dw_3 dw_3
cb_1 cb_1
cb_2 cb_2
st_5 st_5
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
pb_5 pb_5
pb_6 pb_6
pb_7 pb_7
st_saleamt st_saleamt
pb_9 pb_9
st_3 st_3
st_6 st_6
dw_export dw_export
cb_8 cb_8
gb_4 gb_4
end type
global w_orsale_m w_orsale_m

type variables
st_print i_print
datawindowchild idwc_cust_no, idwc_scene
datawindowchild idwc_area
datawindowchild idwc_qa, idwc_cust, idwc_item
datawindowchild idwc_color

string is_scenesql, is_qasql, is_flag, is_import_chk = 'X'

end variables

forward prototypes
public subroutine wf_sceneretrieve (string as_cust)
public function boolean wf_confirm (string as_mess)
public subroutine wf_calc ()
public subroutine wf_ret (string as_order)
public function string wf_color (string as_item)
public function decimal wf_saleamt (string as_cust, string as_start, string as_end)
public function boolean wf_item_no_check (string arg_item_no)
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

public function string wf_color (string as_item);//
string ls_ret

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

RETURN ls_ret

end function

public function decimal wf_saleamt (string as_cust, string as_start, string as_end);decimal amt

SELECT AMT   = SUM(A.AMOUNT)  INTO :amt
  FROM (
       SELECT CUST_NO      = B.CUST_NO
            , CUST_NAME    = C.CUST_NAME   
            , ORDER_NO     = B.ORDER_NO        
            , SEQ_NO       = A.SEQ_NO       
            , SCENE_CODE   = B.SCENE_CODE      
            , SCENE_DESC   = E.SCENE_DESC     
            , SALE_FLAG    = B.SALE_FLAG       
            , ORDER_DATE   = CONVERT(CHAR(10),B.ORDER_DATE,111)     
            , CUST_PO_DATE = CONVERT(CHAR(10),B.CUST_PO_DATE,111)   
            , DUE_DATE     = CONVERT(CHAR(10),B.DUE_DATE,111)       
            , ITEM_NO      = A.ITEM_NO       
            , ITEM_NAME    = F.ITEM_NAME   
            , QA           = A.QA            
            , UOM          = A.UOM           
            , ORDER_QTY    = A.ORDER_QTY     
            , ACC_QTY      = A.ACC_QTY       
            , PRICE        = A.PRICE         
            , AMOUNT       = A.ACC_QTY * A.PRICE
            , RLSE_QTY     = ISNULL(A.RLSE_QTY,0)        
            , SHIP_FLAG    = DBO.UF_GETSHIPFLAG(B.SHIP_FLAG)   
            , COLOR_NAME   = ISNULL(D.COLOR_NAME,'')       
            , WORK_NAME    = H.WORK_NAME
         FROM SALEDET A
              LEFT OUTER JOIN SALE B      ON A.ORDER_NO = B.ORDER_NO
              LEFT OUTER JOIN CUSTOMER C  ON B.CUST_NO     = C.CUST_NO
              LEFT OUTER JOIN COLOR D     ON A.COLOR    = D.COLOR_CODE
              LEFT OUTER JOIN SCENE E     ON B.SCENE_CODE  = E.SCENE_CODE
              LEFT OUTER JOIN GROUPITEM F ON A.ITEM_NO  = F.ITEM_NO
              LEFT OUTER JOIN ROUT  G     ON A.ITEM_NO  = G.ITEM_NO  AND SUBSTRING(A.QA,1,14) + '00000' = G.QA
              LEFT OUTER JOIN WC    H     ON G.WC_NO       = H.WORK_NO         
        WHERE ( B.OPEN_CLOSE     NOT IN ('X','C')     ) 
          AND ( B.CUST_NO          LIKE :as_cust      ) 
          AND ( B.SALE_FLAG          IN ('D','L','E') ) 
          AND ( CONVERT(CHAR(10),B.ORDER_DATE,111)  BETWEEN :as_start AND :as_end ) 
          AND ( B.CONFIRM_FLAG       IN ('N','T','Y') ) 
          AND ( G.OPERATION   = 1    OR G.OPERATION IS NULL )
       ) A
   GROUP BY CUST_NO;
	
RETURN AMT

end function

public function boolean wf_item_no_check (string arg_item_no);
//YSP 수주통제 ITEM 목록(w_whitemlocqohmulti_w2 내용에도 병행 수정)

String	ls_Item_no[], ls_val = 'NO'
long		ll_cnt

ls_Item_No[1]  = 'PCYSSPPZZL' ; ls_Item_No[2]  = 'PCYSSPPZZH' ; ls_Item_No[3]  = 'PCYSSPPZZI' ; ls_Item_No[4]  = 'PCYSSPPZZZ'
ls_Item_No[5]  = 'PCYSBP5ZZZ' ; ls_Item_No[6]  = 'PCYSBPCZZZ' ; ls_Item_No[7]  = 'PCYSSPPZZ4' ; ls_Item_No[8]  = 'PCYSSC3ZZZ'
ls_Item_No[9]  = 'PCYSSC4ZZZ' ; ls_Item_No[10] = 'PCYSSC5ZZZ' ; ls_Item_No[11] = 'PCYSSPEZZL' ; ls_Item_No[12] = 'PCYSSPEZZH'
ls_Item_No[13] = 'PCYSSPEZZI' ; ls_Item_No[14] = 'PCYSSPEZZZ' ; ls_Item_No[15] = 'PCYSSPEZZJ' ; ls_Item_No[16] = 'PCYSSPEZZ4'
ls_Item_No[17] = 'PCYSSPVZZZ' ; ls_Item_No[18] = 'PCYSSC1ZZZ' ; ls_Item_No[19] = 'PCYSSC2ZZZ' ; ls_Item_No[20] = 'PCYSSPAZZZ'
ls_Item_No[21] = 'PCYSSPUZZL' ; ls_Item_No[22] = 'PCYSSPUZZH' ; ls_Item_No[23] = 'PCYSSPUZZI' ; ls_Item_No[24] = 'PCYSSPUZZZ'
ls_Item_No[25] = 'PCYSSPUZZ4'

for ll_cnt = 1 to 25
	if ls_Item_No[ll_cnt] = arg_Item_No then
		ls_val = 'OK'
		exit
	end if
next

if ls_val = 'OK' then
	return true
else
	return false
end if


end function

on w_orsale_m.create
int iCurrent
call super::create
this.gb_6=create gb_6
this.dw_4=create dw_4
this.pb_1=create pb_1
this.pb_2=create pb_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_6=create dw_6
this.em_3=create em_3
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.em_4=create em_4
this.st_2=create st_2
this.st_4=create st_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_3=create cb_3
this.dw_8=create dw_8
this.pb_3=create pb_3
this.dw_3=create dw_3
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_5=create st_5
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
this.pb_5=create pb_5
this.pb_6=create pb_6
this.pb_7=create pb_7
this.st_saleamt=create st_saleamt
this.pb_9=create pb_9
this.st_3=create st_3
this.st_6=create st_6
this.dw_export=create dw_export
this.cb_8=create cb_8
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_6
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.pb_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.dw_6
this.Control[iCurrent+9]=this.em_3
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.em_2
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.em_4
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.cb_6
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.dw_8
this.Control[iCurrent+20]=this.pb_3
this.Control[iCurrent+21]=this.dw_3
this.Control[iCurrent+22]=this.cb_1
this.Control[iCurrent+23]=this.cb_2
this.Control[iCurrent+24]=this.st_5
this.Control[iCurrent+25]=this.dw_5
this.Control[iCurrent+26]=this.pb_4
this.Control[iCurrent+27]=this.cb_4
this.Control[iCurrent+28]=this.cb_7
this.Control[iCurrent+29]=this.cb_filteroff
this.Control[iCurrent+30]=this.cb_filteron
this.Control[iCurrent+31]=this.sle_value
this.Control[iCurrent+32]=this.ddlb_2
this.Control[iCurrent+33]=this.st_9
this.Control[iCurrent+34]=this.ddlb_col
this.Control[iCurrent+35]=this.st_8
this.Control[iCurrent+36]=this.pb_5
this.Control[iCurrent+37]=this.pb_6
this.Control[iCurrent+38]=this.pb_7
this.Control[iCurrent+39]=this.st_saleamt
this.Control[iCurrent+40]=this.pb_9
this.Control[iCurrent+41]=this.st_3
this.Control[iCurrent+42]=this.st_6
this.Control[iCurrent+43]=this.dw_export
this.Control[iCurrent+44]=this.cb_8
this.Control[iCurrent+45]=this.gb_4
end on

on w_orsale_m.destroy
call super::destroy
destroy(this.gb_6)
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_6)
destroy(this.em_3)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.em_4)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_3)
destroy(this.dw_8)
destroy(this.pb_3)
destroy(this.dw_3)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_5)
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
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.pb_7)
destroy(this.st_saleamt)
destroy(this.pb_9)
destroy(this.st_3)
destroy(this.st_6)
destroy(this.dw_export)
destroy(this.cb_8)
destroy(this.gb_4)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

st_saleamt.visible = false
cb_3.enabled       = false		// 가져오기

this.x = 1
this.y = 1
dw_2.SetTransObject(SQLCA)
dw_export.SetTransObject(SQLCA)

dw_6.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_6.insertrow(0)  
dw_6.object.area[1] = gs_area

dw_1.insertrow(0)  
dw_1.getchild("cust_no", idwc_cust_no)
GS_DS_WHCUSTRET.ShareData(idwc_cust_no)

//// 공무관리담당자는 거래처변경 못함
//if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
//	dw_1.object.cust_no[1] = 'N014'	// (주)유창플러스
//end if

dw_2.getchild("cust_no", idwc_cust)
GS_DS_WHCUSTRET.ShareData(idwc_cust)

dw_2.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.insertrow(0)  
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_3.getchild("item_no", idwc_item)
GS_DS_ITEMALL.ShareData(idwc_item)

dw_3.getchild("qa", idwc_qa)
GS_DS_QAALL.ShareData(idwc_qa)

dw_3.settransobject(sqlca)

em_1.text = string(RelativeDate(today(), - 10), "yyyy/mm/dd")
em_2.text = string(RelativeDate(today(), + 10), "yyyy/mm/dd")
if gs_area = "B0001" THEN  // YSP사업장
	rb_1.checked = true
	rb_1.triggerevent(clicked!)
else								//"S0001" //: 시화
	rb_2.checked = true
	rb_2.triggerevent(clicked!)
end if

em_3.text = LeftA(gs_area, 1) + "D" + string(today(), "yyyymmdd")
dw_5.visible = false
dw_export.visible = false

// 공정
pb_compute.enabled  = false

// 엑셀
cb_3.enabled = true

// 문자전송
pb_6.visible  = false
if gf_permission("SMSSEND", gs_userid) = 'Y' then
	pb_6.visible  = true
end if

dw_8.visible  = false

ddlb_col.text = "현장명"
ddlb_2.text   = "LIKE"
em_3.SelectText(9, 2)
em_3.setfocus()

end event

event resize;call super::resize;//this.width  = 3040
dw_3.width  = newwidth  - 59
dw_3.height = newheight - 1428

end event

event key;call super::key;// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
IF keyflags = 2 THEN
	IF key = KeyS! THEN
		if MessageBox("확인", "수주내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_save.triggerevent(clicked!)
		end if
	END IF
END IF

end event

type pb_save from w_inheritance`pb_save within w_orsale_m
event ue_print pbm_custom01
integer x = 4443
integer y = 40
integer width = 178
integer taborder = 350
end type

event pb_save::clicked;dwitemstatus l_status
string  ls_sale_no, ls_sale_no1, ls_sale_date,   ls_seq, ls_sale_flag, ls_tax_sign, ls_area
string  ls_confirm, ls_esti_no,  ls_s_scene_tel, ls_s_scene_code, ls_new_chk = 'N'
string  ls_shipto_addr, ls_msg,  ls_item_no, ls_qa, ls_uom, ls_itemno1, ls_qa1
string  ls_qa_split[], ls_chk1, ls_chk2, ls_chk3, ls_chk4, ls_val1, ls_val2, ls_val3, ls_val4

int     li_seq,     li_revision_no
long    ll_row, ll_iY, ll_idx
decimal lr_order_qty, lr_amt
 
dw_2.accepttext()
if dw_2.rowcount() < 1 then return

string  ls_sale_control, ls_cust_chk, ls_credit_level, ls_s_cust_name, ls_spot_code
decimal lr_bill, lr_balance, lr_total, lr_credit_limit, lr_chkamt

debugbreak()
////////////////////////////////////////////////////////////////////////
// 품목 + 규격 오류 검사 //  CHK1 = Y, QA1 = 080 : QA1 값이 080만 허용
////////////////////////////////////////////////////////////////////////
for ll_iY = 1 to dw_3.rowcount()
	ls_item_no = dw_3.object.item_no[ll_iY]		// 수주품목
	ls_qa      = dw_3.object.qa[ll_iY]				// 수주규격
	ls_uom     = dw_3.object.uom[ll_iY]				// 수주단위
	
    /*  2018.12.13 jowonsuk 규격패턴 점검 로직 수정, 기존 제품에 다양한 규격 패턴을 점검 못함. 시작 */		
	LONG L_itemqa_pattern_COUNT
	
	L_itemqa_pattern_COUNT = 0

  	SELECT COUNT(*)
	     INTO :L_itemqa_pattern_COUNT
     from itemqa_pattern
	WHERE item_no = :ls_item_no AND uom = :ls_uom AND use_yn = 'Y' ;
	
	
	IF L_itemqa_pattern_COUNT <> 0  THEN		/* 2018.11.8 jowonsuk 점검 대상인겅우만 */
		
		
			L_itemqa_pattern_COUNT = 0
		
			SELECT COUNT(*)
			  INTO :L_itemqa_pattern_COUNT
			  from itemqa_pattern
			WHERE item_no = :ls_item_no AND uom = :ls_uom AND use_yn = 'Y'   AND QA1 = ( CASE WHEN CHK1 = 'Y' THEN  substring(:ls_qa,1,3) ELSE 'FRE' END);
			
			
			if L_itemqa_pattern_COUNT = 0 then		
					MessageBox("확인",string(ll_iy) + " 행 품목의 규격1 오류. " + MidA(ls_qa,1,3) + " 을 확인해 보세요.", stopsign!)
					RETURN
			end if
			
			L_itemqa_pattern_COUNT = 0
			
			SELECT COUNT(*)
				  INTO :L_itemqa_pattern_COUNT
			  from itemqa_pattern
			WHERE item_no = :ls_item_no AND uom = :ls_uom AND use_yn = 'Y'   
						AND QA2 = (CASE WHEN CHK2 = 'Y' THEN  substring(:ls_qa,5,4) ELSE 'FREE' END);	
			
			
			if L_itemqa_pattern_COUNT = 0 then		
					MessageBox("확인",string(ll_iy) + " 행 품목의 규격2 오류. " + MidA(ls_qa,5,4) + " 을 확인해 보세요.", stopsign!)
					RETURN
			end if	
			
			L_itemqa_pattern_COUNT = 0
			
			SELECT COUNT(*)
				  INTO :L_itemqa_pattern_COUNT
			  from itemqa_pattern
			WHERE item_no = :ls_item_no AND uom = :ls_uom AND use_yn = 'Y'   
						AND QA3 = (CASE WHEN CHK3 = 'Y' THEN  substring(:ls_qa,10,4) ELSE 'FREE' END);		
			
			if L_itemqa_pattern_COUNT = 0 then		
					MessageBox("확인",string(ll_iy) + " 행 품목의 규격3 오류. " + MidA(ls_qa,10,4) + " 을 확인해 보세요.", stopsign!)
					RETURN
			end if
			
			
			L_itemqa_pattern_COUNT = 0
			
			SELECT COUNT(*)
					 INTO :L_itemqa_pattern_COUNT
			  from itemqa_pattern
			WHERE item_no = :ls_item_no AND uom = :ls_uom AND use_yn = 'Y'   
						AND QA4 = (CASE WHEN CHK4 = 'Y' THEN  substring(:ls_qa,15, 5) ELSE 'FREE' END);	
			
			
			if L_itemqa_pattern_COUNT = 0 then		
				MessageBox("확인",string(ll_iy) + " 행 품목의 규격4 오류. " + MidA(ls_qa,15, 5) + " 을 확인해 보세요.", stopsign!)
				RETURN
			end if			
	
	END IF	
	
/*  2018.12.13 jowonsuk 규격패턴 점검 로직 수정, 기존 제품에 다양한 규격 패턴을 점검 못함. 끝*/		

/*  2018.12.13 jowonsuk 주석처리 시작 */		

//	if Pos(ls_qa, "X") > 0 then
//		GF_SPLIT( ls_qa, "X", ls_qa_split )
//
//		ls_qa1 = ""		// 초기화
//		SELECT rtrim(qa), chk1, chk2, chk3, chk4, qa1, qa2, qa3, qa4 
//		  INTO :ls_qa1, :ls_chk1, :ls_chk2, :ls_chk3, :ls_chk4, :ls_val1, :ls_val2, :ls_val3, :ls_val4 
//		  FROM itemqa_pattern 
//		 WHERE item_no = :ls_item_no AND uom = :ls_uom AND use_yn = 'Y';
//		 
//		if isnull(ls_qa1) or ls_qa1 = "" then
//		else
//			if ls_chk1 = "Y" then
//				if ls_val1 <> ls_qa_split[1] then
//					MessageBox("확인",string(ll_iy) + " 행 품목의 규격1 오류. " + ls_val1 + " 으로 시작해야 합니다.", stopsign!)
//					RETURN
//				end if
//			end if
//	
//			if ls_chk2 = "Y" then
//				if ls_val2 <> ls_qa_split[2] then
//					MessageBox("확인",string(ll_iy) + " 행 품목의 규격2 오류. " + ls_val2 + " 으로 시작해야 합니다.", stopsign!)
//					RETURN
//				end if
//			end if
//	
//			if ls_chk3 = "Y" then
//				if ls_val3 <> ls_qa_split[3] then
//					MessageBox("확인",string(ll_iy) + " 행 품목의 규격3 오류. " + ls_val3 + " 으로 시작해야 합니다.", stopsign!)
//					RETURN
//				end if
//			end if
//	
//			if ls_chk4 = "Y" then
//				if ls_val4 <> ls_qa_split[4] then
//					MessageBox("확인",string(ll_iy) + " 행 품목의 규격4 오류. " + ls_val4 + " 으로 시작해야 합니다.", stopsign!)
//					RETURN
//				end if
//			end if
//		end if
//	end if		
/*  2018.12.13 jowonsuk 주석처리 끝 */
next

ls_spot_code = dw_2.object.scene_code[1]
if isnull(ls_spot_code) or ls_spot_code = "" then // 수주현장
	MessageBox("저장오류","거래처 현장은 반드시 선택하시기 바랍니다.!",stopsign!)
	return
end if

lr_chkamt   = double(st_saleamt.text)
ls_cust_chk = dw_2.object.cust_no[1]
SELECT isnull(sale_control,'N') , bill_amount, balance_amt, credit_limit, credit_level, cust_name
  INTO :ls_sale_control, :lr_bill, :lr_balance, :lr_credit_limit, :ls_credit_level, :ls_s_cust_name
  FROM customer
 WHERE cust_no = :ls_cust_chk;
 
if ls_sale_control = 'A' or ls_sale_control = 'Y' then // 매출통제
	MessageBox("저장오류","매출통제 대상 거래처입니다. ~r~n~n영업관리팀에 문의 바랍니다.!",stopsign!)
	return
end if

// 저장시 수주총금액과 여신한도액 체크
string   ls_order_no, ls_fob, ls_order_no1, ls_conf, ls_area_no

ls_fob      = trim(dw_2.object.fob[1])
lr_total    = dw_2.object.total[1]
ls_order_no = dw_2.object.order_no[1]

if ls_credit_level = 'A' or ls_fob = '현금' or lr_credit_limit = 0 then
	// 현금거래, 여신한도액 0
//elseif (lr_bill + lr_balance + lr_total) < lr_credit_limit then
elseif lr_credit_limit > (lr_chkamt + lr_total) then
	// 여신한도내
elseif dw_2.object.sale_confirm_flag[1] <> "N" then
	// 확정상태가 수주,생산에서 특기사항 수정 후 저장하는 경우
else
	if ls_credit_level = 'Z' or ls_credit_level = 'F' then
		// 법무팀 거래처
	else
		if MessageBox("확인","이 수주내용은 현금거래, 여신한도액 0, 여신한도내, 채권팀 거래처가 아닌~n~n" + & 
		              "수주내용으로 해당 거래처의 여신한도액이 초과하였습니다!~n~n이 수주를 저장 하시겠습니까?~n" + &
						  "(저장시 영업담당자에게 자동으로 문자전송)",question!,okcancel!,2) = 2 then
			return
		else
			// SMS 단문전송
			String ls_salesman, ls_s_scene_desc, ls_s_hp_no, ls_s_msg, ls_exist			
			DataWindowChild dwc1, dwc2
	
			ls_salesman = dw_2.object.salesman[1]
			dw_2.GetChild('scene_code', dwc2)
			ls_s_scene_desc = dwc2.getitemstring(dwc2.getrow(),'scene_desc')

			SELECT HP_NO = REPLACE(SUBSTRING(LTRIM(RTRIM(ISNULL(A.HP_NO,''))),1,13), '-', '') 
			  INTO :ls_s_hp_no
			  FROM SALEHP A
			 WHERE A.USER_ID   = :ls_salesman;
				

			ls_s_cust_name = GF_HANGLE_TR(ls_s_cust_name,24)
			ls_s_msg = "[유창]수주초과:" + string(lr_total,"#,##0") + " " + ls_s_cust_name + "," + trim(ls_s_scene_desc)
			ls_s_msg = GF_HANGLE_TR(ls_s_msg,80)
							
			choose case LeftA(ls_s_hp_no,3)
				case '010','011','016','017','018','019'
				case else
					ls_s_hp_no = ''
			end choose
	
			String SMSSERVER
			SELECT ITEM_NM INTO :SMSSERVER FROM CODEMST
			 WHERE ITEM_CD = 'SMSSERVER' AND USE_YN = 'Y';
			IF SMSSERVER = "" THEN SMSSERVER = "192.168.1.5"
			
			// 영업사원
			if ls_s_hp_no = '' or isnull(ls_s_hp_no) then
			else
				choose case SMSSERVER
					case '192.168.1.5'
						// SC_LOG
						SELECT tr_phone INTO :ls_exist FROM SC_LOG
						 WHERE TR_MSG      = :ls_s_msg
						   AND TR_PHONE    = :ls_s_hp_no;
						if isnull(ls_exist) or ls_exist = "" then
							INSERT INTO SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG )
								VALUES ( GetDate(), '0', '00', :ls_s_hp_no, '02-2648-1998', :ls_s_msg );
						else
							MessageBox("확인(SC_LOG)", "동일한 문자 내용으로 발송한 내역이 존재하여 전송하지 않습니다.")
	               end if
						
						// SC_TRAN
						SELECT tr_phone INTO :ls_exist FROM SC_TRAN
						 WHERE TR_MSG      = :ls_s_msg
						   AND TR_PHONE    = :ls_s_hp_no;
						if isnull(ls_exist) or ls_exist = "" then
							INSERT INTO SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG )
								VALUES ( GetDate(), '0', '00', :ls_s_hp_no, '02-2648-1998', :ls_s_msg );
						else
							MessageBox("확인(SC_TRAN)", "동일한 문자 내용으로 발송한 내역이 존재하여 전송하지 않습니다.")
	               end if
					case else
				end choose
			end if	// 영업사원
		end if	// 수주를 저장 하시겠습니까?
	end if	// 법무팀 거래처
end if	// 현금거래, 여신한도액 0, 여신한도내


/////////////////////////
// 요구납기 CHECK
/////////////////////////
DateTime ld_podate, ld_gftoday1
string   ls_date,   ls_date60
Int      li_date30, li_today1

ld_podate  = dw_2.object.cust_po_date[dw_2.getrow()]
ls_date    = string(ld_podate, "yyyy/mm/dd")

ld_gftoday1 = gdt_today 		// GF_TODAY()
//li_today1 = DaysAfter( date(ld_gftoday1), date(ld_podate) )
SELECT datediff( day, :ls_date, getdate() ), convert(char(10),dateadd( day, 60, :ls_date ),111)
  INTO :li_today1, :ls_date60  FROM dual;

if li_today1 < 0 then li_today1 = li_today1 * -1
if li_today1 > 60 then 
	ls_msg  = "요구납기일자는 " + ls_date + " 부터 +60일 까지(" + ls_date60 + ") 처리가능 합니다.~n~n"
	ls_msg += "현재 60일 경과된 수주내용을 변경하려고 합니다.~n~n현 수주자료의 운송처만 수정됩니다.~n~n"
	ls_msg += "변경 하시겠습니까? ~n~n"

//	ls_msg += string(RelativeDate(date(ld_gftoday1), 60),'yyyy/mm/dd') + ") 처리가능 합니다.~n~n"
	
	ls_shipto_addr = dw_2.object.shipto_addr[1]
	if MessageBox("경고", ls_msg, question!, yesno!, 1) = 1 then
		UPDATE sale SET shipto_addr = :ls_shipto_addr WHERE order_no = :ls_order_no;
		if sqlca.sqlcode <> 0 then
			rollback;
			MessageBox("확인","수주내용의 운송처 변경과정 중 ERROR가 발생하였습니다.")
			return
		else
			COMMIT;
		end if
	end if
	
	dw_2.setcolumn('cust_po_date')
	dw_2.setfocus()
	RETURN
else
	// 요구납기 정상 처리 : 금일부터 60일 이내 
end if

ls_s_scene_tel  = trim(dw_2.object.tel_no[dw_2.getrow()])
ls_s_scene_code = trim(dw_2.object.scene_code[dw_2.getrow()])

l_status        = dw_2.getitemstatus(1, 0, primary!)
li_revision_no  = dw_2.getitemnumber(1, "revision_no")
dw_2.object.login_id[1] = gs_userid
dw_2.accepttext()
dw_3.accepttext()

if dw_3.rowcount() < 1 then
	MessageBox("저장","등록된 물품이 없습니다!",exclamation!)
	return
end if

if isnull(dw_2.object.scene_code[1]) or trim(dw_2.object.scene_code[1]) = "" then
	MessageBox("저장","등록된 현장이 없습니다!",exclamation!)
	return
end if

if isnull(dw_2.object.salesman[1]) or trim(dw_2.object.salesman[1]) = '' then
	MessageBox('경고','선택한 거래처의 담당영업사원이 지정되지 않았습니다.~n~n' + &
	                  '(거래처관리에서 담당영업사원 지정필요)',stopsign!)
	return
end if

if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)
if wf_nullchk(dw_2) = false then return
if wf_nullchk(dw_3) = false then return
if l_status = newmodified! or l_status = new! then
	ls_new_chk = 'Y'
	if isnull(dw_2.object.due_date[1]) then
		MessageBox('확인','납기일자를 입력하세요.')
		dw_2.setcolumn('due_date')
		dw_2.setfocus()
		return
	else		
	end if
	dw_2.object.input_date[1] = gf_today()
	
	dw_6.accepttext()
	//수주번호 부여
	ls_sale_flag = dw_2.getitemstring(1, "sale_flag")
	ls_area      = LeftA(dw_6.object.area[1],1)
	ls_sale_date = string(dw_2.object.order_date[1], "yyyymmdd")
	ls_sale_no1  = ls_area + ls_sale_flag + ls_sale_date + '-' + '%'
		
	SELECT MAX(order_no) INTO :ls_sale_no FROM sale WHERE order_no LIKE :ls_sale_no1;	 
	if isnull(ls_sale_no) or ls_sale_no = '' then
		ls_sale_no1 = ls_area + ls_sale_flag + ls_sale_date + '-' + '001'
	else
		li_seq = integer(MidA(ls_sale_no, 12, 3))
		li_seq = li_seq + 1
		ls_seq = '00' + string(li_seq)
		ls_sale_no1 = LeftA(ls_sale_no1, 11) + RightA(ls_seq, 3)
	end if
				
	for ll_row = 1 to dw_3.rowcount() 
		dw_3.object.order_no[ll_row] = ls_sale_no1
	next
	
	dw_2.object.order_no[1] = ls_sale_no1
	ls_esti_no = dw_2.object.estimate_no[1]
	if isnull(ls_esti_no) or trim(ls_esti_no) = '' then
	else
		UPDATE estimate_head SET sale_succ = 'Y' WHERE estimate_no = :ls_esti_no;
		if sqlca.sqlcode <> 0 then
			rollback;
			MessageBox("삭제","estimate_head UPDATE도중 오류가 발생하였습니다.")
			return
		end if
	end if
// 수정작업시
ELSE
	ls_new_chk = 'N'
	if wf_confirm('N') = false then 
		ls_confirm = dw_2.object.sale_confirm_flag[1]
		if ls_confirm <> 'Y' then
			MessageBox("확인", "이미 확정되어있습니다. 재조회 하십시요")
			RETURN
		end if
		
		wf_update1(dw_2, 'Y')
		UPDATE scene  SET scene_tel  = :ls_s_scene_tel WHERE scene_code = :ls_s_scene_code;
		commit using sqlca;
		return
	end if
	
	ls_sale_no1 = dw_2.getitemstring(1, "order_no")
	for ll_row = 1 to dw_3.rowcount() 
		l_status = dw_3.getitemstatus(ll_row, 0, primary!)
		if l_status = newmodified! or l_status = new! then
			dw_3.object.order_no[ll_row] = ls_sale_no1
		end if
	next
	li_revision_no = li_revision_no + 1
	dw_2.object.revision_no[1] = li_revision_no
end if
	
dw_2.object.revision_date[1] = gf_today()

dw_2.accepttext()
dw_3.accepttext()

//주문수량 입력 CHECK
lr_order_qty = dw_3.getitemdecimal(dw_3.rowcount(), "order_qty")
if lr_order_qty = 0 then
	MessageBox("확인","주문수량을 입력하세요!",exclamation!)
	dw_3.scrolltorow(dw_3.rowcount())
	dw_3.setcolumn("order_qty")
	dw_3.setfocus()
	return
end if
	
//공급가액, V.A.T계산
ls_tax_sign = dw_2.getitemstring(1, "tax_sign")
if dw_3.rowcount() > 0 then
	for ll_row = 1 to dw_3.rowcount() step 1
		lr_amt = lr_amt + dw_3.getitemdecimal(ll_row, "amount")
	next

	dw_2.object.sale_amount[1] = lr_amt
	if ls_tax_sign = 'Y' then
		dw_2.object.sale_tax[1] = 0
		IF dw_2.object.curr_code[1] = 'WON' then
			// 20080123 부가세 계산방식 변경
			dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 0 )
		else
			dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 2 )
		end if
	else
		dw_2.object.sale_tax[1] = 0
	end if
end if

for ll_row = 1 to dw_3.rowcount()
	if dw_3.object.qa[ll_row] = '' or isnull(dw_3.object.qa[ll_row]) then
		MessageBox("확인","규격을 입력하세요!",exclamation!)
		dw_3.scrolltorow(ll_row)			
		dw_3.setcolumn("qa")
		dw_3.setfocus()
		return
	end if
	if dw_3.getitemdecimal(ll_row, "stock_qty") > dw_3.getitemdecimal(ll_row, "order_qty") then
		MessageBox("확인", "장기재고 수량은 주문수량보다 클수 없습니다.")
		dw_3.scrolltorow(ll_row)			
		dw_3.setfocus()
		return
	end if
next

if ls_new_chk = 'Y' then
	integer li_cnt 
	SELECT count(*) INTO :li_cnt FROM sale WHERE order_no LIKE :ls_sale_no1;
	 if li_cnt <> 0 then
		//수주 번호 부여
		ls_sale_flag = dw_2.getitemstring(1, "sale_flag")
		
		ls_area      = LeftA(dw_6.object.area[1],1)
		ls_sale_date = string(dw_2.object.order_date[1], "yyyymmdd")
		ls_sale_no1  = ls_area + ls_sale_flag + ls_sale_date + '-' + '%'
			
		SELECT MAX(order_no) INTO :ls_sale_no FROM sale WHERE order_no LIKE :ls_sale_no1;
		 
		if isnull(ls_sale_no) or ls_sale_no = '' then
			ls_sale_no1 = ls_area + ls_sale_flag + ls_sale_date + '-' + '001'
		else
			li_seq = integer(MidA(ls_sale_no, 12, 3))
			li_seq = li_seq + 1
			ls_seq = '00' + string(li_seq)
			ls_sale_no1 = LeftA(ls_sale_no1, 11) + RightA(ls_seq, 3)
		end if
					
		for ll_row = 1 to dw_3.rowcount() 
			dw_3.object.order_no[ll_row] = ls_sale_no1
		next
		dw_2.object.order_no[1] = ls_sale_no1
		dw_2.accepttext()
		dw_3.accepttext()
	else
	end if
end if

if wf_update2(dw_2, dw_3, 'Y') = false then RETURN
UPDATE scene SET scene_tel = :ls_s_scene_tel WHERE scene_code = :ls_s_scene_code;
COMMIT USING sqlca;

dw_1.object.cust_no[1] = dw_2.object.cust_no[1]
em_1.text = string(dw_2.object.order_date[1], "YYYY/MM/DD")
em_2.text = string(dw_2.object.order_date[1], "YYYY/MM/DD")
dw_2.setredraw(false)
dw_3.setredraw(false)
dw_4.setredraw(false)

string ls_cust_no, ls_sdate, ls_edate
date   ld_start_date, ld_end_date

ls_cust_no    = trim(dw_1.object.cust_no[1])
//ld_start_date = date(em_1.text)
//ld_end_date   = date(em_2.text)
//dw_4.retrieve( ls_cust_no, ld_start_date, ld_end_date )
ls_sdate      = em_1.text
ls_edate      = em_2.text
dw_4.retrieve( ls_cust_no, ls_sdate, ls_edate )

dw_4.setredraw(true)
ll_row = dw_4.Find( "order_no = '"+ ls_sale_no1 +"'", 1, dw_4.rowcount())
dw_4.scrolltorow(ll_row)
dw_2.setredraw(true)
dw_3.setredraw(true)

// 출고시에 수주번호+순번으로 출고수량 재 계산함으로 수정불가
cb_5.enabled = false	// 순서(상)
cb_6.enabled = false	// 순서(하)

// 커서 이동하기
em_4.setfocus()

end event

type dw_1 from w_inheritance`dw_1 within w_orsale_m
integer x = 965
integer y = 244
integer width = 859
integer height = 84
integer taborder = 100
string dataobject = "d_orcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;//////////////////////////////////////////////////////////////////////
//// 공무관리담당자는 거래처변경 못함
//////////////////////////////////////////////////////////////////////
if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
	// N011 : 모듈러사업부, N014 : (주)유창플러스
	if this.object.cust_no[row] = "N014" then
	else
		MessageBox("확인1","공무관리담당자는 (주)유창플러스만 선택할 수 있습니다!",exclamation!)
		this.object.cust_no[row] = "N014"
		return 2
	end if
else
	cb_filteroff.triggerevent(clicked!)
	pb_retrieve.postevent(clicked!)
end if
//////////////////////////////////////////////////////////////////////

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
		// N011 : 모듈러사업부, N014 : (주)유창플러스
		if this.object.cust_no[dw_1.getrow()] = "N014" then
		else
			MessageBox("확인3","공무관리담당자는 (주)유창플러스만 선택할 수 있습니다!",exclamation!)
			this.object.cust_no[dw_1.getrow()] = "N014"
		end if
	end if
	//////////////////////////////////////////////////////////////////////	
end if

end event

type dw_2 from w_inheritance`dw_2 within w_orsale_m
integer x = 2016
integer y = 216
integer width = 2862
integer height = 984
integer taborder = 120
string dataobject = "d_orsale_m"
end type

event dw_2::itemchanged;string   ls_where, ls_sql, ls_salesman, ls_cust_addr
string   ls_data, ls_level, ls_scene_addr, ls_tel_no, ls_curr
long     ll_found, ll_row1, ll_cnt, ll_cnt1, ll_cnt2, ll_cnt3, ll_credit_limit
decimal  lr_amt, lr_saleamt
datetime ld_date 
date     ld_pdate
string   ls_start, ls_end, ls_date, ls_null
string   ls_sale_control, ls_cust_chk

this.accepttext()
setnull(ls_null)

choose case dwo.name
	case "order_date"
		// 당월 수주금액
		ls_start = string(dw_2.object.order_date[1],"yyyy/mm/01")
		SELECT TOP 1 CONVERT(CHAR(10), DATEADD( DAY, -DATEPART(DD,GETDATE()), DATEADD(MONTH,1,GETDATE()) ), 111)
		  INTO :ls_end
		  FROM LOGIN;
		lr_saleamt = wf_saleamt( dw_2.object.cust_no[1], ls_start, ls_end )
		st_saleamt.text = string(lr_saleamt, "#,##0")
		st_saleamt.visible = true
		
	case 'cust_no'
		this.getchild("cust_no", idwc_cust)
		
		//////////////////////////////////////////////////////////////////////
		//// 공무관리담당자는 거래처변경 못함
		//////////////////////////////////////////////////////////////////////
		if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
			// N011 : 모듈러사업부, N014 : (주)유창플러스
			if this.object.cust_no[row] = "N014" then
			else
				MessageBox("확인","공무관리담당자는 (주)유창플러스만 선택할 수 있습니다!",exclamation!)
				return 1
			end if
		end if
		//////////////////////////////////////////////////////////////////////

		ls_data = data
		select count(*) into :ll_found from customer
		 where cust_no = :ls_data;
		if ll_found = 0 then
			MessageBox("확인","위와 같은고객이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		select count(*) into :ll_found from customer
		 where cust_no = :ls_data
		 	and open_close = 'C';
		if ll_found = 1 then
			MessageBox("확인","사용불가중인 거래처입니다. ~r~n" &
									+ "거래처 RELOAD를 하신후 사용하시기 바랍니다.!",exclamation!)
			return 1
		end if

		select isnull(sale_control,'N') into :ls_sale_control 
		  from customer
		 where cust_no = :ls_data;
		if ls_sale_control = 'A' or ls_sale_control = 'Y' then // 매출통제
			MessageBox("확인","매출통제 대상 거래처입니다.~r~n~n영업지원팀에 문의 바랍니다.!",stopsign!)
		 //return 1
		end if
		
		//거래처 등급체크
		SELECT credit_level, salesman,  shipto_addr,   tel_no,     curr_code, credit_limit
		  INTO :ls_level, :ls_salesman, :ls_cust_addr, :ls_tel_no, :ls_curr, :ll_credit_limit 
		  FROM customer
		 WHERE cust_no  = :ls_data;
		
		// 당월 수주금액
		ls_start = string(dw_2.object.order_date[1],"yyyy/mm/01")
		SELECT TOP 1 CONVERT(CHAR(10), DATEADD( DAY, -DATEPART(DD,GETDATE()), DATEADD(MONTH,1,GETDATE()) ), 111)
		  INTO :ls_end
		  FROM LOGIN;
		  
		lr_saleamt = wf_saleamt( dw_2.object.cust_no[1], ls_start, ls_end )
		st_saleamt.text = string(lr_saleamt, "#,##0")
		st_saleamt.visible = true
		
		// 신용등급 표기
		this.object.credit_level[1] = ls_level
		// 여신한도액 표기
		this.object.credit_limit[1] = ll_credit_limit
		 
      //2008-01-09 h등급 s와 동급으로 처리.				 
      //if ls_level = 'F' or ls_level = 'G' or ls_level = 'H' then
		if ls_level = 'V' or ls_level = 'X' then
			MessageBox("확인","수주입력이 불가한 거래처등급(V,X)입니다.!~r~n판매지원팀에 문의바랍니다.",exclamation!)
			return 1
		end if
		
		//거래처 3개월동안 매출수금 체크
		//		aroivc
		//		do
		if ls_level = 'A' or ls_level = 'B' or ls_level = 'C' or ls_level = 'E' or ls_level = 'S' then
			SELECT top 1 dateadd(month, -4 , getdate()) INTO :ld_date 
			  FROM login 
			 WHERE user_id   = :gs_userid;
			ls_date  = string(year(date(ld_date))) + "/" + string(month(date(ld_date))) + '/01'
			ld_pdate = date(ls_date)
			
			ll_cnt1 = 0
			select count(*) into :ll_cnt1 from do
			 where cust_no = :ls_data and do_date > :ld_pdate;
			 
			ll_cnt2 = 0
			select count(*) into :ll_cnt2 from aroivc
			 where cust_no = :ls_data
				and oi_date > :ld_pdate	and delete_key = 'N';
				
			ll_cnt3 = 0
			select count(*) into :ll_cnt3 from customer 
			 where cust_no = :ls_data and last_tn_date > :ld_pdate;
			
			if ll_cnt1 + ll_cnt2 + ll_cnt3 = 0 then
				MessageBox("확인","수주입력이 불가한(3개월동안 거래가 없는) 거래처입니다.!~r~n " &
								+ "판매지원팀에 문의바랍니다. ~r~n" &
								+ "판매거래처관리의 최종거래일자를 3개월 이내로 조정하세요.",exclamation!)
				return 1
			end if
		end if
		
		choose case trim(data)
			case "N004"				// 건축사업본부 
				this.object.ship_flag[1] = 'A'
			case "N009", "N011"	// 유창부설연구소, 모듈러사업부
				this.object.ship_flag[1] = 'R'
		end choose
		
		this.object.scene_code[1] = ls_null
		SELECT count(*) INTO :ll_cnt FROM scene WHERE cust_no = :ls_data;
		 
		idwc_scene.reset() 
		if ll_cnt > 0 then
			// 선택한 거래처의 현장만 보여주기
			wf_sceneretrieve(ls_data)
		end if
		
		if idwc_scene.rowcount() > 0 then
			this.object.protect[1] = 'N'
		else
			this.object.protect[1] = 'Y'
		end if
		
		if isnull(ls_salesman) or trim(ls_salesman) = '' then
			MessageBox('경고','선택한 거래처의 담당영업사원이 지정되지 않았습니다.~n~n' + &
									'영업지원팀에 문의 바랍니다.(거래처관리에서 담당영업사원 지정)',stopsign!)
		end if
		this.object.curr_code[1]   = ls_curr		// 통화코드
		this.object.salesman[1]    = ls_salesman	// 영업담당자
		this.object.shipto_addr[1] = ls_cust_addr	// 거래처주소
		this.object.tel_no[1]      = ls_tel_no		// 거래처전화

		this.object.cust_no.background.color = rgb(192,192,192)
		this.object.cust_no.protect = 1
//		this.setcolumn("estimate_no")

		this.setcolumn("scene_code")
		this.setfocus()
		
	case 'scene_code'
		ls_data = data
		SELECT count(*) INTO :ll_found FROM scene WHERE scene_code  = :ls_data;
		if ll_found = 0 then
			MessageBox("확인","위와 같은현장은 존재하지 않습니다!",exclamation!)
			return 1
		else
			
		end if

      pb_1.enabled = true	// 라인추가
		cb_3.enabled = true	// 가져오기

		this.getchild("scene_code", idwc_scene)
		ls_scene_addr = trim(idwc_scene.getitemstring(idwc_scene.getrow(), "scene_addr"))
		ls_tel_no     = trim(idwc_scene.getitemstring(idwc_scene.getrow(), "scene_tel"))

		this.object.shipto_addr[1] = ls_scene_addr
		this.object.tel_no[1]      = ls_tel_no
		this.setcolumn("order_date")
		this.setfocus()
		
	case 'tax_sign'
		lr_amt = this.getitemdecimal(1, "sale_amount")
		if data = 'Y' then
			dw_3.Accepttext()
			this.object.sale_tax[1] = 0
			IF this.object.curr_code[1] = 'WON' then	// 20080123 부가세 계산방식 변경
				dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 0 )
			else
				dw_2.object.sale_tax[1] = TRUNCATE((lr_amt / 10) + 0.0000001, 2 )
			end if
		else
			this.object.sale_tax[1] = 0
		end if
		
	case 'cust_po_date'
		if this.object.order_date[1] > this.object.cust_po_date[1]  then
			MessageBox("확인","주문일자보다 요구납기가 늦습니다.!",exclamation!)
			return 1
		end if
		/////////////////////////
		// 요구납기 CHECK
		/////////////////////////
		DateTime ld_podate,   ld_gftoday1
		Int      li_date30, li_today1
		
		ld_podate = this.object.cust_po_date[1]
		ld_gftoday1 = GF_TODAY()
		li_today1 = DaysAfter(date(ld_gftoday1), date(ld_podate))
		if li_today1 < 0 then li_today1 = li_today1 * -1
		if li_today1 > 60 then 
			MessageBox("경고", "요구납기일자는 " + LeftA(String(ld_gftoday1),10) + " 부터 +60일 까지(" + String(RelativeDate(date(ld_gftoday1), 60),'yyyy/mm/dd') + ") 처리가능 합니다.")  
			dw_2.setcolumn('cust_po_date')
			dw_2.setfocus()
			RETURN
		else
			// 요구납기 정상 처리 : 금일부터 60일 이내 
		end if
		this.object.due_date[1] = this.object.cust_po_date[1]
		
	case 'due_date'
		if this.object.order_date[1] > this.object.due_date[1]  then
			MessageBox("확인","주문일자보다 확정납기가 늦습니다.!",exclamation!)
			return 1
		end if
		/////////////////////////
		// 확정납기 CHECK
		/////////////////////////
		DateTime ld_duedate,   ld_gftoday, ld_ship_date
		Int      li_date60, li_today
		
		ld_duedate = this.object.due_date[1]
		ld_gftoday = GF_TODAY()
		li_today = DaysAfter(date(ld_gftoday), date(ld_duedate))
		if li_today < 0 then li_today = li_today * -1
		if li_today > 60 then 
			MessageBox("경고", "납기일자는 " + LeftA(String(ld_gftoday),10) + " 부터 +60일 까지(" + String(RelativeDate(date(ld_gftoday), 60),'yyyy/mm/dd') + ") 처리가능 합니다.")  
			dw_2.setcolumn('due_date')
			dw_2.setfocus()
			RETURN
		else
			// 확정납기 정상 처리 : 금일부터 60일 이내 
		end if
		
		IF isnull(string(this.object.cust_po_date[1])) then
			this.object.cust_po_date[1] = this.object.due_date[1]
		end if
		
	case 'ship_flag'
		if data = 'M' or data = 'H' or data = 'T' or data = 'P' or data = 'Y' then //각 방문, Y:YSP사업장은 sort가 null
			this.object.shipamt_case[1] = 'C'	//현금
		end if
		if data = 'D' or data = 'B' then		   //부담,대여
			this.object.shipamt_case[1] = 'R'	//외상
		end if		
end choose

RETURN 0

end event

event dw_2::retrieveend;string ls_confirm_flag, ls_orderno

this.object.cust_no.background.color = RGB(192,192,192)
this.object.cust_no.protect = 1

if this.getrow() > 0 then
	ls_confirm_flag = this.getitemstring(1, "sale_confirm_flag")
	if (ls_confirm_flag = 'T') or (ls_confirm_flag = 'Y') then	// T: 수주, Y: 생산
		pb_1.enabled = false	// 추가
		ls_orderno   =  this.object.order_no[1]
//		if ls_orderno = "" or isnull(ls_orderno) then
//		else
			pb_2.enabled = false // 품목삭제
//		end if
		pb_3.enabled = false	// 다중추가
		dw_3.Modify("datawindow.readonly = yes")
	else
		pb_1.enabled = true	// 추가
		pb_2.enabled = true  // 품목삭제
		pb_3.enabled = true	// 다중추가
		dw_3.modify("datawindow.readonly = no")
	end if
	
	wf_sceneretrieve(dw_2.object.cust_no[dw_2.getrow()])
end if

end event

event dw_2::itemerror;string   ls_null
datetime ldt_null

setnull(ldt_null)
setnull(ls_null)

choose case dwo.name
	case "cust_no"
		this.object.cust_no[1] = ls_null
		
	case "scene_code"
		this.object.scene_code[1] = ls_null
		
	case "class"
		this.object.class[1] = 0
		
	case "due_date"
		this.object.due_date[1]     = ldt_null
		this.object.cust_po_date[1] = ldt_null
end choose

return 2
end event

event dw_2::rbuttondown;string ls_confirm_flag

this.accepttext()
if this.rowcount() < 1 then return

ls_confirm_flag = this.getitemstring(1, "sale_confirm_flag")
if ls_confirm_flag = 'Y' then
	return
end if

string   ls_color
gs_where lst_code

this.accepttext()

choose case dwo.name
	case 'color'
		openwithparm(w_whcolor_m, lst_code)
		lst_code = message.powerobjectparm
		if lst_code.chk = "N" then return

		this.getchild("color", idwc_color)
		idwc_color.SetTransObject(sqlca)
		idwc_color.retrieve()
		this.object.color[1] = lst_code.str1
end choose
//
end event

event dw_2::buttonclicked;call super::buttonclicked;//
gs_where lst_where

lst_where.str1 = "KD" + string(today(), "yyyymmdd")
lst_where.str2 = "S"
OpenWithParm (w_oeesti_w, lst_where) 


end event

event dw_2::doubleclicked;call super::doubleclicked;if row < 1 then return 

//// 공무관리담당자는 거래처변경 못함
if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
	return
end if

if dw_3.rowcount() > 0 then 
	messagebox('경고', ' 하단에 물품을 선택한다음 거래처나 현장을 변경하시면,~r~n~r~n 최근단가를 다시 가져올수 없습니다.~r~n~r~n 거래처 나 현장을 변경할경우 하단의 내용을 삭제후 다시 작업하세요.', stopsign!)
end if

if trim(this.object.order_no[row]) = '' or isnull(this.object.order_no[row]) then
	choose case dwo.name
		case 'cust_no_t','scene_code_t'
			Open(w_orcust_s) 
	end choose
end if


end event

event dw_2::keydown;call super::keydown;// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
IF keyflags = 2 THEN
	IF key = KeyS! THEN
		if MessageBox("확인", "수주내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_save.triggerevent(clicked!)
		end if
	END IF
END IF

end event

event dw_2::clicked;call super::clicked;//
choose case dwo.name
	case "scene_code"
		this.scrolltorow(row)
		
	case else
end choose

end event

event dw_2::getfocus;call super::getfocus;//
// Enter시 수주내용 삭제 예방

pb_cancel.default =  false



end event

type st_title from w_inheritance`st_title within w_orsale_m
integer x = 37
integer y = 32
integer width = 859
string text = "판매수주관리"
end type

type st_tips from w_inheritance`st_tips within w_orsale_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsale_m
integer x = 2619
integer y = 1276
integer width = 366
integer height = 112
integer taborder = 260
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
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

type pb_print_part from w_inheritance`pb_print_part within w_orsale_m
integer x = 3410
integer y = 40
integer width = 389
integer taborder = 280
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

type pb_close from w_inheritance`pb_close within w_orsale_m
integer x = 4677
integer y = 40
integer width = 178
integer taborder = 360
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsale_m
integer x = 3858
integer y = 40
integer width = 178
integer taborder = 300
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
	ist_code.do_flag = '%'
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
//ls_dw5sql = dw_5.describe("datawindow.table.select")

if ist_code.order_flag = 'O' then	// 수주번호
//	ls_where = " where sale.order_no between ~~'" + ist_code.start_no + "~~'" &
//				+ " and ~~'" + ist_code.end_no + "~~'" 
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
	
//	dw_5.modify(ls_sql)		
//	dw_5.retrieve(	ls_scenehp )
	dw_5.dataobject = 'd_orsale_print2'
	dw_5.settrans( sqlca)

	dw_5.retrieve( ls_scenehp, ist_code.start_no,  ist_code.end_no, ist_code.do_flag)
else											// 수주일자
//	ls_where = " where sale.order_date between ~~'" + ist_code.start_date + "~~'" &
//				+ " and ~~'" + ist_code.end_date + "~~'"  &
//				+ " and sale.confirm_flag like ~~'" + ist_code.do_flag + "~~'"
//	
//	ls_sql = "datawindow.table.select = '" + ls_dw5sql + ls_where + "'"
	
//	dw_5.modify(ls_sql)			
//	dw_5.retrieve()

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

type pb_cancel from w_inheritance`pb_cancel within w_orsale_m
integer x = 1623
integer y = 64
integer width = 151
integer height = 116
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

st_saleamt.text    = "0"
st_saleamt.visible = false
dw_2.reset()
dw_3.reset()

ls_orderno = TRIM(em_3.TEXT) + '-' + RightA ( '000' + trim(em_4.text), 3)
if isnull(ls_orderno) or ls_orderno = '' then return

/////////////////////////////////////////////////////
// 공무관리담당자는 거래처변경 못함
/////////////////////////////////////////////////////
if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
	select cust_no into :ls_custno 
	  from sale
	 where order_no = :ls_orderno;
	if isnull(ls_custno) or ls_custno = "" or ls_custno <> "N014" then return 
end if
/////////////////////////////////////////////////////

select count(*) into :ll_row from sale where order_no = :ls_orderno;
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
	st_saleamt.text    = string(lr_saleamt, "#,##0")
	st_saleamt.visible = true

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

// 출고시에 수주번호+순번으로 출고수량 재 계산함으로 수정불가
cb_5.enabled = false	// 순서(상)
cb_6.enabled = false	// 순서(하)

// 기본값 변경
pb_save.default = true

end event

type pb_delete from w_inheritance`pb_delete within w_orsale_m
integer x = 4224
integer y = 40
integer width = 178
integer taborder = 340
end type

event pb_delete::clicked;dwitemstatus l_status
long   ll_row, ll_count, ll_cnt
string ls_custno, ls_order_no, ls_esti_no, ls_reqno, ls_chk

if dw_2.rowcount() < 1 then return

dw_2.accepttext()
dw_3.accepttext()

l_status    = dw_2.getitemstatus(1, 0, primary!)
ls_custno   = dw_2.object.cust_no[1] 
ls_esti_no  = trim(dw_2.object.estimate_no[1])
ls_order_no = dw_2.object.order_no[1] 
ls_chk      = 'N'

if MessageBox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 2 then return
if wf_confirm('Y') = false then 
	//messagebox("확인","이미 확정된 수주이므로 삭제할 수 없습니다!",information!)
	return
end if

if l_status = newmodified! or l_status = new! then
	dw_2.reset()
	dw_3.reset()
else
	SELECT COUNT(*) INTO :ll_count FROM saledet WHERE order_no = :ls_order_no AND rlse_qty > 0;
	IF ll_count > 0 THEN
		MessageBox("확인","이미 출고된 수주이므로 삭제할 수 없습니다!",information!)
	else
		// 주문관리
		SELECT order_no INTO :ls_reqno FROM saletemp WHERE sale_no = :ls_order_no;
		if isnull(ls_reqno) or ls_reqno = "" then
		else
			// 접수: sale_no = order_no, jupsu_flag = 'Y', jupsu_date = getdate()
			UPDATE saletemp 
			   SET sale_no = null, jupsu_flag = null, jupsu_date = null
			 WHERE sale_no = :ls_order_no;
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox("확인","주문상태 변경saletemp 변경중 오류가 발생하였습니다.")
				return
			end if
		end if
		
		// 견적서
		if isnull(ls_esti_no) or trim(ls_esti_no) = "" then
		else
			UPDATE estimate_head SET sale_succ = 'N' WHERE estimate_no = :ls_esti_no;
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox("삭제","estimate_head UPDATE도중 오류가 발생하였습니다.")
				return
			end if
		end if
		
		// 대체물품
		SELECT count(*) INTO :ll_cnt FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
		if ll_cnt > 0 then
			DELETE FROM itemalter WHERE order_no = :ls_order_no AND issue_flag = 'N';
			if sqlca.sqlcode <> 0 then
				rollback;
				MessageBox("삭제","itemalter삭제도중 오류가 발생하였습니다.")
				return
			end if	
		end if
		
		// 수주상세
		DELETE FROM saledet WHERE order_no = :ls_order_no;
		if sqlca.sqlcode <> 0 then
			rollback;
			MessageBox("삭제","saledet삭제도중 오류가 발생하였습니다.")
			return
		end if
		dw_3.reset()
		
		// 수주헤더
		dw_2.deleterow(1)
		
		// 삭제저장
		if wf_update1(dw_2,'Y') = false then return
		

		// 수주목록
		dw_4.deleterow(dw_4.getrow())
		dw_4.accepttext()
		if dw_4.rowcount() > 0 then
			dw_2.retrieve(dw_4.getitemstring(dw_4.getrow(), "order_no"))
			dw_3.retrieve(dw_4.getitemstring(dw_4.getrow(), "order_no"))
		else
			dw_3.reset()
		end if		
	end if
end if

end event

type pb_insert from w_inheritance`pb_insert within w_orsale_m
integer x = 4041
integer y = 40
integer width = 178
integer taborder = 320
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;long   ll_row
string ls_orderno

st_saleamt.text    = "0"
st_saleamt.visible = false
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
dw_3.modify("datawindow.readonly = no")


pb_1.enabled = true	// 추가
pb_2.enabled = true	// 삭제
pb_3.enabled = true	// 다중추가


// 출고시에 수주번호+순번으로 출고수량 재 계산함으로 수정불가
cb_5.enabled = true	// 순서(상)
cb_6.enabled = true	// 순서(하)

pb_1.enabled = false	// 라인추가

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsale_m
integer x = 805
integer y = 228
integer width = 137
integer height = 104
integer taborder = 90
end type

event pb_retrieve::clicked;string ls_custno, ls_sdate, ls_edate

//////////////////////////////////////////////////////////////////////
//// 공무관리담당자는 거래처변경 못함
//////////////////////////////////////////////////////////////////////
if GF_PERMISSION("공무관리담당자", gs_userid) = 'Y' then
	// N011 : 모듈러사업부, N014 : (주)유창플러스
	if dw_1.object.cust_no[dw_1.getrow()] = "N014" then
	else
		MessageBox("확인2","공무관리담당자는 (주)유창플러스만 선택할 수 있습니다!",exclamation!)
		dw_1.object.cust_no[dw_1.getrow()] = "N014"
		return
	end if
end if
//////////////////////////////////////////////////////////////////////


////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================

st_saleamt.visible = true
cb_filteroff.triggerevent(clicked!)

dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_1.accepttext()

ls_custno  = trim(dw_1.object.cust_no[1])
ls_sdate   = em_1.text
ls_edate   = em_2.text

// 출고시에 수주번호+순번으로 출고수량 재 계산함으로 수정불가
cb_5.enabled = false	// 순서(상)
cb_6.enabled = false	// 순서(하)

dw_4.retrieve( ls_custno, ls_sdate, ls_edate )
dw_4.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_orsale_m
integer x = 1801
integer y = 12
integer width = 576
integer height = 180
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "사업장"
end type

type gb_2 from w_inheritance`gb_2 within w_orsale_m
integer x = 27
integer y = 192
integer width = 1984
integer height = 1008
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 16711680
string text = "판매수주 거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_orsale_m
integer x = 2670
integer y = 0
integer width = 2208
integer taborder = 380
end type

type gb_6 from groupbox within w_orsale_m
integer x = 937
integer y = 12
integer width = 855
integer height = 180
integer taborder = 400
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

type dw_4 from datawindow within w_orsale_m
integer x = 41
integer y = 472
integer width = 1957
integer height = 716
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_ororder_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event rowfocuschanged;//
if this.getrow() < 1 then return

wf_ret(this.object.order_no[this.getrow()])
if dw_3.rowcount() > 0 then
	string  ls_start, ls_end
	decimal lr_saleamt
	
	// 당월 수주금액
	ls_start = string(dw_2.object.order_date[1],"yyyy/mm/01")
	SELECT TOP 1 CONVERT(CHAR(10), DATEADD( DAY, -DATEPART(DD,GETDATE()), DATEADD(MONTH,1,GETDATE()) ), 111)
	  INTO :ls_end
	  FROM LOGIN;
	lr_saleamt = wf_saleamt( dw_2.object.cust_no[1], ls_start, ls_end )
	st_saleamt.text    = string(lr_saleamt, "#,##0")
	st_saleamt.visible = true
else
	st_saleamt.text    = string(0, "#,##0")
	st_saleamt.visible = false	
end if
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

type pb_1 from picturebutton within w_orsale_m
event mousemove pbm_mousemove
integer x = 4261
integer y = 1276
integer width = 155
integer height = 112
integer taborder = 230
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "c:\bmp\pencil.bmp"
string disabledname = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

event clicked;long    ll_row, ll_seq, ll_front
decimal lr_order_qty
string  ls_cust, ls_orderno

this.default = false
dw_2.accepttext()
if dw_2.rowcount() < 1 then return

ls_cust = dw_2.object.cust_no[1]
if isnull(ls_cust) or trim(ls_cust) = '' then
	messagebox("확인","거래처를 입력하세요!",exclamation!)
	dw_2.setcolumn("cust_no")
	dw_2.setfocus()
	return
end if
if wf_nullchk(dw_3) = false then	return


dw_3.accepttext()
if wf_confirm('Y')  = false then return

if dw_3.getrow() > 0 then
	lr_order_qty = dw_3.getitemdecimal(dw_3.getrow(), "order_qty")
	if lr_order_qty = 0 then
		messagebox("확인","주문수량을 입력하세요!",exclamation!)
		dw_3.setcolumn("order_qty")
		dw_3.setfocus()
		return
	end if
end if

ll_row = dw_3.insertrow(0)
dw_3.scrolltorow(ll_row)
ll_seq = dw_3.rowcount()
if ll_seq > 1 then
	ll_front = dw_3.object.seq_no[ll_row - 1]
	dw_3.object.seq_no[ll_row] = ll_front + 1
else
	dw_3.object.seq_no[ll_row] = ll_row
end if

dw_3.setcolumn("item_no")
dw_3.setfocus()

end event

type pb_2 from picturebutton within w_orsale_m
event mousemove pbm_mousemove
integer x = 4425
integer y = 1276
integer width = 155
integer height = 112
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)
end event

event clicked;dwitemstatus l_status
string   ls_vat,  ls_item_no, ls_com_item, ls_com_item1, ls_com_item2, ls_order_no
integer  li_revision_no, li_flag
datetime ldt_date

if dw_3.rowcount() < 1 then return

dw_2.accepttext()
dw_3.accepttext()
l_status = dw_3.getitemstatus(dw_3.getrow(), 0, primary!)
li_revision_no = dw_2.getitemnumber(1, "revision_no")

if wf_confirm('Y') = false then return

if dw_3.object.rlse_qty[dw_3.getrow()] > 0 then
	messagebox("확인","이미 출고된 수주입니다." + &
              "~r~n물품을 삭제할 수 없습니다.", exclamation!)
   return
end if

if dw_3.rowcount() > 0 then
	ls_item_no = dw_3.getitemstring(dw_3.getrow(), "item_no")
	if l_status = newmodified! then
		
		dw_3.deleterow(dw_3.getrow())
		wf_calc()
		
	elseif messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
		ls_com_item  = LeftA(ls_item_no, 1)
		ls_com_item1 = MidA(ls_item_no, 3, 1)
		ls_com_item2 = MidA(ls_item_no, 7, 1)
		
		dw_3.deleterow(dw_3.getrow())
		li_revision_no = li_revision_no + 1
		select getdate() into :ldt_date from login where user_id = :gs_userid;
		dw_2.object.revision_no[1]   = li_revision_no
		dw_2.object.revision_date[1] = ldt_date
		dw_2.accepttext()
		dw_3.accepttext()
		
		wf_calc()
				
	end if
end if
end event

type rb_1 from radiobutton within w_orsale_m
integer x = 827
integer y = 1312
integer width = 219
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "Y.S.P"
boolean righttoleft = true
end type

event clicked;//if gs_area = "B0001" THEN   // YSP사업장
	if this.checked = true then
		idwc_item.setfilter("item_no LIKE '%CY%'")
		idwc_item.filter()
		idwc_item.setsort("item_no D")
		idwc_item.SORT()
//	else
//		idwc_item.setfilter("item_no not LIKE '%CY%'")
//		idwc_item.filter()
//		idwc_item.setsort("item_no A")
//		idwc_item.SORT()
	end if
//end if
end event

type rb_2 from radiobutton within w_orsale_m
integer x = 1070
integer y = 1312
integer width = 178
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "시화"
boolean righttoleft = true
end type

event clicked;//if gs_area = "B0001" THEN   // YSP사업장
	if this.checked = true then
//		idwc_item.setfilter("item_no LIKE '%CY%'")
//		idwc_item.filter()
//		idwc_item.setsort("item_no D")
//		idwc_item.SORT()
//	else
		idwc_item.setfilter("item_no not LIKE '%CY%'")
		idwc_item.filter()
		idwc_item.setsort("item_no A")
		idwc_item.SORT()
	end if
//end if
end event

type rb_3 from radiobutton within w_orsale_m
integer x = 1271
integer y = 1312
integer width = 178
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean righttoleft = true
end type

event clicked;//if gs_area = "B0001" THEN   // YSP사업장
	if this.checked = true then
//		idwc_item.setfilter("item_no LIKE '%CY%'")
//		idwc_item.filter()
//		idwc_item.setsort("item_no D")
//		idwc_item.SORT()
//	else
		idwc_item.setfilter("")
		idwc_item.filter()
		idwc_item.setsort("item_no A")
		idwc_item.SORT()
	end if
//end if
end event

type dw_6 from datawindow within w_orsale_m
integer x = 1824
integer y = 80
integer width = 521
integer height = 80
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
if dw_6.object.area[1] = "B0001" then	// YSP사업장	
	rb_1.checked = true						// Y.S.P 사업장 품목 필터링
	rb_1.triggerevent(clicked!)
else												// S0001 //: 시화
	rb_2.checked = true						// 시화사업장 품목 필터링
	rb_2.triggerevent(clicked!)
end if

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

type em_3 from editmask within w_orsale_m
event keydown pbm_dwnkey
integer x = 960
integer y = 76
integer width = 379
integer height = 92
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

type st_1 from statictext within w_orsale_m
integer x = 402
integer y = 256
integer width = 46
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_orsale_m
integer x = 439
integer y = 244
integer width = 357
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

type em_1 from editmask within w_orsale_m
integer x = 46
integer y = 244
integer width = 357
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

type em_4 from editmask within w_orsale_m
integer x = 1381
integer y = 76
integer width = 151
integer height = 92
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

type st_2 from statictext within w_orsale_m
integer x = 1339
integer y = 92
integer width = 46
integer height = 76
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

type st_4 from statictext within w_orsale_m
integer x = 32
integer y = 1216
integer width = 1819
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "중량 계산은 ~'생산관리 => 기준정보 => 품목별 코일규격관리~'에서 등록"
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type cb_5 from commandbutton within w_orsale_m
integer x = 32
integer y = 1300
integer width = 137
integer height = 92
integer taborder = 150
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "▲"
end type

event clicked;// 출고시에 수주번호+순번으로 출고수량 재 계산함으로 수정불가

long   ll_row, ll_curseq, ll_chk
string ls_orderno


dw_2.accepttext()
dw_3.accepttext()

ls_orderno = trim(dw_2.object.order_no [dw_2.getrow()])
if isnull(ls_orderno) or ls_orderno = "" then
else
	MessageBox("확인","출고시에 수주번호+순번으로 출고수량을 재 계산함으로 수정불가")
	return
end if

ll_row = dw_3.getrow()
if ll_row <= 1 then return

ll_curseq = dw_3.object.seq_no[ll_row]
if ll_curseq = 1 or ll_curseq = 0 then return

dw_3.setredraw(false)
ll_chk = ll_row - 1
dw_3.object.seq_no[ll_row]     = dw_3.object.seq_no[ll_chk]
dw_3.object.seq_no[ll_row - 1] = ll_curseq
dw_3.sort()
dw_3.scrolltorow(ll_row - 1)
dw_3.setredraw(true)

end event

type cb_6 from commandbutton within w_orsale_m
integer x = 174
integer y = 1300
integer width = 137
integer height = 92
integer taborder = 210
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "▼"
end type

event clicked;// 출고시에 수주번호+순번으로 출고수량 재 계산함으로 수정불가

long   ll_row, ll_curseq, ll_chk
string ls_orderno

dw_2.accepttext()
ls_orderno = trim(dw_2.object.order_no[dw_2.getrow()])
if isnull(ls_orderno) or ls_orderno = "" then
else
	MessageBox("확인","출고시에 수주번호+순번으로 출고수량을 재 계산함으로 수정불가")
	return
end if

dw_3.accepttext()

ll_row = dw_3.getrow()
if ll_row < 1 then return

ll_curseq    = dw_3.object.seq_no[ll_row]
if ll_curseq = 0 or ll_curseq = dw_3.rowcount() then return

dw_3.setredraw(false)
ll_chk  = ll_row + 1
dw_3.object.seq_no[ll_row]     = dw_3.object.seq_no[ll_chk]
dw_3.object.seq_no[ll_row + 1] = ll_curseq
dw_3.sort()
dw_3.scrolltorow(ll_row + 1)
dw_3.setredraw(true)

end event

type cb_3 from commandbutton within w_orsale_m
integer x = 2359
integer y = 1276
integer width = 261
integer height = 112
integer taborder = 270
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "가져오기"
end type

event clicked;// 가져오기
if dw_2.rowcount() < 1 then return 
if wf_confirm('Y') = false then return

DataStore dw_excel

string ls_cost
string ls_null, ls_item_no, ls_item_name, ls_qa, ls_qa_chk, ls_uom, ls_color_no, ls_color_name
long   ll_dwcnt, ll_i, ll_x, ll_y, ll_row, ll_lenth, ll_count_chk, ll_rowcnt
real   lr_price_a, lr_order_qty, lr_acc_qty

SetNull(ls_null)
dw_8.SetTransObject(sqlca)
dw_8.reset()

// 단가규칙 적용
if MessageBox("단가규칙", "가져오기의 파일단가를 적용 하시겠습니까?", Exclamation!, YesNo!, 2) = 1 then 
	ls_cost = "Y"
else
	ls_cost = "N"
end if
	 
// ITEM_NO, QA, PRICE, COLOR
dw_excel = CREATE datastore
dw_excel.DataObject = 'd_orsale_import'		// 'd_orsaledet_import_m'
dw_excel.SetTransObject(sqlca)
dw_excel.reset()

dw_excel.ImportFile( ls_null )
ll_dwcnt = dw_excel.rowcount()

SetPointer(HourGlass!)
is_import_chk = 'O'
//dw_3.setredraw(false)
for ll_i = 1 to ll_dwcnt
	dw_3.AcceptText()
	pb_1.triggerevent(clicked!)	// 행추가

   // 품목
	ls_item_no = dw_excel.object.item_no[ll_i]
	SELECT item_name INTO :ls_item_name FROM groupitem WHERE item_no = :ls_item_no;
	IF SQLCA.SQLCode <> 0 THEN 
		dw_8.insertrow(0)		
		ll_rowcnt = ll_rowcnt + 1
		dw_8.object.seq[ll_rowcnt]  = string(ll_rowcnt)
		dw_8.object.no[ll_rowcnt]   = string(ll_i)
		dw_8.object.text[ll_rowcnt] = ls_item_no 
		dw_8.object.rem[ll_rowcnt]  = " 물품코드를 확인하십시요!"
	END IF
	dw_3.object.item_no[ll_i] = ls_item_no

   // 규격
	ls_qa = RightA("000"   + trim(string(dw_excel.object.qa1[ll_i])), 3) + 'X' &
			+ RightA("0000"  + trim(string(dw_excel.object.qa2[ll_i])), 4) + 'X' &
			+ RightA("0000"  + trim(string(dw_excel.object.qa3[ll_i])), 4) + 'X' &
			+ RightA("00000" + trim(string(dw_excel.object.qa4[ll_i])), 5)
						
	SELECT qa INTO :ls_qa_chk FROM item	WHERE item_no = :ls_item_no AND qa = :ls_qa;
	IF SQLCA.SQLCode <> 0 THEN 
		dw_8.insertrow(0)		
		ll_rowcnt = ll_rowcnt + 1
		dw_8.object.seq[ll_rowcnt]  = string(ll_rowcnt)
		dw_8.object.no[ll_rowcnt]   = string(ll_i)
		dw_8.object.text[ll_rowcnt] = ls_qa
		dw_8.object.rem[ll_rowcnt]  = ' 규격을 확인하십시요!'
	END IF
		
	dw_3.object.qa[ll_i]        = ls_qa
	dw_3.object.uom[ll_i]       = dw_excel.object.uom[ll_i]			// 단위
	dw_3.object.order_qty[ll_i] = dw_excel.object.order_qty[ll_i]	// 수량
	if ls_cost = "Y" then
		dw_3.object.price[ll_i]  = dw_excel.object.price[ll_i]		// 단가
	else
		dw_3.object.price[ll_i]  = 0 	                              // 단가
	end if
	dw_3.object.rem[ll_i]       = dw_excel.object.rem[ll_i]			// 비고
	dw_3.object.item_item_name[ll_i] = ls_item_name						// 품목명

	ls_color_no = dw_excel.object.color[ll_i]
	if isnull(ls_color_no) or ls_color_no = "" then
	else
		SELECT color_name INTO :ls_color_name FROM color WHERE color_code = :ls_color_no;
		if SQLCA.SQLCode <> 0 then 
			dw_8.insertrow(0)
			ll_rowcnt = ll_rowcnt + 1
			dw_8.object.seq[ll_rowcnt]  = string(ll_rowcnt)
			dw_8.object.no[ll_rowcnt]   = string(ll_i)
			dw_8.object.text[ll_rowcnt] = ls_color_no
			dw_8.object.rem[ll_rowcnt]  = ' 색상코드를 확인하십시요!'
		end if
		dw_3.object.color[ll_i] = ls_color_no									// 색상
	end if

	lr_order_qty = dw_3.getitemdecimal(ll_i, "order_qty")	
	ls_uom       = trim(dw_3.getitemstring(ll_i, "uom"))
	choose case ls_uom
		case "M2", "SS"
			ll_x       = long(MidA(ls_qa, 5, 4))
			ll_y       = long(MidA(ls_qa, 10, 4))
			lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001 , 2)	
			dw_3.object.acc_qty[ll_i] = lr_acc_qty
		case "M"
			ll_lenth   = long(MidA(ls_qa, 15, 5))
			lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
			dw_3.object.acc_qty[ll_i] = lr_acc_qty
		case else
			lr_acc_qty = lr_order_qty
			dw_3.object.acc_qty[ll_i] = truncate(lr_acc_qty,2) //길이가 없는 제품의 환산수량
	end choose
	
	//Y.S.P A/B/D/C TYPE 인 경우 환산수량
	if LeftA(ls_item_no, 5) = "PCYSZ" then 
		dw_3.object.acc_qty[ll_i] = lr_order_qty
		dw_3.object.sol_qty[ll_i] = lr_order_qty
	end if
	
	//표준단가
	lr_price_a = 0
	SELECT price_a INTO :lr_price_a FROM item	 WHERE item_no = :ls_item_no AND qa = :ls_qa;
	dw_3.object.item_price_a[ll_i] = lr_price_a						// 단가
	
	// 현장->거래처->표준단가 dw_3.itemchanged Event
	if ls_cost = "Y" then 	
		dw_3.object.price[ll_i] = dw_excel.object.price[ll_i]		// 단가
	else
		if dw_3.event itemchanged(ll_i, dw_3.object.qa, ls_qa) = 1 then
			dw_3.event itemerror( ll_i, dw_3.object.qa, ls_qa )
		end if
	end if
	
	dw_3.object.uom[ll_i]       = dw_excel.object.uom[ll_i]		// 단위
next

is_import_chk = 'X'
wf_calc()
//dw_3.setredraw(true)

if dw_8.rowcount() > 0 then
	dw_8.setfocus()
	dw_8.visible = true
else
	dw_8.visible = false
end if

dw_3.setcolumn("order_qty")
dw_3.setfocus()
MessageBox("확인","가져오기 완료")

end event

type dw_8 from datawindow within w_orsale_m
integer x = 1093
integer y = 1872
integer width = 2455
integer height = 520
integer taborder = 220
boolean bringtotop = true
boolean titlebar = true
string title = "엑셀데이터(품목,규격,수량,비고)"
string dataobject = "d_orsaledet_error_r"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type pb_3 from picturebutton within w_orsale_m
integer x = 4585
integer y = 1276
integer width = 293
integer height = 112
integer taborder = 250
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "돋움체"
string text = "다중추가"
vtextalign vtextalign = vcenter!
end type

event clicked;// 다중추가
gs_where2 lstr_where
long    ll_row, ll_cnt, ll_skip
string  ls_area, ls_loc, ls_itemno, ls_qa, ls_uom, ls_com_qa, ls_scene_no, ls_cust_no
string  ls_orderdate, ls_yspstart, ls_yspcalctype, ls_cust, ls_itemfilter
decimal lr_order_qty, lr_price
dec     lr_price_a
dec     ld_pricea
boolean lb_yspqacheck, lb_yspstart
long	  ll_x, ll_y, ll_lenth
decimal lr_acc_qty
long    ll_count = 0

dw_3.AcceptText()
dw_2.AcceptText()

if dw_2.RowCount() < 1 then return

ls_cust = dw_2.Object.cust_no[1]
if isnull(ls_cust) Or trim(ls_cust) = "" Then
   dw_2.SetColumn("cust_no")
   dw_2.SetFocus()
   MessageBox("확인","거래처를 입력하세요!",exclamation!)
   RETURN
end if
if WF_CONFIRM("Y") = false then return

// 사업장별 품목선택 하기
if rb_1.checked = true then 		// Y.S.P
   ls_itemfilter = "YSP품목"
	MessageBox("확인","다중추가에서는 '" + ls_itemfilter + "' 만 필터링 되어 검색됩니다.")
elseif rb_2.checked = true then 	// 시화
   ls_itemfilter = "시화품목"
else										// 전체
   ls_itemfilter = "전체품목"
	MessageBox("확인","다중추가에서는 '" + ls_itemfilter + "' 모두가 검색됩니다.")
end if

ls_area = dw_2.Object.area_no[1]
SELECT DEF_LOC INTO :ls_loc FROM AREA WHERE AREA_NO = :ls_area;

debugbreak()
// 다중추가 화면
lstr_where.chk     = "M"   // M:multi S:single
lstr_where.chk1    = ls_loc
lstr_where.str8[1] = string(dw_2.object.order_date[1],"yyyy/mm/dd")
OpenWithParm( w_whitemlocqohmulti_w2, lstr_where )
lstr_where = Message.PowerObjectParm

if rb_1.checked = true then 		// Y.S.P
   rb_1.triggerevent(clicked!)
elseif rb_2.checked = true then 	// 시화
   rb_2.triggerevent(clicked!)
else										// 전체
   rb_3.triggerevent(clicked!)
end if
if lstr_where.chk <> "Y" then return

/////////////////////////////////////////////////////////////////
// YSP수주자동계산 적용일자 //
/////////////////////////////////////////////////////////////////
lb_yspstart = false
SELECT item_cd INTO :ls_yspstart FROM codemst with(nolock) WHERE type = 'YSP수주자동계산' AND use_yn = 'Y';
if isnull(ls_yspstart) or ls_yspstart = "" then
else
	ls_orderdate = string(dw_2.object.order_date[1],"yyyy/mm/dd")
	if ls_orderdate > ls_yspstart then lb_yspstart = true
end if
/////////////////////////////////////////////////////////////////

//=============================================================//
// 다중추가 품목 반영하기
//=============================================================//
//dw_3.SetRedraw(false)
for ll_row = 1 to UpperBound(lstr_where.str1)                  
   ls_itemno = trim(lstr_where.str1[ll_row])
   ls_qa     = trim(lstr_where.str2[ll_row])
   ls_uom    = trim(lstr_where.str3[ll_row])
	
	/////////////////////////////////////////////////////////////////
	// YSP수주자동계산식(TYPE)
	/////////////////////////////////////////////////////////////////
	if lb_yspstart = true then
		lb_yspqacheck = false
		if upper(LeftA(ls_itemno,4)) = "PCYS" then
			SELECT ysp_calctype INTO :ls_yspcalctype FROM groupitem with(nolock) WHERE item_no = :ls_itemno;
			if isnull(ls_yspcalctype) or ls_yspcalctype = "" then
				lb_yspqacheck = false
			else
				lb_yspqacheck = true	// 대상
			end if
		end if

		// YSP수주자동계산(규격오류)
		if lb_yspqacheck = true And RightA(ls_qa,5) = "00000" then
			ll_skip = ll_skip + 1
			CONTINUE
		end if
	end if
	/////////////////////////////////////////////////////////////////
			
   ll_cnt = dw_3.InsertRow(0)
   if ll_cnt = 1 then 
      dw_3.Object.seq_no[ll_cnt] = 1
   else
      dw_3.Object.seq_no[ll_cnt] = dw_3.Object.seq_no[ll_cnt - 1] + 1
   end if
	
   dw_3.Object.item_no[ll_cnt] = Trim(lstr_where.str1[ll_row])				// 품목
   dw_3.Object.qa[ll_cnt]      = Trim(lstr_where.str2[ll_row])				// 규격
   dw_3.Object.uom[ll_cnt]     = Trim(lstr_where.str3[ll_row])				// 단위
   dw_3.Object.item_item_name[ll_cnt] = Trim(lstr_where.name[ll_row])	// 품명
   dw_3.Object.color[ll_cnt]   = WF_COLOR(dw_3.Object.item_no[ll_cnt])	// 색상

   /////////////////////////////////////////////////////////////////////////
	// YSP수주자동계산(정상규격)	//반영일자이후는 lb_yspstart는 true가 됨 //
	/////////////////////////////////////////////////////////////////////////
	if lb_yspstart = true then
		if isnull(ls_yspcalctype) or ls_yspcalctype = "" then				// 수동계산품목(미 설정)
		else
			dw_3.Object.ysp_calctype[ll_cnt]	= ls_yspcalctype				// YSP 자동계산
			dw_3.Object.order_qty[ll_cnt]		= lstr_where.qty2[ll_row]	// YSP 자동계산 수주량
			
			//-- YSP수주자동계산시 PROTECT로 인한 환산수량 계산
			choose case ls_uom
				case "M2", "SS"	// 단위가 평방미터인 제품의 환산수량, "SS" <= 단위는 Sheet이나 계산을 평방미터로 환산
					ll_x       = long(MidA(ls_qa,  5, 4))
					ll_y       = long(MidA(ls_qa, 10, 4))
					lr_acc_qty = truncate(ll_x * ll_y * lstr_where.qty2[ll_row] / 1000000 + 0.0000001, 2)   
					dw_3.object.acc_qty[ll_row] = lr_acc_qty
					
				case "M"				// 단위가 미터인 제품의 환산수량
					ll_lenth   = long(MidA(ls_qa, 15, 5))
					lr_acc_qty = truncate(ll_lenth * lstr_where.qty2[ll_row] / 1000 + 0.0000001, 2)
					dw_3.object.acc_qty[ll_row] = lr_acc_qty
					
				case else			// 길이가 없는 제품의 환산수량
					lr_acc_qty = lstr_where.qty2[ll_row]
					dw_3.object.acc_qty[ll_row] = lr_acc_qty 
			end choose			
		end if
	end if
	/////////////////////////////////////////////////////////////////
	

   /////////////////////////////////////////////////////////////////
	// 환산수량, 단가
   /////////////////////////////////////////////////////////////////
   lr_price_a = 0
   SELECT price_a INTO :lr_price_a  FROM item with(nolock) WHERE item_no = :ls_itemno AND qa = :ls_qa;
         
   dw_3.Object.item_price_a[ll_cnt] = lr_price_a   
   lr_order_qty = dw_3.getitemdecimal(ll_cnt, "order_qty") 
	choose case ls_uom
   	case "M2", "SS" // 단위가 평방미터인 제품의 환산수량(M2, SS: Sheet)
      	ls_com_qa = LeftA(ls_qa, 3)
			
		case "M" 		 // 단위가 미터인 제품의 환산수량
			ls_com_qa = LeftA(ls_qa, 13)
			
		case else
			ls_com_qa = ls_qa
	end choose
         
   // 단가검색
   ls_scene_no = dw_2.GetItemString(1, "scene_code")
   ls_cust_no  = dw_2.GetItemString(1, "cust_no")
   lr_price    = GF_CUSTPRICE(ls_scene_no, ls_cust_no, ls_com_qa, ls_itemno, ls_qa)   // d_wfprice (현장->거래처->표준)
   dw_3.Object.price[ll_cnt]    = lr_price   // 주문단가
   dw_3.Object.price_be[ll_cnt] = lr_price   // 기존단가

   // 최근단가
   string  ls_q_seq, ls_price_date
   decimal ldc_q_price 
  
ls_q_seq    = ""
ldc_q_price = 0
SELECT top 1 seq, price, cdate INTO :ls_q_seq, :ldc_q_price, :ls_price_date
  FROM (      
		 SELECT seq, price, cdate 
			FROM (
				  SELECT top 1 convert(char(1), '1') seq, b.price, convert(char(10),a.do_date,111) as cdate
					 FROM do a with(nolock), dodet b with(nolock)
					WHERE a.do_no      = b.do_no
					  AND a.cust_no    = :ls_cust_no
					  AND a.spot_code  = :ls_scene_no
					  AND b.item_no    = :ls_itemno
					  AND b.qa         = :ls_qa
					ORDER BY cdate desc
				  ) TB_DO_SCENE      
		 UNION
		 SELECT seq, price, cdate
			FROM (
				  SELECT top 1 convert(char(1), '2') seq, b.price, convert(char(10),a.do_date,111) as cdate
					 FROM do a with(nolock), dodet b with(nolock)
					WHERE a.do_no      = b.do_no
					  AND a.cust_no    = :ls_cust_no
					  AND b.item_no    = :ls_itemno
					  AND b.qa         = :ls_qa
					ORDER BY cdate desc
				  ) TB_DO_CUST
		 ) TB_TOTAL
 ORDER BY seq;  
  
  
 /*2022-7-04 jowonsuk 현장에서 사는 사람들은 거래처단가 적용, 거래처 사업자등록이 '999-99-99999' 인곳. 시작 */
   select count(*)
   into  :ll_count
   from customer
 where cust_no = :ls_cust_no
     and register_no = '999-99-99999';
 
  if ll_count = 0 then			 
	  if ldc_q_price > 0 then
	  		string ls_fixed_date
			SELECT IsNull(ITEM_NM,'') INTO :ls_fixed_date FROM CODEMST with(nolock) WHERE ITEM_CD = 'PRICE_RAISING' AND USE_YN = 'Y';
				 
			if IsDate(ls_fixed_date) And ls_price_date >= ls_fixed_date then
				dw_3.Object.price[ll_cnt]      = ldc_q_price   // 주문단가
				dw_3.Object.price_be[ll_cnt]   = ldc_q_price   // 기존단가
				dw_3.Object.price_last[ll_cnt] = ldc_q_price   // 최근단가
				dw_3.Object.price_date[ll_cnt] = ls_price_date // 검색일자
			else
				dw_3.Object.price[ll_cnt]      = lr_price      // 주문단가
				dw_3.Object.price_be[ll_cnt]   = ldc_q_price   // 기존단가
				dw_3.Object.price_last[ll_cnt] = ldc_q_price   // 최근단가
				dw_3.Object.price_date[ll_cnt] = ls_price_date // 인상일자
			end if
	   else 
			dw_3.Object.price_last[ll_cnt] = 0
	   end if		
  else				
	   dw_3.Object.price[ll_cnt]      = lr_price      // 주문단가
	   dw_3.Object.price_be[ll_cnt]   = ldc_q_price   // 기존단가
	   dw_3.Object.price_last[ll_cnt] = ldc_q_price   // 최근단가
	   dw_3.Object.price_date[ll_cnt] = ls_price_date // 인상일자	 	 
  end if
 /*2022-7-04 jowonsuk 현장에서 사는 사람들은 거래처단가 적용, 거래처 사업자등록이 '999-99-99999' 인곳. 끝 */
	
/*  		2018.08.23  jowonsuk    assembly_item table 에 해당하면 아래 로직 반영 	 시작	
		
		품목에 부속품이 달려 있는 경우 품목만 선택해도, 부속품이 달려서 나오게 하는 로직
*/
	string ls_assembly_item_no, ls_assembly_qa, ls_assembly_uom, ls_assembly_name
	
	setnull(ls_assembly_item_no)
	
	select assembly_item.assembly_item_no, assembly_item.assembly_qa, groupitem.uom, groupitem.item_name
	 into :ls_assembly_item_no, :ls_assembly_qa, :ls_assembly_uom, :ls_assembly_name
	from assembly_item with(nolock) inner join groupitem with(nolock) on assembly_item.assembly_item_no = groupitem.item_no
	where assembly_item.item_no = :ls_itemno;

//   setnull(ls_assembly_item_no) /*확정되면 setnull을 풀어서 반영 jowonsuk 2018.07.24 */
	
   if isnull(ls_assembly_item_no) = false then 
	
			ls_assembly_qa = ls_qa
			
			/////////////////////////////////////////////////////////////////
			// YSP수주자동계산식(TYPE)
			/////////////////////////////////////////////////////////////////
			
			if lb_yspstart = true then
				lb_yspqacheck = false
				if upper(LeftA(ls_itemno,4)) = "PCYS" then
					SELECT ysp_calctype INTO :ls_yspcalctype
					FROM groupitem with(nolock) 
					WHERE item_no = :ls_assembly_item_no;
					if isnull(ls_yspcalctype) or ls_yspcalctype = "" then
						lb_yspqacheck = false
					else
						lb_yspqacheck = true	// 대상
					end if
				end if
		
				// YSP수주자동계산(규격오류)
				if lb_yspqacheck = true And RightA(ls_qa,5) = "00000" then
					ll_skip = ll_skip + 1
					CONTINUE
				end if
			end if
			
			/////////////////////////////////////////////////////////////////
					
			ll_cnt = dw_3.InsertRow(0)
			
			if ll_cnt = 1 then 
				dw_3.Object.seq_no[ll_cnt] = 1
			else
				dw_3.Object.seq_no[ll_cnt] = dw_3.Object.seq_no[ll_cnt - 1] + 1
			end if
			
			dw_3.Object.item_no[ll_cnt] = ls_assembly_item_no				// 품목
			dw_3.Object.qa[ll_cnt]      =     ls_assembly_qa						// 규격
			dw_3.Object.uom[ll_cnt]   =    ls_assembly_uom			// 단위
			dw_3.Object.item_item_name[ll_cnt] = ls_assembly_name	// 품명
			dw_3.Object.color[ll_cnt]   = WF_COLOR(ls_assembly_item_no)	// 색상
		
			/////////////////////////////////////////////////////////////////////////
			// YSP수주자동계산(정상규격)	//반영일자이후는 lb_yspstart는 true가 됨 //
			/////////////////////////////////////////////////////////////////////////
			
			if lb_yspstart = true then
				if isnull(ls_yspcalctype) OR ls_yspcalctype = "" then				// 수동계산품목(미 설정)
				else
					dw_3.Object.ysp_calctype[ll_cnt]	= ls_yspcalctype				// YSP 자동계산
					dw_3.Object.order_qty[ll_cnt]		= lstr_where.qty2[ll_row] // YSP 자동계산 수주량 ?? 점검필요
					
					// YSP수주자동계산시 PROTECT로 인한 환산수량 계산
					choose case ls_assembly_uom
						case "M2", "SS"	// 단위가 평방미터인 제품의 환산수량
							ll_x       = long(MidA(ls_assembly_qa,  5, 4))
							ll_y       = long(MidA(ls_assembly_qa, 10, 4))
							lr_acc_qty = truncate(ll_x * ll_y * lstr_where.qty2[ll_row] / 1000000 + 0.0000001, 2)   
							dw_3.object.acc_qty[ll_cnt] = lr_acc_qty
							
						case "M"				// 단위가 미터인 제품의 환산수량
							ll_lenth   = long(MidA(ls_qa, 15, 5))
							lr_acc_qty = truncate(ll_lenth * lstr_where.qty2[ll_row] / 1000 + 0.0000001, 2)
							dw_3.object.acc_qty[ll_cnt] = lr_acc_qty
							
						case else			// 길이가 없는 제품의 환산수량
							lr_acc_qty = lstr_where.qty2[ll_row]
							dw_3.object.acc_qty[ll_cnt] = lr_acc_qty 
					end choose			
				end if
			end if
			
			/////////////////////////////////////////////////////////////////
			
		
			/////////////////////////////////////////////////////////////////
			// ABC단가,  환산수량
			/////////////////////////////////////////////////////////////////
			ld_pricea = 0
			SELECT price_a INTO :ld_pricea  
			FROM item with(nolock) 
			WHERE item_no = :ls_assembly_item_no AND qa = :ls_assembly_qa;
					
			dw_3.Object.item_price_a[ll_cnt] = ld_pricea
			lr_order_qty = dw_3.GetItemDecimal(ll_cnt, "order_qty") 
			
			choose case ls_uom
				case "M2", "SS" // 단위가 평방미터인 제품의 환산수량(M2, SS: Sheet)
					ls_com_qa = LeftA(ls_assembly_qa, 3)
					
				case "M" 		 // 단위가 미터인 제품의 환산수량
					ls_com_qa = LeftA(ls_assembly_qa, 13)
					
				case else
					ls_com_qa = ls_assembly_qa
			end choose
		
			// 단가검색
			ls_scene_no = dw_2.GetItemString(1, "scene_code")
			ls_cust_no  = dw_2.GetItemString(1, "cust_no")
			lr_price    = GF_CustPrice( ls_scene_no, ls_cust_no, ls_com_qa, ls_assembly_item_no, ls_assembly_qa )   
							  // d_wfprice (현장->거래처->ABC단가)
							  
			dw_3.Object.price[ll_cnt]    = lr_price   // 주문단가
			dw_3.Object.price_be[ll_cnt] = lr_price   // 기존단가
		
			ls_q_seq    = ""
			ldc_q_price = 0
			SELECT top 1 seq, price, cdate INTO :ls_q_seq, :ldc_q_price, :ls_price_date
			  FROM (      
					 SELECT seq, price, cdate 
						FROM (
							  SELECT top 1 seq = convert(char(1), '1')
									 , b.price
									 , cdate = convert(char(10),a.do_date,111)
								 FROM do A with(nolock)
										LEFT OUTER JOIN dodet B  with(nolock) ON a.do_no = b.do_no
								WHERE ( a.cust_no    = :ls_cust_no  )
								  AND ( a.spot_code  = :ls_scene_no )
								  AND ( b.item_no    = :ls_assembly_item_no   )
								  AND ( b.qa         = :ls_assembly_qa       )
								ORDER BY cdate DESC
							  ) TB_DO_SCENE      
							  
					 UNION ALL
					 SELECT seq, price, cdate
						FROM (
							  SELECT top 1 seq = convert(char(1), '2')
									 , b.price
									 , cdate = convert(char(10),a.do_date,111)
								 FROM do A with(nolock)
										LEFT OUTER JOIN dodet B with(nolock) ON a.do_no = b.do_no
								WHERE ( a.cust_no    = :ls_cust_no  )
								  AND ( b.item_no    = :ls_assembly_item_no   )
								  AND ( b.qa         = :ls_assembly_qa       )
								ORDER BY cdate DESC
							  ) TB_DO_CUST
					 ) TB_TOTAL
			 ORDER BY seq;
			 
			 /*2022-7-04 jowonsuk 현장에서 사는 사람들은 거래처단가 적용, 거래처 사업자등록이 '999-99-99999' 인곳. 시작 */
		      if ll_count = 0 then			 
			 
				 if ldc_q_price > 0 then
				
					SELECT isnull(item_nm,'') INTO :ls_fixed_date 
					  FROM codemst with(nolock)
					 WHERE item_cd = 'PRICE_RAISING' AND use_yn = 'Y';
						 
					  if IsDate(ls_fixed_date) AND ls_price_date >= ls_fixed_date then
							dw_3.Object.price[ll_cnt]      = ldc_q_price   // 주문단가
							dw_3.Object.price_be[ll_cnt]   = ldc_q_price   		// 기존단가
							dw_3.Object.price_last[ll_cnt] = ldc_q_price   		// 최근단가
							dw_3.Object.price_date[ll_cnt] = ls_price_date 		// 검색일자
						else
							dw_3.Object.price[ll_cnt]      = lr_price      // 주문단가
							dw_3.Object.price_be[ll_cnt]   = ldc_q_price   		// 기존단가
							dw_3.Object.price_last[ll_cnt] = ldc_q_price   		// 최근단가
							dw_3.Object.price_date[ll_cnt] = ls_price_date 		// 인상일자
					  end if
				else 
					dw_3.Object.price_last[ll_cnt] = 0
				end if	
				
			else
				dw_3.Object.price[ll_cnt]      = lr_price      // 주문단가
				dw_3.Object.price_be[ll_cnt]   = ldc_q_price   		// 기존단가
				dw_3.Object.price_last[ll_cnt] = ldc_q_price   		// 최근단가
				dw_3.Object.price_date[ll_cnt] = ls_price_date 		// 인상일자				
			end if
			 /*2022-7-04 jowonsuk 현장에서 사는 사람들은 거래처단가 적용, 거래처 사업자등록이 '999-99-99999' 인곳. 끝 */
	
	end if
/*  		2018.08.23  jowonsuk    assembly_item table 에 해당하면 아래 로직 반영 	 끝		*/		
	
next
//=============================================================//

dw_3.ScrollToRow(1)
idwc_qa.SetFilter("item_no = '" + Trim(lstr_where.str1[1]) + "'")
idwc_qa.Filter()

dw_3.SetColumn('order_qty')
dw_3.SetFocus()
//dw_3.SetRedraw(TRUE)

if ll_skip > 0 then
   MessageBox("확인",string(ll_skip, "#,##0") + " YSP수주자동계산 품목,규격 오류입니다.",exclamation!)
end if

end event

type dw_3 from datawindow within w_orsale_m
event keydown pbm_dwnkey
integer x = 23
integer y = 1396
integer width = 4855
integer height = 1224
integer taborder = 130
string dataobject = "d_orsale_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

event keydown;dwitemstatus l_status
long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

l_status = dw_3.getitemstatus(ll_row, 0, primary!)
if l_status = new! or l_status = newmodified! then 
else
	return
end if

if keydown(KeyEnter!) then
	if keyflags = 0 then
		choose case this.getcolumnname() 
			case "price" ,"order_qty"
				if ll_row = this.rowcount() then
					pb_1.default = true
				end if
		end choose
	end if
elseif keydown(KeyControl!) and keydown(KeyZ!) then
	choose case this.getcolumnname() 
		case "item_no"
			if this.rowcount() > 1 then
				this.object.item_no[ll_row ] = this.object.item_no[ll_row -1]
				this.object.item_item_name[ll_row] = this.object.item_item_name[ll_row -1]
				this.object.color[ll_row]    = this.object.color[ll_row -1]
			end if
		case "qa"
			if this.rowcount() > 1 then
				this.object.qa[ll_row ]  = this.object.qa[ll_row -1]
				this.object.uom[ll_row ] = this.object.uom[ll_row -1]
			end if
		case "order_qty"
			if this.rowcount() > 1 then
				this.object.order_qty[ll_row ] = this.object.order_qty[ll_row -1]
			end if
		case "rem"
			if this.rowcount() > 1 then
				this.object.rem[ll_row ]  = this.object.rem[ll_row -1]
			end if
	end choose
end if

// 1 Shift, 2 Ctrl, 3 Shift + Ctrl keys
IF keyflags = 2 THEN
	IF key = KeyS! THEN
		if MessageBox("확인", "수주내용을 저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_save.triggerevent(clicked!)
		end if
	END IF
END IF

return 0

end event

event itemchanged;//
string  ls_where, ls_sql, ls_item_no, ls_qa, ls_com_qa, ls_item_name, ls_data, ls_color
string  ls_uom, ls_cust_no, ls_scene_no, ls_null
string  ls_orderdate, ls_yspstart, ls_yspcalctype
long    ll_row, ll_lenth, ll_x, ll_y, ll_row1, ll_found , ll_cnt, ll_ysp_val
decimal lr_order_qty, lr_acc_qty, lr_price, lr_price_a, lr_yspcalcauto 
boolean lb_yspstart, lb_yspqacheck
DataWindowChild ldwc_color
long 	ll_count = 0

this.accepttext()
dw_2.accepttext()

setnull(ls_null)
ll_row     = this.getrow()
ls_item_no = this.GetItemString(ll_row, "item_no")
ls_qa      = this.GetItemString(ll_row, "qa")

/////////////////////////////////////////////////////////////////
// YSP수주자동계산 적용일자 //
/////////////////////////////////////////////////////////////////
lb_yspstart = false
SELECT item_cd INTO :ls_yspstart FROM codemst with(nolock) WHERE type = 'YSP수주자동계산' AND use_yn = 'Y';
if isnull(ls_yspstart) or ls_yspstart = "" then
else
	ls_orderdate = string(dw_2.object.order_date[1],"yyyy/mm/dd")
	if ls_orderdate > ls_yspstart then lb_yspstart = true
end if
/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////
// TYPE	명칭	   계산식       YSP수주자동계산 //
/////////////////////////////////////////////////
// 1	   U형	   (규격2 + 12 + 규격3) X 규격4
// 2	   분리형	(규격2 + 10 + 규격3) X 규격4
// 3	   일체형	(규격2 + 10 + 규격3) X 규격4
// 4	   크린룸	(규격2 + 08 + 규격3) X 규격4
/////////////////////////////////////////////////
if lb_yspstart = true then
	lb_yspqacheck = false
	if upper(LeftA(ls_item_no,4)) = "PCYS" then
		SELECT ysp_calctype INTO :ls_yspcalctype FROM groupitem with(nolock) WHERE item_no = :ls_item_no;
		if isnull(ls_yspcalctype) or ls_yspcalctype = "" then
			lb_yspqacheck = false
		else
			lb_yspqacheck = true	// 대상
		end if
	end if
end if
/////////////////////////////////////////////////////////////////

choose case dwo.name
   case "color"
      ls_color = trim(data)
      SELECT count(*) INTO :ll_found FROM color with(nolock) WHERE color_code = :ls_color;
      if ll_found < 1 or sqlca.sqlcode = 100  then
         gs_where lst_code
         lst_code.str1 = ls_color
         lst_code.name = ls_color
         openwithparm(w_whcolor_m, lst_code)
         lst_code = message.powerobjectparm
         if lst_code.chk = "N" then return
			
         this.object.color[ll_row] = lst_code.str1
         this.getchild("color", ldwc_color)
         ldwc_color.retrieve()
      end if
      return 1

   case "item_no"
      this.object.qa[ll_row]           = ls_null
      this.object.uom[ll_row]          = ls_null
      this.object.order_qty[ll_row]    = 0
      this.object.acc_qty[ll_row]      = 0
      this.object.price[ll_row]        = 0 
      this.object.item_price_a[ll_row] = 0
      this.object.rem[ll_row]          = ls_null
      this.object.color[ll_row]        = ls_null
      
      ls_data = trim(data)
		SELECT count(*) INTO :ll_cnt  FROM groupitem  with(nolock) WHERE item_no = :ls_data  AND use_flag = 'C';
      if ll_cnt > 0 then
         is_flag = '1'
         messagebox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
                  + "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
         return 1
      end if
		
      ll_row1  = idwc_item.RowCount( )
      ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)      
      if ll_found = 0 then
         is_flag = '1'
         messagebox("확인","위와 같은 품목은 존재하지 않습니다!~r~n" &
                  + "물품RELOAD를 하십시요.!",exclamation!)
         if is_import_chk = "X" then return 1 // excel import (O) 물품코드 오류시 그냥 넘어감
      end if
      
      SELECT item_name INTO :ls_item_name FROM groupitem with(nolock) WHERE item_no = :ls_data  AND use_flag = 'Y';
      if sqlca.sqlcode = 100 then 
        if is_import_chk = 'X' then return 1 // excel import (O) 물품코드 오류시 그냥 넘어감
      end if
      this.object.item_item_name[ll_row] = ls_item_name
      
      if ls_item_no <> "" then
         SELECT count(*) INTO :ll_cnt FROM item with(nolock) WHERE item_no = :ls_item_no  AND use_flag = 'Y';
         if ll_cnt > 0 then
            idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
            idwc_qa.filter()
         end if
         if ll_cnt > 0 and idwc_qa.rowcount() > 0 then
            this.setcolumn("qa")
            this.setfocus()
         else
            this.setcolumn("item_no")
            this.setfocus()
         end if
      end if
      this.object.color[ll_row] = wf_color(this.object.item_no[ll_row])

      /////////////////////////////////////////////////////////////////
      // YSP수주자동계산 품목일 경우 반드시 계산식(1,2,3,4) 존재함
		// 반영일자이후는 lb_yspstart는 무조건 true가 됨
      /////////////////////////////////////////////////////////////////
		if lb_yspstart = true then
			lb_yspqacheck = false
			if upper(LeftA(ls_item_no,4)) = "PCYS" then
				SELECT ysp_calctype INTO :ls_yspcalctype FROM groupitem with(nolock) WHERE item_no = :ls_item_no ;
				if isnull(ls_yspcalctype) or ls_yspcalctype = "" then
					lb_yspqacheck = false
					this.Object.ysp_calctype[ll_row] = ls_null			// PROTECT 해제
				else
					lb_yspqacheck = true
					this.Object.ysp_calctype[ll_row] = ls_yspcalctype	// PROTECT
				end if
			end if
		end if
      /////////////////////////////////////////////////////////////////
		
/*  		2018.08.23  jowonsuk    assembly_item table 에 해당하면 아래 로직 반영 	 시작	
		
		품목에 부속품이 달려 있는 경우 품목만 선택해도, 부속품이 달려서 나오게 하는 로직
*/
	string ls_assembly_item_no, ls_assembly_qa, ls_assembly_uom, ls_assembly_name
	
	setnull(ls_assembly_item_no)
	
	select assembly_item.assembly_item_no, assembly_item.assembly_qa, groupitem.uom, groupitem.item_name
	 into :ls_assembly_item_no, :ls_assembly_qa, :ls_assembly_uom, :ls_assembly_name
	from assembly_item with(nolock) inner join groupitem with(nolock) on assembly_item.assembly_item_no = groupitem.item_no
	where assembly_item.item_no = :ls_data;
	
//	setnull(ls_assembly_item_no)
	
	if isnull(ls_assembly_item_no) = false then
		
		ll_row = this.insertrow(0)
	
		this.object.item_no[ll_row]   = ls_assembly_item_no
		this.object.qa[ll_row]           = this.object.qa[ll_row - 1] 
		this.object.uom[ll_row]          = ls_assembly_uom
		this.object.item_item_name[ll_row] = ls_assembly_name
		this.object.order_qty[ll_row]    = 0
		this.object.acc_qty[ll_row]      = 0
		this.object.price[ll_row]        = 0 
		this.object.item_price_a[ll_row] = 0
		this.object.rem[ll_row]          = ls_null
		this.object.color[ll_row]        = ls_null
		
		SELECT count(*) INTO :ll_cnt  FROM groupitem  with(nolock) WHERE item_no = :ls_assembly_item_no  AND use_flag = 'C';
		if ll_cnt > 0 then
			is_flag = '1'
			MessageBox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
						+ "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			RETURN 1
		end if
		
		ll_row1  = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_assembly_item_no + "'", 1, ll_row1)      
		if ll_found = 0 then
			is_flag = '1'
			if is_import_chk = "X" then 
				RETURN 1 	// excel import (O) 물품코드 오류시 그냥 넘어감
			else
				MessageBox("확인","위와 같은 품목은 존재하지 않습니다!~r~n" &
							+ "물품RELOAD를 하십시요.!",exclamation!)
			end if
		end if
		
		SELECT item_name INTO :ls_item_name FROM groupitem with(nolock) WHERE item_no = :ls_assembly_item_no  AND use_flag = 'Y';
		if sqlca.sqlcode = 100 then 
			if is_import_chk = 'X' then RETURN 1 // excel import (O) 물품코드 오류시 그냥 넘어감
		end if
		this.object.item_item_name[ll_row] = ls_item_name
		
		if ls_assembly_item_no <> "" then
			SELECT count(*) INTO :ll_cnt FROM item with(nolock) WHERE item_no = :ls_assembly_item_no  AND use_flag = 'Y';
			if ll_cnt > 0 then
				idwc_qa.setfilter("item_no = '" + ls_assembly_item_no + "'")
				idwc_qa.filter()
			end if
			if ll_cnt > 0 and idwc_qa.rowcount() > 0 then
				this.setcolumn("qa")
				this.setfocus()
			else
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if
		this.object.color[ll_row] = wf_color(this.object.ls_item_no[ll_row])

		/////////////////////////////////////////////////////////////////
		// YSP수주자동계산 품목일 경우 반드시 계산식(1,2,3,4) 존재함
		// 반영일자이후는 lb_yspstart는 무조건 true가 됨
		/////////////////////////////////////////////////////////////////
		if lb_yspstart = true then
			lb_yspqacheck = false
			if upper(LeftA(ls_item_no,4)) = "PCYS" then
				SELECT ysp_calctype INTO :ls_yspcalctype FROM groupitem with(nolock) WHERE item_no = :ls_assembly_item_no ;
				if isnull(ls_yspcalctype) or ls_yspcalctype = "" then
					lb_yspqacheck = false
					this.Object.ysp_calctype[ll_row] = ls_null			// PROTECT 해제
				else
					lb_yspqacheck = true
					this.Object.ysp_calctype[ll_row] = ls_yspcalctype	// PROTECT
				end if
			end if
		end if
		/////////////////////////////////////////////////////////////////		
		
	end if		
		
   case "qa"      
      ls_data = trim(data)
		if LenA(trim(ls_data)) > 10 then
			string ls_val1, ls_val2, ls_val3, ls_data1, ls_data2, ls_data3, ls_data4
			// 0        1         2
			// 12345678901234567890
			// 000X0820X2150X00000 
			ls_data1 = MidA(ls_data,  1, 3)	// 규격1
			ls_val1  = MidA(ls_data,  4, 1)	// X
			ls_data2 = MidA(ls_data,  5, 4)	// 규격2
			ls_val2  = MidA(ls_data,  9, 1)	// X
			ls_data3 = MidA(ls_data, 10, 4)	// 규격3
			ls_val3  = MidA(ls_data, 14, 1)	// X
			ls_data4 = MidA(ls_data, 15, 5)	// 규격4

			if ls_val1 = "X" and ls_val2 = "X" and ls_val3 = "X" then	// 4, 9, 14 => 'X' 정상포맷
				if LeftA(this.object.item_no[row],1) = "P" and IsNumber(ls_data1) and IsNumber(ls_data2) and IsNumber(ls_data3) then
					/////////////////////////////////////////////////////////////////
					// YSP수주자동계산(정상규격)
					/////////////////////////////////////////////////////////////////
					if lb_yspstart = true then
						if lb_yspqacheck = true then
							if RightA(ls_data,5) = "00000" then
								MessageBox("확인1","YSP수주자동계산 품목의 규격4 오류 입니다.[" + ls_data + "]",Exclamation!)
								return 1
							end if
						end if
					end if
					/////////////////////////////////////////////////////////////////
				else
					if LeftA(this.object.item_no[row],1) = "P" then
						MessageBox("확인1","제품에는 이 규격 룰이 적용될 수 없습니다.[" + ls_data + "] 확인 바랍니다.",Exclamation!)
						return 1
					end if
				end if
			else
				if LeftA(this.object.item_no[row],1) = "P" then
					MessageBox("확인2","제품에는 이 규격 룰이 적용될 수 없습니다.[" + ls_data + "] 확인 바랍니다.",Exclamation!)
					return 1
				end if
			end if
		end if
      /////////////////////////////////////////////////////////////////
		
      SELECT count(*) INTO :ll_cnt FROM item with(nolock) WHERE item_no = :ls_item_no  AND qa = :ls_data  AND use_flag = 'C';
      if ll_cnt > 0 then
         is_flag = '2'
         MessageBox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
                  + "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
         return 1
      end if
		
      ll_row1  = idwc_qa.RowCount( )
      ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)      
      if ll_found = 0 then
         is_flag = '2'
         if MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
                     + "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 then
            if GF_ITEMINSERT(ls_item_no, ls_data) = false then return 1
            idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
            idwc_qa.filter()
         else
            if is_import_chk = 'X' then return 1 // excel import (O) 물품코드 오류시 그냥 넘어감
         end if
      end if
      
      /////////////////////////////////////////////////////////////////
      // YSP수주자동계산(수주수량)
		//반영일자이후는 lb_yspstart는 무조건 true가 됨
      /////////////////////////////////////////////////////////////////
		if lb_yspstart = true then
			if lb_yspqacheck = true then
				if RightA(ls_data,5) = "00000" then
					MessageBox("확인2","YSP수주자동계산 품목의 규격4 오류 입니다.[" + ls_data + "]",Exclamation!)
					return 1
				else
					ll_x     = long(MidA(ls_data, 5, 4))
					ll_y     = long(MidA(ls_data, 10, 4))
					ll_lenth = long(MidA(ls_data, 15, 5))					
					choose case ls_yspcalctype
						case '1'
							ll_ysp_val = 12
						case '2', '3'
							ll_ysp_val = 10
						case '4'
							ll_ysp_val = 8
					end choose
					
					///////////////////////////////////////////////////////////////////////////////
					// YSP자동계산값 소숫점 세자리 반올림((규격2 + :ll_ysp_val + 규격3) X 규격4) //
					///////////////////////////////////////////////////////////////////////////////
					lr_yspcalcauto = round((ll_x + ll_ysp_val + ll_y) * ll_lenth / 1000000, 2)
					lr_order_qty   = lr_yspcalcauto
				end if
			end if
		end if
      /////////////////////////////////////////////////////////////////
		
		
		// 단위
      ls_uom = trim(idwc_qa.GetItemString(idwc_qa.getrow(), "uom")) 
      this.object.uom[ll_row] = ls_uom
		
      // 표준단가
      lr_price_a = 0
      SELECT price_a INTO :lr_price_a  FROM item  with(nolock) WHERE item_no = :ls_item_no  AND qa = :ls_qa;
         
      this.object.item_price_a[ll_row] = lr_price_a   
      lr_order_qty = this.getitemdecimal(ll_row, "order_qty")   
		
		choose case ls_uom
			case "M2", "SS"	// 평방미터, "SS"
				ll_x       = long(MidA(ls_qa,  5, 4))
				ll_y       = long(MidA(ls_qa, 10, 4))
				lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001, 2)   
				ls_com_qa  = LeftA(ls_qa, 3)
				this.object.acc_qty[ll_row] = lr_acc_qty
				
			case "M"				// 단위가 미터인 제품의 환산수량
				ll_lenth   = long(MidA(ls_qa, 15, 5))
				lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
				this.object.acc_qty[ll_row] = lr_acc_qty
				ls_com_qa  = LeftA(ls_qa, 13)
				
			case else			// 길이가 없는 제품의 환산수량
				lr_acc_qty = lr_order_qty
				this.object.acc_qty[ll_row] = lr_acc_qty 
				ls_com_qa  = ls_qa
		end choose
            
      // 단가검색
      ls_scene_no = dw_2.GetItemString(1, "scene_code")
      ls_cust_no  = dw_2.GetItemString(1, "cust_no")
		// d_wfprice (현장->거래처->표준)
		/*
		 SELECT convert(char(1), '1') seq, price   FROM custscene
		  WHERE cust_no = :as_cust_no	 AND scene_code = :as_scene_no
			 AND item_no = :as_item_no	 AND qa = :as_com_qa
		 UNION		
		 SELECT convert(char(1), '2') seq, price 	  FROM custitem
		  WHERE cust_no = :as_cust_no  AND item_no = :as_item_no	 AND qa = :as_com_qa
		 UNION			
		 SELECT convert(char(1), '3') seq, price_a  FROM item
		  WHERE item_no = :as_item_no  AND qa = :as_com_qa1
		*/
      lr_price    = gf_custprice(ls_scene_no, ls_cust_no, ls_com_qa, ls_item_no, ls_qa)   
      this.object.price[ll_row]    = lr_price
      this.object.price_be[ll_row] = lr_price
		
		
	/*2022-6-27 jowonsuk 현장에서 사는 사람들은 거래처단가 적용*/		
	select count(*)
	 into :ll_count
	from customer
	where cust_no = :ls_cust_no
	and register_no = '999-99-99999';

      string  ls_q_seq, ls_price_date
      decimal ldc_q_price
      ls_q_seq    = ""
      ldc_q_price = 0      

      // BOLT(전산도금12M/M), BOLT(전산도금16M/M), BOLT(전산도금)
      if ls_uom = "M" and Not(ls_item_no = "GAZSB12B00" OR ls_item_no = "GAZSB16B00" OR ls_item_no = "GAZSBJDB00") then
         SELECT top 1 seq, price, cdate  INTO :ls_q_seq, :ldc_q_price, :ls_price_date
           FROM (      
                SELECT seq, price, cdate 
                  FROM (
                       SELECT TOP 1 convert(char(1), '1') seq, b.price, convert(char(10),a.do_date,111) AS cdate
                         FROM do   a with(nolock), dodet   b with(nolock)
                        WHERE a.do_no       = b.do_no
                          AND a.cust_no     = :ls_cust_no
                          AND a.spot_code   = :ls_scene_no
                          AND b.item_no     = :ls_item_no
                          AND left(b.qa,13) = left(:ls_qa,13)
                        ORDER BY cdate DESC
                       ) tb_do_scene      
                UNION                
                SELECT seq, price, cdate
                  FROM (
                       SELECT top 1 convert(char(1), '2') seq, b.price, convert(char(10),a.do_date,111) AS cdate
                         FROM do   a with(nolock),      dodet   b with(nolock)
                        WHERE a.do_no       = b.do_no
                          AND a.cust_no     = :ls_cust_no
                          AND b.item_no     = :ls_item_no
                          AND left(b.qa,13) = left(:ls_qa,13)                       
                        ORDER BY cdate DESC          
                       ) TB_DO_CUST                  
                ) TB_TOTAL                           
          ORDER BY seq;                              
      else                                           
         SELECT top 1 seq, price, cdate  INTO :ls_q_seq, :ldc_q_price, :ls_price_date
           FROM (      
                SELECT seq, price, cdate 
                  FROM (
                       SELECT TOP 1 convert(char(1), '1') seq, b.price, convert(char(10),a.do_date,111) AS cdate
                         FROM do   a with(nolock), dodet   b with(nolock)
                        WHERE a.do_no     = b.do_no
                          AND a.cust_no   = :ls_cust_no
                          AND a.spot_code = :ls_scene_no
                          AND b.item_no   = :ls_item_no
                          AND b.qa        = :ls_qa
                        ORDER BY cdate DESC
                       ) tb_do_scene      
                UNION            
                SELECT seq, price, cdate
                  FROM (
                       SELECT TOP 1 convert(char(1), '2') seq, b.price, convert(char(10),a.do_date,111) AS cdate
                         FROM do   a with(nolock),      dodet   b with(nolock)
                        WHERE a.do_no     = b.do_no
                          AND a.cust_no   = :ls_cust_no
                          AND b.item_no   = :ls_item_no
                          AND b.qa        = :ls_qa
                        ORDER BY cdate DESC
                       ) tb_do_cust
                ) tb_total
          ORDER BY seq;
      end if      
		
		//////////////////////////////
		// 단가변경 적용일
		//////////////////////////////
		
	if ll_count > 0  then		
		if ldc_q_price > 0 then
			
		  string ls_fixed_date		// 단가변경 적용일
		  SELECT isnull(ITEM_NM,'') INTO :ls_fixed_date FROM CODEMST with(nolock) WHERE ITEM_CD = 'PRICE_RAISING' AND USE_YN = 'Y';
				 
			  if IsDate(ls_fixed_date) And ls_price_date >= ls_fixed_date then
					this.Object.price[ll_row]      = ldc_q_price   // 주문단가
					this.Object.price_be[ll_row]   = ldc_q_price   // 기존단가
					this.Object.price_last[ll_row] = ldc_q_price   // 최근단가
					this.Object.price_date[ll_row] = ls_price_date // 검색일자
				else
					this.Object.price[ll_row]      = lr_price      // 주문단가
					this.Object.price_be[ll_row]   = ldc_q_price   // 기존단가
					this.Object.price_last[ll_row] = ldc_q_price   // 최근단가
					this.Object.price_date[ll_row] = ls_price_date // 인상일자
				end if
				 
			else
				this.object.price_last[ll_row] = 0
			end if
	else
		this.Object.price[ll_row]      = lr_price      // 주문단가
		this.Object.price_be[ll_row]   = ldc_q_price   // 기존단가
		this.Object.price_last[ll_row] = ldc_q_price   // 최근단가
		this.Object.price_date[ll_row] = ls_price_date // 인상일자				
	end if		

		// 주문수량
      this.setcolumn("order_qty")
      this.setfocus()

		      
   case "uom"		// 단위
      lr_order_qty = this.getitemdecimal(ll_row, "order_qty")   
      ls_uom       = data

      choose case ls_uom
			case "M2", "SS"	// 평방미터 SS: SHEET
				ll_x       = long(MidA(ls_qa,  5, 4))
				ll_y       = long(MidA(ls_qa, 10, 4))
				lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001, 2)   
				this.object.acc_qty[ll_row] = lr_acc_qty
				
      	case "M"				// 단위가 미터인 제품의 환산수량
				ll_lenth   = long(MidA(ls_qa, 15, 5))
				lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
				this.object.acc_qty[ll_row] = lr_acc_qty
				
      	case else
				lr_acc_qty = lr_order_qty
				this.object.acc_qty[ll_row] = lr_acc_qty // 길이가 없는 제품의 환산수량
      end choose

   case "order_qty"	// 주문수량
      lr_order_qty = this.getitemdecimal(ll_row, "order_qty")   
      ls_uom       = trim(this.GetItemString(ll_row, "uom"))
            
      choose case ls_uom
			case "M2", "SS"
				ll_x       = long(MidA(ls_qa, 5, 4))
				ll_y       = long(MidA(ls_qa, 10, 4))
				lr_acc_qty = truncate(ll_x * ll_y * lr_order_qty / 1000000 + 0.0000001 , 2)   
				this.object.acc_qty[ll_row] = lr_acc_qty
			
			case "M"
				ll_lenth   = long(MidA(ls_qa, 15, 5))
				lr_acc_qty = truncate(ll_lenth * lr_order_qty / 1000 + 0.0000001, 2)
				this.object.acc_qty[ll_row] = lr_acc_qty
				
			case else
				lr_acc_qty = lr_order_qty
				this.object.acc_qty[ll_row] = lr_acc_qty 		//길이가 없는 제품의 환산수량
      end choose
      
      // Y.S.P A/B/D/C TYPE 인 경우 환산수량
      if LeftA(ls_item_no, 5) = "PCYSZ" then 
         this.object.acc_qty[ll_row] = lr_order_qty	// 환산수량
         this.object.sol_qty[ll_row] = lr_order_qty	// 가용량
			if lb_yspqacheck = true then
				if lr_order_qty = 0 then
					MessageBox("확인3","YSP수주자동계산 오류 입니다.[" + ls_item_no + "|" + ls_qa + "]",Exclamation!)
					return 1
				end if
			end if
      end if

		// 구분, 폭, 비중, 중량, 단중
      string  lsr_gbn
      decimal ldc_width, ldc_rate, ldc_heft, ldc_weight
      real    ll_dan,    ll_jung
		
      ls_item_no = this.object.item_no[row]
      ls_qa      = this.object.qa[row]
      ls_uom     = this.object.uom[row]
		
      if ls_uom = "M" then
			// 생산관리 - 품목별 코일규격관리에서 등록함
         SELECT top 1 gbn = substring(itemcoil.coil_item,3,1), itemcoil.width, itemcoil.weight
           INTO :lsr_gbn, :ldc_width, :ldc_weight
           FROM itemcoil with(nolock)
          WHERE item_no = :ls_item_no AND qa = left(:ls_qa, 13);

         SELECT top 1 (case when :lsr_gbn = 'a' then al_rate
                            when :lsr_gbn = 's' then st_rate
                            else ''
                       end)
           INTO :ldc_rate
           FROM globals;
			
			if ldc_weight > 0 then
				ll_dan  = ldc_weight * ldc_rate
				ll_jung = ldc_weight * ldc_rate * long(data)
			else
				ll_dan  = long(LeftA(ls_qa,3)) * 0.01 * ldc_width * long(RightA(trim(ls_qa),5)) * ldc_rate
				ll_jung = long(LeftA(ls_qa,3)) * 0.01 * ldc_width * long(RightA(trim(ls_qa),5)) * ldc_rate * long(data)
			end if
			this.object.danjung[row]  = truncate(ll_dan  * 0.000001 + 0.0000001, 2)
			this.object.jungrang[row] = truncate(ll_jung * 0.000001 + 0.0000001, 2)
			
//			if ldc_width = 0 then // ITEMCOIL에 없으면
//				// 물품코드관리-단위당 중량 설정한 item
//				SELECT TOP 1 heft INTO :ldc_heft
//				  FROM ITEM
//				 WHERE ITEM_NO = :ls_item_no AND QA = :ls_qa AND UOM = :ls_uom;
//
//				ll_dan  = long(left(ls_qa,3)) * 0.01 * ldc_width * long(right(trim(ls_qa),5)) * ldc_rate
//				ll_jung = long(left(ls_qa,3)) * 0.01 * ldc_width * long(right(trim(ls_qa),5)) * ldc_rate * long(data)
//				this.object.danjung[row]  = truncate(ll_dan  * 0.000001 + 0.0000001, 2)
//				this.object.jungrang[row] = truncate(ll_jung * 0.000001 + 0.0000001, 2)
//			end if			 
		end if      
      wf_calc()
		
   case "price"
      wf_calc()
		
   case "stock_qty"
      if isnull(data) then return 1
      if this.getitemdecimal(ll_row, "stock_qty") > this.getitemdecimal(ll_row, "order_qty") then
         MessageBox("확인", "장기재고출고 수량은 주문수량보다 클수 없습니다.")
         return 1
      end if
end choose

end event

event editchanged;dwitemstatus l_status

l_status = dw_3.getitemstatus(row, 0, primary!)
if l_status = new! or l_status = newmodified! then 
else
	return
end if

choose case dwo.name
	case 'order_qty', 'price', 'uom'
		 this.accepttext()
end choose

RETURN 0
end event

event itemerror;string ls_null

setnull(ls_null)
choose case dwo.name
	case 'stock_qty'
		this.object.stock_qty[row] = 0
		
	case 'color'
		this.object.color[row] = upper(data)
		
	case else
		if is_flag = '1' then
			this.object.item_no[row] = ls_null
		else
			this.object.qa[row] = ls_null
		end if
end choose

return 2

end event

event rbuttondown;string ls_color, ls_item, ls_qa, ls_loc, ls_area
dec    ld_rlse_qty
gs_where lst_code

this.accepttext()
if row < 1 then return
dwitemstatus l_status

l_status = dw_3.getitemstatus(row, 0, primary!)
if l_status = new! or l_status = newmodified! then 
else
	return
end if

this.scrolltorow(row)
ls_item = this.object.item_no[row]
ls_qa = this.object.qa[row]
ld_rlse_qty = this.object.rlse_qty[row]

choose case dwo.name
	case 'color'
		if RightA( ls_item, 1) <> 'Z' or  ld_rlse_qty > 0 then 
		else
			openwithparm(w_whcolor_m, lst_code)
			lst_code = message.powerobjectparm
			if lst_code.chk = "N" then return
			this.getchild("color", idwc_color)
			idwc_color.SetTransObject(sqlca)
			this.object.color[row] = lst_code.str1
		end if
end choose

end event

event getfocus;//pb_1.default = true	// 행추가
//st_4.visible = false

//
// Enter시 수주내용 삭제 예방

pb_cancel.default =  false

end event

event losefocus;//
dwitemstatus l_status

this.accepttext()

pb_1.default = false		// 행추가

l_status    = this.getitemstatus(1, 0, primary!)
if l_status = NotModified!	then
else
	if dw_3.ModifiedCount() > 9 then
		if MessageBox("확인","10행 이상을 작업중입니다. 저장후 진행하시기 바랍니다.",Exclamation!, YesNo!, 2) = 1 then

			pb_save.triggerevent( clicked! )
		else
			return 0
		end if
	end if
end if


end event

event clicked;//
if row < 1 then return
this.scrolltorow(row)

string ls_item_no
choose case dwo.name
	case 'qa'
		ls_item_no = this.object.item_no[row]
		if ls_item_no = '' or isnull(ls_item_no) then	return
		
		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		idwc_qa.filter()
		
	case 'color'
		if RightA(this.object.item_no[row], 1) = 'Z' then
			this.getchild("color", idwc_color)
			
			idwc_color.setfilter("left(color_code,1) = 'Z' " &
						+ "or (color_code not in ('0000','1000','3000','4000','B000','F000','G000','I000'," &
						+ "'K000','L000','R000','S000','W000') )")
			idwc_color.filter()
		end if
	case else
end choose



end event

type cb_1 from commandbutton within w_orsale_m
integer x = 1536
integer y = 76
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

type cb_2 from commandbutton within w_orsale_m
integer x = 1536
integer y = 124
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

type st_5 from statictext within w_orsale_m
integer x = 1856
integer y = 1216
integer width = 3040
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "신용 A,B,C,E,S 거래기간CHK, 거래처/현장 Label 더블클릭 검색 가능, 수주금액은 수주일보(기간별) 총 공급가액 동일"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_orsale_m
integer x = 2405
integer y = 76
integer width = 110
integer height = 84
integer taborder = 370
boolean bringtotop = true
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type pb_4 from picturebutton within w_orsale_m
integer x = 3054
integer y = 40
integer width = 329
integer height = 144
integer taborder = 390
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

if dw_2.rowcount() < 1 then RETURN

ls_cust_no   = dw_2.object.cust_no[1]
ls_cust_name = dw_2.object.customer_cust_name[1]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
openwithparm(w_whopeom_w, lstr_where)

end event

type cb_4 from commandbutton within w_orsale_m
integer x = 1819
integer y = 400
integer width = 178
integer height = 68
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

type cb_7 from commandbutton within w_orsale_m
integer x = 1637
integer y = 400
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

type cb_filteroff from commandbutton within w_orsale_m
integer x = 1819
integer y = 332
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
string text = "해지"
end type

event clicked;//
ddlb_2.text     = "LIKE"
ddlb_col.text   = "현장명"
sle_value.text  = ""

dw_4.setfilter("")
dw_4.filter()

end event

type cb_filteron from commandbutton within w_orsale_m
integer x = 1637
integer y = 332
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

type sle_value from singlelineedit within w_orsale_m
integer x = 1125
integer y = 360
integer width = 498
integer height = 76
integer taborder = 410
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_2 from dropdownlistbox within w_orsale_m
integer x = 832
integer y = 356
integer width = 279
integer height = 512
integer taborder = 190
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

type st_9 from statictext within w_orsale_m
integer x = 649
integer y = 376
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

type ddlb_col from dropdownlistbox within w_orsale_m
integer x = 233
integer y = 356
integer width = 402
integer height = 532
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
string item[] = {"수주번호","납기일자","현장명","미출"}
end type

type st_8 from statictext within w_orsale_m
integer x = 50
integer y = 376
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

type pb_5 from picturebutton within w_orsale_m
integer x = 2990
integer y = 1276
integer width = 507
integer height = 112
integer taborder = 290
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고수주 잔량조회"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;if dw_6.rowcount() < 1 then return	// 사업장
if dw_2.rowcount() < 1 then return	// 거래처
if dw_3.rowcount() < 1 then return	// 품목

String ls_area, ls_loc, ls_item, ls_qa
long   ll_row
gs_where lst_code

ls_area = dw_2.object.area_no[1]

ll_row  = dw_3.getrow()
ls_item = dw_3.object.item_no[ll_row]
ls_qa   = dw_3.object.qa[ll_row]

SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :ls_area;
 
lst_code.str1 = ls_loc
lst_code.str2 = ls_item
lst_code.str3 = ls_qa
lst_code.name = dw_3.object.item_item_name[ll_row]
openwithparm(w_whitemloc_w, lst_code)

end event

type pb_6 from picturebutton within w_orsale_m
integer x = 3502
integer y = 1276
integer width = 256
integer height = 112
integer taborder = 310
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "문자전송"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;gs_where        lstr_where
string ls_custno, ls_custnm, ls_scenehp, ls_sceneno

if dw_2.getrow() < 1 then return

ls_custno  = dw_2.object.cust_no[1]
ls_custnm  = dw_2.object.customer_cust_name[1]
ls_scenehp = trim(dw_2.object.tel_no[dw_2.getrow()])
ls_sceneno = trim(dw_2.object.scene_code[dw_2.getrow()])

lstr_where.str1 = ls_custno
lstr_where.name = ls_custnm
OpenWithParm(w_orsms_m, lstr_where)



//OpenSheet(w_orsms_m,  w_o_main, 5, original!)
//w_orsms_m.setredraw(false)
////pb_compute.setfocus()
////w_orsms_m.em_3.text = left(dw_2.object.order_no[1],10) + right(dw_2.object.order_no[1],3)
////w_orsms_m.pb_compute.postevent(clicked!)
//w_orsms_m.setredraw(true)


//문자전송(w_orsms_m)


end event

type pb_7 from picturebutton within w_orsale_m
integer x = 2720
integer y = 40
integer width = 329
integer height = 144
integer taborder = 330
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

type st_saleamt from statictext within w_orsale_m
integer x = 4247
integer y = 1040
integer width = 439
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_9 from picturebutton within w_orsale_m
integer x = 3762
integer y = 1276
integer width = 489
integer height = 112
integer taborder = 270
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "돋움체"
string text = "규격-> 송장규격"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;//
String ls_area, ls_loc, ls_item, ls_qa
long   ll_row

if dw_3.rowcount() > 0 then
	ll_row  = dw_3.getrow()
	ls_item = dw_3.object.item_no[ll_row]
	ls_qa   = dw_3.object.qa[ll_row]
	
	dw_3.object.qa_cust[ll_row] = ls_qa
	dw_3.setcolumn("qa_cust")
	dw_3.setfocus()
end if
end event

type st_3 from statictext within w_orsale_m
integer x = 1499
integer y = 1284
integer width = 553
integer height = 92
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "Ctrl+S : 저장, Ctrl+Z : 이전값 복사"
boolean focusrectangle = false
end type

type st_6 from statictext within w_orsale_m
integer x = 315
integer y = 1300
integer width = 416
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "수주번호 생성후 순서 조정안됨"
boolean focusrectangle = false
end type

type dw_export from datawindow within w_orsale_m
integer x = 2523
integer y = 76
integer width = 110
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsale_export"
boolean livescroll = true
end type

type cb_8 from commandbutton within w_orsale_m
integer x = 2094
integer y = 1276
integer width = 261
integer height = 112
integer taborder = 280
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내보내기"
end type

event clicked;// 내보내기( dw_3 -> dw_export )
string ls_orderno, ls_qa
long   ll_row, ll_iy

dw_export.reset()

if dw_2.rowcount() < 1 then RETURN

ls_orderno = dw_2.object.order_no[1]
dw_export.retrieve( ls_orderno )
//if dw_export.rowcount() < 1 then RETURN

//if dw_export.rowcount() <> dw_3.rowcount() then
	if MessageBox("확인", "화면내용을 내보내기 합니까?", Exclamation!, OKCancel!, 1) = 1 then
		dw_export.reset()
		for ll_iy = 1 to dw_3.rowcount()
			ll_row = dw_export.InsertRow(0)

         ls_qa  = dw_3.object.qa[ll_iy]
			
			dw_export.object.seq_no[ll_row]    = dw_3.object.seq_no[ll_iy]
			dw_export.object.item_no[ll_row]   = dw_3.object.item_no[ll_iy]
			dw_export.object.item_name[ll_row] = dw_3.object.item_item_name[ll_iy]
			dw_export.object.qa1[ll_row]       = integer(MidA(ls_qa,  1, 3))
			dw_export.object.qa2[ll_row]       = integer(MidA(ls_qa,  5, 4))
			dw_export.object.qa3[ll_row]       = integer(MidA(ls_qa, 10, 4))
			dw_export.object.qa4[ll_row]       = integer(MidA(ls_qa, 15, 5))
			dw_export.object.uom[ll_row]       = dw_3.object.uom[ll_iy]               
			dw_export.object.order_qty[ll_row] = dw_3.object.order_qty[ll_iy]        
			dw_export.object.price[ll_row]     = dw_3.object.price[ll_iy]             
			dw_export.object.rem[ll_row]       = dw_3.object.rem[ll_iy]               
			dw_export.object.color[ll_row]     = dw_3.object.color[ll_iy]
		next		 
	end if	
//end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_export
if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "txt", "Text Files (*.txt), *.TXT")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
if ls_ExpandName = "txt" OR ls_ExpandName = "TXT" then
         ldw_sel.SaveAs(ls_DocName, text!, FALSE)
		else
			MessageBox("확인","지원하지 않는 파일 형식입니다.")
		end if
	end if
end if	

end event

type gb_4 from groupbox within w_orsale_m
integer x = 782
integer y = 1260
integer width = 704
integer height = 132
integer taborder = 270
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "사업장별 품목 필터링"
end type

