$PBExportHeader$w_whissueheader_w.srw
$PBExportComments$출고의뢰수주현황(2003/09/24,이인호)
forward
global type w_whissueheader_w from window
end type
type st_horizontal from u_splitbar_horizontal within w_whissueheader_w
end type
type st_7 from statictext within w_whissueheader_w
end type
type dw_2 from datawindow within w_whissueheader_w
end type
type st_telno from statictext within w_whissueheader_w
end type
type st_rem from statictext within w_whissueheader_w
end type
type st_addr from statictext within w_whissueheader_w
end type
type st_11 from statictext within w_whissueheader_w
end type
type st_10 from statictext within w_whissueheader_w
end type
type st_scene from statictext within w_whissueheader_w
end type
type st_8 from statictext within w_whissueheader_w
end type
type st_text from statictext within w_whissueheader_w
end type
type st_cust from statictext within w_whissueheader_w
end type
type st_6 from statictext within w_whissueheader_w
end type
type cb_6 from commandbutton within w_whissueheader_w
end type
type cb_5 from commandbutton within w_whissueheader_w
end type
type cb_4 from commandbutton within w_whissueheader_w
end type
type cb_3 from commandbutton within w_whissueheader_w
end type
type cb_2 from commandbutton within w_whissueheader_w
end type
type sle_1 from singlelineedit within w_whissueheader_w
end type
type ddlb_4 from dropdownlistbox within w_whissueheader_w
end type
type st_5 from statictext within w_whissueheader_w
end type
type ddlb_fld from dropdownlistbox within w_whissueheader_w
end type
type st_4 from statictext within w_whissueheader_w
end type
type rb_1 from radiobutton within w_whissueheader_w
end type
type st_3 from statictext within w_whissueheader_w
end type
type em_1 from editmask within w_whissueheader_w
end type
type dw_3 from datawindow within w_whissueheader_w
end type
type pb_retrieve from picturebutton within w_whissueheader_w
end type
type em_2 from editmask within w_whissueheader_w
end type
type em_3 from editmask within w_whissueheader_w
end type
type cb_1 from commandbutton within w_whissueheader_w
end type
type dw_1 from datawindow within w_whissueheader_w
end type
type st_1 from statictext within w_whissueheader_w
end type
type gb_1 from groupbox within w_whissueheader_w
end type
type ddlb_dwtitles from dropdownlistbox within w_whissueheader_w
end type
type gb_2 from groupbox within w_whissueheader_w
end type
type gb_3 from groupbox within w_whissueheader_w
end type
end forward

global type w_whissueheader_w from window
integer x = 809
integer y = 180
integer width = 4686
integer height = 2520
boolean titlebar = true
string title = "출고대상 조회(w_whissueheader_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_horizontal st_horizontal
st_7 st_7
dw_2 dw_2
st_telno st_telno
st_rem st_rem
st_addr st_addr
st_11 st_11
st_10 st_10
st_scene st_scene
st_8 st_8
st_text st_text
st_cust st_cust
st_6 st_6
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
sle_1 sle_1
ddlb_4 ddlb_4
st_5 st_5
ddlb_fld ddlb_fld
st_4 st_4
rb_1 rb_1
st_3 st_3
em_1 em_1
dw_3 dw_3
pb_retrieve pb_retrieve
em_2 em_2
em_3 em_3
cb_1 cb_1
dw_1 dw_1
st_1 st_1
gb_1 gb_1
ddlb_dwtitles ddlb_dwtitles
gb_2 gb_2
gb_3 gb_3
end type
global w_whissueheader_w w_whissueheader_w

type variables
DataWindow dw1, dw2
gs_where   ist_where
datawindowchild idwc_cust

Boolean ib_first = false
string  is_chk
Integer ii_WindowBorder = 15

end variables

forward prototypes
public subroutine wf_addheader (long al_row)
end prototypes

public subroutine wf_addheader (long al_row);// WF_AddHeader( al_row )
string ls_itemname, ls_uom, ls_orderno, ls_null, ls_reqdate, ls_salesman
long   ll_cnt, ll_seq, ll_reqseq
datetime ldt_reqdate

if isnull(al_row) OR al_row < 1 then RETURN

dw_1.object.chk[al_row] = "Y"		// 선택표시(글꼴 빨강색)

ls_itemname = dw_2.object.item_item_name[1]
ls_uom      = dw_2.object.saledet_uom[1]

//
dw1.accepttext()

ll_cnt = dw1.insertrow(0)

