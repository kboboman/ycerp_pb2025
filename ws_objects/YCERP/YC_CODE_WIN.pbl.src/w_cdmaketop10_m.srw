$PBExportHeader$w_cdmaketop10_m.srw
$PBExportComments$전략품목 관리(생산)
forward
global type w_cdmaketop10_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdmaketop10_m
end type
type st_4 from statictext within w_cdmaketop10_m
end type
type sle_no from singlelineedit within w_cdmaketop10_m
end type
type sle_nm from singlelineedit within w_cdmaketop10_m
end type
type st_8 from statictext within w_cdmaketop10_m
end type
type ddlb_fld from dropdownlistbox within w_cdmaketop10_m
end type
type st_9 from statictext within w_cdmaketop10_m
end type
type sle_value from singlelineedit within w_cdmaketop10_m
end type
type cb_filteron from commandbutton within w_cdmaketop10_m
end type
type cb_filteroff from commandbutton within w_cdmaketop10_m
end type
type cb_1 from commandbutton within w_cdmaketop10_m
end type
type cb_2 from commandbutton within w_cdmaketop10_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdmaketop10_m
end type
type pb_2 from picturebutton within w_cdmaketop10_m
end type
type st_2 from statictext within w_cdmaketop10_m
end type
type dw_3 from datawindow within w_cdmaketop10_m
end type
type cb_past from commandbutton within w_cdmaketop10_m
end type
type ddlb_op from dropdownlistbox within w_cdmaketop10_m
end type
end forward

global type w_cdmaketop10_m from w_inheritance
integer x = 320
integer y = 552
integer width = 3451
integer height = 2540
string title = "생산품목 그룹관리(w_cdmaketop10_m)"
cb_3 cb_3
st_4 st_4
sle_no sle_no
sle_nm sle_nm
st_8 st_8
ddlb_fld ddlb_fld
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
ddlb_dwtitles ddlb_dwtitles
pb_2 pb_2
st_2 st_2
dw_3 dw_3
cb_past cb_past
ddlb_op ddlb_op
end type
global w_cdmaketop10_m w_cdmaketop10_m

type variables
//gs_where istr_where
st_print i_print
DataWindowChild idwc_wc
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),"yyyy/mm/dd"), THIS.Title )
//=============================================================================================
string ls_area

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	long ll_Y ; string ls_value, ls_val[]
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	for ll_Y = 1 to ddlb_dwtitles.totalitems()
		ls_value  = ddlb_dwtitles.text( ll_Y )

		GF_Split(ls_value, "|", ls_val)		
		dw_1.Modify( ls_val[3] + ".Protect=1")
	next
end if

dw_2.visible   = false
sle_no.visible = false
sle_nm.visible = false
cb_past.enabled = false

ls_area  = GS_AREA
dw_1.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)

if GF_Permission("생산품목관리자", gs_userid) = "Y" then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

// 작업장
dw_3.getchild("wc_no",idwc_wc)
idwc_wc.settransobject(sqlca)
idwc_wc.retrieve()

dw_3.insertrow(0)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,"work_no","A00")
idwc_wc.setitem(1,"work_name","전체")
idwc_wc.setitem(1,"area_no", ls_area)
idwc_wc.accepttext()
dw_3.object.wc_no[1] = "A00"

idwc_wc.setfilter( "right(work_no,2) = '00'" )
idwc_wc.filter()

end event

on w_cdmaketop10_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_4=create st_4
this.sle_no=create sle_no
this.sle_nm=create sle_nm
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.ddlb_dwtitles=create ddlb_dwtitles
this.pb_2=create pb_2
this.st_2=create st_2
this.dw_3=create dw_3
this.cb_past=create cb_past
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.sle_no
this.Control[iCurrent+4]=this.sle_nm
this.Control[iCurrent+5]=this.st_8
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.st_9
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_filteron
this.Control[iCurrent+10]=this.cb_filteroff
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.pb_2
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.dw_3
this.Control[iCurrent+17]=this.cb_past
this.Control[iCurrent+18]=this.ddlb_op
end on

on w_cdmaketop10_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_4)
destroy(this.sle_no)
destroy(this.sle_nm)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.ddlb_dwtitles)
destroy(this.pb_2)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.cb_past)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
dw_1.width  = newwidth  - 64
dw_1.height = newheight - 440
end event

