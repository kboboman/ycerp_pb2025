$PBExportHeader$w_cditem_m.srw
$PBExportComments$물품코드등록(1998/03/10 - 정재수)
forward
global type w_cditem_m from w_inheritance
end type
type dw_3 from datawindow within w_cditem_m
end type
type dw_4 from datawindow within w_cditem_m
end type
type tab_1 from tab within w_cditem_m
end type
type tabpage_1 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_2 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_6 dw_6
end type
type tab_1 from tab within w_cditem_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type rb_5 from radiobutton within w_cditem_m
end type
type rb_6 from radiobutton within w_cditem_m
end type
type sle_1 from singlelineedit within w_cditem_m
end type
type pb_1 from picturebutton within w_cditem_m
end type
type cb_1 from commandbutton within w_cditem_m
end type
type st_1 from statictext within w_cditem_m
end type
type cb_2 from commandbutton within w_cditem_m
end type
type st_item from statictext within w_cditem_m
end type
type st_8 from statictext within w_cditem_m
end type
type ddlb_col from dropdownlistbox within w_cditem_m
end type
type st_9 from statictext within w_cditem_m
end type
type ddlb_op from dropdownlistbox within w_cditem_m
end type
type sle_value from singlelineedit within w_cditem_m
end type
type cb_filteron from commandbutton within w_cditem_m
end type
type cb_filteroff from commandbutton within w_cditem_m
end type
type cb_11 from commandbutton within w_cditem_m
end type
type cb_12 from commandbutton within w_cditem_m
end type
end forward

global type w_cditem_m from w_inheritance
integer width = 4549
integer height = 2816
string title = "물품코드 관리(w_cditem_m)"
windowstate windowstate = normal!
long backcolor = 79219928
dw_3 dw_3
dw_4 dw_4
tab_1 tab_1
rb_5 rb_5
rb_6 rb_6
sle_1 sle_1
pb_1 pb_1
cb_1 cb_1
st_1 st_1
cb_2 cb_2
st_item st_item
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
end type
global w_cditem_m w_cditem_m

type variables
string is_dw1sql, is_dw3sql
gs_item ist_item
string  is_chk = "1", is_chk2 = "1"
end variables

on w_cditem_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.tab_1=create tab_1
this.rb_5=create rb_5
this.rb_6=create rb_6
this.sle_1=create sle_1
this.pb_1=create pb_1
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_2=create cb_2
this.st_item=create st_item
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.rb_5
this.Control[iCurrent+5]=this.rb_6
this.Control[iCurrent+6]=this.sle_1
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.st_item
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.ddlb_col
this.Control[iCurrent+14]=this.st_9
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_filteron
this.Control[iCurrent+18]=this.cb_filteroff
this.Control[iCurrent+19]=this.cb_11
this.Control[iCurrent+20]=this.cb_12
end on

on w_cditem_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.tab_1)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.sle_1)
destroy(this.pb_1)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.st_item)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_3.visible = false

sle_1.enabled = false
pb_1.enabled  = false

if gf_permission('물품코드관리자', gs_userid) = 'Y' then
	dw_4.Object.use_flag.TabSequence = 10
	tab_1.tabpage_1.dw_5.Object.use_flag.TabSequence = 10
end if

dw_3.settransobject(sqlca)	
dw_4.settransobject(sqlca)
tab_1.tabpage_1.dw_5.settransobject(sqlca)
tab_1.tabpage_2.dw_6.settransobject(sqlca)
//dw_1.retrieve()
is_dw1sql = dw_1.describe("datawindow.table.select")
is_dw3sql = dw_3.describe("datawindow.table.select")

pb_retrieve.triggerevent( clicked! )

end event

event resize;call super::resize;//
this.width  = 4549
dw_1.height = this.height - 688
dw_4.height = this.height - 2296
tab_1.y     = this.height - 1736
end event

