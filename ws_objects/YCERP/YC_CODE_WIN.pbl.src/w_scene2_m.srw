$PBExportHeader$w_scene2_m.srw
$PBExportComments$선행영업
forward
global type w_scene2_m from w_inheritance
end type
type st_2 from statictext within w_scene2_m
end type
type ddlb_fld from dropdownlistbox within w_scene2_m
end type
type ddlb_dwtitles from dropdownlistbox within w_scene2_m
end type
type st_5 from statictext within w_scene2_m
end type
type sle_value from singlelineedit within w_scene2_m
end type
type cb_1 from commandbutton within w_scene2_m
end type
type cb_2 from commandbutton within w_scene2_m
end type
type cb_3 from commandbutton within w_scene2_m
end type
type cb_4 from commandbutton within w_scene2_m
end type
type dw_3 from datawindow within w_scene2_m
end type
type st_vertical from u_splitbar_vertical within w_scene2_m
end type
type st_horizontal2 from u_splitbar_horizontal within w_scene2_m
end type
type cbx_contents from checkbox within w_scene2_m
end type
type st_1 from statictext within w_scene2_m
end type
type em_1 from editmask within w_scene2_m
end type
type cbx_view from checkbox within w_scene2_m
end type
type st_scale from statictext within w_scene2_m
end type
type st_constructtime from statictext within w_scene2_m
end type
type st_address from statictext within w_scene2_m
end type
type st_8 from statictext within w_scene2_m
end type
type dw_sales from datawindow within w_scene2_m
end type
type dw_4 from datawindow within w_scene2_m
end type
type st_horizontal1 from u_splitbar_horizontal within w_scene2_m
end type
type ddlb_op from dropdownlistbox within w_scene2_m
end type
end forward

global type w_scene2_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4448
integer height = 2364
string title = "선행영업 영업내용(w_scene2_m)"
st_2 st_2
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
dw_3 dw_3
st_vertical st_vertical
st_horizontal2 st_horizontal2
cbx_contents cbx_contents
st_1 st_1
em_1 em_1
cbx_view cbx_view
st_scale st_scale
st_constructtime st_constructtime
st_address st_address
st_8 st_8
dw_sales dw_sales
dw_4 dw_4
st_horizontal1 st_horizontal1
ddlb_op ddlb_op
end type
global w_scene2_m w_scene2_m

type variables
string   is_dw

DataWindowChild idwc_sceneuse, idwc_user

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_rightobject(dw_3)
st_vertical.of_set_minsize(250, 250)

st_horizontal1.of_set_topobject(dw_1)
st_horizontal1.of_set_bottomobject(dw_4)
st_horizontal1.of_set_minsize(250, 250)

st_horizontal2.of_set_topobject(dw_2)
st_horizontal2.of_set_bottomobject(dw_3)
st_horizontal2.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_sales.SetTransObject(SQLCA)

// 작성일자
datetime ldt_makedate

SELECT top 1 dateadd(year, -1, getdate()) INTO :ldt_makedate FROM login;
em_1.text = string(ldt_makedate, "yyyy/mm/dd")

// 담당자
dw_sales.settransobject(sqlca)
dw_sales.insertrow(0)

if GF_Permission("선행영업_현장", gs_userid) = "Y" then
	dw_sales.getchild('user', idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1, 'user_id', '%')
	idwc_user.setitem(1, 'user_name', '전체')
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"
else
	dw_sales.object.user[1] = gs_userid
	dw_sales.object.user.background.color = 67108864
	dw_sales.enabled = false
end if

//
if GF_Permission("선행영업_영업내용변경", gs_userid) = "Y" then
	cbx_contents.enabled = true
	pb_delete.enabled    = true

	cbx_view.enabled = true
	cbx_view.checked = false
	cbx_view.triggerevent( clicked! )
else
	cbx_contents.enabled = false
	pb_delete.enabled    = false

	cbx_view.enabled = false
	cbx_view.checked = true
	cbx_view.triggerevent( clicked! )
end if


pb_retrieve.PostEvent( clicked! )

end event

