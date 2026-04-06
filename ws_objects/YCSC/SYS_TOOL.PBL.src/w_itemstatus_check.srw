$PBExportHeader$w_itemstatus_check.srw
$PBExportComments$물품상태 CHECK(2001/12/24,이인호)
forward
global type w_itemstatus_check from w_inheritance
end type
type st_3 from statictext within w_itemstatus_check
end type
type dw_qa from datawindow within w_itemstatus_check
end type
type dw_msg from datawindow within w_itemstatus_check
end type
type dw_msgdel from datawindow within w_itemstatus_check
end type
type dw_loghis from datawindow within w_itemstatus_check
end type
type dw_loghisdel from datawindow within w_itemstatus_check
end type
type dw_item_update from datawindow within w_itemstatus_check
end type
type dw_itemerror from datawindow within w_itemstatus_check
end type
type dw_3 from datawindow within w_itemstatus_check
end type
type dw_5 from datawindow within w_itemstatus_check
end type
type dw_itemzero from datawindow within w_itemstatus_check
end type
type dw_reservederror from datawindow within w_itemstatus_check
end type
type dw_6 from datawindow within w_itemstatus_check
end type
type dw_reservedzero from datawindow within w_itemstatus_check
end type
type dw_7 from datawindow within w_itemstatus_check
end type
type tab_1 from tab within w_itemstatus_check
end type
type tabpage_1 from userobject within tab_1
end type
type dw_itemloc_update from datawindow within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type cb_6 from commandbutton within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type cb_8 from commandbutton within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type st_9 from statictext within tabpage_1
end type
type st_10 from statictext within tabpage_1
end type
type st_8 from statictext within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type st_11 from statictext within tabpage_1
end type
type cb_9 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_itemloc_update dw_itemloc_update
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cb_7 cb_7
cb_6 cb_6
st_4 st_4
st_5 st_5
cb_8 cb_8
st_6 st_6
st_9 st_9
st_10 st_10
st_8 st_8
cb_4 cb_4
st_11 st_11
cb_9 cb_9
end type
type tabpage_2 from userobject within tab_1
end type
type dw_inaudit_update from datawindow within tabpage_2
end type
type cb_10 from commandbutton within tabpage_2
end type
type cb_44 from commandbutton within tabpage_2
end type
type cb_11 from commandbutton within tabpage_2
end type
type dw_10 from datawindow within tabpage_2
end type
type em_1 from editmask within tabpage_2
end type
type st_13 from statictext within tabpage_2
end type
type cb_99 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_inaudit_update dw_inaudit_update
cb_10 cb_10
cb_44 cb_44
cb_11 cb_11
dw_10 dw_10
em_1 em_1
st_13 st_13
cb_99 cb_99
end type
type tabpage_3 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_3
end type
type cb_12 from commandbutton within tabpage_3
end type
type cb_14 from commandbutton within tabpage_3
end type
type cb_15 from commandbutton within tabpage_3
end type
type cb_16 from commandbutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_4 dw_4
cb_12 cb_12
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
end type
type tabpage_4 from userobject within tab_1
end type
type cb_13 from commandbutton within tabpage_4
end type
type cb_17 from commandbutton within tabpage_4
end type
type cb_18 from commandbutton within tabpage_4
end type
type cb_19 from commandbutton within tabpage_4
end type
type dw_8 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_13 cb_13
cb_17 cb_17
cb_18 cb_18
cb_19 cb_19
dw_8 dw_8
end type
type tabpage_5 from userobject within tab_1
end type
type cb_20 from commandbutton within tabpage_5
end type
type cb_21 from commandbutton within tabpage_5
end type
type cb_22 from commandbutton within tabpage_5
end type
type cb_23 from commandbutton within tabpage_5
end type
type dw_9 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
cb_23 cb_23
dw_9 dw_9
end type
type tabpage_6 from userobject within tab_1
end type
type dw_11 from datawindow within tabpage_6
end type
type cb_31 from commandbutton within tabpage_6
end type
type cb_32 from commandbutton within tabpage_6
end type
type cb_33 from commandbutton within tabpage_6
end type
type cb_34 from commandbutton within tabpage_6
end type
type tabpage_6 from userobject within tab_1
dw_11 dw_11
cb_31 cb_31
cb_32 cb_32
cb_33 cb_33
cb_34 cb_34
end type
type tabpage_7 from userobject within tab_1
end type
type dw_13 from datawindow within tabpage_7
end type
type dw_14 from datawindow within tabpage_7
end type
type cb_24 from commandbutton within tabpage_7
end type
type cb_25 from commandbutton within tabpage_7
end type
type cb_26 from commandbutton within tabpage_7
end type
type dw_15 from datawindow within tabpage_7
end type
type tabpage_7 from userobject within tab_1
dw_13 dw_13
dw_14 dw_14
cb_24 cb_24
cb_25 cb_25
cb_26 cb_26
dw_15 dw_15
end type
type tab_1 from tab within w_itemstatus_check
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
type ddplb_1 from dropdownpicturelistbox within w_itemstatus_check
end type
type dw_item from datawindow within w_itemstatus_check
end type
type st_7 from statictext within w_itemstatus_check
end type
type st_1 from statictext within w_itemstatus_check
end type
type st_2 from statictext within w_itemstatus_check
end type
type st_12 from statictext within w_itemstatus_check
end type
type cb_insert from commandbutton within w_itemstatus_check
end type
type dw_12 from datawindow within w_itemstatus_check
end type
type cb_27 from commandbutton within w_itemstatus_check
end type
type dw_17 from datawindow within w_itemstatus_check
end type
type dw_16 from datawindow within w_itemstatus_check
end type
end forward

global type w_itemstatus_check from w_inheritance
integer y = 112
integer width = 4567
integer height = 2652
string title = "물품상태 CHECK(w_itemstatus_check)"
st_3 st_3
dw_qa dw_qa
dw_msg dw_msg
dw_msgdel dw_msgdel
dw_loghis dw_loghis
dw_loghisdel dw_loghisdel
dw_item_update dw_item_update
dw_itemerror dw_itemerror
dw_3 dw_3
dw_5 dw_5
dw_itemzero dw_itemzero
dw_reservederror dw_reservederror
dw_6 dw_6
dw_reservedzero dw_reservedzero
dw_7 dw_7
tab_1 tab_1
ddplb_1 ddplb_1
dw_item dw_item
st_7 st_7
st_1 st_1
st_2 st_2
st_12 st_12
cb_insert cb_insert
dw_12 dw_12
cb_27 cb_27
dw_17 dw_17
dw_16 dw_16
end type
global w_itemstatus_check w_itemstatus_check

type variables
string is_item, is_qa, is_name
datawindow dwitemloc,dwinaudit
int ii_picindex = 1
end variables

forward prototypes
public subroutine wf_bal ()
public subroutine wf_qoh ()
public subroutine wf_issue ()
public subroutine wf_rcpt ()
public function boolean wf_insert (string arg_item, string arg_qa)
end prototypes

public subroutine wf_bal ();long ll_row 
ll_row = dwitemloc.getrow()

dwitemloc.object.balbf[ll_row] = dwitemloc.object.qoh[ll_row] &
											 + dwitemloc.object.issue_qty[ll_row] &
											 - dwitemloc.object.receipt_qty[ll_row]

end subroutine

public subroutine wf_qoh ();long ll_row 
ll_row = dwitemloc.getrow()

		dwitemloc.object.qoh[ll_row] = dwitemloc.object.balbf[ll_row] &
												 - dwitemloc.object.issue_qty[ll_row] &
												 + dwitemloc.object.receipt_qty[ll_row]
