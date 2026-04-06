$PBExportHeader$w_mpdelete_m.srw
$PBExportComments$마감된생산계획삭제(1998/05/16,곽용덕)
forward 
global type w_mpdelete_m from w_inheritance
end type
type gb_15 from groupbox within w_mpdelete_m
end type
type gb_4 from groupbox within w_mpdelete_m
end type
type dw_area from datawindow within w_mpdelete_m
end type
type st_1 from statictext within w_mpdelete_m
end type
type st_3 from statictext within w_mpdelete_m
end type
type ddlb_fld from dropdownlistbox within w_mpdelete_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpdelete_m
end type
type st_4 from statictext within w_mpdelete_m
end type
type ddlb_op from dropdownlistbox within w_mpdelete_m
end type
type sle_value from singlelineedit within w_mpdelete_m
end type
type cb_1 from commandbutton within w_mpdelete_m
end type
type cb_2 from commandbutton within w_mpdelete_m
end type
type cb_3 from commandbutton within w_mpdelete_m
end type
type cb_5 from commandbutton within w_mpdelete_m
end type
type st_2 from statictext within w_mpdelete_m
end type
end forward

global type w_mpdelete_m from w_inheritance
integer width = 4530
integer height = 2560
string title = "생산주문 삭제(마감)(w_mpdelete_m)"
long backcolor = 77897888
gb_15 gb_15
gb_4 gb_4
dw_area dw_area
st_1 st_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_2 st_2
end type
global w_mpdelete_m w_mpdelete_m

type variables
string is_select,is_where,is_clause
end variables

on w_mpdelete_m.create
int iCurrent
call super::create
this.gb_15=create gb_15
this.gb_4=create gb_4
this.dw_area=create dw_area
this.st_1=create st_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_15
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.st_2
end on

on w_mpdelete_m.destroy
call super::destroy
destroy(this.gb_15)
destroy(this.gb_4)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

is_select = dw_1.Describe("DataWindow.Table.Select")

dw_2.visible = false

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 69
dw_1.height = newheight - 464

end event

type pb_save from w_inheritance`pb_save within w_mpdelete_m
boolean visible = false
integer x = 3003
integer y = 56
end type

event pb_save::clicked;call super::clicked;wf_update2(dw_1,dw_2,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_mpdelete_m
integer x = 32
integer y = 432
integer width = 4425
integer height = 1992
integer taborder = 60
string dataobject = "d_mpheder_t"
boolean hscrollbar = false
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;datawindowchild ldwc_supp
string ls_suppname

choose case dwo.name
	case 'supp_no'
		  this.getchild('supp_no',ldwc_supp)
		  ls_suppname = trim(ldwc_supp.getitemstring(ldwc_supp.getrow(),'supp_name'))
		  this.object.supp_supp_name[1] = ls_suppname
end choose
end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_mpdelete_m
integer x = 41
integer width = 1408
string text = "생산주문 삭제(마감)"
end type

type st_tips from w_inheritance`st_tips within w_mpdelete_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpdelete_m
integer x = 4032
integer y = 64
integer taborder = 100
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"마감",parent, li_x, li_y)

end event

event pb_compute::clicked;//
long    ll_row, i, ll_rowcount,j
string  ls_order, ls_wc, ls_sale, ls_plan, ls_item, ls_qa, ls_sqlerrtext
integer li_ret, li_seq, li_division

li_ret = MessageBox("확인", "마감된 생산계획을 삭제하시겠습니까?",information!, OKCancel!, 2)						  
if li_ret = 2 then RETURN      

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ll_row = dw_1.rowcount()
OPEN(W_ICPROCESS)
	 
for i = 1 to ll_row
	w_icprocess.hpb_1.position = (i / ll_row) * 100
	
	ls_order    = trim(dw_1.object.order_no[i])
   ll_rowcount = dw_2.retrieve(ls_order)
	
	for j = 1 to ll_rowcount
		li_division = dw_2.object.division[j]
		ls_plan     = trim(dw_2.object.plan_no[j])
		ls_item     = trim(dw_2.object.item_no[j])
		ls_qa       = trim(dw_2.object.qa[j])
		ls_wc       = trim(dw_2.object.wc_no[j])
		ls_sale     = trim(dw_2.object.sale_no[j])
		li_seq      = dw_2.object.seq_no[j]
		
	   DELETE FROM routtempnew 
		 WHERE division = :li_division AND sale_no = :ls_sale AND seq_no = :li_seq
		   AND assy_item = :ls_item    AND assy_qa = :ls_qa   AND wc_no = :ls_wc;
   	if sqlca.sqlcode < 0 then
	   	MessageBox("오류", "공정관리테이블(routtempnew)에서 데이터 삭제중~r~n" & 
			                   + "DB 오류가 발생했습니다." ,exclamation!)
		   ROLLBACK;
		   RETURN
	   end if
		
		DELETE FROM sudodet WHERE order_no = :ls_plan;
   	if sqlca.sqlcode < 0 then
	   	MessageBox("오류", "외주가공테이블(Sudodet)에서 데이터 삭제중~r~n" & 
			                   + "DB 오류가 발생했습니다." ,exclamation!)
		   ROLLBACK;
		   RETURN
	   end if
		
		DELETE FROM sudodet1 WHERE order_no = :ls_plan;
   	if sqlca.sqlcode < 0 then
	   	MessageBox("오류", "외주구매테이블(Sudodet1)에서 데이터 삭제중~r~n" & 
			                   + "DB 오류가 발생했습니다." ,exclamation!)
		   ROLLBACK;
		   RETURN
	   end if		
	next
	
	
	DELETE FROM mps WHERE order_no LIKE :ls_order;
	if sqlca.sqlcode < 0 then
   	MessageBox("오류", "생산계획헤더테이블(Mps)에서 데이터 삭제중~r~n" & 
			                   + "DB 오류가 발생했습니다." ,exclamation!)
		ROLLBACK;
		RETURN
	end if

	DELETE FROM mpsdet WHERE order_no LIKE :ls_order;
	if sqlca.sqlcode < 0 then
   	MessageBox("오류", "생산계획디테일테이블(Mpsdet)에서 데이터 삭제중~r~n" & 
			        + "DB 오류가 발생했습니다." ,exclamation!)
		ROLLBACK;
		RETURN
	end if	
