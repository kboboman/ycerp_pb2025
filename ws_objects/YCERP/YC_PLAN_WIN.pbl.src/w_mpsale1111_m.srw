$PBExportHeader$w_mpsale1111_m.srw
$PBExportComments$자동생산계획취소(1998/04/07,곽용덕)
forward 
global type w_mpsale1111_m from w_inheritance
end type
type sle_sale from singlelineedit within w_mpsale1111_m
end type
type sle_item from singlelineedit within w_mpsale1111_m
end type
type st_3 from statictext within w_mpsale1111_m
end type
type st_4 from statictext within w_mpsale1111_m
end type
type dw_area from datawindow within w_mpsale1111_m
end type
type ddlb_fld from dropdownlistbox within w_mpsale1111_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsale1111_m
end type
type st_6 from statictext within w_mpsale1111_m
end type
type st_7 from statictext within w_mpsale1111_m
end type
type ddlb_op from dropdownlistbox within w_mpsale1111_m
end type
type sle_value from singlelineedit within w_mpsale1111_m
end type
type cb_1 from commandbutton within w_mpsale1111_m
end type
type cb_2 from commandbutton within w_mpsale1111_m
end type
type cb_3 from commandbutton within w_mpsale1111_m
end type
type cb_5 from commandbutton within w_mpsale1111_m
end type
type st_2 from statictext within w_mpsale1111_m
end type
type st_1 from statictext within w_mpsale1111_m
end type
end forward

global type w_mpsale1111_m from w_inheritance
integer width = 4283
integer height = 1928
string title = "자동생산계획 취소(w_mpsale1111_m)"
sle_sale sle_sale
sle_item sle_item
st_3 st_3
st_4 st_4
dw_area dw_area
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_2 st_2
st_1 st_1
end type
global w_mpsale1111_m w_mpsale1111_m

on w_mpsale1111_m.create
int iCurrent
call super::create
this.sle_sale=create sle_sale
this.sle_item=create sle_item
this.st_3=create st_3
this.st_4=create st_4
this.dw_area=create dw_area
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_sale
this.Control[iCurrent+2]=this.sle_item
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_7
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.st_1
end on

on w_mpsale1111_m.destroy
call super::destroy
destroy(this.sle_sale)
destroy(this.sle_item)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.dw_area)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
dw_area.accepttext()

IF GF_PERMISSION("자동생산계획취소", gs_userid) = "Y" THEN
ELSE
	PB_COMPUTE.VISIBLE = FALSE
	MessageBox("권한","'자동생산계획취소' 권한이 존재하지 않습니다.")
END IF

IF GF_PERMISSION("자동생산계획취소_사업장선택", gs_userid) = "Y" THEN
ELSE
	dw_area.enabled = false
END IF
end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_mpsale1111_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsale1111_m
integer x = 32
integer y = 444
integer width = 4174
integer height = 1344
integer taborder = 80
string dataobject = "d_mpsale1111_t"
borderstyle borderstyle = stylelowered!
end type

event dw_1::keydown;long ll_row,i
string ls_flag

IF keyflags = 1 THEN
   IF keydown(KeyLeftButton!) THEN
		ll_row = this.getrow()
      if ll_row < 1 then return
      this.accepttext()
		for i = ll_row to 1 step -1
			 if i <> ll_row then
				 if this.IsSelected(i) = true then
					 exit
				 end if
			 end if
          this.SelectRow(i, NOT this.IsSelected(i))
		next
	END IF
END IF


end event

event dw_1::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

long   ll_row
string ls_flag

if row < 1 then return

this.accepttext()

ll_row = row
this.SelectRow(ll_row, NOT this.IsSelected(ll_row))

end event

type st_title from w_inheritance`st_title within w_mpsale1111_m
integer x = 32
integer y = 16
integer width = 1166
integer height = 140
string text = "자동생산계획 취소"
end type

type st_tips from w_inheritance`st_tips within w_mpsale1111_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsale1111_m
integer x = 3150
integer y = 72
integer taborder = 120
end type

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long    ll_rowcount, ll_rowcount1, ll_cnt, ll_maxrow, ll_row, ll_count, j
string  ls_flag, ls_item, ls_qa, ls_sale, ls_plan, ls_order
integer li_seq

ll_rowcount = dw_1.rowcount()
ll_count    = 0

for ll_cnt = 1 to ll_rowcount
	if dw_1.IsSelected(ll_cnt) then
      ll_count ++
	end if
next

if MessageBox("확인", string(ll_count, "#,##0") + " 건의 생산계획을 취소합니다.", Exclamation!, OKCancel!, 2) = 2 then
	RETURN
end if

if ll_count = 0 then
	MessageBox('오류','임시 수주항목을 선택하십시요.',exclamation!)
	RETURN
end if

