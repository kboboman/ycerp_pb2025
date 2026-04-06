$PBExportHeader$w_mpjaego_r20.srw
$PBExportComments$수주물픔에대한재고(1998/09/26,곽용덕)
forward
global type w_mpjaego_r20 from w_inheritance
end type
type cbx_1 from checkbox within w_mpjaego_r20
end type
type st_3 from statictext within w_mpjaego_r20
end type
type st_2 from statictext within w_mpjaego_r20
end type
type sle_2 from singlelineedit within w_mpjaego_r20
end type
type st_1 from statictext within w_mpjaego_r20
end type
type dw_5 from datawindow within w_mpjaego_r20
end type
type dw_4 from datawindow within w_mpjaego_r20
end type
type dw_7 from datawindow within w_mpjaego_r20
end type
type dw_8 from datawindow within w_mpjaego_r20
end type
type pb_1 from picturebutton within w_mpjaego_r20
end type
type dw_10 from datawindow within w_mpjaego_r20
end type
type dw_12 from datawindow within w_mpjaego_r20
end type
type dw_13 from datawindow within w_mpjaego_r20
end type
type dw_14 from datawindow within w_mpjaego_r20
end type
type dw_15 from datawindow within w_mpjaego_r20
end type
type cb_3 from commandbutton within w_mpjaego_r20
end type
type dw_17 from datawindow within w_mpjaego_r20
end type
type gb_5 from groupbox within w_mpjaego_r20
end type
type gb_6 from groupbox within w_mpjaego_r20
end type
type gb_8 from groupbox within w_mpjaego_r20
end type
type gb_7 from groupbox within w_mpjaego_r20
end type
type dw_16 from datawindow within w_mpjaego_r20
end type
type dw_3 from datawindow within w_mpjaego_r20
end type
type cbx_chk from checkbox within w_mpjaego_r20
end type
type st_13 from statictext within w_mpjaego_r20
end type
type st_14 from statictext within w_mpjaego_r20
end type
type ddlb_op from dropdownlistbox within w_mpjaego_r20
end type
type sle_value from singlelineedit within w_mpjaego_r20
end type
type cb_10 from commandbutton within w_mpjaego_r20
end type
type cb_14 from commandbutton within w_mpjaego_r20
end type
type cb_15 from commandbutton within w_mpjaego_r20
end type
type cb_16 from commandbutton within w_mpjaego_r20
end type
type rb_1 from radiobutton within w_mpjaego_r20
end type
type rb_2 from radiobutton within w_mpjaego_r20
end type
type rb_3 from radiobutton within w_mpjaego_r20
end type
type gb_10 from groupbox within w_mpjaego_r20
end type
type ddlb_fld from dropdownlistbox within w_mpjaego_r20
end type
type ddlb_dwtitles from dropdownlistbox within w_mpjaego_r20
end type
type pb_2 from picturebutton within w_mpjaego_r20
end type
type pb_3 from picturebutton within w_mpjaego_r20
end type
end forward

global type w_mpjaego_r20 from w_inheritance
integer width = 4699
integer height = 2324
string title = "수주물품별 재고현황(NEW)(w_mpjaego_r20)"
boolean resizable = false
cbx_1 cbx_1
st_3 st_3
st_2 st_2
sle_2 sle_2
st_1 st_1
dw_5 dw_5
dw_4 dw_4
dw_7 dw_7
dw_8 dw_8
pb_1 pb_1
dw_10 dw_10
dw_12 dw_12
dw_13 dw_13
dw_14 dw_14
dw_15 dw_15
cb_3 cb_3
dw_17 dw_17
gb_5 gb_5
gb_6 gb_6
gb_8 gb_8
gb_7 gb_7
dw_16 dw_16
dw_3 dw_3
cbx_chk cbx_chk
st_13 st_13
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
gb_10 gb_10
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
pb_2 pb_2
pb_3 pb_3
end type
global w_mpjaego_r20 w_mpjaego_r20

type variables
st_print      i_print
gs_codere_str ist_code
gs_itembaldo_str  ist_itemcode

string is_select,is_where,is_clause, is_dw5sql, is_column, is_sort
long   il_selectrow

end variables

