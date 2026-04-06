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
type st_3 from statictext within w_oiitemdo_r
end type
type ddlb_fld from dropdownlistbox within w_oiitemdo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiitemdo_r
end type
type st_4 from statictext within w_oiitemdo_r
end type
type sle_value from singlelineedit within w_oiitemdo_r
end type
type cb_1 from commandbutton within w_oiitemdo_r
end type
type cb_2 from commandbutton within w_oiitemdo_r
end type
type cb_3 from commandbutton within w_oiitemdo_r
end type
type cb_5 from commandbutton within w_oiitemdo_r
end type
type st_8 from statictext within w_oiitemdo_r
end type
type dw_cust from datawindow within w_oiitemdo_r
end type
type st_6 from statictext within w_oiitemdo_r
end type
type dw_area from datawindow within w_oiitemdo_r
end type
type st_7 from statictext within w_oiitemdo_r
end type
type em_1 from editmask within w_oiitemdo_r
end type
type em_2 from editmask within w_oiitemdo_r
end type
type cbx_hap from checkbox within w_oiitemdo_r
end type
type cbx_haphd from checkbox within w_oiitemdo_r
end type
type dw_filter from datawindow within w_oiitemdo_r
end type
type cb_4 from commandbutton within w_oiitemdo_r
end type
type cbx_import from checkbox within w_oiitemdo_r
end type
type cb_6 from commandbutton within w_oiitemdo_r
end type
type cb_7 from commandbutton within w_oiitemdo_r
end type
type ddlb_op from dropdownlistbox within w_oiitemdo_r
end type
type gb_6 from groupbox within w_oiitemdo_r
end type
type gb_4 from groupbox within w_oiitemdo_r
end type
end forward

global type w_oiitemdo_r from w_inheritance
integer y = 112
integer width = 4727
integer height = 2484
string title = "물품별 출고현황(w_oiitemdo_r)"
pb_1 pb_1
cbx_cust cbx_cust
cbx_price cbx_price
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_8 st_8
dw_cust dw_cust
st_6 st_6
dw_area dw_area
st_7 st_7
em_1 em_1
em_2 em_2
cbx_hap cbx_hap
cbx_haphd cbx_haphd
dw_filter dw_filter
cb_4 cb_4
cbx_import cbx_import
cb_6 cb_6
cb_7 cb_7
ddlb_op ddlb_op
gb_6 gb_6
gb_4 gb_4
end type
global w_oiitemdo_r w_oiitemdo_r

type variables
//
st_print i_print
gs_itemdo_str1 ist_code
DataWindowChild idwc_area, idwc_cust

string   is_sale_flag, is_ret, is_itemdosql1, is_itemdosql2

end variables

forward prototypes
public subroutine wf_dwfilter (datawindow arg_dw, string arg_col, string arg_column, string arg_value)
end prototypes

public subroutine wf_dwfilter (datawindow arg_dw, string arg_col, string arg_column, string arg_value);//
string ls_itemno, ls_itemno_save, ls_itemnm, ls_itemnm_save
string ls_filter, ls_value, ls_val[], ls_valtemp, ls_itemtemp
long   ll_row, ll_dwcnt, ll_cnt, ll_i, ll_len

debugbreak()

if dw_1.rowcount() < 1 then RETURN

// 가져오기
if cbx_import.checked = true then
	arg_value = ProfileString("YCERP.INI","MPGAEGO","FILTER", " ")
	arg_value = GF_ReplaceAll(arg_value,"'","")
end if
		
if LenA(trim(arg_value)) > 1 then
	if RightA(trim(arg_value),1) = "," then
		ls_value = trim(arg_value)
	else
		ls_value = trim(arg_value) + ","
	end if
end if
ll_cnt = GF_SPLIT(ls_value, ",", ls_val) - 1