on w_scene2_m.create
int iCurrent
call super::create
this.st_2=create st_2
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.dw_3=create dw_3
this.st_vertical=create st_vertical
this.st_horizontal2=create st_horizontal2
this.cbx_contents=create cbx_contents
this.st_1=create st_1
this.em_1=create em_1
this.cbx_view=create cbx_view
this.st_scale=create st_scale
this.st_constructtime=create st_constructtime
this.st_address=create st_address
this.st_8=create st_8
this.dw_sales=create dw_sales
this.dw_4=create dw_4
this.st_horizontal1=create st_horizontal1
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.dw_3
this.Control[iCurrent+11]=this.st_vertical
this.Control[iCurrent+12]=this.st_horizontal2
this.Control[iCurrent+13]=this.cbx_contents
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.em_1
this.Control[iCurrent+16]=this.cbx_view
this.Control[iCurrent+17]=this.st_scale
this.Control[iCurrent+18]=this.st_constructtime
this.Control[iCurrent+19]=this.st_address
this.Control[iCurrent+20]=this.st_8
this.Control[iCurrent+21]=this.dw_sales
this.Control[iCurrent+22]=this.dw_4
this.Control[iCurrent+23]=this.st_horizontal1
this.Control[iCurrent+24]=this.ddlb_op
end on

on w_scene2_m.destroy
call super::destroy
destroy(this.st_2)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.dw_3)
destroy(this.st_vertical)
destroy(this.st_horizontal2)
destroy(this.cbx_contents)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cbx_view)
destroy(this.st_scale)
destroy(this.st_constructtime)
destroy(this.st_address)
destroy(this.st_8)
destroy(this.dw_sales)
destroy(this.dw_4)
destroy(this.st_horizontal1)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
long  ll_height

st_address.width     = newwidth  - st_address.x - gb_2.x - 20

gb_2.width           = newwidth  - (gb_2.x * 2)

ll_height            = newheight - dw_1.y - gb_2.x
dw_1.height          = ll_height * 0.7

st_horizontal1.y     = dw_1.y + dw_1.height
st_horizontal1.width = dw_1.width

dw_4.y               = st_horizontal1.y + st_horizontal1.height
dw_4.width           = dw_1.width
dw_4.height          = newheight - dw_4.y - gb_2.x

st_vertical.x        = dw_1.x + dw_1.width
st_vertical.height   = ll_height

dw_2.x               = st_vertical.x + st_vertical.width 
dw_2.width           = newwidth  - dw_2.x - gb_2.x
dw_2.height          = (dw_1.height * 0.2)

st_horizontal2.x     = st_vertical.x + st_vertical.width
st_horizontal2.y     = dw_2.y + dw_2.height
st_horizontal2.width = dw_2.width

dw_3.y               = st_horizontal2.y + st_horizontal2.height
dw_3.width           = newwidth  - dw_3.x - gb_2.x
dw_3.height          = newheight - dw_3.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_scene2_m
integer x = 3753
integer y = 68
end type

event pb_save::clicked;//
string ls_scene, ls_scenedesc, ls_yyyymm, ls_max
long   ll_row, ll_dw1cnt, ll_dw2cnt, ll_dw3cnt, ll_max

if dw_1.rowcount() < 1 then RETURN

ll_dw1cnt = dw_1.getrow()

debugbreak()

dw_2.accepttext()
dw_3.accepttext()

ls_scene     = dw_1.object.scene_code[dw_1.getrow()]

for ll_row = 1 to dw_3.rowcount()
	dw_3.object.scene_code[ll_row] = ls_scene
next

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
WF_Update1( dw_3, "Y" )

// 영업내용 변경
cbx_contents.checked = false
cbx_contents.TriggerEvent( clicked! )

//
pb_retrieve.PostEvent( clicked! )

end event

type dw_1 from w_inheritance`dw_1 within w_scene2_m
integer x = 32
integer y = 444
integer width = 2217
integer height = 1360
string title = "d_cdsscene_list2"
string dataobject = "d_cdsscene_list2"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string   ls_scene, ls_scale, ls_ctime, ls_address
date     ld_makedate
datetime ldt_makedate

ls_scene   = this.object.scene_code[row]
ls_scale   = this.object.scene_scale[row]
ls_ctime   = string(this.object.construct_time1[row], "yyyy/mm/dd") + " - " + string(this.object.construct_time2[row], "yyyy/mm/dd")
ls_address = this.object.site_address[row]

st_scale.text         = ls_scale
st_constructtime.text = ls_ctime
st_address.text       = ls_address

ldt_makedate = datetime(date(em_1.text), time("00:00:00"))
ld_makedate  = date(em_1.text)

debugbreak()

dw_2.retrieve( ls_scene )
dw_3.retrieve( ls_scene, ld_makedate )
dw_4.retrieve( ls_scene, "%" )

// 영업내용 변경
if GF_Permission("선행영업_영업내용변경", gs_userid) = "Y" then
	cbx_contents.checked = false
	cbx_contents.TriggerEvent( clicked! )
end if

end event

type st_title from w_inheritance`st_title within w_scene2_m
integer x = 32
integer y = 20
integer width = 1184
integer height = 140
string text = "선행영업 영업내용"
end type

