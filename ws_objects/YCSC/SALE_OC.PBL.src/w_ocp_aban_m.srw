$PBExportHeader$w_ocp_aban_m.srw
$PBExportComments$제품폐기등록(2003/05/30이규배)
forward
global type w_ocp_aban_m from window
end type
type pb_2 from picturebutton within w_ocp_aban_m
end type
type pb_1 from picturebutton within w_ocp_aban_m
end type
type rb_3 from radiobutton within w_ocp_aban_m
end type
type rb_2 from radiobutton within w_ocp_aban_m
end type
type rb_1 from radiobutton within w_ocp_aban_m
end type
type em_1 from editmask within w_ocp_aban_m
end type
type st_1 from statictext within w_ocp_aban_m
end type
type em_2 from editmask within w_ocp_aban_m
end type
type dw_1 from datawindow within w_ocp_aban_m
end type
type dw_4 from datawindow within w_ocp_aban_m
end type
type dw_3 from datawindow within w_ocp_aban_m
end type
type dw_2 from datawindow within w_ocp_aban_m
end type
type pb_save from picturebutton within w_ocp_aban_m
end type
type st_title from statictext within w_ocp_aban_m
end type
type pb_print_part from picturebutton within w_ocp_aban_m
end type
type pb_close from picturebutton within w_ocp_aban_m
end type
type pb_cancel from picturebutton within w_ocp_aban_m
end type
type pb_delete from picturebutton within w_ocp_aban_m
end type
type pb_insert from picturebutton within w_ocp_aban_m
end type
type pb_retrieve from picturebutton within w_ocp_aban_m
end type
type gb_1 from groupbox within w_ocp_aban_m
end type
type gb_2 from groupbox within w_ocp_aban_m
end type
end forward

global type w_ocp_aban_m from window
integer width = 4722
integer height = 2680
boolean titlebar = true
string title = "제품폐기 요청관리[w_ocp_aban_m]"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
pb_2 pb_2
pb_1 pb_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
em_1 em_1
st_1 st_1
em_2 em_2
dw_1 dw_1
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
pb_save pb_save
st_title st_title
pb_print_part pb_print_part
pb_close pb_close
pb_cancel pb_cancel
pb_delete pb_delete
pb_insert pb_insert
pb_retrieve pb_retrieve
gb_1 gb_1
gb_2 gb_2
end type
global w_ocp_aban_m w_ocp_aban_m

type variables
datawindowchild idwc_item, idwc_qa
string is_loc, is_oc = 'O', is_aban_no
end variables

forward prototypes
public subroutine wf_retrieve (string ls_aban_dt, string ls_seq)
public subroutine wf_pk_null_chk ()
public function boolean wf_jaego (long al_row)
public function boolean wf_jaego2 (long al_row)
public function datetime wf_today ()
public function boolean wf_update2 (datawindow arg_dw1, datawindow arg_dw2, string arg_str)
end prototypes

public subroutine wf_retrieve (string ls_aban_dt, string ls_seq);long ll_row

if isNull(ls_aban_dt) or Trim(ls_aban_dt) = '' then
else
	ll_row = dw_1.GetRow()
	dw_1.SetItem(ll_row, 'aban_dt', ls_aban_dt)
	dw_1.SetItem(ll_row, 'seq', ls_seq)
	
	dw_1.Retrieve(ls_aban_dt, ls_seq)
	
	dw_1.Enabled = False
end if

end subroutine

public subroutine wf_pk_null_chk ();long ll_row
string ls_aban_dt, ls_seq, ls_item_no, ls_size, ls_pos_cd

for ll_row = dw_1.RowCount() to 1 step -1
	ls_aban_dt = dw_1.GetItemString(ll_row, 'aban_dt')
	ls_seq = dw_1.GetItemString(ll_row, 'seq')
	ls_item_no = dw_1.GetItemString(ll_row, 'item_no')
	ls_size = dw_1.GetItemString(ll_row, 'size')
	ls_pos_cd = dw_1.GetItemString(ll_row, 'pos_cd')
	
	if isNull(ls_aban_dt) or Trim(ls_aban_dt) = '' or &
	   isNull(ls_seq) or Trim(ls_seq) = '' or &
	   isNull(ls_item_no) or Trim(ls_item_no) = '' or &
	   isNull(ls_size) or Trim(ls_size) = '' or &
	   isNull(ls_pos_cd) or Trim(ls_pos_cd) = '' then
		dw_1.DeleteRow(ll_row)
	end if