//
if dw_filter.visible = false then
	dw_1.setredraw( false )
	
	dw_filter.setfilter("") ; dw_filter.filter()
	dw_filter.reset()
	
	// 값
	if ll_cnt = 0 then
		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = "(ALL)"
		dw_filter.object.item_name[ll_dwcnt] = "(모두 선택)"
		dw_filter.object.chk[ll_dwcnt]       = "Y"
		
		//	
		ls_itemno_save = dw_1.GetItemString( 1, arg_col )
		ls_itemnm_save = dw_1.GetItemString( 1, arg_column )

		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
		dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
		dw_filter.object.chk[ll_dwcnt]       = "Y"
		
		for ll_row = 1 to dw_1.rowcount()
			ls_itemno  = dw_1.GetItemString( ll_row, arg_col )
			ls_itemnm  = dw_1.GetItemString( ll_row, arg_column )
			
			if ls_itemno_save = ls_itemno then
				// SKIP
			else
				ls_itemno_save = ls_itemno
				ls_itemnm_save = ls_itemnm
				
				ll_dwcnt = dw_filter.insertrow( 0 )		
				dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
				dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
				dw_filter.object.chk[ll_dwcnt]       = "Y"
			end if
		next		
	// VALUE 필터링
	else
		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = "(ALL)"
		dw_filter.object.item_name[ll_dwcnt] = "(모두 선택)"
		dw_filter.object.chk[ll_dwcnt]       = "N"
		
		//
		ls_itemno_save = dw_1.GetItemString( 1, arg_col )
		ls_itemnm_save = dw_1.GetItemString( 1, arg_column )
		
		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
		dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
		dw_filter.object.chk[ll_dwcnt]       = "N"

		// 첫행체크
		if cbx_import.checked = true then
			ls_valtemp  = trim(ls_val[1])
			ll_len      = LenA( ls_valtemp )			
			ls_itemtemp = LeftA( ls_itemno_save, ll_len )
			
			if ls_itemtemp = ls_valtemp then
				dw_filter.object.chk[ll_dwcnt] = "Y"
			else
				dw_filter.object.chk[ll_dwcnt] = "N"
			end if
		end if
		
		//
		for ll_row = 1 to dw_1.rowcount()
			ls_itemno  = dw_1.GetItemString( ll_row, arg_col )
			ls_itemnm  = dw_1.GetItemString( ll_row, arg_column )
			
			if ls_itemno_save = ls_itemno then
				// SKIP
			else
				ls_itemno_save = ls_itemno
				ls_itemnm_save = ls_itemnm
				
				ll_dwcnt = dw_filter.insertrow( 0 )		
				dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
				dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
				dw_filter.object.chk[ll_dwcnt]       = "N"

				for ll_i = 1 to UpperBound(ls_val)
					if ls_val[ll_i] = "" then CONTINUE
					
					ls_valtemp  = trim(ls_val[ll_i])
					ll_len      = LenA( ls_valtemp )					
					ls_itemtemp = LeftA( ls_itemno_save, ll_len )
					
					if ls_itemtemp = ls_valtemp then
						dw_filter.object.chk[ll_dwcnt] = "Y"
						ll_i = UpperBound(ls_val)			// CONTINUE
					else
						dw_filter.object.chk[ll_dwcnt] = "N"
					end if
				next
			end if
		next
	end if
	dw_1.setredraw( true )
	
	dw_filter.x      = (ParentWindow().width  - 1710) / 2	// PointerX()
	dw_filter.y      = (ParentWindow().height - 1904) / 2  // PointerY()
	dw_filter.width  = 1710
	dw_filter.height = 1904
	
	if dw_filter.rowcount() - 1 = dw_filter.object.tchk[1] then
		dw_filter.object.chk[1] = "Y"
	end if
	
	dw_filter.visible = true
end if

end subroutine

on w_oiitemdo_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.cbx_cust=create cbx_cust
this.cbx_price=create cbx_price
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_8=create st_8
this.dw_cust=create dw_cust
this.st_6=create st_6
this.dw_area=create dw_area
this.st_7=create st_7
this.em_1=create em_1
this.em_2=create em_2
this.cbx_hap=create cbx_hap
this.cbx_haphd=create cbx_haphd
this.dw_filter=create dw_filter
this.cb_4=create cb_4
this.cbx_import=create cbx_import
this.cb_6=create cb_6
this.cb_7=create cb_7
this.ddlb_op=create ddlb_op
this.gb_6=create gb_6
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.cbx_cust
this.Control[iCurrent+3]=this.cbx_price
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.dw_cust
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.dw_area
this.Control[iCurrent+17]=this.st_7
this.Control[iCurrent+18]=this.em_1
this.Control[iCurrent+19]=this.em_2
this.Control[iCurrent+20]=this.cbx_hap
this.Control[iCurrent+21]=this.cbx_haphd
this.Control[iCurrent+22]=this.dw_filter
this.Control[iCurrent+23]=this.cb_4
this.Control[iCurrent+24]=this.cbx_import
this.Control[iCurrent+25]=this.cb_6
this.Control[iCurrent+26]=this.cb_7
this.Control[iCurrent+27]=this.ddlb_op
this.Control[iCurrent+28]=this.gb_6
this.Control[iCurrent+29]=this.gb_4
end on

