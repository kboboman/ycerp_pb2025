$PBExportHeader$w_whsaleheader_w.srw
$PBExportComments$출고의뢰수주현황(2003/09/24,이인호)
forward
global type w_whsaleheader_w from window
end type
type st_line from statictext within w_whsaleheader_w
end type
type st_telno from statictext within w_whsaleheader_w
end type
type st_rem from statictext within w_whsaleheader_w
end type
type st_addr from statictext within w_whsaleheader_w
end type
type st_11 from statictext within w_whsaleheader_w
end type
type st_10 from statictext within w_whsaleheader_w
end type
type st_scene from statictext within w_whsaleheader_w
end type
type st_8 from statictext within w_whsaleheader_w
end type
type st_text from statictext within w_whsaleheader_w
end type
type st_cust from statictext within w_whsaleheader_w
end type
type st_6 from statictext within w_whsaleheader_w
end type
type cb_6 from commandbutton within w_whsaleheader_w
end type
type ddlb_dwtitles from dropdownlistbox within w_whsaleheader_w
end type
type cb_5 from commandbutton within w_whsaleheader_w
end type
type cb_4 from commandbutton within w_whsaleheader_w
end type
type cb_3 from commandbutton within w_whsaleheader_w
end type
type cb_2 from commandbutton within w_whsaleheader_w
end type
type sle_1 from singlelineedit within w_whsaleheader_w
end type
type ddlb_4 from dropdownlistbox within w_whsaleheader_w
end type
type st_5 from statictext within w_whsaleheader_w
end type
type ddlb_3 from dropdownlistbox within w_whsaleheader_w
end type
type st_4 from statictext within w_whsaleheader_w
end type
type cbx_1 from checkbox within w_whsaleheader_w
end type
type rb_2 from radiobutton within w_whsaleheader_w
end type
type rb_1 from radiobutton within w_whsaleheader_w
end type
type st_3 from statictext within w_whsaleheader_w
end type
type em_1 from editmask within w_whsaleheader_w
end type
type dw_3 from datawindow within w_whsaleheader_w
end type
type pb_retrieve from picturebutton within w_whsaleheader_w
end type
type em_2 from editmask within w_whsaleheader_w
end type
type st_2 from statictext within w_whsaleheader_w
end type
type em_3 from editmask within w_whsaleheader_w
end type
type cb_1 from commandbutton within w_whsaleheader_w
end type
type dw_1 from datawindow within w_whsaleheader_w
end type
type st_1 from statictext within w_whsaleheader_w
end type
type gb_1 from groupbox within w_whsaleheader_w
end type
type gb_2 from groupbox within w_whsaleheader_w
end type
end forward

global type w_whsaleheader_w from window
integer x = 809
integer y = 180
integer width = 4361
integer height = 2204
boolean titlebar = true
string title = "출고대상 조회(w_whsaleheader_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_line st_line
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
ddlb_dwtitles ddlb_dwtitles
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
sle_1 sle_1
ddlb_4 ddlb_4
st_5 st_5
ddlb_3 ddlb_3
st_4 st_4
cbx_1 cbx_1
rb_2 rb_2
rb_1 rb_1
st_3 st_3
em_1 em_1
dw_3 dw_3
pb_retrieve pb_retrieve
em_2 em_2
st_2 st_2
em_3 em_3
cb_1 cb_1
dw_1 dw_1
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_whsaleheader_w w_whsaleheader_w

type variables
Integer	 ii_WindowBorder = 15
datawindow dw1, dw2
gs_where ist_where
datawindowchild idwc_cust
string is_chk
end variables

on w_whsaleheader_w.create
this.st_line=create st_line
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
this.ddlb_dwtitles=create ddlb_dwtitles
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_1=create sle_1
this.ddlb_4=create ddlb_4
this.st_5=create st_5
this.ddlb_3=create ddlb_3
this.st_4=create st_4
this.cbx_1=create cbx_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_3=create st_3
this.em_1=create em_1
this.dw_3=create dw_3
this.pb_retrieve=create pb_retrieve
this.em_2=create em_2
this.st_2=create st_2
this.em_3=create em_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_line,&
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
this.ddlb_dwtitles,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.sle_1,&
this.ddlb_4,&
this.st_5,&
this.ddlb_3,&
this.st_4,&
this.cbx_1,&
this.rb_2,&
this.rb_1,&
this.st_3,&
this.em_1,&
this.dw_3,&
this.pb_retrieve,&
this.em_2,&
this.st_2,&
this.em_3,&
this.cb_1,&
this.dw_1,&
this.st_1,&
this.gb_1,&
this.gb_2}
end on

