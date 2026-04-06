$PBExportHeader$w_apsuppmonth_r.srw
$PBExportComments$구매처별 매입원장(1999/05/31, 이인호)
forward
global type w_apsuppmonth_r from w_inheritance
end type
type st_1 from statictext within w_apsuppmonth_r
end type
type em_1 from editmask within w_apsuppmonth_r
end type
type rb_1 from radiobutton within w_apsuppmonth_r
end type
type rb_2 from radiobutton within w_apsuppmonth_r
end type
type dw_3 from datawindow within w_apsuppmonth_r
end type
type dw_4 from datawindow within w_apsuppmonth_r
end type
type dw_5 from datawindow within w_apsuppmonth_r
end type
type dw_6 from datawindow within w_apsuppmonth_r
end type
type em_2 from editmask within w_apsuppmonth_r
end type
type st_4 from statictext within w_apsuppmonth_r
end type
type em_3 from editmask within w_apsuppmonth_r
end type
type dw_area from datawindow within w_apsuppmonth_r
end type
type st_22 from statictext within w_apsuppmonth_r
end type
end forward

global type w_apsuppmonth_r from w_inheritance
integer y = 112
integer width = 3703
integer height = 1924
string title = "구매처별 매입원장(w_apsuppmonth_r)"
boolean maxbox = false
windowstate windowstate = normal!
boolean center = true
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
dw_area dw_area
st_22 st_22
end type
global w_apsuppmonth_r w_apsuppmonth_r

type variables
string is_pur_flag, is_apoisql, is_invsql, is_oivcsql, is_suppsql
datawindowchild idwc_area
gs_custdo_str ist_code

end variables

on w_apsuppmonth_r.create
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
this.dw_area=create dw_area
this.st_22=create st_22
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
this.Control[iCurrent+12]=this.dw_area
this.Control[iCurrent+13]=this.st_22
end on

on w_apsuppmonth_r.destroy
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
destroy(this.dw_area)
destroy(this.st_22)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string  ls_name
Window  w_parent

//OpenSheet로 OPEN한 경우
w_parent = this.ParentWindow()

if IsValid(w_parent) then
	ls_name = w_parent.classname()
	if ls_name = "w_all_main" then
		THIS.X  = (w_parent.width  - this.width)  / 2
		THIS.Y  = (w_parent.height - this.height) / 2 - 200
	else
		THIS.X  = (w_parent.width  - this.width)  / 2 + 1250
		THIS.Y  = (w_parent.height - this.height) / 2 + 150
	end if
end if

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
if LeftA(gs_team,1) = "9" then
	dw_area.object.area[1] = " "
else
	dw_area.object.area[1] = gs_area
end if

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

//if gs_userid = 'root' or gs_userid = '1999010s' then
//else
//	dw_area.enabled = false
//end if

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
is_apoisql = dw_1.describe("datawindow.table.select")
is_invsql  = dw_2.describe("datawindow.table.select")
is_oivcsql = dw_3.describe("datawindow.table.select")
is_suppsql = dw_4.describe("datawindow.table.select")
em_1.text  = string(today(), 'yyyy/mm')
dw_3.visible = false
dw_5.visible = false

end event

type pb_save from w_inheritance`pb_save within w_apsuppmonth_r
boolean visible = false
integer taborder = 130
end type

type dw_1 from w_inheritance`dw_1 within w_apsuppmonth_r
integer x = 1426
integer y = 48
integer width = 119
integer height = 88
integer taborder = 0
string dataobject = "d_aparoi_cal_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_apsuppmonth_r
integer x = 1595
integer y = 48
integer width = 119
integer height = 88
integer taborder = 0
boolean enabled = false
string dataobject = "d_apinv_cal_s"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_apsuppmonth_r
integer y = 28
integer width = 1326
string text = "구매처별 매입원장"
end type

type st_tips from w_inheritance`st_tips within w_apsuppmonth_r
end type

type pb_compute from w_inheritance`pb_compute within w_apsuppmonth_r
boolean visible = false
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_apsuppmonth_r
boolean visible = false
integer taborder = 110
end type