for ll_cnt = 1 to ll_rowcount
	if dw_1.isselected(ll_cnt) then
		ls_sale = trim(dw_1.object.sale_no[ll_cnt])
		li_seq  = dw_1.object.seq_no[ll_cnt]
		
		dw_2.reset()
		ll_maxrow = dw_2.retrieve(ls_sale,li_seq)
		ll_count  = 0
		
		SELECT count(*) INTO :ll_count FROM mpsdet WHERE sale_no = :ls_sale AND seq_no = :li_seq;
		if ll_count > 0 then
			MessageBox("확인","이 수주에 대한 내역이 이미 생산계획중에 있습니다~r~n" + &
									"생산계획확정및 취소에서 생산계획을 삭제하신후에 작업하십시요")
			RETURN
		end if
			
		if ll_maxrow < 1 then
			DELETE FROM routtempnew WHERE sale_no = :ls_sale AND seq_no = :li_seq;
			if sqlca.sqlcode < 0 then
				ROLLBACK;
				MessageBox('오류1','수행중 오류가 발생하였습니다.',exclamation!)
				RETURN
			end if
			
			CONTINUE
		end if
		
      for j = 1 to ll_maxrow
			ls_flag = trim(dw_2.object.mps_open_close[j])
			if ls_flag = 'P' OR ls_flag = 'C' then
				EXIT
			end if
		next
		if j > ll_maxrow then
  	      DELETE FROM mpsdet WHERE sale_no = :ls_sale AND seq_no = :li_seq;
			if sqlca.sqlcode < 0 then
				ROLLBACK;
				MessageBox('오류2','수행중 오류가 발생하였습니다.',exclamation!)
				RETURN
			end if
			
   		DELETE FROM routtempnew WHERE sale_no = :ls_sale AND seq_no = :li_seq;
			if sqlca.sqlcode < 0 then
				ROLLBACK;
				MessageBox('오류3','수행중 오류가 발생하였습니다.',exclamation!)
				RETURN
			end if
			
			CONTINUE
		else
			MessageBox('확인',ls_sale + ", " + string(li_seq) + " 는 수주가 생산계획 진행중입니다.")
		end if
	end if
next

COMMIT;
MessageBox('확인','작업이 완료되었습니다.',information!)

dw_1.selectrow(0,false)
dw_1.reset()

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpsale1111_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsale1111_m
integer x = 3342
integer y = 72
integer taborder = 130
end type

event pb_close::clicked;CLOSE(PARENT)
end event

type pb_print from w_inheritance`pb_print within w_mpsale1111_m
boolean visible = false
integer taborder = 140
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpsale1111_m
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpsale1111_m
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpsale1111_m
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsale1111_m
integer x = 2811
integer y = 72
integer width = 334
integer taborder = 170
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "전체조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_saleno, ls_itemnm

dw_area.accepttext()
ls_area   = dw_area.object.area[1]

ls_saleno = sle_sale.text + "%"
ls_itemnm = sle_item.text + "%"

dw_1.retrieve( ls_area, ls_saleno, ls_itemnm )

end event

type gb_3 from w_inheritance`gb_3 within w_mpsale1111_m
integer x = 1257
integer y = 16
integer width = 1504
integer height = 232
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpsale1111_m
integer y = 256
integer width = 4174
integer height = 176
integer taborder = 110
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpsale1111_m
integer x = 2779
integer y = 16
integer width = 777
integer height = 232
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsale1111_m
boolean visible = false
integer x = 1687
integer y = 52
integer width = 206
integer height = 160
integer taborder = 90
string dataobject = "d_mpautodel_h"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;string ls_sale,ls_order,ls_plan,ls_temp
long ll_rowcount,i

this.accepttext()
ls_sale = trim(this.object.sale_no[1])
ll_rowcount = dw_1.retrieve(ls_sale)
IF ll_rowcount < 1 then
	messagebox('확인','해당자료가 없습니다.',exclamation!)
	return
