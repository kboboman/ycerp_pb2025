$PBExportHeader$w_mpwcq_r.srw
$PBExportComments$작업장별 생산계획조회(1998/05/05, 이인호)
forward
global type w_mpwcq_r from w_inheritance
end type
type dw_3 from datawindow within w_mpwcq_r
end type
type em_1 from editmask within w_mpwcq_r
end type
type em_2 from editmask within w_mpwcq_r
end type
type st_2 from statictext within w_mpwcq_r
end type
type st_1 from statictext within w_mpwcq_r
end type
type st_3 from statictext within w_mpwcq_r
end type
type dw_area from datawindow within w_mpwcq_r
end type
type pb_1 from picturebutton within w_mpwcq_r
end type
type gb_15 from groupbox within w_mpwcq_r
end type
end forward

global type w_mpwcq_r from w_inheritance
integer x = 5
integer y = 72
integer width = 3995
integer height = 2880
string title = "작업장별 생산계획 조회(w_mpwcq_r)"
dw_3 dw_3
em_1 em_1
em_2 em_2
st_2 st_2
st_1 st_1
st_3 st_3
dw_area dw_area
pb_1 pb_1
gb_15 gb_15
end type
global w_mpwcq_r w_mpwcq_r

type variables
st_print i_print
string is_wc
datawindowchild idwc_wc
end variables

on w_mpwcq_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.st_1=create st_1
this.st_3=create st_3
this.dw_area=create dw_area
this.pb_1=create pb_1
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.dw_area
this.Control[iCurrent+8]=this.pb_1
this.Control[iCurrent+9]=this.gb_15
end on

on w_mpwcq_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.visible = false
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
dw_3.SetTransObject(SQLCA)

dw_2.insertrow(0)
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()

em_1.setfocus()
dw_3.sharedata(dw_1)

// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천
end event

event resize;call super::resize;dw_3.width  = this.width  - 128
dw_3.height = this.height - 572
end event

type pb_save from w_inheritance`pb_save within w_mpwcq_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpwcq_r
integer x = 2907
integer y = 80
integer width = 119
integer height = 84
string dataobject = "d_mpplansale_r"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::rowfocuschanged;//long ll_row
//
//ll_row = this.getrow()
//if ll_row < 1 then
//	return
//end if
//
//is_wcno = dw_1.object.wc_no[ll_row]
//dw_2.retrieve(is_wcno)
//tab_1.tabpage_1.dw_3.retrieve(is_wcno,id_start,id_end)
//
end event

type dw_2 from w_inheritance`dw_2 within w_mpwcq_r
integer x = 914
integer width = 626
integer height = 80
string dataobject = "d_whwc_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;this.accepttext()
is_wc = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if is_wc = '전체' then is_wc = ''
	

end event

type st_title from w_inheritance`st_title within w_mpwcq_r
integer x = 50
integer width = 1481
string text = "작업장별 생산계획 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpwcq_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpwcq_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpwcq_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpwcq_r
integer x = 3698
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpwcq_r
integer x = 3506
integer y = 56
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where
w_repsuper w_print
st_print   l_print

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 작업장별 생산계획 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
	
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpwcq_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpwcq_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpwcq_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpwcq_r
integer x = 3113
integer y = 56
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date,  ls_wc, ls_flag
date   ld_date1, ld_date2
long   ll_row

ls_date = trim(em_1.text)
if isdate(ls_date) = false then
	em_1.setfocus()
	return
end if

ld_date1 = date(ls_date)
ls_date  = trim(em_2.text)
if isdate(ls_date) = false then
	em_2.setfocus()
	return
end if

ld_date2 = date(ls_date)
ls_wc   = trim(is_wc) + "%"  //작업장명
ls_flag = "Y"

ll_row = dw_1.retrieve(ls_wc, ld_date1, ld_date2, ls_flag, dw_area.object.area[1])
ll_row = dw_3.retrieve(ls_wc, ld_date1, ld_date2, ls_flag, dw_area.object.area[1])
if ll_row < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.", Exclamation!)
end if
end event

type gb_3 from w_inheritance`gb_3 within w_mpwcq_r
boolean visible = false
integer x = 64
integer y = 216
integer width = 1019
integer height = 188
integer taborder = 70
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpwcq_r
integer x = 640
integer y = 232
integer width = 2048
integer height = 172
integer taborder = 80
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpwcq_r
integer x = 3081
integer y = 16
integer width = 832
end type

type dw_3 from datawindow within w_mpwcq_r
integer x = 41
integer y = 420
integer width = 3867
integer height = 2308
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_mpwcq_t1"
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
li_int = m_manager.m_plan.PopMenu(parent.parentwindow().PointerX(),  parent.parentwindow().PointerY())

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

type em_1 from editmask within w_mpwcq_r
integer x = 1851
integer y = 292
integer width = 366
integer height = 76
integer taborder = 100
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

type em_2 from editmask within w_mpwcq_r
integer x = 2267
integer y = 292
integer width = 366
integer height = 76
integer taborder = 110
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

type st_2 from statictext within w_mpwcq_r
integer x = 2217
integer y = 304
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type st_1 from statictext within w_mpwcq_r
integer x = 690
integer y = 304
integer width = 224
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
boolean enabled = false
string text = "작업장:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpwcq_r
integer x = 1554
integer y = 304
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
boolean enabled = false
string text = "조회일자:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpwcq_r
integer x = 82
integer y = 296
integer width = 503
integer height = 84
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type pb_1 from picturebutton within w_mpwcq_r
event mousemove pbm_mousemove
integer x = 3310
integer y = 56
integer width = 187
integer height = 144
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_3.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	                        ls_Docname, ls_Named, "XLS",  &
	                        "엑셀 (*.XLS), *.XLS," + &
                           "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_3.SaveAsascii(ls_DocName)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		dw_3.SaveAs(ls_DocName, CSV!, TRUE)
	end if
end if

end event

type gb_15 from groupbox within w_mpwcq_r
integer x = 46
integer y = 232
integer width = 567
integer height = 172
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

