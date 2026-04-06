$PBExportHeader$w_oiitemsum_r.srw
$PBExportComments$판매거래처 현장별 출고물품집계현황(2001/12/13,이인호)
forward
global type w_oiitemsum_r from w_inheritance
end type
type st_3 from statictext within w_oiitemsum_r
end type
type dw_area from datawindow within w_oiitemsum_r
end type
type dw_cust from datawindow within w_oiitemsum_r
end type
type em_2 from editmask within w_oiitemsum_r
end type
type em_1 from editmask within w_oiitemsum_r
end type
type st_5 from statictext within w_oiitemsum_r
end type
type st_7 from statictext within w_oiitemsum_r
end type
type cbx_team from checkbox within w_oiitemsum_r
end type
type dw_sales from datawindow within w_oiitemsum_r
end type
type st_1 from statictext within w_oiitemsum_r
end type
type st_6 from statictext within w_oiitemsum_r
end type
type ddlb_fld from dropdownlistbox within w_oiitemsum_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiitemsum_r
end type
type st_8 from statictext within w_oiitemsum_r
end type
type sle_value from singlelineedit within w_oiitemsum_r
end type
type cb_1 from commandbutton within w_oiitemsum_r
end type
type cb_2 from commandbutton within w_oiitemsum_r
end type
type cb_3 from commandbutton within w_oiitemsum_r
end type
type cb_5 from commandbutton within w_oiitemsum_r
end type
type cbx_hap from checkbox within w_oiitemsum_r
end type
type cbx_haphd from checkbox within w_oiitemsum_r
end type
type ddlb_op from dropdownlistbox within w_oiitemsum_r
end type
type gb_4 from groupbox within w_oiitemsum_r
end type
end forward

global type w_oiitemsum_r from w_inheritance
integer y = 112
integer width = 4219
integer height = 2284
string title = "거래처별 물품집계현황(w_oiitemsum_r)"
st_3 st_3
dw_area dw_area
dw_cust dw_cust
em_2 em_2
em_1 em_1
st_5 st_5
st_7 st_7
cbx_team cbx_team
dw_sales dw_sales
st_1 st_1
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_8 st_8
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_hap cbx_hap
cbx_haphd cbx_haphd
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_oiitemsum_r w_oiitemsum_r

type variables
st_print i_print
string is_cust,  is_ret
date   id_start, id_end
datawindowchild idwc_area, idwc_cust, idwc_user
int il_cnt


end variables

on w_oiitemsum_r.create
int iCurrent
call super::create
this.st_3=create st_3
this.dw_area=create dw_area
this.dw_cust=create dw_cust
this.em_2=create em_2
this.em_1=create em_1
this.st_5=create st_5
this.st_7=create st_7
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.st_1=create st_1
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_8=create st_8
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_hap=create cbx_hap
this.cbx_haphd=create cbx_haphd
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.dw_area
this.Control[iCurrent+3]=this.dw_cust
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.cbx_team
this.Control[iCurrent+9]=this.dw_sales
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_8
this.Control[iCurrent+15]=this.sle_value
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.cb_2
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.cb_5
this.Control[iCurrent+20]=this.cbx_hap
this.Control[iCurrent+21]=this.cbx_haphd
this.Control[iCurrent+22]=this.ddlb_op
this.Control[iCurrent+23]=this.gb_4
end on

on w_oiitemsum_r.destroy
call super::destroy
destroy(this.st_3)
destroy(this.dw_area)
destroy(this.dw_cust)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_8)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_hap)
destroy(this.cbx_haphd)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
dw_1.sharedata(dw_2)

// 일자
em_1.text = string(today(),"yyyy/mm/dd")
em_2.text = string(today(),"yyyy/mm/dd")

// 사업장 
string ls_area

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = "%"	// gs_area
dw_area.object.area[1] = ls_area