next

end subroutine

public function boolean wf_jaego (long al_row);//재고에서 수량 마이너스

long ll_row, ll_count
string ls_item_no, ls_qa, ls_loc_no
string ls_order, ls_bigo
string ls_old_time
datetime ldt_aban_dt
int    li_qty

ls_order    =  dw_2.Object.aban_no[1]//폐기번호
ldt_aban_dt = dw_2.Object.aban_date[1]//폐기 일자
ls_loc_no   = dw_2.Object.loc_no[1]//저장소
ls_item_no  = dw_3.Object.item_no[al_row]//물품코드
ls_qa       = dw_3.Object.qa[al_row]//물품규격
li_qty      = dw_3.Object.qty[al_row]//수량
ls_bigo     = dw_3.Object.bigo[al_row] //비고
ls_old_time = string(now(),'hh:mm:ss:fff')

for ll_count = 1 to 100000
    IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
       ls_old_time  = string(now(),'hh:mm:ss:fff')	
		 exit
	 END IF	
NEXT

insert into inaudit (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no, rcpt_qty,
  	    issue_qty, cost,rem, destination, user_id)
values (getdate(), :ldt_aban_dt, :ls_item_no, :ls_qa, :ls_loc_no, 'IB', :ls_order, 0,
	    :li_qty, 0, :ls_bigo, '폐기', :gs_userid);

if sqlca.sqlcode < 0 then
   messagebox('오류', SQLCA.SQLERRTEXT, exclamation!)
   return false
end if

return true

end function

public function boolean wf_jaego2 (long al_row);//재고에서 수량 플러스

long ll_row, ll_count
string ls_item_no, ls_qa, ls_loc_no
string ls_order, ls_bigo
string ls_old_time
int    li_qty
datetime ldt_aban_dt

ls_order    = dw_2.Object.aban_no[1]		// 폐기번호
ldt_aban_dt = dw_2.Object.aban_date[1]		// 폐기 일자
ls_loc_no   = dw_2.Object.loc_no[1]			// 저장소
ls_item_no  = dw_3.Object.item_no[al_row]	// 물품코드
ls_qa       = dw_3.Object.qa[al_row]		// 물품규격
li_qty      = dw_3.Object.qty[al_row]		// 수량
ls_bigo     = dw_3.Object.bigo[al_row] 	// 비고

ls_old_time = string(now(),'hh:mm:ss:fff')
for ll_count = 1 to 100000
    IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
       ls_old_time  = string(now(),'hh:mm:ss:fff')	
		 exit
	 END IF	
NEXT

insert into inaudit (inaudit_time, inaudit_date, inaudit_item,qa, loc_no, inaudit_type, order_no, rcpt_qty,
  	    issue_qty, cost, rem, destination, user_id)
values (getdate(), :ldt_aban_dt, :ls_item_no, :ls_qa, :ls_loc_no, 'IB', :ls_order, 0,
	    :li_qty * -1, 0, :ls_bigo, '제품폐기삭제', :gs_userid);

if sqlca.sqlcode < 0 then
   messagebox('오류', SQLCA.SQLERRTEXT, exclamation!)
   return false
end if

return true

end function

public function datetime wf_today ();return datetime(date(string(today(),'yyyy/mm/dd')))
end function

public function boolean wf_update2 (datawindow arg_dw1, datawindow arg_dw2, string arg_str);if arg_dw1.update(true,false) = 1 then
	if arg_dw2.update(true,true) = 1 then
	   commit;
		arg_dw1.resetupdate()
		if (arg_str = "Y") or (arg_str = "y") then
	      MessageBox("확인", "저장되었습니다.")
		end if	
		return true
	else
	   rollback;
	   MessageBox("오류", "저장 실패!")
		return false
	end if	
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if


end function

