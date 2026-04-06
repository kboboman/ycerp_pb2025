$PBExportHeader$w_orsalesaleman_r3.srw
$PBExportComments$영업사원별 수주현황(매출조직도)
forward
global type w_orsalesaleman_r3 from w_inheritance
end type
type em_1 from editmask within w_orsalesaleman_r3
end type
type em_2 from editmask within w_orsalesaleman_r3
end type
type st_2 from statictext within w_orsalesaleman_r3
end type
type dw_sales from datawindow within w_orsalesaleman_r3
end type
type dw_area from datawindow within w_orsalesaleman_r3
end type
type st_4 from statictext within w_orsalesaleman_r3
end type
type st_6 from statictext within w_orsalesaleman_r3
end type
type ddlb_fld from dropdownlistbox within w_orsalesaleman_r3
end type
type ddlb_dwtitles from dropdownlistbox within w_orsalesaleman_r3
end type
type st_7 from statictext within w_orsalesaleman_r3
end type
type ddlb_op from dropdownlistbox within w_orsalesaleman_r3
end type
type sle_value from singlelineedit within w_orsalesaleman_r3
end type
type cb_3 from commandbutton within w_orsalesaleman_r3
end type
type cb_4 from commandbutton within w_orsalesaleman_r3
end type
type cb_5 from commandbutton within w_orsalesaleman_r3
end type
type cb_6 from commandbutton within w_orsalesaleman_r3
end type
type cb_2 from commandbutton within w_orsalesaleman_r3
end type
type cb_rout from commandbutton within w_orsalesaleman_r3
end type
type cbx_rout from checkbox within w_orsalesaleman_r3
end type
type dw_6 from datawindow within w_orsalesaleman_r3
end type
type pb_2 from picturebutton within w_orsalesaleman_r3
end type
type cbx_team from checkbox within w_orsalesaleman_r3
end type
type st_3 from statictext within w_orsalesaleman_r3
end type
type dw_cust from datawindow within w_orsalesaleman_r3
end type
type cbx_inside from checkbox within w_orsalesaleman_r3
end type
type rb_1 from radiobutton within w_orsalesaleman_r3
end type
type rb_2 from radiobutton within w_orsalesaleman_r3
end type
type rb_3 from radiobutton within w_orsalesaleman_r3
end type
type dw_3 from datawindow within w_orsalesaleman_r3
end type
type cbx_1 from checkbox within w_orsalesaleman_r3
end type
type em_3 from editmask within w_orsalesaleman_r3
end type
type dw_4 from datawindow within w_orsalesaleman_r3
end type
type cbx_output from checkbox within w_orsalesaleman_r3
end type
type gb_4 from groupbox within w_orsalesaleman_r3
end type
end forward

global type w_orsalesaleman_r3 from w_inheritance
integer y = 112
integer width = 4722
integer height = 2556
string title = "영업사원별 수주현황(w_orsalesaleman_r3)"
long backcolor = 79416533
em_1 em_1
em_2 em_2
st_2 st_2
dw_sales dw_sales
dw_area dw_area
st_4 st_4
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_2 cb_2
cb_rout cb_rout
cbx_rout cbx_rout
dw_6 dw_6
pb_2 pb_2
cbx_team cbx_team
st_3 st_3
dw_cust dw_cust
cbx_inside cbx_inside
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_3 dw_3
cbx_1 cbx_1
em_3 em_3
dw_4 dw_4
cbx_output cbx_output
gb_4 gb_4
end type
global w_orsalesaleman_r3 w_orsalesaleman_r3

type variables
string is_dw, is_ret, is_dw5_sql
datawindowchild idwc_user, idwc_cust, idwc_area
end variables

