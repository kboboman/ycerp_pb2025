$PBExportHeader$w_osaroibeclose_m.srw
$PBExportComments$판매선매출 마감(1998/04/17, 정재수)
forward
global type w_osaroibeclose_m from w_inheritance
end type
type dw_3 from datawindow within w_osaroibeclose_m
end type
type gb_6 from groupbox within w_osaroibeclose_m
end type
type gb_5 from groupbox within w_osaroibeclose_m
end type
type gb_4 from groupbox within w_osaroibeclose_m
end type
type dw_4 from datawindow within w_osaroibeclose_m
end type
type em_1 from editmask within w_osaroibeclose_m
end type
type em_2 from editmask within w_osaroibeclose_m
end type
type st_1 from statictext within w_osaroibeclose_m
end type
type dw_5 from datawindow within w_osaroibeclose_m
end type
type dw_6 from datawindow within w_osaroibeclose_m
end type
type dw_7 from datawindow within w_osaroibeclose_m
end type
end forward

global type w_osaroibeclose_m from w_inheritance
integer x = 37
integer y = 136
integer width = 3598
integer height = 2196
string title = "판매선매출마감(w_osaroibeclose_m)"
boolean resizable = false
long backcolor = 79219928
dw_3 dw_3
gb_6 gb_6
gb_5 gb_5
gb_4 gb_4
dw_4 dw_4
em_1 em_1
em_2 em_2
st_1 st_1
dw_5 dw_5
dw_6 dw_6
dw_7 dw_7
end type
global w_osaroibeclose_m w_osaroibeclose_m

type variables
st_print i_print
datawindowchild idwc_cust
decimal ir_amt
integer ii_an, ii_count
end variables

on w_osaroibeclose_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.gb_6=create gb_6
this.gb_5=create gb_5
this.gb_4=create gb_4
this.dw_4=create dw_4
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_7=create dw_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.gb_6
this.Control[iCurrent+3]=this.gb_5
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.dw_5
this.Control[iCurrent+10]=this.dw_6
this.Control[iCurrent+11]=this.dw_7
end on

on w_osaroibeclose_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_7)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')


end event

