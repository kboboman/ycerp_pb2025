$PBExportHeader$w_ipopenclose_m.srw
$PBExportComments$발주마감(1998/02/11,곽용덕)
forward
global type w_ipopenclose_m from w_inheritance
end type
type gb_15 from groupbox within w_ipopenclose_m
end type
type gb_5 from groupbox within w_ipopenclose_m
end type
type gb_4 from groupbox within w_ipopenclose_m
end type
type rb_1 from radiobutton within w_ipopenclose_m
end type
type rb_2 from radiobutton within w_ipopenclose_m
end type
type dw_3 from datawindow within w_ipopenclose_m
end type
type dw_11 from datawindow within w_ipopenclose_m
end type
type dw_4 from datawindow within w_ipopenclose_m
end type
type em_s from editmask within w_ipopenclose_m
end type
type em_e from editmask within w_ipopenclose_m
end type
type dw_area from datawindow within w_ipopenclose_m
end type
end forward

global type w_ipopenclose_m from w_inheritance
integer width = 4009
integer height = 2192
string title = "발주마감 관리(w_ipopenclose_m)"
gb_15 gb_15
gb_5 gb_5
gb_4 gb_4
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_11 dw_11
dw_4 dw_4
em_s em_s
em_e em_e
dw_area dw_area
end type
global w_ipopenclose_m w_ipopenclose_m

type variables
string is_select,is_where,is_select1,is_where1

end variables

on w_ipopenclose_m.create
int iCurrent
call super::create
this.gb_15=create gb_15
this.gb_5=create gb_5
this.gb_4=create gb_4
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_11=create dw_11
this.dw_4=create dw_4
this.em_s=create em_s
this.em_e=create em_e
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_15
this.Control[iCurrent+2]=this.gb_5
this.Control[iCurrent+3]=this.gb_4
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.dw_11
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.em_s
this.Control[iCurrent+10]=this.em_e
this.Control[iCurrent+11]=this.dw_area
end on

on w_ipopenclose_m.destroy
call super::destroy
destroy(this.gb_15)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_11)
destroy(this.dw_4)
destroy(this.em_s)
destroy(this.em_e)
destroy(this.dw_area)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)

is_select1 = dw_3.Describe("DataWindow.Table.Select")

dw_11.settransobject(sqlca)
dw_11.insertrow(0)

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

em_s.text = string(today(), "yyyy/mm/dd")
em_e.text = string(today(), "yyyy/mm/dd")

// left(dw_area.object.area[1],1)
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
if gs_userid = 'root' or gs_userid = '1999010s' then
else
	dw_area.enabled = false
end if

end event

event resize;call super::resize;gb_3.width  = this.width  - 114
gb_3.height = this.height - 1012

dw_2.width  = this.width  - 196
dw_2.height = this.height - 1112

end event

type pb_save from w_inheritance`pb_save within w_ipopenclose_m
boolean visible = false
integer x = 3003
integer y = 56
end type

event pb_save::clicked;call super::clicked;wf_update2(dw_1,dw_2,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipopenclose_m
integer x = 1838
integer y = 332
integer width = 2075
integer height = 488
integer taborder = 110
string dataobject = "d_ippur1_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_ipopenclose_m
integer x = 69
integer y = 924
integer width = 3813
integer height = 1080
integer taborder = 120
string dataobject = "d_ippurdet_t"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ipopenclose_m
integer x = 41
integer width = 1056
string text = "발주마감 관리"
end type

type st_tips from w_inheritance`st_tips within w_ipopenclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipopenclose_m
integer x = 3493
integer y = 56
integer taborder = 160
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"마감",parent, li_x, li_y)

end event

