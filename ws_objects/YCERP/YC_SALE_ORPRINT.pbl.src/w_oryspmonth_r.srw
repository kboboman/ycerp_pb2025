$PBExportHeader$w_oryspmonth_r.srw
$PBExportComments$YSP 월별 수주 물량집계(2003/09/05,정갑용)
forward 
global type w_oryspmonth_r from w_inheritance
end type
type em_1 from editmask within w_oryspmonth_r
end type
type em_2 from editmask within w_oryspmonth_r
end type
type rb_2 from radiobutton within w_oryspmonth_r
end type
type rb_3 from radiobutton within w_oryspmonth_r
end type
type rb_4 from radiobutton within w_oryspmonth_r
end type
type rb_1 from radiobutton within w_oryspmonth_r
end type
type st_1 from statictext within w_oryspmonth_r
end type
type gb_4 from groupbox within w_oryspmonth_r
end type
end forward

global type w_oryspmonth_r from w_inheritance
integer y = 112
integer width = 4279
integer height = 2076
string title = "YSP 월별 물량 집계현황(w_oryspmonth_r)"
em_1 em_1
em_2 em_2
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_1 rb_1
st_1 st_1
gb_4 gb_4
end type
global w_oryspmonth_r w_oryspmonth_r

type variables
st_print i_print

end variables

on w_oryspmonth_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_1=create rb_1
this.st_1=create st_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.gb_4
end on

on w_oryspmonth_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_1)
destroy(this.st_1)
destroy(this.gb_4)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1

dw_2.visible = false
em_1.text = string(today(), "YYYY/MM")
em_2.text = string(today(), "YYYY/MM")

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x



end event

type pb_save from w_inheritance`pb_save within w_oryspmonth_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oryspmonth_r
integer x = 32
integer y = 444
integer width = 4174
integer height = 1504
integer taborder = 0
string dataobject = "d_oryspmonth_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oryspmonth_r
integer x = 32
integer y = 28
integer width = 1490
integer height = 132
string text = "YSP 월별 물량 집계현황"
end type

type st_tips from w_inheritance`st_tips within w_oryspmonth_r
end type

type pb_compute from w_inheritance`pb_compute within w_oryspmonth_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oryspmonth_r
boolean visible = false
integer x = 3177
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_oryspmonth_r
integer x = 3872
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oryspmonth_r
integer x = 3680
integer taborder = 20
end type

event pb_print::clicked;w_repsuper w_print

if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 YSP 월별 물량 집계현황을 출력합니다." 

//OpenWithParm(w_printsetup, i_print) // cross tab은 sharedata가 안됨으로 직접프린트함.easthero
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=95'

opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oryspmonth_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_oryspmonth_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_oryspmonth_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oryspmonth_r
integer x = 3488
integer taborder = 10
boolean default = true
end type

event pb_retrieve::clicked;date ld_start, ld_end
string ls_area, ls_title

dw_1.SetTransObject(SQLCA)
dw_1.sharedata(dw_2)
dw_1.setredraw(false)
dw_1.reset()

if rb_1.checked = true then 
	dw_1.setfilter("")
	dw_1.filter()
	ls_title = "YSP 월별 수주 물량 집계 현황(전체)"	
elseif rb_2.checked = true then 
	dw_1.setfilter("c_flag = '1'")
	dw_1.filter()
	ls_title = "YSP 월별 수주 물량 집계 현황(미출고)"	
elseif rb_3.checked = true then 
	dw_1.setfilter("c_flag = '2'")
	dw_1.filter()
	ls_title = "YSP 월별 수주 물량 집계 현황(부분출고)"	
elseif rb_4.checked = true then
	dw_1.setfilter("c_flag = '3'")
	dw_1.filter()
	ls_title = "YSP 월별 수주 물량 집계 현황(출고완료)"	
end if

ld_start = date(em_1.text + "/01")
ld_end = RelativeDate(date(string(RelativeDate( date(em_2.text + "/01"), 31), "yyyy/mm") + "/01"), -1)

ls_area = "B0001"
dw_1.retrieve(ls_area, ld_start, ld_end, ls_title)

//dw_1.groupcalc()
dw_1.setredraw(true)
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 수주내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


end event

type gb_3 from w_inheritance`gb_3 within w_oryspmonth_r
integer x = 32
integer y = 244
integer width = 4174
integer height = 188
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oryspmonth_r
integer x = 2656
integer y = 8
integer width = 782
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oryspmonth_r
integer x = 3461
integer y = 8
integer width = 631
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_oryspmonth_r
integer x = 50
integer y = 180
integer width = 87
integer height = 72
integer taborder = 0
boolean enabled = false
string dataobject = "d_oryspmonth_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::retrieveend;//if this.rowcount() < 1 then return
//
//string ls_start, ls_end
//long ll_row
//
//ls_start = em_1.text
//ls_end = em_2.text
//
//for ll_row = 1 to this.rowcount()
//	this.object.start_date[ll_row] = ls_start
//	this.object.end_date[ll_row] = ls_end
//next
//
end event

type em_1 from editmask within w_oryspmonth_r
integer x = 2693
integer y = 124
integer width = 347
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type em_2 from editmask within w_oryspmonth_r
integer x = 3049
integer y = 124
integer width = 347
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type rb_2 from radiobutton within w_oryspmonth_r
integer x = 2213
integer y = 64
integer width = 302
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

event clicked;pb_retrieve.triggerevent(clicked!)
end event

type rb_3 from radiobutton within w_oryspmonth_r
integer x = 1819
integer y = 148
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "부분출고"
end type

event clicked;pb_retrieve.triggerevent(clicked!)
end event

type rb_4 from radiobutton within w_oryspmonth_r
integer x = 2213
integer y = 148
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
string text = "출고완료"
end type

event clicked;pb_retrieve.triggerevent(clicked!)
end event

type rb_1 from radiobutton within w_oryspmonth_r
integer x = 1815
integer y = 64
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

event clicked;pb_retrieve.triggerevent(clicked!)
end event

type st_1 from statictext within w_oryspmonth_r
integer x = 2693
integer y = 48
integer width = 704
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "수주년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_oryspmonth_r
integer x = 1778
integer y = 8
integer width = 855
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