on w_mpjaego_r20.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.st_3=create st_3
this.st_2=create st_2
this.sle_2=create sle_2
this.st_1=create st_1
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_7=create dw_7
this.dw_8=create dw_8
this.pb_1=create pb_1
this.dw_10=create dw_10
this.dw_12=create dw_12
this.dw_13=create dw_13
this.dw_14=create dw_14
this.dw_15=create dw_15
this.cb_3=create cb_3
this.dw_17=create dw_17
this.gb_5=create gb_5
this.gb_6=create gb_6
this.gb_8=create gb_8
this.gb_7=create gb_7
this.dw_16=create dw_16
this.dw_3=create dw_3
this.cbx_chk=create cbx_chk
this.st_13=create st_13
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.gb_10=create gb_10
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.pb_2=create pb_2
this.pb_3=create pb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.sle_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.dw_4
this.Control[iCurrent+8]=this.dw_7
this.Control[iCurrent+9]=this.dw_8
this.Control[iCurrent+10]=this.pb_1
this.Control[iCurrent+11]=this.dw_10
this.Control[iCurrent+12]=this.dw_12
this.Control[iCurrent+13]=this.dw_13
this.Control[iCurrent+14]=this.dw_14
this.Control[iCurrent+15]=this.dw_15
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.dw_17
this.Control[iCurrent+18]=this.gb_5
this.Control[iCurrent+19]=this.gb_6
this.Control[iCurrent+20]=this.gb_8
this.Control[iCurrent+21]=this.gb_7
this.Control[iCurrent+22]=this.dw_16
this.Control[iCurrent+23]=this.dw_3
this.Control[iCurrent+24]=this.cbx_chk
this.Control[iCurrent+25]=this.st_13
this.Control[iCurrent+26]=this.st_14
this.Control[iCurrent+27]=this.ddlb_op
this.Control[iCurrent+28]=this.sle_value
this.Control[iCurrent+29]=this.cb_10
this.Control[iCurrent+30]=this.cb_14
this.Control[iCurrent+31]=this.cb_15
this.Control[iCurrent+32]=this.cb_16
this.Control[iCurrent+33]=this.rb_1
this.Control[iCurrent+34]=this.rb_2
this.Control[iCurrent+35]=this.rb_3
this.Control[iCurrent+36]=this.gb_10
this.Control[iCurrent+37]=this.ddlb_fld
this.Control[iCurrent+38]=this.ddlb_dwtitles
this.Control[iCurrent+39]=this.pb_2
this.Control[iCurrent+40]=this.pb_3
end on

on w_mpjaego_r20.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.pb_1)
destroy(this.dw_10)
destroy(this.dw_12)
destroy(this.dw_13)
destroy(this.dw_14)
destroy(this.dw_15)
destroy(this.cb_3)
destroy(this.dw_17)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.gb_8)
destroy(this.gb_7)
destroy(this.dw_16)
destroy(this.dw_3)
destroy(this.cbx_chk)
destroy(this.st_13)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.gb_10)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.pb_2)
destroy(this.pb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
datawindowchild ldwc_loc3

rb_1.enabled = false
rb_2.enabled = false
rb_3.enabled = false

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )


dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(sqlca)
dw_7.SetTransObject(sqlca)

dw_12.SetTransObject(SQLCA)
dw_13.SetTransObject(SQLCA)
dw_14.SetTransObject(SQLCA)
dw_15.SetTransObject(SQLCA)
dw_17.SetTransObject(SQLCA)

dw_4.insertrow(0)
dw_5.insertrow(0)

dw_12.insertrow(0)
dw_13.insertrow(0)
dw_14.insertrow(0)
dw_15.insertrow(0)
dw_17.insertrow(0)

dw_2.Visible  = false
dw_7.Visible  = false
dw_8.Visible  = false
dw_10.Visible = false
dw_16.Visible = false

is_sort       = ""
pb_2.enabled  = false	// 수주상황부출력
pb_3.enabled  = false	// 발주등록 관리

// 수주일자
dw_4.Object.sujuyy[1]  = string(RelativeDate(date(gf_today()), - 2),"yyyy/mm/dd")
dw_4.Object.sujuyy2[1] = string(gf_today(),"yyyy/mm/dd")

// 입고예정일자
dw_17.Object.en_date1[1] = gf_today()
dw_17.Object.en_date2[1] = RelativeDate(date(gf_today()), 7)

// 저장소
dw_5.getchild('loc_no',ldwc_loc3)
//ldwc_loc3.insertrow(1)
//ldwc_loc3.setitem(1, "loc_no", "WS00000000")
//ldwc_loc3.setitem(1, "loc_name", "전체")
dw_5.Object.loc_no[1] = 'WS00000000'

