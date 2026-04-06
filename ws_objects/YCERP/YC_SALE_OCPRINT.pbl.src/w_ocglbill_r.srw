$PBExportHeader$w_ocglbill_r.srw
$PBExportComments$발행자별 어음현황(1998/05/12, 정재수)
forward
global type w_ocglbill_r from w_inheritance
end type
type dw_3 from datawindow within w_ocglbill_r
end type
type em_1 from editmask within w_ocglbill_r
end type
type em_2 from editmask within w_ocglbill_r
end type
type pb_1 from picturebutton within w_ocglbill_r
end type
type st_1 from statictext within w_ocglbill_r
end type
type ddlb_fld from dropdownlistbox within w_ocglbill_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ocglbill_r
end type
type st_2 from statictext within w_ocglbill_r
end type
type sle_value from singlelineedit within w_ocglbill_r
end type
type cb_1 from commandbutton within w_ocglbill_r
end type
type cb_2 from commandbutton within w_ocglbill_r
end type
type cb_3 from commandbutton within w_ocglbill_r
end type
type cb_5 from commandbutton within w_ocglbill_r
end type
type st_3 from statictext within w_ocglbill_r
end type
type st_6 from statictext within w_ocglbill_r
end type
type dw_4 from datawindow within w_ocglbill_r
end type
type cbx_month from checkbox within w_ocglbill_r
end type
type dw_5 from datawindow within w_ocglbill_r
end type
type st_vertical from u_splitbar_vertical within w_ocglbill_r
end type
type dw_6 from datawindow within w_ocglbill_r
end type
type ddlb_op from dropdownlistbox within w_ocglbill_r
end type
end forward

global type w_ocglbill_r from w_inheritance
integer y = 112
integer width = 3849
integer height = 2180
string title = "발행자별 어음현황(w_ocglbill_r)"
dw_3 dw_3
em_1 em_1
em_2 em_2
pb_1 pb_1
st_1 st_1
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_3 st_3
st_6 st_6
dw_4 dw_4
cbx_month cbx_month
dw_5 dw_5
st_vertical st_vertical
dw_6 dw_6
ddlb_op ddlb_op
end type
global w_ocglbill_r w_ocglbill_r

type variables
//
st_print i_print
string   is_dw

end variables

forward prototypes
public function integer wf_daycnt (string ls_yymm)
end prototypes

public function integer wf_daycnt (string ls_yymm);int li_daycnt, li_year, li_month
boolean lb_leapyear

li_year  = integer(LeftA(ls_yymm,4))
li_month = integer(MidA(ls_yymm,5,2))

choose case li_month
	case 1, 3, 5, 7, 8, 10, 12
		li_daycnt = 31
	case 4, 6, 9, 11
		li_daycnt = 30
	case 2
		if Mod(li_year,400) = 0 then
			lb_leapyear = TRUE
		elseif Mod(li_year,100) = 0 then
			lb_leapyear = FALSE
		elseif Mod(li_year, 4) = 0 then
			lb_leapyear = TRUE
		else
			lb_leapyear = FALSE
		end if

		if lb_leapyear then 
			li_daycnt = 29 
		else 
			li_daycnt = 28
		end if
end choose

RETURN li_daycnt

end function

on w_ocglbill_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.pb_1=create pb_1
this.st_1=create st_1
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_3=create st_3
this.st_6=create st_6
this.dw_4=create dw_4
this.cbx_month=create cbx_month
this.dw_5=create dw_5
this.st_vertical=create st_vertical
this.dw_6=create dw_6
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.dw_4
this.Control[iCurrent+17]=this.cbx_month
this.Control[iCurrent+18]=this.dw_5
this.Control[iCurrent+19]=this.st_vertical
this.Control[iCurrent+20]=this.dw_6
this.Control[iCurrent+21]=this.ddlb_op
end on

