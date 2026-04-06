$PBExportHeader$w_mproutingchk_r.srw
$PBExportComments$제품별 공정체크
forward 
global type w_mproutingchk_r from w_inheritance
end type
type pb_1 from picturebutton within w_mproutingchk_r
end type
type st_13 from statictext within w_mproutingchk_r
end type
type ddlb_fld from dropdownlistbox within w_mproutingchk_r
end type
type st_14 from statictext within w_mproutingchk_r
end type
type ddlb_op from dropdownlistbox within w_mproutingchk_r
end type
type sle_value from singlelineedit within w_mproutingchk_r
end type
type cb_10 from commandbutton within w_mproutingchk_r
end type
type cb_14 from commandbutton within w_mproutingchk_r
end type
type cb_15 from commandbutton within w_mproutingchk_r
end type
type cb_16 from commandbutton within w_mproutingchk_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mproutingchk_r
end type
type st_1 from statictext within w_mproutingchk_r
end type
type dw_3 from datawindow within w_mproutingchk_r
end type
type dw_4 from datawindow within w_mproutingchk_r
end type
type cb_routchange from commandbutton within w_mproutingchk_r
end type
type cbx_all from checkbox within w_mproutingchk_r
end type
type dw_5 from datawindow within w_mproutingchk_r
end type
type sle_qa from singlelineedit within w_mproutingchk_r
end type
type cbx_not from checkbox within w_mproutingchk_r
end type
type cbx_select from checkbox within w_mproutingchk_r
end type
type ddlb_qa from dropdownlistbox within w_mproutingchk_r
end type
type st_horizontal from u_splitbar_horizontal within w_mproutingchk_r
end type
type st_vertical from u_splitbar_vertical within w_mproutingchk_r
end type
end forward

global type w_mproutingchk_r from w_inheritance
integer x = 0
integer y = 0
integer width = 4946
integer height = 2516
string title = "제품별 공정체크(w_mproutingchk_r)"
string icon = "Database!"
pb_1 pb_1
st_13 st_13
ddlb_fld ddlb_fld
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
ddlb_dwtitles ddlb_dwtitles
st_1 st_1
dw_3 dw_3
dw_4 dw_4
cb_routchange cb_routchange
cbx_all cbx_all
dw_5 dw_5
sle_qa sle_qa
cbx_not cbx_not
cbx_select cbx_select
ddlb_qa ddlb_qa
st_horizontal st_horizontal
st_vertical st_vertical
end type
global w_mproutingchk_r w_mproutingchk_r

type variables
datawindowchild idwc_area, idwc_wc
st_print i_print

date   id_date1, id_date2
string is_wcno



Integer		ii_Columns, ii_OpenPos

// The following are used for the resizing service
boolean		ib_debug = False	   // Debug mode
long			il_hiddencolor  = 0	// Bar hidden color to match the window background
integer		ii_barthickness = 11	// Bar Thickness
integer		ii_windowborder = 25	// Window border to be used on all sides
dragobject	idrg_Vertical[2]	   // Reference to the vertical controls on the window

end variables

forward prototypes
public function integer wf_resizebars ()
public function integer wf_refreshbars ()
public function integer wf_resizepanels ()
end prototypes

public function integer wf_resizebars ();//Resize Bars according to Bars themselves, WindowBorder, and BarThickness.

Integer	li_HX, li_HW, li_Cnt

st_vertical.Move(st_vertical.X, ii_WindowBorder)
st_vertical.Resize(ii_barthickness, 5 + This.WorkSpaceHeight() - (2 * ii_WindowBorder))

wf_RefreshBars()

Return 1
end function

public function integer wf_refreshbars ();Integer	li_Cnt

//Force appropriate order
st_vertical.SetPosition(ToTop!)

//Make sure the Width is not lost
st_vertical.Width = ii_BarThickness

Return 1

end function

public function integer wf_resizepanels ();//Resize the panels according to the Lines, 
//BarThickness, and WindowBorder.

Integer	li_Cnt, li_X, li_Y, li_HHeight, li_HWidth
Long		ll_Width, ll_Height

ll_Width  = this.WorkSpaceWidth()
ll_Height = this.WorkspaceHeight()

