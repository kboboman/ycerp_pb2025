$PBExportHeader$w_mpsfcmon_r.srw
$PBExportComments$생산월보 조회(1998/05/08, 이인호)
forward
global type w_mpsfcmon_r from w_inheritance
end type
type em_1 from editmask within w_mpsfcmon_r
end type
type em_2 from editmask within w_mpsfcmon_r
end type
type rb_1 from radiobutton within w_mpsfcmon_r
end type
type rb_2 from radiobutton within w_mpsfcmon_r
end type
type dw_3 from datawindow within w_mpsfcmon_r
end type
type dw_area from datawindow within w_mpsfcmon_r
end type
type pb_2 from picturebutton within w_mpsfcmon_r
end type
type st_2 from statictext within w_mpsfcmon_r
end type
type st_3 from statictext within w_mpsfcmon_r
end type
type st_4 from statictext within w_mpsfcmon_r
end type
type ddlb_fld from dropdownlistbox within w_mpsfcmon_r
end type
type st_5 from statictext within w_mpsfcmon_r
end type
type ddlb_op from dropdownlistbox within w_mpsfcmon_r
end type
type sle_value from singlelineedit within w_mpsfcmon_r
end type
type cb_1 from commandbutton within w_mpsfcmon_r
end type
type cb_2 from commandbutton within w_mpsfcmon_r
end type
type cb_3 from commandbutton within w_mpsfcmon_r
end type
type cb_5 from commandbutton within w_mpsfcmon_r
end type
type gb_4 from groupbox within w_mpsfcmon_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsfcmon_r
end type
type rb_3 from radiobutton within w_mpsfcmon_r
end type
end forward

global type w_mpsfcmon_r from w_inheritance
integer width = 4690
integer height = 2608
string title = "생산월보 조회(w_mpsfcmon_r)"
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_area dw_area
pb_2 pb_2
st_2 st_2
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
gb_4 gb_4
ddlb_dwtitles ddlb_dwtitles
rb_3 rb_3
end type
global w_mpsfcmon_r w_mpsfcmon_r

type variables
st_print i_print
int    ii_year, ii_month
string is_wcno
datawindowchild idwc_wc, idwc_area

end variables

on w_mpsfcmon_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_area=create dw_area
this.pb_2=create pb_2
this.st_2=create st_2
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
this.gb_4=create gb_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.pb_2
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.gb_4
this.Control[iCurrent+20]=this.ddlb_dwtitles
this.Control[iCurrent+21]=this.rb_3
end on

