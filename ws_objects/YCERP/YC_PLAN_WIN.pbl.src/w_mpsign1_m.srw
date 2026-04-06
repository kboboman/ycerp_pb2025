$PBExportHeader$w_mpsign1_m.srw
$PBExportComments$생산계획확정(1998/04/06,곽용덕)
forward 
global type w_mpsign1_m from w_inheritance
end type
type dw_3 from datawindow within w_mpsign1_m
end type
type dw_4 from datawindow within w_mpsign1_m
end type
type cbx_1 from checkbox within w_mpsign1_m
end type
type dw_area from datawindow within w_mpsign1_m
end type
type st_1 from statictext within w_mpsign1_m
end type
type st_3 from statictext within w_mpsign1_m
end type
type ddlb_fld from dropdownlistbox within w_mpsign1_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsign1_m
end type
type st_4 from statictext within w_mpsign1_m
end type
type ddlb_op from dropdownlistbox within w_mpsign1_m
end type
type sle_value from singlelineedit within w_mpsign1_m
end type
type cb_1 from commandbutton within w_mpsign1_m
end type
type cb_2 from commandbutton within w_mpsign1_m
end type
type cb_3 from commandbutton within w_mpsign1_m
end type
type cb_5 from commandbutton within w_mpsign1_m
end type
type st_horizontal from u_splitbar_horizontal within w_mpsign1_m
end type
type st_vertical from u_splitbar_vertical within w_mpsign1_m
end type
end forward

global type w_mpsign1_m from w_inheritance
integer width = 4274
integer height = 2276
string title = "생산계획 확정관리(외주)(w_mpsign1_m)"
dw_3 dw_3
dw_4 dw_4
cbx_1 cbx_1
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
st_horizontal st_horizontal
st_vertical st_vertical
end type
global w_mpsign1_m w_mpsign1_m

type variables
st_print i_print
end variables

on w_mpsign1_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cbx_1=create cbx_1
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
this.st_horizontal=create st_horizontal
this.st_vertical=create st_vertical
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.st_horizontal
this.Control[iCurrent+17]=this.st_vertical
end on

on w_mpsign1_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cbx_1)
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
destroy(this.st_horizontal)
destroy(this.st_vertical)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천
dw_4.retrieve(dw_area.object.area[1])

dw_1.insertrow(0)
dw_2.insertrow(0)

dw_1.enabled = false
//dw_2.enabled = false
dw_3.visible = false


IF GF_PERMISSION("생산계획확정관리", gs_userid) = "Y" THEN
ELSE
	PB_SAVE.VISIBLE = FALSE
	MessageBox("권한","'생산계획확정관리' 권한이 존재하지 않습니다.")
END IF

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_3.x

st_horizontal.y      = dw_4.y + dw_4.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_mpsign1_m
integer x = 2642
integer y = 60
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_cnt, ll_row, ll_div, i, ll_mod
string ls_wc, ls_sale, ls_plan, ls_item, ls_qa, ls_chk, ls_sqlerrtext
date   ld_date
int    li_seq, li_division, li_operation
real   lr_orderqty, lr_sumtime, lr_qty, lr_solqty, lr_planqty, lr_rlseqty, lr_diffqty
time   lt_time
datetime ldt_datetime

for ll_cnt = 1 to dw_4.rowcount()
	if dw_4.isselected(ll_cnt) then
		dw_4.scrolltorow(ll_cnt)
		dw_1.accepttext()
		dw_2.accepttext()

		ld_date = date(dw_1.object.start_date[1])
		ls_wc   = trim(dw_1.object.wc_no[1])
		ll_row  = dw_2.rowcount()

		for i = 1 to ll_row 
			 ls_sale = trim(dw_2.object.sale_no[i])
			 if MidA(ls_sale,1,2) = 'NO' then continue
			 
			 ls_plan     = trim(dw_2.object.plan_no[i])
			 ls_item     = trim(dw_2.object.item_no[i])
			 ls_qa       = trim(dw_2.object.qa[i])
			 li_seq      = dw_2.object.seq_no[i]
			 li_division = dw_2.object.division[i]
			 lr_orderqty = dw_2.object.order_qty[i]
			 
			 lr_sumtime  = dw_2.object.aaa[i]
			 ll_div      = long(lr_sumtime / 510)
			 ll_mod      = long(mod(lr_sumtime,510)) * 60
			 
			 ld_date     = RelativeDate(ld_date, ll_div)
			 lt_time     = RelativeTime(08:30:00, ll_mod)
			 ldt_datetime = datetime(ld_date,lt_time)
		    
			 SELECT operation INTO :li_operation FROM routtempnew
			  WHERE division  = :li_division AND wc_no = :ls_wc 
			    AND sale_no   = :ls_sale     AND seq_no  = :li_seq
			    AND assy_item = :ls_item     AND assy_qa = :ls_qa;
				 
			if li_operation = 1 then	
				SELECT order_qty, sol_qty,    plan_qty,    rlse_qty,    saledet_text
				  INTO :lr_qty,   :lr_solqty, :lr_planqty, :lr_rlseqty, :ls_chk
				  FROM saledet
				 WHERE order_no = :ls_sale AND seq_no = :li_seq;
				if sqlca.sqlcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					ROLLBACK;
					MessageBox('오류1',STRING(i) + sqlca.sqlerrtext,exclamation!)
					RETURN
				end if
		 
				lr_diffqty = lr_qty - (lr_solqty + lr_planqty + lr_rlseqty + lr_orderqty)
				if lr_diffqty <= 0 then
					if ls_chk = 'P' then 
						ls_chk = 'S'
					else
						ls_chk = 'Y'
					end if
				else
					if ls_chk = 'N' then
						ls_chk = 'Q'
					end if
				end if

				UPDATE saledet 
				   SET plan_qty = plan_qty + :lr_orderqty, saledet_text = :ls_chk, plan_close = :ldt_datetime	// 수주상황부의 생산완료시점
				 WHERE order_no = :ls_sale AND seq_no = :li_seq;
				if sqlca.sqldbcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					ROLLBACK;
					MessageBox('오류2',ls_sqlerrtext,exclamation!)
					RETURN 
				end if	
			else
				UPDATE saledet 
				   SET plan_close = :ldt_datetime	// 수주상황부의 생산완료시점
				 WHERE order_no = :ls_sale AND seq_no = :li_seq;
				if sqlca.sqldbcode <> 0 then
					ls_sqlerrtext = sqlca.sqlerrtext
					ROLLBACK;
					MessageBox('오류5', ls_sqlerrtext,exclamation!)
					RETURN 
				end if	
			end if
		next
		dw_1.object.open_close[1] = 'P'

		wf_update2(dw_1,dw_2,'Y')
	end if
