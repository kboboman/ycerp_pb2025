$PBExportHeader$w_osteamaroi_r.srw
$PBExportComments$팀별매출 실적현황(2005/05/24, 이인호)
forward 
global type w_osteamaroi_r from w_inheritance
end type
type em_1 from editmask within w_osteamaroi_r
end type
type st_1 from statictext within w_osteamaroi_r
end type
type st_2 from statictext within w_osteamaroi_r
end type
type dw_3 from datawindow within w_osteamaroi_r
end type
type dw_4 from datawindow within w_osteamaroi_r
end type
type dw_5 from datawindow within w_osteamaroi_r
end type
type rb_1 from radiobutton within w_osteamaroi_r
end type
type rb_2 from radiobutton within w_osteamaroi_r
end type
type rb_3 from radiobutton within w_osteamaroi_r
end type
type rb_4 from radiobutton within w_osteamaroi_r
end type
type cbx_1 from checkbox within w_osteamaroi_r
end type
type pb_1 from picturebutton within w_osteamaroi_r
end type
type gb_4 from groupbox within w_osteamaroi_r
end type
type gb_5 from groupbox within w_osteamaroi_r
end type
end forward

global type w_osteamaroi_r from w_inheritance
integer x = 23
integer y = 112
integer width = 5522
integer height = 2880
string title = "월매출 실적집계 현황(w_osteamaroi_r)"
string icon = "Hand!"
em_1 em_1
st_1 st_1
st_2 st_2
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
cbx_1 cbx_1
pb_1 pb_1
gb_4 gb_4
gb_5 gb_5
end type
global w_osteamaroi_r w_osteamaroi_r

type variables
integer ii_month
end variables

on w_osteamaroi_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.cbx_1=create cbx_1
this.pb_1=create pb_1
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.rb_4
this.Control[iCurrent+11]=this.cbx_1
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.gb_4
this.Control[iCurrent+14]=this.gb_5
end on

on w_osteamaroi_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.cbx_1)
destroy(this.pb_1)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

DW_2.visible = false
DW_3.visible = false
DW_4.visible = false
DW_5.visible = false

em_1.text = string(today(),'yyyy/mm/dd')
DW_1.sharedata(DW_2)
DW_3.SetTransObject(SQLCA)
DW_4.settransobject(sqlca)
DW_5.settransobject(sqlca)

//cbx_1.PostEvent(Clicked!)
//cbx_1.TriggerEvent(Clicked!)
cbx_1.checked = false
cbx_1.text = "통합출력"
rb_3.checked = false	// 영업+채권
rb_4.checked = false	// 동부지점

rb_3.enabled = false	// 영업+채권
rb_4.enabled = false	// 동부지점



end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 46
gb_2.height = newheight - 280

dw_1.width  = newwidth  - 87
dw_1.height = newheight - 420

end event

type pb_save from w_inheritance`pb_save within w_osteamaroi_r
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osteamaroi_r
integer x = 41
integer y = 340
integer width = 5399
integer height = 2356
integer taborder = 140
string title = "d_osteamaroi_t2"
string dataobject = "d_osteamaroi_t2"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::resize;call super::resize;gb_2.width = dw_1.width + 35
gb_2.height = dw_1.height + 120

end event

type st_title from w_inheritance`st_title within w_osteamaroi_r
integer width = 1618
string text = "월매출 실적집계 현황 (월간)"
end type

type st_tips from w_inheritance`st_tips within w_osteamaroi_r
end type

type pb_compute from w_inheritance`pb_compute within w_osteamaroi_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_osteamaroi_r
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osteamaroi_r
integer x = 4178
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osteamaroi_r
integer x = 3986
integer taborder = 40
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
 
if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 월매출 실적집계 현황(월간)을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
//if rb_4.checked = true then	// 개별출력
//	gs_print_control = gs_print_control + ' DataWindow.Header.1.NewPage=1'
//end if

OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_osteamaroi_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_osteamaroi_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_osteamaroi_r
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osteamaroi_r
event ue_1 pbm_custom01
integer x = 3598
integer taborder = 20
boolean default = true
end type

event pb_retrieve::ue_1;string  ls_month, ls_user_id
decimal lr_ym, lr_ys, lr_mm, lr_ms, lr_bm, lr_yb, lr_yy, lr_cur_minv, lr_last_day
long    ll_row, ll_m, ll_s, ll_column
long    ll_dw1cnt, ll_foundrow1
	
if dw_1.rowcount() < 1 or dw_3.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
setpointer(hourglass!)

debugbreak()
ll_dw1cnt = DW_1.RowCount()
ls_month  = RightA('0' + String(ii_month), 2)
ll_m = ii_month + 2
ll_s = ii_month + 14