type pb_save from w_inheritance`pb_save within w_cdmaketop10_m
integer x = 2784
integer y = 64
end type

event pb_save::clicked;//
int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()

if dw_1.rowcount() < 1 then return

if gf_permission("생산품목관리자", gs_userid) = "Y" then
else
	return
end if

for ll_count = 1 to dw_1.rowcount()
	if isnull(dw_1.object.cat1[ll_count]) OR dw_1.object.cat2[ll_count] <= "" then
		MessageBox("입력오류", string(ll_count) + " 번째 대분류를 입력하십시오")
		dw_1.setcolumn("cat1")
		dw_1.setfocus()
		dw_1.scrolltorow(ll_count)
		return
	end if
next

//==GF_USEPROGRAM(프로그램 사용현황)===============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//=================================================================================================
wf_update1(dw_1, "Y")

end event

type dw_1 from w_inheritance`dw_1 within w_cdmaketop10_m
integer x = 27
integer y = 412
integer width = 3351
integer height = 1996
string dataobject = "d_cdmaketop10_m"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;////
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdmaketop10_m
integer y = 20
integer width = 1225
integer height = 140
string text = "생산품목 그룹관리"
end type

type st_tips from w_inheritance`st_tips within w_cdmaketop10_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdmaketop10_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdmaketop10_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdmaketop10_m
integer x = 2976
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdmaketop10_m
integer x = 2592
integer y = 56
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then
	return
end if
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원 HP 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdmaketop10_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdmaketop10_m
integer x = 2400
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;//
string ls_driver, ls_bank_check
int    li_count

if dw_1.rowcount() < 1 then return	

if MessageBox("확인","삭제하시겠습니까?",information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.deleterow(0)
wf_update1(dw_1,"Y")

end event

type pb_insert from w_inheritance`pb_insert within w_cdmaketop10_m
integer x = 2208
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;// 추가
gs_where2 lstr_where
long   ll_row, ll_cnt
string ls_wcno
string ls_itemno, ls_itemnm

dw_1.accepttext()
dw_3.accepttext()

ls_wcno = trim(dw_3.object.wc_no[1])
if isnull(ls_wcno) OR ls_wcno = "" OR ls_wcno = "A00" then
	dw_3.setfocus()
	MessageBox("확인","작업장을 선택하십시요")
	RETURN
end if


// 생산성 집계분석에서 선택한 품명
if isnull(sle_no.text) OR sle_no.text = "" then
else
	ls_itemno = sle_no.text
end if

if isnull(sle_nm.text) OR sle_nm.text = "" then
else
	ls_itemnm = sle_nm.text
end if

if isnull(sle_no.text) OR sle_no.text = "" then
	/////////////////////////////////////////////////////////////////
	// 다중추가 화면
	/////////////////////////////////////////////////////////////////
	lstr_where.chk     = "M"   // M:multi S:single
	lstr_where.chk1    = ls_wcno
	//lstr_where.str8[1] = em_1.text
	//OpenWithParm( w_whitemselectmulti_w, lstr_where )
	OpenWithParm( w_whitemlocqohmulti_w, lstr_where )
	lstr_where = Message.PowerObjectParm
	if lstr_where.chk = "N" then RETURN
	/////////////////////////////////////////////////////////////////
	
	for ll_row = 1 to UpperBound(lstr_where.str1)						
		ll_cnt = dw_1.insertrow(0)
	
		dw_1.object.work_no[ll_cnt]   = ls_wcno		   					// 작업장
		dw_1.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])	// 품목
		dw_1.object.cat1[ll_cnt]      = ""		   							// 대분류
		dw_1.object.cat2[ll_cnt]      = ""		   							// 중분류
		dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])	// 품명
		dw_1.object.sys_date[ll_cnt]  = gdt_todaytime						// 시스템일자
		dw_1.object.use_yn[ll_cnt]    = "Y"		   							// 사용
	next
	
	dw_1.scrolltorow(ll_cnt)	
else	
	if MessageBox("확인","'생산성 집계분석'에서 선택한 품목(" + ls_itemnm + ")을 가져옵니까?", Exclamation!, OKCancel!, 2) = 1 then
		ll_cnt = dw_1.insertrow(0)
		
		dw_1.object.work_no[ll_cnt]   = ls_wcno		   					// 작업장
		dw_1.object.item_no[ll_cnt]   = ls_itemno								// 품목
		dw_1.object.cat1[ll_cnt]      = ""		   							// 대분류
		dw_1.object.cat2[ll_cnt]      = ""		   							// 중분류
		dw_1.object.item_name[ll_cnt] = ls_itemnm								// 품명
		dw_1.object.sys_date[ll_cnt]  = gdt_todaytime						// 시스템일자
		dw_1.object.use_yn[ll_cnt]    = "Y"		   							// 사용
	else
		sle_no.text = ""
		sle_nm.text = ""
	end if

	dw_1.scrolltorow(ll_cnt)
