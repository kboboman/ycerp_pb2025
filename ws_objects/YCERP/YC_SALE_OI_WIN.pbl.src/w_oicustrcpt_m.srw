$PBExportHeader$w_oicustrcpt_m.srw
$PBExportComments$반품매출정리(1998/5/24,성삼지) 080109-운반비 일자 입력
forward
global type w_oicustrcpt_m from w_inheritance
end type
type dw_dodet from datawindow within w_oicustrcpt_m
end type
type dw_3 from datawindow within w_oicustrcpt_m
end type
type rb_1 from radiobutton within w_oicustrcpt_m
end type
type rb_2 from radiobutton within w_oicustrcpt_m
end type
type dw_4 from datawindow within w_oicustrcpt_m
end type
type rb_3 from radiobutton within w_oicustrcpt_m
end type
type pb_1 from picturebutton within w_oicustrcpt_m
end type
type pb_2 from picturebutton within w_oicustrcpt_m
end type
type dw_5 from datawindow within w_oicustrcpt_m
end type
type st_1 from statictext within w_oicustrcpt_m
end type
type st_7 from statictext within w_oicustrcpt_m
end type
type dw_area from datawindow within w_oicustrcpt_m
end type
type st_3 from statictext within w_oicustrcpt_m
end type
type ddlb_fld from dropdownlistbox within w_oicustrcpt_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oicustrcpt_m
end type
type st_4 from statictext within w_oicustrcpt_m
end type
type sle_value from singlelineedit within w_oicustrcpt_m
end type
type cb_2 from commandbutton within w_oicustrcpt_m
end type
type cb_3 from commandbutton within w_oicustrcpt_m
end type
type cb_4 from commandbutton within w_oicustrcpt_m
end type
type cb_5 from commandbutton within w_oicustrcpt_m
end type
type st_vertical1 from u_splitbar_vertical within w_oicustrcpt_m
end type
type st_vertical2 from u_splitbar_vertical within w_oicustrcpt_m
end type
type st_horizontal from u_splitbar_horizontal within w_oicustrcpt_m
end type
type ddlb_op from dropdownlistbox within w_oicustrcpt_m
end type
type gb_4 from groupbox within w_oicustrcpt_m
end type
type st_pick from structure within w_oicustrcpt_m
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oicustrcpt_m from w_inheritance
integer width = 4585
integer height = 2636
string title = "반품매출 정리(w_oicustrcpt_m)"
dw_dodet dw_dodet
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
dw_4 dw_4
rb_3 rb_3
pb_1 pb_1
pb_2 pb_2
dw_5 dw_5
st_1 st_1
st_7 st_7
dw_area dw_area
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
st_vertical1 st_vertical1
st_vertical2 st_vertical2
st_horizontal st_horizontal
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_oicustrcpt_m w_oicustrcpt_m

type variables
string is_con = "I", is_order_no, is_scenesql
datawindowchild  idwc_area, idwc_scene, idwc_cust, idwc_item, idwc_qa
string is_flag, is_window

end variables

forward prototypes
public subroutine wf_calc ()
public subroutine wf_dw1ins (long al_row)
end prototypes

public subroutine wf_calc ();dec lr_add
long ll_row

dw_1.accepttext()
dw_2.accepttext()
if dw_2.rowcount() < 1 then return

if dw_1.rowcount() < 1 then
	ll_row = dw_3.getrow()
	if ll_row < 1 then return
	wf_dw1ins(ll_row)
end if

dw_2.setredraw(false)
dw_1.setredraw(false)

dw_2.groupcalc()
dw_1.object.do_cash[1] = 0
dw_1.object.do_rate[1] = 0
dw_1.object.do_total[1] = 0

dw_1.object.do_cash[1] = dw_2.object.csum[1]
//if dw_2.object.csum[1] > 0 then
//	lr_add = 0.000001
//else
//	lr_add = -0.000001
//end if
if dw_1.object.tax_chk[1] = "Y" then
	dw_1.object.do_rate[1] = dw_2.object.cvat[1]
end if

if dw_1.object.ship_flag[1] = 'D' then
	dw_1.object.do_cash[1] = dw_1.object.do_cash[1] + dw_1.object.ship_amount[1]
	IF dw_1.object.do_rate[1] <> 0 then
//		if dw_1.object.ship_amount[1] > 0 then
			lr_add = 0.000001
//		else
//			lr_add = -0.000001
//		end if
		dw_1.object.do_rate[1] = dw_1.object.do_rate[1] + (truncate(dw_1.object.ship_amount[1] / 10 + lr_add, 0))
	end if
end if

