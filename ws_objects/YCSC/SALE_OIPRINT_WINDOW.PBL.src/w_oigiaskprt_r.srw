$PBExportHeader$w_oigiaskprt_r.srw
$PBExportComments$일자별 물품요청현황(2002/05/23,이인호)
forward
global type w_oigiaskprt_r from w_inheritance
end type
type em_1 from editmask within w_oigiaskprt_r
end type
type em_2 from editmask within w_oigiaskprt_r
end type
type gb_7 from groupbox within w_oigiaskprt_r
end type
type gb_4 from groupbox within w_oigiaskprt_r
end type
type st_1 from statictext within w_oigiaskprt_r
end type
type dw_6 from datawindow within w_oigiaskprt_r
end type
end forward

global type w_oigiaskprt_r from w_inheritance
integer y = 112
integer width = 4562
integer height = 2668
string title = "일별물품 요청현황(w_oigiaskprt_r)"
em_1 em_1
em_2 em_2
gb_7 gb_7
gb_4 gb_4
st_1 st_1
dw_6 dw_6
end type
global w_oigiaskprt_r w_oigiaskprt_r

type variables
date id_start, id_end
datawindowchild idwc_area

end variables

on w_oigiaskprt_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.gb_7=create gb_7
this.gb_4=create gb_4
this.st_1=create st_1
this.dw_6=create dw_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.gb_7
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.dw_6
end on

on w_oigiaskprt_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.gb_7)
destroy(this.gb_4)
destroy(this.st_1)
destroy(this.dw_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(RelativeDate(today(), - 7), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
id_start  = date(em_1.text)
id_end    = date(em_2.text)

em_1.setfocus()
dw_2.visible = false
dw_1.sharedata(dw_2)

dw_6.settransobject(sqlca)
dw_6.insertrow(0)  
dw_6.object.area[1] = gs_area

dw_6.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')

end event

event resize;call super::resize;dw_1.width  = this.width - 120
dw_1.height = this.height - 410

end event

type pb_save from w_inheritance`pb_save within w_oigiaskprt_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_oigiaskprt_r
integer x = 23
integer y = 256
integer width = 4466
integer height = 2284
integer taborder = 0
string dataobject = "d_oigiaskprt_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return
this.SelectRow(0,  false)
this.SelectRow(row, true)
end event

type dw_2 from w_inheritance`dw_2 within w_oigiaskprt_r
integer x = 2130
integer y = 92
integer width = 119
integer height = 92
integer taborder = 0
string dataobject = "d_oigiaskprt_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oigiaskprt_r
integer width = 1408
string text = "일별물품 요청현황"
end type

type st_tips from w_inheritance`st_tips within w_oigiaskprt_r
end type

type pb_compute from w_inheritance`pb_compute within w_oigiaskprt_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_oigiaskprt_r
boolean visible = false
integer x = 2935
integer y = 116
integer taborder = 70
end type

event pb_print_part::clicked;//gs_custdo_str lst_code
//string ls_sql, ls_where
//date ld_start, ld_end
//
//openwithparm(w_whcustdo_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//dw_3.visible = true
//dw_1.visible = false
//ld_start = date(lst_code.start_date)
//ld_end = date(lst_code.end_date)
//
//if lst_code.sel_flag = 'A' then
//   ls_where = " and do.do_date between ~~'" + &
//	           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
//else
//   ls_where = " and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
//	           string(ld_end) + "~~' and do.cust_no between ~~'" + &				
//	           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//end if
////dw_3.settransobject(sqlca)
//ls_sql = "datawindow.table.select = '" + is_custdor1sql + ls_where + "'"
////dw_1.settransobject(sqlca)
//dw_3.modify(ls_sql)
//dw_3.retrieve()
//if dw_3.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
//   return
//end if
//
//
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"거래명세표순 인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_oigiaskprt_r
integer x = 4274
integer y = 56
integer taborder = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oigiaskprt_r
integer x = 4082
integer y = 56
integer taborder = 50
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 일자별 물품이동현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=99'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oigiaskprt_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_oigiaskprt_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_oigiaskprt_r
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oigiaskprt_r
integer x = 3890
integer y = 56
integer taborder = 30
end type

event pb_retrieve::clicked;string ls_area

ls_area = trim(dw_6.object.area[1]) + "%"
dw_1.retrieve(ls_area, id_start, id_end)

if dw_1.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type gb_3 from w_inheritance`gb_3 within w_oigiaskprt_r
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oigiaskprt_r
boolean visible = false
integer x = 23
integer y = 240
integer width = 3557
integer height = 1828
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oigiaskprt_r
integer x = 3858
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
integer textsize = -9
end type

type em_1 from editmask within w_oigiaskprt_r
integer x = 2971
integer y = 104
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
id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_start = date(this.text)
end if

end event

type em_2 from editmask within w_oigiaskprt_r
integer x = 3438
integer y = 104
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
id_end = date(this.text)
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	id_end = date(this.text)
end if

end event

type gb_7 from groupbox within w_oigiaskprt_r
integer x = 2313
integer y = 8
integer width = 590
integer height = 216
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고사업장"
end type

type gb_4 from groupbox within w_oigiaskprt_r
integer x = 2930
integer y = 8
integer width = 905
integer height = 216
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "요청일자"
end type

type st_1 from statictext within w_oigiaskprt_r
integer x = 3351
integer y = 104
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_oigiaskprt_r
integer x = 2350
integer y = 104
integer width = 517
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