next
////////////////////////////////////////////
COMMIT;
////////////////////////////////////////////

close(W_ICPROCESS)
dw_1.reset()
MessageBox("확인", "삭제완료 되었습니다." ,information!)

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpdelete_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpdelete_m
integer x = 4229
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpdelete_m
boolean visible = false
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpdelete_m
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpdelete_m
boolean visible = false
integer x = 2811
integer y = 56
integer taborder = 140
end type

event pb_delete::clicked;call super::clicked;if dw_1.rowcount() < 1 then return
dw_1.RowsMove(1, dw_1.rowcount(), Primary!,  dw_1, 1, Delete!)

if dw_2.rowcount() < 1 then return
dw_2.RowsMove(1, dw_2.rowcount(), Primary!,  dw_2, 1, Delete!)
end event

type pb_insert from w_inheritance`pb_insert within w_mpdelete_m
boolean visible = false
integer x = 2619
integer y = 56
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpdelete_m
integer x = 3835
integer y = 64
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_where lstr_name
string ls_where

lstr_name.chk  = 'N'
lstr_name.name = 'w_mpdelete_m'

openwithparm(w_whymd_w,lstr_name)

lstr_name = Message.PowerObjectParm	

if lstr_name.chk = 'Y' then
	gb_2.text = "계획기간 : " + lstr_name.str1 + " 에서 " + lstr_name.str2
	is_clause = " where mps.start_date between ~~'" + lstr_name.str1 + "~~' and ~~'" +lstr_name.str2 + "~~'" &
	          + "   and mps.open_close = ~~'C~~'" + " and mps.area_no = ~~'" + trim(dw_area.object.area[1]) + "~~'"
	ls_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"
	wf_retrieve(dw_1,ls_where)
else
	return
end if








end event

type gb_3 from w_inheritance`gb_3 within w_mpdelete_m
boolean visible = false
integer x = 2094
integer y = 48
integer width = 338
integer height = 156
integer taborder = 80
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_mpdelete_m
integer y = 240
integer width = 4425
integer height = 172
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpdelete_m
boolean visible = false
integer x = 2555
integer y = 4
integer width = 91
integer taborder = 50
end type

type dw_2 from w_inheritance`dw_2 within w_mpdelete_m
integer x = 1605
integer y = 48
integer width = 672
integer height = 152
integer taborder = 70
string dataobject = "d_mpsaledet4_m"
boolean vscrollbar = false
end type

type gb_15 from groupbox within w_mpdelete_m
integer x = 3173
integer y = 16
integer width = 590
integer height = 212
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_4 from groupbox within w_mpdelete_m
integer x = 3799
integer y = 16
integer width = 658
integer height = 212
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type dw_area from datawindow within w_mpdelete_m
integer x = 3209
integer y = 132
integer width = 517
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_1 from statictext within w_mpdelete_m
integer x = 3209
integer y = 52
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpdelete_m
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_mpdelete_m
integer x = 274
integer y = 292
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_mpdelete_m
integer x = 306
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

type st_4 from statictext within w_mpdelete_m
integer x = 745
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

type ddlb_op from dropdownlistbox within w_mpdelete_m
integer x = 914
integer y = 292
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpdelete_m
integer x = 1234
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

type cb_1 from commandbutton within w_mpdelete_m
integer x = 1806
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

type cb_2 from commandbutton within w_mpdelete_m
integer x = 1970
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

type cb_3 from commandbutton within w_mpdelete_m
integer x = 2135
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

type cb_5 from commandbutton within w_mpdelete_m
integer x = 2299
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

type st_2 from statictext within w_mpdelete_m
integer x = 2546
integer y = 168
integer width = 599
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "생산계획마감내역"
boolean focusrectangle = false
end type