//d
end subroutine

public subroutine wf_issue ();long ll_row 
ll_row = dwitemloc.getrow()

		dwitemloc.object.issue_qty[ll_row] = dwitemloc.object.balbf[ll_row] &
												 - dwitemloc.object.qoh[ll_row] &
												 + dwitemloc.object.receipt_qty[ll_row]

end subroutine

public subroutine wf_rcpt ();long ll_row 
ll_row = dwitemloc.getrow()

dwitemloc.object.receipt_qty[ll_row] = dwitemloc.object.qoh[ll_row] &
											 + dwitemloc.object.issue_qty[ll_row] &
											 - dwitemloc.object.balbf[ll_row]
//
end subroutine

public function boolean wf_insert (string arg_item, string arg_qa);string ls_qa, ls_qa0000, ls_item_no1, ls_uom, ls_name, ls_loc, ls_source
decimal lr_price
datetime ldt_today
int li_pat, ll_row
pointer oldpointer // Declares a pointer variable

oldpointer = SetPointer(HourGlass!)
SELECT COUNT(*) INTO :ll_row  from item 
where item_no = :arg_item
and qa = :arg_qa;
if ll_row > 0 then
	return false
end if
//		IF sqlca.sqlcode = 100  OR isnull(ls_qa) or ls_qa = '' then
//	SELECT MAX(qa) INTO :ls_qa from item 
//	 where item_no = :arg_item
//	   and qa < :arg_qa;
//	IF sqlca.sqlcode = 100 OR isnull(ls_qa) or ls_qa = '' then
////			rollback;
//////			mle_1.text = string(mle_1.text) + arg_item + "|" + arg_qa + "#      "
//////			messagebox("저장","물품코드의 다른 규격이 없읍니다.",exclamation!)
////			return false
//		end if
//	end if

	select uom, item_name, source into :ls_uom, :ls_name, :ls_source from groupitem
	where item_no = :arg_item;

	if ls_uom = 'M' then
		ls_qa0000 = LeftA(arg_qa, 13)
	elseif ls_uom = 'M2' then
		ls_qa0000 = LeftA(arg_qa, 3)
	else
		ls_qa0000 = arg_qa
	end if
	SELECT item_no, price INTO :ls_item_no1, :lr_price
	  FROM itemcost 
	 WHERE item_no = :arg_item
   	AND qa = :ls_qa0000;
	if isnull(ls_item_no1) or ls_item_no1 = '' then
		ldt_today = datetime(date(string(today(),'yyyy/mm/dd')))

		INSERT INTO itemcost(item_no, qa, uom, price, old_price, tran_date, user_id, rem, upda_chk)
	        VALUES (:arg_item, :ls_qa0000, :ls_uom, 0, 0, :ldt_today, :gs_userid, '', 'N');
		  
		if sqlca.sqlcode <> 0 then
			rollback;
			messagebox("저장1","itemcost 저장중 오류가 발생하였습니다!",exclamation!)
			return false
		end if
		
	end if

	ls_qa0000 = LeftA(arg_qa, 13) + "X00000"
	if MidA(arg_item,1,1) = 'P' then
		select pat_no into :li_pat from groupitem where item_no = :arg_item;
		select item_no into :ls_item_no1 from itempattern where item_no = :arg_item and qa1 = :ls_qa0000;
      if sqlca.sqlcode <> 0 then
		   insert into itempattern (item_no,qa1,pat_no)
   		values (:arg_item,:ls_qa0000,:li_pat);
		   if sqlca.sqlcode <> 0 then
			   rollback;
			   messagebox("저장3",SQLCA.SQLERRTEXT,exclamation!)
			   return false
		   end if
		end if
   end if  
		
insert into item (item_no ,			qa,				loc_no,				item_name,
						product_group,		uom,				source,				leadtime,
						count_code,			qoh,				sales_reserved,	prodn_reserved,
						pur_reserved,		item_wc,			supplier,			reorder,
						safety_stock,		lot,				obsolete_code,		scrap_qty,
						price_a,				price_b,			price_c,				std_setup,
						std_material,		std_labor,		std_burden,			std_subcontract,
						std_machine,		heft,				volume,				rem,
						target_item ,		target_qa,		last_tran_date,	month_qty,
						safety_day,			qa1,				pat_no,				use_flag)
						
values(	:arg_item ,			:arg_qa,			"WS00000000",				:ls_name,
						null,		:ls_uom,				:ls_source,				0,
						"M",			0,				0,	0,
						0,		null,			null,			0,
						0,		0,				null,		0,
						0,				0,			0,				0,
						0,		0,		0,			0,
						0,		0,				0,				null,
						null ,		null,		getdate(),	0,
						0,			:ls_qa0000,				0 ,				'Y'
);
//mle_1.text = mle_1.text + "ITEM = [" + arg_item + "]  규격 = [" + arg_qa + "]" + string(sqlca.sqlerrtext) 
if sqlca.sqlcode <> 0 then
//mle_1.text = mle_1.text + "ITEM = [" + arg_item + "]  규격 = [" + arg_qa + "]" + string(sqlca.sqlerrtext) 
//	messagebox("저장5",string(sqlca.sqlerrtext) + "~r~n" &
//				+ "ITEM = [" + arg_item + "]  규격 = [" + arg_qa + "] 저장중 오류가 발생하였습니다!",exclamation!)
	rollback;
	return false
end if
commit;
SetPointer(oldpointer)

return true
end function

on w_itemstatus_check.create
int iCurrent
call super::create
this.st_3=create st_3
this.dw_qa=create dw_qa
this.dw_msg=create dw_msg
this.dw_msgdel=create dw_msgdel
this.dw_loghis=create dw_loghis
this.dw_loghisdel=create dw_loghisdel
this.dw_item_update=create dw_item_update
this.dw_itemerror=create dw_itemerror
this.dw_3=create dw_3
this.dw_5=create dw_5
this.dw_itemzero=create dw_itemzero
this.dw_reservederror=create dw_reservederror
this.dw_6=create dw_6
this.dw_reservedzero=create dw_reservedzero
this.dw_7=create dw_7
this.tab_1=create tab_1
this.ddplb_1=create ddplb_1
this.dw_item=create dw_item
this.st_7=create st_7
this.st_1=create st_1
this.st_2=create st_2
this.st_12=create st_12
this.cb_insert=create cb_insert
this.dw_12=create dw_12
this.cb_27=create cb_27
this.dw_17=create dw_17
this.dw_16=create dw_16
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.dw_qa
this.Control[iCurrent+3]=this.dw_msg
this.Control[iCurrent+4]=this.dw_msgdel
this.Control[iCurrent+5]=this.dw_loghis
this.Control[iCurrent+6]=this.dw_loghisdel
this.Control[iCurrent+7]=this.dw_item_update
this.Control[iCurrent+8]=this.dw_itemerror
this.Control[iCurrent+9]=this.dw_3
this.Control[iCurrent+10]=this.dw_5
this.Control[iCurrent+11]=this.dw_itemzero
this.Control[iCurrent+12]=this.dw_reservederror
this.Control[iCurrent+13]=this.dw_6
this.Control[iCurrent+14]=this.dw_reservedzero
this.Control[iCurrent+15]=this.dw_7
this.Control[iCurrent+16]=this.tab_1
this.Control[iCurrent+17]=this.ddplb_1
this.Control[iCurrent+18]=this.dw_item
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.st_2
this.Control[iCurrent+22]=this.st_12
this.Control[iCurrent+23]=this.cb_insert
this.Control[iCurrent+24]=this.dw_12
this.Control[iCurrent+25]=this.cb_27
this.Control[iCurrent+26]=this.dw_17
this.Control[iCurrent+27]=this.dw_16
end on

