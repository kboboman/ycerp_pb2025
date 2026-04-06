$PBExportHeader$w_ippurchasecoilsheet_m.srw
$PBExportComments$건설사관리
forward
global type w_ippurchasecoilsheet_m from w_inheritance
end type
type cb_3 from commandbutton within w_ippurchasecoilsheet_m
end type
type em_1 from editmask within w_ippurchasecoilsheet_m
end type
type em_2 from editmask within w_ippurchasecoilsheet_m
end type
type em_3 from editmask within w_ippurchasecoilsheet_m
end type
type em_4 from editmask within w_ippurchasecoilsheet_m
end type
type st_3 from statictext within w_ippurchasecoilsheet_m
end type
type ddlb_fld from dropdownlistbox within w_ippurchasecoilsheet_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ippurchasecoilsheet_m
end type
type st_4 from statictext within w_ippurchasecoilsheet_m
end type
type ddlb_op from dropdownlistbox within w_ippurchasecoilsheet_m
end type
type sle_value from singlelineedit within w_ippurchasecoilsheet_m
end type
type cb_1 from commandbutton within w_ippurchasecoilsheet_m
end type
type cb_2 from commandbutton within w_ippurchasecoilsheet_m
end type
type cb_4 from commandbutton within w_ippurchasecoilsheet_m
end type
type cb_5 from commandbutton within w_ippurchasecoilsheet_m
end type
type dw_5 from datawindow within w_ippurchasecoilsheet_m
end type
type pb_1 from picturebutton within w_ippurchasecoilsheet_m
end type
type rb_1 from radiobutton within w_ippurchasecoilsheet_m
end type
type rb_2 from radiobutton within w_ippurchasecoilsheet_m
end type
type rb_3 from radiobutton within w_ippurchasecoilsheet_m
end type
type cbx_4 from checkbox within w_ippurchasecoilsheet_m
end type
type gb_4 from groupbox within w_ippurchasecoilsheet_m
end type
type dw_3 from datawindow within w_ippurchasecoilsheet_m
end type
type st_horizontal from u_splitbar_horizontal within w_ippurchasecoilsheet_m
end type
type st_vertical1 from u_splitbar_vertical within w_ippurchasecoilsheet_m
end type
type st_vertical2 from u_splitbar_vertical within w_ippurchasecoilsheet_m
end type
type st_vertical3 from u_splitbar_vertical within w_ippurchasecoilsheet_m
end type
type pb_2 from picturebutton within w_ippurchasecoilsheet_m
end type
type st_1 from statictext within w_ippurchasecoilsheet_m
end type
type cb_6 from commandbutton within w_ippurchasecoilsheet_m
end type
type dw_6 from datawindow within w_ippurchasecoilsheet_m
end type
type dw_7 from datawindow within w_ippurchasecoilsheet_m
end type
type st_horizontal1 from u_splitbar_horizontal within w_ippurchasecoilsheet_m
end type
type st_vertical4 from u_splitbar_vertical within w_ippurchasecoilsheet_m
end type
type st_2 from statictext within w_ippurchasecoilsheet_m
end type
type dw_8 from datawindow within w_ippurchasecoilsheet_m
end type
type cb_7 from commandbutton within w_ippurchasecoilsheet_m
end type
type dw_9 from datawindow within w_ippurchasecoilsheet_m
end type
type st_6 from statictext within w_ippurchasecoilsheet_m
end type
type em_5 from editmask within w_ippurchasecoilsheet_m
end type
type dw_4 from datawindow within w_ippurchasecoilsheet_m
end type
end forward

global type w_ippurchasecoilsheet_m from w_inheritance
integer width = 7717
integer height = 2924
string title = "코일/시트발주 관리(w_ippurchasecoilsheet_m)"
cb_3 cb_3
em_1 em_1
em_2 em_2
em_3 em_3
em_4 em_4
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_5 cb_5
dw_5 dw_5
pb_1 pb_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cbx_4 cbx_4
gb_4 gb_4
dw_3 dw_3
st_horizontal st_horizontal
st_vertical1 st_vertical1
st_vertical2 st_vertical2
st_vertical3 st_vertical3
pb_2 pb_2
st_1 st_1
cb_6 cb_6
dw_6 dw_6
dw_7 dw_7
st_horizontal1 st_horizontal1
st_vertical4 st_vertical4
st_2 st_2
dw_8 dw_8
cb_7 cb_7
dw_9 dw_9
st_6 st_6
em_5 em_5
dw_4 dw_4
end type
global w_ippurchasecoilsheet_m w_ippurchasecoilsheet_m

type variables
datawindowchild idwc_item, idwc_qa, idwc_loc
datawindowchild idwc_item1,idwc_qa1, idwc_loc1
long i_dw1_width
string is_dw = 'dw_2', is_select, is_team = '', is_tel = '070-7711-2168', is_fax = '031-498-7871', is_seq1

end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
public function boolean wf_itemselect (datawindow arg_dw, string arg_ms, any ai_row, integer ai_flag)
end prototypes

public subroutine wf_print (datawindow arg_dw);//
datetime ld_date
dec    ld_amount
long   ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt
string ls_orderno, ls_cust_name, ls_scene_name, ls_cust_no, ls_null, ls_username
string ls_itemno, ls_item_name, ls_qa, ls_qty, ls_bigo, ls_cnt
int    li_seq_no

debugbreak()

ll_line    = 0
ll_pagecnt = 0

ls_username = gs_username
ll_line_cnt = 10
ll_pagetot  = dw_5.rowcount()
if mod(dw_5.rowcount(), ll_line_cnt) > 0 then
	ll_pagetot = (dw_5.rowcount() / ll_line_cnt) + 1
else
	ll_pagetot = (dw_5.rowcount() / ll_line_cnt)
end if

for ll_row = 1 to dw_5.rowcount()
	if dw_5.object.order_no[ll_row] = "" then continue
	
	if ll_line = 0 then
		ls_orderno    = dw_5.object.order_no[ll_row]
		ls_cust_name  = dw_5.object.cust_name[ll_row]
		ls_scene_name = dw_5.object.scene_desc[ll_row]
		
		arg_dw.object.order_no[1]   = ls_orderno
		arg_dw.object.barcode1[1]   = "*" + trim(ls_orderno) + "*"
		arg_dw.object.barcode2[1]   = "*" + trim(ls_orderno) + "*"
		arg_dw.object.cust_name[1]  = ls_cust_name
		arg_dw.object.scene_name[1] = ls_scene_name
		arg_dw.object.pagecnt[1]    = string(ll_pagecnt + 1) + " / " + string(ll_pagetot)
	end if
	
	ls_item_name = dw_5.object.item_name[ll_row]
	ls_qa        = dw_5.object.com_qa[ll_row]
	ls_qty       = string(dw_5.object.chulgo_qty[ll_row], '###,###,##0')
   ls_bigo      = dw_5.object.rem[ll_row]

	
	ll_line    = ll_line + 1
	arg_dw.setitem(1, 'item_name' + string(ll_line,"00"), ls_item_name)
	arg_dw.setitem(1, 'qa'        + string(ll_line,"00"), ls_qa)
	arg_dw.setitem(1, 'qty'       + string(ll_line,"00"), ls_qty)
	arg_dw.setitem(1, 'bigo'      + string(ll_line,"00"), ls_bigo)

	if ll_line = ll_line_cnt then 	// LABEL지 10줄
		ll_line    = 0
		ll_pagecnt = ll_pagecnt + 1
		arg_dw.print()
		arg_dw.reset()
		arg_dw.insertrow(0)
	end if
next

end subroutine

public function boolean wf_itemselect (datawindow arg_dw, string arg_ms, any ai_row, integer ai_flag);//
gs_where2 lstr_where
long ll_row, ll_cnt, ll_row1
string ls_order_no

arg_dw.accepttext()

