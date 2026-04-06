$PBExportHeader$w_oidoitempricezero_r.srw
$PBExportComments$물품단가 = 0 제품출고현황(1999/5/21,조현춘)
forward
global type w_oidoitempricezero_r from w_inheritance
end type
type st_2 from statictext within w_oidoitempricezero_r
end type
type st_1 from statictext within w_oidoitempricezero_r
end type
type cbx_1 from checkbox within w_oidoitempricezero_r
end type
type st_3 from statictext within w_oidoitempricezero_r
end type
type ddlb_3 from dropdownlistbox within w_oidoitempricezero_r
end type
type st_4 from statictext within w_oidoitempricezero_r
end type
type ddlb_4 from dropdownlistbox within w_oidoitempricezero_r
end type
type sle_1 from singlelineedit within w_oidoitempricezero_r
end type
type cb_1 from commandbutton within w_oidoitempricezero_r
end type
type cb_2 from commandbutton within w_oidoitempricezero_r
end type
type cb_3 from commandbutton within w_oidoitempricezero_r
end type
type cb_5 from commandbutton within w_oidoitempricezero_r
end type
type cbx_2 from checkbox within w_oidoitempricezero_r
end type
type st_5 from statictext within w_oidoitempricezero_r
end type
type pb_1 from picturebutton within w_oidoitempricezero_r
end type
end forward

global type w_oidoitempricezero_r from w_inheritance
integer y = 112
integer width = 4622
integer height = 2508
string title = "물품별 출고현황(단가=0)(w_oidoitempricezero_r)"
st_2 st_2
st_1 st_1
cbx_1 cbx_1
st_3 st_3
ddlb_3 ddlb_3
st_4 st_4
ddlb_4 ddlb_4
sle_1 sle_1
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_2 cbx_2
st_5 st_5
pb_1 pb_1
end type
global w_oidoitempricezero_r w_oidoitempricezero_r

type variables
st_print i_print
gs_itemdo_str1 ist_code
string is_itemdosql

end variables

on w_oidoitempricezero_r.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.cbx_1=create cbx_1
this.st_3=create st_3
this.ddlb_3=create ddlb_3
this.st_4=create st_4
this.ddlb_4=create ddlb_4
this.sle_1=create sle_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_2=create cbx_2
this.st_5=create st_5
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_4
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.cbx_2
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.pb_1
end on

on w_oidoitempricezero_r.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.ddlb_3)
destroy(this.st_4)
destroy(this.ddlb_4)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_2)
destroy(this.st_5)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

is_itemdosql = dw_1.describe("datawindow.table.select")

dw_2.visible = false
dw_1.sharedata(dw_2)
end event

event resize;call super::resize;//
gb_2.width  = this.width  - 142
gb_2.height = this.height - 416

dw_1.width  = this.width  - 238
dw_1.height = this.height - 620


end event

type pb_save from w_inheritance`pb_save within w_oidoitempricezero_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oidoitempricezero_r
integer x = 82
integer y = 392
integer width = 4384
integer height = 1888
integer taborder = 0
string dataobject = "d_oidoitempricezero_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;string ls_col, ls_text

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

this.scrolltorow( row )
choose case dwo.name
	case "user_name"                                                          
		ls_col  = "담당자"                                                    
		ls_text = string(this.object.user_name[row])                            
	case "cust_name"                                                        
		ls_col  = "거래처명"                                                    
		ls_text = string(this.object.cust_name[row])                          
	case "scene_desc"                                                       
		ls_col  = "현장명"                                                  
		ls_text = string(this.object.scene_desc[row])		                      
	case "item_no"                                                            
		ls_col  = "품목"                                                
		ls_text = string(this.object.item_no[row])                              
	case "item_name"                                                          
		ls_col  = "품명"                                                
		ls_text = string(this.object.item_name[row])                            
	case "qa"                                                            
		ls_col  = "규격"                                                    
		ls_text = string(this.object.qa[row])                              
	case "uom"                                                          
		ls_col  = "단위"                                                    
		ls_text = string(this.object.uom[row])                            
	case "ship_qty"
		ls_col  = "출고수량"
		ls_text = string(this.object.ship_qty[row])
	case "com_qty"
		ls_col  = "환산수량"
		ls_text = string(this.object.com_qty[row])
	case "price"
		ls_col  = "출고단가"
		ls_text = string(this.object.price[row])
	case "cash_amount"
		ls_col  = "출고금액"
		ls_text = string(this.object.cash_amount[row])
	case "do_date"
		ls_col  = "출고일자"
		ls_text = string(this.object.do_date[row])
	case "do_no"
		ls_col  = "출고번호"
		ls_text = string(this.object.do_no[row])
end choose

choose case ls_col
	case "출고수량", "환산수량", "출고단가", "출고금액"
		ddlb_4.text = "="
	case else
		ddlb_4.text = "LIKE"
end choose

ddlb_3.text = ls_col
sle_1.text  = ls_text

end event

type dw_2 from w_inheritance`dw_2 within w_oidoitempricezero_r
integer x = 1353
integer y = 12
integer width = 105
integer height = 76
integer taborder = 0
boolean enabled = false
string dataobject = "d_oidoitempricezero_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oidoitempricezero_r
integer x = 50
integer y = 48
integer width = 1545
integer height = 140
string text = "물품별 출고현황(단가=0)"
end type

