$PBExportHeader$w_apoiinvcon_m.srw
$PBExportComments$월별매입확정(2001/12/26, 이인호)
forward
global type w_apoiinvcon_m from w_inheritance
end type
type cbx_1 from checkbox within w_apoiinvcon_m
end type
type dw_area from datawindow within w_apoiinvcon_m
end type
type cbx_2 from checkbox within w_apoiinvcon_m
end type
type rb_3 from radiobutton within w_apoiinvcon_m
end type
type rb_4 from radiobutton within w_apoiinvcon_m
end type
type st_3 from statictext within w_apoiinvcon_m
end type
type st_4 from statictext within w_apoiinvcon_m
end type
type st_5 from statictext within w_apoiinvcon_m
end type
type em_1 from editmask within w_apoiinvcon_m
end type
type em_2 from editmask within w_apoiinvcon_m
end type
type st_1 from statictext within w_apoiinvcon_m
end type
type ddlb_fld from dropdownlistbox within w_apoiinvcon_m
end type
type ddlb_dwtitles from dropdownlistbox within w_apoiinvcon_m
end type
type st_2 from statictext within w_apoiinvcon_m
end type
type ddlb_op from dropdownlistbox within w_apoiinvcon_m
end type
type sle_value from singlelineedit within w_apoiinvcon_m
end type
type cb_1 from commandbutton within w_apoiinvcon_m
end type
type cb_2 from commandbutton within w_apoiinvcon_m
end type
type cb_3 from commandbutton within w_apoiinvcon_m
end type
type cb_5 from commandbutton within w_apoiinvcon_m
end type
type gb_4 from groupbox within w_apoiinvcon_m
end type
end forward

global type w_apoiinvcon_m from w_inheritance
integer x = 5
integer y = 112
integer width = 4078
integer height = 2280
string title = "월매입 확정(w_apoiinvcon_m)"
cbx_1 cbx_1
dw_area dw_area
cbx_2 cbx_2
rb_3 rb_3
rb_4 rb_4
st_3 st_3
st_4 st_4
st_5 st_5
em_1 em_1
em_2 em_2
st_1 st_1
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_4 gb_4
end type
global w_apoiinvcon_m w_apoiinvcon_m

type variables
string is_dw, is_con = 'O'
st_print i_print
end variables

event open;call super::open;//
string ls_sdate, ls_edate

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_2.visible = false

if gs_userid = '1999010s' then
else
	dw_area.enabled = false
end if

em_1.text = string(today(),"yyyy/mm/01")

ls_edate  = GF_ReplaceAll(em_1.text,"/","")
SELECT top 1 dbo.UF_GetLastDAY( :ls_edate ) INTO :ls_edate FROM login;
em_2.text = ls_edate

//
if GF_Permission("월매입_확정", gs_userid) = "Y" then
else
	MessageBox("확인","월매입_확정 권한이 존재하지 않습니다.")
	close(this)
end if

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

end event

on w_apoiinvcon_m.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.dw_area=create dw_area
this.cbx_2=create cbx_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.dw_area
this.Control[iCurrent+3]=this.cbx_2
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.em_1
this.Control[iCurrent+10]=this.em_2
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.gb_4
end on

on w_apoiinvcon_m.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.dw_area)
destroy(this.cbx_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_4)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_apoiinvcon_m
integer x = 2825
integer y = 56
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
long ll_row
string 	ls_yyyymm, ls_magamyn // 2017.10.23 조원석

/* 마감관리 로직 반영 2017.10.23 조원석 */
/* sys_gb = '10' (10)구매 마감 로직 	 시작 */
for ll_row = 1 to dw_1.rowcount()

	ls_yyyymm = string(dw_1.object.apoiinv_oi_date[ll_row], "yyyymm")
	
	SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '10';
	
	//if ls_magamyn <> "N" then
	   
	// MessageBox('확인', string(dw_1.object.compute_8[ll_row])+'NO의 해당년월은 마감되었습니다.~n~n',Stopsign!)
	//	return
	//end if
	
next
/* 마감관리 로직 반영 2017.10.23 조원석  끝 */

// apoiinv_open_close = 'O': 매입 등록, 'S': 매입 확정, 'T': 지불등록 , 'C' :마감
if wf_update1(dw_1, "Y") = true then
	cbx_1.checked = false
	cbx_2.checked = false
end if
end event

type dw_1 from w_inheritance`dw_1 within w_apoiinvcon_m
integer x = 32
integer y = 408
integer width = 3931
integer height = 1632
integer taborder = 70
string dataobject = "d_apoiinvcon_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

event dw_1::itemchanged;string 	ls_user

setnull(ls_user)
CHOOSE CASE dwo.name
	CASE 'chk_user'
		if data = 'Y' then
			ls_user = gs_userid
		end if
		this.object.apoiinv_confirm_user[row] = ls_user
	CASE 'apoiinv_open_close'
		if data <> 'O' then
			ls_user = gs_userid
		end if
		this.object.apoiinv_top_user[row] = ls_user
END CHOOSE

end event

event dw_1::losefocus;this.accepttext()
end event

type st_title from w_inheritance`st_title within w_apoiinvcon_m
integer x = 32
integer y = 20
integer width = 887
string text = "월매입 확정"
end type

type st_tips from w_inheritance`st_tips within w_apoiinvcon_m
end type

type pb_compute from w_inheritance`pb_compute within w_apoiinvcon_m
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_apoiinvcon_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_apoiinvcon_m
integer x = 3209
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoiinvcon_m
integer x = 3017
integer y = 56
integer taborder = 130
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string  ls_area, ls_date