lstr_where.chk = arg_ms //'M' //M:multi S:single
ll_row1 = arg_dw.rowcount()+1

ls_order_no = dw_2.object.order_coilsheet_order_no[1]
	
if isnull(ls_order_no) then
	return false
end if
	
//if arg_ms = 'S' then
//	if arg_dw = dw3 or ai_flag = 8 then
//		lstr_where.str1[1] = arg_dw.object.item_no[ai_row]
//		lstr_where.str2[1] = arg_dw.object.qa[ai_row]
//	elseif arg_dw = dw4 then
//		lstr_where.chk1 = tab_1.tabpage_2.dw_loc.object.loc_no[1]
//		lstr_where.str1[1] = arg_dw.object.component[ai_row]
//		lstr_where.str2[1] = arg_dw.object.component_qa[ai_row]
//	else
//		lstr_where.chk1 = arg_dw.object.issue_loc[ai_row]
//		lstr_where.str1[1] = arg_dw.object.assy_item[ai_row]
//		lstr_where.str2[1] = arg_dw.object.assy_qa[ai_row]
//	end if
//end if
//

lstr_where.chk1 = 'WS00000000'

openwithparm(w_whitemlocqohmulti_w,lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return false

string ls_supp
dec {3} ld_cost
date ld_date
long ll,kk

ll = UpperBound(lstr_where.str1)
kk = UpperBound(lstr_where.str2)
arg_dw.SETREDRAW(FALSE)

ll = arg_dw.rowcount()

for ll_row = 1 to UpperBound(lstr_where.str1)	
	
	if arg_ms = 'M' then
		ll_cnt = arg_dw.insertrow(0)
	else
		ll_row1 = ai_row
		ll_cnt  = ai_row
	end if
	
	arg_dw.object.item_no[ll_cnt] = lstr_where.str1[ll_row]
	arg_dw.object.qa[ll_cnt]      = lstr_where.str2[ll_row]
	
	choose case lstr_where.str3[ll_row]
		case 'M', 'M2'
			arg_dw.object.uom[ll_cnt] = 'EA'
		case else
			arg_dw.object.uom[ll_cnt] = lstr_where.str3[ll_row]
	end choose		

	arg_dw.object.item_name[ll_cnt] = lstr_where.name[ll_row]

			
	if is_dw = 'dw_3' then
		arg_dw.object.round[ll_cnt] = 0
		arg_dw.object.result_type[ll_cnt] = 'N'	
		arg_dw.object.order_no[ll_cnt] = ls_order_no	
		arg_dw.object.order_seq[ll_cnt] = trim(string(ll_cnt,'00'))
		
	elseif is_dw = 'dw_4' then
		arg_dw.object.round[ll_cnt] = 1
		arg_dw.object.result_type[ll_cnt] = 'N'	
		arg_dw.object.order_no[ll_cnt] = ls_order_no	
/*		arg_dw.object.order_seq[ll_cnt] = left(dw_3.object.order_seq[arg_dw.getrow()],2)+trim(string(ll_cnt,'00'))+'00' */
		arg_dw.object.order_seq[ll_cnt] = trim(string(ll_cnt,'00'))
	elseif is_dw = 'dw_5' then	
		arg_dw.object.round[ll_cnt] = 2	
		arg_dw.object.result_type[ll_cnt] = 'N'	
		arg_dw.object.order_no[ll_cnt] = ls_order_no
/*		arg_dw.object.order_seq[ll_cnt] = left(dw_4.object.order_seq[arg_dw.getrow()],4)+trim(string(ll_cnt,'00'))		*/
		arg_dw.object.order_seq[ll_cnt] = trim(string(ll_cnt,'00'))
	end if	

next

dw_2.accepttext()
arg_dw.setfocus()
arg_dw.accepttext()
arg_dw.scrolltorow(ll_row1)

arg_dw.SETREDRAW(TRUE)

return true

end function

on w_ippurchasecoilsheet_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.em_1=create em_1
this.em_2=create em_2
this.em_3=create em_3
this.em_4=create em_4
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_5=create dw_5
this.pb_1=create pb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cbx_4=create cbx_4
this.gb_4=create gb_4
this.dw_3=create dw_3
this.st_horizontal=create st_horizontal
this.st_vertical1=create st_vertical1
this.st_vertical2=create st_vertical2
this.st_vertical3=create st_vertical3
this.pb_2=create pb_2
this.st_1=create st_1
this.cb_6=create cb_6
this.dw_6=create dw_6
this.dw_7=create dw_7
this.st_horizontal1=create st_horizontal1
this.st_vertical4=create st_vertical4
this.st_2=create st_2
this.dw_8=create dw_8
this.cb_7=create cb_7
this.dw_9=create dw_9
this.st_6=create st_6
this.em_5=create em_5
this.dw_4=create dw_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.em_3
this.Control[iCurrent+5]=this.em_4
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.dw_5
this.Control[iCurrent+17]=this.pb_1
this.Control[iCurrent+18]=this.rb_1
this.Control[iCurrent+19]=this.rb_2
this.Control[iCurrent+20]=this.rb_3
this.Control[iCurrent+21]=this.cbx_4
this.Control[iCurrent+22]=this.gb_4
this.Control[iCurrent+23]=this.dw_3
this.Control[iCurrent+24]=this.st_horizontal
this.Control[iCurrent+25]=this.st_vertical1
this.Control[iCurrent+26]=this.st_vertical2
this.Control[iCurrent+27]=this.st_vertical3
this.Control[iCurrent+28]=this.pb_2
this.Control[iCurrent+29]=this.st_1
this.Control[iCurrent+30]=this.cb_6
this.Control[iCurrent+31]=this.dw_6
this.Control[iCurrent+32]=this.dw_7
this.Control[iCurrent+33]=this.st_horizontal1
this.Control[iCurrent+34]=this.st_vertical4
this.Control[iCurrent+35]=this.st_2
this.Control[iCurrent+36]=this.dw_8
this.Control[iCurrent+37]=this.cb_7
this.Control[iCurrent+38]=this.dw_9
this.Control[iCurrent+39]=this.st_6
this.Control[iCurrent+40]=this.em_5
this.Control[iCurrent+41]=this.dw_4
end on

on w_ippurchasecoilsheet_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.em_3)
destroy(this.em_4)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_5)
destroy(this.pb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cbx_4)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.st_horizontal)
destroy(this.st_vertical1)
destroy(this.st_vertical2)
destroy(this.st_vertical3)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.cb_6)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.st_horizontal1)
destroy(this.st_vertical4)
destroy(this.st_2)
destroy(this.dw_8)
destroy(this.cb_7)
destroy(this.dw_9)
destroy(this.st_6)
destroy(this.em_5)
destroy(this.dw_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if GF_Permission("코일/시트발주관리", GS_userid) = "Y" then

end if

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
//========================================================//
//ddlb_fld2.reset()
//ddlb_dwtitles2.reset()
//ddlb_dwtitles2.visible = false

//GF_DWTitle2ddlb( dw_3, ddlb_fld2, ddlb_dwtitles2 )
//========================================================//

st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_bottomobject(dw_4)
st_horizontal.of_set_bottomobject(dw_5)
st_horizontal.of_set_minsize(250, 250)

st_horizontal1.of_set_topobject(dw_4)
st_horizontal1.of_set_topobject(dw_5)
st_horizontal1.of_set_bottomobject(dw_6)
st_horizontal1.of_set_bottomobject(dw_7)
st_horizontal1.of_set_minsize(250, 250)


st_vertical1.of_set_leftobject(dw_1)
st_vertical1.of_set_rightobject(dw_2)
st_vertical1.of_set_rightobject(dw_3)
st_vertical1.of_set_minsize(250, 250)

st_vertical2.of_set_leftobject(dw_3)
st_vertical2.of_set_rightobject(dw_4)
st_vertical2.of_set_minsize(250, 250)

st_vertical3.of_set_leftobject(dw_4)
st_vertical3.of_set_rightobject(dw_5)
st_vertical3.of_set_minsize(250, 250)

st_vertical4.of_set_leftobject(dw_6)
st_vertical4.of_set_rightobject(dw_7)
st_vertical4.of_set_minsize(250, 250)

//pb_1.visible = false
//pb_1.enabled = false		// 행추가
//pb_2.enabled = false		// 행삭제

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)
dw_7.SetTransObject(SQLCA)
dw_8.SetTransObject(SQLCA)
dw_9.SetTransObject(SQLCA) /*행복사용 2019.01.12 jowonsuk */

