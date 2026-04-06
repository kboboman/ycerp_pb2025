$PBExportHeader$w_oecustdiary_m2.srw
$PBExportComments$일일업무
forward
global type w_oecustdiary_m2 from w_inheritance
end type
type em_2 from editmask within w_oecustdiary_m2
end type
type em_1 from editmask within w_oecustdiary_m2
end type
type cbx_1 from checkbox within w_oecustdiary_m2
end type
type dw_3 from datawindow within w_oecustdiary_m2
end type
type st_2 from statictext within w_oecustdiary_m2
end type
type dw_area from datawindow within w_oecustdiary_m2
end type
type st_6 from statictext within w_oecustdiary_m2
end type
type ddlb_fld from dropdownlistbox within w_oecustdiary_m2
end type
type ddlb_dwtitles from dropdownlistbox within w_oecustdiary_m2
end type
type st_7 from statictext within w_oecustdiary_m2
end type
type sle_value from singlelineedit within w_oecustdiary_m2
end type
type cb_1 from commandbutton within w_oecustdiary_m2
end type
type cb_2 from commandbutton within w_oecustdiary_m2
end type
type cb_3 from commandbutton within w_oecustdiary_m2
end type
type cb_5 from commandbutton within w_oecustdiary_m2
end type
type st_3 from statictext within w_oecustdiary_m2
end type
type st_4 from statictext within w_oecustdiary_m2
end type
type dw_4 from datawindow within w_oecustdiary_m2
end type
type dw_5 from datawindow within w_oecustdiary_m2
end type
type cbx_2 from checkbox within w_oecustdiary_m2
end type
type dw_6 from datawindow within w_oecustdiary_m2
end type
type st_1 from statictext within w_oecustdiary_m2
end type
type cbx_3 from checkbox within w_oecustdiary_m2
end type
type rb_1 from radiobutton within w_oecustdiary_m2
end type
type rb_2 from radiobutton within w_oecustdiary_m2
end type
type rb_3 from radiobutton within w_oecustdiary_m2
end type
type cbx_4 from checkbox within w_oecustdiary_m2
end type
type dw_7 from datawindow within w_oecustdiary_m2
end type
type cbx_5 from checkbox within w_oecustdiary_m2
end type
type st_5 from statictext within w_oecustdiary_m2
end type
type ddlb_op from dropdownlistbox within w_oecustdiary_m2
end type
end forward

global type w_oecustdiary_m2 from w_inheritance
integer x = 23
integer y = 84
integer width = 4453
integer height = 2432
string title = "일일업무(w_oecustdiary_m2)"
em_2 em_2
em_1 em_1
cbx_1 cbx_1
dw_3 dw_3
st_2 st_2
dw_area dw_area
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_3 st_3
st_4 st_4
dw_4 dw_4
dw_5 dw_5
cbx_2 cbx_2
dw_6 dw_6
st_1 st_1
cbx_3 cbx_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cbx_4 cbx_4
dw_7 dw_7
cbx_5 cbx_5
st_5 st_5
ddlb_op ddlb_op
end type
global w_oecustdiary_m2 w_oecustdiary_m2

type variables
st_print i_print
string i_dw, is_salesman
datawindowchild idwc_user, idwc_cust, idwc_custnm, idwc_area

end variables

on w_oecustdiary_m2.create
int iCurrent
call super::create
this.em_2=create em_2
this.em_1=create em_1
this.cbx_1=create cbx_1
this.dw_3=create dw_3
this.st_2=create st_2
this.dw_area=create dw_area
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_3=create st_3
this.st_4=create st_4
this.dw_4=create dw_4
this.dw_5=create dw_5
this.cbx_2=create cbx_2
this.dw_6=create dw_6
this.st_1=create st_1
this.cbx_3=create cbx_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cbx_4=create cbx_4
this.dw_7=create dw_7
this.cbx_5=create cbx_5
this.st_5=create st_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_2
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.dw_4
this.Control[iCurrent+19]=this.dw_5
this.Control[iCurrent+20]=this.cbx_2
this.Control[iCurrent+21]=this.dw_6
this.Control[iCurrent+22]=this.st_1
this.Control[iCurrent+23]=this.cbx_3
this.Control[iCurrent+24]=this.rb_1
this.Control[iCurrent+25]=this.rb_2
this.Control[iCurrent+26]=this.rb_3
this.Control[iCurrent+27]=this.cbx_4
this.Control[iCurrent+28]=this.dw_7
this.Control[iCurrent+29]=this.cbx_5
this.Control[iCurrent+30]=this.st_5
this.Control[iCurrent+31]=this.ddlb_op
end on

