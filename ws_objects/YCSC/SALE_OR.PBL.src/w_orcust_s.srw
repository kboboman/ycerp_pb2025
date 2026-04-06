$PBExportHeader$w_orcust_s.srw
$PBExportComments$견적서 번호로 검색(2003/11/04, 정갑용)
forward
global type w_orcust_s from window
end type
type cb_3 from commandbutton within w_orcust_s
end type
type cb_12 from commandbutton within w_orcust_s
end type
type cb_11 from commandbutton within w_orcust_s
end type
type cb_filteroff from commandbutton within w_orcust_s
end type
type cb_filteron from commandbutton within w_orcust_s
end type
type sle_value from singlelineedit within w_orcust_s
end type
type ddlb_2 from dropdownlistbox within w_orcust_s
end type
type st_9 from statictext within w_orcust_s
end type
type ddlb_col from dropdownlistbox within w_orcust_s
end type
type st_8 from statictext within w_orcust_s
end type
type sle_1 from singlelineedit within w_orcust_s
end type
type rb_2 from radiobutton within w_orcust_s
end type
type rb_1 from radiobutton within w_orcust_s
end type
type dw_2 from datawindow within w_orcust_s
end type
type cb_2 from commandbutton within w_orcust_s
end type
type cb_1 from commandbutton within w_orcust_s
end type
type gb_1 from groupbox within w_orcust_s
end type
end forward

global type w_orcust_s from window
integer width = 2752
integer height = 1460
boolean titlebar = true
string title = "거래처,현장명 찾기(w_orcust_s)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_12 cb_12
cb_11 cb_11
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
ddlb_2 ddlb_2
st_9 st_9
ddlb_col ddlb_col
st_8 st_8
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_orcust_s w_orcust_s

type variables
gs_where ist_where
end variables

on w_orcust_s.create
this.cb_3=create cb_3
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.sle_value=create sle_value
this.ddlb_2=create ddlb_2
this.st_9=create st_9
this.ddlb_col=create ddlb_col
this.st_8=create st_8
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.cb_12,&
this.cb_11,&
this.cb_filteroff,&
this.cb_filteron,&
this.sle_value,&
this.ddlb_2,&
this.st_9,&
this.ddlb_col,&
this.st_8,&
this.sle_1,&
this.rb_2,&
this.rb_1,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_orcust_s.destroy
destroy(this.cb_3)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.sle_value)
destroy(this.ddlb_2)
destroy(this.st_9)
destroy(this.ddlb_col)
destroy(this.st_8)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.settransobject(sqlca)
end event

type cb_3 from commandbutton within w_orcust_s
integer x = 2482
integer y = 52
integer width = 229
integer height = 140
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean cancel = true
end type

event clicked;string ls_est_no // where 절 변수
string ls_estimate_no, ls_cust_no, ls_scene_code, ls_emp_no, ls_vat_flag
string ls_cust_name, ls_scene_desc, ls_sale_succ
string ls_item_no, ls_qa, ls_order_qty, ls_uom, ls_unit_cost, ls_rem
long   ll_dw2cnt, ll_i, ll_row // , ll_cnt
datawindow ldw_dw1
string ls_salesman, ls_cust_addr, ls_tel_no, ls_curr_code
real   lr_price_a

ll_row = dw_2.getrow()
if ll_row < 1 then return

ls_cust_no    = dw_2.object.cust_no[ll_row]
ls_scene_code = dw_2.object.scene_code[ll_row]

w_orsale_m.dw_2.object.cust_no[1] = ls_cust_no

if	w_orsale_m.dw_2.event itemchanged(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.cust_no,ls_cust_no)	= 1 then
	w_orsale_m.dw_2.event itemerror(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.cust_no,ls_cust_no)
	return
end if

w_orsale_m.dw_2.object.scene_code[1] = ls_scene_code
if	w_orsale_m.dw_2.event itemchanged(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.scene_code,ls_scene_code)	= 1 then
	w_orsale_m.dw_2.event itemerror(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.scene_code,ls_scene_code)
