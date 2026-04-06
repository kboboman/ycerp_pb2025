$PBExportHeader$w_ormondo_r.srw
$PBExportComments$일자별 수주현황(1999/7/19,이인호)
forward 
global type w_ormondo_r from w_inheritance
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
type em_1 from editmask within w_ormondo_r
end type
type em_2 from editmask within w_ormondo_r
end type
type st_horizontal from u_splitbar_horizontal within w_ormondo_r
end type
type dw_3 from datawindow within w_ormondo_r
end type
type st_6 from statictext within w_ormondo_r
end type
type ddlb_fld from dropdownlistbox within w_ormondo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ormondo_r
end type
type st_7 from statictext within w_ormondo_r
end type
type ddlb_op from dropdownlistbox within w_ormondo_r
end type
type sle_value from singlelineedit within w_ormondo_r
end type
type cb_2 from commandbutton within w_ormondo_r
end type
type cb_3 from commandbutton within w_ormondo_r
end type
type cb_4 from commandbutton within w_ormondo_r
end type
type cb_5 from commandbutton within w_ormondo_r
end type
type pb_1 from picturebutton within w_ormondo_r
end type
type st_vertical from u_splitbar_vertical within w_ormondo_r
end type
end forward

global type w_ormondo_r from w_inheritance
integer y = 112
integer width = 4219
integer height = 2352
string title = "일자별 수주현황w_ormondo_r)"
dw_4 dw_4
st_2 st_2
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
st_3 st_3
st_4 st_4
em_1 em_1
em_2 em_2
st_horizontal st_horizontal
dw_3 dw_3
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
pb_1 pb_1
st_vertical st_vertical
end type
global w_ormondo_r w_ormondo_r

type variables
//
DATE   id_start, id_end
string is_flag = 'D'

DataWindowChild idwc_area, idwc_login


end variables

on w_ormondo_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.st_2=create st_2
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.st_3=create st_3
this.st_4=create st_4
this.em_1=create em_1
this.em_2=create em_2
this.st_horizontal=create st_horizontal
this.dw_3=create dw_3
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.pb_1=create pb_1
this.st_vertical=create st_vertical
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.rb_4
this.Control[iCurrent+4]=this.rb_5
this.Control[iCurrent+5]=this.rb_6
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.em_2
this.Control[iCurrent+10]=this.st_horizontal
this.Control[iCurrent+11]=this.dw_3
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.st_7
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_4
this.Control[iCurrent+21]=this.cb_5
this.Control[iCurrent+22]=this.pb_1
this.Control[iCurrent+23]=this.st_vertical
end on

on w_ormondo_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.st_2)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_horizontal)
destroy(this.dw_3)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.pb_1)
destroy(this.st_vertical)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)

st_vertical.of_set_leftobject(dw_2)
st_vertical.of_set_rightobject(dw_3)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//
dw_3.SetTransObject(SQLCA)

// 담당자
dw_4.SetTransObject(SQLCA)
dw_4.insertrow(0)

dw_4.getchild('user',idwc_login)
idwc_login.insertrow(1)
idwc_login.setitem(1,'user_id','%')
idwc_login.setitem(1,'user_name','전체')
idwc_login.accepttext()
dw_4.object.user[1] = "%"

//
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

em_1.setfocus()


end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - (newheight * 0.5)

st_horizontal.y      = dw_1.y + dw_1.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.height = newheight - dw_2.y - gb_3.x

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.y      = dw_2.y
st_vertical.height = dw_2.height

dw_3.x      = st_vertical.x + st_vertical.width
dw_3.y      = dw_2.y
dw_3.width  = newwidth  - dw_3.x - gb_3.x
dw_3.height = dw_2.height

end event

type pb_save from w_inheritance`pb_save within w_ormondo_r
boolean visible = false
integer taborder = 120
end type

type dw_1 from w_inheritance`dw_1 within w_ormondo_r
integer x = 32
integer y = 440
integer width = 4110
integer height = 916
integer taborder = 0
string dataobject = "d_ormondo_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::retrieveend;//
if rowcount() < 1 then return

string ls_order, ls_area
real   lr_rlse, lr_order
long   ll_row, ll_cnt
datetime ld_date

Pointer oldpointer // Declares a pointer variable

oldpointer = SetPointer(HourGlass!)
Open( W_ICPROCESS )

