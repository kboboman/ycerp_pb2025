$PBExportHeader$w_cdsupplier_m.srw
$PBExportComments$구매처별 단가관리(1998/02/09,곽용덕)
forward
global type w_cdsupplier_m from w_inheritance
end type
type tab_1 from tab within w_cdsupplier_m
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type dw_5 from datawindow within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type cb_5 from commandbutton within tabpage_2
end type
type cb_6 from commandbutton within tabpage_2
end type
type cb_7 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
dw_5 dw_5
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
end type
type tab_1 from tab within w_cdsupplier_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_cdsupplier_m from w_inheritance
integer x = 5
integer y = 136
integer width = 3630
integer height = 2032
string title = "구매처별 단가 관리(w_cdsupplier_m)"
tab_1 tab_1
end type
global w_cdsupplier_m w_cdsupplier_m

type variables
st_print i_print
datawindowchild idwc_item,idwc_qa, idwc_item2
string is_select,is_where,is_clause
datawindow dw3, dw4, dw5
end variables

on w_cdsupplier_m.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_cdsupplier_m.destroy
call super::destroy
destroy(this.tab_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.insertrow(0)
dw_2.visible = false

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
dw5 = tab_1.tabpage_2.dw_5

dw3.settransobject(sqlca)
dw4.settransobject(sqlca)
dw5.settransobject(sqlca)

dw3.getchild('item_no',idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw5.getchild('item_no',idwc_item2)
gs_ds_itemall.ShareData(idwc_item2)

dw3.getchild('qa',idwc_qa)
idwc_qa.insertrow(0)
idwc_qa.settransobject(sqlca)
//gs_ds_qaall.ShareData(idwc_qa)

is_select = idwc_qa.Describe("DataWindow.Table.Select")

end event

type pb_save from w_inheritance`pb_save within w_cdsupplier_m
integer x = 2985
integer y = 48
end type

event pb_save::clicked;//long ll_row,i,ll_cnt
//int li_ret
//string ls_item,ls_supp,ls_flag
//dwItemStatus l_status,l_status1
//datetime ldt_date
//string ls_qa,ls_money,ls_priority,ls_part,ls_rem,ls_temp
//real lr_leadtime,lr_amount, ld_m_kg
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw3.accepttext()
dw4.accepttext()
wf_update1( dw3, "Y")

// 지우지 말것 차후에 사용할 예정임  - 시작
//ll_row = dw3.rowcount()
//for i = 1 to ll_row
//    l_status = dw3.GetItemStatus(i, "amount", Primary!)
//	 if (l_status = datamodified!) or (l_status = newmodified!) then
//       dw3.object.sys_date[i] = wf_today()
//		 ldt_date = wf_today()
//		 ls_item  = trim(dw3.object.item_no[i])
//		 ls_qa    = trim(dw3.object.qa[i])
//		 ls_supp  = trim(dw3.object.supp_no[i])
//		 ls_money = trim(dw3.object.curr_code[i])
//		 lr_leadtime = dw3.object.leadtime[i]
//		 lr_amount = dw3.object.amount[i]
//		 ls_priority = trim(dw3.object.priority_flag[i])
//		 ls_part = trim(dw3.object.part_no[i])
//		 ls_rem = trim(dw3.object.rem[i])
//		 ld_m_kg = dw3.object.m_kg[i]
//		 select item_no into :ls_temp from supplierhis 
//		 where sys_date = :ldt_date and item_no = :ls_item and qa = :ls_qa;
//		 if sqlca.sqlcode = 100 then
//			insert into supplierhis
//			  (sys_date,supp_no,item_no,qa,curr_code,amount,leadtime,part_no,priority_flag,rem,m_kg)
//			values (:ldt_date,:ls_supp,:ls_item,:ls_qa,:ls_money,:lr_amount,:lr_leadtime,:ls_part,
//			        :ls_priority,:ls_rem, :ld_m_kg);
//		   if sqlca.sqlcode < 0 then
//				messagebox('오류','수행중 오류가 발생했습니다.',exclamation!)
//				rollback;
//				return
//			end if
//		 else
//		   if sqlca.sqlcode < 0 then
//				messagebox('오류','수행중 오류가 발생했습니다.',exclamation!)
//				rollback;
//				return
//			end if
//			update supplierhis set amount = :lr_amount
//			where sys_date = :ldt_date and item_no = :ls_item and qa = :ls_qa;
//		   if sqlca.sqlcode < 0 then
//				messagebox('오류','수행중 오류가 발생했습니다.',exclamation!)
//				rollback;
//				return
//			end if			
//		 end if
//	 end if
//next
//
//
//setnull(ls_supp)
//ll_row = dw3.deletedcount()
//for i = 1 to ll_row
//	 ls_item = dw3.GetItemString(i, "item_no", Delete!, TRUE)
//	 ls_qa = dw3.GetItemString(i, "qa", Delete!, TRUE)
//	 ls_flag = dw3.GetItemString(i, "priority_flag", Delete!, TRUE) 
//	 if ls_flag = 'Y' then
//		 update item set supplier = :ls_supp
//		 where item_no = :ls_item and qa = :ls_qa;
//		 if sqlca.sqlcode < 0 then
//			 messagebox('오류','수행중 오류가 발생했습니다.',exclamation!)
//			 rollback;
//			 return
//		 end if	    
//	 end if
//next
// 지우지 말것 차후에 사용할 예정임  - 끝
//wf_update1(dw3,"Y")


	
	



end event

type dw_1 from w_inheritance`dw_1 within w_cdsupplier_m
integer x = 41
integer y = 268
integer width = 3346
integer height = 260
string dataobject = "d_cdsupplier_t"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;string ls_suppno, ls_name, ls_fax, ls_addr, ls_tel, ls_fob, ls_reg, ls_cap

dw_1.accepttext()
ls_suppno = trim(dw_1.object.supp_no[1])
select supp_name, fax_no, addr, tel_no, fob, register_no, captain_name 
  into :ls_name, :ls_fax, :ls_addr, :ls_tel, :ls_fob, :ls_reg, :ls_cap from supp
 where supp_no = :ls_suppno;

this.object.supp_name[1] = ls_name
this.object.fax_no[1] = ls_fax
this.object.addr[1] = ls_addr
this.object.tel_no[1] = ls_tel
this.object.fob[1] = ls_fob
this.object.register_no[1] = ls_reg
this.object.captain_name[1] = ls_cap
dw3.reset()
dw4.reset()
dw5.reset()
//dw_1.retrieve(ls_suppno)

end event

type dw_2 from w_inheritance`dw_2 within w_cdsupplier_m
integer x = 1705
integer y = 48
integer width = 69
integer height = 60
string dataobject = "d_cdsupplier_r"
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_cdsupplier_m
integer x = 37
integer y = 32
integer width = 1545
string text = "구매처별 단가 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdsupplier_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdsupplier_m
boolean visible = false
integer x = 1659
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdsupplier_m
boolean visible = false
integer x = 2811
end type

type pb_close from w_inheritance`pb_close within w_cdsupplier_m
integer x = 3177
integer y = 48
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdsupplier_m
integer x = 2793
integer y = 48
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

gs_where lstr_name
lstr_name.str1 = dw_1.object.supp_no[1]
lstr_name.chk = 'N'
openwithparm(w_whsupp_w,lstr_name)
lstr_name = Message.PowerObjectParm	

if lstr_name.chk = 'Y' then
else
	return
end if

dw_2.retrieve(lstr_name.str1)
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 구매처별 단가를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdsupplier_m
boolean visible = false
integer x = 2427
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdsupplier_m
integer x = 2601
integer y = 48
integer taborder = 130
end type

event pb_delete::clicked;if dw3.rowcount() < 1 then return
dw3.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_cdsupplier_m
integer x = 2409
integer y = 48
integer taborder = 150
end type

event pb_insert::clicked;long ll_row
string ls_supp

if dw_1.rowcount() < 1 then return 

ls_supp = trim(dw_1.object.supp_no[1])
ll_row = dw3.insertrow(0)
dw3.scrolltorow(ll_row)
dw3.object.supp_no[ll_row] = ls_supp
dw3.object.sys_date[ll_row] = datetime(date(string(today(),'yyyy/mm/dd')))
dw3.setcolumn('supp_no')
dw3.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdsupplier_m
integer x = 2217
integer y = 48
integer taborder = 140
end type

event pb_retrieve::clicked;string ls_suppno
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
ls_suppno = trim(dw_1.object.supp_no[1])

dw3.retrieve(ls_suppno)
dw4.retrieve(ls_suppno)

end event

type gb_3 from w_inheritance`gb_3 within w_cdsupplier_m
boolean visible = false
integer x = 23
integer y = 556
integer width = 3557
integer height = 1356
integer textsize = -10
long textcolor = 16711680
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_cdsupplier_m
integer x = 23
integer y = 224
integer width = 3392
integer height = 324
integer textsize = -10
long textcolor = 16711680
string text = "구매거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_cdsupplier_m
integer x = 2176
integer y = 4
integer width = 1234
end type

type tab_1 from tab within w_cdsupplier_m
integer x = 9
integer y = 564
integer width = 3543
integer height = 1336
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean raggedright = true
alignment alignment = right!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3506
integer height = 1220
long backcolor = 79741120
string text = "구매처별 단가"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
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
integer y = 8
integer width = 3497
integer height = 1204
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_cdsupplier_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long ll_row, ll_row1, ll_found, ll_cnt
string ls_item, ls_qa, ls_data, ls_item_name, ls_uom, ls_where, ls_sql

this.accepttext()
ll_row = this.getrow()
ls_item = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

choose case dwo.name

	case 'item_no'

		this.object.qa[ll_row] = ''
		this.object.uom[ll_row] = ''
//		this.object.amount[ll_row] = 0 
		this.object.rem[ll_row] = ''
		this.object.qa.tabsequence = 0
//		this.object.qa.background.color = 78682240
		
		this.getchild("item_no", idwc_item)
		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		 select item_name, uom into :ls_item_name, :ls_uom from groupitem 
		  where item_no = :ls_data;
		 if sqlca.sqlcode = 100 then 
			 return 1
		 end if
		this.object.uom[ll_row] = ls_uom
		this.object.groupitem_item_name[this.getrow()] = ls_item_name
		
		if ls_item <> '' then
			this.getchild("qa", idwc_qa)
			ls_where = 'AND itemcost.item_no = ~~"' + ls_item + '~~"'
			ls_sql = "DataWindow.Table.Select = '" + is_select + ls_where + "'"
			
			dw_2.getchild("qa", idwc_qa)
			idwc_qa.settransobject(sqlca)
			idwc_qa.modify(ls_sql)
			idwc_qa.retrieve()
			
			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
				this.setcolumn("qa")
				this.setfocus()
			else
				this.object.qa.tabsequence = 0
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if
		
//	case 'qa'
//		ls_qa = data
//		select count(*) into :ll_cnt from item
//		 where item_no = :ls_item
//		   and qa = :ls_qa;
//		 if sqlca.sqlcode = 100 then 
//			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
//				+ "신규규격 " + ls_qa +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
//				gf_iteminsert(ls_item, ls_qa)
//			else
//				return 1
//			end if
//		 end if
////		this.getchild("qa", idwc_qa)
////		gs_ds_qaall.ShareData(idwc_qa)
//
//		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
//		this.object.uom[ll_row] = ls_uom

end choose

end event

event itemerror;string ls_data

setnull(ls_data)
CHOOSE CASE dwo.name
	case 'item_no'
        this.object.item_no[row] = ls_data
	case 'qa'
		  this.object.qa[row] = ls_data
end choose
return 2
end event

event rowfocuschanged;
if currentrow < 1 then return

string ls_item_no, ls_where, ls_sql

ls_item_no = this.object.item_no[currentrow]
if trim(ls_item_no) = '' or isnull(ls_item_no) then return

this.getchild("qa", idwc_qa)
ls_where = "AND itemcost.item_no = ~~'" + ls_item_no + "~~'"
ls_sql = "DataWindow.Table.Select = '" + is_select + ls_where + "'"
dw_2.getchild("qa", idwc_qa)
idwc_qa.settransobject(sqlca)
idwc_qa.modify(ls_sql)
idwc_qa.retrieve()

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3506
integer height = 1220
long backcolor = 79741120
string text = "구매처별 그룹별 단가"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_4 dw_4
dw_5 dw_5
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
end type

on tabpage_2.create
this.dw_4=create dw_4
this.dw_5=create dw_5
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.Control[]={this.dw_4,&
this.dw_5,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.cb_5,&
this.cb_6,&
this.cb_7}
end on

on tabpage_2.destroy
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
end on

type dw_4 from datawindow within tabpage_2
integer y = 128
integer width = 1266
integer height = 1088
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_ipsuppgroup_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_supp, ls_group

if row < 1 then return

ls_supp = dw_1.object.supp_no[1]

if isnull(ls_supp) or trim(ls_supp) = '' then 
	messagebox("확인", "구매처를 선택하십시요")
	return
end if

ls_group = dw4.object.group_no[row]
if isnull(ls_group) or trim(ls_group) = '' then 
	messagebox("확인", "구매처의 그룹을 선택하십시요")
	return
end if

dw5.retrieve(ls_supp, ls_group)

end event

type dw_5 from datawindow within tabpage_2
integer x = 1285
integer y = 128
integer width = 2194
integer height = 1088
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_ipsuppgroupdet_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row  < 1 then return

string ls_item, ls_itemname

ls_item = data
select item_name into :ls_itemname from groupitem where item_no = :ls_item;
this.object.item_name[row] = ls_itemname

end event

type cb_1 from commandbutton within tabpage_2
integer x = 393
integer y = 12
integer width = 247
integer height = 108
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;long ll_row
string ls_supp

 
dw4.accepttext()
dw_1.accepttext()
ls_supp = dw_1.object.supp_no[1]

if isnull(ls_supp) or trim(ls_supp) = '' then 
	messagebox("확인", "구매처를 선택하십시요")
	return
end if
ll_row = dw4.insertrow(0)
dw4.scrolltorow(ll_row)
dw4.object.supp_no[ll_row] = ls_supp
dw4.object.group_no[ll_row] = string(ll_row)

end event

type cb_2 from commandbutton within tabpage_2
integer x = 699
integer y = 12
integer width = 247
integer height = 108
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;
dw5.RowsMove(1, dw5.rowCount(), Primary!, dw5, 1, Delete!)
dw4.deleterow(0)
end event

type cb_3 from commandbutton within tabpage_2
integer x = 1006
integer y = 12
integer width = 247
integer height = 108
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw4.accepttext()
dw5.accepttext()
wf_update2(dw4, dw5, "Y")

end event

type cb_4 from commandbutton within tabpage_2
integer x = 2651
integer y = 12
integer width = 247
integer height = 108
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;long ll_row
string ls_supp, ls_group

 
dw_1.accepttext()
dw4.accepttext()
dw5.accepttext()
ls_supp = dw_1.object.supp_no[1]

if isnull(ls_supp) or trim(ls_supp) = '' then 
	messagebox("확인", "구매처를 선택하십시요")
	return
end if

ll_row = dw4.getrow()
if ll_row < 1 then
	messagebox("확인", "구매처의 그룹을 선택하십시요")
	return
end if
ls_group = dw4.object.group_no[ll_row]
if isnull(ls_group) or trim(ls_group) = '' then 
	messagebox("확인", "구매처의 그룹을 선택하십시요")
	return
end if

ll_row = dw5.insertrow(0)
dw5.scrolltorow(ll_row)
dw5.object.supp_no[ll_row] = ls_supp
dw5.object.group_no[ll_row] = ls_group

end event

type cb_5 from commandbutton within tabpage_2
integer x = 2935
integer y = 12
integer width = 247
integer height = 108
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;dw5.deleterow(0)
end event

type cb_6 from commandbutton within tabpage_2
integer x = 3227
integer y = 12
integer width = 247
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw4.accepttext()
dw5.accepttext()
wf_update2(dw4, dw5,"Y")
end event

type cb_7 from commandbutton within tabpage_2
integer x = 2117
integer y = 12
integer width = 448
integer height = 108
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품다중선택"
end type

event clicked;string ls_supp, ls_group
long ll_row, ll_cnt
 
dw_1.accepttext()
ls_supp = dw_1.object.supp_no[1]

if isnull(ls_supp) or trim(ls_supp) = '' then 
	messagebox("확인", "구매처를 선택하십시요")
	return
end if

ll_row = dw4.getrow()
if ll_row < 1 then
	messagebox("확인", "구매처의 그룹을 추가하십시요")
	return
end if

ls_group = dw4.object.group_no[ll_row]
if isnull(ls_group) or trim(ls_group) = '' then 
	messagebox("확인", "구매처의 그룹을 선택하십시요")
	return
end if

gs_where2 lstr_select

dw5.accepttext()
openwithparm(w_whitemselectmulti_w,lstr_select)
lstr_select = Message.PowerObjectParm
if lstr_select.chk = "Y" then
	dw5.SETREDRAW(FALSE)
	
	for ll_row = 1 to UpperBound(lstr_select.str1[])
		ll_cnt = dw5.insertrow(0)
		dw5.scrolltorow(ll_cnt)
		dw5.object.supp_no[ll_cnt] = ls_supp
		dw5.object.group_no[ll_cnt] = ls_group
		dw5.object.item_no[ll_cnt] = lstr_select.str1[ll_row]
//		dw5.object.uom[ll_cnt] = lstr_select.str2[ll_row]
		dw5.object.item_name[ll_cnt] = lstr_select.name[ll_row]
	next
	dw5.SETREDRAW(TRUE)
end if

end event

