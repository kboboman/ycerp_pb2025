$PBExportHeader$w_cdgroupitem_use.srw
$PBExportComments$용도 관리
forward
global type w_cdgroupitem_use from w_inheritance
end type
type pb_excel from picturebutton within w_cdgroupitem_use
end type
type st_8 from statictext within w_cdgroupitem_use
end type
type ddlb_fld from dropdownlistbox within w_cdgroupitem_use
end type
type ddlb_dwtitles from dropdownlistbox within w_cdgroupitem_use
end type
type st_9 from statictext within w_cdgroupitem_use
end type
type sle_value from singlelineedit within w_cdgroupitem_use
end type
type cb_filteron from commandbutton within w_cdgroupitem_use
end type
type cb_filteroff from commandbutton within w_cdgroupitem_use
end type
type cb_1 from commandbutton within w_cdgroupitem_use
end type
type cb_2 from commandbutton within w_cdgroupitem_use
end type
type st_vertical from u_splitbar_vertical within w_cdgroupitem_use
end type
type cbx_all from checkbox within w_cdgroupitem_use
end type
type st_1 from statictext within w_cdgroupitem_use
end type
type sle_1 from singlelineedit within w_cdgroupitem_use
end type
type cb_3 from commandbutton within w_cdgroupitem_use
end type
type cbx_all2 from checkbox within w_cdgroupitem_use
end type
type dw_3 from datawindow within w_cdgroupitem_use
end type
type st_horizontal from u_splitbar_horizontal within w_cdgroupitem_use
end type
type dw_4 from datawindow within w_cdgroupitem_use
end type
type ddlb_op from dropdownlistbox within w_cdgroupitem_use
end type
type dw_5 from datawindow within w_cdgroupitem_use
end type
type cb_import from commandbutton within w_cdgroupitem_use
end type
type cbx_excel from checkbox within w_cdgroupitem_use
end type
end forward

global type w_cdgroupitem_use from w_inheritance
integer width = 4320
integer height = 2340
string title = "용도별 품목관리(w_cdgroupitem_use)"
pb_excel pb_excel
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
st_vertical st_vertical
cbx_all cbx_all
st_1 st_1
sle_1 sle_1
cb_3 cb_3
cbx_all2 cbx_all2
dw_3 dw_3
st_horizontal st_horizontal
dw_4 dw_4
ddlb_op ddlb_op
dw_5 dw_5
cb_import cb_import
cbx_excel cbx_excel
end type
global w_cdgroupitem_use w_cdgroupitem_use

type variables
//
st_print i_print
string   is_dw, is_sortorder, is_sortcolumn, is_colname, is_coltype, is_op

datawindowchild idwc_cust, idwc_cust_name, idwc_codemst

end variables

forward prototypes
public function string wf_nextcode (string as_str)
end prototypes

public function string wf_nextcode (string as_str);string ls_str
CHOOSE CASE as_str
	CASE 'A'
		ls_str = 'B'
	CASE 'B'
		ls_str = 'C'
	CASE 'C'
		ls_str = 'D'
	CASE 'D'
		ls_str = 'E'
	CASE 'E'
		ls_str = 'F'
	CASE 'F'
		ls_str = 'G'
	CASE 'G'
		ls_str = 'H'
	CASE 'H'
		ls_str = 'I'
	CASE 'I'
		ls_str = 'J'
	CASE 'J'
		ls_str = 'K'
	CASE 'K'
		ls_str = 'L'
	CASE 'L'
		ls_str = 'M'
	CASE 'M'
		ls_str = 'N'
	CASE 'N'
		ls_str = 'O'
	CASE 'O'
		ls_str = 'P'
	CASE 'P'
		ls_str = 'Q'
	CASE 'Q'
		ls_str = 'R'
	CASE 'R'
		ls_str = 'S'
	CASE 'S'
		ls_str = 'T'
	CASE 'T'
		ls_str = 'U'
	CASE 'U'
		ls_str = 'V'
	CASE 'V'
		ls_str = 'W'
	CASE 'W'
		ls_str = 'X'
	CASE 'X'
		ls_str = 'Y'
	CASE 'Y'
		ls_str = 'Z'
END CHOOSE

return ls_str
end function

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject( dw_3 )
st_horizontal.of_set_bottomobject( dw_1 )
st_horizontal.of_set_minsize(250, 250)

st_vertical.of_set_leftobject( dw_3 )
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_4.visible = false
dw_5.visible = false

