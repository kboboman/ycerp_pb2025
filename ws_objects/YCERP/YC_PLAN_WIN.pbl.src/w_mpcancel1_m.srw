$PBExportHeader$w_mpcancel1_m.srw
$PBExportComments$확정된 생산계획 취소(1998/05/16,곽용덕)
forward
global type w_mpcancel1_m from w_inheritance
end type
type gb_4 from groupbox within w_mpcancel1_m
end type
type dw_3 from datawindow within w_mpcancel1_m
end type
type em_1 from editmask within w_mpcancel1_m
end type
type em_2 from editmask within w_mpcancel1_m
end type
type st_2 from statictext within w_mpcancel1_m
end type
type dw_area from datawindow within w_mpcancel1_m
end type
type st_4 from statictext within w_mpcancel1_m
end type
type st_5 from statictext within w_mpcancel1_m
end type
type ddlb_fld from dropdownlistbox within w_mpcancel1_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpcancel1_m
end type
type st_6 from statictext within w_mpcancel1_m
end type
type ddlb_op from dropdownlistbox within w_mpcancel1_m
end type
type sle_value from singlelineedit within w_mpcancel1_m
end type
type cb_1 from commandbutton within w_mpcancel1_m
end type
type cb_2 from commandbutton within w_mpcancel1_m
end type
type cb_3 from commandbutton within w_mpcancel1_m
end type
type cb_5 from commandbutton within w_mpcancel1_m
end type
type st_7 from statictext within w_mpcancel1_m
end type
type st_vertical from u_splitbar_vertical within w_mpcancel1_m
end type
type st_horizontal from u_splitbar_horizontal within w_mpcancel1_m
end type
end forward

global type w_mpcancel1_m from w_inheritance
integer width = 4334
integer height = 2272
string title = "생산계획 확정취소(w_mpcancel1_m)"
gb_4 gb_4
dw_3 dw_3
em_1 em_1
em_2 em_2
st_2 st_2
dw_area dw_area
st_4 st_4
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_7 st_7
st_vertical st_vertical
st_horizontal st_horizontal
end type
global w_mpcancel1_m w_mpcancel1_m

type variables
string is_dw, is_start, is_end
st_print i_print
boolean ib_sort1 = false , ib_sort2 = false
long  il_row
end variables

forward prototypes
public function boolean wf_sudodet (long arg_row, string as_plan)
end prototypes

public function boolean wf_sudodet (long arg_row, string as_plan);long  ll_cnt
date ld_date
datetime ldt_date

dw_2.accepttext()

select count(*) into :ll_cnt from sfcday 
where order_no = :as_plan and type <> 'N';
if ll_cnt > 0 then
	select max(sfc_date) into :ldt_date from sfcday 
	where order_no = :as_plan and type <> 'N';
	ld_date = date(ldt_date)
	messagebox('오류', string(arg_row) + '번째 자료가 작업이 완료된 항목입니다.~r~n' &
							+ "[" + string(ld_date, 'yyyy/mm/dd') &
							+ "]일자의 작업일보내역을 확인하십시요",exclamation!)
	return false
end if

select count(*) into :ll_cnt from sudodet where order_no = :as_plan;

if ll_cnt > 0 then
	messagebox('오류2',string(arg_row) + '번째 자료가 외주가공이 청구된 물품입니다.~r~n' &
							+ '외주청구 등록및취소 에서 취소후에 작업하십시요',exclamation!)
	return false
end if

select count(*) into :ll_cnt from sudodet1 where order_no = :as_plan;

if ll_cnt > 0 then
	messagebox('오류3',string(arg_row) + '번째 자료가 외주구매가 청구된 물품입니다.~r~n' &
							+ '외주청구 등록및취소 에서 취소후에 작업하십시요',exclamation!)
	return false
end if	
return true
end function

on w_mpcancel1_m.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_area=create dw_area
this.st_4=create st_4
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_7=create st_7
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.st_7
this.Control[iCurrent+19]=this.st_vertical
this.Control[iCurrent+20]=this.st_horizontal
end on

on w_mpcancel1_m.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_7)
destroy(this.st_vertical)
destroy(this.st_horizontal)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_3)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_3)
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')
is_start  = em_1.text
is_end    = em_2.text

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_1.insertrow(0)

