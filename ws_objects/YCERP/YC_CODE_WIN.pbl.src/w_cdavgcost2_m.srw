$PBExportHeader$w_cdavgcost2_m.srw
$PBExportComments$거래처 단가관리
forward
global type w_cdavgcost2_m from w_inheritance
end type
type pb_excel from picturebutton within w_cdavgcost2_m
end type
type st_8 from statictext within w_cdavgcost2_m
end type
type ddlb_fld from dropdownlistbox within w_cdavgcost2_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdavgcost2_m
end type
type st_9 from statictext within w_cdavgcost2_m
end type
type sle_value from singlelineedit within w_cdavgcost2_m
end type
type cb_filteron from commandbutton within w_cdavgcost2_m
end type
type cb_filteroff from commandbutton within w_cdavgcost2_m
end type
type cb_1 from commandbutton within w_cdavgcost2_m
end type
type cb_2 from commandbutton within w_cdavgcost2_m
end type
type st_vertical from u_splitbar_vertical within w_cdavgcost2_m
end type
type st_2 from statictext within w_cdavgcost2_m
end type
type cbx_all from checkbox within w_cdavgcost2_m
end type
type ddlb_1 from dropdownlistbox within w_cdavgcost2_m
end type
type cb_4 from commandbutton within w_cdavgcost2_m
end type
type em_price from editmask within w_cdavgcost2_m
end type
type st_4 from statictext within w_cdavgcost2_m
end type
type dw_sales from datawindow within w_cdavgcost2_m
end type
type st_5 from statictext within w_cdavgcost2_m
end type
type dw_cust from datawindow within w_cdavgcost2_m
end type
type cbx_dangachk from checkbox within w_cdavgcost2_m
end type
type cbx_danga from checkbox within w_cdavgcost2_m
end type
type st_1 from statictext within w_cdavgcost2_m
end type
type dw_3 from datawindow within w_cdavgcost2_m
end type
type cbx_copy from checkbox within w_cdavgcost2_m
end type
type ddlb_op from dropdownlistbox within w_cdavgcost2_m
end type
end forward

global type w_cdavgcost2_m from w_inheritance
integer width = 4617
integer height = 2340
string title = "거래처별 단가관리(w_cdavgcost2_m)"
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
st_2 st_2
cbx_all cbx_all
ddlb_1 ddlb_1
cb_4 cb_4
em_price em_price
st_4 st_4
dw_sales dw_sales
st_5 st_5
dw_cust dw_cust
cbx_dangachk cbx_dangachk
cbx_danga cbx_danga
st_1 st_1
dw_3 dw_3
cbx_copy cbx_copy
ddlb_op ddlb_op
end type
global w_cdavgcost2_m w_cdavgcost2_m

type variables
//
st_print i_print
DataWindowChild idwc_user, idwc_cust, idwc_cust1, idwc_codemst
//
string   is_dw, is_sortorder, is_sortcolumn, is_colname, is_coltype, is_op


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
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_sales.SetTransObject( SQLCA )
dw_cust.SetTransObject( SQLCA )

//
dw_3.SetTransObject( SQLCA )
dw_3.insertrow(0)
dw_3.enabled = false
dw_3.object.cust_no.Background.Color = 67108864

cbx_copy.enabled     = false		// 단가복사
cbx_dangachk.enabled = false 		// 단가확인

pb_retrieve.enabled = false
pb_save.enabled     = false
if GF_Permission("거래처별_단가체크", gs_userid) = "Y" then
	pb_retrieve.enabled = true
	pb_save.enabled     = true
end if

// 담당자
dw_sales.settransobject(sqlca)
dw_sales.insertrow(0)

if GF_Permission("거래처별_단가체크", gs_userid) = "Y" then
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

// 전체거래처
dw_cust.settransobject(sqlca)
dw_cust.insertrow(0)  

idwc_cust.setredraw(false)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체")
dw_cust.object.cust_no[1] = "%"

