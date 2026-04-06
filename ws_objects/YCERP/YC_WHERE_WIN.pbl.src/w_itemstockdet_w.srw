$PBExportHeader$w_itemstockdet_w.srw
$PBExportComments$물품선택다중(저장소재고)선택(2003/09/02,이인호)
forward
global type w_itemstockdet_w from window
end type
type cb_4 from commandbutton within w_itemstockdet_w
end type
type dw_4 from datawindow within w_itemstockdet_w
end type
type rb_code from radiobutton within w_itemstockdet_w
end type
type rb_name from radiobutton within w_itemstockdet_w
end type
type st_12 from statictext within w_itemstockdet_w
end type
type dw_3 from datawindow within w_itemstockdet_w
end type
type cb_9 from commandbutton within w_itemstockdet_w
end type
type cb_8 from commandbutton within w_itemstockdet_w
end type
type cb_6 from commandbutton within w_itemstockdet_w
end type
type cb_2 from commandbutton within w_itemstockdet_w
end type
type cb_1 from commandbutton within w_itemstockdet_w
end type
type dw_1 from datawindow within w_itemstockdet_w
end type
type dw_loc from datawindow within w_itemstockdet_w
end type
type gb_2 from groupbox within w_itemstockdet_w
end type
end forward

global type w_itemstockdet_w from window
integer x = 727
integer y = 136
integer width = 4763
integer height = 1872
boolean titlebar = true
string title = "장기재고품목별선택(w_itemstockdet_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cb_4 cb_4
dw_4 dw_4
rb_code rb_code
rb_name rb_name
st_12 st_12
dw_3 dw_3
cb_9 cb_9
cb_8 cb_8
cb_6 cb_6
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
dw_loc dw_loc
gb_2 gb_2
end type
global w_itemstockdet_w w_itemstockdet_w

type variables
gs_where2 istr_where
string is_where, is_loc
int ii_sw = 1, i_row
datawindow dw2, dw3, dw4, dw5, dw6, dw7, dw8, dw9, dw10, dw11

end variables

forward prototypes
public subroutine wf_filter (string as_word, string as_first, string as_second)
public subroutine wf_filitem (string as_item)
public subroutine wf_filter1 (string as_flag)
end prototypes

public subroutine wf_filter (string as_word, string as_first, string as_second);//string  ls_result, ls_locno
//dw2.setredraw(false)
//
//ls_result = "mid(item_name,1,2) = '" + as_word + "'or (mid(item_name,1,2) >= '" + as_first + "' and mid(item_name,1,2) < '" + as_second + "')"
//
//dw2.SelectRow(0,  false)
//dw2.setfilter(ls_result)
//dw2.filter()
//dw2.setredraw(true)
//dw2.sort()
//
//string ls_item
//if dw2.getrow() < 1 then return
//ls_item = dw2.object.item_no[dw2.getrow()]
//dw3.setredraw(false)
//dw3.reset()
//
////if is_loc = 'WS00000011' THEN
////	ls_locno =  'WS00000011'
////ELSE
//////	ls_locno =  '%'
////	ls_locno =  'WS00000011'
////END IF
//
//dw3.retrieve(is_loc, ls_item )
////dw3.retrieve(ls_locno, ls_item )
//dw3.setredraw(true)
//tab_1.tabpage_1.rb_code.checked = true
//dw4.object.cust_no[1] = ''

end subroutine

public subroutine wf_filitem (string as_item);//tab_1.tabpage_1.rb_code.checked = true
//tab_1.tabpage_1.rb_code.triggerevent(clicked!)
//dw4.object.cust_no[1] = as_item
//tab_1.tabpage_1.cb_4.postevent(clicked!)


end subroutine

public subroutine wf_filter1 (string as_flag);
dw4.object.cust_no[1] = ''
if as_flag = '' then
	dw2.setfilter("")
else
	dw2.setfilter(" source = '" + as_flag + "' ")
end if
dw2.Filter( )

if dw2.rowcount() > 1 then
		dw2.ScrollToRow(1)
end if

end subroutine

on w_itemstockdet_w.create
this.cb_4=create cb_4
this.dw_4=create dw_4
this.rb_code=create rb_code
this.rb_name=create rb_name
this.st_12=create st_12
this.dw_3=create dw_3
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_6=create cb_6
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.dw_loc=create dw_loc
this.gb_2=create gb_2
this.Control[]={this.cb_4,&
this.dw_4,&
this.rb_code,&
this.rb_name,&
this.st_12,&
this.dw_3,&
this.cb_9,&
this.cb_8,&
this.cb_6,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.dw_loc,&
this.gb_2}
end on

