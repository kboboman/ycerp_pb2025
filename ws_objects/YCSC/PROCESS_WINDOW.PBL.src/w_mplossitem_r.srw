$PBExportHeader$w_mplossitem_r.srw
$PBExportComments$로스보고서(2001/07/24,이인호)
forward
global type w_mplossitem_r from w_inheritance
end type
type em_1 from editmask within w_mplossitem_r
end type
type em_2 from editmask within w_mplossitem_r
end type
type st_1 from statictext within w_mplossitem_r
end type
end forward

global type w_mplossitem_r from w_inheritance
integer width = 4805
integer height = 2772
string title = "LOSS 현황(w_mplossitem_r)"
em_1 em_1
em_2 em_2
st_1 st_1
end type
global w_mplossitem_r w_mplossitem_r

type variables
st_print i_print
end variables

on w_mplossitem_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
end on

on w_mplossitem_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text=string(today(),'yyyy/mm/dd')
em_2.text=string(today(),'yyyy/mm/dd')
dw_1.settransobject(sqlca)

dw_1.sharedata(dw_2)
dw_2.visible = false
end event

event resize;call super::resize;//
gb_2.width  = this.width  - 138
gb_2.height = this.height - 392

dw_1.width  = this.width  - 234
dw_1.height = this.height - 496


end event

type pb_save from w_inheritance`pb_save within w_mplossitem_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mplossitem_r
integer x = 96
integer y = 308
integer width = 4571
integer height = 2276
integer taborder = 50
string dataobject = "d_mplossitem_s"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_mplossitem_r
integer x = 978
integer y = 24
integer width = 142
integer height = 104
integer taborder = 60
string dataobject = "d_mplossitem_r"
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_mplossitem_r
integer x = 50
integer width = 1047
string text = "LOSS 현황"
end type

type st_tips from w_inheritance`st_tips within w_mplossitem_r
end type

type pb_compute from w_inheritance`pb_compute within w_mplossitem_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_mplossitem_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mplossitem_r
integer x = 4507
integer y = 60
integer taborder = 110
end type

event pb_close::clicked;CLOSE(PARENT)
end event

type pb_print from w_inheritance`pb_print within w_mplossitem_r
integer x = 4315
integer y = 60
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() < 1 then return 

w_repsuper w_print
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 로스보고서를 출력합니다." 
//i_print.name = 'd_irincoun_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mplossitem_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mplossitem_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mplossitem_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mplossitem_r
integer x = 4123
integer y = 60
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_row,ll_stot,ll_atot
date ld_start,ld_end

dw_1.setredraw(false)

ld_start = date(em_1.text)
ld_end = date(em_2.text)
dw_1.retrieve(ld_start,ld_end)

dw_2.GroupCalc()
dw_1.setredraw(true)
end event

type gb_3 from w_inheritance`gb_3 within w_mplossitem_r
integer x = 2999
integer y = 16
integer width = 1070
integer height = 208
integer taborder = 80
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mplossitem_r
integer x = 50
integer y = 244
integer width = 4667
integer height = 2380
integer taborder = 90
integer textsize = -10
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mplossitem_r
integer x = 4091
integer y = 16
integer width = 631
integer height = 208
integer textsize = -10
integer weight = 400
end type

type em_1 from editmask within w_mplossitem_r
integer x = 3045
integer y = 92
integer width = 448
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -11
integer weight = 700
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

type em_2 from editmask within w_mplossitem_r
integer x = 3579
integer y = 92
integer width = 448
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
integer weight = 700
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

type st_1 from statictext within w_mplossitem_r
integer x = 3502
integer y = 108
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = right!
boolean focusrectangle = false
end type

