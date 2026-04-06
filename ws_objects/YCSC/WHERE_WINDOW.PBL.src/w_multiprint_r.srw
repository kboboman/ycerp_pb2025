$PBExportHeader$w_multiprint_r.srw
$PBExportComments$바코드프린트(넓은거,짧은거,입고확인서)(2004/04월어느날, 정갑용)
forward
global type w_multiprint_r from window
end type
type st_12 from statictext within w_multiprint_r
end type
type st_11 from statictext within w_multiprint_r
end type
type st_prt4 from statictext within w_multiprint_r
end type
type st_prt3 from statictext within w_multiprint_r
end type
type st_prt2 from statictext within w_multiprint_r
end type
type st_prt1 from statictext within w_multiprint_r
end type
type st_6 from statictext within w_multiprint_r
end type
type st_5 from statictext within w_multiprint_r
end type
type st_4 from statictext within w_multiprint_r
end type
type st_3 from statictext within w_multiprint_r
end type
type cbx_4 from checkbox within w_multiprint_r
end type
type dw_4 from datawindow within w_multiprint_r
end type
type rb_2 from radiobutton within w_multiprint_r
end type
type rb_1 from radiobutton within w_multiprint_r
end type
type st_2 from statictext within w_multiprint_r
end type
type em_1 from editmask within w_multiprint_r
end type
type dw_3 from datawindow within w_multiprint_r
end type
type dw_2 from datawindow within w_multiprint_r
end type
type dw_1 from datawindow within w_multiprint_r
end type
type cb_2 from commandbutton within w_multiprint_r
end type
type cb_1 from commandbutton within w_multiprint_r
end type
type cbx_3 from checkbox within w_multiprint_r
end type
type cbx_2 from checkbox within w_multiprint_r
end type
type cbx_1 from checkbox within w_multiprint_r
end type
type st_1 from statictext within w_multiprint_r
end type
type gb_1 from groupbox within w_multiprint_r
end type
type gb_2 from groupbox within w_multiprint_r
end type
end forward

global type w_multiprint_r from window
integer width = 2112
integer height = 1312
boolean titlebar = true
string title = "출력물 선택(w_multiprint_r)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_12 st_12
st_11 st_11
st_prt4 st_prt4
st_prt3 st_prt3
st_prt2 st_prt2
st_prt1 st_prt1
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
cbx_4 cbx_4
dw_4 dw_4
rb_2 rb_2
rb_1 rb_1
st_2 st_2
em_1 em_1
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_multiprint_r w_multiprint_r

type variables
gs_where ist_where
end variables

on w_multiprint_r.create
this.st_12=create st_12
this.st_11=create st_11
this.st_prt4=create st_prt4
this.st_prt3=create st_prt3
this.st_prt2=create st_prt2
this.st_prt1=create st_prt1
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.cbx_4=create cbx_4
this.dw_4=create dw_4
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_2=create st_2
this.em_1=create em_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_12,&
this.st_11,&
this.st_prt4,&
this.st_prt3,&
this.st_prt2,&
this.st_prt1,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.cbx_4,&
this.dw_4,&
this.rb_2,&
this.rb_1,&
this.st_2,&
this.em_1,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.st_1,&
this.gb_1,&
this.gb_2}
end on

on w_multiprint_r.destroy
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_prt4)
destroy(this.st_prt3)
destroy(this.st_prt2)
destroy(this.st_prt1)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cbx_4)
destroy(this.dw_4)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//dw_1.Visible = False
dw_2.Visible = False
dw_3.Visible = False
dw_4.Visible = False
em_1.visible = False
st_2.visible = False

ist_where = Message.powerobjectParm
//if integer(ist_where.str2) > 0 then em_1.visible = true; st_2.visible = true

// 자재입고 및 외주스리팅 입고 에서 str1:입고번호, str2:0(순번)
// 입고수정및삭제 에서 str3:갯수(미사용), str4:폭

// 알루미늄이 아니고 GI 코일일때는 스리팅 계획의 수량을 찍어 달라?


String ls_bar_ttpw, ls_bar_ttps, ls_rcpt_prt

SELECT bar_ttpw, bar_ttps, rcpt_prt INTO :ls_bar_ttpw, :ls_bar_ttps, :ls_rcpt_prt FROM globals;

