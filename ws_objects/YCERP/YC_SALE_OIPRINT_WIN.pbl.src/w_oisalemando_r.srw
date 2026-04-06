$PBExportHeader$w_oisalemando_r.srw
$PBExportComments$영업사원별 출고현황(1999/3/02,조현춘)
forward
global type w_oisalemando_r from w_inheritance
end type
type st_1 from statictext within w_oisalemando_r
end type
type em_1 from editmask within w_oisalemando_r
end type
type em_2 from editmask within w_oisalemando_r
end type
type st_3 from statictext within w_oisalemando_r
end type
type st_2 from statictext within w_oisalemando_r
end type
type ddlb_1 from dropdownlistbox within w_oisalemando_r
end type
type dw_3 from datawindow within w_oisalemando_r
end type
type dw_4 from datawindow within w_oisalemando_r
end type
type st_4 from statictext within w_oisalemando_r
end type
type cbx_1 from checkbox within w_oisalemando_r
end type
type dw_5 from datawindow within w_oisalemando_r
end type
type rb_1 from radiobutton within w_oisalemando_r
end type
type rb_2 from radiobutton within w_oisalemando_r
end type
type dw_6 from datawindow within w_oisalemando_r
end type
type rb_3 from radiobutton within w_oisalemando_r
end type
type pb_1 from picturebutton within w_oisalemando_r
end type
type cbx_2 from checkbox within w_oisalemando_r
end type
type st_5 from statictext within w_oisalemando_r
end type
type ddlb_fld from dropdownlistbox within w_oisalemando_r
end type
type st_6 from statictext within w_oisalemando_r
end type
type sle_value from singlelineedit within w_oisalemando_r
end type
type cb_1 from commandbutton within w_oisalemando_r
end type
type cb_2 from commandbutton within w_oisalemando_r
end type
type cb_3 from commandbutton within w_oisalemando_r
end type
type cb_5 from commandbutton within w_oisalemando_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oisalemando_r
end type
type ddlb_op from dropdownlistbox within w_oisalemando_r
end type
end forward

global type w_oisalemando_r from w_inheritance
integer y = 112
integer width = 4750
integer height = 2568
string title = "영업사원별 출고현황(w_oisalemando_r)"
st_1 st_1
em_1 em_1
em_2 em_2
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
dw_3 dw_3
dw_4 dw_4
st_4 st_4
cbx_1 cbx_1
dw_5 dw_5
rb_1 rb_1
rb_2 rb_2
dw_6 dw_6
rb_3 rb_3
pb_1 pb_1
cbx_2 cbx_2
st_5 st_5
ddlb_fld ddlb_fld
st_6 st_6
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
ddlb_op ddlb_op
end type
global w_oisalemando_r w_oisalemando_r

type variables
string is_dw, is_sale_flag
string ls_saleman, is_ret
datawindowchild idwc_area, idwc_user
end variables

on w_oisalemando_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_4=create st_4
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_6=create dw_6
this.rb_3=create rb_3
this.pb_1=create pb_1
this.cbx_2=create cbx_2
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.cbx_1
this.Control[iCurrent+11]=this.dw_5
this.Control[iCurrent+12]=this.rb_1
this.Control[iCurrent+13]=this.rb_2
this.Control[iCurrent+14]=this.dw_6
this.Control[iCurrent+15]=this.rb_3
this.Control[iCurrent+16]=this.pb_1
this.Control[iCurrent+17]=this.cbx_2
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.ddlb_fld
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.sle_value
this.Control[iCurrent+22]=this.cb_1
this.Control[iCurrent+23]=this.cb_2
this.Control[iCurrent+24]=this.cb_3
this.Control[iCurrent+25]=this.cb_5
this.Control[iCurrent+26]=this.ddlb_dwtitles
this.Control[iCurrent+27]=this.ddlb_op
end on

on w_oisalemando_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_6)
destroy(this.rb_3)
destroy(this.pb_1)
destroy(this.cbx_2)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false


st_security lst_security
string ls_chk, ls_level_userid, ls_area

dw_2.visible = false
dw_5.visible = false 
dw_6.visible = false 

if gs_userid = '1999010s' then
else
	cbx_2.visible = false
end if

dw_1.dataobject = "d_oisalemandosum_r"
dw_1.SetTransObject(SQLCA)

dw_5.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_3.insertrow(1)

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
	is_ret = gs_userid
end if

em_1.text = string(today(), 'YYYY/MM/01')
em_2.text = string(today(), 'YYYY/MM/DD')
dw_1.sharedata(dw_2)