//
dw_1.object.item_group.TabSequence   = 0
dw_1.object.busy.TabSequence         = 0
dw_1.object.sort_idx.TabSequence     = 0
dw_1.object.product_name.TabSequence = 0
dw_1.object.draw_no.TabSequence      = 0
dw_1.object.price_c.TabSequence      = 0
dw_1.object.price_b.TabSequence      = 0
dw_1.object.price_a.TabSequence      = 0
dw_1.object.price_s.TabSequence      = 0
dw_1.object.price_ss.TabSequence     = 0
dw_1.object.price_w.TabSequence      = 0
dw_1.object.price_dis.TabSequence    = 0

dw_2.object.item_group.visible   = false
dw_2.object.busy.visible         = false
dw_2.object.sort_idx.visible     = false
dw_2.object.product_name.visible = false
dw_2.object.draw_no.visible      = false

//
dw_1.retrieve()

end event

on w_cdavgcost2_m.create
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
this.st_2=create st_2
this.cbx_all=create cbx_all
this.ddlb_1=create ddlb_1
this.cb_4=create cb_4
this.em_price=create em_price
this.st_4=create st_4
this.dw_sales=create dw_sales
this.st_5=create st_5
this.dw_cust=create dw_cust
this.cbx_dangachk=create cbx_dangachk
this.cbx_danga=create cbx_danga
this.st_1=create st_1
this.dw_3=create dw_3
this.cbx_copy=create cbx_copy
this.ddlb_op=create ddlb_op
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
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.cbx_all
this.Control[iCurrent+14]=this.ddlb_1
this.Control[iCurrent+15]=this.cb_4
this.Control[iCurrent+16]=this.em_price
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.dw_sales
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.dw_cust
this.Control[iCurrent+21]=this.cbx_dangachk
this.Control[iCurrent+22]=this.cbx_danga
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.dw_3
this.Control[iCurrent+25]=this.cbx_copy
this.Control[iCurrent+26]=this.ddlb_op
end on

on w_cdavgcost2_m.destroy
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
destroy(this.st_2)
destroy(this.cbx_all)
destroy(this.ddlb_1)
destroy(this.cb_4)
destroy(this.em_price)
destroy(this.st_4)
destroy(this.dw_sales)
destroy(this.st_5)
destroy(this.dw_cust)
destroy(this.cbx_dangachk)
destroy(this.cbx_danga)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.cbx_copy)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
long  ll_height

gb_3.width  = newwidth  - (gb_3.x * 2)

ll_height   = newheight - dw_1.y - gb_3.x

dw_1.height = ll_height

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = ll_height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_3.x
dw_2.height = ll_height

end event

type pb_save from w_inheritance`pb_save within w_cdavgcost2_m
integer x = 3465
integer y = 64
fontcharset fontcharset = ansi!
boolean italic = true
end type

event pb_save::clicked;//
if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================
WF_Update1( dw_2, "Y" ) 

end event

type dw_1 from w_inheritance`dw_1 within w_cdavgcost2_m
integer x = 32
integer y = 432
integer width = 2441
integer height = 1764
integer taborder = 50
string dataobject = "d_cditemcosts_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull(row) OR row < 1 then RETURN

string ls_itemno, ls_qa
long   ll_find

ls_itemno = this.object.item_no[row]
ls_qa     = this.object.qa[row]
ll_find   = dw_2.find( "item_no='"+ls_itemno+"' AND qa='"+ls_qa+"'",1, dw_2.rowcount() )
if ll_find > 0 then
	dw_2.scrolltorow( ll_find )
end if

end event

event dw_1::doubleclicked;call super::doubleclicked;//
string ls_custno, ls_custname, ls_itemno, ls_itemname, ls_qa, ls_uom, ls_salesman
long   ll_row, ll_dw2cnt, ll_find

if dw_1.getrow()   < 1 then RETURN

ls_custno    = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "%" then RETURN

SELECT cust_name INTO :ls_custname FROM customer WHERE cust_no = :ls_custno;

