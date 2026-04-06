$PBExportHeader$w_barcode_coilmst_r.srw
$PBExportComments$바코드출력(2004/04/29, 이인호)
forward
global type w_barcode_coilmst_r from window
end type
type cbx_6 from checkbox within w_barcode_coilmst_r
end type
type st_4 from statictext within w_barcode_coilmst_r
end type
type st_2 from statictext within w_barcode_coilmst_r
end type
type st_1 from statictext within w_barcode_coilmst_r
end type
type rb_4 from radiobutton within w_barcode_coilmst_r
end type
type rb_3 from radiobutton within w_barcode_coilmst_r
end type
type ddlb_1 from dropdownlistbox within w_barcode_coilmst_r
end type
type pb_prt from picturebutton within w_barcode_coilmst_r
end type
type pb_exit from picturebutton within w_barcode_coilmst_r
end type
type pb_ret from picturebutton within w_barcode_coilmst_r
end type
type cb_3 from commandbutton within w_barcode_coilmst_r
end type
type sle_1 from singlelineedit within w_barcode_coilmst_r
end type
type cbx_5 from checkbox within w_barcode_coilmst_r
end type
type cbx_4 from checkbox within w_barcode_coilmst_r
end type
type cbx_3 from checkbox within w_barcode_coilmst_r
end type
type cbx_2 from checkbox within w_barcode_coilmst_r
end type
type cbx_1 from checkbox within w_barcode_coilmst_r
end type
type rb_2 from radiobutton within w_barcode_coilmst_r
end type
type rb_1 from radiobutton within w_barcode_coilmst_r
end type
type dw_3 from datawindow within w_barcode_coilmst_r
end type
type dw_2 from datawindow within w_barcode_coilmst_r
end type
type st_3 from statictext within w_barcode_coilmst_r
end type
type dw_1 from datawindow within w_barcode_coilmst_r
end type
type gb_1 from groupbox within w_barcode_coilmst_r
end type
type gb_2 from groupbox within w_barcode_coilmst_r
end type
type gb_3 from groupbox within w_barcode_coilmst_r
end type
end forward

global type w_barcode_coilmst_r from window
integer width = 3269
integer height = 2556
boolean titlebar = true
string title = "코일 바코드 출력(w_barcode_coilmst_r)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_6 cbx_6
st_4 st_4
st_2 st_2
st_1 st_1
rb_4 rb_4
rb_3 rb_3
ddlb_1 ddlb_1
pb_prt pb_prt
pb_exit pb_exit
pb_ret pb_ret
cb_3 cb_3
sle_1 sle_1
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
rb_2 rb_2
rb_1 rb_1
dw_3 dw_3
dw_2 dw_2
st_3 st_3
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_barcode_coilmst_r w_barcode_coilmst_r

type variables
String  is_prts, is_prtw

end variables

on w_barcode_coilmst_r.create
this.cbx_6=create cbx_6
this.st_4=create st_4
this.st_2=create st_2
this.st_1=create st_1
this.rb_4=create rb_4
this.rb_3=create rb_3
this.ddlb_1=create ddlb_1
this.pb_prt=create pb_prt
this.pb_exit=create pb_exit
this.pb_ret=create pb_ret
this.cb_3=create cb_3
this.sle_1=create sle_1
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.st_3=create st_3
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cbx_6,&
this.st_4,&
this.st_2,&
this.st_1,&
this.rb_4,&
this.rb_3,&
this.ddlb_1,&
this.pb_prt,&
this.pb_exit,&
this.pb_ret,&
this.cb_3,&
this.sle_1,&
this.cbx_5,&
this.cbx_4,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.rb_2,&
this.rb_1,&
this.dw_3,&
this.dw_2,&
this.st_3,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_barcode_coilmst_r.destroy
destroy(this.cbx_6)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.ddlb_1)
destroy(this.pb_prt)
destroy(this.pb_exit)
destroy(this.pb_ret)
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.st_3)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

String  ls_order_no
Integer li_order_seq

if GF_Permission("코일바코드_출력", gs_userid ) = 'Y' then
	SELECT bar_ttps,  bar_ttpw2 INTO :is_prts, :is_prtw FROM globals;
else
	SELECT bar_ttps2, bar_ttpw  INTO :is_prts, :is_prtw FROM globals;
end if

if rb_3.checked = true then
	st_4.text = is_prts
else
	st_4.text = is_prtw
end if

dw_1.SetTransObject(sqlca)
dw_2.SetTransObject(sqlca)
dw_3.SetTransObject(sqlca)

dw_2.Visible = false
dw_3.InsertRow(0)

end event

type cbx_6 from checkbox within w_barcode_coilmst_r
integer x = 55
integer y = 472
integer width = 489
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "프린터 선택"
end type

