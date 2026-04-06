$PBExportHeader$w_oisalemando_r2.srw
$PBExportComments$영업사원별 출고현황(출고번호별)
forward 
global type w_oisalemando_r2 from w_inheritance
end type
type st_1 from statictext within w_oisalemando_r2
end type
type em_1 from editmask within w_oisalemando_r2
end type
type em_2 from editmask within w_oisalemando_r2
end type
type st_3 from statictext within w_oisalemando_r2
end type
type st_2 from statictext within w_oisalemando_r2
end type
type ddlb_1 from dropdownlistbox within w_oisalemando_r2
end type
type dw_3 from datawindow within w_oisalemando_r2
end type
type dw_4 from datawindow within w_oisalemando_r2
end type
type st_4 from statictext within w_oisalemando_r2
end type
type cbx_1 from checkbox within w_oisalemando_r2
end type
end forward

global type w_oisalemando_r2 from w_inheritance
integer y = 112
integer width = 4791
integer height = 2912
string title = "영업사원별 출고현황(w_oisalemando_r2)"
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
end type
global w_oisalemando_r2 w_oisalemando_r2

type variables
string is_sale_flag
string ls_saleman, is_ret
datawindowchild idwc_area, idwc_user
end variables

on w_oisalemando_r2.create
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
end on

on w_oisalemando_r2.destroy
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
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_3.insertrow(1)
string ls_chk
st_security lst_security
string ls_level_userid

Choose Case gs_level
	Case 'A'
		ls_chk = 'Y'
	Case 'B'			
		string sec_userid
		sec_userid = gs_userid
		lst_security.s_title = st_title.text
		lst_security.s_userid = gs_userid		
		openwithparm(w_security,lst_security)
		sec_userid = Message.StringParm
		if sec_userid <> 'Y' then
			ls_chk = 'N'
		Else
			ls_chk = 'Y'
		end if
	Case 'C'
		ls_chk = 'N'
End Choose
/*
	<!-- 소스추가끝 -->
*/	



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
string ls_area

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
dw_2.visible = false
dw_1.sharedata(dw_2)

//갑용추가
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

is_sale_flag = 'A'
ddlb_1.text = '전체'

end event

type pb_save from w_inheritance`pb_save within w_oisalemando_r2
boolean visible = false
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_oisalemando_r2
integer x = 55
integer y = 264
integer width = 4608
integer height = 2516
integer taborder = 150
string dataobject = "d_oisaledo_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oisalemando_r2
integer x = 41
integer y = 44
integer width = 1806
string text = "영업사원별 출고현황(출고번호)"
end type

type st_tips from w_inheritance`st_tips within w_oisalemando_r2
end type

type pb_compute from w_inheritance`pb_compute within w_oisalemando_r2
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_oisalemando_r2
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_oisalemando_r2
integer x = 4466
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oisalemando_r2
integer x = 4274
integer taborder = 60
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//l_print.name = 'd_oisaledorep_r'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원별 출고현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_oisalemando_r2
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oisalemando_r2
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oisalemando_r2
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oisalemando_r2
integer x = 4082
integer taborder = 40
end type

event pb_retrieve::clicked;date ld_start, ld_end
string ls_saleflags[], ls_area, ls_team, ls_start, ls_end, ls_salesman

dw_3.AcceptText()
if em_1.text = '' then
	messagebox("확인","납기일자를 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","납기일자를 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","납기일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
elseif is_sale_flag = '' or isnull(is_sale_flag) then
	messagebox("확인","수주유형을 입력하세요!",information!)
	ddlb_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

dw_1.reset()
if is_sale_flag = 'A' then
	ls_saleflags[1] = 'D'
	ls_saleflags[2] = 'L'
	ls_saleflags[3] = 'E'
else
	ls_saleflags[1] = TRIM(is_sale_flag)
end if
// 각 팀장들..
ls_team =  is_ret
if cbx_1.checked = true  then
	long ll_cnt, ll_chk
	ll_cnt = 0
	select count(*) into :ll_cnt from team
	 where parent_code = '70000'
		and team_manager = :gs_userid;
	if ll_cnt > 0  then
		ls_team =  'T'
		ls_salesman = gs_userid
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

ls_area = dw_4.object.area[1]
dw_1.retrieve(ls_saleflags, ls_start, ls_end, ls_salesman, ls_area, ls_team)

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_saleflag
	string ls_areaname
	string ls_name
		If ls_area = '%' Then
			ls_areaname = '전체'
		Else
			select area_name into :ls_areaname from area where area_no = :ls_area;
		End If
		If ls_saleman = '%' Then
			ls_name = '전체'
		Else			
			select user_name into :ls_name from login where user_id = :ls_saleman;
		End If
		Choose Case is_sale_flag
			Case 'A'
				ls_saleflag = '전체'
			Case 'D'
				ls_saleflag = '내수'
			Case 'L'
				ls_saleflag = 'L/C'
			Case 'E'
				ls_saleflag = '수출'
		End Choose

		ls_userid = gs_userid
		ls_title = st_title.text
		ls_desc = '사업장:' + ls_areaname + ' 출고기간:' + string(ld_start) + '-' + string(ld_end) + ' 수주유형:' + ls_saleflag + ' 팀:' + ls_name + ' 조회'
		gf_log(ls_userid,ls_title,ls_desc)
End If		
//==========================================================================


end event

type gb_3 from w_inheritance`gb_3 within w_oisalemando_r2
integer x = 1915
integer y = 0
integer width = 2121
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oisalemando_r2
integer x = 37
integer y = 224
integer width = 4649
integer height = 2568
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oisalemando_r2
integer x = 4055
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_oisalemando_r2
integer x = 1102
integer y = 0
integer width = 133
integer height = 88
integer taborder = 0
boolean enabled = false
string dataobject = "d_oisaledorep_r2"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_oisalemando_r2
integer x = 2473
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

type em_1 from editmask within w_oisalemando_r2
integer x = 2747
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

type em_2 from editmask within w_oisalemando_r2
integer x = 3259
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

type st_3 from statictext within w_oisalemando_r2
integer x = 3177
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

type st_2 from statictext within w_oisalemando_r2
integer x = 2473
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

type ddlb_1 from dropdownlistbox within w_oisalemando_r2
integer x = 2747
integer y = 124
integer width = 357
integer height = 384
integer taborder = 30
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

type dw_3 from datawindow within w_oisalemando_r2
integer x = 3118
integer y = 128
integer width = 681
integer height = 84
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type dw_4 from datawindow within w_oisalemando_r2
integer x = 1943
integer y = 128
integer width = 526
integer height = 80
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event losefocus;this.AcceptText()
end event

type st_4 from statictext within w_oisalemando_r2
integer x = 1943
integer y = 56
integer width = 526
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
string text = "사 업 장"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_oisalemando_r2
integer x = 3826
integer y = 136
integer width = 133
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