on w_ocp_aban_m.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.em_1=create em_1
this.st_1=create st_1
this.em_2=create em_2
this.dw_1=create dw_1
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.pb_save=create pb_save
this.st_title=create st_title
this.pb_print_part=create pb_print_part
this.pb_close=create pb_close
this.pb_cancel=create pb_cancel
this.pb_delete=create pb_delete
this.pb_insert=create pb_insert
this.pb_retrieve=create pb_retrieve
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_2,&
this.pb_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.em_1,&
this.st_1,&
this.em_2,&
this.dw_1,&
this.dw_4,&
this.dw_3,&
this.dw_2,&
this.pb_save,&
this.st_title,&
this.pb_print_part,&
this.pb_close,&
this.pb_cancel,&
this.pb_delete,&
this.pb_insert,&
this.pb_retrieve,&
this.gb_1,&
this.gb_2}
end on

on w_ocp_aban_m.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.dw_1)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.pb_save)
destroy(this.st_title)
destroy(this.pb_print_part)
destroy(this.pb_close)
destroy(this.pb_cancel)
destroy(this.pb_delete)
destroy(this.pb_insert)
destroy(this.pb_retrieve)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

dw_3.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_4.visible = false
em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

select def_loc into :is_loc from area where area_no = :gs_area;

end event

event resize;//
dw_3.width  = this.width  - 109
dw_3.height = this.height - 1296

end event

type pb_2 from picturebutton within w_ocp_aban_m
integer x = 4480
integer y = 1028
integer width = 160
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
end type

event clicked;if dw_3.rowcount() < 1 then return
dw_3.deleterow(dw_3.getrow())

end event

type pb_1 from picturebutton within w_ocp_aban_m
integer x = 4311
integer y = 1028
integer width = 160
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;dwItemStatus l_status
long ll_row

if dw_2.rowcount() < 1 then return

ll_row = dw_3.insertrow(0)
dw_3.scrolltorow(ll_row)

l_status = dw_2.GetItemStatus(1, 0, Primary!)
if l_status = NotModified! or l_status = DataModified! then
	dw_3.object.aban_no[ll_row] = dw_2.object.aban_no[1]
	if ll_row > 1 then
		dw_3.object.seq[ll_row] = dw_3.object.seq[ll_row - 1] + 1
	end if
else
	dw_3.object.seq[ll_row] = ll_row
end if
dw_3.object.loc_no[ll_row] = is_loc
dw_3.setcolumn('item_no')
dw_3.setfocus()


end event

type rb_3 from radiobutton within w_ocp_aban_m
integer x = 2505
integer y = 120
integer width = 224
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
string text = "전체"
end type

event clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
pb_save.enabled = false
pb_delete.enabled = false
is_oc = '%'
end event

type rb_2 from radiobutton within w_ocp_aban_m
integer x = 2939
integer y = 120
integer width = 224
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
string text = "기결"
end type

event clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
pb_save.enabled = false
pb_delete.enabled = false
is_oc = 'Y'
end event

type rb_1 from radiobutton within w_ocp_aban_m
integer x = 2720
integer y = 120
integer width = 224
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
string text = "미결"
boolean checked = true
end type

event clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
pb_save.enabled = true
pb_delete.enabled = true
is_oc = 'O'

end event

type em_1 from editmask within w_ocp_aban_m
integer x = 1664
integer y = 112
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_ocp_aban_m
integer x = 2034
integer y = 120
integer width = 59
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_2 from editmask within w_ocp_aban_m
integer x = 2112
integer y = 112
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_1 from datawindow within w_ocp_aban_m
integer x = 32
integer y = 264
integer width = 2478
integer height = 748
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_ocp_aban_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event losefocus;this.accepttext()
end event

event rowfocuschanged;long ll_row

ll_row = this.Getrow()
if ll_row < 1 then return

is_aban_no = this.object.aban_no[ll_row]

dw_2.retrieve(is_aban_no)
dw_3.retrieve(is_aban_no)


end event

type dw_4 from datawindow within w_ocp_aban_m
integer x = 1170
integer y = 16
integer width = 96
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "d_ocp_aban_r2"
boolean livescroll = true
end type