on w_itemstatus_check.destroy
call super::destroy
destroy(this.st_3)
destroy(this.dw_qa)
destroy(this.dw_msg)
destroy(this.dw_msgdel)
destroy(this.dw_loghis)
destroy(this.dw_loghisdel)
destroy(this.dw_item_update)
destroy(this.dw_itemerror)
destroy(this.dw_3)
destroy(this.dw_5)
destroy(this.dw_itemzero)
destroy(this.dw_reservederror)
destroy(this.dw_6)
destroy(this.dw_reservedzero)
destroy(this.dw_7)
destroy(this.tab_1)
destroy(this.ddplb_1)
destroy(this.dw_item)
destroy(this.st_7)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_12)
destroy(this.cb_insert)
destroy(this.dw_12)
destroy(this.cb_27)
destroy(this.dw_17)
destroy(this.dw_16)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

DW_1.insertrow(1)
DW_2.insertrow(1)
if gs_userid = '1999010s' then
	cb_27.visible = true
	dw_17.visible = true
else
	cb_27.visible = false
	dw_17.visible = false
end if
tab_1.tabpage_3.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_8.SetTransObject(SQLCA)
tab_1.tabpage_5.dw_9.SetTransObject(SQLCA)
tab_1.tabpage_6.dw_11.SetTransObject(SQLCA)
dw_item.SetTransObject(SQLCA)
dw_item.SetTransObject(SQLCA)
dw_qa.SetTransObject(SQLCA)
dw_item_update.SetTransObject(SQLCA)

dw_itemerror.SetTransObject(SQLCA)
dw_itemzero.SetTransObject(SQLCA)
dw_reservederror.SetTransObject(SQLCA)
dw_reservedzero.SetTransObject(SQLCA)

dwitemloc = tab_1.tabpage_1.dw_itemloc_update
dwitemloc.SetTransObject(SQLCA)

dwinaudit = tab_1.tabpage_2.dw_inaudit_update
dwinaudit.SetTransObject(SQLCA)

ddplb_1.text = "ALL"

end event

type pb_save from w_inheritance`pb_save within w_itemstatus_check
integer x = 4091
integer y = 32
integer height = 156
integer taborder = 30
end type

event pb_save::clicked;if messagebox("저장", "저장하시겠습니까?", Exclamation!, OKCancel!, 1) <> 1 then
	return
end if
//gs_chkpass_str lstr_pass
//
//openwithparm(w_chkpass,lstr_pass)
//lstr_pass = message.powerobjectparm
//if lstr_pass.chk = false then
//	return
//end if
wf_update2(dw_item_update, dwitemloc, "Y")
gf_loghis("I",trim(trim(string(today())) + " U "))
gf_loghis("I","dw_item_update, dwitemloc update")
gf_loghis("I",is_item + " " +  is_qa )

end event

event pb_save::mousemove;call super::mousemove; 
if trim(gs_userid) = "1999010s" or trim(gs_userid) = "1999010h" &
	or trim(gs_userid) = "root" then
	return
else
long li_x, li_y
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
li_x = xpos
li_y = ypos
st_12.text = "xpos = " + string(li_x) + "ypos = " + string(li_y)
li_x = this.x 
li_y = this.y

if ypos >= xpos then
	CHOOSE CASE xpos
		CASE 0 to this.width
			li_x = li_x + this.width
	END CHOOSE

	CHOOSE CASE ypos
		CASE 0 to this.height 
			li_y = li_y - this.height
	END CHOOSE
else
	CHOOSE CASE xpos
		CASE 0 to this.width 
			li_x = li_x - this.width
	END CHOOSE
	CHOOSE CASE ypos
		CASE 0 to this.height
			li_y = li_y + this.height
	END CHOOSE
end if

//if xpos < this.width / 2 then
//  li_x = li_x + this.width
//elseif xpos >= this.width / 2 then
//	  li_x = li_x - this.width
//end if
//if ypos < this.height / 2 then
//  li_y = li_y + this.height
//elseif ypos >= this.height / 2 then
//  li_y = li_y - this.height
//end if
if li_x > parent.width - this.width then
	li_x = parent.width - this.width
else
	if li_x < 4 + this.width then
		li_x = 4
	end if
end if
if li_y > parent.height - this.height - 100 then
	li_y = parent.height - this.height - 100 
else
	if li_y < 4 + this.height then
		li_y = 4
	end if
end if


this.x = li_x
this.y = li_y
//
end if


end event

type dw_1 from w_inheritance`dw_1 within w_itemstatus_check
integer x = 210
integer y = 220
integer width = 375
integer height = 76
integer taborder = 10
string dataobject = "d_item_select"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;pb_retrieve.postevent(clicked!)
end event

type dw_2 from w_inheritance`dw_2 within w_itemstatus_check
integer x = 695
integer y = 220
integer width = 585
integer height = 76
integer taborder = 20
string dataobject = "d_item_name_select"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_itemstatus_check
integer x = 41
integer y = 16
integer width = 1248
integer height = 144
long textcolor = 65535
boolean enabled = true
string text = "물품상태 CHECK"
borderstyle borderstyle = stylelowered!
end type

type st_tips from w_inheritance`st_tips within w_itemstatus_check
end type

type pb_compute from w_inheritance`pb_compute within w_itemstatus_check
integer x = 3515
integer y = 32
integer height = 156
integer taborder = 0
string picturename = "c:\bmp\delete.bmp"
end type

event pb_compute::clicked;if trim(gs_userid) = "root" or  trim(gs_userid) = "1999010s" or trim(gs_userid) = "1999010h" then
	if dw_loghis.getrow() < 1 then return
	dw_loghis.deleterow(dw_loghis.getrow())
	wf_update1(dw_loghis, "N")
end if
end event

type pb_print_part from w_inheritance`pb_print_part within w_itemstatus_check
integer x = 3899
integer y = 32
integer height = 156
integer taborder = 0
end type

type pb_close from w_inheritance`pb_close within w_itemstatus_check
integer x = 4283
integer y = 32
integer height = 156
integer taborder = 220
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_itemstatus_check
integer x = 3707
integer y = 32
integer height = 156
integer taborder = 240
end type

type pb_cancel from w_inheritance`pb_cancel within w_itemstatus_check
integer x = 3323
integer y = 32
integer height = 156
integer taborder = 290
end type

event pb_cancel::clicked;dw_qa.triggerevent(rowfocuschanged!)
end event

type pb_delete from w_inheritance`pb_delete within w_itemstatus_check
integer x = 3131
integer y = 32
integer height = 156
integer taborder = 300
end type

event pb_delete::clicked;if trim(gs_userid) = "root" or  trim(gs_userid) = "1999010s" or trim(gs_userid) = "1999010h" then
	if dw_msg.getrow() < 1 then return
	dw_msg.deleterow(dw_msg.getrow())
	wf_update1(dw_msg, "N")
end if
end event

type pb_insert from w_inheritance`pb_insert within w_itemstatus_check
integer x = 2939
integer y = 32
integer height = 156
integer taborder = 320
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_itemstatus_check
integer x = 2747
integer y = 32
integer height = 156
integer taborder = 310
end type

event pb_retrieve::clicked;long ll_row, ll_itemcnt
string ls_item, ls_name, ls_chkitem
 
dw_1.accepttext()
dw_2.accepttext()

