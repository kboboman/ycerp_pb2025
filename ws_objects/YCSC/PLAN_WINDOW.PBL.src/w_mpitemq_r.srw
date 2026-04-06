$PBExportHeader$w_mpitemq_r.srw
$PBExportComments$제품별 생산계획조회(1998/05/04, 이인호)
forward
global type w_mpitemq_r from w_inheritance
end type
type tab_1 from tab within w_mpitemq_r
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tab_1 from tab within w_mpitemq_r
tabpage_1 tabpage_1
end type
type em_1 from editmask within w_mpitemq_r
end type
type em_2 from editmask within w_mpitemq_r
end type
type st_22 from statictext within w_mpitemq_r
end type
type dw_area from datawindow within w_mpitemq_r
end type
type gb_15 from groupbox within w_mpitemq_r
end type
end forward

global type w_mpitemq_r from w_inheritance
integer width = 3977
integer height = 2660
string title = "제품별 생산계획조회(w_mpitemq_r)"
long backcolor = 78160032
tab_1 tab_1
em_1 em_1
em_2 em_2
st_22 st_22
dw_area dw_area
gb_15 gb_15
end type
global w_mpitemq_r w_mpitemq_r

type variables
st_print i_print

end variables

on w_mpitemq_r.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.em_1=create em_1
this.em_2=create em_2
this.st_22=create st_22
this.dw_area=create dw_area
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_22
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.gb_15
end on

on w_mpitemq_r.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_22)
destroy(this.dw_area)
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)

// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천

end event

event resize;call super::resize;tab_1.width  = this.width  - 123
tab_1.height = this.height - 972

tab_1.tabpage_1.dw_3.width  = this.width  - 206
tab_1.tabpage_1.dw_3.height = this.height - 1140
end event

type pb_save from w_inheritance`pb_save within w_mpitemq_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpitemq_r
boolean visible = false
integer x = 2939
integer y = 56
integer width = 87
integer height = 92
string dataobject = "d_mpitemq_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_mpitemq_r
integer x = 37
integer y = 404
integer width = 3854
integer height = 380
integer taborder = 90
string dataobject = "d_mpitemq_t"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_mpitemq_r
integer x = 50
integer width = 1321
integer height = 120
string text = "제품별 생산계획조회"
end type

type st_tips from w_inheritance`st_tips within w_mpitemq_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpitemq_r
integer x = 1513
integer y = 272
integer width = 375
integer height = 88
integer taborder = 120
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품목검색"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;gs_where2 lstr_where
long ll_row, ll_cnt

