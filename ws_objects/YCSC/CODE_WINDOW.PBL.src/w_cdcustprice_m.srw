$PBExportHeader$w_cdcustprice_m.srw
$PBExportComments$거래처별 표준단가 관리(1998/03/16, 정재수)
forward
global type w_cdcustprice_m from w_inheritance
end type
type gb_5 from groupbox within w_cdcustprice_m
end type
type dw_4 from datawindow within w_cdcustprice_m
end type
type dw_3 from datawindow within w_cdcustprice_m
end type
type dw_5 from datawindow within w_cdcustprice_m
end type
type st_1 from statictext within w_cdcustprice_m
end type
type st_2 from statictext within w_cdcustprice_m
end type
type cbx_1 from checkbox within w_cdcustprice_m
end type
type sle_1 from singlelineedit within w_cdcustprice_m
end type
type cb_3 from commandbutton within w_cdcustprice_m
end type
type rb_1 from radiobutton within w_cdcustprice_m
end type
type rb_2 from radiobutton within w_cdcustprice_m
end type
type dw_6 from datawindow within w_cdcustprice_m
end type
type cb_2 from commandbutton within w_cdcustprice_m
end type
type cb_6 from commandbutton within w_cdcustprice_m
end type
type cb_8 from commandbutton within w_cdcustprice_m
end type
type cb_7 from commandbutton within w_cdcustprice_m
end type
type st_6 from statictext within w_cdcustprice_m
end type
type pb_excel from picturebutton within w_cdcustprice_m
end type
type cbx_2 from checkbox within w_cdcustprice_m
end type
type cb_1 from commandbutton within w_cdcustprice_m
end type
type cbx_custitem from checkbox within w_cdcustprice_m
end type
end forward

global type w_cdcustprice_m from w_inheritance
integer width = 4347
integer height = 2240
string title = "거래처 단가관리(w_cdcustprice_m)"
long backcolor = 79219928
gb_5 gb_5
dw_4 dw_4
dw_3 dw_3
dw_5 dw_5
st_1 st_1
st_2 st_2
cbx_1 cbx_1
sle_1 sle_1
cb_3 cb_3
rb_1 rb_1
rb_2 rb_2
dw_6 dw_6
cb_2 cb_2
cb_6 cb_6
cb_8 cb_8
cb_7 cb_7
st_6 st_6
pb_excel pb_excel
cbx_2 cbx_2
cb_1 cb_1
cbx_custitem cbx_custitem
end type
global w_cdcustprice_m w_cdcustprice_m

type variables
public string is_scene_code, is_scene_desc, is_custno, is_custname
st_print i_print
datawindowchild idwc_cust_no, idwc_cust_name, idwc_cust_qa
datawindowchild idwc_cust_no2, idwc_cust_name2
string is_select, is_dw1sql, is_ret, is_dw2sql, is_dw6sql
long il_row, il_insert = 0
decimal{0} ir_price
end variables

forward prototypes
public subroutine wf_ret (string as_cust, string as_flag)
end prototypes

public subroutine wf_ret (string as_cust, string as_flag);//
string ls_teamacc, ls_where, ls_sql

SELECT team_acc INTO :ls_teamacc FROM login WHERE user_id = :gs_userid ;
if ls_teamacc = 'Y' then
	ls_where = ' and ( ( custitem.cust_no = "' + as_cust + '" ) ) '
	ls_sql   = "DataWindow.Table.Select = '" + is_dw2sql + ls_where + "'"
	dw_2.SetTransObject(sqlca)
	dw_2.modify(ls_sql)
	dw_2.retrieve()
	dw_1.setfocus()
else
	ls_where = ' and ( ( custitem.cust_no = "' + as_cust + '" ) AND ( customer.salesman like "' + as_flag + '") ) '
	ls_sql   = "DataWindow.Table.Select = '" + is_dw2sql + ls_where + "'"
	dw_2.SetTransObject(sqlca)
	dw_2.modify(ls_sql)
	dw_2.retrieve()
	dw_1.setfocus()
end if


end subroutine

