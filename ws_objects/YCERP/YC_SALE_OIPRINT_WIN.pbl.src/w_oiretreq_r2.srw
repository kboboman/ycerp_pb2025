$PBExportHeader$w_oiretreq_r2.srw
$PBExportComments$물품반납 현황 조회프로그램(2004/06/03,정갑용)
forward
global type w_oiretreq_r2 from w_inheritance
end type
type em_1 from editmask within w_oiretreq_r2
end type
type em_2 from editmask within w_oiretreq_r2
end type
type st_3 from statictext within w_oiretreq_r2
end type
type ddlb_fld from dropdownlistbox within w_oiretreq_r2
end type
type ddlb_dwtitles from dropdownlistbox within w_oiretreq_r2
end type
type st_4 from statictext within w_oiretreq_r2
end type
type sle_value from singlelineedit within w_oiretreq_r2
end type
type cb_1 from commandbutton within w_oiretreq_r2
end type
type cb_2 from commandbutton within w_oiretreq_r2
end type
type cb_3 from commandbutton within w_oiretreq_r2
end type
type cb_5 from commandbutton within w_oiretreq_r2
end type
type pb_1 from picturebutton within w_oiretreq_r2
end type
type st_7 from statictext within w_oiretreq_r2
end type
type dw_area from datawindow within w_oiretreq_r2
end type
type st_5 from statictext within w_oiretreq_r2
end type
type st_1 from statictext within w_oiretreq_r2
end type
type ddlb_op from dropdownlistbox within w_oiretreq_r2
end type
type gb_4 from groupbox within w_oiretreq_r2
end type
end forward

global type w_oiretreq_r2 from w_inheritance
integer width = 4302
integer height = 2408
string title = "반품현황 조회(w_oiretreq_r2)"
boolean resizable = false
em_1 em_1
em_2 em_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
pb_1 pb_1
st_7 st_7
dw_area dw_area
st_5 st_5
st_1 st_1
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_oiretreq_r2 w_oiretreq_r2

type variables
st_print i_print
datawindowchild idwc_cust, idwc_area

string is_order_no
string is_con = "Y"
end variables

on w_oiretreq_r2.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.pb_1=create pb_1
this.st_7=create st_7
this.dw_area=create dw_area
this.st_5=create st_5
this.st_1=create st_1
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.sle_value
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_5
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.dw_area
this.Control[iCurrent+15]=this.st_5
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.gb_4
end on

on w_oiretreq_r2.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.pb_1)
destroy(this.st_7)
destroy(this.dw_area)
destroy(this.st_5)
destroy(this.st_1)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = " "

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_area.object.area[1] = "%"	// gs_area	// 기본값을 변경	
dw_area.accepttext()

dw_2.visible = false

em_1.text = string(today(), "yyyy/mm/01")
em_2.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x



end event

type pb_save from w_inheritance`pb_save within w_oiretreq_r2
event ue_print pbm_custom01
boolean visible = false
integer x = 3163
integer y = 40
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_oiretreq_r2
integer x = 32
integer y = 416
integer width = 4215
integer height = 1872
integer taborder = 30
string dataobject = "d_oiretcon_s3"
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oiretreq_r2
integer x = 32
integer y = 28
integer width = 1070
integer height = 136
string text = "반품현황 조회"
end type

type st_tips from w_inheritance`st_tips within w_oiretreq_r2
end type

type pb_compute from w_inheritance`pb_compute within w_oiretreq_r2
boolean visible = false
integer x = 1659
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiretreq_r2
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 80
string text = "수주상황접수부 시화출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;////w_repsuper w_print
////
////i_print.st_datawindow = dw_3
////i_print.st_print_sheet = " 프린트용지 : A4"
////i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
////
////gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
////opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
////
////
////
//if dw_4.getrow() < 1 then
//	MessageBox("출력", "수주조회후에 출력하십시요!")
//	return
//end if
//
//if MessageBox("수주상황접수부 출력", "수주상황접수부를 시화프린터로 직접 출력합니다 ~r~n" &
//											+ "출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
//	return
//end if
//
//dw_5.settransobject(sqlca)
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
//
//dw_5.Modify('DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//	                   'Datawindow.Zoom=100' )
//dw_5.retrieve(dw_4.object.order_no[dw_4.getrow()])
//wf_multiprint()
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x - 70
li_y = this.y + 156

f_usetips(st_tips,"수주상황접수부 시화출력  ",parent, li_x, li_y)


end event

type pb_close from w_inheritance`pb_close within w_oiretreq_r2
integer x = 4032
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiretreq_r2
integer x = 3639
integer y = 64
integer taborder = 130
end type

