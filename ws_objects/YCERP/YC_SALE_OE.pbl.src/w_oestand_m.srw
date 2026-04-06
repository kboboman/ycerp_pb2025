$PBExportHeader$w_oestand_m.srw
$PBExportComments$일위대가관리(1998/03/11-정재수)
forward
global type w_oestand_m from w_inheritance
end type
type dw_3 from datawindow within w_oestand_m
end type
type dw_5 from datawindow within w_oestand_m
end type
type pb_1 from picturebutton within w_oestand_m
end type
type pb_2 from picturebutton within w_oestand_m
end type
type st_3 from statictext within w_oestand_m
end type
type ddlb_fld from dropdownlistbox within w_oestand_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oestand_m
end type
type st_4 from statictext within w_oestand_m
end type
type sle_value from singlelineedit within w_oestand_m
end type
type cb_1 from commandbutton within w_oestand_m
end type
type cb_2 from commandbutton within w_oestand_m
end type
type cb_3 from commandbutton within w_oestand_m
end type
type cb_5 from commandbutton within w_oestand_m
end type
type ddlb_op from dropdownlistbox within w_oestand_m
end type
type gb_4 from groupbox within w_oestand_m
end type
end forward

global type w_oestand_m from w_inheritance
integer x = 5
integer y = 172
integer width = 4357
integer height = 2652
string title = "일위대가관리(w_oestand_m)"
dw_3 dw_3
dw_5 dw_5
pb_1 pb_1
pb_2 pb_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_oestand_m w_oestand_m

type variables
st_print i_print
datawindowchild idwc_item, idwc_qa
string is_item_no
end variables

forward prototypes
public function decimal wf_price (string as_item, string as_qa)
end prototypes

public function decimal wf_price (string as_item, string as_qa);decimal lr_price

	
 SELECT  price_a INTO  :lr_price	FROM item
  WHERE item_no = :as_item
    AND qa = :as_qa;
		
return(lr_price)

	
	
end function

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_3.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_5.visible = false

dw_3.getchild("asc_item", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild("asc_qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

if GF_PERMISSION("일위대가_관리", gs_userid) = "Y" then
else
// 20060619 전체관리로변경

//	pb_insert.visible = false
//	pb_delete.visible = false
//	pb_save.visible   = false
//	dw_3.object.asc_item.TabSequence = 0
//	dw_3.object.asc_qty.TabSequence = 0
//	dw_3.object.std_cost.TabSequence = 0
//	dw_3.object.rem.TabSequence = 0
end if


end event

on w_oestand_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_5=create dw_5
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_5
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.pb_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.ddlb_op
this.Control[iCurrent+15]=this.gb_4
end on

on w_oestand_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_5)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

gb_3.width  = newwidth  - gb_3.x - gb_2.x

gb_4.width  = newwidth  - gb_4.x - gb_2.x

dw_3.width  = newwidth  - dw_3.x - gb_2.x
dw_3.height = newheight - dw_3.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_oestand_m
integer x = 3867
integer y = 56
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
datawindowchild ldwc_item, ldwc_item_name
long    ll_row
integer li_dw1row

if dw_2.rowcount() < 1 then return

if messagebox("저장","저장하시겠습니까?",information!,okcancel!,1) = 2 then
	return
end if

dw_2.accepttext()
dw_3.accepttext()

setpointer(hourglass!)
if dw_3.rowcount() > 0 then
	if wf_nullchk(dw_2) = false then
		return
	elseif wf_nullchk(dw_3) = false then
		return
	end if
else
	if wf_nullchk(dw_2) = false then return
end if
		
l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)

if wf_update2(dw_2, dw_3, "Y") = false then return

if l_status = newmodified! or l_status = DataModified! then
   li_dw1row = dw_1.getrow()
	dw_1.reset()
	dw_1.retrieve()
	dw_1.setrow(li_dw1row)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oestand_m
integer x = 32
integer y = 408
integer width = 1609
integer height = 2104
integer taborder = 70
string dataobject = "d_oestand_s"
end type

event dw_1::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

is_item_no = this.getitemstring(ll_row, "item_no")

dw_3.retrieve(is_item_no)
dw_2.retrieve(is_item_no)
dw_5.retrieve(is_item_no)

end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oestand_m
integer x = 32
integer y = 20
integer width = 1184
integer height = 132
string text = "일위대가 관리"
end type

type st_tips from w_inheritance`st_tips within w_oestand_m
end type

type pb_compute from w_inheritance`pb_compute within w_oestand_m
boolean visible = false
integer y = 48
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_oestand_m
integer x = 3598
integer y = 952
integer width = 338
integer height = 116
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중선택"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::clicked;long ll_row, ll_cnt
gs_where2 lstr_where
string ls_location

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