end if

dw_1.setcolumn("cat1")
dw_1.setfocus()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdmaketop10_m
integer x = 2016
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_wcno

dw_3.accepttext()

ls_wcno = dw_3.object.wc_no[1]
dw_1.retrieve( ls_wcno )
if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_cdmaketop10_m
integer x = 1298
integer y = 16
integer width = 663
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdmaketop10_m
integer x = 27
integer y = 236
integer width = 3351
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdmaketop10_m
integer x = 1979
integer y = 16
integer width = 1211
integer height = 216
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdmaketop10_m
integer x = 754
integer y = 20
integer width = 114
integer height = 76
integer taborder = 60
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_cdmaketop10_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

type st_4 from statictext within w_cdmaketop10_m
integer x = 37
integer y = 204
integer width = 407
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "생산품목관리자"
boolean focusrectangle = false
end type

type sle_no from singlelineedit within w_cdmaketop10_m
integer x = 882
integer y = 24
integer width = 169
integer height = 68
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type sle_nm from singlelineedit within w_cdmaketop10_m
integer x = 882
integer y = 108
integer width = 169
integer height = 68
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_8 from statictext within w_cdmaketop10_m
integer x = 91
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

type ddlb_fld from dropdownlistbox within w_cdmaketop10_m
integer x = 274
integer y = 288
integer width = 480
integer height = 580
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

type st_9 from statictext within w_cdmaketop10_m
integer x = 791
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdmaketop10_m
integer x = 1239
integer y = 292
integer width = 581
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
textcase textcase = upper!
end type

type cb_filteron from commandbutton within w_cdmaketop10_m
integer x = 1833
integer y = 288
integer width = 197
integer height = 84
integer taborder = 110
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

type cb_filteroff from commandbutton within w_cdmaketop10_m
integer x = 2034
integer y = 288
integer width = 197
integer height = 84
integer taborder = 120
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

arg_dw  = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_cdmaketop10_m
integer x = 2235
integer y = 288
integer width = 183
integer height = 84
integer taborder = 130
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_cdmaketop10_m
integer x = 2423
integer y = 288
integer width = 183
integer height = 84
integer taborder = 140
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type ddlb_dwtitles from dropdownlistbox within w_cdmaketop10_m
integer x = 334
integer y = 296
integer width = 306
integer height = 92
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

type pb_2 from picturebutton within w_cdmaketop10_m
event mousemove pbm_mousemove
integer x = 2592
integer y = 64
integer width = 187
integer height = 144
integer taborder = 110
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_1
if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos = PosA(ls_Named, ".")
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

type st_2 from statictext within w_cdmaketop10_m
integer x = 1326
integer y = 60
integer width = 599
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cdmaketop10_m
string tag = "d_whwc_s"
integer x = 1326
integer y = 136
integer width = 599
integer height = 80
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_whwc_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
pb_retrieve.triggerevent( clicked! )

end event

type cb_past from commandbutton within w_cdmaketop10_m
integer x = 2953
integer y = 288
integer width = 402
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "붙혀넣기"
end type

event clicked;//
string	ls_itemno, ls_itemnm, ls_msg
long		ll_row, ll_rc
integer  iRet

debugbreak()

ll_rc = dw_1.ImportClipBoard( 2 )		// 1번 라인 SKIP
if ll_rc > 0 then
	// Long. Returns the number of rows that were imported if it succeeds and returns the following values if an error occurs:
	//  0  End of file, too many rows
	// -2  Not enough columns
	// -3  Invalid argument
	// -4  Invalid input
	
	ClipBoard("")
	
	for ll_row = 1 to dw_1.rowcount()
		ls_itemnm = dw_1.object.item_name[ll_row]
		
		SELECT rtrim(item_no) INTO :ls_itemno FROM groupitem WHERE item_name = :ls_itemnm;
		dw_1.object.item_no[ll_row] = ls_itemno;
	next
	
//	cb_4.enabled = true	
	MessageBox("확인","가져오기 완료" )
else
	choose case ll_rc
		case 0
			ls_msg = "End of file, too many rows"
		case -2
			ls_msg = "Not enough columns"
		case -3
			ls_msg = "Invalid argument"
		case -4
			ls_msg = "Invalid input"
	end choose
	MessageBox("확인",ls_msg )
end if

end event

type ddlb_op from dropdownlistbox within w_cdmaketop10_m
integer x = 960
integer y = 284
integer width = 270
integer height = 500
integer taborder = 70
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

