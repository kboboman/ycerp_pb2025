$PBExportHeader$w_oiitemdo_r.srw
$PBExportComments$제품별 제품출고현황(1998/5/14,성삼지)
forward
global type w_oiitemdo_r from w_inheritance
end type
type pb_1 from picturebutton within w_oiitemdo_r
end type
type cbx_cust from checkbox within w_oiitemdo_r
end type
type cbx_price from checkbox within w_oiitemdo_r
end type
type dw_3 from datawindow within w_oiitemdo_r
end type
type st_3 from statictext within w_oiitemdo_r
end type
type ddlb_fld from dropdownlistbox within w_oiitemdo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiitemdo_r
end type
type st_4 from statictext within w_oiitemdo_r
end type
type ddlb_op from dropdownlistbox within w_oiitemdo_r
end type
type sle_value from singlelineedit within w_oiitemdo_r
end type
type cb_popup from commandbutton within w_oiitemdo_r
end type
type cb_1 from commandbutton within w_oiitemdo_r
end type
type cb_2 from commandbutton within w_oiitemdo_r
end type
type cb_3 from commandbutton within w_oiitemdo_r
end type
type cb_5 from commandbutton within w_oiitemdo_r
end type
type rb_1 from radiobutton within w_oiitemdo_r
end type
type rb_2 from radiobutton within w_oiitemdo_r
end type
type st_5 from statictext within w_oiitemdo_r
end type
type em_1 from editmask within w_oiitemdo_r
end type
type em_2 from editmask within w_oiitemdo_r
end type
type dw_area from datawindow within w_oiitemdo_r
end type
type st_6 from statictext within w_oiitemdo_r
end type
type cbx_fix from checkbox within w_oiitemdo_r
end type
type st_8 from statictext within w_oiitemdo_r
end type
type dw_cust from datawindow within w_oiitemdo_r
end type
type cbx_hap from checkbox within w_oiitemdo_r
end type
type cbx_haphd from checkbox within w_oiitemdo_r
end type
type gb_6 from groupbox within w_oiitemdo_r
end type
end forward

global type w_oiitemdo_r from w_inheritance
integer y = 112
integer width = 4526
integer height = 2176
string title = "물품별 출고현황(w_oiitemdo_r)"
pb_1 pb_1
cbx_cust cbx_cust
cbx_price cbx_price
dw_3 dw_3
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_popup cb_popup
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
rb_1 rb_1
rb_2 rb_2
st_5 st_5
em_1 em_1
em_2 em_2
dw_area dw_area
st_6 st_6
cbx_fix cbx_fix
st_8 st_8
dw_cust dw_cust
cbx_hap cbx_hap
cbx_haphd cbx_haphd
gb_6 gb_6
end type
global w_oiitemdo_r w_oiitemdo_r

type variables
st_print i_print
string   is_dw, is_sale_flag, is_ret, is_itemdosql1, is_itemdosql2
gs_itemdo_str1 ist_code
datawindowchild idwc_area, idwc_cust

end variables

on w_oiitemdo_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.cbx_cust=create cbx_cust
this.cbx_price=create cbx_price
this.dw_3=create dw_3
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_popup=create cb_popup
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_5=create st_5
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.st_6=create st_6
this.cbx_fix=create cbx_fix
this.st_8=create st_8
this.dw_cust=create dw_cust
this.cbx_hap=create cbx_hap
this.cbx_haphd=create cbx_haphd
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.cbx_cust
this.Control[iCurrent+3]=this.cbx_price
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_popup
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.rb_1
this.Control[iCurrent+17]=this.rb_2
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.em_1
this.Control[iCurrent+20]=this.em_2
this.Control[iCurrent+21]=this.dw_area
this.Control[iCurrent+22]=this.st_6
this.Control[iCurrent+23]=this.cbx_fix
this.Control[iCurrent+24]=this.st_8
this.Control[iCurrent+25]=this.dw_cust
this.Control[iCurrent+26]=this.cbx_hap
this.Control[iCurrent+27]=this.cbx_haphd
this.Control[iCurrent+28]=this.gb_6
end on

on w_oiitemdo_r.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.cbx_cust)
destroy(this.cbx_price)
destroy(this.dw_3)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_popup)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_5)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_6)
destroy(this.cbx_fix)
destroy(this.st_8)
destroy(this.dw_cust)
destroy(this.cbx_hap)
destroy(this.cbx_haphd)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')
idwc_area.accepttext()
dw_area.object.area[1] = "%"	// gs_area
dw_area.object.area.Background.Color = 67108864
dw_area.enabled = false

// 거래처
dw_cust.SetTransObject(SQLCA)
dw_cust.GetChild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

idwc_cust.retrieve( "%" )
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체거래처")
idwc_cust.accepttext()
dw_cust.object.cust_no[1] = "%"
dw_cust.insertrow(0)  
//dw_cust.object.cust_no.Background.Color = 67108864

// 틀고정
cbx_fix.visible = false