dw1.object.issuereqdet_req_date[ll_cnt] = DateTime(Date(w_whissuereqdet_m.ist_where.str1), Time("00:00:00.000") ) // 의뢰일자
dw1.object.issuereqdet_salesman[ll_cnt] = gs_userid												// 의뢰자
dw1.object.issuereqdet_req_seq[ll_cnt]  = integer(w_whissuereqdet_m.ist_where.str3)		// 차수
dw1.object.issuereqdet_req_flag[ll_cnt] = w_whissuereqdet_m.ist_where.str4					// 의뢰형태

if ll_cnt > 1 then
	ll_seq = dw1.object.issuereqdet_seq[ll_cnt - 1] + 1
else
	ll_seq = 1
end if
dw1.object.issuereqdet_seq[ll_cnt] 				 = ll_seq											// 차수순번

dw1.object.issuereqdet_cust_no[ll_cnt] 		 = dw_1.object.sale_cust_no[al_row]
dw1.object.customer_cust_name[ll_cnt] 			 = dw_1.object.customer_cust_name[al_row]
dw1.object.issuereqdet_scene_code[ll_cnt] 	 = dw_1.object.sale_scene_code[al_row]
dw1.object.scene_scene_desc[ll_cnt] 			 = dw_1.object.scene_desc[al_row]
dw1.object.issuereqdet_add_scene[ll_cnt] 		 = ls_null
ls_orderno = dw_1.object.sale_order_no[al_row]
dw1.object.issuereqdet_sale_no[ll_cnt] 		 =  ls_orderno
/*2019-11-28 jowonsuk*/
//dw1.object.issuereqdet_item_name[ll_cnt] 		 = trim(ls_itemname) + " 外"
  SELECT top 1 groupitem.item_name   
     into :ls_itemname
    FROM saledet 
         LEFT OUTER JOIN groupitem ON saledet.item_no = groupitem.item_no  
   WHERE ( saledet.order_no  = :ls_orderno      ) 
      AND ( saledet.order_qty > saledet.rlse_qty );


dw1.object.issuereqdet_item_name[ll_cnt] 		 = trim(ls_itemname) + " 外"
dw1.object.issuereqdet_uom[ll_cnt] 				 = ls_uom
dw1.object.issuereqdet_issue_flag[ll_cnt] 	 = ls_null
dw1.object.issuereqdet_issue_schedule[ll_cnt] = ls_null
dw1.object.issuereqdet_ship_flag[ll_cnt] 		 = dw_1.object.ship_flag2[al_row]
dw1.object.issuereqdet_ship_case[ll_cnt] 		 = dw_1.object.sale_ship_case[al_row]
dw1.object.issuereqdet_tel[ll_cnt] 				 = dw_1.object.sale_tel_no[al_row]
dw1.object.issuereqdet_rem[ll_cnt] 				 = dw_1.object.sale_rem[al_row]
dw1.object.issuereqdet_sys_date[ll_cnt]       = gf_today()		// 등록시간 

if dw1.getrow() = 1 OR dw1.getrow() = ll_cnt then	
	
	dw2.retrieve( ls_orderno )

end if

dw1.scrolltorow(ll_cnt)
RETURN

end subroutine

on w_whissueheader_w.create
this.st_horizontal=create st_horizontal
this.st_7=create st_7
this.dw_2=create dw_2
this.st_telno=create st_telno
this.st_rem=create st_rem
this.st_addr=create st_addr
this.st_11=create st_11
this.st_10=create st_10
this.st_scene=create st_scene
this.st_8=create st_8
this.st_text=create st_text
this.st_cust=create st_cust
this.st_6=create st_6
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_1=create sle_1
this.ddlb_4=create ddlb_4
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.st_4=create st_4
this.rb_1=create rb_1
this.st_3=create st_3
this.em_1=create em_1
this.dw_3=create dw_3
this.pb_retrieve=create pb_retrieve
this.em_2=create em_2
this.em_3=create em_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_1=create st_1
this.gb_1=create gb_1
this.ddlb_dwtitles=create ddlb_dwtitles
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.st_horizontal,&
this.st_7,&
this.dw_2,&
this.st_telno,&
this.st_rem,&
this.st_addr,&
this.st_11,&
this.st_10,&
this.st_scene,&
this.st_8,&
this.st_text,&
this.st_cust,&
this.st_6,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.sle_1,&
this.ddlb_4,&
this.st_5,&
this.ddlb_fld,&
this.st_4,&
this.rb_1,&
this.st_3,&
this.em_1,&
this.dw_3,&
this.pb_retrieve,&
this.em_2,&
this.em_3,&
this.cb_1,&
this.dw_1,&
this.st_1,&
this.gb_1,&
this.ddlb_dwtitles,&
this.gb_2,&
this.gb_3}
end on

