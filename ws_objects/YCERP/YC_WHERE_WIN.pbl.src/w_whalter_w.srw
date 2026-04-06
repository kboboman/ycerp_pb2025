$PBExportHeader$w_whalter_w.srw
$PBExportComments$물품대체관리(200/06/23,이인호)
forward
global type w_whalter_w from window
end type
type st_2 from statictext within w_whalter_w
end type
type dw_3 from datawindow within w_whalter_w
end type
type cb_2 from commandbutton within w_whalter_w
end type
type cb_3 from commandbutton within w_whalter_w
end type
type pb_1 from picturebutton within w_whalter_w
end type
type st_8 from statictext within w_whalter_w
end type
type st_qty from statictext within w_whalter_w
end type
type st_cust from statictext within w_whalter_w
end type
type st_5 from statictext within w_whalter_w
end type
type st_4 from statictext within w_whalter_w
end type
type st_seq from statictext within w_whalter_w
end type
type st_order from statictext within w_whalter_w
end type
type st_1 from statictext within w_whalter_w
end type
type cb_1 from commandbutton within w_whalter_w
end type
type dw_1 from datawindow within w_whalter_w
end type
type gb_1 from groupbox within w_whalter_w
end type
type gb_2 from groupbox within w_whalter_w
end type
end forward

global type w_whalter_w from window
integer x = 73
integer y = 1128
integer width = 2830
integer height = 1756
boolean titlebar = true
string title = "물품대체(w_whalter_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_2 st_2
dw_3 dw_3
cb_2 cb_2
cb_3 cb_3
pb_1 pb_1
st_8 st_8
st_qty st_qty
st_cust st_cust
st_5 st_5
st_4 st_4
st_seq st_seq
st_order st_order
st_1 st_1
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_whalter_w w_whalter_w

type variables
gs_alter_str istr_where
datawindowchild idwc_item, idwc_qa, idwc_locno
string is_loc
end variables

forward prototypes
public function boolean wf_alter ()
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
public function boolean wf_save2 ()
public function boolean wf_save3 (long arg_row)
end prototypes

public function boolean wf_alter ();string ls_srcitem, ls_srcqa, ls_srcloc, ls_srclot, ls_srcrem, ls_order
string ls_taritem, ls_tarqa, ls_tarloc, ls_tarlot, ls_tarrem
string ls_old_time
long   ll_count
int    li_seq
date   ldt_date
real   lr_srcqty, lr_tarqty

dw_1.accepttext()
//--------------------------------------------------------------
ldt_date = date(dw_1.object.alter_date[1])
ls_order = dw_1.object.order_no[1]
if isnull(ls_order) then ls_order = 'w_oialter_m'
li_seq   = dw_1.object.seq[1]
//--------------------------------------------------------------
ls_srcitem = trim(dw_1.object.src_item[1])
ls_srcqa   = trim(dw_1.object.src_qa[1])
ls_srcloc  = trim(dw_1.object.src_loc[1])
ls_srclot  = trim(dw_1.object.src_lot[1])
lr_srcqty  = dw_1.object.src_qty[1]
ls_srcrem  = ls_srcitem + ls_srcqa
//---------------------------------------------------------------
ls_taritem = trim(dw_1.object.tar_item[1])
ls_tarqa   = trim(dw_1.object.tar_qa[1])
ls_tarloc  = trim(dw_1.object.tar_loc[1])
ls_tarlot  = trim(dw_1.object.tar_lot[1])
lr_tarqty  = dw_1.object.tar_qty[1]
ls_tarrem  = ls_taritem + ls_tarqa
//---------------------------------------------------------------

ls_old_time = string(now(),'hh:mm:ss:fff')
for ll_count = 1 to 100000
    IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
       ls_old_time  = string(now(),'hh:mm:ss:fff')	
		 exit
	 END IF	
NEXT

insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no, rcpt_qty,
  	    issue_qty, cost, rem, serial_id, destination, user_id)
