$PBExportHeader$w_mpslituse_r_f2.srw
$PBExportComments$일별 코일사용 현황(2001/05/08,이인호)
forward 
global type w_mpslituse_r_f2 from w_inheritance
end type
type st_1 from statictext within w_mpslituse_r_f2
end type
type em_1 from editmask within w_mpslituse_r_f2
end type
type em_2 from editmask within w_mpslituse_r_f2
end type
type rb_1 from radiobutton within w_mpslituse_r_f2
end type
type rb_2 from radiobutton within w_mpslituse_r_f2
end type
type rb_3 from radiobutton within w_mpslituse_r_f2
end type
type rb_4 from radiobutton within w_mpslituse_r_f2
end type
type rb_5 from radiobutton within w_mpslituse_r_f2
end type
type ddlb_1 from dropdownlistbox within w_mpslituse_r_f2
end type
type ddlb_2 from dropdownlistbox within w_mpslituse_r_f2
end type
type dw_area from datawindow within w_mpslituse_r_f2
end type
type pb_1 from picturebutton within w_mpslituse_r_f2
end type
type st_8 from statictext within w_mpslituse_r_f2
end type
type ddlb_fld from dropdownlistbox within w_mpslituse_r_f2
end type
type ddlb_dwtitles from dropdownlistbox within w_mpslituse_r_f2
end type
type st_9 from statictext within w_mpslituse_r_f2
end type
type ddlb_op from dropdownlistbox within w_mpslituse_r_f2
end type
type sle_value from singlelineedit within w_mpslituse_r_f2
end type
type cb_filteron from commandbutton within w_mpslituse_r_f2
end type
type cb_filteroff from commandbutton within w_mpslituse_r_f2
end type
type cb_1 from commandbutton within w_mpslituse_r_f2
end type
type cb_2 from commandbutton within w_mpslituse_r_f2
end type
end forward

global type w_mpslituse_r_f2 from w_inheritance
integer width = 4571
integer height = 2000
string title = "일별코일 사용현황(w_mpslituse_r_f2)"
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
global w_mpslituse_r_f2 w_mpslituse_r_f2

type variables
st_print i_print
date id_start, id_end
string is_flag = 'T', is_wc = "%"
datawindowchild idwc_area
end variables

on w_mpslituse_r_f2.create
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

