$PBExportHeader$w_oiscenebaldo_r2.srw
$PBExportComments$현장별 물품출고 집계현황(1999/7/8,이종탁)
forward
global type w_oiscenebaldo_r2 from w_inheritance
end type
end forward

global type w_oiscenebaldo_r2 from w_inheritance
integer y = 112
integer width = 3643
integer height = 2176
string title = "현장별 물품출고 집계현황(w_oicustbaldo_r2)"
end type
global w_oiscenebaldo_r2 w_oiscenebaldo_r2

type variables
gs_itembaldo_str ist_code
string is_sale_flag, is_itemdosql, is_itemdorsql, is_ret
end variables

on w_oiscenebaldo_r2.create
call super::create
end on

on w_oiscenebaldo_r2.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_chk
select isnull(sale_price,'N') into :ls_chk from login
 where user_id = :gs_userid; 
if ls_chk = 'Y' Then
	is_ret = '%'
else
	is_ret = gs_userid
end if
is_itemdosql  = dw_1.describe("datawindow.table.select")
is_itemdorsql = dw_2.describe("datawindow.table.select")
dw_2.visible = false
end event

type pb_save from w_inheritance`pb_save within w_oiscenebaldo_r2
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiscenebaldo_r2
integer x = 50
integer y = 260
integer width = 3493
integer height = 1776
integer taborder = 0
string dataobject = "d_oicustdo_r_1"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oiscenebaldo_r2
integer x = 2153
integer y = 56
integer width = 174
integer height = 136
integer taborder = 0
string dataobject = "d_oicustrep_r1_1"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_oiscenebaldo_r2
integer y = 40
integer width = 2025
string text = "현장별 물품출고 집계현황"
end type

type st_tips from w_inheritance`st_tips within w_oiscenebaldo_r2
end type

type pb_compute from w_inheritance`pb_compute within w_oiscenebaldo_r2
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiscenebaldo_r2
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oiscenebaldo_r2
integer x = 3365
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiscenebaldo_r2
integer x = 3173
integer taborder = 20
end type

event pb_print::clicked;long ll_count

w_repsuper w_print
st_print   l_print

if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

for ll_count = 1 to dw_2.rowcount()
	dw_2.object.bus_tel[1] = ist_code.start_date
	dw_2.object.tel_no[1] = ist_code.end_date
next

//l_print.name = 'd_oicustrep_r1_1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 현장별 물품출고 집계현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiscenebaldo_r2
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oiscenebaldo_r2
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oiscenebaldo_r2
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiscenebaldo_r2
integer x = 2981
integer taborder = 10
string text = " "
end type

event pb_retrieve::clicked;string ls_sql, ls_where

openwithparm(w_whscenebaldo_w2, ist_code)
ist_code = message.powerobjectparm

if ist_code.okcancel = 'N' then
	return
end if				  
	if ist_code.sel_flag = 'A' then  // 전체
	   ls_where = " and do.do_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
		           ist_code.end_date + "~~' and do.cust_no = ~~'" +&
					  ist_code.order_flag + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
	else
   	ls_where = " and do.do_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
		           ist_code.end_date + "~~' and do.cust_no = ~~'" +&
					  ist_code.order_flag + "~~' and do.spot_code = ~~'" +&
	   	        ist_code.sel_flag + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
	end if
	ls_sql = "datawindow.table.select = '" + is_itemdosql + ls_where + "'"

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_2.modify(ls_sql)
dw_1.sharedata(dw_2)
dw_1.retrieve()

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if
end event

type gb_3 from w_inheritance`gb_3 within w_oiscenebaldo_r2
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiscenebaldo_r2
integer x = 27
integer y = 224
integer width = 3534
integer height = 1832
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oiscenebaldo_r2
integer x = 2939
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
end type