on w_cdcustprice_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_5=create dw_5
this.st_1=create st_1
this.st_2=create st_2
this.cbx_1=create cbx_1
this.sle_1=create sle_1
this.cb_3=create cb_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_6=create dw_6
this.cb_2=create cb_2
this.cb_6=create cb_6
this.cb_8=create cb_8
this.cb_7=create cb_7
this.st_6=create st_6
this.pb_excel=create pb_excel
this.cbx_2=create cbx_2
this.cb_1=create cb_1
this.cbx_custitem=create cbx_custitem
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.rb_1
this.Control[iCurrent+11]=this.rb_2
this.Control[iCurrent+12]=this.dw_6
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_6
this.Control[iCurrent+15]=this.cb_8
this.Control[iCurrent+16]=this.cb_7
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.pb_excel
this.Control[iCurrent+19]=this.cbx_2
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cbx_custitem
end on

on w_cdcustprice_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.sle_1)
destroy(this.cb_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_6)
destroy(this.cb_2)
destroy(this.cb_6)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.st_6)
destroy(this.pb_excel)
destroy(this.cbx_2)
destroy(this.cb_1)
destroy(this.cbx_custitem)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.visible  = false	// 프린트
cb_3.enabled  = false	// 필터
cbx_1.enabled = false   // 복사될 거래처선택 하기

// 선택된 거래처
dw_3.enabled = false
dw_3.object.cust_no.background.color   = 79219928 // 1087434968 white
dw_3.object.cust_name.background.color = 79219928 // 1087434968
// 복사될 거래처
dw_5.enabled = false
dw_5.object.cust_no.background.color   = 79219928 // 1087434968 white
dw_5.object.cust_name.background.color = 79219928 // 1087434968

//
dw_6.object.customer_cust_name.width = 680
dw_6.settransobject(sqlca)
dw_4.settransobject(sqlca)

if gf_permission('거래처단가관리자', gs_userid) = 'Y' then
   pb_retrieve.enabled = true
	pb_excel.enabled    = true

   pb_save.visible    = true
   pb_insert.enabled  = true
   pb_print.enabled   = true
   pb_delete.enabled  = true
	pb_compute.enabled = true
	pb_cancel.enabled  = true
else
   pb_retrieve.enabled = false
	pb_excel.enabled    = false

   pb_save.visible    = false
   pb_print.enabled   = false
   pb_insert.enabled  = false
   pb_delete.enabled  = false
	pb_compute.enabled = false
	pb_cancel.enabled  = false
end if

// 단가 조회//
if gf_permission('거래처단가관리자', gs_userid) = 'Y' then
	is_ret = '%'
else
	is_ret = gs_userid
end if

dw_5.enabled       = false	// 복사될 거래처
pb_compute.enabled = false // 복사저장

dw_2.getchild("qa", idwc_cust_qa)
idwc_cust_qa.settransobject(sqlca)
is_select = idwc_cust_qa.describe("datawindow.table.select")

// 선택한 거래처
dw_3.settransobject(sqlca)
dw_3.insertrow(0)

// 복사될 거래처
dw_5.settransobject(sqlca)
dw_5.insertrow(0)
dw_5.getchild("cust_no", idwc_cust_no)
idwc_cust_no.settransobject(sqlca)
dw_5.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)

is_dw1sql = dw_1.describe("datawindow.table.select")
is_dw2sql = dw_2.describe("datawindow.table.select")
is_dw6sql = dw_6.describe("datawindow.table.select")

end event

event resize;call super::resize;//
gb_5.width  = this.width  - 1696

dw_2.width  = this.width  - 1691
dw_2.height = this.height - 648

dw_1.height = dw_2.height * 0.6		// 품목

dw_6. y     = dw_1.y + dw_1.height
dw_6.height = dw_2.height * 0.4		// 거래처


end event