ll_row  = dw_1.getrow()
if dw_1.object.use_yn[ll_row] = "Y" then	
	ls_itemno  = dw_1.object.item_no[ll_row]
	ls_qa      = dw_1.object.qa[ll_row]
	ls_uom     = dw_1.object.uom[ll_row]
	ll_find    = dw_2.find("item_no='"+ls_itemno+"' AND qa='"+ls_qa+"' AND uom='"+ls_uom+"'", 1, dw_2.rowcount())
	if ll_find > 0 then
		MessageBox("확인","해당하는 품목은 이미 존재합니다.")
		dw_2.scrolltorow( ll_find )
		RETURN
	end if
	
	//
	dw_2.setredraw( false )
	ll_dw2cnt  = dw_2.insertrow(0)
	
	dw_2.object.cust_no[ll_dw2cnt]      = ls_custno
	dw_2.object.cust_name[ll_dw2cnt]    = ls_custname
	
	dw_2.object.item_group[ll_dw2cnt]   = dw_1.object.item_group[ll_row]
	dw_2.object.busy[ll_dw2cnt]         = dw_1.object.busy[ll_row]
	dw_2.object.sort_idx[ll_dw2cnt]     = dw_1.object.sort_idx[ll_row]
	dw_2.object.product_name[ll_dw2cnt] = dw_1.object.product_name[ll_row]
	dw_2.object.draw_no[ll_dw2cnt]      = dw_1.object.draw_no[ll_row]
	dw_2.object.id[ll_dw2cnt]           = dw_1.object.id[ll_row]
	
	dw_2.object.item_no[ll_dw2cnt]      = dw_1.object.item_no[ll_row]
	dw_2.object.item_name[ll_dw2cnt]    = dw_1.object.item_name[ll_row]
	dw_2.object.qa[ll_dw2cnt]           = dw_1.object.qa[ll_row]
	dw_2.object.uom[ll_dw2cnt]          = dw_1.object.uom[ll_row]
	
	dw_2.object.user_id[ll_dw2cnt]      = gs_userid
	dw_2.object.user_name[ll_dw2cnt]    = gs_username
	dw_2.object.use_yn[ll_dw2cnt]       = "Y"
	dw_2.object.sys_date[ll_dw2cnt]     = GF_today()
	dw_2.setredraw( true )
	
	dw_2.scrolltorow( ll_dw2cnt )
end if


end event

type st_title from w_inheritance`st_title within w_cdavgcost2_m
integer x = 32
integer y = 12
integer width = 1138
string text = "거래처별 단가관리"
end type

type st_tips from w_inheritance`st_tips within w_cdavgcost2_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdavgcost2_m
boolean visible = false
integer y = 48
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdavgcost2_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdavgcost2_m
integer x = 3657
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdavgcost2_m
integer x = 3081
integer y = 64
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