type pb_save from w_inheritance`pb_save within w_cditem_m
integer x = 4069
integer y = 60
integer taborder = 70
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
string   ls_item_no, ls_item_no1, ls_qa, ls_qa1, ls_uom,ls_temp
decimal  lr_price
datetime ldt_today
long     ll_row, li_chk
integer  li_pat
//[modified,1998/06/07,이인호] qa1 : 길이를 "00000"로 넣은 필드 

if tab_1.tabpage_1.dw_5.getrow() < 1 then return
if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

dw_1.accepttext()
tab_1.tabpage_1.dw_5.accepttext()

l_status   = tab_1.tabpage_1.dw_5.getitemstatus(1, 0, primary!)
ls_item_no = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "item_no"))
ls_uom     = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "uom"))
ls_qa1     = tab_1.tabpage_1.dw_5.getitemstring(1, "qa")
choose case ls_uom
	case "M"
		ls_qa = LeftA(tab_1.tabpage_1.dw_5.getitemstring(1, "qa"), 13)
	case "M2"
		ls_qa = LeftA(tab_1.tabpage_1.dw_5.getitemstring(1, "qa"), 3)
	case else
		ls_qa = tab_1.tabpage_1.dw_5.getitemstring(1, "qa")
end choose

if wf_nullchk(tab_1.tabpage_1.dw_5) = false then return

if l_status = newmodified! or l_status = new! then
	SELECT item_no, price INTO :ls_item_no1, :lr_price
	  FROM itemcost 
	 WHERE item_no = :ls_item_no AND qa = :ls_qa;
	 
	li_chk = sqlca.sqlcode
	if isnull(ls_item_no1) or ls_item_no1 = '' then
		ldt_today = wf_today()

		INSERT INTO itemcost(item_no, qa, uom, price, old_price, tran_date, user_id, rem, upda_chk)
      VALUES (:ls_item_no, :ls_qa, :ls_uom, 0, 0, :ldt_today, :gs_userid, '', 'N');		  
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
			return
		end if		
		//	ls_item_name = trim(dw_1.object.item_name[dw_1.getrow()])
		//	INSERT INTO citem(item_no, type, item_name, uom, qty, price, source, alternate, rem)
		//	VALUES (:ls_item_no, :ls_qa1, :ls_item_name, :ls_uom, 1, :lr_price, 1, 2, ''); 	  
		//	if sqlca.sqlcode <> 0 then
		//		rollback;
		//		messagebox("저장","저장중 오류가 발생하였습니다!",exclamation!)
		//		return
		//	end if
	else
		tab_1.tabpage_1.dw_5.object.price_a[1] = lr_price
	end if

	tab_1.tabpage_1.dw_5.accepttext()
   // [modified,1998/06/07,이인호] qa1 : 길이를 "00000"로 넣은 필드 
	ls_qa1 = LeftA(tab_1.tabpage_1.dw_5.getitemstring(1, "qa"), 13) + "X00000"
	ls_qa  = tab_1.tabpage_1.dw_5.getitemstring(1, "qa")
	tab_1.tabpage_1.dw_5.object.qa1[1] = ls_qa1 
	
	if MidA(ls_item_no,1,1) = "P" then
		SELECT pat_no  INTO :li_pat  FROM groupitem   WHERE item_no = :ls_item_no;
		SELECT item_no INTO :ls_temp FROM itempattern WHERE item_no = :ls_item_no AND qa1 = :ls_qa1;
      if sqlca.sqlcode <> 0 then
		   INSERT INTO itempattern (item_no,qa1,pat_no) VALUES (:ls_item_no,:ls_qa1,:li_pat);
		   if sqlca.sqlcode <> 0 then
			   rollback;
			   MessageBox("저장3",SQLCA.SQLERRTEXT,exclamation!)
			   return
		   end if
		end if
   end if
	
	if wf_update1(tab_1.tabpage_1.dw_5, 'Y') = true then
		dw_4.reset()
		dw_4.retrieve(dw_1.object.item_no[dw_1.getrow()])
		ll_row = dw_4.Find("qa =" + ls_qa, 1, dw_4.RowCount())
		dw_4.scrolltorow(ll_row)
	end if
else
   // [modified,1998/06/07,이인호] qa1 : 길이를 "00000"로 넣은 필드 
	wf_update1(tab_1.tabpage_1.dw_5, 'Y')
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cditem_m
integer x = 41
integer y = 540
integer width = 1792
integer height = 2120
integer taborder = 10
string title = "GROUPITEM"
string dataobject = "d_cditemgroup_t"
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;long   ll_row
string ls_value

dw_4.setredraw(false)
dw_4.reset()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()

ll_row   = this.getrow()
if ll_row > 0 then
	dw_4.retrieve(this.object.item_no[ll_row])
end if

dw_4.setredraw(true)

end event

event dw_1::clicked;call super::clicked;//
string ls_value
string ls_col, ls_text

if row < 1 or row > this.rowcount() then return
choose case dwo.name
	case "item_no"
		ls_col   = "코드"
		ls_text  = this.object.item_no[row]
		ls_value = this.object.item_no[row]
	case "item_name"
		ls_col   = "품목명"
		ls_text  = this.object.item_name[row]
		ls_value = this.object.item_name[row]		
	case "cnt"
		ls_col   = "규격"
		ls_text  = string(this.object.cnt[row])
	case "source"
		ls_col   = "출처"
		ls_text  = this.object.source[row]
end choose

choose case ls_col
	case "규격"
		ddlb_op.text = "="
	case else
		ddlb_op.text = "LIKE"
end choose
ddlb_col.text  = ls_col
sle_value.text = ls_text
sle_1.text     = ls_value

ls_value       = this.object.item_name[row]
st_item.text   = "품목명: " + ls_value

dw_4.reset()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()

dw_4.setredraw(false)
dw_4.retrieve(this.object.item_no[row])
dw_4.setredraw(true)

end event

type dw_2 from w_inheritance`dw_2 within w_cditem_m
integer x = 1138
integer y = 20
integer width = 119
integer height = 88
integer taborder = 110
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_cditem_m
integer x = 50
integer width = 1358
integer height = 144
string text = "물품코드 관리"
end type

