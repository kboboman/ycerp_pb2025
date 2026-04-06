$PBExportHeader$w_oscustmonth_r2.srw
$PBExportComments$거래처별 판매원장(1998/05/18, 성삼지)
forward
global type w_oscustmonth_r2 from w_inheritance
end type
type st_1 from statictext within w_oscustmonth_r2
end type
type em_1 from editmask within w_oscustmonth_r2
end type
type rb_1 from radiobutton within w_oscustmonth_r2
end type
type rb_2 from radiobutton within w_oscustmonth_r2
end type
type dw_3 from datawindow within w_oscustmonth_r2
end type
type dw_4 from datawindow within w_oscustmonth_r2
end type
type dw_5 from datawindow within w_oscustmonth_r2
end type
type dw_6 from datawindow within w_oscustmonth_r2
end type
type em_2 from editmask within w_oscustmonth_r2
end type
type st_4 from statictext within w_oscustmonth_r2
end type
type em_3 from editmask within w_oscustmonth_r2
end type
type em_4 from editmask within w_oscustmonth_r2
end type
end forward

global type w_oscustmonth_r2 from w_inheritance
integer x = 5
integer y = 124
integer width = 3685
integer height = 2164
string title = "거래처별 판매원장2(w_oscustmonth_r2)"
st_1 st_1
em_1 em_1
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
dw_6 dw_6
em_2 em_2
st_4 st_4
em_3 em_3
em_4 em_4
end type
global w_oscustmonth_r2 w_oscustmonth_r2

type variables
string is_sale_flag, is_aroisql, is_invsql, is_oivcsql, is_custsql, is_ret
end variables

on w_oscustmonth_r2.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_6=create dw_6
this.em_2=create em_2
this.st_4=create st_4
this.em_3=create em_3
this.em_4=create em_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.dw_6
this.Control[iCurrent+9]=this.em_2
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.em_3
this.Control[iCurrent+12]=this.em_4
end on

