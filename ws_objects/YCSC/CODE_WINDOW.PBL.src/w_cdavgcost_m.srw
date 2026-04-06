$PBExportHeader$w_cdavgcost_m.srw
$PBExportComments$평균단가 관리
forward
global type w_cdavgcost_m from w_inheritance
end type
type pb_excel from picturebutton within w_cdavgcost_m
end type
type st_8 from statictext within w_cdavgcost_m
end type
type ddlb_fld from dropdownlistbox within w_cdavgcost_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdavgcost_m
end type
type st_9 from statictext within w_cdavgcost_m
end type
type ddlb_op from dropdownlistbox within w_cdavgcost_m
end type
type sle_value from singlelineedit within w_cdavgcost_m
end type
type cb_filteron from commandbutton within w_cdavgcost_m
end type
type cb_filteroff from commandbutton within w_cdavgcost_m
end type
type cb_1 from commandbutton within w_cdavgcost_m
end type
type cb_2 from commandbutton within w_cdavgcost_m
end type
type st_vertical from u_splitbar_vertical within w_cdavgcost_m
end type
type em_1 from editmask within w_cdavgcost_m
end type
type st_1 from statictext within w_cdavgcost_m
end type
type dw_3 from datawindow within w_cdavgcost_m
end type
type cbx_edit from checkbox within w_cdavgcost_m
end type
type st_2 from statictext within w_cdavgcost_m
end type
type dw_4 from datawindow within w_cdavgcost_m
end type
type st_horizontal1 from u_splitbar_horizontal within w_cdavgcost_m
end type
type dw_5 from datawindow within w_cdavgcost_m
end type
type st_horizontal2 from u_splitbar_horizontal within w_cdavgcost_m
end type
type cbx_all from checkbox within w_cdavgcost_m
end type
type cb_3 from commandbutton within w_cdavgcost_m
end type
type ddlb_1 from dropdownlistbox within w_cdavgcost_m
end type
type cb_4 from commandbutton within w_cdavgcost_m
end type
type em_price from editmask within w_cdavgcost_m
end type
end forward

global type w_cdavgcost_m from w_inheritance
integer width = 4622
integer height = 2336
string title = "거래처별 단가체크 기초(w_cdavgcost_m)"
pb_excel pb_excel
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
st_vertical st_vertical
em_1 em_1
st_1 st_1
dw_3 dw_3
cbx_edit cbx_edit
st_2 st_2
dw_4 dw_4
st_horizontal1 st_horizontal1
dw_5 dw_5
st_horizontal2 st_horizontal2
cbx_all cbx_all
cb_3 cb_3
ddlb_1 ddlb_1
cb_4 cb_4
em_price em_price
end type
global w_cdavgcost_m w_cdavgcost_m

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
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_leftobject( dw_5 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_rightobject( dw_4 )
st_vertical.of_set_minsize(250, 250)

st_horizontal1.of_set_topobject( dw_1 )
st_horizontal1.of_set_bottomobject( dw_5 )
st_horizontal1.of_set_minsize(250, 250)

st_horizontal2.of_set_topobject( dw_2 )
st_horizontal2.of_set_bottomobject( dw_4 )
st_horizontal2.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.visible = false
dw_3.SetTransObject( SQLCA )

dw_4.SetTransObject( SQLCA )
dw_5.SetTransObject( SQLCA )

em_1.text   = string(today(),"yyyy/mm/dd")

pb_retrieve.enabled = false
pb_save.enabled     = false
if GF_Permission("거래처별_단가체크", gs_userid) = "Y" then
	pb_retrieve.enabled = true
	pb_save.enabled     = true
end if

//
pb_retrieve.PostEvent( clicked! )

end event

on w_cdavgcost_m.create
int iCurrent
call super::create
this.pb_excel=create pb_excel
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_vertical=create st_vertical
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.cbx_edit=create cbx_edit
this.st_2=create st_2
this.dw_4=create dw_4
this.st_horizontal1=create st_horizontal1
this.dw_5=create dw_5
this.st_horizontal2=create st_horizontal2
this.cbx_all=create cbx_all
this.cb_3=create cb_3
this.ddlb_1=create ddlb_1
this.cb_4=create cb_4
this.em_price=create em_price
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_excel
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_9
this.Control[iCurrent+6]=this.ddlb_op
this.Control[iCurrent+7]=this.sle_value
this.Control[iCurrent+8]=this.cb_filteron
this.Control[iCurrent+9]=this.cb_filteroff
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.st_vertical
this.Control[iCurrent+13]=this.em_1
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.cbx_edit
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.dw_4
this.Control[iCurrent+19]=this.st_horizontal1
this.Control[iCurrent+20]=this.dw_5
this.Control[iCurrent+21]=this.st_horizontal2
this.Control[iCurrent+22]=this.cbx_all
this.Control[iCurrent+23]=this.cb_3
this.Control[iCurrent+24]=this.ddlb_1
this.Control[iCurrent+25]=this.cb_4
this.Control[iCurrent+26]=this.em_price
end on

on w_cdavgcost_m.destroy
call super::destroy
destroy(this.pb_excel)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_vertical)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.cbx_edit)
destroy(this.st_2)
destroy(this.dw_4)
destroy(this.st_horizontal1)
destroy(this.dw_5)
destroy(this.st_horizontal2)
destroy(this.cbx_all)
destroy(this.cb_3)
destroy(this.ddlb_1)
destroy(this.cb_4)
destroy(this.em_price)
end on