dw_3.getchild('item_no',idwc_item)
GS_DS_ItemAll.ShareData(idwc_item)

idwc_item.setfilter(' not (item_no > "PZZZ") ')
idwc_item.filter()


idwc_item.setsort(' item_name asc ')
idwc_item.sort()


dw_3.getchild('qa',idwc_qa)
idwc_qa.insertrow(1)
idwc_qa.SetTransObject(SQLCA)
is_select = idwc_qa.Describe("DataWindow.Table.Select")
gs_ds_qaall.ShareData(idwc_qa)


dw_4.getchild('item_no',idwc_item)
GS_DS_ItemAll.ShareData(idwc_item)

idwc_item.setfilter(' not (item_no > "PZZZ") ')
idwc_item.filter()


idwc_item.setsort(' item_name asc ')
idwc_item.sort()


dw_4.getchild('qa',idwc_qa)
idwc_qa.insertrow(1)
idwc_qa.SetTransObject(SQLCA)
is_select = idwc_qa.Describe("DataWindow.Table.Select")
gs_ds_qaall.ShareData(idwc_qa)


dw_5.getchild('item_no',idwc_item1)
GS_DS_ItemAll.ShareData(idwc_item1)

idwc_item1.setfilter(' not (item_no > "PZZZ") ')
idwc_item1.filter()


idwc_item1.setsort(' item_name asc ')
idwc_item1.sort()


dw_5.getchild('qa',idwc_qa1)
idwc_qa1.insertrow(1)
idwc_qa1.SetTransObject(SQLCA)
is_select = idwc_qa1.Describe("DataWindow.Table.Select")
gs_ds_qaall.ShareData(idwc_qa1)


string ls_date

ls_date = gf_today2s() 

//em_1.text = left(ls_date,4) +'/' + mid(ls_date,5,2) + '/' + right(ls_date,2)
em_1.text = LeftA(ls_date,4) +'/' + MidA(ls_date,5,2) + '/' + '01'
em_2.text = LeftA(ls_date,4) +'/' + MidA(ls_date,5,2) + '/' + RightA(ls_date,2)

//pb_retrieve.triggerevent( clicked! )

dw_2.InsertRow(0)

dw_2.object.order_coilsheet_order_date[1]    = gf_today2s()
dw_2.object.order_coilsheet_buyer[1]    = is_team + gs_username


end event

event resize;call super::resize;
dw_4.height = newheight - dw_4.y - dw_1.height

gb_4.width = newwidth - 50
dw_1.height = newheight - gb_4.height - gb_3.height - 50

dw_3.height = dw_1.height - dw_2.height - 20
dw_4.height = dw_3.height / 2
dw_5.height = dw_3.height / 2
st_horizontal1.y = dw_4.y + dw_4.height 
dw_6.y = dw_4.y + dw_4.height + st_horizontal1.height
dw_7.y = dw_5.y + dw_5.height + st_horizontal1.height
dw_6.height = dw_4.height - 25
dw_7.height = dw_5.height - 25

dw_2.width = newwidth - dw_1.width
dw_5.width =  newwidth - dw_1.width - dw_3.width - dw_4.width - 90
dw_7.width =  newwidth - dw_1.width - dw_3.width - dw_4.width - 90

st_vertical1.height = dw_1.height
st_vertical2.height = dw_3.height
st_vertical3.height = dw_5.height
st_vertical4.height = dw_5.height
st_horizontal.width = dw_2.width

st_horizontal1.width = newwidth - dw_1.width - dw_3.width - st_vertical2.width - st_vertical3.width


end event

