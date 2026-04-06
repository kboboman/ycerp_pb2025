$PBExportHeader$w_oryspsale2_r.srw
$PBExportComments$YSP 일자별 수주현황 (2004/04/02, 정갑용)
forward 
global type w_oryspsale2_r from w_inheritance
end type
type em_1 from editmask within w_oryspsale2_r
end type
type em_2 from editmask within w_oryspsale2_r
end type
type st_2 from statictext within w_oryspsale2_r
end type
type dw_area from datawindow within w_oryspsale2_r
end type
type dw_cust from datawindow within w_oryspsale2_r
end type
type st_1 from statictext within w_oryspsale2_r
end type
type pb_1 from picturebutton within w_oryspsale2_r
end type
type st_6 from statictext within w_oryspsale2_r
end type
type ddlb_fld from dropdownlistbox within w_oryspsale2_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oryspsale2_r
end type
type st_7 from statictext within w_oryspsale2_r
end type
type ddlb_op from dropdownlistbox within w_oryspsale2_r
end type
type sle_value from singlelineedit within w_oryspsale2_r
end type
type cb_3 from commandbutton within w_oryspsale2_r
end type
type cb_4 from commandbutton within w_oryspsale2_r
end type
type cb_5 from commandbutton within w_oryspsale2_r
end type
type cb_6 from commandbutton within w_oryspsale2_r
end type
type st_3 from statictext within w_oryspsale2_r
end type
type dw_sales from datawindow within w_oryspsale2_r
end type
type cbx_team from checkbox within w_oryspsale2_r
end type
type st_4 from statictext within w_oryspsale2_r
end type
end forward

global type w_oryspsale2_r from w_inheritance
integer y = 112
integer width = 4402
integer height = 2324
string title = "YSP 일자별 수주현황(w_oryspsale2_r)"
em_1 em_1
em_2 em_2
st_2 st_2
dw_area dw_area
dw_cust dw_cust
st_1 st_1
pb_1 pb_1
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
st_3 st_3
dw_sales dw_sales
cbx_team cbx_team
st_4 st_4
end type
global w_oryspsale2_r w_oryspsale2_r

type variables
//
string is_sale_flag, is_sflag, is_sel, is_cust, is_ret, is_dw

datawindowchild idwc_area, idwc_cust, idwc_user

end variables

on w_oryspsale2_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_area=create dw_area
this.dw_cust=create dw_cust
this.st_1=create st_1
this.pb_1=create pb_1
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
this.st_3=create st_3
this.dw_sales=create dw_sales
this.cbx_team=create cbx_team
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.dw_cust
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_4
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.cb_6
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.dw_sales
this.Control[iCurrent+20]=this.cbx_team
this.Control[iCurrent+21]=this.st_4
end on