event resize;call super::resize;//
long  ll_height

gb_3.width  = newwidth  - (gb_3.x * 2)

ll_height   = newheight - dw_1.y - gb_3.x

dw_1.height = ll_height * 0.7

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = ll_height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_3.x
dw_2.height = ll_height * 0.3

st_horizontal1.x      = dw_1.x
st_horizontal1.y      = dw_1.y + dw_1.height
st_horizontal1.width  = dw_1.width

dw_5.y      = st_horizontal1.y + st_horizontal1.height
dw_5.width  = dw_1.width
dw_5.height = newheight - dw_5.y - gb_3.x

st_horizontal2.x      = dw_1.x + dw_1.width + st_vertical.width
st_horizontal2.y      = dw_2.y + dw_2.height
st_horizontal2.width  = newwidth  - st_horizontal2.x - gb_3.x

dw_4.x      = st_vertical.x + st_vertical.width
dw_4.y      = st_horizontal2.y + st_horizontal2.height
dw_4.width  = newwidth  - dw_4.x - gb_3.x
dw_4.height = newheight - dw_4.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_cdavgcost_m
integer x = 2999
integer y = 56
fontcharset fontcharset = ansi!
boolean italic = true
end type

event pb_save::clicked;//
if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================
WF_Update2( dw_2, dw_4, "Y" ) 

cbx_edit.checked = false
cbx_edit.TriggerEvent( clicked! )

end event

type dw_1 from w_inheritance`dw_1 within w_cdavgcost_m
integer x = 32
integer y = 432
integer width = 1550
integer height = 792
integer taborder = 50
string dataobject = "d_cdavgcost_list"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string  ls_itemno

ls_itemno  = this.object.item_no[row]
dw_5.retrieve( ls_itemno )

end event

event dw_1::doubleclicked;call super::doubleclicked;//
string ls_itemno, ls_itemname, ls_salesman
long   ll_row, ll_find

if dw_1.getrow()   < 1 then RETURN

ls_itemno    = dw_1.object.item_no[dw_1.getrow()]
ls_itemname  = dw_1.object.item_name[dw_1.getrow()]
if isnull(ls_itemno) OR ls_itemno = "" then RETURN

ll_find  = dw_2.find( "item_no = '" + ls_itemno + "'", 1, dw_2.rowcount() )
if ll_find > 0 then
	dw_2.scrolltorow( ll_find )
	MessageBox("확인", ls_itemname + "~n~n중복된 품목입니다.")
	RETURN
end if

//
ll_row  = dw_2.insertrow(0)
dw_2.scrolltorow( ll_row )

dw_2.object.item_no[ll_row]   = ls_itemno
dw_2.object.item_name[ll_row] = ls_itemname
dw_2.object.user_id[ll_row]   = gs_userid
dw_2.object.user_name[ll_row] = gs_username
dw_2.object.use_yn[ll_row]    = "Y"
dw_2.object.sys_date[ll_row]  = gf_today()

end event

type dw_2 from w_inheritance`dw_2 within w_cdavgcost_m
integer x = 1646
integer y = 432
integer width = 2491
integer height = 792
integer taborder = 60
string dataobject = "d_cdavgcost_m"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;//
if cbx_edit.checked = true then
	if is_dw = this.classname() then
		is_dw   = this.classname()
		GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
		GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
	else
		MessageBox("확인","단가작업 중입니다.")
      RETURN 
	end if