type pb_save from w_inheritance`pb_save within w_cdcustprice_m
integer x = 3863
integer y = 60
end type

event pb_save::clicked;string ls_newsort
long   ll_row

dw_2.accepttext()

if dw_2.rowcount() < 1 then return
if wf_nullchk(dw_2) = false then
	MessageBox("확인","거래처 단가목록에서 NULL값이 존재 합니다.") 
	return
end if

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then return
	
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
for ll_row = 1 to dw_2.rowcount() 
	if dw_2.object.c_price[ll_row] <> dw_2.object.price[ll_row] then
		dw_2.object.pre_cost[ll_row] = dw_2.object.c_price[ll_row]
		dw_2.object.sys_date[ll_row] = wf_today()
	end if
next

dw_2.accepttext()
if wf_update1(dw_2,"Y") = true then
	dw_2.Sort()		// 거래처 단가품목 정렬
	
	dw_4.reset()	// 프린트
	dw_4.retrieve(dw_3.getitemstring(dw_3.getrow(), "cust_no"))
	
	// 이전단가 
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.c_price[ll_row] = dw_2.object.price[ll_row]
	next
	
	if MessageBox("확인","저장 작업이 완료 되었습니다.~n~n새로고침을 하시겠습니까?",Exclamation!, YesNo!, 1) = 1 then
		pb_retrieve.triggerevent( clicked! )
	end if		
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdcustprice_m
integer x = 32
integer y = 516
integer width = 1563
integer height = 940
integer taborder = 60
string dataobject = "d_cditemcost_t1"
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;string ls_item_no

if this.getrow() < 1 or dw_2.getrow() < 1 then return
ls_item_no = this.getitemstring(this.getrow(), "item_no")
il_row     = dw_2.find("item_no = '" + ls_item_no + "'", 1, dw_2.rowcount())
dw_2.scrolltorow(il_row)

end event

event dw_1::retrieveend;//
sle_1.setfocus()

end event

type dw_2 from w_inheritance`dw_2 within w_cdcustprice_m
integer x = 1614
integer y = 516
integer width = 2656
integer height = 1568
integer taborder = 70
string dataobject = "d_cdcustitem_m1"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rowfocuschanged;string ls_item_no, ls_where, ls_sql
long   ll_row

this.accepttext()
ll_row = this.getrow()
dwitemstatus l_status

if ll_row < 1 then return
l_status = dw_2.getitemstatus(ll_row, 0, primary!)
if l_status = newmodified! then
	ls_item_no = this.getitemstring(ll_row, "item_no")

	ls_where = 'AND itemcost.item_no = ~~"' + ls_item_no + '~~"' 
	ls_sql   = "DataWindow.Table.Select = '" + is_select + ls_where + "'"

	dw_2.getchild("qa", idwc_cust_qa)
	idwc_cust_qa.settransobject(sqlca)
	idwc_cust_qa.modify(ls_sql)
	idwc_cust_qa.retrieve()
end if
end event

event dw_2::itemchanged;call super::itemchanged;string  ls_itemno, ls_qa, ls_uom
decimal lr_price
long    ll_find

this.accepttext()
choose case dwo.name
	case 'qa'
		ls_itemno = this.getitemstring(this.getrow(), "item_no")
		ls_qa     = this.getitemstring(this.getrow(), "qa")
		
		//이미 존재하는 규격 check
		if this.rowcount() > 1 then
			ll_find = this.find("item_no = '" + ls_itemno + "' and qa = '" + ls_qa + "'",1,this.getrow()-1)
			if ll_find > 0 then
				MessageBox("확인","이미 존재하는 물품의 규격입니다.~r~n다시 입력하세요!",exclamation!)
				return 1
			end if
		end if
		
		// 표준단가 읽기
		SELECT uom, price INTO :ls_uom, :lr_price  FROM itemcost WHERE item_no = :ls_itemno  AND qa = :ls_qa;			
		this.object.uom[this.getrow()]      = ls_uom
		this.object.std_cost[this.getrow()] = lr_price
		
		this.setcolumn("price")
		this.setfocus()
		
//	case 'price'
//		lr_price = this.getitemdecimal(this.getrow(), "price")
//		
//		if this.object.c_price[this.getrow()]  = 0 then
//			this.object.pre_cost[this.getrow()] = lr_price
//			this.object.sys_date[this.getrow()] = wf_today()
//		elseif this.object.c_price[this.getrow()] <> lr_price then
//			this.object.pre_cost[this.getrow()] = this.object.c_price[this.getrow()]
//			this.object.sys_date[this.getrow()] = wf_today()
//		elseif this.object.c_price[this.getrow()] = lr_price then
//		end if
end choose

end event

event dw_2::retrieveend;//
long   ll_row, ll_found, ll_dw1_cnt, ll_tcheck
string ls_itemno

if is_ret = '%' then
	pb_insert.visible = true
else
	pb_insert.visible = false
end if

