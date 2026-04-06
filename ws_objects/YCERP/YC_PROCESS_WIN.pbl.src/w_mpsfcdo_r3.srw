$PBExportHeader$w_mpsfcdo_r3.srw
$PBExportComments$생산미출고 현황
forward 
global type w_mpsfcdo_r3 from w_inheritance
end type
type em_1 from editmask within w_mpsfcdo_r3
end type
type em_2 from editmask within w_mpsfcdo_r3
end type
type dw_area from datawindow within w_mpsfcdo_r3
end type
type pb_1 from pb_print within w_mpsfcdo_r3
end type
type pb_2 from picturebutton within w_mpsfcdo_r3
end type
type st_3 from statictext within w_mpsfcdo_r3
end type
type ddlb_fld from dropdownlistbox within w_mpsfcdo_r3
end type
type st_4 from statictext within w_mpsfcdo_r3
end type
type ddlb_op from dropdownlistbox within w_mpsfcdo_r3
end type
type sle_value from singlelineedit within w_mpsfcdo_r3
end type
type cb_1 from commandbutton within w_mpsfcdo_r3
end type
type cb_2 from commandbutton within w_mpsfcdo_r3
end type
type cb_3 from commandbutton within w_mpsfcdo_r3
end type
type cb_5 from commandbutton within w_mpsfcdo_r3
end type
type gb_4 from groupbox within w_mpsfcdo_r3
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsfcdo_r3
end type
type st_2 from statictext within w_mpsfcdo_r3
end type
type st_1 from statictext within w_mpsfcdo_r3
end type
type st_vertical from u_splitbar_vertical within w_mpsfcdo_r3
end type
type cbx_1 from checkbox within w_mpsfcdo_r3
end type
type st_5 from statictext within w_mpsfcdo_r3
end type
type cbx_add from checkbox within w_mpsfcdo_r3
end type
end forward

global type w_mpsfcdo_r3 from w_inheritance
integer width = 4608
integer height = 2480
string title = "생산미출고 현황(w_mpsfcdo_r)"
em_1 em_1
em_2 em_2
dw_area dw_area
pb_1 pb_1
pb_2 pb_2
st_3 st_3
ddlb_fld ddlb_fld
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_4 gb_4
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
st_1 st_1
st_vertical st_vertical
cbx_1 cbx_1
st_5 st_5
cbx_add cbx_add
end type
global w_mpsfcdo_r3 w_mpsfcdo_r3

type variables
st_print i_print
datawindowchild idwc_area, idwc_user

end variables

on w_mpsfcdo_r3.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_4=create gb_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.st_1=create st_1
this.st_vertical=create st_vertical
this.cbx_1=create cbx_1
this.st_5=create st_5
this.cbx_add=create cbx_add
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.pb_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.gb_4
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_vertical
this.Control[iCurrent+20]=this.cbx_1
this.Control[iCurrent+21]=this.st_5
this.Control[iCurrent+22]=this.cbx_add
end on

on w_mpsfcdo_r3.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_4)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_vertical)
destroy(this.cbx_1)
destroy(this.st_5)
destroy(this.cbx_add)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

datetime ldt_sdate, ldt_edate

SELECT top 1 DateAdd(month, -1, getdate()), dbo.UF_GetLastDate( DateAdd(Month, 1, getdate()) ) 
  INTO :ldt_sdate, :ldt_edate 
  FROM login;

em_1.text = string(ldt_sdate, "yyyy/mm/dd")
em_2.text = string(ldt_edate, "yyyy/mm/dd")

// 사업장
dw_area.object.area.Background.Color   = 67108864
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')
dw_area.object.area[1] = ' '  // gs_area
dw_area.enabled = false

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

dw_1.height = newheight - dw_1.y - gb_4.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height


dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_4.x
dw_2.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_mpsfcdo_r3
integer x = 3680
integer y = 72
integer taborder = 30
end type

event pb_save::clicked;call super::clicked;//
WF_Update1( dw_1, "Y" )

pb_retrieve.triggerevent( clicked! )
end event

