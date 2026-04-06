$PBExportHeader$w_oidoitempricezero_r.srw
$PBExportComments$물품단가 = 0 제품출고현황(1999/5/21,조현춘)
forward
global type w_oidoitempricezero_r from w_inheritance
end type
type cbx_1 from checkbox within w_oidoitempricezero_r
end type
type cbx_2 from checkbox within w_oidoitempricezero_r
end type
type pb_1 from picturebutton within w_oidoitempricezero_r
end type
type st_3 from statictext within w_oidoitempricezero_r
end type
type ddlb_fld from dropdownlistbox within w_oidoitempricezero_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oidoitempricezero_r
end type
type st_4 from statictext within w_oidoitempricezero_r
end type
type sle_value from singlelineedit within w_oidoitempricezero_r
end type
type cb_1 from commandbutton within w_oidoitempricezero_r
end type
type cb_2 from commandbutton within w_oidoitempricezero_r
end type
type cb_3 from commandbutton within w_oidoitempricezero_r
end type
type cb_5 from commandbutton within w_oidoitempricezero_r
end type
type st_6 from statictext within w_oidoitempricezero_r
end type
type dw_area from datawindow within w_oidoitempricezero_r
end type
type st_8 from statictext within w_oidoitempricezero_r
end type
type dw_cust from datawindow within w_oidoitempricezero_r
end type
type st_7 from statictext within w_oidoitempricezero_r
end type
type em_1 from editmask within w_oidoitempricezero_r
end type
type em_2 from editmask within w_oidoitempricezero_r
end type
type cbx_hap from checkbox within w_oidoitempricezero_r
end type
type cbx_haphd from checkbox within w_oidoitempricezero_r
end type
type ddlb_op from dropdownlistbox within w_oidoitempricezero_r
end type
type gb_4 from groupbox within w_oidoitempricezero_r
end type
type gb_5 from groupbox within w_oidoitempricezero_r
end type
end forward

global type w_oidoitempricezero_r from w_inheritance
integer y = 112
integer width = 5001
integer height = 2236
string title = "물품별 출고현황(단가=0)(w_oidoitempricezero_r)"
cbx_1 cbx_1
cbx_2 cbx_2
pb_1 pb_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_6 st_6
dw_area dw_area
st_8 st_8
dw_cust dw_cust
st_7 st_7
em_1 em_1
em_2 em_2
cbx_hap cbx_hap
cbx_haphd cbx_haphd
ddlb_op ddlb_op
gb_4 gb_4
gb_5 gb_5
end type
global w_oidoitempricezero_r w_oidoitempricezero_r

type variables
//
DataWindowChild idwc_area, idwc_cust
st_print i_print
gs_itemdo_str1 ist_code
string is_itemdosql

end variables

on w_oidoitempricezero_r.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.pb_1=create pb_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_6=create st_6
this.dw_area=create dw_area
this.st_8=create st_8
this.dw_cust=create dw_cust
this.st_7=create st_7
this.em_1=create em_1
this.em_2=create em_2
this.cbx_hap=create cbx_hap
this.cbx_haphd=create cbx_haphd
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.dw_area
this.Control[iCurrent+15]=this.st_8
this.Control[iCurrent+16]=this.dw_cust
this.Control[iCurrent+17]=this.st_7
this.Control[iCurrent+18]=this.em_1
this.Control[iCurrent+19]=this.em_2
this.Control[iCurrent+20]=this.cbx_hap
this.Control[iCurrent+21]=this.cbx_haphd
this.Control[iCurrent+22]=this.ddlb_op
this.Control[iCurrent+23]=this.gb_4
this.Control[iCurrent+24]=this.gb_5
end on

on w_oidoitempricezero_r.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_6)
destroy(this.dw_area)
destroy(this.st_8)
destroy(this.dw_cust)
destroy(this.st_7)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.cbx_hap)
destroy(this.cbx_haphd)
destroy(this.ddlb_op)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

is_itemdosql = dw_1.describe("datawindow.table.select")

dw_2.visible = false
dw_1.sharedata(dw_2)

// 일자
em_1.text     = string(today(), "yyyy/mm/01")
em_2.text     = string(today(), "yyyy/mm/dd")

// 사업장 
string ls_area
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = "%"	// gs_area
dw_area.object.area[1] = ls_area

// 거래처
//dw_1.object.cust_no.Background.Color = 67108864
dw_cust.SetTransObject(SQLCA)
dw_cust.GetChild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

idwc_cust.retrieve( "%" )
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체거래처")
idwc_cust.accepttext()
dw_cust.object.cust_no[1] = "%"
dw_cust.insertrow(0)  


end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x



end event

type pb_save from w_inheritance`pb_save within w_oidoitempricezero_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oidoitempricezero_r
integer x = 32
integer y = 424
integer width = 4219
integer height = 1672
integer taborder = 0
string dataobject = "d_oidoitempricezero_s"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oidoitempricezero_r
integer x = 0
integer y = 0
integer width = 1691
integer height = 140
string text = "물품별 출고현황(출고금액=0)"
end type

type st_tips from w_inheritance`st_tips within w_oidoitempricezero_r
end type

