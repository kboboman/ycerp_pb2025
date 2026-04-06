$PBExportHeader$w_oeesti_m.srw
$PBExportComments$견적서 관리(1998/03/25, 정재수)
forward
global type w_oeesti_m from w_inheritance
end type
type dw_4 from datawindow within w_oeesti_m
end type
type rb_1 from radiobutton within w_oeesti_m
end type
type rb_2 from radiobutton within w_oeesti_m
end type
type rb_3 from radiobutton within w_oeesti_m
end type
type rb_4 from radiobutton within w_oeesti_m
end type
type pb_2 from picturebutton within w_oeesti_m
end type
type pb_1 from picturebutton within w_oeesti_m
end type
type em_1 from editmask within w_oeesti_m
end type
type em_2 from editmask within w_oeesti_m
end type
type dw_3 from datawindow within w_oeesti_m
end type
type cbx_1 from checkbox within w_oeesti_m
end type
type dw_5 from datawindow within w_oeesti_m
end type
type cbx_2 from checkbox within w_oeesti_m
end type
type dw_6 from datawindow within w_oeesti_m
end type
type cbx_3 from checkbox within w_oeesti_m
end type
type dw_7 from datawindow within w_oeesti_m
end type
type dw_8 from datawindow within w_oeesti_m
end type
type dw_9 from datawindow within w_oeesti_m
end type
type dw_10 from datawindow within w_oeesti_m
end type
type dw_11 from datawindow within w_oeesti_m
end type
type cb_1 from commandbutton within w_oeesti_m
end type
type st_1 from statictext within w_oeesti_m
end type
type st_2 from statictext within w_oeesti_m
end type
type em_3 from editmask within w_oeesti_m
end type
type cb_2 from commandbutton within w_oeesti_m
end type
type cb_3 from commandbutton within w_oeesti_m
end type
type cb_4 from commandbutton within w_oeesti_m
end type
type cb_5 from commandbutton within w_oeesti_m
end type
type st_3 from statictext within w_oeesti_m
end type
end forward

global type w_oeesti_m from w_inheritance
integer x = 5
integer y = 100
integer width = 4357
integer height = 2628
string title = "견적서 관리(w_oeesti_m)"
dw_4 dw_4
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
pb_2 pb_2
pb_1 pb_1
em_1 em_1
em_2 em_2
dw_3 dw_3
cbx_1 cbx_1
dw_5 dw_5
cbx_2 cbx_2
dw_6 dw_6
cbx_3 cbx_3
dw_7 dw_7
dw_8 dw_8
dw_9 dw_9
dw_10 dw_10
dw_11 dw_11
cb_1 cb_1
st_1 st_1
st_2 st_2
em_3 em_3
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
st_3 st_3
end type
global w_oeesti_m w_oeesti_m

type variables
string is_custno,is_custname, is_flag ='%'
date id_start, id_end
st_print i_print
string is_scenesql,is_select
datawindowchild idwc_scene, idwc_cust
datawindowchild idwc_item,idwc_qa
datawindowchild idwc_system, idwc_system2


end variables

forward prototypes
public function boolean wf_check (string as_esti)
public subroutine wf_calc ()
public subroutine wf_cust ()
end prototypes

public function boolean wf_check (string as_esti);string ls_esti_flag

select esti_flag into :ls_esti_flag from estimate_head
 where estimate_no = :as_esti;
if ls_esti_flag = 'Y' then
	messagebox("확인","견적서가 이미 결재된 견적서입니다.")
	return false
end if
return true

end function

public subroutine wf_calc ();//decimal lr_esti_amount, lr_price, lr_amt, lr_acc_qty1, lr_vat
//long ll_row
//string ls_vat
//
//dw_2.accepttext()
//dw_4.accepttext()
//ls_vat = dw_2.getitemstring(1, "vat_flag")
//
//lr_esti_amount = 0
//for ll_row = 1 to dw_4.rowcount()
//	lr_price = dw_4.getitemdecimal(ll_row, "unit_cost")
//	lr_acc_qty1 = dw_4.getitemdecimal(ll_row, "acc_qty")
//	lr_amt = truncate(lr_acc_qty1 * lr_price, 0)
//	dw_4.object.item_amt[ll_row] = lr_amt
//	lr_esti_amount = lr_esti_amount + lr_amt
//next
//dw_2.object.esti_amount[1] = lr_esti_amount
//
////VAT와 총금액
//if ls_vat = 'Y' then
//	lr_vat = truncate(lr_esti_amount / 10, 0)
//	dw_2.object.esti_tax[1] = lr_vat 
//	dw_2.object.esti_total[1] = lr_vat + lr_esti_amount
//else
//	dw_2.object.esti_total[1] = lr_esti_amount
//end if
//


decimal lr_esti_amount, lr_price, lr_amt, lr_acc_qty1, lr_vat
long    ll_row
string  ls_vat

dw_2.accepttext()
dw_4.accepttext()

ls_vat = dw_2.getitemstring(1, "vat_flag")		// 부가세유무

lr_esti_amount = 0
for ll_row = 1 to dw_4.rowcount()
	lr_price    = dw_4.getitemdecimal(ll_row, "unit_cost")
	lr_acc_qty1 = dw_4.getitemdecimal(ll_row, "acc_qty")
	lr_amt      = truncate(lr_acc_qty1 * lr_price + 0.0000001, 0)
	
	dw_4.object.item_amt[ll_row] = lr_amt
	lr_esti_amount = lr_esti_amount + lr_amt
next
dw_2.object.esti_amount[1] = lr_esti_amount

////VAT와 총금액
//if ls_vat = 'Y' then
//	lr_vat = truncate(lr_esti_amount / 10, 0)
//	dw_2.object.esti_tax[1] = lr_vat 
//	dw_2.object.esti_total[1] = lr_vat + lr_esti_amount
//else
//	dw_2.object.esti_total[1] = lr_esti_amount
//end if
//

/* 20080123 부가세 계산방식 변경
if ls_vat = 'Y' then
	dw_2.object.esti_tax[1] = 0
	for ll_row = 1 to dw_4.rowcount()
		 dw_2.object.esti_tax[1] = dw_2.object.esti_tax[1] + TRUNCATE((dw_4.object.item_amt[ll_row] / 10) + 0.0000001, 0 )
	next
else
	dw_2.object.esti_tax[1] = 0
end if
dw_2.object.esti_total[1] = dw_2.object.esti_amount[1] + dw_2.object.esti_tax[1]
*/

// 20080123 부가세 계산방식 변경
if ls_vat = 'Y' then
	lr_vat = truncate(lr_esti_amount / 10 + 0.0000001, 0)
	dw_2.object.esti_tax[1] = lr_vat