ls_item = trim(dw_1.object.item_no[1])
ls_name = trim(dw_2.object.item_name[1])
if isnull(ls_item) then
	ls_item = ''
end if
if isnull(ls_name) then
	ls_name = ''
end if
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
CHOOSE CASE ii_picindex
	CASE 1
		ll_row = dw_1.getrow()
		if ll_row < 1 then return

		dw_item.retrieve(ls_item + "%","%" + ls_name + "%")
		
	CASE 2
		ll_itemcnt = 0
		ls_chkitem = "xx"
		dw_itemerror.retrieve(ls_item + "%","%" + ls_name + "%")
		dw_item.reset()
		dw_item.setredraw(false)
		for ll_row = 1 to dw_itemerror.rowcount()
			if dw_itemerror.object.item_no[ll_row] <> ls_chkitem then
				ll_itemcnt = ll_itemcnt + 1
				dw_item.object.item_no[ll_itemcnt] = dw_itemerror.object.item_no[ll_row]
				ls_chkitem = dw_item.object.item_no[ll_itemcnt]
			end if
		next
		dw_item.setredraw(true)
		
	CASE 3
		ll_itemcnt = 0
		ls_chkitem = "xx"
		dw_itemzero.retrieve(ls_item + "%","%" + ls_name + "%")
		dw_item.reset()
		dw_item.setredraw(false)
		for ll_row = 1 to dw_itemzero.rowcount()
			if dw_itemzero.object.item_no[ll_row] <> ls_chkitem then
				ll_itemcnt = ll_itemcnt + 1
				dw_item.object.item_no[ll_itemcnt] = dw_itemzero.object.item_no[ll_row]
				ls_chkitem = dw_item.object.item_no[ll_itemcnt]
			end if
		next
		dw_item.setredraw(true)
		
	CASE 4
		ll_itemcnt = 0
		ls_chkitem = "xx"
		dw_reservederror.retrieve(ls_item + "%","%" + ls_name + "%")
		dw_item.reset()
		dw_item.setredraw(false)
		for ll_row = 1 to dw_reservederror.rowcount()
			if dw_reservederror.object.item_no[ll_row] <> ls_chkitem then
				ll_itemcnt = ll_itemcnt + 1
				dw_item.object.item_no[ll_itemcnt] = dw_reservederror.object.item_no[ll_row]
				ls_chkitem = dw_item.object.item_no[ll_itemcnt]
			end if
		next
		dw_item.setredraw(true)
		
	CASE 5
		ll_itemcnt = 0
		ls_chkitem = "xx"
		dw_reservedzero.retrieve(ls_item + "%","%" + ls_name + "%")
		dw_item.reset()
		dw_item.setredraw(false)
		for ll_row = 1 to dw_reservedzero.rowcount()
			if dw_reservedzero.object.item_no[ll_row] <> ls_chkitem then
				ll_itemcnt = ll_itemcnt + 1
				dw_item.object.item_no[ll_itemcnt] = dw_reservedzero.object.item_no[ll_row]
				ls_chkitem = dw_item.object.item_no[ll_itemcnt]
			end if
		next
		dw_item.setredraw(true)
END CHOOSE
dwinaudit.reset()
end event

type gb_3 from w_inheritance`gb_3 within w_itemstatus_check
boolean visible = false
integer x = 713
integer y = 312
integer height = 1352
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_itemstatus_check
boolean visible = false
integer x = 0
integer y = 180
integer width = 1070
integer height = 716
integer taborder = 150
integer textsize = -8
end type

type gb_1 from w_inheritance`gb_1 within w_itemstatus_check
boolean visible = false
integer x = 1262
integer y = 0
integer taborder = 110
boolean enabled = false
borderstyle borderstyle = styleraised!
end type

type st_3 from statictext within w_itemstatus_check
integer x = 2729
integer y = 20
integer width = 1760
integer height = 180
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_qa from datawindow within w_itemstatus_check
integer x = 1189
integer y = 400
integer width = 718
integer height = 552
integer taborder = 210
string dataobject = "d_item_qa"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row 

ll_row = this.getrow()
if ll_row < 1 then return

is_qa = this.object.qa[ll_row]

dw_item_update.Retrieve(is_item, is_qa)
dwitemloc.Retrieve(is_item, is_qa)

end event

event retrieveend;if this.rowcount() < 1 then return

this.triggerevent(rowfocuschanged!)
end event

type dw_msg from datawindow within w_itemstatus_check
boolean visible = false
integer x = 9
integer y = 328
integer width = 3520
integer height = 820
integer taborder = 180
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_sysmsgall_s"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
boolean righttoleft = true
end type

type dw_msgdel from datawindow within w_itemstatus_check
boolean visible = false
integer x = 9
integer y = 1164
integer width = 3520
integer height = 820
integer taborder = 190
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_sysmsg_delall_s"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
boolean righttoleft = true
end type

type dw_loghis from datawindow within w_itemstatus_check
boolean visible = false
integer x = 73
integer y = 292
integer width = 3301
integer height = 700
integer taborder = 160
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_loghisall_s"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
boolean righttoleft = true
end type

type dw_loghisdel from datawindow within w_itemstatus_check
boolean visible = false
integer x = 73
integer y = 1008
integer width = 3301
integer height = 700
integer taborder = 170
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_loghisdelall_s"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
boolean righttoleft = true
end type

type dw_item_update from datawindow within w_itemstatus_check
integer x = 1929
integer y = 304
integer width = 2546
integer height = 648
integer taborder = 230
string dataobject = "d_item_update"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_itemerror from datawindow within w_itemstatus_check
integer x = 3031
integer y = 204
integer width = 128
integer height = 88
integer taborder = 120
string dataobject = "d_itemerror_item"
end type

event doubleclicked;
if  trim(gs_userid) = "root" or trim(gs_userid) = "1999010s" or trim(gs_userid) = "1999010h" then
	dw_msg.settransobject(sqlca)
	dw_msgdel.settransobject(sqlca)
	dw_msg.retrieve()
	dw_msgdel.retrieve()
		dw_msg.visible = true
		dw_msgdel.visible = true
end if
end event

type dw_3 from datawindow within w_itemstatus_check
integer x = 3570
integer y = 204
integer width = 128
integer height = 88
integer taborder = 50
string dataobject = "d_itemerror_qa"
end type

type dw_5 from datawindow within w_itemstatus_check
integer x = 3703
integer y = 204
integer width = 128
integer height = 88
integer taborder = 60
string dataobject = "d_itemzero_qa"
end type

type dw_itemzero from datawindow within w_itemstatus_check
integer x = 3163
integer y = 204
integer width = 128
integer height = 88
integer taborder = 280
string dataobject = "d_itemzero_item"
end type

event doubleclicked;
if  trim(gs_userid) = "root" or trim(gs_userid) = "1999010s" or trim(gs_userid) = "1999010h" then
	dw_loghis.settransobject(sqlca)
	dw_loghisdel.settransobject(sqlca)
	dw_loghis.retrieve()
	dw_loghisdel.retrieve()
		dw_loghis.visible = true
		dw_loghisdel.visible = true
end if
end event

type dw_reservederror from datawindow within w_itemstatus_check
integer x = 3296
integer y = 204
integer width = 128
integer height = 88
integer taborder = 250
string dataobject = "d_reservederror_item"
end type

type dw_6 from datawindow within w_itemstatus_check
integer x = 3835
integer y = 204
integer width = 128
integer height = 88
integer taborder = 70
string dataobject = "d_reservederror_qa"
end type

