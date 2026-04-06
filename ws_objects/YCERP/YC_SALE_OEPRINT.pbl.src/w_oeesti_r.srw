$PBExportHeader$w_oeesti_r.srw
$PBExportComments$거래처별 견적현황 (1998/05/09, 정재수)
forward 
global type w_oeesti_r from w_inheritance
end type
type rb_1 from radiobutton within w_oeesti_r
end type
type rb_2 from radiobutton within w_oeesti_r
end type
type st_1 from statictext within w_oeesti_r
end type
type em_1 from editmask within w_oeesti_r
end type
type em_2 from editmask within w_oeesti_r
end type
type st_2 from statictext within w_oeesti_r
end type
type st_3 from statictext within w_oeesti_r
end type
type st_4 from statictext within w_oeesti_r
end type
type ddlb_1 from dropdownlistbox within w_oeesti_r
end type
type dw_3 from datawindow within w_oeesti_r
end type
end forward

global type w_oeesti_r from w_inheritance
integer y = 112
integer width = 3643
integer height = 2172
string title = "거래처별 견적현황(w_oeesti_r)"
rb_1 rb_1
rb_2 rb_2
st_1 st_1
em_1 em_1
em_2 em_2
st_2 st_2
st_3 st_3
st_4 st_4
ddlb_1 ddlb_1
dw_3 dw_3
end type
global w_oeesti_r w_oeesti_r

type variables
string is_dw1sql, is_flag
end variables

on w_oeesti_r.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_1=create ddlb_1
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_1
this.Control[iCurrent+10]=this.dw_3
end on

