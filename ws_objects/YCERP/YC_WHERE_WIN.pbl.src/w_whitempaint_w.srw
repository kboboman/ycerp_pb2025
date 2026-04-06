$PBExportHeader$w_whitempaint_w.srw
$PBExportComments$저장소별재고검색(2004/10/11, 이인호)
forward
global type w_whitempaint_w from window
end type
type ddlb_scene_code from dropdownlistbox within w_whitempaint_w
end type
type st_5 from statictext within w_whitempaint_w
end type
type ddlb_cust_no from dropdownlistbox within w_whitempaint_w
end type
type st_1 from statictext within w_whitempaint_w
end type
type cb_7 from commandbutton within w_whitempaint_w
end type
type cb_6 from commandbutton within w_whitempaint_w
end type
type cb_5 from commandbutton within w_whitempaint_w
end type
type cb_4 from commandbutton within w_whitempaint_w
end type
type cb_3 from commandbutton within w_whitempaint_w
end type
type cbx_op from checkbox within w_whitempaint_w
end type
type sle_value from singlelineedit within w_whitempaint_w
end type
type ddlb_op from dropdownlistbox within w_whitempaint_w
end type
type st_4 from statictext within w_whitempaint_w
end type
type ddlb_fld from dropdownlistbox within w_whitempaint_w
end type
type ddlb_dwtitles from dropdownlistbox within w_whitempaint_w
end type
type st_3 from statictext within w_whitempaint_w
end type
type cb_2 from commandbutton within w_whitempaint_w
end type
type cb_1 from commandbutton within w_whitempaint_w
end type
type dw_1 from datawindow within w_whitempaint_w
end type
type gb_1 from groupbox within w_whitempaint_w
end type
end forward

global type w_whitempaint_w from window
integer x = 1938
integer y = 700
integer width = 5632
integer height = 2948
boolean titlebar = true
string title = "도료검색(w_whitempaint_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ddlb_scene_code ddlb_scene_code
st_5 st_5
ddlb_cust_no ddlb_cust_no
st_1 st_1
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cbx_op cbx_op
sle_value sle_value
ddlb_op ddlb_op
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_3 st_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_whitempaint_w w_whitempaint_w

type variables
gs_where istr_where

end variables

on w_whitempaint_w.create
this.ddlb_scene_code=create ddlb_scene_code
this.st_5=create st_5
this.ddlb_cust_no=create ddlb_cust_no
this.st_1=create st_1
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cbx_op=create cbx_op
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.ddlb_scene_code,&
this.st_5,&
this.ddlb_cust_no,&
this.st_1,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cbx_op,&
this.sle_value,&
this.ddlb_op,&
this.st_4,&
this.ddlb_fld,&
this.ddlb_dwtitles,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_whitempaint_w.destroy
destroy(this.ddlb_scene_code)
destroy(this.st_5)
destroy(this.ddlb_cust_no)
destroy(this.st_1)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cbx_op)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;string ls_scene_code, ls_scene_name
string ls_cust_no, ls_cust_name
long ll_row, l_row

istr_where = message.powerobjectparm

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_1.SetTransObject(SQLCA)


//DECLARE csr_ct_code01 CURSOR FOR  
//select cust_no, cust_name
//from customer with(nolock)
//where open_close <> 'C'
//ORDER BY CUST_NAME;
//
//DECLARE csr_ct_code02 CURSOR FOR  
//select a.scene_code, a.scene_desc 
//from scene a with(nolock) inner join customer b with(nolock) on a.cust_no = b.cust_no and b.open_close <> 'C';
//
//ddlb_cust_no.Reset()
//
//
//OPEN csr_ct_code01;
//
//do while sqlca.sqlcode = 0	
//	FETCH csr_ct_code01 INTO :ls_cust_no, :ls_cust_name;
//	if SQLCA.SQLCODE < 0 then		
//		return
//	elseif SQLCA.SQLCODE = 100 then
//		exit
//	end if
//	
//	ddlb_cust_no.AddItem( ls_cust_no + ' ' + ls_cust_name )
//
//loop
//
//close csr_ct_code01;
//
//
//open csr_ct_code02;
//
//do while sqlca.sqlcode = 0	
//	FETCH csr_ct_code01 INTO :ls_scene_code, :ls_scene_name;
//	if SQLCA.SQLCODE < 0 then		
//		return
//	elseif SQLCA.SQLCODE = 100 then
//		exit
//	end if
//	
//	ddlb_cust_no.AddItem( ls_scene_code + ' ' + ls_scene_name )
//
//loop
//
//close csr_ct_code02;


ls_scene_code = istr_where.str2

//ddlb_cust_no.text = left(ls_scene_code,4)
//
//ddlb_scene_code.text = ls_scene_code

l_row = 0

l_row = dw_1.retrieve(ls_scene_code)

if l_row = 0 then
	dw_1.retrieve('%')	
end if
end event

