$PBExportHeader$w_ormondo_r.srw
$PBExportComments$일자별 수주현황(1999/7/19,이인호)
forward
global type w_ormondo_r from w_inheritance
end type
type gb_5 from groupbox within w_ormondo_r
end type
type em_1 from editmask within w_ormondo_r
end type
type st_1 from statictext within w_ormondo_r
end type
type em_2 from editmask within w_ormondo_r
end type
type gb_4 from groupbox within w_ormondo_r
end type
type dw_3 from datawindow within w_ormondo_r
end type
type dw_4 from datawindow within w_ormondo_r
end type
type st_2 from statictext within w_ormondo_r
end type
type rb_4 from radiobutton within w_ormondo_r
end type
type rb_5 from radiobutton within w_ormondo_r
end type
type rb_6 from radiobutton within w_ormondo_r
end type
type st_3 from statictext within w_ormondo_r
end type
type st_4 from statictext within w_ormondo_r
end type
end forward

global type w_ormondo_r from w_inheritance
integer y = 112
integer width = 4667
integer height = 2852
string title = "일자별 수주현황w_ormondo_r)"
gb_5 gb_5
em_1 em_1
st_1 st_1
em_2 em_2
gb_4 gb_4
dw_3 dw_3
dw_4 dw_4
st_2 st_2
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
st_3 st_3
st_4 st_4
end type
global w_ormondo_r w_ormondo_r

type variables
DATE id_start, id_end
string is_flag = 'D'
datawindowchild idwc_login
datawindowchild idwc_area

end variables

on w_ormondo_r.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.em_1=create em_1
this.st_1=create st_1
this.em_2=create em_2
this.gb_4=create gb_4
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_2=create st_2
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.gb_4
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.dw_4
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.rb_4
this.Control[iCurrent+10]=this.rb_5
this.Control[iCurrent+11]=this.rb_6
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.st_4
end on

on w_ormondo_r.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_2)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)

em_1.text = string(today(),'yyyy/mm/dd')
id_start = today()
em_2.text = string(today(),'yyyy/mm/dd')
id_end = today()
em_1.setfocus()

dw_2.visible = false
dw_3.visible = false

dw_4.SetTransObject(SQLCA)
dw_4.insertrow(0)

dw_4.getchild('user',idwc_login)
idwc_login.insertrow(1)
idwc_login.setitem(1,'user_id','%')
idwc_login.setitem(1,'user_name','전체')
idwc_login.accepttext()
dw_4.object.user[1] = "%"

end event

event resize;call super::resize;dw_1.width  = this.width - 117
dw_1.height = this.height - 382

dw_2.x = Int((dw_1.width  - dw_2.width) / 2) 
dw_2.y = Int((dw_1.height - dw_2.height) / 2)

dw_3.x = Int((dw_1.width  - dw_3.width) / 2) 
dw_3.y = Int((dw_1.height - dw_3.height) / 2)
end event

type pb_save from w_inheritance`pb_save within w_ormondo_r
boolean visible = false
integer taborder = 120
end type

type dw_1 from w_inheritance`dw_1 within w_ormondo_r
integer x = 46
integer y = 252
integer width = 4549
integer height = 2472
integer taborder = 0
string dataobject = "d_ormondo_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::retrieveend;
if rowcount < 1 then return

string ls_order, ls_area
datetime ld_date
real lr_rlse, lr_order
long ll_row, ll_cnt

Pointer oldpointer // Declares a pointer variable

oldpointer = SetPointer(HourGlass!)
OPEN( W_ICPROCESS )

for ll_row = 1 to rowcount
	w_icprocess.hpb_1.position = (ll_row / rowcount) * 100
	
   if this.object.prod[ll_row] <> 'J' and is_flag = "D" then
		continue
	else
		ls_order = this.object.order_no[ll_row]
		ll_cnt = 0
		select count(*) into :ll_cnt from saledet 
		 where order_no = :ls_order
		   and item_no like "P%"
			and item_no not between 'PZZZPP1ZZZ' and 'PZZZZZZZZZ';
		if ll_cnt > this.object.prodcnt[ll_row] then
			this.object.prod[ll_row] = "P"   //생산
		end if
	end if
	
	if is_flag = "D" then continue
 	
	ls_area = this.object.area[ll_row]
	if isnull(ls_area) or trim(ls_area) = '' then
		continue
	end if
	
	select max(do_date) into :ld_date 
	  from dodet, do
	 where sale_no = :ls_order
	   and do.do_no = dodet.do_no;
 
	this.object.do_date[ll_row] = STRING(ld_date, "yy/mm/dd")		// 출고일
