$PBExportHeader$w_oishipcost_r.srw
$PBExportComments$거래처별 운송비 대여현황 (1998/09/24, 정재수)
forward
global type w_oishipcost_r from w_inheritance
end type
type dw_3 from datawindow within w_oishipcost_r
end type
type em_1 from editmask within w_oishipcost_r
end type
type em_2 from editmask within w_oishipcost_r
end type
type st_1 from statictext within w_oishipcost_r
end type
type rb_1 from radiobutton within w_oishipcost_r
end type
type rb_2 from radiobutton within w_oishipcost_r
end type
type ddlb_1 from dropdownlistbox within w_oishipcost_r
end type
type pb_1 from picturebutton within w_oishipcost_r
end type
type st_3 from statictext within w_oishipcost_r
end type
type ddlb_fld from dropdownlistbox within w_oishipcost_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oishipcost_r
end type
type st_4 from statictext within w_oishipcost_r
end type
type ddlb_op from dropdownlistbox within w_oishipcost_r
end type
type sle_value from singlelineedit within w_oishipcost_r
end type
type cb_1 from commandbutton within w_oishipcost_r
end type
type cb_2 from commandbutton within w_oishipcost_r
end type
type cb_3 from commandbutton within w_oishipcost_r
end type
type cb_5 from commandbutton within w_oishipcost_r
end type
type cbx_hap from checkbox within w_oishipcost_r
end type
type cbx_haphd from checkbox within w_oishipcost_r
end type
type gb_4 from groupbox within w_oishipcost_r
end type
end forward

global type w_oishipcost_r from w_inheritance
integer y = 112
integer width = 4293
integer height = 2164
string title = "거래처별 운송비 현황(w_oishipcost_r)"
dw_3 dw_3
em_1 em_1
em_2 em_2
st_1 st_1
rb_1 rb_1
rb_2 rb_2
ddlb_1 ddlb_1
pb_1 pb_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_hap cbx_hap
cbx_haphd cbx_haphd
gb_4 gb_4
end type
global w_oishipcost_r w_oishipcost_r

type variables
int ii_sel = 1
datawindowchild idwc_sel 

end variables

on w_oishipcost_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.ddlb_1=create ddlb_1
this.pb_1=create pb_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_hap=create cbx_hap
this.cbx_haphd=create cbx_haphd
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.ddlb_1
this.Control[iCurrent+8]=this.pb_1
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.cbx_hap
this.Control[iCurrent+20]=this.cbx_haphd
this.Control[iCurrent+21]=this.gb_4
end on

on w_oishipcost_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.ddlb_1)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_hap)
destroy(this.cbx_haphd)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_3.visible = false

//
dw_2.getchild('draft',idwc_sel )
idwc_sel.settransobject(sqlca)
idwc_sel.insertrow(1)
dw_2.insertrow(0)

ddlb_1.text = '거래처'

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

dw_1.sharedata(dw_3)
end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

dw_1.width  = newwidth  - (gb_4.x * 2)
dw_1.height = newheight - dw_1.y - gb_4.x


end event

type pb_save from w_inheritance`pb_save within w_oishipcost_r
boolean visible = false
integer taborder = 60
end type

type dw_1 from w_inheritance`dw_1 within w_oishipcost_r
integer x = 32
integer y = 448
integer width = 4192
integer height = 1560
integer taborder = 0
string title = "d_oishipcost_r"
string dataobject = "d_oishipcost_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_oishipcost_r
integer x = 2533
integer y = 132
integer width = 782
integer height = 92
integer taborder = 10
boolean enabled = false
string dataobject = "d_oishipcostrep_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event editchanged;datawindowchild ldwc_draft
string ls_data
long ll_found,ll_row
int li_line

this.getchild("draft", ldwc_draft)
ldwc_draft.settransobject(sqlca)

