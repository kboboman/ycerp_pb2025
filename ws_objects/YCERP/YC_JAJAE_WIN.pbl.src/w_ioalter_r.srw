$PBExportHeader$w_ioalter_r.srw
$PBExportComments$물품대체현황(2002/04/23, 이인호)
forward 
global type w_ioalter_r from w_inheritance
end type
type em_1 from editmask within w_ioalter_r
end type
type em_2 from editmask within w_ioalter_r
end type
type gb_4 from groupbox within w_ioalter_r
end type
type dw_3 from datawindow within w_ioalter_r
end type
type st_1 from statictext within w_ioalter_r
end type
end forward

global type w_ioalter_r from w_inheritance
integer x = 23
integer y = 48
integer width = 3607
integer height = 1940
string title = "물품대체 현황(w_ioalter_r)"
em_1 em_1
em_2 em_2
gb_4 gb_4
dw_3 dw_3
st_1 st_1
end type
global w_ioalter_r w_ioalter_r

type variables
st_print i_print
end variables

on w_ioalter_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.gb_4=create gb_4
this.dw_3=create dw_3
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.gb_4
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.st_1
end on

on w_ioalter_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_locno
datawindowchild ldwc_loc

dw_1.visible = false

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

dw_2.sharedata(dw_1)
dw_3.settransobject(sqlca)
dw_3.insertrow(0)

dw_3.getchild('loc_no',ldwc_loc)
ldwc_loc.insertrow(1)
ldwc_loc.setitem(1, "loc_no", "%")
ldwc_loc.setitem(1, "loc_name", "전체")

SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :gs_area;
dw_3.object.loc_no[1] = ls_locno

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_ioalter_r
boolean visible = false
integer x = 3113
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_ioalter_r
integer x = 50
integer y = 180
integer width = 73
integer height = 52
integer taborder = 70
string dataobject = "d_ioalter_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ioalter_r
integer x = 37
integer y = 24
integer width = 965
string text = "물품대체 현황"
end type

type st_tips from w_inheritance`st_tips within w_ioalter_r
end type

type pb_compute from w_inheritance`pb_compute within w_ioalter_r
boolean visible = false
integer x = 2299
integer y = 532
integer taborder = 110
string picturename = "c:\bmp\pencil.bmp"
end type

type pb_print_part from w_inheritance`pb_print_part within w_ioalter_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_ioalter_r
integer x = 2574
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ioalter_r
integer x = 2373
integer y = 64
integer taborder = 130
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 물품대체 현황을 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ioalter_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_ioalter_r
boolean visible = false
integer x = 2921
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_ioalter_r
boolean visible = false
integer x = 2729
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ioalter_r
integer x = 2176
integer y = 64
integer taborder = 30
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.reset()
string ls_loc

ls_loc = dw_3.object.loc_no[1]

if dw_2.retrieve(date(em_1.text), date(em_2.text), ls_loc) < 1 then
	messagebox('확인','해당기간에는 자료가 없읍니다.',information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ioalter_r
integer x = 32
integer y = 240
integer width = 3497
integer height = 160
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ioalter_r
boolean visible = false
integer y = 508
integer width = 3447
integer height = 1408
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_ioalter_r
integer x = 2135
integer y = 16
integer width = 667
integer height = 212
integer taborder = 60
end type

type dw_2 from w_inheritance`dw_2 within w_ioalter_r
integer x = 32
integer y = 416
integer width = 3497
integer height = 1396
integer taborder = 80
string dataobject = "d_ioalter_s"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_ioalter_r
integer x = 1312
integer y = 140
integer width = 366
integer height = 72
integer taborder = 10
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
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_ioalter_r
integer x = 1687
integer y = 140
integer width = 366
integer height = 72
integer taborder = 20
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
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type gb_4 from groupbox within w_ioalter_r
integer x = 1070
integer y = 16
integer width = 1038
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_3 from datawindow within w_ioalter_r
integer x = 1102
integer y = 52
integer width = 864
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_ioalter_r
integer x = 1097
integer y = 140
integer width = 215
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

