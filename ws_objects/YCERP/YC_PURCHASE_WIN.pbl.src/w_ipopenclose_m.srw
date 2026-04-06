$PBExportHeader$w_ipopenclose_m.srw
$PBExportComments$발주마감(1998/02/11,곽용덕)
forward 
global type w_ipopenclose_m from w_inheritance
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
type dw_4 from datawindow within w_ipopenclose_m
end type
type em_s from editmask within w_ipopenclose_m
end type
type em_e from editmask within w_ipopenclose_m
end type
type dw_area from datawindow within w_ipopenclose_m
end type
type st_1 from statictext within w_ipopenclose_m
end type
type st_2 from statictext within w_ipopenclose_m
end type
type dw_11 from datawindow within w_ipopenclose_m
end type
type st_3 from statictext within w_ipopenclose_m
end type
type st_4 from statictext within w_ipopenclose_m
end type
type ddlb_fld from dropdownlistbox within w_ipopenclose_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ipopenclose_m
end type
type st_7 from statictext within w_ipopenclose_m
end type
type ddlb_op from dropdownlistbox within w_ipopenclose_m
end type
type sle_value from singlelineedit within w_ipopenclose_m
end type
type cb_19 from commandbutton within w_ipopenclose_m
end type
type cb_20 from commandbutton within w_ipopenclose_m
end type
type cb_21 from commandbutton within w_ipopenclose_m
end type
type cb_22 from commandbutton within w_ipopenclose_m
end type
type st_vertical from u_splitbar_vertical within w_ipopenclose_m
end type
type st_horizontal from u_splitbar_horizontal within w_ipopenclose_m
end type
end forward

global type w_ipopenclose_m from w_inheritance
integer width = 4389
integer height = 2244
string title = "발주마감 관리(w_ipopenclose_m)"
gb_5 gb_5
gb_4 gb_4
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_4 dw_4
em_s em_s
em_e em_e
dw_area dw_area
st_1 st_1
st_2 st_2
dw_11 dw_11
st_3 st_3
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
st_vertical st_vertical
st_horizontal st_horizontal
end type
global w_ipopenclose_m w_ipopenclose_m

type variables
string is_select,is_where,is_select1,is_where1

end variables

on w_ipopenclose_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.gb_4=create gb_4
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.em_s=create em_s
this.em_e=create em_e
this.dw_area=create dw_area
this.st_1=create st_1
this.st_2=create st_2
this.dw_11=create dw_11
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.em_s
this.Control[iCurrent+8]=this.em_e
this.Control[iCurrent+9]=this.dw_area
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.dw_11
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.ddlb_fld
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.st_7
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_19
this.Control[iCurrent+21]=this.cb_20
this.Control[iCurrent+22]=this.cb_21
this.Control[iCurrent+23]=this.cb_22
this.Control[iCurrent+24]=this.st_vertical
this.Control[iCurrent+25]=this.st_horizontal
end on

on w_ipopenclose_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.em_s)
destroy(this.em_e)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_11)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.st_vertical)
destroy(this.st_horizontal)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

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

event resize;call super::resize;//
gb_5.width  = newwidth  - (gb_5.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_5.x

st_horizontal.y      = dw_4.y + dw_4.height
st_horizontal.width  = newwidth  - (gb_5.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_5.x * 2)
dw_2.height = newheight - dw_2.y - gb_5.x

end event

type pb_save from w_inheritance`pb_save within w_ipopenclose_m
boolean visible = false
integer x = 3003
integer y = 56
end type

event pb_save::clicked;call super::clicked;wf_update2(dw_1,dw_2,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipopenclose_m
integer x = 2619
integer y = 456
integer width = 1705
integer height = 592
integer taborder = 110
string dataobject = "d_ippur1_m"
boolean hscrollbar = false
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ipopenclose_m
integer x = 32
integer y = 24
integer width = 910
integer height = 136
string text = "발주마감 관리"
end type

type st_tips from w_inheritance`st_tips within w_ipopenclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipopenclose_m
integer x = 3899
integer y = 64
integer taborder = 160
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"마감",parent, li_x, li_y)