on w_itemstockdet_w.destroy
destroy(this.cb_4)
destroy(this.dw_4)
destroy(this.rb_code)
destroy(this.rb_name)
destroy(this.st_12)
destroy(this.dw_3)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_6)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.dw_loc)
destroy(this.gb_2)
end on

event open;long ll_found
string ls_item_no

dw_3.settransobject(sqlca)
dw_1.settransobject(sqlca)

// 2019-10-25 JOWONSUK 넘어온 데이터 형식
//lstr_where.str1[1]    = this.object.item_no[row]
//lstr_where.str2[1]    = this.object.qa[row]
//lstr_where.str3[1]    = this.object.order_no[row]		
//lstr_where.qty1[1]    = this.object.seq_no[row]
//lstr_where.str4[1]    = this.object.do_no[row]		
//lstr_where.qty2[1]    = this.object.oi_no[row]		
//lstr_where.chk	      = this.object.loc_no[row]

istr_where = Message.PowerObjectParm

is_loc = istr_where.chk

if isnull(is_loc) or trim(is_loc) = '' then
	select def_loc into :is_loc from area where area_no = :gs_area;
end if

//
//// 저장소
dw_loc.settransobject(sqlca)
dw_loc.insertrow(1)
dw_loc.object.loc_no[1] = is_loc
dw_4.insertrow(1)

ls_item_no = istr_where.str1[1]
//ls_item_no = 'PZZAASPZ00'

dw_4.object.cust_no[1] = ls_item_no

dw_3.retrieve(is_loc, ls_item_no)							

//if UpperBound(istr_where.str1) > 0 then
//	if not isnull(istr_where.str1[1]) and trim(istr_where.str1[1]) <> '' then
//		dw_2.setsort('item_no A')
//		dw_2.sort()
//		rb_code.checked = true
//		rb_name.checked = false
//		dw_4.object.cust_no[1] = istr_where.str1[1]
//		cb_4.triggerevent(clicked!)		// 조회
//		
//		dw_2.SelectRow(1,  true)
//		if isnull(istr_where.str2[1]) or trim(istr_where.str2[1]) = '' then
//		else
//			ll_found = dw_3.Find("qa = '" + istr_where.str2[1] + "'", 1, dw_3.RowCount())
//			if ll_found > 0 then
//				dw_3.scrolltorow(ll_found)
//				dw_3.SelectRow(ll_found, true)
//			end if
//		end if
//	else
//		dw_2.setsort('item_name A')
//		dw_2.sort()
//		dw_2.SelectRow(1,  true)
//	end if
//else
//	dw_2.setsort('item_name A')
//	dw_2.sort()
//	dw_2.SelectRow(1,  true)
//end if
	
end event

event closequery;//dw2.setfilter("")
//dw2.Filter( )
//
end event

type cb_4 from commandbutton within w_itemstockdet_w
integer x = 2569
integer y = 52
integer width = 283
integer height = 80
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;string ls_filter, ls_name, ls_locno

dw_4.accepttext()

ls_name = trim(UPPER(dw_4.object.cust_no[1]))

if isnull(ls_name) OR ls_name = "" then 
	is_where = ""
else
	if rb_code.checked = true then
		ls_filter = ls_name + '%'
		is_where = "item_no like '" + ls_filter + "'"
	else
		ls_filter = '%' + ls_name + '%'
		is_where = "item_name like '" + ls_filter + "'"
	end if
end if

dw_3.SetFilter(is_where)
dw_3.Filter()
end event

type dw_4 from datawindow within w_itemstockdet_w
integer x = 1765
integer y = 48
integer width = 873
integer height = 88
integer taborder = 210
string title = "none"
string dataobject = "d_oecustomer_s"
boolean border = false
boolean livescroll = true
end type

event editchanged;long ll_found

dw_3.setredraw(false)

if rb_code.checked = true then
	if ii_sw = 0 then
		ii_sw = 1
		dw_3.SetSort("item_no A ")
		dw_3.Sort( )
	end if
	ll_found = dw_3.Find("item_no > '" + data + "'", 1, dw_3.RowCount())
else
	if ii_sw = 0 then
		ii_sw = 1
		dw_3.SetSort("item_name A ")
		dw_3.Sort( )
	end if
	ll_found = dw_3.Find("item_name > '" + data + "'", 1, dw_3.RowCount())
end if

dw_3.scrolltorow(ll_found)
dw_3.setredraw(true)

end event

event getfocus;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return
this.SelectText(ll_row, LenA(this.GetText()))
end event

