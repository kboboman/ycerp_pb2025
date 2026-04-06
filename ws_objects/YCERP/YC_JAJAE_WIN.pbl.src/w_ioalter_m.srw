$PBExportHeader$w_ioalter_m.srw
$PBExportComments$물품대체관리(1998/03/06,곽용덕)
forward
global type w_ioalter_m from w_inheritance
end type
type em_1 from editmask within w_ioalter_m
end type
type em_2 from editmask within w_ioalter_m
end type
type gb_4 from groupbox within w_ioalter_m
end type
type tab_1 from tab within w_ioalter_m
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
type st_3 from statictext within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_3 st_3
dw_4 dw_4
end type
type tab_1 from tab within w_ioalter_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_5 from datawindow within w_ioalter_m
end type
type st_2 from statictext within w_ioalter_m
end type
type st_1 from statictext within w_ioalter_m
end type
end forward

global type w_ioalter_m from w_inheritance
integer x = 23
integer y = 48
integer width = 4078
integer height = 2352
string title = "물품대체 관리(w_ioalter_m)"
em_1 em_1
em_2 em_2
gb_4 gb_4
tab_1 tab_1
dw_5 dw_5
st_2 st_2
st_1 st_1
end type
global w_ioalter_m w_ioalter_m

type variables
datawindowchild idwc_item, idwc_qa, idwc_loc
datawindowchild idwc_item1,idwc_qa1, idwc_loc1
datawindow dw3 , dw4 
string is_select, is_item_select 
end variables

forward prototypes
public function boolean wf_save2 ()
public function boolean wf_save3 (long arg_row)
end prototypes

public function boolean wf_save2 ();string ls_srcitem, ls_srcqa, ls_srcloc, ls_srclot, ls_srcrem, ls_order
string ls_taritem, ls_tarqa, ls_tarloc, ls_tarlot, ls_tarrem
string ls_old_time
long   ll_count
int    li_seq
date   ld_date
real   lr_srcqty, lr_tarqty
datetime ldt_date

dw4.accepttext()
//--------------------------------------------------------------
ld_date  = date(dw4.object.alter_date[1])
ldt_date = dw4.object.alter_time[1]
ls_order = dw4.object.order_no[1]
if isnull(ls_order) then ls_order = 'w_oialter_m'
li_seq   = dw4.object.seq[1]
//--------------------------------------------------------------
ls_srcitem = trim(dw4.object.src_item[1])
ls_srcqa   = trim(dw4.object.src_qa[1])
ls_srcloc  = trim(dw4.object.src_loc[1])
ls_srclot  = trim(dw4.object.src_lot[1])
lr_srcqty  = dw4.object.src_qty[1]
ls_srcrem  = ls_srcitem + ls_srcqa
//---------------------------------------------------------------
ls_taritem = trim(dw4.object.tar_item[1])
ls_tarqa   = trim(dw4.object.tar_qa[1])
ls_tarloc  = trim(dw4.object.tar_loc[1])
ls_tarlot  = trim(dw4.object.tar_lot[1])
lr_tarqty  = dw4.object.tar_qty[1]
ls_tarrem  = ls_taritem + ls_tarqa
//---------------------------------------------------------------

ls_old_time = string(now(),'hh:mm:ss:fff')

for ll_count = 1 to 100000
    IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
       ls_old_time  = string(now(),'hh:mm:ss:fff')	
		 exit
	 END IF	
NEXT

// 대체출고
INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,order_no,rcpt_qty,
  	    issue_qty,cost,rem, serial_id, destination, user_id)
VALUES (getdate(),:ld_date,:ls_srcitem,:ls_srcqa,:ls_srcloc,'IA',:ls_order,0,    
	    :lr_srcqty,0,:ls_tarrem, :ls_srclot, :ls_tarloc, :gs_userid);   
if sqlca.sqlcode < 0 then
   messagebox('오류1',SQLCA.SQLERRTEXT,exclamation!)
   return false
end if

for ll_count = 1 to 100000
    if ls_old_time <> string(now(),'hh:mm:ss:fff') then
       ls_old_time  = string(now(),'hh:mm:ss:fff')	
		 exit
	end if
next

// 대체입고
INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,order_no,
  	    rcpt_qty,issue_qty,cost,rem, serial_id, destination, user_id)