type st_tips from w_inheritance`st_tips within w_scene2_m
end type

type pb_compute from w_inheritance`pb_compute within w_scene2_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_scene2_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_scene2_m
integer x = 3945
integer y = 68
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_scene2_m
integer x = 3561
integer y = 68
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 매출집계 조직도를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_scene2_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_scene2_m
integer x = 3369
integer y = 68
integer taborder = 130
end type

event pb_delete::clicked;//
string ls_scene
long   ll_row, ll_dw1cnt

ll_dw1cnt = dw_1.getrow()
ls_scene  = dw_2.object.scene_code[dw_2.getrow()]

if MessageBox("확인","삭제 하시겠습니까?",information!, OKCancel!, 2) = 2 then RETURN

dw_3.DeleteRow(0)

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "D", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
WF_Update1( dw_3, "N" )

//
dw_1.retrieve()
if ll_dw1cnt > 0 then
	dw_1.ScrollToRow( ll_dw1cnt )
end if
MessageBox("확인","작업완료")

end event

type pb_insert from w_inheritance`pb_insert within w_scene2_m
integer x = 3177
integer y = 68
integer taborder = 150
end type

event pb_insert::clicked;//
string ls_scene, ls_contents
long   ll_row, ll_dw2cnt, ll_dw3cnt

dw_3.reset()
ll_dw3cnt = dw_3.InsertRow( dw_3.getrow() )

dw_3.ScrollToRow(ll_dw3cnt)
dw_3.object.make_date[ll_dw3cnt] = GF_Today()

ls_contents = CharA(13) + CharA(10) + CharA(13) + CharA(10) + CharA(13) + CharA(10) + &
              CharA(13) + CharA(10) + CharA(13) + CharA(10) + CharA(13) + CharA(10) + &
              CharA(13) + CharA(10) + CharA(13) + CharA(10) + CharA(13) + CharA(10) + &
 				  CharA(13) + CharA(10) + CharA(13) + CharA(10) + CharA(13) + CharA(10)

dw_3.object.contents[ll_dw3cnt]  = ls_contents
dw_3.object.make_user[ll_dw3cnt] = gs_userid

dw_3.SetColumn("contents")
dw_3.SetFocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_scene2_m
integer x = 2985
integer y = 68
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_salesman
date   ld_makedate

debugbreak()

dw_sales.accepttext()
ls_salesman  = dw_sales.object.user[1]

ld_makedate  = date(em_1.text)
if cbx_view.checked = true then
	dw_1.retrieve( ls_salesman, ld_makedate )
else
	dw_1.retrieve()
end if


end event

type gb_3 from w_inheritance`gb_3 within w_scene2_m
integer x = 1317
integer y = 20
integer width = 1609
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_scene2_m
integer y = 268
integer width = 4334
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_scene2_m
integer x = 2949
integer y = 20
integer width = 1216
integer height = 216
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_scene2_m
integer x = 2313
integer y = 444
integer width = 2053
integer height = 520
integer taborder = 60
string dataobject = "d_cdsscene_mdet"
boolean hscrollbar = true
end type

event dw_2::rbuttondown;call super::rbuttondown;//
gs_calendar lstr_calendar
datetime ctime1, ctime2

DEBUGBREAK()

if row < 1 then RETURN

ctime1 = this.object.construct_time1[row]
ctime2 = this.object.construct_time2[row]
if isnull(ctime1) then this.object.construct_time1[row] = GF_Today()
if isnull(ctime2) then this.object.construct_time2[row] = GF_Today()