type pb_cancel from w_inheritance`pb_cancel within w_cdavgcost2_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdavgcost2_m
integer x = 2889
integer y = 64
integer taborder = 150
end type

event pb_delete::clicked;//
long  ll_row

if dw_2.rowcount() < 1 then RETURN	

dw_2.accepttext()

if MessageBox("확인","삭제 하시겠습니까?",information!, OKCancel!, 2) = 1 then
	dw_2.setredraw( false )
	for ll_row = dw_2.rowcount() to 1 step -1
		if dw_2.object.chk[ll_row] = "Y" then
			dw_2.deleterow( ll_row )
		end if
	next
	dw_2.setredraw( true )
	WF_Update1(dw_2, "Y")
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_cdavgcost2_m
integer x = 2697
integer y = 64
integer taborder = 170
end type

event pb_insert::clicked;//
string ls_custno, ls_custname, ls_itemno, ls_itemname, ls_qa, ls_uom, ls_salesman
long   ll_row, ll_dw2cnt, ll_find

if dw_1.getrow()   < 1 then RETURN

ls_custno    = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "%" then 
	MessageBox("확인","전체거래처에서는 작업불가 합니다.") 
	RETURN
end if

SELECT cust_name INTO :ls_custname FROM customer WHERE cust_no = :ls_custno;

pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

//
dw_2.setredraw( false )
for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.use_yn[ll_row] = "Y" then
		if dw_1.object.danga[ll_row] = "Y" then
			ll_dw2cnt  = dw_2.insertrow(0)
			
			dw_2.object.cust_no[ll_dw2cnt]      = ls_custno
			dw_2.object.cust_name[ll_dw2cnt]    = ls_custname
			
			dw_2.object.item_group[ll_dw2cnt]   = dw_1.object.item_group[ll_row]
			dw_2.object.busy[ll_dw2cnt]         = dw_1.object.busy[ll_row]
			dw_2.object.sort_idx[ll_dw2cnt]     = dw_1.object.sort_idx[ll_row]
			dw_2.object.product_name[ll_dw2cnt] = dw_1.object.product_name[ll_row]
			dw_2.object.draw_no[ll_dw2cnt]      = dw_1.object.draw_no[ll_row]
			dw_2.object.id[ll_dw2cnt]           = dw_1.object.id[ll_row]
			
			dw_2.object.item_no[ll_dw2cnt]      = dw_1.object.item_no[ll_row]
			dw_2.object.item_name[ll_dw2cnt]    = dw_1.object.item_name[ll_row]
			dw_2.object.qa[ll_dw2cnt]           = dw_1.object.qa[ll_row]
			dw_2.object.uom[ll_dw2cnt]          = dw_1.object.uom[ll_row]
			
			dw_2.object.user_id[ll_dw2cnt]      = gs_userid
			dw_2.object.user_name[ll_dw2cnt]    = gs_username
			dw_2.object.use_yn[ll_dw2cnt]       = "Y"
			dw_2.object.sys_date[ll_dw2cnt]     = GF_today()
		end if
	end if
next
dw_2.setredraw( true )

SetPointer(oldpointer)
MessageBox("확인","'거래처별 단가체크 기초' 작업에서 '단가표' 체크항목 전부~n~n품목등록 완료")



end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdavgcost2_m
integer x = 2505
integer y = 64
integer taborder = 160
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_custno

dw_cust.accepttext()
ls_custno  = dw_cust.object.cust_no[1]

dw_1.retrieve()
dw_2.retrieve( ls_custno )

//
if ls_custno = "%" then
else
	cbx_copy.enabled  = true		// 단가복사
end if

cbx_dangachk.enabled = true


end event

type gb_3 from w_inheritance`gb_3 within w_cdavgcost2_m
integer x = 32
integer y = 240
integer width = 4517
integer height = 180
integer taborder = 90
integer textsize = -8
integer weight = 400
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdavgcost2_m
integer x = 1225
integer y = 12
integer width = 1225
integer height = 216
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdavgcost2_m
integer x = 2473
integer width = 1408
integer height = 216
integer taborder = 40
integer weight = 400
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdavgcost2_m
integer x = 2519
integer y = 432
integer width = 2030
integer height = 1764
integer taborder = 60
string dataobject = "d_cditemcosts_cust_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull(row) OR row < 1 then RETURN

string ls_itemno, ls_qa
long   ll_find

ls_itemno = this.object.item_no[row]
ls_qa     = this.object.qa[row]
ll_find   = dw_1.find( "item_no='"+ls_itemno+"' AND qa='"+ls_qa+"'",1, dw_1.rowcount() )
if ll_find > 0 then
	dw_1.scrolltorow( ll_find )
end if

end event

event dw_2::itemchanged;call super::itemchanged;//
long  ll_dw2cnt

ll_dw2cnt  = dw_2.getrow()

dw_2.object.user_id[ll_dw2cnt]      = gs_userid
dw_2.object.user_name[ll_dw2cnt]    = gs_username
dw_2.object.use_yn[ll_dw2cnt]       = "Y"
dw_2.object.sys_date[ll_dw2cnt]     = GF_today()

