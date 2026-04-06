$PBExportHeader$w_oigiask_m.srw
$PBExportComments$물품요청관리(1998/10/20,성삼지)
forward
global type w_oigiask_m from w_inheritance
end type
type dw_3 from datawindow within w_oigiask_m
end type
type em_1 from editmask within w_oigiask_m
end type
type em_2 from editmask within w_oigiask_m
end type
type dw_area from datawindow within w_oigiask_m
end type
type cb_1 from commandbutton within w_oigiask_m
end type
type dw_4 from datawindow within w_oigiask_m
end type
type cb_2 from commandbutton within w_oigiask_m
end type
type cb_3 from commandbutton within w_oigiask_m
end type
type dw_5 from datawindow within w_oigiask_m
end type
type st_vertical from u_splitbar_vertical within w_oigiask_m
end type
type st_horizontal from u_splitbar_horizontal within w_oigiask_m
end type
type st_1 from statictext within w_oigiask_m
end type
type st_2 from statictext within w_oigiask_m
end type
type st_3 from statictext within w_oigiask_m
end type
type ddlb_fld from dropdownlistbox within w_oigiask_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oigiask_m
end type
type st_4 from statictext within w_oigiask_m
end type
type sle_value from singlelineedit within w_oigiask_m
end type
type cb_4 from commandbutton within w_oigiask_m
end type
type cb_5 from commandbutton within w_oigiask_m
end type
type cb_6 from commandbutton within w_oigiask_m
end type
type cb_7 from commandbutton within w_oigiask_m
end type
type cbx_1 from checkbox within w_oigiask_m
end type
type ddlb_op from dropdownlistbox within w_oigiask_m
end type
type st_pick from structure within w_oigiask_m
end type
end forward

type st_pick from structure
	string		ls_cust_no
	string		ls_scene_code
	string		ls_sale_flag
end type

global type w_oigiask_m from w_inheritance
integer x = 23
integer y = 188
integer width = 4507
integer height = 2516
string title = "물품요청 관리(w_oigiask_m)"
dw_3 dw_3
em_1 em_1
em_2 em_2
dw_area dw_area
cb_1 cb_1
dw_4 dw_4
cb_2 cb_2
cb_3 cb_3
dw_5 dw_5
st_vertical st_vertical
st_horizontal st_horizontal
st_1 st_1
st_2 st_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cbx_1 cbx_1
ddlb_op ddlb_op
end type
global w_oigiask_m w_oigiask_m

type variables
public string is_ysp_sql, is_addr
st_print i_print
datawindowchild idwc_scene, idwc_cust, idwc_locno, idwc_item, idwc_qa
string  is_scenesql, is_ordersql, is_locnosql, is_flag, is_qasql
int     ii_row
date    id_start, id_end
boolean ib_multi 

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

/////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_3)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
/////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

long ll_row

dw_4.visible = false
dw_5.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_2.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)
dw_2.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

em_1.text = string(gdt_today, "yyyy/mm/dd")
em_2.text = string(gdt_today, "yyyy/mm/dd")

id_start  = date(em_1.text)
id_end    = date(em_2.text)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

end event

on w_oigiask_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.cb_1=create cb_1
this.dw_4=create dw_4
this.cb_2=create cb_2
this.cb_3=create cb_3
this.dw_5=create dw_5
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cbx_1=create cbx_1
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.dw_5
this.Control[iCurrent+10]=this.st_vertical
this.Control[iCurrent+11]=this.st_horizontal
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.ddlb_fld
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_4
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.cb_6
this.Control[iCurrent+22]=this.cb_7
this.Control[iCurrent+23]=this.cbx_1
this.Control[iCurrent+24]=this.ddlb_op
end on

on w_oigiask_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.cb_1)
destroy(this.dw_4)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.dw_5)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cbx_1)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_3.height = newheight - dw_3.y - gb_3.x

st_vertical.x      = dw_3.x + dw_3.width
st_vertical.height = dw_3.height

dw_1.width  = newwidth  - dw_1.x - gb_3.x

st_horizontal.x      = st_vertical.x + st_vertical.width
st_horizontal.width  = dw_1.width

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - dw_2.x - gb_3.x
dw_2.height = newheight - dw_2.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_oigiask_m
integer x = 3269
integer y = 64
integer taborder = 60
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
int     li_seq
long    ll_row
string  ls_ask_no, ls_seq, ls_area, ls_ask_date, ls_ask_no1
decimal lr_order_qty, lr_amt