on w_oscustmonth_r2.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.em_2)
destroy(this.st_4)
destroy(this.em_3)
destroy(this.em_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.visible = false
dw_2.visible = false
dw_3.visible = false
dw_4.visible = false
dw_6.visible = false

string ls_chk
SELECT isnull(sale_price,'N') INTO :ls_chk FROM login WHERE user_id = :gs_userid; 
if ls_chk = 'Y' Then
	is_ret = '%'
else
	is_ret = gs_userid
end if

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
is_aroisql = dw_1.describe("datawindow.table.select")
is_invsql  = dw_2.describe("datawindow.table.select")
is_oivcsql = dw_3.describe("datawindow.table.select")
is_custsql = dw_4.describe("datawindow.table.select")

em_1.text = string(today(), 'yyyy/mm/01')
em_4.text = string(today(), 'yyyy/mm/dd')

end event

event resize;call super::resize;//
dw_5.width  = this.width  - 128
dw_5.height = this.height - 560

end event

type pb_save from w_inheritance`pb_save within w_oscustmonth_r2
boolean visible = false
integer taborder = 120
end type

type dw_1 from w_inheritance`dw_1 within w_oscustmonth_r2
integer x = 1440
integer y = 28
integer width = 105
integer height = 80
integer taborder = 0
string dataobject = "d_oiaroi_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_oscustmonth_r2
integer x = 1550
integer y = 28
integer width = 105
integer height = 80
integer taborder = 0
boolean enabled = false
string dataobject = "d_oiinv_s"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_oscustmonth_r2
integer x = 55
integer y = 24
integer width = 1312
string text = "거래처별 판매원장2"
end type

type st_tips from w_inheritance`st_tips within w_oscustmonth_r2
end type

type pb_compute from w_inheritance`pb_compute within w_oscustmonth_r2
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_oscustmonth_r2
boolean visible = false
integer taborder = 110
end type

type pb_close from w_inheritance`pb_close within w_oscustmonth_r2
integer x = 3374
integer y = 44
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oscustmonth_r2
integer x = 3182
integer y = 44
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
string  ls_cust_no, ls_date
long  ll_month, ll_count, ll_idx
dec ld_bal_amount
 
dw_6.retrieve()
if dw_6.rowcount() < 1 then
 	messagebox("확인", "해당거래처에 대한 원장내역이 없습니다.",information!)		
   return
end if

ls_cust_no = 'zzzz'
for ll_count = 1 to dw_6.rowcount()
	IF ls_cust_no <> dw_6.object.cust_no[ll_count] then
		for ll_idx = 1 to dw_4.rowcount()
			if dw_6.object.cust_no[ll_count] = dw_4.object.cust_no[ll_idx] then
				exit
			end if
		next
		ls_cust_no = dw_6.object.cust_no[ll_count]
		CHOOSE CASE ll_month
   	   CASE 1
	   	   ld_bal_amount = dw_4.object.balbf_amount[ll_idx]
      	CASE 2
	   	   ld_bal_amount = dw_4.object.bal_1[ll_idx]
      	CASE 3
	   	   ld_bal_amount = dw_4.object.bal_2[ll_idx]
      	CASE 4
	   	   ld_bal_amount = dw_4.object.bal_3[ll_idx]
      	CASE 5
	   	   ld_bal_amount = dw_4.object.bal_4[ll_idx]
      	CASE 6
	   	   ld_bal_amount = dw_4.object.bal_5[ll_idx]
      	CASE 7
	   	   ld_bal_amount = dw_4.object.bal_6[ll_idx]
      	CASE 8
	   	   ld_bal_amount = dw_4.object.bal_7[ll_idx]
      	CASE 9
	   	   ld_bal_amount = dw_4.object.bal_8[ll_idx]
      	CASE 10
	   	   ld_bal_amount = dw_4.object.bal_9[ll_idx]
      	CASE 11
	   	   ld_bal_amount = dw_4.object.bal_10[ll_idx]
      	CASE 12
	   	   ld_bal_amount = dw_4.object.bal_11[ll_idx]				
      END CHOOSE
   END IF
	dw_6.object.bal_amount[ll_count] = ld_bal_amount
	dw_6.object.eom_date[ll_count] = ls_date
next

l_print.st_datawindow = dw_6
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 거래처별로 월별 판매원장을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
                   'Datawindow.Zoom=96'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oscustmonth_r2
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_oscustmonth_r2
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_oscustmonth_r2
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oscustmonth_r2
integer x = 2990
integer y = 44
integer taborder = 20
end type

event pb_retrieve::clicked;w_repsuper w_print
st_print l_print

string ls_start_cust, ls_end_cust, ls_where, ls_sql, ls_cust_no, ls_date, ls_sdate, ls_edate
long   ll_year, ll_month, ll_count, ll_idx
dec    ld_bal_amount
real   lr_ole_cnt, lr_ole_add
 
if em_1.text = '' then
	messagebox("확인","매출년월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()
dw_6.reset()

dw_1.accepttext()
dw_2.accepttext()
dw_3.accepttext()
dw_4.accepttext()
dw_5.accepttext()
dw_6.accepttext()

dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)

ll_year  = long(LeftA(em_1.text, 4))
ll_month = long(RightA(em_1.text, 2))
ls_sdate = em_1.text
ls_edate = em_4.text
ls_start_cust = trim(em_2.text)
ls_end_cust   = trim(em_3.text)
ls_date = string(ll_year, "####") + '년 ' + string(ll_month, "##") + '월 '
ll_idx  = 0

//기존 보고서 내역 삭제 98/5/16, 성삼지
DELETE FROM areom; 
// 전체출력
if rb_1.checked = true then	
   ls_where = " and aroiinv.delete_flag <> ~~'Y~~' and aroiinv.oi_date between ~~'" + ls_sdate + &
	           "~~' and ~~'" + ls_edate  + &
				  "~~' and customer.salesman like ~~'" + is_ret + "~~'"
   ls_sql = "datawindow.table.select = '" + is_aroisql + ls_where + "'"
   dw_1.modify(ls_sql)
   dw_1.retrieve()				  

   ls_where = " and aroiinv.delete_flag <> ~~'Y~~' and aroiinv.oi_date between ~~'" + ls_sdate + &
	           "~~' and ~~'" + ls_edate  + &
				  "~~' and customer.salesman like ~~'" + is_ret + "~~'"
   ls_sql = "datawindow.table.select = '" + is_invsql + ls_where + "'"
   dw_2.modify(ls_sql)
   dw_2.retrieve()				  

   ls_where = " and aroivc.delete_key <> ~~'Y~~' and aroivc.oi_date between ~~'" + ls_sdate + &
	           "~~' and ~~'" + ls_edate  + &
				  "~~' and customer.salesman like ~~'" + is_ret + "~~'"
   ls_sql = "datawindow.table.select = '" + is_oivcsql + ls_where + "'"
   dw_3.modify(ls_sql)
   dw_3.retrieve()				  

   ls_where = " and datepart(year, opeom.eom_year) = " + string(ll_year)  + &
				  " and customer.salesman like ~~'" + is_ret + "~~'"
   ls_sql = "datawindow.table.select = '" + is_custsql + ls_where + "'"
   dw_4.modify(ls_sql)
   dw_4.retrieve()	
// 부분출력
else	
   ls_where = " and aroiinv.delete_flag <> ~~'Y~~' and aroiinv.oi_date between ~~'" + ls_sdate + &
	           "~~' and ~~'" + ls_edate + &
				  "~~' and aroiinv.cust_no between ~~'" + ls_start_cust + "~~' and " + "~~'" + ls_end_cust + "~~'"		 + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
   ls_sql = "datawindow.table.select = '" + is_aroisql + ls_where + "'"
   dw_1.modify(ls_sql)
   dw_1.retrieve()				  
	
   ls_where = " and aroiinv.delete_flag <> ~~'Y~~' and aroiinv.oi_date between ~~'" + ls_sdate + &
	           "~~' and ~~'" + ls_edate + &
				  "~~' and aroiinv.cust_no between ~~'" + ls_start_cust + "~~' and " + "~~'" + ls_end_cust + "~~'"		 + &
				  " and customer.salesman like ~~'" + is_ret + "~~'"
   ls_sql = "datawindow.table.select = '" + is_invsql + ls_where + "'"
   dw_2.modify(ls_sql)
   dw_2.retrieve()				  
	
   ls_where = " and aroivc.delete_key <> ~~'Y~~' and aroivc.oi_date between ~~'" + ls_sdate + &
	           "~~' and ~~'" + ls_edate + &
				  "~~' and aroivc.cust_no between ~~'" + ls_start_cust + "~~' and " + "~~'" + ls_end_cust + "~~'"		 + &
				  " and customer.salesman like ~~'" + is_ret + "~~'"
   ls_sql = "datawindow.table.select = '" + is_oivcsql + ls_where + "'"
   dw_3.modify(ls_sql)
   dw_3.retrieve()				  
	
   ls_where = " and datepart(year, opeom.eom_year) = " + string(ll_year) + &
				  " and opeom.cust_no between ~~'" + ls_start_cust + "~~' and " + "~~'" + ls_end_cust + "~~'"	 + &
				  " and customer.salesman like ~~'" + is_ret + "~~'"	
   ls_sql = "datawindow.table.select = '" + is_custsql + ls_where + "'"
   dw_4.modify(ls_sql)
   dw_4.retrieve()				  		
end if
dw_5.setredraw(false)

for ll_count = 1 to dw_1.rowcount()
	lr_ole_cnt = 100 / dw_1.rowcount()

	ll_idx = ll_idx + 1
	dw_5.object.cust_no[ll_idx]   = dw_1.object.cust_no[ll_count]
	dw_5.object.cust_name[ll_idx] = dw_1.object.cust_name[ll_count]
	dw_5.object.aroi_date[ll_idx] = dw_1.object.oi_date[ll_count]
	dw_5.object.doar_no[ll_idx]   = dw_1.object.aroi_do_no[ll_count]
  	dw_5.object.do_flag[ll_idx]   = '판매출고'
	dw_5.object.item_name[ll_idx] = dw_1.object.item_name[ll_count]
	dw_5.object.qa[ll_idx]        = dw_1.object.qa[ll_count]
	dw_5.object.uom[ll_idx]       = dw_1.object.uom[ll_count]
	dw_5.object.do_qty[ll_idx]    = dw_1.object.acc_qty[ll_count]
	dw_5.object.price[ll_idx]     = dw_1.object.price[ll_count]
//	dw_5.object.amount[ll_idx]    = dw_1.object.ori_amount[ll_count] - dw_1.object.rate_cash[ll_count]
	dw_5.object.amount[ll_idx]    = truncate(dw_1.object.acc_qty[ll_count] * dw_1.object.price[ll_count],0) 
	dw_5.object.vat[ll_idx]       = dw_1.object.rate_cash[ll_count]
	dw_5.object.tot_amount[ll_idx]= dw_5.object.amount[ll_idx] + dw_5.object.vat[ll_idx]
	dw_5.object.vc_amount[ll_idx] = 0
	dw_5.object.seq_no[ll_idx]    = dw_1.object.seq_no[ll_count]	
next

for ll_count = 1 to dw_2.rowcount()
   if dw_2.object.ship_cost[ll_count] <> 0  then
   	ll_idx = ll_idx + 1
		
	   dw_5.object.cust_no[ll_idx]   = dw_2.object.cust_no[ll_count]
   	dw_5.object.cust_name[ll_idx] = dw_2.object.cust_name[ll_count]
	   dw_5.object.aroi_date[ll_idx] = dw_2.object.oi_date[ll_count]
   	dw_5.object.doar_no[ll_idx]   = dw_2.object.aroiinv_no[ll_count]
  	   dw_5.object.do_flag[ll_idx]   = '운송비'
   	dw_5.object.item_name[ll_idx] = ''
	   dw_5.object.qa[ll_idx]        = ''
   	dw_5.object.uom[ll_idx]       = ''
	   dw_5.object.do_qty[ll_idx]    = 0
   	dw_5.object.price[ll_idx]     = 0
	   dw_5.object.amount[ll_idx]    = dw_2.object.ship_cost[ll_count]
   	if dw_2.object.aroiinv_rate[ll_count] <> 0 then
		   dw_5.object.vat[ll_idx] = dw_2.object.ship_cost[ll_count] / 10
		else
		   dw_5.object.vat[ll_idx] = 0
	   end if
   	dw_5.object.tot_amount[ll_idx]= dw_5.object.amount[ll_idx] + dw_5.object.vat[ll_idx]
	   dw_5.object.vc_amount[ll_idx] = 0
     	dw_5.object.seq_no[ll_idx]    = 0	
	end if
	
   if dw_2.object.discount[ll_count] > 0 OR dw_2.object.dc[ll_count] > 0 then
   	ll_idx = ll_idx + 1
   	dw_5.object.cust_no[ll_idx]   = dw_2.object.cust_no[ll_count]
	   dw_5.object.cust_name[ll_idx] = dw_2.object.cust_name[ll_count]
   	dw_5.object.aroi_date[ll_idx] = dw_2.object.oi_date[ll_count]
	   dw_5.object.doar_no[ll_idx]   = dw_2.object.aroiinv_no[ll_count]
      dw_5.object.do_flag[ll_idx]   = '에누리'
	   dw_5.object.item_name[ll_idx] = ''
   	dw_5.object.qa[ll_idx]        = ''
	   dw_5.object.uom[ll_idx]       = ''
   	dw_5.object.do_qty[ll_idx]    = 0
	   dw_5.object.price[ll_idx]     = 0
   	dw_5.object.amount[ll_idx]    = (dw_2.object.dc[ll_count] + dw_2.object.discount[ll_count]) * -1
	   if dw_2.object.aroiinv_cash[ll_count] <> 0 then
		   dw_5.object.vat[ll_idx] = (dw_2.object.dc_rate[ll_count] + &
			                          truncate(dw_2.object.discount[ll_count] / 10 + 0.001, 0)) * -1
   	end if
	   dw_5.object.tot_amount[ll_idx]= dw_5.object.amount[ll_idx] + dw_5.object.vat[ll_idx]
   	dw_5.object.vc_amount[ll_idx] = 0
	   dw_5.object.seq_no[ll_idx]    = 0	
	end if
next

for ll_count = 1 to dw_3.rowcount()
	ll_idx = ll_idx + 1

	dw_5.object.cust_no[ll_idx]      = dw_3.object.cust_no[ll_count]
	dw_5.object.cust_name[ll_idx]    = dw_3.object.cust_name[ll_count]
	dw_5.object.aroi_date[ll_idx]    = dw_3.object.oi_date[ll_count]
	dw_5.object.doar_no[ll_idx]      = dw_3.object.vc_no[ll_count]
	if dw_3.object.vc_type[ll_count] = 'R' then
   	dw_5.object.vc_amount[ll_idx] = dw_3.object.amount[ll_count]
    	dw_5.object.do_flag[ll_idx]   = '입금'
	else
   	dw_5.object.vc_amount[ll_idx] = dw_3.object.amount[ll_count] * -1
   	dw_5.object.do_flag[ll_idx]   = '지불'
	end if
	
	dw_5.object.item_name[ll_idx]  = ''
	dw_5.object.qa[ll_idx]         = ''
	dw_5.object.uom[ll_idx]        = ''
	dw_5.object.do_qty[ll_idx]     = 0
	dw_5.object.price[ll_idx]      = 0
	dw_5.object.amount[ll_idx]     = 0
	dw_5.object.vat[ll_idx]        = 0
	dw_5.object.tot_amount[ll_idx] = 0
	dw_5.object.seq_no[ll_idx]     = 1
next

if wf_update1(dw_5, 'N') then
end if
dw_5.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_oscustmonth_r2
boolean visible = false
integer x = 69
integer y = 720
integer width = 713
integer height = 372
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oscustmonth_r2
integer x = 46
integer y = 212
integer width = 3557
integer height = 144
integer taborder = 0
integer textsize = -8
integer weight = 400
boolean enabled = false
end type

type gb_1 from w_inheritance`gb_1 within w_oscustmonth_r2
integer x = 2962
integer y = 8
integer width = 635
integer height = 196
integer taborder = 0
end type

type st_1 from statictext within w_oscustmonth_r2
integer x = 174
integer y = 260
integer width = 352
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "출력년월"
boolean focusrectangle = false
end type

type em_1 from editmask within w_oscustmonth_r2
integer x = 549
integer y = 252
integer width = 448
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type rb_1 from radiobutton within w_oscustmonth_r2
integer x = 1760
integer y = 260
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체출력"
boolean checked = true
end type

event clicked;em_2.enabled = false
em_3.enabled = false
em_2.backcolor = 78682240
em_3.backcolor = 78682240
end event

type rb_2 from radiobutton within w_oscustmonth_r2
integer x = 2240
integer y = 260
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "부분출력"
end type

event clicked;em_2.enabled = true
em_3.enabled = true
em_2.backcolor = 1087434968
em_3.backcolor = 1087434968
end event

type dw_3 from datawindow within w_oscustmonth_r2
integer x = 1659
integer y = 28
integer width = 105
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_oioivc_s"
boolean livescroll = true
end type

type dw_4 from datawindow within w_oscustmonth_r2
integer x = 1769
integer y = 28
integer width = 105
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_oibal_s"
boolean livescroll = true
end type

type dw_5 from datawindow within w_oscustmonth_r2
integer x = 46
integer y = 416
integer width = 3557
integer height = 1604
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_oiareom_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within w_oscustmonth_r2
integer x = 1879
integer y = 28
integer width = 105
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_oicustomnth_r"
boolean livescroll = true
end type

type em_2 from editmask within w_oscustmonth_r2
integer x = 2688
integer y = 256
integer width = 192
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_2.text = lst_whcustret.cust_no
end if
em_3.setfocus()

end event

type st_4 from statictext within w_oscustmonth_r2
integer x = 2903
integer y = 260
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_3 from editmask within w_oscustmonth_r2
integer x = 2967
integer y = 256
integer width = 192
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
boolean autoskip = true
string displaydata = "~b"
end type

event getfocus;if isnull(em_3.text) or trim(em_3.text) = "" then
	em_3.text = em_2.text
end if

end event

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_3.text = lst_whcustret.cust_no
end if


end event

type em_4 from editmask within w_oscustmonth_r2
integer x = 1056
integer y = 252
integer width = 448
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