//       1             2       3       4       5       6       7       8       9      10      11      12      13      14
//SALESMAN, BALBF_AMOUNT, INV_01, INV_02, INV_03, INV_04, INV_05, INV_06, INV_07, INV_08, INV_09, INV_10, INV_11, INV_12, 
//
//     15       16       17       18       19       20       21       22       23       24       25       26
//COLL_01, COLL_02, COLL_03, COLL_04, COLL_05, COLL_06, COLL_07, COLL_08, COLL_09, COLL_10, COLL_11, COLL_12 
//
// 당년도 매출, 수금
for ll_row = 1 to dw_3.rowcount()
	//금월매출액, 연간매출액
	lr_yy = dw_3.object.data[ll_row, 2]                     // 전년잔액
	for ll_column = 3 to ll_m 
		lr_ym = lr_ym + dw_3.object.data[ll_row, ll_column]  // 매출누계
		if ll_column = ll_m then
			lr_mm = dw_3.object.data[ll_row, ll_column]       // 당월매출
		end if
	next
	
	//금월수금액, 연간수금액
	for ll_column = 15 to ll_s 
		lr_ys = lr_ys + dw_3.object.data[ll_row, ll_column]  // 수금누계
		if ll_column = ll_s then
			lr_ms = dw_3.object.data[ll_row, ll_column]       // 당월수금
		end if
	next
	
   // 전월잔액 = ( 전년잔액 + 매출누계 - 당월매출 ) - ( 수금누계 - 당월수금 )
 
	lr_bm = (lr_ym + lr_yy  - lr_mm) - (lr_ys - lr_ms)     // 전월잔액
	
	ls_user_id = Trim(dw_3.object.salesman[ll_row])
	if ls_user_id = "USE_NO" then ls_user_id = "killby" 

	ll_foundrow1 = dw_1.Find("user_id2 = '" + ls_user_id + "'", 1, ll_dw1cnt) 
	dw_1.setitem(ll_foundrow1, "bm_jan", truncate(lr_bm * 0.001 + 0.0000001, 0))                   // 전월잔액
	dw_1.setitem(ll_foundrow1, "m_jan",  truncate((lr_mm - lr_ms + lr_bm) * 0.001 + 0.0000001, 0)) // 월말잔액
	dw_2.setitem(ll_foundrow1, "bm_jan", truncate(lr_bm * 0.001 + 0.0000001, 0))                   // 전월잔액
	dw_2.setitem(ll_foundrow1, "m_jan",  truncate((lr_mm - lr_ms + lr_bm) * 0.001 + 0.0000001, 0)) // 월말잔액		

	lr_yy = 0	
	lr_mm = 0
	lr_ms = 0
	lr_ym = 0
	lr_ys = 0
	lr_bm = 0
next

// 전년도 매출, 수금
for ll_row = 1 to dw_4.rowcount()
	long ll_test
	for ll_column = 3 to ll_m
		lr_mm = (dw_4.object.data[ll_row, ll_m]/1.1) / 1000 // 금월매출(부가세 제외)
	next
	
	ls_user_id = Trim(dw_4.object.salesman[ll_row])
	if ls_user_id = "USE_NO" then ls_user_id = "killby" 
	
	ll_foundrow1 = dw_1.Find("user_id2 = '" + ls_user_id + "'", 1, ll_dw1cnt) 
	dw_1.setitem(ll_foundrow1, "bsale_amt", lr_mm)  // 전년동월매출
	dw_2.setitem(ll_foundrow1, "bsale_amt", lr_mm)  // 전년동월매출
		
	lr_yy = 0	
	lr_mm = 0
	lr_ms = 0
	lr_ym = 0
	lr_ys = 0
	lr_bm = 0
next

// 전월, 당월미수금 처리후 당월,일 매출 보여줌
// 당월,일 매출 
for ll_row = 1 to dw_5.rowcount()
	// 당월 1일 부터 조회일까지 전체매출액, 조회일 매출
	lr_cur_minv = dw_5.object.cur_minv[ll_row]    //전체 매출액
	lr_last_day = dw_5.object.last_day[ll_row]      //일 매출액	
	ls_user_id  = Trim(dw_5.object.salesman[ll_row])
	if ls_user_id = "USE_NO" then ls_user_id = "killby" 

	ll_foundrow1 = dw_1.Find("user_id2 = '" + ls_user_id + "'", 1, ll_dw1cnt) 
	if ll_foundrow1 > 0 then
		dw_1.setitem(ll_foundrow1, "cur_minv", lr_cur_minv)	// 당월매출
		dw_1.setitem(ll_foundrow1, "last_day", lr_last_day)	// 당일매출		
	end if

	lr_cur_minv = 0	
	lr_last_day = 0
next


end event

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_sdate
long   ll_year, ll_month, ll_year2
st_security lst_security

dw_1.ReSet()
dw_2.ReSet()
dw_3.ReSet()
dw_4.ReSet()
dw_5.ReSet()

