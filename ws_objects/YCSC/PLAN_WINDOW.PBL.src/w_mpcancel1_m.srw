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
type st_1 from statictext within w_mpcancel1_m
end type
type st_2 from statictext within w_mpcancel1_m
end type
type dw_area from datawindow within w_mpcancel1_m
end type
type st_3 from statictext within w_mpcancel1_m
end type
type st_4 from statictext within w_mpcancel1_m
end type
type gb_5 from gb_3 within w_mpcancel1_m
end type
end forward

global type w_mpcancel1_m from w_inheritance
integer width = 4603
integer height = 2624
string title = "생산계획 확정취소(w_mpcancel1_m)"
gb_4 gb_4
dw_3 dw_3
em_1 em_1
em_2 em_2
st_1 st_1
st_2 st_2
dw_area dw_area
st_3 st_3
st_4 st_4
gb_5 gb_5
end type
global w_mpcancel1_m w_mpcancel1_m

type variables
string is_start, is_end
st_print i_print
boolean ib_sort1 = false , ib_sort2 = false
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
this.st_1=create st_1
this.st_2=create st_2
this.dw_area=create dw_area
this.st_3=create st_3
this.st_4=create st_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.gb_5
end on

on w_mpcancel1_m.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')
is_start  = em_1.text
is_end    = em_2.text

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_1.insertrow(0)
IF GF_PERMISSION("생산계획확정취소", gs_userid) = "Y" THEN
ELSE
	PB_SAVE.VISIBLE = FALSE
	MessageBox("사업장권한","'생산계획확정취소' 권한이 존재하지 않습니다.")
END IF

end event

event resize;call super::resize;//
gb_5.width  = this.width  - 114
gb_5.height = 728

gb_3.width  = this.width  - 114
gb_3.height = this.height - 1124

dw_2.width  = this.width  - 187
dw_2.height = this.height - 1224

end event

type pb_save from w_inheritance`pb_save within w_mpcancel1_m
integer x = 4101
integer y = 56
integer taborder = 50
end type

event pb_save::clicked;long ll_rowcount, ll_row, ll_cnt
int li_seq, li_division, li_operation
string ls_plan, ls_wc, ls_sale, ls_item, ls_qa, ls_sujutype, ls_chk
real lr_orderqty, lr_qty, lr_solqty, lr_planqty, lr_rlseqty, lr_diffqty

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
	 ls_sale = trim(dw_2.GetItemstring(ll_row,"sale_no", Delete!, TRUE))
	 li_seq  = dw_2.GetItemnumber(ll_row,"seq_no", Delete!, TRUE)
    ls_item = trim(dw_2.GetItemstring(ll_row,"item_no", Delete!, TRUE))
    ls_qa   = trim(dw_2.GetItemstring(ll_row,"qa", Delete!, TRUE))
	 lr_orderqty = dw_2.GetItemnumber(ll_row,"order_qty", Delete!, TRUE)
	 li_division = dw_2.GetItemnumber(ll_row,"division", Delete!, TRUE)
	 ls_sujutype = trim(dw_2.getitemstring(ll_row,"suju_type",delete!,true)) 
	 ls_plan = trim(dw_2.getitemstring(ll_row,"plan_no",delete!,true))
	 li_operation = dw_2.GetItemnumber(ll_row,"operation", Delete!, TRUE)
//-------------------------------------------------------------------------------------------
	 select order_qty into  :lr_orderqty from routtempnew
	 where operation = :li_operation 
	 	and division = :li_division 
	 	and wc_no = :ls_wc 
	 	and sale_no = :ls_sale 
	 	and seq_no = :li_seq
	   and assy_item = :ls_item 
		and assy_qa = :ls_qa;
	 if li_division = 1 then
		if ls_sujutype = 'E' or ls_sujutype = 'Y' then // 2004/08/21 부로 'Y'로 통합
			 select order_qty,sol_qty,plan_qty,rlse_qty,saledet_text
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
			
			 update saledet set plan_qty = plan_qty - :lr_orderqty , saledet_text = :ls_chk,
							  plan_close = null
			 where order_no = :ls_sale and seq_no = :li_seq;
			 if sqlca.sqldbcode <> 0 then
				 messagebox('오류5','[pb_save][saledet] update중 DB오류가 발생했습니다.',exclamation!)
				 rollback;
				 return 
			 end if	
		end if
	 end if
//-------------------------------------------------------------------------------------------
    update routtempnew set plan_flag = 'N' 
	  where operation = :li_operation 
	 	and wc_no = :ls_wc 
	 	and sale_no = :ls_sale 
	 	and seq_no = :li_seq 
	   and assy_item = :ls_item 
		and assy_qa = :ls_qa 
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
integer x = 1211
integer y = 364
integer width = 3264
integer height = 412
integer taborder = 90
string dataobject = "d_mpsale_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type dw_2 from w_inheritance`dw_2 within w_mpcancel1_m
integer x = 64
integer y = 1052
integer width = 4416
integer height = 1400
integer taborder = 100
string dataobject = "d_mpsaledet4_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_mpcancel1_m
integer x = 50
integer y = 32
integer width = 1202
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
integer x = 283
integer y = 272
integer width = 457
integer height = 88
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계획번호"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::clicked;if ib_sort1 = true then
	DW_3.SETSORT('order_no A')
	dw_3.sort()
	ib_sort1 = false
