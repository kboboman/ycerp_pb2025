$PBExportHeader$w_osaroiopeom_r.srw
$PBExportComments$매출거래처 이력
forward
global type w_osaroiopeom_r from w_inheritance
end type
type em_1 from editmask within w_osaroiopeom_r
end type
type st_1 from statictext within w_osaroiopeom_r
end type
type dw_3 from datawindow within w_osaroiopeom_r
end type
type st_2 from statictext within w_osaroiopeom_r
end type
type rb_1 from radiobutton within w_osaroiopeom_r
end type
type rb_2 from radiobutton within w_osaroiopeom_r
end type
type rb_all from radiobutton within w_osaroiopeom_r
end type
type cbx_1 from checkbox within w_osaroiopeom_r
end type
type em_2 from editmask within w_osaroiopeom_r
end type
type cbx_2 from checkbox within w_osaroiopeom_r
end type
type st_4 from statictext within w_osaroiopeom_r
end type
type ddlb_fld from dropdownlistbox within w_osaroiopeom_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osaroiopeom_r
end type
type st_5 from statictext within w_osaroiopeom_r
end type
type ddlb_op from dropdownlistbox within w_osaroiopeom_r
end type
type sle_value from singlelineedit within w_osaroiopeom_r
end type
type cb_1 from commandbutton within w_osaroiopeom_r
end type
type cb_2 from commandbutton within w_osaroiopeom_r
end type
type cb_3 from commandbutton within w_osaroiopeom_r
end type
type cb_5 from commandbutton within w_osaroiopeom_r
end type
type dw_4 from datawindow within w_osaroiopeom_r
end type
type rb_site from radiobutton within w_osaroiopeom_r
end type
type rb_fix from radiobutton within w_osaroiopeom_r
end type
type gb_4 from groupbox within w_osaroiopeom_r
end type
type dw_excel from datawindow within w_osaroiopeom_r
end type
end forward

global type w_osaroiopeom_r from w_inheritance
integer width = 4389
integer height = 2260
string title = "거래처별 매출이력(w_osaroiopeom_r)"
em_1 em_1
st_1 st_1
dw_3 dw_3
st_2 st_2
rb_1 rb_1
rb_2 rb_2
rb_all rb_all
cbx_1 cbx_1
em_2 em_2
cbx_2 cbx_2
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
dw_4 dw_4
rb_site rb_site
rb_fix rb_fix
gb_4 gb_4
dw_excel dw_excel
end type
global w_osaroiopeom_r w_osaroiopeom_r

type variables
//
DataWindowChild idwc_user, idwc_user1
string is_dw

string	is_rb	//현장별site, 틀고정fix
end variables

on w_osaroiopeom_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_all=create rb_all
this.cbx_1=create cbx_1
this.em_2=create em_2
this.cbx_2=create cbx_2
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
this.dw_4=create dw_4
this.rb_site=create rb_site
this.rb_fix=create rb_fix
this.gb_4=create gb_4
this.dw_excel=create dw_excel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.rb_all
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.em_2
this.Control[iCurrent+10]=this.cbx_2
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cb_2
this.Control[iCurrent+19]=this.cb_3
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.dw_4
this.Control[iCurrent+22]=this.rb_site
this.Control[iCurrent+23]=this.rb_fix
this.Control[iCurrent+24]=this.gb_4
this.Control[iCurrent+25]=this.dw_excel
end on

on w_osaroiopeom_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_all)
destroy(this.cbx_1)
destroy(this.em_2)
destroy(this.cbx_2)
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
destroy(this.dw_4)
destroy(this.rb_site)
destroy(this.rb_fix)
destroy(this.gb_4)
destroy(this.dw_excel)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
datetime ldt_date

dw_2.visible = false
SELECT top 1 dateadd(month, -6, getdate()) INTO :ldt_date FROM dual;

em_1.text = string(ldt_date,"yyyy/mm/01")
em_2.text = string(now(),   "yyyy/mm/dd")

dw_excel.settransobject(sqlca)
is_rb = 'site'	//현장별
// 담당자
dw_3.settransobject(sqlca)
dw_3.insertrow(1)

dw_3.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_3.object.user[1] = '%'

// 담당자
dw_4.SetTransObject(SQLCA)
dw_4.getchild("user",idwc_user1)
idwc_user1.SetTransObject(sqlca)


