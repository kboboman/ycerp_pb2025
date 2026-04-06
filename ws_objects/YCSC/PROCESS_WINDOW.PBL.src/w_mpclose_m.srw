$PBExportHeader$w_mpclose_m.srw
$PBExportComments$생산계획마감(1998/04/25,곽용덕)
forward
global type w_mpclose_m from w_inheritance
end type
type gb_5 from groupbox within w_mpclose_m
end type
type gb_4 from groupbox within w_mpclose_m
end type
type rb_1 from radiobutton within w_mpclose_m
end type
type rb_2 from radiobutton within w_mpclose_m
end type
type dw_3 from datawindow within w_mpclose_m
end type
type dw_area from datawindow within w_mpclose_m
end type
end forward

global type w_mpclose_m from w_inheritance
integer width = 3525
string title = "생산계획 마감(w_mpclose_m)"
gb_5 gb_5
gb_4 gb_4
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_area dw_area
end type
global w_mpclose_m w_mpclose_m

type variables
string is_select,is_where,is_select1,is_where1
datawindowchild  idwc_supp,idwc_item
end variables

on w_mpclose_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.gb_4=create gb_4
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_area=create dw_area
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_area
end on

on w_mpclose_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_area)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

long ll_count,i
string ls_item
dw_3.settransobject(sqlca)
is_select1 = dw_3.Describe("DataWindow.Table.Select")

// area 추가 2003/02/26
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26

end event

type pb_save from w_inheritance`pb_save within w_mpclose_m
boolean visible = false
integer x = 3003
integer y = 56
end type

event pb_save::clicked;call super::clicked;wf_update2(dw_1,dw_2,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_mpclose_m
integer x = 69
integer y = 292
integer width = 3346
integer height = 264
integer taborder = 70
string dataobject = "d_mpsale_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
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

type dw_2 from w_inheritance`dw_2 within w_mpclose_m
integer x = 64
integer y = 648
integer width = 3319
integer height = 1376
integer taborder = 80
string dataobject = "d_mpsaledet4_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::editchanged;call super::editchanged;string ls_data,ls_item

choose case dwo.name
	case 'item_no'
		 ls_data = data + '%'
		 ls_item = "item_no like '" + ls_data + "'"
		 wf_filterdwc(idwc_item,ls_item)
end choose
end event

event dw_2::itemchanged;call super::itemchanged;string ls_data,ls_item

this.accepttext()
choose case dwo.name
	case 'item_no'
		 
		 if idwc_item.rowcount() < 1 then
			 MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			 setnull(ls_data)
			 this.object.item_no[row] = ls_data
			 
			 return 1
		 end if
		 if trim(data) <> trim(idwc_item.getitemstring(idwc_item.getrow(),'item_no')) then
			 MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			 return 1
		 end if
		 this.object.item_item_name[row] = idwc_item.getitemstring(idwc_item.getrow(),'item_name')
		 this.object.item_qa[row] = idwc_item.getitemstring(idwc_item.getrow(),'qa')
		 this.object.uom[row] = idwc_item.getitemstring(idwc_item.getrow(),'uom') 
		 ls_data = '%'
		 ls_item = "item_no like '" + ls_data + "'"
		 wf_filterdwc(idwc_item,ls_item)
end choose
end event

event dw_2::itemerror;call super::itemerror;string ls_data,ls_item

ls_data = '%'
ls_item = "item_no like '" + ls_data + "'"
wf_filterdwc(idwc_item,ls_item)

return 2
end event

type st_title from w_inheritance`st_title within w_mpclose_m
integer x = 41
integer width = 1248
string text = "생산계획 마감"
end type

type st_tips from w_inheritance`st_tips within w_mpclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpclose_m
integer x = 2999
integer taborder = 110
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"마감",parent, li_x, li_y)

end event

event pb_compute::clicked;long   ll_row,i,ll_cnt,k,ll_maxrow,j,ll_rowcount,ll_chk
string ls_order,ls_order1,ls_item,ls_item1,ls_qa,ls_plan,ls_plan1,ls_qa1,ls_like,ls_type
real   lr_diff,lr_qty,lr_rcptqty,lr_compqty
integer li_seq,li_ret
datetime ldt_datetime


li_ret = MessageBox("확인", "마감을 수행하면 마감대상 데이터는 수정이 불가능합니다." + &
                 " ~r~n~t   마감하시겠습니까?",information!, OKCancel!, 2)
						  
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if li_ret = 2 then return      
ll_chk = 0
if rb_1.checked = true then
   ll_row = dw_2.rowcount()
   if ll_row < 1 then return	
   ls_order = trim(dw_1.object.order_no[1])
	ls_like = ls_order + '%'
	choose case MidA(ls_order,1,1)
		case 'M','O'
			ll_rowcount = ll_row
			for i = 1 to ll_rowcount
				ls_plan = trim(dw_2.object.plan_no[i])
				select result_type into :ls_type from purdet where product_no = :ls_plan;
				choose case sqlca.sqlcode
					case 0
						 if trim(ls_type) = 'C' and trim(ls_type) = 'E' then
						    continue	
						 else
							 messagebox('오류','외주발주 중인 물품이 있어 생산계획을 마감할수 없습니다.',exclamation!)
							 rollback;
							 return
						 end if
					case 100
						
					case else
							 messagebox('오류','발주서 검색중 검색에러가 발생하였습니다.',exclamation!)
							 rollback;
							 return						
				end choose
			next
		case else
			
	end choose
   dw_1.object.open_close[1] = 'C'
	dw_1.object.close_date[1] = wf_today()
	wf_update2(dw_1,dw_2,"Y")