else
	is_dw   = this.classname()
	GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
	GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
end if

end event

type st_title from w_inheritance`st_title within w_cdavgcost_m
integer x = 32
integer y = 12
integer width = 1417
string text = "거래처별 단가체크 기초"
end type

type st_tips from w_inheritance`st_tips within w_cdavgcost_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdavgcost_m
boolean visible = false
integer y = 48
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdavgcost_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdavgcost_m
integer x = 3191
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdavgcost_m
integer x = 2615
integer y = 56
integer taborder = 130
end type

event pb_print::clicked;call super::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//w_repsuper w_print
//st_print l_print
//
//l_print.st_datawindow  = dw_3
//l_print.st_print_sheet = " 프린트용지 : A3"
//l_print.st_print_desc  = " 이 프로그램은 고액채권 거래처관리를 출력합니다." 
//
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=93'
//OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdavgcost_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdavgcost_m
integer x = 2423
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;//
long  ll_row

choose case is_dw
	case "dw_2"
		if dw_2.rowcount() < 1 then RETURN	
		
		dw_2.accepttext()
		
		if MessageBox("확인","삭제 하시겠습니까?",information!, OKCancel!, 2) = 1 then
			for ll_row = dw_2.rowcount() to 1 step -1
				if dw_2.object.chk[ll_row] = "Y" then
					dw_2.deleterow( ll_row )
				end if
			next
			WF_Update1(dw_2, "Y")
		end if	

	case "dw_4"
		if dw_4.rowcount() < 1 then RETURN	
		
		dw_4.accepttext()
		
		if MessageBox("확인",'삭제 하시겠습니까?',information!, OKCancel!, 2) = 1 then
			dw_4.deleterow(dw_4.getrow())
			WF_Update1(dw_4, "N")
		end if	
end choose	
end event

type pb_insert from w_inheritance`pb_insert within w_cdavgcost_m
integer x = 2231
integer y = 56
integer taborder = 170
end type

event pb_insert::clicked;//
string ls_itemno, ls_itemname, ls_qa, ls_uom, ls_salesman
long   ll_row, ll_find

if dw_1.getrow()   < 1 then RETURN

ls_itemno    = dw_1.object.item_no[dw_1.getrow()]
ls_itemname  = dw_1.object.item_name[dw_1.getrow()]
ls_qa        = dw_5.object.item_name[dw_5.getrow()]
ls_uom       = dw_5.object.uom[dw_5.getrow()]

if isnull(ls_itemno) OR ls_itemno = "" then RETURN

choose case is_dw
	case "dw_2"
		ll_find  = dw_2.find( "item_no = '" + ls_itemno + "'", 1, dw_2.rowcount() )
		if ll_find > 0 then
			dw_2.scrolltorow( ll_find )
			MessageBox("확인", ls_itemname + "~n~n중복된 품목입니다.")
			RETURN
		end if
		
		//
		ll_row  = dw_2.insertrow(0)
		dw_2.scrolltorow( ll_row )
		
		dw_2.object.item_no[ll_row]   = ls_itemno
		dw_2.object.item_name[ll_row] = ls_itemname
		dw_2.object.user_id[ll_row]   = gs_userid
		dw_2.object.user_name[ll_row] = gs_username
		dw_2.object.use_yn[ll_row]    = "Y"
		dw_2.object.sys_date[ll_row]  = gf_today()
		
	case "dw_4"
		ll_find  = dw_4.find( "item_no = '" + ls_itemno + "'", 1, dw_4.rowcount() )
		if ll_find > 0 then
			if LeftA(ls_itemname,2) = "AL" OR LeftA(ls_itemname,2) = "와" OR LeftA(ls_itemname,12) = "도장비(부속)" OR &
				LeftA(ls_itemname,7) = "T-Z몰딩" OR LeftA(ls_itemname,6) = "가공비"  OR &
	         LeftA(ls_itemname,7) = "CH-STUD" OR LeftA(ls_itemname,8) = "J-RUNNER"  OR &
	   		LeftA(ls_itemname,6) = "분리형" OR LeftA(ls_itemname,6) = "일체형" OR LeftA(ls_itemname,3) = "U형" OR &
				LeftA(ls_itemname,8) = "C-RUNNER" OR LeftA(ls_itemname,6) = "C-STUD" then
				// SKIP
			else
				dw_4.scrolltorow( ll_find )
				if MessageBox("확인", ls_itemname + "~n~n중복된 품목~n~n계속 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
					RETURN
				end if
			end if
		end if
		
		//
		ll_row  = dw_4.insertrow(0)
		dw_4.scrolltorow( ll_row )
		
		dw_4.object.item_no[ll_row]   = ls_itemno
		dw_4.object.item_name[ll_row] = ls_itemname
		dw_4.object.qa[ll_row]        = ls_qa
		dw_4.object.uom[ll_row]       = ls_uom
      dw_4.object.draw_no[ll_row]   = ''
		dw_4.object.user_id[ll_row]   = gs_userid
		dw_4.object.user_name[ll_row] = gs_username
		dw_4.object.use_yn[ll_row]    = "Y"
		dw_4.object.sys_date[ll_row]  = gf_today()
end choose
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdavgcost_m
integer x = 2039
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;call super::clicked;//
date  ld_date

ld_date  = date(em_1.text)

dw_1.retrieve()
dw_2.retrieve( ld_date, "%" )
dw_2.sharedata( dw_3 )

dw_4.retrieve( "%" )

end event

type gb_3 from w_inheritance`gb_3 within w_cdavgcost_m
integer x = 32
integer y = 240
integer width = 4105
integer height = 180
integer taborder = 90
integer textsize = -8
integer weight = 400
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdavgcost_m
integer x = 1504
integer y = 12
integer width = 489
integer height = 208
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdavgcost_m
integer x = 2007
integer width = 1399
integer height = 208
integer taborder = 40
integer weight = 400
long backcolor = 79416533
end type