values (getdate(),:ldt_date,:ls_srcitem,:ls_srcqa,:ls_srcloc,'IA',:ls_order,0,    
	    :lr_srcqty, 0, :ls_tarrem, :ls_srclot, :ls_tarloc, :gs_userid);   
if sqlca.sqlcode < 0 then
   messagebox('오류1',SQLCA.SQLERRTEXT,exclamation!)
   return false
end if

for ll_count = 1 to 100000
    IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
       ls_old_time  = string(now(),'hh:mm:ss:fff')	
		 exit
	 END IF	
NEXT

insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
  	    rcpt_qty, issue_qty, cost, rem, serial_id, destination, user_id)
values (getdate(),:ldt_date, :ls_taritem, :ls_tarqa, :ls_tarloc, 'RA', :ls_order,
	    :lr_tarqty, 0, 0, :ls_srcrem, :ls_tarlot, :ls_srcloc, :gs_userid);   
if sqlca.sqlcode < 0 then
   messagebox('오류2',SQLCA.SQLERRTEXT,exclamation!)
   return false
end if
return true

end function

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

public function boolean wf_save2 ();//
string ls_srcitem, ls_srcqa, ls_srcloc, ls_srclot, ls_srcrem, ls_order
string ls_taritem, ls_tarqa, ls_tarloc, ls_tarlot, ls_tarrem
string ls_old_time
long   ll_count
int    li_seq
real   lr_srcqty, lr_tarqty
date   ld_date
datetime ldt_date

dw_1.accepttext()

//--------------------------------------------------------------
ld_date    = date(dw_1.object.alter_date[1])
ldt_date   = dw_1.object.alter_time[1]
ls_order   = dw_1.object.order_no[1]
if isnull(ls_order) then ls_order = 'w_oialter_m'
li_seq     = dw_1.object.seq[1]
//--------------------------------------------------------------
ls_srcitem = trim(dw_1.object.src_item[1])
ls_srcqa   = trim(dw_1.object.src_qa[1])
ls_srcloc  = trim(dw_1.object.src_loc[1])
ls_srclot  = trim(dw_1.object.src_lot[1])
lr_srcqty  = dw_1.object.src_qty[1]
ls_srcrem  = ls_srcitem + ls_srcqa
//---------------------------------------------------------------
ls_taritem = trim(dw_1.object.tar_item[1])
ls_tarqa   = trim(dw_1.object.tar_qa[1])
ls_tarloc  = trim(dw_1.object.tar_loc[1])
ls_tarlot  = trim(dw_1.object.tar_lot[1])
lr_tarqty  = dw_1.object.tar_qty[1]
ls_tarrem  = ls_taritem + ls_tarqa
//---------------------------------------------------------------

ls_old_time = string(now(),'hh:mm:ss:fff')
for ll_count = 1 to 100000
   if ls_old_time <> string(now(),'hh:mm:ss:fff') then
      ls_old_time  = string(now(),'hh:mm:ss:fff')	
		EXIT
	end if	
next

// 대체출고
INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa,loc_no, inaudit_type, order_no, rcpt_qty,
  	    issue_qty, cost,rem, serial_id, destination, user_id )
VALUES ( getdate(), :ld_date, :ls_srcitem, :ls_srcqa, :ls_srcloc, 'IA', :ls_order, 0,    
	    :lr_srcqty, 0, :ls_tarrem, :ls_srclot, :ls_tarloc, :gs_userid );   
if sqlca.sqlcode < 0 then
   MessageBox('오류1',SQLCA.SQLERRTEXT,exclamation!)
   RETURN false
end if

for ll_count = 1 to 100000
   if ls_old_time <> string(now(),'hh:mm:ss:fff') then
      ls_old_time  = string(now(),'hh:mm:ss:fff')	
	   EXIT
	end if
next