ll_dw1_cnt = dw_1.RowCount()
if dw_2.rowcount() > 0 then
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.c_price[ll_row] = dw_2.object.price[ll_row]
		dw_2.setitemstatus(ll_row, 0, Primary!, NotModified!)
	next

	for ll_row = 1 to dw_2.rowcount()
		ls_itemno = dw_2.object.item_no[ll_row]
		
		ll_found = dw_1.Find( "item_no = '" + ls_itemno + "'", 1, ll_dw1_cnt)
		if ll_found > 0 then dw_1.object.chk[ll_found] = "Y"
	next
	
	cbx_1.enabled = true   // 복사될 거래처선택 하기	
	cbx_1.triggerevent( clicked! )
end if

ll_tcheck = dw_1.object.tcheck[1]
if ll_tcheck > 0 then
	cbx_2.visible = true
	cbx_2.textcolor = rgb(255, 0, 0)
else
	cbx_2.visible = false
	cbx_2.textcolor = rgb(0, 0, 0)
end if

end event

event dw_2::itemerror;call super::itemerror;//
choose case dwo.name
	case 'price'
		This.object.price[row] = 0
	case 'qa'
		this.object.qa[row] = ''
		this.setcolumn("qa")
		this.setfocus()
end choose

return 1
end event

type st_title from w_inheritance`st_title within w_cdcustprice_m
integer x = 32
integer y = 56
integer width = 1563
integer height = 132
string text = "거래처 단가관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcustprice_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustprice_m
integer x = 3310
integer y = 380
integer width = 329
integer height = 100
integer taborder = 160
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "복사저장"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::clicked;call super::clicked;long   ll_row
int    li_req
string ls_tarcust, ls_rem

dw_2.accepttext()
dw_5.accepttext()

if dw_2.rowcount() < 1 then return
//if wf_modifycount(dw_2) > 0 then
//	MessageBox("확인","저장후에 복사하십시요")
//	return
//end if

ls_tarcust = dw_5.object.cust_no[1]
ls_rem     = string(gdt_today,"yyyy/mm/dd") + " 복사"

if ls_tarcust = "" or isnull(ls_tarcust) then
	MessageBox("확인","복사될 거래처를 선택하십시요")
	return
end if

li_req = MessageBox("저장", "중복되는 자료는 삭제하시겠습니까~r~n" &
						+ "( 중복되는 자료를 삭제하려면 'Y' 기존자료유지는 'N')",Exclamation!, YesnoCancel!, 1)
choose case li_req
	case 3
		return
		
	case 1
		DELETE FROM custitem 
		 WHERE cust_no = :ls_tarcust
		   AND (item_no + qa) IN (SELECT (item_no + qa) FROM custitem WHERE cust_no = :is_custno);
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류1','[custitem] DELETE 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if

		INSERT INTO custitem ( cust_no, item_no, qa, uom, pre_cost, std_cost, price, rem, sys_date, user_id)
		SELECT :ls_tarcust, item_no, qa, uom, 0, std_cost,price, :ls_rem, getdate(), :gs_userid 
	     FROM custitem 
		 WHERE cust_no = :is_custno;
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류2','[custitem] INSERT 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if
		
	case 2
		INSERT INTO custitem ( cust_no, item_no, qa, uom, pre_cost, std_cost, price, rem, sys_date, user_id)
		SELECT :ls_tarcust, item_no, qa, uom, 0, std_cost,price, :ls_rem, getdate(), :gs_userid 
		  FROM custitem 
		 WHERE cust_no = :is_custno
		   AND (item_no + qa) NOT IN (SELECT (item_no + qa) FROM custitem WHERE cust_no = :ls_tarcust);
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류3','[custitem] INSERT 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if
end choose
		
// 복사될 거래처
dw_5.reset()
dw_5.enabled = false
dw_5.settransobject(sqlca)
dw_5.insertrow(0)
dw_5.object.cust_no.background.color   = 79219928 // 1087434968 white
dw_5.object.cust_name.background.color = 79219928 // 1087434968

cbx_1.checked   = false		// 복사될 거래처선택 하기
cbx_1.textcolor = rgb(0, 0, 255)
if MessageBox("확인","복사저장 작업이 완료 되었습니다.~n~n새로고침을 하시겠습니까?",Exclamation!, YesNo!, 1) = 1 then
	pb_retrieve.triggerevent( clicked! )
end if


end event

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_cdcustprice_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcustprice_m
integer x = 4055
integer y = 60
integer taborder = 170
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdcustprice_m
integer x = 3671
integer y = 60
integer taborder = 180
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

dw_4.retrieve(is_custno)
if dw_4.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 거래처별 표준단가를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustprice_m
integer x = 2519
integer y = 60
integer width = 352
integer taborder = 190
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체삭제"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::clicked;call super::clicked;long ll_row

dw_2.accepttext()
ll_row = dw_2.rowcount()
if ll_row > 0 then 	
	if MessageBox("확인",'거래처의 전체 단가자료를 삭제 후 저장 하시겠습니까?',information!, OKCancel!, 2) = 1 then
	   dw_2.accepttext()
		dw_2.rowsmove(1, ll_row, primary!, dw_2, 1, delete!)
		wf_update1(dw_2,"Y")
	end if
end if	



end event

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_cdcustprice_m
integer x = 3278
integer y = 60
integer taborder = 200
end type

event pb_delete::clicked;call super::clicked;dwitemstatus l_status


if dw_2.rowcount() > 0 then 	
	l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)
   if l_status = newmodified! then
		dw_2.deleterow(dw_2.getrow())
		il_insert = 0
	elseif MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 1 then
	   dw_2.accepttext()
		dw_2.deleterow(dw_2.getrow())
		wf_update1(dw_2,"Y")
	end if
end if	



end event

type pb_insert from w_inheritance`pb_insert within w_cdcustprice_m
integer x = 3086
integer y = 60
integer taborder = 220
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;//
string ls_custno, ls_itemno, ls_itemnm, ls_itemno1, ls_qa
string ls_where, ls_sql
long   ll_row,   ll_cnt
dec    ld_price