choose case dwo.name
	case 'draft'
		 ls_data = data + '%'
		 ll_row = ldwc_draft.RowCount( )
		 ll_found = ldwc_draft.Find("cust_name like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("draft.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 ldwc_draft.scrolltorow(ll_found)
end choose

RETURN 0
end event

type st_title from w_inheritance`st_title within w_oishipcost_r
integer x = 32
integer y = 20
integer width = 1362
integer height = 144
string text = "거래처별 운송비 현황"
end type

type st_tips from w_inheritance`st_tips within w_oishipcost_r
end type

type pb_compute from w_inheritance`pb_compute within w_oishipcost_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oishipcost_r
boolean visible = false
integer taborder = 50
end type

type pb_close from w_inheritance`pb_close within w_oishipcost_r
integer x = 4005
integer y = 64
integer taborder = 40
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oishipcost_r
integer x = 3808
integer y = 64
integer taborder = 30
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
string ls_cust_no
date ld_start, ld_end

if em_1.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

ld_start = date(em_1.text)
ld_end = date(em_2.text)
if rb_1.checked = true then
	dw_3.retrieve(ld_start, ld_end)
	l_print.name = 'd_oishipcostrep_r1'
else
	dw_2.accepttext()
	ls_cust_no = dw_2.getitemstring(dw_2.getrow(), "draft")

	if ls_cust_no = '' or isnull(ls_cust_no) then
		messagebox("확인","거래처를 선택하세요!",information!)
		dw_2.setfocus()
		return
	end if

	dw_3.retrieve(ls_cust_no, ld_start, ld_end)	
	l_print.name = 'd_oishipcostrep_r'
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 발행자별 어음현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oishipcost_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_oishipcost_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_oishipcost_r
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oishipcost_r
integer x = 3415
integer y = 64
integer taborder = 20
end type

event pb_retrieve::clicked;//
string ls_cust_no
date   ld_start, ld_end

if rb_1.checked = true then
	if em_1.text = '' then
		messagebox("확인","출고기간을 입력하세요!",information!)
		em_1.setfocus()
		return
	elseif em_2.text = '' then
		messagebox("확인","출고기간을 입력하세요!",information!)
		em_2.setfocus()
		return
	elseif em_1.text > em_2.text then
		messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
		em_1.setfocus()
		return
	end if
	
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)

	dw_1.retrieve(ld_start, ld_end)	
else
	dw_2.accepttext()
	
	ls_cust_no = dw_2.getitemstring(dw_2.getrow(), "draft")

	if ls_cust_no = '' or isnull(ls_cust_no) then
		messagebox("확인", ddlb_1.text + "를 선택하세요!",information!)
		dw_2.setfocus()
		return
	elseif em_1.text = '' then
		messagebox("확인","출고기간을 입력하세요!",information!)
		em_1.setfocus()
		return
	elseif em_2.text = '' then
		messagebox("확인","출고기간을 입력하세요!",information!)
		em_2.setfocus()
		return
	elseif em_1.text > em_2.text then
		messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
		em_1.setfocus()
		return
	end if
	
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)

	dw_1.retrieve(ls_cust_no, ld_start, ld_end)	
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


end event