// 대체입고
INSERT INTO inaudit ( inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no, rcpt_qty,
	    issue_qty, cost, rem, serial_id, destination, user_id )
VALUES ( :ldt_date, :ld_date, :ls_taritem, :ls_tarqa, :ls_tarloc, 'RA', :ls_order, :lr_tarqty,
       0, 0, :ls_srcrem, :ls_tarlot, :ls_srcloc, :gs_userid );   
if sqlca.sqlcode < 0 then
   MessageBox('오류2',SQLCA.SQLERRTEXT,exclamation!)
   RETURN false
end if

RETURN true

end function

public function boolean wf_save3 (long arg_row);string ls_srcitem, ls_srcqa, ls_srcloc, ls_srclot, ls_srcrem, ls_order
string ls_taritem, ls_tarqa, ls_tarloc, ls_tarlot, ls_tarrem
string ls_old_time
long   ll_count
int    li_seq
real   lr_srcqty, lr_tarqty
date   ldt_date

dw_1.accepttext()

//--------------------------------------------------------------
ls_order = dw_1.GetItemstring(arg_row,"order_no")
ldt_date = date(dw_1.GetItemdatetime(arg_row,"alter_date"))
if isnull(ls_order) then ls_order = 'w_oialter_m'
li_seq = dw_1.GetItemnumber(arg_row,"seq")
//--------------------------------------------------------------
ls_srcitem = trim(dw_1.GetItemstring(arg_row,"src_item"))
ls_srcqa   = trim(dw_1.GetItemstring(arg_row,"src_qa"))
ls_srcloc  = trim(dw_1.GetItemstring(arg_row,"src_loc"))
ls_srclot  = trim(dw_1.GetItemstring(arg_row,"src_lot"))
lr_srcqty  = dw_1.GetItemdecimal(arg_row,"src_qty")
ls_srcrem  = ls_srcitem + ls_srcqa
//---------------------------------------------------------------
ls_taritem = trim(dw_1.GetItemstring(arg_row,"tar_item"))
ls_tarqa   = trim(dw_1.GetItemstring(arg_row,"tar_qa"))
ls_tarloc  = trim(dw_1.GetItemstring(arg_row,"tar_loc"))
ls_tarlot  = trim(dw_1.GetItemstring(arg_row,"tar_lot"))
lr_tarqty  = dw_1.GetItemdecimal(arg_row,"tar_qty")
ls_tarrem  = ls_taritem + ls_tarqa


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

on w_whalter_w.create
this.st_2=create st_2
this.dw_3=create dw_3
this.cb_2=create cb_2
this.cb_3=create cb_3
this.pb_1=create pb_1
this.st_8=create st_8
this.st_qty=create st_qty
this.st_cust=create st_cust
this.st_5=create st_5
this.st_4=create st_4
this.st_seq=create st_seq
this.st_order=create st_order
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_2,&
this.dw_3,&
this.cb_2,&
this.cb_3,&
this.pb_1,&
this.st_8,&
this.st_qty,&
this.st_cust,&
this.st_5,&
this.st_4,&
this.st_seq,&
this.st_order,&
this.st_1,&
this.cb_1,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_whalter_w.destroy
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.pb_1)
destroy(this.st_8)
destroy(this.st_qty)
destroy(this.st_cust)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_seq)
destroy(this.st_order)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//
string ls_locno, ls_defloc, ls_locnosql, ls_where, ls_sql

istr_where = Message.PowerObjectParm

// 기본저장소
SELECT def_loc INTO :is_loc FROM area WHERE area_no = :gs_area;
// 사업장의 다중저장소
SELECT loc_no INTO :ls_locno FROM location WHERE loc_manager = :gs_userid;
if isnull(ls_locno) OR ls_locno = "" then
	// CODEMST(사업장기본저장소) 검색
	SELECT rtrim(bigo) INTO :ls_defloc FROM codemst 
	 WHERE type = '사업장기본저장소' AND item_cd = :gs_userid AND use_yn = 'Y';
	if isnull(ls_defloc) OR ls_defloc = "" then
	else
		is_loc = ls_defloc
	end if
