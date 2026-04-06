$PBExportHeader$w_cditemcustprice_m.srw
$PBExportComments$물품별 거래처표준단가 관리(2002/01/01,이인호)
forward 
global type w_cditemcustprice_m from w_inheritance
end type
type sle_1 from singlelineedit within w_cditemcustprice_m
end type
type sle_2 from singlelineedit within w_cditemcustprice_m
end type
type st_1 from statictext within w_cditemcustprice_m
end type
type st_2 from statictext within w_cditemcustprice_m
end type
type st_3 from statictext within w_cditemcustprice_m
end type
type cbx_1 from checkbox within w_cditemcustprice_m
end type
type st_4 from statictext within w_cditemcustprice_m
end type
type ddlb_3 from dropdownlistbox within w_cditemcustprice_m
end type
type st_5 from statictext within w_cditemcustprice_m
end type
type ddlb_4 from dropdownlistbox within w_cditemcustprice_m
end type
type sle_value from singlelineedit within w_cditemcustprice_m
end type
type cb_1 from commandbutton within w_cditemcustprice_m
end type
type cb_2 from commandbutton within w_cditemcustprice_m
end type
type cb_3 from commandbutton within w_cditemcustprice_m
end type
type cb_5 from commandbutton within w_cditemcustprice_m
end type
type cb_4 from commandbutton within w_cditemcustprice_m
end type
type cb_6 from commandbutton within w_cditemcustprice_m
end type
type cb_7 from commandbutton within w_cditemcustprice_m
end type
type st_6 from statictext within w_cditemcustprice_m
end type
type cb_8 from commandbutton within w_cditemcustprice_m
end type
type pb_excel from picturebutton within w_cditemcustprice_m
end type
type cb_10 from commandbutton within w_cditemcustprice_m
end type
end forward

global type w_cditemcustprice_m from w_inheritance
integer width = 4302
integer height = 2100
string title = "거래처 단가관리(물품별)(w_cditemcustprice_m)"
sle_1 sle_1
sle_2 sle_2
st_1 st_1
st_2 st_2
st_3 st_3
cbx_1 cbx_1
st_4 st_4
ddlb_3 ddlb_3
st_5 st_5
ddlb_4 ddlb_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cb_4 cb_4
cb_6 cb_6
cb_7 cb_7
st_6 st_6
cb_8 cb_8
pb_excel pb_excel
cb_10 cb_10
end type
global w_cditemcustprice_m w_cditemcustprice_m

type variables
st_print i_print
int ii_csort = 1,  ii_nsort = 1, ii_qsort = 1
end variables

on w_cditemcustprice_m.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.sle_2=create sle_2
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.cbx_1=create cbx_1
this.st_4=create st_4
this.ddlb_3=create ddlb_3
this.st_5=create st_5
this.ddlb_4=create ddlb_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_6=create cb_6
this.cb_7=create cb_7
this.st_6=create st_6
this.cb_8=create cb_8
this.pb_excel=create pb_excel
this.cb_10=create cb_10
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.sle_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.ddlb_3
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.ddlb_4
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cb_4
this.Control[iCurrent+17]=this.cb_6
this.Control[iCurrent+18]=this.cb_7
this.Control[iCurrent+19]=this.st_6
this.Control[iCurrent+20]=this.cb_8
this.Control[iCurrent+21]=this.pb_excel
this.Control[iCurrent+22]=this.cb_10
end on

on w_cditemcustprice_m.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cbx_1)
destroy(this.st_4)
destroy(this.ddlb_3)
destroy(this.st_5)
destroy(this.ddlb_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.st_6)
destroy(this.cb_8)
destroy(this.pb_excel)
destroy(this.cb_10)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
ddlb_4.text  = "LIKE"
ddlb_3.text  = "거래처"
sle_value.text = ""

if gf_permission('물품거래처단가관리자', gs_userid) = 'Y' then
   pb_retrieve.enabled = true
	pb_excel.enabled    = true
   pb_save.enabled     = true
   pb_print.enabled    = true