type pb_save from w_inheritance`pb_save within w_ippurchasecoilsheet_m
integer x = 4338
integer y = 72
integer taborder = 290
end type

event pb_save::clicked;call super::clicked;dwItemStatus l_status
string ls_order_date, ls_order_no
long   ll_count, l_order_no

dw_2.AcceptText()
dw_3.AcceptText()
dw_4.AcceptText()
dw_5.AcceptText()
dw_6.AcceptText()
dw_7.AcceptText()

debugbreak()

setpointer(hourglass!)

dw_2.AcceptText()

l_status = dw_2.GetItemStatus(1, 0, Primary!)

if l_status = NewModified! then
	
	IF isnull(dw_2.object.order_coilsheet_supp_no[1]) OR dw_2.object.order_coilsheet_supp_no[1] <= "" THEN
		messagebox("입력오류", "구매처는 필수 입력사항입니다.")
		return
	END IF
	
	IF isnull(dw_2.object.order_coilsheet_order_date[1]) OR dw_2.object.order_coilsheet_order_date[1] <= "" THEN
		messagebox("입력오류", "발주일자는 필수 입력사항입니다.")
		return
	END IF
	
//	IF isnull(dw_2.object.order_coilsheet_fob[1]) OR dw_2.object.order_coilsheet_fob[1] <= "" THEN
//		messagebox("입력오류", "결재방법은 필수 입력사항입니다.")
//		return
//	END IF
	
	IF isnull(dw_2.object.order_coilsheet_buyer[1]) OR dw_2.object.order_coilsheet_buyer[1] <= "" THEN
		messagebox("입력오류", "구매자는 필수 입력사항입니다.")
		return
	END IF
	
//	IF isnull(dw_2.object.order_coilsheet_curr_code[1]) OR dw_2.object.order_coilsheet_curr_code[1] <= "" THEN
//		messagebox("입력오류", "통화코드는 필수 입력사항입니다.")
//		return
//	END IF


	ls_order_date = dw_2.object.order_coilsheet_order_date[1]
	
	select isnull(max(substring(order_no,9,4)),0) + 1	
	into :l_order_no
	from order_coilsheet
	where order_no like :ls_order_date+'%';
	
	ls_order_no = ls_order_date+trim(string(l_order_no, '0000'))
	
	dw_2.object.order_coilsheet_order_no[1] = ls_order_no	
	dw_2.object.order_coilsheet_open_close[1]   = 'O'
	dw_2.object.order_coilsheet_subcon[1]   = 'O'
	
	if isnull(dw_2.object.order_coilsheet_modify_date[1]) then
   		dw_2.object.order_coilsheet_modify_date[1] = trim(gf_today2s())
	end if
	
	if isnull(dw_2.object.order_coilsheet_modify_user_id[1]) then
   		dw_2.object.order_coilsheet_modify_user_id[1] = gs_userid
	end if			
	
end if


if l_status = DataModified! then
   		dw_2.object.order_coilsheet_modify_date[1] = trim(gf_today2s())
   		dw_2.object.order_coilsheet_modify_user_id[1] = gs_userid
end if


FOR ll_count = 1 TO dw_3.rowcount()
	
	l_status = dw_3.GetItemStatus(ll_count, 0, Primary!)
	
	if l_status = NewModified! then
		
//		IF isnull(dw_3.object.coilsheet_no[ll_count]) OR dw_3.object.coilsheet_no[ll_count] <= "" THEN
//			messagebox("입력오류", "작업대상코일번호는 필수 입력사항입니다.")
//			return
//		END IF		
		
		dw_3.object.order_no[ll_count] = dw_2.object.order_coilsheet_order_no[1]
		dw_3.object.round[ll_count]       = 0
		
	end if
	
//	if l_status = NewModified! or l_status = DataModified! then	
//		dw_3.object.write_date[ll_count] = trim(gf_today2s())
//		dw_3.object.write_user_id[ll_count] = gs_userid
//	end if	
	
 NEXT
 
 FOR ll_count = 1 TO dw_4.rowcount()
	
	l_status = dw_4.GetItemStatus(ll_count, 0, Primary!)
	
	if l_status = NewModified! then
		
		
		IF isnull(dw_4.object.item_no[ll_count]) OR dw_4.object.item_no[ll_count] <= "" THEN
			messagebox("입력오류", "1차품목코드는 필수 입력사항입니다.")
			return
		END IF		
		
		IF isnull(dw_4.object.cnt[ll_count]) OR dw_4.object.cnt[ll_count] = 0 THEN
			messagebox("입력오류", "갯수는 필수 입력사항입니다.")
			return
		END IF						
		
		dw_4.object.order_no[ll_count] = dw_2.object.order_coilsheet_order_no[1]
		dw_4.object.round[ll_count]       = 1
		
	end if

	
 NEXT
 
 FOR ll_count = 1 TO dw_5.rowcount()
	
	l_status = dw_5.GetItemStatus(ll_count, 0, Primary!)
	
	if l_status = NewModified! then
		
		IF isnull(dw_5.object.item_no[ll_count]) OR dw_5.object.item_no[ll_count] <= "" THEN
			messagebox("입력오류", "2차품목코드는 필수 입력사항입니다.")
			return
		END IF		
		
		IF isnull(dw_5.object.cnt[ll_count]) OR dw_5.object.cnt[ll_count] = 0 THEN
			messagebox("입력오류", "갯수는 필수 입력사항입니다.")
			return
		END IF								
		
		dw_5.object.order_no[ll_count] = dw_2.object.order_coilsheet_order_no[1]
		dw_5.object.round[ll_count]       = 2
		
	end if
		
 NEXT


if wf_update4( dw_2, dw_3, dw_4, dw_5, "N" ) = false then
	RETURN
else
	//pb_retrieve.triggerevent( clicked! )
			
end if


if wf_update2( dw_6, dw_7,  "N" ) = false then
	RETURN
else
	  
	  ls_order_no = dw_2.object.order_coilsheet_order_no[1]
	  
        update order_coilsheet_det 
              set result_type = B.check_result_type
              from order_coilsheet_det  A inner JOIN (
                                                                                          SELECT   a.order_no 
                                                                                               , a.round
                                                                                               , a.order_seq
                                                                                               , a.result_type /*N: 미입고, H: 부분 E: 완료 */
                                                                                               , a.cnt
                                                                                               , isnull(b.cnt,0) check_cnt
                                                                                               , case when a.cnt -  isnull(b.cnt,0) =   a.cnt then 'N'
                                                                                                          when a.cnt -  isnull(b.cnt,0) > 0  then 'H'
                                                                                                          when a.cnt -  isnull(b.cnt,0) <= 0  then 'E'
                                                                                                end check_result_type 
                                                                              FROM order_coilsheet_det a left outer join  (
                                                                                                                                                              SELECT    order_coilsheet_check_det.order_no order_no
                                                                                                                                                                             , order_coilsheet_check_det.round
                                                                                                                                                                             , order_coilsheet_check_det.order_seq
                                                                                                                                                                             , sum( order_coilsheet_check_det.cnt) cnt
                                                                                                                                                                FROM order_coilsheet_check_det
                                                                                                                                                               WHERE ( order_coilsheet_check_det.order_no = :ls_order_no )
                                                                                                                                                               group by   order_coilsheet_check_det.order_no 
                                                                                                                                                                               , order_coilsheet_check_det.round
                                                                                                                                                                               , order_coilsheet_check_det.order_seq
                                                                                                                                                           ) b  on a.order_no = b.order_no and a.round = b.round and a.order_seq = b.order_seq
                                                                             WHERE ( a.order_no = :ls_order_no ) 
                                                                                  and   ( a.round in ('1','2') )
                                                                            )  B 
              ON  a.order_no = b.order_no and a.round = b.round and a.order_seq = b.order_seq;
				  
	messagebox('알림', '저장되었습니다.')
	
	
	//pb_retrieve.triggerevent( clicked! )
	
end if



end event

type dw_1 from w_inheritance`dw_1 within w_ippurchasecoilsheet_m
integer x = 37
integer y = 436
integer width = 2007
integer height = 2044
integer taborder = 10
string dataobject = "d_ippurchasecoilsheet_r"
boolean hscrollbar = false
boolean hsplitscroll = true
boolean livescroll = false
end type

event dw_1::clicked;call super::clicked;string ls_order_no

is_dw = 'dw_1'
st_2.text = '발주리스트'

if row = 0 then return

dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()

this.SetRedraw(FALSE)

debugbreak()

GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if (dw_1.rowcount() < 1 ) then RETURN

ls_order_no   = dw_1.object.order_no[row]

if isnull(ls_order_no) or ls_order_no = "" then
else		
	
		dw_5.reset()
		dw_6.reset()
		dw_7.reset()

		dw_2.Retrieve( ls_order_no )
		dw_3.Retrieve( ls_order_no )		
		dw_4.Retrieve( ls_order_no, '%' )
		dw_5.Retrieve( ls_order_no, '%' )		
end if

this.SetRedraw(TRUE)
end event

type st_title from w_inheritance`st_title within w_ippurchasecoilsheet_m
integer x = 46
integer width = 1298
string text = "코일/시트 발주 관리"
end type

type st_tips from w_inheritance`st_tips within w_ippurchasecoilsheet_m
end type

type pb_compute from w_inheritance`pb_compute within w_ippurchasecoilsheet_m
boolean visible = false
integer taborder = 330
end type

type pb_print_part from w_inheritance`pb_print_part within w_ippurchasecoilsheet_m
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_ippurchasecoilsheet_m
integer x = 4530
integer y = 72
integer taborder = 300
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurchasecoilsheet_m
integer x = 4146
integer y = 72
integer taborder = 280
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print   l_print
string     ls_order_no, ls_buyer, ls_rem, ls_limit_date, ls_supp_name, ls_supply_addr
string     ls_tel = '070-7711-2168'
long       l_row, ll_row, l_st_row = 20


// sale_order_no 수주번호
// ask_no        요청번호
ls_order_no = dw_2.object.order_coilsheet_order_no[1]

l_row = 0


select isnull(order_coilsheet.rem,''), isnull(order_coilsheet.buyer,''), isnull(order_coilsheet.supply_tel,''), order_coilsheet.limit_date, supp.supp_name, order_coilsheet.supply_addr
  into :ls_rem, :ls_buyer, :ls_tel, :ls_limit_date, :ls_supp_name, :ls_supply_addr
from  order_coilsheet inner join supp on order_coilsheet.supp_no = supp.supp_no
where  order_coilsheet.order_no = :ls_order_no;

ls_buyer = '연락처 : (주)유창 구매팀 ' + ls_buyer + '    TEL : ' + ls_tel + '    FAX : ' + is_fax

//ll_row = dw_8.retrieve(ls_order_no, l_row, ls_rem, ls_buyer)

//l_row = l_st_row - ll_row

l_row = l_st_row

dw_8.retrieve(ls_order_no, l_row, ls_rem, ls_buyer, ls_limit_date, ls_supp_name, ls_supply_addr)


for ll_row = 1 to dw_3.rowcount()
	dw_8.object.c_coil_item_name[ll_row] = dw_3.object.item_name[ll_row]
	dw_8.object.c_coil_qa[ll_row] = dw_3.object.coil_qa[ll_row]
	dw_8.object.c_uom[ll_row] = dw_3.object.uom[ll_row]	
	dw_8.object.c_qty[ll_row] = dw_3.object.qty[ll_row]			