type rb_code from radiobutton within w_itemstockdet_w
integer x = 1381
integer y = 64
integer width = 352
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "물품코드"
end type

event clicked;string ls_sort

dw_3.setredraw(false)
IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_no A"
else
	ii_sw = 0
	ls_sort = "item_no D"
end if
dw_3.SetSort(ls_sort)
dw_3.Sort( )
dw_3.scrolltorow(1)
dw_3.SelectRow(0,  false)
dw_3.SelectRow(1,  true)
dw_3.setredraw(true)

end event

type rb_name from radiobutton within w_itemstockdet_w
integer x = 1157
integer y = 64
integer width = 219
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "품명"
boolean checked = true
end type

event clicked;string ls_sort

dw_3.setredraw(false)
IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_name A "
else
	ii_sw = 0
	ls_sort = "item_name D "
end if
dw_3.SetSort(ls_sort)
dw_3.Sort( )
dw_3.scrolltorow(1)
dw_3.SelectRow(0,  false)
dw_3.SelectRow(1,  true)
dw_3.setredraw(true)

end event

type st_12 from statictext within w_itemstockdet_w
integer x = 974
integer y = 64
integer width = 178
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "정렬:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_itemstockdet_w
event mousemove pbm_dwnmousemove
integer x = 23
integer y = 168
integer width = 4713
integer height = 832
integer taborder = 200
string title = "none"
string dataobject = "d_icitemstock_list_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;if row < 1 then return
this.scrolltorow(row)
end event

event clicked;string ls_exist
long   ll_row, ll_dw1row, ll_dw1rowcount, ll_cnt

if row < 1 then return

this.SelectRow(0, false)
this.SelectRow(row,  NOT this.IsSelected(row))
this.scrolltorow(row)	

//cb_6.postevent(clicked!)

dw_1.accepttext()

i_row = row

ll_dw1rowcount = dw_1.rowcount()

if ll_dw1rowcount = 0 then
		ll_cnt = dw_1.insertrow(0)
		dw_1.object.seq[ll_cnt]   = dw_3.object.id[row]
		dw_1.object.qa[ll_cnt]            = dw_3.object.qa[row]	
		dw_1.object.item_name[ll_cnt] = dw_3.object.item_name[row]
		dw_1.object.stock_qty[ll_cnt]       	   = dw_3.object.qty[row]
		dw_1.object.qty[ll_cnt]       			   = dw_3.object.qty[row]		
		dw_1.object.sale_no[ll_cnt]      = dw_3.object.sale_no[row]
		dw_1.object.sale_seq[ll_cnt]    = dw_3.object.sale_seq[row]				
		dw_1.object.cust_name[ll_cnt]      = dw_3.object.cust_name[row]
		dw_1.object.scene_desc[ll_cnt]    = dw_3.object.scene_desc[row]		
		dw_1.object.do_sale_no[ll_cnt]     = istr_where.str3[1]
		dw_1.object.do_sale_seq[ll_cnt]   = istr_where.qty1[1]
		dw_1.object.do_no[ll_cnt]     =		 istr_where.str4[1]
		dw_1.object.oi_no[ll_cnt]      =		 istr_where.qty2[1]		
		dw_1.object.use_yn[ll_cnt]		   = 'N'		
else
	
     ls_exist  = 'N'
	  
	for ll_dw1row = 1 to ll_dw1rowcount
		if dw_3.object.id[row] = dw_1.object.seq[ll_dw1row] then
			ls_exist = 'Y'
		else		
		end if	
	next
	
	IF ls_exist = 'N' THEN
		ll_cnt = dw_1.insertrow(0)
		dw_1.object.seq[ll_cnt]   = dw_3.object.id[row]
		dw_1.object.qa[ll_cnt]            = dw_3.object.qa[row]	
		dw_1.object.item_name[ll_cnt] = dw_3.object.item_name[row]
		dw_1.object.stock_qty[ll_cnt]       	   = dw_3.object.qty[row]
		dw_1.object.sale_no[ll_cnt]      = dw_3.object.sale_no[row]
		dw_1.object.sale_seq[ll_cnt]    = dw_3.object.sale_seq[row]				
		dw_1.object.cust_name[ll_cnt]      = dw_3.object.cust_name[row]
		dw_1.object.scene_desc[ll_cnt]    = dw_3.object.scene_desc[row]
		dw_1.object.do_sale_no[ll_cnt]     = istr_where.str3[1]
		dw_1.object.do_sale_seq[ll_cnt]   = istr_where.qty1[1]	
		dw_1.object.do_no[ll_cnt]    		   = istr_where.str4[1]
		dw_1.object.oi_no[ll_cnt] 			   = istr_where.qty2[1]				
		dw_1.object.use_yn[ll_cnt]		   = 'N'
	END IF
			