else
	is_loc = ls_locno
end if
	

st_order.text = istr_where.order_no
st_seq.text   = string(istr_where.seq, '###')
st_qty.text   = string(istr_where.order_qty, '###,###,##0.00')
st_cust.text  = istr_where.cust_name
//if istr_where.chk = "S" then // "S": 수주확정시 대체 저장 "D":출고시 대체저장

// 저장소
dw_3.getchild("loc_no", idwc_locno)
idwc_locno.insertrow(1)
idwc_locno.settransobject(sqlca)
ls_locnosql = idwc_locno.describe("datawindow.table.select")
dw_3.getchild("loc_no", idwc_locno)

//if gs_userid = "1999010s" then
//	idwc_locno.settransobject(sqlca)
//	idwc_locno.retrieve()
//else
	ls_where = " WHERE loc_no = ~~'" + is_loc + "~~'"
	ls_sql   = 'datawindow.table.select = "' + ls_locnosql + ls_where + '"'
	idwc_locno.settransobject(sqlca)
	idwc_locno.modify(ls_sql)
	idwc_locno.retrieve()
//end if

dw_3.SetTransObject(sqlca)
dw_3.insertrow(1)
dw_3.object.loc_no[1] = is_loc

// 품목
dw_1.getchild('src_item',idwc_item)
//idwc_item.SetTransObject(sqlca)
GS_DS_ItemAll.ShareData(idwc_item)
idwc_item.setfilter(' not (item_no > "PZZZ") ')
idwc_item.filter()

// 규격
dw_1.SetTransObject(SQLCA)
dw_1.getchild("src_qa", idwc_qa)
idwc_qa.SetTransObject(sqlca)
idwc_qa.insertrow(1)

if dw_1.retrieve(istr_where.order_no, istr_where.seq) < 1 then
	cb_2.PostEvent(clicked!)		// 추가
else
	idwc_qa.retrieve(is_loc, istr_where.item_no)
end if


end event

type st_2 from statictext within w_whalter_w
integer x = 41
integer y = 40
integer width = 727
integer height = 120
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "물품대체"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_whalter_w
integer x = 859
integer y = 68
integer width = 855
integer height = 92
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;//
this.accepttext()

end event

event itemchanged;//
string ls_null, ls_item
long   ll_row

this.accepttext()
dw_1.accepttext()

dw_1.setredraw(false)
//idwc_qa.setredraw(false)
is_loc = dw_3.object.loc_no[1]

setnull(ls_null)
for ll_row = 1 to dw_1.rowcount()
	dw_1.object.src_qa[ll_row] = ls_null
	dw_1.object.qoh[ll_row]    = 0
next

//ls_item = dw_1.object.src_item[1]
//idwc_qa.retrieve(is_loc, ls_item)
//idwc_qa.setredraw(true)
dw_1.setredraw(true)

end event

type cb_2 from commandbutton within w_whalter_w
integer x = 1742
integer y = 64
integer width = 229
integer height = 96
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;//
dw_1.accepttext()

if dw_1.rowcount() > 2 then 
	MessageBox("확인", "3개 이상은 대체가 되지 않습니다. 전산실로 연락바랍니다.")
	RETURN
end if

string   ls_null, ls_clause, ls_where
long     ll_row
datetime ldt_datetime

setnull(ls_null)
SELECT top 1 getdate() INTO :ldt_datetime FROM login;

dw_1.setredraw(false)
ll_row = dw_1.insertrow(0)

dw_1.scrolltorow(ll_row)
dw_1.object.alter_time[ll_row] = ldt_datetime
dw_1.object.alter_date[ll_row] = datetime(date(string(today(),'yyyy/mm/dd')))
dw_1.object.user_id[ll_row]    = gs_userid

