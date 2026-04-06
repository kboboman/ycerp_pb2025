$PBExportHeader$w_cdscene2_m.srw
$PBExportComments$영업현장목록
forward
global type w_cdscene2_m from w_inheritance
end type
type st_2 from statictext within w_cdscene2_m
end type
type ddlb_fld from dropdownlistbox within w_cdscene2_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdscene2_m
end type
type st_5 from statictext within w_cdscene2_m
end type
type sle_value from singlelineedit within w_cdscene2_m
end type
type cb_1 from commandbutton within w_cdscene2_m
end type
type cb_2 from commandbutton within w_cdscene2_m
end type
type cb_3 from commandbutton within w_cdscene2_m
end type
type cb_4 from commandbutton within w_cdscene2_m
end type
type dw_3 from datawindow within w_cdscene2_m
end type
type st_vertical from u_splitbar_vertical within w_cdscene2_m
end type
type st_horizontal1 from u_splitbar_horizontal within w_cdscene2_m
end type
type cb_5 from commandbutton within w_cdscene2_m
end type
type cb_6 from commandbutton within w_cdscene2_m
end type
type cbx_title from checkbox within w_cdscene2_m
end type
type dw_4 from datawindow within w_cdscene2_m
end type
type st_horizontal2 from u_splitbar_horizontal within w_cdscene2_m
end type
type st_8 from statictext within w_cdscene2_m
end type
type dw_sales from datawindow within w_cdscene2_m
end type
type ddlb_op from dropdownlistbox within w_cdscene2_m
end type
end forward

global type w_cdscene2_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4448
integer height = 2352
string title = "선행영업 현장(w_cdscene2_m)"
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
st_horizontal1 st_horizontal1
cb_5 cb_5
cb_6 cb_6
cbx_title cbx_title
dw_4 dw_4
st_horizontal2 st_horizontal2
st_8 st_8
dw_sales dw_sales
ddlb_op ddlb_op
end type
global w_cdscene2_m w_cdscene2_m

type variables
string   is_dw

DataWindowChild idwc_sceneuse, idwc_user

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)

st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_rightobject(dw_3)
st_vertical.of_set_rightobject(dw_4)
st_vertical.of_set_minsize(250, 250)

st_horizontal1.of_set_topobject(dw_2)
st_horizontal1.of_set_bottomobject(dw_3)
st_horizontal1.of_set_minsize(250, 250)

st_horizontal2.of_set_topobject(dw_3)
st_horizontal2.of_set_bottomobject(dw_4)
st_horizontal2.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)

// 담당자
dw_sales.settransobject(sqlca)
dw_sales.insertrow(0)

if GF_Permission("선행영업_현장", gs_userid) = "Y" then
	dw_sales.getchild('user', idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1, 'user_id', '%')
	idwc_user.setitem(1, 'user_name', '전체')
	idwc_user.accepttext()
	dw_sales.object.user[1] = '%'
else
	dw_sales.enabled = false
	dw_sales.object.user[1] = gs_userid
	dw_sales.object.user.background.color = 67108864
end if

//
pb_insert.enabled = false
pb_delete.enabled = false
pb_save.enabled   = false

if GF_Permission("선행영업_현장", gs_userid) = "Y" then
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled   = true
end if

if GF_Permission("선행영업_현장명변경", gs_userid) = "Y" then
	cbx_title.enabled = true
else
	cbx_title.enabled = false
end if

pb_retrieve.PostEvent( clicked! )

end event

on w_cdscene2_m.create
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
this.st_horizontal1=create st_horizontal1
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cbx_title=create cbx_title
this.dw_4=create dw_4
this.st_horizontal2=create st_horizontal2
this.st_8=create st_8
this.dw_sales=create dw_sales
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
this.Control[iCurrent+12]=this.st_horizontal1
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.cb_6
this.Control[iCurrent+15]=this.cbx_title
this.Control[iCurrent+16]=this.dw_4
this.Control[iCurrent+17]=this.st_horizontal2
this.Control[iCurrent+18]=this.st_8
this.Control[iCurrent+19]=this.dw_sales
this.Control[iCurrent+20]=this.ddlb_op
end on

on w_cdscene2_m.destroy
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
destroy(this.st_horizontal1)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cbx_title)
destroy(this.dw_4)
destroy(this.st_horizontal2)
destroy(this.st_8)
destroy(this.dw_sales)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width          = newwidth  - (gb_2.x * 2)

dw_1.height         = newheight - dw_1.y - gb_2.x

st_vertical.x       = dw_1.x + dw_1.width
st_vertical.height  = dw_1.height

