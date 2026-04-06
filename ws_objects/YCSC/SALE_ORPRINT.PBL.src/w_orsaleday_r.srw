$PBExportHeader$w_orsaleday_r.srw
$PBExportComments$수주일보 (1998/05/12, 정재수)
forward
global type w_orsaleday_r from w_inheritance
end type
type em_1 from editmask within w_orsaleday_r
end type
type em_2 from editmask within w_orsaleday_r
end type
type st_2 from statictext within w_orsaleday_r
end type
type dw_6 from datawindow within w_orsaleday_r
end type
type dw_3 from datawindow within w_orsaleday_r
end type
type pb_2 from picturebutton within w_orsaleday_r
end type
type st_1 from statictext within w_orsaleday_r
end type
type rb_1 from radiobutton within w_orsaleday_r
end type
type rb_2 from radiobutton within w_orsaleday_r
end type
type st_4 from statictext within w_orsaleday_r
end type
type ddlb_fld from dropdownlistbox within w_orsaleday_r
end type
type ddlb_dwtitles from dropdownlistbox within w_orsaleday_r
end type
type st_5 from statictext within w_orsaleday_r
end type
type ddlb_op from dropdownlistbox within w_orsaleday_r
end type
type sle_value from singlelineedit within w_orsaleday_r
end type
type cb_3 from commandbutton within w_orsaleday_r
end type
type cb_4 from commandbutton within w_orsaleday_r
end type
type cb_5 from commandbutton within w_orsaleday_r
end type
type cb_6 from commandbutton within w_orsaleday_r
end type
type dw_4 from datawindow within w_orsaleday_r
end type
type cbx_sum from checkbox within w_orsaleday_r
end type
type cbx_view from checkbox within w_orsaleday_r
end type
type cbx_fix from checkbox within w_orsaleday_r
end type
type cbx_1 from checkbox within w_orsaleday_r
end type
type st_3 from statictext within w_orsaleday_r
end type
type cbx_hap from checkbox within w_orsaleday_r
end type
type gb_4 from groupbox within w_orsaleday_r
end type
end forward

global type w_orsaleday_r from w_inheritance
integer y = 112
integer width = 4352
integer height = 2224
string title = "수주일보(w_orsaleday_r)"
em_1 em_1
em_2 em_2
st_2 st_2
dw_6 dw_6
dw_3 dw_3
pb_2 pb_2
st_1 st_1
rb_1 rb_1
rb_2 rb_2
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
dw_4 dw_4
cbx_sum cbx_sum
cbx_view cbx_view
cbx_fix cbx_fix
cbx_1 cbx_1
st_3 st_3
cbx_hap cbx_hap
gb_4 gb_4
end type
global w_orsaleday_r w_orsaleday_r

type variables
string is_sale_flag, is_sflag, is_sel, is_cust, is_ret
Integer ii_sort
datawindowchild idwc_area
end variables

on w_orsaleday_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_6=create dw_6
this.dw_3=create dw_3
this.pb_2=create pb_2
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.dw_4=create dw_4
this.cbx_sum=create cbx_sum
this.cbx_view=create cbx_view
this.cbx_fix=create cbx_fix
this.cbx_1=create cbx_1
this.st_3=create st_3
this.cbx_hap=create cbx_hap
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.dw_6
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.pb_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.rb_1
this.Control[iCurrent+9]=this.rb_2
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.ddlb_op
this.Control[iCurrent+15]=this.sle_value
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_4
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.cb_6
this.Control[iCurrent+20]=this.dw_4
this.Control[iCurrent+21]=this.cbx_sum
this.Control[iCurrent+22]=this.cbx_view
this.Control[iCurrent+23]=this.cbx_fix
this.Control[iCurrent+24]=this.cbx_1
this.Control[iCurrent+25]=this.st_3
this.Control[iCurrent+26]=this.cbx_hap
this.Control[iCurrent+27]=this.gb_4
end on

on w_orsaleday_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_6)
destroy(this.dw_3)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.dw_4)
destroy(this.cbx_sum)
destroy(this.cbx_view)
destroy(this.cbx_fix)
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.cbx_hap)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_chk

SELECT isnull(sale_price,'N') INTO :ls_chk FROM login WHERE user_id = :gs_userid; 
if ls_chk = 'Y' Then
	is_ret = '%'
else
	is_ret = gs_userid
end if

dw_4.visible = false
dw_4.SetTransObject(SQLCA)

cbx_sum.checked = true
cbx_sum.triggerevent( clicked! )

dw_3.SetTransObject(SQLCA)
dw_3.insertrow(0)
dw_1.sharedata(dw_2)

dw_6.settransobject(sqlca)
dw_6.insertrow(0)  

dw_6.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')
dw_6.object.area[1] = gs_area