for ll_row = 1 to rowcount
	w_icprocess.hpb_1.position = (ll_row / rowcount) * 100
	
   if this.object.prod[ll_row] <> "J" then CONTINUE

	if is_flag = "D" then CONTINUE

	ls_area = this.object.area[ll_row]
	if isnull(ls_area) OR trim(ls_area) = "" then CONTINUE
	
	ls_order = this.object.order_no[ll_row]

	ll_cnt = 0
	SELECT count(*) INTO :ll_cnt 
	  FROM saledet 
	 WHERE order_no = :ls_order
		AND item_no  LIKE 'P%'
		AND item_no   NOT between 'PZZZPP1ZZZ' and 'PZZZZZZZZZ';
	if ll_cnt > this.object.prodcnt[ll_row] then
		this.object.prod[ll_row] = "P"   // 생산
	end if
	 	
	SELECT max(do_date) INTO :ld_date FROM dodet, do WHERE do.do_no = dodet.do_no AND sale_no = :ls_order;
 
	this.object.do_date[ll_row] = string(ld_date, "yy/mm/dd")		// 출고일
next

Close( W_ICPROCESS )
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

event dw_1::rbuttondown;//
string ls_order
int    li_int

//
if isnull(row) OR row < 1 then RETURN

this.scrolltorow(row)

ls_order = trim(this.object.order_no[row])

m_manager NewMenu
NewMenu = CREATE m_manager

gs_print_control = ""
li_int = m_manager.m_ormonday.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())
choose case gs_print_control
	case "sale"
//		dw_2.visible = true
		dw_2.retrieve(ls_order)

	case "dodet"
		dw_3.visible = true
		dw_3.retrieve(ls_order)
end choose

//w_frame.PointerX(), w_frame.PointerY())

end event

event dw_1::itemerror;return 2
end event

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ormondo_r
integer x = 37
integer y = 20
integer height = 140
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
integer x = 3895
integer y = 64
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ormondo_r
integer x = 3698
integer y = 64
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
integer x = 3314
integer y = 64
integer taborder = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_saleman
date   ld_sdate, ld_edate
 
dw_1.dataobject = "d_ormondo_s"
dw_1.SetTransObject(sqlca)

//
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

dw_4.accepttext()
ls_saleman = dw_4.object.user[dw_4.getrow()]

dw_1.retrieve( ld_sdate, ld_edate, ls_saleman )
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_ormondo_r
integer x = 32
integer y = 256
integer width = 4110
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ormondo_r
integer x = 1522
integer y = 16
integer width = 1733
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ormondo_r
integer x = 3278
integer y = 16
integer width = 832
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ormondo_r
integer x = 32
integer y = 1400
integer width = 2752
integer height = 816
integer taborder = 0
string title = "수주상세조회"
string dataobject = "d_mpproc1106_r2"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_ormondo_r
integer x = 1847
integer y = 56
integer width = 672
integer height = 76
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
integer x = 1554
integer y = 56
integer width = 293
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
string text = "담당자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_ormondo_r
integer x = 2642
integer y = 76
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
integer x = 2917
integer y = 76
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
integer x = 2917
integer y = 148
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
integer x = 46
integer y = 192
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
integer x = 1554
integer y = 136
integer width = 293
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
string text = "조회일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_ormondo_r
integer x = 1851
integer y = 136
integer width = 370
integer height = 80
integer taborder = 40
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

type em_2 from editmask within w_ormondo_r
integer x = 2226
integer y = 136
integer width = 370
integer height = 80
integer taborder = 50
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

type st_horizontal from u_splitbar_horizontal within w_ormondo_r
integer x = 32
integer y = 1364
integer width = 4110
boolean bringtotop = true
end type

type dw_3 from datawindow within w_ormondo_r
integer x = 2839
integer y = 1400
integer width = 1303
integer height = 816
integer taborder = 110
boolean bringtotop = true
string title = "출고내역조회"
string dataobject = "d_ormondo_s3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = StyleLowered!
end type

type st_6 from statictext within w_ormondo_r
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_ormondo_r
integer x = 270
integer y = 308
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ormondo_r
integer x = 302
integer y = 320
integer width = 311
integer height = 88
integer taborder = 120
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

type st_7 from statictext within w_ormondo_r
integer x = 741
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

type ddlb_op from dropdownlistbox within w_ormondo_r
integer x = 910
integer y = 308
integer width = 297
integer height = 512
integer taborder = 120
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

type sle_value from singlelineedit within w_ormondo_r
integer x = 1230
integer y = 312
integer width = 567
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_ormondo_r
integer x = 1801
integer y = 312
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_ormondo_r
integer x = 1966
integer y = 312
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_ormondo_r
integer x = 2130
integer y = 312
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ormondo_r
integer x = 2295
integer y = 312
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_ormondo_r
event mousemove pbm_mousemove
integer x = 3506
integer y = 64
integer width = 187
integer height = 144
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_vertical from u_splitbar_vertical within w_ormondo_r
integer x = 2798
integer y = 1400
integer height = 816
boolean bringtotop = true
end type

