$PBExportHeader$w_mpslituse_r.srw
$PBExportComments$일별 코일사용 현황(2001/05/08,이인호)
forward
global type w_mpslituse_r from w_inheritance
end type
type st_1 from statictext within w_mpslituse_r
end type
type em_1 from editmask within w_mpslituse_r
end type
type em_2 from editmask within w_mpslituse_r
end type
type rb_1 from radiobutton within w_mpslituse_r
end type
type rb_2 from radiobutton within w_mpslituse_r
end type
type rb_3 from radiobutton within w_mpslituse_r
end type
type rb_4 from radiobutton within w_mpslituse_r
end type
type rb_5 from radiobutton within w_mpslituse_r
end type
type ddlb_1 from dropdownlistbox within w_mpslituse_r
end type
type ddlb_2 from dropdownlistbox within w_mpslituse_r
end type
type dw_area from datawindow within w_mpslituse_r
end type
type pb_1 from picturebutton within w_mpslituse_r
end type
type st_8 from statictext within w_mpslituse_r
end type
type ddlb_fld from dropdownlistbox within w_mpslituse_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpslituse_r
end type
type st_9 from statictext within w_mpslituse_r
end type
type ddlb_op from dropdownlistbox within w_mpslituse_r
end type
type sle_value from singlelineedit within w_mpslituse_r
end type
type cb_filteron from commandbutton within w_mpslituse_r
end type
type cb_filteroff from commandbutton within w_mpslituse_r
end type
type cb_1 from commandbutton within w_mpslituse_r
end type
type cb_2 from commandbutton within w_mpslituse_r
end type
end forward

global type w_mpslituse_r from w_inheritance
integer width = 4695
integer height = 2780
string title = "일별코일 사용현황(w_mpslituse_r)"
st_1 st_1
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
ddlb_1 ddlb_1
ddlb_2 ddlb_2
dw_area dw_area
pb_1 pb_1
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
end type
global w_mpslituse_r w_mpslituse_r

type variables
datawindowchild idwc_area, idwc_loc, idwc_wc
st_print i_print
date   id_start, id_end
string is_flag = 'T', is_wc = "%"

end variables

on w_mpslituse_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.rb_5
this.Control[iCurrent+9]=this.ddlb_1
this.Control[iCurrent+10]=this.ddlb_2
this.Control[iCurrent+11]=this.dw_area
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_9
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_filteron
this.Control[iCurrent+20]=this.cb_filteroff
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.cb_2
end on

on w_mpslituse_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false
em_1.text    = string(today(), "YYYY/MM/DD")
em_2.text    = string(today(), "YYYY/MM/DD")
ddlb_1.text  = "전체"
ddlb_2.text  = "전체"

dw_1.insertrow(0)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", " ")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = gs_area


rb_1.enabled = false				// 전체
rb_2.checked = true				// 사내
rb_3.enabled = false				// 외주
rb_5.enabled = false				// 잔량	
rb_2.triggerevent(clicked!)	// 사내

end event

event resize;call super::resize;//
gb_3.width  = this.width  - 105
gb_3.height = this.height - 376

dw_1.width  = this.width  - 165
dw_1.height = this.height - 548

end event

type pb_save from w_inheritance`pb_save within w_mpslituse_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpslituse_r
string tag = "d_mpslituse_wt2"
integer x = 59
integer y = 384
integer width = 4530
integer height = 2232
integer taborder = 30
string title = "d_mpslituse_t"
string dataobject = "d_mpslituse_t1"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_mpslituse_r
integer x = 1138
integer y = 12
integer width = 155
integer height = 120
integer taborder = 40
string dataobject = "d_mpslituse_wr2"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpslituse_r
integer x = 37
integer y = 48
integer width = 1170
integer height = 152
string text = "일별코일 사용현황"
end type

type st_tips from w_inheritance`st_tips within w_mpslituse_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpslituse_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpslituse_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpslituse_r
integer x = 4402
integer y = 68
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpslituse_r
integer x = 4009
integer y = 68
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
w_repsuper   w_print
string ls_sql, ls_where, ls_source