type st_tips from w_inheritance`st_tips within w_oidoitempricezero_r
end type

type pb_compute from w_inheritance`pb_compute within w_oidoitempricezero_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidoitempricezero_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oidoitempricezero_r
integer x = 4306
integer y = 56
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidoitempricezero_r
integer x = 4114
integer y = 56
integer taborder = 20
end type

event pb_print::clicked;gs_itemdo_str lst_code
w_repsuper w_print
long   ll_count

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
	dw_2.object.customer_bus_rep[ll_count]  = ist_code.end_date
NEXT

i_print.name = 'd_oidoitempricezero_r'
i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 제품별 수주현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oidoitempricezero_r
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oidoitempricezero_r
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oidoitempricezero_r
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidoitempricezero_r
integer x = 3726
integer y = 56
integer taborder = 10
end type

event pb_retrieve::clicked;string ls_sql,   ls_where, ls_sdate, ls_edate, ls_value, ls_temp1, ls_temp2
date   ld_start, ld_end

openwithparm(w_whitemdo_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(ist_code.start_date)
ld_end   = date(ist_code.end_date)

if ist_code.order_flag = 'A' then
	st_1.text = "전체"
   if ist_code.sel_flag = 'A' then
	   ls_where = " and do.do_date between ~~'" + &
		           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
   else
	   ls_where = " and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
		           string(ld_end) + "~~' and dodet.item_no between ~~'" + &				
		           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"
   end if
elseif ist_code.order_flag = 'D' then
	st_1.text = "순수(일반)"
   if ist_code.sel_flag = 'A' then
      ls_where = " and do.cust_no  between ~~'" + STRING(ist_code.start_code) + "~~' and ~~'" + &
                 STRING(ist_code.end_code) + "~~' and do.do_date between ~~'" + &
		           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
   else
	   ls_where = " and do.cust_no  between ~~'" + string(ist_code.start_code) + "~~' and ~~'" + &
		           string(ist_code.end_code) + "~~' and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
		           string(ld_end) + "~~' and dodet.item_no between ~~'" + &				
		           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"
   end if
else
	st_1.text = "내부(공사부, 내장, 기타)"
   if ist_code.sel_flag = 'A' then
	   ls_where = " and customer.cust_type = ~~'D~~' and do.do_date between ~~'" + &
		           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
   else
	   ls_where = " and customer.cust_type = ~~'D~~' and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
		           string(ld_end) + "~~' and dodet.item_no between ~~'" + &				
		           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"
   end if
end if

/* 계열사
N012	판매본부, N013  에코사업본부,N014	(주)유창플러스 ,N002	(주)세화내장건설,H479	(주)유창강건    
*/
if cbx_1.checked = true then
	ls_where = ls_where + " AND NOT (groupitem.item_name like ~~'판넬%~~')"
end if
if cbx_2.checked = true then
	ls_where = ls_where + " AND NOT (do.cust_no IN (~~'N012~~',~~'N013~~',~~'N014~~',~~'N002~~',~~'H479~~') )"
end if

ls_sql = "datawindow.table.select = '" + is_itemdosql + ls_where + "'"
dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_1.retrieve()

if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
end if
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_oidoitempricezero_r
integer x = 2437
integer y = 12
integer width = 1248
integer height = 216
integer taborder = 0
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_oidoitempricezero_r
integer x = 41
integer y = 236
integer width = 4480
integer height = 2092
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oidoitempricezero_r
integer x = 3698
integer width = 823
integer height = 216
integer taborder = 0
end type

type st_2 from statictext within w_oidoitempricezero_r
integer x = 2478
integer y = 128
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

type st_1 from statictext within w_oidoitempricezero_r
integer x = 2830
integer y = 128
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

type cbx_1 from checkbox within w_oidoitempricezero_r
integer x = 2482
integer y = 60
integer width = 384
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "판넬 제외"
boolean checked = true
end type

event clicked;////
//string ls_column
//
//if cbx_1.checked = true then
//	ls_column = "NOT (item_name like '판넬%')"
//else
//	ls_column = ""
//end if
//
//st_5.text = ls_column
//dw_1.setfilter( ls_column )
//
end event

type st_3 from statictext within w_oidoitempricezero_r
integer x = 105
integer y = 304
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

type ddlb_3 from dropdownlistbox within w_oidoitempricezero_r
integer x = 293
integer y = 288
integer width = 402
integer height = 532
integer taborder = 90
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
string item[] = {"담당자","거래처명","현장명","품목","품명","규격","단위","출고수량","환산수량","출고단가","출고금액","출고일자","출고번호"}
end type

type st_4 from statictext within w_oidoitempricezero_r
integer x = 722
integer y = 304
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

type ddlb_4 from dropdownlistbox within w_oidoitempricezero_r
integer x = 891
integer y = 288
integer width = 297
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

type sle_1 from singlelineedit within w_oidoitempricezero_r
integer x = 1211
integer y = 296
integer width = 567
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

type cb_1 from commandbutton within w_oidoitempricezero_r
integer x = 1783
integer y = 296
integer width = 160
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

event clicked;string ls_custnm, ls_column, ls_value, ls_temp, ls_text, ls_col
DataWindow dw_temp

dw_temp = dw_1

ls_temp = ""
if dw_temp.FilteredCount() > 0 THEN
	dw_temp.setfilter(ls_temp)
	dw_temp.filter()
end if

// 필드
if trim(ddlb_3.text) = "" then
	ls_column = ""
else
	choose case trim(ddlb_3.text)
		case "담당자"                                                          
			ls_col  = "user_name "
		case "거래처명"                                                        
			ls_col  = "cust_name "                                                    
		case "현장명"                                                       
			ls_col  = "scene_desc "                                                  
		case "품목"                                                            
			ls_col  = "item_no "                                                
		case "품명"                                                          
			ls_col  = "item_name "                                                
		case "규격"                                                            
			ls_col  = "qa "                                                    
		case "단위"                                                          
			ls_col  = "uom "                                                    
		case "출고수량"
			ls_col  = "ship_qty "
		case "환산수량"
			ls_col  = "com_qty "
		case "출고단가"
			ls_col  = "price "
		case "출고금액"
			ls_col  = "cash_amount "
		case "출고일자"
			ls_col  = "do_date "
		case "출고번호"
			ls_col  = "do_no "
	end choose

	if trim(ddlb_4.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_4.text) + " '%" + trim(sle_1.text) + "%' "
	else
		if ls_col = "do_date1 " or ls_col = "input_date1 " then
			ls_column = ls_col + trim(ddlb_4.text) + " #" + trim(sle_1.text) + "# "
		elseif ls_col = "ship_qty " or ls_col = "com_qty " or ls_col = "price " or ls_col = "cash_amount " then
			ls_column = ls_col + trim(ddlb_4.text) + " "  + trim(sle_1.text) + " "
		else
			ls_column = ls_col + trim(ddlb_4.text) + " '" + trim(sle_1.text) + "' "
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

st_5.text = ls_column
dw_temp.setfilter(ls_temp)
dw_temp.filter()

dw_temp.scrolltorow(1)


end event

type cb_2 from commandbutton within w_oidoitempricezero_r
integer x = 1947
integer y = 296
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
DataWindow dw_temp

dw_temp = dw_1

ddlb_4.text = "LIKE"
ddlb_3.text = "품명"
sle_1.text  = ""

dw_temp.setfilter("")
dw_temp.filter()

dw_temp.SetSort("user_name, cust_name, scene_desc, do_no, oi_no")
dw_temp.Sort()

end event

type cb_3 from commandbutton within w_oidoitempricezero_r
integer x = 2112
integer y = 296
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
string text = "오름"
end type

event clicked;//
string ls_col
DataWindow dw_temp

dw_temp = dw_1

choose case trim(ddlb_3.text)
	case "담당자"                                                          
		ls_col  = "user_name "
	case "거래처명"                                                        
		ls_col  = "cust_name "                                                    
	case "현장명"                                                       
		ls_col  = "scene_desc "                                                  
	case "품목"                                                            
		ls_col  = "item_no "                                                
	case "품명"                                                          
		ls_col  = "item_name "                                                
	case "규격"                                                            
		ls_col  = "qa "                                                    
	case "단위"                                                          
		ls_col  = "uom "                                                    
	case "출고수량"
		ls_col  = "ship_qty "
	case "환산수량"
		ls_col  = "com_qty "
	case "출고단가"
		ls_col  = "price "
	case "출고금액"
		ls_col  = "cash_amount "
	case "출고일자"
		ls_col  = "do_date "
	case "출고번호"
		ls_col  = "do_no "
end choose		

dw_temp.SetSort(ls_col + "A")
dw_temp.sort()

end event

type cb_5 from commandbutton within w_oidoitempricezero_r
integer x = 2277
integer y = 296
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
string text = "내림"
end type

event clicked;//
string ls_col
DataWindow dw_temp

dw_temp = dw_1

choose case trim(ddlb_3.text)
	case "담당자"                                                          
		ls_col  = "user_name "
	case "거래처명"                                                        
		ls_col  = "cust_name "                                                    
	case "현장명"                                                       
		ls_col  = "scene_desc "                                                  
	case "품목"                                                            
		ls_col  = "item_no "                                                
	case "품명"                                                          
		ls_col  = "item_name "                                                
	case "규격"                                                            
		ls_col  = "qa "                                                    
	case "단위"                                                          
		ls_col  = "uom "                                                    
	case "출고수량"
		ls_col  = "ship_qty "
	case "환산수량"
		ls_col  = "com_qty "
	case "출고단가"
		ls_col  = "price "
	case "출고금액"
		ls_col  = "cash_amount "
	case "출고일자"
		ls_col  = "do_date "
	case "출고번호"
		ls_col  = "do_no "
end choose		

dw_temp.SetSort(ls_col + "D")
dw_temp.sort()

end event

type cbx_2 from checkbox within w_oidoitempricezero_r
integer x = 2958
integer y = 60
integer width = 448
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "계열사 제외"
boolean checked = true
end type

event clicked;////
//string ls_value, ls_temp1, ls_temp2
//
///* 계열사
//N012	판매본부, N013  에코사업본부,N014	(주)유창플러스 ,N002	(주)세화내장건설,H479	(주)유창강건    
//*/
//if cbx_1.checked = true then
//	ls_temp1 = "NOT (item_name like '판넬%')"
//else
//	ls_temp1 = ""
//end if
//if cbx_2.checked = true then
//	ls_temp2 = "NOT (cust_no IN ('N012','N013','N014','N002','H479') )"
//else
//	ls_temp2 = ""
//end if
//
//if ls_temp2 <> "" then
//	ls_value = ls_temp1 + " AND " + ls_temp2
//else
//	ls_value = ls_temp1
//end if
//
//st_5.text = ls_value
//dw_1.setfilter( ls_value )
//
end event

type st_5 from statictext within w_oidoitempricezero_r
integer x = 2455
integer y = 308
integer width = 5001
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "none"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_oidoitempricezero_r
event mousemove pbm_mousemove
integer x = 3918
integer y = 56
integer width = 187
integer height = 144
integer taborder = 80
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_dest

dw_dest = dw_1

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