end event

event pb_compute::clicked;//
string ls_order,ls_order1,ls_item,ls_item1,ls_qa,ls_subcon,ls_product,ls_purtype
long   ll_row,  i, ll_cnt, k, ll_rowcount, j
real   lr_diff, lr_qty

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_1.checked = true then
   ll_row = dw_2.rowcount()
   if ll_row < 1 then RETURN	
	
   dw_1.object.open_close[1] = "C"
	dw_1.object.close_type[1] = "M"
	dw_1.object.close_date[1] = WF_Today()

	ls_subcon = trim(dw_1.object.subcon[1])
	for i = 1 to dw_2.rowcount()
		 lr_diff    = dw_2.object.order_qty[i] - dw_2.object.rlse_qty[i]
		 ls_item    = trim(dw_2.object.item_no[i])
		 ls_qa      = trim(dw_2.object.qa[i])
		 ls_purtype = trim(dw_2.object.pur_type[i])
		 ls_product = trim(dw_2.object.product_no[i])
		 
		 if lr_diff > 0 then
          if ls_subcon = 'Y' then
				 choose case ls_purtype
					  case 'S'
						   UPDATE sudodet  SET sudo_type = 'C' WHERE order_no = :ls_product;
							if sqlca.sqlcode < 0 then
								ROLLBACK;
								MessageBox('오류','수행중 오류가 발생하였습니다.',exclamation!)
								RETURN
							end if
					  case 'D'
						   UPDATE sudodet1 SET sudo_type = 'C' WHERE order_no = :ls_product;
							if sqlca.sqlcode < 0 then
								ROLLBACK;
								MessageBox('오류','수행중 오류가 발생하였습니다.',exclamation!)
								RETURN
							end if						
				 end choose
	   	 end if			 
			 
			UPDATE item 
			   SET pur_reserved = pur_reserved - :lr_diff 
			 WHERE item_no = :ls_item and qa = :ls_qa; 
			if sqlca.sqlcode < 0 then
				ROLLBACK;
				MessageBox('오류','[pb_compute][item] update중 DB오류가 발생했습니다.',exclamation!)
				RETURN
			 end if	 
		 end if
	next
	WF_Update1( dw_1, "Y" )
	
else
   for i = 1 to dw_3.rowcount()
		ls_order = trim(dw_3.object.order_no[i])
		setnull(ls_order1)
		
		SELECT order_no INTO :ls_order1 
		  FROM purdet 
		 WHERE order_no = :ls_order AND order_qty > rlse_qty;
		 
		if isnull(ls_order1) = false then CONTINUE
		 
		 ls_subcon   = trim(dw_3.object.subcon[i])
		 ll_rowcount = dw_2.retrieve(ls_order)
		 
       if ls_subcon = 'Y' then
		    for j = 1 to ll_rowcount
			    ls_product = trim(dw_2.object.pur_subcon[j])
				 ls_purtype = trim(dw_2.object.pur_type[j])
				 
				 choose case ls_purtype
					  case 'S'
						   UPDATE sudodet  SET sudo_type = 'C' WHERE order_no = :ls_product;
							if sqlca.sqlcode < 0 then
								ROLLBACK;
								MessageBox('오류','수행중 오류가 발생하였습니다.',exclamation!)
								RETURN
							end if
					  case 'D'
						   UPDATE sudodet1 SET sudo_type = 'C' WHERE order_no = :ls_product;
							if sqlca.sqlcode < 0 then
								ROLLBACK;
								MessageBox('오류','수행중 오류가 발생하였습니다.',exclamation!)
								RETURN
							end if						
				 end choose
		    next
		 end if
		 
       dw_3.object.open_close[i] = "C"
       dw_3.object.close_type[i] = "A"
       dw_3.object.close_date[i] = WF_Today()
	next
	
	WF_Update1( dw_3, "Y" )
