$PBExportHeader$w_ippurday_r.srw
$PBExportComments$원자재구매일보(1998/04/29,이인호)
forward
global type w_ippurday_r from w_inheritance
end type
type dw_3 from datawindow within w_ippurday_r
end type
type em_1 from editmask within w_ippurday_r
end type
type em_2 from editmask within w_ippurday_r
end type
type st_2 from statictext within w_ippurday_r
end type
end forward

global type w_ippurday_r from w_inheritance
integer width = 3529
string title = "원자재구매일보(w_ippurday_r)"
boolean resizable = false
long backcolor = 78160032
dw_3 dw_3
em_1 em_1
em_2 em_2
st_2 st_2
end type
global w_ippurday_r w_ippurday_r

type variables
st_print i_print

end variables

on w_ippurday_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
end on

on w_ippurday_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

end event

type pb_save from w_inheritance`pb_save within w_ippurday_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ippurday_r
integer x = 46
integer y = 276
integer width = 402
integer taborder = 60
string dataobject = "d_ippurday_s"
boolean hscrollbar = false
boolean border = false
end type

event dw_1::rowfocuschanged;long ll_row
date ld_date

ll_row = dw_1.getrow()
if ll_row < 1 then
	return
end if
ld_date = date(dw_1.object.inaudit_date[ll_row])

dw_2.retrieve(ld_date, LeftA(gs_area,1))
end event

event dw_1::clicked;if row < 1 then return

this.scrolltorow(row)
end event

type dw_2 from w_inheritance`dw_2 within w_ippurday_r
integer x = 494
integer y = 280
integer width = 2962
integer height = 1736
integer taborder = 70
string dataobject = "d_ippurday_t"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ippurday_r
string text = "원자재 구매일보"
end type

type st_tips from w_inheritance`st_tips within w_ippurday_r
end type

type pb_compute from w_inheritance`pb_compute within w_ippurday_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ippurday_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ippurday_r
integer x = 3273
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurday_r
integer x = 3086
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_2.getrow() <= 0 THEN
   RETURN
END IF
dw_2.RowsCopy(1,  dw_2.RowCount(), Primary!, dw_3, 1, Primary!)

i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 원자재 구매일보를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_ippurday_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ippurday_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ippurday_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ippurday_r
integer x = 2898
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
date ld_start, ld_end

ld_start = date(em_1.text)
ld_end = date(em_2.text)
dw_1.retrieve(ld_start, ld_end)
end event

type gb_3 from w_inheritance`gb_3 within w_ippurday_r
integer x = 1673
integer y = 44
integer width = 887
integer height = 148
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_ippurday_r
integer x = 27
integer width = 430
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_ippurday_r
integer x = 2875
integer width = 622
integer taborder = 50
end type

type dw_3 from datawindow within w_ippurday_r
boolean visible = false
integer x = 1655
integer y = 60
integer width = 151
integer height = 132
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_ippurday_r"
boolean livescroll = true
end type

type em_1 from editmask within w_ippurday_r
integer x = 1696
integer y = 96
integer width = 366
integer height = 76
integer taborder = 40
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

type em_2 from editmask within w_ippurday_r
integer x = 2162
integer y = 96
integer width = 366
integer height = 76
integer taborder = 41
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_ippurday_r
integer x = 2089
integer y = 96
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

