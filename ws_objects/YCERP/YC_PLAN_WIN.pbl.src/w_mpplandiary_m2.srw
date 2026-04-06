$PBExportHeader$w_mpplandiary_m2.srw
$PBExportComments$일일업무(생산)
forward
global type w_mpplandiary_m2 from w_inheritance
end type
type em_2 from editmask within w_mpplandiary_m2
end type
type em_1 from editmask within w_mpplandiary_m2
end type
type cbx_1 from checkbox within w_mpplandiary_m2
end type
type dw_3 from datawindow within w_mpplandiary_m2
end type
type st_2 from statictext within w_mpplandiary_m2
end type
type dw_area from datawindow within w_mpplandiary_m2
end type
type st_6 from statictext within w_mpplandiary_m2
end type
type ddlb_fld from dropdownlistbox within w_mpplandiary_m2
end type
type ddlb_dwtitles from dropdownlistbox within w_mpplandiary_m2
end type
type st_7 from statictext within w_mpplandiary_m2
end type
type ddlb_op from dropdownlistbox within w_mpplandiary_m2
end type
type sle_value from singlelineedit within w_mpplandiary_m2
end type
type cb_1 from commandbutton within w_mpplandiary_m2
end type
type cb_2 from commandbutton within w_mpplandiary_m2
end type
type cb_3 from commandbutton within w_mpplandiary_m2
end type
type cb_5 from commandbutton within w_mpplandiary_m2
end type
type st_3 from statictext within w_mpplandiary_m2
end type
type st_4 from statictext within w_mpplandiary_m2
end type
type dw_4 from datawindow within w_mpplandiary_m2
end type
type dw_5 from datawindow within w_mpplandiary_m2
end type
type cbx_2 from checkbox within w_mpplandiary_m2
end type
type dw_6 from datawindow within w_mpplandiary_m2
end type
type st_1 from statictext within w_mpplandiary_m2
end type
type cbx_3 from checkbox within w_mpplandiary_m2
end type
type rb_1 from radiobutton within w_mpplandiary_m2
end type
type rb_2 from radiobutton within w_mpplandiary_m2
end type
type rb_3 from radiobutton within w_mpplandiary_m2
end type
type cbx_4 from checkbox within w_mpplandiary_m2
end type
type dw_7 from datawindow within w_mpplandiary_m2
end type
type cbx_5 from checkbox within w_mpplandiary_m2
end type
type st_5 from statictext within w_mpplandiary_m2
end type
type cbx_6 from checkbox within w_mpplandiary_m2
end type
type st_8 from statictext within w_mpplandiary_m2
end type
type pb_1 from picturebutton within w_mpplandiary_m2
end type
end forward

global type w_mpplandiary_m2 from w_inheritance
integer x = 23
integer y = 84
integer width = 4754
integer height = 2432
string title = "일일업무(생산)(w_mpplandiary_m2)"
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
ddlb_op ddlb_op
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
cbx_6 cbx_6
st_8 st_8
pb_1 pb_1
end type
global w_mpplandiary_m2 w_mpplandiary_m2

type variables
st_print i_print
string i_dw, is_salesman
datawindowchild idwc_user, idwc_cust, idwc_custnm, idwc_area

end variables

on w_mpplandiary_m2.create
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
this.ddlb_op=create ddlb_op
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
this.cbx_6=create cbx_6
this.st_8=create st_8
this.pb_1=create pb_1
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
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.dw_4
this.Control[iCurrent+20]=this.dw_5
this.Control[iCurrent+21]=this.cbx_2
this.Control[iCurrent+22]=this.dw_6
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.cbx_3
this.Control[iCurrent+25]=this.rb_1
this.Control[iCurrent+26]=this.rb_2
this.Control[iCurrent+27]=this.rb_3
this.Control[iCurrent+28]=this.cbx_4
this.Control[iCurrent+29]=this.dw_7
this.Control[iCurrent+30]=this.cbx_5
this.Control[iCurrent+31]=this.st_5
this.Control[iCurrent+32]=this.cbx_6
this.Control[iCurrent+33]=this.st_8
this.Control[iCurrent+34]=this.pb_1
end on

on w_mpplandiary_m2.destroy
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
destroy(this.ddlb_op)
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
destroy(this.cbx_6)
destroy(this.st_8)
destroy(this.pb_1)
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
idwc_area.setitem(1, "area_name", "시화사업장")

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
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_6.height = newheight - dw_6.y - gb_2.x

dw_5.width  = newwidth  - dw_5.x - gb_2.x

dw_1.width  = newwidth  - dw_1.x - gb_2.x
dw_1.height = newheight - dw_1.y - gb_2.x

