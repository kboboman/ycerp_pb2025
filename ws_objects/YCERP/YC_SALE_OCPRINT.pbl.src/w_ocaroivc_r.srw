$PBExportHeader$w_ocaroivc_r.srw
$PBExportComments$수금현황(1998/05/12, 정재수)
forward
global type w_ocaroivc_r from w_inheritance
end type
type st_1 from statictext within w_ocaroivc_r
end type
type em_1 from editmask within w_ocaroivc_r
end type
type em_2 from editmask within w_ocaroivc_r
end type
type st_2 from statictext within w_ocaroivc_r
end type
type dw_3 from datawindow within w_ocaroivc_r
end type
type st_5 from statictext within w_ocaroivc_r
end type
type pb_1 from picturebutton within w_ocaroivc_r
end type
type st_4 from statictext within w_ocaroivc_r
end type
type ddlb_fld from dropdownlistbox within w_ocaroivc_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ocaroivc_r
end type
type st_6 from statictext within w_ocaroivc_r
end type
type sle_value from singlelineedit within w_ocaroivc_r
end type
type cb_1 from commandbutton within w_ocaroivc_r
end type
type cb_2 from commandbutton within w_ocaroivc_r
end type
type cb_3 from commandbutton within w_ocaroivc_r
end type
type cb_5 from commandbutton within w_ocaroivc_r
end type
type ddlb_op from dropdownlistbox within w_ocaroivc_r
end type
type st_3 from statictext within w_ocaroivc_r
end type
type ddlb_level1 from dropdownlistbox within w_ocaroivc_r
end type
type ddlb_level2 from dropdownlistbox within w_ocaroivc_r
end type
type gb_4 from groupbox within w_ocaroivc_r
end type
end forward

global type w_ocaroivc_r from w_inheritance
integer y = 112
integer width = 4073
integer height = 2344
string title = "수금현황(w_ocaroivc_r)"
long backcolor = 79219928
st_1 st_1
em_1 em_1
em_2 em_2
st_2 st_2
dw_3 dw_3
st_5 st_5
pb_1 pb_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
st_3 st_3
ddlb_level1 ddlb_level1
ddlb_level2 ddlb_level2
gb_4 gb_4
end type
global w_ocaroivc_r w_ocaroivc_r

type variables
string is_dw
DataWindowChild idwc_cust

end variables

on w_ocaroivc_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_3=create dw_3
this.st_5=create st_5
this.pb_1=create pb_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
this.st_3=create st_3
this.ddlb_level1=create ddlb_level1
this.ddlb_level2=create ddlb_level2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.ddlb_level1
this.Control[iCurrent+20]=this.ddlb_level2
this.Control[iCurrent+21]=this.gb_4
end on

on w_ocaroivc_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.st_5)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
destroy(this.st_3)
destroy(this.ddlb_level1)
destroy(this.ddlb_level2)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false


dw_3.visible = false

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

//등급
ddlb_level1.text = '% 전체'
ddlb_level2.text = '% 전체'

// 거래처
//dw_2.object.cust_no.Background.Color = 67108864
dw_2.SetTransObject(SQLCA)
dw_2.GetChild("cust_no", idwc_cust)
dw_2.insertrow(0)  
idwc_cust.SetTransObject(sqlca)

idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체거래처")
idwc_cust.accepttext()
dw_2.object.cust_no[1] = "%"


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_ocaroivc_r
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 100
end type

type dw_1 from w_inheritance`dw_1 within w_ocaroivc_r
integer x = 32
integer y = 448
integer width = 3963
integer height = 1756
integer taborder = 0
string dataobject = "d_ocaroivcrep_r"
boolean hsplitscroll = true
end type

event dw_1::doubleclicked;call super::doubleclicked;//
choose case dwo.name
	case "cust_no", "customer_cust_name"
		gs_where lstr_where
		lstr_where.str1 = this.object.cust_no[row]
		lstr_where.name = this.object.customer_cust_name[row]
		openwithparm(w_whopeom_w, lstr_where)
end choose

end event

event dw_1::clicked;call super::clicked;//
//is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ocaroivc_r
integer x = 37
integer y = 24
integer width = 704
integer height = 132
string text = "수금현황"
end type

type st_tips from w_inheritance`st_tips within w_ocaroivc_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocaroivc_r
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocaroivc_r
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 90
end type

type pb_close from w_inheritance`pb_close within w_ocaroivc_r
integer x = 3291
integer y = 72
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroivc_r
integer x = 3099
integer y = 72
integer taborder = 70
end type

event pb_print::clicked;w_repsuper  w_print
st_print    l_print
date        ld_sdate,  ld_edate
string      ls_custno, ls_zoom, ls_salesman

if em_1.text = '' then
	messagebox("확인","수금기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","수금기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","수금기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

choose case gs_level
	case 'A', 'B'
		ls_salesman = '%'
	case 'C'
		ls_salesman = gs_userid
end choose

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 거래처
dw_2.accepttext()
ls_custno = dw_2.object.cust_no[1]		//getitemstring(dw_2.getrow(), "cust_no")

if ls_custno = "%" then	
	dw_3.dataobject = 'd_ocaroivcrep_r1'	
	ls_zoom = '76'
	dw_3.settransobject(sqlca)
	dw_3.retrieve(ld_sdate, ld_edate, ls_salesman)
else
	dw_3.dataobject = 'd_ocaroivcrep_r2'
	ls_zoom = '86'
	dw_3.settransobject(sqlca)
	dw_3.retrieve(ls_custno, ld_sdate, ld_edate, ls_salesman)
end if

if dw_3.rowcount() < 1 then return
dw_3.object.c_start[1] = string(ld_sdate, 'YYYY/MM/DD')
dw_3.object.c_end[1]   = string(ld_edate, 'YYYY/MM/DD')

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 수금현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=' + ls_zoom
OpenSheetWithParm( w_print, l_print, parentwindow(), 1, Original! )

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================





end event

type pb_cancel from w_inheritance`pb_cancel within w_ocaroivc_r
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ocaroivc_r
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ocaroivc_r
boolean visible = false
integer x = 2418
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocaroivc_r
integer x = 2715
integer y = 72
integer taborder = 60
end type