end if

w_orsale_m.dw_2.object.tel_no[1] = dw_2.object.scene_tel[ll_row]

Close (parent)
end event

type cb_12 from commandbutton within w_orcust_s
integer x = 2446
integer y = 212
integer width = 270
integer height = 76
integer taborder = 90
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
String ls_col
choose case trim(ddlb_col.text)
	case "현장명"
		ls_col = "scene_desc "
	case "거래처"
		ls_col = "cust_name "
	case "거래-현장코드"
		ls_col = "scene_code "
end choose		

dw_2.SetSort(ls_col + "D")
dw_2.sort()

end event

type cb_11 from commandbutton within w_orcust_s
integer x = 2171
integer y = 212
integer width = 270
integer height = 76
integer taborder = 80
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
String ls_col
choose case trim(ddlb_col.text)
	case "현장명"
		ls_col = "scene_desc "
	case "거래처"
		ls_col = "cust_name "
	case "거래-현장코드"
		ls_col = "scene_code "
end choose		

dw_2.SetSort(ls_col + "A")
dw_2.sort()

end event

type cb_filteroff from commandbutton within w_orcust_s
integer x = 1897
integer y = 212
integer width = 270
integer height = 76
integer taborder = 70
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "현장명"
sle_value.text  = ""

dw_2.setfilter("")
dw_2.filter()

end event

type cb_filteron from commandbutton within w_orcust_s
integer x = 1623
integer y = 212
integer width = 270
integer height = 76
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "현장명"
			ls_col = "scene_desc "
		case "거래처"
			ls_col = "cust_name "
		case "거래-현장코드"
			ls_col = "scene_code "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
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

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)
dw_2.triggerevent(rowfocuschanged!)

end event

type sle_value from singlelineedit within w_orcust_s
integer x = 1111
integer y = 212
integer width = 498
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
end type

type ddlb_2 from dropdownlistbox within w_orcust_s
integer x = 818
integer y = 208
integer width = 279
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_9 from statictext within w_orcust_s
integer x = 635
integer y = 228
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

type ddlb_col from dropdownlistbox within w_orcust_s
integer x = 219
integer y = 208
integer width = 402
integer height = 532
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
string item[] = {"거래처","현장명","거래-현장코드"}
end type

type st_8 from statictext within w_orcust_s
integer x = 37
integer y = 228
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

type sle_1 from singlelineedit within w_orcust_s
integer x = 1033
integer y = 80
integer width = 965
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type rb_2 from radiobutton within w_orcust_s
integer x = 562
integer y = 96
integer width = 398
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "현장 명"
boolean checked = true
end type

event clicked;dw_2.dataobject = 'd_orscene_s'
dw_2.settransobject(sqlca)
end event

type rb_1 from radiobutton within w_orcust_s
integer x = 82
integer y = 96
integer width = 398
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처 명"
end type

event clicked;dw_2.dataobject = 'd_orcust_s'
dw_2.settransobject(sqlca)
end event

type dw_2 from datawindow within w_orcust_s
string tag = "d_orscene_s"
integer x = 14
integer y = 312
integer width = 2702
integer height = 1048
integer taborder = 20
string title = "d_orcust_s"
string dataobject = "d_orscene_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row < 1 then return

string ls_est_no // where 절 변수
string ls_estimate_no, ls_cust_no, ls_scene_code, ls_emp_no, ls_vat_flag
string ls_cust_name, ls_scene_desc, ls_sale_succ
string ls_item_no, ls_qa, ls_order_qty, ls_uom, ls_unit_cost, ls_rem
long   ll_dw2cnt, ll_i // , ll_cnt
datawindow ldw_dw1
string ls_salesman, ls_cust_addr, ls_tel_no, ls_curr_code
real   lr_price_a

ls_cust_no = dw_2.object.cust_no[row]
ls_scene_code = dw_2.object.scene_code[row]

w_orsale_m.dw_2.object.cust_no[1] = ls_cust_no