values (:ldt_date,:ld_date,:ls_taritem,:ls_tarqa,:ls_tarloc,'RA',:ls_order,
	     :lr_tarqty, 0, 0, :ls_srcrem, :ls_tarlot, :ls_srcloc, :gs_userid);   
if sqlca.sqlcode < 0 then
   messagebox('오류2',SQLCA.SQLERRTEXT,exclamation!)
   return false
end if

return true

end function

public function boolean wf_save3 (long arg_row);string ls_srcitem, ls_srcqa, ls_srcloc, ls_srclot, ls_srcrem, ls_order
string ls_taritem, ls_tarqa, ls_tarloc, ls_tarlot, ls_tarrem
string ls_old_time
long   ll_count
int    li_seq
real   lr_srcqty, lr_tarqty
date   ldt_date

dw3.accepttext()
//--------------------------------------------------------------
ls_order = dw3.GetItemstring(arg_row,"order_no")
ldt_date = date(dw3.GetItemdatetime(arg_row,"alter_date"))
if isnull(ls_order) then ls_order = 'w_oialter_m'
li_seq = dw3.GetItemnumber(arg_row,"seq")
//--------------------------------------------------------------
ls_srcitem = trim(dw3.GetItemstring(arg_row,"src_item"))
ls_srcqa   = trim(dw3.GetItemstring(arg_row,"src_qa"))
ls_srcloc  = trim(dw3.GetItemstring(arg_row,"src_loc"))
ls_srclot  = trim(dw3.GetItemstring(arg_row,"src_lot"))
lr_srcqty  = dw3.GetItemdecimal(arg_row,"src_qty")
ls_srcrem  = ls_srcitem + ls_srcqa
//---------------------------------------------------------------
ls_taritem = trim(dw3.GetItemstring(arg_row,"tar_item"))
ls_tarqa   = trim(dw3.GetItemstring(arg_row,"tar_qa"))
ls_tarloc  = trim(dw3.GetItemstring(arg_row,"tar_loc"))
ls_tarlot  = trim(dw3.GetItemstring(arg_row,"tar_lot"))
lr_tarqty  = dw3.GetItemdecimal(arg_row,"tar_qty")
ls_tarrem  = ls_taritem + ls_tarqa
//---------------------------------------------------------------

ls_old_time = string(now(),'hh:mm:ss:fff')

for ll_count = 1 to 100000
    if ls_old_time <> string(now(),'hh:mm:ss:fff') then
       ls_old_time  = string(now(),'hh:mm:ss:fff')	
		 exit
	end if	
next

// 대체출고
INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,order_no,rcpt_qty,
  	    issue_qty,cost,rem, serial_id, destination, user_id)
VALUES (getdate(),:ldt_date,:ls_srcitem,:ls_srcqa,:ls_srcloc,'IA',:ls_order,0,    
	    :lr_srcqty * -1, 0, :ls_tarrem, :ls_srclot, :ls_tarloc, :gs_userid);   
		 
if sqlca.sqlcode < 0 then
   messagebox('오류1',SQLCA.SQLERRTEXT,exclamation!)
   return false
end if

for ll_count = 1 to 100000
    if ls_old_time <> string(now(), 'hh:mm:ss:fff') then
       ls_old_time  = string(now(), 'hh:mm:ss:fff')	
		 exit
	end if
next

// 대체입고
INSERT INTO inaudit (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,order_no,
  	    rcpt_qty, issue_qty, cost, rem, serial_id, destination, user_id)
VALUES (getdate(),:ldt_date,:ls_taritem,:ls_tarqa,:ls_tarloc,'RA',:ls_order,
	    :lr_tarqty * -1, 0, 0, :ls_srcrem, :ls_tarlot, :ls_srcloc, :gs_userid);   
if sqlca.sqlcode < 0 then
   messagebox('오류2',SQLCA.SQLERRTEXT,exclamation!)
   return false
end if

return true

end function

on w_ioalter_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.gb_4=create gb_4
this.tab_1=create tab_1
this.dw_5=create dw_5
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.gb_4
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
end on

on w_ioalter_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.gb_4)
destroy(this.tab_1)
destroy(this.dw_5)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4

dw3.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)

dw_1.visible = false