event pb_compute::clicked;long ll_row,i,ll_cnt,k,ll_rowcount,j
string ls_order,ls_order1,ls_item,ls_item1,ls_qa,ls_subcon,ls_product,ls_purtype
real lr_diff,lr_qty

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_1.checked = true then
   ll_row = dw_2.rowcount()
   if ll_row < 1 then return	
   dw_1.object.open_close[1] = 'C'
	dw_1.object.close_date[1] = wf_today()
	dw_1.object.close_type[1] = 'M'
	ls_subcon = trim(dw_1.object.subcon[1])
	for i = 1 to ll_row
		 lr_diff = dw_2.object.order_qty[i] - dw_2.object.rlse_qty[i]
		 ls_item = trim(dw_2.object.item_no[i])
		 ls_qa = trim(dw_2.object.qa[i])
		 ls_purtype = trim(dw_2.object.pur_type[i])
		 ls_product = trim(dw_2.object.product_no[i])
		 if lr_diff > 0 then
          if ls_subcon = 'Y' then
				 choose case ls_purtype
					  case 'S'
						   update sudodet set sudo_type = 'C' where order_no = :ls_product;
							if sqlca.sqlcode < 0 then
								messagebox('오류','수행중 오류가 발생하였습니다.',exclamation!)
								rollback;
								return
							end if
					  case 'D'
						   update sudodet1 set sudo_type = 'C' where order_no = :ls_product;
							if sqlca.sqlcode < 0 then
								messagebox('오류','수행중 오류가 발생하였습니다.',exclamation!)
								rollback;
								return
							end if						
				 end choose
	   	 end if			 
          update item set pur_reserved = pur_reserved - :lr_diff 
			 where item_no = :ls_item and qa = :ls_qa; 
          if sqlca.sqlcode < 0 then
    			 messagebox('오류','[pb_compute][item] update중 DB오류가 발생했습니다.',exclamation!)
				 rollback; 
				 return
			 end if	 
		 end if
	next
	wf_update1(dw_1,"Y")
else
	ll_row = dw_3.rowcount()
   for i = 1 to ll_row
		 ls_order = trim(dw_3.object.order_no[i])
		 setnull(ls_order1)
		 select order_no into :ls_order1 from purdet 
		    where order_no = :ls_order and order_qty > rlse_qty;
		 if isnull(ls_order1) = false then
			 continue
		 end if
		 
		 ls_subcon   = trim(dw_3.object.subcon[i])
		 ll_rowcount = dw_2.retrieve(ls_order)
       if ls_subcon = 'Y' then
		    for j = 1 to ll_rowcount
			    ls_product = trim(dw_2.object.pur_subcon[j])
				 ls_purtype = trim(dw_2.object.pur_type[j])
				 choose case ls_purtype
					  case 'S'
						   update sudodet set sudo_type = 'C' where order_no = :ls_product;
							if sqlca.sqlcode < 0 then
								messagebox('오류','수행중 오류가 발생하였습니다.',exclamation!)
								rollback;
								return
							end if
					  case 'D'
						   update sudodet1 set sudo_type = 'C' where order_no = :ls_product;
							if sqlca.sqlcode < 0 then
								messagebox('오류','수행중 오류가 발생하였습니다.',exclamation!)
								rollback;
								return
							end if						
				 end choose
		    next
		 end if
       dw_3.object.open_close[i] = 'C'
       dw_3.object.close_date[i] = wf_today()
       dw_3.object.close_type[i] = 'A'
	next
	wf_update1(dw_3,"Y")
end if


end event

type pb_print_part from w_inheritance`pb_print_part within w_ipopenclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipopenclose_m
integer x = 3689
integer y = 56
integer taborder = 170
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipopenclose_m
boolean visible = false
integer taborder = 180
end type

type pb_cancel from w_inheritance`pb_cancel within w_ipopenclose_m
boolean visible = false
integer taborder = 190
end type

type pb_delete from w_inheritance`pb_delete within w_ipopenclose_m
boolean visible = false
integer x = 2811
integer y = 56
integer taborder = 200
end type

event pb_delete::clicked;call super::clicked;if dw_1.rowcount() < 1 then return
dw_1.RowsMove(1, dw_1.rowcount(), Primary!,  dw_1, 1, Delete!)

if dw_2.rowcount() < 1 then return
dw_2.RowsMove(1, dw_2.rowcount(), Primary!,  dw_2, 1, Delete!)
end event

type pb_insert from w_inheritance`pb_insert within w_ipopenclose_m
boolean visible = false
integer x = 2619
integer y = 56
integer taborder = 220
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipopenclose_m
integer x = 3296
integer y = 56
integer taborder = 210
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_where
date  ld_start_date, ld_end_date

ld_start_date = date(em_s.text)
ld_end_date   = date(em_e.text)
if not isdate(em_s.text) then
	beep(1)
	em_s.setfocus()
	return
