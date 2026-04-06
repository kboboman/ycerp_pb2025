$PBExportHeader$w_cdreceivable_m.srw
$PBExportComments$고액채권 관리
forward
global type w_cdreceivable_m from w_inheritance
end type
type pb_excel from picturebutton within w_cdreceivable_m
end type
type st_8 from statictext within w_cdreceivable_m
end type
type ddlb_fld from dropdownlistbox within w_cdreceivable_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdreceivable_m
end type
type st_9 from statictext within w_cdreceivable_m
end type
type sle_value from singlelineedit within w_cdreceivable_m
end type
type cb_filteron from commandbutton within w_cdreceivable_m
end type
type cb_filteroff from commandbutton within w_cdreceivable_m
end type
type cb_1 from commandbutton within w_cdreceivable_m
end type
type cb_2 from commandbutton within w_cdreceivable_m
end type
type st_vertical from u_splitbar_vertical within w_cdreceivable_m
end type
type em_1 from editmask within w_cdreceivable_m
end type
type st_1 from statictext within w_cdreceivable_m
end type
type dw_3 from datawindow within w_cdreceivable_m
end type
type dw_sales from datawindow within w_cdreceivable_m
end type
type st_2 from statictext within w_cdreceivable_m
end type
type cb_3 from commandbutton within w_cdreceivable_m
end type
type ddlb_op from dropdownlistbox within w_cdreceivable_m
end type
type gb_4 from groupbox within w_cdreceivable_m
end type
end forward

global type w_cdreceivable_m from w_inheritance
integer width = 4215
integer height = 2336
string title = "고액채권 관리(w_cdreceivable_m)"
pb_excel pb_excel
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
st_vertical st_vertical
em_1 em_1
st_1 st_1
dw_3 dw_3
dw_sales dw_sales
st_2 st_2
cb_3 cb_3
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_cdreceivable_m w_cdreceivable_m

type variables
//
st_print i_print
string   is_dw

datawindowchild idwc_cust, idwc_cust_name, idwc_codemst, idwc_user

end variables

forward prototypes
public function string wf_nextcode (string as_str)
end prototypes

public function string wf_nextcode (string as_str);string ls_str
CHOOSE CASE as_str
	CASE 'A'
		ls_str = 'B'
	CASE 'B'
		ls_str = 'C'
	CASE 'C'
		ls_str = 'D'
	CASE 'D'
		ls_str = 'E'
	CASE 'E'
		ls_str = 'F'
	CASE 'F'
		ls_str = 'G'
	CASE 'G'
		ls_str = 'H'
	CASE 'H'
		ls_str = 'I'
	CASE 'I'
		ls_str = 'J'
	CASE 'J'
		ls_str = 'K'
	CASE 'K'
		ls_str = 'L'
	CASE 'L'
		ls_str = 'M'
	CASE 'M'
		ls_str = 'N'
	CASE 'N'
		ls_str = 'O'
	CASE 'O'
		ls_str = 'P'
	CASE 'P'
		ls_str = 'Q'
	CASE 'Q'
		ls_str = 'R'
	CASE 'R'
		ls_str = 'S'
	CASE 'S'
		ls_str = 'T'
	CASE 'T'
		ls_str = 'U'
	CASE 'U'
		ls_str = 'V'
	CASE 'V'
		ls_str = 'W'
	CASE 'W'
		ls_str = 'X'
	CASE 'X'
		ls_str = 'Y'
	CASE 'Y'
		ls_str = 'Z'
END CHOOSE

return ls_str
end function

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.visible = false
dw_3.settransobject( SQLCA )

em_1.text   = string(today(),"yyyy/mm/dd")

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.GetChild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
idwc_user.retrieve( "%" )

if GF_Permission("고액채권_거래처관리", gs_userid) = "Y" then
	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"
else
	idwc_user.setfilter( "user_id = '" + gs_userid + "'" )
	idwc_user.filter()
	dw_sales.object.user[1] = gs_userid
end if
dw_sales.setfocus()


end event

on w_cdreceivable_m.create
int iCurrent
call super::create
this.pb_excel=create pb_excel
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_vertical=create st_vertical
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_sales=create dw_sales
this.st_2=create st_2
this.cb_3=create cb_3
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_excel
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_9
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_filteron
this.Control[iCurrent+8]=this.cb_filteroff
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.st_vertical
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.dw_3
this.Control[iCurrent+15]=this.dw_sales
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.gb_4
end on