dw_1.accepttext()
dw_2.accepttext()
if dw_1.rowcount() < 1 then RETURN

l_status = dw_1.getitemstatus(1, 0, primary!)

if dw_2.rowcount() < 1 then
	MessageBox("저장","등록된 물품이 없습니다!",exclamation!)
	RETURN
end if

if l_status = New! OR l_status = NewModified! then
	if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 1 then
		setpointer(hourglass!)
		// 대내송장 번호 부여
		ls_area = LeftA(dw_area.object.area[1], 1)
		
		if trim(dw_1.object.ask_no[1]) = '' OR isnull(dw_1.object.ask_no[1]) then
				ls_ask_date = string(dw_1.object.ask_date[1], "yyyymmdd")
				ls_ask_no1  = ls_area + ls_ask_date + '-' + '%'			
				
				SELECT MAX(ask_no) INTO :ls_ask_no FROM ask_head WHERE ask_no LIKE :ls_ask_no1;		
				if isnull(ls_ask_no) OR ls_ask_no = '' then
					ls_ask_no1 = ls_area + ls_ask_date + '-' + '01'
				else
					li_seq = integer(MidA(ls_ask_no, 11, 2))
				li_seq = li_seq + 1
					ls_seq = '00' + trim(string(li_seq))
					ls_ask_no1 = LeftA(ls_ask_no1, 10)  + RightA(ls_seq, 2)
				end if
		else
			 setnull(ls_ask_no)
	           ls_ask_no1 = dw_1.object.ask_no[1]		
		      SELECT ask_no INTO :ls_ask_no FROM ask_head WHERE ask_no = :ls_ask_no1;		
			IF trim(ls_ask_no) = '' OR isnull(ls_ask_no) then
			else
				dw_1.object.ask_no[1] = ls_ask_no1
				MessageBox("저장","요청번호가 이미 존재합니다.", exclamation!)
				RETURN
			end if
		end if
		
		if isnull(dw_1.object.f_area[1]) or trim(dw_1.object.f_area[1]) = '' then
			dw_1.setcolumn('f_area')
			dw_1.setfocus()
			MessageBox("확인","접수될 곳의 지역을 입력하십시요.", exclamation!)
			RETURN
		end if
		dw_1.object.ask_no[1] = ls_ask_no1
		
		if wf_nullchk(dw_1) = false then RETURN
		if wf_nullchk(dw_2) = false then RETURN
		
		for ll_row = 1 to dw_2.rowcount() 
			dw_2.object.ask_no[ll_row] = ls_ask_no1
		next
		dw_1.accepttext()
		dw_2.accepttext()
		
		// 요청수량 입력 CHECK
		for ll_row = 1 to dw_2.rowcount()
			if dw_2.object.qa[ll_row] = '' or isnull(dw_2.object.qa[ll_row]) then
				dw_2.scrolltorow(ll_row)			
				dw_2.setcolumn("qa")
				dw_2.setfocus()
				MessageBox("확인","규격을 입력하세요!",exclamation!)
				RETURN
			end if
			lr_order_qty = dw_2.getitemdecimal(ll_row, "ask_qty")
			if lr_order_qty = 0 then
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("ask_qty")
				dw_2.setfocus()
				MessageBox("확인","요청수량을 입력하세요!",exclamation!)
				RETURN
			end if
		next
	else
		return
	end if
	
	if wf_update2(dw_1, dw_2, 'Y') = true then
		pb_retrieve.triggerevent(clicked!)
	end if
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oigiask_m
integer x = 2345
integer y = 444
integer width = 2089
integer height = 440
integer taborder = 80
string dataobject = "d_oigiask_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::itemchanged;//
int li_int

this.Accepttext()

if dwo.name <> 'f_area' then RETURN 0

if data = dw_1.object.t_area[1] then
	MessageBox("확인","요청지와 같습니다")
	RETURN 1
end if

end event

event dw_1::rbuttondown;if row > 0 and dwo.name = 'ask_date' then
	openWithParm(w_calendar, message.stringparm)
	if message.stringparm <> 'N' then
		this.object.ask_date[1] = datetime(date(message.stringparm))
	end if
end if
this.accepttext()

end event

event dw_1::itemerror;call super::itemerror;string ls_null

