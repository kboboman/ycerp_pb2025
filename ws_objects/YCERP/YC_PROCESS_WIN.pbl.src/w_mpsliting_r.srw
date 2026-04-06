$PBExportHeader$w_mpsliting_r.srw
$PBExportComments$스리팅생산계획조회(2001/06/15,이인호)
forward 
global type w_mpsliting_r from w_inheritance
end type
type st_1 from statictext within w_mpsliting_r
end type
type em_1 from editmask within w_mpsliting_r
end type
type em_2 from editmask within w_mpsliting_r
end type
type rb_1 from radiobutton within w_mpsliting_r
end type
type rb_2 from radiobutton within w_mpsliting_r
end type
type rb_3 from radiobutton within w_mpsliting_r
end type
type rb_4 from radiobutton within w_mpsliting_r
end type
type dw_3 from dw_1 within w_mpsliting_r
end type
type pb_excel from picturebutton within w_mpsliting_r
end type
type rb_6 from radiobutton within w_mpsliting_r
end type
type rb_7 from radiobutton within w_mpsliting_r
end type
type dw_4 from datawindow within w_mpsliting_r
end type
type rb_5 from radiobutton within w_mpsliting_r
end type
type gb_4 from gb_3 within w_mpsliting_r
end type
type gb_5 from groupbox within w_mpsliting_r
end type
end forward

global type w_mpsliting_r from w_inheritance
integer width = 4681
integer height = 2796
string title = "스리팅 생산계획 현황(w_mpsliting_r)"
st_1 st_1
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
dw_3 dw_3
pb_excel pb_excel
rb_6 rb_6
rb_7 rb_7
dw_4 dw_4
rb_5 rb_5
gb_4 gb_4
gb_5 gb_5
end type
global w_mpsliting_r w_mpsliting_r

type variables
st_print i_print
date id_start, id_end
string is_wc = 'W'
end variables

on w_mpsliting_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.dw_3=create dw_3
this.pb_excel=create pb_excel
this.rb_6=create rb_6
this.rb_7=create rb_7
this.dw_4=create dw_4
this.rb_5=create rb_5
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.pb_excel
this.Control[iCurrent+10]=this.rb_6
this.Control[iCurrent+11]=this.rb_7
this.Control[iCurrent+12]=this.dw_4
this.Control[iCurrent+13]=this.rb_5
this.Control[iCurrent+14]=this.gb_4
this.Control[iCurrent+15]=this.gb_5
end on

on w_mpsliting_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.dw_3)
destroy(this.pb_excel)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.dw_4)
destroy(this.rb_5)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_3.visible = false
dw_4.visible = false

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)

dw_1.sharedata(dw_2)
dw_3.sharedata(dw_4)

dw_3.x       = dw_1.x
dw_3.y       = dw_1.y
dw_3.width   = dw_1.width
dw_3.height  = dw_1.height

em_1.text = string(today(), "YYYY/MM/DD")
em_2.text = string(today(), "YYYY/MM/DD")

rb_4.checked = true
rb_4.triggerevent( clicked! )

end event

event resize;call super::resize;//
gb_3.width  = this.width  - 105
gb_3.height = this.height - 364

dw_1.width  = this.width  - 187
dw_1.height = this.height - 452

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_mpsliting_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsliting_r
integer x = 78
integer y = 280
integer width = 4494
integer height = 2344
integer taborder = 30
string dataobject = "d_mpsliting_s2"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_mpsliting_r
integer x = 32
integer width = 1413
string text = "스리팅 생산계획 현황"
end type

