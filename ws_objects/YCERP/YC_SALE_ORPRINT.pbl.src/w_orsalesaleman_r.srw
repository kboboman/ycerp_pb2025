$PBExportHeader$w_orsalesaleman_r.srw
$PBExportComments$영업사원별 수주현황(1998/05/15, 정재수)
forward 
global type w_orsalesaleman_r from w_inheritance
end type
type st_1 from statictext within w_orsalesaleman_r
end type
type em_1 from editmask within w_orsalesaleman_r
end type
type em_2 from editmask within w_orsalesaleman_r
end type
type st_2 from statictext within w_orsalesaleman_r
end type
type dw_3 from datawindow within w_orsalesaleman_r
end type
type dw_4 from datawindow within w_orsalesaleman_r
end type
type st_4 from statictext within w_orsalesaleman_r
end type
type cbx_1 from checkbox within w_orsalesaleman_r
end type
type st_6 from statictext within w_orsalesaleman_r
end type
type ddlb_fld from dropdownlistbox within w_orsalesaleman_r
end type
type ddlb_dwtitles from dropdownlistbox within w_orsalesaleman_r
end type
type st_7 from statictext within w_orsalesaleman_r
end type
type ddlb_op from dropdownlistbox within w_orsalesaleman_r
end type
type sle_value from singlelineedit within w_orsalesaleman_r
end type
type cb_3 from commandbutton within w_orsalesaleman_r
end type
type cb_4 from commandbutton within w_orsalesaleman_r
end type
type cb_5 from commandbutton within w_orsalesaleman_r
end type
type cb_6 from commandbutton within w_orsalesaleman_r
end type
type cb_2 from commandbutton within w_orsalesaleman_r
end type
type cb_rout from commandbutton within w_orsalesaleman_r
end type
type cbx_3 from checkbox within w_orsalesaleman_r
end type
type cbx_rout from checkbox within w_orsalesaleman_r
end type
type dw_6 from datawindow within w_orsalesaleman_r
end type
type cbx_5 from checkbox within w_orsalesaleman_r
end type
type pb_2 from picturebutton within w_orsalesaleman_r
end type
end forward

global type w_orsalesaleman_r from w_inheritance
integer y = 112
integer width = 4265
integer height = 2556
string title = "영업사원별 수주현황(w_orsalesaleman_r)"
long backcolor = 79416533
st_1 st_1
em_1 em_1
em_2 em_2
st_2 st_2
dw_3 dw_3
dw_4 dw_4
st_4 st_4
cbx_1 cbx_1
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_2 cb_2
cb_rout cb_rout
cbx_3 cbx_3
cbx_rout cbx_rout
dw_6 dw_6
cbx_5 cbx_5
pb_2 pb_2
end type
global w_orsalesaleman_r w_orsalesaleman_r

type variables
string is_dw, is_ret, is_dw5_sql
datawindowchild idwc_user, idwc_area

end variables

on w_orsalesaleman_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_4=create st_4
this.cbx_1=create cbx_1
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_2=create cb_2
this.cb_rout=create cb_rout
this.cbx_3=create cbx_3
this.cbx_rout=create cbx_rout
this.dw_6=create dw_6
this.cbx_5=create cbx_5
this.pb_2=create pb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_4
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.cb_6
this.Control[iCurrent+19]=this.cb_2
this.Control[iCurrent+20]=this.cb_rout
this.Control[iCurrent+21]=this.cbx_3
this.Control[iCurrent+22]=this.cbx_rout
this.Control[iCurrent+23]=this.dw_6
this.Control[iCurrent+24]=this.cbx_5
this.Control[iCurrent+25]=this.pb_2
end on