on w_mpsfcmon_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_area)
destroy(this.pb_2)
destroy(this.st_2)
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
destroy(this.gb_4)
destroy(this.ddlb_dwtitles)
destroy(this.rb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false
dw_3.SetTransObject(SQLCA)
em_1.text = string(today(), "YYYY/MM")
em_2.text = string(today(), "YYYY/MM")

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = gs_area

// 작업장
dw_1.settransobject(sqlca)
dw_1.insertrow(0)  

dw_1.getchild('wc_no',idwc_wc)
idwc_wc.settransobject(sqlca)
idwc_wc.insertrow(1)
idwc_wc.setitem(1, 'wc_no', ' ')
idwc_wc.setitem(1, 'work_name', '전체')
idwc_wc.setitem(1,'area_no',  gs_area)
idwc_wc.accepttext()

idwc_wc.setfilter( "area_no = '" + gs_area + "'" )
idwc_wc.filter()
idwc_wc.setsort( "work_type A, wc_no A" )
idwc_wc.sort()
dw_1.object.wc_no[1] = " "

end event

event resize;call super::resize;//
dw_3.width  = newwidth  - 78
dw_3.height = newheight - 484

end event

type pb_save from w_inheritance`pb_save within w_mpsfcmon_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcmon_r
integer x = 2857
integer y = 56
integer width = 869
integer height = 84
integer taborder = 30
string dataobject = "d_mpwcno_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpsfcmon_r
integer x = 41
integer y = 68
integer width = 1056
integer height = 148
string text = "생산월보 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcmon_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcmon_r
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcmon_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcmon_r
integer x = 4393
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcmon_r
integer x = 4187
integer y = 64
integer taborder = 90
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_3.getrow() <= 0 THEN
   RETURN
END IF
if rb_1.checked = true then
   dw_2.dataobject = 'd_mpsfcmon_r'
else
   dw_2.dataobject = 'd_mpsfcmon_r2'
end if
dw_2.SetTransObject(SQLCA)

dw_3.sharedata(dw_2)

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 생산월보를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcmon_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcmon_r
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcmon_r
boolean visible = false
integer x = 1783
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcmon_r
integer x = 3803
integer y = 64
integer taborder = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_workname
date   ld_start, ld_end

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )

dw_area.accepttext()
ls_area  = dw_area.object.area[1]
ld_start = date(em_1.text + "/01")
ld_end   = RelativeDate(date(string(RelativeDate( date(em_2.text + "/01"), 31), "yyyy/mm") + "/01"), -1)

dw_1.accepttext()
ls_workname = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_name'))
if ls_workname = "전체" then
	ls_workname = "%"
else
	ls_workname = ls_workname + "%"
end if

dw_3.reset()
dw_3.retrieve( ls_workname, ld_start, ld_end, ls_area )
if dw_3.rowcount() < 1 then
	messagebox("에러","해당월에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcmon_r
boolean visible = false
integer x = 2779
integer y = 40
integer width = 160
integer height = 184
integer taborder = 110
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcmon_r
integer x = 1975
integer y = 0
integer width = 1774
integer height = 256
integer taborder = 0
integer textsize = -8
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcmon_r
integer x = 3776
integer y = 20
integer width = 837
integer height = 208
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcmon_r
integer x = 1019
integer y = 28
integer width = 133
integer height = 92
integer taborder = 40
string dataobject = "d_mpsfcmon_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_mpsfcmon_r
integer x = 3072
integer y = 140
integer width = 320
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text + "/01"
lstr_calendar.edate = em_2.text + "/01"
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

end event

type em_2 from editmask within w_mpsfcmon_r
integer x = 3397
integer y = 140
integer width = 320
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
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

end event

type rb_1 from radiobutton within w_mpsfcmon_r
integer x = 1998
integer y = 36
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계"
boolean checked = true
end type

event clicked;//
dw_3.dataobject = 'd_mpsfcmon_t'
dw_3.SetTransObject(SQLCA)
pb_retrieve.triggerevent('clicked')
end event

type rb_2 from radiobutton within w_mpsfcmon_r
integer x = 1998
integer y = 96
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월별"
end type

event clicked;//
dw_3.dataobject = 'd_mpsfcmon_t2'
dw_3.SetTransObject(SQLCA)
pb_retrieve.triggerevent('clicked')

end event

type dw_3 from datawindow within w_mpsfcmon_r
integer x = 37
integer y = 444
integer width = 4576
integer height = 2020
integer taborder = 70
boolean bringtotop = true
string title = "d_mpsfcmon_t"
string dataobject = "d_mpsfcmon_t"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_area from datawindow within w_mpsfcmon_r
integer x = 2322
integer y = 132
integer width = 526
integer height = 80
integer taborder = 120
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
DataWindowChild ldwc_wc1
string ls_area

ls_area = trim(data)

// 작업 필터링
dw_1.getchild("wc_no", ldwc_wc1)
ldwc_wc1.settransobject(sqlca)
ldwc_wc1.setfilter( "wc_no = ' ' OR area_no = '" + ls_area + "'" )
ldwc_wc1.filter()
ldwc_wc1.setsort( "work_type A, wc_no A" )
ldwc_wc1.sort()

end event

type pb_2 from picturebutton within w_mpsfcmon_r
integer x = 3995
integer y = 64
integer width = 187
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

dwxls = dw_3
if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			//	dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
end if
MessageBox("확인","엑셀파일 작업완료.")

end event

type st_2 from statictext within w_mpsfcmon_r
integer x = 2862
integer y = 140
integer width = 210
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
string text = "기간 :"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpsfcmon_r
integer x = 2322
integer y = 56
integer width = 526
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpsfcmon_r
integer x = 110
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

type ddlb_fld from dropdownlistbox within w_mpsfcmon_r
integer x = 297
integer y = 300
integer width = 443
integer height = 632
integer taborder = 10
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

type st_5 from statictext within w_mpsfcmon_r
integer x = 768
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

type ddlb_op from dropdownlistbox within w_mpsfcmon_r
integer x = 937
integer y = 300
integer width = 297
integer height = 512
integer taborder = 20
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

type sle_value from singlelineedit within w_mpsfcmon_r
integer x = 1257
integer y = 308
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

type cb_1 from commandbutton within w_mpsfcmon_r
integer x = 1829
integer y = 308
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

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpsfcmon_r
integer x = 1993
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsfcmon_r
integer x = 2158
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsfcmon_r
integer x = 2322
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_mpsfcmon_r
integer x = 37
integer y = 252
integer width = 4576
integer height = 160
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type ddlb_dwtitles from dropdownlistbox within w_mpsfcmon_r
integer x = 329
integer y = 312
integer width = 311
integer height = 88
integer taborder = 20
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

type rb_3 from radiobutton within w_mpsfcmon_r
integer x = 1998
integer y = 164
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "품목별"
end type

event clicked;//
dw_3.dataobject = 'd_mpsfcmon_t3'
dw_3.SetTransObject(SQLCA)
pb_retrieve.triggerevent('clicked')

end event