/* 2018.12.6 jowonsuk
dw4.getchild('src_item',idwc_item)
gs_ds_itemall.ShareData(idwc_item)
idwc_item.setfilter(' not(item_no > "PZZZ") ')
idwc_item.filter()
*/
STRING ls_clause, ls_where

//dw4.getchild('src_item',idwc_item)
//idwc_item.settransobject(sqlca)
//is_item_select = idwc_item.Describe("DataWindow.Table.Select")
//ls_clause = " and NOT (ITEM_NO > ~~'" + "PZZZ" + "~~' )" 
//ls_where  = "DataWindow.Table.Select='"  + is_item_select + ls_clause + "'"
//idwc_item.Modify(ls_where)
//idwc_item.settransobject(sqlca)
//idwc_item.retrieve()

dw4.getchild('src_item',idwc_item)
GS_DS_ItemAll.ShareData(idwc_item)

idwc_item.setfilter(' not (item_no > "PZZZ") ')
idwc_item.filter()


idwc_item.setsort(' item_name asc ')
idwc_item.sort()



dw4.getchild('src_qa',idwc_qa)
idwc_qa.insertrow(1)
idwc_qa.SetTransObject(SQLCA)
is_select = idwc_qa.Describe("DataWindow.Table.Select")
gs_ds_qaall.ShareData(idwc_qa)
dw4.getchild('src_loc',idwc_loc)
idwc_loc.settransobject(sqlca)


/*
dw4.getchild('tar_item',idwc_item1)
gs_ds_itemall.ShareData(idwc_item1)
*/

//dw4.getchild('tar_item',idwc_item1)
//idwc_item1.settransobject(sqlca)
//is_item_select = idwc_item1.Describe("DataWindow.Table.Select")
//ls_where  = is_item_select
//idwc_item1.Modify(ls_where)
//idwc_item1.settransobject(sqlca)
//idwc_item1.retrieve()

dw4.getchild('tar_item',idwc_item1)
GS_DS_ItemAll.ShareData(idwc_item1)

idwc_item1.setsort(' item_name asc ')
idwc_item1.sort()

dw4.getchild('tar_qa',idwc_qa1)
idwc_qa1.insertrow(1)
idwc_qa1.SetTransObject(SQLCA)
gs_ds_qaall.ShareData(idwc_qa1)

dw4.getchild('tar_loc',idwc_loc1)
idwc_loc1.settransobject(sqlca)

//idwc_loc.retrieve()
//idwc_loc1.retrieve()
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

dw_5.settransobject(sqlca)
dw_5.insertrow(0)

datawindowchild ldwc_loc3

dw_5.getchild('loc_no',ldwc_loc3)
ldwc_loc3.insertrow(1)
ldwc_loc3.setitem(1, "loc_no", "%")
ldwc_loc3.setitem(1, "loc_name", "전체")

string ls_location, ls_locno

SELECT def_loc INTO :ls_location FROM area WHERE area_no = :gs_area;

if isnull(ls_location) or ls_location = "" then
else
	
	SELECT loc_no INTO :ls_locno FROM location WHERE loc_manager = :gs_userid;
	
	if isnull(ls_locno) OR ls_locno = "" then
	else
		ls_location = ls_locno
	end if
	
	dw_5.object.loc_no[1] = ls_location
	dw_5.accepttext()
end if

if GF_Permission('물품대체_관리', gs_userid) = 'Y' then	
	if GF_Permission('물품대체관리_LOT번호', gs_userid) = 'Y' then	
	else
		dw4.object.src_loc.tabsequence = 0
		dw4.object.tar_loc.tabsequence = 0
	end if
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

end event

event resize;call super::resize;//
long  ll_width, ll_height
gb_3.width   = newwidth  - (gb_3.x * 2)

tab_1.width  = newwidth  - (gb_3.x * 2)
tab_1.height = newheight - tab_1.y - gb_3.x

ll_width     = tab_1.tabpage_1.width 
ll_height    = tab_1.tabpage_1.height

tab_1.tabpage_1.dw_3.width  = ll_width
tab_1.tabpage_1.dw_3.height = ll_height - tab_1.tabpage_1.dw_3.y

tab_1.tabpage_2.dw_4.width  = ll_width
tab_1.tabpage_2.dw_4.height = ll_height - tab_1.tabpage_2.dw_4.y

end event

