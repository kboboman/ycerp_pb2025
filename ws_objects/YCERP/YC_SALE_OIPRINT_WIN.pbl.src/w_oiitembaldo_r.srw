$PBExportHeader$w_oiitembaldo_r.srw
$PBExportComments$제품별 제품출고및 미출고현황(1998/5/14,성삼지)
forward
global type w_oiitembaldo_r from w_inheritance
end type
type st_2 from statictext within w_oiitembaldo_r
end type
type st_1 from statictext within w_oiitembaldo_r
end type
type pb_1 from picturebutton within w_oiitembaldo_r
end type
type st_3 from statictext within w_oiitembaldo_r
end type
type ddlb_fld from dropdownlistbox within w_oiitembaldo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiitembaldo_r
end type
type st_4 from statictext within w_oiitembaldo_r
end type
type sle_value from singlelineedit within w_oiitembaldo_r
end type
type cb_1 from commandbutton within w_oiitembaldo_r
end type
type cb_2 from commandbutton within w_oiitembaldo_r
end type
type cb_3 from commandbutton within w_oiitembaldo_r
end type
type cb_5 from commandbutton within w_oiitembaldo_r
end type
type st_desc from statictext within w_oiitembaldo_r
end type
type ddlb_op from dropdownlistbox within w_oiitembaldo_r
end type
end forward

global type w_oiitembaldo_r from w_inheritance
integer y = 112
integer width = 4722
integer height = 2408
string title = "물품별 출고및 미출고 현황(w_oiitembaldo_r)"
st_2 st_2
st_1 st_1
pb_1 pb_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_desc st_desc
ddlb_op ddlb_op
end type
global w_oiitembaldo_r w_oiitembaldo_r

type variables
string is_sale_flag, is_itemdosql, is_itemdorsql
gs_itembaldo_str ist_code

end variables

on w_oiitembaldo_r.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.pb_1=create pb_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_desc=create st_desc
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.st_desc
this.Control[iCurrent+14]=this.ddlb_op
end on

on w_oiitembaldo_r.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_desc)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

is_itemdosql  = dw_1.describe("datawindow.table.select")
is_itemdorsql = dw_2.describe("datawindow.table.select")
dw_2.visible  = false
end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 87
dw_1.height = newheight - 444


end event

type pb_save from w_inheritance`pb_save within w_oiitembaldo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiitembaldo_r
integer x = 37
integer y = 408
integer width = 4599
integer height = 1860
integer taborder = 0
string dataobject = "d_oiitembaldo_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oiitembaldo_r
integer x = 41
integer y = 44
integer width = 1934
string text = "물품별 출고및 미출고 현황"
end type

type st_tips from w_inheritance`st_tips within w_oiitembaldo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiitembaldo_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiitembaldo_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oiitembaldo_r
integer x = 4421
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiitembaldo_r
integer x = 4229
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_count
w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

FOR ll_count = 1 TO dw_2.rowcount()
   dw_2.object.customer_industry_code[ll_count] = st_1.text
	dw_2.object.customer_bus_cord[ll_count] = ist_code.start_date
	dw_2.object.customer_bus_rep[ll_count] = ist_code.end_date
NEXT

//l_print.name = 'd_oiitemdobal_r'
l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 물품별 출고및 미출고 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiitembaldo_r
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oiitembaldo_r
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oiitembaldo_r
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiitembaldo_r
integer x = 3845
integer taborder = 10
end type

event pb_retrieve::clicked;string ls_sql, ls_where, ls_desc
string ls_custname, ls_custname1
string ls_itemname, ls_itemname1

openwithparm(w_whitembaldo_w, ist_code)
ist_code = message.powerobjectparm
if ist_code.okcancel = 'N' then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//if rb_3.checked = true then
//	ist_code.order_flag = 'A'
//else
//	ist_code.order_flag = 'P'
//	ist_code.start_cust = trim(em_5.text)
//	ist_code.end_cust = trim(em_6.text)
//end if