on w_whissueheader_w.destroy
destroy(this.st_horizontal)
destroy(this.st_7)
destroy(this.dw_2)
destroy(this.st_telno)
destroy(this.st_rem)
destroy(this.st_addr)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_scene)
destroy(this.st_8)
destroy(this.st_text)
destroy(this.st_cust)
destroy(this.st_6)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_1)
destroy(this.ddlb_4)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.st_4)
destroy(this.rb_1)
destroy(this.st_3)
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.pb_retrieve)
destroy(this.em_2)
destroy(this.em_3)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.ddlb_dwtitles)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

st_cust.text  = "" ; st_scene.text = "" ; st_addr.text = "" ; st_rem.text = "" ; st_telno.text = ""

ist_where = Message.PowerObjectParm

////////////////////////////////////////////////
// Open Event Scripts
////////////////////////////////////////////////
dw1 = w_whissuereqdet_m.dw_1
dw2 = w_whissuereqdet_m.dw_2
////////////////////////////////////////////////

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.getchild("cust_no", idwc_cust)
GS_DS_WHCustRET.ShareData(idwc_cust)

// 선택, 비고 
dw_2.object.sel.protect   = 1
dw_2.object.saledet_rem.protect = 1

// 사업장별 수주번호 기본값
if LeftA(gs_area, 1) = "S" then
	em_1.text = "HD" + string(today(), "yyyymmdd")	// 수주번호
else
	em_1.text = LeftA(gs_area, 1) + "D" + string(today(), "yyyymmdd")	// 수주번호
end if
em_2.text = string(RelativeDate(today(), -7), "yyyy/mm/dd")			// 시작일
em_3.text = string(today(), "yyyy/mm/dd")									// 종료일

// 수주일자
rb_1.checked = true		
is_chk = "H"

em_1.SelectText(9, 2)
em_1.setfocus()


end event

event close;//
string ls_order
long   ll_row

ll_row = dw1.getrow()
dw2.reset()

if ll_row < 1 then 
else
	ls_order = dw1.object.issuereqdet_sale_no[ll_row]	
	dw2.retrieve(ls_order)
end if

dw1.enabled = true
w_whissuereqdet_m.dw_1.enabled = true
if w_whissuereqdet_m.ist_where.chk = 'Y' then
	w_whissuereqdet_m.pb_insert.enabled = true
	w_whissuereqdet_m.pb_delete.enabled = true
end if

if w_whissuereqdet_m.ist_where.str4 = 'A' and w_whissuereqdet_m.ist_where.chk = 'Y' then
	w_whissuereqdet_m.cb_1.enabled = true
end if

end event

event resize;//
st_horizontal.y      = dw_1.y + dw_1.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.height = newheight - dw_2.y - gb_3.x

end event

type st_horizontal from u_splitbar_horizontal within w_whissueheader_w
integer x = 32
integer y = 1296
integer width = 4581
end type

type st_7 from statictext within w_whissueheader_w
integer x = 1637
integer y = 60
integer width = 402
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_whissueheader_w
integer x = 32
integer y = 1328
integer width = 4581
integer height = 1100
integer taborder = 100
string title = "none"
string dataobject = "d_whissuereqdet_m3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_4, sle_1, row, dwo.name, ddlb_dwtitles)

end event

type st_telno from statictext within w_whissueheader_w
integer x = 3790
integer y = 436
integer width = 608
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

type st_rem from statictext within w_whissueheader_w
integer x = 2030
integer y = 568
integer width = 1737
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

type st_addr from statictext within w_whissueheader_w
integer x = 2030
integer y = 436
integer width = 1737
integer height = 124
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

type st_11 from statictext within w_whissueheader_w
integer x = 1888
integer y = 580
integer width = 133
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "비고"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_10 from statictext within w_whissueheader_w
integer x = 1655
integer y = 448
integer width = 366
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "운송처 주소"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_scene from statictext within w_whissueheader_w
integer x = 379
integer y = 568
integer width = 1504
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

type st_8 from statictext within w_whissueheader_w
integer x = 73
integer y = 580
integer width = 297
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "현장명"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_text from statictext within w_whissueheader_w
integer width = 992
integer height = 128
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421376
string text = "출고대상 조회"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_cust from statictext within w_whissueheader_w
integer x = 379
integer y = 436
integer width = 1065
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

