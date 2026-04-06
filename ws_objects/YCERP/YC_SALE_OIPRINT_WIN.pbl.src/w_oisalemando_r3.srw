$PBExportHeader$w_oisalemando_r3.srw
$PBExportComments$영업사원별 출고현황(매출조직)
forward
global type w_oisalemando_r3 from w_inheritance
end type
type st_1 from statictext within w_oisalemando_r3
end type
type em_1 from editmask within w_oisalemando_r3
end type
type em_2 from editmask within w_oisalemando_r3
end type
type dw_area from datawindow within w_oisalemando_r3
end type
type st_4 from statictext within w_oisalemando_r3
end type
type cbx_team from checkbox within w_oisalemando_r3
end type
type dw_5 from datawindow within w_oisalemando_r3
end type
type rb_1 from radiobutton within w_oisalemando_r3
end type
type rb_2 from radiobutton within w_oisalemando_r3
end type
type dw_6 from datawindow within w_oisalemando_r3
end type
type rb_3 from radiobutton within w_oisalemando_r3
end type
type pb_1 from picturebutton within w_oisalemando_r3
end type
type st_5 from statictext within w_oisalemando_r3
end type
type ddlb_fld from dropdownlistbox within w_oisalemando_r3
end type
type st_6 from statictext within w_oisalemando_r3
end type
type sle_value from singlelineedit within w_oisalemando_r3
end type
type cb_1 from commandbutton within w_oisalemando_r3
end type
type cb_2 from commandbutton within w_oisalemando_r3
end type
type cb_3 from commandbutton within w_oisalemando_r3
end type
type cb_5 from commandbutton within w_oisalemando_r3
end type
type ddlb_dwtitles from dropdownlistbox within w_oisalemando_r3
end type
type st_7 from statictext within w_oisalemando_r3
end type
type dw_sales from datawindow within w_oisalemando_r3
end type
type st_2 from statictext within w_oisalemando_r3
end type
type dw_cust from datawindow within w_oisalemando_r3
end type
type rb_4 from radiobutton within w_oisalemando_r3
end type
type rb_5 from radiobutton within w_oisalemando_r3
end type
type rb_6 from radiobutton within w_oisalemando_r3
end type
type em_3 from editmask within w_oisalemando_r3
end type
type cbx_1 from checkbox within w_oisalemando_r3
end type
type cbx_inside from checkbox within w_oisalemando_r3
end type
type dw_3 from datawindow within w_oisalemando_r3
end type
type dw_4 from datawindow within w_oisalemando_r3
end type
type ddlb_op from dropdownlistbox within w_oisalemando_r3
end type
type rb_7 from radiobutton within w_oisalemando_r3
end type
type gb_4 from groupbox within w_oisalemando_r3
end type
end forward

global type w_oisalemando_r3 from w_inheritance
integer y = 112
integer width = 5106
integer height = 2580
string title = "출고현황(영업사원별)(w_oisalemando_r3)"
st_1 st_1
em_1 em_1
em_2 em_2
dw_area dw_area
st_4 st_4
cbx_team cbx_team
dw_5 dw_5
rb_1 rb_1
rb_2 rb_2
dw_6 dw_6
rb_3 rb_3
pb_1 pb_1
st_5 st_5
ddlb_fld ddlb_fld
st_6 st_6
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
dw_sales dw_sales
st_2 st_2
dw_cust dw_cust
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
em_3 em_3
cbx_1 cbx_1
cbx_inside cbx_inside
dw_3 dw_3
dw_4 dw_4
ddlb_op ddlb_op
rb_7 rb_7
gb_4 gb_4
end type
global w_oisalemando_r3 w_oisalemando_r3

type variables
string is_dw, is_sale_flag
string ls_saleman, is_ret
datawindowchild idwc_area, idwc_cust, idwc_user
end variables

on w_oisalemando_r3.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.st_4=create st_4
this.cbx_team=create cbx_team
this.dw_5=create dw_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_6=create dw_6
this.rb_3=create rb_3
this.pb_1=create pb_1
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.dw_sales=create dw_sales
this.st_2=create st_2
this.dw_cust=create dw_cust
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.em_3=create em_3
this.cbx_1=create cbx_1
this.cbx_inside=create cbx_inside
this.dw_3=create dw_3
this.dw_4=create dw_4
this.ddlb_op=create ddlb_op
this.rb_7=create rb_7
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.cbx_team
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.rb_1
this.Control[iCurrent+9]=this.rb_2
this.Control[iCurrent+10]=this.dw_6
this.Control[iCurrent+11]=this.rb_3
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.ddlb_dwtitles
this.Control[iCurrent+22]=this.st_7
this.Control[iCurrent+23]=this.dw_sales
this.Control[iCurrent+24]=this.st_2
this.Control[iCurrent+25]=this.dw_cust
this.Control[iCurrent+26]=this.rb_4
this.Control[iCurrent+27]=this.rb_5
this.Control[iCurrent+28]=this.rb_6
this.Control[iCurrent+29]=this.em_3
this.Control[iCurrent+30]=this.cbx_1
this.Control[iCurrent+31]=this.cbx_inside
this.Control[iCurrent+32]=this.dw_3
this.Control[iCurrent+33]=this.dw_4
this.Control[iCurrent+34]=this.ddlb_op
this.Control[iCurrent+35]=this.rb_7
this.Control[iCurrent+36]=this.gb_4
end on