dw_3.accepttext()		// 선택한 거래처
dw_2.accepttext()		// 거래처품목

if dw_1.rowcount() < 1 or dw_3.getrow() < 1 then return

ls_custno = dw_3.getitemstring(dw_3.getrow(), "cust_no")
if isnull(ls_custno) or trim(ls_custno) = '' then return

// insert된 row의 규격이 선택되었는지 확인
// if il_insert > 0 and dw_2.rowcount() > 0 then
if dw_2.rowcount() > 0 then
	ls_qa = dw_2.getitemstring(dw_2.rowcount(), "qa")
	if isnull(ls_qa) or ls_qa = "" then
		MessageBox("확인","해당하는 품목의 규격을 입력하세요!",information!)

		dw_2.scrolltorow(il_insert)
		dw_2.setcolumn("qa")
		dw_2.setfocus()
		return
	end if
end if

// 거래처 단가품목에서 선택된 물품을 찾는다.
if dw_1.rowcount() > 0 then
	if dw_2.rowcount() > 0 then
		ls_itemno = dw_1.getitemstring(dw_1.getrow(), "item_no")
		il_row    = dw_2.find("item_no = '" + ls_itemno + "'", 1, dw_2.rowcount())
		dw_2.scrolltorow(il_row)
	end if
end if

// 품목리스트에서 선택한 품목으로
ls_itemno = dw_1.getitemstring(dw_1.getrow(), "item_no")
if il_row > 0 and dw_2.rowcount() > 0 then	// 기 등록된 거래처 단가품목을 검색함 
   ll_row     = dw_2.getrow()
	ls_itemno1 = dw_2.getitemstring(dw_2.getrow(), "item_no")
	Do Until ls_itemno <> ls_itemno1		
		ll_cnt = dw_2.rowcount()		// 마지막 row check
		if ll_row = ll_cnt then
			ls_itemno1 = ""
			ll_row     = ll_row + 1
		else
			ls_itemno1 = dw_2.getitemstring(ll_row + 1, "item_no")
		end if
		
		ll_row = ll_row + 1
   loop

	ll_row = dw_2.insertrow(ll_row)
	dw_2.scrolltorow(ll_row)
else	// 새로운 물품 등록	
	ll_row = dw_2.insertrow(0)
	dw_2.scrolltorow(ll_row)
end if

// 거래처 단가품목
dw_2.object.cust_no[dw_2.getrow()]   = dw_3.getitemstring(dw_3.getrow(), "cust_no")
dw_2.object.cust_name[dw_2.getrow()] = dw_3.getitemstring(dw_3.getrow(), "cust_name")
dw_2.object.item_no[dw_2.getrow()]   = dw_1.getitemstring(dw_1.getrow(), "item_no")		// ls_itemno
dw_2.object.item_name[dw_2.getrow()] = dw_1.getitemstring(dw_1.getrow(), "item_name")
dw_2.object.uom[dw_2.getrow()]       = dw_1.getitemstring(dw_1.getrow(), "uom")

