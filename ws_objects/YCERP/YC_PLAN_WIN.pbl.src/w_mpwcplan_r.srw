$PBExportHeader$w_mpwcplan_r.srw
$PBExportComments$생산계획 대비 실적조회(1998/05/05, 이인호)
forward
global type w_mpwcplan_r from w_inheritance
end type
type dw_3 from datawindow within w_mpwcplan_r
end type
type rb_1 from radiobutton within w_mpwcplan_r
end type
type rb_2 from radiobutton within w_mpwcplan_r
end type
type dw_area from datawindow within w_mpwcplan_r
end type
type em_2 from editmask within w_mpwcplan_r
end type
type dw_4 from datawindow within w_mpwcplan_r
end type
type rb_3 from radiobutton within w_mpwcplan_r
end type
type rb_4 from radiobutton within w_mpwcplan_r
end type
type rb_5 from radiobutton within w_mpwcplan_r
end type
type pb_1 from picturebutton within w_mpwcplan_r
end type
type st_1 from statictext within w_mpwcplan_r
end type
type st_3 from statictext within w_mpwcplan_r
end type
type st_4 from statictext within w_mpwcplan_r
end type
type ddlb_fld from dropdownlistbox within w_mpwcplan_r
end type
type st_5 from statictext within w_mpwcplan_r
end type
type ddlb_op from dropdownlistbox within w_mpwcplan_r
end type
type sle_value from singlelineedit within w_mpwcplan_r
end type
type cb_1 from commandbutton within w_mpwcplan_r
end type
type cb_2 from commandbutton within w_mpwcplan_r
end type
type cb_3 from commandbutton within w_mpwcplan_r
end type
type cb_5 from commandbutton within w_mpwcplan_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpwcplan_r
end type
type em_1 from editmask within w_mpwcplan_r
end type
end forward

global type w_mpwcplan_r from w_inheritance
integer width = 4599
integer height = 2084
string title = "생산계획 대비 실적 조회(w_mpwcplan_r)"
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
dw_area dw_area
em_2 em_2
dw_4 dw_4
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
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
end type
global w_mpwcplan_r w_mpwcplan_r

type variables
st_print i_print
datawindowchild idwc_wc
string is_wc = ''
gs_itembaldo_str ist_code

end variables

on w_mpwcplan_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_area=create dw_area
this.em_2=create em_2
this.dw_4=create dw_4
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.rb_4
this.Control[iCurrent+9]=this.rb_5
this.Control[iCurrent+10]=this.pb_1
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.st_5
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_1
this.Control[iCurrent+19]=this.cb_2
this.Control[iCurrent+20]=this.cb_3
this.Control[iCurrent+21]=this.cb_5
this.Control[iCurrent+22]=this.ddlb_dwtitles
this.Control[iCurrent+23]=this.em_1
end on

on w_mpwcplan_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_area)
destroy(this.em_2)
destroy(this.dw_4)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
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
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false
dw_3.visible = false

dw_3.settransobject(sqlca)

dw_4.settransobject(sqlca)
dw_4.insertrow(0)  
dw_4.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

string ls_colx

//ddlb_1.taxt = "작업장+납기+수주+제품코드"
dw_1.sharedata(dw_2)
dw_1.sharedata(dw_3)
ls_colx = dw_1.object.item_name1.x
dw_1.object.datawindow.horizontalscrollsplit= ls_colx

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

/////////////////////////////////////
// 사업장변경시 작업장 필터링
/////////////////////////////////////
DataWindowChild ldwc_wc1

// 작업 필터링
dw_4.getchild("wc_no", ldwc_wc1)
ldwc_wc1.settransobject(sqlca)
ldwc_wc1.setfilter( "wc_no = ' ' OR area_no = '" + gs_area + "'" )
ldwc_wc1.filter()
ldwc_wc1.setsort( "work_type A, wc_no A" )
ldwc_wc1.sort()

pb_retrieve.postevent(clicked!)



end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_mpwcplan_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpwcplan_r
integer x = 32
integer y = 396
integer width = 4498
integer height = 1552
integer taborder = 50
string dataobject = "d_mpwcplan_s"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_mpwcplan_r
integer x = 41
integer y = 36
integer width = 1440
integer height = 136
string text = "생산계획 대비실적 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpwcplan_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpwcplan_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpwcplan_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpwcplan_r
integer x = 4302
integer y = 56
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpwcplan_r
integer x = 3909
integer y = 56
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if rb_1.checked = true then
	l_print.st_datawindow = dw_2
