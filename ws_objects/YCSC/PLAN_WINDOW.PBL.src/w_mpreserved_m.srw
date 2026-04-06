$PBExportHeader$w_mpreserved_m.srw
$PBExportComments$수주물품예약(1998/10/09,곽용덕)
forward
global type w_mpreserved_m from w_inheritance
end type
type dw_4 from datawindow within w_mpreserved_m
end type
type dw_5 from datawindow within w_mpreserved_m
end type
type st_1 from statictext within w_mpreserved_m
end type
type st_5 from statictext within w_mpreserved_m
end type
type st_4 from statictext within w_mpreserved_m
end type
type sle_3 from singlelineedit within w_mpreserved_m
end type
type sle_4 from singlelineedit within w_mpreserved_m
end type
type sle_1 from singlelineedit within w_mpreserved_m
end type
type st_3 from statictext within w_mpreserved_m
end type
type st_2 from statictext within w_mpreserved_m
end type
type sle_2 from singlelineedit within w_mpreserved_m
end type
end forward

global type w_mpreserved_m from w_inheritance
integer width = 3506
integer height = 2196
string title = "수주물품예약관리(w_mpreserved_m)"
dw_4 dw_4
dw_5 dw_5
st_1 st_1
st_5 st_5
st_4 st_4
sle_3 sle_3
sle_4 sle_4
sle_1 sle_1
st_3 st_3
st_2 st_2
sle_2 sle_2
end type
global w_mpreserved_m w_mpreserved_m

type variables
string is_clause, is_where, is_select, is_loc
string is_clause1, is_where1, is_select1
datawindowchild idwc_item, idwc_qa
real ir_qty=0,ir_oldsolqty
long il_caparate = 0
real ir_qpa[20]
string is_itemno[20],is_qano[20]
int ii_seq[20]
int ii_front=0
end variables

forward prototypes
public function boolean wf_alter (long arg_cnt)
end prototypes

public function boolean wf_alter (long arg_cnt);long i
real lr_solqty,lr_canqoh,lr_notqty
string ls_item,ls_qa
int li_seq

for i = 1 to arg_cnt
    ls_item = trim(dw_1.object.item_no[i])
	 ls_qa = trim(dw_1.object.qa[i])
    
//	 select qoh - sales_reserved into :lr_canqoh from item
//	 where item_no = :ls_item and qa = :ls_qa;
//	 if sqlca.sqlcode < 0 then
//		 messagebox('오류','물품테이블에서 검색되지 않았습니다.',exclamation!)
//		 return false
//	 end if
	select qoh into :lr_canqoh from itemloc
	 where loc_no = :is_loc and item_no = :ls_item and qa = :ls_qa;
	if isnull(lr_canqoh) then lr_canqoh = 0
    lr_notqty   = dw_1.object.notqty[i]
    lr_solqty   = dw_1.object.sol_qty[i]
	 if lr_canqoh >= lr_notqty then
//		 update item set sales_reserved = sales_reserved + :lr_notqty
//		 where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류','판매예약량이 저장되지 않았습니다.',exclamation!)
//		    return false
//	    end if		 
		 dw_1.object.saledet_text[i] = 'S'
		 dw_1.object.sol_qty[i] = lr_solqty + lr_notqty
	 else 
//		 update item set sales_reserved = sales_reserved + :lr_canqoh
//		 where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류','판매예약량이 저장되지 않았습니다.',exclamation!)
//		    return false
//	    end if		 
		 dw_1.object.saledet_text[i] = 'P'
		 dw_1.object.sol_qty[i] = lr_solqty + lr_canqoh		
	 end if
	 
next

return true

end function

on w_mpreserved_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_1=create st_1
this.st_5=create st_5
this.st_4=create st_4
this.sle_3=create sle_3
this.sle_4=create sle_4
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.sle_2=create sle_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.dw_5
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.sle_3
this.Control[iCurrent+7]=this.sle_4
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.sle_2
end on

on w_mpreserved_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_3)
destroy(this.sle_4)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_area

dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
select def_loc into :is_loc from area
 where area_no = :gs_area;

is_select = dw_1.Describe("DataWindow.Table.Select")
//			 + " and saledet.item_no not in (~~'PZZZPP1ZZZ~~',~~'PZZZPP2ZZZ~~')" &
//if gs_area = "B0001" then
	is_clause = " and sale.confirm_flag = ~~'Y~~'" &
	          + " and sale.open_close = ~~'O~~'" &
				 + " and sale.area_no = ~~'" + gs_area +"~~'" &
	          + " and saledet.order_qty > saledet.rlse_qty" &
				 + " and substring(saledet.item_no,1,1) = ~~'P~~'" &
				 + " order by saledet.item_no asc,saledet.qa asc"