// 주행거리
dw_7.x      = dw_6.x
dw_7.y      = dw_6.y
dw_7.width  = dw_6.width
dw_7.height = dw_6.height

end event

type pb_save from w_inheritance`pb_save within w_mpplandiary_m2
integer x = 4087
integer y = 64
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
long   ll_row
string ls_worknm, ls_interview

if cbx_2.checked = true then
	cbx_2.checked = false
	cbx_2.triggerevent( clicked! )
end if

dw_1.accepttext()

for ll_row = 1 to dw_1.rowcount()
	ls_worknm   = dw_1.object.work_name[ll_row]
	if LeftA(ls_worknm,1) = "*" then
		dw_1.object.work_name[ll_row] = RightA(ls_worknm, LenA(ls_worknm) - 1)
	end if
	
//	ls_interview = dw_1.object.interview[ll_row]
//	if isnull(ls_interview) or ls_interview = "" then
//		dw_1.scrolltorow(ll_row)
//		MessageBox("확인","작업자는 반드시 입력해야 합니다.")
//		RETURN
//	end if
next

wf_update1( dw_1, 'Y')

end event

type dw_1 from w_inheritance`dw_1 within w_mpplandiary_m2
integer x = 1390
integer y = 1052
integer width = 3296
integer height = 1240
string dataobject = "d_mpplandiary_m2"
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

type st_title from w_inheritance`st_title within w_mpplandiary_m2
integer x = 32
integer y = 20
integer width = 1216
integer height = 140
string text = "일일업무(생산) 관리"
end type

type st_tips from w_inheritance`st_tips within w_mpplandiary_m2
end type

type pb_compute from w_inheritance`pb_compute within w_mpplandiary_m2
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpplandiary_m2
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpplandiary_m2
integer x = 4288
integer y = 64
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpplandiary_m2
integer x = 3680
integer y = 64
integer taborder = 150
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print   l_print
 
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_zoom
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

type pb_cancel from w_inheritance`pb_cancel within w_mpplandiary_m2
boolean visible = false
integer x = 2482
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpplandiary_m2
integer x = 3488
integer y = 64
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

type pb_insert from w_inheritance`pb_insert within w_mpplandiary_m2
integer x = 3296
integer y = 64
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;call super::clicked;// 추가
long	 ll_row
string ls_workno, ls_worknm, ls_userid, ls_usernm
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
dw_1.object.contents[ll_row]  = "~r~n~r~n~r~n~r~n~r~n"
dw_1.object.contents2[ll_row] = "~r~n~r~n~r~n~r~n~r~n"
dw_1.scrolltorow(ll_row)

// 거래처
if MessageBox("확인","일반작업 입니까?.", Exclamation!, YesNo!, 2) = 1 then
	dw_1.object.work_name.TabSequence = 10
	dw_1.object.sw_modify[ll_row] = "Y"

	ls_workno = ""
	ls_worknm = ""
	dw_1.SetColumn('work_name')
else
	ls_workno = dw_4.object.work_no[1]
	if isnull(ls_workno) or ls_workno = "" then
		MessageBox("확인","작업장을 확인 하시기 바랍니다.")
		RETURN
	else
		SELECT l.user_id, l.user_name, c.work_name INTO :ls_userid, :ls_usernm, :ls_worknm
		  FROM wc C
				 LEFT OUTER JOIN login L ON c.user_id = l.user_id
		 WHERE c.work_no  = :ls_workno;
		if isnull(ls_worknm) or ls_worknm = "" then
			MessageBox("확인","작업장을 확인 하시기 바랍니다.")
			RETURN
		end if
	end if
	dw_1.SetColumn('contents')
end if

dw_1.object.diary_date[ll_row] = DateTime( date(em_2.text), time("0") )	// gdt_today
dw_1.object.work_no[ll_row]    = ls_workno
dw_1.object.work_name[ll_row]  = ls_worknm
dw_1.object.employee[ll_row]   = ls_userid
dw_1.object.user_name[ll_row]  = ls_usernm
dw_1.object.user_id[ll_row]    = gs_userid
dw_1.object.input_name[ll_row] = gs_username

dw_1.setfocus()



end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpplandiary_m2
integer x = 3104
integer y = 64
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_employee, ls_workno, ls_sdate, ls_edate

dw_2.accepttext()
dw_4.accepttext()

ls_employee = dw_2.object.user[1]
ls_workno   = dw_4.object.work_no[1]
if isnull(ls_workno) or ls_workno = "" then ls_workno = "%"
if cbx_4.checked = true then ls_workno = "%"

ls_sdate  = em_1.text
ls_edate  = em_2.text

// 일일업무(생산) 출력
dw_3.reset()
dw_3.retrieve( ls_workno, ls_sdate, ls_edate, ls_employee )

// 일일업무(생산) 리스트
dw_6.reset()
dw_6.retrieve( ls_employee, "%", ls_sdate, ls_edate )
if dw_6.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 자료가 존재하지 않습니다.")
end if

cbx_4.triggerevent( clicked! )
cbx_5.triggerevent( clicked! )

end event

type gb_3 from w_inheritance`gb_3 within w_mpplandiary_m2
integer x = 1303
integer y = 16
integer width = 1737
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_mpplandiary_m2
integer x = 37
integer y = 256
integer width = 4645
integer height = 184
integer taborder = 100
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpplandiary_m2
integer x = 3063
integer y = 16
integer width = 1454
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpplandiary_m2
integer x = 1563
integer y = 136
integer width = 667
integer height = 76
integer taborder = 80
string dataobject = "d_whloginplan_c3"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;// 담당자
string ls_employee, ls_usernm
datawindowchild ldwc_work, ldwc_worknm