on w_oeesti_r.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_1)
destroy(this.dw_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

gb_2.visible = false

dw_2.insertrow(0)

is_dw1sql = dw_1.describe("datawindow.table.select")
em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
dw_3.visible = false
end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_oeesti_r
boolean visible = false
integer taborder = 110
end type

type dw_1 from w_inheritance`dw_1 within w_oeesti_r
integer x = 32
integer y = 404
integer width = 3552
integer height = 1636
integer taborder = 0
string dataobject = "d_oeesti_r"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oeesti_r
integer y = 32
integer width = 1225
string text = "거래처별 견적현황"
end type

type st_tips from w_inheritance`st_tips within w_oeesti_r
end type

type pb_compute from w_inheritance`pb_compute within w_oeesti_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_oeesti_r
boolean visible = false
integer taborder = 100
end type

type pb_close from w_inheritance`pb_close within w_oeesti_r
integer x = 3365
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oeesti_r
integer x = 3173
integer taborder = 80
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no
st_security lst_security

if em_1.text = '' then
	messagebox("확인","견적기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","견적기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","견적기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

/*
	2006.06.14
	권한2등급인자 보안카드적용
	19981214  조형섭
	20000302  전순미
	berrygrl      김원규			
	<!-- 소스추가시작 -->						
*/		
string ls_level_userid
Choose Case gs_level
	Case 'A'
		ls_level_userid = '%'
	Case 'B'			
		string sec_userid
		lst_security.s_title = st_title.text
		lst_security.s_userid = gs_userid		
		openwithparm(w_security,lst_security)
		sec_userid = Message.StringParm
		if sec_userid <> 'Y' then
			ls_level_userid = gs_userid
		Else
			ls_level_userid = '%'
		end if
	Case 'C'
		ls_level_userid = gs_userid
End Choose
/*
	<!-- 소스추가끝 -->
*/	

ld_start = date(em_1.text)
ld_end = date(em_2.text)

if rb_1.checked = true then
	dw_3.dataobject = 'd_oeesti_r1'	
	dw_3.settransobject(sqlca)
	dw_3.retrieve(ld_start, ld_end,ls_level_userid)
else
	ls_cust_no = dw_2.getitemstring(dw_2.getrow(), "cust_no")
	if ls_cust_no = '' or isnull(ls_cust_no) then
		messagebox("확인","거래처를 선택하세요!",information!)
		dw_3.setfocus()
		return
	elseif is_flag = '' or isnull(is_flag) then
		messagebox("확인","상태를 선택하세요!",information!)
		ddlb_1.setfocus()
		return
	end if
	
	if is_flag = 'A' then
		dw_3.dataobject = 'd_oeesti_r2'
		dw_3.settransobject(sqlca)
		dw_3.retrieve(ls_cust_no, ld_start, ld_end,ls_level_userid)
	else	
		dw_3.dataobject = 'd_oeesti_r3'
		dw_3.settransobject(sqlca)
		dw_3.retrieve(ls_cust_no, is_flag, ld_start, ld_end,ls_level_userid)
	end if
end if

if dw_3.rowcount() < 1 then
	return
end if

dw_3.object.c_start[1] = string(ld_start, 'YYYY/MM/DD')
dw_3.object.c_end[1] = string(ld_end, 'YYYY/MM/DD')

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 견적현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	If ls_cust_no = '%' Then
		ls_cust_no = '전체'
	Else	
		select cust_name into :ls_cust_no from customer where cust_no = :ls_cust_no;
	End if
		ls_userid = gs_userid
		ls_title = st_title.text
		ls_desc = '기간 : ' + string(ld_start) + ' ~ ' + string(ld_end) + '/ 거래처 : ' + ls_cust_no + '/ 출력'
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================


end event

type pb_cancel from w_inheritance`pb_cancel within w_oeesti_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_oeesti_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_oeesti_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oeesti_r
integer x = 2981
integer taborder = 70
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_start, ls_end, ls_sql, ls_where, ls_cust_no
st_security lst_security

if em_1.text = '' then
	messagebox("확인","견적기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","견적기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","견적기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

ls_start = em_1.text
ls_end = em_2.text
dw_2.accepttext()

/*
	2006.06.14
	권한2등급인자 보안카드적용
	19981214  조형섭
	20000302  전순미
	berrygrl      김원규			
	<!-- 소스추가시작 -->						
*/		
string ls_level_userid
Choose Case gs_level
	Case 'A'
		ls_level_userid = '%'
	Case 'B'			
		string sec_userid
		lst_security.s_title = st_title.text
		lst_security.s_userid = gs_userid		
		openwithparm(w_security,lst_security)
		sec_userid = Message.StringParm
		if sec_userid <> 'Y' then
			ls_level_userid = gs_userid
		Else
			ls_level_userid = '%'
		end if
	Case 'C'
		ls_level_userid = gs_userid
End Choose
/*
	<!-- 소스추가끝 -->
*/	

if rb_1.checked = true then
	ls_where = " and estimate_head.estimate_date between ~~'" + ls_start + "~~' and " + &
				  "~~'" + ls_end + "~~' and estimate_head.user_id like ~~'" + ls_level_userid + "~~'"
	ls_sql = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"
	
	dw_1.settransobject(sqlca)
	dw_1.modify(ls_sql)
	dw_1.retrieve()
else
	ls_cust_no = "%" + trim(dw_2.getitemstring(1, "cust_no")) + "%"
	if ls_cust_no = '' or isnull(ls_cust_no) then
		messagebox("확인","거래처를 선택하세요!",information!)
		dw_2.setfocus()
		return
	elseif is_flag = '' or isnull(is_flag) then
		messagebox("확인","상태를 선택하세요!",information!)
		ddlb_1.setfocus()
		return
	end if
	
	if is_flag = 'A' then
		ls_where = " and estimate_head.cust_name like ~~'" + ls_cust_no + "~~' and " + &
					  "estimate_head.estimate_date between ~~'" + ls_start + "~~' and " + &
					  "~~'" + ls_end + "~~' and estimate_head.user_id like ~~'" + ls_level_userid + "~~'"
		ls_sql = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"
		
		dw_1.settransobject(sqlca)
		dw_1.modify(ls_sql)
		dw_1.retrieve()
	else	
		ls_where = " and estimate_head.cust_name like ~~'" + ls_cust_no + "~~' and " + &
					  "estimate_head.esti_flag = ~~'" + is_flag + "~~' and " + &	
					  "estimate_head.estimate_date between ~~'" + ls_start + "~~' and " + &
					  "~~'" + ls_end + "~~' and estimate_head.user_id like ~~'" + ls_level_userid + "~~'"
		ls_sql = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"
		
		dw_1.settransobject(sqlca)
		dw_1.modify(ls_sql)
		dw_1.retrieve()
	end if
end if

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	If ls_cust_no = '%' Then
		ls_cust_no = '전체'
	Else	
		select cust_name into :ls_cust_no from customer where cust_no = :ls_cust_no;
	End if
		ls_userid = gs_userid
		ls_title = st_title.text
		ls_desc = '기간 : ' + ls_start + ' ~ ' + ls_end + '/ 거래처 : ' + ls_cust_no + '/ 조회'
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================
	
end event

type gb_3 from w_inheritance`gb_3 within w_oeesti_r
integer x = 32
integer y = 224
integer width = 3552
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oeesti_r
integer x = 2601
integer y = 32
integer width = 233
integer height = 144
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oeesti_r
integer x = 2953
integer width = 626
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oeesti_r
integer x = 2121
integer y = 276
integer width = 864
integer height = 92
boolean enabled = false
string dataobject = "d_oeestirep_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type rb_1 from radiobutton within w_oeesti_r
integer x = 73
integer y = 284
integer width = 256
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;dw_2.enabled = false
ddlb_1.enabled = false

dw_2.object.cust_no.background.color = 78682240
ddlb_1.backcolor = 78682240

if dw_1.rowcount() > 0  then
	dw_1.reset()
end if
end event

type rb_2 from radiobutton within w_oeesti_r
integer x = 375
integer y = 284
integer width = 283
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "부분"
end type

event clicked;dw_2.enabled = true
ddlb_1.enabled = true

dw_2.object.cust_no.background.color = 1087434968
ddlb_1.backcolor = 1087434968

if dw_1.rowcount() > 0  then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_oeesti_r
integer x = 677
integer y = 288
integer width = 320
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "견적기간"
boolean focusrectangle = false
end type

type em_1 from editmask within w_oeesti_r
integer x = 997
integer y = 280
integer width = 398
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

type em_2 from editmask within w_oeesti_r
integer x = 1449
integer y = 280
integer width = 398
integer height = 80
integer taborder = 40
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

type st_2 from statictext within w_oeesti_r
integer x = 1874
integer y = 288
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "거래처"
boolean focusrectangle = false
end type

type st_3 from statictext within w_oeesti_r
integer x = 1399
integer y = 284
integer width = 41
integer height = 76
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

type st_4 from statictext within w_oeesti_r
integer x = 3013
integer y = 288
integer width = 160
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "상태"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_oeesti_r
integer x = 3195
integer y = 280
integer width = 338
integer height = 432
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","완결","미결","보류"}
end type

event selectionchanged;choose case index
	case 1
		is_flag = 'A'
	case 2
		is_flag = 'Y'
	case 3 
		is_flag = 'N'
	case 4
		is_flag = 'B'
end choose

if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type dw_3 from datawindow within w_oeesti_r
integer x = 1957
integer y = 72
integer width = 91
integer height = 72
integer taborder = 111
boolean bringtotop = true
string dataobject = "d_oeesti_r1"
boolean livescroll = true
end type