on w_cdreceivable_m.destroy
call super::destroy
destroy(this.pb_excel)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_vertical)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_sales)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.height = newheight - dw_1.y - gb_3.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_3.x
dw_2.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_cdreceivable_m
integer x = 3561
integer y = 56
fontcharset fontcharset = ansi!
boolean italic = true
end type

event pb_save::clicked;//
if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================
WF_Update1( dw_2, "Y" ) 


end event

type dw_1 from w_inheritance`dw_1 within w_cdreceivable_m
integer x = 32
integer y = 432
integer width = 2519
integer height = 1768
integer taborder = 50
string dataobject = "d_cdreceivable_list"
end type

event dw_1::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::doubleclicked;call super::doubleclicked;//
string ls_userid, ls_custno, ls_custname, ls_salesman
long   ll_row

if row < 1 then RETURN

ls_userid    = dw_1.object.user_id[row]
ls_custno    = dw_1.object.cust_no[row]
ls_custname  = dw_1.object.cust_name[row]
ls_salesman  = dw_1.object.salesman[row]
if isnull(ls_custno) OR ls_custno = "" then RETURN

ll_row     = dw_2.insertrow( 0 )
dw_2.scrolltorow( ll_row )

dw_2.object.user_id[ll_row]   = ls_userid
dw_2.object.cust_no[ll_row]   = ls_custno
dw_2.object.cust_name[ll_row] = ls_custname
dw_2.object.salesman[ll_row]  = ls_salesman

end event

type dw_2 from w_inheritance`dw_2 within w_cdreceivable_m
integer x = 2633
integer y = 432
integer width = 1504
integer height = 1768
integer taborder = 60
string dataobject = "d_cdreceivable_m"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event dw_2::doubleclicked;call super::doubleclicked;//
string ls_custno, ls_custnm
long   ll_row

ll_row    = this.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_custno = this.object.cust_no[ll_row]
ls_custnm = this.object.cust_name[ll_row]

gs_where lstr_where
lstr_where.str1 = ls_custno
lstr_where.name = ls_custnm
OpenWithParm(w_whopeom_w, lstr_where)

end event

type st_title from w_inheritance`st_title within w_cdreceivable_m
integer x = 32
integer y = 12
integer width = 1234
string text = "고액채권 거래처관리"
end type

type st_tips from w_inheritance`st_tips within w_cdreceivable_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdreceivable_m
boolean visible = false
integer y = 48
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdreceivable_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdreceivable_m
integer x = 3753
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdreceivable_m
integer x = 3177
integer y = 56
integer taborder = 130
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A3"
l_print.st_print_desc  = " 이 프로그램은 고액채권 거래처관리를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=79'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdreceivable_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdreceivable_m
integer x = 2985
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;//
if dw_2.rowcount() < 1 then RETURN	

dw_2.accepttext()

if MessageBox("확인",'삭제 하시겠습니까?',information!, OKCancel!, 2) = 1 then
	dw_2.deleterow(dw_2.getrow())
	wf_update1(dw_2, "Y")
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_cdreceivable_m
integer x = 2793
integer y = 56
integer taborder = 170
end type

event pb_insert::clicked;//
string ls_userid, ls_custno, ls_custname, ls_salesman
long   ll_Y, ll_row, ll_find

if dw_1.getrow()   < 1 then RETURN

for ll_y = 1 to dw_1.rowcount()
	if dw_1.object.chk[ll_Y] = "Y" then
		ls_userid      = dw_1.object.user_id[ll_y]
		ls_custno      = dw_1.object.cust_no[ll_y]
		ls_custname    = dw_1.object.cust_name[ll_y]
		ls_salesman    = dw_1.object.salesman[ll_y]
		
		ll_find  = dw_2.find( "cust_no = '" + ls_custno + "'", 1, dw_2.rowcount() )
		if ll_find > 0 then
			dw_2.scrolltorow( ll_find )
			MessageBox("확인", ls_custname + "~n~n중복된 거래처입니다.")
			RETURN
		end if
		
		//
		ll_row  = dw_2.insertrow(0)
		dw_2.scrolltorow( ll_row )
		
		dw_2.object.user_id[ll_row]   = ls_userid
		dw_2.object.cust_no[ll_row]   = ls_custno
		dw_2.object.cust_name[ll_row] = ls_custname
		dw_2.object.salesman[ll_row]  = ls_salesman
		
		dw_1.object.chk[ll_Y] = "N" 
	end if