dw_4.settransobject(sqlca)
dw_4.insertrow(1)
dw_4.getchild('area',idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체사업장')
idwc_area.accepttext()

ls_area = "%"
dw_4.object.area[1] = ls_area

is_sale_flag = 'A'
ddlb_1.text = '전체'

//cbx_2.checked = true

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 64
dw_1.height = newheight - 448

end event

type pb_save from w_inheritance`pb_save within w_oisalemando_r
boolean visible = false
integer taborder = 120
end type

type dw_1 from w_inheritance`dw_1 within w_oisalemando_r
string tag = "d_oisaledo_r"
integer x = 32
integer y = 420
integer width = 4649
integer height = 2016
integer taborder = 190
string title = "d_oisalemandosum_r"
string dataobject = "d_oisaledo_r1"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oisalemando_r
integer x = 37
integer y = 44
integer width = 1170
string text = "영업사원별 출고현황"
end type

type st_tips from w_inheritance`st_tips within w_oisalemando_r
end type

type pb_compute from w_inheritance`pb_compute within w_oisalemando_r
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_oisalemando_r
boolean visible = false
integer taborder = 90
end type

type pb_close from w_inheritance`pb_close within w_oisalemando_r
integer x = 4457
integer y = 56
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oisalemando_r
integer x = 4265
integer y = 56
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print
datawindow dw_prt
string     ls_zoom

if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_1.checked = true then		// 현장집계
	dw_prt = dw_1
	ls_zoom = "Datawindow.Zoom=100"
elseif rb_2.checked = true then	// 품목집계
	dw_prt = dw_2
	ls_zoom = "Datawindow.Zoom=80"
else										// 전략품목
	dw_prt = dw_1						
	ls_zoom = "Datawindow.Zoom=100"
end if

l_print.st_datawindow  = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 영업사원별 출고현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + ls_zoom
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_oisalemando_r
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_oisalemando_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_oisalemando_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oisalemando_r
integer x = 3877
integer y = 56
integer taborder = 30
end type

event pb_retrieve::clicked;date   ld_start, ld_end
long   ll_row
string ls_saleflags[], ls_area, ls_team, ls_salesman, ls_start, ls_end

dw_3.AcceptText()

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
elseif is_sale_flag = '' or isnull(is_sale_flag) then
	MessageBox("확인","수주유형을 입력하세요!",information!)
	ddlb_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_start = em_1.text
ls_end   = em_2.text

dw_1.reset()
if is_sale_flag = 'A' then
	ls_saleflags[1] = 'D'
	ls_saleflags[2] = 'L'
	ls_saleflags[3] = 'E'
else
	ls_saleflags[1] = trim(is_sale_flag)
end if

/////////////////////////////////////////////////////////////////////////////////
// 각 팀장들..
/////////////////////////////////////////////////////////////////////////////////
long   ll_cnt, ll_chk
string ls_teammgr

ls_team =  is_ret
if cbx_1.checked = true  then		// 팀조회
	ll_cnt = 0
	ls_teammgr = dw_3.object.user[1]
	
	SELECT count(*) INTO :ll_cnt FROM team
	 WHERE parent_code = '70000'  AND team_manager = :ls_teammgr;	// gs_userid
	if ll_cnt > 0  then
		ls_team = 'T'
		ls_salesman = ls_teammgr
	else
		if is_ret = '%' then
			ls_salesman = dw_3.object.user[1]
		else
			ls_salesman = gs_userid
		end if
	end if
else
	if is_ret = '%' then
		ls_salesman = dw_3.object.user[1]
	else
		ls_salesman = gs_userid
	end if
end if
/////////////////////////////////////////////////////////////////////////////////

ls_area = dw_4.object.area[1]

if rb_1.checked = true then		// 현장집계
	ll_row = dw_1.retrieve( ls_saleflags, ls_start, ls_end, ls_salesman, ls_area, ls_team )
elseif rb_2.checked = true then	// 품목집계
	dw_1.sharedata(dw_2)	
	ll_row = dw_1.retrieve( ls_saleflags, ls_start, ls_end, ls_salesman, ls_area, ls_team )
else
	ll_row = dw_1.retrieve( date(ls_start), ls_salesman, ls_team )
end if

if ll_row < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.!",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oisalemando_r
integer x = 1454
integer y = 0
integer width = 2359
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oisalemando_r
integer y = 240
integer width = 4649
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oisalemando_r
integer x = 3840
integer y = 0
integer width = 841
integer height = 232
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_oisalemando_r
integer x = 1257
integer y = 64
integer width = 110
integer height = 84
integer taborder = 0
boolean enabled = false
string dataobject = "d_oisaledorep_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_oisalemando_r
integer x = 2030
integer y = 52
integer width = 274
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "출고기간"
boolean focusrectangle = false
end type

type em_1 from editmask within w_oisalemando_r
integer x = 2304
integer y = 40
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
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oisalemando_r
integer x = 2752
integer y = 40
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

type st_3 from statictext within w_oisalemando_r
integer x = 2688
integer y = 44
integer width = 41
integer height = 72
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oisalemando_r
integer x = 2030
integer y = 140
integer width = 274
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "수주유형"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_oisalemando_r
integer x = 2304
integer y = 124
integer width = 370
integer height = 384
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","내수","L/C","수출"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index 
	case 1
		is_sale_flag = 'A'
	case 2
		is_sale_flag = 'D'
	case 3
		is_sale_flag = 'L'
	case 4
		is_sale_flag = 'E'
end choose

if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type dw_3 from datawindow within w_oisalemando_r
integer x = 2747
integer y = 128
integer width = 686
integer height = 84
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type dw_4 from datawindow within w_oisalemando_r
integer x = 1486
integer y = 128
integer width = 521
integer height = 80
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event losefocus;this.AcceptText()
end event

type st_4 from statictext within w_oisalemando_r
integer x = 1486
integer y = 56
integer width = 521
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "사업장"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_oisalemando_r
integer x = 3131
integer y = 52
integer width = 288
integer height = 64
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "팀조회"
end type

type dw_5 from datawindow within w_oisalemando_r
integer x = 361
integer y = 800
integer width = 3973
integer height = 548
integer taborder = 150
boolean bringtotop = true
string title = "none"
string dataobject = "d_oisalemandosum_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_5"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_1 from radiobutton within w_oisalemando_r
integer x = 3461
integer y = 48
integer width = 329
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "현장집계"
boolean checked = true
end type

event clicked;// 현장집계
if this.checked = true then
	dw_1.dataobject = "d_oisalemandosum_r"
	dw_1.SetTransObject(SQLCA)
end if

end event

type rb_2 from radiobutton within w_oisalemando_r
integer x = 3461
integer y = 108
integer width = 329
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "품목집계"
end type

event clicked;// 품목집계
if this.checked = true then
	if cbx_2.checked = true then
		dw_1.dataobject = "d_oisaledo_r"
	else
		dw_1.dataobject = "d_oisaledo_r1"
	end if
	dw_1.SetTransObject(SQLCA)
end if

end event

type dw_6 from datawindow within w_oisalemando_r
integer x = 361
integer y = 1376
integer width = 3973
integer height = 548
integer taborder = 170
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsaleitemt_r11"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_6"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_3 from radiobutton within w_oisalemando_r
integer x = 3461
integer y = 168
integer width = 329
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전략품목"
end type

event clicked;// 전략품목
if this.checked = true then
	dw_1.dataobject = "d_orsaleitemt_r11"
	dw_1.SetTransObject(SQLCA)
end if

end event

type pb_1 from picturebutton within w_oisalemando_r
event mousemove pbm_mousemove
integer x = 4069
integer y = 56
integer width = 187
integer height = 144
integer taborder = 80
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
integer ls_Value,   li_Pos,   li_value
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

type cbx_2 from checkbox within w_oisalemando_r
integer x = 1221
integer y = 172
integer width = 229
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "원본"
end type

type st_5 from statictext within w_oisalemando_r
integer x = 87
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_oisalemando_r
integer x = 274
integer y = 292
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

type st_6 from statictext within w_oisalemando_r
integer x = 773
integer y = 308
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

type sle_value from singlelineedit within w_oisalemando_r
integer x = 1262
integer y = 300
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

type cb_1 from commandbutton within w_oisalemando_r
integer x = 1833
integer y = 300
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_5" then
	arg_dw  = dw_5
else
	arg_dw  = dw_6	
end if	

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oisalemando_r
integer x = 1998
integer y = 300
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_5" then
	arg_dw  = dw_5
else
	arg_dw  = dw_6	
end if	

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oisalemando_r
integer x = 2162
integer y = 300
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_5" then
	arg_dw  = dw_5
else
	arg_dw  = dw_6	
end if	

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oisalemando_r
integer x = 2327
integer y = 300
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_5" then
	arg_dw  = dw_5
else
	arg_dw  = dw_6	
end if	

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_oisalemando_r
integer x = 315
integer y = 304
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

type ddlb_op from dropdownlistbox within w_oisalemando_r
integer x = 942
integer y = 292
integer width = 302
integer height = 500
integer taborder = 180
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

