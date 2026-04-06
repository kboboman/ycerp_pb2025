$PBExportHeader$w_ocaroivc_r.srw
$PBExportComments$수금현황(1998/05/12, 정재수)
forward
global type w_ocaroivc_r from w_inheritance
end type
type rb_1 from radiobutton within w_ocaroivc_r
end type
type rb_2 from radiobutton within w_ocaroivc_r
end type
type st_1 from statictext within w_ocaroivc_r
end type
type em_1 from editmask within w_ocaroivc_r
end type
type em_2 from editmask within w_ocaroivc_r
end type
type st_2 from statictext within w_ocaroivc_r
end type
type st_3 from statictext within w_ocaroivc_r
end type
type dw_3 from datawindow within w_ocaroivc_r
end type
type st_5 from statictext within w_ocaroivc_r
end type
end forward

global type w_ocaroivc_r from w_inheritance
integer y = 112
integer width = 4763
integer height = 2968
string title = "수금현황(w_ocaroivc_r)"
long backcolor = 79219928
rb_1 rb_1
rb_2 rb_2
st_1 st_1
em_1 em_1
em_2 em_2
st_2 st_2
st_3 st_3
dw_3 dw_3
st_5 st_5
end type
global w_ocaroivc_r w_ocaroivc_r

type variables
string is_dw1sql
end variables

on w_ocaroivc_r.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.st_3=create st_3
this.dw_3=create dw_3
this.st_5=create st_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.st_5
end on