type dw_1 from w_inheritance`dw_1 within w_mpsfcdo_r3
integer x = 32
integer y = 424
integer width = 1563
integer height = 1912
string dataobject = "d_plan_project"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

this.scrolltorow( row )

end event

event dw_1::rbuttondown;call super::rbuttondown;//
choose case dwo.name
	case "plan_date"
		Message.StringParm = string(date(dw_1.object.plan_date[row]))
		OpenWithParm(w_calendar, Message.StringParm)
		if Message.StringParm <> "N" then
			dw_1.object.plan_date[row] = DateTime(date(Message.StringParm), time("00:00:00.000") )
		end if
end choose

end event

event dw_1::editchanged;call super::editchanged;//
this.accepttext()

choose case dwo.name
	case "cust_no"
		if data = "." then
			this.object.cust_no[row] = this.object.cust_no[row - 1]
		elseif data = ".." then
			this.object.cust_no[row] = this.object.cust_no[row + 1]
		end if
		
	case "item_no"
		if data = "." then
			this.object.item_no[row] = this.object.item_no[row - 1]
		elseif data = ".." then
			this.object.item_no[row] = this.object.item_no[row + 1]
		end if
end choose

end event

type st_title from w_inheritance`st_title within w_mpsfcdo_r3
integer x = 32
integer y = 28
integer width = 1088
integer height = 144
string text = "생산확정현황"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcdo_r3
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcdo_r3
boolean visible = false
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcdo_r3
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcdo_r3
integer x = 4256
integer y = 72
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcdo_r3
integer x = 4064
integer y = 72
end type

event pb_print::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//w_repsuper w_print
//gs_print_str lstr_print
//datawindow dw_print
//string ls_sql, ls_where, ls_source
//
//if dw_3.getrow() <= 0 then RETURN
//
//if rb_3.checked = true then
//	if rb_1.checked = true then
//		dw_2.dataobject = 'd_mpsfcwc_r1'
//	else
//		dw_2.dataobject = 'd_mpsfcwc_r2'
//	end if
//	dw_2.SetTransObject(SQLCA)
//	
//	dw_3.sharedata(dw_2)
//	dw_print = dw_2
//	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//else
//	dw_print = dw_4
//	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//end if
//
//i_print.st_datawindow = dw_print
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 작업장별 생산현황을 출력합니다." 
//
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcdo_r3
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcdo_r3
integer x = 3488
integer y = 72
integer taborder = 170
end type

event pb_delete::clicked;call super::clicked;//
dw_1.DeleteRow( dw_1.getrow() )
WF_Update1( dw_1, "Y" )

end event