event pb_print::clicked;//
debugbreak()

w_repsuper w_print
st_print l_print

//if dw_2.getrow() < 1 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_2
l_print.st_print_desc  = " 이 프로그램은 반품현황을 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=79'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiretreq_r2
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_oiretreq_r2
boolean visible = false
integer x = 2971
integer y = 40
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_oiretreq_r2
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 160
string text = " "
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiretreq_r2
integer x = 3447
integer y = 64
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;string ls_area, ls_cust_no
date   ld_sdate, ld_edate

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

dw_1.retrieve( ls_area, ld_sdate, ld_edate )

dw_1.ShareData( dw_2 )

end event

type gb_3 from w_inheritance`gb_3 within w_oiretreq_r2
integer x = 32
integer y = 244
integer width = 4215
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiretreq_r2
integer x = 2574
integer y = 16
integer width = 818
integer height = 212
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oiretreq_r2
integer x = 3410
integer y = 16
integer width = 837
integer height = 212
integer taborder = 100
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiretreq_r2
integer x = 1143
integer y = 24
integer width = 114
integer height = 84
integer taborder = 60
string dataobject = "d_oiretcon_r"
boolean vscrollbar = false
end type

type em_1 from editmask within w_oiretreq_r2
integer x = 2610
integer y = 140
integer width = 366
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oiretreq_r2
integer x = 2990
integer y = 140
integer width = 366
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_3 from statictext within w_oiretreq_r2
integer x = 87
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_oiretreq_r2
integer x = 274
integer y = 288
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

type ddlb_dwtitles from dropdownlistbox within w_oiretreq_r2
integer x = 306
integer y = 300
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

type st_4 from statictext within w_oiretreq_r2
integer x = 745
integer y = 304
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

type sle_value from singlelineedit within w_oiretreq_r2
integer x = 1234
integer y = 296
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

type cb_1 from commandbutton within w_oiretreq_r2
integer x = 1806
integer y = 296
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

type cb_2 from commandbutton within w_oiretreq_r2
integer x = 1970
integer y = 296
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

type cb_3 from commandbutton within w_oiretreq_r2
integer x = 2135
integer y = 296
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

type cb_5 from commandbutton within w_oiretreq_r2
integer x = 2299
integer y = 296
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

type pb_1 from picturebutton within w_oiretreq_r2
event mousemove pbm_mousemove
integer x = 3831
integer y = 64
integer width = 187
integer height = 144
integer taborder = 160
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

type st_7 from statictext within w_oiretreq_r2
integer x = 1984
integer y = 56
integer width = 526
integer height = 76
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiretreq_r2
integer x = 1984
integer y = 136
integer width = 535
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area, ls_locno

this.accepttext()

ls_area = dw_area.object.area[ row ]
SELECT def_loc INTO :ls_locno FROM area  WHERE area_no = :ls_area;
if isnull(ls_locno) or ls_locno = "" then ls_locno = "WS00000000"

//dw_3.object.loc_no[1] = ls_locno		// "WS00000000" // 기본값을 변경 is_loc
//dw_3.accepttext()

end event

type st_5 from statictext within w_oiretreq_r2
integer x = 46
integer y = 196
integer width = 1518
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "반품매출 정리한 사업장으로 조회하시기 바랍니다."
boolean focusrectangle = false
end type

type st_1 from statictext within w_oiretreq_r2
integer x = 2610
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
string text = "반품일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_oiretreq_r2
integer x = 923
integer y = 288
integer width = 302
integer height = 500
integer taborder = 130
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

type gb_4 from groupbox within w_oiretreq_r2
integer x = 1952
integer y = 16
integer width = 594
integer height = 212
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