dw_1.object.do_cash[1] = dw_1.object.do_cash[1] * -1
dw_1.object.do_rate[1] = dw_1.object.do_rate[1] * -1
dw_1.object.do_total[1] = dw_1.object.do_rate[1] + dw_1.object.do_cash[1]
dw_1.setredraw(true)
dw_2.setredraw(true)

end subroutine

public subroutine wf_dw1ins (long al_row);dw_1.reset()
dw_1.insertrow(1)
dw_1.object.cust_no.protect = 1
dw_1.object.cust_no.background.color = 78682240
dw_1.object.spot_code.protect = 1
dw_1.object.spot_code.background.color = 78682240

dw_1.object.user_id[1] = gs_userid
dw_1.object.do_date[1] = wf_today()

dw_1.object.area_no[1] = dw_3.object.ret_rcpt_area[al_row]
dw_1.object.cust_no[1] = dw_3.object.cust_no[al_row]
dw_1.object.spot_code[1] = dw_3.object.spot_code[al_row]

end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical1.of_set_leftobject(dw_1)
st_vertical1.of_set_rightobject(dw_3)
st_vertical1.of_set_minsize(250, 250)

st_vertical2.of_set_leftobject(dw_3)
st_vertical2.of_set_rightobject(dw_4)
st_vertical2.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_topobject(dw_3)
st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )


st_1.visible = false
rb_3.visible = false		// 반품매출정리_에누리

//dw_4.visible = false		// 반품 세부내역조회
//dw_4.width  = 2313
//dw_4.height = 1004

if GF_PERMISSION('반품매출정리_에누리', gs_userid) = 'Y' then
	if gs_userid = '1999010s' then
		st_1.visible = true
		rb_3.enabled = false
	end if
end if

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = "%"

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_area.object.area[1] = "%"	// gs_area	// 기본값을 변경	
dw_area.accepttext()
//dw_area.enabled = false


dw_dodet.settransobject(sqlca)
dw_dodet.visible = false
dw_5.visible     = false

dw_2.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_1.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)

dw_2.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_1.getchild("spot_code", idwc_scene)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")

pb_1.enabled      = false
pb_2.enabled      = false
pb_delete.enabled = false

dw_1.object.cust_no.protect = 1
dw_1.object.cust_no.background.color = 78682240
dw_1.object.spot_code.protect = 1
dw_1.object.spot_code.background.color = 78682240

end event

on w_oicustrcpt_m.create
int iCurrent
call super::create
this.dw_dodet=create dw_dodet
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_4=create dw_4
this.rb_3=create rb_3
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_5=create dw_5
this.st_1=create st_1
this.st_7=create st_7
this.dw_area=create dw_area
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.st_vertical1=create st_vertical1
this.st_vertical2=create st_vertical2
this.st_horizontal=create st_horizontal
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dodet
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.pb_2
this.Control[iCurrent+9]=this.dw_5
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.dw_area
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_4
this.Control[iCurrent+21]=this.cb_5
this.Control[iCurrent+22]=this.st_vertical1
this.Control[iCurrent+23]=this.st_vertical2
this.Control[iCurrent+24]=this.st_horizontal
this.Control[iCurrent+25]=this.ddlb_op
this.Control[iCurrent+26]=this.gb_4
end on

on w_oicustrcpt_m.destroy
call super::destroy
destroy(this.dw_dodet)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_4)
destroy(this.rb_3)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.st_7)
destroy(this.dw_area)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.st_vertical1)
destroy(this.st_vertical2)
destroy(this.st_horizontal)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event resize;call super::resize;//
long  ll_width

gb_2.width  = newwidth  - (gb_2.x * 2)

st_vertical1.x      = dw_1.x + dw_1.width
st_vertical1.height = dw_1.height

ll_width    = newwidth  - st_vertical1.x
dw_3.width  = ll_width * 0.6

st_vertical2.x      = dw_3.x + dw_3.width
st_vertical2.height = dw_3.height

dw_4.x      = st_vertical2.x + st_vertical2.width
dw_4.width  = newwidth - dw_4.x - gb_2.x
dw_4.height = dw_3.height

st_horizontal.width  = newwidth - (gb_2.x * 2)

dw_2.width  = newwidth  - (dw_2.x * 2)
dw_2.height = newheight - dw_2.y - dw_2.x


end event