// 일자
em_1.text   = string(today(), "yyyy/mm/dd")
em_2.text   = string(today(), "yyyy/mm/dd")

//
cbx_price.enabled = false	// 단가 출력안함

dw_3.SetTransObject( SQLCA )

dw_2.visible  = false
dw_3.visible  = false

is_itemdosql1 = dw_1.describe("datawindow.table.select")
is_itemdosql2 = dw_2.describe("datawindow.table.select")

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height


end event

type pb_save from w_inheritance`pb_save within w_oiitemdo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiitemdo_r
integer x = 32
integer y = 408
integer width = 4421
integer height = 1632
integer taborder = 0
string dataobject = "d_oiitem_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_oiitemdo_r
integer x = 41
integer y = 164
integer width = 101
integer height = 72
integer taborder = 0
string dataobject = "d_oiitemdo_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_oiitemdo_r
integer y = 24
integer width = 1083
integer height = 132
string text = "물품별 출고현황"
end type

type st_tips from w_inheritance`st_tips within w_oiitemdo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiitemdo_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiitemdo_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oiitemdo_r
integer x = 3968
integer y = 60
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiitemdo_r
integer x = 3584
integer y = 60
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row, ll_count
string ls_request, ls_price
w_repsuper w_print

ll_row = dw_2.rowcount()
if ll_row < 1 then
   MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

for ll_row = 1 to dw_2.rowcount()
//   dw_2.object.customer_industry_code[ll_row] = st_1.text
	dw_2.object.customer_bus_cord[ll_row]      = ist_code.start_date
	dw_2.object.customer_bus_rep[ll_row]       = ist_code.end_date
next

//i_print.name = 'd_oiitemdo_r'
i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 물품별 출고현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
OpenSheetWithParm( w_print, i_print, ParentWindow(), 1, Original! )

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiitemdo_r
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oiitemdo_r
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oiitemdo_r
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiitemdo_r
integer x = 3392
integer y = 60
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_area,  ls_custno,   ls_itemno,  ls_request, ls_price
string ls_desc,  ls_itemname, ls_itemname1, ls_custname, ls_custname1
date   ld_sdate, ld_edate
long   ll_row

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 사업장
dw_area.AcceptText()
ls_area = dw_area.object.area[1]

// 거래처
dw_cust.AcceptText()
ls_custno = dw_cust.object.cust_no[1]

// 거래처 제출용(출력)
if cbx_cust.checked = true then	
	ls_request = "Y"
else
	ls_request = "N"
end if

// 단가 출력안함
if cbx_price.checked = true then	
	ls_price = "Y"
else
	ls_price = "N"
end if

string ls_salesman
choose case gs_level
	case "A", "B"
		ls_salesman = "%"
	case 'C'
		ls_salesman = gs_userid
end choose

// 품목선택
gs_where2 lst_whitemret

lst_whitemret.chk = "S"
OpenWithParm( w_whitemselectmulti_w, lst_whitemret )
lst_whitemret = Message.PowerObjectParm

if lst_whitemret.chk = "Y" then
	ls_itemno = lst_whitemret.str1[1]
else
	ls_itemno = "%"
end if

//
dw_1.setredraw(false)
dw_1.retrieve( ls_custno, ld_sdate, ld_edate, ls_salesman, ls_itemno, ls_price )
dw_1.groupcalc()
dw_1.setredraw(true)

dw_2.retrieve( ls_custno, ld_sdate, ld_edate, ls_salesman, ls_itemno, ls_price, ls_request )
dw_2.groupcalc()

if dw_1.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   RETURN
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiitemdo_r
integer x = 1157
integer y = 16
integer width = 1545
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oiitemdo_r
integer y = 232
integer width = 4421
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiitemdo_r
integer x = 3365
integer y = 16
integer width = 818
integer height = 212
integer taborder = 0
end type

type pb_1 from picturebutton within w_oiitemdo_r
event mousemove pbm_mousemove
integer x = 3776
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
integer ls_Value,   li_Pos,   li_value
DataWindow dwxls

choose case is_dw
	case "dw_1"
		dwxls = dw_1
	case "dw_3"
		dwxls = dw_3
end choose

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = Upper(MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos))
	if ls_Value = 1 then
		if ls_ExpandName = "XLS" then
			dwxls.SaveAsASCII(ls_DocName)
			MessageBox("확인","작업완료")
		end if
	end if
end if	

end event

type cbx_cust from checkbox within w_oiitemdo_r
integer x = 2761
integer y = 76
integer width = 553
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "제출용(출력)"
end type

event clicked;//
if this.checked = true then 
	cbx_price.enabled = true
else
	cbx_price.checked = false
	cbx_price.enabled = false
end if

end event

type cbx_price from checkbox within w_oiitemdo_r
integer x = 2761
integer y = 144
integer width = 553
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "단가 출력안함"
end type

type dw_3 from datawindow within w_oiitemdo_r
integer x = 832
integer y = 724
integer width = 2693
integer height = 864
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiitemsum_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow( 0, false )
This.SelectRow( row, true )

end event