cb_import.enabled = false

//dw_1.Object.DataWindow.Color = GL_DW_BackColorInit
//dw_2.Object.DataWindow.Color = GL_DW_BackColorInit
//dw_3.Object.DataWindow.Color = GL_DW_BackColorInit

dw_3.retrieve()
dw_4.retrieve()

if GF_Permission( "용도별_품목관리", gs_userid ) = "Y" then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

//
pb_retrieve.PostEvent( clicked! )

end event

on w_cdgroupitem_use.create
int iCurrent
call super::create
this.pb_excel=create pb_excel
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_vertical=create st_vertical
this.cbx_all=create cbx_all
this.st_1=create st_1
this.sle_1=create sle_1
this.cb_3=create cb_3
this.cbx_all2=create cbx_all2
this.dw_3=create dw_3
this.st_horizontal=create st_horizontal
this.dw_4=create dw_4
this.ddlb_op=create ddlb_op
this.dw_5=create dw_5
this.cb_import=create cb_import
this.cbx_excel=create cbx_excel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_excel
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_9
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_filteron
this.Control[iCurrent+8]=this.cb_filteroff
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.st_vertical
this.Control[iCurrent+12]=this.cbx_all
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.sle_1
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cbx_all2
this.Control[iCurrent+17]=this.dw_3
this.Control[iCurrent+18]=this.st_horizontal
this.Control[iCurrent+19]=this.dw_4
this.Control[iCurrent+20]=this.ddlb_op
this.Control[iCurrent+21]=this.dw_5
this.Control[iCurrent+22]=this.cb_import
this.Control[iCurrent+23]=this.cbx_excel
end on

on w_cdgroupitem_use.destroy
call super::destroy
destroy(this.pb_excel)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_vertical)
destroy(this.cbx_all)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.cb_3)
destroy(this.cbx_all2)
destroy(this.dw_3)
destroy(this.st_horizontal)
destroy(this.dw_4)
destroy(this.ddlb_op)
destroy(this.dw_5)
destroy(this.cb_import)
destroy(this.cbx_excel)
end on

event resize;call super::resize;//
long  ll_height

gb_3.width  = newwidth  - (gb_3.x * 2)

ll_height   = newheight - dw_3.y - gb_3.x 

dw_3.height = ll_height * 0.5

st_horizontal.y     = dw_3.y + dw_3.height
st_horizontal.width = dw_3.width

dw_1.y      = st_horizontal.y + st_horizontal.height
dw_1.height = newheight - dw_1.y - gb_3.x 

st_vertical.x      = dw_3.x + dw_3.width
st_vertical.height = ll_height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_3.x
dw_2.height = ll_height

//
dw_5.x      = dw_2.x
dw_5.y      = dw_2.y
dw_5.width  = dw_2.width
dw_5.height = dw_2.height

end event