dw_2.x              = st_vertical.x + st_vertical.width 
dw_2.width          = newwidth  - dw_2.x - gb_2.x
dw_2.height         = (dw_1.height * 0.4)

st_horizontal1.x     = st_vertical.x + st_vertical.width
st_horizontal1.y     = dw_2.y + dw_2.height
st_horizontal1.width = dw_2.width

dw_3.y              = st_horizontal1.y + st_horizontal1.height
dw_3.width          = newwidth  - dw_3.x - gb_2.x
dw_3.height         = (dw_1.height * 0.3)

st_horizontal2.x     = st_vertical.x + st_vertical.width
st_horizontal2.y     = dw_3.y + dw_3.height
st_horizontal2.width = dw_3.width

dw_4.y              = st_horizontal2.y + st_horizontal2.height
dw_4.width          = newwidth  - dw_4.x - gb_2.x
dw_4.height         = (dw_1.height * 0.3)


end event

type pb_save from w_inheritance`pb_save within w_cdscene2_m
integer x = 2670
integer y = 64
end type

event pb_save::clicked;//
string ls_scene, ls_scenedesc, ls_yyyymm, ls_max
long   ll_row, ll_dw1cnt, ll_dw2cnt, ll_dw3cnt, ll_max

if dw_1.rowcount() < 1 then RETURN

ll_dw1cnt = dw_1.getrow()
ll_dw2cnt = dw_2.getrow()

debugbreak()

dw_2.accepttext() ; dw_3.accepttext() ; dw_4.accepttext()

ls_scene     = dw_2.object.scene_code[ll_dw2cnt]
ls_scenedesc = Upper(trim(dw_2.object.scene_desc[ll_dw2cnt]))
ls_scenedesc = GF_ReplaceAll(ls_scenedesc, " ", "")

// 추가
if isnull(ls_scene) OR ls_scene = "" then
	for ll_row = 1 to dw_1.rowcount()
		if dw_1.object.scenedesc[ll_row] = ls_scenedesc then
			MessageBox("확인", "현장명이 중복 됩니다.")
			dw_1.ScrollToRow( ll_row )
			RETURN
		end if
	next

	ls_yyyymm = string(GF_Today(), "yyyymm") 
	SELECT top 1 right(scene_code,3) INTO :ls_max 
	  FROM sscene 
	 WHERE scene_code LIKE :ls_yyyymm + '%' ORDER BY scene_code DESC;
	if isnull(ls_max) OR ls_max = "" then
		ll_max = 1
	else
		ll_max = long(ls_max) + 1
	end if
	ls_scene  = ls_yyyymm + "-" + RightA("000" + string(ll_max), 3)

	dw_2.object.scene_code[dw_2.getrow()]  = ls_scene	
	dw_2.object.make_date[dw_2.getrow()]   = GF_Today()
end if

// 현장명 조합하기
if IsNull(dw_2.object.area_nm[ll_dw2cnt]) OR dw_2.object.area_nm[ll_dw2cnt] = "" then
	MessageBox("오류", "지역이 입력되지 않았습니다.",exclamation!)
	dw_2.setcolumn("area_nm")
	dw_2.setfocus()
	RETURN
end if

// 현장명 변경
if cbx_title.checked = true then
	dw_2.object.scene_desc[ll_dw2cnt] = dw_2.object.area_nm[ll_dw2cnt] + " " + dw_2.object.scene_desc[ll_dw2cnt]
end if

// 현장코드 부여
for ll_row = 1 to dw_3.rowcount()
	dw_3.object.scene_code[ll_row] = ls_scene
	dw_3.object.sc_no[ll_row]      = ll_row

	dw_4.object.scene_code[ll_row] = ls_scene
next

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
cbx_title.checked = false
cbx_title.TriggerEvent( clicked! )

WF_Update3( dw_2, dw_3, dw_4, "Y" )

//
dw_1.retrieve()
if ll_dw1cnt > 0 then
	dw_1.scrolltorow( ll_dw1cnt )
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdscene2_m
integer x = 32
integer y = 444
integer width = 2217
integer height = 1768
string dataobject = "d_cdsscene_list"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_scene

ls_scene  = this.object.scene_code[row]

dw_2.getchild( "scene_use", idwc_sceneuse)
idwc_sceneuse.SetTransObject( SQLCA )
idwc_sceneuse.Retrieve( "선행영업_용도" )

dw_2.retrieve( ls_scene )
dw_2.object.scene_code.TabSequence = 0

dw_3.retrieve( ls_scene )

dw_4.retrieve( ls_scene )

end event

type st_title from w_inheritance`st_title within w_cdscene2_m
integer x = 32
integer y = 32
integer width = 1010
string text = "선행영업 현장"
end type