else
	dw_2.object.esti_tax[1] = 0
end if
dw_2.object.esti_total[1] = lr_vat + lr_esti_amount

end subroutine

public subroutine wf_cust ();gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret = message.powerobjectparm

string ls_where, ls_sql, ls_salesman

if lst_whcustret.cust_chk = 'Y' then
	dw_2.object.cust_no[1] = lst_Whcustret.cust_no
	dw_2.object.cust_name[1] = lst_Whcustret.cust_name
	select salesman into :ls_salesman from customer
	 where cust_no = :lst_Whcustret.cust_no ;
	dw_2.object.emp_no[1] = ls_salesman
else
	return
end if

dw_2.object.scene_code[1] = ''
dw_2.object.scene_desc[1] = ''
idwc_scene.reset()
ls_where = "WHERE scene.cust_no = ~~'" + lst_Whcustret.cust_no + "~~'"
ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

dw_2.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.modify(ls_sql)
idwc_scene.retrieve()
if idwc_scene.rowcount() > 0 then
	dw_2.setcolumn("scene_code")
else
	dw_2.setcolumn("system_no")
end if

end subroutine

on w_oeesti_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.pb_2=create pb_2
this.pb_1=create pb_1
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.cbx_2=create cbx_2
this.dw_6=create dw_6
this.cbx_3=create cbx_3
this.dw_7=create dw_7
this.dw_8=create dw_8
this.dw_9=create dw_9
this.dw_10=create dw_10
this.dw_11=create dw_11
this.cb_1=create cb_1
this.st_1=create st_1
this.st_2=create st_2
this.em_3=create em_3
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.pb_2
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.em_2
this.Control[iCurrent+10]=this.dw_3
this.Control[iCurrent+11]=this.cbx_1
this.Control[iCurrent+12]=this.dw_5
this.Control[iCurrent+13]=this.cbx_2
this.Control[iCurrent+14]=this.dw_6
this.Control[iCurrent+15]=this.cbx_3
this.Control[iCurrent+16]=this.dw_7
this.Control[iCurrent+17]=this.dw_8
this.Control[iCurrent+18]=this.dw_9
this.Control[iCurrent+19]=this.dw_10
this.Control[iCurrent+20]=this.dw_11
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.st_1
this.Control[iCurrent+23]=this.st_2
this.Control[iCurrent+24]=this.em_3
this.Control[iCurrent+25]=this.cb_2
this.Control[iCurrent+26]=this.cb_3
this.Control[iCurrent+27]=this.cb_4
this.Control[iCurrent+28]=this.cb_5
this.Control[iCurrent+29]=this.st_3
end on

on w_oeesti_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.cbx_2)
destroy(this.dw_6)
destroy(this.cbx_3)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.dw_9)
destroy(this.dw_10)
destroy(this.dw_11)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_3)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)
dw_8.settransobject(sqlca)
dw_9.settransobject(sqlca)

dw_7.visible  = false
dw_8.visible  = false
dw_9.visible  = false
dw_10.visible = false
dw_11.visible = false

st_2.visible = false
em_3.visible = false
cb_2.visible = false
cb_3.visible = false

pb_compute.enabled = false
pb_print.enabled   = false

dw_3.insertrow(0)

dw_2.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)

dw_5.insertrow(0)

dw_2.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)
//idwc_scene.insertrow(0)
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_6.insertrow(0)
dw_6.getchild("item_no", idwc_system2)
idwc_system2.settransobject(sqlca)

dw_2.getchild("system_no", idwc_system)
idwc_system2.sharedata(idwc_system)

dw_4.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_4.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_2.object.esti_case.visible = false		// 단가견적

em_1.text = string(today(), 'yyyy/mm/01')
em_2.text = string(today(), 'yyyy/mm/dd')
id_start  = date(em_1.text)
id_end    = date(em_2.text)

rb_1.postevent(clicked!)

end event

event resize;call super::resize;//
gb_3.height = newheight - 272
dw_1.height = newheight - 1036

//gb_2.height = newheight - 1108
dw_4.width  = newwidth  - 1344
dw_4.height = newheight - 1296

end event

type pb_save from w_inheritance`pb_save within w_oeesti_m
integer x = 3881
integer taborder = 80
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
string  ls_esti_no, ls_esti_no1, ls_esti_date, ls_seq
int     li_seq
long    ll_row
decimal lr_order_qty

if dw_2.rowcount() < 1 then return
if wf_check(dw_2.getitemstring(dw_2.getrow(), "estimate_no")) = false then
	return
end if

//if dw_4.rowcount() < 1 then
//	messagebox("저장","등록된 물품이 없습니다!",exclamation!)
//	return
//end if

l_status = dw_2.getitemstatus(1, 0, primary!)
dw_2.object.user_id[1] = gs_userid
dw_2.object.input_date[1] = wf_today()
dw_2.accepttext()

if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 1 then
	setpointer(hourglass!)
	if l_status = newmodified! then
		//견적서 번호 부여
		ls_esti_date = string(dw_2.object.estimate_date[1], "yyyymmdd")
		ls_esti_no1 = 'KD' + ls_esti_date + '-' + '%'
		
		SELECT MAX(estimate_no) INTO :ls_esti_no
		  FROM estimate_head
		 WHERE estimate_no LIKE :ls_esti_no1;
		
		if isnull(ls_esti_no) or ls_esti_no = '' then
			ls_esti_no1 = 'KD' + ls_esti_date + '-' + '001'
		else
			li_seq = integer(MidA(ls_esti_no, 12, 3))
			li_seq = li_seq + 1
			ls_seq = '00' + string(li_seq)
			ls_esti_no1 = LeftA(ls_esti_no1, 11) + RightA(ls_seq, 3)
		end if
				
		for ll_row = 1 to dw_4.rowcount() 
			dw_4.object.estimate_no[ll_row] = ls_esti_no1
		next
		dw_2.object.estimate_no[1] = ls_esti_no1
		
	else
		ls_esti_no1 = dw_2.getitemstring(1, "estimate_no")
		for ll_row = 1 to dw_4.rowcount() 
			dw_4.object.estimate_no[ll_row] = ls_esti_no1
		next
	end if
		
	dw_2.accepttext()
	dw_4.accepttext()
	
	if wf_nullchk(dw_2) = false then
		return
	elseif wf_nullchk(dw_4) = false then
		return
	end if
	
	
	dw_1.accepttext()
	
	if wf_update2(dw_2, dw_4, 'Y') = true then
		pb_compute.enabled = true
		pb_print.enabled   = true

//		dw_2.object.scene_code.protect = 1
//		dw_2.object.scene_code.background.color = 78682240
		em_1.text = string(dw_2.object.estimate_date[1], "yyyy/mm/dd")
		em_2.text = string(dw_2.object.estimate_date[1], "yyyy/mm/dd")
		id_start  = date(em_1.text)
		id_end    = date(em_2.text)
		pb_retrieve.postevent(clicked!)
	end if
	
end if


end event

type dw_1 from w_inheritance`dw_1 within w_oeesti_m
integer x = 59
integer y = 972
integer width = 1193
integer height = 1488
integer taborder = 160
string dataobject = "d_oeesti_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;dw_2.setredraw(false)
dw_4.setredraw(false)
if dw_1.getrow() > 0 then
	dw_2.retrieve(dw_1.getitemstring(dw_1.getrow(), "estimate_no"))
	dw_4.retrieve(dw_1.getitemstring(dw_1.getrow(), "estimate_no"))