If ll_Width < idrg_Vertical[2].X + 150 Then
	ll_Width = idrg_Vertical[2].X + 150
End If

If ll_Height < idrg_Vertical[1].Y + 150 Then
	ll_Height = Idrg_Vertical[1].Y + 150
End If

// Left vertical object processing
idrg_Vertical[1].Move (ii_WindowBorder, ii_WindowBorder)
idrg_Vertical[1].Resize (st_vertical.X - idrg_Vertical[1].X, ll_Height - idrg_Vertical[1].Y - ii_WindowBorder)

// Right vertical object processing
idrg_Vertical[2].Move (st_vertical.X + ii_BarThickness, ii_WindowBorder)
idrg_Vertical[2].Resize (ll_Width - idrg_Vertical[2].X - ii_WindowBorder, ll_Height - idrg_Vertical[2].Y - ii_WindowBorder)

Return 1

end function

on w_mproutingchk_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.st_13=create st_13
this.ddlb_fld=create ddlb_fld
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cb_routchange=create cb_routchange
this.cbx_all=create cbx_all
this.dw_5=create dw_5
this.sle_qa=create sle_qa
this.cbx_not=create cbx_not
this.cbx_select=create cbx_select
this.ddlb_qa=create ddlb_qa
this.st_horizontal=create st_horizontal
this.st_vertical=create st_vertical
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_13
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.st_14
this.Control[iCurrent+5]=this.ddlb_op
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_10
this.Control[iCurrent+8]=this.cb_14
this.Control[iCurrent+9]=this.cb_15
this.Control[iCurrent+10]=this.cb_16
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.dw_3
this.Control[iCurrent+14]=this.dw_4
this.Control[iCurrent+15]=this.cb_routchange
this.Control[iCurrent+16]=this.cbx_all
this.Control[iCurrent+17]=this.dw_5
this.Control[iCurrent+18]=this.sle_qa
this.Control[iCurrent+19]=this.cbx_not
this.Control[iCurrent+20]=this.cbx_select
this.Control[iCurrent+21]=this.ddlb_qa
this.Control[iCurrent+22]=this.st_horizontal
this.Control[iCurrent+23]=this.st_vertical
end on

on w_mproutingchk_r.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.st_13)
destroy(this.ddlb_fld)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.ddlb_dwtitles)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cb_routchange)
destroy(this.cbx_all)
destroy(this.dw_5)
destroy(this.sle_qa)
destroy(this.cbx_not)
destroy(this.cbx_select)
destroy(this.ddlb_qa)
destroy(this.st_horizontal)
destroy(this.st_vertical)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_bottomobject(dw_4)
st_horizontal.of_set_minsize(250, 250)

st_vertical.of_set_leftobject(dw_3)
st_vertical.of_set_rightobject(dw_4)
st_vertical.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

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

	ddlb_qa.enabled = false
	sle_qa.enabled  = false
	cbx_not.enabled = false
	cbx_select.enabled = false
	
	cbx_all.enabled = false
	dw_5.enabled    = false
	dw_5.object.wc_no.Background.Color = 67108864
	cb_routchange.enabled = false	
end if

//
dw_2.visible = false

dw_1.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)

// 전체작업장
dw_5.settransobject(sqlca)
dw_5.insertrow(0)  

dw_5.getchild("wc_no", idwc_wc)
idwc_wc.settransobject(sqlca)
idwc_wc.insertrow(1)
idwc_wc.setitem(1, "work_no",  "")
idwc_wc.setitem(1, "work_name","")
idwc_wc.accepttext()

dw_5.object.wc_no[1] = ""

end event

event resize;call super::resize;//
Long	ll_Width, ll_Height

gb_3.width  = newwidth  - (gb_3.x * 2)

ll_height   = newheight - dw_1.y - gb_3.x

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = ll_height * 0.6

st_horizontal.y     = dw_1.y + dw_1.height 
st_horizontal.width = newwidth  - (gb_3.x * 2)

dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.height = newheight - dw_3.y - gb_3.x

st_vertical.x      = dw_3.x + dw_3.width
st_vertical.y      = dw_3.y
st_vertical.height = dw_3.height