type st_4 from statictext within w_barcode_coilmst_r
integer x = 896
integer y = 476
integer width = 2295
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_2 from statictext within w_barcode_coilmst_r
integer x = 549
integer y = 476
integer width = 329
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "프린트명:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_barcode_coilmst_r
integer x = 827
integer y = 364
integer width = 293
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "로트번호:"
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_barcode_coilmst_r
integer x = 2089
integer y = 96
integer width = 398
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "겉포장용"
end type

event clicked;//겉포장용
st_4.text = is_prtw

end event

type rb_3 from radiobutton within w_barcode_coilmst_r
integer x = 1678
integer y = 96
integer width = 306
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "낱장용"
boolean checked = true
end type

event clicked;//낱장용
st_4.text = is_prts

end event

type ddlb_1 from dropdownlistbox within w_barcode_coilmst_r
integer x = 2071
integer y = 344
integer width = 1102
integer height = 576
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"폭+품목+규격+단중+코일번호+저장소","코일번호+저장소","저장소+코일번호","품목+규격+단중+코일번호+저장소"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index
	case 1
		dw_1.setsort('mid(item_no,3,1), item_no, qa, unit_qty, coil_no, loc_no')
	case 2
		dw_1.setsort('coil_no, loc_no')
	case 3
		dw_1.setsort('loc_no, coil_no')
	case 4
		dw_1.setsort('item_no, qa, unit_qty, coil_no, loc_no')
end choose
dw_1.sort()


end event

type pb_prt from picturebutton within w_barcode_coilmst_r
integer x = 2779
integer y = 52
integer width = 187
integer height = 144
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = left!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

Int    li_cnt, li_cnt2, li_rc
Long   ll_row
String ls_coil, ls_loc, ls_item, ls_printer	//, is_prts, is_prtw
Dec    ld_wid

dw_1.AcceptText()

if GF_Permission("코일바코드_출력", gs_userid ) = 'Y' then
	SELECT bar_ttps,  bar_ttpw2 INTO :is_prts, :is_prtw FROM globals;
else
	SELECT bar_ttps2, bar_ttpw  INTO :is_prts, :is_prtw FROM globals;
end if

// 프린터 선택
if cbx_6.checked = true then
	PrintSetup()
	ls_printer = dw_1.Object.DataWindow.Printer
	is_prts    = ls_printer
	is_prtw    = ls_printer
else
	if rb_3.checked = true then
		ls_printer = is_prts	// 낱장용
	else
		ls_printer = is_prtw	// 겉포장용
	end if
end if

if MessageBox("확인", ls_printer + "~r~n" + " 로 " + string(dw_1.RowCount(),"#,##0") + &
              " 레코드를 출력합니까?", Exclamation!, OKCancel!, 2) = 2 then
	RETURN
end if

for ll_row = 1 to dw_1.RowCount()
	ls_loc  = dw_1.object.loc_no[ll_row]
	ls_coil = dw_1.object.coil_no[ll_row]
	li_cnt  = dw_1.object.cnt[ll_row]
	if isnull(li_cnt) or li_cnt < 1 then continue
	
	dw_1.ScrollToRow(ll_row)
	ld_wid  = dw_1.object.swid[ll_row]
	ls_item = dw_1.object.item_no[ll_row]
	
	if rb_3.checked = true then		// 낱장용
		if MidA(ls_item, 2, 1) = '1' then
			// 원코일
			dw_2.dataobject = 'd_barcode_coilmst_r4'    //원코일용 바코드
		else
			if ld_wid < 50.0 then
				dw_2.dataobject = 'd_barcode_coilmst_r2' //스리팅용5cm이하 바코드
			else
				dw_2.dataobject = 'd_barcode_coilmst_r'  //스리팅용5cm이상 바코드
			end if
		end if
		
		dw_2.SettransObject(sqlca)
		li_cnt2 = dw_2.Retrieve(ls_coil, ls_loc)

		st_4.text = is_prts
		dw_2.Object.DataWindow.Printer = is_prts
	else										// 겉포장용
		dw_2.dataobject = 'd_barcode_coilmst_r1'  	//겉포장용 바코드
		dw_2.SettransObject(sqlca)
		li_cnt2 = dw_2.Retrieve(ls_coil, ls_loc, li_cnt)

 		st_4.text = is_prtw
		dw_2.Object.DataWindow.Printer = is_prtw

		li_cnt = 1
	end if
	if li_cnt2 < 1 then continue
	
	dw_2.Object.DataWindow.Print.Copies = li_cnt
	dw_2.Print()
next

if rb_3.checked = true then
	if rb_1.checked = true then
		MessageBox("바코드", rb_3.text + "으로 " + rb_1.text + " 출력완료.")
	else
		MessageBox("바코드", rb_3.text + "으로 " + rb_2.text + " 출력완료.")
	end if
else
	if rb_1.checked = true then
		MessageBox("바코드", rb_4.text + "으로 " + rb_1.text + " 출력완료.")
	else
		MessageBox("바코드", rb_4.text + "으로 " + rb_2.text + " 출력완료.")
	end if
end if

end event