type pb_close from w_inheritance`pb_close within w_apsuppmonth_r
integer x = 1550
integer y = 416
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apsuppmonth_r
integer x = 1550
integer y = 264
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
string ls_start_supp, ls_end_supp, ls_where, ls_sql, ls_supp_no, ls_date, ls_area
long   ll_year, ll_month, ll_count, ll_idx
dec    ld_bal_amount
real   lr_ole_cnt, lr_ole_add

dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)

if em_1.text = '' then
	messagebox("확인","매입년월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

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

ll_year  = long(LeftA(em_1.text, 4))
ll_month = long(RightA(em_1.text, 2))
ls_start_supp = trim(em_2.text)
ls_end_supp   = trim(em_3.text)
ls_area  = dw_area.object.area[1]
ls_date  = string(ll_year, "####") + '년 ' + string(ll_month, "##") + '월 '
ll_idx   = 0

DELETE FROM appeom; 
if rb_1.checked = true then	// 전체출력
   ls_where = " and apoiinv.delete_flag <> ~~'Y~~' and datepart(year, apoiinv.oi_date) = " + string(ll_year) + &
	           " and datepart(month, apoiinv.oi_date) = " + string(ll_month) + &
	           " and apoiinv.inv_area = ~~'" + ls_area + "~~'"
   ls_sql = "datawindow.table.select = '" + is_apoisql + ls_where + "'"
   dw_1.modify(ls_sql)
   dw_1.retrieve()
	
   ls_sql = "datawindow.table.select = '" + is_invsql + ls_where + "'"
   dw_2.modify(ls_sql)
   dw_2.retrieve()				  
	
   ls_where = " and apoivc.delete_key <> ~~'Y~~' and datepart(year, apoivc.oi_date) = " + string(ll_year) + &
	           " and datepart(month, apoivc.oi_date) = " + string(ll_month)  + &
	           " and apoivc.vc_area = ~~'" + ls_area + "~~'"
   ls_sql = "datawindow.table.select = '" + is_oivcsql + ls_where + "'"
   dw_3.modify(ls_sql)
   dw_3.retrieve()				  
	
   ls_where = " and datepart(year, apeom.eom_year) = " + string(ll_year)  + &
	           " and apeom.area_no = ~~'" + ls_area + "~~'"
   ls_sql = "datawindow.table.select = '" + is_suppsql + ls_where + "'"
   dw_4.modify(ls_sql)
   dw_4.retrieve()				  	
else			// 부분출력
   ls_where = " and apoiinv.delete_flag <> ~~'Y~~' and datepart(year, apoiinv.oi_date) = " + string(ll_year) + &
	           " and datepart(month, apoiinv.oi_date) = " + string(ll_month) + &
	           " and apoiinv.inv_area = ~~'" + ls_area + "~~'" + &
				  " and apoiinv.supp_no between ~~'" + ls_start_supp + "~~' and " + "~~'" + ls_end_supp + "~~'"		
   ls_sql = "datawindow.table.select = '" + is_apoisql + ls_where + "'"
   dw_1.modify(ls_sql)
   dw_1.retrieve()				  
	
   ls_sql = "datawindow.table.select = '" + is_invsql + ls_where + "'"
   dw_2.modify(ls_sql)
   dw_2.retrieve()				  
	
   ls_where = " and apoivc.delete_key <> ~~'Y~~' and datepart(year, apoivc.oi_date) = " + string(ll_year) + &
	           " and datepart(month, apoivc.oi_date) = " + string(ll_month) + &
	           " and apoivc.vc_area = ~~'" + ls_area + "~~'" + &
				  " and apoivc.supp_no between ~~'" + ls_start_supp + "~~' and " + "~~'" + ls_end_supp + "~~'"		
   ls_sql = "datawindow.table.select = '" + is_oivcsql + ls_where + "'"
   dw_3.modify(ls_sql)
   dw_3.retrieve()				  
	
   ls_where = " and datepart(year, apeom.eom_year) = " + string(ll_year)  + &
	           " and apeom.area_no = ~~'" + ls_area + "~~'" + &
				  " and apeom.supp_no between ~~'" + ls_start_supp + "~~' and " + "~~'" + ls_end_supp + "~~'"		
   ls_sql = "datawindow.table.select = '" + is_suppsql + ls_where + "'"
   dw_4.modify(ls_sql)
   dw_4.retrieve()				  		
end if

for ll_count = 1 to dw_1.rowcount()
	lr_ole_cnt = 100 / dw_1.rowcount()
	
	ll_idx = ll_idx + 1
	dw_5.object.supp_no[ll_idx]   = dw_1.object.supp_no[ll_count]
	dw_5.object.supp_name[ll_idx] = dw_1.object.supp_name[ll_count]
	dw_5.object.apoi_date[ll_idx] = dw_1.object.oi_date[ll_count]
	dw_5.object.inspap_no[ll_idx] = dw_1.object.apoi_insp_no[ll_count]
  	dw_5.object.insp_flag[ll_idx] = '자재매입'
	dw_5.object.item_name[ll_idx] = dw_1.object.item_name[ll_count]
	dw_5.object.qa[ll_idx]        = dw_1.object.qa[ll_count]
	dw_5.object.uom[ll_idx]       = dw_1.object.uom[ll_count]
	dw_5.object.insp_qty[ll_idx]  = dw_1.object.comqty[ll_count]
	dw_5.object.price[ll_idx]     = dw_1.object.price[ll_count]
	dw_5.object.amount[ll_idx]    = dw_1.object.ori_amount[ll_count] - dw_1.object.dc[ll_count]
	dw_5.object.vat[ll_idx]       = dw_1.object.rate_cash[ll_count]
//	dw_5.object.amount[ll_idx]    = (dw_1.object.comqty[ll_count] * dw_1.object.price[ll_count]) 
	dw_5.object.tot_amount[ll_idx]= dw_5.object.amount[ll_idx] + dw_5.object.vat[ll_idx]
	dw_5.object.vc_amount[ll_idx] = 0
	dw_5.object.seq_no[ll_idx]    = dw_1.object.seq_no[ll_count]	
	dw_5.object.oi_no[ll_idx]     = dw_1.object.oi_no[ll_count]	

next

for ll_count = 1 to dw_2.rowcount()
   IF dw_2.object.ship_cost[ll_count] <> 0  then
   	ll_idx = ll_idx + 1
	   dw_5.object.supp_no[ll_idx]   = dw_2.object.supp_no[ll_count]
   	dw_5.object.supp_name[ll_idx] = dw_2.object.supp_name[ll_count]
	   dw_5.object.apoi_date[ll_idx] = dw_2.object.oi_date[ll_count]
   	dw_5.object.inspap_no[ll_idx] = dw_2.object.apoiinv_no[ll_count]
  	   dw_5.object.insp_flag[ll_idx] = '운송비'
   	dw_5.object.item_name[ll_idx] = ''
	   dw_5.object.qa[ll_idx]        = ''
   	dw_5.object.uom[ll_idx]       = ''
	   dw_5.object.insp_qty[ll_idx]  = 0
   	dw_5.object.price[ll_idx]     = 0
	   dw_5.object.amount[ll_idx]    = dw_2.object.ship_cost[ll_count]
   	IF dw_2.object.apoiinv_rate[ll_count] <> 0 THEN
		   dw_5.object.vat[ll_idx] = dw_2.object.ship_cost[ll_count] / 10
		ELSE
		   dw_5.object.vat[ll_idx] = 0
	   END IF
   	dw_5.object.tot_amount[ll_idx]= dw_5.object.amount[ll_idx] + dw_5.object.vat[ll_idx]
	   dw_5.object.vc_amount[ll_idx] = 0
     	dw_5.object.seq_no[ll_idx]    = 0	
	END IF
   IF dw_2.object.discount[ll_count] > 0 OR dw_2.object.dc[ll_count] > 0 then
   	ll_idx = ll_idx + 1
   	dw_5.object.supp_no[ll_idx]   = dw_2.object.supp_no[ll_count]
	   dw_5.object.supp_name[ll_idx] = dw_2.object.supp_name[ll_count]
   	dw_5.object.apoi_date[ll_idx] = dw_2.object.oi_date[ll_count]
	   dw_5.object.inspap_no[ll_idx] = dw_2.object.apoiinv_no[ll_count]
      dw_5.object.insp_flag[ll_idx] = '에누리'
	   dw_5.object.item_name[ll_idx] = ''
   	dw_5.object.qa[ll_idx]        = ''
	   dw_5.object.uom[ll_idx]       = ''
   	dw_5.object.insp_qty[ll_idx]  = 0
	   dw_5.object.price[ll_idx]     = 0
   	dw_5.object.amount[ll_idx]    = (dw_2.object.dc[ll_count] + dw_2.object.discount[ll_count]) * -1
	   IF dw_2.object.apoiinv_cash[ll_count] <> 0 THEN
		   dw_5.object.vat[ll_idx]    = (dw_2.object.dc_rate[ll_count] + &
			                             truncate(dw_2.object.discount[ll_count] / 10 + 0.001, 0)) * -1
   	END IF
	   dw_5.object.tot_amount[ll_idx]= dw_5.object.amount[ll_idx] + dw_5.object.vat[ll_idx]
   	dw_5.object.vc_amount[ll_idx] = 0
	   dw_5.object.seq_no[ll_idx]    = 0	
	end if
next

for ll_count = 1 to dw_3.rowcount()
	ll_idx = ll_idx + 1
	dw_5.object.supp_no[ll_idx]   = dw_3.object.supp_no[ll_count]
	dw_5.object.supp_name[ll_idx] = dw_3.object.supp_name[ll_count]
	dw_5.object.apoi_date[ll_idx] = dw_3.object.oi_date[ll_count]
	dw_5.object.inspap_no[ll_idx] = dw_3.object.vc_no[ll_count]
	IF dw_3.object.vc_type[ll_count] = 'R' then
   	dw_5.object.vc_amount[ll_idx] = dw_3.object.amount[ll_count]
    	dw_5.object.insp_flag[ll_idx] = '입금'
	else
   	dw_5.object.vc_amount[ll_idx] = dw_3.object.amount[ll_count] * -1
   	dw_5.object.insp_flag[ll_idx] = '지불'
	end if
	dw_5.object.item_name[ll_idx] = ''
	dw_5.object.qa[ll_idx]        = ''
	dw_5.object.uom[ll_idx]       = ''
	dw_5.object.insp_qty[ll_idx]  = 0
	dw_5.object.price[ll_idx]     = 0
	dw_5.object.amount[ll_idx]    = 0
	dw_5.object.vat[ll_idx]       = 0
	dw_5.object.tot_amount[ll_idx]= 0
	dw_5.object.seq_no[ll_idx]    = 1
next

if wf_update1(dw_5, 'N') then
else
	return
end if

dw_6.retrieve()
if dw_6.rowcount() < 1 then
 	messagebox("확인", "해당거래처에 대한 원장내역이 없습니다.",information!)		
   return
end if

ls_supp_no = 'zzzz'
for ll_count = 1 to dw_6.rowcount()
	IF ls_supp_no <> dw_6.object.supp_no[ll_count] then
		for ll_idx = 1 to dw_4.rowcount()
			if dw_6.object.supp_no[ll_count] = dw_4.object.supp_no[ll_idx] then
				exit
			end if
		next
		ls_supp_no = dw_6.object.supp_no[ll_count]
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
l_print.st_print_desc = " 이 프로그램은 구매처별로 월별 매입원장을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_apsuppmonth_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_apsuppmonth_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_apsuppmonth_r
boolean visible = false
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apsuppmonth_r
integer x = 1947
integer y = 284
integer taborder = 20
end type

event pb_retrieve::clicked;call super::clicked;
openwithparm(w_whsuppret_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

//	select cust_name into :ls_custname  from customer where cust_no = :ist_code.start_no;
//	select cust_name into :ls_custname1 from customer where cust_no = :ist_code.end_no;

end event

type gb_3 from w_inheritance`gb_3 within w_apsuppmonth_r
boolean visible = false
integer x = 69
integer y = 720
integer width = 713
integer height = 372
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_apsuppmonth_r
integer x = 27
integer y = 208
integer width = 1490
integer height = 400
integer taborder = 0
integer textsize = -8
boolean enabled = false
end type

