$PBExportHeader$w_ippurdochk_r.srw
$PBExportComments$출고송장 누락체크
forward 
global type w_ippurdochk_r from w_inheritance
end type
type dw_3 from datawindow within w_ippurdochk_r
end type
type st_2 from statictext within w_ippurdochk_r
end type
type dw_area from datawindow within w_ippurdochk_r
end type
type pb_1 from picturebutton within w_ippurdochk_r
end type
type cbx_1 from checkbox within w_ippurdochk_r
end type
type st_3 from statictext within w_ippurdochk_r
end type
type ddlb_fld from dropdownlistbox within w_ippurdochk_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ippurdochk_r
end type
type st_4 from statictext within w_ippurdochk_r
end type
type ddlb_op from dropdownlistbox within w_ippurdochk_r
end type
type sle_value from singlelineedit within w_ippurdochk_r
end type
type cb_1 from commandbutton within w_ippurdochk_r
end type
type cb_2 from commandbutton within w_ippurdochk_r
end type
type cb_3 from commandbutton within w_ippurdochk_r
end type
type cb_5 from commandbutton within w_ippurdochk_r
end type
type cbx_2 from checkbox within w_ippurdochk_r
end type
type cb_10 from commandbutton within w_ippurdochk_r
end type
end forward

global type w_ippurdochk_r from w_inheritance
integer width = 4695
integer height = 2444
string title = "입고출고 송장체크(w_ippurdochk_r)"
dw_3 dw_3
st_2 st_2
dw_area dw_area
pb_1 pb_1
cbx_1 cbx_1
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
cbx_2 cbx_2
cb_10 cb_10
end type
global w_ippurdochk_r w_ippurdochk_r

type variables
st_print i_print
string is_dw, is_supp
date   id_date1, id_date2
datawindowchild idwc_cust, idwc_area, idwc_loc
end variables

on w_ippurdochk_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_2=create st_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.cbx_1=create cbx_1
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
this.cbx_2=create cbx_2
this.cb_10=create cb_10
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cbx_2
this.Control[iCurrent+17]=this.cb_10
end on

on w_ippurdochk_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.cbx_1)
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
destroy(this.cbx_2)
destroy(this.cb_10)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

pb_print.enabled = false
dw_2.visible     = false
dw_1.sharedata(dw_2)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = gs_area

// 전체거래처
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.getchild("supp_no", idwc_loc)
idwc_loc.settransobject(SQLCA)

dw_3.object.ymd1[1] = date(string(today(),"yyyy/mm/01"))
dw_3.object.ymd2[1] = date(string(today(),"yyyy/mm/dd"))
id_date1 = dw_3.object.ymd1[1]
id_date2 = dw_3.object.ymd2[1]

idwc_loc.insertrow(1)
idwc_loc.setitem(1, "supp_no", "%")
idwc_loc.setitem(1, "supp_name", "전체")

dw_3.object.supp_no[1] = "%"

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 68
dw_1.height = newheight - 416

end event

type pb_save from w_inheritance`pb_save within w_ippurdochk_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ippurdochk_r
integer x = 32
integer y = 388
integer width = 4590
integer height = 1924
integer taborder = 60
string dataobject = "d_ippurdochk_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::doubleclicked;call super::doubleclicked;//
gs_where2 lst_str 
string ls_sale, ls_seqno

choose case dwo.name
	case "purdet_sale_no", "purdet_sale_seq"
		ls_sale  = dw_1.object.purdet_sale_no[row]	
		if ls_sale = "" OR isnull(ls_sale) OR LenA(ls_sale) <> 14  then RETURN
		
		ls_seqno = string(dw_1.object.purdet_sale_seq[row])
		lst_str.str1[1] = ls_sale
		lst_str.str2[1] = ls_seqno

		OpenWithParm(w_whsaleall_w, lst_str)	
end choose

end event

type st_title from w_inheritance`st_title within w_ippurdochk_r
integer x = 50
integer width = 1294
string text = "입고출고 송장체크"
end type

type st_tips from w_inheritance`st_tips within w_ippurdochk_r
end type

type pb_compute from w_inheritance`pb_compute within w_ippurdochk_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ippurdochk_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ippurdochk_r
integer x = 4407
integer y = 48
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurdochk_r
integer x = 4018
integer y = 48
integer taborder = 120
end type

event pb_print::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//w_repsuper w_print
//string ls_supp,ls_order
//long   ll_row
//
//i_print.st_datawindow  = dw_2
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc  = " 이 프로그램은 거래처별 입고내역 보고서를 출력합니다."
//
//if rb_1.checked = true then
//	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=73'
//else
//	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=79'
//end if
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_ippurdochk_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ippurdochk_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ippurdochk_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ippurdochk_r
integer x = 3826
integer y = 48
integer taborder = 150
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
string ls_area

dw_3.accepttext()

ls_area = LeftA(dw_area.object.area[1],1)
if ls_area = "" then ls_area = "%"

if is_supp = "" then is_supp = "%"

dw_1.reset()
ll_row = dw_1.retrieve( is_supp, id_date1, id_date2, ls_area )
if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ippurdochk_r
integer x = 32
integer y = 216
integer width = 4590
integer height = 144
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_ippurdochk_r
integer x = 2153
integer y = 8
integer width = 1627
integer height = 208
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ippurdochk_r
integer x = 3799
integer y = 8
integer width = 823
integer height = 208
integer taborder = 50
end type