on w_oecustdiary_m2.destroy
call super::destroy
destroy(this.em_2)
destroy(this.em_1)
destroy(this.cbx_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.cbx_2)
destroy(this.dw_6)
destroy(this.st_1)
destroy(this.cbx_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cbx_4)
destroy(this.dw_7)
destroy(this.cbx_5)
destroy(this.st_5)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_6, ddlb_fld, ddlb_dwtitles )

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)

dw_3.visible  = false
dw_7.visible  = false
cbx_1.visible = false

string ls_today
em_2.text = string(today(),"yyyy/mm/dd")
ls_today  = string(today(),"yyyy/mm/dd")

SELECT top 1 convert(char(10),DATEADD(year, -1, :ls_today), 111) INTO :ls_today FROM login;
em_1.text = ls_today		// string(today(),"yyyy/mm/01")

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", " ")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = " "

// 전체거래처
dw_4.settransobject(sqlca)
dw_4.insertrow(0)  

// 거래처
dw_4.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
//idwc_cust.insertrow(1)
//idwc_cust.setitem(1, "cust_no", "%")
//idwc_cust.setitem(1, "cust_name", "전체")
//dw_4.object.cust_no[1] = "%" // 전체
//idwc_cust.accepttext()

// 거래처명
dw_4.getchild("cust_name", idwc_custnm)
idwc_custnm.settransobject(sqlca)
//idwc_custnm.insertrow(1)
//idwc_custnm.setitem(1, "cust_no", "%")
//idwc_custnm.setitem(1, "cust_name", "전체")
//dw_4.object.cust_no[1] = "%" // 전체
//idwc_custnm.accepttext()

// 담당자
dw_2.settransobject(sqlca)
dw_2.insertrow(1)

dw_2.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_2.object.user[1] = '%'		// 전체

dw_5.insertrow(0)		// 거래처 상세

end event

event resize;call super::resize;//
dw_6.height = newheight - 452

dw_5.width  = newwidth  - 1258

dw_1.width  = newwidth  - 1427
dw_1.height = newheight - 1036

// 주행거리
dw_7.x      = dw_6.x
dw_7.y      = dw_6.y
dw_7.width  = dw_6.width
dw_7.height = dw_6.height

end event

type pb_save from w_inheritance`pb_save within w_oecustdiary_m2
integer x = 3950
integer y = 68
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
long   ll_row
string ls_custnm, ls_interview

if cbx_2.checked = true then
	cbx_2.checked = false
	cbx_2.triggerevent( clicked! )
end if

dw_1.accepttext()

for ll_row = 1 to dw_1.rowcount()
	ls_custnm   = dw_1.object.cust_name[ll_row]
	if LeftA(ls_custnm,1) = "*" then
		dw_1.object.cust_name[ll_row] = RightA(ls_custnm, LenA(ls_custnm) - 1)
	end if
	
	ls_interview = dw_1.object.interview[ll_row]
	if isnull(ls_interview) or ls_interview = "" then
		dw_1.scrolltorow(ll_row)
		MessageBox("확인","면담자는 반드시 입력해야 합니다.")
		RETURN
	end if
next

wf_update1( dw_1, 'Y')

end event

type dw_1 from w_inheritance`dw_1 within w_oecustdiary_m2
integer x = 1390
integer y = 1008
integer width = 2994
integer height = 1284
string dataobject = "d_oecustdiary_m2"
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

i_dw = "dw_1"

end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;// DataWinodw AutoSelection = true 대체

choose case dwo.name
	case "contents"
		this.SelectText(1, LenA(GetText()))		// 전체 선택
end choose
end event

