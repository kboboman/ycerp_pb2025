$PBExportHeader$w_orsaleysp_r.srw
$PBExportComments$YSP 수주현황(1998/05/13, 정재수)
forward
global type w_orsaleysp_r from w_inheritance
end type
type dw_4 from datawindow within w_orsaleysp_r
end type
type st_3 from statictext within w_orsaleysp_r
end type
type dw_3 from datawindow within w_orsaleysp_r
end type
type em_3 from editmask within w_orsaleysp_r
end type
type st_1 from statictext within w_orsaleysp_r
end type
type em_2 from editmask within w_orsaleysp_r
end type
type em_1 from editmask within w_orsaleysp_r
end type
type rb_1 from radiobutton within w_orsaleysp_r
end type
type rb_2 from radiobutton within w_orsaleysp_r
end type
end forward

global type w_orsaleysp_r from w_inheritance
integer width = 3621
integer height = 2660
string title = "YSP 수주현황(w_orsaleysp_r)"
boolean resizable = false
dw_4 dw_4
st_3 st_3
dw_3 dw_3
em_3 em_3
st_1 st_1
em_2 em_2
em_1 em_1
rb_1 rb_1
rb_2 rb_2
end type
global w_orsaleysp_r w_orsaleysp_r

type variables
st_print i_print
string is_dw1sql
end variables

on w_orsaleysp_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.st_3=create st_3
this.dw_3=create dw_3
this.em_3=create em_3
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.em_3
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.em_2
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.rb_1
this.Control[iCurrent+9]=this.rb_2
end on

on w_orsaleysp_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.st_3)
destroy(this.dw_3)
destroy(this.em_3)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_1)
destroy(this.rb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1
dw_1.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)


em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
em_3.text = "BD" + string(today(), "yyyy")
is_dw1sql = dw_1.describe("datawindow.table.select")

end event

type pb_save from w_inheritance`pb_save within w_orsaleysp_r
event ue_print pbm_custom01
boolean visible = false
integer x = 3163
integer y = 40
integer taborder = 110
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleysp_r
integer x = 933
integer y = 0
integer width = 128
integer height = 108
integer taborder = 80
string dataobject = "d_orsale_print2"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::itemchanged;pb_retrieve.postevent(clicked!)
end event

type dw_2 from w_inheritance`dw_2 within w_orsaleysp_r
integer x = 942
integer y = 220
integer width = 2661
integer height = 908
integer taborder = 40
string dataobject = "d_orsaleysp_s1"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_orsaleysp_r
integer y = 32
integer width = 1047
string text = "YSP 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_orsaleysp_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleysp_r
boolean visible = false
integer x = 1659
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaleysp_r
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 100
string text = "수주상황접수부 시화출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;////w_repsuper w_print
////
////i_print.st_datawindow = dw_3
////i_print.st_print_sheet = " 프린트용지 : A4"
////i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
////
////gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
////opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
////
////
////
//if dw_4.getrow() < 1 then
//	MessageBox("출력", "수주조회후에 출력하십시요!")
//	return
//end if
//
//if MessageBox("수주상황접수부 출력", "수주상황접수부를 시화프린터로 직접 출력합니다 ~r~n" &
//											+ "출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
//	return
//end if
//
//dw_5.settransobject(sqlca)
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
//
//dw_5.Modify('DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//	                   'Datawindow.Zoom=100' )
//dw_5.retrieve(dw_4.object.order_no[dw_4.getrow()])
//wf_multiprint()
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x - 70
li_y = this.y + 156

f_usetips(st_tips,"수주상황접수부 시화출력  ",parent, li_x, li_y)


end event

type pb_close from w_inheritance`pb_close within w_orsaleysp_r
integer x = 3355
integer y = 40
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleysp_r
integer x = 3127
integer y = 40
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
string ls_where, ls_sql
 
if dw_4.getrow() < 1 then return
string ls_order
long ll_row

ll_row = dw_4.getrow()
ls_order = dw_4.object.order_no[ll_row]
//dw_2.retrieve(ls_order)
//dw_3.retrieve(ls_order)

string ls_scenehp
if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if

//ls_where = " and sale.order_no between ~~'" + ls_order + "~~'" &
//			+ " and ~~'" + ls_order + "~~'"  
//ls_sql = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"
//	
//dw_1.modify(ls_sql)
//dw_1.retrieve( ls_scenehp )

dw_1.retrieve( ls_scenehp, ls_order,  ls_order, '%')

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleysp_r
integer x = 1710
integer y = 40
integer width = 174
integer height = 136
integer taborder = 20
fontcharset fontcharset = ansi!
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_cancel::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_cancel::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_orderno
long ll_row
 
ls_orderno = TRIM(em_3.TEXT)

if isnull(ls_orderno) or ls_orderno = '' then return
select count(*) into :ll_row from sale
 where order_no = :ls_orderno;
if ll_row < 1 then 
	beep(2)
	em_3.setfocus()
	return
end if
dw_2.retrieve(ls_orderno)
dw_3.retrieve(ls_orderno)

end event

type pb_delete from w_inheritance`pb_delete within w_orsaleysp_r
boolean visible = false
integer x = 2971
integer y = 40
integer taborder = 160
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleysp_r
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 180
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleysp_r
integer x = 2857
integer y = 48
integer width = 174
integer height = 136
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_cust_no, ls_con
date  ld_start_date, ld_end_date

dw_4.setredraw(false)
dw_2.reset()
dw_3.reset()
dw_4.reset()
ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
if rb_1.checked = true then
	ls_con = 'Y'
else
	ls_con = 'N'
end if
dw_4.retrieve(ld_start_date,ld_end_date, ls_con)
dw_4.setfocus()
dw_4.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_orsaleysp_r
integer x = 1179
integer y = 4
integer width = 722
integer height = 188
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleysp_r
integer x = 1961
integer y = 0
integer width = 1111
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleysp_r
integer x = 3086
integer y = 0
integer width = 485
integer taborder = 120
integer weight = 400
end type

type dw_4 from datawindow within w_orsaleysp_r
integer x = 14
integer y = 220
integer width = 910
integer height = 908
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_orsaleysp_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() < 1 then return
string ls_order
long ll_row

ll_row = this.getrow()
ls_order = this.object.order_no[ll_row]
dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)


end event

type st_3 from statictext within w_orsaleysp_r
integer x = 1202
integer width = 233
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "수주번호"
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_orsaleysp_r
event keydown pbm_dwnkey
integer x = 14
integer y = 1144
integer width = 3589
integer height = 1404
integer taborder = 50
string dataobject = "d_orsaleysp_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_3 from editmask within w_orsaleysp_r
event keydown pbm_dwnkey
integer x = 1211
integer y = 80
integer width = 480
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
boolean autoskip = true
end type

event keydown;IF keydown(KeyEnter! ) THEN
	IF keyflags = 0 THEN
		pb_cancel.postevent(clicked!)
	END IF

END IF



end event

type st_1 from statictext within w_orsaleysp_r
integer x = 2382
integer y = 116
integer width = 55
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_2 from editmask within w_orsaleysp_r
integer x = 2432
integer y = 104
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
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_1 from editmask within w_orsaleysp_r
integer x = 2016
integer y = 104
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
long textcolor = 33554432
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

type rb_1 from radiobutton within w_orsaleysp_r
integer x = 2011
integer y = 32
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
string text = "확정"
boolean checked = true
end type

type rb_2 from radiobutton within w_orsaleysp_r
integer x = 2286
integer y = 32
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
string text = "미확정"
end type

