$PBExportHeader$w_mpouter_m.srw
$PBExportComments$외주청구관리(198/06/24,곽용덕)
forward 
global type w_mpouter_m from w_inheritance
end type
type tab_1 from tab within w_mpouter_m
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
cb_3 cb_3
st_1 st_1
cb_1 cb_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type cb_5 from commandbutton within tabpage_2
end type
type cb_6 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
st_2 st_2
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
end type
type tabpage_3 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type cb_7 from commandbutton within tabpage_3
end type
type cb_8 from commandbutton within tabpage_3
end type
type cb_9 from commandbutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_5 dw_5
st_3 st_3
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
end type
type tab_1 from tab within w_mpouter_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type st_4 from statictext within w_mpouter_m
end type
type sle_1 from singlelineedit within w_mpouter_m
end type
type st_44 from statictext within w_mpouter_m
end type
type dw_area from datawindow within w_mpouter_m
end type
end forward

global type w_mpouter_m from w_inheritance
integer x = 5
integer y = 160
integer width = 4667
integer height = 2616
string title = "외주청구 등록및취소(w_mpouter_m)"
tab_1 tab_1
st_4 st_4
sle_1 sle_1
st_44 st_44
dw_area dw_area
end type
global w_mpouter_m w_mpouter_m

type variables
datawindowchild idwc_item, idwc_qa, idwc_item1, idwc_qa1
datawindow dw3,dw4,dw5
st_print i_print
int ii_sort = 0
end variables

on w_mpouter_m.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.st_4=create st_4
this.sle_1=create sle_1
this.st_44=create st_44
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.st_44
this.Control[iCurrent+5]=this.dw_area
end on

on w_mpouter_m.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.st_4)
destroy(this.sle_1)
destroy(this.st_44)
destroy(this.dw_area)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
dw5 = tab_1.tabpage_3.dw_5
dw3.settransobject(sqlca)
dw4.settransobject(sqlca)
dw5.settransobject(sqlca)

dw3.getchild('assy_item',idwc_item)
gs_ds_itemall.sharedata(idwc_item)

dw3.getchild('assy_qa',idwc_qa)
gs_ds_qaall.sharedata(idwc_qa)

dw4.getchild('component',idwc_item1)
gs_ds_itemall.sharedata(idwc_item1)

dw4.getchild('component_qa',idwc_qa1)
gs_ds_qaall.sharedata(idwc_qa1)
sle_1.text = 'HD'+ string(today(),'yyyy')
// area 추가 2003/02/26
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26

dw3.retrieve(dw_area.object.area[1])


end event

event resize;call super::resize;//
tab_1.width  = newwidth  - 60
tab_1.height = newheight - 276

tab_1.tabpage_1.dw_3.width  = newwidth  - 124
tab_1.tabpage_1.dw_3.height = newheight - 556

tab_1.tabpage_2.dw_4.width  = newwidth  - 124
tab_1.tabpage_2.dw_4.height = newheight - 556

tab_1.tabpage_3.dw_5.width  = newwidth  - 124
tab_1.tabpage_3.dw_5.height = newheight - 556

end event