type pb_save from w_inheritance`pb_save within w_ioalter_m
integer x = 2789
integer y = 56
integer taborder = 50
end type

event pb_save::clicked;long ll_row
string 	ls_yyyymm, ls_magamyn // 2017.10.24 조원석

dw4.accepttext()

/* 마감관리 로직 반영 2017.10.24 조원석 */
/* sys_gb = '10' (10)구매 마감 로직 	 시작 */
ls_yyyymm = string(dw4.object.alter_date[1], "yyyymm")

SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '10';

//if ls_magamyn <> "N" then
//	MessageBox('확인','해당년월은 마감되었습니다.~n~n',Stopsign!)
//	return
//end if

/* 마감관리 로직 반영 2017.10.24 조원석  끝 */


if dw4.rowcount() < 1 or dw4.enabled = false then return

if dw4.object.src_qty[1] < 0 then
  MessageBox("확인", "대체수량이 0보다 작습니다.")
  dw4.setcolumn('src_qty')
  dw4.setfocus()
  return
end if

if dw4.object.tar_qty[1] < 0 then
  MessageBox("확인", "대체수량이 0보다 작습니다.")
  dw4.setcolumn('tar_qty')
  dw4.setfocus()
  return
end if

if dw4.object.src_qty[1] > dw4.object.qoh[1] then
  MessageBox("확인", "대체수량이 현재고량보다 큽니다.")
  dw4.setcolumn('src_qty')
  dw4.setfocus()
  return
end if

dw4.object.alter_time[1] = gf_today()
if wf_save2() = false then
	rollback;
	return
end if

if wf_update1(dw4,"Y") then
	dw4.enabled = false
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_ioalter_m
integer x = 59
integer y = 172
integer width = 91
integer height = 64
integer taborder = 70
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ioalter_m
integer x = 37
integer y = 24
integer width = 1019
integer height = 136
string text = "물품대체 관리"
end type

type st_tips from w_inheritance`st_tips within w_ioalter_m
end type

type pb_compute from w_inheritance`pb_compute within w_ioalter_m
boolean visible = false
integer x = 2299
integer y = 532
integer taborder = 110
string picturename = "c:\bmp\pencil.bmp"
end type

type pb_print_part from w_inheritance`pb_print_part within w_ioalter_m
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_ioalter_m
integer x = 2981
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioalter_m
boolean visible = false
integer x = 2482
integer taborder = 140
end type

type pb_cancel from w_inheritance`pb_cancel within w_ioalter_m
boolean visible = false
integer x = 2309
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_ioalter_m
integer x = 2597
integer y = 56
integer taborder = 160
end type

event pb_delete::clicked;long   ll_row
string ls_flag

if dw3.getrow() < 1 then return

ll_row = dw3.getrow()
if messagebox("확인", '선택한 자료를 삭제하시겠습니까?', Exclamation!, OKCancel!, 2) = 2 then
	return
end if

ls_flag = dw3.object.issue_flag[ll_row]
if ls_flag = 'Y' then
	if wf_save3(ll_row) = false then
		rollback;
		return
	end if
end if

dw3.deleterow(ll_row)
wf_update1(dw3,"Y")

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "D", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type pb_insert from w_inheritance`pb_insert within w_ioalter_m
integer x = 2405
integer y = 56
integer taborder = 170
end type

event pb_insert::clicked;string ls_name, ls_locno

tab_1.selecttab(2)
dw4.reset()
dw4.enabled = true

dw_5.accepttext()

ls_locno = dw_5.object.loc_no[1]

dw4.insertrow(1)
dw4.object.src_loc[1]    = ls_locno
dw4.object.tar_loc[1]    = ls_locno
dw4.object.alter_date[1] = wf_today()
dw4.object.alter_time[1] = wf_today()
dw4.object.user_id[1]    = gs_userid

dw4.setcolumn('tar_item')
dw4.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ioalter_m
integer x = 2208
integer y = 56
integer taborder = 30
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

tab_1.selecttab(1)
dw3.reset()
string ls_loc

ls_loc = dw_5.object.loc_no[1]