type ddlb_scene_code from dropdownlistbox within w_whitempaint_w
boolean visible = false
integer x = 3099
integer y = 720
integer width = 1207
integer height = 584
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
boolean allowedit = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_whitempaint_w
boolean visible = false
integer x = 2816
integer y = 724
integer width = 283
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
string text = "현장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_cust_no from dropdownlistbox within w_whitempaint_w
boolean visible = false
integer x = 3099
integer y = 624
integer width = 1207
integer height = 804
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
boolean allowedit = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_scene_no, ls_scene_name, ls_req_date, ls_cust_no

DECLARE csr_ct_code01 CURSOR FOR  
select scene_code, scene_desc
  from scene
where cust_no = :ls_cust_no;

ddlb_scene_code.Reset()

ls_cust_no  = LeftA(this.text,4)

OPEN csr_ct_code01;

do while sqlca.sqlcode = 0	
	FETCH csr_ct_code01 INTO :ls_scene_no, :ls_scene_name;
	if SQLCA.SQLCODE < 0 then		
		return
	elseif SQLCA.SQLCODE = 100 then
		exit
	end if
	
	ddlb_scene_code.AddItem( ls_scene_no + ' ' + ls_scene_name )

loop

close csr_ct_code01;
end event

type st_1 from statictext within w_whitempaint_w
boolean visible = false
integer x = 2743
integer y = 628
integer width = 357
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
string text = "판매거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_7 from commandbutton within w_whitempaint_w
integer x = 3470
integer y = 48
integer width = 485
integer height = 92
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "도료전체조회"
end type

event clicked;string ls_scene_code

ls_scene_code = ddlb_scene_code.text


if ls_scene_code = '' or isnull(ls_scene_code) then
	ls_scene_code = '%'
end if

dw_1.retrieve(ls_scene_code)
end event

type cb_6 from commandbutton within w_whitempaint_w
integer x = 2642
integer y = 56
integer width = 146
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

GF_DW2Sort( dw_1, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_whitempaint_w
integer x = 2491
integer y = 56
integer width = 146
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

GF_DW2Sort( dw_1, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_4 from commandbutton within w_whitempaint_w
integer x = 2341
integer y = 56
integer width = 146
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

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( dw_1 )

end event

type cb_3 from commandbutton within w_whitempaint_w
integer x = 2190
integer y = 56
integer width = 146
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

event clicked;// 필터(다중필터 추가)
// OPEN Event : GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
// 해지 Click : GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
// cbx_op Control 추가 
// 필터 Click Script 아래 Script로 변경

datawindow arg_dw
integer    li_ret

string     ls_column, ls_value, ls_col, ls_type, ls_op
ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(dw_1, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(dw_1, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cbx_op from checkbox within w_whitempaint_w
integer x = 1957
integer y = 68
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type sle_value from singlelineedit within w_whitempaint_w
integer x = 1257
integer y = 56
integer width = 681
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

type ddlb_op from dropdownlistbox within w_whitempaint_w
integer x = 965
integer y = 48
integer width = 274
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_4 from statictext within w_whitempaint_w
integer x = 795
integer y = 64
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

type ddlb_fld from dropdownlistbox within w_whitempaint_w
integer x = 325
integer y = 48
integer width = 443
integer height = 632
integer taborder = 40
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

type ddlb_dwtitles from dropdownlistbox within w_whitempaint_w
boolean visible = false
integer x = 357
integer y = 60
integer width = 311
integer height = 88
integer taborder = 50
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

type st_3 from statictext within w_whitempaint_w
integer x = 146
integer y = 68
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_whitempaint_w
integer x = 3186
integer y = 56
integer width = 242
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type cb_1 from commandbutton within w_whitempaint_w
integer x = 2926
integer y = 56
integer width = 242
integer height = 80
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;long ll_row, ll_cnt

dw_1.accepttext()

ll_row = dw_1.getrow()

if ll_row < 1 then return

istr_where.str1 = dw_1.object.item_no[ll_row]
istr_where.name = dw_1.object.qa[ll_row]
istr_where.str2 = dw_1.object.scene_code[ll_row]
istr_where.str3 = dw_1.object.item_gubun[ll_row]	
istr_where.str4 = dw_1.object.order_paint_company[ll_row]
istr_where.str5 = dw_1.object.order_paint_name[ll_row]
istr_where.chk = "Y"

CloseWithReturn(parent, istr_where)
end event

type dw_1 from datawindow within w_whitempaint_w
integer x = 23
integer y = 180
integer width = 5527
integer height = 2552
integer taborder = 20
string title = "none"
string dataobject = "d_whitempaint_list"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)



end event

event doubleclicked;dw_1.accepttext()

istr_where.str1 = dw_1.object.item_no[row]
istr_where.name = dw_1.object.qa[row]
istr_where.str2 = dw_1.object.scene_code[row]
istr_where.str3 = dw_1.object.item_gubun[row]	
istr_where.str4 = dw_1.object.order_paint_company[row]
istr_where.str5 = dw_1.object.order_paint_name[row]
istr_where.chk = "Y"

CloseWithReturn(parent, istr_where)
end event

type gb_1 from groupbox within w_whitempaint_w
integer x = 14
integer width = 5550
integer height = 168
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