on w_ocglbill_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_3)
destroy(this.st_6)
destroy(this.dw_4)
destroy(this.cbx_month)
destroy(this.dw_5)
destroy(this.st_vertical)
destroy(this.dw_6)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_5)
st_vertical.of_set_minsize(250, 250)
st_vertical.visible = false
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

datawindowchild ldwc_car

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)

dw_4.visible  = false
dw_5.visible  = false
dw_6.visible  = false

dw_5.Object.DataWindow.Color          = 78682240 
dw_5.object.glbill_bill_no.visible    = 0		// 어음번호
dw_5.object.glbill_bill_class.visible = 0		// 어음구분
dw_5.object.glbill_close_date.visible = 0		// 만기일자
dw_5.object.glbill_start_date.visible = 0		// 개설일자
dw_5.object.glbill_set_flag.visible   = 0		// 결재

// 전체
dw_2.insertrow(0)
dw_2.getchild('draft',ldwc_car)
ldwc_car.insertrow(1)
ldwc_car.setitem(1,'draft','전체')
ldwc_car.accepttext()
ldwc_car.scrolltorow(1)
dw_2.object.draft[1] = "전체"

dw_3.visible = false
dw_1.ShareData( dw_3 )

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

debugbreak()
//
dw_4.x = dw_1.x ; dw_4.y = dw_1.y
dw_4.width  = dw_1.width  - 1970
dw_4.height = dw_1.height

//
st_vertical.x      = dw_4.x + dw_4.width
st_vertical.y      = dw_4.y
st_vertical.height = dw_4.height

dw_5.x      = st_vertical.x + st_vertical.width
dw_5.y      = dw_1.y
dw_5.width  = newwidth - dw_5.x - gb_2.x
dw_5.height = dw_1.height

// PRT
dw_6.x      = dw_4.x
dw_6.y      = dw_4.y
dw_6.width  = dw_4.width
dw_6.height = dw_1.height


end event

type pb_save from w_inheritance`pb_save within w_ocglbill_r
boolean visible = false
integer taborder = 60
end type

type dw_1 from w_inheritance`dw_1 within w_ocglbill_r
integer x = 32
integer y = 428
integer width = 3739
integer height = 1612
integer taborder = 0
string dataobject = "d_ocglbillrep_r"
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ocglbill_r
integer y = 28
integer width = 1198
integer height = 132
string text = "발행자별 어음현황"
end type

type st_tips from w_inheritance`st_tips within w_ocglbill_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocglbill_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocglbill_r
boolean visible = false
integer taborder = 50
end type

type pb_close from w_inheritance`pb_close within w_ocglbill_r
integer x = 3086
integer y = 60
integer taborder = 40
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocglbill_r
integer x = 2702
integer y = 60
integer taborder = 30
end type

event pb_print::clicked;// 출력
w_repsuper w_print
st_print   l_print