// 표준단가 읽기(거래처 단가품목 itemchanged event)
SELECT price = isnull(price, 0) INTO :ld_price FROM itemcost  WHERE item_no = :ls_itemno AND qa = :ls_qa;
//dw_2.object.pre_cost[dw_2.getrow()]  = 0			// pre_cost
dw_2.object.std_cost[dw_2.getrow()]  = ld_price		// std_cost
dw_2.object.sys_date[dw_2.getrow()]  = wf_today()
dw_2.object.user_id[dw_2.getrow()]   = gs_userid

ls_where = 'AND itemcost.item_no = ~~"' + ls_itemno + '~~"' 
ls_sql   = "DataWindow.Table.Select = '" + is_select + ls_where + "'"

dw_2.getchild("qa", idwc_cust_qa)
idwc_cust_qa.settransobject(sqlca)
idwc_cust_qa.modify(ls_sql)
idwc_cust_qa.retrieve()

il_insert = dw_2.getrow()
dw_2.setcolumn("qa")
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustprice_m
integer x = 2894
integer y = 60
integer taborder = 210
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_codere_str lst_code
string ls_sql, ls_where, ls_teamacc
long   ll_row, ll_custcnt


if dw_1.rowcount() > 0 then dw_1.reset()
//if dw_2.rowcount() > 0 then
//   if MessageBox("확인", "작업(조회)중인 단가항목이 존재합니다. 새로고침 하시겠습니까?",Exclamation!, Yesno!, 1) = 1 then
//		dw_2.reset()
//		dw_3.object.cust_name[1] = ""
//		dw_3.object.cust_no[1]   = ""
//		is_custno		= ""
//	end if
//end if

OpenWithParm(w_whretrieve_w, lst_code)
lst_code = message.powerobjectparm
if lst_code.okcancel = 'N' then return

if lst_code.flag = 'A' then
	ls_sql   = "datawindow.table.select = '" + is_dw1sql + "'"
else
	ls_where = " and itemcost.item_no between ~~'" + lst_code.start_no + "~~' and " + &
				  "~~'" + lst_code.end_no + "~~'"
	ls_sql   = "DataWindow.Table.Select = '" + is_dw1sql + ls_where + "'"
end if

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_1.retrieve()	// 품목

cb_3.enabled  = true		// 검색
cbx_2.visible = false	// 등록된 품목보기

dw_1.visible  = true		// 품목
dw_6.visible  = true		// 거래처

SELECT team_acc INTO :ls_teamacc FROM login WHERE user_id = :gs_userid ;
if ls_teamacc = 'Y' then
	dw_6.SetTransObject(sqlca)
	ll_custcnt = dw_6.retrieve()	// 거래처
elseif is_ret <> '%' then
	ls_where = ' and ( customer.salesman = "' + gs_userid + '" ) '
	ls_sql   = "DataWindow.Table.Select = '" + is_dw6sql + ls_where + "'"
	
	dw_6.SetTransObject(sqlca)
	dw_6.modify(ls_sql)	
	ll_custcnt = dw_6.retrieve()	// 거래처
end if

cbx_1.enabled = false   // 복사될 거래처선택 하기
dw_6.setfocus()			// triggerevent
sle_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_cdcustprice_m
boolean visible = false
integer x = 1513
integer y = 208
integer width = 2080
integer height = 400
integer taborder = 100
long backcolor = 12632256
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustprice_m
integer width = 1563
integer height = 272
integer taborder = 150
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79219928
string text = "itemcost"
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustprice_m
integer x = 2487
integer y = 20
integer width = 1783
integer taborder = 50
long backcolor = 79219928
end type

type gb_5 from groupbox within w_cdcustprice_m
integer x = 1618
integer y = 228
integer width = 2651
integer height = 272
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
string text = "거래처(custitem)"
end type

event constructor;long ll_row

