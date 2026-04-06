$PBExportHeader$w_sysusercnt_r2.srw
$PBExportComments$프로그램별 사용현황(2001/08/14,이대준)
forward
global type w_sysusercnt_r2 from w_inheritance
end type
type rb_1 from radiobutton within w_sysusercnt_r2
end type
type rb_2 from radiobutton within w_sysusercnt_r2
end type
type em_1 from editmask within w_sysusercnt_r2
end type
type st_1 from statictext within w_sysusercnt_r2
end type
type em_2 from editmask within w_sysusercnt_r2
end type
type cbx_1 from checkbox within w_sysusercnt_r2
end type
type rb_3 from radiobutton within w_sysusercnt_r2
end type
type gb_4 from groupbox within w_sysusercnt_r2
end type
type st_2 from statictext within w_sysusercnt_r2
end type
type dw_3 from datawindow within w_sysusercnt_r2
end type
end forward

global type w_sysusercnt_r2 from w_inheritance
integer width = 3305
integer height = 2192
string title = "프로그램별 미사용현황(w_sysusercnt_r2)"
rb_1 rb_1
rb_2 rb_2
em_1 em_1
st_1 st_1
em_2 em_2
cbx_1 cbx_1
rb_3 rb_3
gb_4 gb_4
st_2 st_2
dw_3 dw_3
end type
global w_sysusercnt_r2 w_sysusercnt_r2

type variables
st_print i_print
end variables

on w_sysusercnt_r2.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.em_1=create em_1
this.st_1=create st_1
this.em_2=create em_2
this.cbx_1=create cbx_1
this.rb_3=create rb_3
this.gb_4=create gb_4
this.st_2=create st_2
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.gb_4
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.dw_3
end on