lstr_where.chk = 'M' //M:multi S:single
//lstr_where.chk1 = dw_2.object.loc_no[1]
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_3.insertrow(0)

	dw_3.object.item_no[ll_cnt] = dw_2.getitemstring(dw_2.getrow(), "item_no")
	dw_3.object.asc_item[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_3.object.asc_qa[ll_cnt] = trim(lstr_where.str2[ll_row])
	dw_3.object.uom[ll_cnt] = trim(lstr_where.str3[ll_row])
	dw_3.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
	
	dw_3.object.std_cost[ll_cnt] = &
		wf_price(trim(lstr_where.str1[ll_row]), trim(lstr_where.str2[ll_row]))
next
dw_3.accepttext()

dw_3.scrolltorow(1)
idwc_qa.setfilter("item_no = '" + dw_3.object.asc_item[1] + "'")
idwc_qa.filter()

dw_3.setcolumn('asc_qty')
dw_3.setfocus()


end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_oestand_m
integer x = 4059
integer y = 56
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oestand_m
integer x = 3675
integer y = 56
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_5.rowcount() < 1  then return

l_print.st_datawindow = dw_5
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 일위대가를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oestand_m
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_oestand_m
integer x = 3483
integer y = 56
integer taborder = 170
string disabledname = "c:\bmp\delete.bmp"
end type

event pb_delete::clicked;long ll_cnt
dwitemstatus l_status
string ls_item_no

if dw_2.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	


l_status = dw_2.getitemstatus(1, 0, primary!)
if l_status = new! or l_status = newmodified! then
	dw_2.reset()
	dw_3.reset()
else
	ls_item_no = dw_2.getitemstring(1, "item_no")
	select count(*) into :ll_cnt from estimate_head
	 where system_no = :ls_item_no;
	if ll_cnt > 0 then
		messagebox("확인", "이시스템 코드는 이미 견적서 작성중입니다 ~r~n" &
								+ "견적서를 삭제후 삭제가 가능합니다.")
		return
	end if
	dw_2.deleterow(1)
	
	dw_3.rowsmove(1,dw_3.rowcount(),  Primary!, dw_3, 1, Delete!)
	
	dw_2.accepttext()
	dw_3.accepttext()

	if wf_update2(dw_2, dw_3, "Y") = false then return
	dw_1.retrieve()
end if


end event

type pb_insert from w_inheritance`pb_insert within w_oestand_m
integer x = 3291
integer y = 56
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;dw_2.reset()
dw_3.reset()

dw_2.insertrow(1)
dw_2.object.make_user[1] = gs_userid
dw_2.object.make_date[1] = wf_today()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oestand_m
integer x = 3099
integer y = 56
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_oestand_m
integer x = 1669
integer y = 388
integer width = 2615
integer height = 512
integer taborder = 110
integer textsize = -8
integer weight = 400
long backcolor = 79219928
end type

type gb_2 from w_inheritance`gb_2 within w_oestand_m
integer y = 220
integer width = 4247
integer height = 168
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79219928
string text = "시스템코드"
end type

type gb_1 from w_inheritance`gb_1 within w_oestand_m
integer x = 3077
integer y = 16
integer width = 1198
integer taborder = 60
integer weight = 400
long backcolor = 79219928
end type

type dw_2 from w_inheritance`dw_2 within w_oestand_m
integer x = 1737
integer y = 472
integer width = 2496
integer height = 408
integer taborder = 80
string dataobject = "d_oestand_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_oestand_m
integer x = 1669
integer y = 1100
integer width = 2615
integer height = 1412
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_oestand_m1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long ll_row, ll_found
string ls_item_no, ls_asc_qa, ls_data, ls_item_name, ls_uom
decimal lr_qty, lr_cost, lr_amt, lr_price, lr_amount



dw_3.accepttext()
dw_2.accepttext()

ls_item_no = this.getitemstring(this.getrow(), "asc_item")
lr_qty     = this.getitemdecimal(this.getrow(), "asc_qty")
lr_cost    = this.getitemdecimal(this.getrow(), "std_cost")
ls_asc_qa  = LeftA(this.getitemstring(this.getrow(), "asc_qa"), 13)
lr_amount  = dw_2.getitemdecimal(dw_2.getrow(), "amount")

choose case dwo.name
	case 'asc_item'
		this.object.asc_qa[this.getrow()]     = ''
		this.object.asc_qty[this.getrow()]    = 0
		this.object.std_cost[this.getrow()]   = 0
		this.object.std_amount[this.getrow()] = 0
		this.object.rem[this.getrow()]        = ''
		
		this.getchild("asc_item", idwc_item)
		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data  = data
  	   ll_row   = idwc_item.RowCount()
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_item_name = idwc_item.getitemstring(idwc_item.getrow(), "item_name")
		this.object.groupitem_item_name[this.getrow()] = ls_item_name
		
		if ls_item_no <> '' then
			this.getchild("asc_qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()

			if idwc_qa.rowcount() > 0 then
				this.object.asc_qa.tabsequence = 1
				this.object.asc_qa.background.color = 1087434968
				this.setcolumn("asc_qa")
				this.setfocus()
			else
				this.object.asc_qa.tabsequence = 0
				this.object.asc_qa.background.color = 78682240
				this.setcolumn("asc_item")
				this.setfocus()
			end if
		end if
		
	case 'asc_qa'
		this.getchild("asc_qa", idwc_qa)
		gs_ds_qaall.ShareData(idwc_qa)
		
		
		ls_data = data
  	   ll_row = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row)
		
		if ll_found = 0 then
			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
				+ "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
				if gf_iteminsert(ls_item_no, ls_data) = false then return 1
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			else
				return 1
			end if
		end if

		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
		this.object.uom[this.getrow()] = ls_uom
		this.setcolumn("asc_qty")
		this.setfocus()
		
		lr_price = wf_price(ls_item_no, ls_asc_qa)
		this.object.std_cost[this.getrow()] = lr_price
		lr_amt = lr_qty * lr_price
		this.object.std_amount[this.getrow()] = lr_amt
		dw_2.object.amount[dw_2.getrow()] = lr_amount + lr_amt
		
				
	case 'asc_qty'
		lr_amt = lr_qty * lr_cost
		this.object.std_amount[this.getrow()] = lr_amt
		dw_2.object.amount[dw_2.getrow()] = lr_amount + lr_amt
		
	case 'std_cost'
		lr_amt = lr_qty * lr_cost
		this.object.std_amount[this.getrow()] = lr_amt
		dw_2.object.amount[dw_2.getrow()] = lr_amount + lr_amt
end choose		
return 0

end event

event itemerror;CHOOSE CASE dwo.name
	CASE 'asc_item'
		this.object.asc_item[this.getrow()] = ''
	CASE 'asc_qa'
		this.object.asc_qa[this.getrow()] = ''
	CASE ELSE
END CHOOSE

return 2
end event

type dw_5 from datawindow within w_oestand_m
integer x = 1490
integer y = 28
integer width = 101
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oestand_r"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_oestand_m
event mousemove pbm_mousemove
integer x = 3941
integer y = 952
integer width = 155
integer height = 116
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
string disabledname = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

event clicked;long ll_row
string ls_qa, ls_asc_qa, ls_asc_item

if dw_3.rowcount() > 0 then
	dw_3.accepttext()
	ls_asc_item = dw_3.getitemstring(dw_3.rowcount(), "asc_item")
   ls_asc_qa = dw_3.getitemstring(dw_3.rowcount(), "asc_qa")
	if isnull(ls_asc_item) or ls_asc_item = '' then
		messagebox("확인","품목을 입력하세요!",information!)
		dw_3.setfocus()
		dw_3.scrolltorow(dw_3.rowcount())
		dw_3.setcolumn("asc_item")
		return
	elseif isnull(ls_asc_qa) or ls_asc_qa = '' then
		dw_3.setfocus()
		messagebox("확인","품목규격을 입력하세요!",information!)
		dw_3.scrolltorow(dw_3.rowcount())
		dw_3.setcolumn("asc_qa")
		return
	end if
end if	

if dw_2.rowcount() > 0 then
	ll_row = dw_3.insertrow(0)
	dw_3.scrolltorow(ll_row)
	dw_3.object.item_no[ll_row] = dw_2.getitemstring(1, "item_no")

//	dw_3.object.item_no[dw_3.getrow()] = is_item_no
//	dw_3.object.qa[dw_3.getrow()] = is_qa
end if
	
end event

type pb_2 from picturebutton within w_oestand_m
event mousemove pbm_mousemove
integer x = 4101
integer y = 952
integer width = 155
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)