setnull(ls_null)
CHOOSE CASE dwo.name
	CASE 'f_area'
		this.object.f_area[1] = ls_null
END CHOOSE
return 2
end event

type st_title from w_inheritance`st_title within w_oigiask_m
integer x = 32
integer y = 28
integer width = 1015
integer height = 136
string text = "물품요청 관리"
end type

type st_tips from w_inheritance`st_tips within w_oigiask_m
end type

type pb_compute from w_inheritance`pb_compute within w_oigiask_m
integer x = 3753
integer y = 292
integer width = 155
integer height = 112
integer taborder = 140
boolean enabled = false
string picturename = "c:\bmp\pencil.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

event pb_compute::clicked;long ll_row, ll_seq, ll_front
decimal lr_order_qty

dw_2.accepttext()
dw_1.accepttext()
if dw_1.rowcount() < 1 then
	return
end if
if dw_1.object.proc_flag[1] <> "N" then
	return
end if
for ll_row = 1 TO dw_2.rowcount()
   IF  (isnull(dw_2.object.item_no[ll_row]) OR &
	         trim(dw_2.object.item_no[ll_row]) = '') then
		messagebox("저장", string(ll_row,'###') + "번째 물품코드가 없습니다." )
		dw_2.setcolumn('item_no')
		dw_2.setfocus()
		return
   END IF	
   IF  (isnull(dw_2.object.qa[ll_row]) OR &
	         trim(dw_2.object.qa[ll_row]) = '') then
		messagebox("저장", string(ll_row,'###') + "번째 물품규격 없습니다." )
		dw_2.setcolumn('qa')
		dw_2.setfocus()
		return
   END IF	
   IF  dw_2.object.ask_qty[ll_row] = 0 then
		messagebox("저장", string(ll_row,'###') + "번째 물품 요청수량이 0입니다." )
		dw_2.setcolumn('ask_qty')
		dw_2.setfocus()
		return
   END IF		
next

ll_row = dw_2.insertrow(0)
dw_2.scrolltorow(ll_row)
ll_seq = dw_2.rowcount()

if ll_seq > 1 then
	ll_front = dw_2.object.seq_no[ll_row - 1]
	dw_2.object.seq_no[ll_row] = ll_front + 1
else
	dw_2.object.seq_no[ll_row] = ll_row
end if
dw_2.setcolumn('item_no')
dw_2.setfocus()
end event

type pb_print_part from w_inheritance`pb_print_part within w_oigiask_m
integer x = 3918
integer y = 292
integer width = 155
integer height = 112
integer taborder = 40
string picturename = "c:\bmp\delete.bmp"
end type

event pb_print_part::clicked;dwitemstatus l_status
string ls_flag, ls_ask
long ll_row, ll_seq

dw_2.accepttext()

ll_row = dw_2.getrow()
if ll_row < 1 then return

l_status = dw_2.getitemstatus(ll_row, 0, primary!)
if l_status = New! or l_status = NewModified! then
	dw_2.deleterow(dw_2.getrow())
else
	if dw_2.object.rlse_flag[ll_row] <> "N" then
			messagebox("확인","이미 처리된 물품입니다." + &
					  "~r~n삭제할 수 없습니다.", exclamation!)
			return
	else
		ls_ask = dw_2.object.ask_no[ll_row]
		ll_seq = dw_2.object.seq_no[ll_row]
		setnull(ls_flag)
		select rlse_flag into :ls_flag from ask_det
		 where ask_no = :ls_ask
			and seq_no = :ll_seq;
		 if ls_flag <> "N" then
			messagebox("확인","이미 처리된 물품입니다." + &
					  "~r~n삭제할 수 없습니다.", exclamation!)
			return
		end if
	end if
	
	if messagebox("삭제","선택하신자료를 삭제하시겠습니까?",question!,okcancel!,2) = 1 then
		dw_2.deleterow(dw_2.getrow())
		wf_update1( dw_2, 'Y')
	end if
end if

end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)
end event

type pb_close from w_inheritance`pb_close within w_oigiask_m
integer x = 3461
integer y = 64
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiask_m
integer x = 3077
integer y = 64
integer taborder = 160
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
string     ls_askno

if dw_3.getrow() < 1 then RETURN

ls_askno = dw_3.object.ask_no[dw_3.getrow()]

dw_4.retrieve( ls_askno )

l_print.st_datawindow  = dw_4
l_print.st_print_desc  = " 이 프로그램은 물품요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oigiask_m
integer x = 2693
integer y = 64
integer taborder = 170
string disabledname = "c:\bmp\cancel.bmp"
end type

event pb_cancel::clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
end event

type pb_delete from w_inheritance`pb_delete within w_oigiask_m
integer x = 2885
integer y = 64
integer taborder = 180
string disabledname = "c:\bmp\delete.bmp"
end type