end event

type pb_excel from picturebutton within w_cdavgcost2_m
integer x = 3273
integer y = 64
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

type st_8 from statictext within w_cdavgcost2_m
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_cdavgcost2_m
integer x = 270
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

type ddlb_dwtitles from dropdownlistbox within w_cdavgcost2_m
integer x = 329
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

type st_9 from statictext within w_cdavgcost2_m
integer x = 786
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

type sle_value from singlelineedit within w_cdavgcost2_m
integer x = 1234
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

type cb_filteron from commandbutton within w_cdavgcost2_m
integer x = 1829
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

type cb_filteroff from commandbutton within w_cdavgcost2_m
integer x = 2030
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

type cb_1 from commandbutton within w_cdavgcost2_m
integer x = 2231
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

type cb_2 from commandbutton within w_cdavgcost2_m
integer x = 2418
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

type st_vertical from u_splitbar_vertical within w_cdavgcost2_m
integer x = 2482
integer y = 432
integer height = 1768
boolean bringtotop = true
end type

type st_2 from statictext within w_cdavgcost2_m
integer x = 3918
integer y = 116
integer width = 1038
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
string text = "~"수주관리~"에서 ~'주문단가~'로 사용"
boolean focusrectangle = false
end type

type cbx_all from checkbox within w_cdavgcost2_m
integer x = 2629
integer y = 316
integer width = 242
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

dw_2.setredraw( false )
for ll_row = 1 to dw_2.rowcount()
	dw_2.object.chk[ll_row] = ls_chk
next
dw_2.setredraw( true )

end event

type ddlb_1 from dropdownlistbox within w_cdavgcost2_m
integer x = 2875
integer y = 300
integer width = 352
integer height = 628
integer taborder = 130
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"C 급","B 급","A 급","S 급","S2급","W 급","단가","회장님"}
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_cdavgcost2_m
integer x = 3456
integer y = 296
integer width = 251
integer height = 92
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

ld_price  = dec(em_price.text)
if dw_2.object.tchk[1] = 0 then
	MessageBox("확인","작업할 대상을 선택하시기 바랍니다.")
	RETURN
end if

pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

for ll_row = 1 to dw_2.rowcount()
	if dw_2.object.chk[ll_row] = "Y" then
		choose case ddlb_1.text
			case "C 급"
				ld_price  = dw_1.object.price_c[ll_row]
				dw_2.object.price[ll_row] = ld_price
				
			case "B 급"
				ld_price  = dw_1.object.price_b[ll_row]
				dw_2.object.price[ll_row] = ld_price
				
			case "A 급"
				ld_price  = dw_1.object.price_a[ll_row]
				dw_2.object.price[ll_row] = ld_price
				
			case "S 급"
				ld_price  = dw_1.object.price_s[ll_row]
				dw_2.object.price[ll_row] = ld_price
				
			case "S2급"
				ld_price  = dw_1.object.price_ss[ll_row]
				dw_2.object.price[ll_row] = ld_price
				
			case "W 급"
				ld_price  = dw_1.object.price_w[ll_row]
				dw_2.object.price[ll_row] = ld_price
				
			case "단가"
				dw_2.object.price[ll_row] = ld_price
		
			case "회장님"
				dw_2.object.price_top[ll_row] = ld_price
		end choose
	end if
next
SetPointer(oldpointer)
MessageBox("확인","작업완료")

end event

type em_price from editmask within w_cdavgcost2_m
integer x = 3237
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

type st_4 from statictext within w_cdavgcost2_m
integer x = 1243
integer y = 48
integer width = 297
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

type dw_sales from datawindow within w_cdavgcost2_m
integer x = 1545
integer y = 44
integer width = 672
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

event itemchanged;//
string ls_salesman

this.accepttext()
ls_salesman  = this.object.user[1]

//if GF_Permission("거래처별_단가체크", gs_userid) = "Y" then
//else
	idwc_cust.setfilter( "salesman = '" + ls_salesman + "'" )
	idwc_cust.filter()