type st_6 from statictext within w_whissueheader_w
integer x = 73
integer y = 448
integer width = 297
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처명"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_whissueheader_w
integer x = 3616
integer y = 60
integer width = 453
integer height = 140
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택후 닫기"
end type

event clicked;////////////////////////////////////////////////
// Open Event Scripts
////////////////////////////////////////////////
// dw1 = w_whissuereqdet_m.dw_1
// dw2 = w_whissuereqdet_m.dw_2
////////////////////////////////////////////////
// w_issuereqdet_m 에 수주번호 추가하기
////////////////////////////////////////////////
string ls_exist, ls_orderno
long   ll_row, ll_dw1row

//ls_exist = "N"		// 수주번호 중복체크

//ll_row   = dw_1.getrow()
//
//if isnull(ll_row) OR ll_row < 1 then RETURN

dw_2.accepttext()
if dw_2.rowcount() < 1 then RETURN

dw_1.accepttext()

for ll_row = 1 to dw_1.rowcount()
	if dw_1.isselected(ll_row)  then
		ls_exist = "N"		// 수주번호 중복체크	
		ls_orderno = dw_1.object.sale_order_no[ll_row]		// 추가할 수주번호
		// 출고상세에서 수주번호 중복검사
		for ll_dw1row = 1 to dw1.rowcount()
			if ls_orderno = dw1.object.issuereqdet_sale_no[ll_dw1row] then
				st_1.text    = "이 수주번호 이미 추가됨"
				st_1.visible = true
				ls_exist     = "Y"
				EXIT
			end if
		next
		
		if	ls_exist = "Y" then
		else
			WF_AddHeader( ll_row )
		end if	
	end if		
next	

CloseWithReturn(Parent, ist_where)

end event

type cb_5 from commandbutton within w_whissueheader_w
integer x = 2322
integer y = 296
integer width = 160
integer height = 76
integer taborder = 170
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

type cb_4 from commandbutton within w_whissueheader_w
integer x = 2158
integer y = 296
integer width = 160
integer height = 76
integer taborder = 160
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

type cb_3 from commandbutton within w_whissueheader_w
integer x = 1993
integer y = 296
integer width = 160
integer height = 76
integer taborder = 150
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

ddlb_4.text = ""
ddlb_fld.text = ""
sle_1.text  = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_2 from commandbutton within w_whissueheader_w
integer x = 1829
integer y = 296
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_4, sle_1, ddlb_dwtitles)

end event

type sle_1 from singlelineedit within w_whissueheader_w
integer x = 1257
integer y = 296
integer width = 567
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_4 from dropdownlistbox within w_whissueheader_w
integer x = 951
integer y = 288
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_5 from statictext within w_whissueheader_w
integer x = 782
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_whissueheader_w
integer x = 270
integer y = 288
integer width = 480
integer height = 632
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
end type

type st_4 from statictext within w_whissueheader_w
integer x = 82
integer y = 304
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

type rb_1 from radiobutton within w_whissueheader_w
integer x = 2505
integer y = 64
integer width = 389
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "수주일자"
end type

event clicked;rb_1.checked = True
is_chk = "H"
pb_retrieve.triggerevent(clicked!)
end event

type st_3 from statictext within w_whissueheader_w
integer x = 1111
integer y = 60
integer width = 261
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "수주번호"
boolean focusrectangle = false
end type

type em_1 from editmask within w_whissueheader_w
integer x = 1111
integer y = 120
integer width = 480
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
boolean autoskip = true
end type

event getfocus;//
em_1.SelectText(9, 6)
end event

event modified;//
string ls_date

debugbreak()

if LenA(this.text) > 13 then
	if ib_first = false then
		ib_first = true
	else
		ls_date   = MidA(this.text,3,8)
		ls_date   = LeftA(ls_date, 4)+"/"+MidA(ls_date,5,2)+"/"+RightA(ls_date,2)
		em_2.text = ls_date
	end if

	pb_retrieve.setfocus()
else
	this.setfocus()
end if

end event

type dw_3 from datawindow within w_whissueheader_w
integer x = 1623
integer y = 116
integer width = 864
integer height = 88
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_orcustomer_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 거래처
em_1.text = LeftA(gs_area, 1) + "D" + string(today(), "yyyymmdd")
pb_retrieve.setfocus()

end event

type pb_retrieve from picturebutton within w_whissueheader_w
integer x = 3424
integer y = 60
integer width = 187
integer height = 140
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean default = true
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;//
string ls_sel,   ls_ret,   ls_orderno, ls_custno
string ls_sdate, ls_edate
long   ll_row
date   ld_sdate, ld_edate