if ist_code.do_flag = 'Y' then
	st_1.text = "출고/미출고"
   if ist_code.sel_flag = 'A' then
		if ist_code.order_flag = 'A' then
		   ls_where = " and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + &
			           ist_code.start_date + "~~' and " + "~~'" + ist_code.end_date + "~~'"		
			ls_desc = '조건: 출고/물품범위전체/거래처전체~n기간: ' + ist_code.start_date + '-' + ist_code.end_date
		else
		   ls_where = " and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + &
			           ist_code.start_date + "~~' and " + "~~'" + ist_code.end_date + "~~'"	+ &
						  " and sale.cust_no between ~~'" + ist_code.start_cust + "~~' and " + &
						  "~~'" + ist_code.end_cust + "~~'"
			SELECT cust_name INTO :ls_custname  FROM customer WHERE cust_no = :ist_code.start_cust;
			SELECT cust_name INTO :ls_custname1 FROM customer WHERE cust_no = :ist_code.end_cust;			
			ls_desc = '조건: 출고/물품범위전체 거래처:' + ls_custname + '-' + ls_custname1 + '~n기간: ' + ist_code.start_date + '-' + ist_code.end_date
		end if
   else
		if ist_code.order_flag = 'A' then
		   ls_where = " and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
		           ist_code.end_date + "~~' and saledet.item_no between ~~'" + &				
		           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"
			SELECT item_name INTO :ls_itemname  FROM groupitem WHERE item_no = :ist_code.start_no;
			SELECT item_name INTO :ls_itemname1 FROM groupitem WHERE item_no = :ist_code.end_no;
			ls_desc = '조건: 출고/거래처 전체 물품범위:' + ls_itemname + '-' + ls_itemname1 + '~n기간: ' + ist_code.start_date + '-' + ist_code.end_date
		else
		   ls_where = " and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
		   	        ist_code.end_date + "~~' and saledet.item_no between ~~'" + &				
		    	        ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'" 	+ &
						  " and sale.cust_no between ~~'" + ist_code.start_cust + "~~' and " + &
						  "~~'" + ist_code.end_cust + "~~'"
			SELECT cust_name INTO :ls_custname  FROM customer  WHERE cust_no = :ist_code.start_cust;
			SELECT cust_name INTO :ls_custname1 FROM customer  WHERE cust_no = :ist_code.end_cust;			
			SELECT item_name INTO :ls_itemname  FROM groupitem WHERE item_no = :ist_code.start_no;
			SELECT item_name INTO :ls_itemname1 FROM groupitem WHERE item_no = :ist_code.end_no;			
			ls_desc = '조건: 출고 물품범위:' + ist_code.start_no + '-' + ist_code.end_no + ' 거래처:' + ist_code.start_cust + '-' + ist_code.end_cust + '~n기간: ' + ist_code.start_date + '-' + ist_code.end_date
		end if
   end if