type dw_3 from datawindow within w_ocp_aban_m
integer x = 32
integer y = 1152
integer width = 4613
integer height = 1384
integer taborder = 20
string title = "none"
string dataobject = "d_ocp_aban_m1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long ll_row, ll_cnt, ll_row1, ll_found
double ldb_qty, ldb_pri
string ls_item_no, ls_qa, ls_null, ls_data, ls_item_name

this.accepttext()
dw_2.accepttext()
setnull(ls_null)
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

Choose case dwo.name
	case 'item_no'
		this.object.qa[ll_row] = ls_null
		this.object.uom[ll_row] = ls_null
		ls_data = data
		select count(*) into :ll_cnt from groupitem
		 where item_no = :ls_item_no
			and use_flag = 'C';
		if ll_cnt > 0 then
			messagebox("확인","위 규격은 사용불가된 코드입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			return 1
		end if
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		 select item_name into :ls_item_name from groupitem 
		  where item_no = :ls_data
		    and use_flag = 'Y';
		 if sqlca.sqlcode = 100 then 
			 return 1
		 end if
		this.object.item_name[ll_row] = ls_item_name
		
		if ls_item_no <> '' then
			select count(*) into :ll_cnt from item
			 where item_no = :ls_item_no
			   and use_flag = 'Y';
			if ll_cnt > 0 then
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			end if
			
			if ll_cnt > 0 and idwc_qa.rowcount() > 0 then
				this.setcolumn("qa")
				this.setfocus()
			else
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if
		
	case 'qa'
		ls_data = data
		select count(*) into :ll_cnt from item
		 where item_no = :ls_item_no
			and qa = :ls_data
			and use_flag = 'C';
		if ll_cnt > 0 then
			messagebox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			return 1
		end if
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
		this.object.uom[ll_row] = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom"))

	case 'qty', 'price'
		ldb_qty = this.Object.qty[ll_row]
		ldb_pri = this.Object.price[ll_row]
		this.accepttext()
		this.Setitem(ll_row, 'amount', truncate(ldb_qty * ldb_pri, 0))
end Choose


end event

event itemerror;string ls_null

setnull(ls_null)
choose case dwo.name
	case 'item_no'
			this.object.item_no[row] = ls_null
	case 'qa'
		this.object.qa[row] = ls_null
end choose

return 2
end event

event rowfocuschanged;string ls_item_no

this.accepttext()
if this.getrow() < 1 then return

ls_item_no = this.object.item_no[this.getrow()]
if ls_item_no = '' or isnull(ls_item_no) then
	return
else
		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		idwc_qa.filter()
end if

end event

type dw_2 from datawindow within w_ocp_aban_m
integer x = 2528
integer y = 264
integer width = 2117
integer height = 748
integer taborder = 10
string title = "none"
string dataobject = "d_ocp_aban_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_save from picturebutton within w_ocp_aban_m
event mousemove pbm_mousemove
integer x = 4229
integer y = 64
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "저장"
end type

event clicked;long ll_row
int li_seq
dwItemStatus l_status
string ls_area,  ls_aban_date, ls_seq, ls_aban_no1, ls_aban_no, ls_reason, ls_item, ls_qa
dec ld_qty

dw_2.accepttext()
dw_3.accepttext()
if dw_2.rowcount() < 1 then return
if dw_3.rowcount() < 1 then 
	messagebox("확인","변경상세 내역이 없습니다..")
	return
end if
if MessageBox('제품폐기', '제품 폐기 작업은 재고에 반영됩니다.~r~n제품 폐기 작업을 하시겠습니까?', &
					Question!, YesNo!, 2) = 2 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)
for ll_row = 1 to dw_3.rowcount()
	ld_qty = dw_3.object.qty[ll_row]
	if ld_qty <= 0 or isnull(ld_qty) then 
		messagebox("오류", string(ll_row) + " 번째의 수량오류입니다")
		dw_3.scrolltorow(ll_row)
		dw_3.setcolumn('qty')
		dw_3.setfocus()
		return
	end if
	ls_item = dw_3.object.item_no[ll_row]
	if trim(ls_item) = '' or isnull(ls_item) then 
		messagebox("오류", string(ll_row) + " 번째의 품목오류입니다")
		dw_3.scrolltorow(ll_row)
		dw_3.setcolumn('item_no')
		dw_3.setfocus()
		return
	end if
	ls_qa = dw_3.object.qa[ll_row]
	if trim(ls_item) = '' or isnull(ls_item) then 
		messagebox("오류", string(ll_row) + " 번째의 규격오류입니다")
		dw_3.scrolltorow(ll_row)
		dw_3.setcolumn('qa')
		dw_3.setfocus()
		return
	end if