debugbreak()
this.accepttext()

dw_4.object.work_no[1]   = ""
dw_4.object.work_name[1] = ""

dw_4.getchild("work_no",   ldwc_work)
dw_4.getchild("work_name", ldwc_worknm)

dw_2.getchild("user", idwc_user)

ls_employee = idwc_user.getitemstring( idwc_user.getrow(), "user_name" )
if isnull(ls_employee) or ls_employee = "" then
else
	if ls_employee = "전체" then
		ldwc_worknm.setfilter( "" )
		ldwc_worknm.filter()
		ldwc_work.setfilter( "" )
		ldwc_work.filter()
	else
		ldwc_worknm.setfilter( "user_name = '" + ls_employee + "'" )
		ldwc_worknm.filter()
		ldwc_work.setfilter( "user_name = '" + ls_employee + "'" )
		ldwc_work.filter()
	end if	
end if

	

end event

type em_2 from editmask within w_mpplandiary_m2
integer x = 2409
integer y = 136
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
//
end event

type em_1 from editmask within w_mpplandiary_m2
integer x = 2409
integer y = 56
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
//	em_2.text = string(date(message.stringparm))
//end if
//
end event

type cbx_1 from checkbox within w_mpplandiary_m2
integer x = 3561
integer y = 360
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

type dw_3 from datawindow within w_mpplandiary_m2
integer x = 50
integer y = 124
integer width = 96
integer height = 76
integer taborder = 50
boolean bringtotop = true
string title = "d_oecustdiary_r2"
string dataobject = "d_mpplandiary_r21"
boolean livescroll = true
end type

type st_2 from statictext within w_mpplandiary_m2
integer x = 1330
integer y = 56
integer width = 238
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

type dw_area from datawindow within w_mpplandiary_m2
integer x = 1568
integer y = 52
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

type st_6 from statictext within w_mpplandiary_m2
integer x = 87
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_mpplandiary_m2
integer x = 274
integer y = 316
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

type ddlb_dwtitles from dropdownlistbox within w_mpplandiary_m2
integer x = 315
integer y = 328
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

type st_7 from statictext within w_mpplandiary_m2
integer x = 773
integer y = 332
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

type ddlb_op from dropdownlistbox within w_mpplandiary_m2
integer x = 942
integer y = 316
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpplandiary_m2
integer x = 1262
integer y = 320
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

type cb_1 from commandbutton within w_mpplandiary_m2
integer x = 1792
integer y = 320
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

type cb_2 from commandbutton within w_mpplandiary_m2
integer x = 1957
integer y = 320
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

type cb_3 from commandbutton within w_mpplandiary_m2
integer x = 2121
integer y = 320
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

type cb_5 from commandbutton within w_mpplandiary_m2
integer x = 2286
integer y = 320
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

type st_3 from statictext within w_mpplandiary_m2
integer x = 2107
integer y = 56
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

type st_4 from statictext within w_mpplandiary_m2
integer x = 1330
integer y = 136
integer width = 238
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

type dw_4 from datawindow within w_mpplandiary_m2
integer x = 1390
integer y = 460
integer width = 2331
integer height = 92
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_planddw_c"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// 작업장 선택
string ls_sdate, ls_edate, ls_workno, ls_workname, ls_employee, ls_teamcode, ls_teammgr

This.AcceptText()
ls_sdate = em_1.text
ls_edate = em_2.text

//===========================================================================//
// 작업장담당자 확인
//===========================================================================//
dw_5.reset()
dw_5.insertrow(0)

