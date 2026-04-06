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
end forward

global type w_mpdelete_m from w_inheritance
integer width = 3493
integer height = 2000
string title = "마감된생산주문삭제(w_mpdelete_m)"
long backcolor = 77897888
gb_15 gb_15
gb_4 gb_4
dw_area dw_area
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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_15
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.dw_area
end on

on w_mpdelete_m.destroy
call super::destroy
destroy(this.gb_15)
destroy(this.gb_4)
destroy(this.dw_area)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

is_select = dw_1.Describe("DataWindow.Table.Select")

// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천
end event

type pb_save from w_inheritance`pb_save within w_mpdelete_m
boolean visible = false
integer x = 3003
integer y = 56
end type

event pb_save::clicked;call super::clicked;wf_update2(dw_1,dw_2,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_mpdelete_m
integer y = 320
integer width = 3337
integer height = 1520
integer taborder = 60
string dataobject = "d_mpheder_t"
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

type dw_2 from w_inheritance`dw_2 within w_mpdelete_m
boolean visible = false
integer x = 1865
integer y = 48
integer width = 411
integer height = 128
integer taborder = 70
string dataobject = "d_mpsaledet4_m"
boolean border = false
end type

type st_title from w_inheritance`st_title within w_mpdelete_m
integer x = 41
integer width = 1637
string text = "마감된생산주문삭제"
end type

type st_tips from w_inheritance`st_tips within w_mpdelete_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpdelete_m
integer x = 2999
integer taborder = 100
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"마감",parent, li_x, li_y)

end event

event pb_compute::clicked;long ll_row,i,ll_rowcount,j
string ls_order,ls_wc,ls_sale,ls_plan,ls_item,ls_qa
integer li_ret,li_seq,li_division

li_ret = MessageBox("확인", "마감된 생산계획을 삭제하시겠습니까?",information!, OKCancel!, 2)
						  
if li_ret = 2 then return      

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ll_row = dw_1.rowcount()
OPEN(W_ICPROCESS)
	 
for i = 1 to ll_row
	w_icprocess.hpb_1.position = (i / ll_row) * 100
	ls_order = trim(dw_1.object.order_no[i])
   ll_rowcount = dw_2.retrieve(ls_order)
	for j = 1 to ll_rowcount
		li_division = dw_2.object.division[j]
		ls_plan   = trim(dw_2.object.plan_no[j])
		ls_item   = trim(dw_2.object.item_no[j])
		ls_qa   = trim(dw_2.object.qa[j])
		ls_wc   = trim(dw_2.object.wc_no[j])
		ls_sale = trim(dw_2.object.sale_no[j])
		li_seq  = dw_2.object.seq_no[j]
	   delete from routtempnew 
		 where division = :li_division and sale_no = :ls_sale and seq_no = :li_seq and 
		       assy_item = :ls_item and assy_qa = :ls_qa and wc_no = :ls_wc;
   	if sqlca.sqlcode < 0 then
	   	MessageBox("오류", "공정관리테이블(Routtempnew)에서 데이터 삭제중~r~n" & 
			                   + "DB 오류가 발생했습니다." ,exclamation!)
		   rollback;
		   return
	   end if
		delete from sudodet where order_no = :ls_plan;
   	if sqlca.sqlcode < 0 then
	   	MessageBox("오류", "외주가공테이블(Sudodet)에서 데이터 삭제중~r~n" & 
			                   + "DB 오류가 발생했습니다." ,exclamation!)
		   rollback;
		   return
	   end if		
		delete from sudodet1 where order_no = :ls_plan;
   	if sqlca.sqlcode < 0 then
	   	MessageBox("오류", "외주구매테이블(Sudodet)에서 데이터 삭제중~r~n" & 
			                   + "DB 오류가 발생했습니다." ,exclamation!)
		   rollback;
		   return
	   end if		
	next
	delete from mps where order_no like :ls_order;
	if sqlca.sqlcode < 0 then
   	MessageBox("오류", "생산계획헤더테이블(Mps)에서 데이터 삭제중~r~n" & 
			                   + "DB 오류가 발생했습니다." ,exclamation!)
		rollback;
		return
	end if

	delete from mpsdet where order_no like :ls_order;
	if sqlca.sqlcode < 0 then
   	MessageBox("오류", "생산계획디테일테이블(Mpsdet)에서 데이터 삭제중~r~n" & 
			        + "DB 오류가 발생했습니다." ,exclamation!)
		rollback;
		return
	end if	
next

commit;
close(W_ICPROCESS)
dw_1.reset()
MessageBox("확인", "성공적으로 삭제되었습니다." ,information!)
end event

type pb_print_part from w_inheritance`pb_print_part within w_mpdelete_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpdelete_m
integer x = 3195
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
integer x = 2802
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_where lstr_name
string ls_where

lstr_name.chk = 'N'
lstr_name.name = 'w_mpdelete_m'

openwithparm(w_whymd_w,lstr_name)

lstr_name = Message.PowerObjectParm	

if lstr_name.chk = 'Y' then
	gb_2.text = "계획기간 : " + lstr_name.str1 + " 에서 " + lstr_name.str2
	is_clause = " where mps.start_date between ~~'" + lstr_name.str1 + "~~' and ~~'" +lstr_name.str2 + "~~'" &
	          + " and mps.open_close = ~~'C~~'" + " and mps.area_no = ~~'" + trim(dw_area.object.area[1]) + "~~'"
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
integer y = 244
integer width = 3397
integer height = 1620
integer taborder = 90
long textcolor = 16711680
string text = "생산계획마감내역"
end type

type gb_1 from w_inheritance`gb_1 within w_mpdelete_m
boolean visible = false
integer x = 2555
integer y = 4
integer width = 91
integer taborder = 50
end type

type gb_15 from groupbox within w_mpdelete_m
integer x = 2139
integer y = 48
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

type gb_4 from groupbox within w_mpdelete_m
integer x = 2766
integer y = 12
integer width = 658
integer height = 204
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type dw_area from datawindow within w_mpdelete_m
integer x = 2176
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