end if	



end event

event doubleclicked;if row < 1 then return
this.scrolltorow(row)
if istr_where.chk = 'M' then
else
	cb_1.postevent(clicked!)
end if

end event

event rbuttondown;//int li_int
//string ls_item, ls_qa, ls_area
//date ld_date, ld_date_from
//
//if row < 1 then return
//this.scrolltorow(row)
////if dw_area.object.area[1] = 'H0001' then
////	ls_area = 'S0001'
////else
////	ls_area = dw_area.object.area[1]
////end if
//m_manager NewMenu
//
//NewMenu = CREATE m_manager
//gs_print_control = ""
//li_int = m_manager.m_itemret.PopMenu(w_whitemlocqohmulti_w.parentwindow().PointerX(),  w_whitemlocqohmulti_w.parentwindow().PointerY())
//
//ld_date = date(gdt_today) //date(em_1.text)
////w_frame.PointerX(), w_frame.PointerY())
//ld_date_from = RelativeDate(ld_date, -61)
////ld_date_from = date(ld_date_from)
//ls_item = trim(dw2.object.item_no[dw2.getrow()])
//ls_qa   = trim(this.object.qa[row])
////CHOOSE CASE gs_print_control
////	CASE 'sale'
////		open(w_whsale_w)
////		w_whsale_w.em_1.text = string(ld_date_from, 'yyyy/mm/dd')
////		w_whsale_w.em_2.text = em_1.text
////		w_whsale_w.st_item.text = ls_item
////		w_whsale_w.st_name.text = this.object.groupitem_item_name[row]
////		w_whsale_w.st_qa.text = ls_qa
////		w_whsale_w.is_loc = is_loc
////		w_whsale_w.is_area = ls_area
////		w_whsale_w.is_FLAG = 'SALE'
////		w_whsale_w.cb_1.postevent(clicked!)
////END CHOOSE
////
end event

type cb_9 from commandbutton within w_itemstockdet_w
integer x = 425
integer y = 1008
integer width = 379
integer height = 80
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "◀ CLEAR"
end type

event clicked;DW_1.RESET()
end event

type cb_8 from commandbutton within w_itemstockdet_w
integer x = 32
integer y = 1008
integer width = 379
integer height = 80
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲ 삭제"
end type

event clicked;dw_1.deleterow(0)
end event

type cb_6 from commandbutton within w_itemstockdet_w
boolean visible = false
integer x = 1605
integer y = 1008
integer width = 379
integer height = 80
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "▼ 추가"
end type

event clicked;string ls_exist
long   ll_row, ll_dw1row, ll_dw1rowcount, ll_cnt

dw_1.accepttext()

ll_dw1rowcount = dw_1.rowcount()

if ll_dw1rowcount = 0 then
		ll_cnt = dw_1.insertrow(0)
		dw_1.object.seq[ll_cnt]   = dw_3.object.id[i_row]
		dw_1.object.qa[ll_cnt]            = dw_3.object.qa[i_row]	
		dw_1.object.item_name[ll_cnt] = dw_3.object.item_name[i_row]
		dw_1.object.stock_qty[ll_cnt]       	   = dw_3.object.qty[i_row]
		dw_1.object.sale_no[ll_cnt]      = dw_3.object.sale_no[i_row]
		dw_1.object.sale_seq[ll_cnt]    = dw_3.object.sale_seq[i_row]				
		dw_1.object.cust_name[ll_cnt]      = dw_3.object.cust_name[i_row]
		dw_1.object.scene_desc[ll_cnt]    = dw_3.object.scene_desc[i_row]		
		dw_1.object.do_sale_no[ll_cnt]     = istr_where.str3[1]
		dw_1.object.do_sale_seq[ll_cnt]   = istr_where.qty1[1]
		dw_1.object.use_yn[ll_cnt]		   = 'N'		