type pb_insert from w_inheritance`pb_insert within w_mpsfcdo_r3
integer x = 3296
integer y = 72
integer taborder = 180
end type

event pb_insert::clicked;call super::clicked;//
string ls_custno, ls_itemno
long   ll_row, ll_cnt, ll_dw1cnt
date   ld_date, ld_cdate

if cbx_add.checked = true then
	ls_custno  = dw_1.object.cust_no[ dw_1.getrow() ]
	ls_itemno  = dw_1.object.item_no[ dw_1.getrow() ]

	ll_dw1cnt  = DaysAfter(date(em_1.text), date(em_2.text))
	ld_date    = RelativeDate( date(em_1.text), - 1 )
	for ll_cnt = 1 to ll_dw1cnt + 1		
		ll_row  = dw_1.insertrow( dw_1.getrow() )
		
		dw_1.object.cust_no[ll_row]   = ls_custno
		dw_1.object.item_no[ll_row]   = ls_itemno		

		ld_cdate = RelativeDate( ld_date, ll_cnt )
		dw_1.object.plan_date[ll_row] = ld_cdate
		
		if IsNumber(sle_value.text) then
			dw_1.object.plan_qty[ll_row] = long(sle_value.text)
		end if
	next
else
	ll_row  = dw_1.insertrow( dw_1.getrow() )
	
	dw_1.scrolltorow( ll_row )
	dw_1.setcolumn( "cust_no" )
	dw_1.setfocus()
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcdo_r3
integer x = 3104
integer y = 72
integer taborder = 70
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string   ls_sdate, ls_edate, ls_salesman, ls_area, ls_openclose
datetime ldt_sdate, ldt_edate

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

ls_sdate = em_1.text
ls_edate = em_2.text

// 사업장
dw_area.accepttext()
ls_area     = dw_area.object.area[1]

ldt_sdate  = DateTime(date(ls_sdate), time("00:00:00.000") )
ldt_edate  = DateTime(date(ls_edate), time("00:00:00.000") )

//
dw_1.retrieve( ldt_sdate, ldt_edate )
dw_2.retrieve( ldt_sdate, ldt_edate )
if dw_1.rowcount() < 1 then
	MessageBox("확인","해당월에 조회한 자료가 없습니다",Exclamation!)
else
	MessageBox("확인","조회완료")
end if

//

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcdo_r3
integer x = 1614
integer y = 16
integer width = 581
integer height = 232
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcdo_r3
integer x = 2208
integer y = 16
integer width = 800
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcdo_r3
integer x = 3072
integer y = 16
integer width = 1458
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcdo_r3
integer x = 1637
integer y = 424
integer width = 2889
integer height = 1912
string dataobject = "d_plan_project1"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_mpsfcdo_r3
integer x = 2240
integer y = 152
integer width = 361
integer height = 72
integer taborder = 60
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
boolean autoskip = true
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
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm),"yyyy/mm/dd")
//end if
//
end event

type em_2 from editmask within w_mpsfcdo_r3
integer x = 2610
integer y = 152
integer width = 361
integer height = 72
integer taborder = 90
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
boolean autoskip = true
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
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm),"yyyy/mm/dd")
//end if
//
end event

type dw_area from datawindow within w_mpsfcdo_r3
integer x = 1641
integer y = 148
integer width = 526
integer height = 80
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type pb_1 from pb_print within w_mpsfcdo_r3
boolean visible = false
integer x = 2386
integer y = 40
integer taborder = 50
boolean bringtotop = true
string picturename = "CrossTab!"
end type

type pb_2 from picturebutton within w_mpsfcdo_r3
integer x = 3872
integer y = 72
integer width = 187
integer height = 144
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

dwxls = dw_1
if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			//	dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
end if
MessageBox("확인","엑셀파일 작업완료.")

end event

type st_3 from statictext within w_mpsfcdo_r3
integer x = 105
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_mpsfcdo_r3
integer x = 293
integer y = 308
integer width = 448
integer height = 632
integer taborder = 10
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

type st_4 from statictext within w_mpsfcdo_r3
integer x = 791
integer y = 324
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

type ddlb_op from dropdownlistbox within w_mpsfcdo_r3
integer x = 960
integer y = 308
integer width = 297
integer height = 512
integer taborder = 20
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

type sle_value from singlelineedit within w_mpsfcdo_r3
integer x = 1280
integer y = 316
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "d_plan_project1"
end type

type cb_1 from commandbutton within w_mpsfcdo_r3
integer x = 1851
integer y = 316
integer width = 160
integer height = 76
integer taborder = 80
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpsfcdo_r3
integer x = 2016
integer y = 316
integer width = 160
integer height = 76
integer taborder = 90
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

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsfcdo_r3
integer x = 2181
integer y = 316
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsfcdo_r3
integer x = 2345
integer y = 316
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_mpsfcdo_r3
integer x = 32
integer y = 260
integer width = 4498
integer height = 152
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type ddlb_dwtitles from dropdownlistbox within w_mpsfcdo_r3
integer x = 334
integer y = 320
integer width = 311
integer height = 88
integer taborder = 100
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

type st_2 from statictext within w_mpsfcdo_r3
integer x = 1641
integer y = 68
integer width = 521
integer height = 80
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

type st_1 from statictext within w_mpsfcdo_r3
integer x = 2240
integer y = 68
integer width = 731
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "확정일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_mpsfcdo_r3
integer x = 1605
integer y = 424
integer height = 1912
boolean bringtotop = true
end type

type cbx_1 from checkbox within w_mpsfcdo_r3
integer x = 2528
integer y = 324
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
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx

if this.checked = true then
	ls_colx  = string(long(dw_2.object.item_no.x) + long(dw_2.object.item_no.width))
	dw_2.object.datawindow.horizontalscrollsplit = ls_colx
else
	ls_colx  = "0"
	dw_2.object.datawindow.horizontalscrollsplit = ls_colx
end if

end event

type st_5 from statictext within w_mpsfcdo_r3
integer x = 2830
integer y = 328
integer width = 1079
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
string text = "[.] 윗행 복사, [..]아래행 복사"
boolean focusrectangle = false
end type

type cbx_add from checkbox within w_mpsfcdo_r3
integer x = 2240
integer y = 16
integer width = 201
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "추가"
end type

event clicked;//
datetime ldt_sdate, ldt_edate

if this.checked = true then
	sle_value.text = ""
	em_1.text = string(today(), "yyyy/mm/dd")
	em_2.text = string(today(), "yyyy/mm/dd")
else
	SELECT top 1 DateAdd(month, -1, getdate()), dbo.UF_GetLastDate( DateAdd(Month, 1, getdate()) ) 
	  INTO :ldt_sdate, :ldt_edate 
	  FROM login;
	
	em_1.text = string(ldt_sdate, "yyyy/mm/dd")
	em_2.text = string(ldt_edate, "yyyy/mm/dd")
end if

end event