on w_whsaleheader_w.destroy
destroy(this.st_line)
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
destroy(this.ddlb_dwtitles)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_1)
destroy(this.ddlb_4)
destroy(this.st_5)
destroy(this.ddlb_3)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_3)
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.pb_retrieve)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.em_3)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//
st_cust.text  = "" ; st_scene.text = "" ; st_addr.text = "" ; st_rem.text = "" ; st_telno.text = ""

ist_where = message.powerobjectparm

dw1 = w_whissuereqdet_m.dw_1
dw2 = w_whissuereqdet_m.dw_2
dw_1.settransobject(sqlca)

dw_3.insertrow(0)  //춘 19
dw_3.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)
dw_3.settransobject(sqlca)

em_2.text = string(RelativeDate (today(), -7), "yyyy/mm/dd")
em_3.text = string(today(), "yyyy/mm/dd")
em_1.text = LeftA(gs_area, 1) + "D" + string(today(), "yyyymmdd")
em_1.SelectText(9, 2)
em_1.setfocus()

If gs_area <> "B0001" Then
	rb_1.checked = True
	is_chk = "H"
Else 
	rb_2.checked = True
	is_chk = "B"
End if

dw_1.retrieve(ist_where.str1, ist_where.str2, date(ist_where.str3), date(ist_where.str4), is_chk)

//
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_3, ddlb_dwtitles )

end event

event close;string ls_order
long   ll_row

ll_row = dw1.getrow()
dw2.reset()
if ll_row < 1 then 
else
//	dw1.selectrow(0, false)
//	dw1.selectrow(ll_row, true)	
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

type st_line from statictext within w_whsaleheader_w
integer x = 59
integer y = 384
integer width = 4183
integer height = 8
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421504
alignment alignment = center!
boolean focusrectangle = false
end type

type st_telno from statictext within w_whsaleheader_w
integer x = 3584
integer y = 400
integer width = 608
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
boolean border = true
boolean focusrectangle = false
end type

type st_rem from statictext within w_whsaleheader_w
integer x = 2030
integer y = 488
integer width = 1737
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
boolean border = true
boolean focusrectangle = false
end type

type st_addr from statictext within w_whsaleheader_w
integer x = 2030
integer y = 400
integer width = 1545
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
boolean border = true
boolean focusrectangle = false
end type

type st_11 from statictext within w_whsaleheader_w
integer x = 1888
integer y = 500
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

type st_10 from statictext within w_whsaleheader_w
integer x = 1655
integer y = 412
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

type st_scene from statictext within w_whsaleheader_w
integer x = 379
integer y = 488
integer width = 1504
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
boolean border = true
boolean focusrectangle = false
end type

type st_8 from statictext within w_whsaleheader_w
integer x = 73
integer y = 500
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

type st_text from statictext within w_whsaleheader_w
integer x = 55
integer y = 76
integer width = 699
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 65535
long backcolor = 8388608
string text = "출고대상 조회"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_cust from statictext within w_whsaleheader_w
integer x = 379
integer y = 400
integer width = 1065
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
boolean border = true
boolean focusrectangle = false
end type

type st_6 from statictext within w_whsaleheader_w
integer x = 73
integer y = 412
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

type cb_6 from commandbutton within w_whsaleheader_w
integer x = 3717
integer y = 68
integer width = 320
integer height = 140
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장확인"
end type

event clicked;//
long   ll_row, ll_cnt
string ls_null, ls_exist, ls_itemname, ls_uom, ls_order

ll_row = dw_1.getrow()
ls_exist = 'N'
if ll_row < 1 then return

dw2.accepttext()
if dw2.rowcount() < 1 then return

dw1.accepttext()
setnull(ls_null)

ls_order = dw_1.object.sale_order_no[ll_row]
for ll_cnt = 1 to dw1.rowcount()
	if ls_order = dw1.object.issuereqdet_sale_no[ll_cnt] then
		st_1.text    = "이 수주번호는 이미 추가되어 있습니다."
		st_1.visible = true
		ls_exist     = 'Y'
		exit
	end if
next