on w_oiitemdo_r.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.cbx_cust)
destroy(this.cbx_price)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_8)
destroy(this.dw_cust)
destroy(this.st_6)
destroy(this.dw_area)
destroy(this.st_7)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.cbx_hap)
destroy(this.cbx_haphd)
destroy(this.dw_filter)
destroy(this.cb_4)
destroy(this.cbx_import)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.ddlb_op)
destroy(this.gb_6)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_filter.visible = false	// DW Filter용

cbx_price.enabled = false	// 단가 출력안함
if GF_Permission("물품별 출고현황(ALL)", gs_userid) = "Y" then
	cbx_price.enabled = true	// 단가 출력안함
end if

if gs_rank_no = '235' then
	dw_1.object.dodet_price.visible = false
	pb_print.enabled = false
	pb_1.enabled = false
end if

dw_2.visible  = false
is_itemdosql1 = dw_1.describe("datawindow.table.select")
is_itemdosql2 = dw_2.describe("datawindow.table.select")

// 일자
em_1.text     = string(today(), "yyyy/mm/01")
em_2.text     = string(today(), "yyyy/mm/dd")

// 사업장 
string ls_area
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = "%"	// gs_area
dw_area.object.area[1] = ls_area

// 거래처
//dw_1.object.cust_no.Background.Color = 67108864
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


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_oiitemdo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiitemdo_r
integer x = 32
integer y = 424
integer width = 4622
integer height = 1924
integer taborder = 0
string dataobject = "d_oiitem_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oiitemdo_r
integer y = 24
integer width = 1061
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
integer x = 4187
integer y = 64
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiitemdo_r
integer x = 3803
integer y = 64
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
	dw_2.object.customer_bus_cord[ll_row]      = em_1.text
	dw_2.object.customer_bus_rep[ll_row]       = em_2.text
next

//i_print.name = 'd_oiitemdo_r'
i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 물품별 출고현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)

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
integer x = 3611
integer y = 64
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_area, ls_custno, ls_itemno[], ls_request, ls_price, ls_gubun
date   ld_sdate, ld_edate
long   ll_row, i, ll_trow

//OpenWithParm(w_whitemdo_w, ist_code)
//ist_code = Message.PowerObjectParm
//if ist_code.okcancel = 'N' then return

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

// 품목선택
gs_where2 lst_whitemret

lst_whitemret.chk = "M"	//M:multi S:single
OpenWithParm( w_whitemselectmulti_w, lst_whitemret )
lst_whitemret = Message.PowerObjectParm

if lst_whitemret.chk = "Y" then
	ll_trow	= upperbound(lst_whitemret.str1)
	for i = 1 to ll_trow
		ls_itemno[i] = lst_whitemret.str1[i]
	next
	ls_gubun	= 'Not%'
else
	ls_itemno[1]	= '%'
	ls_gubun 		= "%"	
end if

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

//
dw_1.setredraw(false)
dw_1.retrieve( ls_custno, ld_sdate, ld_edate, ls_salesman, ls_itemno, ls_price, ls_gubun )
dw_1.groupcalc()
dw_1.setredraw(true)

dw_2.retrieve( ls_custno, ld_sdate, ld_edate, ls_salesman, ls_itemno, ls_price, ls_request, ls_gubun )
dw_2.groupcalc()

if dw_1.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   RETURN
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiitemdo_r
integer x = 1157
integer y = 0
integer width = 891
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oiitemdo_r
integer y = 244
integer width = 4622
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiitemdo_r
integer x = 3584
integer y = 4
integer width = 814
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiitemdo_r
integer x = 64
integer y = 172
integer width = 119
integer height = 88
integer taborder = 0
string dataobject = "d_oiitemdo_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type pb_1 from picturebutton within w_oiitemdo_r
event mousemove pbm_mousemove
integer x = 3995
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
integer ls_Value,   li_Pos,   li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
		                        "엑셀 (*.XLS), *.XLS," + &
 		                        "CSV(쉽표로 분리), *.CSV," + &
		                        "Html(웹문서), *.HTML,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
				dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" OR ls_ExpandName = "html" OR ls_ExpandName = "HTML" then
				dw_1.SaveAs(ls_DocName, HTMLTable!	, TRUE)
			end if
	end if