type dw_reservedzero from datawindow within w_itemstatus_check
integer x = 3429
integer y = 204
integer width = 128
integer height = 88
integer taborder = 260
string dataobject = "d_reservedzero_item"
end type

type dw_7 from datawindow within w_itemstatus_check
integer x = 3968
integer y = 204
integer width = 128
integer height = 88
integer taborder = 100
string dataobject = "d_reservedzero_qa"
end type

type tab_1 from tab within w_itemstatus_check
integer x = 41
integer y = 1004
integer width = 4434
integer height = 1496
integer taborder = 200
integer textsize = -12
integer weight = 700
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
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4398
integer height = 1368
long backcolor = 79741120
string text = "ITEMLOC"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Custom073!"
long picturemaskcolor = 553648127
dw_itemloc_update dw_itemloc_update
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cb_7 cb_7
cb_6 cb_6
st_4 st_4
st_5 st_5
cb_8 cb_8
st_6 st_6
st_9 st_9
st_10 st_10
st_8 st_8
cb_4 cb_4
st_11 st_11
cb_9 cb_9
end type

on tabpage_1.create
this.dw_itemloc_update=create dw_itemloc_update
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_7=create cb_7
this.cb_6=create cb_6
this.st_4=create st_4
this.st_5=create st_5
this.cb_8=create cb_8
this.st_6=create st_6
this.st_9=create st_9
this.st_10=create st_10
this.st_8=create st_8
this.cb_4=create cb_4
this.st_11=create st_11
this.cb_9=create cb_9
this.Control[]={this.dw_itemloc_update,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_5,&
this.cb_7,&
this.cb_6,&
this.st_4,&
this.st_5,&
this.cb_8,&
this.st_6,&
this.st_9,&
this.st_10,&
this.st_8,&
this.cb_4,&
this.st_11,&
this.cb_9}
end on

on tabpage_1.destroy
destroy(this.dw_itemloc_update)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.cb_8)
destroy(this.st_6)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_8)
destroy(this.cb_4)
destroy(this.st_11)
destroy(this.cb_9)
end on

type dw_itemloc_update from datawindow within tabpage_1
integer x = 430
integer y = 20
integer width = 3904
integer height = 1320
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_itemloc_update"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;//long ll_row
//
//dwitemloc.accepttext()
//ll_row = dwitemloc.getrow()
////dwitemloc.setredraw(false)
//CHOOSE CASE dwo.name
//	CASE 'balbf'
////	이월수량 = 현재고 + 출고 - 입고dwitemloc
//		wf_qoh()
////		wf_issue()
////		wf_rcpt()
//	CASE 'qoh'
//		wf_bal()
////		wf_issue()
////		wf_rcpt()
//	CASE 'issue_qty'
//		wf_qoh()
////		wf_bal()
////		wf_rcpt()
//	CASE 'receipt_qty'
//		wf_qoh()
////		wf_issue()
////		wf_bal()
////	dwitemloc.object.reserved[ll_row] = 0
//END CHOOSE
////dwitemloc.setredraw(true)
//
end event

type cb_1 from commandbutton within tabpage_1
integer x = 5
integer y = 24
integer width = 402
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체수량 0"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
if dwitemloc.rowcount() < 1 then return

long ll_row

dwitemloc.setredraw(false)
for ll_row = 1 to dwitemloc.rowcount()
	dwitemloc.object.balbf[ll_row] = 0
	dwitemloc.object.receipt_qty[ll_row] = 0
	dwitemloc.object.issue_qty[ll_row] = 0
	dwitemloc.object.qoh[ll_row] = 0
	dwitemloc.object.reserved[ll_row] = 0
next
dwitemloc.setredraw(true)
end if
end event

type cb_2 from commandbutton within tabpage_1
integer x = 5
integer y = 104
integer width = 402
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체현재고 0"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
if dwitemloc.rowcount() < 1 then return

long ll_row, ll_int
ll_int = messagebox("확인","ITEMLOC의 현재고로 ITEMLOC이월수량 및 ITEM현재고수량을 " + "~r~n" &
			            + "자동 역계산 하려면 YES를 선택하십시요",exclamation!, YesNoCancel! ,1 ) 
if ll_int < 1 or ll_int > 2 then return

dwitemloc.setredraw(false)
for ll_row = 1 to dwitemloc.rowcount()
	dwitemloc.object.qoh[ll_row] = 0
next
dwitemloc.setredraw(true)
if ll_int = 1 then
	cb_6.postevent(clicked!)
	cb_7.postevent(clicked!)
end if
end if
end event

type cb_3 from commandbutton within tabpage_1
integer x = 5
integer y = 184
integer width = 402
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체예약량 0"
end type

event clicked;if dwitemloc.rowcount() < 1 then return

long ll_row

dwitemloc.setredraw(false)
for ll_row = 1 to dwitemloc.rowcount()
	dwitemloc.object.reserved[ll_row] = 0
next
dwitemloc.setredraw(true)

end event

type cb_5 from commandbutton within tabpage_1
integer x = 5
integer y = 480
integer width = 402
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체삭제"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
	long ll_row, ll_cnt
	
	ll_cnt =  dwitemloc.rowcount()
	dwitemloc.setredraw(false)
	IF trim(THIS.text) = "전체삭제" then
		if ll_cnt < 1 then return
		dwitemloc.RowsMove(1, dwitemloc.RowCount(), Primary!, dwitemloc, 1, Delete!)
		this.text = "삭제취소"
	else
		IF trim(THIS.text) = "삭제취소" then
			dwitemloc.RowsMove(1, dwitemloc.DeletedCount(), Delete!, dwitemloc, 1, Primary!)
			this.text = "전체삭제"
		end if
	end if
	dwitemloc.setredraw(true)
	//for ll_row = 1 to ll_cnt
	//	dwitemloc.deleterow(1)
	//next
end if

end event

type cb_7 from commandbutton within tabpage_1
integer y = 684
integer width = 402
integer height = 168
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
end type

event clicked;if dwitemloc.rowcount() < 1 then return

long ll_row
decimal{4} ldc_qoh

dw_item_update.setredraw(false)
for ll_row = 1 to dwitemloc.rowcount()
	ldc_qoh = ldc_qoh + dwitemloc.object.qoh[ll_row]
next
dw_item_update.object.qoh[1] = ldc_qoh
dw_item_update.setredraw(true)

pb_save.postevent(clicked!)
end event

type cb_6 from commandbutton within tabpage_1
integer y = 556
integer width = 402
integer height = 124
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
end type

event clicked;if dwitemloc.rowcount() < 1 then return

long ll_row

dwitemloc.accepttext()

dwitemloc.setredraw(false)
for ll_row = 1 to dwitemloc.rowcount()
//	이월수량 = 현재고 + 출고 - 입고
	dwitemloc.object.balbf[ll_row] = dwitemloc.object.qoh[ll_row] &
											 + dwitemloc.object.issue_qty[ll_row] &
											 - dwitemloc.object.receipt_qty[ll_row]
//	dwitemloc.object.reserved[ll_row] = 0
next
dwitemloc.setredraw(true)
cb_7.postevent(clicked!)
end event

type st_4 from statictext within tabpage_1
integer x = 23
integer y = 572
integer width = 370
integer height = 92
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
string text = "현재고로 전체이월수량 계산"
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_1
integer x = 18
integer y = 696
integer width = 357
integer height = 148
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
string text = "현재고합계로 ITEM 현재고 UPDATE"
boolean focusrectangle = false
end type

type cb_8 from commandbutton within tabpage_1
integer y = 856
integer width = 402
integer height = 168
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
end type

