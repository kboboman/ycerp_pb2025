$PBExportHeader$w_mpsale1111_m.srw
$PBExportComments$자동생산계획취소(1998/04/07,곽용덕)
forward
global type w_mpsale1111_m from w_inheritance
end type
type st_1 from statictext within w_mpsale1111_m
end type
type sle_3 from singlelineedit within w_mpsale1111_m
end type
type sle_1 from singlelineedit within w_mpsale1111_m
end type
type sle_2 from singlelineedit within w_mpsale1111_m
end type
type st_2 from statictext within w_mpsale1111_m
end type
type st_3 from statictext within w_mpsale1111_m
end type
type st_5 from statictext within w_mpsale1111_m
end type
type st_4 from statictext within w_mpsale1111_m
end type
type dw_area from datawindow within w_mpsale1111_m
end type
type gb_15 from groupbox within w_mpsale1111_m
end type
end forward

global type w_mpsale1111_m from w_inheritance
integer width = 4288
integer height = 2608
string title = "자동생산계획 삭제(w_mpsale1111_m)"
st_1 st_1
sle_3 sle_3
sle_1 sle_1
sle_2 sle_2
st_2 st_2
st_3 st_3
st_5 st_5
st_4 st_4
dw_area dw_area
gb_15 gb_15
end type
global w_mpsale1111_m w_mpsale1111_m

on w_mpsale1111_m.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_3=create sle_3
this.sle_1=create sle_1
this.sle_2=create sle_2
this.st_2=create st_2
this.st_3=create st_3
this.st_5=create st_5
this.st_4=create st_4
this.dw_area=create dw_area
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_3
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.sle_2
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.dw_area
this.Control[iCurrent+10]=this.gb_15
end on

on w_mpsale1111_m.destroy
call super::destroy
destroy(this.st_1)
destroy(this.sle_3)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_area)
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천

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

type pb_save from w_inheritance`pb_save within w_mpsale1111_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsale1111_m
integer x = 50
integer y = 488
integer width = 4151
integer height = 1964
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

event dw_1::clicked;long ll_row
string ls_flag

if row < 1 then return

this.accepttext()

ll_row = row
this.SelectRow(ll_row, NOT this.IsSelected(ll_row))

end event

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

type st_title from w_inheritance`st_title within w_mpsale1111_m
integer width = 1678
string text = "자동생산계획취소"
end type

type st_tips from w_inheritance`st_tips within w_mpsale1111_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsale1111_m
integer x = 3813
integer y = 56
integer taborder = 120
end type

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_rowcount,ll_rowcount1,ll_cnt,ll_maxrow,ll_row,ll_count,j
string ls_flag,ls_item,ls_qa,ls_sale,ls_plan,ls_order
integer li_seq

ll_rowcount = dw_1.rowcount()
ll_count = 0
for ll_cnt = 1 to ll_rowcount
	if dw_1.isselected(ll_cnt) then
      ll_count ++
	end if
next

if ll_count = 0 then
	messagebox('오류','임시 수주항목을 선택하십시요.',exclamation!)
	return
end if

for ll_cnt = 1 to ll_rowcount
	if dw_1.isselected(ll_cnt) then
		ls_sale = trim(dw_1.object.sale_no[ll_cnt])
		li_seq = dw_1.object.seq_no[ll_cnt]
		dw_2.reset()
		ll_maxrow = dw_2.retrieve(ls_sale,li_seq)
		ll_count = 0
		select count(*) into :ll_count from mpsdet where sale_no = :ls_sale and seq_no = :li_seq;
		if ll_count > 0 then
			messagebox("확인","이 수주에 대한 내역이 이미 생산계획중에 있습니다~r~n" + &
									"생산계획확정및 취소에서 생산계획을 삭제하신후에 작업하십시요")
			return
		end if
			
		if ll_maxrow < 1 then
			delete from routtempnew 
			where sale_no = :ls_sale 
			and seq_no = :li_seq;
			if sqlca.sqlcode < 0 then
				rollback;
				messagebox('오류1','수행중 오류가 발생하였습니다.',exclamation!)
				return
			end if
			continue
		end if
      for j = 1 to ll_maxrow
			ls_flag = trim(dw_2.object.mps_open_close[j])
			if ls_flag = 'P' or ls_flag = 'C' then
				exit
			end if
		next
		if j > ll_maxrow then
  	      delete from mpsdet where sale_no = :ls_sale and seq_no = :li_seq;
			if sqlca.sqlcode < 0 then
				rollback;
				messagebox('오류2','수행중 오류가 발생하였습니다.',exclamation!)
				return
			end if			  
   		delete from routtempnew where sale_no = :ls_sale and seq_no = :li_seq;
			if sqlca.sqlcode < 0 then
				rollback;
				messagebox('오류3','수행중 오류가 발생하였습니다.',exclamation!)
				return
			end if
			continue
		else
			messagebox('확인',ls_sale + ", " + string(li_seq) + " 는 수주가 생산계획 진행중입니다.")
		end if
	end if
next
commit;
messagebox('확인','작업이 완료되었습니다.',information!)
dw_1.selectrow(0,false)
dw_1.reset()
end event

type pb_print_part from w_inheritance`pb_print_part within w_mpsale1111_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsale1111_m
integer x = 4005
integer y = 56
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
integer x = 3474
integer y = 56
integer width = 334
integer taborder = 170
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve('%', '%', '%', dw_area.object.area[1])
end event

