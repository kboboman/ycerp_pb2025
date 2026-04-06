$PBExportHeader$w_iocoilqoh_r3.srw
$PBExportComments$코일당월입출현황(2004/02/24,이인호)
forward 
global type w_iocoilqoh_r3 from w_inheritance
end type
type em_1 from editmask within w_iocoilqoh_r3
end type
type st_1 from statictext within w_iocoilqoh_r3
end type
type rb_1 from radiobutton within w_iocoilqoh_r3
end type
type rb_2 from radiobutton within w_iocoilqoh_r3
end type
type pb_2 from picturebutton within w_iocoilqoh_r3
end type
type dw_3 from datawindow within w_iocoilqoh_r3
end type
type rb_3 from radiobutton within w_iocoilqoh_r3
end type
type st_3 from statictext within w_iocoilqoh_r3
end type
type ddlb_fld from dropdownlistbox within w_iocoilqoh_r3
end type
type st_4 from statictext within w_iocoilqoh_r3
end type
type ddlb_op from dropdownlistbox within w_iocoilqoh_r3
end type
type sle_value from singlelineedit within w_iocoilqoh_r3
end type
type cb_1 from commandbutton within w_iocoilqoh_r3
end type
type cb_2 from commandbutton within w_iocoilqoh_r3
end type
type cb_3 from commandbutton within w_iocoilqoh_r3
end type
type cb_5 from commandbutton within w_iocoilqoh_r3
end type
type ddlb_dwtitles from dropdownlistbox within w_iocoilqoh_r3
end type
end forward

global type w_iocoilqoh_r3 from w_inheritance
integer width = 4553
integer height = 2660
string title = "당월코일 입출현황(w_iocoilqoh_r3)"
em_1 em_1
st_1 st_1
rb_1 rb_1
rb_2 rb_2
pb_2 pb_2
dw_3 dw_3
rb_3 rb_3
st_3 st_3
ddlb_fld ddlb_fld
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
end type
global w_iocoilqoh_r3 w_iocoilqoh_r3

type variables
string is_window

end variables

on w_iocoilqoh_r3.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.pb_2=create pb_2
this.dw_3=create dw_3
this.rb_3=create rb_3
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.pb_2
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.ddlb_dwtitles
end on

on w_iocoilqoh_r3.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.pb_2)
destroy(this.dw_3)
destroy(this.rb_3)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
dw_3.visible = false
dw_3.SetTransObject(SQLCA)

em_1.text    = string(today(),'yyyy/mm/dd')

if gf_permission('당월코일입출현황관리open', gs_userid) = 'Y' then	
else
	MessageBox("확인","이프로그램의 사용권한이 없습니다")
	pb_retrieve.enabled = false
	pb_print.enabled = false
end if

if gf_permission('당월코일입출현황관리Print', gs_userid) = 'Y' then	
else
	pb_print.enabled = false
end if


end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 64
dw_1.height = newheight - 440

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_iocoilqoh_r3
boolean visible = false
integer x = 2683
end type

type dw_1 from w_inheritance`dw_1 within w_iocoilqoh_r3
string tag = "d_iocoilqoh2_s3"
integer x = 32
integer y = 408
integer width = 4453
integer height = 2116
string title = "d_iocoilqoh_s3"
string dataobject = "d_iocoilqoh_s3"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_window = "dw_1"
this.scrolltorow( row )

end event

type st_title from w_inheritance`st_title within w_iocoilqoh_r3
integer width = 1358
string text = "당월코일 입출현황"
end type

type st_tips from w_inheritance`st_tips within w_iocoilqoh_r3
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilqoh_r3
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_iocoilqoh_r3
boolean visible = false
integer x = 2702
integer y = 48
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_iocoilqoh_r3
integer x = 4256
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilqoh_r3
integer x = 3867
integer y = 64
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 당월코일입출내역을 출력합니다." 


gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iocoilqoh_r3
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_iocoilqoh_r3
boolean visible = false
integer x = 2299
end type

type pb_insert from w_inheritance`pb_insert within w_iocoilqoh_r3
boolean visible = false
integer x = 2107
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilqoh_r3
integer x = 3675
integer y = 64
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