/*2018.07.19 jowonsuk 동부, 송천 주석처리 전부 다 조회 가능 하게 */
if GF_Permission("거래처별 매출이력", gs_userid) = "Y" then
	idwc_user1.retrieve( "%" )

	idwc_user1.insertrow(1)
	idwc_user1.setitem(1,"user_id","%")
	idwc_user1.setitem(1,"user_name","전체")
	idwc_user1.accepttext()
	dw_4.object.user[1] = "%"	
else
	idwc_user1.retrieve( gs_userid )
	if idwc_user1.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
	else
		// 거래처가 없는 담당자(임원)
		idwc_user1.insertrow(1)
		idwc_user1.setitem(1,"user_id",gs_userid)
		idwc_user1.setitem(1,"user_name",gs_username)
		idwc_user1.accepttext()
	end if
	dw_4.object.user[1] = gs_userid
		
end if

//cbx_2.checked = true
//cbx_2.triggerevent( clicked! )
rb_site.triggerevent( clicked! )
end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

dw_2.x = dw_1.x ; dw_2.y = dw_1.y
dw_2.width = dw_1.width ; dw_2.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_osaroiopeom_r
boolean visible = false
integer x = 4123
integer y = 12
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_osaroiopeom_r
integer x = 32
integer y = 416
integer width = 4242
integer height = 1600
integer taborder = 60
string dataobject = "d_osaroiopeom_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return
//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

this.SelectRow(0,  false)
this.SelectRow(row,  true)

end event

type st_title from w_inheritance`st_title within w_osaroiopeom_r
integer x = 37
integer y = 20
integer width = 1257
integer height = 140
string text = "거래처별 매출이력"
end type

type st_tips from w_inheritance`st_tips within w_osaroiopeom_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroiopeom_r
boolean visible = false
integer x = 4123
integer y = 16
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroiopeom_r
boolean visible = false
integer x = 4082
integer y = 16
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_osaroiopeom_r
integer x = 3387
integer y = 44
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroiopeom_r
integer x = 3195
integer y = 44
integer taborder = 40
string picturename = "CrossTab!"
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
datawindow	idw_dw

if is_rb = 'site' then
	idw_dw = dw_excel
else
	idw_dw = dw_1
end if

if idw_dw.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			idw_dw.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			idw_dw.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroiopeom_r
boolean visible = false
integer x = 4105
integer y = 40
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_osaroiopeom_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_osaroiopeom_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroiopeom_r
integer x = 3003
integer y = 44
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_userid
date   ld_sdate, ld_edate

/* 2019.02.22 JOWONSUK 
dw_3.AcceptText()
ls_userid = dw_3.object.user[1]
*/
/* 2019.02.22 JOWONSUK 반영 */
dw_4.AcceptText()
ls_userid = dw_4.object.user[1]

