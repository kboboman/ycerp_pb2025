$PBExportHeader$w_osaroibe_r.srw
$PBExportComments$선매출현황(1998/05/15, 정재수)
forward
global type w_osaroibe_r from w_inheritance
end type
type em_1 from editmask within w_osaroibe_r
end type
type em_2 from editmask within w_osaroibe_r
end type
type st_3 from statictext within w_osaroibe_r
end type
end forward

global type w_osaroibe_r from w_inheritance
integer y = 112
integer width = 3643
integer height = 2172
string title = "선매출현황(w_osaroibe_r)"
em_1 em_1
em_2 em_2
st_3 st_3
end type
global w_osaroibe_r w_osaroibe_r

type variables
string is_sale_flag
end variables

on w_osaroibe_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_3
end on

on w_osaroibe_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
is_sale_flag = 'A'

dw_2.visible = false
dw_1.sharedata(dw_2)
end event

event resize;call super::resize;dw_1.width  = this.width - 120
dw_1.height = this.height - 390


end event

type pb_save from w_inheritance`pb_save within w_osaroibe_r
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osaroibe_r
integer x = 37
integer y = 264
integer width = 3520
integer height = 1780
integer taborder = 0
string dataobject = "d_osaroiberep_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_osaroibe_r
integer x = 1504
integer y = 40
integer width = 78
integer height = 92
integer taborder = 0
string dataobject = "d_osaroiberep_r1"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_osaroibe_r
integer y = 40
string text = "선매출현황"
end type

type st_tips from w_inheritance`st_tips within w_osaroibe_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroibe_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroibe_r
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osaroibe_r
integer x = 3365
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroibe_r
integer x = 3173
integer taborder = 40
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
	return
end if


//l_print.name = 'd_osaroiberep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 수주일보를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroibe_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_osaroibe_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_osaroibe_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroibe_r
integer x = 2981
integer taborder = 30
end type

event pb_retrieve::clicked;date ld_start, ld_end
 
if em_1.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","매출기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(em_1.text)
ld_end = date(em_2.text)

dw_1.retrieve(ld_start, ld_end)


	
end event

type gb_3 from w_inheritance`gb_3 within w_osaroibe_r
integer x = 2107
integer y = 48
integer width = 827
integer height = 176
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
string text = "매출기간"
end type

type gb_2 from w_inheritance`gb_2 within w_osaroibe_r
integer x = 23
integer y = 224
integer width = 3557
integer height = 1828
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_osaroibe_r
integer x = 2953
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
end type

type em_1 from editmask within w_osaroibe_r
integer x = 2144
integer y = 116
integer width = 357
integer height = 80
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

type em_2 from editmask within w_osaroibe_r
integer x = 2546
integer y = 116
integer width = 357
integer height = 80
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

type st_3 from statictext within w_osaroibe_r
integer x = 2501
integer y = 120
integer width = 41
integer height = 72
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

