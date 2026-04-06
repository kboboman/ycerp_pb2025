$PBExportHeader$w_mpitemq_r.srw
$PBExportComments$제품별 생산계획조회(1998/05/04, 이인호)
forward 
global type w_mpitemq_r from w_inheritance
end type
type em_1 from editmask within w_mpitemq_r
end type
type em_2 from editmask within w_mpitemq_r
end type
type dw_area from datawindow within w_mpitemq_r
end type
type st_1 from statictext within w_mpitemq_r
end type
type st_2 from statictext within w_mpitemq_r
end type
type st_3 from statictext within w_mpitemq_r
end type
type em_4 from editmask within w_mpitemq_r
end type
type em_3 from editmask within w_mpitemq_r
end type
type cb_item from commandbutton within w_mpitemq_r
end type
type st_4 from statictext within w_mpitemq_r
end type
type ddlb_fld from dropdownlistbox within w_mpitemq_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpitemq_r
end type
type st_5 from statictext within w_mpitemq_r
end type
type ddlb_op from dropdownlistbox within w_mpitemq_r
end type
type sle_value from singlelineedit within w_mpitemq_r
end type
type cb_1 from commandbutton within w_mpitemq_r
end type
type cb_2 from commandbutton within w_mpitemq_r
end type
type cb_3 from commandbutton within w_mpitemq_r
end type
type cb_5 from commandbutton within w_mpitemq_r
end type
type dw_3 from datawindow within w_mpitemq_r
end type
type cbx_hap from checkbox within w_mpitemq_r
end type
type gb_4 from groupbox within w_mpitemq_r
end type
type gb_5 from groupbox within w_mpitemq_r
end type
end forward

global type w_mpitemq_r from w_inheritance
integer width = 4064
integer height = 2248
string title = "생산계획 조회(제품별)(w_mpitemq_r)"
long backcolor = 78160032
em_1 em_1
em_2 em_2
dw_area dw_area
st_1 st_1
st_2 st_2
st_3 st_3
em_4 em_4
em_3 em_3
cb_item cb_item
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_3 dw_3
cbx_hap cbx_hap
gb_4 gb_4
gb_5 gb_5
end type
global w_mpitemq_r w_mpitemq_r

type variables
st_print i_print

end variables

on w_mpitemq_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_4=create em_4
this.em_3=create em_3
this.cb_item=create cb_item
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_3=create dw_3
this.cbx_hap=create cbx_hap
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.em_4
this.Control[iCurrent+8]=this.em_3
this.Control[iCurrent+9]=this.cb_item
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.ddlb_op
this.Control[iCurrent+15]=this.sle_value
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.cb_2
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.cb_5
this.Control[iCurrent+20]=this.dw_3
this.Control[iCurrent+21]=this.cbx_hap
this.Control[iCurrent+22]=this.gb_4
this.Control[iCurrent+23]=this.gb_5
end on

on w_mpitemq_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.cb_item)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_3)
destroy(this.cbx_hap)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

// 품명
em_3.text     = "전체"
em_4.visible  = false

dw_2.visible = false

dw_3.SetTransObject(SQLCA)

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

//
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')


end event

event resize;call super::resize;//
long  ll_width, ll_height

gb_4.width  = newwidth  - (gb_4.x * 2)

dw_3.width  = newwidth  - (gb_4.x * 2)
dw_3.height = newheight - dw_3.y - gb_4.x

end event

type pb_save from w_inheritance`pb_save within w_mpitemq_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpitemq_r
boolean visible = false
integer x = 2939
integer y = 56
integer width = 87
integer height = 92
string dataobject = "d_mpitemq_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_mpitemq_r
integer x = 32
integer y = 20
integer width = 1349
integer height = 144
string text = "생산계획 조회(제품별)"
end type

type st_tips from w_inheritance`st_tips within w_mpitemq_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpitemq_r
boolean visible = false
integer x = 3479
integer y = 276
integer width = 375
integer height = 88
integer taborder = 120
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_mpitemq_r
boolean visible = false
integer x = 2501
integer y = 48
end type

