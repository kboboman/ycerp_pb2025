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
type cb_1 from commandbutton within w_cditem_m
end type
type st_1 from statictext within w_cditem_m
end type
type cb_2 from commandbutton within w_cditem_m
end type
type st_2 from statictext within w_cditem_m
end type
type st_4 from statictext within w_cditem_m
end type
type ddlb_fld from dropdownlistbox within w_cditem_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cditem_m
end type
type st_5 from statictext within w_cditem_m
end type
type sle_value from singlelineedit within w_cditem_m
end type
type cb_3 from commandbutton within w_cditem_m
end type
type cb_4 from commandbutton within w_cditem_m
end type
type cb_5 from commandbutton within w_cditem_m
end type
type cb_6 from commandbutton within w_cditem_m
end type
type pb_1 from picturebutton within w_cditem_m
end type
type st_vertical from u_splitbar_vertical within w_cditem_m
end type
type st_horizontal from u_splitbar_horizontal within w_cditem_m
end type
type ddlb_op from dropdownlistbox within w_cditem_m
end type
end forward

global type w_cditem_m from w_inheritance
integer width = 4549
integer height = 2648
string title = "물품코드 관리(w_cditem_m)"
long backcolor = 79219928
dw_3 dw_3
dw_4 dw_4
tab_1 tab_1
cb_1 cb_1
st_1 st_1
cb_2 cb_2
st_2 st_2
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
pb_1 pb_1
st_vertical st_vertical
st_horizontal st_horizontal
ddlb_op ddlb_op
end type
global w_cditem_m w_cditem_m

type variables
gs_item ist_item
string  is_dw, is_dw1sql, is_dw3sql
string  is_chk = "1", is_chk2 = "1"
end variables

on w_cditem_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.tab_1=create tab_1
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_2=create cb_2
this.st_2=create st_2
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.pb_1=create pb_1
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cb_6
this.Control[iCurrent+17]=this.pb_1
this.Control[iCurrent+18]=this.st_vertical
this.Control[iCurrent+19]=this.st_horizontal
this.Control[iCurrent+20]=this.ddlb_op
end on

on w_cditem_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.tab_1)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.pb_1)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_1 )

st_vertical.of_set_rightobject( dw_4 )
st_vertical.of_set_rightobject( tab_1 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_4 )
st_horizontal.of_set_bottomobject( tab_1 )
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false
dw_3.visible = false

if GF_Permission('물품코드관리자', gs_userid) = 'Y' then
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
long  iHeight

iHeight     = newheight - dw_1.y - gb_3.x

gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.height = newheight - dw_1.y - gb_3.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_4.width  = newwidth  - dw_4.x - gb_3.x
dw_4.height = iHeight * 0.4

st_horizontal.y      = dw_4.y + dw_4.height
st_horizontal.width  = dw_4.width

tab_1.y      = st_horizontal.y + st_horizontal.height
tab_1.width  = newwidth  - tab_1.x - gb_3.x
tab_1.height = newheight - tab_1.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_cditem_m
integer x = 4055
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

		INSERT INTO itemcost (item_no, qa, uom, price, old_price, tran_date, user_id, rem, upda_chk)
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
	
	if WF_Update1( tab_1.tabpage_1.dw_5, 'Y' ) = true then
		dw_4.reset()
		dw_4.retrieve(dw_1.object.item_no[dw_1.getrow()])
		ll_row = dw_4.Find("qa =" + ls_qa, 1, dw_4.RowCount())
		dw_4.scrolltorow(ll_row)
	end if
else
   // [modified,1998/06/07,이인호] qa1 : 길이를 "00000"로 넣은 필드 
	WF_Update1( tab_1.tabpage_1.dw_5, 'Y' )
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cditem_m
integer x = 27
integer y = 400
integer width = 2098
integer height = 2120
integer taborder = 10
string title = "GROUPITEM"
string dataobject = "d_cditemgroup_t"
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
this.scrolltorow( row )

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

dw_4.reset()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()

dw_4.setredraw(false)
dw_4.retrieve(this.object.item_no[row])
dw_4.setredraw(true)

end event