openwithparm(w_whitemselectmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return
dw_2.SETREDRAW(false)
dw_2.reset()

for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_2.insertrow(0)
	dw_2.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_2.object.groupitem_uom[ll_cnt] = trim(lstr_where.str2[ll_row])
	dw_2.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_2.scrolltorow(1)
dw_2.setsort('item_no')
dw_2.sort()
dw_2.SETREDRAW(TRUE)



end event

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_mpitemq_r
boolean visible = false
integer x = 2501
integer y = 48
end type

type pb_close from w_inheritance`pb_close within w_mpitemq_r
integer x = 3675
integer y = 48
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpitemq_r
boolean visible = false
integer x = 2702
integer y = 48
integer taborder = 140
end type

event pb_print::clicked;w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF tab_1.tabpage_1.dw_3.getrow() <= 0 THEN
   RETURN
END IF
tab_1.tabpage_1.dw_3.RowsCopy(1,  tab_1.tabpage_1.dw_3.RowCount(), Primary!, dw_1, 1, Primary!)

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 제품별 생산계획내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=89'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpitemq_r
boolean visible = false
integer y = 48
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpitemq_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpitemq_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpitemq_r
integer x = 3479
integer y = 48
integer taborder = 170
end type

event pb_retrieve::clicked;if dw_2.rowcount() < 1 then
	messagebox("확인","품목을 검색하신후 작업하십시요")
	return
end if
tab_1.tabpage_1.dw_3.reset()

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_item[]
long ll_row
date ld_date1, ld_date2

ls_date = trim(em_1.text)
if isdate(ls_date) = false then
	beep(1)
	em_1.setfocus()
	return
end if
ld_date1 = date(ls_date)
ls_date = trim(em_2.text)
if isdate(ls_date) = false then
	beep(1)
	em_2.setfocus()
	return
end if
ld_date2 = date(ls_date)
for ll_row = 1 to dw_2.rowcount()						
	ls_item[ll_row] = dw_2.object.item_no[ll_row]
next
if tab_1.tabpage_1.dw_3.retrieve(ls_item, ld_date1, ld_date2, dw_area.object.area[1]) < 1 then
	messagebox("에러","조회한 자료가 없습니다",Exclamation!)
end if


end event

type gb_3 from w_inheritance`gb_3 within w_mpitemq_r
integer x = 622
integer y = 216
integer width = 1307
integer height = 168
integer taborder = 100
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_mpitemq_r
boolean visible = false
integer x = 1733
integer y = 8
integer width = 1307
integer height = 192
integer taborder = 110
integer textsize = -10
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpitemq_r
integer x = 3433
integer y = 8
integer width = 457
end type

type tab_1 from tab within w_mpitemq_r
integer x = 37
integer y = 824
integer width = 3854
integer height = 1688
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
alignment alignment = right!
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3817
integer height = 1560
long backcolor = 78160032
string text = "생산계획"
long tabtextcolor = 8388608
long tabbackcolor = 78160032
string picturename = "Custom087!"
long picturemaskcolor = 553648127
dw_3 dw_3
end type

on tabpage_1.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_1.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_1
integer x = 14
integer y = 24
integer width = 3771
integer height = 1520
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_mpitemq_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;//string ls_order,ls_plan,ls_temp
//long ll_rowcount, ll_row
//
//ll_rowcount = this.rowcount()
//if ll_rowcount < 1 then 
//	return
//end if
//pointer oldpointer // Declares a pointer variable
//
//oldpointer = SetPointer(HourGlass!)
//for ll_row = 1 to this.rowcount()
//	 ls_plan = trim(this.object.mpsdet_plan_no[ll_row])
//	 ls_order = trim(this.object.mpsdet_order_no[ll_row])
//	 if isnull(ls_plan) then
//		 continue
//  	 else
//		 select open_close into :ls_temp from mps where order_no = :ls_order;
//		 choose case trim(ls_temp)
//			 case 'P'
//				  this.object.type1[ll_row] = '1'
//			 case 'A'
//				  this.object.type1[ll_row] = 'A'
//		 end choose
//	 end if
//	 
//	 choose case mid(ls_plan,1,1)
//		 case 'O','M'
//			  select type into :ls_temp from sfcday where order_no = :ls_plan;
//			  choose case sqlca.sqlcode
//				 case 0
//					   if trim(ls_temp) = 'N' then
//					      this.object.type1[ll_row] = '9' // 9: 생산계획완료 후  취소
//						else
//							this.object.type1[ll_row] = '8' // 8: 생산계획완료
//						end if
//				 case else
//			  end  choose
//			  
//			  select sudo_type into :ls_temp from sudodet1 where order_no = :ls_plan;
//			  choose case sqlca.sqlcode
//				 case 0
//					   choose case trim(ls_temp)
//							case 'C'
//					         this.object.type1[ll_row] = '4' // 4: 외주구매입고완료
//							case 'B'
//								this.object.type1[ll_row] = '3' // 4: 외주구매입고발주중
//              			   select result_type into :ls_temp from purdet where product_no = :ls_plan;
//               		   choose case sqlca.sqlcode
//                				 case 0
//					                 choose case trim(ls_temp)
//							              case 'E','P'
//					                        this.object.type1[ll_row] = '4' // 4: 입고완료
//							              case 'C'
//								               this.object.type1[ll_row] = '9' // 4: 외주가공입고발주중
//						              end choose
//               				 case else
//
//			                end  choose								
//							case 'A'
//								this.object.type1[ll_row] = '2' // 4: 외주구매입고청구중
//						end choose
//				 case else
//			  end  choose
//			  
//			  select sudo_type into :ls_temp from sudodet where order_no = :ls_plan;
//			  choose case sqlca.sqlcode
//				 case 0
//					   choose case trim(ls_temp)
//							case 'C'
//					         this.object.type1[ll_row] = '7' // 4: 외주가공입고완료
//							case 'B'
//								this.object.type1[ll_row] = '6' // 4: 외주가공입고발주중
//              			   select result_type into :ls_temp from purdet where product_no = :ls_plan;
//               		   choose case sqlca.sqlcode
//                				 case 0
//					                 choose case trim(ls_temp)
//							              case 'E','P'
//					                        this.object.type1[ll_row] = '7' // 4: 입고완료
//							              case 'C'
//								               this.object.type1[ll_row] = '9' // 4: 외주가공입고발주중
//						              end choose
//               				 case else
//
//			                end  choose    								
//							case 'A'
//								this.object.type1[ll_row] = '5' // 4: 외주가공입고청구중
//						end choose
//				 case else
//
//			  end  choose
//		 case else
//			  select type into :ls_temp from sfcday where order_no = :ls_plan;
//			  choose case sqlca.sqlcode
//				 case 0
//					   if trim(ls_temp) = 'N' then
//					      this.object.type1[ll_row] = '9' // 9: 생산계획완료 후  취소
//						else
//							this.object.type1[ll_row] = '8' // 8: 생산계획완료
//						end if
//				 case else
//
//			  end  choose
//	 end choose
//next
//SetPointer(oldpointer)
//
end event

event rbuttondown;int li_int
string ls_sale

if row < 1 then return
this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(w_mpitemq_r.parentwindow().PointerX(),  w_mpitemq_r.parentwindow().PointerY())

ls_sale = trim(this.object.sale_no[row])
CHOOSE CASE gs_print_control
	CASE 'PROC'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
	CASE 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
END CHOOSE

end event

type em_1 from editmask within w_mpitemq_r
integer x = 667
integer y = 276
integer width = 366
integer height = 76
integer taborder = 70
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
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpitemq_r
integer x = 1115
integer y = 276
integer width = 366
integer height = 76
integer taborder = 80
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
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_22 from statictext within w_mpitemq_r
integer x = 1051
integer y = 288
integer width = 55
integer height = 64
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

type dw_area from datawindow within w_mpitemq_r
integer x = 78
integer y = 276
integer width = 503
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type gb_15 from groupbox within w_mpitemq_r
integer x = 41
integer y = 216
integer width = 567
integer height = 168
integer taborder = 31
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