type dw_2 from w_inheritance`dw_2 within w_ippurdochk_r
integer x = 1390
integer y = 8
integer width = 123
integer height = 88
integer taborder = 70
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_ippurdochk_r
integer x = 2706
integer y = 44
integer width = 1056
integer height = 156
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_ipsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
dw_1.reset()
this.accepttext()

id_date1 = this.object.ymd1[1]
id_date2 = this.object.ymd2[1]
is_supp  = trim(this.object.supp_no[1])


end event

event rbuttondown;CHOOSE CASE dwo.name
	CASE 'ymd1'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.ymd1[row] = datetime(date(message.stringparm))
		end if
		this.Setcolumn('ymd2')
	CASE 'ymd2'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.ymd2[row] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.postevent(itemchanged!)
end event

event itemfocuschanged;//
choose case dwo.name
	case "supp_no"
		this.SelectText(1, LenA(GetText()))
end choose

end event

type st_2 from statictext within w_ippurdochk_r
integer x = 2181
integer y = 44
integer width = 521
integer height = 72
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

type dw_area from datawindow within w_ippurdochk_r
integer x = 2181
integer y = 120
integer width = 521
integer height = 84
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

type pb_1 from picturebutton within w_ippurdochk_r
event mousemove pbm_mousemove
integer x = 4206
integer y = 48
integer width = 187
integer height = 144
integer taborder = 110
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type cbx_1 from checkbox within w_ippurdochk_r
integer x = 2459
integer y = 280
integer width = 352
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
string text = "거래처계"
end type

event clicked;//
//if rb_1.checked = false then
//	MessageBox("확인","거래처별 현장별 자료에서만 실행됩니다.")
//	return
//end if

string ls_value

if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=70")	// 거래처 소계
else
	dw_1.Modify("DataWindow.Detail.Height=72")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=70")	// 거래처 소계
end if

end event

type st_3 from statictext within w_ippurdochk_r
integer x = 69
integer y = 276
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

type ddlb_fld from dropdownlistbox within w_ippurdochk_r
integer x = 256
integer y = 260
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_ippurdochk_r
integer x = 288
integer y = 272
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

type st_4 from statictext within w_ippurdochk_r
integer x = 727
integer y = 276
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

type ddlb_op from dropdownlistbox within w_ippurdochk_r
integer x = 896
integer y = 260
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

type sle_value from singlelineedit within w_ippurdochk_r
integer x = 1216
integer y = 264
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

type cb_1 from commandbutton within w_ippurdochk_r
integer x = 1787
integer y = 264
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ippurdochk_r
integer x = 1952
integer y = 264
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ippurdochk_r
integer x = 2117
integer y = 264
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ippurdochk_r
integer x = 2281
integer y = 264
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_2 from checkbox within w_ippurdochk_r
integer x = 2907
integer y = 280
integer width = 521
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
string text = "송장발행대상"
end type

event clicked;//
// sum( if ( dono = '', 1, 0) for all ) - sum( if ( purdet_sale_no = '', 1, 0) for all )
string ls_filter

if this.checked = true then
	ls_filter = " purdet_sale_no <> '' AND dono = '' "
else
	ls_filter = ""
end if
dw_1.setfilter( ls_filter )
dw_1.filter()

end event

type cb_10 from commandbutton within w_ippurdochk_r
integer x = 3433
integer y = 256
integer width = 379
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주관리"
end type

event clicked;string ls_orderno
long   ll_row, ll_seqno

// 수주관리 화면만 표시
if dw_1.rowcount() < 1 then
	if IsValid(w_o_main) then 
		OpenSheet(w_orsale_m,  w_o_main, 5, original!)
	elseif IsValid(w_i_main) then 
		OpenSheet(w_orsale_m,  w_i_main, 5, original!)
	elseif IsValid(w_m_main) then 
		OpenSheet(w_orsale_m,  w_m_main, 5, original!)
	elseif IsValid(w_all_main) then 
		OpenSheet(w_orsale_m,  w_all_main, 5, original!)
	end if
end if
	
ll_row     = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_orderno = dw_1.object.purdet_sale_no[ll_row]
ll_seqno   = dw_1.object.purdet_sale_seq[ll_row]
if ls_orderno = "" OR isnull(ls_orderno) then RETURN

if IsValid(w_orsale_m) then 
	if MessageBox("확인","수주관리 프로그램이 실행상태 입니다.",Exclamation!, OKCancel!, 2) = 2 then RETURN
end if

if IsValid(w_o_main) then 
	OpenSheet(w_orsale_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_orsale_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_orsale_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_orsale_m,  w_all_main, 5, original!)
end if

w_orsale_m.setredraw(false)
w_orsale_m.em_3.text = LeftA(ls_orderno,10)	// 수주번호
w_orsale_m.em_4.text = string(integer(RightA(ls_orderno,3)))
w_orsale_m.pb_cancel.triggerevent(clicked!)
w_orsale_m.dw_3.scrolltorow( ll_seqno )
w_orsale_m.setredraw(true)

end event

