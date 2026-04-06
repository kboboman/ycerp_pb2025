$PBExportHeader$w_mpslitcon_m.srw
$PBExportComments$스리팅작업지시서관리(2000/06/28,이인호)
forward
global type w_mpslitcon_m from w_inheritance
end type
type em_1 from editmask within w_mpslitcon_m
end type
type em_2 from editmask within w_mpslitcon_m
end type
type st_1 from statictext within w_mpslitcon_m
end type
type dw_5 from datawindow within w_mpslitcon_m
end type
type dw_4 from datawindow within w_mpslitcon_m
end type
type rb_1 from radiobutton within w_mpslitcon_m
end type
type rb_2 from radiobutton within w_mpslitcon_m
end type
type cbx_1 from checkbox within w_mpslitcon_m
end type
type st_2 from statictext within w_mpslitcon_m
end type
type st_3 from statictext within w_mpslitcon_m
end type
type pb_1 from picturebutton within w_mpslitcon_m
end type
type rb_3 from radiobutton within w_mpslitcon_m
end type
type rb_4 from radiobutton within w_mpslitcon_m
end type
type rb_5 from radiobutton within w_mpslitcon_m
end type
type dw_3 from datawindow within w_mpslitcon_m
end type
type dw_6 from datawindow within w_mpslitcon_m
end type
type st_4 from statictext within w_mpslitcon_m
end type
type st_5 from statictext within w_mpslitcon_m
end type
type st_6 from statictext within w_mpslitcon_m
end type
type gb_4 from groupbox within w_mpslitcon_m
end type
type gb_5 from groupbox within w_mpslitcon_m
end type
type dw_7 from datawindow within w_mpslitcon_m
end type
type dw_8 from datawindow within w_mpslitcon_m
end type
end forward

global type w_mpslitcon_m from w_inheritance
integer width = 4923
integer height = 2288
string title = "스리팅 작업지시서 작성(w_mpslitcon_m)"
em_1 em_1
em_2 em_2
st_1 st_1
dw_5 dw_5
dw_4 dw_4
rb_1 rb_1
rb_2 rb_2
cbx_1 cbx_1
st_2 st_2
st_3 st_3
pb_1 pb_1
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
dw_3 dw_3
dw_6 dw_6
st_4 st_4
st_5 st_5
st_6 st_6
gb_4 gb_4
gb_5 gb_5
dw_7 dw_7
dw_8 dw_8
end type
global w_mpslitcon_m w_mpslitcon_m

type variables
string is_flag = 'O'
datawindow idw_print, dw3, dw6, dw7
end variables

on w_mpslitcon_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_5=create dw_5
this.dw_4=create dw_4
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cbx_1=create cbx_1
this.st_2=create st_2
this.st_3=create st_3
this.pb_1=create pb_1
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.dw_3=create dw_3
this.dw_6=create dw_6
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.gb_4=create gb_4
this.gb_5=create gb_5
this.dw_7=create dw_7
this.dw_8=create dw_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.rb_3
this.Control[iCurrent+13]=this.rb_4
this.Control[iCurrent+14]=this.rb_5
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.dw_6
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.st_6
this.Control[iCurrent+20]=this.gb_4
this.Control[iCurrent+21]=this.gb_5
this.Control[iCurrent+22]=this.dw_7
this.Control[iCurrent+23]=this.dw_8
end on

on w_mpslitcon_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.dw_3)
destroy(this.dw_6)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.dw_7)
destroy(this.dw_8)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(),"YYYY/mm/dd")
em_2.text = string(today(),"YYYY/mm/dd")

//tab_1.tabpage_2.enabled = false
//dw3 = tab_1.tabpage_1.dw_3
//dw6 = tab_1.tabpage_1.dw_6
//dw7 = tab_1.tabpage_2.dw_7
rb_4.checked = True
rb_5.enabled = False
dw3 = dw_3
dw6 = dw_6
dw7 = dw_7
dw7.visible  = False
dw3.visible  = True
dw6.visible  = True
st_4.visible = True

dw3.settransobject(sqlca)
dw7.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_8.settransobject(sqlca)

dw_8.visible = false
dw_5.visible = false
rb_1.triggerevent(clicked!)

dw3.object.coilmst_item_no.protect = 1
dw3.object.rt.protect = 1
dw3.object.coil_no.protect = 1
dw3.object.cnt.protect = 1
dw3.object.order_date.protect = 1
dw3.object.rem.protect = 1