type gb_3 from w_inheritance`gb_3 within w_mpsale1111_m
integer x = 32
integer y = 224
integer width = 4192
integer height = 216
integer taborder = 100
integer textsize = -8
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpsale1111_m
integer y = 444
integer width = 4192
integer height = 2028
integer taborder = 110
end type

type gb_1 from w_inheritance`gb_1 within w_mpsale1111_m
integer x = 3442
integer y = 16
integer width = 777
end type

type st_1 from statictext within w_mpsale1111_m
integer x = 114
integer y = 288
integer width = 242
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "검색 :"
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_mpsale1111_m
integer x = 731
integer y = 268
integer width = 608
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_data

ls_data = trim(this.text)

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
if isnull(ls_data) or ls_data = '' then
//	dw_1.setfilter("")
//	dw_1.filter()
else
	ls_data = "%" + ls_data + "%"
	dw_1.retrieve(ls_data,"%","%", dw_area.object.area[1])
//	dw_1.setfilter("order_no LIKE '" + ls_data + "'")
//	dw_1.filter()
end if

end event

type sle_1 from singlelineedit within w_mpsale1111_m
integer x = 1751
integer y = 272
integer width = 608
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_data

ls_data = trim(this.text)

if isnull(ls_data) or ls_data = '' then
//	dw_1.setfilter("")
//	dw_1.filter()
else
	ls_data = "%" + ls_data + "%"
	dw_1.retrieve("%",ls_data,"%",dw_area.object.area[1])
//	dw_1.setfilter("groupitem_item_name LIKE '" + ls_data + "'")
//	dw_1.filter()
end if

end event

type sle_2 from singlelineedit within w_mpsale1111_m
integer x = 2839
integer y = 268
integer width = 608
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_data

ls_data = trim(this.text)

if isnull(ls_data) or ls_data = '' then
//	dw_1.setfilter("")
//	dw_1.filter()
else
	ls_data = ls_data + "%"
	dw_1.retrieve("%","%",ls_data,dw_area.object.area[1])
//	dw_1.setfilter("item_no like '" + ls_data + "'")
//	dw_1.filter()
end if

end event

type st_2 from statictext within w_mpsale1111_m
integer x = 2482
integer y = 288
integer width = 297
integer height = 64
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
string text = "제품코드"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpsale1111_m
integer x = 1399
integer y = 292
integer width = 297
integer height = 64
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
string text = "제품명"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_mpsale1111_m
integer x = 91
integer y = 368
integer width = 3323
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "검색방법 : 수주번호,제품명/코드 등의 자료중 알고 있는 자료만 입력후 엔터            (예) 수주번호 : 0713-007 후 엔터"
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpsale1111_m
integer x = 421
integer y = 288
integer width = 297
integer height = 64
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
string text = "수주번호"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpsale1111_m
integer x = 2857
integer y = 104
integer width = 503
integer height = 76
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type gb_15 from groupbox within w_mpsale1111_m
integer x = 2821
integer y = 52
integer width = 567
integer height = 168
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