type pb_save from w_inheritance`pb_save within w_oicustrcpt_m
integer x = 3397
integer y = 64
end type

event pb_save::clicked;//
if GF_Permission('반품매출정리edit', gs_userid) = 'N' then
	MessageBox('확인', '이 프로그램에 저장권한이 없습니다.')
	RETURN
end if

string ls_area, ls_sale_flag, ls_do_date, ls_do_no1, ls_do_no
string ls_seq,  ls_cust_no
long   ll_row, ll_int
int    li_seq
dec    ld_do_amount, ld_ori_do_amount, ld_def_amount
datetime ldt_today

// 2008-01-09 운반비 일자 입력
dw_1.object.ship_date[1] = dw_1.object.do_date[1] 

dw_1.accepttext()
dw_2.accepttext()
dw_dodet.reset() 
if dw_1.rowcount() < 1 then RETURN
if dw_2.rowcount() < 1 then
	MessageBox("확인","반품할 물품이 없습니다!", exclamation!)
	RETURN
end if


ls_area = dw_1.object.area_no[1]
if isnull(ls_area) or trim(ls_area) = '' then
	MessageBox("확인","매출지역을 확인하십시요!", exclamation!)
	dw_1.setcolumn('area_no')
	dw_1.setfocus()
	RETURN
end if

if is_con = "S" then
//	ld_ori_do_amount = dw_1.GetItemnumber(1, "do_total", Primary!, TRUE)
//	
// ld_do_amount  = dw_1.object.do_total[1] 
//	ld_def_amount = ld_do_amount - ld_ori_do_amount
// ls_cust_no    = dw_1.object.cust_no[1]
//	ldt_today     = datetime(today())
//	
//   UPDATE customer 
//      SET balance_amt = balance_amt + :ld_def_amount, last_tn_date = : ldt_today
//    WHERE cust_no = :ls_cust_no;
//   if sqlca.sqlcode <> 0 then
//	   rollback;
//	   MessageBox("저장1","customer저장도중 오류가 발생하였습니다!",exclamation!)
//	   return
//   end if		
	if WF_Update1(dw_1, 'Y') then
   end if
	RETURN
end if

for ll_row = 1 to dw_2.rowcount()
   if dw_2.object.acc_chk[ll_row] = "Y" then
		if dw_2.object.price[ll_row] = 0 then
			if MessageBox("확인", string(ll_row,'###') + "번째 단가가 0입니다.~r~n" & 
				         + "계속 진행(확인)하시겠습나까?", Exclamation!, OKCancel!, 1) = 2 then
				RETURN
			end if
		end if
   end if
next

//dw_1.object.do_rate[1] = truncate(dw_1.object.do_rate[1],0)
//// 반품시 금액을 "-" 로 바꿈
if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
setpointer(hourglass!)

// 출고번호 부여(마이너스 출고)
ls_area      = LeftA(gs_area, 1)
ls_sale_flag = dw_1.getitemstring(1, "sale_flag")
if trim(dw_1.object.do_no[1]) = "" OR isnull(dw_1.object.do_no[1]) then
	ls_do_date = string(dw_1.object.do_date[1], "yyyymmdd")
	ls_do_no1  = ls_area + ls_sale_flag + ls_do_date + '-' + '%'			

	SELECT max(do_no) INTO :ls_do_no FROM DO WHERE do_no LIKE :ls_do_no1;		
	if isnull(ls_do_no) OR ls_do_no = "" then
		ls_do_no1 = ls_area + ls_sale_flag + ls_do_date + '-' + '001'
	else
		li_seq    = integer(MidA(ls_do_no, 12, 3))
		li_seq    = li_seq + 1
		ls_seq    = '00' + string(li_seq)
		ls_do_no1 = LeftA(ls_do_no1, 11) + RightA(ls_seq, 3)
	end if
else
	setnull(ls_do_no)
	ls_do_no1 = dw_1.object.do_no[1]
	SELECT do_no INTO :ls_do_no FROM do WHERE do_no = :ls_do_no;
	if trim(ls_do_no) = "" OR isnull(ls_do_no) then
	else
		MessageBox("저장2", "거래명세서 번호가 이미 존재합니다.", exclamation!)
		RETURN
	end if
end if

//
dw_1.object.do_no[1]      = ls_do_no1
dw_1.object.sale_flag[1]  = ls_sale_flag
dw_1.object.issue_date[1] = dw_1.object.do_date[1]
ll_row = 0
li_seq = 0
for ll_int = 1 to dw_2.rowcount()
	if dw_2.object.acc_chk[ll_int] = "Y" then			
		dw_2.object.retdet_price[ll_int] = dw_2.object.price[ll_int]
		
		ll_row = ll_row + 1
		dw_dodet.object.do_no[ll_row]     = ls_do_no1
		dw_dodet.object.oi_no[ll_row]     = ll_row
		if is_con <> "D" then
			dw_dodet.object.seq_no[ll_row] = dw_2.object.seq_no[ll_int]
		else
			dw_dodet.object.seq_no[ll_row] = ll_row
		end if
		
		dw_dodet.object.item_no[ll_row]   = dw_2.object.item_no[ll_int]
		dw_dodet.object.qa[ll_row]        = dw_2.object.qa[ll_int] 
		// 반품시 수량을 "-" 로 바꿈
		dw_dodet.object.ship_qty[ll_row]  = dw_2.object.acc_qty[ll_int] * -1
		dw_dodet.object.price[ll_row]     = dw_2.object.price[ll_int]
		dw_dodet.object.aroi_qty[ll_row]  = 0
		dw_dodet.object.uom[ll_row]       = dw_2.object.uom[ll_int]
		dw_dodet.object.loc_no[ll_row]    = dw_2.object.loc_no[ll_int]
		if is_con <> "D" then
			dw_dodet.object.sale_no[ll_row] = dw_2.object.sale_no[ll_int]
		else
			dw_dodet.object.sale_no[ll_row] = LeftA(ls_do_no1,11) + RightA("00" + string(integer(MidA(ls_do_no1,12,3)) + 900), 3)
		end if
		
		if trim(dw_1.object.tax_chk[1]) = 'Y' then
			if dw_2.object.rlse_amount[ll_int] < 0 then
				dw_dodet.object.rate_cash[ll_row] = truncate(dw_2.object.rlse_amount[ll_int] / 10 - 0.0000001, 0) * -1
			else
				dw_dodet.object.rate_cash[ll_row] = truncate(dw_2.object.rlse_amount[ll_int] / 10 + 0.0000001, 0) * -1
			end if
		else
			dw_dodet.object.rate_cash[ll_row] = 0
		end if
		
		dw_dodet.object.rem[ll_row] = dw_2.object.decision_desc[ll_int]
	end if
next

// ld_do_amount = dw_1.object.do_total[1] 
// ls_cust_no   = dw_1.object.cust_no[1]
//	ldt_today    = datetime(today())

///*2021.06.07 jowonsuk 합계금액 계산.시작*/
if dw_1.object.do_total[1] <> (dw_2.object.csum[1] + dw_2.object.cvat[1])*-1 then
	wf_calc()
end if	
///*2021.06.07 jowonsuk 합계금액 계산.종료*/

if is_con <> "D" then	// 에누리
	dw_3.object.do_no[dw_3.getrow()] = ls_do_no1
	if dw_3.Object.order_no[dw_3.getrow()] = 'SF20090302-001' then
		dw_3.object.process_flag[dw_3.getrow()] = "P"
	else
		dw_3.object.process_flag[dw_3.getrow()] = "S"
	end if

	if WF_Update4(dw_1, dw_2, dw_3, dw_dodet, 'N') then
		MessageBox("확인", "생성된 출고번호는 " + ls_do_no1 + " 입니다.")
	end if
else
	if WF_Update2(dw_1, dw_dodet, 'N') then
		MessageBox("확인", "생성된 출고번호는 " + ls_do_no1 + " 입니다.")
	end if
end if

dw_1.reset() ; dw_2.reset() ; dw_3.reset()


end event

type dw_1 from w_inheritance`dw_1 within w_oicustrcpt_m
event ue_calc pbm_custom01
integer x = 27
integer y = 436
integer width = 1577
integer height = 996
integer taborder = 50
string dataobject = "d_oicustrcpt_m"
boolean vscrollbar = false
end type

