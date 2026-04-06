$PBExportHeader$w_ioreturn_m.srw
$PBExportComments$자재반품관리(2000/01/18, 이인호)
forward 
global type w_ioreturn_m from w_inheritance
end type
type gb_4 from groupbox within w_ioreturn_m
end type
type em_e from editmask within w_ioreturn_m
end type
type st_1 from statictext within w_ioreturn_m
end type
type em_s from editmask within w_ioreturn_m
end type
type dw_3 from datawindow within w_ioreturn_m
end type
type dw_6 from datawindow within w_ioreturn_m
end type
type st_2 from statictext within w_ioreturn_m
end type
type dw_area from datawindow within w_ioreturn_m
end type
type st_22 from statictext within w_ioreturn_m
end type
type gb_5 from groupbox within w_ioreturn_m
end type
end forward

global type w_ioreturn_m from w_inheritance
integer width = 4466
integer height = 2300
string title = "자재반품관리(w_ioreturn_m)"
gb_4 gb_4
em_e em_e
st_1 st_1
em_s em_s
dw_3 dw_3
dw_6 dw_6
st_2 st_2
dw_area dw_area
st_22 st_22
gb_5 gb_5
end type
global w_ioreturn_m w_ioreturn_m

type variables
datawindowchild idwc_item,idwc_qa,idwc_coil
string is_select,is_clause,is_where,is_select1
string is_select2,is_clause2,is_where2,is_type
string is_select3,is_clause3,is_where3
end variables

on w_ioreturn_m.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.em_e=create em_e
this.st_1=create st_1
this.em_s=create em_s
this.dw_3=create dw_3
this.dw_6=create dw_6
this.st_2=create st_2
this.dw_area=create dw_area
this.st_22=create st_22
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.em_e
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_s
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_6
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.dw_area
this.Control[iCurrent+9]=this.st_22
this.Control[iCurrent+10]=this.gb_5
end on

on w_ioreturn_m.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.em_e)
destroy(this.st_1)
destroy(this.em_s)
destroy(this.dw_3)
destroy(this.dw_6)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_22)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
if gs_userid = 'root' or gs_userid = '1999010s' then
	dw_2.object.insp_insp_case.visible = true
else
	dw_2.object.insp_insp_case.visible = false
end if

em_s.text = string(today(), "yyyy/mm/dd")
em_e.text = string(today(), "yyyy/mm/dd")
dw_3.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_6.insertrow(1)

end event

event resize;call super::resize;dw_3.width  = this.width  - 105
dw_3.height = this.height - 928

end event