on w_orsalesaleman_r3.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_sales=create dw_sales
this.dw_area=create dw_area
this.st_4=create st_4
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_2=create cb_2
this.cb_rout=create cb_rout
this.cbx_rout=create cbx_rout
this.dw_6=create dw_6
this.pb_2=create pb_2
this.cbx_team=create cbx_team
this.st_3=create st_3
this.dw_cust=create dw_cust
this.cbx_inside=create cbx_inside
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.em_3=create em_3
this.dw_4=create dw_4
this.cbx_output=create cbx_output
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.dw_sales
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cb_6
this.Control[iCurrent+17]=this.cb_2
this.Control[iCurrent+18]=this.cb_rout
this.Control[iCurrent+19]=this.cbx_rout
this.Control[iCurrent+20]=this.dw_6
this.Control[iCurrent+21]=this.pb_2
this.Control[iCurrent+22]=this.cbx_team
this.Control[iCurrent+23]=this.st_3
this.Control[iCurrent+24]=this.dw_cust
this.Control[iCurrent+25]=this.cbx_inside
this.Control[iCurrent+26]=this.rb_1
this.Control[iCurrent+27]=this.rb_2
this.Control[iCurrent+28]=this.rb_3
this.Control[iCurrent+29]=this.dw_3
this.Control[iCurrent+30]=this.cbx_1
this.Control[iCurrent+31]=this.em_3
this.Control[iCurrent+32]=this.dw_4
this.Control[iCurrent+33]=this.cbx_output
this.Control[iCurrent+34]=this.gb_4
end on

on w_orsalesaleman_r3.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_sales)
destroy(this.dw_area)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_2)
destroy(this.cb_rout)
destroy(this.cbx_rout)
destroy(this.dw_6)
destroy(this.pb_2)
destroy(this.cbx_team)
destroy(this.st_3)
destroy(this.dw_cust)
destroy(this.cbx_inside)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.em_3)
destroy(this.dw_4)
destroy(this.cbx_output)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

string ls_salesman, ls_sdate, ls_edate, ls_team

dw_3.settransobject(sqlca)
dw_3.visible = false

dw_4.settransobject(sqlca)
dw_4.visible = false

dw_6.settransobject(sqlca)
is_dw5_sql = dw_1.describe("datawindow.table.select")

// 공정관리 투입
//cbx_rout.enabled = false

em_3.visible = false

dw_2.visible = false
dw_6.visible = false

// 일자
SELECT top 1 convert(char(10),dateadd(month, -1, getdate()),111), convert(char(10),dateadd(day, 1, getdate()),111)
  INTO :ls_sdate, :ls_edate
  FROM login;
  
em_1.text = ls_sdate
em_2.text = ls_edate

// 사업장 
string ls_area
ls_area = "%"

dw_area.SetTransObject(sqlca)
dw_area.insertrow(1)
dw_area.getchild("area",idwc_area)

idwc_area.SetTransObject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,"area_no","%")
idwc_area.setitem(1,"area_name","전체사업장")
idwc_area.accepttext()

dw_area.object.area[1] = ls_area

// 거래처
dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
if GF_Permission("영업사원별_수주현황(ALL)", gs_userid) = "Y" then
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
if GF_Permission("영업사원별_수주현황(ALL)", gs_userid) = "Y" then
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

dw_6.x      = dw_1.x
dw_6.y      = dw_1.y
dw_6.width  = dw_1.width
dw_6.height = dw_1.height

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height / 2

dw_4.x      = dw_1.x
dw_4.y      = dw_3.y + dw_3.height
dw_4.width  = dw_1.width
dw_4.height = dw_1.height / 2

end event

type pb_save from w_inheritance`pb_save within w_orsalesaleman_r3
boolean visible = false
integer taborder = 130
end type

type dw_1 from w_inheritance`dw_1 within w_orsalesaleman_r3
integer x = 32
integer y = 428
integer width = 4603
integer height = 1988
integer taborder = 0
string dataobject = "d_orsalesalemanrep_r3"
end type

event dw_1::doubleclicked;call super::doubleclicked;if dwo.name = 'sale_cust_no' or dwo.name = 'customer_cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.sale_cust_no[row]
	lstr_where.name = this.object.customer_cust_name[row]
	openwithparm(w_whopeom_w, lstr_where)