event pb_delete::clicked;dwitemstatus l_status
string ls_flag, ls_ask
long ll_row

dw_1.accepttext()
dw_2.accepttext()

ll_row = dw_1.rowcount()
if ll_row < 1 then return

l_status = dw_1.getitemstatus(1, 0, primary!)
if l_status = New! or l_status = NewModified! then
	dw_1.deleterow(1)
	return
end if
if dw_1.object.proc_flag[1] <> "N" then
		messagebox("확인","이미 처리된 물품이 있습니다." + &
              "~r~n삭제할 수 없습니다.", exclamation!)
	   return
else
	ls_ask = dw_1.object.ask_no[1]
	setnull(ls_flag)
	select proc_flag into :ls_flag from ask_head
	 where ask_no = :ls_ask;
	 if ls_flag = "Y" then
		messagebox("확인","이미 처리된 물품이 있습니다." + &
              "~r~n삭제할 수 없습니다.", exclamation!)
	   return
	end if
end if

if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	dw_1.deleterow(1)
	dw_2.rowsmove(1, dw_2.rowcount(), Primary!, dw_2, 1, Delete!)
	if wf_update2(dw_1, dw_2, 'Y') = true then
		pb_retrieve.triggerevent(clicked!)
	end if
end if

end event

type pb_insert from w_inheritance`pb_insert within w_oigiask_m
integer x = 2501
integer y = 64
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;long ll_row

dw_1.reset()
dw_2.reset()

ll_row = dw_1.insertrow(0)
if isnull(ll_row) OR ll_row < 1 then RETURN

dw_1.scrolltorow(ll_row)

dw_1.object.ask_date[1] = gf_today()
dw_1.object.ask_user[1] = gs_userid
dw_1.object.t_area[1]   = dw_area.object.area[1]
dw_1.object.log_date[1] = gf_today()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oigiask_m
integer x = 2309
integer y = 64
integer taborder = 30
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long	 ll_row
string ls_area, ls_sdate, ls_edate
date   ld_sdate, ld_edate

id_start = date(em_1.text)
id_start = date(em_2.text)

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

ls_area  = dw_area.object.area[1]
ls_sdate = string(ld_sdate,"yyyy/mm/dd")
ls_edate = string(ld_edate,"yyyy/mm/dd")

dw_1.reset() ; dw_2.reset()

ll_row = dw_3.retrieve( ls_sdate, ls_edate, ls_area )
if ll_row < 1 then
	MessageBox("확인", "해당하는 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oigiask_m
integer x = 32
integer y = 240
integer width = 4402
integer height = 188
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79220952
end type

type gb_2 from w_inheritance`gb_2 within w_oigiask_m
integer x = 1097
integer y = 12
integer width = 1157
integer height = 220
integer taborder = 130
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiask_m
integer x = 2272
integer width = 1413
integer height = 220
integer taborder = 70
integer weight = 400
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oigiask_m
event ue_keydown pbm_dwnkey
integer x = 2345
integer y = 940
integer width = 2089
integer height = 1440
integer taborder = 110
string dataobject = "d_oigiaskdet_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::ue_keydown;IF keydown(KeyEnter! ) and this.getrow() = this.rowcount() THEN
	IF keyflags = 0 THEN
		choose case this.getcolumnname() 
			case "ask_qty"
				pb_compute.default = true
		end choose
	END IF
END IF
return 0


end event

event dw_2::itemchanged;string ls_where, ls_sql, ls_item_no, ls_qa, ls_com_qa, ls_item_name, ls_data
string ls_uom, ls_com_item, ls_com_item1, ls_com_item2, ls_cust_no, ls_scene_no
string ls_sale_no, ls_cust_name
long ll_row, ll_lenth, ll_x, ll_y, ll_row1, ll_found 
int li_int
decimal lr_order_qty, lr_acc_qty, lr_price, lr_price_a 

dw_1.accepttext()
dw_2.accepttext()
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

