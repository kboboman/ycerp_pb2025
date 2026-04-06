$PBExportHeader$w_ipautosale1_m.srw
$PBExportComments$자동수주계산(1998/08/26,곽용덕)
forward 
global type w_ipautosale1_m from w_inheritance
end type
end forward

global type w_ipautosale1_m from w_inheritance
integer width = 3511
integer height = 1964
string title = "자동수주계산(w_ipautosale1_m)"
end type
global w_ipautosale1_m w_ipautosale1_m

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
real lr_solqty,lr_canqoh,lr_notqty,lr_canqoh1,lr_canqoh2
string ls_item,ls_qa
int li_seq

for i = 1 to arg_cnt
    ls_item = trim(dw_1.object.item_no[i])
	 ls_qa = trim(dw_1.object.qa[i])
    
	 select qoh into :lr_canqoh1 from itemloc
	 where loc_no = :is_loc
	   and item_no = :ls_item 
		and qa = :ls_qa ;
	 if sqlca.sqlcode < 0 then
		 messagebox('오류','물품테이블에서 검색되지 않았습니다.',exclamation!)
		 return false
	 end if
	 
	 if isnull(lr_canqoh1) then lr_canqoh1 = 0
	 
//	select qoh into :lr_canqoh2 from itemloc
//	 where loc_no = :is_loc and item_no = :ls_assyitem and qa = :ls_qa2;
//	if isnull(lr_canqoh2) then lr_canqoh2 = 0
//	 select sales_reserved into :lr_canqoh2 from item
//	 where item_no = :ls_item and qa = :ls_qa;
//	 if sqlca.sqlcode < 0 then
//		 messagebox('오류','물품테이블에서 검색되지 않았습니다.',exclamation!)
//		 return false
//	 end if
//	 if isnull(lr_canqoh2) then lr_canqoh2 = 0
	 lr_canqoh = lr_canqoh1 //- lr_canqoh2
    lr_notqty   = dw_1.object.notqty[i]
    lr_solqty   = dw_1.object.sol_qty[i]
	 if lr_canqoh >= lr_notqty then
//		 update item set sales_reserved = sales_reserved + :lr_notqty
//		 where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류',sqlca.sqlerrtext,exclamation!)
//		    return false
//	    end if		 
		 dw_1.object.saledet_text[i] = 'X'
		 dw_1.object.sol_qty[i] = lr_solqty + lr_notqty
	 else 
//		 update item set sales_reserved = sales_reserved + :lr_canqoh
//		 where item_no = :ls_item and qa = :ls_qa;
//	    if sqlca.sqlcode < 0 then
//		    messagebox('오류',sqlca.sqlerrtext,exclamation!)
//		    return false
//	    end if		 
		 dw_1.object.saledet_text[i] = 'P'
		 dw_1.object.sol_qty[i] = lr_solqty + lr_canqoh		
	 end if
next

return true

end function

on w_ipautosale1_m.create
call super::create
end on

on w_ipautosale1_m.destroy
call super::destroy
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

select def_loc into :is_loc from area
 where area_no = :gs_area;
if gs_area = 'B0001' then
	dw_1.dataobject = 'd_mpautosale2_m'
	dw_1.settransobject(sqlca)
else
	dw_1.dataobject = 'd_mpautosale0_m'
	dw_1.settransobject(sqlca)
end if
//
end event

event resize;call super::resize;gb_2.width  = this.width  - 119
gb_2.height = this.height - 376

dw_1.width  = this.width  - 174
dw_1.height = this.height - 472

end event

type pb_save from w_inheritance`pb_save within w_ipautosale1_m
boolean visible = false
integer x = 3022
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_ipautosale1_m
integer y = 304
integer width = 3337
integer height = 1492
string dataobject = "d_mpautosale0_m"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ipautosale1_m
integer x = 46
integer y = 40
integer width = 1248
string text = "자동수주계산"
end type

type st_tips from w_inheritance`st_tips within w_ipautosale1_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipautosale1_m
integer x = 3017
integer y = 60
boolean enabled = false
end type

event pb_compute::clicked;long   ll_maxrow,ll_ret,ll_row,i,j,k,ll_num,ll_cnt
string ls_plan,ls_order,ls_qa,ls_item,ls_sujutype,ls_sale,ls_type
real   lr_qty,lr_orderqty,lr_solqty,lr_rlseqty,lr_planqty
integer li_seq

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ll_maxrow = dw_1.rowcount()
if ll_maxrow < 1 then return
if wf_alter(ll_maxrow) = true then
	if dw_1.update() = 1 then
		commit;
	else
		rollback;
	end if
end if
messagebox('확인','자동수주계산이 완료되었습니다.',information!)
commit;
end event

type pb_print_part from w_inheritance`pb_print_part within w_ipautosale1_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipautosale1_m
integer x = 3214
integer y = 60
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_ipautosale1_m
boolean visible = false
integer x = 2757
integer y = 60
end type

type pb_cancel from w_inheritance`pb_cancel within w_ipautosale1_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_ipautosale1_m
boolean visible = false
integer x = 2830
integer y = 60
end type

type pb_insert from w_inheritance`pb_insert within w_ipautosale1_m
boolean visible = false
integer x = 2638
integer y = 60
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipautosale1_m
integer x = 2821
integer y = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_ipautosale1_m
boolean visible = false
integer x = 1792
integer y = 256
integer width = 1641
integer height = 196
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_ipautosale1_m
integer x = 37
integer y = 240
integer width = 3392
integer height = 1588
long textcolor = 16711680
string text = "수주내역"
end type

type gb_1 from w_inheritance`gb_1 within w_ipautosale1_m
integer x = 2789
integer y = 20
integer width = 640
end type

type dw_2 from w_inheritance`dw_2 within w_ipautosale1_m
boolean visible = false
integer x = 1737
integer y = 28
integer width = 87
integer height = 44
string dataobject = "d_cdwc_c"
boolean vscrollbar = false
boolean border = false
end type