st_prt1.text = ls_bar_ttpw
st_prt2.text = ls_bar_ttps
st_prt3.text = ls_bar_ttpw
st_prt4.text = ls_rcpt_prt
end event

type st_12 from statictext within w_multiprint_r
integer x = 50
integer y = 1112
integer width = 2030
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "  낱장용 : 세로보기, 100mm X 50mm, 우마진(2.00)"
boolean focusrectangle = false
end type

type st_11 from statictext within w_multiprint_r
integer x = 50
integer y = 1028
integer width = 2030
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "겉포장용 : 가로보기, 100mm X 130mm"
boolean focusrectangle = false
end type

type st_prt4 from statictext within w_multiprint_r
integer x = 914
integer y = 868
integer width = 1147
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_prt3 from statictext within w_multiprint_r
integer x = 914
integer y = 772
integer width = 1147
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_prt2 from statictext within w_multiprint_r
integer x = 914
integer y = 676
integer width = 1147
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_prt1 from statictext within w_multiprint_r
integer x = 914
integer y = 584
integer width = 1147
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_6 from statictext within w_multiprint_r
integer x = 59
integer y = 868
integer width = 846
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "입고 명세서 프린트 : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_multiprint_r
integer x = 59
integer y = 772
integer width = 846
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "상품 프린트 : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_multiprint_r
integer x = 59
integer y = 676
integer width = 846
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "낱장용 프린트 : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_multiprint_r
integer x = 59
integer y = 584
integer width = 846
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "겉포장용 프린트 : "
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_4 from checkbox within w_multiprint_r
integer x = 709
integer y = 248
integer width = 663
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "상품 Label 출력"
boolean checked = true
end type

type dw_4 from datawindow within w_multiprint_r
integer x = 1815
integer y = 4
integer width = 174
integer height = 132
integer taborder = 70
string title = "none"
string dataobject = "d_label_detail"
boolean livescroll = true
end type

type rb_2 from radiobutton within w_multiprint_r
integer x = 1678
integer y = 248
integer width = 320
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일 외"
end type

type rb_1 from radiobutton within w_multiprint_r
integer x = 1426
integer y = 248
integer width = 242
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일"
boolean checked = true
end type

type st_2 from statictext within w_multiprint_r
integer x = 777
integer y = 388
integer width = 123
integer height = 104
integer textsize = -20
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "장"
boolean focusrectangle = false
end type

type em_1 from editmask within w_multiprint_r
integer x = 521
integer y = 388
integer width = 238
integer height = 108
integer taborder = 50
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string minmax = "1~~9"
end type

type dw_3 from datawindow within w_multiprint_r
integer x = 1609
integer y = 8
integer width = 174
integer height = 132
integer taborder = 60
string title = "입고명세서"
string dataobject = "d_ioinsliting_r"
boolean livescroll = true
end type

type dw_2 from datawindow within w_multiprint_r
integer x = 1408
integer y = 12
integer width = 174
integer height = 132
integer taborder = 40
string title = "코일에 사용할 라벨"
string dataobject = "d_label_3"
boolean livescroll = true
end type

type dw_1 from datawindow within w_multiprint_r
integer x = 1230
integer y = 12
integer width = 174
integer height = 132
integer taborder = 10
boolean titlebar = true
string title = "코일 포장용 라벨"
string dataobject = "d_label_1"
boolean resizable = true
boolean livescroll = true
end type

type cb_2 from commandbutton within w_multiprint_r
integer x = 1641
integer y = 388
integer width = 384
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취 소"
boolean cancel = true
end type

event clicked;//close(parent)
String ls_chk

//ls_chk = cbx_4.Check()
IF cbx_4.checked = true THEN
	ls_chk = '1'
Else
	ls_chk = '2'
end if
CloseWithReturn(Parent, ls_chk)
end event

type cb_1 from commandbutton within w_multiprint_r
integer x = 1207
integer y = 388
integer width = 384
integer height = 112
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출 력"
boolean default = true
end type

event clicked;
string  ls_insp_no //입고번호 받아서 retrieve 하고 프린트함.
string  ls_bar_ttpw, ls_bar_ttps, ls_rcpt_prt, ls_item
integer li_cnt, li_copyprt, li_row, li_start, li_end
dec{1}  ld_wid

ls_insp_no = ist_where.str1

