$PBExportHeader$w_orsaleitemsaleman_r.srw
$PBExportComments$영업사원별 물품별 수주현황(1998/05/13, 정재수)
forward 
global type w_orsaleitemsaleman_r from w_inheritance
end type
type st_1 from statictext within w_orsaleitemsaleman_r
end type
type em_1 from editmask within w_orsaleitemsaleman_r
end type
type em_2 from editmask within w_orsaleitemsaleman_r
end type
type pb_1 from picturebutton within w_orsaleitemsaleman_r
end type
type st_6 from statictext within w_orsaleitemsaleman_r
end type
type dw_area from datawindow within w_orsaleitemsaleman_r
end type
type st_7 from statictext within w_orsaleitemsaleman_r
end type
type cbx_team from checkbox within w_orsaleitemsaleman_r
end type
type dw_sales from datawindow within w_orsaleitemsaleman_r
end type
type st_2 from statictext within w_orsaleitemsaleman_r
end type
type dw_3 from datawindow within w_orsaleitemsaleman_r
end type
type st_8 from statictext within w_orsaleitemsaleman_r
end type
type ddlb_fld from dropdownlistbox within w_orsaleitemsaleman_r
end type
type ddlb_dwtitles from dropdownlistbox within w_orsaleitemsaleman_r
end type
type st_9 from statictext within w_orsaleitemsaleman_r
end type
type ddlb_op from dropdownlistbox within w_orsaleitemsaleman_r
end type
type sle_value from singlelineedit within w_orsaleitemsaleman_r
end type
type cb_filteron from commandbutton within w_orsaleitemsaleman_r
end type
type cb_filteroff from commandbutton within w_orsaleitemsaleman_r
end type
type cb_1 from commandbutton within w_orsaleitemsaleman_r
end type
type cb_2 from commandbutton within w_orsaleitemsaleman_r
end type
type cbx_inside from checkbox within w_orsaleitemsaleman_r
end type
type gb_4 from groupbox within w_orsaleitemsaleman_r
end type
end forward

global type w_orsaleitemsaleman_r from w_inheritance
integer y = 112
integer width = 4722
integer height = 2412
string title = "물품별 수주현황(영업사원별)(w_orsaleitemsaleman_r)"
st_1 st_1
em_1 em_1
em_2 em_2
pb_1 pb_1
st_6 st_6
dw_area dw_area
st_7 st_7
cbx_team cbx_team
dw_sales dw_sales
st_2 st_2
dw_3 dw_3
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
cbx_inside cbx_inside
gb_4 gb_4
end type
global w_orsaleitemsaleman_r w_orsaleitemsaleman_r

type variables
string is_sale_flag, is_ret
datawindowchild idwc_area, idwc_cust, idwc_user
end variables

on w_orsaleitemsaleman_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.pb_1=create pb_1
this.st_6=create st_6
this.dw_area=create dw_area
this.st_7=create st_7
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.st_2=create st_2
this.dw_3=create dw_3
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cbx_inside=create cbx_inside
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.st_6
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.cbx_team
this.Control[iCurrent+9]=this.dw_sales
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.dw_3
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.st_9
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_filteron
this.Control[iCurrent+19]=this.cb_filteroff
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.cbx_inside
this.Control[iCurrent+23]=this.gb_4
end on

on w_orsaleitemsaleman_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.pb_1)
destroy(this.st_6)
destroy(this.dw_area)
destroy(this.st_7)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cbx_inside)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

dw_2.visible = false

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
dw_3.insertrow(0)  
//dw_1.enabled = false
//dw_1.object.cust_no.Background.Color = 67108864