IF dw_1.getrow() < 1 THEN RETURN

dw_2.SetTransObject(SQLCA)
dw_1.sharedata(dw_2)

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 일별코일 사용현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100 DataWindow.print.margin.top = 304'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpslituse_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_mpslituse_r
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_mpslituse_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpslituse_r
integer x = 3817
integer y = 68
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area,  ls_work
date   ld_start, ld_end

dw_1.reset()
dw_1.SetTransObject(SQLCA)

dw_area.accepttext()
ls_area   = trim(dw_area.object.area[1])
if isnull(ls_area)  or ls_area  = "" then ls_area  = "%"

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

// 사내
if rb_2.checked = true then		
   ls_work = "2"	// 사내
	if is_flag = "T" then		// 전체
		dw_1.retrieve( ld_start, ld_end, ls_area )
	elseif is_flag = "S" then	// 스리팅
		dw_1.retrieve( ld_start, ld_end, is_wc, ls_area )
	else								// 원코일
		dw_1.retrieve( ld_start, ld_end )
	end if	
// 판매
elseif rb_4.checked = true then	
   ls_work = "4"	// 판매
	dw_1.retrieve( ls_area, ld_start, ld_end, is_flag )	
else
   ls_work = ""	// 외주, 잔량
	dw_1.retrieve( ld_start, ld_end )
end if