dw_2.visible = false

is_sale_flag = 'A'
is_sflag     = "%"
is_sel       = 'A'

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )


end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

dw_1.width  = newwidth  - (gb_4.x * 2)
dw_1.height = newheight - dw_1.y - gb_4.x

dw_4.x      = dw_1.x
dw_4.y      = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_orsaleday_r
boolean visible = false
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleday_r
integer x = 32
integer y = 452
integer width = 4242
integer height = 1636
integer taborder = 0
string dataobject = "d_orsaledayrep_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;if dwo.name = 'cust_no' or dwo.name = 'cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.cust_no[row]
	lstr_where.name = this.object.cust_name[row]
	openwithparm(w_whopeom_w, lstr_where)
end if
end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_orsaleday_r
integer x = 41
integer y = 180
integer width = 91
integer height = 72
integer taborder = 0
boolean enabled = false
string dataobject = "d_orsaledayrep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_orsaleday_r
integer x = 32
integer y = 24
integer width = 777
string text = "수주일보"
end type

type st_tips from w_inheritance`st_tips within w_orsaleday_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleday_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaleday_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_orsaleday_r
integer x = 3593
integer y = 80
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleday_r
integer x = 3205
integer y = 80
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
string     ls_text
long       ll_row

if cbx_sum.checked = true then
	MessageBox("확인","수주집계 조회시에는 출력작업을 지원하지 않습니다.")	
	RETURN
end if

if dw_2.rowcount() < 1 then return

if is_sel = 'A' then
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',전체)'
elseif is_sel = 'Y' then
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',확정)'
else
	ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',미확정)'
end if

for ll_row = 1 to dw_2.rowcount()
	dw_2.object.c_text[ll_row] = ls_text
next

//l_print.name = 'd_orsaledayrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 수주일보를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleday_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleday_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleday_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleday_r
integer x = 3013
integer y = 80
integer taborder = 50
end type

event pb_retrieve::clicked;//
string ls_sale_flag[], ls_confirm_flag[]
string ls_area, ls_class
date   ld_sdate, ld_edate

if em_1.text = '' then
	messagebox("확인","주문기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","주문기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","주문기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
elseif is_sale_flag = '' or isnull(is_sale_flag) then
	messagebox("확인","수주유형을 입력하세요!",information!)
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

ls_sale_flag[1] = 'D'
ls_sale_flag[2] = 'L'
ls_sale_flag[3] = 'E'

ls_confirm_flag[1] = 'N'
ls_confirm_flag[2] = 'T'
ls_confirm_flag[3] = 'Y'

if rb_1.checked = true then
	is_cust = "%"
else
	is_cust = dw_3.object.cust_no[1]
end if

ls_area = trim(LeftA(dw_6.object.area[1],1)) + "%"
if rb_2.checked = true then	// 집중
	ls_class = 'P'
else
	ls_class = 'A'
end if

string ls_salesman
choose case gs_level
	case 'A', 'B'			
		ls_salesman = '%'
	case 'C'
		ls_salesman = gs_userid
end choose

// 수주일 집계
string ls_colx, ls_sdate, ls_edate, ls_yymm

ls_area  = trim(dw_6.object.area[1])
if ls_area = "" then ls_area = "%"

ls_sdate = em_1.text
ls_edate = em_2.text
ls_yymm = "N"
	
dw_1.reset()
if cbx_sum.checked = true then
	dw_4.visible = true
	cbx_fix.visible = true
   if cbx_view.checked = true then ls_yymm = "Y"
	
   if dw_4.rowcount() > 0 then
		if MessageBox("확인","수주 데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			dw_4.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm )
		end if
	else
		dw_4.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm )
	end if

	cbx_fix.triggerevent( clicked! )
else
	dw_4.visible = false
	cbx_fix.visible = false
   cbx_view.visible = false

	dw_1.retrieve(ls_sale_flag[], ld_sdate, ld_edate, ls_confirm_flag[], ls_area, is_sflag, is_cust, is_ret, ls_class,ls_salesman)
	dw_1.setfocus()
end if 

end event

type gb_3 from w_inheritance`gb_3 within w_orsaleday_r
integer x = 882
integer y = 16
integer width = 2080
integer height = 244
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleday_r
boolean visible = false
integer x = 23
integer y = 224
integer width = 3557
integer height = 1828
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleday_r
integer x = 2985
integer y = 16
integer width = 818
integer height = 244
integer taborder = 0
integer weight = 400
end type

