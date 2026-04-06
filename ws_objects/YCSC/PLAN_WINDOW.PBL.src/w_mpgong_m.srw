$PBExportHeader$w_mpgong_m.srw
$PBExportComments$공정관리(1998/06/24,곽용덕)
forward
global type w_mpgong_m from w_inheritance
end type
end forward

global type w_mpgong_m from w_inheritance
integer x = 146
integer y = 676
integer width = 3333
integer height = 1156
string title = "공정관리(w_mpgong_m)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
end type
global w_mpgong_m w_mpgong_m

type variables
long il_operation
string is_select,is_where,is_clause
string is_select1,is_where1,is_clause1
datawindowchild idwc_item,idwc_qa
string is_chk ='N'
ws_process st_process

end variables

on w_mpgong_m.create
call super::create
end on

on w_mpgong_m.destroy
call super::destroy
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1

st_process = Message.PowerObjectParm
il_operation = st_process.operation

//dw_1.getchild('assy_item',idwc_item)
//idwc_item.settransobject(sqlca)
//
if st_process.ud = "U" then
	dw_1.dataobject = 'd_mpgong_update_m'
else
	dw_1.dataobject = 'd_mpgong_delete_m'
end if
dw_1.SetTransObject(SQLCA)
if st_process.ud = "U" then
	dw_1.getchild("assy_item", idwc_item)
	gs_ds_itemall.ShareData(idwc_item)
	dw_1.getchild('assy_qa',idwc_qa)
	idwc_qa.settransobject(sqlca)
	is_select1 = idwc_qa.Describe("DataWindow.Table.Select")
end if

dw_1.retrieve(st_process.division,st_process.sale_no,st_process.seq_no,st_process.operation)

end event

type pb_save from w_inheritance`pb_save within w_mpgong_m
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,'Y')
is_chk = "Y"
end event

type dw_1 from w_inheritance`dw_1 within w_mpgong_m
integer x = 59
integer width = 3200
integer height = 728
string dataobject = "d_mpgong_delete_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;long ll_row, ll_foundrow, ll_oper, ll_changed, ll_workper
string ls_workname
string ls_data,ls_item,ls_qa,ls_supp
real lr_cost

datawindowchild ldwc_work

ll_row = dw_2.getrow()


choose case dwo.name
	case 'assy_item'
		 if idwc_item.rowcount() < 1 then
			 MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			 setnull(ls_data)
			 this.object.assy_item[row] = ls_data
			 return 1
		 end if
		 if trim(data) <> trim(idwc_item.getitemstring(idwc_item.getrow(),'item_no')) then
			 MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			 return 1
		 end if
		 this.object.item_name2[row] = idwc_item.getitemstring(idwc_item.getrow(),'item_name')
		 is_clause = " where item_no = ~~'" + trim(data) + "~~'"
       is_where = "DataWindow.Table.Select='"  + is_select1 + is_clause + "'"
       idwc_qa.Modify(is_where)
		 idwc_qa.settransobject(sqlca)
		  if idwc_qa.retrieve() = 1 then
			  ls_qa = trim(idwc_qa.getitemstring(1,'qa'))
			  this.object.assy_qa[row] = ls_qa
			  goto label_qa
	     else
			  setnull(ls_item)
			  this.object.assy_qa[row] = ls_item
		  end if
	case 'assy_qa'
label_qa:		
		 
end choose

end event

event dw_1::itemerror;long ll_row, ll_row1, ll_foundrow
string ls_data,ls_item

setnull(ls_data)
choose case dwo.name
	case 'assy_item'
        this.object.assy_item[row] = ls_data
	case 'assy_qa'
		  this.object.assy_qa[row] = ls_data
end choose

return 2
end event

event dw_1::clicked;if row < 1 then return

//this.scrolltorow(row)
end event

type dw_2 from w_inheritance`dw_2 within w_mpgong_m
boolean visible = false
integer x = 1591
integer y = 76
integer width = 777
integer height = 100
end type

type st_title from w_inheritance`st_title within w_mpgong_m
integer width = 1477
string text = "공정관리"
end type

type st_tips from w_inheritance`st_tips within w_mpgong_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpgong_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpgong_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpgong_m
end type

event pb_close::clicked;st_process.ud = is_chk
CloseWithReturn(parent, st_process)

end event

type pb_print from w_inheritance`pb_print within w_mpgong_m
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpgong_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_mpgong_m
integer x = 2688
end type

event pb_delete::clicked;string ls_item,ls_item1,ls_qa,ls_qa1
long ll_row,ll_rowcount,i,ll_operation

ll_row = dw_1.getrow()
ls_item = trim(dw_1.object.item_no[ll_row])
ls_qa = trim(dw_1.object.qa[ll_row])
ls_item1 = trim(dw_1.object.assy_item[ll_row])
ls_qa1 = trim(dw_1.object.assy_qa[ll_row])

if ls_item = ls_item1 and ls_qa = ls_qa1 then
	if messagebox('확인','마지막 공정입니다 삭제하시겠습니까?',  Exclamation!, OKCancel!, 2) = 2 then
		return
//	else
//		dw_1.object.process_flag[ll_row] = 'C'
	end if
else
	dw_1.deleterow(0)
	ll_rowcount = dw_1.rowcount()
	ll_operation = il_operation - 1 
	for i = 1 to ll_rowcount
		 dw_1.object.operation[i] = ll_operation + 1 
	next
end if

end event

type pb_insert from w_inheritance`pb_insert within w_mpgong_m
boolean visible = false
integer x = 2496
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpgong_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_mpgong_m
boolean visible = false
integer x = 1577
integer y = 32
integer width = 823
integer height = 168
end type

type gb_2 from w_inheritance`gb_2 within w_mpgong_m
integer width = 3255
integer height = 808
end type

type gb_1 from w_inheritance`gb_1 within w_mpgong_m
integer x = 2661
integer width = 626
end type

