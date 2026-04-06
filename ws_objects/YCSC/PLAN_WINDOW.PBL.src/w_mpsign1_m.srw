$PBExportHeader$w_mpsign1_m.srw
$PBExportComments$생산계획확정(1998/04/06,곽용덕)
forward
global type w_mpsign1_m from w_inheritance
end type
type gb_4 from groupbox within w_mpsign1_m
end type
type dw_3 from datawindow within w_mpsign1_m
end type
type dw_4 from datawindow within w_mpsign1_m
end type
type cbx_1 from checkbox within w_mpsign1_m
end type
type dw_area from datawindow within w_mpsign1_m
end type
type st_3 from statictext within w_mpsign1_m
end type
end forward

global type w_mpsign1_m from w_inheritance
integer width = 4603
integer height = 2624
string title = "생산계획 확정관리(외주)(w_mpsign1_m)"
gb_4 gb_4
dw_3 dw_3
dw_4 dw_4
cbx_1 cbx_1
dw_area dw_area
st_3 st_3
end type
global w_mpsign1_m w_mpsign1_m

type variables
st_print i_print
end variables

on w_mpsign1_m.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.dw_area=create dw_area
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.st_3
end on

on w_mpsign1_m.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.dw_area)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

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
gb_2.width  = this.width  - 114
gb_2.height = 728

gb_4.width  = this.width  - 114
gb_4.height = this.height - 1124

dw_2.width  = this.width  - 187
dw_2.height = this.height - 1224

end event

type pb_save from w_inheritance`pb_save within w_mpsign1_m
integer x = 4105
integer y = 56
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_cnt, ll_row, ll_div, i, ll_mod
string ls_wc, ls_sale, ls_plan, ls_item, ls_qa, ls_chk
date ld_date
int li_seq, li_division, li_operation
real lr_orderqty, lr_sumtime, lr_qty, lr_solqty, lr_planqty, lr_rlseqty, lr_diffqty
time lt_time
datetime ldt_datetime

for ll_cnt = 1 to dw_4.rowcount()
	if dw_4.isselected(ll_cnt) then
		dw_4.scrolltorow(ll_cnt)
		dw_1.accepttext()
		dw_2.accepttext()

		ld_date = date(dw_1.object.start_date[1])
		ls_wc = trim(dw_1.object.wc_no[1])
		ll_row = dw_2.rowcount()

		for i = 1 to ll_row 
			 ls_sale = trim(dw_2.object.sale_no[i])
			 if MidA(ls_sale,1,2) = 'NO' then continue
			 ls_plan = trim(dw_2.object.plan_no[i])
			 ls_item = trim(dw_2.object.item_no[i])
			 ls_qa   = trim(dw_2.object.qa[i])
			 li_seq  = dw_2.object.seq_no[i]
			 li_division = dw_2.object.division[i]
			 lr_orderqty = dw_2.object.order_qty[i]
			 
			 lr_sumtime = dw_2.object.aaa[i]
			 ll_div = long(lr_sumtime / 510)
			 ll_mod = long(mod(lr_sumtime,510)) * 60
			 
			 ld_date = RelativeDate(ld_date, ll_div)
			 lt_time = RelativeTime(08:30:00, ll_mod)
			 ldt_datetime = datetime(ld_date,lt_time)
		    
			 select operation into :li_operation from routtempnew
			 where division = :li_division and wc_no = :ls_wc and sale_no = :ls_sale and seq_no = :li_seq
			   and assy_item = :ls_item and assy_qa = :ls_qa;
			 if li_operation = 1 then	
				select order_qty,sol_qty,plan_qty,rlse_qty,saledet_text
					into :lr_qty,:lr_solqty,:lr_planqty,:lr_rlseqty,:ls_chk
					from saledet
						where order_no = :ls_sale and seq_no = :li_seq;
						if sqlca.sqlcode <> 0 then
					messagebox('오류1',STRING(i) + SQLCA.SQLERRTEXT,exclamation!)
					rollback;
					return
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

				update saledet set plan_qty = plan_qty + :lr_orderqty , saledet_text = :ls_chk,
								  plan_close = :ldt_datetime
				where order_no = :ls_sale and seq_no = :li_seq;
				if sqlca.sqldbcode <> 0 then
					messagebox('오류2',SQLCA.SQLERRTEXT,exclamation!)
					rollback;
					return 
				end if	
			else
				update saledet set plan_close = :ldt_datetime
				where order_no = :ls_sale and seq_no = :li_seq;
				if sqlca.sqldbcode <> 0 then
					messagebox('오류5',SQLCA.SQLERRTEXT,exclamation!)
					rollback;
					return 
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
integer x = 1211
integer y = 364
integer width = 3264
integer height = 412
integer taborder = 50
string dataobject = "d_mpsale_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_mpsign1_m
integer x = 64
integer y = 1052
integer width = 4416
integer height = 1400
integer taborder = 80
string dataobject = "d_mpsaledet4_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_mpsign1_m
integer width = 1509
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
integer x = 4297
integer y = 56
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpsign1_m
integer x = 3909
integer y = 56
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
integer x = 3712
integer y = 56
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
integer x = 3067
integer y = 16
integer width = 590
integer height = 204
integer taborder = 90
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "사업장"
end type

type gb_2 from w_inheritance`gb_2 within w_mpsign1_m
integer y = 232
integer width = 4489
integer height = 728
integer taborder = 110
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpsign1_m
integer x = 3675
integer y = 16
integer width = 846
end type

type gb_4 from groupbox within w_mpsign1_m
integer x = 32
integer y = 984
integer width = 4489
integer height = 1500
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "생산계획내역"
end type

type dw_3 from datawindow within w_mpsign1_m
integer x = 1614
integer y = 80
integer width = 114
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_mpsign_r"
boolean livescroll = true
end type

type dw_4 from datawindow within w_mpsign1_m
integer x = 64
integer y = 364
integer width = 1138
integer height = 568
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

event clicked;long ll_row,ll_rowcount,i
dwItemStatus l_status

if this.rowcount() < 1 then return

ll_row = row
if ll_row < 1 then return
this.SelectRow(ll_row, NOT this.IsSelected(ll_row))
end event

type cbx_1 from checkbox within w_mpsign1_m
integer x = 1221
integer y = 860
integer width = 480
integer height = 76
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
integer x = 3104
integer y = 96
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

type st_3 from statictext within w_mpsign1_m
integer x = 78
integer y = 288
integer width = 146
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "정렬"
alignment alignment = center!
boolean focusrectangle = false
end type