next 


for ll_row = 1 to dw_4.rowcount()
	dw_8.object.d_item_name1[ll_row] = dw_4.object.item_name[ll_row]
	dw_8.object.d_qa1[ll_row] = dw_4.object.qa[ll_row]
	dw_8.object.d_cnt1[ll_row] = dw_4.object.cnt[ll_row]	
next 


for ll_row = 1 to dw_5.rowcount()
	dw_8.object.e_item_name2[ll_row] = dw_5.object.item_name[ll_row]
	dw_8.object.e_qa2[ll_row] = dw_5.object.qa[ll_row]
	dw_8.object.e_cnt2[ll_row] = dw_5.object.cnt[ll_row]	
next 

debugbreak()
if dw_8.rowcount() < 1 then 
	MessageBox("확인","해당하는 내용이 없습니다.")
end if

	l_print.st_datawindow  = dw_8
	l_print.st_print_sheet = " 프린트용지 : A4"
	gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95"

	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

//if cbx_4.checked = true then		// A4 출력
//	l_print.st_datawindow  = dw_6
//	l_print.st_print_sheet = " 프린트용지 : A4"
//	gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"
//	
//	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
//else
//	PrintSetup()
//	dw_7.dataobject = "d_label_main_prt"
//	dw_7.Modify('DataWindow.Print.Paper.Size=9 DataWindow.Print.Orientation=1 Datawindow.Zoom=100')
//	dw_7.settransobject(sqlca)
//	
//	dw_7.Reset()
//	dw_7.InsertRow(0)
//	wf_print( dw_3 )
//	
//	ls_orderno = dw_7.object.order_no[1]
//	if isnull(ls_orderno) or ls_orderno = "" then
//		// 10, 20... 페이지 공난출력 방지
//	else
//		dw_7.print()
//	end if
//end if


end event

type pb_cancel from w_inheritance`pb_cancel within w_ippurchasecoilsheet_m
integer x = 3954
integer y = 72
integer taborder = 380
end type

event pb_cancel::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"취소",parent, li_x, li_y)

end event

event pb_cancel::clicked;call super::clicked;// 
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()

dw_2.insertrow(0)
end event

type pb_delete from w_inheritance`pb_delete within w_ippurchasecoilsheet_m
integer x = 3762
integer y = 72
integer taborder = 390
end type

event pb_delete::clicked;call super::clicked;// 삭제
string ls_order_no
long   ll_row, ll_dw1row

//if MessageBox("확인", "제품상차 내역을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN

//dw_3.setredraw( false )
//for ll_row = dw_3.rowcount() TO 1 step -1
//	dw_3.deleterow(ll_row)
//next
//dw_3.setredraw( true )
//
//ll_dw1row = dw_1.getrow()
//dw_2.deleterow( 1 )
//if wf_update2( dw_2, dw_3, "Y") = true then
//else
//	MessageBox("삭제","제품상차 내역 삭제시 오류가 발생했습니다.", exclamation!)
//end if