on w_orsalesaleman_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_2)
destroy(this.cb_rout)
destroy(this.cbx_3)
destroy(this.cbx_rout)
destroy(this.dw_6)
destroy(this.cbx_5)
destroy(this.pb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

st_security lst_security
string ls_level_userid, ls_chk, ls_area, ls_salesman, ls_sdate, ls_edate

dw_6.settransobject(sqlca)
is_dw5_sql = dw_1.describe("datawindow.table.select")

dw_3.settransobject(sqlca)
dw_3.insertrow(1)

cbx_5.visible = false
if gs_userid = "1999010s" then cbx_5.visible = true

choose case gs_level
	case 'A', 'B'
		ls_chk = 'Y'
	case 'C'
		ls_chk = 'N'
end choose

if ls_chk = 'Y' Then
	is_ret = '%'
	dw_3.getchild('user',idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1,'user_id','%')
	idwc_user.setitem(1,'user_name','전체')
	idwc_user.accepttext()
	dw_3.object.user[1] = '%'
else
	dw_3.object.user[1] = gs_userid
	is_ret = 'N'
end if

cbx_rout.enabled = false

SELECT top 1 convert(char(10),dateadd(month, -1, getdate()),111), convert(char(10),dateadd(day, 1, getdate()),111)
  INTO :ls_sdate, :ls_edate
  FROM login;
  
em_1.text = ls_sdate
em_2.text = ls_edate

dw_6.visible = false
dw_2.visible = false
dw_1.sharedata(dw_2)

dw_4.settransobject(sqlca)
dw_4.insertrow(1)
dw_4.getchild('area',idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체')
idwc_area.accepttext()
ls_area = "%"
dw_4.object.area[1] = ls_area

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )


end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 77
dw_1.height = newheight - 448

dw_6.x      = dw_1.x
dw_6.y      = dw_1.y
dw_6.width  = dw_1.width
dw_6.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_orsalesaleman_r
boolean visible = false
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_orsalesaleman_r
integer x = 37
integer y = 412
integer width = 4603
integer height = 2004
integer taborder = 0
string dataobject = "d_orsalesalemanrep_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;if dwo.name = 'sale_cust_no' or dwo.name = 'customer_cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.sale_cust_no[row]
	lstr_where.name = this.object.customer_cust_name[row]
	openwithparm(w_whopeom_w, lstr_where)
end if
end event

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_track

ls_track = this.object.sale_tracking[row]
if ls_track = "Y" then
	cb_rout.text = "공정관리 제거"
else
	cb_rout.text = "공정관리 투입"
end if

end event

type st_title from w_inheritance`st_title within w_orsalesaleman_r
integer x = 37
integer y = 24
integer width = 1216
integer height = 136
string text = "영업사원별 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_orsalesaleman_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsalesaleman_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsalesaleman_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_orsalesaleman_r
integer x = 4421
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsalesaleman_r
integer x = 4229
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print


if dw_2.rowcount() < 1 then
	return
end if

//l_print.name = 'd_orsalesalemanrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원별 수주현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=56'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsalesaleman_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_orsalesaleman_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_orsalesaleman_r
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsalesaleman_r
integer x = 3845
integer taborder = 40
end type

event pb_retrieve::clicked;//
date   ld_start, ld_end
string ls_sale_flag[], ls_saleman, ls_area, ls_ret
long   ll_cnt, ll_chk

st_security lst_security
 
dw_3.AcceptText()
dw_1.reset()

if em_1.text = '' then
	MessageBox("확인","납기일자를 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	MessageBox("확인","납기일자를 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	MessageBox("확인","납기일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_area  = dw_4.object.area[1]
ld_start = date(em_1.text)
ld_end   = date(em_2.text)

ls_sale_flag[1] = 'D'
ls_sale_flag[2] = 'L'
ls_sale_flag[3] = 'E'

ll_cnt = 0
ls_ret = is_ret

if cbx_1.checked = true  then
	SELECT count(*) INTO :ll_cnt FROM team WHERE parent_code = '70000' AND team_manager = :gs_userid;
	if ll_cnt > 0  then
		ls_ret =  'T'
		ls_saleman = gs_userid
	else
		if is_ret = '%' then
			ls_saleman = dw_3.object.user[1]
		else
			ls_saleman = gs_userid
		end if
	end if
else
	if is_ret = '%' then
		ls_saleman = dw_3.object.user[1]
	else
		ls_saleman = gs_userid
	end if
end if

cbx_rout.enabled = true

dw_1.retrieve(ls_sale_flag, ld_start, ld_end, ls_saleman, ls_area, ls_ret)
if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.",information!)
else
	MessageBox("확인","조회완료",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_orsalesaleman_r
integer x = 1335
integer y = 0
integer width = 1728
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsalesaleman_r
integer x = 37
integer y = 232
integer width = 4603
integer height = 156
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_orsalesaleman_r
integer x = 3081
integer y = 0
integer width = 1559
integer height = 232
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_orsalesaleman_r
integer x = 439
integer y = 128
integer width = 123
integer height = 92
integer taborder = 0
boolean enabled = false
string dataobject = "d_orsalesalemanrep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_orsalesaleman_r
integer x = 1902
integer y = 48
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
string text = "주문기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsalesaleman_r
integer x = 2226
integer y = 48
integer width = 393
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

event modified;//
if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_orsalesaleman_r
integer x = 2624
integer y = 48
integer width = 393
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

type st_2 from statictext within w_orsalesaleman_r
integer x = 1902
integer y = 136
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
string text = "담 당 자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_orsalesaleman_r
integer x = 2222
integer y = 132
integer width = 677
integer height = 84
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.AcceptText()
end event

type dw_4 from datawindow within w_orsalesaleman_r
integer x = 1367
integer y = 136
integer width = 526
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.AcceptText()

end event

type st_4 from statictext within w_orsalesaleman_r
integer x = 1367
integer y = 48
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
boolean enabled = false
string text = "사 업 장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_orsalesaleman_r
integer x = 2898
integer y = 144
integer width = 146
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
string text = "팀"
end type

type st_6 from statictext within w_orsalesaleman_r
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

type ddlb_fld from dropdownlistbox within w_orsalesaleman_r
integer x = 274
integer y = 280
integer width = 480
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

type ddlb_dwtitles from dropdownlistbox within w_orsalesaleman_r
integer x = 329
integer y = 296
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

type st_7 from statictext within w_orsalesaleman_r
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

type ddlb_op from dropdownlistbox within w_orsalesaleman_r
integer x = 960
integer y = 280
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

type sle_value from singlelineedit within w_orsalesaleman_r
integer x = 1280
integer y = 288
integer width = 567
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

type cb_3 from commandbutton within w_orsalesaleman_r
integer x = 1861
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_orsalesaleman_r
integer x = 2025
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_orsalesaleman_r
integer x = 2190
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_orsalesaleman_r
integer x = 2354
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_orsalesaleman_r
integer x = 2560
integer y = 280
integer width = 384
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "여신현황"
end type

event clicked;//
string ls_custno, ls_custnm
long   ll_row

ll_row    = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_custno = dw_1.object.sale_cust_no[ll_row]
ls_custnm = dw_1.object.customer_cust_name[ll_row]

gs_where lstr_where
lstr_where.str1 = ls_custno
lstr_where.name = ls_custnm
openwithparm(w_whopeom_w, lstr_where)

end event

type cb_rout from commandbutton within w_orsalesaleman_r
integer x = 3109
integer y = 52
integer width = 722
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "공정관리 투입"
end type

event clicked;//
string ls_orderno, ls_track
long   ll_row

ll_row    = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_orderno = dw_1.object.sale_order_no[ll_row]
if isnull(ls_orderno) OR ls_orderno = "" then RETURN

SELECT tracking INTO :ls_track FROM sale WHERE order_no = :ls_orderno;
if isnull(ls_track) OR ls_track = "" then
	ls_track = "Y"
else
	setnull( ls_track )
end if

//
UPDATE sale SET tracking = :ls_track WHERE order_no = :ls_orderno;
if sqlca.sqlcode <> 0 then
	ROLLBACK;
	MessageBox("확인","공정관리 대상으로 등록중 ERROR가 발생하였습니다.")
	RETURN
else
	COMMIT;

	for ll_row = 1 to dw_1.rowcount()
		if ls_orderno = dw_1.object.sale_order_no[ll_row] then
			dw_1.object.sale_tracking[ll_row] = ls_track
		end if
	next
	
	if ls_track = "Y" then
		cb_rout.text = "공정관리 제거"
		MessageBox("확인","공정관리 대상으로 등록 하였습니다.")
	else
		cb_rout.text = "공정관리 투입"
		MessageBox("확인","공정관리 대상에서 해지 하였습니다.")
	end if
end if

end event

type cbx_3 from checkbox within w_orsalesaleman_r
integer x = 2981
integer y = 296
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "주문당일,익일"
end type

event clicked;//
if this.checked = true then
	em_1.text = string(today(), 'YYYY/MM/DD')
	em_2.text = string(RelativeDate(today(), 1), 'YYYY/MM/DD')
else
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = string(RelativeDate(today(), 1), 'YYYY/MM/DD')
end if	
end event

type cbx_rout from checkbox within w_orsalesaleman_r
integer x = 3570
integer y = 296
integer width = 361
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "공정필터"
end type

event clicked;// 공정필터
if this.checked = true then
	dw_1.setfilter( "sale_tracking = 'Y'" )
	dw_1.filter()
else
	dw_1.setfilter( "" )
	dw_1.filter()
end if

end event

type dw_6 from datawindow within w_orsalesaleman_r
integer x = 311
integer y = 128
integer width = 123
integer height = 92
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_routsaledet_ymd"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type cbx_5 from checkbox within w_orsalesaleman_r
integer x = 73
integer y = 224
integer width = 73
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
string text = "none"
end type

event clicked;if this.checked = true then
	dw_6.visible = true
	dw_6.retrieve()
else
	dw_6.visible = false
end if

end event

type pb_2 from picturebutton within w_orsalesaleman_r
event mousemove pbm_mousemove
integer x = 4037
integer y = 52
integer width = 187
integer height = 144
integer taborder = 250
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_1

if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
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