dw_2.accepttext()
ll_row = dw_2.rowcount()
if ll_row > 0 then 	
	if MessageBox("확인",'거래처의 전체 단가자료를 삭제하시겠습니까?',information!, OKCancel!, 2) = 1 then
	   dw_2.accepttext()
		dw_2.rowsmove(1, ll_row, primary!, dw_2, 1, delete!)
		wf_update1(dw_2,"Y")
	end if
end if	



end event

type dw_4 from datawindow within w_cdcustprice_m
integer x = 1687
integer y = 24
integer width = 96
integer height = 76
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cdcustprice_r"
end type

type dw_3 from datawindow within w_cdcustprice_m
integer x = 1664
integer y = 292
integer width = 1499
integer height = 96
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_cdcust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;////
//choose case dwo.name
//	case 'cust_no'
//		is_custno = data
//		is_custname = idwc_cust_no.getitemstring(idwc_cust_no.getrow(), "cust_name")
//		this.object.cust_name[1] = is_custname
//
//	case 'cust_name'
//		is_custno = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
//		this.object.cust_no[1] = is_custno
//end choose
//
//wf_ret(is_custno, is_ret)
//if dw_2.rowcount() < 1 then MessageBox("확인","해당하는 거래처의 데이터가 존재하지 않습니다.")
//
//if ( dw_1.getrow() < 1 or dw_1.visible = False ) or dw_2.getrow() < 1 then return
//
//string ls_itemno
//
//ls_itemno = dw_1.getitemstring(dw_1.getrow(), "item_no")
//il_row    = dw_2.find("item_no = '" + ls_itemno + "'", 1, dw_2.rowcount())
//dw_2.scrolltorow(il_row)
//
//
end event

type dw_5 from datawindow within w_cdcustprice_m
integer x = 1664
integer y = 388
integer width = 1499
integer height = 96
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_cdcust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_custno, ls_custnm
long   ll_row

this.accepttext()

this.getchild("cust_name", idwc_cust_name)

ls_custno = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
ls_custnm = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_name")
this.object.cust_no[this.getrow()]   = ls_custno
this.object.cust_name[this.getrow()] = ls_custnm

if dw_2.rowcount() > 0 then
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.cust_no[ll_row]   = ls_custno
		dw_2.object.cust_name[ll_row] = ls_custnm
	next
end if

pb_compute.default = true
pb_compute.setfocus()

end event

type st_1 from statictext within w_cdcustprice_m
integer x = 3145
integer y = 304
integer width = 155
integer height = 68
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "에서"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdcustprice_m
integer x = 3150
integer y = 396
integer width = 87
integer height = 68
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "로"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_cdcustprice_m
integer x = 3310
integer y = 304
integer width = 942
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "복사될 거래처선택 하기"
end type

event clicked;//
if this.checked = true then
	dw_5.enabled = true
	dw_5.object.cust_no.background.color   = 1087434968  // white
	dw_5.object.cust_name.background.color = 1087434968

	pb_compute.enabled = true
	this.textcolor = rgb(255, 0, 0)
else
	dw_5.enabled = false
	dw_5.object.cust_no.background.color   = 79219928 // 1087434968 white
	dw_5.object.cust_name.background.color = 79219928 // 1087434968

	pb_compute.enabled = false
	this.textcolor = rgb(0, 0, 255)
end if

end event

type sle_1 from singlelineedit within w_cdcustprice_m
integer x = 402
integer y = 372
integer width = 777
integer height = 88
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event getfocus;cb_3.default = true
end event

event losefocus;cb_3.default = false
end event

event modified;//cb_3.triggerevent(clicked!)
end event

type cb_3 from commandbutton within w_cdcustprice_m
integer x = 1189
integer y = 376
integer width = 174
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_where,ls_filter
string ls_item

ls_item = trim(UPPER(sle_1.text))

if isnull(ls_item) or ls_item = "" then 
	ls_where  = ""
	if rb_1.checked = true then
		dw_1.SetFilter(ls_where)
		dw_1.Filter()
	else
		dw_6.SetFilter(ls_where)
		dw_6.Filter()
	end if
else
	ls_filter = '%' + ls_item + '%'

	if rb_1.checked = true then
		ls_where  = "item_name like '" + ls_filter + "'"
		dw_1.SetFilter(ls_where)
		dw_1.Filter()
		
		if dw_1.rowcount() > 1 then dw_1.ScrollToRow(1)
	else
		ls_where  = "customer_cust_name like '" + ls_filter + "'"
		dw_6.SetFilter(ls_where)
		dw_6.Filter()
		
		if dw_6.rowcount() > 1 then dw_6.ScrollToRow(1)
	end if
