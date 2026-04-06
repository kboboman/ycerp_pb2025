$PBExportHeader$w_mpsale1_r.srw
$PBExportComments$물품별 수주일보(상세)(1998/10/29,곽용덕)
forward
global type w_mpsale1_r from w_inheritance
end type
type gb_5 from groupbox within w_mpsale1_r
end type
type gb_4 from groupbox within w_mpsale1_r
end type
type em_1 from editmask within w_mpsale1_r
end type
type em_2 from editmask within w_mpsale1_r
end type
type rb_1 from radiobutton within w_mpsale1_r
end type
type rb_2 from radiobutton within w_mpsale1_r
end type
type cbx_1 from checkbox within w_mpsale1_r
end type
type st_1 from statictext within w_mpsale1_r
end type
type rb_3 from radiobutton within w_mpsale1_r
end type
end forward

global type w_mpsale1_r from w_inheritance
integer width = 4690
integer height = 2432
string title = "물품별 수주일보(상세)(w_mpsale1_r)"
gb_5 gb_5
gb_4 gb_4
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
cbx_1 cbx_1
st_1 st_1
rb_3 rb_3
end type
global w_mpsale1_r w_mpsale1_r

type variables
st_print i_print
datawindowchild idwc_wc
end variables

on w_mpsale1_r.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.gb_4=create gb_4
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cbx_1=create cbx_1
this.st_1=create st_1
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.rb_3
end on

on w_mpsale1_r.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.rb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')


dw_2.insertrow(0)
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()
dw_2.object.wc_no[1] = ' '


end event

event resize;call super::resize;gb_2.width  = this.width  - 114
gb_2.height = this.height - 380

dw_1.width  = this.width  - 178
dw_1.height = this.height - 476


end event

type pb_save from w_inheritance`pb_save within w_mpsale1_r
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_mpsale1_r
integer x = 59
integer width = 4512
integer height = 1956
integer taborder = 80
string dataobject = "d_mpsale1_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_mpsale1_r
integer x = 2382
integer y = 132
integer width = 882
integer height = 88
integer taborder = 90
string dataobject = "d_mpwcno_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpsale1_r
integer x = 37
integer y = 48
integer width = 1650
integer height = 132
string text = "물품별 수주일보(상세)"
end type

type st_tips from w_inheritance`st_tips within w_mpsale1_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsale1_r
boolean visible = false
integer x = 3008
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsale1_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsale1_r
integer x = 4402
integer y = 56
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsale1_r
integer x = 4206
integer y = 56
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_pur

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 물품별 수주일보를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsale1_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpsale1_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpsale1_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsale1_r
integer x = 4009
integer y = 60
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end
string ls_colx, ls_source, ls_wcname

dw_2.accepttext()
if em_1.text = '' then
	messagebox("확인","기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","기간을 입력하세요!",information!)
	em_2.setfocus()
	return
end if

ld_start = date(em_1.text)
ld_end = date(em_2.text)
if cbx_1.checked = true then
	ls_source = "B"
else
	ls_source = "%"
end if

if rb_3.checked = true then
//	ls_wcname = trim(dw_2.object.wc_no[1])
	dw_2.getchild('wc_no',idwc_wc)
	ls_wcname = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_name'))
	ls_wcname = ls_wcname + "%"
	dw_1.retrieve(ld_start,ld_end, ls_wcname)
else
	dw_1.retrieve(ld_start,ld_end,ls_source)
end if

//ls_colx = dw_1.object.sale_due_date.x	
//dw_1.object.datawindow.horizontalscrollsplit= ls_colx	

end event

type gb_3 from w_inheritance`gb_3 within w_mpsale1_r
boolean visible = false
integer x = 37
integer y = 224
integer width = 3397
integer height = 176
integer taborder = 100
end type

type gb_2 from w_inheritance`gb_2 within w_mpsale1_r
integer y = 232
integer width = 4576
integer height = 2052
integer taborder = 110
integer textsize = -10
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpsale1_r
integer x = 3977
integer y = 16
integer width = 631
integer taborder = 40
end type

type gb_5 from groupbox within w_mpsale1_r
integer x = 2194
integer y = 4
integer width = 1765
integer height = 228
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_mpsale1_r
boolean visible = false
integer x = 1851
integer y = 40
integer width = 133
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
end type

type em_1 from editmask within w_mpsale1_r
integer x = 2501
integer y = 48
integer width = 357
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpsale1_r
integer x = 2880
integer y = 48
integer width = 357
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_mpsale1_r
integer x = 3273
integer y = 64
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
string text = "전체"
boolean checked = true
end type

event clicked;cbx_1.enabled = true
dw_2.visible = false
if this.checked = true then
	dw_1.dataobject = "d_mpsale1_r"
	dw_1.settransobject(sqlca)
end if

end event

type rb_2 from radiobutton within w_mpsale1_r
integer x = 3273
integer y = 148
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
string text = "미출고"
end type

event clicked;cbx_1.enabled = true
dw_2.visible = false
if this.checked = true then
	dw_1.dataobject = "d_mpsale1_r2"
	dw_1.settransobject(sqlca)
end if

end event

type cbx_1 from checkbox within w_mpsale1_r
integer x = 3579
integer y = 140
integer width = 352
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
string text = "부속자재"
end type

type st_1 from statictext within w_mpsale1_r
integer x = 2208
integer y = 60
integer width = 293
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "수주기간"
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_mpsale1_r
integer x = 3575
integer y = 64
integer width = 329
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "작업장"
end type

event clicked;cbx_1.enabled = false
dw_2.visible = true
if this.checked = true then
	dw_1.dataobject = "d_mpsale1_r3"
	dw_1.settransobject(sqlca)
end if

end event