else
   ll_cnt = dw_3.rowcount()
   OPEN(W_ICPROCESS)
 
	for i = 1 to ll_cnt
		 w_icprocess.hpb_1.position = (i / ll_cnt) * 100	
		 ls_order = trim(dw_3.object.order_no[i])
//		 dw_1.retrieve(ls_order)
		 ll_maxrow = dw_2.retrieve(ls_order)
	    choose case MidA(ls_order,1,1)
		   case 'M','O'
			   ll_rowcount = ll_maxrow
			   for j = 1 to ll_rowcount
				   ls_plan = trim(dw_2.object.plan_no[j])
				   select result_type into :ls_type from purdet where product_no = :ls_plan;
				   choose case sqlca.sqlcode
					   case 0
						    if trim(ls_type) = 'C' and trim(ls_type) = 'E' then
						       continue	
						    else
							    ll_chk = 1
							    exit
						    end if
					   case 100
						
					   case else
							  ll_chk = 1
							  exit
				   end choose
			   next
				if ll_chk = 1 then
				   ll_chk = 0
					continue
				end if
		   case else
				
			
	    end choose
	
	    for j = 1 to ll_maxrow
		     ls_plan = trim(dw_2.object.plan_no[j])
			  if dw_2.object.rcpt_qty[j] < dw_2.object.order_qty[j] then
              exit
			  end if
	    next
		 if j > ll_maxrow then
			 ldt_datetime = wf_today() 
          update mps set open_close = 'C',close_date = :ldt_datetime 
			 where order_no = :ls_order;
			 if sqlca.sqlcode < 0 then
				 MessageBox("오류", "[pb_save] DB 오류가 발생습니다.", exclamation!)
				 rollback;
				 return
			 end if
			 
		 end if 
	next
	commit;
	close(W_ICPROCESS)
	MessageBox("확인", "[pb_save] 자동마감이 완료되었습니다.", information!)
	
end if


end event

type pb_print_part from w_inheritance`pb_print_part within w_mpclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpclose_m
integer x = 3195
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpclose_m
boolean visible = false
integer taborder = 130
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpclose_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_mpclose_m
boolean visible = false
integer x = 2811
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;call super::clicked;if dw_1.rowcount() < 1 then return
dw_1.RowsMove(1, dw_1.rowcount(), Primary!,  dw_1, 1, Delete!)

if dw_2.rowcount() < 1 then return
dw_2.RowsMove(1, dw_2.rowcount(), Primary!,  dw_2, 1, Delete!)
end event

type pb_insert from w_inheritance`pb_insert within w_mpclose_m
boolean visible = false
integer x = 2619
integer y = 56
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpclose_m
integer x = 2802
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_where lstr_name
string ls_where, ls_area

lstr_name.chk = 'N'
lstr_name.name = 'w_mpclose_m'
if rb_1.checked = true then
   openwithparm(w_whplanno_w,lstr_name)
else
	openwithparm(w_whymd_w,lstr_name)
end if
lstr_name = Message.PowerObjectParm	
ls_area = dw_area.object.area[1]
if lstr_name.chk = 'Y' then
   if rb_1.checked = true then
      dw_1.retrieve(lstr_name.str1)
	   dw_2.retrieve(lstr_name.str1)
   else
		gb_5.text = "계획기간 : " + lstr_name.str1 + " 에서 " + lstr_name.str2
		is_where1 = " where mps.start_date between ~~'" + lstr_name.str1 + "~~' and ~~'" +lstr_name.str2 + "~~'" &
		          + " and mps.open_close = ~~'P~~'" + " and mps.area_no = ~~'" + trim(ls_area) +"~~'"
      ls_where = "DataWindow.Table.Select='" + is_select1 + is_where1 + "'"
		wf_retrieve(dw_3,ls_where)
   end if
else
	return
end if








end event

type gb_3 from w_inheritance`gb_3 within w_mpclose_m
integer x = 32
integer y = 584
integer width = 3397
integer height = 1460
integer taborder = 90
long textcolor = 16711680
string text = "생산계획내역"
end type

type gb_2 from w_inheritance`gb_2 within w_mpclose_m
integer width = 3397
integer height = 344
integer taborder = 100
long textcolor = 16711680
string text = "생산계획헤더"
end type

type gb_1 from w_inheritance`gb_1 within w_mpclose_m
integer x = 1659
integer width = 974
integer taborder = 50
end type

type gb_5 from groupbox within w_mpclose_m
boolean visible = false
integer x = 37
integer y = 232
integer width = 3387
integer height = 1812
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
end type

type gb_4 from groupbox within w_mpclose_m
integer x = 2766
integer y = 12
integer width = 658
integer height = 204
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type rb_1 from radiobutton within w_mpclose_m
integer x = 1719
integer y = 128
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "수동마감"
boolean checked = true
end type

event clicked;if rb_1.checked = true then
	gb_2.visible = true
	gb_3.visible = true
	dw_1.visible = true
	dw_2.visible = true	
else
	gb_5.visible = false
	dw_3.visible = false
end if
end event

type rb_2 from radiobutton within w_mpclose_m
integer x = 2181
integer y = 128
integer width = 439
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "자동마감"
end type

event clicked;if rb_2.checked = true then
	gb_5.visible = true
	dw_3.visible = true
else
	gb_2.visible = false
	gb_3.visible = false
	dw_1.visible = false
	dw_2.visible = false
end if
end event

type dw_3 from datawindow within w_mpclose_m
boolean visible = false
integer x = 59
integer y = 288
integer width = 3346
integer height = 1692
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_mpheder_t"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type dw_area from datawindow within w_mpclose_m
integer x = 1719
integer y = 48
integer width = 517
integer height = 80
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