end event

event clicked;decimal lr_amt, lr_cost

if dw_3.rowcount() < 1 then
	return
end if

dw_2.accepttext()
dw_3.accepttext()
lr_amt = dw_2.getitemdecimal(1, "amount")
lr_cost = dw_3.getitemdecimal(dw_3.getrow(), "std_amount")

dw_2.object.amount[1] = lr_amt - lr_cost
dw_3.deleterow(dw_3.getrow())

dw_3.accepttext()


end event

type st_3 from statictext within w_oestand_m
integer x = 50
integer y = 288
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

type ddlb_fld from dropdownlistbox within w_oestand_m
integer x = 238
integer y = 276
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_oestand_m
integer x = 270
integer y = 292
integer width = 311
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

type st_4 from statictext within w_oestand_m
integer x = 709
integer y = 288
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

type sle_value from singlelineedit within w_oestand_m
integer x = 1189
integer y = 280
integer width = 567
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

type cb_1 from commandbutton within w_oestand_m
integer x = 1769
integer y = 280
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oestand_m
integer x = 1934
integer y = 280
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

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

arg_dw  = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oestand_m
integer x = 2098
integer y = 280
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oestand_m
integer x = 2263
integer y = 280
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_oestand_m
integer x = 878
integer y = 276
integer width = 302
integer height = 500
integer taborder = 130
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

type gb_4 from groupbox within w_oestand_m
integer x = 1669
integer y = 908
integer width = 2615
integer height = 180
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79219928
end type