/////////////////////////////////////
// 사업장변경시 작업장 필터링
/////////////////////////////////////
DataWindowChild ldwc_wc1

// 작업 필터링
dw_1.getchild("wc_no", ldwc_wc1)
ldwc_wc1.settransobject(sqlca)
ldwc_wc1.setfilter( "area_no = '" + gs_area + "'" )
ldwc_wc1.filter()
ldwc_wc1.setsort( "work_type A, wc_no A" )
ldwc_wc1.sort()

IF GF_PERMISSION("생산계획확정취소", gs_userid) = "Y" THEN
ELSE
	PB_SAVE.VISIBLE = FALSE
	MessageBox("사업장권한","'생산계획확정취소' 권한이 존재하지 않습니다.")
END IF

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_3.x + dw_3.width
st_vertical.height = dw_3.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_3.x

st_horizontal.y      = dw_3.y + dw_3.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_mpcancel1_m
integer x = 3072
integer y = 72
integer taborder = 50
end type

event pb_save::clicked;//
long   ll_rowcount, ll_row, ll_cnt, l_count
int    li_seq, li_division, li_operation
string ls_plan, ls_wc, ls_sale, ls_item, ls_qa, ls_sujutype, ls_chk
real   lr_orderqty, lr_qty, lr_solqty, lr_planqty, lr_rlseqty, lr_diffqty

dw_1.accepttext()
dw_2.accepttext()

ll_rowcount = dw_2.deletedcount()
for ll_row = 1 to ll_rowcount
	ls_plan = trim(dw_2.getitemstring(ll_row,"plan_no",delete!,true))
	if wf_sudodet(ll_row, ls_plan) = false then return
next

ls_wc = trim(dw_1.object.wc_no[1])
ll_rowcount = dw_2.deletedcount()
for ll_row = 1 to ll_rowcount
	
	ls_sale      = trim(dw_2.GetItemstring(ll_row,"sale_no", Delete!, TRUE))
	li_seq       = dw_2.GetItemnumber(ll_row,"seq_no", Delete!, TRUE)
	ls_item      = trim(dw_2.GetItemstring(ll_row,"item_no", Delete!, TRUE))
	ls_qa        = trim(dw_2.GetItemstring(ll_row,"qa", Delete!, TRUE))
	lr_orderqty  = dw_2.GetItemnumber(ll_row,"order_qty", Delete!, TRUE)
	li_division  = dw_2.GetItemnumber(ll_row,"division", Delete!, TRUE)
	ls_sujutype  = trim(dw_2.getitemstring(ll_row,"suju_type",delete!,true)) 
	ls_plan      = trim(dw_2.getitemstring(ll_row,"plan_no",delete!,true))
	li_operation = dw_2.GetItemnumber(ll_row,"operation", Delete!, TRUE)
//-------------------------------------------------------------------------------------------
	select order_qty into  :lr_orderqty 
	   from routtempnew
	 where operation = :li_operation 
	 	and division = :li_division  and wc_no = :ls_wc 
	 	and sale_no = :ls_sale       and seq_no = :li_seq
	   and assy_item = :ls_item     and assy_qa = :ls_qa;
		
	if li_division = 1 then
		
		if ls_sujutype = 'E' or ls_sujutype = 'Y' then // 2004/08/21 부로 'Y'로 통합
		
			l_count = 0
			
			 select count(*)
			   into :l_count
			   from saledet
			 where order_no = :ls_sale and seq_no = :li_seq;		
		
			/*2020-04-18 jowonsuk 수주가 있는지 없는지*/
			if l_count > 0 then 
				
				 select isnull(order_qty,0), isnull(sol_qty,0), isnull(plan_qty,0), isnull(rlse_qty,0),saledet_text
					into :lr_qty,:lr_solqty,:lr_planqty,:lr_rlseqty,:ls_chk
					from saledet
				 where order_no = :ls_sale and seq_no = :li_seq;
				 
				 if sqlca.sqldbcode <> 0 then
					 messagebox('오류4','[pb_save][saledet] select중 DB오류가 발생했습니다.',exclamation!)
					 rollback;
					 return
				 end if
		 
				 lr_diffqty = (lr_solqty + lr_planqty + lr_rlseqty) - lr_orderqty
				 
				 if lr_diffqty = 0 then
					 ls_chk = 'N'
				 else
					 if ls_chk = 'S' then 
						 ls_chk = 'P'
					 else
						 ls_chk = 'Q'
					 end if
				 end if
				// saledet_text = "N" : 미계획.
				// saledet_text = "S" : 미계획.
				// saledet_text = "P" : 미계획.
				// saledet_text = "Q" : 미계획.
				// saledet_text = "X" : 미계획.
				
				 update saledet 
					 set plan_qty = plan_qty - :lr_orderqty 
						, saledet_text = :ls_chk
						, plan_close = null
				  where order_no = :ls_sale and seq_no = :li_seq;
				  
				 if sqlca.sqldbcode <> 0 then
					 messagebox('오류5','[pb_save][saledet] update중 DB오류가 발생했습니다.',exclamation!)
					 rollback;
					 return 
				 end if	
				 
			end if
			
		end if
	 end if