SELECT top 1 work_no, work_name, user_id INTO :ls_workno, :ls_workname, :ls_employee
  FROM wc
 WHERE ( work_no = :data OR work_name = :data );

choose case dwo.name
	case "work_no"
		this.object.work_name[1] = ls_workname		// 작업장명
	case "work_name"
		this.object.work_no[1]   = ls_workno		// 작업장코드
end choose	

if isnull(ls_workno) or ls_workno = "" or isnull(ls_workname) or ls_workname = "" then
	Messagebox("확인", "작업장를 선택하시기 바랍니다.")
	dw_4.setfocus()
	RETURN
end if


if isnull(ls_employee) or ls_employee = "" then
	dw_4.setfocus()
	RETURN
end if
dw_5.reset()
dw_5.retrieve( ls_workno )
//===========================================================================//


dw_1.reset()
dw_1.retrieve( ls_workno, ls_sdate, ls_edate, ls_employee )

dw_4.setfocus()	// 목록

end event

type dw_5 from datawindow within w_mpplandiary_m2
integer x = 1390
integer y = 548
integer width = 3296
integer height = 412
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdplan_t"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_mpplandiary_m2
integer x = 4078
integer y = 976
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

type dw_6 from datawindow within w_mpplandiary_m2
integer x = 37
integer y = 460
integer width = 1330
integer height = 1832
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpplandiary_m2t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string   ls_workno, ls_worknm, ls_sdate, ls_edate, ls_employee
long     ll_found,  ll_ID
datetime ldt_diarydate

if isnull( row ) OR row < 1 then RETURN

ls_sdate = em_1.text
ls_edate = em_2.text

dw_2.accepttext()
ls_employee = dw_2.object.user[1]
if isnull(ls_employee) or ls_employee = "" then ls_employee = "%"

i_dw = "dw_6"
//choose case dwo.name
//	case "work_name"
		ll_ID         = this.object.id[row]
		ls_workno     = this.object.work_no[row]
		ls_worknm     = this.object.work_name[row]
		ldt_diarydate = this.object.diary_date[row]
		
		dw_4.object.work_no[1]   = ls_workno
		if ls_worknm = "일반작업" then
			dw_4.object.work_no[1]   = ""
			dw_4.object.work_name[1] = ""
		else
			dw_4.object.work_name[1] = ls_worknm
		end if
	
		// 생산량
		dw_7.reset()
		dw_7.retrieve( ls_workno, ls_sdate, ls_edate, ls_employee )


		// 작업장상세
		dw_5.reset()
		if dw_5.retrieve( ls_workno ) < 1 then
			dw_5.insertrow(0)
		end if

		// 작업장내용
		dw_1.reset()
		dw_1.retrieve( ls_workno, ls_sdate, ls_edate, ls_employee )
		if dw_1.rowcount() < 1 then
			MessageBox("확인","해당하는 조건의 자료가 존재하지 않습니다.")
		else
			ll_found = dw_1.find("id = " + string(ll_ID) + " ", 1, dw_1.rowcount() )
			if ll_found > 0 then
				dw_1.scrolltorow( ll_found )
			end if
		end if
//end choose

end event

type st_1 from statictext within w_mpplandiary_m2
integer x = 1408
integer y = 976
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
string text = "1. 작업장 선택,  2. 내용은 필수 입력사항(엔터 키는 줄 바꿈)"
boolean focusrectangle = false
end type

type cbx_3 from checkbox within w_mpplandiary_m2
integer x = 3570
integer y = 976
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
string text = "작업장 변경"
end type

event clicked;// 거래처 변경
gs_whcustret_str lst_whcustret
string ls_workno, ls_worknm, ls_userid, ls_usernm
long   ll_row

ll_row = dw_1.getrow()
if ll_row < 1 and ll_row > dw_1.rowcount() then RETURN

OpenWithParm(w_whplanret_w, lst_whcustret)
lst_whcustret = Message.PowerObjectParm

if lst_whcustret.cust_chk = 'Y' then
	ls_workno = lst_whcustret.cust_no
	ls_worknm = lst_whcustret.cust_name
	
	if isnull(ls_workno) or ls_workno = "" then
	else
		SELECT l.user_id, l.user_name INTO :ls_userid, :ls_usernm
		  FROM wc C
		       LEFT OUTER JOIN login L ON c.user_id = l.user_id
	    WHERE c.work_no  = :ls_workno;
		 
		//if gs_userid = ls_userid then
			dw_1.object.employee[ll_row]  = ls_userid
			dw_1.object.user_name[ll_row] = ls_usernm

			dw_1.SetItem(ll_row, 'work_no',   ls_workno)
			dw_1.SetItem(ll_row, 'work_name', ls_worknm)
		//else
		//	this.checked = false
		//	MessageBox("확인","해당 거래처 담당자만 변경 가능합니다.")
		//end if
	end if