on w_ocaroivc_r.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_3)
destroy(this.st_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.insertrow(0)
dw_3.visible = false
is_dw1sql = dw_1.describe("datawindow.table.select")
em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
//if gs_userid = '1999010s' or gs_userid = 'eom9734' then
//else
//	dw_1.object.login_user_name_a.visible = false
//	dw_1.object.login_user_name_b.visible = false
//end if
end event

event resize;call super::resize;//
gb_2.width  = this.width  - 118
gb_2.height = this.height - 508

dw_1.width  = this.width  - 187
dw_1.height = this.height - 592

end event

type pb_save from w_inheritance`pb_save within w_ocaroivc_r
boolean visible = false
integer taborder = 100
end type

type dw_1 from w_inheritance`dw_1 within w_ocaroivc_r
integer x = 55
integer y = 408
integer width = 4576
integer height = 2376
integer taborder = 0
string dataobject = "d_ocaroivcrep_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;if dwo.name = 'cust_no' or dwo.name = 'customer_cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.cust_no[row]
	lstr_where.name = this.object.customer_cust_name[row]
	openwithparm(w_whopeom_w, lstr_where)
end if
end event

type dw_2 from w_inheritance`dw_2 within w_ocaroivc_r
integer x = 2542
integer y = 260
integer width = 864
integer height = 92
boolean enabled = false
string dataobject = "d_ocaroivcrep_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::editchanged;call super::editchanged;datawindowchild ldwc_cust
string ls_data
long ll_found,ll_row
int li_line

this.getchild("cust_no", ldwc_cust)
ldwc_cust.settransobject(sqlca)

choose case dwo.name
	case 'cust_no'
		 ls_data = data + '%'
		 ll_row = ldwc_cust.RowCount( )
		 ll_found = ldwc_cust.Find("cust_name like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("cust_name.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 ldwc_cust.scrolltorow(ll_found)
end choose

RETURN 0
end event

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_ocaroivc_r
integer y = 40
string text = "수금현황"
end type

type st_tips from w_inheritance`st_tips within w_ocaroivc_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocaroivc_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocaroivc_r
boolean visible = false
integer taborder = 90
end type

type pb_close from w_inheritance`pb_close within w_ocaroivc_r
integer x = 3365
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroivc_r
integer x = 3173
integer taborder = 70
end type

event pb_print::clicked;w_repsuper  w_print
st_print    l_print
date        ld_start,   ld_end
string      ls_cust_no, ls_zoom
st_security lst_security

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if em_1.text = '' then
	messagebox("확인","수금기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","수금기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","수금기간을 잘못 입력하였습니다!",information!)
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
	dw_3.dataobject = 'd_ocaroivcrep_r1'	
	ls_zoom = '76'
	dw_3.settransobject(sqlca)
	dw_3.retrieve(ld_start, ld_end, ls_level_userid)
else
	ls_cust_no = dw_2.getitemstring(dw_2.getrow(), "cust_no")
	if ls_cust_no = '' or isnull(ls_cust_no) then
		messagebox("확인","거래처를 선택하세요!",information!)
		dw_3.setfocus()
		return
	end if

	dw_3.dataobject = 'd_ocaroivcrep_r2'
	ls_zoom = '86'
	dw_3.settransobject(sqlca)
	dw_3.retrieve(ls_cust_no, ld_start, ld_end, ls_level_userid)
end if

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_custname
		ls_userid = gs_userid
		ls_title = st_title.text
		If ls_cust_no = '' Then
			ls_desc = '기간 : ' + string(ld_start) + ' ~ ' + string(ld_end) + '/ 전체 출력'
		Else
			select cust_name into :ls_custname from customer where cust_no = :ls_cust_no;
			ls_desc = '기간 : ' + string(ld_start) + ' ~ ' + string(ld_end) + '/ 업체 : ' + ls_custname + '/ 출력'
		End If
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================

if dw_3.rowcount() < 1 then
	return
end if
dw_3.object.c_start[1] = string(ld_start, 'YYYY/MM/DD')
dw_3.object.c_end[1]   = string(ld_end, 'YYYY/MM/DD')

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 수금현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
						 'Datawindow.Zoom=' + ls_zoom

OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)





end event

type pb_cancel from w_inheritance`pb_cancel within w_ocaroivc_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ocaroivc_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ocaroivc_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocaroivc_r
integer x = 2981
integer taborder = 60
end type

event pb_retrieve::clicked;string ls_start, ls_end, ls_sql, ls_where, ls_cust_no
st_security lst_security

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


if em_1.text = '' then
	messagebox("확인","수금기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","수금기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","수금기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

ls_start = em_1.text
ls_end = em_2.text

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
		ls_where = " and aroivc.oi_date between ~~'" + ls_start + "~~' and ~~'" + ls_end + "~~'" + &
				  " and aroivc.delete_key = ~~'N~~' and customer.salesman like ~~'" + ls_level_userid + "~~'"
	ls_sql = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"
	dw_1.settransobject(sqlca)
	dw_1.modify(ls_sql)
	dw_1.retrieve()
else
	ls_cust_no = dw_2.getitemstring(dw_2.getrow(), "cust_no")
	if ls_cust_no = '' or isnull(ls_cust_no) then
		messagebox("확인","거래처를 선택하세요!",information!)
		dw_2.setfocus()
		return
	end if
	
	ls_where = " and aroivc.cust_no = ~~'" + ls_cust_no + "~~' and " + &
				  "aroivc.delete_key = ~~'N~~' and " + &
				  "aroivc.oi_date between ~~'" + ls_start + "~~' and " + &
				  "~~'" + ls_end + "~~' and customer.salesman like ~~'" + ls_level_userid + "~~' "
//				  " AND AROIVC.VC_NO <> ~~'20070129A013~~' " + &
//" UNION all "+ &
//" SELECT ~~'2007-02-09 00:00:00~~', ~~'20070209C001~~', ~~'R~~', ~~'C~~', ~~'원화      ~~', 388520.0000, NULL, ~~'~~', ~~'~~', NULL, NULL, ~~'벽산시공테크~~', NULL, ~~'JDS~~', NULL, ~~'K404~~' "

	ls_sql = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"

	dw_1.settransobject(sqlca)
	dw_1.modify(ls_sql)
	dw_1.retrieve()
end if

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_custname
		ls_userid = gs_userid
		ls_title = st_title.text
		If ls_cust_no = '' Then
			ls_desc = '기간 : ' + string(ls_start) + ' ~ ' + string(ls_end) + '/ 전체 조회'
		Else
			select cust_name into :ls_custname from customer where cust_no = :ls_cust_no;
			ls_desc = '기간 : ' + string(ls_start) + ' ~ ' + string(ls_end) + '/ 업체 : ' + ls_custname + '/  조회'
		End If
		gf_log(ls_userid,ls_title,ls_desc)
End If		
//=================================================================
	
end event

type gb_3 from w_inheritance`gb_3 within w_ocaroivc_r
integer x = 23
integer y = 220
integer width = 3557
integer height = 144
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroivc_r
integer x = 23
integer y = 352
integer width = 4645
integer height = 2460
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroivc_r
integer x = 2953
integer width = 626
integer taborder = 0
end type

type rb_1 from radiobutton within w_ocaroivc_r
integer x = 215
integer y = 268
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
dw_2.object.cust_no.background.color = 78682240

if dw_1.rowcount() > 0  then
	dw_1.reset()
end if
end event

type rb_2 from radiobutton within w_ocaroivc_r
integer x = 558
integer y = 268
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
dw_2.object.cust_no.background.color = 1087434968

if dw_1.rowcount() > 0  then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_ocaroivc_r
integer x = 923
integer y = 272
integer width = 334
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
string text = "수금기간"
boolean focusrectangle = false
end type

type em_1 from editmask within w_ocaroivc_r
integer x = 1266
integer y = 264
integer width = 398
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
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

type em_2 from editmask within w_ocaroivc_r
integer x = 1719
integer y = 264
integer width = 398
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -11
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

type st_2 from statictext within w_ocaroivc_r
integer x = 2263
integer y = 272
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

type st_3 from statictext within w_ocaroivc_r
integer x = 1669
integer y = 268
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

type dw_3 from datawindow within w_ocaroivc_r
string tag = "d_ocaroivcrep_r1"
integer x = 1614
integer y = 28
integer width = 160
integer height = 104
integer taborder = 110
boolean bringtotop = true
string title = "d_ocaroivcrep_r2"
string dataobject = "d_ocaroivcrep_r2"
boolean livescroll = true
end type

type st_5 from statictext within w_ocaroivc_r
integer x = 1632
integer y = 144
integer width = 1111
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
string text = "거래처 더블클릭시 현황조회됩니다."
boolean focusrectangle = false
end type