else	
	dw_2.reset()
	dw_4.reset()
end if
dw_2.setredraw(true)
dw_4.setredraw(true)


end event

event dw_1::retrieveend;if dw_1.getrow() > 0 then
else	
	dw_2.reset()
	dw_4.reset()
end if


end event

type dw_2 from w_inheritance`dw_2 within w_oeesti_m
integer x = 1312
integer y = 256
integer width = 2971
integer height = 820
integer taborder = 180
string dataobject = "d_oeesti_m"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;string   ls_where, ls_sql,  ls_emp_no, ls_data, ls_null
long ll_row, ll_found, ll_row1, ll_cnt
decimal lr_amt

this.accepttext()
setnull(ls_null)
choose case dwo.name
	case 'cust_no'
		this.getchild("cust_no", idwc_cust)
		
		ls_data = data
  	   ll_row1 = idwc_cust.RowCount( )
		ll_found = idwc_cust.Find("cust_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은고객이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		select salesman into :ls_emp_no from customer
		 where cust_no = :ls_data;
		this.object.cust_name[1] = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")
		
		this.object.scene_code[1] = ls_null
		this.object.scene_desc[1] = ls_null
		select count(*) into :ll_cnt from scene
		 where cust_no = :ls_data;
		 idwc_scene.reset()
		if ll_cnt > 0 then
			ls_where = "WHERE scene.cust_no = ~~'" + ls_data + "~~'"
			ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
		
			this.getchild("scene_code", idwc_scene)
			idwc_scene.settransobject(sqlca)
			idwc_scene.modify(ls_sql)
			idwc_scene.retrieve()
		end if
		if ll_found = 0 OR idwc_scene.rowcount() > 0 then
			this.setcolumn("scene_code")
		else
			this.setcolumn("system_no")
		end if
		this.object.emp_no[1] = ls_emp_no
		this.setfocus()
		
	case 'scene_code'
		this.getchild("scene_code", idwc_scene)
		this.object.scene_desc[1] = idwc_scene.getitemstring(idwc_scene.getrow(), "scene_desc")
		this.setcolumn("system_no")
		this.setfocus()
		
	case 'esti_amount','esti_tax'
		this.object.esti_total[1] = this.getitemdecimal(1, "esti_amount") &
										  + this.getitemdecimal(1, "esti_tax")
	case 'vat_flag'
		lr_amt = this.getitemdecimal(1, "esti_amount")
		if data = 'Y' then
			this.object.esti_tax[1] = truncate(lr_amt / 10 + 0.0000001, 0) 
			this.object.esti_total[1] = lr_amt + truncate(lr_amt / 10 + 0.0000001, 0)
		else
			this.object.esti_tax[1] = 0
			this.object.esti_total[1] = lr_amt
		end if
end choose
return 0

end event

event dw_2::itemerror;CHOOSE CASE dwo.name
	CASE 'cust_no'
		this.object.cust_no[this.getrow()] = ''
	CASE ELSE
END CHOOSE

return 2
end event

event dw_2::retrieveend;call super::retrieveend;long ll_row
string ls_cust, ls_where, ls_sql

if this.rowcount() < 1 then return
ls_cust = this.object.cust_no[1]
ls_where = "WHERE scene.cust_no = ~~'" + ls_cust + "~~'"
ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

this.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)
idwc_scene.modify(ls_sql)
idwc_scene.retrieve()

dw_4.object.qa.tabsequence = 0
dw_4.object.qa.background.color = 78682240


end event

event dw_2::rbuttondown;call super::rbuttondown;choose case dwo.name
	case 'cust_no'
		wf_cust()
end choose

end event

event dw_2::buttonclicked;call super::buttonclicked;choose case dwo.name
	case 'b_cust'
		wf_cust()
end choose

end event

type st_title from w_inheritance`st_title within w_oeesti_m
integer x = 32
integer y = 48
integer width = 1253
integer height = 132
string text = "견적서 관리"
end type

type st_tips from w_inheritance`st_tips within w_oeesti_m
end type

type pb_compute from w_inheritance`pb_compute within w_oeesti_m
integer x = 2729
integer width = 224
integer taborder = 200
string text = "NOTE"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;gs_where lstr_where
long ll_row

ll_row  = dw_2.getrow()
if ll_row < 1 then return

dw_2.accepttext()

lstr_where.str1 = dw_2.object.estimate_no[ll_row]
openwithparm(w_oeesti_note_m,lstr_where)
lstr_where = Message.PowerObjectParm
//if lstr_where.chk = "Y" then
//	dw3.SETREDRAW(FALSE)
//	dw3.object.item_no[ll_row] = lstr_where.str1
//	dw3.object.qa[ll_row] = lstr_where.str2
//	dw3.object.uom[ll_row] = lstr_where.str3
//	dw3.object.item_item_name[ll_row] = lstr_where.name
//	dw3.SETREDRAW(TRUE)
//end if

end event

type pb_print_part from w_inheritance`pb_print_part within w_oeesti_m
integer x = 3689
integer taborder = 70
string picturename = "c:\bmp\mrpin.bmp"
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수주전환",parent, li_x, li_y)

end event

event pb_print_part::clicked;call super::clicked;dwitemstatus l_status
gs_where lst_where
string   ls_esti_no

dw_2.accepttext()
dw_4.accepttext()

l_status = dw_2.getitemstatus(1, 0, primary!)
if l_status = newmodified! or l_status = new! or l_status = DataModified! then
	messagebox('확인','견적서의 내용을 저장하셔야 됩니다.')
	return
end if
if dw_2.rowcount() < 1 then return

ls_esti_no     = dw_2.object.estimate_no[1]
lst_where.str1 = LeftA(ls_esti_no, 10) + RightA(ls_esti_no, 3)
lst_where.str2 = 'E'
lst_where.dw1  = dw_4
OpenWithParm ( w_oeesti_w, lst_where )

end event

type pb_close from w_inheritance`pb_close within w_oeesti_m
integer x = 4073
integer taborder = 210
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oeesti_m
integer x = 2990
integer taborder = 220
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_1.getrow() < 1 then return

