$PBExportHeader$w_cdissueitem_m.srw
$PBExportComments$이슈품목 관리
forward
global type w_cdissueitem_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdissueitem_m
end type
type st_4 from statictext within w_cdissueitem_m
end type
type sle_no from singlelineedit within w_cdissueitem_m
end type
type sle_nm from singlelineedit within w_cdissueitem_m
end type
type st_8 from statictext within w_cdissueitem_m
end type
type ddlb_fld from dropdownlistbox within w_cdissueitem_m
end type
type st_9 from statictext within w_cdissueitem_m
end type
type sle_value from singlelineedit within w_cdissueitem_m
end type
type cb_filteron from commandbutton within w_cdissueitem_m
end type
type cb_filteroff from commandbutton within w_cdissueitem_m
end type
type cb_1 from commandbutton within w_cdissueitem_m
end type
type cb_2 from commandbutton within w_cdissueitem_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdissueitem_m
end type
type pb_2 from picturebutton within w_cdissueitem_m
end type
type cbx_edit from checkbox within w_cdissueitem_m
end type
type pb_multi from picturebutton within w_cdissueitem_m
end type
type ddlb_op from dropdownlistbox within w_cdissueitem_m
end type
end forward

global type w_cdissueitem_m from w_inheritance
integer x = 320
integer y = 552
integer width = 3451
integer height = 2540
string title = "이슈품목 관리(w_cdissueitem_m)"
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
cbx_edit cbx_edit
pb_multi pb_multi
ddlb_op ddlb_op
end type
global w_cdissueitem_m w_cdissueitem_m

type variables
//gs_where istr_where
st_print i_print

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_1.object.user_id.TabSequence = 0
pb_insert.enabled = false

sle_no.visible = false
sle_nm.visible = false

dw_1.SetTransObject(SQLCA)
pb_retrieve.triggerevent(clicked!)
//dw_1.sharedata(dw_2)

if gf_permission('이슈품목관리자', gs_userid) = 'Y' then
else
	pb_delete.enabled = false
	pb_save.enabled   = false
	cbx_edit.enabled  = false
	pb_multi.enabled  = false
end if
	
end event

on w_cdissueitem_m.create
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
this.cbx_edit=create cbx_edit
this.pb_multi=create pb_multi
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
this.Control[iCurrent+15]=this.cbx_edit
this.Control[iCurrent+16]=this.pb_multi
this.Control[iCurrent+17]=this.ddlb_op
end on

on w_cdissueitem_m.destroy
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
destroy(this.cbx_edit)
destroy(this.pb_multi)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (27 * 2)

dw_1.width  = newwidth  - dw_1.x - 27
dw_1.height = newheight - dw_1.y - 27

end event

type pb_save from w_inheritance`pb_save within w_cdissueitem_m
integer x = 2971
integer y = 60
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()

if dw_1.rowcount() < 1 then return
if gf_permission('이슈품목관리자', gs_userid) = 'Y' then
else
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdissueitem_m
integer x = 27
integer y = 412
integer width = 3351
integer height = 1996
string title = "d_cditemtop10_m"
string dataobject = "d_orissueitem_m"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdissueitem_m
integer width = 1138
string text = "이슈품목 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdissueitem_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdissueitem_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdissueitem_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdissueitem_m
integer x = 3163
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdissueitem_m
integer x = 2779
integer y = 60
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

type pb_cancel from w_inheritance`pb_cancel within w_cdissueitem_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdissueitem_m
integer x = 2587
integer y = 60
integer taborder = 130
end type

event pb_delete::clicked;string ls_driver, ls_bank_check
int li_count

if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.deleterow(0)
wf_update1(dw_1,"Y")

end event

type pb_insert from w_inheritance`pb_insert within w_cdissueitem_m
integer x = 2395
integer y = 60
integer taborder = 150
end type

event pb_insert::clicked;//
long   ll_row //, ll_count
string ls_itemno, ls_itemnm

if isnull(sle_no.text) or sle_no.text = "" then
else
	ls_itemno = sle_no.text
end if

if isnull(sle_nm.text) or sle_nm.text = "" then
else
	ls_itemnm = sle_nm.text
end if

dw_1.accepttext()

dw_1.object.user_id.TabSequence = 20

ll_row = dw_1.insertrow(0)
dw_1.object.sys_date[ll_row] = gdt_todaytime

if isnull(sle_no.text) or sle_no.text = "" then
else	
	if MessageBox("확인","물품코드관리에서 선택한 품목(" + ls_itemnm + ")을 가져옵니까?", Exclamation!, OKCancel!, 2) = 1 then
		dw_1.object.item_no[ll_row]   = ls_itemno
		dw_1.object.item_name[ll_row] = ls_itemnm
	end if
end if

dw_1.scrolltorow(ll_row)
dw_1.setcolumn('user_id')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdissueitem_m
integer x = 2203
integer y = 60
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve( "%" )
end event

type gb_3 from w_inheritance`gb_3 within w_cdissueitem_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdissueitem_m
integer x = 27
integer width = 3351
integer height = 168
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdissueitem_m
integer x = 2167
integer y = 20
integer width = 1211
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdissueitem_m
boolean visible = false
integer x = 1851
integer y = 4
integer width = 187
integer height = 80
integer taborder = 60
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_cdissueitem_m
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