if gf_permission('스리팅작업지시서관리', gs_userid) = 'Y' then	
else
	pb_delete.enabled = false
	pb_save.enabled = false
	pb_1.enabled = false
end if

pb_insert.triggerevent(clicked!)


end event

event resize;call super::resize;//
gb_3.height = this.height - 368
dw_1.height = this.height - 576

gb_2.width  = this.width  - 1019
dw_2.width  = this.width  - 1083

gb_4.width  = this.width  - 1019
gb_4.height = this.height - 512
dw_4.width  = this.width  - 1093
dw_4.height = this.height - 1184

end event

type pb_save from w_inheritance`pb_save within w_mpslitcon_m
integer x = 4411
integer y = 64
integer taborder = 50
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_coilno
dec{1} ld_wid

dw_2.accepttext()
dw3.accepttext()

if dw_2.rowcount() < 1 then return
if dw3.rowcount()  < 1 or cbx_1.checked = false then return

string ls_place

ls_place = dw_2.object.wc_place[1]
if trim(ls_place) = "" or isnull(ls_place) then
		MessageBox("확인", "작업유형을을 선택하십시요")
		dw_2.setcolumn('wc_place')
		dw_2.setfocus()
		return
end if

if ls_place = "I" then
	if isnull(dw_2.object.wc_no[1]) then
		MessageBox("확인", "작업장을 선택하십시요")
		dw_2.setcolumn('wc_no')
		dw_2.setfocus()
		return
	end if
else
	if isnull(dw_2.object.supp_no[1]) then
		MessageBox("확인", "거래처를 선택하십시요")
		dw_2.setcolumn('supp_no')
		dw_2.setfocus()
		return
	end if
end if

if MessageBox("확인", "선택한 내역을 저장 하시겠습니까?", &
	Exclamation!, OKCancel!, 2) = 2 then 
	return
end if

long    ll_row
date    ld_date
integer li_num
string  ls_date, ls_num, ls_like, ls_order, ls_area, ls_flag, ls_loc
string  ls_coilorderdet_order[]

// 지시번호
ls_area = LeftA(gs_area,1)
ls_flag = trim(dw_2.object.wc_place[1])
ls_date = string(dw_2.object.order_date[1],'yyyymmdd')
ls_like = ls_area + ls_flag + ls_date + '%'
SELECT max(order_no) INTO :ls_order FROM coilorder WHERE order_no LIKE :ls_like;
if sqlca.sqlcode < 0 then
  messagebox('오류','수행중 오류가 발생했습니다.',exclamation!)
  return;
else
  if isnull(ls_order) then
	  dw_2.object.order_no[1] = ls_area + ls_flag + ls_date + '-01'
  else
	  ls_order = trim(ls_order)
	  li_num   = integer(RightA(ls_order,2))
	  
	  li_num++
	  ls_num   = RightA('000' + string(li_num),2)
	  dw_2.object.order_no[1] = ls_area + ls_flag + ls_date + "-" + ls_num
  end if
end if
dw_2.object.planner[1] = gs_userid

for ll_row = 1 to dw3.rowcount()
	dw3.object.proc_flag[ll_row] = "M" // 작업지시중
	dw3.object.coilorder_order[ll_row] = dw_2.object.order_no[1]
	
	ls_coilorderdet_order[ll_row] = dw3.object.order_no[ll_row]
	ls_coilno = dw3.object.coil_no[ll_row]
	ls_loc    = dw3.object.loc_no[ll_row]
	ld_wid    = dw3.object.wid[ll_row]
	
	// 작업지시중
	UPDATE coilmst SET open_close = "P" WHERE coil_no = :ls_coilno AND loc_no = :ls_loc;
	if sqlca.sqlcode <> 0 then
		messagebox('오류1',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
next

dw_8.retrieve(ls_coilorderdet_order)
for ll_row = 1 to dw_8.rowcount()
	ls_coilno = dw_8.object.coil_no[ll_row]
	ls_loc    = dw_8.object.loc_no[ll_row]
	ld_wid    = dw_8.object.wid[ll_row]
	
	// 작업지시중
	UPDATE coilmst SET open_close = "P" WHERE coil_no = :ls_coilno and loc_no = :ls_loc;
	if sqlca.sqlcode <> 0 then
		messagebox('오류2',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
next

if wf_update2(dw_2,dw3,'Y') = true then
	date ld_start, ld_end 
	
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)
	
	ll_row = dw6.insertrow(0)
	dw6.scrolltorow(ll_row)
	dw6.object.order_no[ll_row] = dw_2.object.order_no[1]
	
	dw_2.reset()
	dw3.reset()
	dw_4.reset()
	cbx_1.checked  = false
	dw3.HScrollBar = false
	dw3.VScrollBar = false
	
	dw3.dataobject  ='d_mpslitingone_m'
	dw3.settransobject(sqlca)
	dw_4.dataobject ='d_mpslitcon_m'
	dw_4.settransobject(sqlca)
	
	if dw_1.retrieve( ld_start, ld_end, is_flag ) < 1 then
		cbx_1.enabled = false
	end if
	
	if messagebox("확인","작업지시서를 출력하시겠습니까?",exclamation!, okcancel!, 1) = 1 then
		pb_print.postevent(clicked!)
	end if
end if


end event

type dw_1 from w_inheritance`dw_1 within w_mpslitcon_m
string tag = "d_mpsliting_t"
integer x = 59
integer y = 404
integer width = 869
integer height = 1712
integer taborder = 80
string title = "d_mpslitcon_t"
string dataobject = "d_mpslitcon_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;long ll_row
string ls_order