else
   pb_retrieve.enabled = false
	pb_excel.enabled    = false
   pb_save.enabled     = false
   pb_print.enabled    = false
end if

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_cditemcustprice_m
integer x = 3817
integer y = 56
end type

event pb_save::clicked;string ls_newsort
long   ll_row

dw_1.accepttext()

if dw_1.rowcount() < 1 then return
if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

	
//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

setpointer(hourglass!)
for ll_row = 1 to dw_1.rowcount() 
	if dw_1.object.c_price[ll_row] <> dw_1.object.price[ll_row] then
		dw_1.object.pre_cost[ll_row] = dw_1.object.price[ll_row]
		dw_1.object.sys_date[ll_row] = wf_today()
		dw_1.object.user_id[ll_row] = gs_userid
	end if
next
	
dw_1.accepttext()
if wf_update1(dw_1,"Y") = true then
	pb_retrieve.postevent(clicked!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cditemcustprice_m
integer x = 32
integer y = 412
integer width = 4192
integer height = 1552
string dataobject = "d_cditemcustitem_m"
borderstyle borderstyle = stylelowered!
end type

event dw_1::retrieveend;this.accepttext()

end event

event dw_1::clicked;call super::clicked;string ls_col, ls_text

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

this.scrolltorow( row )
choose case dwo.name
	case "custitem_cust_no"
		ls_col  = "코드"
		ls_text = string(this.object.custitem_cust_no[row])
	case "cust_name"
		ls_col  = "거래처"
		ls_text = string(this.object.cust_name[row])
	case "custitem_qa"
		ls_col  = "규격"
		ls_text = string(this.object.custitem_qa[row])		
	case "custitem_uom"
		ls_col  = "단위"
		ls_text = string(this.object.custitem_uom[row])
	case "pre_cost"
		ls_col  = "종전단가"
		ls_text = string(this.object.pre_cost[row])
	case "itemcost_price"
		ls_col  = "표준단가"
		ls_text = string(this.object.itemcost_price[row])
	case "price"
		ls_col  = "확정가"
		ls_text = string(this.object.price[row])
	case "custitem_rem"
		ls_col  = "비고"
		ls_text = string(this.object.custitem_rem[row])
	case "sys_date"
		ls_col  = "변경일자"
		ls_text = string(this.object.sys_date[row])
	case "user_id"
		ls_col  = "변경자"
		ls_text = string(this.object.user_id[row])
	case "cprice"
		ls_col  = "확정가 원본"
		ls_text = string(this.object.cprice[row])
end choose

choose case ls_col
	case "종전단가", "표준단가", "확정가", "확정가 원본"
		ddlb_4.text = "="
	case else
		ddlb_4.text = "LIKE"
end choose

ddlb_3.text    = ls_col
sle_value.text = ls_text


end event

type st_title from w_inheritance`st_title within w_cditemcustprice_m
integer x = 32
integer y = 20
integer width = 1541
integer height = 140
string text = "거래처 단가관리(물품별)"
end type

type st_tips from w_inheritance`st_tips within w_cditemcustprice_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemcustprice_m
integer x = 1659
integer y = 60
integer width = 192
integer taborder = 90
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품목검색"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::clicked;gs_where2 lst_whitemret
string ls_item

lst_whitemret.chk = "S"
OpenWithParm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk = 'Y' then
	sle_1.text = lst_whitemret.str1[1]
	SELECT item_name INTO :ls_item FROM groupitem WHERE item_no = :lst_whitemret.str1[1];
	sle_2.text = ls_item
end if

ls_item = trim(sle_1.text)
if isnull(ls_item) or ls_item = "" then 
else
	pb_retrieve.triggerevent( clicked! )
end if
end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"품목검색",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cditemcustprice_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditemcustprice_m
integer x = 4009
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cditemcustprice_m
integer x = 3625
integer y = 56
integer taborder = 110
end type

event pb_print::clicked;//w_repsuper w_print
//
//i_print.st_datawindow  = dw_1
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc  = " 이 프로그램은 물품별 거래처표준단가를 출력합니다." 
////i_print.name = ''
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cditemcustprice_m
integer x = 3465
integer y = 284
integer width = 219
integer height = 84
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "코드순"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::clicked;//
if ii_csort = 2 then
	dw_1.setsort('custitem_cust_no A, qa')
	dw_1.sort()
	ii_csort = 1
else
	dw_1.setsort('custitem_cust_no D, qa')
	dw_1.sort()
	ii_csort = 2
end if
end event

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_cditemcustprice_m
integer x = 3959
integer y = 284
integer width = 224
integer height = 84
integer taborder = 130
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "규격순"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_delete::clicked;//
if ii_qsort = 2 then
	dw_1.setsort('custitem_qa A, cust_name')
	dw_1.sort()
	ii_qsort = 1
else
	dw_1.setsort('custitem_qa D, cust_name')
	dw_1.sort()
	ii_qsort = 2
end if
end event

event pb_delete::mousemove;//
end event

type pb_insert from w_inheritance`pb_insert within w_cditemcustprice_m
integer x = 3689
integer y = 284
integer width = 265
integer height = 84
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처순"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::clicked;//
if ii_nsort = 2 then
	dw_1.setsort('cust_name A, qa')
	dw_1.sort()
	ii_nsort = 1
else
	dw_1.setsort('cust_name D, qa')
	dw_1.sort()
	ii_nsort = 2
end if
end event

event pb_insert::mousemove;//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemcustprice_m
integer x = 3241
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;string ls_item
long   ll_row

ls_item = trim(sle_1.text)
if isnull(ls_item) or ls_item = "" then 
	MessageBox("확인","품목을 먼저 검색하시기 바랍니다.")
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ll_row = dw_1.retrieve( ls_item )
if ll_row < 1 then 
	MessageBox("확인","해당하는 품목의 데이터가 존재하지 않습니다.")
end if
end event

type gb_3 from w_inheritance`gb_3 within w_cditemcustprice_m
integer x = 1623
integer y = 16
integer width = 1573
integer height = 204
integer textsize = -8
long backcolor = 67108864
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_cditemcustprice_m
integer y = 220
integer width = 4192
integer height = 180
integer taborder = 80
long textcolor = 16711680
long backcolor = 79219928
end type

type gb_1 from w_inheritance`gb_1 within w_cditemcustprice_m
integer x = 3214
integer y = 16
integer width = 1010
long backcolor = 79219928
end type

type dw_2 from w_inheritance`dw_2 within w_cditemcustprice_m
integer x = 69
integer y = 132
integer width = 110
integer height = 80
boolean vscrollbar = false
end type

type sle_1 from singlelineedit within w_cditemcustprice_m
integer x = 2021
integer y = 52
integer width = 379
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_cditemcustprice_m
integer x = 2021
integer y = 132
integer width = 1147
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_cditemcustprice_m
integer x = 1861
integer y = 68
integer width = 142
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
boolean enabled = false
string text = "코드"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cditemcustprice_m
integer x = 1861
integer y = 136
integer width = 142
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
boolean enabled = false
string text = "품명"
boolean focusrectangle = false
end type

type st_3 from statictext within w_cditemcustprice_m
boolean visible = false
integer x = 585
integer y = 32
integer width = 521
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "물품표준단가관리"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_cditemcustprice_m
integer x = 73
integer y = 296
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
string text = "전체"
end type

event clicked;//
string ls_chk
long   ll_row

if this.checked = true then
	ls_chk  = "Y"
else
	ls_chk  = "N"
end if

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = ls_chk
next

end event

type st_4 from statictext within w_cditemcustprice_m
integer x = 631
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

type ddlb_3 from dropdownlistbox within w_cditemcustprice_m
integer x = 818
integer y = 284
integer width = 402
integer height = 532
integer taborder = 10
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
string item[] = {"코드","거래처","규격","단위","종전단가","표준단가","확정가","비고","변경일자","변경자","확정가 원본"}
end type

type st_5 from statictext within w_cditemcustprice_m
integer x = 1248
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

type ddlb_4 from dropdownlistbox within w_cditemcustprice_m
integer x = 1417
integer y = 284
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_cditemcustprice_m
integer x = 1737
integer y = 292
integer width = 567
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cditemcustprice_m
integer x = 2309
integer y = 292
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
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_3.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_3.text)
		case "코드"
			ls_col  = "custitem_cust_no "
		case "거래처"
			ls_col  = "cust_name "
		case "규격"
			ls_col  = "custitem_qa "
		case "단위"
			ls_col  = "custitem_uom "
		case "종전단가"
			ls_col  = "pre_cost "
		case "표준단가"
			ls_col  = "itemcost_price "
		case "확정가"
			ls_col  = "price "
		case "비고"
			ls_col  = "custitem_rem "
		case "변경일자"
			ls_col  = "sys_date "
		case "변경자"
			ls_col  = "user_id "
		case "확정가 원본"
			ls_col  = "cprice "
	end choose

	if trim(ddlb_4.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_4.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "sys_date " then
			ls_column = ls_col + trim(ddlb_4.text) + " #" + trim(sle_value.text) + "# "
		elseif ls_col = "pre_cost " or ls_col = "itemcost_price " or ls_col = "price " or ls_col = "cprice " then
			ls_column = ls_col + trim(ddlb_4.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_4.text) + " '" + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type cb_2 from commandbutton within w_cditemcustprice_m
integer x = 2473
integer y = 292
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
string text = "해지"
end type

event clicked;//
ddlb_4.text = "LIKE"
ddlb_3.text = "거래처"
sle_value.text = ""

dw_1.setfilter("")
dw_1.filter()

end event

type cb_3 from commandbutton within w_cditemcustprice_m
integer x = 2638
integer y = 292
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
string text = "오름"
end type

event clicked;//
string ls_col

choose case trim(ddlb_3.text)
	case "코드"
		ls_col  = "custitem_cust_no "
	case "거래처"
		ls_col  = "cust_name "
	case "규격"
		ls_col  = "custitem_qa "
	case "단위"
		ls_col  = "custitem_uom "
	case "종전단가"
		ls_col  = "pre_cost "
	case "표준단가"
		ls_col  = "itemcost_price "
	case "확정가"
		ls_col  = "price "
	case "비고"
		ls_col  = "custitem_rem "
	case "변경일자"
		ls_col  = "sys_date "
	case "변경자"
		ls_col  = "user_id "
	case "확정가 원본"
		ls_col  = "cprice "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_5 from commandbutton within w_cditemcustprice_m
integer x = 2802
integer y = 292
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
string text = "내림"
end type

event clicked;//
string ls_col

choose case trim(ddlb_3.text)
	case "코드"
		ls_col  = "custitem_cust_no "
	case "거래처"
		ls_col  = "cust_name "
	case "규격"
		ls_col  = "custitem_qa "
	case "단위"
		ls_col  = "custitem_uom "
	case "종전단가"
		ls_col  = "pre_cost "
	case "표준단가"
		ls_col  = "itemcost_price "
	case "확정가"
		ls_col  = "price "
	case "비고"
		ls_col  = "custitem_rem "
	case "변경일자"
		ls_col  = "sys_date "
	case "변경자"
		ls_col  = "user_id "
	case "확정가 원본"
		ls_col  = "cprice "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

type cb_4 from commandbutton within w_cditemcustprice_m
integer x = 306
integer y = 288
integer width = 293
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택 적용"
end type

event clicked;//
long  ll_row, ll_amt

ll_amt = long(sle_value.text)

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.chk[ll_row] = "Y" then
		dw_1.object.price[ll_row] = ll_amt
	end if
next
end event

type cb_6 from commandbutton within w_cditemcustprice_m
integer x = 2981
integer y = 292
integer width = 151
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "낮음"
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost > price "

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type cb_7 from commandbutton within w_cditemcustprice_m
integer x = 3241
integer y = 292
integer width = 151
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "높음"
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost < price "

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type st_6 from statictext within w_cditemcustprice_m
integer x = 2981
integer y = 240
integer width = 434
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "종전단가,확정가"
boolean focusrectangle = false
end type

type cb_8 from commandbutton within w_cditemcustprice_m
integer x = 3136
integer y = 292
integer width = 101
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "="
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost = price "

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type pb_excel from picturebutton within w_cditemcustprice_m
event mousemove pbm_mousemove
integer x = 3433
integer y = 56
integer width = 187
integer height = 144
integer taborder = 80
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

datawindow dw_dest

dw_dest = dw_1

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type cb_10 from commandbutton within w_cditemcustprice_m
integer x = 2437
integer y = 48
integer width = 731
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "현장별 단가관리"
end type

event clicked;// 현장별 단가관리
string   ls_custno, ls_custnm, ls_itemno, ls_itemnm, ls_qa
long     ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_custno = dw_1.object.custitem_cust_no[ll_row]
ls_custnm = dw_1.object.cust_name[ll_row]

if IsValid(w_o_main) then 
	OpenSheet(w_cdsceneprice_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cdsceneprice_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cdsceneprice_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdsceneprice_m,  w_all_main, 5, original!)
end if


w_cdsceneprice_m.dw_1.retrieve()

w_cdsceneprice_m.cb_3.enabled = true
w_cdsceneprice_m.dw_3.enabled = true
w_cdsceneprice_m.dw_5.enabled = true

w_cdsceneprice_m.dw_3.object.cust_no[1]   = ls_custno
w_cdsceneprice_m.dw_3.object.cust_name[1] = ls_custnm
//w_cdsceneprice_m.dw_3.setcolumn("cust_no")
//w_cdsceneprice_m.dw_3.setfocus()

w_cdsceneprice_m.dw_2.reset()
//w_cdsceneprice_m.dw_2.retrieve(ls_cust, is_scene_code, is_ret)
w_cdsceneprice_m.dw_4.reset()
w_cdsceneprice_m.pb_insert.enabled = false


//datawindowchild idwc_cust_no,  idwc_cust_qa
//datawindowchild idwc_scene_no, idwc_scene_desc
//		is_custno   = idwc_cust_no.getitemstring(idwc_cust_no.getrow(), "cust_no")
//		is_custname = idwc_cust_no.getitemstring(idwc_cust_no.getrow(), "cust_name")
//		this.object.cust_name[this.getrow()] = is_custname
//
//		ls_where = "WHERE scene.cust_no = ~~'" + is_custno + "~~'"
//		ls_sql   = "datawindow.table.select = '" + is_select1 + ls_where + "'"
//		
//		dw_5.getchild("scene_code", idwc_scene_no)
//		idwc_scene_no.settransobject(sqlca)
//		idwc_scene_no.modify(ls_sql)
//		idwc_scene_no.retrieve()
//		
//		dw_5.getchild("scene_desc", idwc_scene_desc)
//		idwc_scene_desc.settransobject(sqlca)
//		idwc_scene_desc.modify(ls_sql)
//		idwc_scene_desc.retrieve()
//		
//		dw_5.object.scene_code[dw_5.getrow()] = ''
//		dw_5.object.scene_desc[dw_5.getrow()] = ''
//		dw_5.object.scene_code.tabsequence = 1
//		dw_5.object.scene_code.background.color = 1087434968
//		dw_5.object.scene_desc.tabsequence = 2
//		dw_5.object.scene_desc.background.color = 1087434968
//		dw_5.setfocus()
		
w_cdsceneprice_m.dw_6.visible = true
w_cdsceneprice_m.dw_6.reset()
ll_row = w_cdsceneprice_m.dw_6.retrieve( ls_custno )

if ll_row > 0 then
	w_cdsceneprice_m.dw_6.setfocus()
else
	w_cdsceneprice_m.dw_3.setfocus()	
end if
end event