type st_tips from w_inheritance`st_tips within w_cdscene2_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdscene2_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdscene2_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdscene2_m
integer x = 2862
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdscene2_m
integer x = 2478
integer y = 64
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

type pb_cancel from w_inheritance`pb_cancel within w_cdscene2_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdscene2_m
integer x = 2286
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;//
string ls_scene
long   ll_row, ll_dw1cnt

ll_dw1cnt = dw_1.getrow()
ls_scene  = dw_2.object.scene_code[dw_2.getrow()]

if MessageBox("확인","삭제 하시겠습니까?",information!, OKCancel!, 2) = 2 then RETURN

for ll_row = dw_3.rowcount() to 1 step -1
	dw_3.DeleteRow(ll_row)
next
dw_2.DeleteRow(0)

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "D", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
WF_Update2( dw_2, dw_3, "N" )

//
dw_1.retrieve()
if ll_dw1cnt > 0 then
	dw_1.ScrollToRow( ll_dw1cnt )
end if
MessageBox("확인","작업완료")

end event

type pb_insert from w_inheritance`pb_insert within w_cdscene2_m
integer x = 2094
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;//
string ls_scene, ls_scenedesc
long   ll_row, ll_dw2cnt, ll_dw3cnt, ll_dw4cnt

// 현장명 조합
cbx_title.checked = true

dw_2.getchild( "scene_use", idwc_sceneuse)
idwc_sceneuse.SetTransObject( SQLCA )
idwc_sceneuse.Retrieve( "선행영업_용도" )

ll_dw2cnt = dw_2.insertrow(0)
dw_2.scrolltorow(ll_dw2cnt)

//
dw_3.reset()
ll_dw3cnt = dw_3.insertrow( dw_3.getrow() )

dw_3.scrolltorow(ll_dw3cnt)
dw_3.object.sc_no[ll_dw3cnt] = ll_dw3cnt

//
dw_4.reset()
ll_dw4cnt = dw_4.insertrow( dw_4.getrow() )
dw_4.object.user_id[ll_dw4cnt] = gs_userid

//
dw_2.setcolumn("area_nm")
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdscene2_m
integer x = 1902
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_salesman

dw_sales.accepttext()
ls_salesman  = dw_sales.object.user[1]

dw_2.reset() ; dw_3.reset() ; dw_4.reset()

if ls_salesman = "%" then
	dw_1.dataobject = "d_cdsscene_list"
	dw_1.SetTransObject(SQLCA)
	dw_1.retrieve()
else
	dw_1.dataobject = "d_cdsscene_list3"
	dw_1.SetTransObject(SQLCA)
	dw_1.retrieve( ls_salesman )
end if


end event

type gb_3 from w_inheritance`gb_3 within w_cdscene2_m
integer x = 1106
integer y = 16
integer width = 736
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdscene2_m
integer y = 268
integer width = 4334
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdscene2_m
integer x = 1865
integer y = 16
integer width = 1216
integer height = 216
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdscene2_m
integer x = 2313
integer y = 444
integer width = 2053
integer height = 528
integer taborder = 60
string dataobject = "d_cdsscene_m"
boolean vscrollbar = false
end type

event dw_2::rbuttondown;call super::rbuttondown;//
gs_zipcode ls_zipcode
string   ls_roadzip, ls_zips, ls_addr, ls_zip[], ls_address[]

gs_calendar lstr_calendar
datetime ctime1, ctime2

DEBUGBREAK()

if row < 1 then RETURN

ctime1 = this.object.construct_time1[row]
ctime2 = this.object.construct_time2[row]
if isnull(ctime1) then this.object.construct_time1[row] = GF_Today()
if isnull(ctime2) then this.object.construct_time2[row] = GF_Today()

SELECT item_cd INTO :ls_roadzip FROM CodeMST WHERE type = '우편번호' AND use_yn = 'Y';
if isnull(ls_roadzip) OR ls_roadzip = "" then ls_roadzip = "ROAD"

choose case dwo.name
	case "site_zip"
		OpenWithParm(w_postcode_daum, ls_zipcode)
		ls_zipcode = Message.PowerObjectParm
		if ls_zipcode.chk <> "N" then
			ls_zips  = ls_zipcode.zipcode
			ls_addr  = ls_zipcode.address
			
			GF_Split(ls_zips, "|", ls_zip)
			GF_Split(ls_addr, "|", ls_address)

			if ls_roadzip = "ROAD" then
				this.object.site_zip[1] = ls_zip[1]
				this.object.address[1]  = ls_address[1]
			else
				this.object.site_zip[1] = ls_zip[2]
				this.object.address[1]  = ls_address[2]
			end if
		end if		

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