dw_4.x      = st_vertical.x + st_vertical.width
dw_4.y      = dw_3.y
dw_4.width  = newwidth  - dw_4.x - gb_3.x
dw_4.height = dw_3.height

//ddlb_qa.y   = dw_3.y
//sle_qa.y    = dw_3.y
//cbx_not.y   = dw_3.y + 15    
//cbx_select.y= dw_3.y + 15
//
//cbx_all.y   = dw_3.y + 15
//dw_5.y      = dw_3.y
//cb_routchange.y = dw_3.y

end event

type pb_save from w_inheritance`pb_save within w_mproutingchk_r
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_mproutingchk_r
integer x = 32
integer y = 428
integer width = 4379
integer height = 1108
integer taborder = 50
string dataobject = "d_mproutingchk_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
string ls_itemno
long   ll_cnt

if isnull(row) OR row < 1 then RETURN

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
ddlb_qa.enabled = false
sle_qa.enabled  = false
cbx_not.enabled = false
cbx_select.enabled = false

cbx_all.enabled = false
dw_5.enabled    = false
dw_5.object.wc_no.Background.Color = 67108864
cb_routchange.enabled = false		

ls_itemno = this.object.item_no[row]
if isnull(ls_itemno) OR ls_itemno = "" then RETURN

dw_4.reset()
dw_3.retrieve( ls_itemno )


end event

type st_title from w_inheritance`st_title within w_mproutingchk_r
integer x = 32
integer y = 20
integer width = 1143
integer height = 140
string text = "제품별 공정체크"
end type

type st_tips from w_inheritance`st_tips within w_mproutingchk_r
end type

type pb_compute from w_inheritance`pb_compute within w_mproutingchk_r
boolean visible = false
integer x = 3008
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mproutingchk_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mproutingchk_r
integer x = 1664
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mproutingchk_r
boolean visible = false
integer x = 4027
integer y = 48
integer taborder = 110
end type

event pb_print::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//w_repsuper w_print
//
//i_print.st_datawindow  = dw_2
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc  = " 이 프로그램은 물품별 생산현황(집계)을  출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=85'
//OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_mproutingchk_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_mproutingchk_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_mproutingchk_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mproutingchk_r
integer x = 1275
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;//
string ls_start, ls_end, ls_category
long   ll_row

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

cb_14.triggerevent( clicked! )		// 해지
ll_row = dw_1.retrieve()
if ll_row < 1 then
	MessageBox("확인", "제품별 공정체크 VIEW테이블 내역이 없습니다.",information!)
	return
end if

dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_mproutingchk_r
integer x = 32
integer y = 244
integer width = 4379
integer height = 168
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mproutingchk_r
integer x = 1915
integer y = 16
integer width = 1376
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mproutingchk_r
integer x = 1239
integer y = 16
integer width = 640
integer height = 216
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mproutingchk_r
integer x = 105
integer y = 124
integer width = 105
integer height = 72
integer taborder = 60
boolean vscrollbar = false
boolean livescroll = false
end type

type pb_1 from picturebutton within w_mproutingchk_r
event mousemove pbm_mousemove
integer x = 1472
integer y = 64
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
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
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

type st_13 from statictext within w_mproutingchk_r
integer x = 82
integer y = 320
integer width = 160
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

type ddlb_fld from dropdownlistbox within w_mproutingchk_r
integer x = 256
integer y = 304
integer width = 402
integer height = 532
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_14 from statictext within w_mproutingchk_r
integer x = 686
integer y = 320
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

type ddlb_op from dropdownlistbox within w_mproutingchk_r
integer x = 855
integer y = 304
integer width = 279
integer height = 512
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
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

type sle_value from singlelineedit within w_mproutingchk_r
integer x = 1147
integer y = 304
integer width = 704
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
end type

event getfocus;//
this.SelectText(1, LenA(this.Text))

end event

type cb_10 from commandbutton within w_mproutingchk_r
integer x = 1861
integer y = 304
integer width = 146
integer height = 76
integer taborder = 150
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

end event

type cb_14 from commandbutton within w_mproutingchk_r
integer x = 2011
integer y = 304
integer width = 146
integer height = 76
integer taborder = 160
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