dw_1.object.src_item[ll_row]   = istr_where.item_no
dw_1.object.item_name1[ll_row] = istr_where.item_name

dw_1.object.src_qa[ll_row]     = ls_null
dw_1.object.uom1[ll_row]       = istr_where.uom
dw_1.object.src_qty[ll_row]    = istr_where.order_qty
dw_1.object.src_loc[ll_row]    = is_loc
dw_1.object.order_no[ll_row]   = istr_where.order_no
dw_1.object.seq[ll_row]        = istr_where.seq

dw_1.object.tar_item[ll_row]   = istr_where.item_no
dw_1.object.tar_qa[ll_row]     = istr_where.qa
dw_1.object.uom2[ll_row]       = istr_where.uom
dw_1.object.tar_loc[ll_row]    = is_loc
dw_1.object.item_name2[ll_row] = istr_where.item_name
dw_1.object.tar_qty[ll_row]    = istr_where.order_qty
dw_1.object.issue_flag[ll_row] = "Y" // N: inaudit insert 안됨, Y: inaudit insert 됨.

idwc_qa.retrieve(is_loc, istr_where.item_no)
dw_1.setcolumn("src_qa")
dw_1.setfocus()
dw_1.accepttext()
dw_1.setredraw(true)


end event

type cb_3 from commandbutton within w_whalter_w
integer x = 1993
integer y = 64
integer width = 229
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;//
long   ll_row
string ls_flag

ll_row = dw_1.getrow()
if ll_row < 1  then return

if MessageBox("확인",'삭제하시겠습니까?', Exclamation!, OKCancel!, 2) = 2 then return

dw_1.accepttext()

ls_flag = dw_1.object.issue_flag[ll_row]
//if istr_where.chk = "S" then // "S": 수주확정시 대체 저장 "D":출고시 대체저장
//	if ls_flag = 'Y' then // N: inaudit insert 안됨, Y: inaudit insert 됨.
//		MessageBox("확인","이미출고되어서 삭제할수 없습니다.")
//		return
//	end if
//end if

wf_save3(1)

dw_1.deleterow(0)

istr_where.chk = "X"
if wf_update1(dw_1,"Y") = false then return


end event

type pb_1 from picturebutton within w_whalter_w
integer x = 2245
integer y = 64
integer width = 229
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
vtextalign vtextalign = vcenter!
boolean map3dcolors = true
end type

event clicked;// 저장
string ls_item, ls_qa
long   ll_row
dec    ld_srtqty, ld_tarqty

dw_1.accepttext()

if dw_1.rowcount() < 1 then RETURN

for ll_row = 1 to dw_1.rowcount()
	ls_item = dw_1.object.src_item[ll_row]
	
	if dw_1.object.src_qty[ll_row] < 0 then
	  MessageBox("확인", "대체수량이 0보다 작습니다.")
	  dw_1.setcolumn('src_qty')
	  dw_1.setfocus()
	  RETURN
	end if

	if dw_1.object.tar_qty[ll_row] < 0 then
	  MessageBox("확인", "대체수량이 0보다 작습니다.")
	  dw_1.setcolumn('tar_qty')
	  dw_1.setfocus()
	  RETURN
	end if

	if dw_1.object.src_qty[ll_row] > dw_1.object.qoh[ll_row] then
	  MessageBox("확인", "대체수량이 현재고량보다 큽니다.")
	  dw_1.setcolumn('src_qty')
	  dw_1.setfocus()
	  RETURN
	end if

	if isnull(ls_item) OR trim(ls_item) = "" then
		MessageBox("확인", "대체할 품목을 선택하십시요")
		dw_1.setcolumn('src_item')
		setfocus()
		RETURN
	end if

	ls_qa = dw_1.object.src_qa[ll_row]
	if isnull(ls_qa) OR trim(ls_qa) = "" then
		MessageBox("확인", "대체할 품목을 선택하십시요")
		dw_1.setcolumn('src_qa')
		setfocus()
		RETURN
	end if

	if dw_1.object.src_qty[ll_row] > dw_1.object.qoh[ll_row] then
		if MessageBox("확인", string(ll_row, '##0') +' 번째 대체수량이 현재고량보다 큽니다. 저장하시겠습니까?', Exclamation!, OKCancel!, 2) = 2 then 
			RETURN
		end if
	end if

	if dw_1.object.tar_qty[ll_row] <> dw_1.object.src_qty[ll_row] then
		if MessageBox("확인", string(ll_row, '##0') +' 번째 수량과 대체수량이 다른 경우입니다. 저장하시겠습니까?', Exclamation!, OKCancel!, 2) = 2 then 
			RETURN
		end if
	end if

	if istr_where.chk = "S" then // "S":수주확정시 대체저장, "D":출고시 대체저장
	else
		dw_1.object.do_no[ll_row]  = istr_where.do_no
		dw_1.object.do_seq[ll_row] = istr_where.do_seq
	end if