type st_2 from statictext within w_cdscene2_m
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

type ddlb_fld from dropdownlistbox within w_cdscene2_m
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

type ddlb_dwtitles from dropdownlistbox within w_cdscene2_m
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

type st_5 from statictext within w_cdscene2_m
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

type sle_value from singlelineedit within w_cdscene2_m
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

type cb_1 from commandbutton within w_cdscene2_m
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

type cb_2 from commandbutton within w_cdscene2_m
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

type cb_3 from commandbutton within w_cdscene2_m
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

type cb_4 from commandbutton within w_cdscene2_m
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

type dw_3 from datawindow within w_cdscene2_m
integer x = 2313
integer y = 1024
integer width = 2053
integer height = 664
integer taborder = 30
boolean bringtotop = true
string title = "권한별거래처목록"
string dataobject = "d_cdsscene_mdet"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull(row) OR row < 1 then RETURN

This.ScrollToRow( row )

//This.SelectRow( 0, false )
//This.SelectRow( row, true )

end event

type st_vertical from u_splitbar_vertical within w_cdscene2_m
integer x = 2267
integer y = 444
integer height = 1768
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal1.x      = this.x + this.width
st_horizontal1.width  = dw_2.width

st_horizontal2.x      = this.x + this.width
st_horizontal2.width  = dw_2.width

end event

type st_horizontal1 from u_splitbar_horizontal within w_cdscene2_m
integer x = 2313
integer y = 988
integer width = 2053
boolean bringtotop = true
end type

type cb_5 from commandbutton within w_cdscene2_m
integer x = 3378
integer y = 320
integer width = 187
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "INS"
end type

event clicked;//
long  ll_row

choose case is_dw
	case "dw_3"
		ll_row = dw_3.insertrow( 0 )
		
		dw_3.scrolltorow( ll_row )
		dw_3.object.sc_no[ll_row] = ll_row

	case "dw_4"
		ll_row = dw_4.insertrow( 0 )
		
		dw_4.scrolltorow( ll_row )
		dw_4.object.scene_code[ll_row] = dw_2.object.scene_code[1]
		dw_4.object.scene_desc[ll_row] = dw_2.object.scene_desc[1]
		
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose

end event

type cb_6 from commandbutton within w_cdscene2_m
integer x = 3570
integer y = 320
integer width = 187
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "DEL"
end type

event clicked;//
string ls_scene, ls_scno
long   ll_row, ll_dw1cnt, ll_dw3cnt, ll_scno

ll_dw1cnt = dw_1.getrow()

ll_dw3cnt = dw_3.getrow()
ls_scene  = dw_3.object.scene_code[ll_dw3cnt]
ll_scno   = dw_3.object.sc_no[ll_dw3cnt]

if MessageBox("확인",string(ll_scno) + " 행 삭제 하시겠습니까?",information!, OKCancel!, 2) = 2 then RETURN

dw_3.DeleteRow( ll_dw3cnt )
if isnull(ls_scene) OR ls_scene = "" then
	//
else
	WF_Update1( dw_3, "Y" )
end if
end event

type cbx_title from checkbox within w_cdscene2_m
integer x = 2405
integer y = 324
integer width = 489
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
string text = "현장명 변경"
end type

event clicked;// 현장명 변경
if this.checked = true then
	dw_2.object.chk[dw_2.getrow()] = "Y"
else
	dw_2.object.chk[dw_2.getrow()] = "N"
end if

end event

type dw_4 from datawindow within w_cdscene2_m
integer x = 2313
integer y = 1744
integer width = 2053
integer height = 464
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdsscene_sales"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_4"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull(row) OR row < 1 then RETURN

This.ScrollToRow( row )

//This.SelectRow( 0, false )
//This.SelectRow( row, true )

end event

type st_horizontal2 from u_splitbar_horizontal within w_cdscene2_m
integer x = 2313
integer y = 1708
integer width = 2053
boolean bringtotop = true
end type

type st_8 from statictext within w_cdscene2_m
integer x = 1143
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

type dw_sales from datawindow within w_cdscene2_m
integer x = 1138
integer y = 136
integer width = 672
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_salesman

dw_1.reset() ; dw_2.reset() ; dw_3.reset() ; dw_4.reset()

this.accepttext()
ls_salesman = this.object.user[1]

if ls_salesman = "%" then
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled   = true
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

end event

type ddlb_op from dropdownlistbox within w_cdscene2_m
integer x = 923
integer y = 320
integer width = 283
integer height = 500
integer taborder = 80
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