arg_dw = dw_1

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_15 from commandbutton within w_mproutingchk_r
integer x = 2162
integer y = 304
integer width = 146
integer height = 76
integer taborder = 170
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

end event

type cb_16 from commandbutton within w_mproutingchk_r
integer x = 2309
integer y = 304
integer width = 146
integer height = 76
integer taborder = 180
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

end event

type ddlb_dwtitles from dropdownlistbox within w_mproutingchk_r
integer x = 283
integer y = 320
integer width = 279
integer height = 88
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_1 from statictext within w_mproutingchk_r
integer x = 2482
integer y = 312
integer width = 1824
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "공정체크는 재고수불과 관련된 매우 중요한 작업 입니다."
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_mproutingchk_r
integer x = 32
integer y = 1584
integer width = 1911
integer height = 792
integer taborder = 30
boolean bringtotop = true
string title = "1공정 상세"
string dataobject = "d_mproutingdtl_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
string ls_itemno, ls_wcno

ls_itemno = this.object.item_no[row]
ls_wcno   = this.object.wc_no[row]

dw_4.retrieve( ls_itemno, ls_wcno )

end event

type dw_4 from datawindow within w_mproutingchk_r
integer x = 2016
integer y = 1584
integer width = 2405
integer height = 792
integer taborder = 40
boolean bringtotop = true
string title = "1공정 상세규격"
string dataobject = "d_mproutingdtl_qa_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;//
if this.rowcount() > 0 then
	ddlb_qa.enabled = true
	sle_qa.enabled  = true
	cbx_not.enabled = true
	cbx_select.enabled = true
	
	cbx_all.enabled = true
	dw_5.enabled    = true
	dw_5.object.wc_no.Background.Color = RGB(255, 255, 255)
	cb_routchange.enabled = true		
end if	

end event

event clicked;//
string ls_ddlbqa, ls_qa, ls_value

if isnull(row) OR row < 1 then RETURN

ls_ddlbqa = ddlb_qa.text
ls_qa     = dw_4.object.qa[row]

choose case ls_ddlbqa
	case "두께"
		ls_value = MidA(ls_qa, 1,3)
	case "폭"
		ls_value = MidA(ls_qa, 5,4)
	case "높이"
		ls_value = MidA(ls_qa,10,4)
	case "길이"
		ls_value = MidA(ls_qa,15,5)
	case "폭+높이"
		ls_value = MidA(ls_qa, 5,9)
	case "높이+길이"
		ls_value = MidA(ls_qa,10,10)				
	case else
		ls_value = ls_qa
end choose
sle_qa.text = ls_value

end event

type cb_routchange from commandbutton within w_mproutingchk_r
integer x = 3077
integer y = 136
integer width = 169
integer height = 80
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;// 품목 공정변경
long   ll_row, ll_cnt
string ls_wcno_new, ls_workname, ls_itemno, ls_qa, ls_wcno_org

ll_cnt = dw_4.object.tcount[1]
if ll_cnt < 1 then
	MessageBox("확인", "품목 규격을 선택하지 않았습니다.")
	RETURN
end if

// 작업장
dw_5.accepttext()
idwc_wc.accepttext()

ls_wcno_org = ""
ls_wcno_new = dw_5.object.wc_no[dw_5.getrow()]
ls_workname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")

debugbreak()

if ls_wcno_new = "" then
	MessageBox("확인", "변경할 작업장을 선택하시기 바랍니다.")
	return
else
	if MessageBox("확인", "선택한 " + string(ll_cnt,"#,##0") + "개의 품목+규격들의 1차 공정을 '" + &
	             ls_workname + "' 작업장으로 변경 하겠습니까?",Exclamation!, yesno!, 2) = 1 then

		for ll_row = 1 to dw_4.rowcount()
			if dw_4.object.chk[ll_row] = "Y" then
				ls_itemno   = dw_4.object.item_no[ll_row]
				ls_qa       = dw_4.object.qa[ll_row]
				ls_wcno_org = dw_4.object.wc_no[ll_row]
				
				UPDATE rout 
				   SET wc_no = :ls_wcno_new
				 WHERE item_no  = :ls_itemno AND qa = :ls_qa AND wc_no = :ls_wcno_org  AND operation = 1;
				if sqlca.sqlcode = 0 then
					COMMIT;
				else
					ROLLBACK;
					MessageBox("오류",sqlca.sqlerrtext,exclamation!)
					RETURN
				end if	 					
			end if
		next
		
		dw_3.retrieve( ls_itemno )		
		dw_1.object.routcase[dw_1.getrow()] = dw_3.rowcount()
		
		dw_4.retrieve( ls_itemno, ls_wcno_new )
	end if

   cbx_all.checked      = false	// 전체
   dw_5.object.wc_no[1] = ""     // 작업장