event dw_1::ue_calc;wf_calc()
end event

event dw_1::itemchanged;string ls_cust_no, ls_where, ls_sql, ls_null, ls_curr
int ll_found, ll_row1
decimal lr_amt

dw_2.accepttext()
setnull(ls_null)
choose case dwo.name
	case 'cust_no'
		ls_cust_no = data
		this.getchild("cust_no", idwc_cust)
		
		select curr_code into :ls_curr from customer
		 where cust_no = :ls_cust_no;
		this.object.spot_code[1] = ls_null
		
		ls_where = "WHERE scene.cust_no = ~~'" + ls_cust_no + "~~'"
		ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
		
		this.getchild("spot_code", idwc_scene)
		idwc_scene.settransobject(sqlca)
		
		idwc_scene.modify(ls_sql)
		idwc_scene.retrieve()
		
		if idwc_scene.rowcount() > 0 then
			this.object.spot_code.protect = 0
			this.object.spot_code.background.color = 1087434968
		else
			this.object.spot_code.protect = 1 
			this.object.spot_code.background.color = 78682240
		end if
		
		this.object.cust_no.protect = 1
		this.object.cust_no.background.color = 78682240
		pb_1.enabled = true
		pb_2.enabled = true
		
	case 'spot_code'
		this.getchild("spot_code", idwc_scene)
		idwc_scene.settransobject(sqlca)
		this.setcolumn("do_date")
		this.setfocus()
		