choose case dwo.name
	case 'item_no'
		this.object.qa[ll_row] = ''
//		this.object.uom[ll_row] = ''
		this.object.ask_qty[ll_row] = 0
		this.object.rlse_qty[ll_row] = 0
		this.object.issue_qty[ll_row] = 0 
		this.object.rem[ll_row] = ''
		this.object.loc_no[ll_row] = ''
//		this.object.qa.tabsequence = 0
//		this.object.qa.background.color = 78682240
		
		this.getchild("item_no", idwc_item)
		idwc_item.settransobject(sqlca)
		
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			is_flag = '1'
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_item_name = idwc_item.getitemstring(idwc_item.getrow(), "item_name")
		this.object.item_name[this.getrow()] = ls_item_name
		
		if ls_item_no <> '' then
			this.getchild("qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
			
			if idwc_qa.rowcount() > 0 then
//				this.object.qa.tabsequence = 1
//				this.object.qa.background.color = 1087434968
				this.setcolumn("qa")
				this.setfocus()
			else
//				this.object.qa.tabsequence = 0
//				this.object.qa.background.color = 78682240
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
			is_flag = '2'
			messagebox("확인","위와 같은 규격은 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		this.setcolumn("ask_qty")
		this.setfocus()				
	case 'sale_no'
		ls_sale_no = trim(this.object.sale_no[row])
		setnull(ls_cust_name)
		
		select cust_name into  :ls_cust_name
		  from sale, customer
		 where sale.order_no = :ls_sale_no
			and sale.cust_no = customer.cust_no;
		if sqlca.sqlcode = 100 then
			messagebox("확인","입력하신 수주번호가 등록되어있지 않습니다.")
		end if
		this.setredraw(false)
		this.object.cust_name[row] = ls_cust_name
		this.setredraw(true)
end choose


end event

event dw_2::itemerror;if is_flag = '1' then
	this.object.item_no[row] = ''
else
	this.object.qa[row] = ''	
end if

return 2
end event

event dw_2::rowfocuschanged;string  ls_item_no

this.accepttext()
if this.getrow() > 0 then
	ls_item_no = this.object.item_no[this.getrow()]
	if ls_item_no = '' or isnull(ls_item_no) then
		return
	else
//		this.getchild("qa", idwc_qa)
//		gs_ds_qaall.ShareData(idwc_qa)
		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		idwc_qa.filter()
			
	end if
end if
end event

event dw_2::losefocus;call super::losefocus;pb_compute.default = false

end event

type dw_3 from datawindow within w_oigiask_m
integer x = 32
integer y = 444
integer width = 2258
integer height = 1936
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oigiask_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
string ls_askno
long   ll_row

this.accepttext()

ll_row = this.getrow()
if ll_row > 0 then
	ls_askno = this.object.ask_no[ll_row]
	dw_1.retrieve( ls_askno )
	dw_2.retrieve( ls_askno )
end if

end event

event clicked;//
//is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if ib_multi = false then RETURN

this.SelectRow(row, NOT this.IsSelected(row))



end event

type em_1 from editmask within w_oigiask_m
integer x = 1435
integer y = 136
integer width = 389
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;id_start = date(this.text)

end event

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if
id_start = date(this.text)

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_oigiask_m
integer x = 1833
integer y = 136
integer width = 389
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_end = date(this.text)
id_end = RelativeDate(id_end ,1)
end event

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if
id_end = date(this.text)
id_end = RelativeDate(id_end ,1)

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type dw_area from datawindow within w_oigiask_m
integer x = 1435
integer y = 52
integer width = 521
integer height = 80
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type cb_1 from commandbutton within w_oigiask_m
integer x = 4082
integer y = 292
integer width = 325
integer height = 112
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
end type

event clicked;//
string ls_area, ls_loc
long   ll_row, ll_cnt
gs_where2 lstr_where

dw_2.accepttext()
dw_1.accepttext()

if dw_1.rowcount() < 1 then RETURN

if dw_1.object.proc_flag[1] <> "N" then RETURN

ls_area = dw_1.object.ask_loc[1]
SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :ls_area;

lstr_where.chk = 'M' //M:multi S:single
lstr_where.chk1 = ls_loc
OpenWithParm( w_whitemlocqohmulti_w, lstr_where )
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then RETURN

dw_2.setredraw( false )
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_2.insertrow(0)
	
	if ll_cnt = 1 then 
		dw_2.object.seq_no[ll_cnt] = 1
	else
		dw_2.object.seq_no[ll_cnt] = dw_2.object.seq_no[ll_cnt - 1] + 1
	end if
	
	dw_2.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])
	dw_2.object.qa[ll_cnt]        = trim(lstr_where.str2[ll_row])
	dw_2.object.sale_no[ll_cnt]   = trim(lstr_where.str4[ll_row])
	dw_2.object.cust_name[ll_cnt] = trim(lstr_where.str5[ll_row])
	dw_2.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
	dw_2.object.ask_qty[ll_cnt]   = lstr_where.qty2[ll_row]