else
	l_print.st_datawindow = dw_3
end if
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 작업장별 생산계획 대비 실적 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
	
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpwcplan_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpwcplan_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mpwcplan_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpwcplan_r
integer x = 3721
integer y = 56
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area,  ls_flag
date   ld_sdate, ld_edate

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

if rb_3.checked = true then
	ls_flag = "%"   //생산계획여부
else
	if rb_4.checked = true then
		ls_flag = "Y%"
	else
		ls_flag = "N%"
	end if
end if

if is_wc = '전체' then is_wc = ''

dw_1.retrieve(is_wc + '%', ld_sdate, ld_edate, ls_flag, ls_area)
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if
	
end event

type gb_3 from w_inheritance`gb_3 within w_mpwcplan_r
integer x = 32
integer y = 224
integer width = 4498
integer height = 152
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpwcplan_r
integer x = 2144
integer y = 16
integer width = 1527
integer height = 204
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpwcplan_r
integer x = 3685
integer y = 16
integer width = 846
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpwcplan_r
integer x = 1216
integer y = 0
integer width = 123
integer height = 88
integer taborder = 60
string dataobject = "d_mpplansale_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_mpwcplan_r
integer x = 1349
integer width = 123
integer height = 88
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_mpplansale_r2"
boolean livescroll = true
end type

type rb_1 from radiobutton within w_mpwcplan_r
integer x = 2185
integer y = 68
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "계획용"
boolean checked = true
end type

type rb_2 from radiobutton within w_mpwcplan_r
integer x = 2185
integer y = 136
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "보고용"
end type

type dw_area from datawindow within w_mpwcplan_r
integer x = 2505
integer y = 124
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
DataWindowChild ldwc_wc1
string ls_area

ls_area = trim(data)

// 작업 필터링
dw_4.getchild("wc_no", ldwc_wc1)
ldwc_wc1.settransobject(sqlca)
ldwc_wc1.setfilter( "wc_no = ' ' OR area_no = '" + ls_area + "'" )
ldwc_wc1.filter()
ldwc_wc1.setsort( "work_type A, wc_no A" )
ldwc_wc1.sort()

end event

type em_2 from editmask within w_mpwcplan_r
integer x = 2857
integer y = 272
integer width = 366
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
string displaydata = "~b"
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

type dw_4 from datawindow within w_mpwcplan_r
integer x = 3035
integer y = 128
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

event itemchanged;is_wc = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")

end event

type rb_3 from radiobutton within w_mpwcplan_r
integer x = 3259
integer y = 280
integer width = 224
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체"
boolean checked = true
end type

type rb_4 from radiobutton within w_mpwcplan_r
integer x = 3497
integer y = 280
integer width = 347
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "생산계획"
end type

type rb_5 from radiobutton within w_mpwcplan_r
integer x = 3858
integer y = 280
integer width = 457
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "미생산계획"
end type

type pb_1 from picturebutton within w_mpwcplan_r
event mousemove pbm_mousemove
integer x = 4096
integer y = 56
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

type st_1 from statictext within w_mpwcplan_r
integer x = 2505
integer y = 48
integer width = 526
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

type st_3 from statictext within w_mpwcplan_r
integer x = 3040
integer y = 48
integer width = 585
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

type st_4 from statictext within w_mpwcplan_r
integer x = 69
integer y = 280
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

type ddlb_fld from dropdownlistbox within w_mpwcplan_r
integer x = 256
integer y = 264
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

type st_5 from statictext within w_mpwcplan_r
integer x = 741
integer y = 280
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

type ddlb_op from dropdownlistbox within w_mpwcplan_r
integer x = 910
integer y = 264
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

type sle_value from singlelineedit within w_mpwcplan_r
integer x = 1230
integer y = 272
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

type cb_1 from commandbutton within w_mpwcplan_r
integer x = 1801
integer y = 272
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

type cb_2 from commandbutton within w_mpwcplan_r
integer x = 1966
integer y = 272
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

type cb_3 from commandbutton within w_mpwcplan_r
integer x = 2130
integer y = 272
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

type cb_5 from commandbutton within w_mpwcplan_r
integer x = 2295
integer y = 272
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

type ddlb_dwtitles from dropdownlistbox within w_mpwcplan_r
integer x = 297
integer y = 276
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

type em_1 from editmask within w_mpwcplan_r
integer x = 2482
integer y = 272
integer width = 366
integer height = 76
integer taborder = 20
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
string displaydata = ""
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