if cbx_1.checked = true then return

ll_row = wf_rowfocuschange(dw_1,'N')
if ll_row < 1 then return

ls_order = trim(dw_1.object.order_no[ll_row])
dw3.retrieve(ls_order)
dw7.retrieve(ls_order)
if rb_1.checked = true then
	dw_4.retrieve(ls_order)
else
	dw_2.retrieve(ls_order)
end if

end event

event dw_1::clicked;//
if row < 1 then return
if cbx_1.checked = false then return

string ls_filter, ls_order, ls_neworder, ls_filter2
long   ll_row, ll_newrow, ll_foundrow, ll_row4
int    li_cnt

dw3.accepttext()
dw3.setredraw(false)
dw_4.setredraw(false)
this.SelectRow(row, NOT this.IsSelected(row))

ls_filter = ''
li_cnt    = 0
//	if this.checked = true then
	ls_neworder = this.object.order_no[row]
//	end if
for ll_row = 1 to this.rowcount()
	if this.isselected(ll_row) = true then
		ls_order = this.object.order_no[ll_row]
		if li_cnt = 0 then
			ls_filter = "order_no = '" + ls_order + "'"
			li_cnt = 1
		else
			ls_filter = ls_filter + " OR order_no = '" + ls_order + "'"
		end if
	end if
next

if ls_filter = '' then
	ls_filter = "order_no = 'NON'"
end if
dw3.SetFilter(ls_filter)
dw3.Filter( )
ll_newrow = dw3.rowcount()

if cbx_1.checked = true then		// 선택
	ll_foundrow = dw3.find("order_no = '" + ls_neworder + "'", 1, dw3.rowcount())
	dw3.setitem(ll_foundrow, 'order_seq',ll_newrow)
end if
dw3.setsort('order_seq')
dw3.sort()

for ll_row = 1 to dw3.rowcount()
	dw3.object.order_seq[ll_row] = ll_row
	ls_filter2 = "order_no = '" + dw3.object.order_no[ll_row] + "'"
	dw_4.SetFilter(ls_filter2)
	dw_4.Filter( )
	for ll_row4 = 1 to dw_4.rowcount()
		dw_4.object.order_seq[ll_row4] = ll_row
	next
next

dw_4.SetFilter(ls_filter)
dw_4.Filter( )
dw_4.accepttext()
dw_4.setsort('order_seq, order_no, seq')
dw_4.sort()

dw3.setredraw(true)
dw_4.setredraw(true)
dw3.scrolltorow(ll_newrow)
dw_4.scrolltorow(dw_4.rowcount())

end event

event dw_1::retrieveend;
if rowcount < 0 then
	dw_2.reset()
	dw3.reset()
	dw7.reset()
	dw_4.reset()
end if

end event

