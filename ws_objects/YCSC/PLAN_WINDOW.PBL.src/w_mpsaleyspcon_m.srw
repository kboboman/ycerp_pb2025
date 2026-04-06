$PBExportHeader$w_mpsaleyspcon_m.srw
$PBExportComments$YSP수주접수관리(2003/01/07,이인호)
forward
global type w_mpsaleyspcon_m from w_inheritance
end type
type rb_1 from radiobutton within w_mpsaleyspcon_m
end type
type rb_2 from radiobutton within w_mpsaleyspcon_m
end type
type dw_3 from datawindow within w_mpsaleyspcon_m
end type
type dw_4 from datawindow within w_mpsaleyspcon_m
end type
type em_2 from editmask within w_mpsaleyspcon_m
end type
type st_1 from statictext within w_mpsaleyspcon_m
end type
type em_1 from editmask within w_mpsaleyspcon_m
end type
type em_3 from editmask within w_mpsaleyspcon_m
end type
type st_3 from statictext within w_mpsaleyspcon_m
end type
type st_8 from statictext within w_mpsaleyspcon_m
end type
type ddlb_col from dropdownlistbox within w_mpsaleyspcon_m
end type
type st_9 from statictext within w_mpsaleyspcon_m
end type
type ddlb_2 from dropdownlistbox within w_mpsaleyspcon_m
end type
type sle_value from singlelineedit within w_mpsaleyspcon_m
end type
type cb_filteron from commandbutton within w_mpsaleyspcon_m
end type
type cb_filteroff from commandbutton within w_mpsaleyspcon_m
end type
type cb_7 from commandbutton within w_mpsaleyspcon_m
end type
type cb_4 from commandbutton within w_mpsaleyspcon_m
end type
type cb_13 from commandbutton within w_mpsaleyspcon_m
end type
end forward

global type w_mpsaleyspcon_m from w_inheritance
integer y = 36
integer width = 4434
integer height = 2448
string title = "판매수주생산확정(YSP)(w_mpsaleyspcon_m)"
boolean resizable = false
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_4 dw_4
em_2 em_2
st_1 st_1
em_1 em_1
em_3 em_3
st_3 st_3
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_7 cb_7
cb_4 cb_4
cb_13 cb_13
end type
global w_mpsaleyspcon_m w_mpsaleyspcon_m

type variables
st_print i_print
end variables

on w_mpsaleyspcon_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.em_2=create em_2
this.st_1=create st_1
this.em_1=create em_1
this.em_3=create em_3
this.st_3=create st_3
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_7=create cb_7
this.cb_4=create cb_4
this.cb_13=create cb_13
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.em_3
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_8
this.Control[iCurrent+11]=this.ddlb_col
this.Control[iCurrent+12]=this.st_9
this.Control[iCurrent+13]=this.ddlb_2
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_filteron
this.Control[iCurrent+16]=this.cb_filteroff
this.Control[iCurrent+17]=this.cb_7
this.Control[iCurrent+18]=this.cb_4
this.Control[iCurrent+19]=this.cb_13
end on

on w_mpsaleyspcon_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_3)
destroy(this.st_3)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_7)
destroy(this.cb_4)
destroy(this.cb_13)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if GF_Permission('YSP수주접수관리', gs_userid) = 'Y' then	
else
//	messagebox("권한", "이프로그램의 사용권한이 없습니다")
	pb_save.enabled = false
end if