is_dw5sql  =  dw_10.GetSQLSelect()

end event

event resize;call super::resize;//
dw_3.width  = newwidth  - 73
dw_3.height = newheight - 628

dw_7.x   = (newwidth - dw_7.width)  / 2		// 재고관련메모
dw_16.x  = (newwidth - dw_16.width) / 2		// 입고예정정보

end event

event activate;call super::activate;// 선택한 행으로 이동하기

if dw_3.rowcount() < 1 or il_selectrow > dw_3.rowcount() then RETURN

dw_3.scrolltorow( il_selectrow )


end event

type pb_save from w_inheritance`pb_save within w_mpjaego_r20
integer x = 4215
integer taborder = 80
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_7, "Y")

end event

type dw_1 from w_inheritance`dw_1 within w_mpjaego_r20
boolean visible = false
integer x = 3826
integer y = 80
integer width = 192
integer height = 116
integer taborder = 290
boolean hsplitscroll = true
end type

type st_title from w_inheritance`st_title within w_mpjaego_r20
integer x = 41
integer y = 48
integer width = 1559
string text = "수주물품별 재고현황2(NEW)"
end type

type st_tips from w_inheritance`st_tips within w_mpjaego_r20
end type

type pb_compute from w_inheritance`pb_compute within w_mpjaego_r20
boolean visible = false
integer taborder = 400
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpjaego_r20
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpjaego_r20
integer x = 4439
integer taborder = 340
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpjaego_r20
integer x = 3822
integer taborder = 300
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow  = dw_8
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 수주물품별 재고현황을 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=73'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpjaego_r20
boolean visible = false
integer taborder = 420
end type

type pb_delete from w_inheritance`pb_delete within w_mpjaego_r20
boolean visible = false
integer taborder = 440
end type

type pb_insert from w_inheritance`pb_insert within w_mpjaego_r20
boolean visible = false
integer taborder = 450
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpjaego_r20
integer x = 3625
integer taborder = 120
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sdate, ls_edate, ls_st, ls_order, ls_sql, ls_sql2, ls_sql3, ls_sql4
string ls_locno, ls_itemno, ls_itemno2, ls_custno, ls_scene, ls_confirm, ls_rlseyn, ls_where

rb_1.enabled = true
rb_2.enabled = true
rb_3.enabled = true

dw_8.SetTransObject(SQLCA)

dw_4.AcceptText()
dw_12.AcceptText()
dw_13.AcceptText()
dw_14.AcceptText()
dw_15.AcceptText()

ls_locno    = dw_5.Object.loc_no[1]			// 저장소

ls_sdate    = dw_4.Object.sujuyy1[1]		// 수주일자 1
ls_edate    = dw_4.Object.sujuyy2[1]      // 수주일자 2

ls_custno   = dw_12.Object.cust_no[1]		// 거래처
ls_scene    = dw_13.Object.scene_desc[1]	// 현장

ls_confirm  = dw_14.Object.confirm_yn[1]	// 확정유무
ls_rlseyn	= dw_15.Object.rlse_yn[1]		// 출고여부

int  iday
date ld_sdate, ld_edate

ld_sdate  = date(ls_sdate)
ld_edate  = date(ls_edate)
SELECT top 1 datediff(day, :ld_sdate, :ld_edate) INTO :iday FROM login;
if iday > 30 then
	if Messagebox("확인",string(iday) + " 일 이상의 수주기간 조회는 많은시간이 소요됩니다.~r~r" + &
	              "계속 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
end if

if ls_sdate = "" OR isnull(ls_sdate) then	ls_sdate = string(gf_today(),'yyyy/mm/dd')
if ls_edate = "" OR isnull(ls_edate) then	ls_edate = string(gf_today(),'yyyy/mm/dd')
if Long(ls_sdate) > Long(ls_edate) then
	Messagebox('확인','조회 기간의 정보가 바르지 않습니다. 확인바랍니다.')
	RETURN
end if 

if ls_custno = "" OR isnull(ls_custno) then ls_custno = "%"
if ls_scene  = "" OR isnull(ls_scene)  then ls_scene  = "%"

// 확정유무
choose case ls_confirm
	case "%" 	// 전체
		ls_confirm = "'N', 'T', 'Y'"
	case "Y"		// 확정
		ls_confirm = "'T', 'Y'"
	case "N"		// 미확정
		ls_confirm = "'N'"
end choose

dw_3.setredraw( false )

dw_3.dataobject = "d_mpjaego_r22"
dw_3.SetTransObject(SQLCA)
ls_sql  = dw_3.GetSQLSelect()

//dw_8.dataobject = "d_mpjaego_p1"
//dw_8.SetTransObject(SQLCA)
//ls_sql2 = dw_8.GetSQLSelect()


//dw_7.retrieve( ls_locno, ls_sdate, ls_edate, ls_custno, ls_scene, ls_confirm, ls_rlseyn )

dw_3.retrieve( ls_locno, ls_sdate, ls_edate, ls_custno, ls_scene, ls_confirm, ls_rlseyn )
dw_3.groupcalc()

//dw_8.setsqlselect( ls_sql2 + ls_Where )
//dw_8.retrieve()

if dw_3.rowcount() > 0 then 
	pb_2.enabled  = true	// 수주상황부출력
end if

// 소계숨김
if rb_1.checked = true then
	dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
end if

dw_3.setredraw( true )

MessageBox("확인","조회완료")

end event

type gb_3 from w_inheritance`gb_3 within w_mpjaego_r20
integer x = 37
integer y = 224
integer width = 832
integer height = 168
integer taborder = 390
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "수주일자"
end type