if em_1.text = '' then
	messagebox("확인","해당 년월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

dw_1.reset()
dw_2.reset()
dw_excel.reset()

//if cbx_2.checked = true then
if rb_site.checked = true then	
	dw_2.retrieve( ls_userid, ld_sdate, ld_edate )
	dw_excel.retrieve( ls_userid, ld_sdate, ld_edate )	
else
	dw_1.retrieve( ls_userid, ld_sdate, ld_edate )
end if
//cbx_1.PostEvent( clicked! )
rb_fix.PostEvent( clicked! )

end event

type gb_3 from w_inheritance`gb_3 within w_osaroiopeom_r
integer x = 1335
integer y = 4
integer width = 1230
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osaroiopeom_r
integer y = 224
integer width = 4242
integer height = 172
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroiopeom_r
integer x = 2962
integer y = 4
integer width = 645
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osaroiopeom_r
integer x = 3648
integer y = 12
integer width = 302
integer height = 300
integer taborder = 0
string dataobject = "d_osaroiopeom_r1"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
if row < 1 then return
//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

this.SelectRow(0,  false)
this.SelectRow(row,  true)

end event

type em_1 from editmask within w_osaroiopeom_r
integer x = 1669
integer y = 116
integer width = 434
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
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
string displaydata = "T"
end type

event rbuttondown;//
OpenWithParm(w_calendar, Message.StringParm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_osaroiopeom_r
integer x = 1362
integer y = 40
integer width = 306
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_osaroiopeom_r
boolean visible = false
integer x = 1669
integer y = 40
integer width = 663
integer height = 76
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_osaroiopeom_r
integer x = 1362
integer y = 116
integer width = 306
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_osaroiopeom_r
integer x = 2825
integer y = 268
integer width = 741
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "잔액 ZERO"
end type

event clicked;// 잔액 ZERO
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
arg_dw.setfilter( "balance_amt = 0" )
arg_dw.filter()
arg_dw.groupcalc()

if is_rb = 'site' then
	dw_excel.setfilter( "balance_amt = 0" )
	dw_excel.filter()
	dw_excel.groupcalc()
end if

end event

type rb_2 from radiobutton within w_osaroiopeom_r
integer x = 2825
integer y = 328
integer width = 741
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "잔액 ZERO 아닌업체"
end type

event clicked;// 잔액 ZERO 아닌업체
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
arg_dw.setfilter( "balance_amt <> 0" )
arg_dw.filter()
arg_dw.groupcalc()

if is_rb = 'site' then
	dw_excel.setfilter( "balance_amt <> 0" )
	dw_excel.filter()
	dw_excel.groupcalc()
end if

end event

type rb_all from radiobutton within w_osaroiopeom_r
integer x = 2569
integer y = 268
integer width = 242
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;// 전체
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
arg_dw.setfilter( "" )
arg_dw.filter()
arg_dw.groupcalc()

if is_rb = 'site' then
	dw_excel.setfilter( "" )
	dw_excel.filter()
	dw_excel.groupcalc()
end if

end event

type cbx_1 from checkbox within w_osaroiopeom_r
boolean visible = false
integer x = 4201
integer y = 108
integer width = 306
integer height = 68
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
	ls_colx = string(long(dw_1.object.balance_amt.x) + long(dw_1.object.balance_amt.width))
else
	ls_colx = "0"
end if
dw_1.object.datawindow.horizontalscrollsplit = ls_colx

end event

type em_2 from editmask within w_osaroiopeom_r
integer x = 2103
integer y = 116
integer width = 434
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -11
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
string displaydata = "T"
end type

type cbx_2 from checkbox within w_osaroiopeom_r
boolean visible = false
integer x = 4201
integer y = 32
integer width = 306
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
string text = "현장별"
boolean checked = true
end type

event clicked;//
if this.checked = true then
	dw_1.visible = false
	dw_2.visible = true
else
	dw_1.visible = true
	dw_2.visible = false
end if

end event

type st_4 from statictext within w_osaroiopeom_r
integer x = 87
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_osaroiopeom_r
integer x = 274
integer y = 280
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

type ddlb_dwtitles from dropdownlistbox within w_osaroiopeom_r
boolean visible = false
integer x = 329
integer y = 296
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
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
end type

type st_5 from statictext within w_osaroiopeom_r
integer x = 791
integer y = 296
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

type ddlb_op from dropdownlistbox within w_osaroiopeom_r
integer x = 960
integer y = 280
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

type sle_value from singlelineedit within w_osaroiopeom_r
integer x = 1280
integer y = 288
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

type cb_1 from commandbutton within w_osaroiopeom_r
integer x = 1861
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_osaroiopeom_r
integer x = 2025
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_osaroiopeom_r
integer x = 2190
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_osaroiopeom_r
integer x = 2354
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_4 from datawindow within w_osaroiopeom_r
integer x = 1678
integer y = 44
integer width = 325
integer height = 76
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

type rb_site from radiobutton within w_osaroiopeom_r
integer x = 2601
integer y = 44
integer width = 320
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "현장별"
boolean checked = true
end type

event clicked;if this.checked = true then
	is_rb	= 'site'
	dw_1.visible = false
	dw_2.visible = true
end if

end event

type rb_fix from radiobutton within w_osaroiopeom_r
integer x = 2601
integer y = 112
integer width = 320
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

ls_colx = "0"
if this.checked = true then
	is_rb	= 'fix'
	dw_1.visible = true
	dw_2.visible = false
	ls_colx = string(long(dw_1.object.balance_amt.x) + long(dw_1.object.balance_amt.width))
end if

dw_1.object.datawindow.horizontalscrollsplit = ls_colx

end event

type gb_4 from groupbox within w_osaroiopeom_r
integer x = 2587
integer y = 4
integer width = 357
integer height = 204
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_excel from datawindow within w_osaroiopeom_r
boolean visible = false
integer x = 3973
integer y = 20
integer width = 302
integer height = 312
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_osaroiopeom_r1_excel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