else
	if MessageBox("확인","일반작업 입니까?.", Exclamation!, YesNo!, 2) = 1 then
		dw_1.object.work_name.TabSequence = 10
		dw_1.object.sw_modify[ll_row] = "Y"
	
		ls_workno = ""
		ls_worknm = "일반작업"
		dw_1.SetColumn('work_name')
	end if	
end if

this.checked = false

end event

type rb_1 from radiobutton within w_mpplandiary_m2
integer x = 2789
integer y = 52
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

type rb_2 from radiobutton within w_mpplandiary_m2
integer x = 2789
integer y = 108
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

type rb_3 from radiobutton within w_mpplandiary_m2
integer x = 2789
integer y = 164
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

type cbx_4 from checkbox within w_mpplandiary_m2
integer x = 3561
integer y = 300
integer width = 375
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
string text = "전체보기"
end type

event clicked;// 전체보기
string ls_sdate, ls_edate, ls_workno, ls_employee

ls_sdate  = em_1.text
ls_edate  = em_2.text
ls_workno = "%"

dw_4.object.work_no[1]   = ""
dw_4.object.work_name[1] = ""

dw_2.accepttext()
ls_employee = dw_2.object.user[1]
if isnull(ls_employee) or ls_employee = "" then ls_employee = "%"

dw_1.reset()
if this.checked = true then
	dw_4.enabled = false
	dw_6.enabled = false
	dw_area.enabled = false

	dw_1.retrieve( ls_workno, ls_sdate, ls_edate, ls_employee )
	if dw_1.rowcount() < 1 then
		MessageBox("확인","해당하는 조건의 자료가 존재하지 않습니다.")
	end if
else
	dw_4.enabled = true
	dw_6.enabled = true
	dw_area.enabled = true
end if

end event

type dw_7 from datawindow within w_mpplandiary_m2
integer x = 160
integer y = 800
integer width = 1093
integer height = 1168
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_mplandiary_m2_qty"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_5 from checkbox within w_mpplandiary_m2
integer x = 3173
integer y = 332
integer width = 329
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
string text = "생산량"
end type

event clicked;// 생산량
string ls_employee, ls_workno, ls_sdate, ls_edate

dw_2.accepttext()
dw_4.accepttext()

debugbreak()
ls_employee = dw_2.object.user[1]
ls_workno   = dw_4.object.work_no[1]
if isnull(ls_workno) or ls_workno = "" then ls_workno = "%"

ls_sdate  = em_1.text
ls_edate  = em_2.text

// 생산량
dw_7.reset()
dw_7.retrieve( ls_workno, ls_sdate, ls_edate, ls_employee )

if this.checked = true then
	dw_7.visible = true
else
	dw_7.visible = false
end if

end event

type st_5 from statictext within w_mpplandiary_m2
integer x = 59
integer y = 224
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
string text = "작업장명 * 마크: 일반작업."
boolean focusrectangle = false
end type

type cbx_6 from checkbox within w_mpplandiary_m2
integer x = 2482
integer y = 328
integer width = 626
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
string text = "작업장 전체보기"
end type

event clicked;// 작업장 전체 보기
string ls_employee, ls_usernm
datawindowchild ldwc_work, ldwc_worknm

debugbreak()
dw_2.accepttext()

dw_4.object.work_no[1]   = ""
dw_4.object.work_name[1] = ""

dw_4.getchild("work_no",   ldwc_work)
dw_4.getchild("work_name", ldwc_worknm)

dw_2.getchild("user", idwc_user)

ls_employee = idwc_user.getitemstring( idwc_user.getrow(), "user_name" )
if isnull(ls_employee) or ls_employee = "" then
else
	if ls_employee = "전체" OR this.checked = true  then
		ldwc_worknm.setfilter( "" )
		ldwc_worknm.filter()
		ldwc_work.setfilter( "" )
		ldwc_work.filter()
	else
		ldwc_worknm.setfilter( "user_name = '" + ls_employee + "'" )
		ldwc_worknm.filter()
		ldwc_work.setfilter( "user_name = '" + ls_employee + "'" )
		ldwc_work.filter()
	end if	
end if

	

end event

type st_8 from statictext within w_mpplandiary_m2
integer x = 933
integer y = 220
integer width = 219
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "PLANHP"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_mpplandiary_m2
event mousemove pbm_mousemove
integer x = 3877
integer y = 64
integer width = 187
integer height = 144
integer taborder = 140
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

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