next

close(W_ICPROCESS)
SetPointer(oldpointer)

end event

event dw_1::rowfocuschanged;long ll_row
string ls_order

ll_row = this.getrow()
if ll_row < 1 then return
ls_order = trim(this.object.order_no[ll_row])
if dw_2.visible = true then
	dw_2.retrieve(ls_order)
elseif dw_3.visible = true then
	dw_3.retrieve(ls_order)
end if

This.SelectRow(0, FALSE)
This.SelectRow(ll_row, TRUE)

end event

event dw_1::rbuttondown;//These statements in the RButtonDown script 
//for the window display a popup menu at the cursor position. 
//Menu4 was created in the Menu painter and includes a menu called m_language. 
//Menu4 is not the menu for the active window and therefore needs to be created. 
//NewMenu is an instance of Menu4 (data type Menu4):
////

int li_int
///
if dw_2.visible = true or dw_3.visible = true then
	return
end if
string ls_order

if row < 1 then return
this.scrolltorow(row)
ls_order = trim(this.object.order_no[row ])

m_manager NewMenu

NewMenu = CREATE m_manager

gs_print_control = ""
li_int = m_manager.m_ormonday.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())
//li_int = m_manager.m_ormonday.PopMenu(w_o_main.PointerX(),  w_o_main.PointerY())
CHOOSE CASE gs_print_control
	CASE "sale"
		dw_2.visible = true
		dw_2.retrieve(ls_order)

	CASE "dodet"
		dw_3.visible = true
		dw_3.retrieve(ls_order)
END CHOOSE

//w_frame.PointerX(), w_frame.PointerY())

end event

event dw_1::itemerror;return 2
end event

type dw_2 from w_inheritance`dw_2 within w_ormondo_r
integer x = 0
integer y = 1400
integer width = 3383
integer height = 756
integer taborder = 0
boolean titlebar = true
string title = "수주상세조회"
string dataobject = "d_mpproc1106_r2"
boolean controlmenu = true
boolean hscrollbar = true
boolean resizable = true
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ormondo_r
integer x = 32
integer y = 40
integer width = 1481
string text = "일자별 수주현황(체크)"
end type

type st_tips from w_inheritance`st_tips within w_ormondo_r
end type