on w_oisalemando_r3.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_4)
destroy(this.cbx_team)
destroy(this.dw_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_6)
destroy(this.rb_3)
destroy(this.pb_1)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.dw_sales)
destroy(this.st_2)
destroy(this.dw_cust)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.em_3)
destroy(this.cbx_1)
destroy(this.cbx_inside)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.ddlb_op)
destroy(this.rb_7)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),"yyyy/mm/dd"), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
dw_3.visible = false 
dw_4.visible = false 
dw_5.visible = false 
dw_6.visible = false 

rb_3.enabled = false 

dw_1.dataobject = "d_oisalemandosum_r"
dw_1.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)

// 일자
em_1.text = string(today(), "yyyy/mm/01")
em_2.text = string(today(), "yyyy/mm/dd")

// 사업장 
string ls_area

dw_area.SetTransObject(sqlca)
dw_area.insertrow(1)

dw_area.getchild("area",idwc_area)
idwc_area.SetTransObject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,"area_no","%")
idwc_area.setitem(1,"area_name","전체사업장")
idwc_area.accepttext()

ls_area = "%"
dw_area.object.area[1] = ls_area

// 거래처
//dw_1.object.cust_no.Background.Color = 67108864
dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
if GF_Permission("영업사원별 출고현황(ALL)", gs_userid) = "Y" then
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
if GF_Permission("영업사원별 출고현황(ALL)", gs_userid) = "Y" then
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
	if idwc_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
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
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height / 2

dw_4.x      = dw_1.x
dw_4.y      = dw_3.y + dw_3.height
dw_4.width  = dw_1.width
dw_4.height = dw_1.height / 2

end event

type pb_save from w_inheritance`pb_save within w_oisalemando_r3
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 120
end type

type dw_1 from w_inheritance`dw_1 within w_oisalemando_r3
string tag = "d_oisaledo_r"
integer x = 32
integer y = 440
integer width = 4649
integer height = 2004
integer taborder = 190
string title = "d_oisalemandosum_r"
string dataobject = "d_oisaledo_r3"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oisalemando_r3
integer x = 37
integer y = 24
integer width = 1330
integer height = 140
string text = "출고현황(영업사원별)"
end type

type st_tips from w_inheritance`st_tips within w_oisalemando_r3
end type

type pb_compute from w_inheritance`pb_compute within w_oisalemando_r3
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_oisalemando_r3
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 90
end type

type pb_close from w_inheritance`pb_close within w_oisalemando_r3
integer x = 4814
integer y = 56
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oisalemando_r3
integer x = 4622
integer y = 56
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
datawindow dw_prt
string     ls_zoom

if dw_1.rowcount() < 1 then return
dw_1.sharedata(dw_2)

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_1.checked = true then		// 현장집계
	dw_prt = dw_1
	ls_zoom = "Datawindow.Zoom=100"
elseif rb_2.checked = true then	// 품목집계
	dw_prt = dw_1
	ls_zoom = "Datawindow.Zoom=80"
else										// 전략품목
	dw_prt = dw_1						
	ls_zoom = "Datawindow.Zoom=100"
end if

l_print.st_datawindow  = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 영업사원별 출고현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + ls_zoom
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oisalemando_r3
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_oisalemando_r3
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_oisalemando_r3
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oisalemando_r3
integer x = 4233
integer y = 56
integer taborder = 30
end type

event pb_retrieve::clicked;//
string  ls_area, ls_custno, ls_sdate, ls_edate, ls_userid, ls_team, ls_inside
long    ll_row
decimal ldc_amount

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

if GF_Permission("영업사원별_출고현황(ALL)", gs_userid) = "Y" then
	if ls_userid = "%" then ls_team = "%"
end if


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_3.checked = true then		// 전략품목
	dw_1.retrieve( date(ls_sdate), ls_userid, ls_team )
	if dw_1.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.!",information!)
	else
		MessageBox("확인","조회완료",information!)
	end if
else
	if cbx_1.checked = true then
		ldc_amount = dec(em_3.text)
		if isnull(ldc_amount) OR ldc_amount = 0 then 
			em_3.text  = string(10000000)
			ldc_amount = 10000000
		end if
		
		dw_3.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_userid, ls_team, ls_inside, ldc_amount )		
		MessageBox("확인","조회완료",information!)
		
	else	
		dw_2.sharedata(dw_2)
		dw_1.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_userid, ls_team )
		if dw_1.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.!",information!)
		else
			MessageBox("확인","조회완료",information!)
		end if
	end if
end if


end event

type gb_3 from w_inheritance`gb_3 within w_oisalemando_r3
integer x = 1390
integer y = 0
integer width = 887
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oisalemando_r3
integer y = 244
integer width = 4649
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oisalemando_r3
integer x = 4197
integer y = 0
integer width = 841
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oisalemando_r3
integer x = 59
integer y = 160
integer width = 110
integer height = 84
integer taborder = 0
boolean enabled = false
string dataobject = "d_oisaledorep_r3p"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_oisalemando_r3
integer x = 2299
integer y = 44
integer width = 288
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
string text = "출고기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oisalemando_r3
integer x = 2592
integer y = 44
integer width = 398
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