end if

sle_1.setfocus()

end event

type rb_1 from radiobutton within w_cdcustprice_m
integer x = 69
integer y = 312
integer width = 297
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "품목"
boolean checked = true
end type

type rb_2 from radiobutton within w_cdcustprice_m
integer x = 69
integer y = 392
integer width = 297
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "거래처"
end type

type dw_6 from datawindow within w_cdcustprice_m
integer x = 32
integer y = 1456
integer width = 1563
integer height = 628
integer taborder = 120
string title = "none"
string dataobject = "d_cdcustitem_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
string ls_custno, ls_custnm

if row <1 then return

this.scrolltorow(row)
ls_custno = this.object.customer_cust_no[row]
ls_custnm = this.object.customer_cust_name[row]

dw_3.object.cust_no[1]   = ls_custno
dw_3.object.cust_name[1] = ls_custnm

is_custno   = ls_custno
is_custname = ls_custnm

dw_3.accepttext()
//wf_ret( ls_custno, is_ret )
dw_2.retrieve( ls_custno )
//dw_1.setfocus()


end event

event getfocus;//
rb_2.checked = true

end event

event retrieveend;//
long ll_ccheck

ll_ccheck = dw_6.object.ccheck[1]
if ll_ccheck > 0 then
	cbx_custitem.visible   = true
	cbx_custitem.checked   = true
	cbx_custitem.textcolor = rgb(255, 0, 0)
	cbx_custitem.triggerevent( clicked! )
else
	cbx_custitem.visible   = false
	cbx_custitem.checked   = false
	cbx_custitem.textcolor = rgb(0, 0, 0)
	cbx_custitem.triggerevent( clicked! )
end if

end event

type cb_2 from commandbutton within w_cdcustprice_m
integer x = 3666
integer y = 392
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
string text = "해지"
end type

event clicked;//
//ddlb_4.text = "LIKE"
//ddlb_3.text = "거래처"
//sle_value.text = ""

dw_2.setfilter("")
dw_2.filter()

end event

type cb_6 from commandbutton within w_cdcustprice_m
integer x = 3835
integer y = 392
integer width = 151
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "낮음"
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost > price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type cb_8 from commandbutton within w_cdcustprice_m
integer x = 3991
integer y = 392
integer width = 101
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "="
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost = price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type cb_7 from commandbutton within w_cdcustprice_m
integer x = 4096
integer y = 392
integer width = 151
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "높음"
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost < price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type st_6 from statictext within w_cdcustprice_m
integer x = 3680
integer y = 472
integer width = 434
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "종전단가,확정가"
boolean focusrectangle = false
end type

type pb_excel from picturebutton within w_cdcustprice_m
event mousemove pbm_mousemove
integer x = 3470
integer y = 60
integer width = 187
integer height = 144
integer taborder = 90
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

datawindow dw_dest

dw_dest = dw_2

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type cbx_2 from checkbox within w_cdcustprice_m
integer x = 1010
integer y = 304
integer width = 571
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "등록된 품목보기"
end type

event clicked;//
string ls_where

if this.checked = true then 
	ls_where = "chk = 'Y' "
	dw_1.SetFilter(ls_where)
	dw_1.Filter()
else
	ls_where = ""
	dw_1.SetFilter(ls_where)
	dw_1.Filter()
end if

sle_1.setfocus()

end event

type cb_1 from commandbutton within w_cdcustprice_m
integer x = 1381
integer y = 376
integer width = 174
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
if rb_1.checked = true then
	dw_1.SetFilter("")
	dw_1.Filter()
else
	dw_6.SetFilter("")
	dw_6.Filter()
end if

end event

type cbx_custitem from checkbox within w_cdcustprice_m
integer x = 402
integer y = 304
integer width = 571
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처 품목"
end type

event clicked;//
string ls_where

if this.checked = true then 
	ls_where = "ccnt > 0 "
	dw_6.SetFilter(ls_where)
	dw_6.Filter()
else
	ls_where = ""
	dw_6.SetFilter(ls_where)
	dw_6.Filter()
end if

sle_1.setfocus()

end event