choose case dwo.name
	case "construct_time1", "construct_time2"

		lstr_calendar.sdate = string(this.object.construct_time1[row], "yyyy/mm/dd")
		lstr_calendar.edate = string(this.object.construct_time2[row], "yyyy/mm/dd")
		OpenWithParm(w_calendar2, lstr_calendar)
		lstr_calendar = Message.PowerObjectParm
		
		if lstr_calendar.chk <> 'N' then
			this.object.construct_time1[row] = datetime(date(lstr_calendar.sdate), time("00:00:00.000"))
			this.object.construct_time2[row] = datetime(date(lstr_calendar.edate), time("00:00:00.000"))
		end if
end choose		
end event

type st_2 from statictext within w_scene2_m
integer x = 105
integer y = 336
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_scene2_m
integer x = 283
integer y = 316
integer width = 443
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_scene2_m
integer x = 315
integer y = 328
integer width = 311
integer height = 88
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
end type

type st_5 from statictext within w_scene2_m
integer x = 754
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

type sle_value from singlelineedit within w_scene2_m
integer x = 1216
integer y = 324
integer width = 535
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

type cb_1 from commandbutton within w_scene2_m
integer x = 1769
integer y = 324
integer width = 146
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_scene2_m
integer x = 1920
integer y = 324
integer width = 146
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
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_scene2_m
integer x = 2071
integer y = 324
integer width = 146
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_4 from commandbutton within w_scene2_m
integer x = 2222
integer y = 324
integer width = 146
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_scene2_m
integer x = 2313
integer y = 1024
integer width = 2053
integer height = 1188
integer taborder = 30
boolean bringtotop = true
string title = "권한별거래처목록"
string dataobject = "d_sscene_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type st_vertical from u_splitbar_vertical within w_scene2_m
integer x = 2267
integer y = 444
integer height = 1768
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal1.width  = dw_1.width

st_horizontal2.x      = this.x + this.width
st_horizontal2.width  = dw_2.width

end event

type st_horizontal2 from u_splitbar_horizontal within w_scene2_m
integer x = 2313
integer y = 988
integer width = 2053
boolean bringtotop = true
end type

type cbx_contents from checkbox within w_scene2_m
integer x = 1358
integer y = 140
integer width = 375
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "내용변경"
end type

event clicked;// 업무내용 변경
if dw_3.getrow() < 1 then RETURN

if this.checked = true then
	dw_3.object.chk[dw_3.getrow()] = "Y"
else
	dw_3.object.chk[dw_3.getrow()] = "N"
end if

end event

type st_1 from statictext within w_scene2_m
integer x = 1760
integer y = 60
integer width = 453
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
string text = "현장등록"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_scene2_m
integer x = 1760
integer y = 140
integer width = 453
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
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
OpenWithParm(w_calendar, Message.StringParm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

event modified;//
pb_Retrieve.TriggerEvent( clicked! )

end event

type cbx_view from checkbox within w_scene2_m
integer x = 1358
integer y = 64
integer width = 242
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "열람"
end type

event clicked;// 열람
if this.checked = true then
	dw_1.dataobject = "d_cdsscene_list2"
else
	dw_1.dataobject = "d_cdsscene_list"
end if
dw_1.SetTransObject( SQLCA )

pb_retrieve.TriggerEvent( clicked! )

end event

type st_scale from statictext within w_scene2_m
integer x = 2395
integer y = 316
integer width = 1129
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_constructtime from statictext within w_scene2_m
integer x = 3534
integer y = 316
integer width = 983
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_address from statictext within w_scene2_m
integer x = 4526
integer y = 316
integer width = 983
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_scene2_m
integer x = 2226
integer y = 60
integer width = 658
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_sales from datawindow within w_scene2_m
integer x = 2222
integer y = 136
integer width = 672
integer height = 84
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_salesman

dw_1.reset() ; dw_2.reset() ; dw_3.reset()

this.accepttext()
ls_salesman = this.object.user[1]

//if ls_salesman = "%" then
//	pb_insert.enabled = true
//	pb_delete.enabled = true
//	pb_save.enabled   = true
//else
//	pb_insert.enabled = false
//	pb_delete.enabled = false
//	pb_save.enabled   = false
//end if

pb_retrieve.PostEvent( clicked! )

end event

type dw_4 from datawindow within w_scene2_m
integer x = 32
integer y = 1840
integer width = 2217
integer height = 380
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdsscene_list4"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_horizontal1 from u_splitbar_horizontal within w_scene2_m
integer x = 32
integer y = 1816
integer width = 2217
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_scene2_m
integer x = 919
integer y = 320
integer width = 288
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