next

//
if WF_Save2() = false then
	ROLLBACK;
	RETURN
end if
if WF_Update1(dw_1,"Y") = false then
	RETURN
end if

istr_where.chk = "Y"
CloseWithReturn( Parent, istr_where )


end event

type st_8 from statictext within w_whalter_w
integer x = 1307
integer y = 268
integer width = 302
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "주문수량:"
boolean focusrectangle = false
end type

type st_qty from statictext within w_whalter_w
integer x = 1609
integer y = 256
integer width = 370
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
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cust from statictext within w_whalter_w
integer x = 402
integer y = 344
integer width = 2080
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_whalter_w
integer x = 101
integer y = 352
integer width = 302
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "거 래 처:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_whalter_w
integer x = 955
integer y = 268
integer width = 183
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "순번:"
boolean focusrectangle = false
end type

type st_seq from statictext within w_whalter_w
integer x = 1138
integer y = 260
integer width = 142
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_order from statictext within w_whalter_w
integer x = 402
integer y = 260
integer width = 535
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_whalter_w
integer x = 101
integer y = 272
integer width = 302
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "수주번호:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_whalter_w
integer x = 2496
integer y = 64
integer width = 229
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
boolean cancel = true
end type

event clicked;//
CloseWithReturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whalter_w
integer x = 41
integer y = 464
integer width = 2738
integer height = 1156
integer taborder = 20
string dataobject = "d_whalter_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
string ls_item, ls_qa, ls_uom, ls_itemname, ls_qohstock
real   lr_qoh
long   ll_row, ll_crow, ll_cnt

this.accepttext()

ll_row = this.getrow()