//
if dw_4.visible = false then
	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================
	l_print.st_datawindow  = dw_3
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 발행자별 어음현황을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
else	
	DataWindowChild ldwc_dw1, ldwc_dw2
	
	string  ls_draft, ls_sdate, ls_edate
	long    ll_X
	
	dw_2.accepttext()
	ls_draft  = dw_2.object.draft[1]
	if ls_draft = "전체" then ls_draft = "%"
	
	ls_sdate  = em_1.text
	ls_edate  = em_2.text
	
	SetPointer(HourGlass!)
	dw_6.reset()
	dw_6.retrieve( ls_draft, ls_sdate, ls_edate )
	if dw_6.rowcount() < 1 then
		MessageBox("확인", "해당하는 조건의 데이터가 없습니다.",information!)
		RETURN
	end if
	
	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================	
	string  ls_yyyy, ls_mm, ls_d, ls_gtcd, ls_gtime
	long    ll_dtime, ll_totdtime
	
	ls_yyyy     = dw_4.GetItemString(1, "gtyear")
	ls_mm       = dw_4.GetItemString(1, "gtmonth")
	ll_totdtime = long(dw_4.object.totdtime.Text)
	
	dw_6.SetReDraw( false )
	dw_6.Modify("dw_1.width = 3529")
	dw_6.GetChild("dw_1", ldwc_dw1)
	ldwc_dw1.insertrow( 0 )
	
	ldwc_dw1.SetItem(1, "gtyear",  ls_yyyy)
	ldwc_dw1.SetItem(1, "gtmonth", ls_mm)
	ldwc_dw1.Modify("t_name.Text = '받을어음 내역'")
	ldwc_dw1.Modify("titlebar.Background.Color = '" + string(rgb(230, 185, 184)) + "'")
	
	for ll_X = 1 to 37
		ls_d     = dw_4.GetItemString(1, "d"     + string(ll_X) )
		ls_gtcd  = dw_4.GetItemString(1, "gt_cd" + string(ll_X) )
		ls_gtime = dw_4.GetItemString(1, "gtime" + string(ll_X) )
		ll_dtime = dw_4.GetItemNumber(1, "dtime" + string(ll_X) )
	
		ldwc_dw1.SetItem(1, "d"     + string(ll_X),  ls_d    )
		ldwc_dw1.SetItem(1, "gt_cd" + string(ll_X),  ls_gtcd )
		ldwc_dw1.SetItem(1, "gtime" + string(ll_X),  ls_gtime)
		ldwc_dw1.SetItem(1, "dtime" + string(ll_X),  ll_dtime)	
	next
	ldwc_dw1.Modify("totdtime.Text='" + string(ll_totdtime,"#,##0") + "'")
	
	//
	dw_6.GetChild("dw_2", ldwc_dw2)
	ldwc_dw2.SetSort( "glbill_close_date A, customer_cust_name A" )
	ldwc_dw2.Sort()
	ldwc_dw2.Modify("vc_type2.width = 200")					// 유형
	ldwc_dw2.Modify("glbill_bill_no.visible    = 0")		// 어음번호
	ldwc_dw2.Modify("glbill_bill_class.visible = 0")		// 어음구분
	ldwc_dw2.Modify("glbill_set_flag.visible   = 0")		// 결재
	dw_6.SetReDraw( true )
	SetPointer(Arrow!)
	
	//
	dw_6.visible = true
	dw_6.title   = "이 프로그램은 받을어음 내역을 출력합니다."
	dw_6.Modify("DataWindow.Print.Orientation=0 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90")
	
	l_print.st_datawindow    = dw_6
	//i_print.st_print_sheet = " 프린트용지 : A4"
	//i_print.st_print_desc  = " 이 프로그램은 받을어음 내역을 출력합니다." 
	OpenWithParm( w_printsetup, l_print ) 
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocglbill_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_ocglbill_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_ocglbill_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocglbill_r
integer x = 2510
integer y = 60
integer taborder = 20
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_draft, ls_sdate, ls_edate

dw_2.accepttext()
ls_draft  = dw_2.object.draft[1]
if ls_draft = "전체" then ls_draft = "%"

ls_sdate  = em_1.text
ls_edate  = em_2.text

dw_1.retrieve( ls_draft, ls_sdate, ls_edate )
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_ocglbill_r
integer x = 1298
integer y = 12
integer width = 1152
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocglbill_r
integer y = 248
integer width = 3739
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocglbill_r
integer x = 2482
integer width = 818
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_ocglbill_r
integer x = 1623
integer y = 48
integer width = 782
integer height = 84
integer taborder = 10
string dataobject = "d_ocglbillrep_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_ocglbill_r
integer x = 32
integer y = 188
integer width = 96
integer height = 68
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_ocglbillrep_r1"
boolean livescroll = true
end type

type em_1 from editmask within w_ocglbill_r
integer x = 1623
integer y = 132
integer width = 384
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