end if
if not isdate(em_e.text) then
	beep(1)
	em_e.setfocus()
	return
end if

if rb_1.checked = true then

	string ls_supp
	
	ls_supp = trim(dw_11.object.supp_no[dw_11.getrow()])
	if ls_supp = '' or isnull(ls_supp) then
		ls_supp = "%"
	end if 
	if dw_4.retrieve(ls_supp, '%', '%', ld_start_date, ld_end_date, LeftA(dw_area.object.area[1],1)) < 1 then
		dw_1.reset()
		dw_2.reset()
		dw_3.reset()
	end if

else
	gb_5.text = "발주기간 : " + em_s.text + " 에서 " + em_e.text
	is_where1 = " and order_date between ~~'" + em_s.text + "~~' and ~~'" + em_e.text + "~~'" &
				 + " and pur.po_print = ~~'Y~~'" &
				 + " and pur.open_close = ~~'O~~'" &
				 + " AND ( ( pur.order_no like ~~'" + LeftA(dw_area.object.area[1],1) + "%~~' ) or "  &
			    + " ( ~~'" + LeftA(dw_area.object.area[1],1) + "~~' = " + "~~'S~~'" &
				 + " and pur.order_no like ~~'PUR%~~')) "

	ls_where = "DataWindow.Table.Select='" + is_select1 + is_where1 + "'"
	wf_retrieve(dw_3,ls_where)
end if


end event

type gb_3 from w_inheritance`gb_3 within w_ipopenclose_m
integer x = 32
integer y = 860
integer width = 3895
integer height = 1180
integer taborder = 130
integer textsize = -10
long textcolor = 16711680
string text = "발주내역"
end type

type gb_2 from w_inheritance`gb_2 within w_ipopenclose_m
integer x = 1824
integer y = 288
integer width = 2103
integer height = 552
integer taborder = 140
integer textsize = -10
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ipopenclose_m
integer x = 2729
integer y = 16
integer width = 494
integer taborder = 90
end type

type gb_15 from groupbox within w_ipopenclose_m
integer x = 1225
integer y = 24
integer width = 590
integer height = 176
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type gb_5 from groupbox within w_ipopenclose_m
boolean visible = false
integer x = 37
integer y = 276
integer width = 3337
integer height = 1768
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type gb_4 from groupbox within w_ipopenclose_m
integer x = 3255
integer y = 16
integer width = 667
integer height = 204
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type rb_1 from radiobutton within w_ipopenclose_m
integer x = 2784
integer y = 68
integer width = 402
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "수동마감"
boolean checked = true
end type

event clicked;if rb_1.checked = true then
	gb_2.visible = true
	gb_3.visible = true
	dw_1.visible = true
	dw_2.visible = true	
	dw_4.visible = true	
	dw_11.visible = true	
	gb_5.visible = false
	dw_3.visible = false
end if
end event

type rb_2 from radiobutton within w_ipopenclose_m
integer x = 2784
integer y = 136
integer width = 402
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "자동마감"
end type

event clicked;if rb_2.checked = true then
	gb_5.visible = true
	dw_3.visible = true
	gb_2.visible = false
	gb_3.visible = false
	dw_1.visible = false
	dw_2.visible = false
	dw_4.visible = false	
	dw_11.visible = false	
end if
end event

type dw_3 from datawindow within w_ipopenclose_m
boolean visible = false
integer x = 59
integer y = 336
integer width = 3291
integer height = 1676
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_ipopenclose_m"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type dw_11 from datawindow within w_ipopenclose_m
integer x = 41
integer y = 224
integer width = 1029
integer height = 76
integer taborder = 30
string dataobject = "d_whsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_4.reset()
end event

type dw_4 from datawindow within w_ipopenclose_m
integer x = 41
integer y = 312
integer width = 1769
integer height = 528
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_whpur_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() < 1 then return

string ls_order

ls_order = trim(this.object.order_no[this.getrow()])

dw_1.retrieve(ls_order)
dw_2.retrieve(ls_order)

end event

type em_s from editmask within w_ipopenclose_m
integer x = 1074
integer y = 224
integer width = 366
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_e from editmask within w_ipopenclose_m
integer x = 1445
integer y = 224
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
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_area from datawindow within w_ipopenclose_m
integer x = 1257
integer y = 84
integer width = 526
integer height = 92
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