type pb_close from w_inheritance`pb_close within w_mpitemq_r
integer x = 3758
integer y = 64
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpitemq_r
boolean visible = false
integer x = 2702
integer y = 48
integer taborder = 140
end type

event pb_print::clicked;w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

if dw_3.getrow() < 1 then RETURN

dw_3.RowsCopy(1, dw_3.RowCount(), Primary!, dw_1, 1, Primary!)

i_print.st_datawindow  = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 제품별 생산계획내역을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=89'
OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpitemq_r
boolean visible = false
integer y = 48
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpitemq_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpitemq_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpitemq_r
integer x = 3561
integer y = 64
integer taborder = 170
end type

event pb_retrieve::clicked;//
string ls_area, ls_date, ls_itemno, ls_item[]
long   ll_row
date   ld_date1, ld_date2

//
dw_area.accepttext()
ls_area = dw_area.object.area[1]

ls_date = trim(em_1.text)
ld_date1 = date(ls_date)

ls_date  = trim(em_2.text)
ld_date2 = date(ls_date)

// 품목선택
cb_item.triggerevent( clicked! )

// 품명
ls_itemno = trim(em_4.text)
if isnull(ls_itemno) OR ls_itemno = "" then ls_itemno = "%"


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
dw_3.reset()
dw_3.retrieve( ls_area, ls_itemno, ld_date1, ld_date2 )
if dw_3.rowcount() < 1 then
	MessageBox("에러","조회한 자료가 없습니다",Exclamation!)
end if


end event

type gb_3 from w_inheritance`gb_3 within w_mpitemq_r
integer x = 1422
integer y = 16
integer width = 590
integer height = 216
integer taborder = 100
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpitemq_r
integer x = 2711
integer y = 16
integer width = 795
integer height = 216
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpitemq_r
integer x = 3525
integer y = 16
integer width = 457
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpitemq_r
integer x = 55
integer y = 188
integer width = 78
integer height = 64
integer taborder = 90
string title = "d_mpitemq_t"
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_mpitemq_r
integer x = 2738
integer y = 136
integer width = 366
integer height = 76
integer taborder = 70
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_mpitemq_r
integer x = 3109
integer y = 136
integer width = 366
integer height = 76
integer taborder = 80
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type dw_area from datawindow within w_mpitemq_r
integer x = 1449
integer y = 136
integer width = 526
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_1 from statictext within w_mpitemq_r
integer x = 2738
integer y = 64
integer width = 736
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mpitemq_r
integer x = 1449
integer y = 60
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpitemq_r
integer x = 2057
integer y = 56
integer width = 494
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "품명"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_4 from editmask within w_mpitemq_r
integer x = 2062
integer y = 68
integer width = 155
integer height = 52
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
maskdatatype maskdatatype = stringmask!
end type

type em_3 from editmask within w_mpitemq_r
integer x = 2057
integer y = 140
integer width = 608
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
string text = "전체"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type cb_item from commandbutton within w_mpitemq_r
integer x = 2560
integer y = 56
integer width = 105
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "..."
end type

event clicked;//
gs_where2 lst_whitemret

lst_whitemret.chk = "S"
OpenWithParm( w_whitemselectmulti_w, lst_whitemret )
lst_whitemret = Message.PowerObjectParm

if lst_whitemret.chk = "Y" then
	em_3.text = lst_whitemret.name[1]
	em_4.text = lst_whitemret.str1[1]
else
	em_3.text = "전체"
	em_4.text = "%"
end if

end event

type st_4 from statictext within w_mpitemq_r
integer x = 91
integer y = 316
integer width = 174
integer height = 56
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
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_mpitemq_r
integer x = 279
integer y = 300
integer width = 443
integer height = 632
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_dwtitles from dropdownlistbox within w_mpitemq_r
integer x = 311
integer y = 312
integer width = 311
integer height = 88
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_5 from statictext within w_mpitemq_r
integer x = 750
integer y = 316
integer width = 165
integer height = 56
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_mpitemq_r
integer x = 919
integer y = 300
integer width = 297
integer height = 512
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpitemq_r
integer x = 1239
integer y = 308
integer width = 526
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_mpitemq_r
integer x = 1783
integer y = 308
integer width = 160
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpitemq_r
integer x = 1947
integer y = 308
integer width = 160
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpitemq_r
integer x = 2112
integer y = 308
integer width = 160
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpitemq_r
integer x = 2277
integer y = 308
integer width = 160
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_mpitemq_r
integer x = 32
integer y = 428
integer width = 3954
integer height = 1684
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpitemq_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;int li_int
string ls_sale

if row < 1 then return
this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(w_mpitemq_r.parentwindow().PointerX(),  w_mpitemq_r.parentwindow().PointerY())

ls_sale = trim(this.object.sale_no[row])
CHOOSE CASE gs_print_control
	CASE 'PROC'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
	CASE 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
END CHOOSE

end event