end if	

end event

type cbx_cust from checkbox within w_oiitemdo_r
integer x = 2967
integer y = 80
integer width = 558
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
	if GF_Permission("물품별 출고현황(ALL)", gs_userid) = "Y" then
		cbx_price.enabled = true	// 단가 출력안함
	end if
else
	cbx_price.enabled = false
end if

end event

type cbx_price from checkbox within w_oiitemdo_r
integer x = 2967
integer y = 152
integer width = 558
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
boolean checked = true
end type

type st_3 from statictext within w_oiitemdo_r
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_oiitemdo_r
integer x = 270
integer y = 296
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oiitemdo_r
integer x = 302
integer y = 308
integer width = 311
integer height = 88
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

type st_4 from statictext within w_oiitemdo_r
integer x = 741
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

type sle_value from singlelineedit within w_oiitemdo_r
integer x = 1230
integer y = 304
integer width = 526
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oiitemdo_r
integer x = 1893
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiitemdo_r
integer x = 2057
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiitemdo_r
integer x = 2222
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiitemdo_r
integer x = 2386
integer y = 304
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_8 from statictext within w_oiitemdo_r
integer x = 1193
integer y = 128
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
integer x = 1422
integer y = 124
integer width = 613
integer height = 84
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type st_6 from statictext within w_oiitemdo_r
integer x = 1193
integer y = 44
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiitemdo_r
integer x = 1426
integer y = 44
integer width = 526
integer height = 84
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type st_7 from statictext within w_oiitemdo_r
integer x = 2112
integer y = 48
integer width = 745
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "출고일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oiitemdo_r
integer x = 2112
integer y = 136
integer width = 366
integer height = 72
integer taborder = 40
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

//id_start = date(this.text)
////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//end if

end event

type em_2 from editmask within w_oiitemdo_r
integer x = 2491
integer y = 136
integer width = 366
integer height = 72
integer taborder = 40
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
end type

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

//id_end = date(this.text)
//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//end if

end event

type cbx_hap from checkbox within w_oiitemdo_r
integer x = 2569
integer y = 280
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
integer x = 2569
integer y = 340
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

type dw_filter from datawindow within w_oiitemdo_r
integer x = 1838
integer y = 984
integer width = 1065
integer height = 668
integer taborder = 310
boolean bringtotop = true
boolean titlebar = true
string title = "확정은 우측마우스 클릭..."
string dataobject = "d_dw_filter"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event clicked;//
long  ll_row

if isnull(row) OR row < 1 then RETURN

if row = 1 then
	choose case dwo.name
		case "chk"
			this.setredraw( false )
			// (모두 선택)
			if this.object.chk[1] = "N" then
				for ll_row = 2 to this.rowcount()
					this.object.chk[ll_row] = "Y"	
				next
			else
				for ll_row = 2 to this.rowcount()
					this.object.chk[ll_row] = "N"	
				next
			end if
			this.setredraw( true )
	end choose
end if

end event

event rbuttondown;//
string ls_filter, ls_val, ls_itemno, ls_itemnm
long   ll_row, ll_tchk

debugbreak()

ll_tchk = this.object.tchk[1]

if ll_tchk > 0 then
	// (모두 선택)
	for ll_row = 2 to this.rowcount()
		if this.object.chk[ll_row] = "Y" then
			ls_itemno = this.object.item_no[ll_row] 
			ls_itemnm = this.object.item_name[ll_row] 
			
			ls_val    = ls_val + ls_itemno + ","
			ls_filter = ls_filter + "'" + ls_itemno + "',"
		end if
	next
	ls_filter = LeftA(ls_filter, LenA(ls_filter) - 1)
	
	dw_1.setredraw( false )
	dw_1.setfilter( "dodet_item_no IN (" + ls_filter + ")" )
	dw_1.filter()
	dw_1.setredraw( true )
	
	// 가져오기
	if cbx_import.checked = true then
		GF_ReplaceAll(ls_filter, "'", "")

		if LenA(ls_val) > 4096 then
			MessageBox("확인","필터링 대상이 4096 Byte 초과 합니다.")
			SetProfileString("YCERP.INI", "MPGAEGO", "FILTER",  ls_val)		
		else
			SetProfileString("YCERP.INI", "MPGAEGO", "FILTER",  ls_val)		
		end if
	end if
	
	this.visible = false