else
	DW_3.SETSORT('order_no D')
	dw_3.sort()
	ib_sort1 = true
end if
end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_mpcancel1_m
integer x = 4306
integer y = 56
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpcancel1_m
integer x = 745
integer y = 272
integer width = 457
integer height = 88
integer taborder = 160
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업장"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;if ib_sort2 = true then
	DW_3.SETSORT('work_name A, order_no A')
	dw_3.sort()
	ib_sort2 = false
else
	DW_3.SETSORT('work_name D, order_no A')
	dw_3.sort()
	ib_sort2 = true
end if
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpcancel1_m
boolean visible = false
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_mpcancel1_m
integer x = 3909
integer y = 56
integer taborder = 180
end type

event pb_delete::clicked;long ll_row
string ls_plan
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_2.accepttext()
ll_row = dw_2.getrow()
if ll_row < 1 then return

ls_plan = dw_2.object.plan_no[ll_row]
if wf_sudodet(ll_row, ls_plan) = false then return

dw_2.deleterow(ll_row)
end event

type pb_insert from w_inheritance`pb_insert within w_mpcancel1_m
boolean visible = false
integer x = 2683
integer y = 60
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpcancel1_m
integer x = 3712
integer y = 56
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
integer y = 984
integer width = 4489
integer height = 1500
integer taborder = 110
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "생산계획내역"
end type

type gb_2 from w_inheritance`gb_2 within w_mpcancel1_m
integer x = 2437
integer y = 16
integer width = 1216
integer height = 204
integer taborder = 120
integer textsize = -10
long textcolor = 16711680
boolean righttoleft = true
end type

type gb_1 from w_inheritance`gb_1 within w_mpcancel1_m
integer x = 3675
integer y = 16
integer width = 846
integer taborder = 60
end type

type gb_4 from groupbox within w_mpcancel1_m
integer x = 1833
integer y = 16
integer width = 585
integer height = 204
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type dw_3 from datawindow within w_mpcancel1_m
integer x = 64
integer y = 364
integer width = 1138
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

type em_1 from editmask within w_mpcancel1_m
integer x = 2775
integer y = 96
integer width = 366
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

type em_2 from editmask within w_mpcancel1_m
integer x = 3237
integer y = 96
integer width = 366
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

type st_1 from statictext within w_mpcancel1_m
integer x = 3163
integer y = 84
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mpcancel1_m
integer x = 2469
integer y = 108
integer width = 270
integer height = 76
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
string text = "계획일자"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpcancel1_m
integer x = 1865
integer y = 92
integer width = 521
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_3 from statictext within w_mpcancel1_m
integer x = 73
integer y = 288
integer width = 187
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

type st_4 from statictext within w_mpcancel1_m
integer x = 3872
integer y = 300
integer width = 590
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
string text = "생산계획확정취소 권한"
boolean focusrectangle = false
end type

type gb_5 from gb_3 within w_mpcancel1_m
integer y = 232
integer height = 728
integer taborder = 120
string text = ""
end type

