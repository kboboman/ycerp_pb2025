$PBExportHeader$w_oiscenebaldo_r.srw
$PBExportComments$현장별 제품출고및 미출고현황(1998/5/14,성삼지)
forward
global type w_oiscenebaldo_r from w_inheritance
end type
type st_3 from statictext within w_oiscenebaldo_r
end type
type ddlb_fld from dropdownlistbox within w_oiscenebaldo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiscenebaldo_r
end type
type st_4 from statictext within w_oiscenebaldo_r
end type
type sle_value from singlelineedit within w_oiscenebaldo_r
end type
type cb_1 from commandbutton within w_oiscenebaldo_r
end type
type cb_2 from commandbutton within w_oiscenebaldo_r
end type
type cb_3 from commandbutton within w_oiscenebaldo_r
end type
type cb_5 from commandbutton within w_oiscenebaldo_r
end type
type ddlb_op from dropdownlistbox within w_oiscenebaldo_r
end type
end forward

global type w_oiscenebaldo_r from w_inheritance
integer y = 112
integer width = 3639
integer height = 2168
string title = "현장별 출고및 미출고 현황(w_oiscenebaldo_r)"
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
end type
global w_oiscenebaldo_r w_oiscenebaldo_r

type variables
gs_itembaldo_str ist_code
string is_sale_flag, is_itemdosql, is_itemdorsql, is_ret
end variables

on w_oiscenebaldo_r.create
int iCurrent
call super::create
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.ddlb_op
end on

on w_oiscenebaldo_r.destroy
call super::destroy
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

//string ls_chk
//select isnull(sale_price,'N') into :ls_chk from login
// where user_id = :gs_userid; 
//if ls_chk = 'Y' Then
//	is_ret = '%'
//else
//	is_ret = gs_userid
//end if
is_itemdosql  = dw_1.describe("datawindow.table.select")
is_itemdorsql = dw_2.describe("datawindow.table.select")

dw_2.visible = false

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 64
dw_1.height = newheight - 444

end event

type pb_save from w_inheritance`pb_save within w_oiscenebaldo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiscenebaldo_r
integer x = 27
integer y = 416
integer width = 3538
integer height = 1620
integer taborder = 0
string dataobject = "d_oiscenebaldo_s"
boolean hsplitscroll = true
end type

type st_title from w_inheritance`st_title within w_oiscenebaldo_r
integer y = 40
integer width = 2025
string text = "현장별 출고및 미출고 현황"
end type

type st_tips from w_inheritance`st_tips within w_oiscenebaldo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiscenebaldo_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiscenebaldo_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oiscenebaldo_r
integer x = 3351
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiscenebaldo_r
integer x = 3159
integer taborder = 20
end type

event pb_print::clicked;string ls_sql, ls_where
long ll_count
w_repsuper w_print
st_print l_print


if dw_2.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

for ll_count = 1 to dw_2.rowcount()
	dw_2.object.customer_bus_cord[ll_count] = ist_code.start_date
	dw_2.object.customer_bus_rep[ll_count] = ist_code.end_date
next
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 현장별 물품출고및 미출고 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiscenebaldo_r
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oiscenebaldo_r
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oiscenebaldo_r
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiscenebaldo_r
integer x = 2967
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_sql, ls_where
st_security lst_security

openwithparm(w_whscenebaldo_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_level_userid
Choose Case gs_level
	Case 'A', 'B'
		is_ret = '%'

	Case 'C'
		is_ret = gs_userid
End Choose
/*
	<!-- 소스추가끝 -->
*/	

/*2018.03.28 조원석 주석처리 및 내용 수정 and -> where */
//ls_where = " and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
ls_where = " where sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &  
			  ist_code.end_date + "~~' and sale.cust_no = ~~'" + &				
			  ist_code.order_flag + "~~' and saledet.item_no like ~~'" + &
			  ist_code.do_flag + "~~' and sale.scene_code like ~~'" + &
			  ist_code.sel_flag + "~~'" + &
						  " and customer.salesman like ~~'" + is_ret + "~~'"
ls_sql = "datawindow.table.select = '" + is_itemdosql + ls_where + "'"

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_1.sharedata(dw_2)

dw_1.retrieve()
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if
	
end event

type gb_3 from w_inheritance`gb_3 within w_oiscenebaldo_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiscenebaldo_r
integer x = 27
integer y = 224
integer width = 3538
integer height = 176
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiscenebaldo_r
integer x = 2939
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiscenebaldo_r
integer x = 2139
integer y = 92
integer width = 96
integer height = 76
integer taborder = 0
string dataobject = "d_oiscenebaldo_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_3 from statictext within w_oiscenebaldo_r
integer x = 82
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_oiscenebaldo_r
integer x = 270
integer y = 280
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

type ddlb_dwtitles from dropdownlistbox within w_oiscenebaldo_r
integer x = 302
integer y = 292
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

type st_4 from statictext within w_oiscenebaldo_r
integer x = 741
integer y = 296
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

type sle_value from singlelineedit within w_oiscenebaldo_r
integer x = 1230
integer y = 288
integer width = 567
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

type cb_1 from commandbutton within w_oiscenebaldo_r
integer x = 1801
integer y = 288
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

type cb_2 from commandbutton within w_oiscenebaldo_r
integer x = 1966
integer y = 288
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

type cb_3 from commandbutton within w_oiscenebaldo_r
integer x = 2130
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiscenebaldo_r
integer x = 2295
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_oiscenebaldo_r
integer x = 919
integer y = 280
integer width = 302
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

