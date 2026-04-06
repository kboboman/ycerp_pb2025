$PBExportHeader$w_mpwcremains_r.srw
$PBExportComments$작업장별 수주잔량
forward
global type w_mpwcremains_r from w_inheritance
end type
type dw_area from datawindow within w_mpwcremains_r
end type
type dw_wcno from datawindow within w_mpwcremains_r
end type
type pb_1 from picturebutton within w_mpwcremains_r
end type
type st_1 from statictext within w_mpwcremains_r
end type
type st_3 from statictext within w_mpwcremains_r
end type
type st_4 from statictext within w_mpwcremains_r
end type
type ddlb_fld from dropdownlistbox within w_mpwcremains_r
end type
type st_5 from statictext within w_mpwcremains_r
end type
type ddlb_op from dropdownlistbox within w_mpwcremains_r
end type
type sle_value from singlelineedit within w_mpwcremains_r
end type
type cb_1 from commandbutton within w_mpwcremains_r
end type
type cb_2 from commandbutton within w_mpwcremains_r
end type
type cb_3 from commandbutton within w_mpwcremains_r
end type
type cb_5 from commandbutton within w_mpwcremains_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpwcremains_r
end type
type em_1 from editmask within w_mpwcremains_r
end type
type st_2 from statictext within w_mpwcremains_r
end type
type st_6 from statictext within w_mpwcremains_r
end type
type gb_4 from groupbox within w_mpwcremains_r
end type
end forward

global type w_mpwcremains_r from w_inheritance
integer width = 4215
integer height = 2160
string title = "작업장별 수주잔량(w_mpwcremains_r)"
dw_area dw_area
dw_wcno dw_wcno
pb_1 pb_1
st_1 st_1
st_3 st_3
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
em_1 em_1
st_2 st_2
st_6 st_6
gb_4 gb_4
end type
global w_mpwcremains_r w_mpwcremains_r

type variables
gs_itembaldo_str ist_code
st_print i_print

datawindowchild idwc_wc
string is_dw

end variables

on w_mpwcremains_r.create
int iCurrent
call super::create
this.dw_area=create dw_area
this.dw_wcno=create dw_wcno
this.pb_1=create pb_1
this.st_1=create st_1
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.em_1=create em_1
this.st_2=create st_2
this.st_6=create st_6
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_area
this.Control[iCurrent+2]=this.dw_wcno
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.em_1
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_6
this.Control[iCurrent+19]=this.gb_4
end on

on w_mpwcremains_r.destroy
call super::destroy
destroy(this.dw_area)
destroy(this.dw_wcno)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_6)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = GS_area

/////////////////////////////////////
// 사업장변경시 작업장 필터링
/////////////////////////////////////
DataWindowChild ldwc_wcno

// 작업 필터링
dw_wcno.getchild("wc_no", ldwc_wcno)
ldwc_wcno.settransobject(sqlca)
ldwc_wcno.setfilter( "wc_no = ' ' OR area_no = '" + gs_area + "'" )
ldwc_wcno.filter()
ldwc_wcno.setsort( "work_type A, wc_no A" )
ldwc_wcno.sort()

// 작업장
dw_wcno.settransobject(sqlca)
dw_wcno.insertrow(0)  
dw_wcno.getchild('wc_no',idwc_wc)
//idwc_wc.insertrow(1)
//idwc_wc.setitem(1,'work_no','%')
//idwc_wc.setitem(1,'work_name','전체')
//idwc_wc.accepttext()

// 일자
em_1.text    = string(today(),'yyyy/mm/dd')
//em_1.enabled = false

//pb_retrieve.postevent(clicked!)

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_mpwcremains_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpwcremains_r
integer x = 32
integer y = 444
integer width = 4101
integer height = 1568
integer taborder = 50
string dataobject = "d_mpwcremains_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
////
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)



end event

type st_title from w_inheritance`st_title within w_mpwcremains_r
integer x = 32
integer y = 20
integer width = 1147
integer height = 144
string text = "작업장별 수주잔량"
end type

type st_tips from w_inheritance`st_tips within w_mpwcremains_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpwcremains_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpwcremains_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpwcremains_r
integer x = 3333
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpwcremains_r
integer x = 2939
integer y = 64
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

dw_1.sharedata( dw_2 )

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 작업장별 진행조회을 출력합니다." 

gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpwcremains_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpwcremains_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mpwcremains_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpwcremains_r
integer x = 2747
integer y = 64
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_wcno, ls_workname, ls_sdate

//
ls_sdate = em_1.text

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

dw_wcno.accepttext()
ls_wcno  = dw_wcno.object.wc_no[1]

SELECT work_name INTO :ls_workname FROM wc WHERE work_no = :ls_wcno;
ls_workname  = GF_ReplaceAll(ls_workname, "[", "")
ls_workname  = GF_ReplaceAll(ls_workname, "]", "")
if RightA(ls_wcno,2) = "00" then
	ls_workname = ls_workname + "%"
end if

debugbreak()
//
dw_1.retrieve( ls_area, ls_workname, ls_sdate )
if dw_1.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   RETURN
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpwcremains_r
integer x = 32
integer y = 244
integer width = 4101
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpwcremains_r
integer x = 1239
integer y = 16
integer width = 923
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpwcremains_r
integer x = 2715
integer y = 16
integer width = 846
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpwcremains_r
integer x = 78
integer y = 124
integer width = 91
integer height = 68
integer taborder = 60
string dataobject = "d_mpwcscan_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_area from datawindow within w_mpwcremains_r
integer x = 1541
integer y = 52
integer width = 526
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

/////////////////////////////////////
// 사업장변경시 작업장 필터링
/////////////////////////////////////
DataWindowChild ldwc_wcno
string ls_area

ls_area = trim(data)

// 작업 필터링
dw_wcno.getchild("wc_no", ldwc_wcno)
ldwc_wcno.settransobject(sqlca)
ldwc_wcno.setfilter( "wc_no = ' ' OR area_no = '" + ls_area + "'" )
ldwc_wcno.filter()
ldwc_wcno.setsort( "work_type A, wc_no A" )
ldwc_wcno.sort()

end event

type dw_wcno from datawindow within w_mpwcremains_r
integer x = 1536
integer y = 136
integer width = 594
integer height = 76
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_whwc_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type pb_1 from picturebutton within w_mpwcremains_r
event mousemove pbm_mousemove
integer x = 3127
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
integer li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_Docname = "작업장별 수주잔량"
	li_value   = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos     = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인","작업완료")
	end if
end if	

end event

type st_1 from statictext within w_mpwcremains_r
integer x = 1271
integer y = 56
integer width = 270
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpwcremains_r
integer x = 1266
integer y = 140
integer width = 270
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
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpwcremains_r
integer x = 69
integer y = 328
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

type ddlb_fld from dropdownlistbox within w_mpwcremains_r
integer x = 256
integer y = 312
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

type st_5 from statictext within w_mpwcremains_r
integer x = 741
integer y = 328
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

type ddlb_op from dropdownlistbox within w_mpwcremains_r
integer x = 910
integer y = 312
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

type sle_value from singlelineedit within w_mpwcremains_r
integer x = 1230
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

type cb_1 from commandbutton within w_mpwcremains_r
integer x = 1801
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpwcremains_r
integer x = 1966
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

choose case is_dw
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

type cb_3 from commandbutton within w_mpwcremains_r
integer x = 2130
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpwcremains_r
integer x = 2295
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case else
		MessageBox("확인","DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_mpwcremains_r
integer x = 297
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

type em_1 from editmask within w_mpwcremains_r
integer x = 2213
integer y = 136
integer width = 453
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -11
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
string displaydata = ""
end type

event rbuttondown;//
OpenWithParm(w_calendar, Message.StringParm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

////
//gs_calendar lstr_calendar
//
//lstr_calendar.sdate = em_1.text
//lstr_calendar.edate = em_2.text
//OpenWithParm(w_calendar2, lstr_calendar)
//lstr_calendar = Message.PowerObjectParm
//
//if lstr_calendar.chk <> 'N' then
//	em_1.text = lstr_calendar.sdate
//	em_2.text = lstr_calendar.edate
//end if
//
//
end event

type st_2 from statictext within w_mpwcremains_r
integer x = 2213
integer y = 60
integer width = 453
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
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_mpwcremains_r
integer x = 2473
integer y = 324
integer width = 1298
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "( 6개월 동안의 자료만 조회 됩니다. )"
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_mpwcremains_r
integer x = 2185
integer y = 16
integer width = 512
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