//else
//	is_clause = " and sale.confirm_flag = ~~'Y~~'" &
//	          + " and sale.open_close = ~~'O~~'" &
//				 + " and substring(sale.order_no,1,1) <> ~~'B~~'" &
//	          + " and saledet.order_qty > saledet.rlse_qty" &
//				 + " and substring(saledet.item_no,1,1) = ~~'P~~'" &
//				 + " order by saledet.item_no asc,saledet.qa asc"
//end if
is_where = "DataWindow.Table.Select='"  + is_select + is_clause + "'"
dw_1.Modify(is_where)
dw_1.settransobject(sqlca)
//dw_1.retrieve()
sle_3.text = "HD" + string(today(), "yyyy")
sle_4.setfocus()

end event

type pb_save from w_inheritance`pb_save within w_mpreserved_m
boolean visible = false
integer x = 3022
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_mpreserved_m
integer y = 500
integer width = 3355
integer height = 1556
integer taborder = 60
string dataobject = "d_mpreserved_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemerror;
if sqlca.sqlcode <> 0 then
   this.object.sol_qty[row] = 0
else
	this.object.sol_qty[row] = this.getitemdecimal(row,'sol_qty',Primary!, True)
end if

return 2
end event

event dw_1::itemchanged;long ll_row,ll_found
string ls_item,ls_itemname,ls_qa,ls_text
real lr_qty,lr_qoh,lr_reserved

this.accepttext()
if row < 1 then return
choose case dwo.name
	case 'sol_qty'
//		ls_text = this.object.saledet_text[row]
//		if gs_userid <> '1999010s' and gs_userid <> 'root' and ls_text = 'P' then 
//       	 messagebox('오류','생산중인 물품은 변경하실수 없습니다.',exclamation!)
//       	 return 1
//		end if
       ls_item = trim(this.object.item_no[row])
       ls_qa   = trim(this.object.qa[row])
		 lr_qty  = this.object.sol_qty[row]

	    select itemloc.qoh into :lr_qoh from itemloc
	     where itemloc.item_no = :ls_item and itemloc.qa = :ls_qa and loc_no = :is_loc;
	    if sqlca.sqlcode < 0 then
		    messagebox('오류','물품테이블에서 검색되지 않았습니다.',exclamation!)
       	 return 1
	    end if		
//	    select sales_reserved into :lr_reserved from item
//	     where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류','물품테이블에서 검색되지 않았습니다.',exclamation!)
//       	 return 1
//	    end if

		 if lr_qty > (lr_qoh - lr_reserved) then
       	 messagebox('오류','예약수량이 가용수량보다 큼니다.',exclamation!)
       	 return 1
		 end if
	case else
		
end choose

end event

type dw_2 from w_inheritance`dw_2 within w_mpreserved_m
boolean visible = false
integer x = 1737
integer y = 28
integer width = 87
integer height = 44
integer taborder = 70
string dataobject = "d_cdwc_c"
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_mpreserved_m
integer x = 37
integer y = 40
integer width = 1541
string text = "수주물품예약관리"
end type