end if
end event

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if isnull(row) OR row < 1 then RETURN

string ls_track

ls_track = this.object.sale_tracking[row]
if ls_track = "Y" then
	cb_rout.text = "공정관리 제거"
else
	cb_rout.text = "공정관리 투입"
end if

end event

type st_title from w_inheritance`st_title within w_orsalesaleman_r3
integer x = 0
integer y = 0
integer width = 1248
integer height = 136
string text = "수주현황(영업사원별)"
end type

type st_tips from w_inheritance`st_tips within w_orsalesaleman_r3
end type

type pb_compute from w_inheritance`pb_compute within w_orsalesaleman_r3
boolean visible = false
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsalesaleman_r3
boolean visible = false
integer taborder = 110
end type

type pb_close from w_inheritance`pb_close within w_orsalesaleman_r3
integer x = 4306
integer y = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsalesaleman_r3
integer x = 4114
integer y = 60
integer taborder = 80
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print


if dw_2.rowcount() < 1 then
	return
end if

//l_print.name = 'd_orsalesalemanrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원별 수주현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=56'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsalesaleman_r3
boolean visible = false
integer taborder = 180
end type

type pb_delete from w_inheritance`pb_delete within w_orsalesaleman_r3
boolean visible = false
integer taborder = 230
end type

type pb_insert from w_inheritance`pb_insert within w_orsalesaleman_r3
boolean visible = false
integer taborder = 280
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsalesaleman_r3
integer x = 3730
integer y = 60
integer taborder = 60
end type

event pb_retrieve::clicked;//
string  ls_area,  ls_custno, ls_sdate, ls_edate, ls_saleman, ls_team, ls_inside, ls_output
decimal ldc_amount
date    ld_start, ld_end

dw_1.reset() ; dw_3.reset() ; dw_4.reset()

if em_1.text = "" then
	MessageBox("확인","시작일자를 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","시작일자를 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","시작일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

cbx_rout.enabled = true

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

// 사업장
dw_area.AcceptText()
ls_area  = dw_area.object.area[1]

// 거래처
dw_cust.accepttext()
ls_custno = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_cust.setfocus()
	RETURN
end if

// 담당자
dw_sales.AcceptText()
ls_saleman = dw_sales.object.user[1]

// 팀조회
if cbx_team.checked = true then		
	ls_team = "%"
else
	ls_team = "N"
end if

// 출고분 제외
if cbx_output.checked = true then
	ls_output = "Y"
else
	ls_output = "N"
end if

//
if GF_Permission("영업사원별_수주현황(ALL)", gs_userid) = "Y" then
	if ls_saleman = "%" then ls_team = "%"
end if

// 계열사 제외
if cbx_inside.checked = true then
	ls_inside = "N"
else
	ls_inside = "%"
end if

//
if cbx_1.checked = true then
	ldc_amount = dec(em_3.text)
	if isnull(ldc_amount) OR ldc_amount = 0 then 
		em_3.text  = string(10000000)
		ldc_amount = 10000000
	end if
	
	dw_3.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_saleman, ls_team, ls_inside, ls_output, ldc_amount )
	MessageBox("확인","조회완료",information!)
else	
	dw_1.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_saleman, ls_team, ls_inside, ls_output )
	dw_1.ShareData( dw_2 )
	if dw_1.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.",information!)
	else
		MessageBox("확인","조회완료",information!)
	end if
end if

end event