type gb_2 from w_inheritance`gb_2 within w_mpjaego_r20
integer x = 2007
integer y = 8
integer width = 658
integer height = 204
integer taborder = 150
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "저장소"
end type

type gb_1 from w_inheritance`gb_1 within w_mpjaego_r20
integer x = 2693
integer y = 8
integer width = 1970
integer taborder = 180
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpjaego_r20
integer x = 1568
integer y = 0
integer width = 128
integer height = 88
integer taborder = 320
string dataobject = "d_ipnotrcpt_r"
end type

type cbx_1 from checkbox within w_mpjaego_r20
boolean visible = false
integer x = 4000
integer y = 244
integer width = 608
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "중간공정만 조회"
end type

event clicked;if this.checked then
	dw_1.dataobject = 'd_mpjaego_r1'
	dw_1.SetTransObject(SQLCA)
else
	dw_1.dataobject = 'd_mpjaego_r'
	dw_1.SetTransObject(SQLCA)
end if

end event

type st_3 from statictext within w_mpjaego_r20
boolean visible = false
integer x = 1408
integer y = 284
integer width = 297
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
boolean enabled = false
string text = "제품명"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mpjaego_r20
boolean visible = false
integer x = 2510
integer y = 284
integer width = 297
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
boolean enabled = false
string text = "제품코드"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_mpjaego_r20
boolean visible = false
integer x = 2866
integer y = 264
integer width = 608
integer height = 92
integer taborder = 380
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_data

ls_data = trim(this.text)

if isnull(ls_data) or ls_data = '' then
	dw_1.setfilter("")
	dw_1.filter()
else
	ls_data = ls_data + "%"
	dw_1.setfilter("saledet_item_no like '" + ls_data + "'")
	dw_1.filter()
end if

end event

type st_1 from statictext within w_mpjaego_r20
boolean visible = false
integer x = 1211
integer y = 284
integer width = 274
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "검색 :"
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_mpjaego_r20
integer x = 2021
integer y = 80
integer width = 631
integer height = 100
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_mpjaego_s2"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within w_mpjaego_r20
integer x = 64
integer y = 272
integer width = 777
integer height = 100
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//
choose case dwo.name
	case 'sujuyy'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			dw_4.object.sujuyy[1] = String((date(message.stringparm)), 'yyyy/mm/dd')
		end if
		
	case 'sujuyy2'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			dw_4.object.sujuyy2[1] = String((date(message.stringparm)), 'yyyy/mm/dd')
		end if
end choose
this.accepttext()

end event

type dw_7 from datawindow within w_mpjaego_r20
string tag = "d_mpjaego_s33"
integer x = 1294
integer y = 660
integer width = 1755
integer height = 1356
integer taborder = 370
boolean bringtotop = true
boolean titlebar = true
string title = "입고관련메모"
string dataobject = "d_mpjaego_s3"
boolean controlmenu = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event buttonclicked;//
Date   ld_date
String ls_date, ls_lendate2, ls_lendate