event clicked;if dwitemloc.rowcount() < 1 then return

long ll_row
decimal{4} ldc_qoh

dw_item_update.setredraw(false)
for ll_row = 1 to dwitemloc.rowcount()
	ldc_qoh = ldc_qoh + dwitemloc.object.reserved[ll_row]
next
dw_item_update.object.sales_reserved[1] = ldc_qoh
dw_item_update.setredraw(true)


end event

type st_6 from statictext within tabpage_1
integer x = 23
integer y = 868
integer width = 361
integer height = 148
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
string text = "예약량합계로 ITEM 판매예약량 UPDATE"
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_1
integer x = 5
integer y = 264
integer width = 402
integer height = 24
boolean bringtotop = true
integer textsize = -5
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Terminal"
long textcolor = 33554432
long backcolor = 16711935
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_10 from statictext within tabpage_1
integer x = 5
integer y = 452
integer width = 402
integer height = 24
boolean bringtotop = true
integer textsize = -5
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Terminal"
long textcolor = 33554432
long backcolor = 16711935
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_1
integer x = 306
integer y = 296
integer width = 87
integer height = 56
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "⇒"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within tabpage_1
integer x = 5
integer y = 292
integer width = 402
integer height = 76
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "INSERT ROW   "
end type

event clicked;long ll_row

ll_row = wf_insertrow(dwitemloc)
dwitemloc.object.item_no[ll_row] = is_item
dwitemloc.object.qa[ll_row] = is_qa
gf_loghis("I",trim(trim(string(today())) + " U " + gs_userid))
gf_loghis("I","itemloc insertrow" + gs_userid)
gf_loghis("I",is_item + is_qa + gs_userid)

end event

type st_11 from statictext within tabpage_1
integer x = 306
integer y = 380
integer width = 87
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "⇒"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_9 from commandbutton within tabpage_1
integer y = 372
integer width = 402
integer height = 76
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "DELETE ROW   "
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
	long ll_row
	
	ll_row = dwitemloc.getrow()
	if ll_row < 1 then return
	
	dwitemloc.deleterow(ll_row)
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4398
integer height = 1368
long backcolor = 79741120
string text = "INAUDIT"
long tabtextcolor = 8388736
long tabbackcolor = 79741120
string picturename = "Sort!"
long picturemaskcolor = 553648127
dw_inaudit_update dw_inaudit_update
cb_10 cb_10
cb_44 cb_44
cb_11 cb_11
dw_10 dw_10
em_1 em_1
st_13 st_13
cb_99 cb_99
end type

on tabpage_2.create
this.dw_inaudit_update=create dw_inaudit_update
this.cb_10=create cb_10
this.cb_44=create cb_44
this.cb_11=create cb_11
this.dw_10=create dw_10
this.em_1=create em_1
this.st_13=create st_13
this.cb_99=create cb_99
this.Control[]={this.dw_inaudit_update,&
this.cb_10,&
this.cb_44,&
this.cb_11,&
this.dw_10,&
this.em_1,&
this.st_13,&
this.cb_99}
end on

on tabpage_2.destroy
destroy(this.dw_inaudit_update)
destroy(this.cb_10)
destroy(this.cb_44)
destroy(this.cb_11)
destroy(this.dw_10)
destroy(this.em_1)
destroy(this.st_13)
destroy(this.cb_99)
end on

type dw_inaudit_update from datawindow within tabpage_2
integer x = 361
integer y = 96
integer width = 3991
integer height = 1252
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_inaudit_update"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;if dwo.name = 'rcpt_qty' and 	this.object.inaudit_type[row] <> 'RT' then
	this.object.inaudit_type[row] = 'RT'
	this.object.issue_qty[row] = 0
elseif dwo.name = 'issue_qty' and this.object.inaudit_type[row] <> 'IT' then
	this.object.inaudit_type[row] = 'IT'
	this.object.rcpt_qty[row] = 0
end if
end event

type cb_10 from commandbutton within tabpage_2
integer y = 96
integer width = 361
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RETRIEVE"
end type

event clicked;long ll_row 

ll_row = dw_qa.getrow()
if ll_row < 1 then return

dwinaudit.Retrieve(date(em_1.text),is_item, is_qa)

end event

type cb_44 from commandbutton within tabpage_2
integer y = 288
integer width = 357
integer height = 76
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;long ll_row

ll_row = wf_insertrow(dw_inaudit_update)
dw_inaudit_update.object.inaudit_date[ll_row] = wf_today()
dw_inaudit_update.object.inaudit_item[ll_row] = is_item
dw_inaudit_update.object.qa[ll_row] = is_qa
if gs_area = 'S0001' then 
	dw_inaudit_update.object.loc_no[ll_row] = 'WS00000000'
elseif gs_area = 'H0001' then 
	dw_inaudit_update.object.loc_no[ll_row] = 'WS00000007'
elseif gs_area = 'T0001' then 
	dw_inaudit_update.object.loc_no[ll_row] = 'WS00000008'
elseif gs_area = 'B0001' then 
	dw_inaudit_update.object.loc_no[ll_row] = 'WS00000006'
end if
dw_inaudit_update.object.qa[ll_row] = is_qa
dw_inaudit_update.object.rem[ll_row] = trim(string(today())) + " - " + gs_userid
dw_inaudit_update.object.order_no[ll_row] = '재고오류'
dw_inaudit_update.object.inaudit_type[ll_row] = 'RT'
dw_inaudit_update.object.rcpt_qty[ll_row] = 0
dw_inaudit_update.object.issue_qty[ll_row] = 0
dw_inaudit_update.object.cost[ll_row] = 0
dw_inaudit_update.object.user_id[ll_row] = gs_userid

if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
	dw_inaudit_update.Object.loc_no.tabsequence = 1
else
	dw_inaudit_update.Object.loc_no.tabsequence = 0
end if

end event

type cb_11 from commandbutton within tabpage_2
integer y = 856
integer width = 352
integer height = 164
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "저장 INAUDIT"
end type

event clicked;if messagebox("저장", "저장하시겠습니까?", Exclamation!, OKCancel!, 1) <> 1 then
	return
end if
wf_update1(dw_inaudit_update, "Y")
gf_loghis("I",trim(trim(string(today())) + " U " + gs_userid))

end event

type dw_10 from datawindow within tabpage_2
integer x = 375
integer y = 8
integer width = 855
integer height = 88
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_location"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long ll_row 

ll_row = this.getrow()
if ll_row < 1 then return

dwinaudit.setfilter("loc_no = '" + data + "'")
dwinaudit.filter()


end event

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

type em_1 from editmask within tabpage_2
integer x = 1664
integer y = 8
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
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event constructor;this.text = string(today(),'yyyy/mm/dd')
end event

type st_13 from statictext within tabpage_2
integer x = 1550
integer y = 20
integer width = 96
integer height = 64
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
string text = ">="
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_99 from commandbutton within tabpage_2
integer y = 368
integer width = 357
integer height = 76
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "DELETE ROW"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
	long ll_row
	
	ll_row = dw_inaudit_update.getrow()
	if ll_row < 1 then return
	
	dw_inaudit_update.deleterow(ll_row)
	
end if
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4398
integer height = 1368
long backcolor = 79741120
string text = "ROUTTEMPNEW"
long tabtextcolor = 128
long tabbackcolor = 79741120
string picturename = "CrossTab!"
long picturemaskcolor = 553648127
dw_4 dw_4
cb_12 cb_12
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
end type