type pb_compute from w_inheritance`pb_compute within w_ormondo_r
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_ormondo_r
boolean visible = false
integer x = 2935
integer y = 116
integer taborder = 100
end type

event pb_print_part::clicked;//gs_custdo_str lst_code
//string ls_sql, ls_where
//date ld_start, ld_end
//
//openwithparm(w_whcustdo_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//dw_3.visible = true
//dw_1.visible = false
//ld_start = date(lst_code.start_date)
//ld_end = date(lst_code.end_date)
//
//if lst_code.sel_flag = 'A' then
//   ls_where = " and do.do_date between ~~'" + &
//	           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
//else
//   ls_where = " and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
//	           string(ld_end) + "~~' and do.cust_no between ~~'" + &				
//	           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//end if
////dw_3.settransobject(sqlca)
//ls_sql = "datawindow.table.select = '" + is_custdor1sql + ls_where + "'"
////dw_1.settransobject(sqlca)
//dw_3.modify(ls_sql)
//dw_3.retrieve()
//if dw_3.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
//   return
//end if
//
//
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"거래명세표순 인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_ormondo_r
integer x = 4379
integer y = 56
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ormondo_r
integer x = 4187
integer y = 56
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where
long ll_count
w_repsuper w_print
st_print l_print
 
l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 수주번호별 월 출고현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_ormondo_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_ormondo_r
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_ormondo_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ormondo_r
integer x = 3995
integer y = 56
integer taborder = 60
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_saleman, ls_sdate, ls_edate
st_security lst_security
 
dw_1.dataobject = "d_ormondo_s"
dw_1.SetTransObject(sqlca)

string ls_level_userid
Choose Case gs_level
	Case 'A'
		ls_level_userid = '%'
	Case 'B'			
		string sec_userid
		sec_userid = gs_userid
		lst_security.s_title = st_title.text
		lst_security.s_userid = gs_userid		
		openwithparm(w_security,lst_security)
		sec_userid = Message.StringParm
		if sec_userid <> 'Y' then
			ls_level_userid = gs_userid
		Else
			ls_level_userid = '%'
		end if
	Case 'C'
		ls_level_userid = gs_userid
End Choose

ls_sdate = em_1.text
ls_edate = em_2.text
ls_saleman = dw_4.object.user[dw_4.getrow()]

dw_1.retrieve(date(ls_sdate), date(ls_edate), ls_saleman)
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_ormondo_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ormondo_r
boolean visible = false
integer x = 23
integer y = 240
integer width = 3557
integer height = 1828
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ormondo_r
integer x = 3977
integer y = 8
integer width = 613
integer height = 216
integer taborder = 0
end type

type gb_5 from groupbox within w_ormondo_r
integer x = 2862
integer y = 12
integer width = 1074
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "필터"
end type

type em_1 from editmask within w_ormondo_r
integer x = 1938
integer y = 140
integer width = 352
integer height = 80
integer taborder = 40
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

event modified;id_start = date(this.text)
//messagebox("",string(id_date))

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_ormondo_r
integer x = 2290
integer y = 132
integer width = 69
integer height = 72
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_ormondo_r
integer x = 2359
integer y = 140
integer width = 352
integer height = 80
integer taborder = 50
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

event modified;id_end = date(this.text)
//messagebox("",string(id_date))

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type gb_4 from groupbox within w_ormondo_r
integer x = 1586
integer width = 1230
integer height = 236
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_3 from datawindow within w_ormondo_r
integer x = 96
integer y = 960
integer width = 4462
integer height = 904
integer taborder = 110
boolean bringtotop = true
boolean titlebar = true
string title = "출고내역조회"
string dataobject = "d_ormondo_s3"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
end type

type dw_4 from datawindow within w_ormondo_r
integer x = 1938
integer y = 48
integer width = 827
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//string ls_user

this.accepttext()
//ls_user = this.object.user[1]
//if ls_user = "%" then
//	dw_1.SetFilter("")
//	dw_1.Filter()
//else
//	dw_1.SetFilter("user_name = '" + ls_user + "'" )
//	dw_1.setredraw(false)
//	dw_1.Filter()
//	dw_1.setredraw(true)
//end if
//
end event

type st_2 from statictext within w_ormondo_r
integer x = 1609
integer y = 56
integer width = 293
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "담당자"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_ormondo_r
integer x = 2962
integer y = 104
integer width = 233
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;dw_1.SetFilter("")
dw_1.Filter()
end event

type rb_5 from radiobutton within w_ormondo_r
integer x = 3282
integer y = 104
integer width = 233
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고"
end type

event clicked;dw_1.SetFilter("trim(cdate) <> '미출' ")
dw_1.SetReDraw(false)
dw_1.Filter()
dw_1.SetReDraw(true)
end event

type rb_6 from radiobutton within w_ormondo_r
integer x = 3547
integer y = 104
integer width = 293
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미출고"
end type

event clicked;dw_1.SetFilter("trim(cdate) = '미출' ")
dw_1.Filter()
end event

type st_3 from statictext within w_ormondo_r
integer x = 55
integer y = 188
integer width = 1152
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217857
long backcolor = 67108864
string text = "우측마우스 수주내역, 출고내역 조회"
boolean focusrectangle = false
end type

type st_4 from statictext within w_ormondo_r
integer x = 1609
integer y = 152
integer width = 293
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "조회일자"
alignment alignment = right!
boolean focusrectangle = false
end type