type st_title from w_inheritance`st_title within w_cditem_m
integer x = 37
integer y = 28
integer width = 1029
integer height = 132
string text = "물품코드 관리"
end type

type st_tips from w_inheritance`st_tips within w_cditem_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditem_m
integer x = 4242
integer y = 256
integer width = 160
integer height = 116
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
integer x = 4247
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditem_m
integer x = 3863
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
integer x = 3479
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
integer x = 3287
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_4.reset()

dw_1.setfilter('')
dw_1.filter()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()

dw_1.retrieve()
if dw_1.rowcount() < 1 then return

dw_1.scrolltorow(1)

end event

type gb_3 from w_inheritance`gb_3 within w_cditem_m
integer x = 32
integer y = 224
integer width = 4434
integer height = 160
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
integer x = 2199
integer width = 2267
integer taborder = 0
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_cditem_m
integer x = 1125
integer y = 12
integer width = 119
integer height = 88
integer taborder = 110
boolean vscrollbar = false
end type

type dw_3 from datawindow within w_cditem_m
integer x = 1257
integer y = 12
integer width = 119
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_cditem_r"
boolean livescroll = true
end type

type dw_4 from datawindow within w_cditem_m
integer x = 2176
integer y = 400
integer width = 2290
integer height = 484
integer taborder = 20
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_cdqa_s"
boolean hscrollbar = true
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

is_dw = "dw_4"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type tab_1 from tab within w_cditem_m
string tag = "ㅇㅀ"
integer x = 2176
integer y = 924
integer width = 2290
integer height = 1596
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
integer width = 2254
integer height = 1468
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
integer x = 18
integer y = 4
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
integer width = 2254
integer height = 1468
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
integer x = 18
integer y = 4
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

type cb_1 from commandbutton within w_cditem_m
integer x = 2240
integer y = 52
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
integer x = 3771
integer y = 288
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
integer x = 2775
integer y = 52
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

w_cditemgroup_m.sle_value.text = sle_value.text

end event

type st_2 from statictext within w_cditem_m
integer x = 82
integer y = 228
integer width = 1312
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "표준규격: 도료 입력시 비표준 코드입력가능(한글)"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cditem_m
integer x = 73
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_cditem_m
integer x = 261
integer y = 276
integer width = 480
integer height = 632
integer taborder = 170
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

type ddlb_dwtitles from dropdownlistbox within w_cditem_m
integer x = 315
integer y = 292
integer width = 311
integer height = 88
integer taborder = 200
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

type st_5 from statictext within w_cditem_m
integer x = 777
integer y = 292
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

type sle_value from singlelineedit within w_cditem_m
integer x = 1266
integer y = 284
integer width = 567
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_cditem_m
integer x = 1847
integer y = 284
integer width = 160
integer height = 76
integer taborder = 140
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_4
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_cditem_m
integer x = 2011
integer y = 284
integer width = 160
integer height = 76
integer taborder = 150
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_4
end if
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_cditem_m
integer x = 2176
integer y = 284
integer width = 160
integer height = 76
integer taborder = 160
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_4
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_cditem_m
integer x = 2341
integer y = 284
integer width = 160
integer height = 76
integer taborder = 170
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_4
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_cditem_m
event mousemove pbm_mousemove
string tag = "파일"
integer x = 3671
integer y = 52
integer width = 187
integer height = 144
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
string powertiptext = "파일로저장시킵니다."
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

if GF_Permission('물품코드관리자', gs_userid) = 'Y' then
else
	MessageBox("확인","물품코드 관리자만 내보내기 작업을 할 수 잇습니다.")
	RETURN
end if

if is_dw = "dw_1" then
	ldw_sel = dw_1
else
	ldw_sel = dw_4
end if

if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			ldw_sel.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_vertical from u_splitbar_vertical within w_cditem_m
integer x = 2139
integer y = 400
integer height = 2120
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = this.x + this.width
st_horizontal.width = dw_4.width

end event

type st_horizontal from u_splitbar_horizontal within w_cditem_m
integer x = 2176
integer y = 900
integer width = 2290
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cditem_m
integer x = 951
integer y = 280
integer width = 306
integer height = 500
integer taborder = 60
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