em_3.text = "BD" + string(today(), "yyyy")
em_1.text = string(RelativeDate(today(),  - 7), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
ddlb_col.text = "거래처명"
ddlb_2.text   = "LIKE"

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_4.visible = false
end event

event resize;call super::resize;dw_3.height = this.height - 1352
end event

type pb_save from w_inheritance`pb_save within w_mpsaleyspcon_m
integer x = 3963
integer y = 48
end type

event pb_save::clicked;string ls_chk, ls_order
int    li_cnt

if dw_2.rowcount() < 1 then return

ls_chk = 'N'
if dw_2.getItemStatus(1, 0, Primary!) <> NotModified! then
	ls_chk = 'Y'
end if

ls_order = dw_2.object.order_no[1]
select count(*) into :li_cnt from sale
 where order_no = :ls_order
   and confirm_flag = 'Y';
if li_cnt < 1 then 
	messagebox("확인", "해당수주는 확정이 취소 되어 있는 상태입니다. ~r~n" &
							 + "재조회 하시고, 수주담당자와 연락하시기 바랍니다.")
	return
end if
if wf_update2(dw_2, dw_3, 'Y') = true then
	if ls_chk = 'Y' then	pb_retrieve.postevent(clicked!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_mpsaleyspcon_m
integer x = 37
integer y = 440
integer width = 1646
integer height = 760
string dataobject = "d_mpsaleyspcon_s"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;string ls_order
long ll_row

ll_row = this.getrow()

if ll_row < 1 then return
ls_order = this.object.order_no[ll_row]

dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)

end event

type dw_2 from w_inheritance`dw_2 within w_mpsaleyspcon_m
integer x = 1701
integer y = 220
integer width = 2679
integer height = 980
integer taborder = 60
string dataobject = "d_mpsaleyspcon_m"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_mpsaleyspcon_m
integer x = 46
integer y = 32
integer width = 1275
string text = "판매수주생산확정(YSP)"
end type

type st_tips from w_inheritance`st_tips within w_mpsaleyspcon_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsaleyspcon_m
integer x = 814
integer y = 216
integer width = 142
integer height = 104
integer taborder = 110
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_compute::clicked;string ls_order
long ll_row
 
ls_order = TRIM(em_3.TEXT)

dw_2.setredraw(false)
dw_3.setredraw(false)
dw_2.reset()
dw_3.reset()
dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)

dw_2.setredraw(true)
dw_3.setredraw(true)

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpsaleyspcon_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsaleyspcon_m
integer x = 4155
integer y = 48
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsaleyspcon_m
integer x = 3771
integer y = 48
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
 
if dw_2.getrow() < 1 then return
string ls_order
long ll_row

ls_order = dw_2.object.order_no[1]
dw_4.retrieve(ls_order)

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsaleyspcon_m
boolean visible = false
integer y = 56
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpsaleyspcon_m
boolean visible = false
integer x = 2880
integer taborder = 170
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_mpsaleyspcon_m
boolean visible = false
integer x = 2693
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsaleyspcon_m
integer x = 3579
integer y = 48
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_flag
date   ld_start, ld_end

dw_1.setredraw(false)
dw_2.setredraw(false)
dw_3.setredraw(false)
dw_1.reset()
dw_2.reset()
dw_3.reset()

ls_flag = 'Y'
if rb_1.checked = true then ls_flag = 'N'	// 대기

ld_start = date(em_1.text)
ld_end   = date(em_2.text)
dw_1.retrieve(ls_flag, ld_start, ld_end)
dw_1.setredraw(true)
dw_2.setredraw(true)
dw_3.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_mpsaleyspcon_m
boolean visible = false
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_mpsaleyspcon_m
integer x = 1705
integer y = 56
integer width = 1307
integer height = 152
integer taborder = 120
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpsaleyspcon_m
integer x = 3552
integer y = 8
integer width = 823
end type

type rb_1 from radiobutton within w_mpsaleyspcon_m
integer x = 1746
integer y = 108
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "대기"
boolean checked = true
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type rb_2 from radiobutton within w_mpsaleyspcon_m
integer x = 1966
integer y = 108
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "완료"
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type dw_3 from datawindow within w_mpsaleyspcon_m
integer x = 32
integer y = 1224
integer width = 4347
integer height = 1096
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_orsaleyspcon_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;integer ll_row

this.Accepttext()
ll_row = this.getrow()

choose case dwo.name
	case 'chk'	
		if data = 'N' then
			this.object.sol_qty[ll_row] = this.getitemnumber(ll_row, "sol_qty", Primary!, TRUE)
			this.object.saledet_text[ll_row] = this.getitemstring(ll_row, "saledet_text", Primary!, TRUE)
		else
			this.object.sol_qty[ll_row] = this.object.order_qty[ll_row] - this.object.rlse_qty[ll_row]
			this.object.saledet_text[ll_row] = 'X'
	   end if
end choose


end event

type dw_4 from datawindow within w_mpsaleyspcon_m
integer x = 1353
integer y = 60
integer width = 114
integer height = 88
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_orsaleyspcon_r"
boolean livescroll = true
end type

type em_2 from editmask within w_mpsaleyspcon_m
integer x = 2629
integer y = 104
integer width = 357
integer height = 80
integer taborder = 80
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_mpsaleyspcon_m
integer x = 2578
integer y = 116
integer width = 46
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
string text = "~~"
boolean focusrectangle = false
end type

type em_1 from editmask within w_mpsaleyspcon_m
integer x = 2213
integer y = 104
integer width = 357
integer height = 80
integer taborder = 90
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_3 from editmask within w_mpsaleyspcon_m
event keydown pbm_dwnkey
integer x = 325
integer y = 228
integer width = 480
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
boolean autoskip = true
end type

event keydown;IF keydown(KeyEnter! ) THEN
	IF keyflags = 0 THEN
		pb_cancel.postevent(clicked!)
	END IF

END IF



end event

type st_3 from statictext within w_mpsaleyspcon_m
integer x = 46
integer y = 228
integer width = 274
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "수주번호"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_8 from statictext within w_mpsaleyspcon_m
integer x = 46
integer y = 348
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

type ddlb_col from dropdownlistbox within w_mpsaleyspcon_m
integer x = 229
integer y = 328
integer width = 329
integer height = 532
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"수주번호","납기일자","거래처명","현장명"}
end type

type st_9 from statictext within w_mpsaleyspcon_m
integer x = 571
integer y = 348
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_mpsaleyspcon_m
integer x = 754
integer y = 328
integer width = 279
integer height = 512
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpsaleyspcon_m
integer x = 1047
integer y = 332
integer width = 347
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_mpsaleyspcon_m
integer x = 1399
integer y = 308
integer width = 142
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "수주번호"
			ls_col = "order_no "
		case "납기일자"
			ls_col = "due_date "
		case "거래처명"
			ls_col = "cust_name "
		case "현장명"
			ls_col = "scene_desc "
	end choose		
	
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "due_date " then
			ls_column = ls_col + trim(ddlb_2.text) + " #"  + trim(sle_value.text) + "# "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '"  + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)
dw_1.triggerevent(rowfocuschanged!)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_mpsaleyspcon_m
integer x = 1541
integer y = 308
integer width = 142
integer height = 64
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
ddlb_2.text     = "LIKE"
ddlb_col.text   = "거래처명"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

end event

type cb_7 from commandbutton within w_mpsaleyspcon_m
integer x = 1399
integer y = 372
integer width = 142
integer height = 64
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
String ls_col
choose case trim(ddlb_col.text)
	case "수주번호"
		ls_col = "order_no "
	case "납기일자"
		ls_col = "due_date "
	case "거래처명"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_4 from commandbutton within w_mpsaleyspcon_m
integer x = 1541
integer y = 372
integer width = 142
integer height = 64
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
String ls_col
choose case trim(ddlb_col.text)
	case "수주번호"
		ls_col = "order_no "
	case "납기일자"
		ls_col = "due_date "
	case "거래처명"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

type cb_13 from commandbutton within w_mpsaleyspcon_m
integer x = 3067
integer y = 44
integer width = 475
integer height = 92
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력검색"
end type

event clicked;long ll_row

ll_row = dw_3.getrow()
if ll_row < 1 then return

gs_where lst_where

int ls_a
ls_a = dw_3.GetClickedColumn()

lst_where.str1 = trim(dw_3.object.item_no[ll_row])
lst_where.str2 = trim(dw_3.object.qa[ll_row])
lst_where.str3 = trim("WS00000000")
lst_where.name = trim(dw_3.object.item_item_name[ll_row])

openwithparm(w_whinaudit_w, lst_where)
w_whinaudit_w.WindowState = Normal!
lst_where = message.powerobjectparm

end event