type pb_excel from picturebutton within w_cdavgcost_m
integer x = 2807
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
	case "dw_4"
		arg_dw = dw_4
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

type st_8 from statictext within w_cdavgcost_m
integer x = 311
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

type ddlb_fld from dropdownlistbox within w_cdavgcost_m
integer x = 494
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

type ddlb_dwtitles from dropdownlistbox within w_cdavgcost_m
integer x = 553
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

type st_9 from statictext within w_cdavgcost_m
integer x = 1010
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

type ddlb_op from dropdownlistbox within w_cdavgcost_m
integer x = 1184
integer y = 304
integer width = 261
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_cdavgcost_m
integer x = 1458
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

type cb_filteron from commandbutton within w_cdavgcost_m
integer x = 2053
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
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdavgcost_m
integer x = 2254
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
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose
GF_DW2UnFilter( arg_dw )

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

end event

type cb_1 from commandbutton within w_cdavgcost_m
integer x = 2455
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
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )


end event

type cb_2 from commandbutton within w_cdavgcost_m
integer x = 2642
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
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_cdavgcost_m
integer x = 1600
integer y = 432
integer height = 1768
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal1.width  = dw_1.width

st_horizontal2.x      = this.x + this.width
st_horizontal2.width  = dw_2.width

end event

type em_1 from editmask within w_cdavgcost_m
integer x = 1536
integer y = 128
integer width = 421
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_cdavgcost_m
integer x = 1536
integer y = 52
integer width = 421
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cdavgcost_m
integer x = 997
integer y = 164
integer width = 114
integer height = 72
integer taborder = 40
boolean bringtotop = true
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_edit from checkbox within w_cdavgcost_m
integer x = 2875
integer y = 320
integer width = 379
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
string text = "편집모드"
end type

event clicked;// 편집모드
string ls_chk
long   ll_row

if this.checked = true then
	ls_chk  = "Y"
	
	choose case is_dw
		case "dw_2"
			dw_2.Object.use_yn.TabSequence = 10
			
		case "dw_4"
			for ll_row = 1 to dw_4.rowcount()
				dw_4.object.chk[ll_row] = ls_chk
			next
	end choose
else
	ls_chk  = "N"

	choose case is_dw
		case "dw_2"
			dw_2.Object.use_yn.TabSequence = 0

		case "dw_4"
			for ll_row = 1 to dw_4.rowcount()
				dw_4.object.chk[ll_row] = ls_chk
			next
	end choose
end if
end event