type pb_exit from picturebutton within w_barcode_coilmst_r
integer x = 2985
integer y = 52
integer width = 187
integer height = 144
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_ret from picturebutton within w_barcode_coilmst_r
integer x = 2583
integer y = 52
integer width = 187
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String ls_loc, ls_flag
String ls_oc[5]
Int    li_int

sle_1.text = ""

for li_int = 1 to 5
	setnull(ls_oc[li_int])
next

li_int = 1
if cbx_1.checked = true then
	ls_oc[li_int] = "O"
	li_int = li_int + 1
end if
if cbx_2.checked = true then
	ls_oc[li_int] =  "M"
	li_int = li_int + 1
end if
if cbx_3.checked = true then
	ls_oc[li_int] =  "P"
	li_int = li_int + 1
end if
if cbx_4.checked = true then
	ls_oc[li_int] =  "S"
	li_int = li_int + 1
end if
if cbx_5.checked = true then
	ls_oc[li_int] =  "C"
	li_int = li_int + 1
end if

// 저장소
ls_loc = dw_3.object.loc_no[1]
//if IsNull(ls_loc) = true then	ls_loc = "%"

if rb_1.checked = true then
	ls_flag = 'S'
else
	ls_flag = 'W'
end if

dw_1.Retrieve( ls_loc, ls_flag , ls_oc, '%')


end event

type cb_3 from commandbutton within w_barcode_coilmst_r
integer x = 1783
integer y = 340
integer width = 274
integer height = 92
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "찾기"
end type

event clicked;string ls_loc,   ls_flag
string ls_oc[5], ls_coil
int    li_int

if isnull(sle_1.text) or trim(sle_1.text) = '' then return
for li_int = 1 to 5
	setnull(ls_oc[li_int])
next

ls_oc[1] = "O"
ls_oc[2] = "M"
ls_oc[3] = "P"
ls_oc[4] = "S"
ls_oc[5] = "C"
ls_loc   = '%'
ls_flag  = '%'
ls_coil  = trim(sle_1.text) + '%'

if dw_1.Retrieve( ls_loc, ls_flag , ls_oc, ls_coil) < 1 then
	sle_1.SelectText(1,LenA(sle_1.Text))
	sle_1.setfocus()
	return
end if
cb_3.default = false

end event

type sle_1 from singlelineedit within w_barcode_coilmst_r
integer x = 1125
integer y = 340
integer width = 654
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event getfocus;cb_3.default = true
end event

type cbx_5 from checkbox within w_barcode_coilmst_r
integer x = 2427
integer y = 264
integer width = 229
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
string text = "완료"
end type

type cbx_4 from checkbox within w_barcode_coilmst_r
integer x = 2048
integer y = 264
integer width = 352
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
string text = "외주가공"
boolean checked = true
end type

type cbx_3 from checkbox within w_barcode_coilmst_r
integer x = 1664
integer y = 264
integer width = 352
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
string text = "작업지시"
boolean checked = true
end type

type cbx_2 from checkbox within w_barcode_coilmst_r
integer x = 1399
integer y = 264
integer width = 247
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
string text = "계획"
boolean checked = true
end type

type cbx_1 from checkbox within w_barcode_coilmst_r
integer x = 1134
integer y = 264
integer width = 247
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
string text = "재고"
boolean checked = true
end type

type rb_2 from radiobutton within w_barcode_coilmst_r
integer x = 503
integer y = 360
integer width = 279
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "원코일"
end type

type rb_1 from radiobutton within w_barcode_coilmst_r
integer x = 73
integer y = 360
integer width = 416
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "스리팅코일"
boolean checked = true
end type

type dw_3 from datawindow within w_barcode_coilmst_r
integer x = 78
integer y = 256
integer width = 864
integer height = 84
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type dw_2 from datawindow within w_barcode_coilmst_r
string tag = "d_barcode_coilmst_r1"
integer x = 1079
integer width = 128
integer height = 96
integer taborder = 50
boolean bringtotop = true
string title = "d_barcode_coilmst_r"
string dataobject = "d_barcode_coilmst_r"
boolean livescroll = true
end type

type st_3 from statictext within w_barcode_coilmst_r
integer x = 32
integer y = 36
integer width = 1408
integer height = 156
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "코일 바코드 출력"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_barcode_coilmst_r
integer x = 41
integer y = 568
integer width = 3168
integer height = 1864
integer taborder = 10
string title = "none"
string dataobject = "d_barcode_coilmst_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if row > 0 and row < this.rowcount() then
	this.ScrollToRow(row)
	sle_1.text = this.object.coil_no[row]
end if
end event

type gb_1 from groupbox within w_barcode_coilmst_r
integer x = 41
integer y = 216
integer width = 3168
integer height = 232
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 67108864
end type

type gb_2 from groupbox within w_barcode_coilmst_r
integer x = 2542
integer y = 12
integer width = 667
integer height = 200
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 67108864
end type

type gb_3 from groupbox within w_barcode_coilmst_r
integer x = 1618
integer y = 12
integer width = 905
integer height = 200
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 67108864
end type