//end if
dw_cust.enabled = true

end event

type st_5 from statictext within w_cdavgcost2_m
integer x = 1243
integer y = 132
integer width = 297
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_cdavgcost2_m
integer x = 1545
integer y = 132
integer width = 873
integer height = 80
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
pb_retrieve.triggerevent( clicked! )



end event

type cbx_dangachk from checkbox within w_cdavgcost2_m
integer x = 3730
integer y = 276
integer width = 366
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "단가확인"
end type

event clicked;//
string  ls_itemno, ls_qa, ls_custno
long    ll_row, ll_chk, ll_find
decimal ld_price, ld_pc, ld_pb, ld_pa, ld_ps, ld_ps2, ld_pw, ld_pdis

//
dw_cust.accepttext()
ls_custno  = dw_cust.object.cust_no[1]
if ls_custno = "%" then
	MessageBox("확인","전체 거래처에서 단가확인을 하실수가 없습니다.")
	this.checked = false
	RETURN
end if

// 단가확인
ll_chk        = dw_2.object.tchk[1]
if ll_chk < 1 then
	MessageBox("확인","우측 DataWindow에서 단가확인 대상을 선택하시기 바랍니다.")
	this.checked = false
	RETURN
end if

pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

// 화면조정
cbx_danga.checked = true
cbx_danga.triggerevent( clicked! )

dw_1.width    = gb_3.width / 2
st_vertical.x = dw_1.x + dw_1.width
dw_2.x        = st_vertical.x + st_vertical.width
dw_2.width    = (gb_3.width / 2) - st_vertical.width

//
dw_1.setsort( "use_yn D, item_group A, busy A, sort_idx A, item_name A, qa A" )
dw_1.sort()

dw_2.setsort( "item_group A, busy A, sort_idx A, item_name A, qa A" )
dw_2.sort()

dw_1.setredraw( false )
if this.checked = false then
	for ll_row = 1 to dw_1.rowcount()
		dw_1.object.pc[ll_row]   = "N"
		dw_1.object.pb[ll_row]   = "N"
		dw_1.object.pa[ll_row]   = "N"
		dw_1.object.ps[ll_row]   = "N"
		dw_1.object.pss[ll_row]  = "N"
		dw_1.object.pw[ll_row]   = "N"
		dw_1.object.pdis[ll_row] = "N"
	next
else
	for ll_row = 1 to dw_2.rowcount()
		if dw_2.object.chk[ll_row] = "Y" then
			ls_itemno = dw_2.object.item_no[ll_row]
			ls_qa     = dw_2.object.qa[ll_row]
			ld_price  = dw_2.object.price[ll_row]
			
			ll_find   = dw_1.find("item_no='"+ls_itemno+"' AND qa='"+ls_qa+"'", 1, dw_1.rowcount() )
			if ll_find > 0 then
				ld_pc     = dw_1.object.price_c[ll_find]
				ld_pb     = dw_1.object.price_b[ll_find]
				ld_pa     = dw_1.object.price_a[ll_find]
				ld_ps     = dw_1.object.price_s[ll_find]
				ld_ps2    = dw_1.object.price_ss[ll_find]
				ld_pw     = dw_1.object.price_w[ll_find]
				ld_pdis   = dw_1.object.price_dis[ll_find]
				
				choose case ld_price
					case is > ld_pc
						dw_1.object.pc[ll_find]   = "Y"
					case ld_pc
						dw_1.object.pc[ll_find]   = "Y"
					case is >= ld_pb
						dw_1.object.pb[ll_find]   = "Y"
					case is >= ld_pa
						dw_1.object.pa[ll_find]   = "Y"
					case is >= ld_ps
						dw_1.object.ps[ll_find]   = "Y"
					case is >= ld_ps2
						dw_1.object.pss[ll_find]  = "Y"
					case is >= ld_pw
						dw_1.object.pw[ll_find]   = "Y"
					case is >= ld_pdis
						dw_1.object.pdis[ll_find] = "Y"
				end choose
			end if
		end if
	next