type pb_save from w_inheritance`pb_save within w_ioreturn_m
integer x = 3991
integer y = 40
integer taborder = 40
boolean enabled = false
end type

event pb_save::clicked;long ll_dw3row,ll_cnt,ll_seq,ll_serial,ll_insprow, ll_row
dwItemStatus l_status
datetime ldt_date, ldt_duedate, ldt_today
dec  ld_insp_amount
real lr_rcptqty, lr_orderqty,lr_rlseqty
int li_seq, li_cnt, li_count
string ls_chk,ls_supp,ls_order,ls_subcon,ls_plan,ls_coil, ls_item, ls_qa
string ls_pur_flag, ls_area, ls_insp_date, ls_insp_no1, ls_insp_no, ls_seq, ls_supp_no

dw_3.accepttext()
dw_2.accepttext()
if dw_3.rowcount() < 1 then return

if isnull(dw_2.object.insp_flag[1]) then 
	messagebox("확인","입고유형을 확인하십시요!")
	return
end if
ll_dw3row = dw_3.rowcount()
for ll_cnt = 1 to ll_dw3row
	if dw_3.object.loc_no[ll_cnt] = "" or isnull(dw_3.object.loc_no[ll_cnt]) then
		messagebox('오류',string(ll_cnt) + ' 번째 저장소를 입력하십시요.',exclamation!)
		return
	end if
	if dw_3.object.comqty[ll_cnt] = 0 then
		messagebox("확인",string(ll_cnt) + " 번째 반품수량이 0 입니다!")
		return
	end if 
	ls_item = MidA(dw_3.object.item_no[ll_cnt],4,1)
	if (ls_item = '1' or ls_item = '2' ) then
		ls_coil = trim(dw_3.object.coil_no[ll_cnt])
		if ls_coil = "" or isnull(ls_coil) then
		  messagebox('오류lot','코일번호를 입력하십시요.',exclamation!)
		  return
		else
			if ls_item = '1' then // 1; coil , 2 : sheet
				select count(*) into :li_count from coilmst
				 where coil_no = :ls_coil;
			else
				select count(*) into :li_count from sheetmst
				 where sheet_no = :ls_coil;
			end if
			if li_count < 1 then
				messagebox('오류lot','lot번호가 자료에 없읍니다. 전산실로 문의 바랍니다.',exclamation!)
				return
			end if
				
		end if
	end if
next
if messagebox("저장","반품내역을 저장하시겠습니까?",question!,okcancel!,1) = 1 then
	setpointer(hourglass!)
	//입고 번호 부여
	ls_area = LeftA(dw_area.object.area[1], 1)
	dw_2.object.area_no[1] = dw_area.object.area[1]
  	ls_pur_flag = 'T' // T: 반품
	IF trim(dw_2.object.insp_no[1]) = '' OR isnull(dw_2.object.insp_no[1]) then
	   ls_insp_date = string(dw_2.object.insp_date[1], "yyyymmdd")
   	ls_insp_no1 = ls_area + ls_pur_flag + ls_insp_date + '-' + '%'			
	   SELECT MAX(insp_no) INTO :ls_insp_no FROM insp 
   	  WHERE insp_no LIKE :ls_insp_no1;		
	   if isnull(ls_insp_no) or ls_insp_no = '' then
		   ls_insp_no1 = ls_area + ls_pur_flag + ls_insp_date + '-' + '001'
   	else
	   	li_seq = integer(MidA(ls_insp_no, 12, 3))
		   li_seq = li_seq + 1
   		ls_seq = '00' + string(li_seq)
	   	ls_insp_no1 = LeftA(ls_insp_no1, 11) + RightA(ls_seq, 3)
   	end if
	else
		setnull(ls_insp_no)
      ls_insp_no1 = dw_2.object.insp_no[1]		
	   SELECT insp_no INTO :ls_insp_no  FROM insp 
   	  WHERE insp_no = :ls_insp_no1;		
   	IF trim(ls_insp_no) = '' OR isnull(ls_insp_no) then
      else
			messagebox("저장","거래명세서 번호가 이미 존재합니다.", exclamation!)
			return
		end if
	end if
	dw_2.object.insp_no[1] = ls_insp_no1
	dw_2.object.pur_flag[1] = ls_pur_flag
else
	return
end if

ll_insprow = 0
for ll_cnt = 1 to ll_dw3row
	ldt_date = dw_2.object.insp_date[1]
	ls_item = dw_3.object.item_no[ll_cnt]
	ls_qa = dw_3.object.qa[ll_cnt]
	ldt_duedate = dw_3.object.due_date[ll_cnt]
	lr_rcptqty = dw_3.object.rcpt_qty[ll_cnt]
	ll_seq   = dw_3.object.seq_no[ll_cnt]
//	ls_type  = dw_3.object.result_type[ll_cnt]
	ls_order = dw_3.object.order_no[ll_cnt]
	ls_subcon = trim(dw_3.object.pur_subcon[ll_cnt])
	ls_plan = trim(dw_3.object.product_no[ll_cnt])
	ls_order = trim(dw_3.object.order_no[ll_cnt])
	ls_coil = trim(dw_3.object.coil_no[ll_cnt])
	ll_serial   = dw_3.object.serial_no[ll_cnt]
		
		//입고상세저장
	dw_3.object.insp_no[ll_insprow] = ls_insp_no1
	dw_3.object.rate_cash[ll_insprow] = dw_3.object.rlse_rate[ll_insprow]
		
	update purdet set rlse_qty = rlse_qty + :lr_rcptqty,
							rlse_date = :ldt_date
	 where order_no = :ls_order 
		and seq_no = :ll_seq;
	if sqlca.sqlcode < 0 then
		 messagebox('오류','purdet update2 수행중 오류가 발생하였습니다.'&
					+ string(sqlca.sqlerrtext) + "~r~n" ,exclamation!)
		 rollback;
	end if
next
ld_insp_amount = dw_2.object.insp_total[1] 
ls_supp_no = dw_2.object.supp_no[1]

UPDATE supp SET balance_amt = balance_amt + :ld_insp_amount,
						  last_tran_date = :ldt_today
  WHERE supp_no = :ls_supp_no;

if sqlca.sqlcode <> 0 then
	rollback;
	messagebox("저장","supp 저장도중 오류가 발생하였습니다!",exclamation!)
end if		
//commit;
if wf_update2(dw_2,dw_3, "Y") = false then
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_ioreturn_m
integer x = 46
integer y = 232
integer width = 585
integer height = 532
integer taborder = 60
string dataobject = "d_apinspupdate_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemerror;call super::itemerror;string ls_data

setnull(ls_data)
this.object.inaudit_item[row] = ls_data

return 2
end event

event dw_1::itemchanged;string ls_item,ls_str,ls_qa,ls_uom,ls_itemname,ls_loc,ls_str1,ls_supp,ls_wc,ls_coiltype
int li_ret
real lr_cost,lr_modqty

this.accepttext()
dw_2.accepttext()
ls_loc = trim(dw_2.object.loc_no[1])
choose case dwo.name
	case 'inaudit_item'
		  ls_str = data
		  setnull(ls_item)
		  select item_no into :ls_item from groupitem where item_no = :ls_str;
		  if isnull(ls_item) then
			  MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			  this.object.inaudit_item[row] = ls_item
			  return 1
		  end if
		  is_clause = " where item_no = ~~'" + trim(data) + "~~'"
        is_where = "DataWindow.Table.Select='"  + is_select1 + is_clause + "'"
        idwc_qa.Modify(is_where)
		  idwc_qa.settransobject(sqlca)
		  if idwc_qa.retrieve() = 1 then
			  ls_str = trim(idwc_qa.getitemstring(1,'qa'))
			  this.object.qa[row] = ls_str
			  goto label_qa
	     else
			  setnull(ls_item)
			  this.object.qa[row] = ls_item
		  end if
	case 'qa'
		  ls_str = data
label_qa:		  
		  ls_str1 = trim(this.object.inaudit_item[row])
		  setnull(ls_item)
		  select item_no,item_name,qa,uom 
		     into :ls_item,:ls_itemname,:ls_qa,:ls_uom
		     from item
		  where item_no = :ls_str1 and qa = :ls_str;
		  if isnull(ls_item) then
			  MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			  this.object.item_no[row] = ls_item
			  return 1
		  end if
		  this.object.groupitem_item_name[row] = ls_itemname
		  this.object.groupitem_uom[row] = ls_uom
		  
		  is_clause3 = " where item_no = ~~'" + trim(ls_str1) + "~~'" &
		             + " and qa = ~~'" + trim(ls_str) + "~~'" &
						 + " and loc_no = ~~'" + trim(ls_loc) + "~~'"
        is_where3 = "DataWindow.Table.Select='"  + is_select3 + is_clause3 + "'"
        idwc_coil.Modify(is_where3)
		  idwc_coil.settransobject(sqlca)
		  idwc_coil.retrieve()
	case 'serial_id'
		  ls_str = trim(data)
		  this.object.issue_qty[row] = idwc_coil.getitemnumber(idwc_coil.getrow(),'unit_qty') &
		  				* idwc_coil.getitemnumber(idwc_coil.getrow(),'cnt')
		  this.object.unit_qty[row] = idwc_coil.getitemnumber(idwc_coil.getrow(),'unit_qty')
		  ls_coiltype = trim(idwc_coil.getitemstring(idwc_coil.getrow(),'coil_type'))
		  this.object.cnt[row] = idwc_coil.getitemnumber(idwc_coil.getrow(),'cnt')
end choose

end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;string ls_item
dwItemStatus l_status

this.accepttext()
ls_item = trim(this.object.inaudit_item[row])
choose case dwo.name
	case 'qa'
       if isnull(ls_item) or ls_item = "" then
			 this.Object.qa.Protect = 1 
		 else
          l_status = this.GetItemStatus(this.GetRow(), 0, Primary!)
			 if l_status = notmodified! or l_status = datamodified! then
				 this.Object.qa.Protect = 1 
			 end if			
		 end if
   case else
		 this.Object.qa.Protect = 0
end choose





end event

type st_title from w_inheritance`st_title within w_ioreturn_m
integer x = 41
integer y = 40
integer width = 1198
string text = "자재반품 관리"
end type