type gb_1 from w_inheritance`gb_1 within w_apsuppmonth_r
integer x = 1527
integer y = 208
integer width = 242
integer height = 400
integer taborder = 0
end type

type st_1 from statictext within w_apsuppmonth_r
integer x = 878
integer y = 280
integer width = 178
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
string text = "년월"
boolean focusrectangle = false
end type

type em_1 from editmask within w_apsuppmonth_r
integer x = 1047
integer y = 276
integer width = 329
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
string mask = "yyyy/mm"
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type rb_1 from radiobutton within w_apsuppmonth_r
integer x = 274
integer y = 400
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

type rb_2 from radiobutton within w_apsuppmonth_r
integer x = 274
integer y = 496
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

type dw_3 from datawindow within w_apsuppmonth_r
integer x = 1765
integer y = 48
integer width = 119
integer height = 88
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_apoivc_cal_s"
boolean livescroll = true
end type

type dw_4 from datawindow within w_apsuppmonth_r
integer x = 32
integer y = 644
integer width = 3538
integer height = 928
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_apbal_s"
boolean livescroll = true
end type

type dw_5 from datawindow within w_apsuppmonth_r
integer x = 1934
integer y = 48
integer width = 119
integer height = 88
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_appeom_s"
boolean livescroll = true
end type

type dw_6 from datawindow within w_apsuppmonth_r
integer x = 2103
integer y = 48
integer width = 119
integer height = 88
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_apcustomnth_r"
boolean livescroll = true
end type

type em_2 from editmask within w_apsuppmonth_r
integer x = 818
integer y = 488
integer width = 238
integer height = 80
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
string mask = "aaaaa"
boolean autoskip = true
end type

type st_4 from statictext within w_apsuppmonth_r
integer x = 1083
integer y = 492
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

type em_3 from editmask within w_apsuppmonth_r
integer x = 1143
integer y = 488
integer width = 238
integer height = 80
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
string mask = "aaaaa"
boolean autoskip = true
end type

type dw_area from datawindow within w_apsuppmonth_r
integer x = 306
integer y = 272
integer width = 539
integer height = 88
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_22 from statictext within w_apsuppmonth_r
integer x = 96
integer y = 272
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