type em_2 from editmask within w_ocglbill_r
integer x = 2016
integer y = 132
integer width = 384
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
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

type pb_1 from picturebutton within w_ocglbill_r
event mousemove pbm_mousemove
integer x = 2894
integer y = 60
integer width = 187
integer height = 144
integer taborder = 120
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
integer li_value, li_Pos
Datawindow dw_xls

choose case is_dw
	case "dw_1"
		dw_xls = dw_1
	case "dw_5"
		dw_xls = dw_5
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
if dw_xls.rowcount() < 1 then RETURN

//Pointer oldpointer // Declares a pointer variable
//oldpointer = SetPointer( HourGlass! )

li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")	
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if li_value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_xls.SaveAsAscII(ls_DocName)
	end if
end if
//SetPointer( oldpointer )



end event

type st_1 from statictext within w_ocglbill_r
integer x = 78
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

type ddlb_fld from dropdownlistbox within w_ocglbill_r
integer x = 265
integer y = 296
integer width = 443
integer height = 632
integer taborder = 90
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

type ddlb_dwtitles from dropdownlistbox within w_ocglbill_r
integer x = 297
integer y = 308
integer width = 311
integer height = 88
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

type st_2 from statictext within w_ocglbill_r
integer x = 736
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

type sle_value from singlelineedit within w_ocglbill_r
integer x = 1225
integer y = 304
integer width = 567
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
end type

type cb_1 from commandbutton within w_ocglbill_r
integer x = 1797
integer y = 304
integer width = 160
integer height = 76
integer taborder = 80
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
		arg_dw = dw_1
	case "dw_5"
		arg_dw = dw_5
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ocglbill_r
integer x = 1961
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw = dw_1
	case "dw_5"
		arg_dw = dw_5
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ocglbill_r
integer x = 2126
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw = dw_1
	case "dw_5"
		arg_dw = dw_5
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ocglbill_r
integer x = 2290
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw = dw_1
	case "dw_5"
		arg_dw = dw_5
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_3 from statictext within w_ocglbill_r
integer x = 1330
integer y = 52
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "발행자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_ocglbill_r
integer x = 1330
integer y = 136
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "만기일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_ocglbill_r
integer x = 32
integer y = 712
integer width = 2391
integer height = 932
integer taborder = 80
boolean bringtotop = true
string title = "월력표"
string dataobject = "d_month"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
string  ls_draft, ls_col, ls_day, ls_sdate, ls_edate
long    ll_day

dw_2.accepttext()
ls_draft  = dw_2.object.draft[1]
if ls_draft = "전체" then ls_draft = "%"

//
ls_col    = dwo.name

ll_day = 0 ; ls_day = ""
choose case LeftA(ls_col,5)
	case "dtime"
		ls_day   = GF_ReplaceAll(ls_col, "dtime", "")
	case "gt_cd"
		ls_day   = GF_ReplaceAll(ls_col, "gt_cd", "")
	case "gtime"
		ls_day   = GF_ReplaceAll(ls_col, "gtime", "")
	case else
		if LeftA(ls_col,1) = "d" then
			ls_day   = dw_4.GetItemString(1, ls_col)
		else
			RETURN
		end if
end choose

ll_day    = long(dw_4.GetItemString(1, "d"+ls_day))
ls_sdate  = string(date(em_1.text),"yyyy/mm") + "/" + string(ll_day,"00")
ls_edate  = ls_sdate

dw_5.retrieve( ls_draft, ls_sdate, ls_edate )

end event

event other;//
CONSTANT integer WM_MOUSEWHEEL = 522 
string   ls_setting

if Message.Number = WM_MOUSEWHEEL AND KeyDown(KeyControl!) then
//	Message.Processed = true
//	RETURN 1
	ls_setting = This.Describe("DataWindow.Zoom")
	SetProfileString("YCERP.INI", "DATABASE", "OCGLBILL",  ls_setting)	
end if

end event