type dw_2 from w_inheritance`dw_2 within w_mpslitcon_m
integer x = 997
integer y = 280
integer width = 3246
integer height = 88
integer taborder = 90
string dataobject = "d_mpslitinghead_m"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::losefocus;this.accepttext()
end event

event dw_2::itemchanged;date ld_date
integer li_num
string ls_date,ls_num,ls_like,ls_order, ls_place, ls_wc, ls_null

this.accepttext()
setnull(ls_null)
choose case dwo.name
	case 'order_date','wc_no','wc_place','supp_no'
        ld_date = date(this.object.order_date[1])
        ls_place = this.object.wc_place[1]
		
		  if dwo.name = 'wc_place' then
			  if ls_place = "I" then
				  this.object.wc_no[1] = ls_null
				  this.object.supp_no[1] = "NO"
			  else
				  this.object.wc_no[1] = "NO"
				  this.object.supp_no[1] = ls_null
			  end if
			else
			  if ls_place = "I" then
				  ls_wc = trim(this.object.wc_no[1])
				  this.object.supp_no[1] = "NO"
			  else
				  ls_wc = trim(this.object.supp_no[1])
				  this.object.wc_no[1] = "NO"
			  end if
		  end if
end choose
end event

event dw_2::rbuttondown;CHOOSE CASE dwo.name
	CASE 'order_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.order_date[row] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.accepttext()

end event

type st_title from w_inheritance`st_title within w_mpslitcon_m
integer x = 55
integer y = 40
integer width = 1632
integer height = 128
string text = "스리팅 작업지시서 작성"
end type

type st_tips from w_inheritance`st_tips within w_mpslitcon_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpslitcon_m
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpslitcon_m
boolean visible = false
integer x = 2875
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_mpslitcon_m
integer x = 4613
integer y = 64
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpslitcon_m
integer x = 4219
integer y = 64
integer taborder = 140
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

string ls_order
long ll_row, ll_cnt

idw_print.accepttext()
if idw_print.rowcount() < 1 then return

ls_order = idw_print.object.order_no[idw_print.getrow()]

ll_row = dw_5.retrieve(ls_order)

ll_cnt = mod(ll_row, 16)

for ll_row = 1 to 16 - ll_cnt -1
	dw_5.insertrow(0)
next

l_print.st_datawindow = dw_5
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  =  " 이 프로그램은 슬리팅작업지시서를 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpslitcon_m
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpslitcon_m
integer x = 4027
integer y = 64
integer taborder = 190
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_delete::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_proc, ls_loc, ls_orderno
long   ll_row 

dw3.accepttext()
if dw3.rowcount() < 1 then return

ll_row = dw3.getrow()
if ll_row < 1 then return

debugbreak()
ls_orderno = dw3.object.order_no[ll_row]
ls_proc    = dw3.object.proc_flag[ll_row]
choose case ls_proc
	case "M"
		if MessageBox("확인", "선택한 원코일상세내역을 취소 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then 
			return
		end if
	case "P"
		MessageBox("확인", "이미 구매발주중입니다.")
		return
   case "C"
		MessageBox("확인", "이미 작업완료되었습니다.")
		return
	case else 
		MessageBox("오류", "이 자료는 정상처리 되지 않았습니다.")
	   return
end choose

string ls_null, ls_coilno
dec{1} ld_wid
string ls_coilorderdet_order[]
long   ll_row8

setnull(ls_null)

dw3.object.proc_flag[ll_row] = "O"
dw3.object.coilorder_order[ll_row] = ls_null

ls_coilno = dw3.object.coil_no[ll_row]
ls_loc    = dw3.object.loc_no[ll_row]
ld_wid    = dw3.object.wid[ll_row]
UPDATE coilmst 
   SET open_close = "M" // 생산계획중
 WHERE coil_no = :ls_coilno AND loc_no = :ls_loc AND open_close <> 'C';
if sqlca.sqlcode <> 0 then
	messagebox('오류1',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
	rollback;
	return
end if

ls_coilorderdet_order[1] = dw3.object.order_no[ll_row]
dw_8.retrieve( ls_coilorderdet_order )

for ll_row8 = 1 to dw_8.rowcount()
	ls_coilno = dw_8.object.coil_no[ll_row8]
	ls_loc    = dw_8.object.loc_no[ll_row8]
	ld_wid    = dw_8.object.wid[ll_row8]
	UPDATE coilmst 
	   SET open_close = "M" // 생산계획중
	 WHERE coil_no = :ls_coilno AND loc_no = :ls_loc AND open_close <> 'C';
	if sqlca.sqlcode <> 0 then
		messagebox('오류2',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
next

dw3.RowsMove(ll_row, ll_row, Primary!, dw3, 1, Filter!)
if dw3.rowcount() = 0 then
	dw_2.deleterow(1)
end if

if wf_update2(dw_2,dw3,'Y') = true then
	date ld_start, ld_end 
	
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)
	
	if dw_1.retrieve( ld_start, ld_end, is_flag ) < 1 then
		dw_4.reset()
	end if
else
	dw3.RowsMove(ll_row, ll_row, Filter!, dw3, 1, Primary!)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_mpslitcon_m
boolean visible = false
integer x = 2619
integer y = 36
integer taborder = 210
fontcharset fontcharset = ansi!
end type

event pb_insert::clicked;if dw_1.rowcount() < 1 then return

DW_2.RESET()
DW_2.INSERTROW(1)
DW_2.OBJECT.order_date[1] = wf_today()
DW_2.OBJECT.due_date[1] = wf_today()
dw_2.accepttext()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpslitcon_m
integer x = 3817
integer y = 64
integer taborder = 30
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end 
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

dw_4.dataobject ='d_mpslitcon_m'
dw_4.settransobject(sqlca)
if rb_2.checked = true or rb_3.checked = true then
else
	cbx_1.checked = false
	dw3.dataobject ='d_mpslitingone_m'
	dw3.settransobject(sqlca)
end if

dw_1.reset()
if dw_1.retrieve(ld_start,ld_end, is_flag) > 0 then
	if rb_1.checked = true then
		cbx_1.checked = false
		cbx_1.enabled = true
	end if
else
	if rb_1.checked = true then
		cbx_1.checked = false
		cbx_1.enabled = false
	end if
end if


end event

type gb_3 from w_inheritance`gb_3 within w_mpslitcon_m
integer x = 37
integer y = 232
integer width = 914
integer height = 1912
integer taborder = 100
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpslitcon_m
integer x = 960
integer y = 232
integer width = 3881
integer height = 152
integer taborder = 110
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "작업지시"
end type