event modified;//
if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
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

////
//OpenWithParm(w_calendar, Message.StringParm)
//if Message.StringParm <> 'N' then
//	this.text = string(date(Message.StringParm))
//	if this.text > em_2.text then em_2.text = this.text
//end if
//
end event

type em_2 from editmask within w_oisalemando_r3
integer x = 2994
integer y = 44
integer width = 398
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

event modified;//
if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
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

////
//OpenWithParm(w_calendar, Message.StringParm)
//if Message.StringParm <> 'N' then
//	this.text = string(date(Message.StringParm))
//	if this.text < em_1.text then em_1.text = this.text
//end if
//
end event

type dw_area from datawindow within w_oisalemando_r3
integer x = 1659
integer y = 44
integer width = 526
integer height = 80
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_oisalemando_r3
integer x = 1403
integer y = 44
integer width = 251
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_team from checkbox within w_oisalemando_r3
integer x = 2592
integer y = 148
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
	if cbx_team.checked = true then
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	else
		idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	end if
end if

end event

type dw_5 from datawindow within w_oisalemando_r3
integer x = 361
integer y = 800
integer width = 3973
integer height = 1292
integer taborder = 150
boolean bringtotop = true
string title = "none"
string dataobject = "d_oisalemandosum_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_5"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_1 from radiobutton within w_oisalemando_r3
integer x = 3401
integer y = 36
integer width = 329
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "현장집계"
boolean checked = true
end type

event clicked;// 현장집계
if this.checked = true then
	dw_1.dataobject = "d_oisalemandosum_r"
	dw_1.SetTransObject(SQLCA)
end if

end event

type rb_2 from radiobutton within w_oisalemando_r3
integer x = 3401
integer y = 96
integer width = 329
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "품목집계"
end type

event clicked;// 품목집계
if this.checked = true then
	dw_1.dataobject = "d_oisaledo_r3"
	dw_1.SetTransObject(SQLCA)
end if

end event

type dw_6 from datawindow within w_oisalemando_r3
integer x = 1097
integer y = 1140
integer width = 2409
integer height = 784
integer taborder = 170
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsaleitemt_r11"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_6"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_3 from radiobutton within w_oisalemando_r3
integer x = 3707
integer y = 92
integer width = 329
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "전략품목"
end type

event clicked;// 전략품목
if this.checked = true then
	dw_1.dataobject = "d_orsaleitemt_r11"
	dw_1.SetTransObject(SQLCA)
end if

end event

type pb_1 from picturebutton within w_oisalemando_r3
event mousemove pbm_mousemove
integer x = 4425
integer y = 56
integer width = 187
integer height = 144
integer taborder = 80
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
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_5 from statictext within w_oisalemando_r3
integer x = 82
integer y = 312
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

type ddlb_fld from dropdownlistbox within w_oisalemando_r3
integer x = 270
integer y = 296
integer width = 480
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

type st_6 from statictext within w_oisalemando_r3
integer x = 768
integer y = 312
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

type sle_value from singlelineedit within w_oisalemando_r3
integer x = 1257
integer y = 304
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

type cb_1 from commandbutton within w_oisalemando_r3
integer x = 1829
integer y = 304
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_5" then
	arg_dw  = dw_5
else
	arg_dw  = dw_6	
end if	

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oisalemando_r3
integer x = 1993
integer y = 304
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_5" then
	arg_dw  = dw_5
else
	arg_dw  = dw_6	
end if	

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oisalemando_r3
integer x = 2158
integer y = 304
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_5" then
	arg_dw  = dw_5
else
	arg_dw  = dw_6	
end if	

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oisalemando_r3
integer x = 2322
integer y = 304
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_5" then
	arg_dw  = dw_5
