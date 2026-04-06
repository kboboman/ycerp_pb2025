$PBExportHeader$w_oeestitem_r.srw
$PBExportComments$품목별 견적현황 (2001/05/25,이인호)
forward 
global type w_oeestitem_r from w_inheritance
end type
type rb_1 from radiobutton within w_oeestitem_r
end type
type rb_2 from radiobutton within w_oeestitem_r
end type
type st_1 from statictext within w_oeestitem_r
end type
type em_1 from editmask within w_oeestitem_r
end type
type em_2 from editmask within w_oeestitem_r
end type
type st_2 from statictext within w_oeestitem_r
end type
type st_3 from statictext within w_oeestitem_r
end type
type st_4 from statictext within w_oeestitem_r
end type
type ddlb_1 from dropdownlistbox within w_oeestitem_r
end type
type dw_3 from datawindow within w_oeestitem_r
end type
end forward

global type w_oeestitem_r from w_inheritance
integer y = 112
integer width = 3643
integer height = 2172
string title = "품목별 견적현황(w_oeestitem_r)"
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
global w_oeestitem_r w_oeestitem_r

type variables
string is_name, is_flag
end variables

on w_oeestitem_r.create
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

on w_oeestitem_r.destroy
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

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
dw_1.sharedata(dw_3)
dw_3.visible = false
ddlb_1.text = '전체'
end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_oeestitem_r
boolean visible = false
integer taborder = 110
end type

type dw_1 from w_inheritance`dw_1 within w_oeestitem_r
integer x = 32
integer y = 404
integer width = 3552
integer height = 1636
integer taborder = 0
string dataobject = "d_oeestitem_t"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oeestitem_r
integer width = 1467
string text = "품목별 견적현황"
end type

type st_tips from w_inheritance`st_tips within w_oeestitem_r
end type

type pb_compute from w_inheritance`pb_compute within w_oeestitem_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_oeestitem_r
boolean visible = false
integer taborder = 100
end type

type pb_close from w_inheritance`pb_close within w_oeestitem_r
integer x = 3365
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oeestitem_r
integer x = 3173
integer taborder = 80
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 견적현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oeestitem_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_oeestitem_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_oeestitem_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oeestitem_r
integer x = 2981
integer taborder = 70
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end
string ls_cust_no
st_security lst_security

ld_start = date(em_1.text)
ld_end = date(em_2.text)
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
	Case 'A', 'B'
		ls_level_userid = '%'
	Case 'C'
		ls_level_userid = gs_userid
End Choose
/*
	<!-- 소스추가끝 -->
*/	

if rb_1.checked = true then
	ls_cust_no = '%'
	is_flag = '%'
else
	ls_cust_no = trim(dw_2.getitemstring(1, "cust_no"))
	if ls_cust_no = '' or isnull(ls_cust_no) then
		ls_cust_no = "%"
	else
		ls_cust_no = "%" + trim(dw_2.getitemstring(1, "cust_no")) + "%"
	end if
end if
dw_1.retrieve(ld_start, ld_end, ls_cust_no, is_flag,ls_level_userid)

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
		ls_desc = '기간 : ' + string(ld_start) + ' ~ ' + string(ld_end) + '/ 거래처 : ' + ls_cust_no + '/ 조회'
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================

	
end event

type gb_3 from w_inheritance`gb_3 within w_oeestitem_r
integer x = 32
integer y = 224
integer width = 3552
integer height = 164
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oeestitem_r
integer x = 2597
integer y = 40
integer width = 238
integer height = 120
integer taborder = 0
integer textsize = -8
end type

type gb_1 from w_inheritance`gb_1 within w_oeestitem_r
integer x = 2953
integer width = 626
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_oeestitem_r
integer x = 2121
integer y = 280
integer width = 864
integer height = 92
boolean enabled = false
string dataobject = "d_oeestirep_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;is_name = this.object.cust_no[1]
end event

event dw_2::losefocus;this.accepttext()
end event

type rb_1 from radiobutton within w_oeestitem_r
integer x = 73
integer y = 288
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

type rb_2 from radiobutton within w_oeestitem_r
integer x = 375
integer y = 288
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

type st_1 from statictext within w_oeestitem_r
integer x = 677
integer y = 292
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

type em_1 from editmask within w_oeestitem_r
integer x = 997
integer y = 284
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

type em_2 from editmask within w_oeestitem_r
integer x = 1449
integer y = 284
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

type st_2 from statictext within w_oeestitem_r
integer x = 1874
integer y = 292
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
string text = "품목"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_oeestitem_r
integer x = 1399
integer y = 288
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

type st_4 from statictext within w_oeestitem_r
integer x = 3013
integer y = 292
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

type ddlb_1 from dropdownlistbox within w_oeestitem_r
integer x = 3195
integer y = 284
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
		is_flag = '%'
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

type dw_3 from datawindow within w_oeestitem_r
integer x = 1952
integer y = 72
integer width = 91
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_oeestitem_r"
boolean livescroll = true
end type