type pb_save from w_inheritance`pb_save within w_osaroibeclose_m
integer x = 3150
integer taborder = 80
end type

event pb_save::clicked;long ll_row, ll_row1, ll_find, ll_year
integer li_seq, li_count 
string ls_do_no, ls_do_no1, ls_cust_no, ls_month, ls_aroi_no, ls_sale_flag
decimal lr_total, lr_amt
date ld_sdate, ld_edate
 
dw_2.accepttext()
dw_4.accepttext()
dw_7.accepttext()

if dw_4.rowcount() < 1 then return

if dw_2.object.rem_amt[1] < dw_2.object.amt[1] then
	messagebox("확정","선매출잔액이 합계금액을 초과하였습니다.",exclamation!) 
	return
else					  
	if messagebox("확정","매출로 확정하시겠습니까?",question!,okcancel!,1) = 2 then return
end if

for ll_row = 1 to dw_4.rowcount()
	if dw_4.object.pick[ll_row] = 'Y' then
		li_count = li_count + 1
	end if
next

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if li_count <= 0 then
	messagebox("확인","선정된 물품이 없습니다!",information!)
	return
end if

setpointer(hourglass!)
ls_aroi_no = dw_2.object.aroiinv_no[1]
ls_cust_no = dw_2.object.cust_no[1]
ls_sale_flag = dw_2.object.sale_flag[1]
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

//매출 detail table에서 선매출번호에 해당하는 물품의 max 순번을 가져온다.
SELECT MAX(seq_no) INTO :li_seq
  FROM aroi
 WHERE aroiinv_no = :ls_aroi_no;

if isnull(li_seq) then
	li_seq = 0 
end if

if dw_4.rowcount() > 0 then
	for ll_row = 1 to dw_4.rowcount() 
		if dw_4.object.pick[ll_row] = 'Y' then
			//선매출수량
			dw_4.object.aroi_qty[ll_row] = dw_4.object.aroi_qty[ll_row] + dw_4.object.a_qty[ll_row]
			
			//판매매출관리 detail 			
			ll_row1 = dw_5.insertrow(0)
			dw_5.object.aroiinv_no[ll_row1] = ls_aroi_no
			li_seq = li_seq + 1
			dw_5.object.seq_no[ll_row1] = li_seq
			dw_5.object.do_no[ll_row1] = dw_4.object.do_no[ll_row] 
			ls_do_no1 = dw_4.object.do_no[ll_row] 
			dw_5.object.oi_no[ll_row1] = dw_4.object.oi_no[ll_row]
			dw_5.object.item_no[ll_row1] = dw_4.object.item_no[ll_row]
			dw_5.object.qa[ll_row1] = dw_4.object.qa[ll_row]
			dw_5.object.uom[ll_row1] = dw_4.object.uom[ll_row]
			dw_5.object.ship_qty[ll_row1] = dw_4.object.a_qty[ll_row] 
			dw_5.object.price[ll_row1] = dw_4.object.a_price[ll_row]
			dw_5.object.rate_cash[ll_row1] = dw_4.object.vat[ll_row]
			dw_5.object.ori_amount[ll_row1] = dw_4.object.amt[ll_row]
			dw_5.object.sale_no[ll_row1] = dw_4.object.sale_no[ll_row]
			dw_5.object.dc_rate[ll_row1] = dw_4.object.c_an[ll_row]
			
			//do table update
			if li_seq = 1 then
				ls_do_no = dw_4.object.do_no[ll_row]
				ll_find = dw_6.find("do_no = '" + ls_do_no + "'",1, dw_6.rowcount())
				dw_6.object.invoice_print[ll_find] = 'Y'
			elseif ls_do_no <> ls_do_no1 then
				ll_find = dw_6.find("do_no = '" + ls_do_no1 + "'",1, dw_6.rowcount())
				dw_6.object.invoice_print[ll_find] = 'Y'
				ls_do_no = ls_do_no1
			end if
		end if
	next
end if

if dw_7.rowcount() > 0 then  //운송비가 적용된 출고번호에 대해 do table update
	for ll_row = 1 to dw_7.accepttext()
		if dw_7.object.pick[ll_row] = 'Y' then
			dw_7.object.do_inv_no[ll_row] = ls_aroi_no
		end if
	next
end if

lr_total = dw_2.object.c_dc_amt[1]
ls_cust_no = dw_1.object.cust_no[dw_1.getrow()]

//if lr_total <> 0 then
//	UPDATE customer SET balance_amt = balance_amt - :lr_total
//	 WHERE cust_no = :ls_cust_no;
//	
//	if sqlca.sqlcode <> 0 then
//		rollback;
//		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
//		return
//	end if		
//
////	ll_year = long(string(dw_2.object.oi_date[1], 'yyyy'))
////	ls_month = string(dw_2.object.oi_date[1], 'mm')
////
////	if wf_opeom_update(ls_cust_no, ll_year, ls_month, lr_total) = false then
////		rollback;
////		messagebox("저장","저장도중 오류가 발생하였습니다!",exclamation!)
////		return
////	end if		
//end if

//1998-09-22 수정부분(start)
dw_2.accepttext()
//선매출의 매출금액 갱신
dw_2.object.aroiinv_cash[1] = dw_2.object.aroiinv_cash[1] - dw_2.object.ship[1]
//선매출의 부가세 갱신
dw_2.object.aroiinv_rate[1] = dw_2.object.aroiinv_rate[1] - (dw_2.object.c_ship_cost[1] - dw_2.object.ship[1])
//운송비 갱신
dw_2.object.ship_cost[1] = dw_2.object.ship_cost[1] + dw_2.object.c_ship_cost[1] 
//선매출잔액 갱신
dw_2.object.rem_amt[1] = dw_2.object.rem_amt[1] - dw_2.object.amt[1]
//1998-09-22 수정부분(end)

dw_2.accepttext()
dw_4.accepttext()
dw_5.accepttext()
dw_6.accepttext()
dw_7.accepttext()

if wf_update5(dw_2,dw_4,dw_5,dw_6,dw_7,'N') = true then
	messagebox("확정","선매출이 매출로 확정되었습니다.",information!)
	dw_2.reset()
	dw_3.reset()
	dw_4.reset()
	dw_5.reset()
	dw_6.reset()
	dw_7.reset()
	
	dw_1.postevent(itemchanged!)
end if

		
			
			
			
end event

event pb_save::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"매출확정",parent, li_x, li_y)

end event

type dw_1 from w_inheritance`dw_1 within w_osaroibeclose_m
integer x = 55
integer y = 276
integer width = 859
integer height = 92
integer taborder = 20
string dataobject = "d_oscustomer_s2"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;call super::itemchanged;dw_2.reset()
dw_3.reset()
if dw_4.rowcount() > 0 then
	dw_4.reset()