if ls_exist = 'N' then
	ls_itemname = dw2.object.item_item_name[1]
	ls_uom      = dw2.object.saledet_uom[1]
	ll_cnt      = dw1.insertrow(0)

	dw1.accepttext()
	dw1.object.issuereqdet_salesman[ll_cnt] = gs_userid
	dw1.object.issuereqdet_req_date[ll_cnt] = date(w_whissuereqdet_m.ist_where.str1)
	dw1.object.issuereqdet_req_seq[ll_cnt]  = integer(w_whissuereqdet_m.ist_where.str3)
	dw1.object.issuereqdet_req_flag[ll_cnt] = w_whissuereqdet_m.ist_where.str4
	
	if ll_cnt > 1 then
		dw1.object.issuereqdet_seq[ll_cnt] 	 = dw1.object.issuereqdet_seq[ll_cnt - 1] + 1
	else
		dw1.object.issuereqdet_seq[ll_cnt] 	 = 1
	end if
	dw1.object.issuereqdet_cust_no[ll_cnt] 		= dw_1.object.sale_cust_no[ll_row]
	dw1.object.customer_cust_name[ll_cnt] 			= dw_1.object.customer_cust_name[ll_row]
	dw1.object.issuereqdet_scene_code[ll_cnt] 	= dw_1.object.sale_scene_code[ll_row]
	dw1.object.scene_scene_desc[ll_cnt] 			= dw_1.object.scene_desc[ll_row]
	dw1.object.issuereqdet_add_scene[ll_cnt] 		= ls_null
	dw1.object.issuereqdet_sale_no[ll_cnt] 		= dw_1.object.sale_order_no[ll_row]
	dw1.object.issuereqdet_item_name[ll_cnt] 		= trim(ls_itemname) + " 外"
	dw1.object.issuereqdet_uom[ll_cnt] 				= ls_uom
	dw1.object.issuereqdet_issue_flag[ll_cnt] 	= ls_null
	dw1.object.issuereqdet_issue_schedule[ll_cnt]= ls_null
	dw1.object.issuereqdet_ship_flag[ll_cnt] 		= dw_1.object.ship_flag2[ll_row]
//	dw1.object.issuereqdet_ship_flag[ll_cnt] 		= dw_1.object.sale_ship_flag[ll_row]
	dw1.object.issuereqdet_ship_case[ll_cnt] 		= dw_1.object.sale_ship_case[ll_row]
	dw1.object.issuereqdet_tel[ll_cnt] 				= dw_1.object.sale_tel_no[ll_row]
	dw1.object.issuereqdet_rem[ll_cnt] 				= dw_1.object.sale_rem[ll_row]
end if

if dw1.getrow() = 1 or dw1.getrow() = ll_cnt then
	dw2.retrieve(ls_order)
end if

dw1.scrolltorow(ll_cnt)
closewithreturn(parent, ist_where)

end event

type ddlb_dwtitles from dropdownlistbox within w_whsaleheader_w
integer x = 256
integer y = 300
integer width = 480
integer height = 88
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

type cb_5 from commandbutton within w_whsaleheader_w
integer x = 2290
integer y = 296
integer width = 160
integer height = 76
integer taborder = 80
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
GF_DW2Sort( arg_dw, ddlb_3, "D", ddlb_dwtitles )

end event

type cb_4 from commandbutton within w_whsaleheader_w
integer x = 2126
integer y = 296
integer width = 160
integer height = 76
integer taborder = 70
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
GF_DW2Sort( arg_dw, ddlb_3, "A", ddlb_dwtitles )

end event

type cb_3 from commandbutton within w_whsaleheader_w
integer x = 1961
integer y = 296
integer width = 160
integer height = 76
integer taborder = 60
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
ddlb_3.text = ""
sle_1.text  = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_2 from commandbutton within w_whsaleheader_w
integer x = 1797
integer y = 296
integer width = 160
integer height = 76
integer taborder = 50
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
GF_DW2Filter(arg_dw, ddlb_3, ddlb_4, sle_1, ddlb_dwtitles)

end event

type sle_1 from singlelineedit within w_whsaleheader_w
integer x = 1225
integer y = 296
integer width = 567
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
end type

type ddlb_4 from dropdownlistbox within w_whsaleheader_w
integer x = 919
integer y = 288
integer width = 297
integer height = 512
integer taborder = 30
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

type st_5 from statictext within w_whsaleheader_w
integer x = 750
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

