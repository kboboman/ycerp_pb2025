$PBExportHeader$w_ocshipreq_r.srw
$PBExportComments$운반비 내역서조회(2002/08/28,이인호)
forward
global type w_ocshipreq_r from w_inheritance
end type
type em_1 from editmask within w_ocshipreq_r
end type
type em_2 from editmask within w_ocshipreq_r
end type
type rb_3 from radiobutton within w_ocshipreq_r
end type
type rb_2 from radiobutton within w_ocshipreq_r
end type
type rb_1 from radiobutton within w_ocshipreq_r
end type
type dw_area from datawindow within w_ocshipreq_r
end type
type st_2 from statictext within w_ocshipreq_r
end type
type st_3 from statictext within w_ocshipreq_r
end type
type pb_1 from picturebutton within w_ocshipreq_r
end type
type st_1 from statictext within w_ocshipreq_r
end type
end forward

global type w_ocshipreq_r from w_inheritance
integer y = 160
integer width = 4165
integer height = 2224
string title = "운반비 발생내역조회(w_ocshipreq_r)"
em_1 em_1
em_2 em_2
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
dw_area dw_area
st_2 st_2
st_3 st_3
pb_1 pb_1
st_1 st_1
end type
global w_ocshipreq_r w_ocshipreq_r

type variables
st_print i_print
datawindowchild idwc_area
gs_itembaldo_str  ist_code
string is_ship_no, is_oc = 'O'
end variables

on w_ocshipreq_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_area=create dw_area
this.st_2=create st_2
this.st_3=create st_3
this.pb_1=create pb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.st_1
end on

on w_ocshipreq_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.st_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_area.setredraw(false)
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild('area',idwc_area)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체')
idwc_area.accepttext()
dw_area.accepttext()  
dw_area.object.area[1] = gs_area
dw_area.setredraw(true)

dw_1.sharedata(dw_2)
dw_2.visible = false

em_1.text = string(today(), "yyyy/mm/01")
em_2.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 105
dw_1.height = newheight - 364

end event

type pb_save from w_inheritance`pb_save within w_ocshipreq_r
event ue_print pbm_custom01
boolean visible = false
integer x = 3086
integer y = 48
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_ocshipreq_r
integer x = 46
integer y = 312
integer width = 4023
integer height = 1756
integer taborder = 30
string dataobject = "d_ocshipreq_s2"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;gs_where2 lst_str 
string ls_text, ls_chk, ls_sale
int    li_find, li_int, li_end

if row < 1 then return
this.scrolltorow(row)

ls_text = trim(this.object.sale_no[row])
if ls_text = '' or isnull(ls_text) then return

ls_chk  = 'Y'
li_find = 1
li_int  = 0
do while ls_chk = 'Y'
	li_end = PosA(ls_text, ",", li_find)
	if li_end = 0 or isnull(li_end) then exit
	ls_sale = MidA(ls_text, li_find, 14)
	if trim(ls_sale) = '' or isnull(ls_sale) then exit
	
	li_int = li_int + 1
	lst_str.str1[li_int] = ls_sale
	li_find = li_end + 2
loop

OpenWithParm(w_whsaleall_w, lst_str)

end event

event dw_1::rbuttondown;call super::rbuttondown;string ls_chk, ls_text, ls_sale
int    li_end, li_find, li_int
m_dynamic lm_Addmenu

if row < 1 then return
this.scrolltorow(row)

lm_Addmenu = CREATE m_dynamic
ls_text    = trim(this.object.sale_no[row])
if ls_text = '' or isnull(ls_text) then return

ls_chk  = 'Y'
li_find = 1
li_int  = 0
do while ls_chk = 'Y'
	li_end = PosA(ls_text, ",", li_find)
	if li_end = 0 or isnull(li_end) then exit
	ls_sale = MidA(ls_text, li_find, 14)
	if trim(ls_sale) = '' or isnull(ls_sale) then exit

	li_int = li_int + 1
	lm_Addmenu.item[li_int].Text    = ls_sale
	lm_Addmenu.item[li_int].Tag     = string(li_int)
	lm_Addmenu.item[li_int].visible = true
	
	li_find = li_end + 2
loop

lm_Addmenu.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
if lm_Addmenu.tag = "" then return

ls_sale = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
opensheet(w_orsale_m,  w_o_main, 5, original!)

w_orsale_m.setredraw(false)
w_orsale_m.em_3.text = LeftA(ls_sale,10) 
w_orsale_m.em_4.text = string(integer(RightA(ls_sale,3)))
w_orsale_m.pb_cancel.postevent(clicked!)
w_orsale_m.setredraw(true)

end event

type dw_2 from w_inheritance`dw_2 within w_ocshipreq_r
integer x = 1120
integer y = 24
integer width = 101
integer height = 80
string dataobject = "d_ocshipreq_r2"
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_ocshipreq_r
integer x = 55
integer y = 56
integer width = 1234
string text = "운반비 발생내역조회"
end type

