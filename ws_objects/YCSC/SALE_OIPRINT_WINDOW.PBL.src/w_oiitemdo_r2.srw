$PBExportHeader$w_oiitemdo_r2.srw
$PBExportComments$물품명별 출고현황(2001/12/13,이인호)
forward
global type w_oiitemdo_r2 from w_inheritance
end type
type st_2 from statictext within w_oiitemdo_r2
end type
type st_1 from statictext within w_oiitemdo_r2
end type
end forward

global type w_oiitemdo_r2 from w_inheritance
integer y = 112
integer width = 3643
integer height = 2172
string title = "물품명별 출고현황(w_oiitemdo_r2)"
st_2 st_2
st_1 st_1
end type
global w_oiitemdo_r2 w_oiitemdo_r2

type variables
st_print i_print
string is_sale_flag, is_itemdosql, is_ret
gs_itemdo_str1 ist_code

end variables

on w_oiitemdo_r2.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
end on

on w_oiitemdo_r2.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
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
is_itemdosql = dw_1.describe("datawindow.table.select")
dw_2.visible = false
end event

type pb_save from w_inheritance`pb_save within w_oiitemdo_r2
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiitemdo_r2
integer x = 37
integer y = 260
integer width = 3520
integer height = 1776
integer taborder = 0
string dataobject = "d_oiitem_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oiitemdo_r2
integer x = 1559
integer y = 32
integer width = 91
integer height = 76
integer taborder = 0
string dataobject = "d_oiitemdo_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oiitemdo_r2
integer y = 40
integer width = 1477
string text = "물품명별 출고현황"
end type

type st_tips from w_inheritance`st_tips within w_oiitemdo_r2
end type

type pb_compute from w_inheritance`pb_compute within w_oiitemdo_r2
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiitemdo_r2
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oiitemdo_r2
integer x = 3365
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiitemdo_r2
integer x = 3173
integer taborder = 20
end type

event pb_print::clicked;
long ll_count
w_repsuper w_print

if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

FOR ll_count = 1 TO dw_2.rowcount()
   dw_2.object.customer_industry_code[ll_count] = st_1.text
	dw_2.object.customer_bus_cord[ll_count] = ist_code.start_date
	dw_2.object.customer_bus_rep[ll_count] = ist_code.end_date
NEXT

//i_print.name = 'd_oiitemdo_r'
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 제품별 수주현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=80'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oiitemdo_r2
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oiitemdo_r2
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oiitemdo_r2
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiitemdo_r2
integer x = 2981
integer taborder = 10
end type

event pb_retrieve::clicked;string ls_sql, ls_where
date ld_start, ld_end

openwithparm(w_whitemdo_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(ist_code.start_date)
ld_end = date(ist_code.end_date)

/*
	2006.06.14
	권한2등급인자 보안카드적용
	19981214  조형섭
	20000302  전순미
	berrygrl      김원규			
	<!-- 소스추가시작 -->						
*/		
string ls_level_userid
Choose Case gs_level
	Case 'A'
		ls_level_userid = '%'
		is_ret = '%'
	Case 'B'			
		string sec_userid
		sec_userid = gs_userid
		openwithparm(w_security,'물품명별 출고현황 조회')
		sec_userid = Message.StringParm
		if sec_userid <> 'Y' then
			ls_level_userid = gs_userid
			is_ret = 'gs_userid'
		Else
			ls_level_userid = '%'
			is_ret = 'P'
		end if
	Case 'C'
		ls_level_userid = gs_userid
		is_ret = 'gs_userid'
End Choose
/*
	<!-- 소스추가끝 -->
*/	

if ist_code.order_flag = 'A' then
	st_1.text = "전체"
   if ist_code.sel_flag = 'A' then
	   ls_where = " and do.do_date between ~~'" + &
		           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~' and sale.salesman like ~~'" + ls_level_userid + "~~'"		
   else
	   ls_where = " and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
		           string(ld_end) + "~~' and groupitem.item_name like ~~'" + &				
		           ist_code.start_no + "~~'  and sale.salesman like ~~'" + ls_level_userid + "~~' "
//		           string(ld_end) + "~~' and dodet.item_no between ~~'" + &				
//		           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"
   end if
elseif ist_code.order_flag = 'D' then
	st_1.text = "순수(일반)"
   if ist_code.sel_flag = 'A' then
      ls_where = " and do.cust_no  between ~~'" + STRING(ist_code.start_code) + "~~' and ~~'" + &
	                STRING(ist_code.end_code) + "~~' and do.do_date between ~~'" + &
	 	             string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~' and sale.salesman like ~~'" + ls_level_userid + "~~'"		
   else
	   ls_where = " and do.cust_no  between ~~'" + string(ist_code.start_code) + "~~' and ~~'" + &
		           string(ist_code.end_code) + "~~' and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
		           string(ld_end) + "~~' and groupitem.item_name like ~~'" + &				
		           ist_code.start_no + "~~' and sale.salesman like ~~'" + ls_level_userid + "~~' "
   end if
else
	st_1.text = "내부(공사부, 내장, 기타)"
   if ist_code.sel_flag = 'A' then
	   ls_where = " and customer.cust_type = ~~'D~~' and do.do_date between ~~'" + &
		           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~' and sale.salesman like ~~'" + ls_level_userid + "~~'"		
   else
	   ls_where = " and customer.cust_type = ~~'D~~' and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
		           string(ld_end) + "~~' and groupitem.item_name like ~~'" + &				
		           ist_code.start_no + "~~' and sale.salesman like ~~'" + ls_level_userid + "~~' "
   end if
end if
ls_sql = "datawindow.table.select = '" + is_itemdosql + ls_where + "'"
dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_2.modify(ls_sql)
dw_1.sharedata(dw_2)
dw_1.retrieve(is_ret)
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if
	
end event

type gb_3 from w_inheritance`gb_3 within w_oiitemdo_r2
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiitemdo_r2
integer x = 23
integer y = 220
integer width = 3557
integer height = 1828
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oiitemdo_r2
integer x = 2953
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
end type

type st_2 from statictext within w_oiitemdo_r2
integer x = 1669
integer y = 120
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "조회범위:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_oiitemdo_r2
integer x = 2021
integer y = 120
integer width = 809
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