next
l_status = dw_2.GetItemStatus(1, 0, Primary!)
if l_status = NotModified! or l_status = DataModified! then
else
//번호 부여
	ls_area = LeftA(dw_2.object.area_no[1], 1)
	IF trim(dw_2.object.aban_no[1]) = '' OR isnull(dw_2.object.aban_no[1]) then
		ls_aban_date = string(dw_2.object.aban_date[1], "yyyymm")
		ls_aban_no1 = ls_area + 'A' + ls_aban_date + '-' + '%'			
		SELECT MAX(aban_no) INTO :ls_aban_no
			FROM itemaban 
			WHERE aban_no LIKE :ls_aban_no1;		
		if isnull(ls_aban_no) or ls_aban_no = '' then
			ls_aban_no1 = ls_area + 'A' + ls_aban_date + '-' + '001'
		else
			li_seq = integer(MidA(ls_aban_no, 10, 3))
			li_seq = li_seq + 1
			ls_seq = '00' + string(li_seq)
			ls_aban_no1 = LeftA(ls_aban_no1, 9) + RightA(ls_seq, 3)
		end if
	else
		setnull(ls_aban_no)
		ls_aban_no1 = dw_2.object.aban_no[1]
		SELECT aban_no INTO :ls_aban_no
			FROM itemaban
			WHERE aban_no = :ls_aban_no;
		IF trim(ls_aban_no) = '' or isnull(ls_aban_no) then
		ELSE
			messagebox("저장", "폐기번호가 이미 존재합니다.", exclamation!)
			return
		end if
	end if
	dw_2.object.aban_no[1] = ls_aban_no1
	for ll_row = 1 to dw_3.rowcount()
		dw_3.object.aban_no[ll_row] = ls_aban_no1
		dw_3.object.seq[ll_row] = ll_row
	next
	is_aban_no = ls_aban_no1
END if
for ll_row = 1 to dw_3.RowCount() 
	if wf_jaego(ll_row) = False then//Trigger 재고마이너스
		RollBack;
		return
	end if
next
wf_update2(dw_2,dw_3,'Y')


end event

type st_title from statictext within w_ocp_aban_m
integer x = 46
integer y = 56
integer width = 1262
integer height = 148
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "제품폐기 요청관리"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type pb_print_part from picturebutton within w_ocp_aban_m
event mousemove pbm_mousemove
integer x = 3456
integer y = 64
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "프린터설정"
end type

event clicked;w_repsuper w_print
st_print l_print
 
if dw_2.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_4.Retrieve(is_aban_no)
l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 폐기물품을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_close from picturebutton within w_ocp_aban_m
event mousemove pbm_mousemove
integer x = 4421
integer y = 64
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "종료"
end type

event clicked;Close(Parent)

end event

type pb_cancel from picturebutton within w_ocp_aban_m
event mousemove pbm_mousemove
integer x = 3648
integer y = 64
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\cancel.bmp"
vtextalign vtextalign = multiline!
boolean map3dcolors = true
string powertiptext = "취소"
end type