on w_oryspsale2_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.dw_cust)
destroy(this.st_1)
destroy(this.pb_1)
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
destroy(this.st_3)
destroy(this.dw_sales)
destroy(this.cbx_team)
destroy(this.st_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
dw_1.sharedata(dw_2)

is_ret = '%'

// 일자
em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')
dw_area.object.area[1] = 'B0001' // YSP 사업장으로 고정

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


end event

type pb_save from w_inheritance`pb_save within w_oryspsale2_r
boolean visible = false
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_oryspsale2_r
integer x = 32
integer y = 444
integer width = 4297
integer height = 1740
integer taborder = 0
string dataobject = "d_oryspsale2_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oryspsale2_r
integer x = 32
integer y = 24
integer width = 1289
integer height = 144
string text = "YSP 일자별 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_oryspsale2_r
end type

type pb_compute from w_inheritance`pb_compute within w_oryspsale2_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_oryspsale2_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_oryspsale2_r
integer x = 4091
integer y = 68
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oryspsale2_r
integer x = 3899
integer y = 68
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
string  ls_text
long ll_row

if dw_2.rowcount() < 1 then
	return
else
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.c_text[ll_row] = ls_text
	next
end if

if is_sel = 'A' then
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',전체)'
elseif is_sel = 'Y' then
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',확정)'
else
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',미확정)'
end if
//l_print.name = 'd_orsaledayrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 YSP 일자별 수주현황 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=84'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oryspsale2_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oryspsale2_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oryspsale2_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oryspsale2_r
integer x = 3515
integer y = 68
integer taborder = 50
end type

event pb_retrieve::clicked;//
date   ld_start, ld_end
string ls_area, ls_custno, ls_team, ls_saleman, ls_sdate, ls_edate, ls_sale_flag[], ls_confirm_flag[]

dw_1.reset()

if em_1.text = '' then
	messagebox("확인","주문기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","주문기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","주문기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

// 사업장
dw_area.AcceptText()
ls_area  = trim(dw_area.object.area[1])
ls_area  = LeftA(ls_area,1) + "%"

// 거래처
dw_cust.accepttext()
ls_custno = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_cust.setfocus()
	RETURN
end if
// 거래처
if cbx_team.checked = true then
	ls_custno = "%"
else
	ls_custno = dw_cust.object.cust_no[1]
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

if GF_Permission("영업사원별_수주현황(ALL)", gs_userid) = "Y" then
	if ls_saleman = "%" then ls_team = "%"
end if

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

//
is_sale_flag = 'A' ; is_sflag = "%" ; is_sel = 'A'

ls_sale_flag[1] = 'D' ; ls_sale_flag[2] = 'L' ; ls_sale_flag[3] = 'E'
ls_confirm_flag[1] = 'Y' ; ls_confirm_flag[2] = 'N'


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve( ls_area, ls_custno, ls_sdate, ls_edate, ls_saleman, ls_team )
if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.",information!)
else
	MessageBox("확인","조회완료",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oryspsale2_r
integer x = 1385
integer y = 16
integer width = 2071
integer height = 224
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oryspsale2_r
integer y = 244
integer width = 4297
integer height = 186
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oryspsale2_r
integer x = 3479
integer y = 16
integer width = 846
integer height = 224
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oryspsale2_r
integer x = 55
integer y = 192
integer width = 82
integer height = 60
integer taborder = 0
boolean enabled = false
string dataobject = "d_oryspsale2_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type em_1 from editmask within w_oryspsale2_r
integer x = 2633
integer y = 60
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

end event

type em_2 from editmask within w_oryspsale2_r
integer x = 3026
integer y = 60
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

end event

type st_2 from statictext within w_oryspsale2_r
integer x = 1417
integer y = 60
integer width = 251
integer height = 76
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

type dw_area from datawindow within w_oryspsale2_r
integer x = 1673
integer y = 60
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

type dw_cust from datawindow within w_oryspsale2_r
integer x = 1673
integer y = 136
integer width = 613
integer height = 88
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()

end event

type st_1 from statictext within w_oryspsale2_r
integer x = 2309
integer y = 60
integer width = 315
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
string text = "수주일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_oryspsale2_r
event mousemove pbm_mousemove
string tag = "파일"
integer x = 3707
integer y = 68
integer width = 187
integer height = 144
integer taborder = 30
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
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
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

type st_6 from statictext within w_oryspsale2_r
integer x = 96
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_oryspsale2_r
integer x = 283
integer y = 308
integer width = 480
integer height = 632
integer taborder = 10
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

type ddlb_dwtitles from dropdownlistbox within w_oryspsale2_r
integer x = 338
integer y = 324
integer width = 311
integer height = 88
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
end type

type st_7 from statictext within w_oryspsale2_r
integer x = 800
integer y = 324
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

type ddlb_op from dropdownlistbox within w_oryspsale2_r
integer x = 969
integer y = 308
integer width = 297
integer height = 512
integer taborder = 20
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

type sle_value from singlelineedit within w_oryspsale2_r
integer x = 1289
integer y = 316
integer width = 567
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_oryspsale2_r
integer x = 1870
integer y = 316
integer width = 160
integer height = 76
integer taborder = 20
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

type cb_4 from commandbutton within w_oryspsale2_r
integer x = 2034
integer y = 316
integer width = 160
integer height = 76
integer taborder = 30
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

type cb_5 from commandbutton within w_oryspsale2_r
integer x = 2199
integer y = 316
integer width = 160
integer height = 76
integer taborder = 40
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

type cb_6 from commandbutton within w_oryspsale2_r
integer x = 2363
integer y = 316
integer width = 160
integer height = 76
integer taborder = 50
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

type st_3 from statictext within w_oryspsale2_r
integer x = 2309
integer y = 144
integer width = 315
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

type dw_sales from datawindow within w_oryspsale2_r
string tag = "d_whlogin_c3"
integer x = 2702
integer y = 140
integer width = 334
integer height = 84
integer taborder = 60
boolean bringtotop = true
string title = "d_whlogin_opeom"
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.AcceptText()
end event

type cbx_team from checkbox within w_oryspsale2_r
integer x = 2633
integer y = 156
integer width = 69
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
boolean checked = true
end type

type st_4 from statictext within w_oryspsale2_r
integer x = 1417
integer y = 140
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