type ddlb_3 from dropdownlistbox within w_whsaleheader_w
integer x = 238
integer y = 288
integer width = 480
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

type st_4 from statictext within w_whsaleheader_w
integer x = 50
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

type cbx_1 from checkbox within w_whsaleheader_w
integer x = 1755
integer y = 68
integer width = 347
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체거래처"
boolean righttoleft = true
end type

type rb_2 from radiobutton within w_whsaleheader_w
integer x = 2651
integer y = 148
integer width = 343
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "납기일자"
end type

event clicked;rb_2.checked = True
is_chk = "B"
pb_retrieve.triggerevent(clicked!)
end event

type rb_1 from radiobutton within w_whsaleheader_w
integer x = 2651
integer y = 84
integer width = 343
integer height = 52
integer textsize = -9
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

type st_3 from statictext within w_whsaleheader_w
integer x = 1239
integer y = 68
integer width = 261
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "수주번호:"
boolean focusrectangle = false
end type

type em_1 from editmask within w_whsaleheader_w
integer x = 1239
integer y = 128
integer width = 480
integer height = 80
integer taborder = 20
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

event modified;string ls_null

setnull(ls_null)
dw_3.object.cust_no[1] = ls_null

pb_retrieve.setfocus()
end event

type dw_3 from datawindow within w_whsaleheader_w
integer x = 1751
integer y = 124
integer width = 864
integer height = 88
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_orcustomer_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;em_1.text = LeftA(gs_area, 1) + "D" + string(today(), "yyyymmdd")

pb_retrieve.setfocus()

end event

type pb_retrieve from picturebutton within w_whsaleheader_w
integer x = 3520
integer y = 68
integer width = 187
integer height = 140
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;//
string ls_ret,   ls_cust, ls_sel
long   ll_row
date   ld_start, ld_end

ls_cust = dw_3.object.cust_no[1]
if cbx_1.checked = true then
	ls_sel = 'A'
	ls_ret = ''
else
	if isnull(ls_cust) or trim(ls_cust) = '' then
		ls_sel = 'S'
		ls_ret = em_1.text
	else
		ls_sel = 'C'
		ls_ret = ls_cust
	end if
end if

ld_start = date(em_2.text)
ld_end   = date(em_3.text)

dw_1.reset()
dw_1.setfocus()
ll_row = dw_1.retrieve(ls_sel, ls_ret, ld_start, ld_end, is_chk)
if ll_row < 1 then 
	em_1.setfocus()
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type em_2 from editmask within w_whsaleheader_w
integer x = 3003
integer y = 68
integer width = 352
integer height = 68
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
pb_retrieve.postevent(clicked!)
end event

type st_2 from statictext within w_whsaleheader_w
integer x = 3355
integer y = 56
integer width = 50
integer height = 80
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "~~"
boolean focusrectangle = false
end type

type em_3 from editmask within w_whsaleheader_w
integer x = 3150
integer y = 144
integer width = 352
integer height = 68
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
pb_retrieve.postevent(clicked!)
end event

type cb_1 from commandbutton within w_whsaleheader_w
integer x = 4046
integer y = 68
integer width = 187
integer height = 140
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;//
closewithreturn(parent, ist_where)

end event

type dw_1 from datawindow within w_whsaleheader_w
integer x = 59
integer y = 592
integer width = 4183
integer height = 1444
integer taborder = 20
string dataobject = "d_whsaleheader_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
long   ll_cnt
string ls_null, ls_exist, ls_itemname, ls_uom, ls_order

ls_exist = 'N'
if row < 1 then return

dw2.accepttext()
if dw2.rowcount() < 1 then return

dw1.accepttext()
setnull(ls_null)

ls_order = dw_1.object.sale_order_no[row]
for ll_cnt = 1 to dw1.ROWCOUNT()
	if ls_order = dw1.object.issuereqdet_sale_no[ll_cnt] then
		st_1.text    = "이 수주번호는 이미 추가되어 있습니다."
		st_1.visible = true
		ls_exist     = 'Y'
		exit
	end if
next