//if gf_permission('w_barcode_coilmst_r', gs_userid ) = 'Y' then
//	select bar_ttps, bar_ttpw, rcpt_prt into :ls_bar_ttpw, :ls_bar_ttps, :ls_rcpt_prt from globals;
//else
//	select bar_ttps2, bar_ttpw2, rcpt_prt into :ls_bar_ttpw, :ls_bar_ttps, :ls_rcpt_prt from globals;
//end if
SELECT bar_ttpw, bar_ttps, rcpt_prt INTO :ls_bar_ttpw, :ls_bar_ttps, :ls_rcpt_prt FROM globals;

st_prt1.text = ls_bar_ttpw
st_prt2.text = ls_bar_ttps
st_prt3.text = ls_bar_ttpw
st_prt4.text = ls_rcpt_prt

//출력 테스트용 6층 프린터//////////////////////////////
//ls_bar_ttpw = 'HP LaserJet 4V'
//ls_bar_ttps = 'HP LaserJet 4V'

if GE_Environment.OSType = windows! then
	ls_bar_ttps =  MidA(ls_bar_ttps, 10)
end if

if cbx_1.checked = true then		// 코일 겉포장용
	dw_1.dataobject = 'd_label_1'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(ls_insp_no)
	dw_1.Object.DataWindow.Printer = ls_bar_ttpw
	dw_1.print()
end if

// 코일갯수만큼 출력으로 변경
if cbx_2.checked = true then		// 코일 낱장용
	SELECT count(*) into :li_cnt FROM inspdet
	 where inspdet.insp_no = :ls_insp_no ;
	 li_start = 1
	 li_end = li_cnt

	for li_row = li_start to li_end
		dw_4.SetTransObject(SQLCA)
		dw_4.Retrieve(ls_insp_no, li_row)

		ls_item = dw_4.Object.item_no[1] 
		ld_wid = dw_4.Object.item_qa[1]
				
		if MidA(ls_item, 2, 1) = '1' then		// 원코일
			dw_2.dataobject = 'd_label_4'
		elseif MidA(ls_item, 2, 1)  = '2' THEN
		else
			if ld_wid > 50.0 then	// 낱장 큰것
				dw_2.dataobject = 'd_label_2'
			else				// 낱장 작은것
				dw_2.dataobject = 'd_label_3'
			end if
		end if
		
		dw_2.settransobject(sqlca)
		if dw_2.retrieve(ls_insp_no, li_row) > 0 then
//			if mid(ls_item, 2, 1) = '1' then
//				dw_2.Object.DataWindow.Printer = trim(ls_bar_ttpw)
//			else
				dw_2.Object.DataWindow.Printer = ls_bar_ttps
//			end if
			dw_2.Object.DataWindow.Print.Copies = li_copyprt
			dw_2.print()
		end if
	next
end if

if cbx_3.checked = true then		// 입고 명세서		
	if rb_1.checked = true then 		// 코일용
		dw_3.dataobject = 'd_ioinsliting_r'
	else										// 코일 외
		dw_3.dataobject = 'd_ioinsliting_r2'
	end if
	dw_3.settransobject(sqlca)
	dw_3.retrieve(ls_insp_no)

	dw_3.Object.DataWindow.Printer = ls_rcpt_prt
	dw_3.print()
end if

cb_2.TriggerEvent(Clicked!)
end event

type cbx_3 from checkbox within w_multiprint_r
integer x = 1445
integer y = 164
integer width = 498
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "입고 명세서"
boolean checked = true
end type

event clicked;if cbx_3.checked = true then
	rb_1.visible = true
	rb_2.visible = true
else
	rb_1.visible = false
	rb_2.visible = false
end if
end event

type cbx_2 from checkbox within w_multiprint_r
integer x = 709
integer y = 164
integer width = 663
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일 낱장용"
boolean checked = true
end type

type cbx_1 from checkbox within w_multiprint_r
integer x = 55
integer y = 164
integer width = 613
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일 겉포장용"
end type

type st_1 from statictext within w_multiprint_r
integer x = 18
integer y = 28
integer width = 1042
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력할 항목을 선택하세요."
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_multiprint_r
integer x = 1394
integer y = 124
integer width = 635
integer height = 228
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_multiprint_r
integer x = 9
integer y = 92
integer width = 2057
integer height = 444
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