type gb_3 from w_inheritance`gb_3 within w_orsalesaleman_r3
integer x = 1298
integer y = 0
integer width = 919
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsalesaleman_r3
integer y = 232
integer width = 4603
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_orsalesaleman_r3
integer x = 3694
integer y = 0
integer width = 832
integer height = 232
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_orsalesaleman_r3
integer x = 238
integer y = 124
integer width = 123
integer height = 92
integer taborder = 0
boolean enabled = false
string dataobject = "d_orsalesalemanrep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type em_1 from editmask within w_orsalesaleman_r3
integer x = 2254
integer y = 44
integer width = 393
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_orsalesaleman_r3
integer x = 2656
integer y = 44
integer width = 393
integer height = 80
integer taborder = 30
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

event modified;if dw_1.rowcount() > 0 then
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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_2 from statictext within w_orsalesaleman_r3
integer x = 2254
integer y = 128
integer width = 274
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
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_sales from datawindow within w_orsalesaleman_r3
integer x = 2606
integer y = 128
integer width = 338
integer height = 84
integer taborder = 70
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

if GF_Permission("영업사원별_수주현황(ALL)", gs_userid) = "Y" then
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

type dw_area from datawindow within w_orsalesaleman_r3
integer x = 1586
integer y = 44
integer width = 526
integer height = 84
integer taborder = 160
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
this.AcceptText()

end event

type st_4 from statictext within w_orsalesaleman_r3
integer x = 1321
integer y = 44
integer width = 261
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

type st_6 from statictext within w_orsalesaleman_r3
integer x = 87
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_orsalesaleman_r3
integer x = 274
integer y = 288
integer width = 480
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_orsalesaleman_r3
integer x = 329
integer y = 300
integer width = 311
integer height = 88
integer taborder = 240
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

type st_7 from statictext within w_orsalesaleman_r3
integer x = 791
integer y = 308
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

type ddlb_op from dropdownlistbox within w_orsalesaleman_r3
integer x = 960
integer y = 288
integer width = 297
integer height = 512
integer taborder = 250
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

type sle_value from singlelineedit within w_orsalesaleman_r3
integer x = 1280
integer y = 292
integer width = 567
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_orsalesaleman_r3
integer x = 1861
integer y = 292
integer width = 160
integer height = 76
integer taborder = 170
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_orsalesaleman_r3
integer x = 2025
integer y = 292
integer width = 160
integer height = 76
integer taborder = 200
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_orsalesaleman_r3
integer x = 2190
integer y = 292
integer width = 160
integer height = 76
integer taborder = 260
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_orsalesaleman_r3
integer x = 2354
integer y = 292
integer width = 160
integer height = 76
integer taborder = 290
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_orsalesaleman_r3
integer x = 3611
integer y = 336
integer width = 443
integer height = 72
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "여신현황"
end type

event clicked;//
string ls_custno, ls_custnm
long   ll_row

if cbx_1.checked = true then
	ll_row    = dw_3.getrow()
	if isnull(ll_row) OR ll_row < 1 then RETURN

	ls_custno = dw_3.object.cust_no[ll_row]
	ls_custnm = dw_3.object.cust_name[ll_row]
else
	ll_row    = dw_1.getrow()
	if isnull(ll_row) OR ll_row < 1 then RETURN

	ls_custno = dw_1.object.sale_cust_no[ll_row]
	ls_custnm = dw_1.object.customer_cust_name[ll_row]
end if
	
gs_where lstr_where
lstr_where.str1 = ls_custno
lstr_where.name = ls_custnm
OpenWithParm( w_whopeom_w, lstr_where )

end event

type cb_rout from commandbutton within w_orsalesaleman_r3
integer x = 3611
integer y = 264
integer width = 443
integer height = 72
integer taborder = 270
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "공정관리 투입"
end type

event clicked;// 공정관리 투입
string ls_orderno, ls_track
long   ll_row

ll_row    = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_orderno = dw_1.object.sale_order_no[ll_row]
if isnull(ls_orderno) OR ls_orderno = "" then RETURN

SELECT tracking INTO :ls_track FROM sale WHERE order_no = :ls_orderno;
if isnull(ls_track) OR ls_track = "" then
	ls_track = "Y"
else
	setnull( ls_track )
end if

//
UPDATE sale SET tracking = :ls_track WHERE order_no = :ls_orderno;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("확인","공정관리 대상으로 등록중 ERROR가 발생하였습니다.")
	RETURN
else
	COMMIT;

	for ll_row = 1 to dw_1.rowcount()
		if ls_orderno = dw_1.object.sale_order_no[ll_row] then
			dw_1.object.sale_tracking[ll_row] = ls_track
		end if
	next
	
	if ls_track = "Y" then
		cb_rout.text = "공정관리 제거"
		MessageBox("확인","공정관리 대상으로 등록 하였습니다.")
	else
		cb_rout.text = "공정관리 투입"
		MessageBox("확인","공정관리 대상에서 해지 하였습니다.")
	end if
end if

end event

type cbx_rout from checkbox within w_orsalesaleman_r3
integer x = 3223
integer y = 272
integer width = 361
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
string text = "공정필터"
end type

event clicked;// 공정필터
if this.checked = true then
	dw_1.setfilter( "sale_tracking = 'Y'" )
	dw_1.filter()
else
	dw_1.setfilter( "" )
	dw_1.filter()
end if

end event

type dw_6 from datawindow within w_orsalesaleman_r3
integer x = 110
integer y = 124
integer width = 123
integer height = 92
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_routsaledet_ymd"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type pb_2 from picturebutton within w_orsalesaleman_r3
event mousemove pbm_mousemove
integer x = 3922
integer y = 60
integer width = 187
integer height = 144
integer taborder = 300
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

choose case is_dw
	case "dw_1"
		ldw_sel = dw_1
	case "dw_3"
		ldw_sel = dw_3
	case "dw_4"
		ldw_sel = dw_4
	case else
		MessagebOx("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose

if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			ldw_sel.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type cbx_team from checkbox within w_orsalesaleman_r3
integer x = 2537
integer y = 148
integer width = 59
integer height = 56
integer taborder = 100
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

if this.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if

end event

type st_3 from statictext within w_orsalesaleman_r3
integer x = 1321
integer y = 128
integer width = 261
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

type dw_cust from datawindow within w_orsalesaleman_r3
integer x = 1586
integer y = 124
integer width = 617
integer height = 88
integer taborder = 220
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type cbx_inside from checkbox within w_orsalesaleman_r3
integer x = 3095
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

type rb_1 from radiobutton within w_orsalesaleman_r3
integer x = 2546
integer y = 276
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

type rb_2 from radiobutton within w_orsalesaleman_r3
integer x = 2546
integer y = 336
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

type rb_3 from radiobutton within w_orsalesaleman_r3
integer x = 2958
integer y = 276
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

type dw_3 from datawindow within w_orsalesaleman_r3
integer x = 603
integer y = 572
integer width = 3502
integer height = 832
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsalesalemanrep_r4"
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
datetime ldt_orderdate
decimal  ldc_amount
long     ll_row

ll_row  = this.getrow()

ls_custno     = this.object.cust_no[ll_row]
ls_scenecode  = this.object.scene_code[ll_row]
ldt_orderdate = this.object.order_date[ll_row]
//ldc_amount    = this.object.sale_amount[ll_row]

dw_4.reset()
dw_4.retrieve( ls_custno, ls_scenecode, ldt_orderdate )

end event

type cbx_1 from checkbox within w_orsalesaleman_r3
integer x = 3223
integer y = 340
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
	
	cbx_rout.enabled = false
	cb_rout.enabled  = false
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

	cbx_rout.enabled = true
	cb_rout.enabled  = true
end if

end event

type em_3 from editmask within w_orsalesaleman_r3
integer x = 2816
integer y = 336
integer width = 375
integer height = 68
integer taborder = 50
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

type dw_4 from datawindow within w_orsalesaleman_r3
integer x = 599
integer y = 1420
integer width = 3502
integer height = 764
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsalesalemanrep_r5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_output from checkbox within w_orsalesaleman_r3
integer x = 3095
integer y = 60
integer width = 489
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "출고분 제외"
boolean checked = true
end type

type gb_4 from groupbox within w_orsalesaleman_r3
integer x = 2231
integer width = 1449
integer height = 232
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