string ls_text, ls_textvalue, ls_esti, ls_case, ls_vatflag, ls_chkprt
long   ll_dw7rowcount, ll_dw7row, ll_dw8rowcount, ll_dw8row, ll_mod, ll_int, ll_cnt
dec{0} ld_sum, ld_vat, ld_amt

dw_7.setredraw(false)

ls_esti = dw_2.getitemstring(1, "estimate_no")		// 견적번호
ls_case = dw_2.getitemstring(1, "esti_case")			// 단가견적

ll_dw7rowcount = dw_7.retrieve(ls_esti)            // 견적헤더
ll_dw8rowcount = dw_8.retrieve(ls_esti)				// 견적노트

ld_sum = 0
for ll_dw7row = 1 to ll_dw7rowcount
	ld_sum = ld_sum + dw_7.object.estimate_det_item_amt[ll_dw7row]
next
ld_amt = ld_sum		// 공급가액

// 합계금액
SELECT esti_tax, vat_flag INTO :ld_vat, :ls_vatflag FROM estimate_head WHERE estimate_no = :ls_esti;

ll_dw7row = dw_7.insertrow(0)

dw_7.object.esti_case[ll_dw7row]                 = ls_case				// 단가견적
dw_7.object.estimate_head_estimate_no[ll_dw7row] = ls_esti				// 견적번호

if ls_vatflag = "Y" then
else
	ld_sum = ld_sum + ld_vat
end if
dw_7.object.estimate_det_item_amt[ll_dw7row]     = ld_sum + ld_vat	// 합계+부가세

int li_len
if ls_vatflag = "Y" then
	ls_text      = "공급가:"+string(ld_amt,"#,##0")+" / 합계금액:"	
	li_len       = LenA(ls_text)
	ls_textvalue = space(47 - li_len) + ls_text
	dw_7.object.note[ll_dw7row] = ls_textvalue
else
	dw_7.object.note[ll_dw7row] = space(37) + "합계(별도)"
end if

//// 단가견적
//if ls_case = "Y" then
//	//
//else
//	dw_7.object.note[ll_dw7row] = space(40) + "합계"	
//end if

If ll_dw7rowcount = 19 then
	ll_dw7rowcount++
end if
ll_mod = Mod(ll_dw7rowcount + 1, 20)

ll_cnt    = 0
ll_dw8row = 0
if ll_mod <> 0 then	
	for ll_int = 1 to 20 - ll_mod
		ll_dw7row = dw_7.insertrow(0)
		dw_7.object.estimate_head_estimate_no[ll_dw7row] = ls_esti	
		
		if ll_int = 2 then
			dw_7.object.note_text[ll_dw7row] = 'NOTE'		
		end if
		
		if ll_int > 1 and ll_dw8row < ll_dw8rowcount then
			ll_dw8row = ll_dw8row + 1
			
			ls_text   = dw_8.object.note[ll_dw8row]
			dw_7.object.note[ll_dw7row] = ls_text
		end if
	next
	
	if ll_dw8row < ll_dw8rowcount then
		for ll_int = 1 to 20
			ll_dw7row = dw_7.insertrow(0)
			
			dw_7.object.estimate_head_estimate_no[ll_dw7row] = ls_esti	
			if ll_dw8row = 1 then
				dw_7.object.note_text[ll_dw7row] = 'NOTE'		
			end if
			
			if ll_dw8row < ll_dw8rowcount then
				ll_dw8row = ll_dw8row + 1
				ls_text = dw_8.object.note[ll_dw8row]
				dw_7.object.note[ll_dw7row] = ls_text
			end if
		next
	end if
end if

//messagebox("",string(dw_7.Describe("DataWindow.Bands")))
//dw_7.Object.DataWindow.Bands.header.height = 0
//dw_7.Modify("DataWindow.Header.1.Height=0")
dw_7.setredraw(true)

i_print.st_datawindow  = dw_7
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 견적서를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oeesti_m
integer x = 1733
integer y = 1112
integer width = 667
integer height = 116
integer taborder = 230
boolean bringtotop = true
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "시스템 가져 오기"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::clicked;// 시스템 가져오기
long   ll_row, ll_cnt, ll_front
string ls_system

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

if wf_check(dw_2.getitemstring(dw_2.getrow(), "estimate_no")) = false then	return


ls_system = trim(dw_2.object.system_no[1])
if trim(ls_system) = '' or isnull(ls_system) then
	messagebox("확인","시스템를 선택하십시요")
	return
end if

if messagebox("확인","일위대가를 가져오시겠습니까?",question!,okcancel!,1) = 2 then return

dw_9.retrieve(ls_system)
dw_4.setredraw(false)
for ll_row = 1 to dw_9.rowcount()				
	ll_cnt = dw_4.insertrow(0)
	if ll_cnt > 1 then
		ll_front = dw_4.object.seq_no[ll_cnt - 1] + 1
	else
		ll_front = 1
	end if
	dw_4.object.seq_no[ll_cnt]  = ll_front   
	dw_4.object.item_no[ll_cnt] = dw_9.object.asc_item[ll_row]   
	dw_4.object.groupitem_item_name[ll_cnt] = dw_9.object.groupitem_item_name[ll_row]   
	dw_4.object.qa[ll_cnt]      = dw_9.object.asc_qa[ll_row]   
	dw_4.object.uom[ll_cnt]     = dw_9.object.uom[ll_row]   

	if dw_9.object.uom[ll_row] = 'M' then
		dec{3} ld_temp, ld_order_qty, ld_sum
		
		ld_order_qty = dec(dw_9.object.asc_qty[ll_row])
		ld_temp      = dec(RightA(dw_9.object.asc_qa[ll_row], 5)) * 0.001
		ld_sum       = Truncate(ld_order_qty / ld_temp + 0.0000001, 2 )
		dw_4.object.order_qty[ll_cnt] = ld_sum
//		messagebox(string(ll_row), string(ld_temp) + ' : ' + string(ld_order_qty / ld_temp) + ' : ' + string(ld_sum) )
		dw_4.object.acc_qty[ll_cnt] = gf_m2calc(trim(dw_9.object.asc_qa[ll_row]), &
															 trim(dw_9.object.uom[ll_row]), &
															 ld_sum)
	else
		dw_4.object.order_qty[ll_cnt] = dw_9.object.asc_qty[ll_row]   		
		dw_4.object.acc_qty[ll_cnt] = gf_m2calc(trim(dw_9.object.asc_qa[ll_row]), &
															 trim(dw_9.object.uom[ll_row]), &
															 dw_9.object.asc_qty[ll_row])
	end if

	dw_4.object.unit_cost[ll_cnt] = dw_9.object.std_cost[ll_row]   
	dw_4.object.item_amt[ll_cnt]  = dw_9.object.std_amount[ll_row]   
	dw_4.object.rem[ll_cnt]       = dw_9.object.rem[ll_row]