event pb_retrieve::clicked;//
string ls_custno, ls_salesman, ls_top_level1, ls_top_level2
date   ld_sdate, ld_edate

if em_1.text = '' then
	MessageBox("확인","수금기간을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = '' then
	MessageBox("확인","수금기간을 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","수금기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if




// 담당자
choose case gs_level
	case 'A', 'B'
		ls_salesman = '%'
	case 'C'
		ls_salesman = gs_userid
end choose

// 거래처
dw_2.accepttext()
ls_custno = dw_2.object.cust_no[1]		//getitemstring(dw_2.getrow(), "cust_no")

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

ls_top_level1  = trim(LeftA(ddlb_level1.text,1))
ls_top_level2  = trim(LeftA(ddlb_level2.text,2))

dw_1.retrieve( ls_custno, ld_sdate, ld_edate, ls_salesman, ls_top_level1, ls_top_level2 )
dw_1.setfocus()

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

	
end event

type gb_3 from w_inheritance`gb_3 within w_ocaroivc_r
integer x = 814
integer y = 16
integer width = 1230
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroivc_r
integer y = 268
integer width = 3963
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroivc_r
integer x = 2688
integer y = 16
integer width = 827
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ocaroivc_r
integer x = 1143
integer y = 144
integer width = 864
integer height = 88
string dataobject = "d_ocaroivcrep_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::editchanged;call super::editchanged;datawindowchild ldwc_cust
string ls_data
long ll_found,ll_row
int li_line

this.getchild("cust_no", ldwc_cust)
ldwc_cust.settransobject(sqlca)

choose case dwo.name
	case 'cust_no'
		 ls_data = data + '%'
		 ll_row = ldwc_cust.RowCount( )
		 ll_found = ldwc_cust.Find("cust_name like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("cust_name.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 ldwc_cust.scrolltorow(ll_found)
end choose

RETURN 0
end event

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_ocaroivc_r
integer x = 841
integer y = 64
integer width = 297
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
string text = "수금기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_ocaroivc_r
integer x = 1143
integer y = 64
integer width = 375
integer height = 76
integer taborder = 30
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

//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_ocaroivc_r
integer x = 1522
integer y = 64
integer width = 375
integer height = 76
integer taborder = 40
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

//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_2 from statictext within w_ocaroivc_r
integer x = 841
integer y = 148
integer width = 297
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_ocaroivc_r
string tag = "d_ocaroivcrep_r1"
integer x = 46
integer y = 180
integer width = 91
integer height = 72
integer taborder = 110
boolean bringtotop = true
string title = "d_ocaroivcrep_r2"
string dataobject = "d_ocaroivcrep_r2"
boolean livescroll = true
end type

type st_5 from statictext within w_ocaroivc_r
integer x = 2464
integer y = 344
integer width = 1111
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처 더블클릭시 현황조회됩니다."
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ocaroivc_r
event mousemove pbm_mousemove
integer x = 2907
integer y = 72
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
	li_Pos   = PosA(ls_Named, ".")
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

type st_4 from statictext within w_ocaroivc_r
integer x = 82
integer y = 336
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

type ddlb_fld from dropdownlistbox within w_ocaroivc_r
integer x = 270
integer y = 320
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ocaroivc_r
integer x = 302
integer y = 332
integer width = 311
integer height = 88
integer taborder = 120
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

type st_6 from statictext within w_ocaroivc_r
integer x = 741
integer y = 336
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

type sle_value from singlelineedit within w_ocaroivc_r
integer x = 1230
integer y = 328
integer width = 526
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_ocaroivc_r
integer x = 1765
integer y = 328
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ocaroivc_r
integer x = 1929
integer y = 328
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ocaroivc_r
integer x = 2094
integer y = 328
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ocaroivc_r
integer x = 2258
integer y = 328
integer width = 160
integer height = 76
integer taborder = 130
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_ocaroivc_r
integer x = 914
integer y = 320
integer width = 302
integer height = 500
integer taborder = 120
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

type st_3 from statictext within w_ocaroivc_r
integer x = 2053
integer y = 60
integer width = 585
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
string text = "종합등급"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_level1 from dropdownlistbox within w_ocaroivc_r
integer x = 2053
integer y = 140
integer width = 293
integer height = 944
integer taborder = 160
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
integer limit = 7
string item[] = {"% 전체","A 등급","B 등급","C 등급"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_level2 from dropdownlistbox within w_ocaroivc_r
integer x = 2350
integer y = 144
integer width = 293
integer height = 944
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
integer limit = 7
string item[] = {"% 전체","大 등급","中 등급","小 등급","X  등급"}
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_ocaroivc_r
integer x = 2039
integer y = 16
integer width = 617
integer height = 232
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