if is_dw = 'dw_2' then
	
	if MessageBox("확인", "발주내역을  삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN
	
	ls_order_no = dw_2.object.order_coilsheet_order_no[1]
	
	if isnull(ls_order_no) or ls_order_no  = '' then return
	
	ll_row = 0
	
	select count(*)
	   into :ll_row
	from order_coilsheet_check_det
	where order_no = :ls_order_no;
	
	if ll_row > 0 then 
		messagebox('알림', '입고내역이 있어서 삭제가 불가합니다.')
		return
	end if

	for ll_row = dw_3.rowcount() TO 1 step -1
		dw_3.deleterow(ll_row)
	next
	
	for ll_row = dw_4.rowcount() TO 1 step -1
		dw_4.deleterow(ll_row)
	next	
	
	for ll_row = dw_5.rowcount() TO 1 step -1
		dw_5.deleterow(ll_row)
	next	
	
	dw_2.deleterow(1)
	 
end if

if wf_update4( dw_2, dw_3,  dw_4,  dw_5, "Y") = true then
else
	MessageBox("삭제","발주내역 삭제시 오류가 발생했습니다.", exclamation!)
end if

pb_retrieve.triggerevent( clicked! )



end event

type pb_insert from w_inheritance`pb_insert within w_ippurchasecoilsheet_m
integer x = 3570
integer y = 72
integer taborder = 400
end type

event pb_insert::clicked;call super::clicked;//
string ls_custno, ls_custname, ls_sceneno, ls_scenename
long   ll_row, ll_totchk

//ll_totchk = dw_1.object.totchk[1]
//if ll_totchk < 1 then 
//	MessageBox("확인", "출고요청, 물품이동 항목을 선택 후 작업하시기 바랍니다.")
//	RETURN
//end if

//ls_custno    = dw_1.object.cust_no[dw_1.getrow()]
//ls_custname  = dw_1.object.cust_name[dw_1.getrow()]
//ls_sceneno   = dw_1.object.scene_code[dw_1.getrow()]
//ls_scenename = dw_1.object.scene_desc[dw_1.getrow()]

//dw_3.reset()
//dw_2.reset()


dw_2.reset()
dw_3.reset()	
dw_4.reset()		
dw_5.reset()				
dw_2.insertrow(0)
dw_2.object.order_coilsheet_order_date[1]    = gf_today2s()
dw_2.object.order_coilsheet_buyer[1]    = is_team + gs_username
dw_2.object.order_coilsheet_open_close[1]   = 'O'            /*어떻게 활용할지? 입고 완료는 C,  입고 진행은 O */
dw_2.object.order_coilsheet_fob[1]   = '현금'


//dw_2.object.cust_no[1]    = ls_custno
//dw_2.object.cust_name[1]  = ls_custname
//dw_2.object.scene_code[1] = ls_sceneno
//dw_2.object.scene_desc[1] = ls_scenename
//dw_2.object.area_no[1]    = gs_area
//dw_2.object.fit_date[1]   = gf_today()
//dw_2.object.fit_user[1]   = gs_userid
//dw_2.object.user_name[1]  = gs_username
//
//cb_6.triggerevent( clicked! )
//cb_6.enabled = true		// 선택 가져오기
//pb_1.enabled = true		// 행추가
//pb_2.enabled = true		// 행삭제

//dw_3.setcolumn( 'ship_qty' )
//dw_3.setfocus()













end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ippurchasecoilsheet_m
integer x = 3378
integer y = 72
integer taborder = 270
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_cat, ls_start, ls_end
//
//if rb_1.checked = true then
//	ls_cat = '%'
//elseif rb_2.checked = true then
//	ls_cat = '출하'
//elseif rb_3.checked = true then
//	ls_cat = '이동'
//end if
//
ls_start  = LeftA(em_1.Text,4) + MidA(em_1.Text,6,2) + RightA(em_1.Text,2)
ls_end   = LeftA(em_2.Text,4) + MidA(em_2.Text,6,2) + RightA(em_2.Text,2)

dw_1.reset()
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()

dw_2.InsertRow(0)
dw_2.object.order_coilsheet_order_date[1]    = gf_today2s()
dw_2.object.order_coilsheet_buyer[1]    = is_team + gs_username

dw_1.retrieve('%', '%', ls_start, ls_end)	

end event

type gb_3 from w_inheritance`gb_3 within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 1783
integer y = 16
integer width = 727
integer height = 228
integer taborder = 350
integer textsize = -8
integer weight = 400
long textcolor = 0
boolean enabled = false
string text = "구분"
end type

type gb_2 from w_inheritance`gb_2 within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 2523
integer y = 16
integer width = 809
integer height = 228
integer taborder = 310
integer textsize = -8
integer weight = 400
long textcolor = 0
boolean enabled = false
string text = "제품상차 번호"
end type

type gb_1 from w_inheritance`gb_1 within w_ippurchasecoilsheet_m
integer x = 3346
integer y = 16
integer width = 1394
integer height = 228
integer taborder = 320
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ippurchasecoilsheet_m
integer x = 2062
integer y = 436
integer width = 5207
integer height = 632
integer taborder = 20
boolean bringtotop = false
string dataobject = "d_ippurchasecoilsheet_master"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::clicked;call super::clicked;is_dw = 'dw_2'
st_2.text = '발주마스터'
end event

type cb_3 from commandbutton within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 3849
integer y = 60
integer width = 457
integer height = 92
integer taborder = 250
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "none"
end type

event clicked;
string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
if dw_3.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	ls_Docname, ls_Named, "XLS",  &
	"엑셀 (*.XLS), *.XLS," + &
   "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
  		      dw_3.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
    		      dw_3.SaveAs(ls_DocName, CSV!, TRUE)
      end if
end if

end event

type em_1 from editmask within w_ippurchasecoilsheet_m
integer x = 2510
integer y = 96
integer width = 379
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;//
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_ippurchasecoilsheet_m
integer x = 2898
integer y = 96
integer width = 357
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
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

type em_3 from editmask within w_ippurchasecoilsheet_m
event keydown pbm_dwnkey
boolean visible = false
integer x = 4805
integer y = 84
integer width = 379
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
boolean autoskip = true
end type

type em_4 from editmask within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 5193
integer y = 84
integer width = 137
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
string text = "1"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
string minmax = "1~~999"
end type

event getfocus;//
this.SelectText(1, 3)


end event

type st_3 from statictext within w_ippurchasecoilsheet_m
integer x = 352
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_ippurchasecoilsheet_m
integer x = 539
integer y = 308
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

type ddlb_dwtitles from dropdownlistbox within w_ippurchasecoilsheet_m
integer x = 581
integer y = 320
integer width = 311
integer height = 88
integer taborder = 190
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

type st_4 from statictext within w_ippurchasecoilsheet_m
integer x = 1038
integer y = 324
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

type ddlb_op from dropdownlistbox within w_ippurchasecoilsheet_m
integer x = 1207
integer y = 308
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ippurchasecoilsheet_m
integer x = 1527
integer y = 316
integer width = 567
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_ippurchasecoilsheet_m
integer x = 2098
integer y = 316
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ippurchasecoilsheet_m
integer x = 2263
integer y = 316
integer width = 160
integer height = 76
integer taborder = 180
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

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_4 from commandbutton within w_ippurchasecoilsheet_m
integer x = 2427
integer y = 316
integer width = 160
integer height = 76
integer taborder = 220
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ippurchasecoilsheet_m
integer x = 2592
integer y = 316
integer width = 160
integer height = 76
integer taborder = 260
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_5 from datawindow within w_ippurchasecoilsheet_m
integer x = 6309
integer y = 1096
integer width = 969
integer height = 844
integer taborder = 50
boolean bringtotop = true
string title = "d_ippurchasecoilsheet_m3"
string dataobject = "d_ippurchasecoilsheet_m3"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_order_no, ls_seq

is_dw = 'dw_5'
st_2.text = '2차가공'

if row = 0 then return

//ls_scene_code = this.object.scene_code[row]
ls_order_no = dw_2.object.order_coilsheet_order_no[1]

ls_seq = trim(this.object.order_seq[row])

dw_7.retrieve(ls_order_no, ls_seq)
end event

event doubleclicked;wf_itemselect( dw_5, 'M', 0, 0 )
end event

event itemchanged;string ls_item_no, ls_item, ls_itemname, ls_qa, ls_uom
long ll_cnt

this.accepttext()

choose case dwo.name
	case 'item_no'
			ls_item_no = data
			
			debugbreak()
			setnull(ls_item)
			SELECT item_no,item_name,uom INTO :ls_item, :ls_itemname, :ls_uom FROM groupitem WHERE item_no = :ls_item_no;
			if isnull(ls_item) then
				MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
				RETURN 1
			end if
			
			SELECT count(*) INTO :ll_cnt FROM groupitem WHERE item_no = :ls_item_no AND use_flag = 'C';
			if ll_cnt > 0 then
				MessageBox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
							+ "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
				RETURN 1
			end if
			
			this.object.item_name[row] = ls_itemname
			this.object.uom[row]       = ls_uom
			
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		 	idwc_qa.filter()
			 
			idwc_qa.SetSort("qa asc")
			idwc_qa.Sort( ) 			
			
	case 'qa'
		ls_qa  = data
		ls_item_no= trim(this.object.item_no[1])

		SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_item_no AND qa = :ls_qa AND use_flag = 'C';
		if ll_cnt > 0 then
			MessageBox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			RETURN 1
		end if			

			
end choose			
end event

type pb_1 from picturebutton within w_ippurchasecoilsheet_m
integer x = 3739
integer y = 304
integer width = 155
integer height = 104
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long l_row
string ls_order_no

ls_order_no = dw_2.object.order_coilsheet_order_no[1]

//if isnull(ls_order_no) then
//	return 0
//end if

if is_dw = 'dw_3' then
	l_row = dw_3.insertrow(0)	
	dw_3.object.round[l_row] = 0
	dw_3.object.result_type[l_row] = 'N'
	dw_3.object.order_no[l_row] = ls_order_no
	dw_3.object.order_seq[l_row] = trim(string(l_row,'00'))
elseif is_dw = 'dw_4' then
	l_row =  dw_4.insertrow(0)		
	dw_4.object.round[l_row] = 1
	dw_4.object.result_type[l_row] = 'N'	
	dw_4.object.order_no[l_row] = ls_order_no	
/*	dw_4.object.order_seq[l_row] = left(dw_3.object.order_seq[dw_3.getrow()],2)+trim(string(l_row,'00'))+'00' */
	dw_4.object.order_seq[l_row] = trim(string(l_row,'00'))
	is_seq1  = LeftA(dw_3.object.order_seq[dw_3.getrow()],2)
elseif is_dw = 'dw_5' then	
	l_row = dw_5.insertrow(0)		
	dw_5.object.round[l_row] = 2	
	dw_5.object.result_type[l_row] = 'N'	
	dw_5.object.order_no[l_row] = ls_order_no
/*	dw_5.object.order_seq[l_row] = left(dw_4.object.order_seq[dw_4.getrow()],4)+trim(string(l_row,'00'))*/
     dw_5.object.order_seq[l_row] =  trim(string(l_row,'00'))
elseif is_dw = 'dw_6' then	
	l_row = dw_6.insertrow(0)		
	dw_6.object.round[l_row] = 1
	dw_6.object.order_no[l_row] = ls_order_no
	dw_6.object.order_seq[l_row] = dw_4.object.order_seq[dw_4.getrow()]
	dw_6.object.check_seq[l_row] = l_row
	dw_6.object.in_date[l_row] = gf_today2s()	

elseif is_dw = 'dw_7' then	
	l_row = dw_7.insertrow(0)		
	dw_7.object.round[l_row] = 2
	dw_7.object.order_no[l_row] = ls_order_no
	dw_7.object.order_seq[l_row] = dw_5.object.order_seq[dw_5.getrow()]
	dw_7.object.check_seq[l_row] = l_row
	dw_7.object.in_date[l_row] = gf_today2s()	
end if
end event

type rb_1 from radiobutton within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 1819
integer y = 76
integer width = 311
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "전체"
end type

type rb_2 from radiobutton within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 2135
integer y = 76
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "출고요청"
boolean checked = true
end type

type rb_3 from radiobutton within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 2135
integer y = 160
integer width = 352
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "물품이동"
end type

type cbx_4 from checkbox within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 1819
integer y = 156
integer width = 311
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "A4 출력"
boolean checked = true
end type

type gb_4 from groupbox within w_ippurchasecoilsheet_m
integer x = 37
integer y = 260
integer width = 4704
integer height = 164
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_3 from datawindow within w_ippurchasecoilsheet_m
integer x = 2062
integer y = 1096
integer width = 1751
integer height = 1388
integer taborder = 30
string title = "d_construction_m1"
string dataobject = "d_ippurchasecoilsheet_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
pb_save.default = true


end event

event losefocus;//
pb_retrieve.default = true

end event

event itemfocuschanged;////
//string ls_colname, ls_shipqty
//long   ll_len
//
//debugbreak()
//choose case dwo.name
//	case 'ship_qty'
//		ls_shipqty = string(this.object.ship_qty[row], "#,##0")
//		ll_len     = len(ls_shipqty)
//		this.SelectText( 1, Len( ls_shipqty ) )
//		this.SetFocus()
//end choose
//
end event

event clicked;string  ls_order_no, ls_seq

is_dw = 'dw_3'
st_2.text = '작업대상코일'
ls_order_no = dw_2.object.order_no[1]
ls_seq = LeftA(this.object.order_seq[row],2)
is_seq1 = LeftA(this.object.order_seq[row],2)

GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//dw_5.reset()
//dw_6.reset()
//dw_7.reset()
//dw_4.retrieve( ls_order_no, ls_seq) 
end event

event doubleclicked;gs_coil lst_code


CHOOSE CASE dwo.name
	CASE 'coilsheet_no'
		
		lst_code.loc_no = 'WS00000000'
		openwithparm(w_whcoil_w, lst_code)
		lst_code = message.powerobjectparm		
		
//		this.object.len[ll_row] = lst_code.length
		this.object.wid[row] = lst_code.wid
		this.object.item_name[row] = lst_code.item_name
		this.object.item_no[row] = lst_code.item_no
		this.object.qa[row] = lst_code.qa
		this.object.coil_qa[row] = MidA(lst_code.qa,1,1) + "." + MidA(lst_code.qa, 2,2)+'*'+  string( dec( MidA(lst_code.qa, 5,4) ) )		
		this.object.uom[row] = lst_code.uom
		this.object.coilsheet_no[row] = lst_code.coil_no

END CHOOSE
end event

event itemchanged;string ls_item_no, ls_item, ls_itemname, ls_qa, ls_uom
long ll_cnt

this.accepttext()

choose case dwo.name
	case 'item_no'
			ls_item_no = data
			
			debugbreak()
			setnull(ls_item)
			SELECT item_no,item_name,uom INTO :ls_item, :ls_itemname, :ls_uom FROM groupitem WHERE item_no = :ls_item_no;
			if isnull(ls_item) then
				MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
				RETURN 1
			end if
			
			SELECT count(*) INTO :ll_cnt FROM groupitem WHERE item_no = :ls_item_no AND use_flag = 'C';
			if ll_cnt > 0 then
				MessageBox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
							+ "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
				RETURN 1
			end if
			
			this.object.item_name[row] = ls_itemname
			this.object.uom[row]       = ls_uom
			
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		 	idwc_qa.filter()
			 
			idwc_qa.SetSort("qa asc")
			idwc_qa.Sort( ) 			
			
	case 'qa'
		ls_qa  = data
		ls_item_no= trim(this.object.item_no[1])

		SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_item_no AND qa = :ls_qa AND use_flag = 'C';
		if ll_cnt > 0 then
			MessageBox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			RETURN 1
		end if			

			
end choose			
end event

type st_horizontal from u_splitbar_horizontal within w_ippurchasecoilsheet_m
integer x = 2057
integer y = 1072
integer width = 5275
boolean bringtotop = true
end type

event mouseup;call super::mouseup;////
//st_vertical1.height = dw_2.height
//st_vertical2.height = dw_2.height
//
//cbx_danga.bringtotop = true
//cbx_danga.y  = this.y + 40
//
////
//long  ll_width, ll_height
//
//ll_height  = tab_1.tabpage_1.height - tab_1.tabpage_1.dw_3.y  
//
//tab_1.tabpage_1.dw_3.height  = ll_height							// 발주서내역
//tab_1.tabpage_2.dw_4.height  = tab_1.tabpage_1.dw_3.height	// 외주가공내역
//tab_1.tabpage_3.dw_5.height  = tab_1.tabpage_1.dw_3.height	// 외주구매내역
//tab_1.tabpage_4.dw_6.height  = tab_1.tabpage_1.dw_3.height	// 수주내역
//tab_1.tabpage_5.dw_7.height  = tab_1.tabpage_1.dw_3.height	// 부족자재내역
//tab_1.tabpage_6.dw_8.height  = tab_1.tabpage_1.dw_3.height	// 자재가공내역
//tab_1.tabpage_7.dw_12.height = tab_1.tabpage_1.dw_3.height	// SHEET가공
//tab_1.tabpage_7.dw_10.height = tab_1.tabpage_1.dw_3.height	// 외주스리팅

end event

type st_vertical1 from u_splitbar_vertical within w_ippurchasecoilsheet_m
integer x = 2043
integer y = 420
integer height = 2168
boolean bringtotop = true
end type

type st_vertical2 from u_splitbar_vertical within w_ippurchasecoilsheet_m
integer x = 3813
integer y = 1096
integer height = 1484
boolean bringtotop = true
end type

type st_vertical3 from u_splitbar_vertical within w_ippurchasecoilsheet_m
integer x = 6290
integer y = 1096
integer height = 844
boolean bringtotop = true
end type

type pb_2 from picturebutton within w_ippurchasecoilsheet_m
integer x = 3904
integer y = 304
integer width = 155
integer height = 104
integer taborder = 360
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;
if is_dw = 'dw_3' then
	dw_3.deleterow(dw_3.getrow())			
elseif is_dw = 'dw_4' then
	dw_4.deleterow(dw_4.getrow())		
elseif is_dw = 'dw_5' then	
	dw_5.deleterow(dw_5.getrow())		
elseif is_dw = 'dw_6' then	
	dw_6.deleterow(dw_6.getrow())	
elseif is_dw = 'dw_7' then	
	dw_7.deleterow(dw_7.getrow())		
end if
end event

type st_1 from statictext within w_ippurchasecoilsheet_m
integer x = 2039
integer y = 96
integer width = 457
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "조회기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_ippurchasecoilsheet_m
integer x = 3328
integer y = 308
integer width = 402
integer height = 112
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
end type

event clicked;
if is_dw = 'dw_3' then
	wf_itemselect( dw_3, 'M', 0, 0 )	
elseif is_dw= 'dw_4' then
	wf_itemselect( dw_4, 'M', 0, 0 )
elseif is_dw = 'dw_5' then
	wf_itemselect( dw_5, 'M', 0, 0 )	
end if
end event

type dw_6 from datawindow within w_ippurchasecoilsheet_m
integer x = 3831
integer y = 1952
integer width = 2459
integer height = 844
integer taborder = 70
boolean bringtotop = true
string title = "d_ippurchasecoilsheet_check_m2"
string dataobject = "d_ippurchasecoilsheet_check_m2"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw = 'dw_6'
st_2.text = '1차가공 입고'
end event

type dw_7 from datawindow within w_ippurchasecoilsheet_m
integer x = 6309
integer y = 1952
integer width = 969
integer height = 844
integer taborder = 100
boolean bringtotop = true
string title = "d_ippurchasecoilsheet_check_m3"
string dataobject = "d_ippurchasecoilsheet_check_m3"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw = 'dw_7'
st_2.text = '2차가공 입고'
end event

type st_horizontal1 from u_splitbar_horizontal within w_ippurchasecoilsheet_m
integer x = 3817
integer y = 1932
integer width = 3506
boolean bringtotop = true
end type

event mouseup;call super::mouseup;////
//st_vertical1.height = dw_2.height
//st_vertical2.height = dw_2.height
//
//cbx_danga.bringtotop = true
//cbx_danga.y  = this.y + 40
//
////
//long  ll_width, ll_height
//
//ll_height  = tab_1.tabpage_1.height - tab_1.tabpage_1.dw_3.y  
//
//tab_1.tabpage_1.dw_3.height  = ll_height							// 발주서내역
//tab_1.tabpage_2.dw_4.height  = tab_1.tabpage_1.dw_3.height	// 외주가공내역
//tab_1.tabpage_3.dw_5.height  = tab_1.tabpage_1.dw_3.height	// 외주구매내역
//tab_1.tabpage_4.dw_6.height  = tab_1.tabpage_1.dw_3.height	// 수주내역
//tab_1.tabpage_5.dw_7.height  = tab_1.tabpage_1.dw_3.height	// 부족자재내역
//tab_1.tabpage_6.dw_8.height  = tab_1.tabpage_1.dw_3.height	// 자재가공내역
//tab_1.tabpage_7.dw_12.height = tab_1.tabpage_1.dw_3.height	// SHEET가공
//tab_1.tabpage_7.dw_10.height = tab_1.tabpage_1.dw_3.height	// 외주스리팅

end event

type st_vertical4 from u_splitbar_vertical within w_ippurchasecoilsheet_m
integer x = 6290
integer y = 1944
integer height = 640
boolean bringtotop = true
end type

type st_2 from statictext within w_ippurchasecoilsheet_m
integer x = 4082
integer y = 320
integer width = 599
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_8 from datawindow within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 411
integer y = 20
integer width = 146
integer height = 100
integer taborder = 370
string title = "none"
string dataobject = "d_ippurchasecoilsheet_print"
boolean livescroll = true
end type

type cb_7 from commandbutton within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 5682
integer y = 296
integer width = 466
integer height = 112
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "1차 가공 복사"
end type

event clicked;dwItemStatus l_status
long ll_count, l_row, ll_row
string  ls_order_no, ls_seq

l_row = long(em_5.text)

ls_order_no = dw_2.object.order_coilsheet_order_no[1]
ls_seq = LeftA(dw_3.object.order_seq[l_row],2)

dw_9.retrieve( ls_order_no, ls_seq) 
	
ll_row = 0


FOR ll_count = 1 TO dw_9.rowcount()
		
		ll_row = dw_4.insertrow(0)
		
		dw_4.object.order_no[ll_row]  = dw_9.object.order_no[ll_count]
		dw_4.object.round[ll_row]        = dw_9.object.round[ll_count]
		dw_4.object.order_seq[ll_row]  = is_seq1+trim(string(ll_row,'00'))+'00' 
		dw_4.object.item_no[ll_row]     = dw_9.object.item_no[ll_count]
		dw_4.object.item_name[ll_row]   = dw_9.object.item_name[ll_count]		
		dw_4.object.qa[ll_row]              = dw_9.object.qa[ll_count]
		dw_4.object.coilsheet_no[ll_row] = dw_9.object.coilsheet_no[ll_count]
		dw_4.object.uom[ll_row]              = dw_9.object.uom[ll_count]  
		dw_4.object.qty[ll_row]                 = dw_9.object.qty[ll_count]
		dw_4.object.wid[ll_row]                = dw_9.object.wid[ll_count]  
		dw_4.object.cnt[ll_row]                = dw_9.object.cnt[ll_count] 
		dw_4.object.div[ll_row]                 = dw_9.object.div[ll_count]  
		dw_4.object.result_type[ll_row]    = dw_9.object.result_type[ll_count]
	
NEXT

end event

type dw_9 from datawindow within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 146
integer y = 2536
integer width = 384
integer height = 192
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string title = "d_ippurchasecoilsheet_m2"
string dataobject = "d_ippurchasecoilsheet_m2"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_order_no, ls_seq

is_dw = 'dw_4'
st_2.text = '1차가공'

if row = 0 then return

//ls_scene_code = this.object.scene_code[row]
ls_order_no = dw_2.object.order_coilsheet_order_no[1]
ls_seq = trim(this.object.order_seq[row])

dw_5.retrieve(ls_order_no, LeftA(ls_seq,4))
dw_6.retrieve(ls_order_no, ls_seq)
end event

event itemchanged;string ls_item_no, ls_item, ls_itemname, ls_qa, ls_uom
long ll_cnt

this.accepttext()

choose case dwo.name
	case 'item_no'
			ls_item_no = data
			
			debugbreak()
			setnull(ls_item)
			SELECT item_no,item_name,uom INTO :ls_item, :ls_itemname, :ls_uom FROM groupitem WHERE item_no = :ls_item_no;
			if isnull(ls_item) then
				MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
				RETURN 1
			end if
			
			SELECT count(*) INTO :ll_cnt FROM groupitem WHERE item_no = :ls_item_no AND use_flag = 'C';
			if ll_cnt > 0 then
				MessageBox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
							+ "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
				RETURN 1
			end if
			
			this.object.item_name[row] = ls_itemname
			this.object.uom[row]       = ls_uom
			
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		 	idwc_qa.filter()
			 
			idwc_qa.SetSort("qa asc")
			idwc_qa.Sort( ) 			
			
	case 'qa'
		ls_qa  = data
		ls_item_no= trim(this.object.item_no[1])

		SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_item_no AND qa = :ls_qa AND use_flag = 'C';
		if ll_cnt > 0 then
			MessageBox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			RETURN 1
		end if			

			
end choose			
end event

type st_6 from statictext within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 4791
integer y = 320
integer width = 709
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 268435456
boolean enabled = false
string text = "작업대상코일_복사행"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_5 from editmask within w_ippurchasecoilsheet_m
boolean visible = false
integer x = 5518
integer y = 304
integer width = 160
integer height = 104
integer taborder = 130
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##"
end type

type dw_4 from datawindow within w_ippurchasecoilsheet_m
integer x = 3831
integer y = 1096
integer width = 2459
integer height = 844
integer taborder = 40
string title = "d_ippurchasecoilsheet_m2"
string dataobject = "d_ippurchasecoilsheet_m2"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_order_no, ls_seq

is_dw = 'dw_4'
st_2.text = '1차가공'

if row = 0 then return

//ls_scene_code = this.object.scene_code[row]
ls_order_no = dw_2.object.order_coilsheet_order_no[1]
ls_seq = trim(this.object.order_seq[row])

//dw_5.retrieve(ls_order_no, left(ls_seq,4))
dw_6.retrieve(ls_order_no, ls_seq)
end event

event itemchanged;string ls_item_no, ls_item, ls_itemname, ls_qa, ls_uom
long ll_cnt

this.accepttext()

choose case dwo.name
	case 'item_no'
			ls_item_no = data
			
			debugbreak()
			setnull(ls_item)
			SELECT item_no,item_name,uom INTO :ls_item, :ls_itemname, :ls_uom FROM groupitem WHERE item_no = :ls_item_no;
			if isnull(ls_item) then
				MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
				RETURN 1
			end if
			
			SELECT count(*) INTO :ll_cnt FROM groupitem WHERE item_no = :ls_item_no AND use_flag = 'C';
			if ll_cnt > 0 then
				MessageBox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
							+ "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
				RETURN 1
			end if
			
			this.object.item_name[row] = ls_itemname
			this.object.uom[row]       = ls_uom
			
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		 	idwc_qa.filter()
			 
			idwc_qa.SetSort("qa asc")
			idwc_qa.Sort( ) 			
			
	case 'qa'
		ls_qa  = data
		ls_item_no= trim(this.object.item_no[1])

		SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_item_no AND qa = :ls_qa AND use_flag = 'C';
		if ll_cnt > 0 then
			MessageBox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			RETURN 1
		end if			

			
end choose			
end event