type cbx_month from checkbox within w_ocglbill_r
integer x = 2482
integer y = 312
integer width = 347
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "월력표"
end type

event clicked;///////////////////////////////////////////////////////		
// 월력표
///////////////////////////////////////////////////////		
string  ls_date, ls_yyyymm, ls_yyyy, ls_mm, ls_sdate, ls_edate
integer li_daycnt, li_firstday, li_i, li_fpos, li_fday, li_lastpos
date    ld_sdate, ld_edate

dw_4.Reset()
dw_4.InsertRow(0)		
dw_4.AcceptText()

dw_4.Object.t_name.Text = "받을어음 내역"
dw_4.Object.titlebar.Background.Color = rgb(230, 185, 184)

// 보여주기
if dw_4.visible = false then
	dw_1.visible = false
	
	st_vertical.visible = true
	dw_5.visible = true
	dw_4.visible = true

	// ZOOM
	string  ls_setting
	ls_setting = ProfileString("YCERP.INI", "DATABASE", "OCGLBILL",  "")	
	if IsNumber(ls_setting) then
		dw_4.Object.DataWindow.Zoom = integer(ls_setting)
	end if
	
	if MessageBox("확인","한 달간의 데이터를 조회 하시겠습니가?",Exclamation!, OKCancel!, 1) = 1 then
		em_1.text = string(date(em_2.text),"yyyy/mm/01")
		ld_sdate  = date( em_1.text )
		
		ls_edate  = GF_ReplaceAll(em_2.text,"/","")
		SELECT top 1 dbo.UF_GetLastDAY( :ls_edate ) INTO :ls_edate FROM login;
	
		em_2.text = ls_edate
		ld_edate  = date(ls_edate)
	else
		ld_sdate  = date( em_1.text )
		ld_edate  = date( em_2.text )
	end if
else
	dw_1.visible = true

	st_vertical.visible = false
	dw_5.visible = false
	dw_4.visible = false
	RETURN
end if

//
ls_date     = string(ld_edate, "yyyy/mm/dd")
ls_yyyymm   = string(date(ls_date),"yyyymm")		
ls_yyyy     = string(date(ls_date),"yyyy")		
ls_mm       = string(date(ls_date),"mm")		

li_daycnt   = WF_DayCNT( ls_yyyymm )	// 해당년월의 일자 갯수
li_firstday = DayNumber(Date(ls_yyyy + "." + ls_mm + ".01")) // 해당년월의 1일자 요일숫자

dw_4.SetItem(1, "gtyear",  ls_yyyy)
dw_4.SetItem(1, "gtmonth", ls_mm  )

dw_4.setredraw( false )
for li_i = 1 to 37
   dw_4.Modify("gt_cd" + string(li_i) + ".Background.Color=28310782")
   dw_4.Modify("gt_cd" + string(li_i) + ".Alignment=0")	// Left=0, Right=1, Center=2, Justify=3

   dw_4.Modify("d"     + string(li_i) + ".Pointer='HyperLink!'")
   dw_4.Modify("gt_cd" + string(li_i) + ".Pointer='HyperLink!'")
   dw_4.Modify("dtime" + string(li_i) + ".Pointer='HyperLink!'")
   dw_4.Modify("gtime" + string(li_i) + ".Pointer='HyperLink!'")

	if li_i < li_firstday OR li_i > (li_firstday + li_daycnt - 1) then
		dw_4.SetTabOrder("gt_cd" + string(li_i), 0)
		dw_4.SetTabOrder("dtime" + string(li_i), 0)
		CONTINUE
	else
		li_fpos = li_firstday + (li_i - li_firstday) // 1 일자 Display 위치
		li_fday = (li_i + 1) - li_firstday 				// 1 일자 비교
		
		dw_4.SetItem(1, "d" + string(li_fpos), String(li_fday))
		dw_4.SetTabOrder("gt_cd" + string(li_i), 0) // li_i) 	// TabOrder Setting
		dw_4.SetTabOrder("dtime" + string(li_i), 0) 
		
		li_lastpos = li_i
	end if