on w_mpslituse_r_f2.destroy
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

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.insertrow(0)
dw_2.visible = false
em_1.text = string(today(), "YYYY/MM/DD")
em_2.text = string(today(), "YYYY/MM/DD")
ddlb_1.text = '전체'
ddlb_2.text = '전체'
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.getchild('area',idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체')
dw_area.object.area[1] = gs_area

//dw_area.accepttext()

//if gs_userid = 'root' or gs_userid = '1999010s' then
//	dw_area.enabled = true
//else
//	dw_area.enabled = false
//end if
rb_2.triggerevent(clicked!)
rb_1.enabled = false
//rb_1.visible = false
rb_2.checked = true
rb_3.enabled = false
rb_5.enabled = false

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (dw_1.x * 2)
dw_1.height = newheight - dw_1.y - dw_1.x

end event

type pb_save from w_inheritance`pb_save within w_mpslituse_r_f2
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpslituse_r_f2
string tag = "d_mpslituse_tt1"
integer x = 37
integer y = 420
integer width = 4453
integer height = 1440
integer taborder = 30
string title = "d_mpslituse_tt1"
string dataobject = "d_mpslituse_tt1_f2"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_mpslituse_r_f2
integer x = 32
integer y = 28
integer width = 1170
string text = "일별코일 사용현황"
end type

type st_tips from w_inheritance`st_tips within w_mpslituse_r_f2
end type

type pb_compute from w_inheritance`pb_compute within w_mpslituse_r_f2
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpslituse_r_f2
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpslituse_r_f2
integer x = 4279
integer y = 68
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpslituse_r_f2
integer x = 3895
integer y = 68
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_1.getrow() <= 0 THEN
   RETURN
END IF

dw_2.SetTransObject(SQLCA)
dw_1.sharedata(dw_2)

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 일별 코일작업현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100 DataWindow.print.margin.top = 304'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpslituse_r_f2
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_mpslituse_r_f2
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_mpslituse_r_f2
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpslituse_r_f2
integer x = 3703
integer y = 68
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end

ld_start = date(em_1.text)
ld_end = date(em_2.text)

dw_1.reset()
dw_1.SetTransObject(SQLCA)
if rb_2.checked = true then
	if is_flag = 'S' then
		dw_1.retrieve( ld_start, ld_end, is_wc, dw_area.object.area[1])
	elseif is_flag = 'T' then
		dw_1.retrieve( ld_start, ld_end, dw_area.object.area[1])
	else
		dw_1.retrieve( ld_start, ld_end)
	end if
elseif rb_4.checked = true then
	dw_1.retrieve( ld_start, ld_end, is_flag)
else
	dw_1.retrieve( ld_start, ld_end)
end if
//		dw_1.dataobject = 'd_mpslituse_wt2'
//		dw_2.dataobject = 'd_mpslituse_wr2'
if dw_1.rowcount() < 1 then
	messagebox("에러","해당일에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpslituse_r_f2
integer x = 37
integer y = 244
integer width = 4453
integer height = 164
integer taborder = 80
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpslituse_r_f2
integer x = 1934
integer y = 16
integer width = 1733
integer height = 220
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpslituse_r_f2
integer x = 3680
integer y = 16
integer width = 809
integer height = 220
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpslituse_r_f2
string tag = "d_mpslituse_r1"
integer x = 1111
integer y = 4
integer width = 91
integer height = 68
integer taborder = 40
string dataobject = "d_mpslituse_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_1 from statictext within w_mpslituse_r_f2
integer x = 3141
integer y = 116
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

type em_1 from editmask within w_mpslituse_r_f2
integer x = 2729
integer y = 128
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

type em_2 from editmask within w_mpslituse_r_f2
integer x = 3214
integer y = 128
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

type rb_1 from radiobutton within w_mpslituse_r_f2
integer x = 2482
integer y = 48
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

event clicked;CHOOSE CASE is_flag
	CASE 'W'
		dw_1.dataobject = 'd_mpslituse_wt'
		dw_2.dataobject = 'd_mpslituse_wr'
	CASE 'S'
		dw_1.dataobject = 'd_mpslituse_t'
		dw_2.dataobject = 'd_mpslituse_r'
END CHOOSE

ddlb_2.enabled = false


end event

type rb_2 from radiobutton within w_mpslituse_r_f2
integer x = 2711
integer y = 48
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

event clicked;CHOOSE CASE is_flag
	CASE 'T'
		dw_1.dataobject = 'd_mpslituse_tt1_f2'
		dw_2.dataobject = 'd_mpslituse_tr1_f2'
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
//
//ddlb_2.enabled = true
//
//
end event

type rb_3 from radiobutton within w_mpslituse_r_f2
integer x = 2939
integer y = 48
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

event clicked;CHOOSE CASE is_flag
	CASE 'T'
		dw_1.dataobject = 'd_mpslituse_tt2'
		dw_2.dataobject = 'd_mpslituse_tr2'
	CASE 'W'
		dw_1.dataobject = 'd_mpslituse_wt2'
		dw_2.dataobject = 'd_mpslituse_wr2'
	CASE 'S'
		dw_1.dataobject = 'd_mpslituse_t2'
		dw_2.dataobject = 'd_mpslituse_r2'
END CHOOSE

ddlb_2.enabled = false


end event

type rb_4 from radiobutton within w_mpslituse_r_f2
integer x = 3168
integer y = 48
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

event clicked;dw_1.dataobject = 'd_mpslituse_t3'
dw_2.dataobject = 'd_mpslituse_r3'
ddlb_2.enabled = false

end event

type rb_5 from radiobutton within w_mpslituse_r_f2
integer x = 3397
integer y = 48
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

event clicked;dw_1.dataobject = 'd_mpslituse_t4'
dw_2.dataobject = 'd_mpslituse_r4'
ddlb_2.enabled = false

end event

type ddlb_1 from dropdownlistbox within w_mpslituse_r_f2
integer x = 2350
integer y = 132
integer width = 315
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

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_flag = 'T'
		rb_2.triggerevent(clicked!)
		rb_2.checked = true
		rb_4.enabled = false
		rb_3.enabled = false
		rb_5.enabled = false
		ddlb_2.enabled = false
	CASE 2
		is_flag = 'W'
		rb_2.triggerevent(clicked!)
		rb_2.checked = true
		rb_3.enabled = true
		rb_4.enabled = true
		rb_5.enabled = false
		ddlb_2.enabled = false
	CASE 3
		is_flag = 'S'
		rb_2.triggerevent(clicked!)
		rb_2.checked = true
		rb_3.enabled = false
		rb_4.enabled = true
		rb_5.enabled = true
		ddlb_2.enabled = true
//	CASE 4
//		is_flag = 'S'
//		rb_2.triggerevent(clicked!)
//		rb_2.checked = true
//		rb_3.enabled = false
//		rb_4.enabled = true
//		rb_5.enabled = true
END CHOOSE

end event

type ddlb_2 from dropdownlistbox within w_mpslituse_r_f2
integer x = 1979
integer y = 132
integer width = 283
integer height = 384
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

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_wc = "%"
	CASE ELSE
		is_wc = trim(this.text) + "%"
END CHOOSE
//해당작업장의 이름(wc.work_name)을 정확히 ddlb_2에 넣어 줘야 한다.
end event

type dw_area from datawindow within w_mpslituse_r_f2
integer x = 1979
integer y = 48
integer width = 503
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type pb_1 from picturebutton within w_mpslituse_r_f2
event mousemove pbm_mousemove
integer x = 4087
integer y = 68
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

type st_8 from statictext within w_mpslituse_r_f2
integer x = 101
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_mpslituse_r_f2
integer x = 283
integer y = 300
integer width = 480
integer height = 580
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

type ddlb_dwtitles from dropdownlistbox within w_mpslituse_r_f2
integer x = 343
integer y = 308
integer width = 306
integer height = 92
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
end type

type st_9 from statictext within w_mpslituse_r_f2
integer x = 800
integer y = 320
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

type ddlb_op from dropdownlistbox within w_mpslituse_r_f2
integer x = 974
integer y = 300
integer width = 261
integer height = 500
integer taborder = 30
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

type sle_value from singlelineedit within w_mpslituse_r_f2
integer x = 1248
integer y = 304
integer width = 581
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_mpslituse_r_f2
integer x = 1842
integer y = 300
integer width = 197
integer height = 84
integer taborder = 40
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

type cb_filteroff from commandbutton within w_mpslituse_r_f2
integer x = 2043
integer y = 300
integer width = 197
integer height = 84
integer taborder = 50
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

type cb_1 from commandbutton within w_mpslituse_r_f2
integer x = 2245
integer y = 300
integer width = 183
integer height = 84
integer taborder = 60
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

type cb_2 from commandbutton within w_mpslituse_r_f2
integer x = 2432
integer y = 300
integer width = 183
integer height = 84
integer taborder = 70
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