choose case dwo.name
	case "src_item"
			ls_item = data
			SELECT count(*) INTO :ll_cnt FROM groupitem WHERE item_no = :ls_item	AND use_flag = 'C';
			if ll_cnt > 0 then
				MessageBox("확인","위 규격은 사용불가된 코드입니다. ~r~n" &
							+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
				RETURN 1
			end if
			
			SELECT item_no, item_name, uom INTO :ls_item, :ls_itemname, :ls_uom 
			  FROM groupitem 
			 WHERE item_no = :ls_item;
			if isnull(ls_item) then
				MessageBox("경고", "마스터에 없는 물품번호입니다.", Exclamation!)
				RETURN 1
			end if
			
			this.object.item_name1[ll_row] = ls_itemname
			this.object.uom1[ll_row]       = ls_uom
			
			setnull(ls_qa)
			this.getchild("src_qa", idwc_qa)
			this.object.src_qa[ll_row] = ls_qa
			this.object.qoh[ll_row]    = 0
			idwc_qa.retrieve(is_loc, ls_item)

	case "src_qa"
DEBUGBREAK()

			ls_item = trim(this.object.src_item[ll_row])
			lr_qoh  = 0
			ls_qa   = trim(data)
			
			this.getchild("src_qa", idwc_qa)
		   ll_crow = idwc_qa.getrow()
		   if ll_crow > 0 then
				ls_qohstock = idwc_qa.GetItemString(ll_crow, "cat")
			end if

			if ls_qohstock = "재고" then
				SELECT qoh INTO :lr_qoh 
				  FROM itemloc 
				 WHERE item_no = :ls_item AND qa = :ls_qa AND loc_no = :is_loc;
			else
				SELECT qty INTO :lr_qoh 
				  FROM itemstock 
				 WHERE item_no = :ls_item AND qa = :ls_qa AND loc_no = :is_loc;

				this.object.src_stock_qty[ll_row] = this.object.src_qty[ll_row]
				this.object.src_qty[ll_row]       = 0
				
				this.object.tar_stock_qty[ll_row] = this.object.tar_qty[ll_row]
				this.object.tar_qty[ll_row]       = 0
			end if
			this.object.qoh[ll_row] = lr_qoh
			
	case "src_qty"
		  if this.object.src_qty[ll_row] > this.object.qoh[ll_row] then
			  MessageBox("확인", "대체수량이 현재고 수량보다 큽니다.")
		  end if
		  
		  this.object.tar_qty[ll_row] = this.object.src_qty[ll_row]
end choose

RETURN 0

end event

event rbuttondown;//
gs_where2 lst_whitemret
string ls_null

this.scrolltorow(row)

choose case dwo.name
	case 'src_item'
		lst_whitemret.chk = 'S'
		OpenWithParm( w_whitemselectmulti_w, lst_whitemret )
		lst_whitemret =  Message.PowerObjectParm		
		if lst_whitemret.chk <> 'Y' then RETURN
		
		if lst_whitemret.str1[1]  > "PZZZ" then
			MessageBox("확인","기타 품목코드는 선택하실수 없습니다.")
			RETURN 1
		end if

		this.object.src_item[row]   = lst_whitemret.str1[1]
		this.object.item_name1[row] = lst_whitemret.name[1]
		
		setnull(ls_null)
		this.setcolumn('src_qa')
		this.getchild("src_qa", idwc_qa)
		this.object.src_qa[row] = ls_null
		idwc_qa.retrieve(is_loc, lst_whitemret.str1[1])
end choose

this.accepttext()

end event

event itemerror;string ls_data

setnull(ls_data)
choose case dwo.name
	case 'src_item'
        this.object.src_item[row] = ls_data
	case 'src_qa'
		  this.object.src_qa[row]   = ls_data
	case 'src_loc'
		  this.object.src_loc[row]  = ls_data
	case 'src_qty'
		  this.object.src_qty[row]  = 0
		  
//	case 'tar_item'
//      this.object.tar_item[row] = ls_data
//	case 'tar_qa'
//		  this.object.tar_qa[row]  = ls_data
end choose

RETURN 2

end event

event rowfocuschanged;//
string ls_item
long   ll_row

this.accepttext()

ll_row = this.getrow()
if ll_row < 1 then return

ls_item = this.object.src_item[ll_row]
if isnull(ls_item) then return

this.getchild("src_qa", idwc_qa)
idwc_qa.SetTransObject(sqlca)
idwc_qa.retrieve(is_loc, ls_item)


end event

event clicked;//
this.accepttext()

string ls_item
this.getchild("src_qa", idwc_qa)

idwc_qa.setredraw(false)
choose case dwo.name
	case 'src_qa'
		ls_item = this.object.src_item[row]
		idwc_qa.retrieve(is_loc, ls_item)
end choose
idwc_qa.setredraw(true)

end event

type gb_1 from groupbox within w_whalter_w
integer x = 809
integer y = 20
integer width = 1970
integer height = 168
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_whalter_w
integer x = 41
integer y = 216
integer width = 2738
integer height = 224
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