end choose
if dw_2.rowcount() > 0 then
	this.postevent("ue_calc")
end if

end event

type st_title from w_inheritance`st_title within w_oicustrcpt_m
integer y = 24
integer width = 1024
integer height = 132
string text = "반품매출 정리"
end type

type st_tips from w_inheritance`st_tips within w_oicustrcpt_m
end type

type pb_compute from w_inheritance`pb_compute within w_oicustrcpt_m
boolean visible = false
integer y = 48
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_oicustrcpt_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oicustrcpt_m
integer x = 3589
integer y = 64
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oicustrcpt_m
boolean visible = false
integer x = 2825
integer y = 60
integer taborder = 160
end type

type pb_cancel from w_inheritance`pb_cancel within w_oicustrcpt_m
integer x = 3013
integer y = 64
integer taborder = 170
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;if dw_3.getrow() < 1 then return

IF MessageBox("확인", "입력된 내역을 취소하시겠습니까 ?", Question!, OKCancel!, 1) = 1 then
	if is_con = "I" then
		dw_1.reset()
		dw_2.retrieve(is_order_no)
	else
		string ls_do_no
		
		if dw_2.retrieve(is_order_no) > 0 then
			ls_do_no = dw_3.object.do_no[dw_3.getrow()]
			dw_1.retrieve(ls_do_no)
		end if
	end if
end if


end event

type pb_delete from w_inheritance`pb_delete within w_oicustrcpt_m
integer x = 3205
integer y = 64
integer taborder = 180
end type

event pb_delete::clicked;//
string   ls_null
string   ls_seq,  ls_cust_no, ls_do_no, ls_invoice
long     ll_row, ll_int
string   ls_retno
int      li_seq
dec      ld_do_amount
datetime ldt_today

DEBUGBREAK()

if GF_Permission("반품매출정리edit", gs_userid) = "N" then
	MessageBox("확인", "이 프로그램에 삭제권한이 없습니다.")
	RETURN
end if

if dw_1.rowcount() < 1 then RETURN
if dw_2.rowcount() < 1 then RETURN

if MessageBox("확인","선택한 자료(거래명세서)를 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then RETURN

ls_invoice = dw_1.object.invoice_print[1]
if ls_invoice = 'Y' then
	MessageBox("확인","이미 매출(세금계산서)이 발생한 자료입니다. ~r~n" &
							+ "매출삭제후 작업하십시요", Exclamation!)
	RETURN
end if

setnull(ls_null)

ld_do_amount = dw_1.object.do_total[1] 
ls_cust_no   = dw_1.object.cust_no[1]
ldt_today    = datetime(today())

//UPDATE customer SET balance_amt = balance_amt - :ld_do_amount,
//						  last_tn_date = : ldt_today
//  WHERE cust_no = :ls_cust_no;
//
//if sqlca.sqlcode <> 0 then
//	rollback;
//	messagebox("저장1","customer저장도중 오류가 발생하였습니다!",exclamation!)
//	return
//end if		

ls_do_no = dw_1.object.do_no[dw_1.getrow()]

DELETE FROM do WHERE do_no = :ls_do_no;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("저장2","do삭제중 오류가 발생하였습니다!",exclamation!)
	RETURN
end if		

//delete from dodet where do_no = :ls_do_no;
//if sqlca.sqlcode <> 0 then
//	rollback;
//	messagebox("저장3","dodet삭제중 오류가 발생하였습니다!",exclamation!)
//	return
//end if		

dw_5.reset()
dw_5.retrieve( ls_do_no )

for ll_row = dw_5.rowcount() to 1 step -1
	dw_5.deleterow(ll_row)
next
dw_3.object.do_no[dw_3.getrow()] = ls_null
dw_3.object.process_flag[dw_3.getrow()] = "I"

// 2016/09/02
ls_retno = dw_2.object.ret_no[dw_2.getrow()]
if isnull(ls_retno) OR ls_retno = "" then
else
	if rb_1.checked = true then
		// 조회
	else
		UPDATE retdet SET acc_qty = 0 WHERE ret_no = :ls_retno;
		if sqlca.sqlcode <> 0 then
			ROLLBACK;
			MessageBox("저장2","retdet 확인수량 수정중 오류가 발생하였습니다!",exclamation!)
			RETURN
		end if		
	end if		
end if

WF_Update2(dw_5, dw_3, "Y")

dw_1.reset()
dw_2.reset()
dw_3.reset()


end event

type pb_insert from w_inheritance`pb_insert within w_oicustrcpt_m
integer x = 2821
integer y = 64
integer taborder = 200
end type