type st_tips from w_inheritance`st_tips within w_cditem_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditem_m
integer x = 4274
integer y = 384
integer taborder = 130
string picturename = "c:\bmp\save.bmp"
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;
wf_update1(dw_4, 'Y')
end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"저장",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cditem_m
boolean visible = false
integer x = 2811
integer taborder = 90
end type

type pb_close from w_inheritance`pb_close within w_cditem_m
integer x = 4261
integer y = 60
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditem_m
integer x = 3877
integer y = 60
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_codere_str lst_code
w_repsuper w_print
st_print   l_print
string ls_sql, ls_where

openwithparm(w_whitem_w, lst_code)
lst_code = message.powerobjectparm
if lst_code.okcancel = 'N' then return

if lst_code.flag = 'A' then
	ls_sql = "datawindow.table.select = '" + is_dw3sql + "'"
else
	ls_where = " and item.item_no between ~~'" + lst_code.start_no + "~~' and " + &
				  "~~'" + lst_code.end_no + "~~'"
	ls_sql = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
end if

dw_3.settransobject(sqlca)
dw_3.modify(ls_sql)
dw_3.retrieve()
if dw_3.rowcount() < 1 then return

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc  = " 이 프로그램은 물품별 표준단가를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cditem_m
boolean visible = false
integer x = 2427
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_cditem_m
boolean visible = false
integer x = 2935
integer taborder = 50
end type

event pb_delete::clicked;dwitemstatus l_status

tab_1.tabpage_1.dw_5.accepttext()
l_status = tab_1.tabpage_1.dw_5.getitemstatus(1, 0, primary!)

if l_status = new! or l_status = newmodified! then
	tab_1.tabpage_1.dw_5.reset()
	tab_1.tabpage_2.dw_6.reset()
	dw_4.postevent(rowfocuschanged!)
elseif messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	tab_1.tabpage_1.dw_5.deleterow(1)
	tab_1.tabpage_2.dw_6.deleterow(1)
	if wf_update1(tab_1.tabpage_1.dw_5, 'Y') = true then
		dw_4.deleterow(dw_4.getrow())
		dw_4.postevent(rowfocuschanged!)
	end if
end if
	


end event