type st_title from w_inheritance`st_title within w_oecustdiary_m2
integer x = 46
integer y = 64
integer width = 923
integer height = 140
string text = "일일업무 관리"
end type

type st_tips from w_inheritance`st_tips within w_oecustdiary_m2
end type

type pb_compute from w_inheritance`pb_compute within w_oecustdiary_m2
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_oecustdiary_m2
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oecustdiary_m2
integer x = 4151
integer y = 68
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oecustdiary_m2
integer x = 3758
integer y = 68
integer taborder = 150
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print   l_print
 
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_zoom, ls_salesman, ls_custno, ls_sdate, ls_edate
DataWindowChild ldwc_prt
DataWindow dw_prt

// 일일업무 리스트
//dw_3.visible = true
dw_prt  = dw_3
ls_zoom = "95"

//dw_3.getchild("dw_1", ldwc_prt)
if dw_prt.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 자료가 존재하지 않습니다.")
end if

l_print.st_datawindow  = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 일일업무 일지를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=' + ls_zoom
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

dw_prt.visible = false

end event

type pb_cancel from w_inheritance`pb_cancel within w_oecustdiary_m2
boolean visible = false
integer x = 2482
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_oecustdiary_m2
integer x = 3566
integer y = 68
integer taborder = 170
end type

event pb_delete::clicked;call super::clicked;// 삭제
dwitemstatus l_status
string ls_order_no, ls_scene_no, ls_userid
long   ll_row

if dw_1.rowcount() < 1 then return	

ll_row = dw_1.getrow()

//if	dw_1.object.sw_modify[ll_row] = "X" then
//	MessageBox("확인","한번 등록한 내용은 삭제 할 수 없습니다.")
//	RETURN
//end if

ls_userid = dw_1.object.user_id[ll_row]
if gs_userid <> ls_userid then
	if GF_PERMISSION('일일업무_관리', gs_userid) = "Y" then
	else
		MessageBox("확인","등록자만 삭제 할 수 있습니다.")
		RETURN
	end if
end if

if MessageBox("확인","삭제하시겠습니까?",information!, OKCancel!, 2) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "D", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
l_status = dw_1.getitemstatus(dw_1.getrow(), 0, primary!)
if l_status = newmodified! then
	dw_1.deleterow( dw_1.getrow() )
else
	dw_1.deleterow( dw_1.getrow() )
	wf_update1(dw_1, "Y")
end if



end event