on tabpage_3.create
this.dw_4=create dw_4
this.cb_12=create cb_12
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.Control[]={this.dw_4,&
this.cb_12,&
this.cb_14,&
this.cb_15,&
this.cb_16}
end on

on tabpage_3.destroy
destroy(this.dw_4)
destroy(this.cb_12)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
end on

type dw_4 from datawindow within tabpage_3
integer x = 352
integer y = 12
integer width = 3986
integer height = 1324
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_update_routtempnew"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_12 from commandbutton within tabpage_3
integer y = 48
integer width = 343
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RETRIEVE"
end type

event clicked;PARENT.DW_4.RETRIEVE(is_item, is_qa)
end event

type cb_14 from commandbutton within tabpage_3
integer y = 292
integer width = 343
integer height = 108
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "INSERT"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
long ll_row

ll_row = wf_insertrow(DW_4)
DW_4.object.item_no[ll_row] = is_item
DW_4.object.qa[ll_row] = is_qa
end if
end event

type cb_15 from commandbutton within tabpage_3
integer y = 416
integer width = 343
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "DELETE"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
long ll_row

ll_row = dw_4.getrow()
if ll_row < 1 then return

dw_4.deleterow(ll_row)
end if
end event

type cb_16 from commandbutton within tabpage_3
integer y = 744
integer width = 343
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "UPDATE"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
	if messagebox("저장", "저장하시겠습니까?", Exclamation!, OKCancel!, 1) <> 1 then
		return
	end if
	wf_update1(dw_4, "Y")
end if
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4398
integer height = 1368
long backcolor = 79741120
string text = "MPSDET"
long tabtextcolor = 32896
long tabbackcolor = 79741120
string picturename = "ArrangeIcons!"
long picturemaskcolor = 553648127
cb_13 cb_13
cb_17 cb_17
cb_18 cb_18
cb_19 cb_19
dw_8 dw_8
end type

on tabpage_4.create
this.cb_13=create cb_13
this.cb_17=create cb_17
this.cb_18=create cb_18
this.cb_19=create cb_19
this.dw_8=create dw_8
this.Control[]={this.cb_13,&
this.cb_17,&
this.cb_18,&
this.cb_19,&
this.dw_8}
end on

on tabpage_4.destroy
destroy(this.cb_13)
destroy(this.cb_17)
destroy(this.cb_18)
destroy(this.cb_19)
destroy(this.dw_8)
end on

type cb_13 from commandbutton within tabpage_4
integer y = 36
integer width = 343
integer height = 108
integer taborder = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RETRIEVE"
end type

event clicked;PARENT.DW_8.RETRIEVE(is_item, is_qa)
end event

type cb_17 from commandbutton within tabpage_4
integer y = 280
integer width = 343
integer height = 108
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "INSERT"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
long ll_row

ll_row = wf_insertrow(DW_8)
DW_8.object.item_no[ll_row] = is_item
DW_8.object.qa[ll_row] = is_qa
end if
end event

type cb_18 from commandbutton within tabpage_4
integer y = 404
integer width = 343
integer height = 108
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "DELETE"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
long ll_row

ll_row = dw_8.getrow()
if ll_row < 1 then return

dw_8.deleterow(ll_row)
end if
end event

type cb_19 from commandbutton within tabpage_4
integer y = 732
integer width = 343
integer height = 108
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "UDPATE"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
if messagebox("저장", "저장하시겠습니까?", Exclamation!, OKCancel!, 1) <> 1 then
	return
end if
wf_update1(dw_8, "Y")
end if
end event

type dw_8 from datawindow within tabpage_4
integer x = 352
integer y = 32
integer width = 3977
integer height = 1316
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_update_mpsdet"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4398
integer height = 1368
long backcolor = 79741120
string text = "SALEDET"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom043!"
long picturemaskcolor = 553648127
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
cb_23 cb_23
dw_9 dw_9
end type

on tabpage_5.create
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.cb_23=create cb_23
this.dw_9=create dw_9
this.Control[]={this.cb_20,&
this.cb_21,&
this.cb_22,&
this.cb_23,&
this.dw_9}
end on

on tabpage_5.destroy
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.cb_23)
destroy(this.dw_9)
end on

type cb_20 from commandbutton within tabpage_5
integer y = 36
integer width = 343
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RETRIEVE"
end type

event clicked;PARENT.DW_9.RETRIEVE(is_item, is_qa)
end event

type cb_21 from commandbutton within tabpage_5
integer y = 280
integer width = 343
integer height = 108
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "INSERT"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
long ll_row

ll_row = wf_insertrow(DW_9)
DW_9.object.item_no[ll_row] = is_item
DW_9.object.qa[ll_row] = is_qa
end if
end event

type cb_22 from commandbutton within tabpage_5
integer y = 404
integer width = 343
integer height = 108
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "DELETE"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
long ll_row

ll_row = dw_9.getrow()
if ll_row < 1 then return

dw_9.deleterow(ll_row)
end if
end event

type cb_23 from commandbutton within tabpage_5
integer y = 732
integer width = 343
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "UPDATE"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
if messagebox("저장", "저장하시겠습니까?", Exclamation!, OKCancel!, 1) <> 1 then
	return
end if
wf_update1(dw_9, "Y")
end if
end event

type dw_9 from datawindow within tabpage_5
integer x = 352
integer y = 24
integer width = 4009
integer height = 1312
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_update_saledet"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_6 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4398
integer height = 1368
long backcolor = 79741120
string text = "MPS"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Window!"
long picturemaskcolor = 553648127
dw_11 dw_11
cb_31 cb_31
cb_32 cb_32
cb_33 cb_33
cb_34 cb_34
end type

on tabpage_6.create
this.dw_11=create dw_11
this.cb_31=create cb_31
this.cb_32=create cb_32
this.cb_33=create cb_33
this.cb_34=create cb_34
this.Control[]={this.dw_11,&
this.cb_31,&
this.cb_32,&
this.cb_33,&
this.cb_34}
end on

on tabpage_6.destroy
destroy(this.dw_11)
destroy(this.cb_31)
destroy(this.cb_32)
destroy(this.cb_33)
destroy(this.cb_34)
end on

type dw_11 from datawindow within tabpage_6
integer x = 352
integer y = 20
integer width = 3986
integer height = 1304
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_update_mps"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_31 from commandbutton within tabpage_6
integer y = 36
integer width = 343
integer height = 108
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RETRIEVE"
end type

event clicked;PARENT.DW_11.RETRIEVE(is_item, is_qa)
end event

type cb_32 from commandbutton within tabpage_6
integer y = 280
integer width = 343
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "INSERT"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
long ll_row

ll_row = wf_insertrow(DW_11)
DW_11.object.item_no[ll_row] = is_item
DW_11.object.qa[ll_row] = is_qa
end if
end event

type cb_33 from commandbutton within tabpage_6
integer y = 404
integer width = 343
integer height = 108
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "DELETE"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
long ll_row

ll_row = DW_11.getrow()
if ll_row < 1 then return

DW_11.deleterow(ll_row)
end if
end event

type cb_34 from commandbutton within tabpage_6
integer y = 732
integer width = 343
integer height = 108
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "UPDATE"
end type

event clicked;if gs_userid = "root" or gs_userid = "1999010s" or gs_userid = "1999010h" then
if messagebox("저장", "저장하시겠습니까?", Exclamation!, OKCancel!, 1) <> 1 then
	return
end if
wf_update1(DW_11, "Y")
end if
end event

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4398
integer height = 1368
long backcolor = 79741120
string text = "일/월누계트리거"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_13 dw_13
dw_14 dw_14
cb_24 cb_24
cb_25 cb_25
cb_26 cb_26
dw_15 dw_15
end type