type st_tips from w_inheritance`st_tips within w_ioreturn_m
end type

type pb_compute from w_inheritance`pb_compute within w_ioreturn_m
integer x = 3630
integer y = 664
integer width = 165
integer height = 112
integer taborder = 150
string picturename = "c:\bmp\pencil.bmp"
end type

event pb_compute::mousemove;call super::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

event pb_compute::clicked;call super::clicked;//return
long ll_row, ll_cnt
gs_where2 lstr_where

dw_3.accepttext()
dw_2.accepttext()
lstr_where.chk = dw_6.object.supp_no[1]
lstr_where.str1[1] = em_s.text
lstr_where.str2[1] = em_e.text

openwithparm(w_whinspmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return
dw_3.SETREDRAW(false)
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_3.insertrow(0)
	if ll_cnt = 1 then 
		dw_3.object.oi_no[ll_cnt] = 1
	else
		dw_3.object.oi_no[ll_cnt] = dw_3.object.oi_no[ll_cnt - 1] + 1
	end if
	dw_3.object.pur_no[ll_cnt] = 	trim(lstr_where.str1[ll_row])
	dw_3.object.seq_no[ll_cnt] = 	lstr_where.seq1[ll_row]
	dw_3.object.item_no[ll_cnt] = 	trim(lstr_where.str2[ll_row])
	dw_3.object.qa[ll_cnt] = 			trim(lstr_where.str3[ll_row])
	dw_3.object.coil_no[ll_row] = 	trim(lstr_where.str4[ll_row])
	dw_3.object.uom[ll_row] = 			trim(lstr_where.str5[ll_row])
	dw_3.object.com_uom[ll_row] = 	trim(lstr_where.str6[ll_row])
	dw_3.object.loc_no[ll_row] = 		trim(lstr_where.str7[ll_row])
	dw_3.object.location_loc_name[ll_row] = 	trim(lstr_where.str8[ll_row])
	dw_3.object.item_name[ll_cnt] = 	trim(lstr_where.name[ll_row])
	dw_3.object.apoi_qty[ll_cnt] = 	0
	dw_3.object.rate_cash[ll_cnt] = 	0
	dw_3.object.rcpt_qty[ll_cnt] = 	lstr_where.qty1[ll_row]
	dw_3.object.price[ll_cnt] = 		lstr_where.qty2[ll_row]
	dw_3.object.comqty[ll_cnt] = 		lstr_where.qty3[ll_row]
	dw_3.object.unit_qty[ll_cnt] = 	lstr_where.qty4[ll_row]
	dw_3.object.rate_cash[ll_cnt] = 	lstr_where.qty5[ll_row]
	dw_3.object.cnt[ll_cnt] = 			lstr_where.seq2[ll_row]
	dw_3.object.rem[ll_cnt] = '반품입고'
next
dw_3.SETREDRAW(TRUE)
dw_3.scrolltorow(1)
dw_3.setcolumn('comqty')
dw_3.setfocus()


end event

type pb_print_part from w_inheritance`pb_print_part within w_ioreturn_m
boolean visible = false
integer taborder = 30
end type

type pb_close from w_inheritance`pb_close within w_ioreturn_m
integer x = 4183
integer y = 40
integer taborder = 160
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioreturn_m
boolean visible = false
integer taborder = 170
end type

type pb_cancel from w_inheritance`pb_cancel within w_ioreturn_m
integer x = 3415
integer y = 40
integer taborder = 180
boolean enabled = false
end type

event pb_cancel::clicked;call super::clicked;if messagebox("확인","작업내역을 취소하시겠습니까?",question!,okcancel!,1) = 1 then
	dw_2.reset()
	dw_3.reset()
end if

end event

type pb_delete from w_inheritance`pb_delete within w_ioreturn_m
integer x = 3799
integer y = 40
integer taborder = 190
boolean enabled = false
end type

event pb_delete::clicked;call super::clicked;//return
dw_2.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_ioreturn_m
integer x = 3607
integer y = 40
integer taborder = 210
boolean enabled = false
end type

event pb_insert::clicked;long ll_row, ll_cnt
gs_where2 lstr_where

dw_3.accepttext()
dw_2.accepttext()
lstr_where.chk = dw_6.object.supp_no[1]
lstr_where.str1[1] = em_s.text
lstr_where.str2[1] = em_e.text

dw_2.SETREDRAW(false)
dw_2.reset()
dw_2.insertrow(1)
dw_2.object.log_date[1] = datetime(string(today(), 'yyyy/mm/dd'))
dw_2.object.insp_date[1] = datetime(string(today(), 'yyyy/mm/dd'))
dw_3.SETREDRAW(false)
dw_3.reset()
dw_3.SETREDRAW(TRUE)
dw_2.SETREDRAW(TRUE)


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ioreturn_m
integer x = 3223
integer y = 40
integer taborder = 200
integer weight = 400
fontcharset fontcharset = ansi!
boolean enabled = false
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_supp
date ld_start, ld_end

dw_6.accepttext()
ls_supp = dw_6.object.supp_no[1]

ld_start = date(em_s.text)
ld_end   = date(em_e.text)
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

dw_1.setredraw(false)
dw_1.reset()
if dw_1.retrieve(ls_supp, ld_start, ld_end, LeftA(dw_area.object.area[1],1)) < 1 then
	dw_6.setcolumn('supp_no')
	dw_6.setfocus()
end if
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_ioreturn_m
boolean visible = false
integer x = 2286
integer y = 56
integer width = 105
integer height = 136
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_ioreturn_m
integer x = 27
integer y = 196
integer width = 622
integer height = 580
integer taborder = 140
integer textsize = -8
end type

type gb_1 from w_inheritance`gb_1 within w_ioreturn_m
integer x = 3195
integer y = 0
integer width = 1202
integer taborder = 50
end type

type dw_2 from w_inheritance`dw_2 within w_ioreturn_m
integer x = 704
integer y = 344
integer width = 2875
integer height = 420
integer taborder = 70
string dataobject = "d_ioreturn_m1"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::losefocus;call super::losefocus;this.accepttext()
end event

type gb_4 from groupbox within w_ioreturn_m
integer x = 663
integer y = 192
integer width = 2944
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type em_e from editmask within w_ioreturn_m
integer x = 2377
integer y = 228
integer width = 357
integer height = 76
integer taborder = 20
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
boolean autoskip = true
end type

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_ioreturn_m
integer x = 2281
integer y = 220
integer width = 73
integer height = 76
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_s from editmask within w_ioreturn_m
integer x = 1888
integer y = 228
integer width = 357
integer height = 76
integer taborder = 10
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
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_ioreturn_m
integer x = 32
integer y = 804
integer width = 4361
integer height = 1372
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_ioreturn_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long ll_row
string ls_loc, ls_null

this.accepttext()
setnull(ls_null)
ll_row = this.getrow()
choose case dwo.name
	case 'chk'
		if trim(data) = 'Y' then
			this.object.result_type[ll_row] = 'E'
			//체크중
//			dw_5.object.log_date[1] = this.object.due_date[ll_row]
//			dw_5.object.insp_date[1] = this.object.due_date[ll_row]
			//
//			ls_loc = trim(dw_4.object.loc_no[1])
//			if isnull(this.object.loc_no[ll_row]) then
//				this.object.loc_no[ll_row] = ls_loc
//			end if
			if isnull(this.object.com_uom[ll_row]) then
				CHOOSE CASE this.object.uom[ll_row]
					CASE 'M', 'M2'
						this.object.com_uom[ll_row] = 'EA'
					CASE 'SH'
						this.object.com_uom[ll_row] = 'KG'
					CASE ELSE
						this.object.com_uom[ll_row] = this.object.uom[ll_row]
				END CHOOSE
			end if
//			this.object.unit_qty[ll_row] = this.object.order_qty[ll_row]
			this.object.result_type[ll_row] = 'E'
//			wf_calc2(ll_row)
			// 코일 선택
			if MidA(this.object.item_no[ll_row], 4,1) = '1' &
				or MidA(this.object.item_no[ll_row], 4,1) = '2' then
//				this.object.coil_no[ll_row] = wf_coil(ll_row)
				this.object.loc_no[ll_row] = ls_loc
			end if
		else
			this.object.result_type[ll_row] = 'N'
			this.object.coil_no[ll_row] = ls_null
			this.object.loc_no[ll_row] = ls_null
			this.SetItemStatus(ll_row, 0, Primary!, NotModified!)
		end if
	case 'unit_qty', 'uom','com_uom', 'ea'
//			wf_cals(ll_row)
	case 'rcpt_qty'
		// 2/25일 추가 start
			if this.object.com_uom[ll_row] = 'SH' then
		 		this.object.cnt[ll_row] = this.object.rcpt_qty[ll_row]
			else
		 		this.object.unit_qty[ll_row] = this.object.rcpt_qty[ll_row]
			end if
		// 2/25일 추가 end
//			wf_cals1(ll_row)
	case 'cnt'
//			wf_cals(ll_row)
end choose
this.postevent('ue_calc')



end event

type dw_6 from datawindow within w_ioreturn_m
integer x = 951
integer y = 220
integer width = 882
integer height = 88
integer taborder = 230
boolean bringtotop = true
string dataobject = "d_apinspdsupp_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()

end event

type st_2 from statictext within w_ioreturn_m
integer x = 699
integer y = 232
integer width = 224
integer height = 68
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
string text = "거래처"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_ioreturn_m
integer x = 3081
integer y = 228
integer width = 503
integer height = 76
integer taborder = 260
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type st_22 from statictext within w_ioreturn_m
integer x = 2871
integer y = 228
integer width = 210
integer height = 76
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

type gb_5 from groupbox within w_ioreturn_m
integer x = 663
integer y = 312
integer width = 2944
integer height = 464
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