type st_3 from statictext within w_oiitemdo_r
integer x = 87
integer y = 300
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

type ddlb_fld from dropdownlistbox within w_oiitemdo_r
integer x = 274
integer y = 284
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oiitemdo_r
integer x = 306
integer y = 296
integer width = 311
integer height = 88
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
end type

type st_4 from statictext within w_oiitemdo_r
integer x = 745
integer y = 300
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

type ddlb_op from dropdownlistbox within w_oiitemdo_r
integer x = 914
integer y = 284
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_oiitemdo_r
integer x = 1234
integer y = 288
integer width = 489
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_popup from commandbutton within w_oiitemdo_r
integer x = 1733
integer y = 288
integer width = 69
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "*"
end type

event clicked;//		
m_dwgrid_popup NewMenu
string  ls_sort, ls_filter
integer li_int, li_rtn

NewMenu = CREATE m_dwgrid_popup

GS_SortFilter = ""
li_int = NewMenu.m_popup.PopMenu(ParentWindow().PointerX(), ParentWindow().PointerY())

choose case is_dw
	case "dw_1"
		GDW_Client = dw_1
	case "dw_3"
		GDW_Client = dw_3
	case ""
		MessageBox("확인","작업할 대상을 먼저 선택하시기 바랍니다.")
end choose

choose case GS_SortFilter
	case "m_specifysort"
		SetNull(ls_sort)
		li_rtn = GDW_Client.SetSort(ls_sort)
		if li_rtn = 1 then
			GS_Sort = GDW_Client.Describe("Datawindow.Table.Sort")
			GDW_Client.Sort()
		end if

	case "m_specifyfilter"
		GDW_Client.SetRedraw(True)
		SetNull(ls_filter)
		li_rtn = GDW_Client.SetFilter(ls_filter)
		if li_rtn = 1 then
			GDW_Client.Filter()
			GDW_Client.Sort()
		end if
				
	case "m_print"
		GDW_Client.Print()
		
	case "m_saveas"
		GDW_Client.SetRedraw(True)
		GDW_Client.SaveAs()
end choose

end event

type cb_1 from commandbutton within w_oiitemdo_r
integer x = 1806
integer y = 288
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiitemdo_r
integer x = 1970
integer y = 288
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
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiitemdo_r
integer x = 2135
integer y = 288
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
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiitemdo_r
integer x = 2299
integer y = 288
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
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type rb_1 from radiobutton within w_oiitemdo_r
integer x = 2999
integer y = 300
integer width = 361
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
string text = "출고현황"
boolean checked = true
end type

event clicked;//
if this.checked = true then
	dw_1.visible = true
	dw_3.visible = false

	cbx_fix.visible = false
end if

end event

type rb_2 from radiobutton within w_oiitemdo_r
integer x = 3387
integer y = 300
integer width = 416
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
string text = "건자재집계"
end type

event clicked;//
if this.checked = true then	
	dw_1.visible = false
	dw_3.visible = true

	cbx_fix.visible = true
end if

end event

type st_5 from statictext within w_oiitemdo_r
integer x = 1989
integer y = 52
integer width = 306
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "조회일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oiitemdo_r
integer x = 2295
integer y = 52
integer width = 375
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
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
OpenWithParm( w_calendar, Message.StringParm )
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type em_2 from editmask within w_oiitemdo_r
integer x = 2295
integer y = 136
integer width = 375
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
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
OpenWithParm( w_calendar, Message.StringParm )
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type dw_area from datawindow within w_oiitemdo_r
integer x = 1431
integer y = 52
integer width = 526
integer height = 80
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type st_6 from statictext within w_oiitemdo_r
integer x = 1193
integer y = 56
integer width = 233
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_fix from checkbox within w_oiitemdo_r
integer x = 3817
integer y = 300
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "틀고정"
end type

event clicked;//
string ls_colx

if this.checked = true then
	ls_colx = string(long(dw_3.object.item_name.x) + long(dw_3.object.item_name.width))
	dw_3.object.datawindow.horizontalscrollsplit = ls_colx
else
	ls_colx = "0"
	dw_3.object.datawindow.horizontalscrollsplit = ls_colx
end if

end event

type st_8 from statictext within w_oiitemdo_r
integer x = 1193
integer y = 136
integer width = 233
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
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_oiitemdo_r
integer x = 1426
integer y = 132
integer width = 859
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type cbx_hap from checkbox within w_oiitemdo_r
integer x = 2482
integer y = 268
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;// 합계만 보기
cbx_haphd.checked = false

dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
else
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
end if
dw_1.setredraw( true )

end event

type cbx_haphd from checkbox within w_oiitemdo_r
integer x = 2482
integer y = 328
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계숨김"
end type

event clicked;// 합계숨김
cbx_hap.checked = false

dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=0")	   // 소계 숨김
else
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
end if
dw_1.setredraw( true )

end event

type gb_6 from groupbox within w_oiitemdo_r
integer x = 2725
integer y = 16
integer width = 617
integer height = 212
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