if dw_1.rowcount() < 1 then
	messagebox("에러","해당일에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpslituse_r
integer x = 32
integer y = 240
integer width = 4590
integer height = 2404
integer taborder = 80
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_mpslituse_r
integer x = 1934
integer y = 16
integer width = 1838
integer height = 220
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpslituse_r
integer x = 3785
integer y = 16
integer width = 837
integer height = 220
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type st_1 from statictext within w_mpslituse_r
integer x = 3250
integer y = 128
integer width = 73
integer height = 76
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_1 from editmask within w_mpslituse_r
integer x = 2839
integer y = 140
integer width = 407
integer height = 76
integer taborder = 110
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
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpslituse_r
integer x = 3323
integer y = 140
integer width = 407
integer height = 76
integer taborder = 100
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
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_mpslituse_r
integer x = 2592
integer y = 60
integer width = 229
integer height = 72
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

event clicked;// 전체
CHOOSE CASE is_flag
	CASE 'W'
		dw_1.dataobject = 'd_mpslituse_wt'
		dw_2.dataobject = 'd_mpslituse_wr'
	CASE 'S'
		dw_1.dataobject = 'd_mpslituse_t'
		dw_2.dataobject = 'd_mpslituse_r'
END CHOOSE

ddlb_2.enabled = false


end event

type rb_2 from radiobutton within w_mpslituse_r
integer x = 2821
integer y = 60
integer width = 229
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사내"
end type

event clicked;// 사내
CHOOSE CASE is_flag
	CASE 'T'
		dw_1.dataobject = 'd_mpslituse_tt1'
		dw_2.dataobject = 'd_mpslituse_tr1'
		ddlb_2.enabled = false
	CASE 'W'
		dw_1.dataobject = 'd_mpslituse_wt1'
		dw_2.dataobject = 'd_mpslituse_wr1'
		ddlb_2.enabled = false
	CASE 'S'
		dw_1.dataobject = 'd_mpslituse_t1'
		dw_2.dataobject = 'd_mpslituse_r1'
		ddlb_2.enabled = true
END CHOOSE

end event

type rb_3 from radiobutton within w_mpslituse_r
integer x = 3049
integer y = 60
integer width = 229
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주"
end type

event clicked;// 외주
CHOOSE CASE is_flag
	CASE 'T'		// 전체
		dw_1.dataobject = 'd_mpslituse_tt2'
		dw_2.dataobject = 'd_mpslituse_tr2'
	CASE 'W'		// 원코일
		dw_1.dataobject = 'd_mpslituse_wt2'
		dw_2.dataobject = 'd_mpslituse_wr2'
	CASE 'S'		// 스리팅
		dw_1.dataobject = 'd_mpslituse_t2'
		dw_2.dataobject = 'd_mpslituse_r2'	// 누락
END CHOOSE

ddlb_2.enabled = false


end event

type rb_4 from radiobutton within w_mpslituse_r
integer x = 3278
integer y = 60
integer width = 229
integer height = 72
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
string text = "판매"
end type

event clicked;// 판매
dw_1.dataobject = 'd_mpslituse_t3'
dw_2.dataobject = 'd_mpslituse_r3'
ddlb_2.enabled = false

//CHOOSE CASE is_flag
//	CASE 'W'
//		dw_1.dataobject = 'd_mpslituse_t3'
//		dw_2.dataobject = 'd_mpslituse_r3'
//		ddlb_2.enabled = false
//	CASE 'S'
//		dw_1.dataobject = 'd_mpslituse_t5'
//		dw_2.dataobject = 'd_mpslituse_r5'
//		ddlb_2.enabled = true
//END CHOOSE


end event

type rb_5 from radiobutton within w_mpslituse_r
integer x = 3506
integer y = 60
integer width = 229
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "잔량"
end type

event clicked;// 잔량
dw_1.dataobject = 'd_mpslituse_t4'
dw_2.dataobject = 'd_mpslituse_r4'
ddlb_2.enabled = false

end event

type ddlb_1 from dropdownlistbox within w_mpslituse_r
integer x = 1975
integer y = 136
integer width = 526
integer height = 332
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
string item[] = {"전체","원코일","스리팅"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
CHOOSE CASE index
	CASE 1
		is_flag = 'T'		// 전체
		rb_2.triggerevent(clicked!)
		rb_2.checked = true
		rb_4.enabled = false
		rb_3.enabled = false
		rb_5.enabled = false
		ddlb_2.enabled = false
		
	CASE 2
		is_flag = 'W'		// 원코일
		rb_2.triggerevent(clicked!)
		rb_2.checked = true
		rb_3.enabled = true
		rb_4.enabled = true
		rb_5.enabled = false
		ddlb_2.enabled = false
		
	CASE 3
		is_flag = 'S'		// 스리팅
		rb_2.triggerevent(clicked!)
		rb_2.checked = true
		rb_3.enabled = false
		rb_4.enabled = true
		rb_5.enabled = true
		ddlb_2.enabled = true
END CHOOSE

end event

type ddlb_2 from dropdownlistbox within w_mpslituse_r
integer x = 2510
integer y = 136
integer width = 315
integer height = 428
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","성형","절곡","유압","YSP","화성","명송"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
CHOOSE CASE index
	CASE 1
		is_wc = "%"
	CASE ELSE
		is_wc = trim(this.text) + "%"
END CHOOSE
//해당작업장의 이름(wc.work_name)을 정확히 ddlb_2에 넣어 줘야 한다.

end event

type dw_area from datawindow within w_mpslituse_r
integer x = 1975
integer y = 52
integer width = 535
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type pb_1 from picturebutton within w_mpslituse_r
event mousemove pbm_mousemove
integer x = 4197
integer y = 68
integer width = 187
integer height = 144
integer taborder = 130
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
		                        "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
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

type st_8 from statictext within w_mpslituse_r
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

type ddlb_fld from dropdownlistbox within w_mpslituse_r
integer x = 270
integer y = 284
integer width = 480
integer height = 580
integer taborder = 80
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

type ddlb_dwtitles from dropdownlistbox within w_mpslituse_r
integer x = 329
integer y = 292
integer width = 306
integer height = 92
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

type st_9 from statictext within w_mpslituse_r
integer x = 786
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_mpslituse_r
integer x = 960
integer y = 284
integer width = 261
integer height = 500
integer taborder = 80
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpslituse_r
integer x = 1234
integer y = 288
integer width = 581
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_mpslituse_r
integer x = 1829
integer y = 284
integer width = 197
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_mpslituse_r
integer x = 2030
integer y = 284
integer width = 197
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_mpslituse_r
integer x = 2231
integer y = 284
integer width = 183
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_mpslituse_r
integer x = 2418
integer y = 284
integer width = 183
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