type st_tips from w_inheritance`st_tips within w_ocshipreq_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipreq_r
boolean visible = false
integer x = 3314
integer y = 1036
integer taborder = 90
string picturename = "c:\bmp\delete.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_ocshipreq_r
boolean visible = false
integer x = 3314
integer y = 884
integer taborder = 60
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"출력",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_ocshipreq_r
integer x = 3849
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipreq_r
integer x = 3657
integer y = 56
integer taborder = 110
end type

event pb_print::clicked;//
w_repsuper w_print
st_print l_print
 
if dw_1.getrow() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_2
l_print.st_print_desc  = " 이 프로그램은 운반비 변경요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipreq_r
boolean visible = false
integer x = 2894
integer y = 48
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ocshipreq_r
boolean visible = false
integer x = 2894
integer y = 48
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_ocshipreq_r
boolean visible = false
integer x = 2702
integer y = 48
string text = " "
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipreq_r
integer x = 3273
integer y = 56
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_sdate, ls_edate, ls_apply

ls_sdate = em_1.text
ls_edate = em_2.text
ls_area  = dw_area.object.area[1]

if rb_3.checked = true then
	ls_apply = '%'		// 전체
elseif rb_2.checked = true then
	ls_apply = 'O'		// 미결
else
	ls_apply = 'Y'		// 기결
end if

dw_1.retrieve( ls_sdate, ls_edate, ls_apply, ls_area )

end event

type gb_3 from w_inheritance`gb_3 within w_ocshipreq_r
integer x = 2683
integer y = 16
integer width = 535
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipreq_r
integer x = 1335
integer y = 16
integer width = 1335
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipreq_r
integer x = 3232
integer y = 16
integer width = 841
integer taborder = 80
integer weight = 400
end type

type em_1 from editmask within w_ocshipreq_r
integer x = 1897
integer y = 128
integer width = 366
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;dw_1.reset()

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_ocshipreq_r
integer x = 2281
integer y = 128
integer width = 366
integer height = 80
integer taborder = 20
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

event modified;dw_1.reset()

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_3 from radiobutton within w_ocshipreq_r
integer x = 2711
integer y = 72
integer width = 215
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
end type

event clicked;//
pb_retrieve.triggerevent( clicked! )

end event

type rb_2 from radiobutton within w_ocshipreq_r
integer x = 2949
integer y = 140
integer width = 219
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
string text = "기결"
end type

event clicked;//
pb_retrieve.triggerevent( clicked! )

end event

type rb_1 from radiobutton within w_ocshipreq_r
integer x = 2949
integer y = 72
integer width = 219
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
string text = "미결"
boolean checked = true
end type

event clicked;//
pb_retrieve.triggerevent( clicked! )

end event

type dw_area from datawindow within w_ocshipreq_r
integer x = 1362
integer y = 128
integer width = 521
integer height = 80
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
dw_1.reset()

end event

type st_2 from statictext within w_ocshipreq_r
integer x = 1362
integer y = 52
integer width = 521
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ocshipreq_r
integer x = 50
integer y = 248
integer width = 1184
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "*더블클릭=수주조회, *오른쪽마우스=수주관리"
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type pb_1 from picturebutton within w_ocshipreq_r
event mousemove pbm_mousemove
integer x = 3465
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_1 from statictext within w_ocshipreq_r
integer x = 1897
integer y = 52
integer width = 750
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "발생일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