if dw3.retrieve(date(em_1.text), date(em_2.text), ls_loc) < 1 then
	messagebox('확인','해당기간에는 자료가 없읍니다.',information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ioalter_m
integer x = 32
integer y = 244
integer width = 3895
integer height = 160
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ioalter_m
boolean visible = false
integer y = 508
integer width = 3447
integer height = 1408
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_ioalter_m
integer x = 2176
integer y = 8
integer width = 1019
integer height = 220
integer taborder = 60
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ioalter_m
boolean visible = false
integer x = 114
integer y = 260
integer width = 2546
integer height = 252
integer taborder = 80
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type em_1 from editmask within w_ioalter_m
integer x = 1381
integer y = 52
integer width = 366
integer height = 72
integer taborder = 10
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
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_ioalter_m
integer x = 1755
integer y = 52
integer width = 366
integer height = 72
integer taborder = 20
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
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type gb_4 from groupbox within w_ioalter_m
integer x = 1138
integer y = 8
integer width = 1024
integer height = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type tab_1 from tab within w_ioalter_m
integer x = 37
integer y = 424
integer width = 3895
integer height = 1684
integer taborder = 130
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

event selectionchanged;//
if GF_PERMISSION('물품대체_관리', gs_userid) = 'Y' then	
	choose case newindex
		case 1
			pb_retrieve.enabled = true
			pb_insert.enabled   = false
			pb_delete.enabled   = true
			pb_save.enabled     = false
			
		case 2
			pb_retrieve.enabled = false
			pb_insert.enabled   = true
			pb_delete.enabled   = false
			pb_save.enabled     = true
			
		case else		
	end choose
end if
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3858
integer height = 1556
long backcolor = 79741120
string text = "조회"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Search!"
long picturemaskcolor = 553648127
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
integer y = 100
integer width = 3835
integer height = 1444
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_ioalter_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 물품코드 1자리 : 물품구분   (G: 상품, P: 제품, M: 원재료)
//        2,3자리 : 대, 중분류
//          4자리 : 소재       (S: 스틸, A: 알미늄, U: 스텐레스, G: 석고, B: 동, P: P.V.C, Z: 기타)
//      5,6,7자리 : 품명
//          8자리 : KS/BS      (K: KS, B: BS, Z: 기타)
//          9자리 : 유무공     (0: 무공, 1: 펀칭, 2: 전면타공 무, 3: 전면타공 유, 4: 부분타공(무), 5: 부분타공(유), Z: 기타) 
//         10자리 : 색상       (0: 무동장, R: 롤아이보리, I: 도장아이보리, K: 카파, S: 실버, F: 펜시, G: 골드  )
//                             (W: T-Bar 백색, L: 라미네이트, B: 검정, 1: YC-001, 3: YC-003, 4: YC-004, Z: 기타)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string ls_sitem1, ls_sitem4, ls_titem1, ls_titem4

if isnull(currentrow) OR currentrow < 1 then RETURN
if isnull(newrow) OR newrow < 1 then RETURN

ls_sitem1 = MidA(this.object.src_item[currentrow],1,1)
ls_sitem4 = MidA(this.object.src_item[currentrow],4,1)

ls_titem1 = MidA(this.object.tar_item[currentrow],1,1)
ls_titem4 = MidA(this.object.tar_item[currentrow],4,1)

if ls_sitem1 <> ls_titem1 then
	MessageBox("확인", "물품코드 1자리(물품구분)이 다른것은 대체할 수 없습니다.(G:상품, P:제품, M:원재료)")
	return
end if

if ls_sitem4 <> ls_titem4 then
	MessageBox("확인", "물품코드 4자리(소재)가 다른것은 대체할 수 없습니다.~n~n(S: 스틸, A:알미늄, U:스텐레스, G:석고, B:동, P:PVC, Z:기타)")
	return 
end if

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3858
integer height = 1556
long backcolor = 79741120
string text = "추가 "
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Prior5!"
long picturemaskcolor = 553648127
st_3 st_3
dw_4 dw_4
end type

on tabpage_2.create
this.st_3=create st_3
this.dw_4=create dw_4
this.Control[]={this.st_3,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.st_3)
destroy(this.dw_4)
end on

type st_3 from statictext within tabpage_2
integer x = 3273
integer y = 36
integer width = 562
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
string text = "물품대체관리_LOT번호"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_4 from datawindow within tabpage_2
integer y = 100
integer width = 3835
integer height = 1444
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_ioalter_m"
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
string ls_item, ls_str, ls_qa, ls_uom, ls_itemname, ls_loc, ls_str1, ls_supp, ls_wc, ls_str2
string ls_clause, ls_where
int    li_ret
real   lr_cost, lr_qoh
long   ll_cnt

this.accepttext()

choose case dwo.name
	case 'src_item'
			ls_str = data
			
			debugbreak()
			setnull(ls_item)
			SELECT item_no,item_name,uom INTO :ls_item, :ls_itemname, :ls_uom FROM groupitem WHERE item_no = :ls_str;
			if isnull(ls_item) then
				MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
				RETURN 1
			end if
			
			SELECT count(*) INTO :ll_cnt FROM groupitem WHERE item_no = :ls_str AND use_flag = 'C';
			if ll_cnt > 0 then
				MessageBox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
							+ "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
				RETURN 1
			end if
			
			this.object.item_name1[row] = ls_itemname
			this.object.uom1[row]       = ls_uom
			
//			this.getchild('src_item',idwc_item)
//			GS_DS_ItemAll.ShareData(idwc_item)
//
//			idwc_item.setfilter(' not (item_no > "PZZZ") ')
//		 	idwc_item.filter()

//			this.getchild("src_qa", idwc_qa)
//			ls_clause = " and item.item_no = ~~'" + ls_str + "~~'" 
//			ls_where  = "DataWindow.Table.Select='"  + is_select + ls_clause + "'"
//			idwc_qa.Modify(ls_where)
//			idwc_qa.settransobject(sqlca)
//			idwc_qa.retrieve()
			
			idwc_qa.setfilter("item_no = '" + ls_str + "'")
		 	idwc_qa.filter()
			 
			idwc_qa.SetSort("qa asc")
			idwc_qa.Sort( ) 
			 
			
//		   if idwc_qa.rowcount() = 1 then
//			  ls_str2 = ls_str
//			  ls_str = trim(idwc_qa.getitemstring(1,'qa'))
//			  this.object.src_qa[row] = ls_str
//			  setnull(ls_item)
//			  goto label_qa
//	      else
//			  setnull(ls_item)
//			  this.object.src_qa[row] = ls_item
//		   end if

	case 'src_qa'
		ls_str  = data
		ls_item = trim(this.object.src_item[1])

		SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_item AND qa = :ls_str AND use_flag = 'C';
		if ll_cnt > 0 then
			MessageBox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			RETURN 1
		end if

//label_qa:		  
		ls_str1 = trim(this.object.src_item[row])
		lr_qoh  = 0
		ls_qa   = trim(this.object.src_qa[1])
		ls_loc  = trim(this.object.src_loc[1])
		if isnull(ls_loc) then
			SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;
			this.object.src_loc[1] = ls_loc
			this.object.tar_loc[1] = ls_loc
		end if
		
		SELECT qoh INTO :lr_qoh FROM itemloc WHERE item_no = :ls_item AND qa = :ls_qa AND loc_no = :ls_loc;
		this.object.qoh[row] = lr_qoh

	case 'src_loc'
		ls_str  = data
		ls_item = trim(this.object.src_item[1])
		ls_qa   = trim(this.object.src_qa[1])
		ls_loc  = trim(this.object.src_loc[1])
		lr_qoh  = 0

		SELECT qoh INTO :lr_qoh FROM itemloc WHERE item_no = :ls_item AND qa = :ls_qa AND loc_no = :ls_loc;
		this.object.qoh[row] = lr_qoh

	case 'src_qty'
		if this.object.src_qty[row] > this.object.qoh[row] then
			MessageBox("확인", "대체수량이 현재고량보다 큽니다.")
			RETURN 1
		end if
		this.object.tar_qty[row] = this.object.src_qty[row]

	case 'tar_item'
		ls_str = data
		select count(*) into :ll_cnt from groupitem where item_no = :ls_str and use_flag = 'C';
		if ll_cnt > 0 then
			MessageBox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
						+ "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			RETURN 1
		end if
		
		setnull(ls_item)
		SELECT item_no,item_name,uom INTO :ls_item,:ls_itemname,:ls_uom FROM groupitem WHERE item_no = :ls_str;
		if isnull(ls_item) then
			MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			RETURN 1
		end if

		this.object.item_name2[row] = ls_itemname
		this.object.uom2[row] = ls_uom
//		this.getchild('tar_item',idwc_item1)
//		GS_DS_ItemAll.ShareData(idwc_item1)
		
/*		2018.12.6 jowonsuk  주석처리
		this.getchild("tar_qa", idwc_qa1)
		ls_clause = " and item.item_no = ~~'" + ls_str + "~~'" 
		ls_where  = "DataWindow.Table.Select='"  + is_select + ls_clause + "'"
		idwc_qa1.Modify(ls_where)
		idwc_qa1.settransobject(sqlca)
		idwc_qa1.retrieve()
*/

		idwc_qa1.setfilter("item_no = '" + ls_str + "'")
		idwc_qa1.filter()
			 
		idwc_qa1.SetSort("qa asc")
		idwc_qa1.Sort( ) 		

//		  if idwc_qa1.rowcount() = 1 then
//			  ls_str = trim(idwc_qa1.getitemstring(1,'qa'))
//			  this.object.tar_qa[row] = ls_str
//	     else
//			  setnull(ls_item)
//			  this.object.tar_qa[row] = ls_item
//		  end if		  

	case 'tar_qa'
		ls_str  = data
		ls_item = trim(this.object.tar_item[1])
		SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_item AND qa = :ls_str	and use_flag = 'C';
		if ll_cnt > 0 then
			MessageBox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
						+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			RETURN 1
		end if
end choose

RETURN 0

end event

event itemerror;string ls_data

setnull(ls_data)
choose case dwo.name
	case 'src_item'
        this.object.src_item[row] = ls_data
	case 'src_qa'
		  this.object.src_qa[row] = ls_data
	case 'src_loc'
		  this.object.src_loc[row] = ls_data
	case 'src_qty'
		  this.object.src_qty[row] = 0
	case 'tar_item'
        this.object.tar_item[row] = ls_data
	case 'tar_qa'
		  this.object.tar_qa[row] = ls_data
end choose

return 2

end event

event rbuttondown;//
string ls_itemno, ls_itemname, ls_uom, ls_clause, ls_where

gs_where2 lst_whitemret

lst_whitemret.chk = "S"
OpenWithParm( w_whitemselectmulti_w, lst_whitemret )
lst_whitemret = Message.PowerObjectParm

if lst_whitemret.chk = 'Y' then
	ls_itemno   = lst_whitemret.str1[1]
	ls_itemname = lst_whitemret.name[1]
	ls_uom      = lst_whitemret.str2[1]
end if
if isnull(ls_itemno) OR ls_itemno = "" then RETURN

choose case dwo.name
	case "src_item"
		this.object.src_item[row]   = ls_itemno
		this.object.item_name1[row] = ls_itemname
		this.object.uom1[row]       = ls_uom
		
//		this.getchild("src_qa", idwc_qa)
//		ls_clause = " and item.item_no = ~~'" + ls_itemno + "~~'" 
//		ls_where  = "DataWindow.Table.Select='"  + is_select + ls_clause + "'"
		
		idwc_qa.setfilter("item_no = '" + ls_itemno + "'")
		idwc_qa.filter()
		 
		idwc_qa.SetSort("qa asc")
		idwc_qa.Sort( ) 		
		

	case "tar_item"
		this.object.tar_item[row]   = ls_itemno
		this.object.item_name2[row] = ls_itemname
		this.object.uom2[row]       = ls_uom

//		this.getchild("tar_qa", idwc_qa)
//		ls_clause = " and item.item_no = ~~'" + ls_itemno + "~~'" 
//		ls_where  = "DataWindow.Table.Select='"  + is_select + ls_clause + "'"

		idwc_qa1.setfilter("item_no = '" +ls_itemno + "'")
		idwc_qa1.filter()
			 
		idwc_qa1.SetSort("qa asc")
		idwc_qa1.Sort( ) 	
			
end choose

idwc_qa.Modify(ls_where)
idwc_qa.settransobject(sqlca)
idwc_qa.retrieve()


end event

type dw_5 from datawindow within w_ioalter_m
integer x = 1170
integer y = 128
integer width = 864
integer height = 88
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_ioalter_m
integer x = 201
integer y = 184
integer width = 375
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
string text = "물품대체_관리"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ioalter_m
integer x = 1170
integer y = 48
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
string text = "일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

