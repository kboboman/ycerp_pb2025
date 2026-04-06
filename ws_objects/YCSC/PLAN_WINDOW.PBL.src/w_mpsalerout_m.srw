$PBExportHeader$w_mpsalerout_m.srw
$PBExportComments$수주별 공정관리(2001/10/29, 이인호)
forward
global type w_mpsalerout_m from w_inheritance
end type
type cbx_1 from checkbox within w_mpsalerout_m
end type
type cbx_2 from checkbox within w_mpsalerout_m
end type
type st_1 from statictext within w_mpsalerout_m
end type
type sle_1 from singlelineedit within w_mpsalerout_m
end type
end forward

global type w_mpsalerout_m from w_inheritance
integer x = 5
integer y = 84
integer width = 3630
integer height = 2008
string title = "수주별 공정관리(w_mpsalerout_m)"
windowstate windowstate = normal!
cbx_1 cbx_1
cbx_2 cbx_2
st_1 st_1
sle_1 sle_1
end type
global w_mpsalerout_m w_mpsalerout_m

type variables
string is_order
end variables

on w_mpsalerout_m.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.st_1=create st_1
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.sle_1
end on

on w_mpsalerout_m.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.st_1)
destroy(this.sle_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

sle_1.text = 'HD' + string(today(),'yyyy')
end event

event resize;call super::resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 364

dw_1.width  = this.width  - 156
dw_1.height = this.height - 1004


end event

type pb_save from w_inheritance`pb_save within w_mpsalerout_m
integer x = 3150
integer y = 56
integer taborder = 40
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
wf_update1(dw_1,'Y')

end event

type dw_1 from w_inheritance`dw_1 within w_mpsalerout_m
integer x = 55
integer y = 340
integer width = 3474
integer height = 1004
integer taborder = 60
string dataobject = "d_mpsalerout_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;//long ll_row, ll_foundrow, ll_oper, ll_changed, ll_workper
//string ls_workname
//string ls_data,ls_item,ls_qa,ls_supp
//real lr_cost
//
//datawindowchild ldwc_work
//
//ll_row = dw_2.getrow()
//
//
//choose case dwo.name
//	case 'assy_item'
//		 if idwc_item.rowcount() < 1 then
//			 MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
//			 setnull(ls_data)
//			 this.object.assy_item[row] = ls_data
//			 return 1
//		 end if
//		 if trim(data) <> trim(idwc_item.getitemstring(idwc_item.getrow(),'item_no')) then
//			 MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
//			 return 1
//		 end if
//		 this.object.item_name2[row] = idwc_item.getitemstring(idwc_item.getrow(),'item_name')
//		 is_clause = " where item_no = ~~'" + trim(data) + "~~'"
//       is_where = "DataWindow.Table.Select='"  + is_select1 + is_clause + "'"
//       idwc_qa.Modify(is_where)
//		 idwc_qa.settransobject(sqlca)
//		  if idwc_qa.retrieve() = 1 then
//			  ls_qa = trim(idwc_qa.getitemstring(1,'qa'))
//			  this.object.assy_qa[row] = ls_qa
//			  goto label_qa
//	     else
//			  setnull(ls_item)
//			  this.object.assy_qa[row] = ls_item
//		  end if
//	case 'assy_qa'
//label_qa:		
//		 
//end choose
//
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

this.scrolltorow(row)
if cbx_1.checked = true then
	this.SelectRow(row, NOT this.IsSelected(row))
end if

end event

type dw_2 from w_inheritance`dw_2 within w_mpsalerout_m
integer x = 55
integer y = 1364
integer width = 1678
integer height = 472
integer taborder = 70
string dataobject = "d_mpsalerout_s"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;if row < 1 then return

this.scrolltorow(row)

end event

type st_title from w_inheritance`st_title within w_mpsalerout_m
integer x = 32
integer width = 1143
string text = "수주별 공정관리"
end type

type st_tips from w_inheritance`st_tips within w_mpsalerout_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsalerout_m
integer x = 1755
integer y = 1364
integer taborder = 90
end type

event pb_compute::clicked;long   ll_row1, ll_row2
string ls_chk

dw_2.accepttext()
ls_chk = 'N'
for ll_row2 = 1 to dw_2.rowcount()
	if dw_2.object.chk[ll_row2] = 'Y' then
		if dw_2.object.to_wc[ll_row2] = '' or isnull(dw_2.object.to_wc[ll_row2]) then
			messagebox("확인","변경할 작업장내역을 선택하십시요")
			dw_2.setfocus()
			return
		else
			ls_chk = 'Y'
		end if
	end if
next

if ls_chk = 'N' then
	messagebox("확인","변경할 작업장내역을 선택하십시요")
	dw_2.setfocus()
	return
end if

ls_chk = 'N'
for ll_row1 = 1 to dw_1.rowcount()
	if dw_1.isselected(ll_row1) = true then
		ls_chk = 'Y'
	end if
next

if ls_chk = 'N' then
	if messagebox("확인","선택내역이 없습니다. 전체내역으로 확장 하시겠습니까?" ,&
			Exclamation!, OKCancel!, 1) =  1 then
			cbx_2.checked = true
			cbx_2.triggerevent(clicked!)
	else
		return
	end if
end if

for ll_row2 = 1 to dw_2.rowcount()
	if dw_2.object.chk[ll_row2] = 'Y' then
		for ll_row1 = 1 to dw_1.rowcount()
			if dw_1.isselected(ll_row1) = true then
				if dw_2.object.operation[ll_row2] = dw_1.object.operation[ll_row1] then
					dw_1.object.wc_no[ll_row1] = dw_2.object.to_wc[ll_row2]
				end if
			end if
		next
	end if
next

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpsalerout_m
boolean visible = false
integer taborder = 30
end type

type pb_close from w_inheritance`pb_close within w_mpsalerout_m
integer x = 3342
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;Close(parent)

end event

type pb_print from w_inheritance`pb_print within w_mpsalerout_m
boolean visible = false
integer x = 3342
integer y = 720
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpsalerout_m
integer x = 2958
integer y = 56
integer taborder = 120
end type

event pb_cancel::clicked;dw_1.reset()
dw_2.reset()


end event

type pb_delete from w_inheritance`pb_delete within w_mpsalerout_m
boolean visible = false
integer x = 2747
integer y = 44
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_mpsalerout_m
boolean visible = false
integer x = 2629
integer y = 72
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsalerout_m
event ue_1 pbm_custom01
integer x = 2757
integer y = 56
integer taborder = 10
end type

event pb_retrieve::ue_1;
is_order = trim(sle_1.text)
dw_1.retrieve(is_order)
dw_2.retrieve(is_order)
sle_1.setfocus()
end event

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

this.postevent('ue_1')
end event

type gb_3 from w_inheritance`gb_3 within w_mpsalerout_m
integer x = 1262
integer y = 12
integer width = 594
integer height = 204
integer taborder = 0
integer textsize = -9
long textcolor = 8388608
string text = "수주번호"
end type

type gb_2 from w_inheritance`gb_2 within w_mpsalerout_m
integer y = 220
integer width = 3525
integer height = 1644
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_mpsalerout_m
integer x = 2711
integer width = 846
integer taborder = 50
integer textsize = -10
end type

type cbx_1 from checkbox within w_mpsalerout_m
integer x = 1673
integer y = 268
integer width = 242
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "선택"
end type

type cbx_2 from checkbox within w_mpsalerout_m
integer x = 1925
integer y = 268
integer width = 357
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;dw_1.selectrow(0, this.checked)
cbx_1.checked = this.checked

end event

type st_1 from statictext within w_mpsalerout_m
integer x = 55
integer y = 272
integer width = 1582
integer height = 60
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
string text = "※선택된 계획만 변경 작업장으로 적용 됩니다."
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_mpsalerout_m
integer x = 1312
integer y = 92
integer width = 489
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event losefocus;pb_retrieve.DEFAULT = false

end event

event getfocus;pb_retrieve.DEFAULT = true

end event