type pb_insert from w_inheritance`pb_insert within w_oecustdiary_m2
integer x = 3374
integer y = 68
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;call super::clicked;// 추가
long	 ll_row
string ls_custno, ls_custnm, ls_userid, ls_usernm
datawindowchild ldwc_user

// 작성일자
if MessageBox("확인",em_2.text + " 자 일일업무 내용입니까?.", Exclamation!, YesNo!, 1) = 2 then
	MessageBox("확인","일일업무 작성일자를 수정하시기 바랍니다.")
	em_2.setfocus()
	RETURN
end if

// 담당자
dw_2.getchild('user', ldwc_user)
ldwc_user.accepttext()

ls_userid = dw_2.object.user[1]
ls_usernm = ldwc_user.getitemstring( ldwc_user.getrow(), "user_name")
if isnull(ls_userid) or ls_userid = "" or ls_userid = "%" then
	MessageBox("확인","담당자(전체)를 확인 하시기 바랍니다.")
	dw_2.setfocus()
	RETURN
end if

ll_row = dw_1.insertrow(0)
dw_1.object.contents[ll_row] = "~r~n~r~n~r~n~r~n~r~n"
dw_1.scrolltorow(ll_row)

// 거래처
if MessageBox("확인","신규 개척 거래선입니까?.", Exclamation!, YesNo!, 2) = 1 then
	dw_1.object.cust_name.TabSequence = 10
	dw_1.object.sw_modify[ll_row] = "Y"

	ls_custno = ""
	ls_custnm = ""
	dw_1.SetColumn('cust_name')
else
	ls_custno = dw_4.object.cust_no[1]
	if isnull(ls_custno) or ls_custno = "" then
		MessageBox("확인","거래처를 확인 하시기 바랍니다.")
		RETURN
	else
		SELECT l.user_id, l.user_name, c.cust_name INTO :ls_userid, :ls_usernm, :ls_custnm
		  FROM customer C
				 LEFT OUTER JOIN login L ON c.salesman = l.user_id
		 WHERE c.cust_no  = :ls_custno;
		if isnull(ls_custnm) or ls_custnm = "" then
			MessageBox("확인","거래처를 확인 하시기 바랍니다.")
			RETURN
		end if
	end if
	dw_1.SetColumn('contents')
end if

dw_1.object.diary_date[ll_row] = DateTime( date(em_2.text), time("0") )	// gdt_today
dw_1.object.cust_no[ll_row]    = ls_custno
dw_1.object.cust_name[ll_row]  = ls_custnm
dw_1.object.salesman[ll_row]   = ls_userid
dw_1.object.user_name[ll_row]  = ls_usernm
dw_1.object.user_id[ll_row]    = gs_userid

dw_1.setfocus()



end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oecustdiary_m2
integer x = 3182
integer y = 68
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_salesman, ls_custno, ls_sdate, ls_edate

dw_2.accepttext()
dw_4.accepttext()

ls_salesman = dw_2.object.user[1]
ls_custno   = dw_4.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then ls_custno = "%"
if cbx_4.checked = true then ls_custno = "%"

ls_sdate  = em_1.text
ls_edate  = em_2.text

// 일일업무 리스트
dw_3.reset()
dw_3.retrieve( ls_custno, ls_sdate, ls_edate, ls_salesman )

dw_6.reset()
dw_6.retrieve( ls_salesman, "%", ls_sdate, ls_edate )
if dw_6.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 자료가 존재하지 않습니다.")
end if

cbx_4.triggerevent( clicked! )
cbx_5.triggerevent( clicked! )

end event

type gb_3 from w_inheritance`gb_3 within w_oecustdiary_m2
integer x = 1285
integer y = 20
integer width = 1847
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_oecustdiary_m2
integer x = 37
integer y = 256
integer width = 4343
integer height = 148
integer taborder = 100
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oecustdiary_m2
integer x = 3150
integer y = 20
integer width = 1225
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oecustdiary_m2
integer x = 2144
integer y = 140
integer width = 667
integer height = 76
integer taborder = 80
string dataobject = "d_whlogin_c3"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;// 담당자
string ls_salesman, ls_usernm
datawindowchild ldwc_cust, ldwc_custnm

debugbreak()
this.accepttext()

dw_4.object.cust_no[1]   = ""
dw_4.object.cust_name[1] = ""

dw_4.getchild("cust_no", ldwc_cust)
dw_4.getchild("cust_name", ldwc_custnm)

dw_2.getchild("user", idwc_user)

ls_salesman = idwc_user.getitemstring( idwc_user.getrow(), "user_name" )
if isnull(ls_salesman) or ls_salesman = "" then
else
	if ls_salesman = "전체" then
		ldwc_custnm.setfilter( "" )
		ldwc_custnm.filter()
		ldwc_cust.setfilter( "" )
		ldwc_cust.filter()
	else
		ldwc_custnm.setfilter( "user_name = '" + ls_salesman + "'" )
		ldwc_custnm.filter()
		ldwc_cust.setfilter( "user_name = '" + ls_salesman + "'" )
		ldwc_cust.filter()
	end if	
end if

	

end event

type em_2 from editmask within w_oecustdiary_m2
integer x = 2505
integer y = 60
integer width = 357
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
alignment alignment = center!
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

type em_1 from editmask within w_oecustdiary_m2
integer x = 2144
integer y = 60
integer width = 357
integer height = 76
integer taborder = 70
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
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	em_2.text = string(date(message.stringparm))
end if

end event

type cbx_1 from checkbox within w_oecustdiary_m2
integer x = 3854
integer y = 428
integer width = 535
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
string text = "등록자별 조회"
end type

event clicked;// 등록자별 조회(미완성)

is_salesman   = dw_2.object.user[1]		// 담당자저장
if is_salesman = "%" then
	is_salesman = ""
	this.checked = false
	RETURN
end if