next
dw_4.retrieve()


end event

event pb_save::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"확정",parent, li_x, li_y)

end event

type dw_1 from w_inheritance`dw_1 within w_mpsign1_m
integer x = 1769
integer y = 444
integer width = 2423
integer height = 484
integer taborder = 50
string dataobject = "d_mpsale_m"
boolean hscrollbar = false
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_mpsign1_m
integer x = 32
integer y = 20
integer width = 1509
integer height = 148
string text = "생산계획 확정관리(외주)"
end type

type st_tips from w_inheritance`st_tips within w_mpsign1_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsign1_m
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsign1_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsign1_m
integer x = 2834
integer y = 60
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpsign1_m
integer x = 2446
integer y = 60
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 생산계획을 출력합니다." 
//i_print.name = "d_mpsign_r"
i_print.yymm1    = trim(dw_1.object.order_no[1])
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=89'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsign1_m
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpsign1_m
boolean visible = false
integer x = 2875
integer y = 60
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpsign1_m
boolean visible = false
integer x = 2683
integer y = 60
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsign1_m
integer x = 2249
integer y = 60
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String ls_area
Long   ll_rows

ls_area = dw_area.object.area[1]
ll_rows = dw_4.retrieve(ls_area)
if ll_rows < 1 then MessageBox("확인","해당하는 데이터가 존재하지 않습니다.")
//
end event

type gb_3 from w_inheritance`gb_3 within w_mpsign1_m
integer x = 32
integer y = 244
integer width = 4160
integer height = 184
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpsign1_m
integer x = 1605
integer y = 12
integer width = 590
integer height = 216
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpsign1_m
integer x = 2213
integer width = 846
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsign1_m
integer x = 32
integer y = 984
integer width = 4165
integer height = 1160
integer taborder = 80
string dataobject = "d_mpsaledet4_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_3 from datawindow within w_mpsign1_m
integer x = 41
integer y = 184
integer width = 87
integer height = 64
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_mpsign_r"
boolean livescroll = true
end type

type dw_4 from datawindow within w_mpsign1_m
integer x = 32
integer y = 444
integer width = 1687
integer height = 488
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_mpsign_t"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row
string ls_order, ls_colx

ll_row = this.getrow()
if ll_row < 1 then return

ls_order = this.object.mps_order_no[ll_row]
   
dw_1.retrieve(ls_order)
dw_2.retrieve(ls_order)
ls_colx = dw_2.object.qa.x
dw_2.object.datawindow.horizontalscrollsplit= ls_colx	

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
this.SelectRow(row, NOT this.IsSelected(row))

end event

type cbx_1 from checkbox within w_mpsign1_m
integer x = 2528
integer y = 320
integer width = 375
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;
if dw_4.rowcount() < 1 then return
if this.checked = true then
	dw_4.SelectRow(0, true)
else
	dw_4.SelectRow(0, false)
end if

end event

type dw_area from datawindow within w_mpsign1_m
integer x = 1637
integer y = 132
integer width = 526
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_1 from statictext within w_mpsign1_m
integer x = 1637
integer y = 52
integer width = 521
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

type st_3 from statictext within w_mpsign1_m
integer x = 82
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_mpsign1_m
integer x = 270
integer y = 308
integer width = 448
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

type ddlb_dwtitles from dropdownlistbox within w_mpsign1_m
integer x = 311
integer y = 320
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

type st_4 from statictext within w_mpsign1_m
integer x = 768
integer y = 324
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

type ddlb_op from dropdownlistbox within w_mpsign1_m
integer x = 937
integer y = 308
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

type sle_value from singlelineedit within w_mpsign1_m
integer x = 1257
integer y = 312
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

type cb_1 from commandbutton within w_mpsign1_m
integer x = 1829
integer y = 312
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

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpsign1_m
integer x = 1993
integer y = 312
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

arg_dw  = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsign1_m
integer x = 2158
integer y = 312
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

arg_dw  = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsign1_m
integer x = 2322
integer y = 312
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

arg_dw  = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_horizontal from u_splitbar_horizontal within w_mpsign1_m
integer x = 32
integer y = 948
integer width = 4165
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

type st_vertical from u_splitbar_vertical within w_mpsign1_m
integer x = 1737
integer y = 444
integer height = 488
boolean bringtotop = true
end type