type gb_1 from w_inheritance`gb_1 within w_mpslitcon_m
integer x = 3776
integer y = 16
integer width = 1065
integer height = 212
integer taborder = 60
integer textsize = -10
integer weight = 400
end type

type em_1 from editmask within w_mpslitcon_m
integer x = 2894
integer y = 136
integer width = 366
integer height = 80
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

type em_2 from editmask within w_mpslitcon_m
integer x = 3351
integer y = 136
integer width = 366
integer height = 80
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

type st_1 from statictext within w_mpslitcon_m
integer x = 3259
integer y = 132
integer width = 78
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_mpslitcon_m
integer x = 1426
integer width = 110
integer height = 84
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_mpslitcon_r"
boolean livescroll = true
end type

type dw_4 from datawindow within w_mpslitcon_m
integer x = 997
integer y = 1016
integer width = 3794
integer height = 1096
integer taborder = 70
boolean bringtotop = true
string title = "스리팅"
string dataobject = "d_mpslitcon_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_mpslitcon_m
integer x = 2917
integer y = 68
integer width = 320
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미지시"
boolean checked = true
end type

event clicked;//
pb_delete.enabled = false
pb_save.enabled   = true
pb_insert.enabled = true
pb_1.enabled      = false

is_flag   = 'O'
idw_print = dw6

dw3.HScrollBar  = false
dw3.VScrollBar  = false
dw3.dataobject  = 'd_mpslitingone_m'
dw3.settransobject(sqlca)

dw_1.dataobject = 'd_mpsliting_t'
dw_1.settransobject(sqlca)

//cbx_1.enabled = true
dw_2.reset()
dw_4.reset()

end event

type rb_2 from radiobutton within w_mpslitcon_m
integer x = 3214
integer y = 68
integer width = 238
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "지시"
end type

event clicked;//
pb_delete.enabled = true
pb_save.enabled   = false
pb_insert.enabled = false
pb_1.enabled      = true

is_flag   = 'O'		// 지시
idw_print = dw_1

dw3.HScrollBar  = TRUE
dw3.VScrollBar  = TRUE
dw3.dataobject  = 'd_mpslitingone_m3'
dw3.settransobject(sqlca)

dw_1.dataobject = 'd_mpslitcon_t'
dw_1.settransobject(sqlca)

cbx_1.checked = false
cbx_1.enabled = false

dw_1.selectrow(0, false)

dw_2.reset()
dw_4.reset()

end event

type cbx_1 from checkbox within w_mpslitcon_m
integer x = 78
integer y = 304
integer width = 251
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
boolean enabled = false
string text = "선택"
end type

event clicked;if dw_1.rowcount() < 1 then return

long ll_row
string ls_order, ls_filter
dw_2.accepttext()
if this.checked = true then
	if dw_2.rowcount() > 0 then
	else
		pb_insert.triggerevent(clicked!)
	end if
	dw3.Setredraw(false)
	dw_4.Setredraw(false)

	dw3.HScrollBar = TRUE
	dw3.VScrollBar = TRUE
	dw3.dataobject ='d_mpslitingone_m2'
	dw3.settransobject(sqlca)
	
	dw_4.dataobject ='d_mpslitcon_m2'
	dw_4.settransobject(sqlca)
	date ld_start, ld_end 

	ld_start = date(em_1.text)
	ld_end = date(em_2.text)

	dw3.retrieve(ld_start,ld_end, is_flag)
	dw_4.retrieve(ld_start,ld_end, is_flag)
	
	ls_order = 'non'  
	ls_filter = "order_no = '" + ls_order + "'"
	dw3.SetFilter(ls_filter)
	dw3.Filter( )
	
	dw_4.SetFilter(ls_filter)
	dw_4.Filter( )
	dw3.Setredraw(true)
else
	dw3.HScrollBar = false
	dw3.VScrollBar = false
	dw3.dataobject ='d_mpslitingone_m'
	dw3.settransobject(sqlca)
	dw_4.dataobject ='d_mpslitcon_m'
	dw_4.settransobject(sqlca)
	
	ll_row = wf_rowfocuschange(dw_1,'N')
	if ll_row < 1 then return
	
	ls_order = trim(dw_1.object.order_no[ll_row])
	ls_filter = ""
	dw3.retrieve(ls_order)
	dw_4.retrieve(ls_order)
end if
end event

type st_2 from statictext within w_mpslitcon_m
integer x = 1961
integer y = 416
integer width = 178
integer height = 52
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
string text = "(진행/"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpslitcon_m
integer x = 2112
integer y = 416
integer width = 142
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "완료)"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_mpslitcon_m
integer x = 667
integer y = 588
integer width = 187
integer height = 144
integer taborder = 170
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string picturename = "c:\bmp\delete.bmp"
end type

event clicked;
if dw_1.getrow() < 1 then return


dw3.accepttext()
if dw3.rowcount() < 1 then return

long ll_row , ll_row8

ll_row = dw3.rowcount()
if ll_row < 1 then return

string ls_proc

if MessageBox("확인", "선택한 작업지시 전체내역을 취소 하시겠습니까?", &
	Exclamation!, OKCancel!, 2) = 2 then 
	return
end if
for ll_row = 1 to dw3.rowcount()
	ls_proc = dw3.object.proc_flag[ll_row]
	if ls_proc = "M" then
	elseif ls_proc = "P" then
			MessageBox("확인", string(ll_row) + " 번째 자료가 이미 구매발주중입니다.")
			return
	elseif ls_proc = "C" then
			MessageBox("확인", string(ll_row) + " 번째 자료가 이미 작업완료되었습니다.")
			return
	else
			MessageBox("오류", string(ll_row) + " 번째 자료가 정상처리되지 않았습니다.")
			return
	end if
next

string ls_null
string ls_coilno
dec{1} ld_wid
string ls_coilorderdet_order[]

setnull(ls_null)

for ll_row = 1 to dw3.rowcount()
	dw3.object.proc_flag[ll_row] = "O"
	ls_coilorderdet_order[ll_row] = dw3.object.order_no[ll_row]
	dw3.object.coilorder_order[ll_row] = ls_null
	
	ls_coilno = dw3.object.coil_no[ll_row]
	ld_wid = dw3.object.wid[ll_row]
	update coilmst set open_close = "M" // 생산계획중
	 where coil_no = :ls_coilno
		and wid = :ld_wid;
	if sqlca.sqlcode <> 0 then
		messagebox('오류1',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
next

dw_8.retrieve(ls_coilorderdet_order)
for ll_row8 = 1 to dw_8.rowcount()
	ls_coilno = dw_8.object.coil_no[ll_row8]
	ld_wid = dw_8.object.wid[ll_row8]
	update coilmst set open_close = "M" // 생산계획중
	 where coil_no = :ls_coilno
		and wid = :ld_wid;
	if sqlca.sqlcode <> 0 then
		messagebox('오류2',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
next
dw3.RowsMove(1, dw3.rowcount(), Primary!, dw3, 1, Filter!)
dw_2.deleterow(1)

if wf_update2(dw_2,dw3,'Y') = true then
	date ld_start, ld_end 
	
	ld_start = date(em_1.text)
	ld_end = date(em_2.text)
	dw_1.setfocus()
	dw_1.reset()
	if dw_1.retrieve(ld_start,ld_end, is_flag) < 1 then
		dw_4.reset()
	end if
else
	dw3.RowsMove(1, dw3.rowcount(), Filter!, dw3, 1, Primary!)

end if

end event

type rb_3 from radiobutton within w_mpslitcon_m
integer x = 3438
integer y = 68
integer width = 238
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력"
end type

event clicked;//
pb_delete.enabled = false
pb_save.enabled   = false
pb_insert.enabled = false
pb_1.enabled      = false

is_flag   = '%'		// 출력
idw_print = dw_1

dw3.HScrollBar = TRUE
dw3.VScrollBar = TRUE
dw3.dataobject ='d_mpslitingone_m3'
dw3.settransobject(sqlca)

dw_1.dataobject ='d_mpslitcon_t'
dw_1.settransobject(sqlca)

cbx_1.checked = false
cbx_1.enabled = false

dw_1.selectrow(0, false)

dw_2.reset()
dw_4.reset()

end event

type rb_4 from radiobutton within w_mpslitcon_m
integer x = 1019
integer y = 412
integer width = 407
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
string text = "원코일내역"
boolean checked = true
end type

event clicked;//
dw_7.visible = False
dw_3.visible = True
dw_6.visible = True
st_4.visible = True

end event

type rb_5 from radiobutton within w_mpslitcon_m
integer x = 1449
integer y = 412
integer width = 471
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
string text = "합체코일내역"
end type

event clicked;dw7.visible = True
dw3.visible = False
dw6.visible = False
st_4.visible = False

end event

type dw_3 from datawindow within w_mpslitcon_m
integer x = 997
integer y = 480
integer width = 3223
integer height = 520
integer taborder = 180
boolean bringtotop = true
string title = "원코일"
string dataobject = "d_mpslitingone_m3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if rb_1.checked = true then return

long ll_row
string ls_order

ll_row = wf_rowfocuschange(dw_3,'N')
if ll_row < 1 then return

ls_order = trim(dw_3.object.order_no[ll_row])
dw_4.retrieve(ls_order)

end event

event rbuttondown;CHOOSE CASE dwo.name
	CASE 'order_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.order_date[row] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.accepttext()

end event

event rowfocuschanged;if rb_1.checked = true then return

long ll_row
string ls_order

ll_row = wf_rowfocuschange(dw_3,'N')
if ll_row < 1 then return

ls_order = trim(dw_3.object.order_no[ll_row])
dw_4.retrieve(ls_order)

end event

type dw_6 from datawindow within w_mpslitcon_m
integer x = 4238
integer y = 548
integer width = 549
integer height = 452
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_mpslitcon_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;datawindow ldw_pre

ldw_pre = idw_print

idw_print = dw_6
pb_print.triggerevent(clicked!)

idw_print = ldw_pre
end event

type st_4 from statictext within w_mpslitcon_m
integer x = 4238
integer y = 480
integer width = 549
integer height = 68
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
string text = "작성된 작업지시"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_5 from statictext within w_mpslitcon_m
integer x = 2464
integer y = 140
integer width = 407
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "작업일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_mpslitcon_m
integer x = 2464
integer y = 60
integer width = 407
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "작업구분"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_mpslitcon_m
integer x = 960
integer y = 376
integer width = 3881
integer height = 1768
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_mpslitcon_m
integer x = 2437
integer y = 16
integer width = 1312
integer height = 212
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_7 from datawindow within w_mpslitcon_m
integer x = 1298
integer y = 612
integer width = 2711
integer height = 340
integer taborder = 40
boolean bringtotop = true
string title = "합체"
string dataobject = "d_mpslitconsum_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if rowcount > 0 then
	//	tab_1.tabpage_2.enabled = true
	rb_5.enabled = True
else
	//	tab_1.tabpage_2.enabled = false
	rb_5.enabled = False
end if
end event

type dw_8 from datawindow within w_mpslitcon_m
integer x = 1559
integer width = 110
integer height = 84
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_mpslitcon_h"
end type