else
	arg_dw  = dw_6	
end if	

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_oisalemando_r3
integer x = 311
integer y = 308
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

type st_7 from statictext within w_oisalemando_r3
integer x = 2299
integer y = 128
integer width = 288
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_sales from datawindow within w_oisalemando_r3
integer x = 2665
integer y = 124
integer width = 329
integer height = 88
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

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

if GF_Permission("영업사원별 출고현황(ALL)", gs_userid) = "Y" then
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

event getfocus;// 순번정렬
long   ll_row, ll_seq
string ls_userid

debugbreak()

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

end event

type st_2 from statictext within w_oisalemando_r3
integer x = 1403
integer y = 128
integer width = 251
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
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_oisalemando_r3
integer x = 1659
integer y = 124
integer width = 608
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type rb_4 from radiobutton within w_oisalemando_r3
integer x = 2510
integer y = 284
integer width = 402
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
string text = "당일,익일"
end type

event clicked;// 당일,익일
if this.checked = true then
	em_1.text = string(today(), "yyyy/mm/dd")
	em_2.text = string(RelativeDate(today(), 1), "yyyy/mm/dd")
end if

end event

type rb_5 from radiobutton within w_oisalemando_r3
integer x = 2921
integer y = 284
integer width = 247
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
string text = "전일"
end type

event clicked;// 전일
if this.checked = true then
	em_1.text = string(RelativeDate(today(), -1), 'YYYY/MM/DD')
	em_2.text = string(RelativeDate(today(), -1), 'YYYY/MM/DD')
end if	
end event

type rb_6 from radiobutton within w_oisalemando_r3
integer x = 2510
integer y = 344
integer width = 242
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
string text = "당일"
end type

event clicked;// 당일
if this.checked = true then
	em_1.text = string(today(), "yyyy/mm/dd")
	em_2.text = string(today(), "yyyy/mm/dd")
end if	
end event

type em_3 from editmask within w_oisalemando_r3
integer x = 2779
integer y = 344
integer width = 375
integer height = 68
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
string mask = "##,###,##0"
end type

event getfocus;//
this.SelectText(1, LenA(this.text) + 3 )

end event

type cbx_1 from checkbox within w_oisalemando_r3
integer x = 3186
integer y = 348
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "특이주문"
end type

event clicked;//
string ls_sdate, ls_edate

if this.checked = true then
	// 일자
	SELECT top 1 convert(char(10),getdate(),111), convert(char(10),getdate(),111)
	  INTO :ls_sdate, :ls_edate
	  FROM login;
	  
	em_1.text = ls_sdate
	em_2.text = ls_edate		
	em_3.visible = true
	
	dw_1.visible = false
	dw_3.visible = true
	dw_4.visible = true
else
	// 일자
	SELECT top 1 convert(char(10),dateadd(month, -1, getdate()),111), convert(char(10),dateadd(day, 1, getdate()),111)
	  INTO :ls_sdate, :ls_edate
	  FROM login;
	  
	em_1.text = ls_sdate
	em_2.text = ls_edate	
	em_3.visible = false
	
	dw_1.visible = true
	dw_3.visible = false
	dw_4.visible = false
end if

end event

type cbx_inside from checkbox within w_oisalemando_r3
integer x = 3003
integer y = 148
integer width = 462
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "계열사 제외"
end type

type dw_3 from datawindow within w_oisalemando_r3
integer x = 1184
integer y = 652
integer width = 686
integer height = 400
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oisalesalemanrep_r4"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string   ls_custno, ls_scenecode
datetime ldt_dodate
decimal  ldc_amount
long     ll_row

ll_row  = this.getrow()

ls_custno     = this.object.cust_no[ll_row]
ls_scenecode  = this.object.scene_code[ll_row]
ldt_dodate    = this.object.do_date[ll_row]
//ldc_amount    = this.object.sale_amount[ll_row]

dw_4.reset()
dw_4.retrieve( ls_custno, ls_scenecode, ldt_dodate )

end event

type dw_4 from datawindow within w_oisalemando_r3
integer x = 2094
integer y = 656
integer width = 686
integer height = 400
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oisalesalemanrep_r5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_op from dropdownlistbox within w_oisalemando_r3
integer x = 946
integer y = 296
integer width = 302
integer height = 500
integer taborder = 190
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

type rb_7 from radiobutton within w_oisalemando_r3
integer x = 3707
integer y = 36
integer width = 466
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "현장집계(월간)"
end type

event clicked;// 현장집계(월간)
if this.checked = true then
	dw_1.dataobject = "d_oisalemandosum_mon_r"
	dw_1.SetTransObject(SQLCA)
end if

end event

type gb_4 from groupbox within w_oisalemando_r3
integer x = 2286
integer width = 1902
integer height = 232
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