end if

end event

type cb_4 from commandbutton within w_oiitemdo_r
integer x = 1769
integer y = 304
integer width = 119
integer height = 76
integer taborder = 210
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
WF_DWFilter( dw_1, "dodet_item_no", "groupitem_item_name", sle_value.text )

end event

type cbx_import from checkbox within w_oiitemdo_r
integer x = 1797
integer y = 244
integer width = 439
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "필터 불러오기"
end type

type cb_6 from commandbutton within w_oiitemdo_r
integer x = 3461
integer y = 300
integer width = 347
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주조회"
end type

event clicked;//
string  ls_orderno, ls_dono, ls_itemno, ls_qa, ls_value
long    ll_row, ll_oino, ll_find

ll_row  = dw_1.getrow()

if ll_row < 1 then RETURN

ls_dono      = dw_1.object.do_do_no[ll_row]
ls_itemno    = dw_1.object.dodet_item_no[ll_row]
ls_qa        = dw_1.object.dodet_qa[ll_row]
ll_oino      = dw_1.object.dodet_oi_no[ll_row]

ls_orderno   = dw_1.object.dodet_sale_no[ll_row]
ls_itemno    = dw_1.object.dodet_item_no[ll_row]
ls_qa        = dw_1.object.dodet_qa[ll_row]

if isnull(ls_orderno) OR ls_orderno = "" then
else
	if IsValid(w_all_main) then 
		OpenSheet(w_orsale_m,  w_all_main, 5, original!)
	end if
	
	w_orsale_m.setredraw(false)
	w_orsale_m.em_3.text = LeftA(ls_orderno,10)	// 수주번호
	w_orsale_m.em_4.text = string(integer(RightA(ls_orderno,3)))
	w_orsale_m.pb_cancel.triggerevent(clicked!)
	w_orsale_m.setredraw(true)	
	
	ls_value = "item_no = '" + ls_itemno + "' AND qa = '" + ls_qa + "'"
	ll_find  = w_orsale_m.dw_3.find( ls_value, 1, w_orsale_m.dw_3.rowcount() )
	if ll_find > 0 then 
		w_orsale_m.dw_3.scrolltorow( ll_find )
	end if
end if

end event

type cb_7 from commandbutton within w_oiitemdo_r
integer x = 3104
integer y = 300
integer width = 347
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출고조회"
end type

event clicked;//
string  ls_orderno, ls_dono, ls_itemno, ls_qa, ls_value
long    ll_row, ll_oino, ll_find

ll_row = dw_1.getrow()
if ll_row < 1 then RETURN

ls_dono      = dw_1.object.do_do_no[ll_row]
ls_itemno    = dw_1.object.dodet_item_no[ll_row]
ls_qa        = dw_1.object.dodet_qa[ll_row]
ll_oino      = dw_1.object.dodet_oi_no[ll_row]

if isnull(ls_dono) OR ls_dono = "" then
else
	if IsValid(w_all_main) = true then
		OpenSheet(w_oidoupdate_m, w_all_main, 5, original!)
	end if
	
	ls_dono = LeftA(ls_dono,10) + RightA(ls_dono,3)
	w_oidoupdate_m.setredraw(false)
	w_oidoupdate_m.em_3.text = ls_dono		// 출고번호
	w_oidoupdate_m.cb_1.triggerevent(clicked!)
	w_oidoupdate_m.setredraw(true)
	
	w_oidoupdate_m.dw_2.scrolltorow( ll_oino )
end if

end event

type ddlb_op from dropdownlistbox within w_oiitemdo_r
integer x = 919
integer y = 296
integer width = 302
integer height = 500
integer taborder = 180
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

type gb_6 from groupbox within w_oiitemdo_r
integer x = 2921
integer y = 4
integer width = 645
integer height = 232
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "규격(송장)으로 변경"
end type

type gb_4 from groupbox within w_oiitemdo_r
integer x = 2075
integer y = 4
integer width = 827
integer height = 232
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