dw_area.accepttext()
ls_area = dw_area.object.area[1]

ls_date = LeftA(em_1.text,7)

dw_2.retrieve( ls_date, is_con, ls_area)
if dw_2.rowcount() < 1 then RETURN

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 월 매입(미)확정현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_apoiinvcon_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_apoiinvcon_m
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_apoiinvcon_m
boolean visible = false
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apoiinvcon_m
integer x = 2633
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_area
date   ld_sdate,  ld_edate

dw_area.accepttext()
ls_area = dw_area.object.area[1]

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

dw_1.setredraw(false)
dw_1.retrieve( ld_sdate, ld_edate, is_con, ls_area)
if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_apoiinvcon_m
integer x = 969
integer y = 8
integer width = 1074
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_apoiinvcon_m
integer width = 3931
integer height = 168
integer taborder = 100
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_apoiinvcon_m
integer x = 2606
integer y = 8
integer width = 823
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_apoiinvcon_m
integer x = 37
integer y = 168
integer width = 87
integer height = 68
integer taborder = 80
string dataobject = "d_apoiinv_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type cbx_1 from checkbox within w_apoiinvcon_m
integer x = 2501
integer y = 268
integer width = 526
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
string text = "전체(부서장)"
end type

event clicked;//
string ls_chk, ls_user
long   ll_row

// chk_user = 'Y': 부서장 매입결재 , 'N' 

setnull(ls_user)
if this.checked = true then
	ls_user = gs_userid
	ls_chk = 'Y'
else
	ls_chk = 'N'
end if

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk_user[ll_row] = ls_chk
	dw_1.object.apoiinv_confirm_user[ll_row] = ls_user
next

end event

type dw_area from datawindow within w_apoiinvcon_m
integer x = 1285
integer y = 44
integer width = 517
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type cbx_2 from checkbox within w_apoiinvcon_m
integer x = 2501
integer y = 324
integer width = 457
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체(임원)"
end type

event clicked;long ll_row
string ls_chk, ls_user

// apoiinv_open_close = 'O': 매입 등록, 'S': 공장장 결재 확정, 'T': 지불등록 , 'C' :마감

setnull(ls_user)
if this.checked = true then
	ls_user = gs_userid
	ls_chk = 'S'
else
	ls_chk = 'O'
end if
for ll_row = 1 to dw_1.rowcount()
	dw_1.object.apoiinv_open_close[ll_row] = ls_chk
	dw_1.object.apoiinv_top_user[ll_row] = ls_user
next


end event

type rb_3 from radiobutton within w_apoiinvcon_m
integer x = 2144
integer y = 64
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미결재"
boolean checked = true
end type

event clicked;// apoiinv_open_close = 'O': 매입 등록, 'S': 매입 확정, 'T': 지불등록 , 'C' :마감
is_con = 'O'
dw_1.reset()

end event

type rb_4 from radiobutton within w_apoiinvcon_m
integer x = 2144
integer y = 132
integer width = 329
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "결재완료"
end type

event clicked;is_con = 'S'
dw_1.reset()

end event

type st_3 from statictext within w_apoiinvcon_m
integer x = 3063
integer y = 272
integer width = 837
integer height = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월매입 확정 후 매입계산서 미발행 체크 확인 바람."
boolean focusrectangle = false
end type

type st_4 from statictext within w_apoiinvcon_m
integer x = 997
integer y = 44
integer width = 283
integer height = 76
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

type st_5 from statictext within w_apoiinvcon_m
integer x = 997
integer y = 124
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
string text = "작업년월"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_apoiinvcon_m
integer x = 1285
integer y = 124
integer width = 361
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
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
//OpenWithParm(w_calendar, Message.StringParm)
//if Message.StringParm <> 'N' then
//	this.text = string(date(Message.StringParm))
//end if
//
end event

type em_2 from editmask within w_apoiinvcon_m
integer x = 1650
integer y = 124
integer width = 361
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
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
//OpenWithParm(w_calendar, Message.StringParm)
//if Message.StringParm <> 'N' then
//	this.text = string(date(Message.StringParm))
//end if
//
end event

type st_1 from statictext within w_apoiinvcon_m
integer x = 73
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_apoiinvcon_m
integer x = 261
integer y = 276
integer width = 443
integer height = 632
integer taborder = 40
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

type ddlb_dwtitles from dropdownlistbox within w_apoiinvcon_m
integer x = 293
integer y = 288
integer width = 311
integer height = 88
integer taborder = 50
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

type st_2 from statictext within w_apoiinvcon_m
integer x = 731
integer y = 292
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

type ddlb_op from dropdownlistbox within w_apoiinvcon_m
integer x = 901
integer y = 276
integer width = 297
integer height = 512
integer taborder = 50
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

type sle_value from singlelineedit within w_apoiinvcon_m
integer x = 1221
integer y = 284
integer width = 567
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_apoiinvcon_m
integer x = 1792
integer y = 284
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_apoiinvcon_m
integer x = 1957
integer y = 284
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
string text = "해지"
end type

event clicked;//
datawindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_apoiinvcon_m
integer x = 2121
integer y = 284
integer width = 160
integer height = 76
integer taborder = 130
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
datawindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_apoiinvcon_m
integer x = 2286
integer y = 284
integer width = 160
integer height = 76
integer taborder = 140
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
datawindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_apoiinvcon_m
integer x = 2080
integer y = 8
integer width = 498
integer height = 216
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "공장장"
end type