type pb_save from w_inheritance`pb_save within w_cdgroupitem_use
integer x = 3090
integer y = 56
fontcharset fontcharset = ansi!
boolean italic = true
end type

event pb_save::clicked;//
string ls_usename, ls_cat1, ls_cat2, ls_value, ls_itemno, ls_itemname
long   ll_row, ll_dw2cnt

if cbx_excel.checked = true then
	dw_5.visible = false
	dw_2.visible = true
	
	dw_2.reset()

	dw_2.setredraw( false )
	for ll_row = 1 to dw_5.rowcount()
		ls_cat1     = dw_5.object.cat1[ll_row]		
		ls_cat2     = dw_5.object.cat2[ll_row]		
		ls_itemno   = dw_5.object.item_no[ll_row]
		ls_itemname = dw_5.object.item_name[ll_row]
				
		ll_dw2cnt  = dw_2.insertrow(0)
		dw_2.scrolltorow( ll_dw2cnt )
		
		dw_2.object.chk[ll_dw2cnt]       = "Y"
		dw_2.object.use_name[ll_dw2cnt]  = ls_cat1
		dw_2.object.item_no[ll_dw2cnt]   = ls_itemno
		dw_2.object.item_name[ll_dw2cnt] = ls_itemname
		dw_2.object.user_id[ll_dw2cnt]   = gs_userid
		dw_2.object.user_name[ll_dw2cnt] = gs_username
		dw_2.object.use_yn[ll_dw2cnt]    = "Y"
		dw_2.object.sys_date[ll_dw2cnt]  = gf_today()		
	next
	dw_2.setredraw( true )
	
	//
	dw_2.setredraw( false )
	for ll_row = 1 to dw_5.rowcount()
		ls_cat1     = dw_5.object.cat1[ll_row]		
		ls_cat2     = dw_5.object.cat2[ll_row]		
		ls_itemno   = dw_5.object.item_no[ll_row]
		ls_itemname = dw_5.object.item_name[ll_row]
				
		ll_dw2cnt  = dw_2.insertrow(0)
		dw_2.scrolltorow( ll_dw2cnt )
		
		ls_value   = ls_cat1 + "|" + ls_cat2
		dw_2.object.chk[ll_dw2cnt]       = "Y"
		dw_2.object.use_name[ll_dw2cnt]  = ls_value
		dw_2.object.item_no[ll_dw2cnt]   = ls_itemno
		dw_2.object.item_name[ll_dw2cnt] = ls_itemname
		dw_2.object.user_id[ll_dw2cnt]   = gs_userid
		dw_2.object.user_name[ll_dw2cnt] = gs_username
		dw_2.object.use_yn[ll_dw2cnt]    = "Y"
		dw_2.object.sys_date[ll_dw2cnt]  = gf_today()		
	next
	dw_2.setredraw( true )
end if

//
for ll_row = 1 to dw_2.rowcount()
	ls_usename  = dw_2.object.use_name[ll_row]
	
	if isnull(ls_usename) OR ls_usename = "" then
		dw_2.scrolltorow( ll_row )
		MessageBox("확인","용도명칭 누락 입니다.")
		RETURN
	end if
next

//
cbx_excel.checked = false 

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================
WF_Update1( dw_2, "Y" ) 

end event

type dw_1 from w_inheritance`dw_1 within w_cdgroupitem_use
integer x = 32
integer y = 1360
integer width = 1819
integer height = 840
integer taborder = 50
string dataobject = "d_cdavgcost_list"
end type

event dw_1::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdgroupitem_use
integer x = 32
integer y = 12
integer width = 1070
integer height = 140
string text = "용도별 품목관리"
end type

type st_tips from w_inheritance`st_tips within w_cdgroupitem_use
end type

type pb_compute from w_inheritance`pb_compute within w_cdgroupitem_use
boolean visible = false
integer y = 48
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdgroupitem_use
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdgroupitem_use
integer x = 3282
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdgroupitem_use
boolean visible = false
integer x = 4009
integer y = 44
integer taborder = 130
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdgroupitem_use
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdgroupitem_use
integer x = 2706
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;//
string ls_chk
long   ll_row

if dw_2.rowcount() < 1 then RETURN	

dw_2.accepttext()

if MessageBox("확인","삭제 하시겠습니까?",information!, OKCancel!, 2) = 1 then
	for ll_row = dw_2.rowcount() to 1 step -1
		ls_chk  = dw_2.object.chk[ll_row]
		
		if ls_chk = "Y" then
			dw_2.deleterow( ll_row )
		end if
	next
	WF_Update1( dw_2, "Y" )
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_cdgroupitem_use
integer x = 2514
integer y = 56
integer taborder = 170
end type

event pb_insert::clicked;//
string ls_itemno, ls_itemname, ls_chk, ls_uom, ls_salesman
long   ll_row, ll_dw2cnt, ll_find, ll_tchk