if this.checked = true then
	pb_print.enabled = false
	cbx_4.checked = true			// 전체보기
	dw_2.object.user[1] = "%" 	// 담당자
	pb_retrieve.triggerevent( clicked! )
	
	dw_1.setfilter( "user_id = '" + is_salesman + "'" )
	dw_1.filter()
	dw_6.setfilter( "user_id = '" + is_salesman + "'" )
	dw_6.filter()
else
	pb_print.enabled = true
	cbx_4.checked = false					// 전체보기
	dw_2.object.user[1] = is_salesman 	// 담당자
	pb_retrieve.triggerevent( clicked! )

	dw_1.setfilter( "" )
	dw_1.filter()
	dw_6.setfilter( "" )
	dw_6.filter()
end if

dw_2.object.user[1] = is_salesman 	// 담당자

end event

type dw_3 from datawindow within w_oecustdiary_m2
integer x = 1042
integer y = 40
integer width = 96
integer height = 76
integer taborder = 50
boolean bringtotop = true
string title = "d_oecustdiary_r2"
string dataobject = "d_oecustdiary_r21"
boolean livescroll = true
end type

type st_2 from statictext within w_oecustdiary_m2
integer x = 1312
integer y = 60
integer width = 521
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oecustdiary_m2
integer x = 1312
integer y = 140
integer width = 521
integer height = 84
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

type st_6 from statictext within w_oecustdiary_m2
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_oecustdiary_m2
integer x = 274
integer y = 296
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oecustdiary_m2
integer x = 315
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

type st_7 from statictext within w_oecustdiary_m2
integer x = 773
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

type sle_value from singlelineedit within w_oecustdiary_m2
integer x = 1262
integer y = 304
integer width = 517
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

type cb_1 from commandbutton within w_oecustdiary_m2
integer x = 1792
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

choose case i_dw
	case "dw_6"		
		arg_dw = dw_6
	case "dw_1"		
		arg_dw = dw_1
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oecustdiary_m2
integer x = 1957
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

choose case i_dw
	case "dw_6"		
		arg_dw = dw_6
		arg_dw.setsort( "diary_date D, cust_name A, user_name A" )
		arg_dw.sort()
	case "dw_1"		
		arg_dw = dw_1
		arg_dw.setsort( "diary_date D" )
		arg_dw.sort()
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oecustdiary_m2
integer x = 2121
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

choose case i_dw
	case "dw_6"		
		arg_dw = dw_6
	case "dw_1"		
		arg_dw = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oecustdiary_m2
integer x = 2286
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

choose case i_dw
	case "dw_6"		
		arg_dw = dw_6
	case "dw_1"		
		arg_dw = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_3 from statictext within w_oecustdiary_m2
integer x = 1838
integer y = 60
integer width = 302
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
string text = "업무일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_oecustdiary_m2
integer x = 1838
integer y = 140
integer width = 302
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_oecustdiary_m2
integer x = 1390
integer y = 416
integer width = 2331
integer height = 88
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_custddw_c"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// 거래처 선택
string ls_sdate, ls_edate, ls_custno, ls_custname, ls_salesman, ls_teamcode, ls_teammgr

This.AcceptText()
ls_sdate = em_1.text
ls_edate = em_2.text

//===========================================================================//
// 거래처담당자 확인
//===========================================================================//
dw_5.reset()
dw_5.insertrow(0)
SELECT top 1 cust_no, cust_name INTO :ls_custno, :ls_custname 
  FROM customer 
 WHERE ( cust_no = :data OR cust_name = :data );

choose case dwo.name
	case "cust_no"
		this.object.cust_name[1] = ls_custname		// 거래처명
	case "cust_name"
		this.object.cust_no[1]   = ls_custno		// 거래처코드
end choose	

if isnull(ls_custno) or ls_custno = "" or isnull(ls_custname) or ls_custname = "" then
	Messagebox("확인", "거래처를 선택하시기 바랍니다.")
	dw_4.setfocus()
	RETURN
end if

SELECT c.salesman,   t.team_code,  t.team_manager
  INTO :ls_salesman, :ls_teamcode, :ls_teammgr
  FROM customer c
       LEFT OUTER JOIN login l  ON c.salesman  = l.user_id 
       LEFT OUTER JOIN team  t  ON l.team_code = t.team_code
 WHERE c.cust_no = :ls_custno;