choose case dwo.name
	case "b_save"
		if MessageBox("확인","입고관련메모를 저장하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
			dw_7.accepttext()

			ls_lendate  = dw_7.object.len_date[1]
			ls_lendate2 = string(year(today())) + '/' + MidA(ls_lendate,1,2) +'/' + MidA(ls_lendate,3,2)
			ld_date     = date(ls_lendate2)
			dw_7.object.en_date[1] = datetime(ld_date)						
			
			if dw_7.Update() = 1 then
				COMMIT Using Sqlca;
				Messagebox("확인","입고관련메모를 저장하였습니다.")
				dw_7.visible = False
			else
				ROLLBACK Using sqlca;
				Messagebox("확인","저장실패 하였습니다.")
				Return
			end if
		else
			Return
		end if
		
	case "b_delete"
		if MessageBox("확인","입고관련메모를 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			if dw_7.deleterow(0) = 1 then
				dw_7.Update()
				COMMIT Using Sqlca;
				Messagebox("확인","입고관련메모를 삭제하였습니다.")
				dw_7.visible = FALSE
			else
				ROLLBACK Using sqlca;
				Messagebox("확인","삭제실패 하였습니다.")
				Return
			end if	
		else
			Return
			dw_7.Visible = FALSE
		end if
		
	case "b_exit"
		dw_7.reset()
		dw_7.visible = FALSE
end choose

end event

event retrieveend;String ls_endate

IF rowcount() > 0  THEN
	ls_endate  =  String(dw_7.Object.en_date[1],'YYYYMMDD')
	dw_7.Object.len_date[1]  =  MidA(ls_endate,5,2) + MidA(ls_endate,7,2)
END IF

end event

type dw_8 from datawindow within w_mpjaego_r20
integer x = 1216
integer width = 128
integer height = 88
integer taborder = 350
boolean bringtotop = true
string title = "수주물품별 재고현황(NEW)"
string dataobject = "d_mpjaego_p1"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_mpjaego_r20
event mousemove pbm_mousemove
integer x = 4018
integer y = 52
integer width = 187
integer height = 144
integer taborder = 330
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_3.rowcount() < 1 then return

ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_3.SaveAsascii(ls_DocName)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		dw_3.SaveAs(ls_DocName, CSV!, TRUE)
	end if
	
	MessageBox("확인","작업완료")
end if


end event

type dw_10 from datawindow within w_mpjaego_r20
integer x = 1353
integer width = 128
integer height = 88
integer taborder = 20
boolean bringtotop = true
string title = "수주상황부"
string dataobject = "d_mpjaego_print2"
boolean livescroll = true
end type

type dw_12 from datawindow within w_mpjaego_r20
integer x = 914
integer y = 272
integer width = 827
integer height = 100
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h5"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_13 from datawindow within w_mpjaego_r20
integer x = 1824
integer y = 272
integer width = 814
integer height = 100
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h6"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_14 from datawindow within w_mpjaego_r20
integer x = 3707
integer y = 272
integer width = 923
integer height = 100
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h7"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;// 발주등록 관리(확정만 가능)
this.accepttext()

if data = "Y" then
	pb_3.enabled = true
else
	pb_3.enabled = false
end if
pb_retrieve.triggerevent( clicked! )


end event

type dw_15 from datawindow within w_mpjaego_r20
integer x = 2715
integer y = 272
integer width = 905
integer height = 100
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h8"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_mpjaego_r20
integer x = 4261
integer y = 448
integer width = 379
integer height = 104
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "입고예정"
end type

event clicked;// 입고예정
date   ld_date,   ld_endate1, ld_endate2
string sz_Frdate, sz_Todate

dw_16.SetTransObject(SQLCA)
dw_17.AcceptText()

ld_date    = today()
ld_endate1 = date(dw_17.Object.en_date1[1])
ld_endate2 = date(dw_17.Object.en_date2[1])

sz_Frdate  = string(ld_endate1,'yyyy/mm/dd')
sz_Todate  = string(ld_endate2,'yyyy/mm/dd')

if long(sz_Frdate) > long(sz_Todate) then
	Messagebox('확인','조회 기간의 정보가 바르지 않습니다. 확인바랍니다.')
	Return
end if

if dw_16.visible = true then
	dw_16.visible = false
else
	dw_16.visible = true
	dw_16.Retrieve(ld_endate1, ld_endate2)
end if

end event

type dw_17 from datawindow within w_mpjaego_r20
integer x = 3502
integer y = 456
integer width = 745
integer height = 92
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h9"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//
CHOOSE CASE dwo.name
	CASE 'en_date1'
		dw_16.Visible = False
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			dw_17.object.en_date1[1] = datetime(date(message.stringparm))
		end if
	CASE 'en_date2'
		dw_16.Visible = False
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			dw_17.object.en_date2[1] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.accepttext()

end event

type gb_5 from groupbox within w_mpjaego_r20
integer x = 887
integer y = 224
integer width = 891
integer height = 168
integer taborder = 220
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처명"
end type

type gb_6 from groupbox within w_mpjaego_r20
integer x = 1797
integer y = 224
integer width = 873
integer height = 168
integer taborder = 230
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "현장명"
end type

type gb_8 from groupbox within w_mpjaego_r20
integer x = 3675
integer y = 224
integer width = 992
integer height = 168
integer taborder = 250
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "수주확정"
end type

type gb_7 from groupbox within w_mpjaego_r20
integer x = 2688
integer y = 224
integer width = 965
integer height = 168
integer taborder = 260
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출고여부"
end type

type dw_16 from datawindow within w_mpjaego_r20
integer x = 526
integer y = 776
integer width = 3867
integer height = 1292
integer taborder = 430
boolean titlebar = true
string title = "입고예정정보"
string dataobject = "d_mpjaego_r4"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string sz_Name

this.AcceptText()

if row = 0 Then
	choose case dwo.type
		case "text"
			sz_Name = dwo.name
			sz_Name = LeftA(sz_Name, LenA(sz_Name) - 2)
	
			this.SetSort(sz_Name)
			this.Sort()
	end choose
	return
end if

if string(dwo.type) <> "column" then return

if this.RowCount() < 1 then return
	
this.SelectRow(0, FALSE)
this.SelectRow(row, TRUE)
end event

event doubleclicked;string ls_order_no,  ls_item_no, ls_qa, ls_loc_no
dec    ld_order_qty, ld_qoh
long   ll_row

dw_16.AcceptText()

ll_row       = dw_16.GetRow()
ls_order_no  = dw_16.Object.order_no[ll_row]
ls_item_no   = dw_16.Object.item_no[ll_row]
ls_qa        = dw_16.Object.qa[ll_row]
ld_order_qty = dw_16.Object.order_qty[ll_row]
ld_qoh       = dw_16.Object.qoh[ll_row]
ls_loc_no    = dw_5.Object.loc_no[1]

dw_7.visible = True
dw_16.visible= False

if dw_7.Retrieve(ls_order_no, ls_item_no, ls_qa, ld_order_qty) <= 0 then
	if MessageBox("확인", "입력한 정보가 없습니다. 신규 입력 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
		dw_7.InsertRow(0)
		dw_7.Object.order_no[1]  = ls_order_no
		dw_7.Object.item_no[1]   = ls_item_no
		dw_7.Object.qa[1]        = ls_qa
		dw_7.Object.order_qty[1] = ld_order_qty
		dw_7.Object.qoh[1]       = ld_qoh
		dw_7.Object.loc_no[1]    = ls_loc_no
	else
		dw_7.visible = FALSE
		return
	end if
end if

end event

type dw_3 from datawindow within w_mpjaego_r20
integer x = 37
integer y = 592
integer width = 4626
integer height = 1616
integer taborder = 410
string dataobject = "d_mpjaego_r22"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string ls_order_no, ls_item_no, ls_qa, ls_loc_no
dec    ld_order_qty, ld_qoh
long   ll_row

dw_3.AcceptText()

if isnull(row) OR row < 1 OR row > dw_3.rowcount() then RETURN 

ls_loc_no    = dw_5.Object.loc_no[1]

ls_order_no  = dw_3.Object.order_no[row]
ls_item_no   = dw_3.Object.item_no[row]
ls_qa        = dw_3.Object.qa[row]
ld_qoh       = dw_3.Object.qoh[row]
ld_order_qty = dw_3.Object.order_qty[row]

dw_7.visible = true
dw_7.retrieve(ls_order_no, ls_item_no, ls_qa, ld_order_qty)

if dw_7.rowcount() < 1 THEN
	dw_7.InsertRow(0)
	dw_7.Object.order_no[1]  = ls_order_no
	dw_7.Object.item_no[1]   = ls_item_no
	dw_7.Object.qa[1]        = ls_qa
	dw_7.Object.order_qty[1] = ld_order_qty
	dw_7.Object.qoh[1]       = ld_qoh
	dw_7.Object.loc_no[1]    = ls_loc_no
end if

end event

event clicked;//

dw_7.visible = false
if row < 1 then RETURN

this.AcceptText()

if this.object.tchk[1] = 0 then cbx_chk.checked = false

il_selectrow = row
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

choose case dwo.name
	case "en_date"
		if isnull( this.object.en_date[row] ) then
			this.object.en_datenull[row] = "N"
		end if
end choose

end event

event rowfocuschanged;//
this.AcceptText()
if this.RowCount() < 1 then RETURN	

end event

event rbuttondown;//
if isnull(row) OR this.rowcount() < 1 then RETURN	

choose case dwo.name
	case "en_date"
		OpenWithParm(w_calendar, Message.StringParm)
		if Message.StringParm <> 'N' then
			this.object.en_date[row] = datetime( date(Message.StringParm), time("00:00:00") )
		end if
end choose

this.accepttext()

end event

event editchanged;//
choose case dwo.name
	case "en_date"
		if LenA(data) > 0 then
			this.accepttext( )
		end if
end choose

end event

type cbx_chk from checkbox within w_mpjaego_r20
integer x = 270
integer y = 656
integer width = 69
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;//
long ll_row

dw_3.setredraw( false )
if this.checked = true then
	for ll_row = 1 to dw_3.rowcount()
		dw_3.object.chk[ll_row] = "Y"
	next
else
	for ll_row = 1 to dw_3.rowcount()
		dw_3.object.chk[ll_row] = ""
	next
end if
dw_3.setredraw( true )

end event

type st_13 from statictext within w_mpjaego_r20
integer x = 73
integer y = 476
integer width = 160
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

type st_14 from statictext within w_mpjaego_r20
integer x = 690
integer y = 476
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

type ddlb_op from dropdownlistbox within w_mpjaego_r20
integer x = 859
integer y = 460
integer width = 279
integer height = 512
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
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

type sle_value from singlelineedit within w_mpjaego_r20
integer x = 1152
integer y = 460
integer width = 558
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_10 from commandbutton within w_mpjaego_r20
integer x = 1728
integer y = 460
integer width = 146
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()


end event

type cb_14 from commandbutton within w_mpjaego_r20
integer x = 1879
integer y = 460
integer width = 146
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw = dw_3
GF_DW2UnFilter( arg_dw )

//pb_retrieve.triggerevent(clicked!)
dw_3.scrolltorow(1)

arg_dw.groupcalc()


end event

type cb_15 from commandbutton within w_mpjaego_r20
integer x = 2030
integer y = 460
integer width = 146
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

type cb_16 from commandbutton within w_mpjaego_r20
integer x = 2176
integer y = 460
integer width = 146
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

type rb_1 from radiobutton within w_mpjaego_r20
integer x = 2350
integer y = 468
integer width = 357
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "소계숨김"
boolean checked = true
end type

event clicked;// 소계숨김
dw_3.setredraw( false )
if this.checked = true then
	dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
end if
dw_3.setredraw( true  )

end event

type rb_2 from radiobutton within w_mpjaego_r20
integer x = 2711
integer y = 468
integer width = 357
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "소계보기"
end type

event clicked;// 소계보기
dw_3.setredraw( false )
if this.checked = true then
	dw_3.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=76")	// 소계
end if
dw_3.setredraw( true  )

end event

type rb_3 from radiobutton within w_mpjaego_r20
integer x = 3072
integer y = 468
integer width = 357
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체보기"
end type

event clicked;// 전체보기
dw_3.setredraw( false )
if this.checked = true then
	dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=76")	// 소계
end if
dw_3.setredraw( true )

end event

type gb_10 from groupbox within w_mpjaego_r20
integer x = 37
integer y = 412
integer width = 4626
integer height = 156
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type ddlb_fld from dropdownlistbox within w_mpjaego_r20
integer x = 247
integer y = 460
integer width = 402
integer height = 532
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_dwtitles from dropdownlistbox within w_mpjaego_r20
integer x = 274
integer y = 468
integer width = 270
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type pb_2 from picturebutton within w_mpjaego_r20
integer x = 3131
integer y = 52
integer width = 393
integer height = 144
integer taborder = 410
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주상황부 출력"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;w_repsuper w_print
st_print   l_print
string ls_where, ls_sql
long   ll_row

dw_3.AcceptText() 
ll_row = dw_3.GetRow()
	
if dw_3.getrow() > 0 then
	ist_itemcode.start_no   = dw_3.object.order_no[ll_row]
	ist_itemcode.end_no     = dw_3.object.order_no[ll_row]
	ist_itemcode.start_date = string(dw_3.object.sale_order_date[ll_row],"yyyy/mm/dd")
	ist_itemcode.end_date   = string(dw_3.object.sale_order_date[ll_row],"yyyy/mm/dd")
end if

openwithparm(w_whsaledet_w, ist_itemcode)
ist_itemcode = message.powerobjectparm
if ist_itemcode.okcancel = 'N' then	return


dw_10.settransobject(sqlca)

if ist_itemcode.order_flag = 'O' then
	ls_where  =  " and sale.order_no     between '"+ ist_itemcode.start_no + "'" 
	ls_where +=  " and '" + ist_itemcode.end_no + "'"  
	ls_where +=  " and sale.confirm_flag    like '" + ist_itemcode.do_flag + "'"
	ls_sql =  is_dw5sql + ls_where

	dw_10.SetSqlSelect(is_dw5sql + ls_where)
	dw_10.retrieve()
else
	ls_where  =  " and sale.order_date   between '"+ ist_itemcode.start_date + "'" 
	ls_where +=  " and '" + ist_itemcode.end_no + "'"  
	ls_where +=  " and sale.confirm_flag    like '" + ist_itemcode.do_flag + "'"	
//	ls_sql =  is_dw5sql + ls_where
	dw_10.SetSqlSelect(is_dw5sql + ls_where)
	dw_10.retrieve()
end if

l_print.st_datawindow  = dw_10
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_3 from picturebutton within w_mpjaego_r20
integer x = 2725
integer y = 52
integer width = 393
integer height = 144
integer taborder = 420
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "발주등록 상품복사"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;// 발주등록 관리
long    ll_row, ll_cnt, ll_delcnt, ll_copy
integer li_ret

if dw_3.rowcount() < 1 then return

if MessageBox("확인", "선택한 품목들은 반드시 상품으로 해야 하며,~r~r" + &
              "(반제품은 '생산계획 조정관리'에서 작업해야 합니다.", Exclamation!, OKCancel!, 1) = 2 then RETURN

for ll_row = 1 to dw_3.rowcount()
	if dw_3.object.chk[ll_row] = "Y" then
		ll_cnt = ll_cnt + 1
	end if
next

if ll_cnt = 0 then 
	MessageBox("확인","발주등록할 품목이 선택되지 않았습니다.")
	return
else
	MessageBox("확인",string(ll_cnt) + " 건을 선택하였습니다.")
end if

if IsValid(w_ippurchasenew_m) = False then			
	OpenSheet(w_ippurchasenew_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
	Parent.ArrangeSheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 				
else
	if MessageBox("확인", "작업중인 '발주등록 관리' 프로그램을 종료하고 재 실행 합니까?", Exclamation!, OKCancel!, 2) = 2 then
		Parent.arrangesheets( Layer! )
		Return
	else
		close(w_ippurchasenew_m)
		OpenSheet(w_ippurchasenew_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
		Parent.arrangesheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
	end if
end if

string ls_dataobject

debugbreak()

if IsValid(w_ippurchasenew_m) = true then
	ls_dataobject = w_ippurchasenew_m.dw_jaego.dataobject
	if ls_dataobject = "d_mpjaego_r2" then
		w_ippurchasenew_m.dw_jaego.dataobject = "d_mpjaego_r22"
		w_ippurchasenew_m.dw_jaego.SetTransObject(SQLCA)
	end if
	
	w_ippurchasenew_m.dw_jaego.InsertRow(0)
	
	li_ret = dw_3.RowsCopy(1, dw_3.RowCount(), Primary!, w_ippurchasenew_m.dw_jaego, 1, Primary!)
	if li_ret = 1 then
	else
		MessageBox("확인","RowsCopy 오류")
	end if
	
	ll_cnt  = 0	
	ll_copy = w_ippurchasenew_m.dw_jaego.rowcount()
	for ll_row = ll_copy to 1 step -1 
		if w_ippurchasenew_m.dw_jaego.object.chk[ll_row] = "Y" then
			ll_cnt = ll_cnt + 1
		else
			w_ippurchasenew_m.dw_jaego.deleterow(ll_row)
		end if
	next
	
   w_ippurchasenew_m.tab_1.selecttab(4)							// 수주내역 
   w_ippurchasenew_m.tab_1.tabpage_4.cb_18.enabled = true	// 수주물품별 재고현황(NEW) 가져오기
	MessageBox("확인","발주등록할 품목 " + string(ll_cnt,"#,##0") + " 건을 복사 하였습니다.")
end if

end event