next
dw_2.setredraw( true )

dw_2.scrolltorow(1)
idwc_qa.setfilter("item_no = '" + trim(lstr_where.str1[1]) + "'")
idwc_qa.filter()

dw_2.setcolumn('ask_qty')
dw_2.setfocus()

end event

type dw_4 from datawindow within w_oigiask_m
integer x = 50
integer y = 184
integer width = 96
integer height = 68
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_oigiaskdet_r"
boolean livescroll = true
end type

type cb_2 from commandbutton within w_oigiask_m
integer x = 2423
integer y = 280
integer width = 325
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중선택"
end type

event clicked;//
if ib_multi then
	ib_multi = false
else
	ib_multi = true
end if

end event

type cb_3 from commandbutton within w_oigiask_m
integer x = 2423
integer y = 344
integer width = 325
integer height = 64
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중출력"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
w_repsuper w_print
st_print   l_print

debugbreak()

string ls_askno[]
long   ll_row, ll_cnt

if dw_3.getrow() < 1 then RETURN

for ll_row = 1 to dw_3.rowcount()
	if dw_3.IsSelected(ll_row) then
		ll_cnt = ll_cnt + 1
		
		ls_askno[ll_cnt] = dw_3.object.ask_no[ll_row]
	end if
next

dw_5.retrieve( ls_askno )

l_print.st_datawindow  = dw_5
l_print.st_print_desc  = " 이 프로그램은 물품요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

ib_multi = false
dw_3.SelectRow(0, FALSE)
//dw_3.SelectRow(row, TRUE)


end event

type dw_5 from datawindow within w_oigiask_m
integer x = 160
integer y = 184
integer width = 96
integer height = 68
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_oigiaskdet_r1"
boolean livescroll = true
end type

type st_vertical from u_splitbar_vertical within w_oigiask_m
integer x = 2309
integer y = 444
integer height = 1936
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = this.x + this.width
st_horizontal.width = dw_1.width

end event

type st_horizontal from u_splitbar_horizontal within w_oigiask_m
integer x = 2345
integer y = 900
integer width = 2089
boolean bringtotop = true
end type

type st_1 from statictext within w_oigiask_m
integer x = 1125
integer y = 136
integer width = 311
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
string text = "요청일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_oigiask_m
integer x = 1125
integer y = 52
integer width = 311
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
string text = "사업장"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_oigiask_m
integer x = 73
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_oigiask_m
integer x = 261
integer y = 304
integer width = 443
integer height = 632
integer taborder = 220
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

type ddlb_dwtitles from dropdownlistbox within w_oigiask_m
integer x = 293
integer y = 316
integer width = 311
integer height = 88
integer taborder = 250
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

type st_4 from statictext within w_oigiask_m
integer x = 731
integer y = 320
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

type sle_value from singlelineedit within w_oigiask_m
integer x = 1211
integer y = 308
integer width = 498
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_4 from commandbutton within w_oigiask_m
integer x = 1723
integer y = 308
integer width = 160
integer height = 76
integer taborder = 130
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

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_5 from commandbutton within w_oigiask_m
integer x = 1888
integer y = 308
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_6 from commandbutton within w_oigiask_m
integer x = 2053
integer y = 308
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_7 from commandbutton within w_oigiask_m
integer x = 2217
integer y = 308
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_1 from checkbox within w_oigiask_m
integer x = 2775
integer y = 316
integer width = 457
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
string text = "요청지 변경"
end type

event clicked;//
if this.checked = true then
	dw_1.object.t_area.tabsequence = 35
	this.checked = false
end if

end event

type ddlb_op from dropdownlistbox within w_oigiask_m
integer x = 901
integer y = 300
integer width = 302
integer height = 500
integer taborder = 150
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