next

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdreceivable_m
integer x = 2601
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_userid, ls_custname
long   ll_row, ll_find
date   ld_date

debugbreak()

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

ld_date   = date(em_1.text)

dw_1.retrieve( ls_userid, ld_date )
dw_2.retrieve( ld_date, ls_userid, "%" )
dw_2.sharedata( dw_3 )

//
for ll_row = 1 to dw_2.rowcount()
	ls_custname  = dw_2.object.cust_name[ll_row]
	ll_find  = dw_1.find( "cust_name = '"+ls_custname+"' ", 1, dw_1.rowcount() )
	if ll_find > 0 then
		dw_1.object.fontcolor[ll_find] = "Y"
	end if
next

end event

type gb_3 from w_inheritance`gb_3 within w_cdreceivable_m
integer x = 32
integer y = 240
integer width = 4105
integer height = 180
integer taborder = 90
integer textsize = -8
integer weight = 400
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdreceivable_m
integer x = 1317
integer y = 12
integer width = 489
integer height = 208
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdreceivable_m
integer x = 2569
integer width = 1399
integer height = 208
integer taborder = 40
integer weight = 400
long backcolor = 79416533
end type

type pb_excel from picturebutton within w_cdreceivable_m
integer x = 3369
integer y = 56
integer width = 187
integer height = 144
integer taborder = 40
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

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos,   li_value
long    ll_cnt
datawindow arg_dw

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

choose case is_dw
	case "dw_2"
		arg_dw = dw_2
end choose

ll_cnt = arg_dw.rowcount()
if ll_cnt > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsascii(ls_DocName)
		end if
	end if
else
	MessageBox("확인","거래처현장 데이터가 존재하지 않습니다.")
end if	

end event

type st_8 from statictext within w_cdreceivable_m
integer x = 128
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

type ddlb_fld from dropdownlistbox within w_cdreceivable_m
integer x = 311
integer y = 304
integer width = 480
integer height = 580
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

type ddlb_dwtitles from dropdownlistbox within w_cdreceivable_m
integer x = 370
integer y = 312
integer width = 306
integer height = 92
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

type st_9 from statictext within w_cdreceivable_m
integer x = 827
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdreceivable_m
integer x = 1275
integer y = 308
integer width = 581
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdreceivable_m
integer x = 1870
integer y = 304
integer width = 197
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdreceivable_m
integer x = 2071
integer y = 304
integer width = 197
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2UnFilter( arg_dw )

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

end event

type cb_1 from commandbutton within w_cdreceivable_m
integer x = 2272
integer y = 304
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )


end event

type cb_2 from commandbutton within w_cdreceivable_m
integer x = 2459
integer y = 304
integer width = 183
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_cdreceivable_m
integer x = 2583
integer y = 432
integer height = 1768
boolean bringtotop = true
end type

type em_1 from editmask within w_cdreceivable_m
integer x = 1349
integer y = 128
integer width = 421
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_cdreceivable_m
integer x = 1349
integer y = 52
integer width = 421
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cdreceivable_m
integer x = 46
integer y = 160
integer width = 114
integer height = 72
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdreceivable_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_sales from datawindow within w_cdreceivable_m
string tag = "d_whlogin_opeom"
integer x = 1856
integer y = 124
integer width = 663
integer height = 84
integer taborder = 50
boolean bringtotop = true
string title = "d_whlogin_c"
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_cdreceivable_m
integer x = 1865
integer y = 52
integer width = 649
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_cdreceivable_m
integer x = 2688
integer y = 300
integer width = 571
integer height = 92
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "매출/수금 내역"
end type

event clicked;// 매출/수금내역
gs_where        lstr_where
string ls_custno, ls_custname
long   ll_row

if dw_1.rowcount() < 1 then RETURN

ll_row      = dw_1.getrow()
ls_custno   = dw_1.object.cust_no[ll_row]
ls_custname = dw_1.object.cust_name[ll_row]

lstr_where.str1 = ls_custno
lstr_where.name = ls_custname
OpenWithParm( w_whopeom_w, lstr_where )

end event

type ddlb_op from dropdownlistbox within w_cdreceivable_m
integer x = 997
integer y = 300
integer width = 270
integer height = 500
integer taborder = 80
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type gb_4 from groupbox within w_cdreceivable_m
integer x = 1829
integer y = 12
integer width = 718
integer height = 208
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