type em_1 from editmask within w_orsaleday_r
integer x = 2094
integer y = 68
integer width = 370
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_orsaleday_r
integer x = 2094
integer y = 156
integer width = 370
integer height = 80
integer taborder = 30
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

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_orsaleday_r
integer x = 910
integer y = 68
integer width = 315
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_orsaleday_r
integer x = 1230
integer y = 68
integer width = 526
integer height = 84
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type dw_3 from datawindow within w_orsaleday_r
integer x = 1225
integer y = 152
integer width = 869
integer height = 84
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
rb_1.checked = false
end event

event editchanged;rb_1.checked = false
end event

event itemchanged;rb_1.checked = false
end event

type pb_2 from picturebutton within w_orsaleday_r
event mousemove pbm_mousemove
integer x = 3397
integer y = 80
integer width = 187
integer height = 144
integer taborder = 120
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

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

if cbx_sum.checked = true then
	ldw_sel = dw_4
else
	ldw_sel = dw_1
end if

if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			ldw_sel.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_1 from statictext within w_orsaleday_r
integer x = 910
integer y = 156
integer width = 315
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_orsaleday_r
integer x = 2482
integer y = 80
integer width = 457
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체거래처"
boolean checked = true
end type

type rb_2 from radiobutton within w_orsaleday_r
integer x = 2482
integer y = 168
integer width = 457
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "신용(D,E,F)"
end type

type st_4 from statictext within w_orsaleday_r
integer x = 82
integer y = 352
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

type ddlb_fld from dropdownlistbox within w_orsaleday_r
integer x = 270
integer y = 336
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_orsaleday_r
integer x = 325
integer y = 352
integer width = 311
integer height = 88
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

type st_5 from statictext within w_orsaleday_r
integer x = 786
integer y = 352
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

type ddlb_op from dropdownlistbox within w_orsaleday_r
integer x = 955
integer y = 336
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_orsaleday_r
integer x = 1275
integer y = 340
integer width = 567
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_orsaleday_r
integer x = 1856
integer y = 340
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_orsaleday_r
integer x = 2021
integer y = 340
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_orsaleday_r
integer x = 2185
integer y = 340
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_orsaleday_r
integer x = 2350
integer y = 340
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_4 from datawindow within w_orsaleday_r
integer x = 791
integer y = 768
integer width = 2953
integer height = 1116
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsaledet_ct1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
//is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type cbx_sum from checkbox within w_orsaleday_r
integer x = 2551
integer y = 316
integer width = 384
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "수주집계"
boolean checked = true
end type

event clicked;// 납기일 집계
if this.checked = true then
	dw_4.visible = true
	cbx_fix.visible = true
   cbx_view.visible = true
else
	dw_4.visible = false
	cbx_fix.visible = false
   cbx_view.visible = false
end if

cbx_fix.triggerevent( clicked! )

end event

type cbx_view from checkbox within w_orsaleday_r
integer x = 2971
integer y = 316
integer width = 320
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "년월별"
boolean checked = true
end type

event clicked;////
//debugbreak()
//if this.checked = true then
//	dw_4.Modify("DataWindow.Detail.Height=0")			// Detail
//	dw_4.Modify("DataWindow.Trailer.1.Height=80")	// 대분류계
//else
//	dw_4.Modify("DataWindow.Detail.Height=80")		// Detail
//	dw_4.Modify("DataWindow.Trailer.1.Height=80")	// 대분류계
//end if
//
//
//
end event

type cbx_fix from checkbox within w_orsaleday_r
integer x = 3355
integer y = 316
integer width = 311
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "고정틀"
end type

event clicked;//
string ls_colx

if this.checked = true then
	ls_colx = string(integer(dw_4.object.item_name.x) + integer(dw_4.object.item_name.width))
else
	ls_colx = "0"
end if
dw_4.object.datawindow.horizontalscrollsplit = ls_colx

end event

type cbx_1 from checkbox within w_orsaleday_r
integer x = 2551
integer y = 380
integer width = 384
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "마감포함"
end type

type st_3 from statictext within w_orsaleday_r
integer x = 1769
integer y = 68
integer width = 315
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "수주일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_hap from checkbox within w_orsaleday_r
integer x = 2971
integer y = 380
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

event clicked;// 합계만 보기
DataWindow arg_dw

//
dw_4.setredraw( false )
if this.checked = true then
	dw_4.Modify("DataWindow.Detail.Height=0")		
	dw_4.Modify("DataWindow.Trailer.2.Height=80")	
	dw_4.Modify("DataWindow.Trailer.1.Height=80")	
else
	dw_4.Modify("DataWindow.Detail.Height=80")		
	dw_4.Modify("DataWindow.Trailer.2.Height=80")	
	dw_4.Modify("DataWindow.Trailer.1.Height=80")	
end if
dw_4.setredraw( true )

end event

type gb_4 from groupbox within w_orsaleday_r
integer x = 32
integer y = 268
integer width = 4242
integer height = 184
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