type gb_3 from w_inheritance`gb_3 within w_oishipcost_r
integer x = 1431
integer y = 16
integer width = 800
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_oishipcost_r
integer x = 2249
integer y = 16
integer width = 1111
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oishipcost_r
integer x = 3378
integer y = 16
integer width = 846
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_3 from datawindow within w_oishipcost_r
integer x = 55
integer y = 188
integer width = 101
integer height = 76
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_oishipcostrep_r"
boolean livescroll = true
end type

type em_1 from editmask within w_oishipcost_r
integer x = 1458
integer y = 136
integer width = 370
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oishipcost_r
integer x = 1833
integer y = 136
integer width = 370
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oishipcost_r
integer x = 1458
integer y = 56
integer width = 745
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "출고기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oishipcost_r
integer x = 2295
integer y = 68
integer width = 229
integer height = 68
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
boolean checked = true
end type

event clicked;//
dw_1.dataobject = 'd_oishipcost_r'
dw_1.settransobject(sqlca)

dw_3.dataobject = 'd_oishipcostrep_r'
dw_3.settransobject(sqlca)

dw_2.enabled = false
dw_2.object.draft.background.color = 78682240
end event

type rb_2 from radiobutton within w_oishipcost_r
integer x = 2295
integer y = 144
integer width = 233
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부분"
end type

event clicked;if this.checked = false then return

string ls_select, ls_clause


dw_2.enabled = true
dw_2.object.draft.background.color = 1087434968

CHOOSE CASE ii_sel
	CASE 1 //거래처
		dw_1.dataobject = 'd_oishipcost_r1'
		dw_3.dataobject = 'd_oishipcostrep_r1'
		dw_2.Modify("draft.dddw.Name='d_oishipcost_dddw'")
		dw_2.Modify("draft.dddw.displayColumn='cust_name'")
		dw_2.Modify("draft.dddw.DataColumn='customer_cust_no'")
		dw_2.Modify("draft.dddw.percentwidth='120'")

	CASE 2 //담당자
		dw_1.dataobject = 'd_oishipcost_r2'
		dw_3.dataobject = 'd_oishipcostrep_r2'
		dw_2.Modify("draft.dddw.Name='d_whsale_login_c'")
		dw_2.Modify("draft.dddw.displayColumn='user_name'")
		dw_2.Modify("draft.dddw.DataColumn='user_id'")
		dw_2.Modify("draft.dddw.percentwidth='100'")
	CASE 3 //차량no
		dw_1.dataobject = 'd_oishipcost_r3'
		dw_3.dataobject = 'd_oishipcostrep_r3'
		dw_2.Modify("draft.dddw.Name='d_cddocar_c'")
		dw_2.Modify("draft.dddw.displayColumn='name'")
		dw_2.Modify("draft.dddw.DataColumn='driver'")
		dw_2.Modify("draft.dddw.percentwidth='250'")
END CHOOSE
dw_2.Modify("draft.dddw.allowedit=yes")
dw_2.Modify("draft.dddw.vscrollbar=yes")
dw_2.getchild('draft',idwc_sel)
idwc_sel.settransobject(sqlca)
idwc_sel.retrieve()

//ls_select = idwc_sel.Describe("DataWindow.Table.Select")
//
//ls_clause = "DataWindow.Table.Select='"  + ls_select + "'"
//idwc_sel.modify(ls_clause)

dw_1.settransobject(sqlca)
dw_3.settransobject(sqlca)
//if idwc_sel.retrieve() > 0 then
//	idwc_sel.SetSort("unit_qty , draft")
//	idwc_sel.Sort( )
//end if

return
end event

type ddlb_1 from dropdownlistbox within w_oishipcost_r
integer x = 2533
integer y = 52
integer width = 421
integer height = 336
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"거래처","담당자","차량no"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_sel = index
rb_2.triggerevent(clicked!)
dw_2.setfocus()
end event

type pb_1 from picturebutton within w_oishipcost_r
event mousemove pbm_mousemove
integer x = 3611
integer y = 64
integer width = 187
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_3 from statictext within w_oishipcost_r
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

type ddlb_fld from dropdownlistbox within w_oishipcost_r
integer x = 274
integer y = 308
integer width = 480
integer height = 632
integer taborder = 90
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

type ddlb_dwtitles from dropdownlistbox within w_oishipcost_r
integer x = 315
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

type st_4 from statictext within w_oishipcost_r
integer x = 773
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

type ddlb_op from dropdownlistbox within w_oishipcost_r
integer x = 942
integer y = 308
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_oishipcost_r
integer x = 1262
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

type cb_1 from commandbutton within w_oishipcost_r
integer x = 1833
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

type cb_2 from commandbutton within w_oishipcost_r
integer x = 1998
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

type cb_3 from commandbutton within w_oishipcost_r
integer x = 2162
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

type cb_5 from commandbutton within w_oishipcost_r
integer x = 2327
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

type cbx_hap from checkbox within w_oishipcost_r
integer x = 2533
integer y = 296
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;// 합계만 보기
cbx_haphd.checked = false

dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")		
	dw_1.Modify("DataWindow.Trailer.2.Height=0")	
	dw_1.Modify("DataWindow.Trailer.1.Height=80")
else
	dw_1.Modify("DataWindow.Detail.Height=80")	
	dw_1.Modify("DataWindow.Trailer.2.Height=80")
	dw_1.Modify("DataWindow.Trailer.1.Height=80")
end if
dw_1.setredraw( true )

end event

type cbx_haphd from checkbox within w_oishipcost_r
integer x = 2533
integer y = 356
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계숨김"
end type

event clicked;// 합계숨김
cbx_hap.checked = false

dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=80")	
	dw_1.Modify("DataWindow.Trailer.2.Height=0")	
	dw_1.Modify("DataWindow.Trailer.1.Height=0")	
else
	dw_1.Modify("DataWindow.Detail.Height=80")	
	dw_1.Modify("DataWindow.Trailer.2.Height=80")
	dw_1.Modify("DataWindow.Trailer.1.Height=80")
end if
dw_1.setredraw( true )

end event

type gb_4 from groupbox within w_oishipcost_r
integer x = 32
integer y = 244
integer width = 4192
integer height = 188
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