end if

this.accepttext()
dw_3.retrieve(this.getitemstring(this.getrow(), "cust_no"))
//messagebox('',this.getitemstring(this.getrow(), "cust_no"))

end event

event dw_1::editchanged;call super::editchanged;datawindowchild ldwc_cust
string ls_data
long ll_found,ll_row
int li_line

this.getchild("cust_no", ldwc_cust)
ldwc_cust.settransobject(sqlca)

choose case dwo.name
	case 'cust_no'
		 ls_data = data + '%'
		 ll_row = ldwc_cust.RowCount( )
		 ll_found = ldwc_cust.Find("cust_name like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("cust_name.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 ldwc_cust.scrolltorow(ll_found)
end choose

RETURN 0
end event

type dw_2 from w_inheritance`dw_2 within w_osaroibeclose_m
integer x = 974
integer y = 264
integer width = 2555
integer height = 576
string dataobject = "d_osaroibeclose_m"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;long ll_rate, ll_row
decimal lr_amount, lr_vat, lr_amt, lr_dc

dw_2.accepttext()
choose case dwo.name
	case 'all_chk'
		if data = 'Y' then
   		
			for ll_row = 1 to dw_4.rowcount()
		     	dw_4.object.a_qty[ll_row] = dw_4.object.ship_qty[ll_row] - dw_4.object.aroi_qty[ll_row]
		      dw_4.object.a_price[ll_row] = dw_4.object.price[ll_row]
				dw_4.object.c_an[ll_row] = dw_2.object.rate[1]
				dw_4.object.pick[ll_row] = 'Y'
	      	lr_amount = lr_amount + dw_4.object.amt[ll_row] - truncate((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0)
	     	  	lr_vat = lr_vat + dw_4.object.vat[ll_row] - truncate((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
   	      lr_amt = lr_amt + dw_4.object.amt[ll_row]
  		      lr_dc = lr_dc + dw_4.object.vat[ll_row]
			next
				 
	      if dw_2.object.curr_code[1] = 'WON' then
	     	   dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
         	dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
	         dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
		      dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
        	else
	     	   dw_2.object.cash[1] = lr_amount
    	      dw_2.object.vat[1] = lr_vat 
		      dw_2.object.dc[1] = lr_amt - lr_amount
      	   dw_2.object.dc_rate[1] = lr_dc - lr_vat
   	   end if
		else
         dw_2.object.rate[1] = 0
		end if

   case 'rate'
   	for ll_row = 1 to dw_4.rowcount()
			dw_4.object.c_an[ll_row] = dw_2.object.rate[1]
	   	lr_amount = lr_amount + dw_4.object.amt[ll_row] - truncate((dw_4.object.amt[ll_row] * dw_4.object.c_an[ll_row] / 100), 0 )
	     	lr_vat = lr_vat + dw_4.object.vat[ll_row] - truncate((dw_4.object.vat[ll_row] * dw_4.object.c_an[ll_row] / 100), 0)
   	   lr_amt = lr_amt + dw_4.object.amt[ll_row]
   	   lr_dc = lr_dc + dw_4.object.vat[ll_row]
	   next
		
		if dw_2.object.curr_code[1] = 'WON' then
	      dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
         dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
	      dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
	      dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
      else
	      dw_2.object.cash[1] = lr_amount
   	   dw_2.object.vat[1] = lr_vat 
		   dw_2.object.dc[1] = lr_amt - lr_amount
   	   dw_2.object.dc_rate[1] = lr_dc - lr_vat
      end if

end choose
end event

type st_title from w_inheritance`st_title within w_osaroibeclose_m
string text = "판매선매출마감"
end type

type st_tips from w_inheritance`st_tips within w_osaroibeclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_osaroibeclose_m
integer x = 2958
integer taborder = 130
end type

event pb_compute::clicked;st_aroi_s lst_aroi
string ls_cust_no, ls_sale_flag
date ld_sdate, ld_edate
decimal lr_del
long ll_row

if dw_4.rowcount() < 1 then return

ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)	

if em_1.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ld_sdate > ld_edate then
	messagebox("확인","출고기간을 잘못입력하셨습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_7.rowcount() < 1 then
	ls_sale_flag = dw_2.object.sale_flag[1]	
	dw_7.retrieve(ls_cust_no, ld_sdate, ld_edate, ls_sale_flag)
	
	if dw_7.rowcount() < 1 then
		messagebox("확인","운송비가 이미 모두 세금계산서에 반영되었습니다.",information!)
		return
	end if
end if

lst_aroi.name = 'd_osaroi_s'
lst_aroi.dw_object = dw_7

openwithparm(w_osaroi_m1, lst_aroi)

lst_aroi = message.powerobjectparm

if lst_aroi.flag = 'N' then return

dw_7.accepttext()

for ll_row = 1 to dw_7.rowcount()
	if dw_7.object.pick[ll_row] = 'Y' then
		lr_del = lr_del + dw_7.object.ship_amount[ll_row]
	end if
next

dw_2.setitem(1, "ship", lr_del)



end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"운송비",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_osaroibeclose_m
boolean visible = false
integer x = 2811
integer taborder = 100
end type

type pb_close from w_inheritance`pb_close within w_osaroibeclose_m
integer x = 3342
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroibeclose_m
boolean visible = false
integer x = 2930
integer taborder = 70
end type

event pb_print::clicked;call super::clicked;//w_repsuper w_print
//
//i_print.st_datawindow = dw_3
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroibeclose_m
boolean visible = false
integer x = 2427
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_osaroibeclose_m
boolean visible = false
integer x = 2738
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_osaroibeclose_m
boolean visible = false
integer x = 2738
integer taborder = 60
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroibeclose_m
integer x = 2766
integer taborder = 160
boolean enabled = false
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;string ls_cust_no, ls_register_no, ls_curr_code, ls_sale_flag
date ld_sdate, ld_edate
 
ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)	

if isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

if em_1.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ld_sdate > ld_edate then
	messagebox("확인","출고기간을 잘못입력하셨습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_2.object.curr_code[1] = 'WON' then
	dw_4.dataobject = 'd_osaroibeclose_m1'
else
	dw_4.dataobject = 'd_osaroibeclose_m2'
end if

if dw_4.rowcount() > 0 then
	dw_2.reset()
	dw_3.triggerevent(rowfocuschanged!)
end if

ls_sale_flag = dw_2.object.sale_flag[1]
dw_4.settransobject(sqlca)
dw_4.retrieve(ls_cust_no, ld_sdate, ld_edate, ls_sale_flag)
dw_6.retrieve(ls_cust_no, ld_sdate, ld_edate, ls_sale_flag)

dw_7.reset()

end event

type gb_3 from w_inheritance`gb_3 within w_osaroibeclose_m
integer x = 951
integer y = 220
integer width = 2601
integer height = 632
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_osaroibeclose_m
integer y = 220
integer width = 910
integer height = 156
integer taborder = 0
long textcolor = 16711680
string text = "판매거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_osaroibeclose_m
integer x = 2743
integer width = 809
integer taborder = 0
end type

type dw_3 from datawindow within w_osaroibeclose_m
integer x = 69
integer y = 548
integer width = 832
integer height = 284
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_osaroibeclose_s"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;if this.rowcount() > 0 then
	dw_2.retrieve(this.object.aroiinv_no[this.getrow()])
	dw_2.setfocus()
end if
end event

event retrieveend;if this.getrow() > 0 then
	pb_retrieve.enabled = true
else
	pb_retrieve.enabled = false
end if
end event

type gb_6 from groupbox within w_osaroibeclose_m
integer x = 32
integer y = 372
integer width = 910
integer height = 156
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "출고기간"
end type

type gb_5 from groupbox within w_osaroibeclose_m
integer x = 32
integer y = 504
integer width = 910
integer height = 348
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type gb_4 from groupbox within w_osaroibeclose_m
integer x = 37
integer y = 832
integer width = 3520
integer height = 1280
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type dw_4 from datawindow within w_osaroibeclose_m
integer x = 46
integer y = 868
integer width = 3497
integer height = 1228
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_osaroibeclose_m1"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;long ll_price, ll_rate, ll_row
decimal lr_amount, lr_vat, lr_amt, lr_dc, lr_rate
integer li_count

dw_2.accepttext()
choose case dwo.name
	case 'pick'
		if data = 'Y' then
			this.object.a_qty[this.getrow()] = this.object.ship_qty[this.getrow()] - this.object.aroi_qty[this.getrow()]
			this.object.a_price[this.getrow()] = this.object.price[this.getrow()]
			this.object.c_an[this.getrow()] = ii_an
			ii_count = ii_count + 1
		else
			this.object.a_qty[this.getrow()] = 0
			this.object.a_price[this.getrow()] = 0 
			this.object.c_an[this.getrow()] = 0
			ii_count = ii_count - 1
		end if
		
		this.accepttext()
		for ll_row = 1 to this.rowcount()
			if this.object.pick[ll_row] = 'Y' then
				lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_an[ll_row] / 100), 0)
				lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_an[ll_row] / 100), 0)
				lr_amt = lr_amt + this.object.amt[ll_row]
				lr_dc = lr_dc + this.object.vat[ll_row]
			end if
		next

		ll_row = this.getrow()
		lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_an[ll_row] / 100), 0)
		lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_an[ll_row] / 100), 0)
		lr_amt = lr_amt + this.object.amt[ll_row]
		lr_dc = lr_dc + this.object.vat[ll_row]
		
		IF dw_2.object.curr_code[1] = 'WON' then
		   dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
  		   dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
		   dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
		   dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
		else
		   dw_2.object.cash[1] = lr_amount
  		   dw_2.object.vat[1] = lr_vat 
		   dw_2.object.dc[1] = lr_amt - lr_amount
		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
	   end if
		
	case 'a_qty'
		this.accepttext()
		//출고수량과 매출수량 비교
		ll_row = this.getrow()
		if this.object.a_qty[ll_row] > this.object.ship_qty[ll_row] - this.object.aroi_qty[ll_row] then
			messagebox("확인","매출수량이 출고할 수량을 초과하였습니다!",exclamation!)
			return 1
		end if
		
		for ll_row = 1 to this.rowcount()
			if this.object.pick[ll_row] = 'Y' then			
				lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_an[ll_row] / 100), 0)
				lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_an[ll_row] / 100), 0)
				lr_amt = lr_amt + this.object.amt[ll_row]
				lr_dc = lr_dc + this.object.vat[ll_row]
			end if
		next
		
		if dw_2.object.curr_code[1] = 'WON' then
		   dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
  		   dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
		   dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
		   dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
		else
		   dw_2.object.cash[1] = lr_amount
  		   dw_2.object.vat[1] = lr_vat 
		   dw_2.object.dc[1] = lr_amt - lr_amount
		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
	   end if
		
	case 'a_price'
		this.accepttext()
		for ll_row = 1 to this.rowcount()
			if this.object.pick[ll_row] = 'Y' then			
				lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_an[ll_row] / 100), 0)
				lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_an[ll_row] / 100), 0)
				lr_amt = lr_amt + this.object.amt[ll_row]
				lr_dc = lr_dc + this.object.vat[ll_row]
			end if
		next
		
		if dw_2.object.curr_code[1] = 'WON' then
		   dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
  		   dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
		   dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
		   dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
		else
		   dw_2.object.cash[1] = lr_amount
  		   dw_2.object.vat[1] = lr_vat 
		   dw_2.object.dc[1] = lr_amt - lr_amount
		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
	   end if	
		
	case 'c_an'
		this.accepttext()
		for ll_row = 1 to this.rowcount()
			if this.object.pick[ll_row] = 'Y' then			
				lr_amount = lr_amount + this.object.amt[ll_row] - truncate((this.object.amt[ll_row] * this.object.c_an[ll_row] / 100), 0)
				lr_vat = lr_vat + this.object.vat[ll_row] - truncate((this.object.vat[ll_row] * this.object.c_an[ll_row] / 100), 0)
				lr_amt = lr_amt + this.object.amt[ll_row]
				lr_dc = lr_dc + this.object.vat[ll_row]
			end if
		next

		if dw_2.object.curr_code[1] = 'WON' then
		   dw_2.object.cash[1] = round(lr_amount + 0.4999 ,0)
  		   dw_2.object.vat[1] = round(lr_vat + 0.4999, 0)
		   dw_2.object.dc[1] = truncate(lr_amt - lr_amount, 0)
		   dw_2.object.dc_rate[1] = truncate(lr_dc - lr_vat, 0)
		else
		   dw_2.object.cash[1] = lr_amount
  		   dw_2.object.vat[1] = lr_vat 
		   dw_2.object.dc[1] = lr_amt - lr_amount
		   dw_2.object.dc_rate[1] = lr_dc - lr_vat
	   end if
		
		ii_an = this.object.c_an[this.getrow()]
end choose
end event

event itemerror;long ll_row
decimal lr_amount, lr_amt

ll_row = this.getrow()
this.object.a_qty[ll_row] = this.object.ship_qty[ll_row] - this.object.aroi_qty[ll_row]

for ll_row = 1 to this.rowcount()
	 lr_amount = lr_amount + this.object.amt[ll_row] - (this.object.amt[ll_row] * this.object.c_an[ll_row] / 100)
	 lr_amt = lr_amt + this.object.amt[ll_row]
next
dw_2.object.cash[1] = lr_amount
dw_2.object.dc_amt[1] = round(lr_amt - lr_amount, 0)

return 2
end event

event retrieveend;long ll_row

if this.rowcount() > 0 then
	for ll_row = 1 to this.rowcount()
		this.object.a_price[ll_row] = this.object.price[ll_row]
	next
end if
end event

type em_1 from editmask within w_osaroibeclose_m
integer x = 50
integer y = 432
integer width = 421
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_osaroibeclose_m
integer x = 507
integer y = 432
integer width = 421
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_osaroibeclose_m
integer x = 466
integer y = 448
integer width = 46
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_osaroibeclose_m
boolean visible = false
integer x = 1504
integer width = 475
integer height = 244
boolean bringtotop = true
string dataobject = "d_osaroi_h"
boolean livescroll = true
end type

type dw_6 from datawindow within w_osaroibeclose_m
boolean visible = false
integer x = 1705
integer y = 8
integer width = 530
integer height = 232
boolean bringtotop = true
string dataobject = "d_osaroi_h1"
boolean livescroll = true
end type

type dw_7 from datawindow within w_osaroibeclose_m
boolean visible = false
integer x = 2080
integer y = 44
integer width = 187
integer height = 144
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_osaroi_s"
boolean livescroll = true
end type