next
wf_calc()
dw_4.setredraw(true)

end event

type pb_delete from w_inheritance`pb_delete within w_oeesti_m
integer x = 3497
integer taborder = 240
string disabledname = "c:\bmp\delete.bmp"
end type

event pb_delete::clicked;dwitemstatus l_status
long ll_row
string ls_esti_no, ls_order_no, ls_esti_flag

if dw_1.rowcount() < 1 or dw_2.rowcount() < 1 then return

if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	l_status = dw_2.getitemstatus(1, 0, primary!)
	dw_1.accepttext()
	dw_2.accepttext()
	
	if l_status = newmodified! or l_status = new! then
		dw_2.reset()
		dw_4.reset()
		dw_1.postevent(rowfocuschanged!)
	else
		ls_esti_no = dw_1.getitemstring(dw_1.getrow(), "estimate_no")
		ls_esti_flag = dw_2.getitemstring(1, "esti_flag")

		if ls_esti_flag = 'Y' then
			messagebox("확인","이미 결재된 견적서입니다." + &
	   		        "~r~n삭제할 수 없습니다.", information!)
			return
		elseif ls_esti_flag = 'B' then
			messagebox("확인","이미 보류된 견적서입니다." + &
	   		        "~r~n삭제할 수 없습니다.", information!)
			return
		end if
		
		SELECT order_no INTO :ls_order_no
		  FROM sale
		 WHERE estimate_no = :ls_esti_no;
		 
		if isnull(ls_order_no) or ls_order_no = '' then
			for ll_row = dw_4.rowcount() to 1 step -1
			 	 dw_4.deleterow(ll_row)
			next
			dw_2.deleterow(1)
			if wf_update2(dw_2,dw_4,'Y') then
				dw_1.deleterow(dw_1.getrow())
				dw_1.accepttext()
				if dw_1.getrow() > 0 then
					dw_2.retrieve(dw_1.getitemstring(dw_1.getrow(), "estimate_no"))
					dw_4.retrieve(dw_1.getitemstring(dw_1.getrow(), "estimate_no"))
				end if
			end if
		else
			messagebox("확인", "수주된 견적서이므로 삭제할 수 없습니다!", information!)
			return
		end if
	end if
end if

		
end event

type pb_insert from w_inheritance`pb_insert within w_oeesti_m
integer x = 3305
integer taborder = 250
end type

event pb_insert::clicked;long ll_row

//if wf_check(dw_2.getitemstring(dw_1.getrow(), "estimate_no")) = false then
//	return
//end if
dw_2.reset()
dw_4.reset()

idwc_scene.insertrow(0)  //춘 19

pb_compute.enabled = false
pb_print.enabled   = false

dw_2.object.cust_no.protect = 0
dw_2.object.cust_no.background.color = 1087434968
//dw_2.object.scene_code.protect = 0 
//dw_2.object.scene_code.background.color = 78682240

ll_row = dw_2.insertrow(0)
dw_2.object.estimate_date[ll_row] = wf_today()
dw_2.object.scene_code[ll_row]    = ''
dw_2.object.scene_desc[ll_row]    = ''
dw_2.object.cust_no[ll_row]       = ''
dw_2.object.cust_name[ll_row]     = ''

st_2.visible = true
em_3.visible = true
cb_2.visible = true
cb_3.visible = true

dw_4.object.qa.tabsequence = 1
dw_4.object.qa.background.color = 1087434968


	
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oeesti_m
integer x = 1065
integer y = 280
integer taborder = 40
end type

event pb_retrieve::clicked;string ls_cust_no, ls_scene, ls_item
string ls_cust_no1,ls_scene1,ls_item1
st_security lst_security
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.reset()
dw_3.accepttext()
dw_5.accepttext()
dw_6.accepttext()

if cbx_1.checked = false then
	ls_cust_no = "%" + trim(dw_3.object.cust_no[1]) + "%"
	ls_cust_no1 = trim(dw_3.object.cust_no[1])
else
	ls_cust_no = '%'
	ls_cust_no1 = '전체'
end if

if cbx_2.checked = false then
	ls_scene = "%" + trim(dw_5.object.scene_code[1]) + "%"
	ls_scene1 = trim(dw_5.object.scene_code[1])
else
	ls_scene = '%'
	ls_scene1 = '전체'
end if

if cbx_3.checked = false then
	ls_item = "%" + trim(dw_6.object.item_no[1]) + "%"
	ls_item1 = trim(dw_6.object.item_no[1])
else
	ls_item = '%'
	ls_item1 = '전체'
end if

string ls_level_userid
Choose Case gs_level
	Case 'A', 'B'
		ls_level_userid = '%'
	Case 'C'
		ls_level_userid = gs_userid
End Choose

dw_1.setredraw(false)
dw_1.retrieve(id_start, id_end, is_flag, ls_cust_no, ls_scene, ls_item, ls_level_userid)
dw_1.setredraw(true)

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
		ls_userid = gs_userid
		ls_title = st_title.text
		If ls_cust_no1 <> '전체' Then
			select cust_name into :ls_cust_no1 from customer where cust_no = :ls_cust_no1;
		End If
		If ls_scene1 <> '전체' Then
			select scene_desc into :ls_scene1 from scene where scene_code = :ls_scene1;
		End IF
		
		If ls_item1 <> '전체' Then
			select item_name into :ls_item1 from basis_head where item_no = :ls_item1;
		End If
		
		ls_desc = '기간 : ' + string(id_start) + ' ~ ' + string(id_end) + '/ 거래처 : ' + ls_cust_no1 + '/ 현장 : ' + ls_scene1 + '/ 시스템 : ' + ls_item1 + '/ 조회'
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================

pb_compute.enabled = true
pb_print.enabled   = true

end event