type st_4 from statictext within w_cdissueitem_m
integer x = 1742
integer y = 172
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
string text = "이슈품목관리자"
boolean focusrectangle = false
end type

type sle_no from singlelineedit within w_cdissueitem_m
integer x = 1262
integer y = 40
integer width = 402
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

type sle_nm from singlelineedit within w_cdissueitem_m
integer x = 1262
integer y = 124
integer width = 402
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

type st_8 from statictext within w_cdissueitem_m
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

type ddlb_fld from dropdownlistbox within w_cdissueitem_m
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

type st_9 from statictext within w_cdissueitem_m
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

type sle_value from singlelineedit within w_cdissueitem_m
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

type cb_filteron from commandbutton within w_cdissueitem_m
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

type cb_filteroff from commandbutton within w_cdissueitem_m
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

type cb_1 from commandbutton within w_cdissueitem_m
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

type cb_2 from commandbutton within w_cdissueitem_m
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

type ddlb_dwtitles from dropdownlistbox within w_cdissueitem_m
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

type pb_2 from picturebutton within w_cdissueitem_m
event mousemove pbm_mousemove
integer x = 2779
integer y = 60
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
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

type cbx_edit from checkbox within w_cdissueitem_m
integer x = 2642
integer y = 300
integer width = 402
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 79416533
string text = "편집"
end type

event clicked;//
long ll_row

if this.checked = true then
	dw_1.object.user_id.TabSequence = 20
else
	dw_1.object.user_id.TabSequence = 0
end if
end event

type pb_multi from picturebutton within w_cdissueitem_m
integer x = 2962
integer y = 280
integer width = 389
integer height = 88
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
vtextalign vtextalign = vcenter!
end type

event clicked;// 다중추가
gs_where2 lstr_where

long    ll_row, ll_cnt, ll_find, ll_skip
string  ls_area, ls_locno, ls_itemno, ls_itemnm, ls_qa, ls_savestock, ls_uom, ls_sdate

cbx_edit.checked = true
dw_1.object.user_id.TabSequence = 12

ls_sdate = string(gf_today(),"yyyy/mm/dd")

ls_area  = gs_area
ls_locno = "WS00000000"

debugbreak()

/////////////////////////////////////////////////////////////////
// 다중추가 화면
/////////////////////////////////////////////////////////////////
lstr_where.chk     = "M"   // M:multi S:single
lstr_where.chk1    = ls_locno
lstr_where.str8[1] = ls_sdate
OpenWithParm( w_whitemlocqohmulti_w2, lstr_where )
lstr_where = Message.PowerObjectParm
/////////////////////////////////////////////////////////////////

if lstr_where.chk <> "Y" then RETURN

ll_skip  = dw_1.rowcount()
//=============================================================//
// 다중추가 품목 반영하기
//=============================================================//
//					SET before_qty = :ld_qoh
//					  , rcpt_qty   = 0
//					  , issue_qty  = 0
//					  , ret_qty    = 0
//				     , etc_qty    = 0
//					  , qoh        = :ld_qoh
//
for ll_row = 1 to UpperBound(lstr_where.str1)                  
   ls_itemno = trim(lstr_where.str1[ll_row])
   ls_itemnm = Trim(lstr_where.name[ll_row])
   ls_qa     = trim(lstr_where.str2[ll_row])
   ls_uom    = trim(lstr_where.str3[ll_row])
	
	ll_find = dw_1.Find( "item_no = '"+ls_itemno+"' and qa = '"+ls_qa+"'", 1, dw_1.RowCount())
	if ll_find > 0 AND ll_find <= dw_1.rowcount() then
		ll_cnt = ll_find
	else
		ll_cnt = dw_1.InsertRow(0)
		dw_1.Object.item_no[ll_cnt]   = ls_itemno						// 품목
		dw_1.Object.item_name[ll_cnt] = ls_itemnm						// 품명
		dw_1.Object.qa[ll_cnt]        = ls_qa						   // 규격
		dw_1.Object.sys_date[ll_cnt]  = gf_today()					// 등록일자
	end if
	dw_1.ScrollToRow( ll_cnt )
next
//=============================================================//

//dw_1.ScrollToRow( ll_skip + 1 )

dw_1.SetColumn('user_id')
dw_1.SetFocus()

end event

type ddlb_op from dropdownlistbox within w_cdissueitem_m
integer x = 955
integer y = 288
integer width = 274
integer height = 500
integer taborder = 60
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