event pb_insert::clicked;if gf_permission('반품매출정리edit', gs_userid) = 'N' then
	messagebox('확인', '이 프로그램에 추가권한이 없습니다.')
	return
end if

long ll_row

CHOOSE CASE is_con
	CASE "I"
		ll_row = dw_3.getrow()
		if ll_row < 1 then return
		//2009년 6월 5일 정영건업의 Runner 물품만 1차 반품 작업을 진행하여서 추가 반품 작업은
		//프로그램 수정작업을 통해서 작업을 진행할수 있습니다.
		IF dw_3.Object.order_no[dw_3.getrow()] = 'SF20090302-001' THEN		
			Messagebox('확인','2009년 6월 5일 (주)정영건업은 1차 반품작업이 완료되었습니다. ~r~r~n 추가 반품은 진행하실수 없습니다. 전산실로 문의바랍니다.')
			Return
		ELSE
			wf_dw1ins(ll_row)
		END IF
	CASE "D"
		dw_1.reset()
		dw_1.insertrow(1)
		dw_1.Object.area_no.TabSequence = 10
		dw_1.object.user_id[1] = gs_userid
		dw_1.object.do_date[1] = wf_today()
		dw_1.object.cust_no.protect = 0
		dw_1.object.cust_no.background.color = rgb(255,255,255)
		dw_1.object.do_flag[1] = '3'
		
END CHOOSE


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oicustrcpt_m
integer x = 2629
integer y = 64
integer taborder = 190
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 하나의 반품증으로 분할 반품입고 처리할 수 있음

string ls_area

dw_area.accepttext()

ls_area = trim(dw_area.object.area[1])
if isnull(ls_area) or ls_area = "" then ls_area = "%"

