$PBExportHeader$w_orcust_s.srw
$PBExportComments$견적서 번호로 검색(2003/11/04, 정갑용)
forward
global type w_orcust_s from window
end type
type ddlb_op from dropdownlistbox within w_orcust_s
end type
type cb_7 from commandbutton within w_orcust_s
end type
type cb_6 from commandbutton within w_orcust_s
end type
type cb_5 from commandbutton within w_orcust_s
end type
type cb_4 from commandbutton within w_orcust_s
end type
type sle_value from singlelineedit within w_orcust_s
end type
type st_5 from statictext within w_orcust_s
end type
type ddlb_fld from dropdownlistbox within w_orcust_s
end type
type st_4 from statictext within w_orcust_s
end type
type pb_1 from picturebutton within w_orcust_s
end type
type cb_3 from commandbutton within w_orcust_s
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
type gb_2 from groupbox within w_orcust_s
end type
type ddlb_dwtitles from dropdownlistbox within w_orcust_s
end type
end forward

global type w_orcust_s from window
integer width = 3968
integer height = 1824
boolean titlebar = true
string title = "거래처,현장명 찾기(w_orcust_s)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ddlb_op ddlb_op
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
sle_value sle_value
st_5 st_5
ddlb_fld ddlb_fld
st_4 st_4
pb_1 pb_1
cb_3 cb_3
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
ddlb_dwtitles ddlb_dwtitles
end type
global w_orcust_s w_orcust_s

type variables
gs_where ist_where
end variables

on w_orcust_s.create
this.ddlb_op=create ddlb_op
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.sle_value=create sle_value
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.st_4=create st_4
this.pb_1=create pb_1
this.cb_3=create cb_3
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.ddlb_dwtitles=create ddlb_dwtitles
this.Control[]={this.ddlb_op,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.sle_value,&
this.st_5,&
this.ddlb_fld,&
this.st_4,&
this.pb_1,&
this.cb_3,&
this.sle_1,&
this.rb_2,&
this.rb_1,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.gb_1,&
this.gb_2,&
this.ddlb_dwtitles}
end on

on w_orcust_s.destroy
destroy(this.ddlb_op)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.sle_value)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.st_4)
destroy(this.pb_1)
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.ddlb_dwtitles)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.settransobject(sqlca)
sle_1.setfocus()

end event

type ddlb_op from dropdownlistbox within w_orcust_s
integer x = 978
integer y = 272
integer width = 315
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type cb_7 from commandbutton within w_orcust_s
integer x = 2377
integer y = 280
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_orcust_s
integer x = 2213
integer y = 280
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_orcust_s
integer x = 2048
integer y = 280
integer width = 160
integer height = 76
integer taborder = 40
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

arg_dw  = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_orcust_s
integer x = 1883
integer y = 280
integer width = 160
integer height = 76
integer taborder = 30
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

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)



end event

type sle_value from singlelineedit within w_orcust_s
integer x = 1303
integer y = 276
integer width = 567
integer height = 80
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

type st_5 from statictext within w_orcust_s
integer x = 791
integer y = 288
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

type ddlb_fld from dropdownlistbox within w_orcust_s
integer x = 274
integer y = 272
integer width = 480
integer height = 632
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
end type

type st_4 from statictext within w_orcust_s
integer x = 87
integer y = 288
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

type pb_1 from picturebutton within w_orcust_s
event mousemove pbm_mousemove
integer x = 2267
integer y = 52
integer width = 206
integer height = 140
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;//int li_x,li_y
//
//li_x = this.x 
//li_y = this.y + 156
//
//f_usetips(st_tips,"파일저장",parent, li_x, li_y)
//
end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_cnt

ll_cnt = dw_2.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_2.SaveAsascii(ls_DocName)
		end if
	end if
end if	

end event

type cb_3 from commandbutton within w_orcust_s
integer x = 2697
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
if	w_orsale_m.dw_2.event itemchanged(w_orsale_m.dw_2.getrow(), w_orsale_m.dw_2.object.cust_no, ls_cust_no)	= 1 then
	w_orsale_m.dw_2.event itemerror(w_orsale_m.dw_2.getrow(), w_orsale_m.dw_2.object.cust_no, ls_cust_no)
	return
end if

w_orsale_m.dw_2.object.scene_code[1] = ls_scene_code
if	w_orsale_m.dw_2.event itemchanged(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.scene_code,ls_scene_code)	= 1 then
	w_orsale_m.dw_2.event itemerror(w_orsale_m.dw_2.getrow(),w_orsale_m.dw_2.object.scene_code,ls_scene_code)
end if

w_orsale_m.dw_2.object.tel_no[1] = dw_2.object.scene_tel[ll_row]

Close (parent)
end event

type sle_1 from singlelineedit within w_orcust_s
integer x = 1033
integer y = 80
integer width = 965
integer height = 88
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

event getfocus;// 한글 키보드 
long mode

mode = ImmGetContext( handle(parent) )
ImmSetConversionStatus( mode, 1, 0 )		// 2번째 인수값 1=KOR, 2=ENG

this.SelectText(1, LenA(this.Text))

end event

type rb_2 from radiobutton within w_orcust_s
integer x = 539
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
string text = "현장명"
boolean checked = true
end type

event clicked;dw_2.dataobject = 'd_orscene_s'
dw_2.settransobject(sqlca)
end event

type rb_1 from radiobutton within w_orcust_s
integer x = 59
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
string text = "거래처명"
end type

event clicked;dw_2.dataobject = 'd_orcust_s'
dw_2.settransobject(sqlca)
end event

type dw_2 from datawindow within w_orcust_s
string tag = "d_orscene_s"
integer x = 14
integer y = 404
integer width = 3904
integer height = 1304
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
if	w_orsale_m.dw_2.event itemchanged(w_orsale_m.dw_2.getrow(), w_orsale_m.dw_2.object.cust_no, ls_cust_no)	=	1	then
	w_orsale_m.dw_2.event itemerror(w_orsale_m.dw_2.getrow(), w_orsale_m.dw_2.object.cust_no, ls_cust_no)
	return
end if

w_orsale_m.dw_2.object.scene_code[1] = ls_scene_code
if	w_orsale_m.dw_2.event itemchanged(w_orsale_m.dw_2.getrow(), w_orsale_m.dw_2.object.scene_code, ls_scene_code)	=	1	then
	w_orsale_m.dw_2.event itemerror(w_orsale_m.dw_2.getrow(), w_orsale_m.dw_2.object.scene_code, ls_scene_code)
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

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

end event

type cb_2 from commandbutton within w_orcust_s
integer x = 2482
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
integer x = 14
integer y = 28
integer width = 2025
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

type gb_2 from groupbox within w_orcust_s
integer x = 14
integer y = 208
integer width = 3904
integer height = 184
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type ddlb_dwtitles from dropdownlistbox within w_orcust_s
integer x = 306
integer y = 292
integer width = 347
integer height = 88
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