event constructor;//long ll_row, ll_cnt
//
//dw_1.AcceptText()
//
//choose case dw_1.GetcolumnName()
//	case 'chk'
//		for ll_row = dw_1.RowCount() to 1 step -1
//			if dw_1.GetitemString(ll_row, 'chk') = 'Y' Then ll_cnt ++
//		next
//end choose
//
//if ll_cnt = 0 then
//	MessageBox('확인', '취소 할 항목을 선택하세요', Stopsign!)
//	Return
//end if
//
//if MessageBox('확인', '제품폐기 취소 작업을 하시겠습니까?', Question!, YesNo!, 2) = 1 then
//	for ll_row = dw_1.RowCount() to 1 step -1
//		if dw_1.GetItemString(ll_row, 'chk') = 'Y' then
//			choose case dw_1.GetItemString(ll_row, 'flag')
//				case 'Y'//폐기
//					dw_1.SetItem(ll_row, 'chk', 'N')
//					dw_1.SetItem(ll_row, 'flag', 'C')
//					if wf_jaego2(ll_row) = False then//Trigger 재고플러스
//						RollBack;
//						return
//					end if
//				case 'N'//등록
//					MessageBox('확인', '등록된 상태는 취소 할 수 없습니다.', StopSign!)
//					dw_1.SetItem(ll_row, 'chk', 'N')
//				case 'D'//결재
//					MessageBox('확인', '결재된 상태는 취소 할 수 없습니다.', StopSign!)
//					dw_1.SetItem(ll_row, 'chk', 'N')
//				case 'C'//취소
//					MessageBox('확인', '이미 취소된 상태 입니다.', StopSign!)
//			end choose
//		end if
//		dw_1.Update()
//		Commit;
//	next
//end if
//
end event

event clicked;if MessageBox("취소", "작업내역을 취소 하시겠습니까", Exclamation!, OKCancel!, 2) = 1 then
	dw_2.reset()
	dw_3.reset()
	pb_retrieve.triggerevent(clicked!)
end if

end event

type pb_delete from picturebutton within w_ocp_aban_m
event mousemove pbm_mousemove
integer x = 4037
integer y = 64
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "삭제"
end type

event clicked;string ls_team, ls_top
long ll_row

dw_2.accepttext()
dw_3.accepttext()
if dw_2.rowcount() < 1 then return
if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	ls_team = dw_2.object.approve_team[1]
	ls_top = dw_2.object.approve_top[1]
	if trim(ls_team) = '' or isnull(ls_team) then
		if trim(ls_top) = '' or isnull(ls_top) then
		else
			messagebox("확인","본부장결재가 되었습니다. 본부장결재 취소후 삭제가 가능합니다.")
			return
		end if
	else
		messagebox("확인","팀장결재가 되었습니다. 팀장결재 취소후 삭제가 가능합니다.")
		return
	end if
	
	for ll_row = 1 to dw_3.RowCount() 
		if wf_jaego2(ll_row) = False then//Trigger 재고마이너스
			RollBack;
			return
		end if
	next
	dw_2.deleterow(0)
	dw_3.RowsMove(1, dw_3.rowCount(), Primary!, dw_3, 1, Delete!)
	wf_update2(dw_2,dw_3,'Y')
	pb_retrieve.triggerevent(clicked!)
end if
//		
end event

type pb_insert from picturebutton within w_ocp_aban_m
event mousemove pbm_mousemove
integer x = 3845
integer y = 64
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "추가"
end type

event clicked;long ll_row, ll_dw4row

dw_2.reset()
dw_3.reset()

ll_row = dw_2.insertrow(0)
dw_2.object.aban_date[1] = wf_today()
dw_2.object.area_no[1] = gs_area
dw_2.object.user_id[1] = gs_userid
dw_2.object.user_date[1] = gf_today()
dw_2.object.loc_no[1] = is_loc

// process_flag = 'O':작성, 'Y':결재, 'C':마감 
dw_2.object.process_flag[1] = "O"


end event

type pb_retrieve from picturebutton within w_ocp_aban_m
event mousemove pbm_mousemove
integer x = 3255
integer y = 64
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "조회"
end type

event clicked;date  ld_start_date, ld_end_date
 
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.setredraw(false)
dw_2.setredraw(false)
dw_3.setredraw(false)
dw_1.reset()
dw_2.reset()
dw_3.reset()
ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
dw_1.retrieve(gs_area, ld_start_date,ld_end_date,is_oc)
dw_1.setredraw(true)
dw_2.setredraw(true)
dw_3.setredraw(true)


end event

type gb_1 from groupbox within w_ocp_aban_m
integer x = 3214
integer y = 16
integer width = 1431
integer height = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_ocp_aban_m
integer x = 1623
integer y = 16
integer width = 1573
integer height = 220
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "조회"
end type