type st_tips from w_inheritance`st_tips within w_mpreserved_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpreserved_m
integer x = 3017
integer y = 44
integer taborder = 140
boolean enabled = false
string picturename = "c:\bmp\save.bmp"
end type

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_maxrow,ll_ret,ll_row,i,j,k,ll_num,ll_cnt,ll_seq
string ls_plan,ls_order,ls_qa,ls_item,ls_sujutype,ls_sale,ls_type
real   lr_qty,lr_orderqty,lr_solqty,lr_rlseqty,lr_planqty,lr_newqty,lr_oldqty,lr_diffqty
integer li_seq
dwItemStatus l_status

dw_1.accepttext()
ll_maxrow = dw_1.rowcount()
if ll_maxrow < 1 then goto kkk
for i = 1 to ll_maxrow
    l_status = dw_1.GetItemStatus(i, 0, Primary!)
	 if l_status = datamodified! then
		 lr_newqty = dw_1.object.sol_qty[i]
		 lr_orderqty = dw_1.object.order_qty[i]
		 lr_planqty = dw_1.object.planqty[i]
		 lr_rlseqty = dw_1.object.rlse_qty[i]
		 ls_sale = trim(dw_1.object.order_no[i])
		 ls_item = trim(dw_1.object.item_no[i])
		 ls_qa = trim(dw_1.object.qa[i])
		 ll_seq = dw_1.object.seq_no[i]
//		 if rb_1.checked = true then
		    select sol_qty into :lr_oldqty from saledet 
			 where order_no = :ls_sale and seq_no = :ll_seq;
//		 else
//		    select sol_qty into :lr_oldqty from saleyspsum
//			 where order_no = :ls_sale and wseq = :ll_seq;			
//		 end if
       if sqlca.sqlcode <> 0 then
			 messagebox('오류','해당자료가 없습니다.',exclamation!)
			 rollback;
			 return			
		 end if
		 if lr_orderqty = (lr_newqty + lr_rlseqty + lr_planqty) then
			 dw_1.object.saledet_text[i] = 'X'
		 end if
		 
		 if lr_orderqty > (lr_newqty + lr_rlseqty + lr_planqty) then
			 dw_1.object.saledet_text[i] = 'P'
		 end if

		 if lr_orderqty < (lr_newqty + lr_rlseqty + lr_planqty) then
			 messagebox('오류','가용수량이 초과되었습니다.',exclamation!)
			 rollback;
			 return
		 end if		 
		 
		 if lr_newqty = lr_oldqty then continue
		 lr_diffqty = lr_newqty - lr_oldqty
//		 update item set sales_reserved = sales_reserved + :lr_diffqty
//		 where item_no = :ls_item and qa = :ls_qa;
//		 if sqlca.sqlcode < 0 then
//			 messagebox('오류','수행중 오류가 발생하였습니다.',exclamation!)
//			 rollback;
//			 return
//		 end if
	 end if
next

kkk:
if dw_1.update() = 1 then
   commit;
	messagebox('확인','완료되었습니다.',information!)
else
   rollback;
	messagebox('오류','실패되었습니다.',information!)
end if

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpreserved_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpreserved_m
integer x = 3214
integer y = 44
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpreserved_m
boolean visible = false
integer x = 2757
integer y = 60
integer taborder = 160
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpreserved_m
boolean visible = false
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_mpreserved_m
boolean visible = false
integer x = 2830
integer y = 60
integer taborder = 180
end type

type pb_insert from w_inheritance`pb_insert within w_mpreserved_m
boolean visible = false
integer x = 2638
integer y = 60
integer taborder = 200
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpreserved_m
integer x = 1344
integer y = 248
integer width = 155
integer height = 112
integer taborder = 190
end type

event pb_retrieve::clicked;string ls_order, ls_item, ls_name
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

ls_order = trim(sle_4.text)
ls_name = trim(sle_1.text)
ls_item = trim(sle_2.text)

if (isnull(ls_order) or ls_order = '' ) &
	and (isnull(ls_item) or ls_item = '' ) &
	and (isnull(ls_name) or ls_name = '' )  then
else
	ls_order = trim(sle_3.text) + trim(sle_4.text) + "%"
	ls_item = trim(sle_2.text) + "%"
	ls_name = "%" + trim(sle_1.text) + "%"
	dw_1.retrieve(ls_order, ls_name, ls_item)
end if
this.default = false
sle_4.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_mpreserved_m
integer x = 37
integer y = 208
integer width = 3397
integer height = 224
integer taborder = 80
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_mpreserved_m
integer x = 37
integer y = 432
integer width = 3401
integer height = 1640
integer taborder = 90
long textcolor = 16711680
string text = "수주내역"
end type

type gb_1 from w_inheritance`gb_1 within w_mpreserved_m
integer x = 2976
integer y = 4
integer width = 453
integer taborder = 50
end type

type dw_4 from datawindow within w_mpreserved_m
boolean visible = false
integer x = 1751
integer y = 24
integer width = 201
integer height = 168
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_cdpattern_m2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_mpreserved_m
boolean visible = false
integer x = 1170
integer y = 44
integer width = 494
integer height = 360
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_mpbom_t"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_mpreserved_m
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

type st_5 from statictext within w_mpreserved_m
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

type st_4 from statictext within w_mpreserved_m
integer x = 361
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

type sle_3 from singlelineedit within w_mpreserved_m
integer x = 686
integer y = 272
integer width = 256
integer height = 80
integer taborder = 100
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

event modified;pb_retrieve.default = true

end event

type sle_4 from singlelineedit within w_mpreserved_m
integer x = 942
integer y = 272
integer width = 325
integer height = 80
integer taborder = 110
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

event modified;pb_retrieve.default = true

end event

type sle_1 from singlelineedit within w_mpreserved_m
integer x = 1783
integer y = 272
integer width = 608
integer height = 80
integer taborder = 120
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

event modified;pb_retrieve.default = true

end event

type st_3 from statictext within w_mpreserved_m
integer x = 1541
integer y = 292
integer width = 224
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

type st_2 from statictext within w_mpreserved_m
integer x = 2414
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

type sle_2 from singlelineedit within w_mpreserved_m
integer x = 2770
integer y = 272
integer width = 608
integer height = 80
integer taborder = 130
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

event modified;pb_retrieve.default = true

end event