end if
dw_1.setredraw( true )

SetPointer(oldpointer)
MessageBox("확인","작업완료")

end event

type cbx_danga from checkbox within w_cdavgcost2_m
integer x = 87
integer y = 236
integer width = 480
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
string text = "단가표명숨김"
end type

event clicked;//
if this.checked = true then
	dw_1.object.item_group.width   = 0
	dw_1.object.busy.width         = 0
	dw_1.object.sort_idx.width     = 0
	dw_1.object.product_name.width = 0
	dw_1.object.draw_no.width      = 0
else
	dw_1.object.item_group.width   = 937
	dw_1.object.busy.width         = 169
	dw_1.object.sort_idx.width     = 160
	dw_1.object.product_name.width = 850
	dw_1.object.draw_no.width      = 773
end if

end event

type st_1 from statictext within w_cdavgcost2_m
integer x = 3918
integer y = 48
integer width = 1902
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "※왼쪽 ~'단가표~' 명을 체크한 후 추가 버튼을 클릭하면 됩니다."
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cdavgcost2_m
integer x = 4123
integer y = 328
integer width = 873
integer height = 80
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 단가복사하기
string ls_custno, ls_target
long   ll_cnt

dw_cust.accepttext()
ls_custno  = dw_cust.object.cust_no[1]
if ls_custno = "%" then
	MessageBox("확인","전체 거래처에서는 작업할 수 없습니다.")
	RETURN
end if

this.accepttext()
ls_target  = this.object.cust_no[1]

if ls_custno = ls_target then RETURN
if isnull(ls_target) OR ls_target = "" then RETURN

SELECT count(*) INTO :ll_cnt FROM ItemCOSTS_CUST WHERE cust_no = :ls_target;
if ll_cnt > 0 then
	if MessageBox("확인","해당하는 거래처의 단가가 "+string(ll_cnt,"#,##0")+" 건 존재합니다.~r~r" + &
	              "계속해서 작업을 진행 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
	
	DELETE ItemCOSTS_CUST WHERE cust_no = :ls_target;
	if sqlca.sqldbcode <> 0 then
		MessageBox("확인","단가복사 작업중 오류가 발생했습니다.",Exclamation!)
		rollback;
		RETURN
	else
		COMMIT;
	end if	
end if

//
INSERT INTO ItemCOSTS_CUST (cust_no, item_no, qa, draw_no, product_name, ID, uom, item_group
          , busy, sort_idx, price, price_top, use_yn, user_id, sys_date )
SELECT :ls_target, item_no, qa, draw_no, product_name, ID, uom, item_group
     , busy, sort_idx, price, price_top, use_yn, user_id, getdate() 
  FROM ItemCOSTS_CUST
 WHERE cust_no    = :ls_custno;
if sqlca.sqldbcode <> 0 then
	MessageBox("확인","단가복사 작업중 오류가 발생했습니다.",Exclamation!)
	rollback;
	RETURN
else
	COMMIT;
end if	

end event

type cbx_copy from checkbox within w_cdavgcost2_m
integer x = 3730
integer y = 348
integer width = 366
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "단가복사"
end type

event clicked;// 단가복사
string  ls_custno

dw_cust.accepttext()
ls_custno  = dw_cust.object.cust_no[1]

dw_3.getchild("cust_no", idwc_cust1)
idwc_cust1.settransobject(sqlca)
idwc_cust1.setfilter( "cust_no <> '"+ls_custno+"'" )
idwc_cust1.filter()

//
if this.checked = true then
	dw_3.enabled = true
	dw_3.object.cust_no.Background.Color = RGB(255, 255, 255)
else
	dw_3.enabled = false
	dw_3.object.cust_no.Background.Color = 67108864
end if

end event

type ddlb_op from dropdownlistbox within w_cdavgcost2_m
integer x = 951
integer y = 304
integer width = 274
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

