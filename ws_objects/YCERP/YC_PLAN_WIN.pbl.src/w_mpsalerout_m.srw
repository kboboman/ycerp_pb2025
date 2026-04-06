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
type st_2 from statictext within w_mpsalerout_m
end type
type st_3 from statictext within w_mpsalerout_m
end type
type st_5 from statictext within w_mpsalerout_m
end type
type ddlb_fld from dropdownlistbox within w_mpsalerout_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsalerout_m
end type
type st_6 from statictext within w_mpsalerout_m
end type
type ddlb_op from dropdownlistbox within w_mpsalerout_m
end type
type sle_value from singlelineedit within w_mpsalerout_m
end type
type cb_1 from commandbutton within w_mpsalerout_m
end type
type cb_2 from commandbutton within w_mpsalerout_m
end type
type cb_3 from commandbutton within w_mpsalerout_m
end type
type cb_5 from commandbutton within w_mpsalerout_m
end type
type st_horizontal from u_splitbar_horizontal within w_mpsalerout_m
end type
end forward

global type w_mpsalerout_m from w_inheritance
integer x = 5
integer y = 84
integer width = 4037
integer height = 2344
string title = "수주별 공정관리(w_mpsalerout_m)"
cbx_1 cbx_1
cbx_2 cbx_2
st_1 st_1
sle_1 sle_1
st_2 st_2
st_3 st_3
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
st_horizontal st_horizontal
end type
global w_mpsalerout_m w_mpsalerout_m

type variables
string is_dw, is_order
end variables

on w_mpsalerout_m.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.st_1=create st_1
this.sle_1=create sle_1
this.st_2=create st_2
this.st_3=create st_3
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
this.st_horizontal=create st_horizontal
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.st_horizontal
end on

on w_mpsalerout_m.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.st_3)
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
destroy(this.st_horizontal)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_bottomobject(dw_1)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

sle_1.text = 'HD' + string(today(),'yyyy')

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_2.width  = newwidth  - (gb_3.x * 2)

st_horizontal.width   = newwidth - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_mpsalerout_m
integer x = 2199
integer y = 64
integer taborder = 40
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
wf_update1(dw_1,'Y')
MessageBox("확인","작업완료")

end event

type dw_1 from w_inheritance`dw_1 within w_mpsalerout_m
integer x = 32
integer y = 984
integer width = 3927
integer height = 1212
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

event dw_1::clicked;//
if isnull(row) OR row < 1 then RETURN
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if cbx_1.checked = true then
	this.SelectRow(row, NOT this.IsSelected(row))
end if

end event

type st_title from w_inheritance`st_title within w_mpsalerout_m
integer x = 32
integer y = 20
integer width = 1088
integer height = 136
string text = "수주별 공정관리"
end type

type st_tips from w_inheritance`st_tips within w_mpsalerout_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsalerout_m
integer x = 2757
integer y = 284
integer width = 169
integer height = 128
integer taborder = 90
end type

event pb_compute::clicked;//
long   ll_row1, ll_row2
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
	if messagebox("확인","선택내역이 없습니다. 전체내역으로 확장 하시겠습니까?", Exclamation!, OKCancel!, 1) =  1 then
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
MessageBox("확인","저장하시기 바랍니다.")

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpsalerout_m
boolean visible = false
integer taborder = 30
end type

type pb_close from w_inheritance`pb_close within w_mpsalerout_m
integer x = 2391
integer y = 64
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
integer x = 2007
integer y = 64
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
integer x = 1806
integer y = 64
integer taborder = 10
end type

event pb_retrieve::ue_1;//
debugbreak()
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
integer x = 32
integer y = 244
integer width = 3927
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_2 from w_inheritance`gb_2 within w_mpsalerout_m
integer x = 1193
integer y = 16
integer width = 558
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpsalerout_m
integer x = 1774
integer y = 16
integer width = 846
integer height = 216
integer taborder = 50
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsalerout_m
integer x = 32
integer y = 444
integer width = 3927
integer height = 496
integer taborder = 70
string dataobject = "d_mpsalerout_s"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;//
if isnull(row) OR row < 1 then RETURN
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type cbx_1 from checkbox within w_mpsalerout_m
integer x = 64
integer y = 352
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
integer x = 64
integer y = 292
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
string text = "전체"
end type

event clicked;dw_1.selectrow(0, this.checked)
cbx_1.checked = this.checked

end event

type st_1 from statictext within w_mpsalerout_m
integer x = 2674
integer y = 80
integer width = 942
integer height = 104
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
integer x = 1225
integer y = 132
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

event losefocus;//
pb_retrieve.DEFAULT = false

end event

event getfocus;//
pb_retrieve.DEFAULT = true

end event

type st_2 from statictext within w_mpsalerout_m
integer x = 1225
integer y = 56
integer width = 489
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "수주번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpsalerout_m
integer x = 2944
integer y = 300
integer width = 786
integer height = 104
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "<= 작업장 변경 후 클릭하시기 바랍니다."
boolean focusrectangle = false
end type

type st_5 from statictext within w_mpsalerout_m
integer x = 338
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

type ddlb_fld from dropdownlistbox within w_mpsalerout_m
integer x = 526
integer y = 308
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_mpsalerout_m
integer x = 558
integer y = 316
integer width = 311
integer height = 88
integer taborder = 110
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

type st_6 from statictext within w_mpsalerout_m
integer x = 997
integer y = 320
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

type ddlb_op from dropdownlistbox within w_mpsalerout_m
integer x = 1166
integer y = 304
integer width = 297
integer height = 512
integer taborder = 110
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

type sle_value from singlelineedit within w_mpsalerout_m
integer x = 1486
integer y = 308
integer width = 567
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_mpsalerout_m
integer x = 2057
integer y = 308
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpsalerout_m
integer x = 2222
integer y = 308
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
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

type cb_3 from commandbutton within w_mpsalerout_m
integer x = 2386
integer y = 308
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsalerout_m
integer x = 2551
integer y = 308
integer width = 160
integer height = 76
integer taborder = 120
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
	case "dw_2"
		arg_dw  = dw_2
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_horizontal from u_splitbar_horizontal within w_mpsalerout_m
integer x = 32
integer y = 952
integer width = 3927
boolean bringtotop = true
end type