on tabpage_7.create
this.dw_13=create dw_13
this.dw_14=create dw_14
this.cb_24=create cb_24
this.cb_25=create cb_25
this.cb_26=create cb_26
this.dw_15=create dw_15
this.Control[]={this.dw_13,&
this.dw_14,&
this.cb_24,&
this.cb_25,&
this.cb_26,&
this.dw_15}
end on

on tabpage_7.destroy
destroy(this.dw_13)
destroy(this.dw_14)
destroy(this.cb_24)
destroy(this.cb_25)
destroy(this.cb_26)
destroy(this.dw_15)
end on

type dw_13 from datawindow within tabpage_7
integer x = 14
integer y = 24
integer width = 1294
integer height = 1008
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_ineoday_vs_ineoym"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_14 from datawindow within tabpage_7
integer x = 1321
integer y = 100
integer width = 1440
integer height = 932
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_ineoday_vs_inaudit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() < 1 then return

this.SelectRow(0, false)
this.SelectRow(currentrow, TRUE)

end event

type cb_24 from commandbutton within tabpage_7
integer x = 1330
integer y = 16
integer width = 325
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<=조회"
end type

event clicked;//parent.dw_13.SetTransObject(SQLCA)
//parent.dw_13.retrieve()
end event

type cb_25 from commandbutton within tabpage_7
integer x = 2770
integer y = 104
integer width = 361
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<=조회"
end type

event clicked;//parent.dw_14.SetTransObject(SQLCA)
//parent.dw_14.retrieve()
end event

type cb_26 from commandbutton within tabpage_7
integer x = 3159
integer y = 104
integer width = 361
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계산"
end type

event clicked;//datawindow dw14, dw15
//string ls_item, ls_qa
//long ll_row, ll_dw15row, ll_cnt
//date ldt_date 
//
//dw14 = parent.dw_14
//dw15 = parent.dw_15
//parent.dw_15.SetTransObject(SQLCA)
//
//for ll_row = 1 to dw14.rowcount()
//	dw14.scrolltorow(ll_row)
//	ls_item = dw14.object.ineoday_item_no[ll_row]
//	ls_qa = dw14.object.ineoday_qa[ll_row]
//	ldt_date = date(mid(dw14.object.ineoday_cdate[ll_row], 1, 4) +"/" &
//						+ mid(dw14.object.ineoday_cdate[ll_row], 5, 2) +"/" &
//						+ mid(dw14.object.ineoday_cdate[ll_row], 7, 2) )
//	
//	ll_cnt = dw15.retrieve(ldt_date, ls_item, ls_qa)
//	for ll_dw15row = 1 to ll_cnt
//		dw15.scrolltorow(ll_dw15row)
//		dw15.object.inaudit_date[ll_dw15row] = datetime(ldt_date)
//		dw15.SetItemStatus(ll_dw15row, 0, Primary!, DataModified!)
//	next
//	dw15.accepttext()
//	wf_update1(dw15,"N")
//next
//
//
end event

type dw_15 from datawindow within tabpage_7
integer x = 2766
integer y = 196
integer width = 759
integer height = 844
integer taborder = 280
boolean bringtotop = true
string dataobject = "d_inaudit_update2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() < 1 then return

this.SelectRow(0, false)
this.SelectRow(currentrow, TRUE)

end event

type ddplb_1 from dropdownpicturelistbox within w_itemstatus_check
integer x = 590
integer y = 304
integer width = 690
integer height = 636
integer taborder = 270
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"ALL","<> QOH","QOH < 0","<> RESERVED","RESERVED < 0"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3,4,5}
string picturename[] = {"Library!","Custom027!","Custom080!","Custom038!","Custom009!"}
long picturemaskcolor = 553648127
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		dw_qa.dataobject = 'd_item_qa'
		dw_qa.SetTransObject(SQLCA)
		ii_picindex  = 1
	CASE 2
		dw_qa.dataobject = 'd_itemerror_qa'
		dw_qa.SetTransObject(SQLCA)
		ii_picindex  = 2
	CASE 3
		dw_qa.dataobject = 'd_itemzero_qa'
		dw_qa.SetTransObject(SQLCA)
		ii_picindex  = 3
	CASE 4
		dw_qa.dataobject = 'd_reservederror_qa'
		dw_qa.SetTransObject(SQLCA)
		ii_picindex  = 4
	CASE 5
		dw_qa.dataobject = 'd_reservedzero_qa'
		ii_picindex  = 5
		dw_qa.SetTransObject(SQLCA)
END CHOOSE

end event

type dw_item from datawindow within w_itemstatus_check
integer x = 41
integer y = 400
integer width = 1138
integer height = 552
integer taborder = 140
string dataobject = "d_item_item"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row 

ll_row = this.getrow()
if ll_row < 1 then return

is_item = this.object.item_no[ll_row]
dw_qa.retrieve(is_item)
end event

event retrieveend;if this.rowcount() < 1 then return

this.triggerevent(rowfocuschanged!)
end event

type st_7 from statictext within w_itemstatus_check
integer x = 55
integer y = 308
integer width = 466
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "CHECK VALUE :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_itemstatus_check
integer x = 41
integer y = 220
integer width = 160
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "코드"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_itemstatus_check
integer x = 585
integer y = 220
integer width = 105
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "명"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_12 from statictext within w_itemstatus_check
integer x = 1774
integer y = 12
integer width = 782
integer height = 108
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_insert from commandbutton within w_itemstatus_check
integer x = 1367
integer y = 24
integer width = 133
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "none"
end type

event clicked;//wf_insert("M2Z0POWZZZ","Awf_insert("M2Z0LIQKZZ","YCNA791") ;
//wf_insert("M2Z0LIQKZZ","YK511") ;
//wf_insert("M2Z0LIQKZZ","우레탄") ;


 messagebox("저장", "저장되었습니다")
end event

type dw_12 from datawindow within w_itemstatus_check
integer x = 1787
integer y = 24
integer width = 754
integer height = 84
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_clock"
boolean resizable = true
boolean livescroll = true
end type

event constructor;time(5)
end event

type cb_27 from commandbutton within w_itemstatus_check
integer x = 1509
integer y = 24
integer width = 133
integer height = 88
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "none"
end type

event clicked;//dw_16.reset()
//dw_16.settransobject(sqlca)
//dw_16.retrieve()
//long ll_row
//for ll_row = 1 to dw_16.rowcount()
//	dw_16.object.rem[ll_row] = 'a'
//next
//dw_16.accepttext()
//wf_update1(dw_16, "Y")
//update aroiinv set rem = null
//where oi_date >'2004/01/01';
//commit;
//messagebox("",string( today()))
//run( 'C:\MSSQL\BINN\ISQLW.EXE /U sa /d yc /q "select * from login" /P yc.sa /S yoochang\yc\sa ');
//dw_17.settransobject(sqlca)
//dw_17.retrieve()
//long ll_row
//for ll_row = 1 to dw_17.rowcount()
//	dw_17.object.sfcret_wcoil_no[ll_row] = dw_17.object.ccoil[ll_row]
//next
//wf_update1(dw_17, "Y")
//
end event

type dw_17 from datawindow within w_itemstatus_check
integer x = 2734
integer y = 204
integer width = 128
integer height = 88
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_sfcret_wcoil_update"
boolean livescroll = true
end type

type dw_16 from datawindow within w_itemstatus_check
integer x = 2875
integer y = 204
integer width = 128
integer height = 88
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_aroiinv_update"
boolean livescroll = true
end type