end if

end event

type pb_print_part from w_inheritance`pb_print_part within w_ipopenclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipopenclose_m
integer x = 4096
integer y = 64
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
integer x = 3703
integer y = 64
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
integer x = 983
integer y = 16
integer width = 1403
integer height = 216
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_ipopenclose_m
integer x = 2409
integer y = 16
integer width = 800
integer height = 216
integer taborder = 140
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ipopenclose_m
integer x = 3227
integer y = 16
integer width = 430
integer height = 216
integer taborder = 90
end type

type dw_2 from w_inheritance`dw_2 within w_ipopenclose_m
integer x = 32
integer y = 1100
integer width = 4293
integer height = 1016
integer taborder = 120
string dataobject = "d_ippurdet_t"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_5 from groupbox within w_ipopenclose_m
integer x = 32
integer y = 256
integer width = 4293
integer height = 184
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_4 from groupbox within w_ipopenclose_m
integer x = 3671
integer y = 16
integer width = 649
integer height = 216
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type rb_1 from radiobutton within w_ipopenclose_m
integer x = 3259
integer y = 68
integer width = 384
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
integer x = 3259
integer y = 136
integer width = 384
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

type dw_4 from datawindow within w_ipopenclose_m
integer x = 32
integer y = 456
integer width = 2519
integer height = 592
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

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_s from editmask within w_ipopenclose_m
integer x = 2441
integer y = 140
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_s.text
lstr_calendar.edate = em_e.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_s.text = lstr_calendar.sdate
	em_e.text = lstr_calendar.edate
end if

end event

type em_e from editmask within w_ipopenclose_m
integer x = 2811
integer y = 140
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_s.text
lstr_calendar.edate = em_e.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_s.text = lstr_calendar.sdate
	em_e.text = lstr_calendar.edate
end if

end event

type dw_area from datawindow within w_ipopenclose_m
integer x = 1344
integer y = 52
integer width = 526
integer height = 84
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_1 from statictext within w_ipopenclose_m
integer x = 1010
integer y = 56
integer width = 329
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ipopenclose_m
integer x = 1010
integer y = 140
integer width = 329
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_11 from datawindow within w_ipopenclose_m
integer x = 1344
integer y = 136
integer width = 1029
integer height = 80
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_whsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_4.reset()
end event

type st_3 from statictext within w_ipopenclose_m
integer x = 2441
integer y = 56
integer width = 736
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "발주일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ipopenclose_m
integer x = 82
integer y = 340
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

type ddlb_fld from dropdownlistbox within w_ipopenclose_m
integer x = 261
integer y = 320
integer width = 393
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_ipopenclose_m
integer x = 283
integer y = 328
integer width = 270
integer height = 88
integer taborder = 110
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
end type

type st_7 from statictext within w_ipopenclose_m
integer x = 677
integer y = 340
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

type ddlb_op from dropdownlistbox within w_ipopenclose_m
integer x = 859
integer y = 320
integer width = 293
integer height = 512
integer taborder = 110
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

type sle_value from singlelineedit within w_ipopenclose_m
integer x = 1161
integer y = 324
integer width = 475
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
end type

type cb_19 from commandbutton within w_ipopenclose_m
integer x = 1646
integer y = 324
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_20 from commandbutton within w_ipopenclose_m
integer x = 1810
integer y = 324
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_21 from commandbutton within w_ipopenclose_m
integer x = 1975
integer y = 324
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_22 from commandbutton within w_ipopenclose_m
integer x = 2139
integer y = 324
integer width = 160
integer height = 76
integer taborder = 120
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
DataWindow arg_dw

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_ipopenclose_m
integer x = 2574
integer y = 456
integer height = 592
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_ipopenclose_m
integer x = 32
integer y = 1064
integer width = 4293
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