type st_tips from w_inheritance`st_tips within w_mpsliting_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsliting_r
boolean visible = false
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsliting_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsliting_r
integer x = 4393
integer y = 60
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsliting_r
integer x = 4009
integer y = 60
integer taborder = 70
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
gs_print_str lstr_print

if rb_3.checked = true then	// 월별
	i_print.st_datawindow  = dw_4
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc  = " 이 프로그램은 스리팅 생산계획(월별)을 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
	opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
else
	i_print.st_datawindow  = dw_2
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc  = " 이 프로그램은 스리팅 생산계획 현황을 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsliting_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpsliting_r
boolean visible = false
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_mpsliting_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsliting_r
integer x = 3817
integer y = 60
integer taborder = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date   ld_end,  ld_start
long   ll_row
string ls_flag, ls_start, ls_end

if rb_1.checked = true then		// 사내
	ls_flag = "I"
elseif rb_2.checked = true then	// 외주
	ls_flag = "O"
elseif rb_5.checked = true then	// 전체
	ls_flag = "%"
end if

if rb_3.checked = true then	// 월별
	ls_start = LeftA(string(em_1.text),4) + MidA(string(em_1.text),6,2)
	ls_end   = LeftA(string(em_2.text),4) + MidA(string(em_2.text),6,2)
	ll_row   = dw_3.retrieve( ls_start, ls_end, ls_flag )
else									// 일별
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)
	ll_row   = dw_1.retrieve( ld_start, ld_end, ls_flag )
end if

if ll_row < 1 then
	MessageBox("확인","해당 조건의 데이터가 존재하지 않습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpsliting_r
integer x = 37
integer y = 224
integer width = 4576
integer height = 2432
integer taborder = 90
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsliting_r
integer x = 2816
integer y = 20
integer width = 955
integer height = 204
integer taborder = 0
integer textsize = -8
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsliting_r
integer x = 3790
integer y = 20
integer width = 818
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_mpsliting_r
integer x = 1449
integer y = 8
integer width = 105
integer height = 80
integer taborder = 40
string dataobject = "d_mpsliting_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_1 from statictext within w_mpsliting_r
integer x = 3264
integer y = 116
integer width = 55
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

type em_1 from editmask within w_mpsliting_r
integer x = 2853
integer y = 132
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

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpsliting_r
integer x = 3328
integer y = 132
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

event modified;id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_mpsliting_r
integer x = 3109
integer y = 64
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "사내"
end type

type rb_2 from radiobutton within w_mpsliting_r
integer x = 3365
integer y = 64
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "외주"
end type

type rb_3 from radiobutton within w_mpsliting_r
integer x = 2153
integer y = 72
integer width = 224
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
string text = "월별"
boolean checked = true
end type

event clicked;// 월별
if this.checked = true then
	dw_1.visible = false	// 일별
	dw_3.visible = true	// 월별

	gb_4.enabled = true	// 구분
	rb_6.enabled = true	// 폭
	rb_7.enabled = true	// 물품
else
	dw_1.visible = true	// 일별
	dw_3.visible = false	// 월별

	gb_4.enabled = false	// 구분
	rb_6.enabled = false	// 폭
	rb_7.enabled = false	// 물품
end if

dw_1.reset()
dw_3.reset()


end event

type rb_4 from radiobutton within w_mpsliting_r
integer x = 2153
integer y = 144
integer width = 224
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
string text = "일별"
end type

event clicked;// 일별
if this.checked = true then
	dw_3.visible = false	// 월별
	dw_1.visible = true	// 일별

	gb_4.enabled = false	// 구분
	rb_6.enabled = false	// 폭
	rb_7.enabled = false	// 물품
else
	dw_3.visible = true	// 월별
	dw_1.visible = false	// 일별

	gb_4.enabled = true	// 구분
	rb_6.enabled = true	// 폭
	rb_7.enabled = true	// 물품
end if

dw_1.reset()
dw_3.reset()

end event

type dw_3 from dw_1 within w_mpsliting_r
integer x = 320
integer y = 616
integer width = 4142
integer height = 1784
integer taborder = 50
boolean bringtotop = true
string title = "d_mpsliting_s4"
string dataobject = "d_mpsliting_s3"
boolean hscrollbar = false
end type

type pb_excel from picturebutton within w_mpsliting_r
event mousemove pbm_mousemove
integer x = 4201
integer y = 60
integer width = 187
integer height = 144
integer taborder = 150
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
datawindow seldw

if rb_3.checked = true then
	seldw = dw_3
else
	seldw = dw_1
end if

if seldw.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
		                        "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				seldw.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
					seldw.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type rb_6 from radiobutton within w_mpsliting_r
integer x = 2514
integer y = 72
integer width = 242
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
string text = "폭"
boolean checked = true
end type

event clicked;//
dw_1.visible = false
dw_3.visible = true

dw_3.DataObject = 'd_mpsliting_s3'
dw_3.SetTransObject(SQLCA)
dw_3.reset()
dw_1.reset()

end event

type rb_7 from radiobutton within w_mpsliting_r
integer x = 2514
integer y = 144
integer width = 247
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
string text = "물품"
end type

event clicked;//
dw_1.visible = false
dw_3.visible = true

dw_3.DataObject = 'd_mpsliting_s4'
dw_3.SetTransObject(SQLCA)
dw_3.reset()
dw_1.reset()


end event

type dw_4 from datawindow within w_mpsliting_r
integer x = 1563
integer y = 8
integer width = 105
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_mpsliting_r2"
boolean livescroll = true
end type

type rb_5 from radiobutton within w_mpsliting_r
integer x = 2857
integer y = 64
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

type gb_4 from gb_3 within w_mpsliting_r
integer x = 2469
integer y = 20
integer width = 334
integer height = 204
integer taborder = 100
integer textsize = -9
integer weight = 700
long textcolor = 0
string text = "구분"
end type

type gb_5 from groupbox within w_mpsliting_r
integer x = 2103
integer y = 20
integer width = 334
integer height = 204
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "작업"
end type