type gb_3 from w_inheritance`gb_3 within w_oeesti_m
integer x = 32
integer y = 236
integer width = 1253
integer height = 2252
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oeesti_m
integer x = 1312
integer y = 1072
integer width = 2976
integer height = 172
integer taborder = 190
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oeesti_m
integer x = 2702
integer y = 16
integer width = 1582
integer height = 196
integer taborder = 150
end type

type dw_4 from datawindow within w_oeesti_m
event ue_1 pbm_custom01
integer x = 1312
integer y = 1256
integer width = 2976
integer height = 1228
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_oeesti_m1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_1;wf_calc()
end event

event itemchanged;string ls_where, ls_sql, ls_item_no, ls_qa, ls_com_qa, ls_data
string ls_uom, ls_cust_no, ls_scene_no, ls_vat, ls_item_name
long ll_row, ll_lenth, ll_x, ll_y, ll_found, ll_row1
decimal lr_order_qty, lr_acc_qty, lr_acc_qty1, lr_price, lr_amt, lr_vat
decimal lr_vat_amount, lr_esti_amount, lr_subt

this.accepttext()
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")
dw_2.accepttext()
lr_esti_amount = dw_2.getitemdecimal(1, "esti_amount")
ls_vat = dw_2.getitemstring(1, "vat_flag")

choose case dwo.name
	case 'item_no'
		this.object.qa[ll_row] = ''
		this.object.uom[ll_row] = ''
		this.object.order_qty[ll_row] = 0
		this.object.acc_qty[ll_row] = 0
		this.object.unit_cost[ll_row] = 0 
		this.object.item_amt[ll_row] = 0
		this.object.rem[ll_row] = ''
		this.object.qa.tabsequence = 0
		this.object.qa.background.color = 78682240
		
		this.getchild("item_no", idwc_item)
		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_item_name = idwc_item.getitemstring(idwc_item.getrow(), "item_name")
		this.object.groupitem_item_name[this.getrow()] = ls_item_name
		
		if ls_item_no <> '' then
			this.getchild("qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()

			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
				this.object.qa.background.color = 1087434968
				this.setcolumn("qa")
				this.setfocus()
			else
				this.object.qa.tabsequence = 0
				this.object.qa.background.color = 78682240
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if
		
	case 'qa'
		this.getchild("qa", idwc_qa)
		gs_ds_qaall.ShareData(idwc_qa)
		
		
		ls_data = data
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
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
				
		this.object.uom[ll_row] = ls_uom
		this.setcolumn("order_qty")
		this.setfocus()
		
		ls_scene_no = dw_2.getitemstring(1, "scene_code")
		ls_cust_no = dw_2.getitemstring(1, "cust_no")
//		ls_com_qa = left(ls_qa, 13)
		ls_com_qa = ls_qa
		
		// 단가
		lr_price = gf_custprice(ls_scene_no, ls_cust_no, ls_com_qa, ls_item_no, ls_qa)
		this.object.unit_cost[ll_row] = lr_price
		
		lr_order_qty = this.getitemdecimal(ll_row, "order_qty")	
		this.object.acc_qty[ll_row] = gf_m2calc(ls_qa, ls_uom, lr_order_qty)
						
//		//물품금액
//		lr_amt = truncate(lr_acc_qty * lr_price, 0)
////		lr_subt = dw_4.getitemdecimal(ll_row, "item_amt")
//		this.object.item_amt[ll_row] = lr_amt
//		
//		//공급가액
//		lr_esti_amount = lr_amt + lr_esti_amount 
//		dw_2.object.esti_amount[1] = lr_esti_amount
//		
//		//VAT와 총금액
//		if ls_vat = 'Y' then
//			lr_vat = truncate(lr_esti_amount / 10, 0)
//			dw_2.object.esti_tax[1] = lr_vat 
//			dw_2.object.esti_total[1] = lr_vat + lr_esti_amount
//      else
//			dw_2.object.esti_total[1] = lr_esti_amount
//		end if
		
	case 'order_qty'
		lr_order_qty = this.getitemdecimal(ll_row, "order_qty")		
		ls_uom = trim(this.getitemstring(ll_row, "uom"))
		
		this.object.acc_qty[ll_row] = gf_m2calc(ls_qa, ls_uom, lr_order_qty)
				
//		//물품금액
//		lr_price = this.getitemdecimal(ll_row, "unit_cost")
//		lr_amt = truncate(lr_acc_qty * lr_price, 0)
//		lr_subt = dw_4.getitemdecimal(ll_row, "item_amt")
//		this.object.item_amt[ll_row] = lr_amt
//		
//		//공급가액
//		lr_esti_amount = lr_amt + lr_esti_amount - lr_subt
//		dw_2.object.esti_amount[1] = lr_esti_amount
//		
//		//VAT와 총금액
//		if ls_vat = 'Y' then
//			lr_vat = truncate(lr_esti_amount / 10, 0)
//			dw_2.object.esti_tax[1] = lr_vat 
//			dw_2.object.esti_total[1] = lr_vat + lr_esti_amount
//      else
//			dw_2.object.esti_total[1] = lr_esti_amount
//		end if
		
	case 'uom'
		ls_uom = data
		lr_order_qty = this.getitemdecimal(ll_row, "order_qty")	
		
		this.object.acc_qty[ll_row] = gf_m2calc(ls_qa, ls_uom, lr_order_qty)
		
	case 'unit_cost'
		//물품금액
//		lr_price = this.getitemdecimal(ll_row, "unit_cost")
//		lr_acc_qty1 = this.getitemdecimal(ll_row, "acc_qty")
//		lr_amt = truncate(lr_acc_qty1 * lr_price, 0)
//		lr_subt = dw_4.getitemdecimal(ll_row, "item_amt")
//		this.object.item_amt[ll_row] = lr_amt
//		
//		//공급가액
//		lr_esti_amount = lr_amt + lr_esti_amount - lr_subt
//		dw_2.object.esti_amount[1] = lr_esti_amount
//		
//		//VAT와 총금액
//		if ls_vat = 'Y' then
//			lr_vat = truncate(lr_esti_amount / 10, 0)
//			dw_2.object.esti_tax[1] = lr_vat 
//			dw_2.object.esti_total[1] = lr_vat + lr_esti_amount
//      else
//			dw_2.object.esti_total[1] = lr_esti_amount
//		end if
end choose
this.postevent('ue_1')
return 0

end event

event itemerror;CHOOSE CASE dwo.name
	CASE 'item_no'
		this.object.item_no[row] = ''
	CASE 'qa'
		this.object.qa[row] = ''	
	CASE ELSE
END CHOOSE

return 2
end event

event losefocus;this.accepttext()

end event

event getfocus;pb_1.default = true

end event

event rowfocuschanged;this.AcceptText()
string ls_item_no
long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

ls_item_no = this.object.item_no[ll_row]

this.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)
idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
idwc_qa.filter()
end event

type rb_1 from radiobutton within w_oeesti_m
integer x = 73
integer y = 284
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;is_flag = '%'
end event

type rb_2 from radiobutton within w_oeesti_m
integer x = 315
integer y = 284
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "결재"
end type

event clicked;is_flag = 'Y'
end event

type rb_3 from radiobutton within w_oeesti_m
integer x = 553
integer y = 284
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "보류"
end type

event clicked;is_flag = 'B'
end event

type rb_4 from radiobutton within w_oeesti_m
integer x = 795
integer y = 284
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "미결"
end type

event clicked;is_flag = 'N'

end event

type pb_2 from picturebutton within w_oeesti_m
event mousemove pbm_mousemove
integer x = 4105
integer y = 1112
integer width = 155
integer height = 116
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)


end event

event clicked;
dw_2.accepttext()
dw_4.accepttext()

if dw_2.rowcount() < 1 then return
if dw_4.rowcount() < 1 then return

if wf_check(dw_2.getitemstring(dw_2.getrow(), "estimate_no")) = false then
	return
end if

dw_4.deleterow(dw_4.getrow())
wf_calc()
end event

type pb_1 from picturebutton within w_oeesti_m
event mousemove pbm_mousemove
integer x = 3945
integer y = 1112
integer width = 155
integer height = 116
integer taborder = 140
boolean bringtotop = true
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

event clicked;long ll_row, ll_seq, ll_front
decimal lr_order_qty
string ls_esti_flag, ls_item_no, ls_qa

dw_2.accepttext()

dw_4.accepttext()

if dw_2.rowcount() < 1 then return

if wf_check(dw_2.getitemstring(dw_2.getrow(), "estimate_no")) = false then
	return
end if

if wf_nullchk(dw_4) = false then
	return
end if

pb_1.default = false
setpointer(hourglass!)
ll_row = dw_4.insertrow(0)
dw_4.scrolltorow(ll_row)
ll_seq = dw_4.rowcount()

if ll_seq > 1 then
	ll_front = dw_4.object.seq_no[ll_row - 1]
	dw_4.object.seq_no[ll_row] = ll_front + 1
else
	dw_4.object.seq_no[ll_row] = ll_row
end if
end event

type em_1 from editmask within w_oeesti_m
integer x = 224
integer y = 352
integer width = 347
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
end type

event modified;id_start = date(em_1.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_start = date(this.text)
end event

type em_2 from editmask within w_oeesti_m
integer x = 649
integer y = 352
integer width = 352
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
end type

event modified;id_end = date(em_2.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_end = date(this.text)

end event

type dw_3 from datawindow within w_oeesti_m
integer x = 69
integer y = 524
integer width = 864
integer height = 88
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_oecustomer_s"
boolean border = false
end type

event constructor;	dw_3.object.cust_no.background.color = rgb(192,192,192)

end event

type cbx_1 from checkbox within w_oeesti_m
integer x = 73
integer y = 460
integer width = 384
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "거래처 전체"
boolean checked = true
boolean righttoleft = true
end type

event clicked;if this.checked = true then
	dw_3.object.cust_no.background.color = rgb(192,192,192)
	dw_3.enabled = false
else
	dw_3.enabled = true
	dw_3.object.cust_no.background.color = rgb(255,255,255)
end if
end event

type dw_5 from datawindow within w_oeesti_m
integer x = 69
integer y = 692
integer width = 864
integer height = 88
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_whscene_s"
boolean border = false
end type

event constructor;	dw_5.object.scene_code.background.color = rgb(192,192,192)

end event

type cbx_2 from checkbox within w_oeesti_m
integer x = 73
integer y = 628
integer width = 384
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "현장 전체"
boolean checked = true
end type

event clicked;if this.checked = true then
	dw_5.enabled = false
	dw_5.object.scene_code.background.color = rgb(192,192,192)
else
	dw_5.enabled = true
	dw_5.object.scene_code.background.color = rgb(255,255,255)
end if

end event

type dw_6 from datawindow within w_oeesti_m
integer x = 69
integer y = 864
integer width = 869
integer height = 92
integer taborder = 60
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_oeesti_s1"
boolean border = false
end type

event constructor;	dw_6.object.item_no.background.color = rgb(192,192,192)

end event

type cbx_3 from checkbox within w_oeesti_m
integer x = 73
integer y = 800
integer width = 384
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "시스템 전체"
boolean checked = true
boolean righttoleft = true
end type

event clicked;if this.checked = true then
	dw_6.enabled = false
	dw_6.object.item_no.background.color = rgb(192,192,192)
else
	dw_6.enabled = true
	dw_6.object.item_no.background.color = rgb(255,255,255)
end if
end event

type dw_7 from datawindow within w_oeesti_m
integer x = 1385
integer y = 40
integer width = 101
integer height = 76
integer taborder = 90
boolean bringtotop = true
string title = "견적내용"
string dataobject = "d_oeesti_rep_r1"
boolean livescroll = true
end type

type dw_8 from datawindow within w_oeesti_m
integer x = 1504
integer y = 40
integer width = 101
integer height = 76
integer taborder = 100
boolean bringtotop = true
string title = "견적노트"
string dataobject = "d_oeesti_rep_r2"
boolean livescroll = true
end type

type dw_9 from datawindow within w_oeesti_m
integer x = 1623
integer y = 40
integer width = 101
integer height = 76
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_oeesti_h"
boolean livescroll = true
end type

type dw_10 from datawindow within w_oeesti_m
integer x = 1742
integer y = 40
integer width = 101
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oeesti_rep_r1"
boolean livescroll = true
end type

type dw_11 from datawindow within w_oeesti_m
integer x = 1861
integer y = 40
integer width = 101
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oeesti_rep_r11"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_oeesti_m
integer x = 3598
integer y = 1112
integer width = 343
integer height = 116
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
end type

event clicked;dw_2.accepttext()
dw_4.accepttext()
if dw_2.rowcount() < 1 then return

string ls_cust, ls_scene
ls_cust = dw_2.object.cust_no[1]
if isnull(ls_cust) or trim(ls_cust) = '' then
	messagebox("확인","거래처를 입력하세요!",exclamation!)
	dw_2.setcolumn("cust_no")
	dw_2.setfocus()
	return
end if
ls_scene = dw_2.getitemstring(1, "scene_code")
if trim(ls_scene) = '' then setnull(ls_scene)		
//if wf_confirm('Y') = false then return

long ll_row, ll_cnt
string ls_area, ls_loc, ls_item_no, ls_qa, ls_uom, ls_com_qa
real lr_order_qty, lr_price
gs_where2 lstr_where

//ls_area = dw_2.object.area_no[1]
ls_area = gs_area

select def_loc into :ls_loc from area
 where area_no = :ls_area;

lstr_where.chk = 'M' //M:multi S:single
lstr_where.chk1 = ls_loc
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm

if lstr_where.chk <> "Y" then return

dw_4.SETREDRAW(false)
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_4.insertrow(0)
	if ll_cnt = 1 then 
		dw_4.object.seq_no[ll_cnt] = 1
	else
		dw_4.object.seq_no[ll_cnt] = dw_4.object.seq_no[ll_cnt - 1] + 1
	end if
	dw_4.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_4.object.qa[ll_cnt] = trim(lstr_where.str2[ll_row])
	
	dw_4.object.qa.tabsequence = 1
	dw_4.object.qa.background.color = 1087434968
	
	dw_4.object.uom[ll_cnt] = trim(lstr_where.str3[ll_row])
	dw_4.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
//	dw_4.object.color[ll_cnt] = wf_color(dw_4.object.item_no[ll_cnt])
	ls_item_no = lstr_where.str1[ll_row]
	ls_qa = lstr_where.str2[ll_row]
	ls_uom = lstr_where.str3[ll_row]

	lr_order_qty = lstr_where.qty2[ll_row]
	lr_price = lstr_where.qty3[ll_row]

	// 단가
	if ls_uom = 'M2' OR ls_uom = "SS" then //단위가 평방미터인 제품의 환산수량
		ls_com_qa = LeftA(ls_qa, 3)
	elseif ls_uom = 'M' then //단위가 미터인 제품의 환산수량
		ls_com_qa = LeftA(ls_qa, 13)
	else
		ls_com_qa = ls_qa
	end if

	if isnull(lr_price) or lr_price = 0 then
		lr_price = gf_custprice(ls_scene, ls_cust, ls_com_qa, ls_item_no, ls_qa)
	end if
	dw_4.object.order_qty[ll_cnt] = lr_order_qty
	dw_4.object.unit_cost[ll_cnt] = lr_price
//	// update 1999/08/06, uom = "SS" <= 단위는 SHeet이나 계산을 평방미터로 환산하는 단위
			
	dw_4.object.acc_qty[ll_cnt] = gf_m2calc(ls_qa, ls_uom, lr_order_qty)
next

wf_calc()

dw_4.scrolltorow(1)
dw_4.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)
idwc_qa.setfilter("item_no = '" + trim(lstr_where.str1[1]) + "'") 
idwc_qa.filter()
dw_4.setcolumn('order_qty')
dw_4.setfocus()
dw_4.SETREDRAW(TRUE)

end event

type st_1 from statictext within w_oeesti_m
integer x = 576
integer y = 324
integer width = 73
integer height = 84
boolean bringtotop = true
integer textsize = -24
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "~~"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oeesti_m
integer x = 3506
integer y = 764
integer width = 338
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
string text = "시스템개수"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_3 from editmask within w_oeesti_m
integer x = 3506
integer y = 844
integer width = 338
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "1"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,##0"
string minmax = "~~"
end type

type cb_2 from commandbutton within w_oeesti_m
boolean visible = false
integer x = 2894
integer y = 856
integer width = 160
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "(/)적"
end type

event clicked;//long ll_dw4cnt
//integer li_i
//string ls_qa, ls_uom
//decimal lr_order_qty
//
//ll_dw4cnt = dw_4.rowcount()
//if ll_dw4cnt > 0 then
//	for li_i = 1 to ll_dw4cnt
//		dw_4.setitem(li_i, "order_qty", dw_4.getitemnumber(li_i, "order_qty",primary!,True) / dec(em_3.text))
//	next
//	dw_4.accepttext()
//	for li_i = 1 to ll_dw4cnt
//		ls_qa = trim(dw_4.getitemstring(li_i, "qa"))
//		lr_order_qty = dw_4.getitemdecimal(li_i, "order_qty")		
//		ls_uom = trim(dw_4.getitemstring(li_i, "uom"))
//		
//		dw_4.object.acc_qty[li_i] = gf_m2calc(ls_qa, ls_uom, lr_order_qty)
//	next	
//	dw_4.accepttext()
//else
//end if
//
//wf_calc()
end event

type cb_3 from commandbutton within w_oeesti_m
integer x = 3854
integer y = 840
integer width = 325
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "적용"
end type

event clicked;// 적용
long    ll_dw4cnt
integer li_i
string  ls_qa, ls_uom
decimal lr_order_qty

ll_dw4cnt = dw_4.rowcount()
if ll_dw4cnt > 0 then
	for li_i = 1 to ll_dw4cnt
		dw_4.setitem(li_i, "order_qty", dw_4.getitemnumber(li_i, "order_qty",primary!,True) * dec(em_3.text))
	next
	
	dw_4.accepttext()
	for li_i = 1 to ll_dw4cnt
		ls_qa        = trim(dw_4.getitemstring(li_i, "qa"))
		lr_order_qty = dw_4.getitemdecimal(li_i, "order_qty")		
		ls_uom       = trim(dw_4.getitemstring(li_i, "uom"))
		
		dw_4.object.acc_qty[li_i] = gf_m2calc(ls_qa, ls_uom, lr_order_qty)
	next	
	dw_4.accepttext()
end if

wf_calc()

end event

type cb_4 from commandbutton within w_oeesti_m
integer x = 1335
integer y = 1112
integer width = 155
integer height = 116
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;long ll_row, ll_curseq

dw_4.accepttext()

ll_row = dw_4.getrow()

if ll_row <= 1 then return

ll_curseq = dw_4.object.seq_no[ll_row]

if ll_curseq = 1 or ll_curseq = 0 then return
dw_4.setredraw(false)
dw_4.object.seq_no[ll_row] = dw_4.object.seq_no[ll_row - 1]
dw_4.object.seq_no[ll_row - 1] = ll_curseq
dw_4.sort()
dw_4.scrolltorow(ll_row - 1)
dw_4.setredraw(true)

end event

type cb_5 from commandbutton within w_oeesti_m
integer x = 1495
integer y = 1112
integer width = 155
integer height = 116
integer taborder = 230
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;long ll_row, ll_curseq

dw_4.accepttext()

ll_row = dw_4.getrow()

if ll_row < 1 then return

ll_curseq = dw_4.object.seq_no[ll_row]

if ll_curseq = 0 or ll_curseq = dw_4.rowcount() then return
dw_4.setredraw(false)
dw_4.object.seq_no[ll_row] = dw_4.object.seq_no[ll_row + 1]
dw_4.object.seq_no[ll_row + 1] = ll_curseq
dw_4.sort()
dw_4.scrolltorow(ll_row + 1)
dw_4.setredraw(true)

end event

type st_3 from statictext within w_oeesti_m
integer x = 69
integer y = 368
integer width = 142
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "일자"
alignment alignment = center!
boolean focusrectangle = false
end type