type pb_insert from w_inheritance`pb_insert within w_cditem_m
integer x = 3685
integer y = 60
integer taborder = 40
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;call super::clicked;long ll_row

if dw_1.rowcount() < 1 then return

tab_1.tabpage_1.dw_5.ReSet()
tab_1.tabpage_2.dw_6.ReSet()
ll_row = tab_1.tabpage_1.dw_5.InsertRow(0)
tab_1.tabpage_1.dw_5.ScrollToRow(ll_row)
tab_1.tabpage_2.dw_6.InsertRow(0)

tab_1.tabpage_1.dw_5.object.item_no[ll_row]   = trim(dw_1.object.item_no[dw_1.getrow()])
tab_1.tabpage_1.dw_5.object.item_name[ll_row] = trim(dw_1.object.item_name[dw_1.getrow()])
tab_1.tabpage_1.dw_5.object.uom[ll_row]       = trim(dw_1.object.uom[dw_1.getrow()])
tab_1.tabpage_1.dw_5.object.source[ll_row]    = dw_1.object.source[dw_1.getrow()]
if dw_4.rowcount() > 0 then
	////////////////////////////////////////////////////////////////////////////////////////////////
	//          1
	// 1234567890123456789
	// 000X0000X0000X00000
	tab_1.tabpage_1.dw_5.object.l1[ll_row]            = LeftA(dw_4.object.qa[dw_4.getrow()], 3)
	tab_1.tabpage_1.dw_5.object.l2[ll_row]            = MidA(dw_4.object.qa[dw_4.getrow()],  5, 4)
	tab_1.tabpage_1.dw_5.object.l3[ll_row]            = MidA(dw_4.object.qa[dw_4.getrow()], 10, 4)
	///////////////////////////////////////////////////////////////////////////////////////////////
	tab_1.tabpage_1.dw_5.object.loc_no[ll_row]        = ist_item.loc_no
	tab_1.tabpage_1.dw_5.object.count_code[ll_row]    = ist_item.count_code
	tab_1.tabpage_1.dw_5.object.obsolete_code[ll_row] = ist_item.obsolete_code
	tab_1.tabpage_1.dw_5.object.lot[ll_row]           = ist_item.lot
	tab_1.tabpage_1.dw_5.object.leadtime[ll_row]      = ist_item.leadtime
	tab_1.tabpage_1.dw_5.object.reorder[ll_row]       = ist_item.reorder
	tab_1.tabpage_1.dw_5.object.safety_stock[ll_row]  = ist_item.safety_stock
end if

tab_1.tabpage_2.dw_6.object.item_no[ll_row]   = trim(dw_1.object.item_no[dw_1.getrow()])
tab_1.tabpage_2.dw_6.object.item_name[ll_row] = trim(dw_1.object.item_name[dw_1.getrow()])

if dw_1.object.qa_rule[dw_1.getrow()] = "N" then  // 도료 입력시 비표준 코드입력가능(한글)
	tab_1.tabpage_1.dw_5.object.qa_rule[1] = "N"
else
	tab_1.tabpage_1.dw_5.object.qa_rule[1] = "Y"
end if

tab_1.tabpage_1.dw_5.SetColumn("l4")
tab_1.tabpage_1.dw_5.SetFocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditem_m
integer x = 3493
integer y = 60
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_4.reset()

sle_1.text = ''
dw_1.setfilter('')
dw_1.filter()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()

dw_1.retrieve()
if dw_1.rowcount() < 1 then return

sle_1.enabled = true
pb_1.enabled  = true
dw_1.scrolltorow(1)

end event

type gb_3 from w_inheritance`gb_3 within w_cditem_m
integer x = 46
integer y = 260
integer width = 1595
integer height = 176
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_cditem_m
boolean visible = false
integer x = 1422
integer y = 216
integer width = 2130
integer height = 192
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
long backcolor = 81838264
string text = "출처"
end type