if dw_3.retrieve( is_con, ls_area ) < 1 then
	messagebox("확인","반품확인 하실 내역이 없습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oicustrcpt_m
integer x = 1938
integer y = 16
integer width = 631
integer height = 212
integer taborder = 120
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79220952
string text = "모드"
end type

type gb_2 from w_inheritance`gb_2 within w_oicustrcpt_m
integer y = 252
integer width = 4489
integer height = 172
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oicustrcpt_m
integer x = 2592
integer y = 16
integer width = 1225
integer height = 212
integer taborder = 40
integer textsize = -10
integer weight = 400
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oicustrcpt_m
event ue_calc pbm_custom01
integer x = 27
integer y = 1484
integer width = 4489
integer height = 1012
integer taborder = 60
string dataobject = "d_oicurcptdet_m1"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::ue_calc;wf_calc()
end event

event dw_2::itemchanged;
string ls_chk, ls_item_no, ls_qa, ls_data, ls_item_name, ls_uom, ls_scene_no,ls_cust_no
string ls_com_qa
decimal lr_price
long ll_row, ll_row1, ll_found 

this.accepttext()
ll_row = this.getrow()
if ll_row < 1 then return

ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

is_flag = '0'
choose case dwo.name

	case 'item_no'
		this.object.qa.tabsequence = 0
		this.object.qa.background.color = 78682240
		
		this.getchild("item_no", idwc_item)
		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			is_flag = '1'
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
//			if ii_sw = 1 then
//				ii_sw = 0
//				pb_7.Triggerevent(clicked!)
//			end if
			 select item_name, uom  into :ls_item_name, :ls_uom from groupitem 
			  where item_no = :ls_data;
			 if sqlca.sqlcode = 100 then 
				 return 1
			 end if
		this.object.groupitem_item_name[this.getrow()] = ls_item_name
		this.object.uom[this.getrow()] = ls_uom
		
		if ls_item_no <> '' then
			this.getchild("qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
	
			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
				this.object.qa.background.color = 1087434968
				this.setcolumn("qa")
				this.setfocus()
			else
				this.object.qa.tabsequence = 0
				this.object.qa.background.color = 78682240
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if
	case 'qa'
		this.getchild("qa", idwc_qa)
		idwc_qa.settransobject(sqlca)
		
		ls_data = data
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			is_flag = '2'
			messagebox("확인","위와 같은 규격은 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
		this.object.uom[ll_row] = ls_uom
		this.setcolumn("acc_qty")
		this.setfocus()		
		
		ls_scene_no = dw_1.getitemstring(1, "spot_code")
		ls_cust_no = dw_1.getitemstring(1, "cust_no")
		ls_com_qa = LeftA(ls_qa, 13)
		lr_price = gf_custprice(ls_scene_no, ls_cust_no, ls_com_qa, ls_item_no, ls_qa)
		this.object.price[ll_row] = lr_price

	case 'acc_chk'
		//09년 06월 05일 정영건업 부분 반품에 따른 스크립트
		//복구시에는 ELSE 스크립트만 사용
		dw_3.Accepttext()
		IF dw_3.Object.order_no[dw_3.getrow()] = 'SF20090302-001' THEN
			
		ELSE						
				if this.object.acc_chk[ll_row] = "Y" then
					ls_chk = "N"
				else
					ls_chk = "Y"
				end if
				for ll_row1 = 1 to this.rowcount()
					this.object.acc_chk[ll_row1] = ls_chk
				next
		END IF
		///////////////////////////////////////////////////
end choose
this.postevent("ue_calc")


end event

event dw_2::itemerror;	
	CHOOSE CASE is_flag
	CASE '1'
		this.object.item_no[this.getrow()] = ''
	CASE '2'
		this.object.qa[this.getrow()] = ''
END CHOOSE
return 2
end event

event dw_2::rowfocuschanged;string  ls_item_no
long ll_row

this.accepttext()
ll_row = this.getrow()

if ll_row > 0 then
	ls_item_no = this.object.item_no[ll_row]
	if ls_item_no = '' or isnull(ls_item_no) then
		return
	else
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
	end if
end if

end event

event dw_2::editchanged;string ls_data,ls_item
long ll_found,ll_row
int li_line

choose case dwo.name
	case 'acc_qty', 'price', 'uom'
		 this.accepttext()
end choose

RETURN 0
end event

event dw_2::itemfocuschanged;string ls_data,ls_item
long ll_found,ll_row
int li_line

ll_row = this.getrow()
this.accepttext()
choose case dwo.name
	case 'item_no'
		 ls_data = trim(this.object.item_no[ll_row]) + '%'
		 ll_row = idwc_item.RowCount( )
		 ll_found = idwc_item.Find("item_no like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("qa.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_item.scrolltorow(ll_found)
		 
	case 'qa'
		 ls_data = trim(this.object.qa[ll_row]) + '%'
		 ll_row = idwc_qa.RowCount( )
		 ll_found = idwc_qa.Find("qa like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("qa.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_qa.scrolltorow(ll_found)
	case 'acc_qty', 'price', 'uom'
		 this.accepttext()
end choose

RETURN 0
end event

event dw_2::retrieveend;call super::retrieveend;//
dw_3.AcceptText()

IF dw_3.Object.order_no[dw_3.getrow()] = 'SF20090302-001' THEN
	Messagebox('확인','2009/06/05일 (주)정영건업은 1차 반품작업이 완료되었습니다.~r~r~n 추가 반품은 진행하실수 없습니다.')
	dw_2.Enabled = False
ELSE
	dw_2.Enabled = True
END IF

end event

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_window = "dw_2"

end event

type dw_dodet from datawindow within w_oicustrcpt_m
integer x = 635
integer y = 128
integer width = 119
integer height = 84
integer taborder = 30
boolean bringtotop = true
string title = "dodet"
string dataobject = "d_oidodet"
boolean livescroll = true
end type

type dw_3 from datawindow within w_oicustrcpt_m
integer x = 1655
integer y = 436
integer width = 2523
integer height = 996
integer taborder = 100
string dataobject = "d_oicustrcpt_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
string ls_dono, ls_orderno
long   ll_row

ll_row = this.Getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

is_order_no = this.object.order_no[ll_row]

if is_con = "I" then
	dw_1.reset()
	dw_2.retrieve( is_order_no )
else
	ls_dono = this.object.do_no[ll_row]
	dw_1.retrieve( ls_dono )
	dw_2.retrieve( is_order_no )
end if

if isnull(is_order_no) OR is_order_no = "" then 
	dw_4.insertrow( 0 )
	RETURN
end if

dw_4.retrieve( is_order_no )

end event

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_window = "dw_3"

//
string ls_dono, ls_orderno
long   ll_row

ll_row = this.Getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

is_order_no = this.object.order_no[ll_row]

if is_con = "I" then
	dw_1.reset()
	dw_2.retrieve( is_order_no )
else
	ls_dono = this.object.do_no[ll_row]
	dw_1.retrieve( ls_dono )
	dw_2.retrieve( is_order_no )
end if

if isnull(is_order_no) OR is_order_no = "" then 
	dw_4.insertrow( 0 )
	RETURN
end if

dw_4.retrieve( is_order_no )

end event

type rb_1 from radiobutton within w_oicustrcpt_m
integer x = 1984
integer y = 84
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "조회"
end type

event clicked;//
pb_1.enabled = false
pb_2.enabled = false
if this.checked = true then
	this.textcolor = rgb(0, 0, 255)
	rb_2.textcolor = rgb(0, 0,   0)
	rb_3.textcolor = rgb(0, 0,   0)
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
	
	is_con = "S"
	pb_insert.enabled = false	
	pb_delete.enabled = true
end if
end event

type rb_2 from radiobutton within w_oicustrcpt_m
integer x = 2281
integer y = 84
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "추가"
boolean checked = true
end type

event clicked;//
pb_1.enabled = false
pb_2.enabled = false
if this.checked = true then
	this.textcolor = rgb(0, 0, 255)
	rb_1.textcolor = rgb(0, 0,   0)
	rb_3.textcolor = rgb(0, 0,   0)
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
	
	is_con = "I"
	pb_insert.enabled = true	
	pb_delete.enabled = false
end if
end event

type dw_4 from datawindow within w_oicustrcpt_m
integer x = 4224
integer y = 436
integer width = 293
integer height = 996
integer taborder = 110
boolean bringtotop = true
string title = "반품자료 상세"
string dataobject = "d_oicustrcpt_m1"
boolean controlmenu = true
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event losefocus;this.visible = false
end event

type rb_3 from radiobutton within w_oicustrcpt_m
integer x = 1984
integer y = 156
integer width = 302
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "에누리"
end type

event clicked;//
if this.checked = true then
	this.textcolor = rgb(0, 0, 255)
	rb_1.textcolor = rgb(0, 0,   0)
	rb_2.textcolor = rgb(0, 0,   0)
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
	
	is_con = "D"
	pb_insert.enabled = true	
	pb_delete.enabled = false
end if
end event

type pb_1 from picturebutton within w_oicustrcpt_m
integer x = 4183
integer y = 292
integer width = 151
integer height = 116
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;if gf_permission('반품매출정리edit', gs_userid) = 'N' then
	messagebox('확인', '이 프로그램에 추가권한이 없습니다.')
	return
end if

long ll_row
ll_row = dw_2.insertrow(0)

end event

type pb_2 from picturebutton within w_oicustrcpt_m
integer x = 4343
integer y = 292
integer width = 151
integer height = 116
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;if gf_permission('반품매출정리edit', gs_userid) = 'N' then
	messagebox('확인', '이 프로그램에 삭제권한이 없습니다.')
	return
end if

if dw_2.getrow() < 1 then return
dw_2.deleterow(dw_2.getrow())

end event

type dw_5 from datawindow within w_oicustrcpt_m
integer x = 763
integer y = 128
integer width = 119
integer height = 84
integer taborder = 120
boolean bringtotop = true
string title = "dodet"
string dataobject = "d_oicustrcpt_dodet_m"
boolean livescroll = true
end type

type st_1 from statictext within w_oicustrcpt_m
integer x = 32
integer y = 184
integer width = 535
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
string text = "반품매출정리_에누리"
boolean focusrectangle = false
end type

type st_7 from statictext within w_oicustrcpt_m
integer x = 1111
integer y = 112
integer width = 233
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
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oicustrcpt_m
integer x = 1344
integer y = 96
integer width = 549
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

type st_3 from statictext within w_oicustrcpt_m
integer x = 87
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_oicustrcpt_m
integer x = 274
integer y = 304
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oicustrcpt_m
integer x = 306
integer y = 316
integer width = 311
integer height = 88
integer taborder = 120
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

type st_4 from statictext within w_oicustrcpt_m
integer x = 745
integer y = 320
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

type sle_value from singlelineedit within w_oicustrcpt_m
integer x = 1234
integer y = 312
integer width = 567
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_oicustrcpt_m
integer x = 1810
integer y = 312
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_oicustrcpt_m
integer x = 1975
integer y = 312
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_oicustrcpt_m
integer x = 2139
integer y = 312
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oicustrcpt_m
integer x = 2304
integer y = 312
integer width = 160
integer height = 76
integer taborder = 130
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

if is_window = "dw_4" then
	arg_dw  = dw_4
else
	arg_dw  = dw_3
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical1 from u_splitbar_vertical within w_oicustrcpt_m
integer x = 1614
integer y = 436
integer height = 996
boolean bringtotop = true
end type

type st_vertical2 from u_splitbar_vertical within w_oicustrcpt_m
integer x = 4192
integer y = 436
integer height = 996
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_oicustrcpt_m
integer x = 27
integer y = 1448
integer width = 4489
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical1.height = dw_1.height
st_vertical2.height = dw_1.height

end event

type ddlb_op from dropdownlistbox within w_oicustrcpt_m
integer x = 923
integer y = 304
integer width = 302
integer height = 500
integer taborder = 140
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type gb_4 from groupbox within w_oicustrcpt_m
integer x = 1097
integer y = 16
integer width = 818
integer height = 212
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사업장"
end type