//-------------------------------------------------------------------------------------------
    update routtempnew 
	    set plan_flag = 'N' 
	  where operation = :li_operation  and wc_no = :ls_wc 
	 	and sale_no = :ls_sale 	 	and seq_no = :li_seq 
	   and assy_item = :ls_item 	and assy_qa = :ls_qa 
		and division = :li_division;
	 if sqlca.sqlcode < 0 then
		 messagebox('오류6',sqlca.sqlerrtext,exclamation!)
		 rollback;
		 return
	 end if	 
next

if dw_2.rowcount() < 1 then
	dw_1.deleterow(0)
end if

if wf_update2(dw_1,dw_2,'Y') = true then
	pb_retrieve.postevent(clicked!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_mpcancel1_m
integer x = 1742
integer y = 456
integer width = 2478
integer height = 412
integer taborder = 90
string dataobject = "d_mpsale_m"
boolean hscrollbar = false
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_mpcancel1_m
integer x = 32
integer y = 20
integer width = 1193
integer height = 136
string text = "생산계획 확정취소"
end type

type st_tips from w_inheritance`st_tips within w_mpcancel1_m
integer x = 805
integer y = 0
end type

type pb_compute from w_inheritance`pb_compute within w_mpcancel1_m
boolean visible = false
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpcancel1_m
boolean visible = false
integer x = 2697
integer y = 312
integer width = 457
integer height = 88
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_mpcancel1_m
integer x = 3278
integer y = 72
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpcancel1_m
boolean visible = false
integer x = 3159
integer y = 312
integer width = 457
integer height = 88
integer taborder = 160
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpcancel1_m
boolean visible = false
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_mpcancel1_m
integer x = 2880
integer y = 72
integer taborder = 180
end type

event pb_delete::clicked;//
long   ll_row
string ls_plan

dw_2.accepttext()

/* 2021-03-03 jowonsuk 다중선택 가능토록 개선
 ll_row = dw_2.getrow()
 if ll_row < 1 then return
*/

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
/*2021-03-03 jowonsuk 다중선택 가능토록 개선.시작*/
for ll_row = dw_2.rowcount() to 1 step -1
	
	if dw_2.IsSelected(ll_row)	 then

		ls_plan = dw_2.object.plan_no[ll_row]
		if wf_sudodet(ll_row, ls_plan) = false then return
		
		if dw_2.object.pop_status[ll_row] <> '2' then
			dw_2.deleterow(ll_row)
		else
			messagebox('오류',string(ll_row) + '번째 자료가 pop작업지시된상태입니다.~r~n' &
									+ '반송후 작업하십시요',exclamation!)
		end if
		
	end if
	
next	
/*2021-03-03 jowonsuk 다중선택 가능토록 개선.끝*/
end event

type pb_insert from w_inheritance`pb_insert within w_mpcancel1_m
boolean visible = false
integer x = 2683
integer y = 60
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpcancel1_m
integer x = 2683
integer y = 72
integer taborder = 30
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long  ll_row

is_end   = em_2.text
is_start = em_1.text

dw_1.reset()
dw_2.reset()
dw_3.reset()
ll_row = dw_3.retrieve(date(is_start), date(is_end), dw_area.object.area[1])
if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpcancel1_m
integer x = 32
integer y = 256
integer width = 4187
integer height = 184
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_mpcancel1_m
integer x = 1870
integer y = 16
integer width = 754
integer height = 228
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 16711680
boolean righttoleft = true
end type

type gb_1 from w_inheritance`gb_1 within w_mpcancel1_m
integer x = 2647
integer y = 16
integer width = 855
integer height = 228
integer taborder = 60
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpcancel1_m
integer x = 32
integer y = 1068
integer width = 4187
integer height = 1056
integer taborder = 100
string dataobject = "d_mpsaledet4_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_2::doubleclicked;call super::doubleclicked;/*2021-03-03 jowonsuk 다중선택 가능토록 개선.시작*/
long ll_selrow, ll_cnt
	
if keydown(keyshift!)then				// 다중선택
	ll_selrow = this.GetSelectedRow(il_row -1)
	if ll_selrow > 0 then
		for ll_cnt = min(ll_selrow,row) + 1 to max(ll_selrow, row)
			this.SelectRow(ll_cnt,true)
		next
	else
		this.SelectRow(row,true)
	end if
		
else											// 개별선택
	this.SelectRow(row, NOT this.IsSelected(row))
end if
	
il_row = row	
/*2021-03-03 jowonsuk 다중선택 가능토록 개선.끝*/
end event

type gb_4 from groupbox within w_mpcancel1_m
integer x = 1266
integer y = 16
integer width = 585
integer height = 228
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_3 from datawindow within w_mpcancel1_m
integer x = 32
integer y = 456
integer width = 1637
integer height = 568
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_mpcancel_t"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long   ll_row
string ls_order, ls_colx

ll_row = this.getrow()
if ll_row < 1 then return

ls_order = this.object.order_no[ll_row]
   
dw_1.retrieve(ls_order)
dw_2.retrieve(ls_order)
//ls_colx = dw_2.object.qa.x
//dw_2.object.datawindow.horizontalscrollsplit= ls_colx	

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_1 from editmask within w_mpcancel1_m
integer x = 2208
integer y = 64
integer width = 375
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	em_2.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpcancel1_m
integer x = 2208
integer y = 148
integer width = 375
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_mpcancel1_m
integer x = 1902
integer y = 64
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "계획일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpcancel1_m
integer x = 1298
integer y = 144
integer width = 521
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

/////////////////////////////////////
// 사업장변경시 작업장 필터링
/////////////////////////////////////
DataWindowChild ldwc_wc1
string  ls_area

ls_area = trim(data)

// 작업 필터링
dw_1.getchild("wc_no", ldwc_wc1)
ldwc_wc1.settransobject(sqlca)
ldwc_wc1.setfilter( "area_no = '" + ls_area + "'" )
ldwc_wc1.filter()
ldwc_wc1.setsort( "work_type A, wc_no A" )
ldwc_wc1.sort()

end event

type st_4 from statictext within w_mpcancel1_m
integer x = 46
integer y = 192
integer width = 466
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "생산계획확정취소"
boolean focusrectangle = false
end type

type st_5 from statictext within w_mpcancel1_m
integer x = 78
integer y = 336
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

type ddlb_fld from dropdownlistbox within w_mpcancel1_m
integer x = 265
integer y = 320
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

type ddlb_dwtitles from dropdownlistbox within w_mpcancel1_m
integer x = 297
integer y = 332
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

type st_6 from statictext within w_mpcancel1_m
integer x = 736
integer y = 336
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

type ddlb_op from dropdownlistbox within w_mpcancel1_m
integer x = 905
integer y = 320
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

type sle_value from singlelineedit within w_mpcancel1_m
integer x = 1225
integer y = 324
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

type cb_1 from commandbutton within w_mpcancel1_m
integer x = 1797
integer y = 324
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpcancel1_m
integer x = 1961
integer y = 324
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpcancel1_m
integer x = 2126
integer y = 324
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpcancel1_m
integer x = 2290
integer y = 324
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw_3
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_7 from statictext within w_mpcancel1_m
integer x = 1298
integer y = 64
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

type st_vertical from u_splitbar_vertical within w_mpcancel1_m
integer x = 1696
integer y = 456
integer height = 568
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_mpcancel1_m
integer x = 32
integer y = 1036
integer width = 4187
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_3.height

end event