// 거래처
dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
if GF_Permission("거래처별 물품집계현황", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( gs_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if
if idwc_cust.rowcount() = 0 then	idwc_cust.insertrow(0)
dw_cust.insertrow(0)  

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
if GF_Permission("현장별 자재투입현황", gs_userid) = "Y" then
	idwc_user.retrieve( "%" )

	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"
	
	cbx_team.checked = true		// 팀조회
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	long ll_find
	
	idwc_user.retrieve( gs_userid )
	ll_find = idwc_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() )
	if ll_find > 0 then
		cbx_team.checked = false
	   idwc_cust.setfilter( "salesman = '" + gs_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	else
		// 거래처가 없는 담당자(임원)
		idwc_user.insertrow(1)
		idwc_user.setitem(1,"user_id",gs_userid)
		idwc_user.setitem(1,"user_name",gs_username)
		idwc_user.accepttext()

		cbx_team.checked = true
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	end if
	dw_sales.object.user[1] = gs_userid
end if
dw_sales.setfocus()

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

dw_1.width  = newwidth  - (gb_4.x * 2)
dw_1.height = newheight - dw_1.y - gb_4.x


end event

type pb_save from w_inheritance`pb_save within w_oiitemsum_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiitemsum_r
integer x = 32
integer y = 444
integer width = 4105
integer height = 1712
integer taborder = 0
string dataobject = "d_oiitemsum_s"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
//is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oiitemsum_r
integer x = 41
integer y = 24
integer width = 1349
integer height = 140
string text = "거래처별 물품집계현황"
end type

type st_tips from w_inheritance`st_tips within w_oiitemsum_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiitemsum_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiitemsum_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oiitemsum_r
integer x = 3909
integer y = 64
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiitemsum_r
integer x = 3717
integer y = 64
integer taborder = 20
end type

event pb_print::clicked;//
w_repsuper w_print

if dw_2.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 거래처별 물품집계현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
OpenSheetWithParm(w_print, i_print, parentwindow(), 1, Original!)
//w_print.dw_1.object.s.text = em_1.text
//w_print.dw_1.object.e.text = em_2.text

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiitemsum_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oiitemsum_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oiitemsum_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiitemsum_r
integer x = 3525
integer y = 64
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_area, ls_custno, ls_sdate, ls_edate, ls_userid, ls_team
long   ll_row

// 일자
if em_1.text = "" then
	MessageBox("확인","시작일자를 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","종료일자를 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","조회일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_sdate = em_1.text
ls_edate = em_2.text

// 사업장
dw_area.AcceptText()
ls_area = dw_area.object.area[1]

// 담당자
dw_sales.AcceptText()
ls_userid = dw_sales.object.user[1]

// 거래처
dw_cust.AcceptText()
ls_custno = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_cust.setfocus()
	RETURN
end if

// 팀조회
if cbx_team.checked = true then		
	ls_team = "%"
else
	ls_team = "N"
end if

if GF_Permission("거래처별 물품집계현황", gs_userid) = "Y" then
	if ls_userid = "%" then ls_team = "%"
end if

debugbreak()

dw_1.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_userid, ls_team )

if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.!",information!)
else
	MessageBox("확인","조회완료",information!)
end if
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_oiitemsum_r
integer x = 2373
integer y = 8
integer width = 1102
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oiitemsum_r
integer x = 1445
integer y = 8
integer width = 905
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oiitemsum_r
integer x = 3493
integer y = 8
integer width = 645
integer height = 232
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_oiitemsum_r
integer x = 64
integer y = 188
integer width = 82
integer height = 64
integer taborder = 0
boolean enabled = false
string dataobject = "d_oiitemsum_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_3 from statictext within w_oiitemsum_r
integer x = 1477
integer y = 140
integer width = 224
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "거래처"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiitemsum_r
integer x = 1705
integer y = 52
integer width = 526
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()
end event

type dw_cust from datawindow within w_oiitemsum_r
integer x = 1705
integer y = 136
integer width = 613
integer height = 88
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;//
this.accepttext()

end event

type em_2 from editmask within w_oiitemsum_r
integer x = 3063
integer y = 52
integer width = 370
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_1 from editmask within w_oiitemsum_r
integer x = 2688
integer y = 52
integer width = 370
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_5 from statictext within w_oiitemsum_r
integer x = 1477
integer y = 52
integer width = 224
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_oiitemsum_r
integer x = 2400
integer y = 140
integer width = 283
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자팀"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_team from checkbox within w_oiitemsum_r
integer x = 2693
integer y = 156
integer width = 59
integer height = 56
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;// 팀
string ls_userid

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

if ls_userid = "%" then
	// 전체
else
	if this.checked = true then
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	else
		idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	end if
end if

end event

type dw_sales from datawindow within w_oiitemsum_r
integer x = 2761
integer y = 136
integer width = 329
integer height = 88
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
long   ll_row, ll_seq
string ls_userid

for ll_row = 1 to idwc_user.rowcount()
	ls_userid = idwc_user.getitemstring(ll_row, "user_id")
	SELECT isnull(seq,99) INTO :ll_seq FROM opeom_org WHERE user_id = :ls_userid;
	if gs_userid = ls_userid then
		idwc_user.setitem(ll_row, "seq", 0)
	else
		idwc_user.setitem(ll_row, "seq", ll_seq)
	end if
next
idwc_user.setfilter( "seq A" )
idwc_user.sort()
this.accepttext()

end event

event itemchanged;//
string ls_userid, ls_myauth
long   ll_row, ll_find

this.accepttext()
ls_userid = this.object.user[1]

// 거래처
dw_cust.enabled = true
dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)

dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("거래처별 물품집계현황", gs_userid) = "Y" then
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if

// 팀
if cbx_team.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if
this.accepttext()

end event

type st_1 from statictext within w_oiitemsum_r
integer x = 2400
integer y = 52
integer width = 283
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "출고일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_oiitemsum_r
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_oiitemsum_r
integer x = 274
integer y = 304
integer width = 443
integer height = 632
integer taborder = 100
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

type ddlb_dwtitles from dropdownlistbox within w_oiitemsum_r
integer x = 306
integer y = 316
integer width = 311
integer height = 88
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

type st_8 from statictext within w_oiitemsum_r
integer x = 745
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

type sle_value from singlelineedit within w_oiitemsum_r
integer x = 1234
integer y = 312
integer width = 567
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oiitemsum_r
integer x = 1806
integer y = 312
integer width = 160
integer height = 76
integer taborder = 90
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

type cb_2 from commandbutton within w_oiitemsum_r
integer x = 1970
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiitemsum_r
integer x = 2135
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiitemsum_r
integer x = 2299
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_hap from checkbox within w_oiitemsum_r
integer x = 2491
integer y = 292
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;// 합계만 보기
cbx_haphd.checked = false

dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_1.Modify("DataWindow.Trailer.3.Height=80")	// 소계 숨김
	dw_1.Modify("DataWindow.Trailer.2.Height=80")	// 소계 숨김
	dw_1.Modify("DataWindow.Trailer.1.Height=80")	// 소계 숨김
else
	dw_1.Modify("DataWindow.Detail.Height=80")		// Detail
	dw_1.Modify("DataWindow.Trailer.3.Height=80")	// 소계 숨김
	dw_1.Modify("DataWindow.Trailer.2.Height=80")	// 소계 숨김
	dw_1.Modify("DataWindow.Trailer.1.Height=80")	// 소계 숨김
end if
dw_1.setredraw( true )

end event

type cbx_haphd from checkbox within w_oiitemsum_r
integer x = 2491
integer y = 352
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계숨김"
end type

event clicked;// 합계숨김
cbx_hap.checked = false

dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=80")		// Detail
	dw_1.Modify("DataWindow.Trailer.3.Height=0")	   // 소계 숨김
	dw_1.Modify("DataWindow.Trailer.2.Height=0")	   // 소계 숨김
	dw_1.Modify("DataWindow.Trailer.1.Height=0")	   // 소계 숨김
else
	dw_1.Modify("DataWindow.Detail.Height=80")		// Detail
	dw_1.Modify("DataWindow.Trailer.3.Height=80")	// 소계 숨김
	dw_1.Modify("DataWindow.Trailer.2.Height=80")	// 소계 숨김
	dw_1.Modify("DataWindow.Trailer.1.Height=80")	// 소계 숨김
end if
dw_1.setredraw( true )

end event

type ddlb_op from dropdownlistbox within w_oiitemsum_r
integer x = 923
integer y = 304
integer width = 302
integer height = 500
integer taborder = 180
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

type gb_4 from groupbox within w_oiitemsum_r
integer x = 32
integer y = 244
integer width = 4105
integer height = 188
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