end if
for i = 1 to ll_rowcount
	 ls_plan = trim(dw_1.object.mpsdet_plan_no[i])
	 ls_order = trim(dw_1.object.mpsdet_order_no[i])
	 if isnull(ls_plan) then
		 continue
  	 else
		 select open_close into :ls_temp from mps where order_no = :ls_order;
		 choose case trim(ls_temp)
			 case 'P'
				  dw_1.object.type1[i] = '1'
			 case 'A'
				  dw_1.object.type1[i] = 'A'
		 end choose
	 end if
	 
	 choose case MidA(ls_plan,1,1)
		 case 'O','M'
			  select type into :ls_temp from sfcday where order_no = :ls_plan;
			  choose case sqlca.sqlcode
				 case 0
					   if trim(ls_temp) = 'N' then
					      dw_1.object.type1[i] = '9' // 9: 생산계획완료 후  취소
						else
							dw_1.object.type1[i] = '8' // 8: 생산계획완료
						end if
				 case else

			  end  choose
			  
			  select sudo_type into :ls_temp from sudodet1 where order_no = :ls_plan;
			  choose case sqlca.sqlcode
				 case 0
					   choose case trim(ls_temp)
							case 'C'
					         dw_1.object.type1[i] = '4' // 4: 외주구매입고완료
							case 'B'
								dw_1.object.type1[i] = '3' // 4: 외주구매입고발주중
              			   select result_type into :ls_temp from purdet where product_no = :ls_plan;
               		   choose case sqlca.sqlcode
                				 case 0
					                 choose case trim(ls_temp)
							              case 'E','P'
					                        dw_1.object.type1[i] = '4' // 4: 입고완료
							              case 'C'
								               dw_1.object.type1[i] = '9' // 4: 외주가공입고발주중
						              end choose
               				 case else

			                end  choose								
							case 'A'
								dw_1.object.type1[i] = '2' // 4: 외주구매입고청구중
						end choose
				 case else

			  end  choose
			  
			  select sudo_type into :ls_temp from sudodet where order_no = :ls_plan;
			  choose case sqlca.sqlcode
				 case 0
					   choose case trim(ls_temp)
							case 'C'
					         dw_1.object.type1[i] = '7' // 4: 외주가공입고완료
							case 'B'
								dw_1.object.type1[i] = '6' // 4: 외주가공입고발주중
              			   select result_type into :ls_temp from purdet where product_no = :ls_plan;
               		   choose case sqlca.sqlcode
                				 case 0
					                 choose case trim(ls_temp)
							              case 'E','P'
					                        dw_1.object.type1[i] = '7' // 4: 입고완료
							              case 'C'
								               dw_1.object.type1[i] = '9' // 4: 외주가공입고발주중
						              end choose
               				 case else

			                end  choose    								
							case 'A'
								dw_1.object.type1[i] = '5' // 4: 외주가공입고청구중
						end choose
				 case else

			  end  choose
			  

		 case else
			  select type into :ls_temp from sfcday where order_no = :ls_plan;
			  choose case sqlca.sqlcode
				 case 0
					   if trim(ls_temp) = 'N' then
					      dw_1.object.type1[i] = '9' // 9: 생산계획완료 후  취소
						else
							dw_1.object.type1[i] = '8' // 8: 생산계획완료
						end if
				 case else

			  end  choose
	 end choose
next

end event

type sle_sale from singlelineedit within w_mpsale1111_m
integer x = 2176
integer y = 56
integer width = 549
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;//
string ls_area, ls_data

dw_area.accepttext()
ls_area = dw_area.object.area[1]

ls_data = trim(this.text)
if LenA(ls_data) <> 14 then
	MessageBox("확인","수주번호를 정확히 입력하시기 바랍니다.")
	RETURN
end if

if isnull(ls_data) OR ls_data = '' then
else
	ls_data = "%" + ls_data + "%"
	
	dw_1.retrieve( ls_area , ls_data, "%" )
	if dw_1.rowcount() > 0 then
		MessageBox("확인","조회완료")
	else
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	end if
end if

end event

type sle_item from singlelineedit within w_mpsale1111_m
integer x = 2176
integer y = 148
integer width = 549
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
boolean enabled = false
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;//
string ls_area, ls_data

dw_area.accepttext()
ls_area = dw_area.object.area[1]

ls_data = trim(this.text)

if isnull(ls_data) OR ls_data = '' then
else
	ls_data = "%" + ls_data + "%"

	dw_1.retrieve( ls_area, "%", ls_data )
	if dw_1.rowcount() > 0 then
		MessageBox("확인","조회완료")
	else
		MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	end if
end if

end event

type st_3 from statictext within w_mpsale1111_m
integer x = 1829
integer y = 148
integer width = 338
integer height = 80
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
string text = "제 품 명"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpsale1111_m
integer x = 1829
integer y = 60
integer width = 338
integer height = 80
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
string text = "수주번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpsale1111_m
integer x = 1289
integer y = 144
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

type ddlb_fld from dropdownlistbox within w_mpsale1111_m
integer x = 274
integer y = 308
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_mpsale1111_m
integer x = 306
integer y = 320
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

type st_6 from statictext within w_mpsale1111_m
integer x = 87
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

type st_7 from statictext within w_mpsale1111_m
integer x = 745
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

type ddlb_op from dropdownlistbox within w_mpsale1111_m
integer x = 914
integer y = 308
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpsale1111_m
integer x = 1230
integer y = 316
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

type cb_1 from commandbutton within w_mpsale1111_m
integer x = 1810
integer y = 316
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

type cb_2 from commandbutton within w_mpsale1111_m
integer x = 1975
integer y = 316
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

type cb_3 from commandbutton within w_mpsale1111_m
integer x = 2139
integer y = 316
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

type cb_5 from commandbutton within w_mpsale1111_m
integer x = 2304
integer y = 316
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

type st_2 from statictext within w_mpsale1111_m
integer x = 1289
integer y = 60
integer width = 526
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_mpsale1111_m
integer x = 37
integer y = 216
integer width = 453
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "자동생산계획취소"
alignment alignment = center!
boolean focusrectangle = false
end type