type gb_1 from w_inheritance`gb_1 within w_cditem_m
integer x = 2213
integer y = 20
integer width = 2267
integer taborder = 0
long backcolor = 81838264
end type

type dw_3 from datawindow within w_cditem_m
integer x = 1271
integer y = 20
integer width = 119
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_cditem_r"
boolean livescroll = true
end type

type dw_4 from datawindow within w_cditem_m
integer x = 1856
integer y = 540
integer width = 2610
integer height = 516
integer taborder = 20
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_cdqa_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long   ll_row
string ls_itemno, ls_qa

dw_1.accepttext()
this.accepttext()
ll_row = this.getrow()

if ll_row > 0 then
	ls_itemno = this.Object.item_no[ll_row]
	ls_qa     = this.Object.qa[ll_row]
	
	tab_1.tabpage_1.dw_5.retrieve(ls_itemno, ls_qa)
	tab_1.tabpage_2.dw_6.retrieve(ls_itemno, ls_qa)	
	if dw_1.object.qa_rule[dw_1.getrow()] = 'N' then 
		tab_1.tabpage_1.dw_5.object.qa_rule[1] = 'N'
	else
		tab_1.tabpage_1.dw_5.object.qa_rule[1] = 'Y'
	end if
end if

end event

event clicked;//
this.scrolltorow( row )

end event

type tab_1 from tab within w_cditem_m
string tag = "ㅇㅀ"
integer x = 1856
integer y = 1072
integer width = 2610
integer height = 1588
integer taborder = 30
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
integer y = 112
integer width = 2574
integer height = 1460
long backcolor = 79741120
string text = "물품코드마스터"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 553648127
dw_5 dw_5
end type

on tabpage_1.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_1.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_1
integer x = 32
integer y = 12
integer width = 2139
integer height = 1452
integer taborder = 61
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_cditem_m"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_l1,ls_l2,ls_l3,ls_l4,ls_qa,ls_data, ls_qa1

this.accepttext()
if row < 1 then return

tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
ls_qa = this.object.qa[1]

if isnull(ls_qa) then ls_qa = ""

ls_l1 = trim(this.object.l1[1])
ls_l2 = trim(this.object.l2[1])
ls_l3 = trim(this.object.l3[1])
ls_l4 = trim(this.object.l4[1])

choose case dwo.name
	case 'l1'
		  if isnumber(ls_l1) then
			  ls_l1 = '00000' + ls_l1
			  ls_l1 = RightA(ls_l1,3)
			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
			  this.object.l1[1] = ls_l1
		  else
			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
			  return 1
		  end if
	case 'l2'
		  if isnumber(ls_l2) then
			  ls_l2 = '00000' + ls_l2
			  ls_l2 = RightA(ls_l2,4)
			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
			  this.object.l2[1] = ls_l2
		  else
			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
			  return	1		
		  end if
 	case 'l3'
		  if isnumber(ls_l3) then
			  ls_l3 = '00000' + ls_l3
			  ls_l3 = RightA(ls_l3,4)
			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
			  this.object.l3[1] = ls_l3
		  else
			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
			  return	1		
		  end if
 	case 'l4'
		  	if dw_1.object.qa_rule[dw_1.getrow()] = 'Y' then // 표준규격
			   if isnumber(ls_l4) then
				   ls_l4 = '00000' + ls_l4
				   ls_l4 = RightA(ls_l4,5)
				   this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
				   this.object.l4[1] = ls_l4
			   else
			 	  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
			 	  return	1		
			   end if
			   ls_qa1 = this.object.qa[1]
			else
				this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + trim(ls_l4)
			   this.object.l4[1] = trim(ls_l4)
		  end if
end choose

end event

event itemerror;string ls_data,ls_item

setnull(ls_data)
choose case dwo.name
	case 'target_item'
        this.object.target_item[row] = ls_data
	case 'target_qa'
		  this.object.target_qa[row] = ls_data
end choose

return 2
end event

event retrieveend;this.accepttext()

if this.getrow() > 0 then
	ist_item.loc_no = this.object.loc_no[1]
	ist_item.count_code = this.object.count_code[1]
	ist_item.obsolete_code = this.object.obsolete_code[1]
	ist_item.lot = this.object.lot[1]
	ist_item.leadtime = this.object.leadtime[1]
	ist_item.reorder = this.object.reorder[1]
	ist_item.safety_stock = this.object.safety_stock[1]
end if
end event

event losefocus;IF THIS.ROWCOUNT() < 1 THEN RETURN
this.accepttext()
tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2574
integer height = 1460
long backcolor = 79741120
string text = "비용 및 기타사항"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 553648127
dw_6 dw_6
end type

on tabpage_2.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_2.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_2
integer x = 32
integer y = 12
integer width = 2139
integer height = 1452
integer taborder = 71
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_cditem_m1"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

tab_1.tabpage_1.dw_5.object.std_setup[1] = this.object.std_setup[1]
tab_1.tabpage_1.dw_5.object.std_burden[1] = this.object.std_burden[1]
tab_1.tabpage_1.dw_5.object.std_material[1] = this.object.std_material[1]
tab_1.tabpage_1.dw_5.object.std_subcontract[1] = this.object.std_subcontract[1]
tab_1.tabpage_1.dw_5.object.std_labor[1] = this.object.std_labor[1]
tab_1.tabpage_1.dw_5.object.std_machine[1] = this.object.std_machine[1]
tab_1.tabpage_1.dw_5.object.heft[1] = this.object.heft[1]
tab_1.tabpage_1.dw_5.object.volume[1] = this.object.volume[1]
end event

event losefocus;this.accepttext()

tab_1.tabpage_1.dw_5.object.std_setup[1] = this.object.std_setup[1]
tab_1.tabpage_1.dw_5.object.std_burden[1] = this.object.std_burden[1]
tab_1.tabpage_1.dw_5.object.std_material[1] = this.object.std_material[1]
tab_1.tabpage_1.dw_5.object.std_subcontract[1] = this.object.std_subcontract[1]
tab_1.tabpage_1.dw_5.object.std_labor[1] = this.object.std_labor[1]
tab_1.tabpage_1.dw_5.object.std_machine[1] = this.object.std_machine[1]
tab_1.tabpage_1.dw_5.object.heft[1] = this.object.heft[1]
tab_1.tabpage_1.dw_5.object.volume[1] = this.object.volume[1]
end event

type rb_5 from radiobutton within w_cditem_m
integer x = 366
integer y = 324
integer width = 229
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "품명"
end type

event clicked;if is_chk2 = "1" then
	is_chk2 = "0"
	dw_1.setsort("item_name A and item_no A")
else
	dw_1.setsort("item_name D and item_no A")
	is_chk2 = "1"
end if
dw_1.sort( )
long ll_row

ll_row = dw_1.getrow()
if ll_row > 0 then
	dw_4.retrieve(dw_1.object.item_no[ll_row])
end if
sle_1.text = ""
end event

type rb_6 from radiobutton within w_cditem_m
integer x = 105
integer y = 324
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코드"
boolean checked = true
end type

event clicked;if is_chk = "1" then
	is_chk = "0"
	dw_1.setsort("item_no A")
else
	dw_1.setsort("item_no D")
	is_chk = "1"
end if
dw_1.sort( )
long ll_row

ll_row = dw_1.getrow()
if ll_row > 0 then
	dw_4.retrieve(dw_1.object.item_no[ll_row])
end if
sle_1.text = ""
end event

type sle_1 from singlelineedit within w_cditem_m
event keydown pbm_keydown
integer x = 635
integer y = 312
integer width = 809
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event getfocus;pb_1.default = true
end event

type pb_1 from picturebutton within w_cditem_m
integer x = 1463
integer y = 308
integer width = 137
integer height = 100
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;string ls_fil, ls_str

dw_4.reset()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()

if trim(sle_1.text) = '%' then
   ls_str = '%'
else
	ls_str = trim(sle_1.text) + '%'
end if
if trim(sle_1.text) = '' or isnull(sle_1.text) then
	dw_1.setfilter('')
else
	if rb_6.checked = true then
		ls_fil = "item_no like '" + ls_str + "'"
		dw_1.setfilter(ls_fil)
	else
		ls_fil = "item_name like '" + ls_str + "'"
		dw_1.setfilter(ls_fil)
	end if
end if
dw_1.filter()
if dw_1.getrow() < 1 then 
	sle_1.setfocus()
	sle_1.SelectText(1, LenA(sle_1.Text))
	return
end if
pb_1.default = false
dw_4.retrieve(dw_1.object.item_no[dw_1.getrow()])
dw_1.setfocus()
end event

type cb_1 from commandbutton within w_cditem_m
integer x = 2254
integer y = 60
integer width = 512
integer height = 144
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "전략품목 관리"
end type

event clicked;// 전략품목 관리
string ls_itemno, ls_itemnm
long   ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_itemno = dw_1.object.item_no[ll_row]
ls_itemnm = dw_1.object.item_name[ll_row]
if ls_itemno = "" or isnull(ls_itemno) then return

if IsValid(w_o_main) then 
	OpenSheet(w_cditemtop10_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cditemtop10_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cditemtop10_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cditemtop10_m,  w_all_main, 5, original!)
end if

w_cditemtop10_m.sle_no.text = ls_itemno
w_cditemtop10_m.sle_nm.text = ls_itemnm

end event

type st_1 from statictext within w_cditem_m
integer x = 3808
integer y = 460
integer width = 457
integer height = 68
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 81838264
string text = "규격저장= >"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_cditem_m
integer x = 2789
integer y = 60
integer width = 512
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "물품그룹 관리"
end type

event clicked;// 물품그룹 관리
gs_where lstr_where
string   ls_itemno, ls_itemnm
long     ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if IsValid(w_o_main) then 
	OpenSheet(w_cditemgroup_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cditemgroup_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cditemgroup_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cditemgroup_m,  w_all_main, 5, original!)
end if

w_cditemgroup_m.em_1.text = sle_1.text

end event

type st_item from statictext within w_cditem_m
integer x = 1879
integer y = 464
integer width = 1861
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "품목명:"
boolean focusrectangle = false
end type

type st_8 from statictext within w_cditem_m
integer x = 50
integer y = 472
integer width = 160
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

type ddlb_col from dropdownlistbox within w_cditem_m
integer x = 210
integer y = 456
integer width = 297
integer height = 532
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"코드","품목명","규격","출처"}
end type

type st_9 from statictext within w_cditem_m
integer x = 521
integer y = 472
integer width = 160
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

type ddlb_op from dropdownlistbox within w_cditem_m
integer x = 681
integer y = 456
integer width = 279
integer height = 512
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
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

type sle_value from singlelineedit within w_cditem_m
integer x = 974
integer y = 456
integer width = 256
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cditem_m
integer x = 1239
integer y = 456
integer width = 146
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "코드"
			ls_col = "item_no "
		case "품목명"
			ls_col = "item_name "
		case "규격"
			ls_col = "cnt "
		case "출처"
			ls_col = "source "
	end choose		

	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "work_date ", "napgi_date "
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "cnt "
				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
		end choose 
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

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)

if dw_1.rowcount() > 0 then
	ls_value       = dw_1.object.item_name[1]
	st_item.text   = "품목명: " + ls_value
	
	dw_4.reset()
	tab_1.tabpage_1.dw_5.reset()
	tab_1.tabpage_2.dw_6.reset()
	
	dw_4.setredraw(false)
	dw_4.retrieve(dw_1.object.item_no[1])
	dw_4.setredraw(true)
end if

end event

type cb_filteroff from commandbutton within w_cditem_m
integer x = 1390
integer y = 456
integer width = 146
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
string ls_value

ddlb_op.text    = "LIKE"
ddlb_col.text   = "품목명"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

dw_1.scrolltorow(1)

if dw_1.rowcount() > 0 then
	ls_value       = dw_1.object.item_name[1]
	st_item.text   = "품목명: " + ls_value
	
	dw_4.reset()
	tab_1.tabpage_1.dw_5.reset()
	tab_1.tabpage_2.dw_6.reset()
	
	dw_4.setredraw(false)
	dw_4.retrieve(dw_1.object.item_no[1])
	dw_4.setredraw(true)
end if

end event

type cb_11 from commandbutton within w_cditem_m
integer x = 1541
integer y = 456
integer width = 146
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
String ls_col
choose case trim(ddlb_col.text)
	case "코드"
		ls_col = "item_no "
	case "품목명"
		ls_col = "item_name "
	case "규격"
		ls_col = "cnt "
	case "출처"
		ls_col = "source "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_12 from commandbutton within w_cditem_m
integer x = 1687
integer y = 456
integer width = 146
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
String ls_col
choose case trim(ddlb_col.text)
	case "코드"
		ls_col = "item_no "
	case "품목명"
		ls_col = "item_name "
	case "규격"
		ls_col = "cnt "
	case "출처"
		ls_col = "source "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

