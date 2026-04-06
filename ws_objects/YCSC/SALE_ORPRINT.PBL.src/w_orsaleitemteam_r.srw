$PBExportHeader$w_orsaleitemteam_r.srw
$PBExportComments$팀별 물품별 수주현황(1998/05/13, 정재수)
forward
global type w_orsaleitemteam_r from w_inheritance
end type
type st_1 from statictext within w_orsaleitemteam_r
end type
type em_1 from editmask within w_orsaleitemteam_r
end type
type em_2 from editmask within w_orsaleitemteam_r
end type
type st_3 from statictext within w_orsaleitemteam_r
end type
type st_2 from statictext within w_orsaleitemteam_r
end type
type ddlb_1 from dropdownlistbox within w_orsaleitemteam_r
end type
end forward

global type w_orsaleitemteam_r from w_inheritance
integer y = 112
integer width = 4672
integer height = 2852
string title = "팀별 물품별 수주현황(w_orsaleitemteam_r)"
st_1 st_1
em_1 em_1
em_2 em_2
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
end type
global w_orsaleitemteam_r w_orsaleitemteam_r

type variables
string is_sale_flag, is_ret
end variables

on w_orsaleitemteam_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_1=create ddlb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.ddlb_1
end on

on w_orsaleitemteam_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_chk

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
ddlb_1.text = '전체'
is_sale_flag = 'A'

dw_2.visible = false
dw_1.sharedata(dw_2)
end event

event resize;call super::resize;dw_1.width  = this.width - 120
dw_1.height = this.height - 390


end event

type pb_save from w_inheritance`pb_save within w_orsaleitemteam_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleitemteam_r
integer x = 37
integer y = 264
integer width = 4571
integer height = 2460
integer taborder = 130
string dataobject = "d_orsaleitemteamrep_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleitemteam_r
integer x = 1678
integer y = 48
integer width = 78
integer height = 92
integer taborder = 0
string dataobject = "d_orsaleitemteamrep_r1"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_orsaleitemteam_r
integer y = 40
integer width = 1554
string text = "팀별 물품별 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_orsaleitemteam_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleitemteam_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaleitemteam_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_orsaleitemteam_r
integer x = 3365
integer taborder = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleitemteam_r
integer x = 3173
integer taborder = 50
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
	return
end if

//l_print.name = 'd_orsaleitemteamrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 제품별 수주현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleitemteam_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleitemteam_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleitemteam_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleitemteam_r
integer x = 2981
integer taborder = 40
end type

event pb_retrieve::clicked;date ld_start, ld_end
string ls_sale_flag[]
st_security lst_security

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
	ddlb_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(em_1.text)
ld_end = date(em_2.text)

if is_sale_flag = 'A' then
	ls_sale_flag[1] = 'D'
	ls_sale_flag[2] = 'L'
	ls_sale_flag[3] = 'E'
else
	ls_sale_flag[1] = is_sale_flag
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
		is_ret = '%'
	Case 'B'			
		string sec_userid
		sec_userid = gs_userid
		lst_security.s_title = st_title.text
		lst_security.s_userid = gs_userid		
		openwithparm(w_security,lst_security)
		sec_userid = Message.StringParm
		if sec_userid <> 'Y' then
			is_ret = gs_userid
		Else
			is_ret = '%'
		end if
	Case 'C'
		is_ret = gs_userid
End Choose
/*
	<!-- 소스추가끝 -->
*/	



dw_1.retrieve(ls_sale_flag, ld_start, ld_end, is_ret)

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_sale_flag1
	
		Choose case is_sale_flag
			Case 'A'
				ls_sale_flag1 = '전체'
			Case 'D'
				ls_sale_flag1 = '내수'
			Case 'L'
				ls_sale_flag1 = 'L/C'
			Case 'E'
				ls_sale_flag1 = '수출'
		End Choose			
	
		ls_userid = gs_userid
		ls_title = st_title.text
		ls_desc = '주문기간:' + string(ld_start) + '-' + string(ld_end) + ' 수주유형:' + ls_sale_flag1
		gf_log(ls_userid,ls_title,ls_desc)
End If		
//==========================================================================


	
end event

type gb_3 from w_inheritance`gb_3 within w_orsaleitemteam_r
integer x = 1801
integer y = 0
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleitemteam_r
integer x = 23
integer y = 224
integer width = 4599
integer height = 2520
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleitemteam_r
integer x = 2953
integer y = 8
integer width = 626
integer height = 216
integer taborder = 0
end type

type st_1 from statictext within w_orsaleitemteam_r
integer x = 1838
integer y = 52
integer width = 297
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "주문기간"
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsaleitemteam_r
integer x = 2139
integer y = 40
integer width = 357
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

type em_2 from editmask within w_orsaleitemteam_r
integer x = 2542
integer y = 40
integer width = 357
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

type st_3 from statictext within w_orsaleitemteam_r
integer x = 2496
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

type st_2 from statictext within w_orsaleitemteam_r
integer x = 1838
integer y = 140
integer width = 288
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "수주유형"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_orsaleitemteam_r
integer x = 2139
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