// 거래처
dw_3.accepttext()
ls_custno = dw_3.object.cust_no[1]

// 수주번호
ls_orderno = trim(em_1.text)

if LenA(ls_orderno) = 14 OR ls_custno <> "" then
	//
else
	MessageBox("확인","수주번호나 거래처를 입력하시기 바랍니다.")
	RETURN
end if

if isnull(ls_custno) OR trim(ls_custno) = "" then
	ls_sel = 'S'
	ls_ret = em_1.text
else
	ls_sel = 'C'
	ls_ret = ls_custno
end if

ls_sdate = em_2.text
ls_edate = em_3.text

dw_1.reset()
dw_1.retrieve( ls_sel, ls_ret, ls_sdate, ls_edate, is_chk )
if dw_1.rowcount() < 1 then 
	em_1.setfocus()
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
else
	dw_1.setfocus()
end if

end event

type em_2 from editmask within w_whissueheader_w
integer x = 2514
integer y = 120
integer width = 384
integer height = 80
integer taborder = 30
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
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(message.stringparm))
end if

pb_retrieve.triggerevent(clicked!)
end event

type em_3 from editmask within w_whissueheader_w
integer x = 2907
integer y = 120
integer width = 384
integer height = 80
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
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
pb_retrieve.triggerevent(clicked!)
end event

type cb_1 from commandbutton within w_whissueheader_w
integer x = 4078
integer y = 60
integer width = 187
integer height = 140
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;//
CloseWithReturn(parent, ist_where)

end event

type dw_1 from datawindow within w_whissueheader_w
integer x = 32
integer y = 684
integer width = 4581
integer height = 600
integer taborder = 90
string dataobject = "d_whsaleheader_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;////////////////////////////////////////////////
// Open Event Scripts
////////////////////////////////////////////////
// dw1 = w_whissuereqdet_m.dw_1
// dw2 = w_whissuereqdet_m.dw_2
////////////////////////////////////////////////
// w_issuereqdet_m 에 수주번호 추가하기
////////////////////////////////////////////////
string ls_exist, ls_orderno
long   ll_row

if isnull(row) OR row < 1 then RETURN

dw_2.accepttext()
if dw_2.rowcount() < 1 then RETURN

dw_1.accepttext()

ls_orderno = dw_1.object.sale_order_no[row]		// 추가할 수주번호
if isnull(ls_orderno) OR ls_orderno = "" then
	//	
else
	// 출고상세에서 수주번호 중복검사
	ls_exist = "N"		// 수주번호 중복체크
	for ll_row = 1 to dw1.rowcount()
		if ls_orderno = dw1.object.issuereqdet_sale_no[ll_row] then
			st_1.text    = "이 수주번호 이미 추가됨"
			st_1.visible = true
			ls_exist     = "Y"
			exit
		end if
	next
	if	ls_exist = "Y" then RETURN
	
	WF_AddHeader( row )
end if

end event

event rowfocuschanged;//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

string ls_orderno, ls_reqdate, ls_salesman
long   ll_row, ll_reqseq, ll_seq
datetime ldt_reqdate

ll_row = this.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_orderno = this.object.sale_order_no[ll_row]

dw_2.retrieve( ls_orderno )

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN
//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_4, sle_1, row, dwo.name, ddlb_dwtitles)

this.ScrollToRow( row )
this.SelectRow( row, NOT this.IsSelected(row) )

st_cust.text  = this.object.customer_cust_name[row]
st_scene.text = this.object.scene_desc[row]
st_addr.text  = this.object.sale_shipto_addr[row]
st_rem.text   = this.object.sale_rem[row]
st_telno.text = this.object.sale_tel_no[row]


end event

type st_1 from statictext within w_whissueheader_w
integer x = 2523
integer y = 300
integer width = 1042
integer height = 68
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "수주내역(추가=> 더블클릭)"
boolean focusrectangle = false
end type

event losefocus;//st_1.visible = false

end event

type gb_1 from groupbox within w_whissueheader_w
integer x = 1074
integer y = 16
integer width = 3218
integer height = 204
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type ddlb_dwtitles from dropdownlistbox within w_whissueheader_w
integer x = 288
integer y = 300
integer width = 366
integer height = 88
integer taborder = 190
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

type gb_2 from groupbox within w_whissueheader_w
integer x = 32
integer y = 240
integer width = 4581
integer height = 156
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_3 from groupbox within w_whissueheader_w
integer x = 32
integer y = 400
integer width = 4581
integer height = 264
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