if em_1.text = '' then
	messagebox("확인","해당월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_date = em_1.text
ls_sdate = LeftA(em_1.text, 8) + "01"

ll_year  = long(LeftA(ls_date, 4))
ll_month = integer(MidA(ls_date, 6, 2))
ii_month = ll_month
ll_year2 = ll_year - 1 //(전년도 월매출 실적 집계 사항을 가져오기 위함)

string ls_level_userid
choose Case gs_level
	case 'A', 'B'
		ls_level_userid = '%'		
	case 'C'
		ls_level_userid = gs_userid
end choose

string ls_use_flag
if rb_1.checked = true then
	ls_use_flag = '%'
elseif rb_2.checked = true then
	ls_use_flag = 'Y'
end if

dw_1.setredraw(false)
dw_3.retrieve( ll_year  )   // 당년도 매출 자료
dw_4.retrieve( ll_year2 )   // 전년도 매출 자료
dw_5.retrieve( ls_sdate, ls_date )  // 당월 월매출, 일매출 자료


if cbx_1.checked = true then	// 개별출력
	if rb_3.checked = true then	// 영업+채권
		dw_1.retrieve(ll_year,ll_month, ls_level_userid, ls_use_flag, "1")
	else
		dw_1.retrieve(ll_year,ll_month, ls_level_userid, ls_use_flag, "2")
	end if
else
	dw_1.retrieve(ll_year,ll_month, ls_level_userid, ls_use_flag, "%")	
end if

this.postevent("ue_1")
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_osteamaroi_r
integer x = 2693
integer y = 12
integer width = 809
integer height = 204
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osteamaroi_r
integer x = 23
integer y = 224
integer width = 5440
integer height = 2496
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_osteamaroi_r
integer x = 3566
integer width = 837
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osteamaroi_r
integer x = 489
integer y = 20
integer width = 142
integer height = 104
integer taborder = 80
string dataobject = "d_osteamaroi_r2"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_osteamaroi_r
integer x = 3058
integer y = 88
integer width = 411
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
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
string displaydata = "T"
end type

event rbuttondown;
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_osteamaroi_r
integer x = 2747
integer y = 104
integer width = 302
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "조회일자:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_osteamaroi_r
integer x = 1979
integer y = 280
integer width = 1614
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
string text = "(매출: V.A.T별도, 수금: V.A.T포함, 단위: 천원)"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_osteamaroi_r
integer x = 640
integer y = 20
integer width = 142
integer height = 104
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_osmtotal_h2"
boolean livescroll = true
end type

type dw_4 from datawindow within w_osteamaroi_r
integer x = 795
integer y = 20
integer width = 142
integer height = 104
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_osmtotal_h3"
boolean livescroll = true
end type

type dw_5 from datawindow within w_osteamaroi_r
integer x = 955
integer y = 20
integer width = 142
integer height = 104
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_osmtotal_h3_month"
boolean livescroll = true
end type

type rb_1 from radiobutton within w_osteamaroi_r
integer x = 2272
integer y = 72
integer width = 334
integer height = 60
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
end type

type rb_2 from radiobutton within w_osteamaroi_r
integer x = 2272
integer y = 140
integer width = 334
integer height = 60
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
boolean checked = true
end type

type rb_3 from radiobutton within w_osteamaroi_r
integer x = 1751
integer y = 72
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "영업+채권"
boolean checked = true
end type

event clicked;dw_1.reset()
dw_2.reset()

end event

type rb_4 from radiobutton within w_osteamaroi_r
integer x = 1751
integer y = 140
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "동부지점"
end type

event clicked;dw_1.reset()
dw_2.reset()

end event

type cbx_1 from checkbox within w_osteamaroi_r
integer x = 1737
integer y = 12
integer width = 393
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "개별출력"
boolean checked = true
end type

event clicked;if cbx_1.checked = true then
	cbx_1.text = "개별출력"
	rb_3.checked = true	// 영업+채권
	rb_4.checked = false	// 동부지점
	
	rb_3.enabled = true	// 영업+채권
	rb_4.enabled = true	// 동부지점
else
	cbx_1.text = "통합출력"
	rb_3.checked = false	// 영업+채권
	rb_4.checked = false	// 동부지점
	
	rb_3.enabled = false	// 영업+채권
	rb_4.enabled = false	// 동부지점
end if

dw_1.reset()
dw_2.reset()

end event

type pb_1 from picturebutton within w_osteamaroi_r
integer x = 3790
integer y = 52
integer width = 187
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	
	MessageBox("확인", "작업완료")
end if
end event

type gb_4 from groupbox within w_osteamaroi_r
integer x = 2226
integer y = 12
integer width = 434
integer height = 204
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "영업담당"
borderstyle borderstyle = stylebox!
end type

type gb_5 from groupbox within w_osteamaroi_r
integer x = 1701
integer y = 12
integer width = 498
integer height = 204
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력방식"
borderstyle borderstyle = stylebox!
end type