choose case is_dw
	case "dw_3"
		ll_tchk  = dw_3.object.tchk[1]
		if ll_tchk < 1 then RETURN
		
		dw_2.setredraw( false )
		for ll_row = 1 to dw_4.rowcount()
			ls_chk  = dw_4.object.chk[ll_row]
			
			if ls_chk = "Y" then		
			   dw_4.object.chk[ll_row] = ls_chk		// 선택해지

				ls_itemno    = dw_4.object.item_no[ll_row]
				ls_itemname  = dw_4.object.item_name[ll_row]
				
				if isnull(ls_itemno) OR ls_itemno = "" then RETURN
				
				ll_find  = dw_2.find( "item_no = '" + ls_itemno + "'", 1, dw_2.rowcount() )
				if ll_find > 0 then
					//dw_2.scrolltorow( ll_find )
					//MessageBox("확인", ls_itemname + "~n~n중복된 품목입니다.")
					//RETURN
				
					CONTINUE
				end if
				
				//
				ll_dw2cnt  = dw_2.insertrow(0)
				dw_2.scrolltorow( ll_dw2cnt )
				
				dw_2.object.chk[ll_dw2cnt]       = "Y"
				dw_2.object.item_no[ll_dw2cnt]   = ls_itemno
				dw_2.object.item_name[ll_dw2cnt] = ls_itemname
				dw_2.object.user_id[ll_dw2cnt]   = gs_userid
				dw_2.object.user_name[ll_dw2cnt] = gs_username
				dw_2.object.use_yn[ll_dw2cnt]    = "Y"
				dw_2.object.sys_date[ll_dw2cnt]  = gf_today()
			end if
		next
		dw_2.setredraw( true )
		
	case "dw_1"
		ll_tchk  = dw_1.object.tchk[1]
		if ll_tchk < 1 then RETURN
		
		dw_2.setredraw( false )
		for ll_row = 1 to dw_1.rowcount()
			ls_chk  = dw_1.object.chk[ll_row]
			
			if ls_chk = "Y" then		
				ls_itemno    = dw_1.object.item_no[ll_row]
				ls_itemname  = dw_1.object.item_name[ll_row]
				
				if isnull(ls_itemno) OR ls_itemno = "" then RETURN

				ll_find  = dw_2.find( "use_name = '" + trim(sle_1.text) + "' AND item_no = '" + ls_itemno + "'", 1, dw_2.rowcount() )
				if ll_find > 0 then
					dw_2.scrolltorow( ll_find )
					MessageBox("확인", ls_itemname + "~n~n중복된 품목입니다.")
					RETURN
				end if
				
				//
				ll_dw2cnt  = dw_2.insertrow(0)
				dw_2.scrolltorow( ll_dw2cnt )
				
				dw_2.object.chk[ll_dw2cnt]       = "Y"
				dw_2.object.item_no[ll_dw2cnt]   = ls_itemno
				dw_2.object.item_name[ll_dw2cnt] = ls_itemname
				dw_2.object.user_id[ll_dw2cnt]   = gs_userid
				dw_2.object.user_name[ll_dw2cnt] = gs_username
				dw_2.object.use_yn[ll_dw2cnt]    = "Y"
				dw_2.object.sys_date[ll_dw2cnt]  = gf_today()
			end if
		next
		dw_2.setredraw( true )
		
	case else
		MessageBox("확인","해당하는 DataWindow를 선택후 작업하시기 바랍니다.")
end choose
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdgroupitem_use
integer x = 2322
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;call super::clicked;//
dw_3.retrieve()
dw_4.retrieve()
dw_1.retrieve()

dw_2.retrieve( "%" )

end event