type st_2 from statictext within w_cdavgcost_m
integer x = 50
integer y = 176
integer width = 878
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "거래처별 단가체크 에서 사용"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_cdavgcost_m
integer x = 1646
integer y = 1280
integer width = 2491
integer height = 916
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_cditemcosts_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_horizontal1 from u_splitbar_horizontal within w_cdavgcost_m
integer x = 32
integer y = 1240
integer width = 1550
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//

end event

type dw_5 from datawindow within w_cdavgcost_m
integer x = 32
integer y = 1280
integer width = 1550
integer height = 916
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdavgcostitem_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull(row) OR row < 1 then RETURN

this.scrolltorow(row)

// 정렬하기 
string ls_sortstr, ls_colname
long   ll_row, ll_strlen

ls_colname = dwo.name

if RightA(ls_colname, 2) = "_t" then // column header 선택		
	ll_strlen  = LenA(ls_colname) - 2
	ls_sortstr = LeftA(ls_colname, ll_strlen)
	
	//
	if	is_sortcolumn = ls_sortstr then
		if is_sortorder = "A" then
			is_sortcolumn= ls_sortstr
			is_sortorder = "D"
			
			for ll_row = 1 to this.rowcount()
				this.object.chk[ll_row] = "N"
			next
		elseif is_sortorder = "D" then
			is_sortcolumn= ls_sortstr
			is_sortorder = "A"

			for ll_row = 1 to this.rowcount()
				this.object.chk[ll_row] = "Y"
			next
		else
			is_sortcolumn= ls_sortstr
			is_sortorder = "A"

			for ll_row = 1 to this.rowcount()
				this.object.chk[ll_row] = "Y"
			next
		end if
	else
		is_sortcolumn= ls_sortstr
		is_sortorder = "A"

		for ll_row = 1 to this.rowcount()
			this.object.chk[ll_row] = "Y"
		next
	end if

	// 기본 Sort:()
	this.SetSort( is_sortcolumn + " " + is_sortorder )		// this.SetSort( "#1 A, #2 D" )
	this.Sort()		
else											// column data 선택
	// 필터하기
	string ls_type, ls_op, ls_text

	ls_colname= dwo.name
	if ls_colname = "compute_1" then ls_colname = "qa"
	
	ls_type    = this.Describe(ls_colname + ".coltype")
	ls_op      = "="
	
	choose case LeftA(ls_type,4)
		case "char"
			ls_op   = "LIKE"
			ls_text = string( this.GetItemString( row, ls_colname ) )
		case "deci"
			ls_op   = "="
			ls_text = string( this.GetItemDecimal( row, ls_colname ) )
		case "numb", "long"
			ls_op   = "="
			ls_text = string( this.GetItemNumber( row, ls_colname ) ) 		
		case "time"
			ls_op   = "="
			ls_text = string( this.GetItemTime( row, ls_colname ) )
		case "date"
			ls_op   = ">="
			if ls_type = "datetime" then
				ls_text = string( this.GetItemDateTime( row, ls_colname ) )		
			else
				ls_text = string( this.GetItemDate( row, ls_colname ) )
			end if
	end choose
	
	sle_value.text  = ls_text
	
	is_colname = ls_colname
	is_coltype = ls_type
	is_op      = ls_op
	this.setfocus()
end if

end event

event doubleclicked;//
string ls_itemno, ls_itemname, ls_qa, ls_uom, ls_drawno, ls_salesman
long   ll_row, ll_find

if dw_5.getrow()   < 1 then RETURN

ls_itemno    = dw_5.object.item_no[dw_5.getrow()]
ls_itemname  = dw_5.object.item_name[dw_5.getrow()]
ls_qa        = dw_5.object.qa[dw_5.getrow()]
ls_uom       = dw_5.object.uom[dw_5.getrow()]

if isnull(ls_itemno) OR ls_itemno = "" then RETURN