type pb_save from w_inheritance`pb_save within w_mpouter_m
integer x = 4183
integer y = 56
end type

event pb_save::clicked;//
long   ll_rowcount, i
string ls_plan, ls_assy, ls_assyqa
dwItemStatus l_status

ll_rowcount = dw4.deletedcount()
for i = 1 to ll_rowcount
   ls_plan   = trim(dw4.getitemstring(i,"order_no",delete!,true))
   ls_assy   = trim(dw4.getitemstring(i,"item_no",delete!,true))
   ls_assyqa = trim(dw4.getitemstring(i,"qa",delete!,true))
	
   update mpsdet 
	   set rcpt_type = 'N'
   where plan_no = :ls_plan and item_no = :ls_assy and qa = :ls_assyqa;
   if sqlca.sqlcode < 0 then
   	messagebox('오류',sqlca.sqlerrtext,exclamation!)
   	rollback;
   	return
   end if
next

ll_rowcount = dw4.rowcount()
for i = 1 to ll_rowcount
   l_status = dw4.GetItemStatus(i, 0, Primary!)
	if l_status = newmodified! then
	   ls_plan = trim(dw4.object.order_no[i])
	   ls_assy = trim(dw4.object.item_no[i])
	   ls_assyqa = trim(dw4.object.qa[i])
	   update mpsdet 
		   set rcpt_type = 'A'
	    where plan_no = :ls_plan and item_no = :ls_assy and qa = :ls_assyqa;
	   if sqlca.sqlcode < 0 then
	   	messagebox('오류',sqlca.sqlerrtext,exclamation!)
	   	rollback;
	   	return
	   end if
	end if
next

ll_rowcount = dw5.deletedcount()
for i = 1 to ll_rowcount
   ls_plan = trim(dw5.getitemstring(i,"order_no",delete!,true))
   ls_assy = trim(dw5.getitemstring(i,"item_no",delete!,true))
   ls_assyqa = trim(dw5.getitemstring(i,"qa",delete!,true))
   update mpsdet 
	   set rcpt_type = 'N'
    where plan_no = :ls_plan and item_no = :ls_assy and qa = :ls_assyqa;
   if sqlca.sqlcode < 0 then
   	messagebox('오류',sqlca.sqlerrtext,exclamation!)
   	rollback;
   	return
   end if
next

ll_rowcount = dw5.rowcount()
for i = 1 to ll_rowcount
   l_status = dw5.GetItemStatus(i, 0, Primary!)
	if l_status = newmodified! then
		ls_plan = trim(dw5.object.order_no[i])
		ls_assy = trim(dw5.object.item_no[i])
		ls_assyqa = trim(dw5.object.qa[i])
		update mpsdet 
		   set rcpt_type = 'A'
		 where plan_no = :ls_plan and item_no = :ls_assy and qa = :ls_assyqa;
		if sqlca.sqlcode < 0 then
			messagebox('오류',sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
	end if
next

if wf_update2(dw4,dw5,"Y") = true then
	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================
	dw3.retrieve(dw_area.object.area[1])
else
	messagebox('오류',"저장실패!")
end if

end event

type dw_1 from w_inheritance`dw_1 within w_mpouter_m
boolean visible = false
integer x = 1938
integer y = 72
integer width = 110
integer height = 156
integer taborder = 50
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;string ls_sudo,ls_supp
long ll_row


ll_row = wf_rowfocuschange(dw_1,'N')
if ll_row < 1 then return
this.accepttext()
dw3.reset()
dw4.reset()
ls_sudo = trim(this.object.sudo_no[ll_row])
ls_supp = trim(this.object.supp_no[ll_row])
if not (ls_supp = "" or isnull(ls_supp)) then
	dw3.retrieve(ls_supp)
end if
dw4.retrieve(ls_sudo)
end event

type st_title from w_inheritance`st_title within w_mpouter_m
integer x = 37
integer width = 1467
string text = "외주청구 등록및취소"
end type

type st_tips from w_inheritance`st_tips within w_mpouter_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpouter_m
boolean visible = false
integer x = 2656
integer y = 48
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpouter_m
boolean visible = false
integer x = 2702
integer y = 48
end type

type pb_close from w_inheritance`pb_close within w_mpouter_m
integer x = 4375
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpouter_m
boolean visible = false
integer x = 2894
integer y = 48
integer taborder = 130
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpouter_m
boolean visible = false
integer x = 1989
integer y = 36
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_mpouter_m
integer x = 3991
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;long ll_row
string ls_plan,ls_temp
choose case tab_1.selectedtab 
	case 2
		 ll_row  = tab_1.tabpage_2.dw_4.getrow()
		 if ll_row < 1 then return

		 ls_plan = trim(tab_1.tabpage_2.dw_4.object.order_no[ll_row])
		 select product_no into :ls_temp from purdet 
		  where product_no = :ls_plan and result_type in ('N','P');
		 choose case sqlca.sqlcode
			case 0
				 messagebox('오류','이미 발주서가 작성되었습니다.',exclamation!)
				 return
			case 100
		       tab_1.tabpage_2.dw_4.deleterow(ll_row) 
			case else
				 messagebox('오류','검색중 오류가 발생되었습니다.',exclamation!)
				 return
		 end choose
	case 3
		 ll_row  = tab_1.tabpage_3.dw_5.getrow()
		 if ll_row < 1 then return
			
		 ls_plan = trim(tab_1.tabpage_3.dw_5.object.order_no[ll_row])
		 select product_no into :ls_temp from purdet 
		  where product_no = :ls_plan and result_type in ('N','P');
		 choose case sqlca.sqlcode
			case 0
				 messagebox('오류','이미 발주서가 작성되었습니다.',exclamation!)
				 return
			case 100
		       tab_1.tabpage_3.dw_5.deleterow(ll_row) 
			case else
				 messagebox('오류','검색중 오류가 발생되었습니다.',exclamation!)
				 return
		 end choose		
end choose
end event

type pb_insert from w_inheritance`pb_insert within w_mpouter_m
boolean visible = false
integer x = 2318
integer y = 48
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpouter_m
integer x = 3790
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_area, ls_sale 