on w_sysusercnt_r2.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.cbx_1)
destroy(this.rb_3)
destroy(this.gb_4)
destroy(this.st_2)
destroy(this.dw_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible=false

dw_1.sharedata(dw_2)
em_1.text= string(today(),'yyyy/mm/dd')
em_2.text= string(today(),'yyyy/mm/dd')
datawindowchild  ldwc_module

dw_3.insertrow(1)
dw_3.getchild('module_name', ldwc_module)
ldwc_module.SetTransObject(SQLCA)
ldwc_module.retrieve()
ldwc_module.insertrow(1)
ldwc_module.setitem(1,'module_id',' ')
ldwc_module.setitem(1,'module_name','전체')
dw_3.setitem(1, 'module_name', ' ')

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 91
gb_2.height = this.height - 520

dw_1.width  = this.width  - 137
dw_1.height = this.height - 592


end event

type pb_save from w_inheritance`pb_save within w_sysusercnt_r2
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_sysusercnt_r2
integer x = 46
integer y = 444
integer width = 3168
integer height = 1600
string dataobject = "d_sysusercnt_t2"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_sysusercnt_r2
integer x = 1632
integer y = 24
integer width = 114
integer height = 84
string dataobject = "d_sysusercnt_r2"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_sysusercnt_r2
integer width = 1522
string text = "프로그램별 미사용현황"
end type

type st_tips from w_inheritance`st_tips within w_sysusercnt_r2
end type

type pb_compute from w_inheritance`pb_compute within w_sysusercnt_r2
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_sysusercnt_r2
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_sysusercnt_r2
integer x = 3017
integer taborder = 120
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_sysusercnt_r2
integer x = 2825
integer taborder = 130
end type

event pb_print::clicked;if dw_1.rowcount() < 1 then return 


w_repsuper w_print
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 프로그램별 사용현황 보고서를 출력합니다." 
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_sysusercnt_r2
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_sysusercnt_r2
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_sysusercnt_r2
boolean visible = false
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_sysusercnt_r2
integer x = 2633
integer taborder = 160
string text = " "
end type

event pb_retrieve::clicked;date ld_start,ld_end


CHOOSE CASE cbx_1.checked
	CASE false
	  ld_start = date(em_1.text)
     ld_end   = date(em_2.text)
	CASE true
	  ld_start = date('2001/07/01')
     ld_end   = today()
END CHOOSE
dw_1.setredraw(false)
dw_1.retrieve(ld_start,ld_end)


dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_sysusercnt_r2
integer x = 1399
integer y = 232
integer width = 1838
integer height = 152
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "구분"
end type

type gb_2 from w_inheritance`gb_2 within w_sysusercnt_r2
integer x = 23
integer y = 392
integer width = 3214
integer height = 1672
end type

type gb_1 from w_inheritance`gb_1 within w_sysusercnt_r2
integer x = 2601
integer width = 631
end type

type rb_1 from radiobutton within w_sysusercnt_r2
integer x = 2373
integer y = 288
integer width = 247
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
string text = "전체"
boolean checked = true
end type

event clicked;string ls_fil, ls_modu

ls_modu = dw_3.object.module_name[1]
if trim(ls_modu) = '' or isnull(ls_modu) then
	ls_fil = ""
else
	ls_fil = "syswindow_module_id = '" + ls_modu + "'"
end if

dw_1.setfilter(ls_fil)
dw_1.filter()

end event

type rb_2 from radiobutton within w_sysusercnt_r2
integer x = 2633
integer y = 288
integer width = 247
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
string text = "사용"
end type

event clicked;string ls_fil, ls_modu

dw_3.accepttext()
ls_modu = dw_3.object.module_name[1]
if trim(ls_modu) = '' or isnull(ls_modu) then
	ls_fil = "not isnull(cnt)"
else
	ls_fil = "syswindow_module_id = '" + ls_modu + "' and not isnull(cnt)"
end if

dw_1.setfilter(ls_fil)
dw_1.filter()

end event

type em_1 from editmask within w_sysusercnt_r2
integer x = 87
integer y = 284
integer width = 402
integer height = 80
integer taborder = 80
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
end type

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_sysusercnt_r2
integer x = 507
integer y = 288
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -12
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

type em_2 from editmask within w_sysusercnt_r2
integer x = 590
integer y = 284
integer width = 402
integer height = 80
integer taborder = 100
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
end type

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type cbx_1 from checkbox within w_sysusercnt_r2
integer x = 1042
integer y = 288
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
long backcolor = 67108864
string text = "전체"
end type

event clicked;if this.checked then
	em_1.enabled = false
	em_2.enabled = false
else
	em_1.enabled = true
	em_2.enabled = true
end if
end event

type rb_3 from radiobutton within w_sysusercnt_r2
integer x = 2898
integer y = 288
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
string text = "미사용"
end type

event clicked;string ls_fil, ls_modu

dw_3.accepttext()
ls_modu = dw_3.object.module_name[1]
if trim(ls_modu) = '' or isnull(ls_modu) then
	ls_fil = "isnull(cnt)"
else
	ls_fil = "syswindow_module_id = '" + ls_modu + "' and isnull(cnt)"
end if

dw_1.setfilter(ls_fil)
dw_1.filter()

end event

type gb_4 from groupbox within w_sysusercnt_r2
integer x = 64
integer y = 232
integer width = 1230
integer height = 152
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "기간"
end type

type st_2 from statictext within w_sysusercnt_r2
integer x = 1440
integer y = 300
integer width = 206
integer height = 68
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
string text = "모듈:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_sysusercnt_r2
integer x = 1673
integer y = 284
integer width = 663
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_sysusercnt_s"
boolean border = false
end type

event itemchanged;string ls_fil

if rb_1.checked = true and trim(data) = '' then
	ls_fil = ''
elseif rb_2.checked = true then
	ls_fil = "not isnull(cnt) and syswindow_module_id = '" + trim(data) + "'"
elseif rb_3.checked = true then
	ls_fil = "isnull(cnt) and syswindow_module_id = '" + trim(data) + "'"
else
	ls_fil = "syswindow_module_id = '" + trim(data) + "'"
end if

dw_1.setfilter(ls_fil)
dw_1.filter()

end event