end if

end event

type cbx_all from checkbox within w_mproutingchk_r
integer x = 1966
integer y = 72
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "전체"
end type

event clicked;//
long ll_row, ll_cnt

for ll_row = 1 to dw_4.rowcount()
	if this.checked = true then
		dw_4.object.chk[ll_row] = "Y"
	else
		dw_4.object.chk[ll_row] = "N"
	end if
next

end event

type dw_5 from datawindow within w_mproutingchk_r
integer x = 2208
integer y = 136
integer width = 859
integer height = 80
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpwcno_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type sle_qa from singlelineedit within w_mproutingchk_r
integer x = 2601
integer y = 52
integer width = 462
integer height = 80
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

type cbx_not from checkbox within w_mproutingchk_r
integer x = 3081
integer y = 64
integer width = 178
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "<>"
end type

type cbx_select from checkbox within w_mproutingchk_r
integer x = 1966
integer y = 144
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "선택"
end type

event clicked;//
integer li_idx
long    ll_row
string  ls_qa, ls_qatemp, ls_value, ls_ddlbqa, ls_sleqa
boolean lb_chk, lb_not

ls_ddlbqa = ddlb_qa.text
ls_sleqa  = sle_qa.text
lb_not    = cbx_not.checked

debugbreak()
if this.checked = true then	// 선택
	for ll_row = 1 to dw_4.rowcount()
		ls_qa = dw_4.object.qa[ll_row]
		choose case ls_ddlbqa
			case "두께"
				ls_value = MidA(ls_qa, 1,3)
			case "폭"
				ls_value = MidA(ls_qa, 5,4)
			case "높이"
				ls_value = MidA(ls_qa,10,4)
			case "길이"
				ls_value = MidA(ls_qa,15,5)
			case "폭+높이"
				ls_value = MidA(ls_qa, 5,9)				
			case "높이+길이"
				ls_value = MidA(ls_qa,10,10)				
		end choose
		
		if ls_sleqa = ls_value then
			if lb_not then
				dw_4.object.chk[ll_row] = "N"
			else
				dw_4.object.chk[ll_row] = "Y"
			end if
		else
			if lb_not then
				dw_4.object.chk[ll_row] = "Y"
			else
				dw_4.object.chk[ll_row] = "N"
			end if
		end if
	next

	this.checked = false
end if

/*
//Declare Section 
Long start_pos=1 
String old_str, new_str, mystring 

mystring = as_fullstring //전체문자열 
old_str = as_oldstring  //바꿀대상문자열 
new_str = as_newstring  //새문자열 

// Find the first occurrence of old_str. 
start_pos = Pos(mystring, old_str, start_pos) 

// Only enter the loop if you find old_str. 
DO WHILE start_pos > 0 

// Replace old_str with new_str. 
mystring = Replace(mystring, start_pos, Len(old_str), new_str) 

// Find the next occurrence of old_str. 
start_pos = Pos(mystring, old_str,start_pos + Len(new_str)) 

LOOP 

Return mystring 

*/

end event

type ddlb_qa from dropdownlistbox within w_mproutingchk_r
integer x = 2213
integer y = 52
integer width = 384
integer height = 388
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"두께","폭","높이","길이","폭+높이","높이+길이"}
end type

type st_horizontal from u_splitbar_horizontal within w_mproutingchk_r
integer x = 32
integer y = 1552
integer width = 4379
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.y      = dw_3.y
st_vertical.height = dw_3.height
end event

type st_vertical from u_splitbar_vertical within w_mproutingchk_r
integer x = 1970
integer y = 1584
integer height = 792
boolean bringtotop = true
end type