dw_3.SetTransObject(SQLCA)
dw_3.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
if GF_Permission("물품별 수주현황(영업사원별)(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_3.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( gs_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_3.object.cust_no[1] = "ALL"
end if

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
if GF_Permission("물품별 수주현황(영업사원별)(ALL)", gs_userid) = "Y" then
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
		idwc_cust.setfilter( "salesman = '" + gs_userid + "' OR cust_no = 'ALL' " )
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


end event

type pb_save from w_inheritance`pb_save within w_orsaleitemsaleman_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleitemsaleman_r
integer x = 32
integer y = 448
integer width = 4599
integer height = 1832
integer taborder = 0
string dataobject = "d_orsaleitemsaleman_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_orsaleitemsaleman_r
integer y = 24
integer width = 1705
integer height = 136
string text = "물품별 수주현황(영업사원별)"
end type

type st_tips from w_inheritance`st_tips within w_orsaleitemsaleman_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleitemsaleman_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaleitemsaleman_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_orsaleitemsaleman_r
integer x = 4585
integer taborder = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleitemsaleman_r
integer x = 4187
integer taborder = 50
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

dw_1.ShareData( dw_2 )
if dw_2.rowcount() < 1 then RETURN

//l_print.name = 'd_orsalesalemanrep_r1'
l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc  = " 이 프로그램은 제품별 수주현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleitemsaleman_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleitemsaleman_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleitemsaleman_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleitemsaleman_r
integer x = 3995
integer taborder = 40
end type

event pb_retrieve::clicked;//
string  ls_area, ls_custno, ls_sdate, ls_edate, ls_team, ls_salesman, ls_inside

if em_1.text = "" then
	MessageBox("확인","주문기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = "" then
	MessageBox("확인","주문기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	MessageBox("확인","주문기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_sdate = em_1.text
ls_edate = em_2.text

// 사업장
dw_area.accepttext()
ls_area  = trim(dw_area.object.area[1])
ls_area  = LeftA(ls_area,1) + "%"

// 거래처
dw_3.accepttext()
ls_custno = dw_3.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_3.setfocus()
	RETURN
end if

// 담당자
dw_sales.accepttext()
ls_salesman = dw_sales.object.user[1]

// 팀조회
if cbx_team.checked = true then
	ls_team = "%"
else
	ls_team = "N"
end if

// 계열사 제외
if cbx_inside.checked = true then
	ls_inside = "N"
else
	ls_inside = "%"
end if

dw_1.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_salesman, ls_team, ls_inside )

if dw_1.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   RETURN
end if

dw_1.setfocus()
	
end event

type gb_3 from w_inheritance`gb_3 within w_orsaleitemsaleman_r
integer x = 2702
integer y = 0
integer width = 1234
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleitemsaleman_r
integer y = 244
integer width = 4599
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleitemsaleman_r
integer x = 3963
integer y = 0
integer width = 846
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleitemsaleman_r
integer x = 82
integer y = 180
integer width = 101
integer height = 68
integer taborder = 0
string dataobject = "d_orsaleitemsaleman_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_orsaleitemsaleman_r
integer x = 2725
integer y = 44
integer width = 297
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
string text = "주문기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsaleitemsaleman_r
integer x = 3026
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

type em_2 from editmask within w_orsaleitemsaleman_r
integer x = 3429
integer y = 44
integer width = 393
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

type pb_1 from picturebutton within w_orsaleitemsaleman_r
event mousemove pbm_mousemove
string tag = "파일"
integer x = 4384
integer y = 52
integer width = 187
integer height = 144
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
string powertiptext = "파일로저장시킵니다."
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS","엑셀 (*.XLS), *.XLS," + &
		"텍스트 (*.TXT),*.TXT," + &
		"HTML문서 (*.HTM), *.HTM," + &
		"CSV(쉽표로 분리), *.CSV")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dw_1.SaveAsascii(ls_DocName)
				
		elseif ls_ExpandName = "txt" OR ls_ExpandName = "TXT" then
				dw_1.SaveAsascii(ls_DocName)
				  
		elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" then
					dw_1.SaveAs(ls_DocName, HTMLTable!, TRUE)

		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
					dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if

end event

type st_6 from statictext within w_orsaleitemsaleman_r
integer x = 1806
integer y = 44
integer width = 242
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

type dw_area from datawindow within w_orsaleitemsaleman_r
integer x = 2048
integer y = 44
integer width = 526
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type st_7 from statictext within w_orsaleitemsaleman_r
integer x = 2725
integer y = 128
integer width = 297
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

type cbx_team from checkbox within w_orsaleitemsaleman_r
integer x = 3031
integer y = 144
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

if this.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if

end event

type dw_sales from datawindow within w_orsaleitemsaleman_r
integer x = 3104
integer y = 124
integer width = 329
integer height = 88
integer taborder = 100
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
dw_3.enabled = true
dw_3.object.cust_no.Background.Color = rgb(255, 255, 255)

dw_3.SetTransObject(SQLCA)
dw_3.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("물품별 수주현황(영업사원별)(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_3.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_3.object.cust_no[1] = "ALL"
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

type st_2 from statictext within w_orsaleitemsaleman_r
integer x = 1806
integer y = 128
integer width = 242
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

type dw_3 from datawindow within w_orsaleitemsaleman_r
integer x = 2048
integer y = 124
integer width = 617
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type st_8 from statictext within w_orsaleitemsaleman_r
integer x = 82
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_orsaleitemsaleman_r
integer x = 265
integer y = 296
integer width = 480
integer height = 580
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

type ddlb_dwtitles from dropdownlistbox within w_orsaleitemsaleman_r
integer x = 325
integer y = 304
integer width = 306
integer height = 92
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

type st_9 from statictext within w_orsaleitemsaleman_r
integer x = 782
integer y = 316
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

type ddlb_op from dropdownlistbox within w_orsaleitemsaleman_r
integer x = 955
integer y = 296
integer width = 261
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_orsaleitemsaleman_r
integer x = 1230
integer y = 300
integer width = 581
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_orsaleitemsaleman_r
integer x = 1824
integer y = 296
integer width = 197
integer height = 84
integer taborder = 130
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_orsaleitemsaleman_r
integer x = 2025
integer y = 296
integer width = 197
integer height = 84
integer taborder = 140
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

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_orsaleitemsaleman_r
integer x = 2226
integer y = 296
integer width = 183
integer height = 84
integer taborder = 150
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_orsaleitemsaleman_r
integer x = 2414
integer y = 296
integer width = 183
integer height = 84
integer taborder = 160
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cbx_inside from checkbox within w_orsaleitemsaleman_r
integer x = 3447
integer y = 144
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

type gb_4 from groupbox within w_orsaleitemsaleman_r
integer x = 1783
integer width = 901
integer height = 232
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

