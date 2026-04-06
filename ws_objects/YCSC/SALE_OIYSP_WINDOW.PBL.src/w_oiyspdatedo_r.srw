$PBExportHeader$w_oiyspdatedo_r.srw
$PBExportComments$YSP출고일자별 실적현황(2000/03/06,이인호)
forward
global type w_oiyspdatedo_r from w_inheritance
end type
type em_1 from editmask within w_oiyspdatedo_r
end type
type em_2 from editmask within w_oiyspdatedo_r
end type
type st_1 from statictext within w_oiyspdatedo_r
end type
type rb_1 from radiobutton within w_oiyspdatedo_r
end type
type rb_2 from radiobutton within w_oiyspdatedo_r
end type
type rb_3 from radiobutton within w_oiyspdatedo_r
end type
type st_2 from statictext within w_oiyspdatedo_r
end type
type rb_4 from radiobutton within w_oiyspdatedo_r
end type
type rb_5 from radiobutton within w_oiyspdatedo_r
end type
type gb_4 from groupbox within w_oiyspdatedo_r
end type
end forward

global type w_oiyspdatedo_r from w_inheritance
integer y = 112
integer width = 3643
integer height = 2172
string title = "YSP 출고일자별 실적현황(w_oiyspdatedo_r)"
em_1 em_1
em_2 em_2
st_1 st_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_2 st_2
rb_4 rb_4
rb_5 rb_5
gb_4 gb_4
end type
global w_oiyspdatedo_r w_oiyspdatedo_r

type variables
st_print i_print

end variables

on w_oiyspdatedo_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_2=create st_2
this.rb_4=create rb_4
this.rb_5=create rb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.rb_4
this.Control[iCurrent+9]=this.rb_5
this.Control[iCurrent+10]=this.gb_4
end on

on w_oiyspdatedo_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_2)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

end event

type pb_save from w_inheritance`pb_save within w_oiyspdatedo_r
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_oiyspdatedo_r
integer x = 14
integer y = 236
integer width = 3575
integer height = 1804
integer taborder = 0
string dataobject = "d_oiyspdatedo_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oiyspdatedo_r
integer x = 1367
integer y = 0
integer width = 82
integer height = 68
integer taborder = 0
boolean enabled = false
string dataobject = "d_oiyspdatedo_r"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_oiyspdatedo_r
integer y = 40
integer width = 1330
integer textsize = -16
string text = "YSP 출고일자별 실적현황"
end type

type st_tips from w_inheritance`st_tips within w_oiyspdatedo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiyspdatedo_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiyspdatedo_r
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_oiyspdatedo_r
integer x = 3365
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiyspdatedo_r
integer x = 3173
integer taborder = 40
end type

event pb_print::clicked;w_repsuper w_print

date ld_start, ld_end


if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//i_print.name = 'd_oiyspitemdo_r'
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 YSP출고일자별 실적현황(M2)을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oiyspdatedo_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_oiyspdatedo_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_oiyspdatedo_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiyspdatedo_r
integer x = 2981
integer taborder = 30
boolean default = true
end type

event pb_retrieve::clicked;gs_itemdo_str1 lst_code
string ls_sql, ls_where, ls_flag
date ld_start, ld_end


ld_start = date(em_1.text)
ld_end = date(em_2.text)
//
dw_1.setredraw(false)
if rb_4.checked = true then
	dw_1.dataobject = 'd_oiyspdatedo_s'
	dw_2.dataobject = 'd_oiyspdatedo_r'
else
	dw_1.dataobject = 'd_oiyspdatedo_s2'
	dw_2.dataobject = 'd_oiyspdatedo_r2'
end if
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_1.SHAREDATA(dw_2)
if rb_1.checked = true then
	ls_flag = 'A'
elseif rb_2.checked = true then
	ls_flag = 'P'
else
	ls_flag = 'Q'
end if
dw_1.retrieve('B0001',ld_start, ld_end, ls_flag)
dw_1.groupcalc()
dw_2.groupcalc()
dw_1.setredraw(true)
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if
	
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type gb_3 from w_inheritance`gb_3 within w_oiyspdatedo_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oiyspdatedo_r
integer x = 1774
integer y = 8
integer width = 1147
integer height = 220
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiyspdatedo_r
integer x = 2953
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
end type

type em_1 from editmask within w_oiyspdatedo_r
integer x = 2094
integer y = 56
integer width = 357
integer height = 76
integer taborder = 10
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
string displaydata = "~r"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oiyspdatedo_r
integer x = 2533
integer y = 56
integer width = 357
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oiyspdatedo_r
integer x = 2473
integer y = 72
integer width = 46
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oiyspdatedo_r
integer x = 2094
integer y = 148
integer width = 229
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

type rb_2 from radiobutton within w_oiyspdatedo_r
integer x = 2350
integer y = 148
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
string text = "판넬"
end type

type rb_3 from radiobutton within w_oiyspdatedo_r
integer x = 2624
integer y = 148
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
string text = "부속"
end type

type st_2 from statictext within w_oiyspdatedo_r
integer x = 1797
integer y = 68
integer width = 297
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "출고일자"
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_oiyspdatedo_r
integer x = 1463
integer y = 48
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "판매"
end type

type rb_5 from radiobutton within w_oiyspdatedo_r
integer x = 1463
integer y = 140
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "생산"
boolean checked = true
end type

type gb_4 from groupbox within w_oiyspdatedo_r
integer x = 1435
integer width = 279
integer height = 232
integer taborder = 10
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