else
	
     ls_exist  = 'N'
	  
	for ll_dw1row = 1 to ll_dw1rowcount
		if dw_3.object.id[i_row] = dw_1.object.seq[ll_dw1row] then
			ls_exist = 'Y'
		else		
		end if	
	next
	
	IF ls_exist = 'N' THEN
		ll_cnt = dw_1.insertrow(0)
		dw_1.object.seq[ll_cnt]   = dw_3.object.id[i_row]
		dw_1.object.qa[ll_cnt]            = dw_3.object.qa[i_row]	
		dw_1.object.item_name[ll_cnt] = dw_3.object.item_name[i_row]
		dw_1.object.stock_qty[ll_cnt]       	   = dw_3.object.qty[i_row]
		dw_1.object.sale_no[ll_cnt]      = dw_3.object.sale_no[i_row]
		dw_1.object.sale_seq[ll_cnt]    = dw_3.object.sale_seq[i_row]				
		dw_1.object.cust_name[ll_cnt]      = dw_3.object.cust_name[i_row]
		dw_1.object.scene_desc[ll_cnt]    = dw_3.object.scene_desc[i_row]
		dw_1.object.do_sale_no[ll_cnt]     = istr_where.str3[1]
		dw_1.object.do_sale_seq[ll_cnt]   = istr_where.qty1[1]		
		dw_1.object.use_yn[ll_cnt]		   = 'N'
	END IF
			
end if	

end event

type cb_2 from commandbutton within w_itemstockdet_w
integer x = 1211
integer y = 1008
integer width = 379
integer height = 80
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type cb_1 from commandbutton within w_itemstockdet_w
integer x = 818
integer y = 1008
integer width = 379
integer height = 80
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;long ll_row, ll_cnt
integer l_oi_no, l_seq
long     l_qty
string ls_do_no

// 2019-10-25 JOWONSUK 넘어온 데이터 형식
//lstr_where.str1[1]    = this.object.item_no[row]
//lstr_where.str2[1]    = this.object.qa[row]
//lstr_where.str3[1]    = this.object.order_no[row]		
//lstr_where.qty1[1]    = this.object.seq_no[row]
//lstr_where.str4[1]    = this.object.do_no[row]		
//lstr_where.qty2[1]    = this.object.oi_no[row]		
//lstr_where.chk	      = this.object.loc_no[row]

ll_cnt = 0

ls_do_no = istr_where.str4[1]
l_oi_no = istr_where.qty2[1]
/*기존값을 지운다. 수정할때*/
if isnull(istr_where.str4[1]) then
else
			
		UPDATE itemstockdet
		SET out_qty = isnull(out_qty,0) - isnull(B.qty,0),
				  qty  = in_qty + b.qty ,
				  close_yn = (case when  in_qty + b.qty = 0 then 'C' else 'O' end)	  
		FROM itemstockdet A inner JOIN (
														  select seq, qty
														  from itemstockout
														  where use_yn = 'Y'
															and do_no = :ls_do_no
															and oi_no = :l_oi_no
													 ) B ON A.id = B.seq;	
													 
													 
		delete itemstockout
		where do_no = :ls_do_no
		    and oi_no = :l_oi_no;													 
													 
		commit;
end if


if dw_1.update() = 1 then
	commit;
	
	dw_1.accepttext()
	
	for ll_row = 1 to dw_1.rowcount()
		ll_cnt = ll_cnt + 1
		istr_where.qty1[ll_cnt] = dw_1.object.id[ll_row]
		istr_where.qty2[ll_cnt] = dw_1.object.seq[ll_row]		
		istr_where.qty3[ll_cnt] = dw_1.object.qty[ll_row]
		
		l_seq = dw_1.object.seq[ll_row]
		l_qty  = dw_1.object.qty[ll_row]
		
//		UPDATE itemstockdet
//		SET out_qty = isnull(out_qty,0) + :l_qty,
//				     qty  = isnull(qty,0) - :l_qty
//		 WHERE  seq  = :l_seq;					
		
	next

	CloseWithReturn(parent, istr_where)	
		
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if


end event

type dw_1 from datawindow within w_itemstockdet_w
integer x = 23
integer y = 1096
integer width = 4704
integer height = 668
integer taborder = 20
string dataobject = "d_icitemstock_list_r3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return
//this.SelectRow(0,  false)
//this.SelectRow(row,  true)

end event

event doubleclicked;//dw_1.deleterow(row)
end event

event rowfocuschanged;long ll_row

ll_row = this.getrow()

if ll_row < 1 then return
//this.SelectRow(0,  false)
//this.SelectRow(ll_row,  true)

end event

type dw_loc from datawindow within w_itemstockdet_w
integer x = 64
integer y = 52
integer width = 846
integer height = 84
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//this.accepttext()
//tab_1.tabpage_2.cb_ret.postevent(clicked!)

end event

event losefocus;this.accepttext()

end event

type gb_2 from groupbox within w_itemstockdet_w
integer x = 37
integer y = 16
integer width = 3858
integer height = 136
integer taborder = 230
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