next
dw_4.setredraw( true )
pb_retrieve.TriggerEvent( clicked! )	

//////////////////////////////////////////////////////////////////////////////////////////
// gt_dt  string(10), dtime1 number, gtime1 string(10)
//////////////////////////////////////////////////////////////////////////////////////////
string ls_year, ls_day, ls_workdate
string ls_gtime, ls_bkname, ls_custnm
long   ll_row, ll_col, ll_workday, ll_dtime, ll_totdtime

ls_sdate = em_1.text
ls_edate = em_2.text

SetPointer(HourGlass!)

// 당월(dw_4)
ls_year = LeftA(ls_edate, 7)
for ll_col = 1 to 37
	ls_day   = dw_4.GetItemString(1, "d" + string(ll_col))
	
	if isnull(ls_day) OR trim(ls_day) = "" then
		//
	else
		dw_4.SetItem(1, "gt_cd" + string(ll_col), "")
		dw_4.SetItem(1, "gtime" + string(ll_col), "")
		dw_4.SetItem(1, "dtime" + string(ll_col),  0)
		
		ls_date = ls_year + "/" + string(integer(ls_day), "00")			

		ls_gtime = "" ; ll_dtime = 0		
		for ll_row = 1 to dw_1.rowcount()
			ls_workdate = "" ; ls_bkname = "" ; ls_custnm = ""
		
			ls_workdate = string(dw_1.object.glbill_close_date[ll_row],"yyyy/mm/dd")
			if isnull(ls_workdate) OR ls_workdate = "" then CONTINUE
	
			if ls_date = ls_workdate then
				ls_gtime    = dw_4.GetItemString( 1, "gtime" + string(ll_col) )
				ll_totdtime = ll_totdtime + dw_1.object.glbill_bill_amount[ll_row]
				
				if LenA(ls_gtime) > 0 then
					ls_custnm  = ls_custnm + "," + dw_1.object.customer_cust_name[ll_row]
					ls_bkname  = ls_gtime  + "," + dw_1.object.bank_bank_name[ll_row]
					ll_dtime   = ll_dtime  + dw_1.object.glbill_bill_amount[ll_row]
				else
					ls_custnm  = dw_1.object.customer_cust_name[ll_row]
					ls_bkname  = dw_1.object.bank_bank_name[ll_row]
					ll_dtime   = dw_1.object.glbill_bill_amount[ll_row]
				end if
				
				if LeftA(ls_custnm,1) = "," then 
					ls_custnm  = RightA(ls_custnm, LenA(ls_custnm) - 1)
				end if
				dw_4.SetItem(1, "gt_cd" + string(ll_col), ls_custnm)		// 거래처
				dw_4.SetItem(1, "dtime" + string(ll_col), ll_dtime)		// 금액
				dw_4.SetItem(1, "gtime" + string(ll_col), ls_bkname)		// 은행명
			end if
		next
	end if
next

dw_4.Modify("totdtime.Text='" + string(ll_totdtime,"#,##0") + "'")
SetPointer(Arrow!)

end event

type dw_5 from datawindow within w_ocglbill_r
integer x = 2501
integer y = 712
integer width = 1147
integer height = 932
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_ocglbillrep_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_vertical from u_splitbar_vertical within w_ocglbill_r
integer x = 2446
integer y = 712
integer height = 932
boolean bringtotop = true
end type

type dw_6 from datawindow within w_ocglbill_r
integer x = 1376
integer y = 1072
integer width = 1577
integer height = 764
integer taborder = 80
boolean bringtotop = true
boolean titlebar = true
string title = "받을어음 내역"
string dataobject = "d_month_billreport"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_op from dropdownlistbox within w_ocglbill_r
integer x = 914
integer y = 296
integer width = 302
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