type pb_compute from w_inheritance`pb_compute within w_oidoitempricezero_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidoitempricezero_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oidoitempricezero_r
integer x = 4617
integer y = 72
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidoitempricezero_r
integer x = 4425
integer y = 72
integer taborder = 20
end type

event pb_print::clicked;gs_itemdo_str lst_code
w_repsuper w_print
long   ll_count

if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

FOR ll_count = 1 TO dw_2.rowcount()
//   dw_2.object.customer_industry_code[ll_count] = st_1.text
	dw_2.object.customer_bus_cord[ll_count] = em_1.text
	dw_2.object.customer_bus_rep[ll_count]  = em_2.text
NEXT

i_print.name = 'd_oidoitempricezero_r'
i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 제품별 수주현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oidoitempricezero_r
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oidoitempricezero_r
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oidoitempricezero_r
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidoitempricezero_r
integer x = 4037
integer y = 72
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_area, ls_custno, ls_itemno, ls_sql, ls_where, ls_sdate, ls_edate, ls_panel, ls_inside
date   ld_sdate, ld_edate

//OpenWithParm(w_whitemdo_w, ist_code)
//ist_code = message.powerobjectparm
//if ist_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 사업장
dw_area.AcceptText()
ls_area = dw_area.object.area[1]

// 거래처
dw_cust.AcceptText()
ls_custno = dw_cust.object.cust_no[1]

// 품목선택
gs_where2 lst_whitemret

lst_whitemret.chk = "S"
OpenWithParm( w_whitemselectmulti_w, lst_whitemret )
lst_whitemret = Message.PowerObjectParm

if lst_whitemret.chk = "Y" then
	ls_itemno = lst_whitemret.str1[1]
else
	ls_itemno = "%"
end if

/* 계열사
N012	판매본부, N013  에코사업본부,N014	(주)유창플러스 ,N002	(주)세화내장건설,H479	(주)유창강건    
*/
if cbx_1.checked = true then
	ls_panel = "Y"
else
	ls_panel = "%"
end if

if cbx_2.checked = true then
	ls_inside = "Y"
else
	ls_inside = "%"
end if

dw_1.retrieve( ls_area, ls_custno, ls_itemno, ld_sdate, ld_edate, ls_panel, ls_inside )
if dw_1.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
end if
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_oidoitempricezero_r
integer x = 32
integer y = 244
integer width = 4219
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oidoitempricezero_r
integer x = 1742
integer y = 12
integer width = 910
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oidoitempricezero_r
integer x = 4009
integer width = 823
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidoitempricezero_r
integer x = 37
integer y = 176
integer width = 105
integer height = 76
integer taborder = 0
boolean enabled = false
string dataobject = "d_oidoitempricezero_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type cbx_1 from checkbox within w_oidoitempricezero_r
integer x = 3534
integer y = 84
integer width = 384
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "판넬 제외"
boolean checked = true
end type

type cbx_2 from checkbox within w_oidoitempricezero_r
integer x = 3534
integer y = 156
integer width = 448
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "계열사 제외"
boolean checked = true
end type

type pb_1 from picturebutton within w_oidoitempricezero_r
event mousemove pbm_mousemove
integer x = 4229
integer y = 72
integer width = 187
integer height = 144
integer taborder = 80
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_dest

dw_dest = dw_1

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_3 from statictext within w_oidoitempricezero_r
integer x = 87
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_oidoitempricezero_r
integer x = 274
integer y = 300
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

type ddlb_dwtitles from dropdownlistbox within w_oidoitempricezero_r
integer x = 306
integer y = 312
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

type st_4 from statictext within w_oidoitempricezero_r
integer x = 745
integer y = 316
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

type sle_value from singlelineedit within w_oidoitempricezero_r
integer x = 1225
integer y = 300
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

type cb_1 from commandbutton within w_oidoitempricezero_r
integer x = 1806
integer y = 300
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidoitempricezero_r
integer x = 1970
integer y = 300
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oidoitempricezero_r
integer x = 2135
integer y = 300
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidoitempricezero_r
integer x = 2299
integer y = 300
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_6 from statictext within w_oidoitempricezero_r
integer x = 1769
integer y = 56
integer width = 233
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

type dw_area from datawindow within w_oidoitempricezero_r
integer x = 2007
integer y = 56
integer width = 526
integer height = 84
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type st_8 from statictext within w_oidoitempricezero_r
integer x = 1769
integer y = 140
integer width = 233
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_oidoitempricezero_r
integer x = 2007
integer y = 136
integer width = 613
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type st_7 from statictext within w_oidoitempricezero_r
integer x = 2702
integer y = 60
integer width = 745
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "출고일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oidoitempricezero_r
integer x = 2702
integer y = 148
integer width = 366
integer height = 72
integer taborder = 50
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//id_start = date(this.text)
////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//end if

end event

type em_2 from editmask within w_oidoitempricezero_r
integer x = 3081
integer y = 148
integer width = 366
integer height = 72
integer taborder = 60
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//id_end = date(this.text)
//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//end if

end event

type cbx_hap from checkbox within w_oidoitempricezero_r
integer x = 2574
integer y = 284
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
dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=76")	// 소계 숨김
else
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=76")	// 소계 숨김
end if
dw_1.setredraw( true )

end event

type cbx_haphd from checkbox within w_oidoitempricezero_r
integer x = 2574
integer y = 344
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
dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=0")	   // 소계 숨김
else
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=76")	// 소계 숨김
end if
dw_1.setredraw( true )

end event

type ddlb_op from dropdownlistbox within w_oidoitempricezero_r
integer x = 914
integer y = 296
integer width = 302
integer height = 500
integer taborder = 160
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type gb_4 from groupbox within w_oidoitempricezero_r
integer x = 2665
integer y = 12
integer width = 827
integer height = 232
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_5 from groupbox within w_oidoitempricezero_r
integer x = 3506
integer y = 12
integer width = 485
integer height = 232
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