if	w_orsale_m.dw_2.event itemchanged(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.cust_no,ls_cust_no)	=	1	then
	w_orsale_m.dw_2.event itemerror(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.cust_no,ls_cust_no)
	return
end if

w_orsale_m.dw_2.object.scene_code[1] = ls_scene_code
if	w_orsale_m.dw_2.event itemchanged(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.scene_code,ls_scene_code)	=	1	then
	w_orsale_m.dw_2.event itemerror(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.scene_code,ls_scene_code)
end if

w_orsale_m.dw_2.object.tel_no[1] = dw_2.object.scene_tel[row]

//if trim(ls_cust_no) = 'N004' then 
//	w_orsale_m.dw_2.object.ship_flag[1] = 'A'
//ELSEif trim(ls_cust_no) = 'N009' then 
//	w_orsale_m.dw_2.object.ship_flag[1] = 'R'
//end if

//select cust.salesman, cust.shipto_addr, cust.tel_no, cust.curr_code 
// into :ls_salesman,   :ls_cust_addr,    :ls_tel_no,  :ls_curr_code
//  from customer cust
// where cust.cust_no = :ls_cust_no ;
//
//w_orsale_m.dw_2.object.salesman[1] = ls_salesman
//w_orsale_m.dw_2.object.shipto_addr[1] = ls_cust_addr
//w_orsale_m.dw_2.object.tel_no[1] = ls_tel_no
//w_orsale_m.dw_2.object.curr_code[1] = ls_curr_code
//w_orsale_m.dw_2.object.scene_code[1] = ls_scene_code

//w_orsale_m.idwc_scene.reset() 

//select scene.scene_addr, scene.scene_tel
//  into :ls_cust_addr,    :ls_tel_no
//  from scene
// where scene.scene_code = :ls_scene_code;

//if sqlca.sqldbcode = 0 then
//	w_orsale_m.dw_2.object.shipto_addr[1] = ls_cust_addr
//	w_orsale_m.dw_2.object.tel_no[1] = ls_tel_no
//	w_orsale_m.wf_sceneretrieve(ls_cust_no)
//end if

//select count(*) into :ll_cnt from scene 
// where cust_no = :ls_cust_no;

//w_orsale_m.idwc_scene.reset() 

//if ll_cnt > 0 then
//	w_orsale_m.wf_sceneretrieve(ls_cust_no)
//end if

//if w_orsale_m.idwc_scene.rowcount() > 0 then
//	w_orsale_m.dw_2.object.protect[1] = 'N'
//else
//	w_orsale_m.dw_2.object.protect[1] = 'Y'
//end if

//w_orsale_m.dw_2.object.cust_no.background.color =  rgb(192,192,192)
//w_orsale_m.dw_2.object.cust_no.protect = 1
//w_orsale_m.dw_2.object.scene_code[1] = ls_scene_code

close (parent)
end event

event clicked;string ls_col, ls_text

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

choose case dwo.name
	case "scene_desc"
		ls_col  = "현장명"
		ls_text = string(this.object.scene_desc[row])
	case "cust_name"
		ls_col  = "거래처"
		ls_text = string(this.object.cust_name[row])
	case "scene_code"
		ls_col  = "거래-현장코드"
		ls_text = this.object.scene_code[row]
end choose

ddlb_2.text = "LIKE"
ddlb_col.text  = ls_col
sle_value.text = ls_text



end event

type cb_2 from commandbutton within w_orcust_s
integer x = 2267
integer y = 52
integer width = 206
integer height = 140
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;close (parent)
end event

type cb_1 from commandbutton within w_orcust_s
integer x = 2057
integer y = 52
integer width = 206
integer height = 140
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
boolean default = true
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_cnt
string ls_name

ls_name = trim(sle_1.text)
if LenA(ls_name) < 1 then return

ls_name = '%' + ls_name + '%'
ll_cnt  = dw_2.retrieve(ls_name)
if ll_cnt < 1 then sle_1.setfocus()



end event

type gb_1 from groupbox within w_orcust_s
integer x = 37
integer y = 28
integer width = 2007
integer height = 164
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "검색조건"
end type