if isnull(ls_salesman) or ls_salesman = "" then
	dw_4.setfocus()
	RETURN
end if
dw_5.reset()
dw_5.retrieve( ls_custno )
//===========================================================================//


dw_1.reset()
dw_1.retrieve( ls_custno, ls_sdate, ls_edate, ls_salesman )

dw_4.setfocus()	// 목록

end event

type dw_5 from datawindow within w_oecustdiary_m2
integer x = 1390
integer y = 512
integer width = 3163
integer height = 412
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdscene_t"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_oecustdiary_m2
integer x = 4009
integer y = 936
integer width = 389
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
string text = "수정모드"
end type

event clicked;// 수정모드
long ll_row

for ll_row = 1 to dw_1.rowcount()
	if this.checked = true then
		dw_1.object.sw_modify[ll_row] = "Y"
	else
		dw_1.object.sw_modify[ll_row] = "X"
	end if
next

end event

type dw_6 from datawindow within w_oecustdiary_m2
integer x = 37
integer y = 424
integer width = 1330
integer height = 1868
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oecustdiary_m2t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_custno, ls_custnm, ls_sdate, ls_edate, ls_salesman

ls_sdate = em_1.text
ls_edate = em_2.text

dw_2.accepttext()
ls_salesman = dw_2.object.user[1]
if isnull(ls_salesman) or ls_salesman = "" then ls_salesman = "%"

i_dw = "dw_6"
choose case dwo.name
	case "cust_name"
		ls_custno = this.object.cust_no[row]
		ls_custnm = this.object.cust_name[row]
		
		dw_4.object.cust_no[1]   = ls_custno
		if ls_custnm = "신규개척" then
			dw_4.object.cust_no[1]   = ""
			dw_4.object.cust_name[1] = ""
		else
			dw_4.object.cust_name[1] = ls_custnm
		end if
	
		// 주행거리
		dw_7.reset()
		dw_7.retrieve( ls_custno, ls_sdate, ls_edate, ls_salesman )


		// 거래처상세
		dw_5.reset()
		if dw_5.retrieve( ls_custno ) < 1 then
			dw_5.insertrow(0)
		end if

		// 거래처내용
		dw_1.reset()
		dw_1.retrieve( ls_custno, ls_sdate, ls_edate, ls_salesman )
		if dw_1.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 자료가 존재하지 않습니다.")
		end if
end choose

end event

type st_1 from statictext within w_oecustdiary_m2
integer x = 1408
integer y = 936
integer width = 1911
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79416533
string text = "1. 거래처 선택,  2. 내용은 필수 입력사항(엔터 키는 줄 바꿈)"
boolean focusrectangle = false
end type

type cbx_3 from checkbox within w_oecustdiary_m2
integer x = 3502
integer y = 936
integer width = 489
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "거래처 변경"
end type

event clicked;// 거래처 변경
gs_whcustret_str lst_whcustret
string ls_custno, ls_custnm, ls_userid, ls_usernm
long   ll_row

ll_row = dw_1.getrow()
if ll_row < 1 and ll_row > dw_1.rowcount() then RETURN

OpenWithParm(w_whcustret_w, lst_whcustret)
lst_whcustret = Message.PowerObjectParm

if lst_whcustret.cust_chk = 'Y' then
	ls_custno = lst_whcustret.cust_no
	ls_custnm = lst_whcustret.cust_name
	
	if isnull(ls_custno) or ls_custno = "" then
	else
		SELECT l.user_id, l.user_name INTO :ls_userid, :ls_usernm
		  FROM customer C
		       LEFT OUTER JOIN login L ON c.salesman = l.user_id
	    WHERE c.cust_no  = :ls_custno;
		 
		//if gs_userid = ls_userid then
			dw_1.object.salesman[ll_row]  = ls_userid
			dw_1.object.user_name[ll_row] = ls_usernm

			dw_1.SetItem(ll_row, 'cust_no',   ls_custno)
			dw_1.SetItem(ll_row, 'cust_name', ls_custnm)
		//else
		//	this.checked = false
		//	MessageBox("확인","해당 거래처 담당자만 변경 가능합니다.")
		//end if
	end if