event retrieveend;//string ls_order,ls_plan,ls_temp
//long ll_rowcount, ll_row
//
//ll_rowcount = this.rowcount()
//if ll_rowcount < 1 then 
//	return
//end if
//pointer oldpointer // Declares a pointer variable
//
//oldpointer = SetPointer(HourGlass!)
//for ll_row = 1 to this.rowcount()
//	 ls_plan = trim(this.object.mpsdet_plan_no[ll_row])
//	 ls_order = trim(this.object.mpsdet_order_no[ll_row])
//	 if isnull(ls_plan) then
//		 continue
//  	 else
//		 select open_close into :ls_temp from mps where order_no = :ls_order;
//		 choose case trim(ls_temp)
//			 case 'P'
//				  this.object.type1[ll_row] = '1'
//			 case 'A'
//				  this.object.type1[ll_row] = 'A'
//		 end choose
//	 end if
//	 
//	 choose case mid(ls_plan,1,1)
//		 case 'O','M'
//			  select type into :ls_temp from sfcday where order_no = :ls_plan;
//			  choose case sqlca.sqlcode
//				 case 0
//					   if trim(ls_temp) = 'N' then
//					      this.object.type1[ll_row] = '9' // 9: 생산계획완료 후  취소
//						else
//							this.object.type1[ll_row] = '8' // 8: 생산계획완료
//						end if
//				 case else
//			  end  choose
//			  
//			  select sudo_type into :ls_temp from sudodet1 where order_no = :ls_plan;
//			  choose case sqlca.sqlcode
//				 case 0
//					   choose case trim(ls_temp)
//							case 'C'
//					         this.object.type1[ll_row] = '4' // 4: 외주구매입고완료
//							case 'B'
//								this.object.type1[ll_row] = '3' // 4: 외주구매입고발주중
//              			   select result_type into :ls_temp from purdet where product_no = :ls_plan;
//               		   choose case sqlca.sqlcode
//                				 case 0
//					                 choose case trim(ls_temp)
//							              case 'E','P'
//					                        this.object.type1[ll_row] = '4' // 4: 입고완료
//							              case 'C'
//								               this.object.type1[ll_row] = '9' // 4: 외주가공입고발주중
//						              end choose
//               				 case else
//
//			                end  choose								
//							case 'A'
//								this.object.type1[ll_row] = '2' // 4: 외주구매입고청구중
//						end choose
//				 case else
//			  end  choose
//			  
//			  select sudo_type into :ls_temp from sudodet where order_no = :ls_plan;
//			  choose case sqlca.sqlcode
//				 case 0
//					   choose case trim(ls_temp)
//							case 'C'
//					         this.object.type1[ll_row] = '7' // 4: 외주가공입고완료
//							case 'B'
//								this.object.type1[ll_row] = '6' // 4: 외주가공입고발주중
//              			   select result_type into :ls_temp from purdet where product_no = :ls_plan;
//               		   choose case sqlca.sqlcode
//                				 case 0
//					                 choose case trim(ls_temp)
//							              case 'E','P'
//					                        this.object.type1[ll_row] = '7' // 4: 입고완료
//							              case 'C'
//								               this.object.type1[ll_row] = '9' // 4: 외주가공입고발주중
//						              end choose
//               				 case else
//
//			                end  choose    								
//							case 'A'
//								this.object.type1[ll_row] = '5' // 4: 외주가공입고청구중
//						end choose
//				 case else
//
//			  end  choose
//		 case else
//			  select type into :ls_temp from sfcday where order_no = :ls_plan;
//			  choose case sqlca.sqlcode
//				 case 0
//					   if trim(ls_temp) = 'N' then
//					      this.object.type1[ll_row] = '9' // 9: 생산계획완료 후  취소
//						else
//							this.object.type1[ll_row] = '8' // 8: 생산계획완료
//						end if
//				 case else
//
//			  end  choose
//	 end choose
//next
//SetPointer(oldpointer)
//
end event

event clicked;//
//is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type cbx_hap from checkbox within w_mpitemq_r
integer x = 2473
integer y = 320
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;//
DataWindow arg_dw

if dw_3.visible = true then
	arg_dw = dw_3
else
	MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
	RETURN
end if

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
else
	arg_dw.Modify("DataWindow.Detail.Height=80")		
	arg_dw.Modify("DataWindow.Trailer.3.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

type gb_4 from groupbox within w_mpitemq_r
integer x = 32
integer y = 244
integer width = 3954
integer height = 164
integer taborder = 31
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_5 from groupbox within w_mpitemq_r
integer x = 2030
integer y = 16
integer width = 663
integer height = 216
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