if ls_exist = 'N' then
	ls_itemname = dw2.object.item_item_name[1]
	ls_uom      = dw2.object.saledet_uom[1]
	ll_cnt      = dw1.insertrow(0)

	dw1.accepttext()
	dw1.object.issuereqdet_salesman[ll_cnt] = gs_userid
	dw1.object.issuereqdet_req_date[ll_cnt] = date(w_whissuereqdet_m.ist_where.str1)
	dw1.object.issuereqdet_req_seq[ll_cnt]  = integer(w_whissuereqdet_m.ist_where.str3)
	dw1.object.issuereqdet_req_flag[ll_cnt] = w_whissuereqdet_m.ist_where.str4
	
	if ll_cnt > 1 then
		dw1.object.issuereqdet_seq[ll_cnt] 			= dw1.object.issuereqdet_seq[ll_cnt - 1] + 1
	else
		dw1.object.issuereqdet_seq[ll_cnt] 			= 1
	end if
	dw1.object.issuereqdet_cust_no[ll_cnt] 		= dw_1.object.sale_cust_no[row]
	dw1.object.customer_cust_name[ll_cnt] 			= dw_1.object.customer_cust_name[row]
	dw1.object.issuereqdet_scene_code[ll_cnt] 	= dw_1.object.sale_scene_code[row]
	dw1.object.scene_scene_desc[ll_cnt] 			= dw_1.object.scene_desc[row]
	dw1.object.issuereqdet_add_scene[ll_cnt] 		= ls_null
	dw1.object.issuereqdet_sale_no[ll_cnt] 		= dw_1.object.sale_order_no[row]
	dw1.object.issuereqdet_item_name[ll_cnt] 		= trim(ls_itemname) + " 外"
	dw1.object.issuereqdet_uom[ll_cnt] 				= ls_uom
	dw1.object.issuereqdet_issue_flag[ll_cnt] 	= ls_null
	dw1.object.issuereqdet_issue_schedule[ll_cnt]= ls_null
	dw1.object.issuereqdet_ship_flag[ll_cnt] 		= dw_1.object.ship_flag2[row]
//	dw1.object.issuereqdet_ship_flag[ll_cnt] 		= dw_1.object.sale_ship_flag[row]
	dw1.object.issuereqdet_ship_case[ll_cnt] 		= dw_1.object.sale_ship_case[row]
	dw1.object.issuereqdet_tel[ll_cnt] 				= dw_1.object.sale_tel_no[row]
	dw1.object.issuereqdet_rem[ll_cnt] 				= dw_1.object.sale_rem[row]
end if

if dw1.getrow() = 1 or dw1.getrow() = ll_cnt then
	dw2.retrieve(ls_order)
end if

dw1.scrolltorow(ll_cnt)
return

//         sale_cust_no,   
//         sale_scene_code,   
//         sale_order_date,   
//         sale_due_date,   
//         sale_plan_date,   
//         sale_sale_flag,   
//         sale_ship_flag,   
//         sale_fob,   
//         sale_salesman,   
//         sale_confirm_user,   
//         sale_sale_tax,   
//         sale_sale_amount,   
//         sale_shipto_addr,   
//         sale_rem,   
//         sale_tel_no,   
//         sale_ship_case,   
//         customer_cust_name,   
//         scene_scene_desc,   
//         sale_order_no  

end event

event rowfocuschanged;//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

string ls_order
long   ll_row

ll_row = this.getrow()
if ll_row < 1 then return

//this.selectrow(0, false)
//this.selectrow(ll_row, true)

ls_order = this.object.sale_order_no[ll_row]
dw2.setredraw(false)
dw2.reset()
dw2.retrieve(ls_order)
dw2.setredraw(true)

end event

event clicked;//
if row < 1 then return

st_cust.text  = this.object.customer_cust_name[row]
st_scene.text = this.object.scene_desc[row]
st_addr.text  = this.object.sale_shipto_addr[row]
st_rem.text   = this.object.sale_rem[row]
st_telno.text = this.object.sale_tel_no[row]

//
GF_DWClick2Info(this, ddlb_3, ddlb_4, sle_1, row, dwo.name, ddlb_dwtitles)

end event

type st_1 from statictext within w_whsaleheader_w
integer x = 37
integer y = 204
integer width = 823
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "수주내역(추가=>더블클릭)"
boolean focusrectangle = false
end type

event losefocus;//st_1.visible = false

end event

type gb_1 from groupbox within w_whsaleheader_w
integer x = 1184
integer y = 24
integer width = 3109
integer height = 204
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_2 from groupbox within w_whsaleheader_w
integer x = 32
integer y = 240
integer width = 4265
integer height = 1828
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