end if

this.checked = false

end event

type rb_1 from radiobutton within w_oecustdiary_m2
integer x = 2894
integer y = 56
integer width = 219
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
string text = "전일"
end type

event clicked;// 전일
datetime ldtday

if this.checked = true then
	SELECT top 1 DATEADD(day, -1, getdate()) INTO :ldtday FROM login;
	em_1.text = string(ldtday, 'yyyy/mm/dd')
	em_2.text = string(ldtday, 'yyyy/mm/dd')
else
	SELECT top 1 getdate() INTO :ldtday FROM login;
	em_1.text = string(today(), 'yyyy/mm/dd')
	em_2.text = string(today(), 'yyyy/mm/dd')	
end if

end event

type rb_2 from radiobutton within w_oecustdiary_m2
integer x = 2894
integer y = 112
integer width = 224
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
string text = "당일"
end type

event clicked;// 오늘
datetime ldtday

if this.checked = true then
	SELECT top 1 getdate() INTO :ldtday FROM login;
	em_1.text = string(ldtday, 'yyyy/mm/dd')
	em_2.text = string(ldtday, 'yyyy/mm/dd')
else
	SELECT top 1 getdate() INTO :ldtday FROM login;
	em_1.text = string(today(), 'yyyy/mm/dd')
	em_2.text = string(today(), 'yyyy/mm/dd')	
end if

end event

type rb_3 from radiobutton within w_oecustdiary_m2
integer x = 2894
integer y = 168
integer width = 224
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
string text = "1년"
boolean checked = true
end type

event clicked;// 1년
string ls_today
em_2.text = string(today(),"yyyy/mm/dd")
ls_today  = string(today(),"yyyy/mm/dd")

SELECT top 1 convert(char(10),DATEADD(year, -1, :ls_today), 111) INTO :ls_today FROM login;
em_1.text = ls_today		// string(today(),"yyyy/mm/01")

end event

type cbx_4 from checkbox within w_oecustdiary_m2
integer x = 3982
integer y = 312
integer width = 375
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
string text = "전체보기"
end type

event clicked;// 전체보기
string ls_sdate, ls_edate, ls_custno, ls_salesman

ls_sdate  = em_1.text
ls_edate  = em_2.text
ls_custno = "%"

dw_4.object.cust_no[1]   = ""
dw_4.object.cust_name[1] = ""

dw_2.accepttext()
ls_salesman = dw_2.object.user[1]
if isnull(ls_salesman) or ls_salesman = "" then ls_salesman = "%"

dw_1.reset()
if this.checked = true then
	dw_4.enabled = false
	dw_6.enabled = false
	dw_area.enabled = false

	dw_1.retrieve( ls_custno, ls_sdate, ls_edate, ls_salesman )
	if dw_1.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 자료가 존재하지 않습니다.")
	end if
else
	dw_4.enabled = true
	dw_6.enabled = true
	dw_area.enabled = true
end if

end event

type dw_7 from datawindow within w_oecustdiary_m2
integer x = 160
integer y = 800
integer width = 1029
integer height = 1068
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_oecustdiary_m2_mile"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_5 from checkbox within w_oecustdiary_m2
integer x = 3570
integer y = 312
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
string text = "주행거리"
end type

event clicked;// 주행거리
string ls_salesman, ls_custno, ls_sdate, ls_edate

dw_2.accepttext()
dw_4.accepttext()

debugbreak()
ls_salesman = dw_2.object.user[1]
ls_custno   = dw_4.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then ls_custno = "%"

ls_sdate  = em_1.text
ls_edate  = em_2.text

// 주행거리
dw_7.reset()
dw_7.retrieve( ls_custno, ls_sdate, ls_edate, ls_salesman )

if this.checked = true then
	dw_7.visible = true
else
	dw_7.visible = false
end if

end event

type st_5 from statictext within w_oecustdiary_m2
integer x = 59
integer y = 232
integer width = 859
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "거래처명 * 마크: 신규거래처."
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_oecustdiary_m2
integer x = 951
integer y = 300
integer width = 302
integer height = 500
integer taborder = 130
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