ls_area = dw_area.object.area[1]
choose case tab_1.selectedtab
	case 1
		dw3.retrieve( ls_area )
		
	case 2
		ls_sale = trim(sle_1.text) + "%"
		dw4.retrieve( ls_sale, ls_area )
		
	case 3
		ls_sale = trim(sle_1.text) + "%"
		dw5.retrieve( ls_sale, ls_area )		
end choose


end event

type gb_3 from w_inheritance`gb_3 within w_mpouter_m
integer x = 1952
integer y = 16
integer width = 594
integer height = 204
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_mpouter_m
integer x = 2574
integer y = 16
integer width = 1147
integer height = 204
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpouter_m
integer x = 3753
integer y = 16
integer width = 846
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpouter_m
boolean visible = false
integer x = 1605
integer y = 80
integer width = 219
integer height = 112
integer taborder = 60
boolean border = false
end type

type tab_1 from tab within w_mpouter_m
event create ( )
event destroy ( )
integer x = 27
integer y = 248
integer width = 4571
integer height = 2236
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;//
if newindex = 1 then
	st_4.enabled  = false
	st_44.enabled = false
	sle_1.enabled = false
else
	st_4.enabled  = true
	st_44.enabled = true
	sle_1.enabled = true
end if

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4535
integer height = 2108
long backcolor = 77897888
string text = "외주대상물품"
long tabtextcolor = 16711680
long tabbackcolor = 77897888
string picturename = "Preferences!"
long picturemaskcolor = 553648127
dw_3 dw_3
cb_3 cb_3
st_1 st_1
cb_1 cb_1
end type

on tabpage_1.create
this.dw_3=create dw_3
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_1=create cb_1
this.Control[]={this.dw_3,&
this.cb_3,&
this.st_1,&
this.cb_1}
end on

on tabpage_1.destroy
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.cb_1)
end on

type dw_3 from datawindow within tabpage_1
integer x = 9
integer y = 136
integer width = 4507
integer height = 1956
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_mpinvoice_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_row

if this.rowcount() < 1 then return
//ll_row = this.getrow()
ll_row = row
this.SelectRow(ll_row, NOT this.IsSelected(ll_row))
end event

event itemchanged;string ls_data,ls_item,ls_qa,ls_itemname
long ll_row

this.accepttext()
ll_row = this.getrow()
choose case dwo.name
	case 'assy_item'
		ls_data = data
		setnull(ls_item)
		
		this.object.assy_qa[ll_row] = ls_item
		select item_name into :ls_itemname from groupitem 
		where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
			MessageBox("경고1", '마스터에 없는 물품번호입니다.', Exclamation!)
			return 1
		end if
		this.object.groupitem_item_name1[ll_row] = ls_itemname
		ls_item = this.object.assy_item[ll_row]
		if ls_item <> '' then
			idwc_qa.setfilter("item_no = '" + ls_item + "'")
			idwc_qa.filter()
		end if
end choose

end event

event itemerror;string ls_data,ls_item

setnull(ls_data)
choose case dwo.name
	case 'assy_item'
        this.object.assy_item[row] = ls_data
	case 'assy_qa'
		  this.object.assy_qa[row] = ls_data
end choose

return 2
end event

event rowfocuschanged;string ls_item
long ll_row

this.accepttext()
ll_row = this.getrow()
if ll_row < 1 then return

ls_item = this.object.assy_item[ll_row]
if ls_item <> '' then
	idwc_qa.setfilter("item_no = '" + ls_item + "'")
	idwc_qa.filter()
end if

end event

type cb_3 from commandbutton within tabpage_1
integer x = 2706
integer y = 24
integer width = 457
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "외주"
end type

event clicked;// 외주
long    ll_rowcount, ll_cnt, ll_find, ll_row, ll_count
integer li_operation, li_op, li_seq
string  ls_plan, ls_sale, ls_assy, ls_assyqa, ls_itemname, ls_uom
real    lr_planqty

dw3.accepttext()
dw4.accepttext()
dw5.accepttext()
ll_rowcount  = dw3.rowcount()

ll_count = 0
for ll_cnt = 1 to ll_rowcount
	if dw3.isselected(ll_cnt) then
      ll_count ++
	end if
next
if ll_count = 0 then
	messagebox('오류','외주대상물품을 선택하십시요.',exclamation!)
	return
end if

for ll_cnt = 1 to ll_rowcount
	if dw3.isselected(ll_cnt) then
		li_operation = dw3.object.operation[ll_cnt]
		ls_plan = trim(dw3.object.mpsdet_plan_no[ll_cnt])
		ll_find = 0
		if li_operation = 1 then
			select count(*) into :ll_find from sudodet1      // 외주구매물품체크
			 where order_no = :ls_plan
			   and sudo_type <> 'C';
		   if ll_find = 0 then
			   ll_row = dw5.insertrow(0)
			   dw5.object.order_no[ll_row]  = ls_plan
			   dw5.object.item_no[ll_row]   = dw3.object.assy_item[ll_cnt]
			   dw5.object.qa[ll_row]        = dw3.object.assy_qa[ll_cnt]
			   dw5.object.wc_no[ll_row]     = dw3.object.wc_no[ll_cnt]
            dw5.object.groupitem_item_name[ll_row] = dw3.object.groupitem_item_name1[ll_cnt]
			   dw5.object.plan_qty[ll_row]  = dw3.object.plan_qty[ll_cnt]
			   dw5.object.due_date[ll_row]  = dw3.object.napgi_date[ll_cnt]
				dw5.object.operation[ll_row] = li_operation
				dw5.object.sale_no[ll_row]   = dw3.object.sale_no[ll_cnt]
				dw5.object.seq_no[ll_row]    = dw3.object.seq_no[ll_cnt]
				dw5.object.rem[ll_row]       = dw3.object.rem[ll_cnt]
				dw5.object.color[ll_row]     = dw3.object.item_color[ll_cnt]
				dw5.object.area_no[ll_row]   = dw3.object.area_no[ll_cnt]
		   end if			
		else
			select count(*) into :ll_find from sudodet      // 외주가공물품체크
			 where order_no = :ls_plan
				and sudo_type <> 'C';
		   if ll_find = 0 then
			   ll_row = dw4.insertrow(0)
			   dw4.object.order_no[ll_row]  = ls_plan
			   dw4.object.item_no[ll_row]   = dw3.object.assy_item[ll_cnt]
			   dw4.object.qa[ll_row]        = dw3.object.assy_qa[ll_cnt]
			   dw4.object.wc_no[ll_row]     = dw3.object.wc_no[ll_cnt]
            dw4.object.itemname1[ll_row] = dw3.object.groupitem_item_name1[ll_cnt]
			   dw4.object.plan_qty[ll_row]  = dw3.object.plan_qty[ll_cnt]
			   dw4.object.due_date[ll_row]  = dw3.object.napgi_date[ll_cnt]
				dw4.object.rem[ll_row]       = dw3.object.rem[ll_cnt]
				dw4.object.area_no[ll_row]   = dw3.object.area_no[ll_cnt]
				
				ls_sale = trim(dw3.object.sale_no[ll_cnt])
				li_seq  = dw3.object.seq_no[ll_cnt]
				li_op   = li_operation - 1
//				select distinct assy_item, assy_qa, order_qty into :ls_assy,:ls_assyqa,:lr_planqty
				select distinct assy_item, assy_qa into :ls_assy,:ls_assyqa
				  from routtempnew
			   where operation = :li_op 
				  and sale_no = :ls_sale 
				  and seq_no = :li_seq;
				  
				choose case sqlca.sqlcode
					case 100
						select distinct assembly, assy_qa into :ls_assy,:ls_assyqa
						  from saledet, rout
						 where saledet.order_no = :ls_sale
							and saledet.seq_no = :li_seq
							and rout.item_no = saledet.item_no
							and substring(rout.qa, 1, 13) = substring(saledet.qa,1,13)
							and operation = :li_op;
							
						ls_assyqa = LeftA(ls_assyqa,13) + MidA(dw4.object.qa[ll_cnt], 14, 6)
	//					lr_planqty  = dw4.object.order_qty[ll_cnt]
					case 0
						
					case else
						 messagebox('오류1','수행중 오류가 발생하였습니다.',exclamation!)
						 rollback;
						 return
				end choose

            dw4.object.component[ll_row]    = ls_assy
				dw4.object.component_qa[ll_row] = ls_assyqa
//			   dw4.object.issue_qty[ll_row] = lr_planqty
			   dw4.object.issue_qty[ll_row]    = dw3.object.plan_qty[ll_cnt]
				
            select item_name,uom into :ls_itemname,:ls_uom from groupitem where item_no = :ls_assy;
            dw4.object.itemname2[ll_row]  = ls_itemname
				dw4.object.comp_uom[ll_row]   = ls_uom	
				dw4.object.issue_date[ll_row] = wf_today()
				dw4.object.operation[ll_row]  = li_operation
				dw4.object.sale_no[ll_row]    = dw3.object.sale_no[ll_cnt]
				dw4.object.seq_no[ll_row]     = dw3.object.seq_no[ll_cnt]
				dw4.object.rem[ll_row]        = dw3.object.rem[ll_cnt]
				dw4.object.color[ll_row]      = dw3.object.item_color[ll_cnt]
		   end if			
		end if
	end if
next

MessageBox('확인','외주대상물품이 이동되었습니다.',information!)
dw3.selectrow(0,false)

end event

type st_1 from statictext within tabpage_1
integer x = 18
integer y = 20
integer width = 2478
integer height = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
boolean enabled = false
string text = "외주대상물품을 선택한 후 [외주]버튼을 누르면 사급,도급쪽으로 데이터가 이동됩니다."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within tabpage_1
integer x = 3168
integer y = 24
integer width = 457
integer height = 84
integer taborder = 31
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;// 저장
if dw3.update() = 1 then
	messagebox('확인','저장되었습니다.')
	commit;
	return
else
	messagebox('오류','저장실패 되었습니다.',exclamation!)
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4535
integer height = 2108
long backcolor = 79741120
string text = "외주가공물품등록"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Table!"
long picturemaskcolor = 553648127
dw_4 dw_4
st_2 st_2
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
end type

on tabpage_2.create
this.dw_4=create dw_4
this.st_2=create st_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.Control[]={this.dw_4,&
this.st_2,&
this.cb_4,&
this.cb_5,&
this.cb_6}
end on

on tabpage_2.destroy
destroy(this.dw_4)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
end on

type dw_4 from datawindow within tabpage_2
integer x = 9
integer y = 136
integer width = 4507
integer height = 1956
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_iosudodet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_data, ls_item, ls_qa, ls_itemname, ls_uom
long ll_row

this.accepttext()
ll_row = this.getrow()
choose case dwo.name
	case 'component'
		ls_data = data
		setnull(ls_item)
		setnull(ls_uom)
		
		this.object.assy_qa[ll_row] = ls_item
		this.object.comp_uom[ll_row] = ls_item
		select item_name, uom into :ls_itemname, :ls_uom from groupitem 
		where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
			MessageBox("경고1", '마스터에 없는 물품번호입니다.', Exclamation!)
			return 1
		end if
		this.object.item_item_name[ll_row] = ls_itemname
		this.object.comp_uom[ll_row] = ls_uom
		ls_item = this.object.component[ll_row]
		if ls_item <> '' then
			idwc_qa1.setfilter("item_no = '" + ls_item + "'")
			idwc_qa1.filter()
		end if
end choose

end event

event itemerror;string ls_data

setnull(ls_data)
this.object.component[row] = ls_data

return 2
end event

event rowfocuschanged;string ls_item
long ll_row

this.accepttext()
ll_row = this.getrow()
if ll_row < 1 then return
ls_item = this.object.component[ll_row]
if ls_item <> '' then
	idwc_qa1.setfilter("item_no = '" + ls_item + "'")
	idwc_qa1.filter()
end if

end event

type st_2 from statictext within tabpage_2
integer x = 91
integer y = 52
integer width = 146
integer height = 60
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
string text = "정렬"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within tabpage_2
integer x = 265
integer y = 36
integer width = 489
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "생산계획번호"
end type

event clicked;
if ii_sort = 1 then
	ii_sort = 0
	dw_4.SetSort("order_no D, item_no A, qa A ")
else
	ii_sort = 1
	dw_4.SetSort("order_no A, item_no A, qa A ")
end if
	
dw_4.Sort( )
	
end event

type cb_5 from commandbutton within tabpage_2
integer x = 768
integer y = 36
integer width = 489
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주번호"
end type

event clicked;
if ii_sort = 1 then
	ii_sort = 0
	dw_4.SetSort("sale_no D, item_no A, qa A ")
else
	ii_sort = 1
	dw_4.SetSort("sale_no A, item_no A, qa A ")
end if
	
dw_4.Sort( )
	
end event

type cb_6 from commandbutton within tabpage_2
integer x = 1271
integer y = 36
integer width = 489
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "제품명"
end type

event clicked;
if ii_sort = 1 then
	ii_sort = 0
	dw_4.SetSort("itemname1 D, qa A, sale_no A ")
else
	ii_sort = 1
	dw_4.SetSort("itemname1 A, qa A, sale_no A ")
end if
	
dw_4.Sort( )
	
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4535
integer height = 2108
long backcolor = 79741120
string text = "외주구매물품등록"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DataWindow!"
long picturemaskcolor = 553648127
dw_5 dw_5
st_3 st_3
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
end type

on tabpage_3.create
this.dw_5=create dw_5
this.st_3=create st_3
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.Control[]={this.dw_5,&
this.st_3,&
this.cb_7,&
this.cb_8,&
this.cb_9}
end on

on tabpage_3.destroy
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
end on

type dw_5 from datawindow within tabpage_3
integer x = 9
integer y = 136
integer width = 4507
integer height = 1956
integer taborder = 22
boolean bringtotop = true
string dataobject = "d_mpsudo1_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tabpage_3
integer x = 91
integer y = 52
integer width = 169
integer height = 76
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
string text = "정렬"
boolean focusrectangle = false
end type

type cb_7 from commandbutton within tabpage_3
integer x = 265
integer y = 36
integer width = 489
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "생산계획번호"
end type

event clicked;
if ii_sort = 1 then
	ii_sort = 0
	dw_5.SetSort("order_no D, item_no A, qa A ")
else
	ii_sort = 1
	dw_5.SetSort("order_no A, item_no A, qa A ")
end if
	
dw_5.Sort( )
	
end event

type cb_8 from commandbutton within tabpage_3
integer x = 768
integer y = 36
integer width = 489
integer height = 92
integer taborder = 41
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주번호"
end type

event clicked;
if ii_sort = 1 then
	ii_sort = 0
	dw_5.SetSort("sale_no D, item_no A, qa A ")
else
	ii_sort = 1
	dw_5.SetSort("sale_no A, item_no A, qa A ")
end if
	
dw_5.Sort( )
	
end event

type cb_9 from commandbutton within tabpage_3
integer x = 1271
integer y = 36
integer width = 489
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "제품명"
end type

event clicked;
if ii_sort = 1 then
	ii_sort = 0
	dw_5.SetSort("groupitem_item_name D, qa A, sale_no A ")
else
	ii_sort = 1
	dw_5.SetSort("groupitem_item_name A, qa A, sale_no A ")
end if
	
dw_5.Sort( )
	
end event

type st_4 from statictext within w_mpouter_m
integer x = 2830
integer y = 76
integer width = 270
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "수주번호"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_mpouter_m
integer x = 3131
integer y = 100
integer width = 544
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "HD2000"
boolean autohscroll = false
textcase textcase = upper!
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type st_44 from statictext within w_mpouter_m
integer x = 2615
integer y = 144
integer width = 512
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "예) HD20000124-001"
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpouter_m
integer x = 1984
integer y = 92
integer width = 517
integer height = 80
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