ll_find  = dw_4.find( "item_no = '" + ls_itemno + "' AND qa = '" + ls_qa + "'", 1, dw_4.rowcount() )
if ll_find > 0 then
	if LeftA(ls_itemname,2) = "AL" OR LeftA(ls_itemname,2) = "와" OR LeftA(ls_itemname,12) = "도장비(부속)" OR &
	   LeftA(ls_itemname,7) = "T-Z몰딩" OR LeftA(ls_itemname,6) = "가공비"  OR &
	   LeftA(ls_itemname,6) = "분리형" OR LeftA(ls_itemname,6) = "일체형" OR LeftA(ls_itemname,3) = "U형" OR &
	   LeftA(ls_itemname,7) = "CH-STUD" OR LeftA(ls_itemname,8) = "J-RUNNER"  OR &
		LeftA(ls_itemname,8) = "C-RUNNER" OR LeftA(ls_itemname,6) = "C-STUD" then
		// SKIP
	else
		dw_4.scrolltorow( ll_find )
		if MessageBox("확인", ls_itemname + "~n~n중복된 품목~n~n계속 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
			RETURN
		end if
	end if
end if

//
ll_row  = dw_4.insertrow(0)
dw_4.scrolltorow( ll_row )

dw_4.object.item_no[ll_row]   = ls_itemno
dw_4.object.item_name[ll_row] = ls_itemname
dw_4.object.qa[ll_row]        = ls_qa
dw_4.object.uom[ll_row]       = ls_uom
dw_4.object.draw_no[ll_row]   = ''
dw_4.object.user_id[ll_row]   = gs_userid
dw_4.object.user_name[ll_row] = gs_username
dw_4.object.use_yn[ll_row]    = "Y"
dw_4.object.sys_date[ll_row]  = gf_today()

end event

type st_horizontal2 from u_splitbar_horizontal within w_cdavgcost_m
integer x = 1646
integer y = 1240
integer width = 2491
boolean bringtotop = true
end type

type cbx_all from checkbox within w_cdavgcost_m
integer x = 59
integer y = 320
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

for ll_row = 1 to dw_5.rowcount()
	dw_5.object.chk[ll_row] = ls_chk
next

end event

type cb_3 from commandbutton within w_cdavgcost_m
integer x = 3273
integer y = 288
integer width = 402
integer height = 108
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택등록"
end type

event clicked;//
string ls_itemno, ls_itemname, ls_qa, ls_chk, ls_salesman
long   ll_row, ll_find, ll_chk

ll_chk  = dw_5.object.tchk[1]
if ll_chk < 1 then
	MessageBox("확인", "선택한 품목이 없습니다.")
	RETURN
end if

for ll_row = 1 to dw_5.rowcount()
	ls_chk       = dw_5.object.chk[ll_row]

	if ls_chk = "Y" then
		ls_itemno    = dw_5.object.item_no[ll_row]
		ls_itemname  = dw_5.object.item_name[ll_row]
		ls_qa        = dw_5.object.qa[ll_row]
		
		ll_chk  = dw_4.insertrow(0)
		dw_4.scrolltorow( ll_chk )
		
		dw_4.object.item_no[ll_chk]   = ls_itemno
		dw_4.object.item_name[ll_chk] = ls_itemname
		dw_4.object.qa[ll_chk]        = ls_qa
		dw_4.object.user_id[ll_chk]   = gs_userid
		dw_4.object.user_name[ll_chk] = gs_username
		dw_4.object.use_yn[ll_chk]    = "Y"
		dw_4.object.sys_date[ll_chk]  = gf_today()
	end if
next

end event

type ddlb_1 from dropdownlistbox within w_cdavgcost_m
integer x = 3698
integer y = 300
integer width = 352
integer height = 480
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
string item[] = {"W 단가","SS 단가","S 단가","A 단가","B 단가","품명그룹","빈도"}
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_cdavgcost_m
integer x = 4279
integer y = 288
integer width = 251
integer height = 108
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "적용"
end type

event clicked;// 적용
string  ls_value
long    ll_row
decimal ld_price

ls_value  = sle_value.text
ld_price  = dec(em_price.text)

for ll_row = 1 to dw_4.rowcount()
	choose case ddlb_1.text
		case "W 단가"
			dw_4.object.price_w[ll_row] = ld_price
	
		case "SS 단가"
			dw_4.object.price_ss[ll_row] = ld_price
	
		case "S 단가"
			dw_4.object.price_s[ll_row] = ld_price
	
		case "A 단가"
			dw_4.object.price_a[ll_row] = ld_price
		
		case "B 단가"
			dw_4.object.price_b[ll_row] = ld_price

		case "품명그룹"
			dw_4.object.item_group[ll_row] = ls_value
		case "빈도"
			dw_4.object.busy[ll_row] = ls_value
	end choose
next

end event

type em_price from editmask within w_cdavgcost_m
integer x = 4059
integer y = 300
integer width = 206
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
string mask = "#,##0"
end type