int li_year, li_mon

li_year = year(date(em_1.text))
li_mon  = month(date(em_1.text))

dw_3.Retrieve( li_year, li_mon, date(em_1.text) )
dw_1.Retrieve( li_year, li_mon, date(em_1.text) )
dw_1.sharedata( dw_2 )

MessageBox("확인","조회완료")

end event

type gb_3 from w_inheritance`gb_3 within w_iocoilqoh_r3
integer x = 32
integer y = 244
integer width = 4453
integer height = 148
integer textsize = -8
integer weight = 400
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilqoh_r3
integer x = 2592
integer y = 16
integer width = 1029
integer height = 212
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회일자"
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilqoh_r3
integer x = 3639
integer y = 16
integer width = 846
integer height = 212
integer textsize = -10
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_iocoilqoh_r3
integer x = 1207
integer y = 16
integer width = 128
integer height = 92
string dataobject = "d_iocoilqoh_r3"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_iocoilqoh_r3
integer x = 3205
integer y = 64
integer width = 366
integer height = 76
integer taborder = 110
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_iocoilqoh_r3
integer x = 2939
integer y = 76
integer width = 265
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
string text = "기준일:"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_iocoilqoh_r3
integer x = 2651
integer y = 84
integer width = 270
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
string text = "시화"
boolean checked = true
end type

event clicked;//
dw_1.dataobject = 'd_iocoilqoh_s3'
dw_2.dataobject = 'd_iocoilqoh_r3'
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

dw_3.visible = false
dw_1.visible = true


end event

type rb_2 from radiobutton within w_iocoilqoh_r3
integer x = 2656
integer y = 152
integer width = 270
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
string text = "YSP"
end type

event clicked;//
dw_1.dataobject = 'd_iocoilqoh2_s3'
dw_2.dataobject = 'd_iocoilqoh2_r3'
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

dw_3.visible = false
dw_1.visible = true

end event

type pb_2 from picturebutton within w_iocoilqoh_r3
event mousemove pbm_mousemove
integer x = 4059
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_cnt
DataWindow dw_xls

if rb_3.checked = true then
	dw_xls = dw_3
else
	dw_xls = dw_1
end if

ll_cnt = dw_xls.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_xls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type dw_3 from datawindow within w_iocoilqoh_r3
integer x = 347
integer y = 668
integer width = 3744
integer height = 1520
integer taborder = 120
boolean bringtotop = true
string title = "DUMP"
string dataobject = "d_iocoilqoh_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_window = "dw_3"
this.scrolltorow( row )

end event

type rb_3 from radiobutton within w_iocoilqoh_r3
integer x = 2962
integer y = 152
integer width = 581
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "입출원본 데이터"
end type

event clicked;//
dw_3.visible = true
dw_1.visible = false

end event

type st_3 from statictext within w_iocoilqoh_r3
integer x = 101
integer y = 300
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

type ddlb_fld from dropdownlistbox within w_iocoilqoh_r3
integer x = 288
integer y = 284
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

type st_4 from statictext within w_iocoilqoh_r3
integer x = 759
integer y = 300
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

type ddlb_op from dropdownlistbox within w_iocoilqoh_r3
integer x = 928
integer y = 284
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

type sle_value from singlelineedit within w_iocoilqoh_r3
integer x = 1248
integer y = 292
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

type cb_1 from commandbutton within w_iocoilqoh_r3
integer x = 1819
integer y = 292
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

if is_window = "dw_1" then
	arg_dw = dw_1
else
	arg_dw = dw_3
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_iocoilqoh_r3
integer x = 1984
integer y = 292
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

if is_window = "dw_1" then
	arg_dw = dw_1
else
	arg_dw = dw_3
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_iocoilqoh_r3
integer x = 2149
integer y = 292
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

if is_window = "dw_1" then
	arg_dw = dw_1
else
	arg_dw = dw_3
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_iocoilqoh_r3
integer x = 2313
integer y = 292
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

if is_window = "dw_1" then
	arg_dw = dw_1
else
	arg_dw = dw_3
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_iocoilqoh_r3
integer x = 320
integer y = 296
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