type gb_3 from w_inheritance`gb_3 within w_cdgroupitem_use
integer x = 32
integer y = 240
integer width = 4206
integer height = 180
integer taborder = 90
integer textsize = -8
integer weight = 400
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdgroupitem_use
integer x = 1161
integer y = 12
integer width = 1106
integer height = 208
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdgroupitem_use
integer x = 2290
integer width = 1216
integer height = 208
integer taborder = 40
integer weight = 400
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdgroupitem_use
integer x = 1906
integer y = 432
integer width = 2331
integer height = 1768
integer taborder = 60
string dataobject = "d_cdavgcost_m"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type pb_excel from picturebutton within w_cdgroupitem_use
integer x = 2898
integer y = 56
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos,   li_value
long    ll_cnt
datawindow arg_dw

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

choose case is_dw
	case "dw_2"
		arg_dw = dw_2
	case else
		MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
		RETURN
end choose

ll_cnt = arg_dw.rowcount()
if ll_cnt > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsascii(ls_DocName)
		end if
	end if
else
	MessageBox("확인","해당하는 데이터가 존재하지 않습니다.")
end if	

end event

type st_8 from statictext within w_cdgroupitem_use
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_cdgroupitem_use
integer x = 265
integer y = 304
integer width = 480
integer height = 580
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

type ddlb_dwtitles from dropdownlistbox within w_cdgroupitem_use
integer x = 325
integer y = 312
integer width = 306
integer height = 92
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

type st_9 from statictext within w_cdgroupitem_use
integer x = 782
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdgroupitem_use
integer x = 1230
integer y = 308
integer width = 581
integer height = 76
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

type cb_filteron from commandbutton within w_cdgroupitem_use
integer x = 1824
integer y = 304
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
string text = "필터"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdgroupitem_use
integer x = 2025
integer y = 304
integer width = 197
integer height = 84
integer taborder = 130
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2UnFilter( arg_dw )

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

end event

type cb_1 from commandbutton within w_cdgroupitem_use
integer x = 2226
integer y = 304
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )


end event

type cb_2 from commandbutton within w_cdgroupitem_use
integer x = 2414
integer y = 304
integer width = 183
integer height = 84
integer taborder = 150
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_cdgroupitem_use
integer x = 1865
integer y = 432
integer height = 1768
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.width  = dw_3.width

cbx_all2.x  = this.x + 105

end event

type cbx_all from checkbox within w_cdgroupitem_use
integer x = 82
integer y = 236
integer width = 224
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
string text = "전체"
end type

event clicked;//
string ls_chk
long   ll_row
DataWindow dw_chk

choose case is_dw
	case "dw_3"
		dw_chk = dw_3
	case "dw_1"
		dw_chk = dw_1
	case else
		MessageBox("확인","해당하는 DataWindow를 선택후 작업하시기 바랍니다.")
		RETURN
end choose

//
if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_chk.rowcount()
	dw_chk.object.chk[ll_row] = ls_chk
next

end event

type st_1 from statictext within w_cdgroupitem_use
integer x = 1193
integer y = 48
integer width = 667
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
string text = "용도명"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cdgroupitem_use
integer x = 1189
integer y = 124
integer width = 672
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_cdgroupitem_use
integer x = 1870
integer y = 52
integer width = 375
integer height = 152
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "일괄적용"
end type

event clicked;// 일괄적용
string ls_chk, ls_value
long   ll_row

ls_value  = sle_1.text
if isnull(ls_value) OR ls_value = "" then RETURN

dw_2.setredraw( false )
for ll_row = 1 to dw_2.rowcount()
	ls_chk = dw_2.object.chk[ll_row]
	
	if ls_chk = "Y" then
		dw_2.object.use_name[ll_row]  = ls_value
	end if
next
dw_2.setredraw( true )

sle_1.text = ""

end event

type cbx_all2 from checkbox within w_cdgroupitem_use
integer x = 1970
integer y = 236
integer width = 224
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
string text = "전체"
end type

event clicked;//
string ls_chk
long   ll_row

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_2.rowcount()
	dw_2.object.chk[ll_row] = ls_chk
next

end event

type dw_3 from datawindow within w_cdgroupitem_use
integer x = 32
integer y = 432
integer width = 1819
integer height = 872
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_cditemtop10_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event itemchanged;// 선택하기
string  ls_chk, ls_category
long    ll_row

ls_category  = dw_3.object.item_no[row]
ls_chk       = data

for ll_row = 1 to dw_4.rowcount()
	if ls_category = dw_4.object.category[ll_row] then
		dw_4.object.chk[ll_row] = ls_chk
	end if
next

end event

type st_horizontal from u_splitbar_horizontal within w_cdgroupitem_use
integer x = 32
integer y = 1324
integer width = 1819
boolean bringtotop = true
end type

type dw_4 from datawindow within w_cdgroupitem_use
integer x = 2226
integer y = 700
integer width = 1783
integer height = 964
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "d_cditemtop10_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_op from dropdownlistbox within w_cdgroupitem_use
integer x = 951
integer y = 304
integer width = 270
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

type dw_5 from datawindow within w_cdgroupitem_use
integer x = 347
integer y = 700
integer width = 1691
integer height = 964
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_groupitem_use"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_import from commandbutton within w_cdgroupitem_use
integer x = 2629
integer y = 300
integer width = 457
integer height = 92
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "붙여넣기"
end type

event clicked;//
long		ll_row, ll_rc

//
ll_rc = dw_5.ImportClipBoard( 2 )		// 1번 라인 SKIP
if ll_rc > 0 then
	// Long. Returns the number of rows that were imported if it succeeds and returns 
	//       the following values if an error occurs:
	//  0  End of file, too many rows
	// -2  Not enough columns
	// -3  Invalid argument
	// -4  Invalid input
	
	ClipBoard("")

	MessageBox("확인","데이터 가져오기 완료" )
end if
	
end event

type cbx_excel from checkbox within w_cdgroupitem_use
integer x = 2629
integer y = 236
integer width = 219
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
string text = "엑셀"
end type

event clicked;//
if this.checked = true then
	dw_5.visible = true
	cb_import.enabled = true
else
	dw_5.visible = false
	cb_import.enabled = false
end if

end event