else
	st_1.text = "미출고"
   if ist_code.sel_flag = 'A' then
		if ist_code.order_flag = 'A' then
		   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + &
			           ist_code.start_date + "~~' and " + "~~'" + ist_code.end_date + "~~'"		
			ls_desc = '조건: 미출고/물품범위전체/거래처전체~n기간: ' + ist_code.start_date + '-' + ist_code.end_date
		else
		   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + &
			           ist_code.start_date + "~~' and " + "~~'" + ist_code.end_date + "~~'"	+ &	
						  " and sale.cust_no between ~~'" + ist_code.start_cust + "~~' and " + &
						  "~~'" + ist_code.end_cust + "~~'"
			SELECT cust_name INTO :ls_custname  FROM customer WHERE cust_no = :ist_code.start_cust;
			SELECT cust_name INTO :ls_custname1 FROM customer WHERE cust_no = :ist_code.end_cust;			
			ls_desc = '조건: 미출고/물품범위전체 거래처:' + ls_custname + '-' + ls_custname1 + '~n기간: ' + ist_code.start_date + '-' + ist_code.end_date
		end if
   else
		if ist_code.order_flag = 'A' then
		   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
			           ist_code.end_date + "~~' and saledet.item_no between ~~'" + &				
			           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"
			SELECT item_name INTO :ls_itemname  FROM groupitem WHERE item_no = :ist_code.start_no;
			SELECT item_name INTO :ls_itemname1 FROM groupitem WHERE item_no = :ist_code.end_no;
			ls_desc = '조건: 미출고/거래처전체 물품범위:' + ls_itemname + '-' + ls_itemname1 + '~n기간: ' + ist_code.start_date + '-' + ist_code.end_date
		else
		   ls_where = " and saledet.order_qty > saledet.rlse_qty and sale.open_close = ~~'O~~' and sale.due_date between ~~'" + ist_code.start_date + "~~' and ~~'" + &
			           ist_code.end_date + "~~' and saledet.item_no between ~~'" + &				
			           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"	+ &	
						  " and sale.cust_no between ~~'" + ist_code.start_cust + "~~' and " + &
						  "~~'" + ist_code.end_cust + "~~'"
			SELECT cust_name INTO :ls_custname  FROM customer  WHERE cust_no = :ist_code.start_cust;
			SELECT cust_name INTO :ls_custname1 FROM customer  WHERE cust_no = :ist_code.end_cust;			
			SELECT item_name INTO :ls_itemname  FROM groupitem WHERE item_no = :ist_code.start_no;
			SELECT item_name INTO :ls_itemname1 FROM groupitem WHERE item_no = :ist_code.end_no;			
			ls_desc = '조건: 미출고 물품범위:' + ist_code.start_no + '-' + ist_code.end_no + ' 거래처:' + ist_code.start_cust + '-' + ist_code.end_cust + '~n기간: ' + ist_code.start_date + '-' + ist_code.end_date
		end if
   end if
end if
ls_sql = "datawindow.table.select = '" + is_itemdosql + ls_where + "'"

st_desc.text = ls_desc

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_2.modify(ls_sql)
dw_2.settransobject(sqlca)
dw_1.sharedata(dw_2)
dw_1.retrieve()
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if
	
end event

type gb_3 from w_inheritance`gb_3 within w_oiitembaldo_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiitembaldo_r
integer x = 37
integer y = 244
integer width = 4599
integer height = 156
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiitembaldo_r
integer x = 3803
integer y = 8
integer width = 832
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_oiitembaldo_r
integer x = 2235
integer y = 16
integer width = 78
integer height = 64
integer taborder = 0
boolean enabled = false
string dataobject = "d_oiitemdobal_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_2 from statictext within w_oiitembaldo_r
integer x = 2121
integer y = 100
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "조회범위:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_oiitembaldo_r
integer x = 2473
integer y = 100
integer width = 375
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_oiitembaldo_r
event mousemove pbm_mousemove
integer x = 4037
integer y = 52
integer width = 187
integer height = 144
integer taborder = 50
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

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_3 from statictext within w_oiitembaldo_r
integer x = 96
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_oiitembaldo_r
integer x = 283
integer y = 292
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oiitembaldo_r
integer x = 325
integer y = 304
integer width = 311
integer height = 88
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

type st_4 from statictext within w_oiitembaldo_r
integer x = 782
integer y = 308
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

type sle_value from singlelineedit within w_oiitembaldo_r
integer x = 1271
integer y = 300
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oiitembaldo_r
integer x = 1842
integer y = 300
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiitembaldo_r
integer x = 2007
integer y = 300
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

type cb_3 from commandbutton within w_oiitembaldo_r
integer x = 2171
integer y = 300
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiitembaldo_r
integer x = 2336
integer y = 300
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_desc from statictext within w_oiitembaldo_r
integer x = 2510
integer y = 280
integer width = 2085
integer height = 108
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "none"
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_oiitembaldo_r
integer x = 955
integer y = 292
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

