$PBExportHeader$w_oicust_r.srw
$PBExportComments$거래처별 출고관리현황(E급)(2004/03/11, 정갑용)
forward
global type w_oicust_r from w_inheritance
end type
type em_1 from editmask within w_oicust_r
end type
type em_2 from editmask within w_oicust_r
end type
type st_1 from statictext within w_oicust_r
end type
type dw_area from datawindow within w_oicust_r
end type
type dw_3 from datawindow within w_oicust_r
end type
type cbx_1 from checkbox within w_oicust_r
end type
type cbx_2 from checkbox within w_oicust_r
end type
type gb_4 from gb_3 within w_oicust_r
end type
end forward

global type w_oicust_r from w_inheritance
integer y = 112
integer width = 3630
integer height = 2172
string title = "거래처별 출고(E급) 현황(w_oiscust_r)"
em_1 em_1
em_2 em_2
st_1 st_1
dw_area dw_area
dw_3 dw_3
cbx_1 cbx_1
cbx_2 cbx_2
gb_4 gb_4
end type
global w_oicust_r w_oicust_r

type variables

end variables

on w_oicust_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_area=create dw_area
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.cbx_2
this.Control[iCurrent+8]=this.gb_4
end on

on w_oicust_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.gb_4)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

st_security lst_security

this.x = 1
this.y = 1
string ls_chk
//select isnull(sale_price,'N') into :ls_chk from login
// where user_id = :gs_userid; 

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
		ls_chk = 'Y'
	Case 'B'			
		string sec_userid
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
	pb_retrieve.enabled = true
else
	pb_retrieve.enabled = false
end if

dw_area.settransobject(sqlca)
dw_1.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)

dw_2.visible = false
dw_1.ShareData(dw_2)

dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

end event

type pb_save from w_inheritance`pb_save within w_oicust_r
boolean visible = false
integer taborder = 40
end type

type dw_1 from w_inheritance`dw_1 within w_oicust_r
integer x = 809
integer y = 236
integer width = 2752
integer height = 1800
integer taborder = 60
string dataobject = "d_oicust_list_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_oicust_r
integer x = 1371
integer y = 8
integer width = 87
integer height = 76
integer taborder = 70
string dataobject = "d_oicust_list_r"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oicust_r
integer width = 1394
string text = "거래처별 출고(E급) 현황"
end type

type st_tips from w_inheritance`st_tips within w_oicust_r
end type

type pb_compute from w_inheritance`pb_compute within w_oicust_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_oicust_r
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_oicust_r
integer x = 3355
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicust_r
integer x = 3163
integer taborder = 90
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print

if dw_2.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 판매거래처별 출고관리현황(E급)을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=84'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_oicust_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_oicust_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_oicust_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oicust_r
integer x = 2971
integer taborder = 80
end type

event pb_retrieve::clicked;string ls_area, ls_null
date ld_start, ld_end

setnull(ls_null)

cbx_1.checked = false
cbx_2.checked = false

if em_1.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_area = dw_area.object.area[1]
ld_start = date(em_1.text)
ld_end = date(em_2.text)

dw_3.retrieve(ls_area, ld_start, ld_end)
dw_1.retrieve(ls_area, ld_start, ld_end)

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_area_name
		ls_userid = gs_userid
		ls_title = st_title.text
		select area_name into :ls_area_name from area where area_no = :ls_area;
		ls_desc = '사업장 : ' + ls_area + '/ 기간 : ' + string(ld_start) + ' ~ ' + string(ld_end) + '/ 조회'
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================

end event

type gb_3 from w_inheritance`gb_3 within w_oicust_r
integer x = 2075
integer y = 32
integer width = 827
integer height = 168
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "출고기간"
end type

type gb_2 from w_inheritance`gb_2 within w_oicust_r
integer x = 1467
integer y = 32
integer width = 590
integer height = 168
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "사업장"
end type

type gb_1 from w_inheritance`gb_1 within w_oicust_r
integer x = 2944
integer width = 622
integer taborder = 0
end type

type em_1 from editmask within w_oicust_r
integer x = 2098
integer y = 92
integer width = 357
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oicust_r
integer x = 2523
integer y = 96
integer width = 357
integer height = 80
integer taborder = 50
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
string displaydata = "himage"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oicust_r
integer x = 2455
integer y = 72
integer width = 64
integer height = 84
boolean bringtotop = true
integer textsize = -22
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oicust_r
integer x = 1518
integer y = 92
integer width = 489
integer height = 88
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type dw_3 from datawindow within w_oicust_r
integer x = 9
integer y = 324
integer width = 795
integer height = 1712
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oicust_list_s1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_area, ls_cust_no, ls_filter, ls_first
long ll_i
date ld_start, ld_end

if cbx_2.checked = false then
	ls_area = dw_area.object.area[1]
	ld_start = date(em_1.text)
	ld_end = date(em_2.text)
	
	if row < 1 then return
	dw_1.setredraw(false)
	
	if cbx_1.checked = false then 
		ls_cust_no = "'" + this.object.cust_no[row] + "'"
		ls_filter = " do_cust_no = " + ls_cust_no 
		
		dw_1.SetFilter(ls_filter)
		dw_1.Filter()
	else
		this.SelectRow(row, NOT this.IsSelected(row))
		SetNull(ls_cust_no)
		ls_first = 'Y'
	
		for ll_i = 1 to this.RowCount()
			if this.IsSelected(ll_i) = true then
				if ls_first = 'Y' then
					ls_cust_no = "'" + this.object.cust_no[ll_i] + "'"
				else
					ls_cust_no = ls_cust_no +" , '" + this.object.cust_no[ll_i] + "'"
				end if
				ls_first = 'N'
			end if
		next
	
		if ls_first = 'Y' then 
			ls_cust_no = "''"
		end if
	
		ls_filter = " do_cust_no in (" + ls_cust_no + ")"
		
		dw_1.SetFilter(ls_filter)
		dw_1.Filter()
	end if
	
	dw_1.groupcalc()
	dw_1.setredraw(true)
end if

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_area_name
	string ls_cust_name
		ls_userid = gs_userid
		ls_title = st_title.text
		select area_name into :ls_area_name from area where area_no = :ls_area;
		select cust_name into :ls_cust_name from customer where cust_no = :ls_cust_no;
		ls_desc = '사업장 : ' + ls_area_name + '/ 기간 : ' + string(ld_start) + ' ~ ' + string(ld_end) + '/ 거래처 : ' + ls_cust_name + '/ 조회'
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================
end event

event rowfocuschanged;//if cbx_2.checked = true then return
//if this.getrow() < 1 then return
//
//string ls_cust_no
//
//if cbx_1.checked = false then
//	dw_1.setredraw(false)
//	ls_cust_no = this.object.cust_no[currentrow]
//	dw_1.SetFilter(" do_cust_no = '" + ls_cust_no + "'")
//	dw_1.Filter( )
//
//	dw_1.groupcalc()
//	dw_1.setredraw(true)
//end if
end event

type cbx_1 from checkbox within w_oicust_r
integer x = 50
integer y = 252
integer width = 238
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
string text = "선택"
end type

event clicked;if cbx_2.checked = false then
	if this.checked = false then
		dw_3.SelectRow(0, false)
	end if
end if
end event

type cbx_2 from checkbox within w_oicust_r
integer x = 398
integer y = 252
integer width = 375
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
string text = "전체선택"
end type

event clicked;
long ll_row
string ls_cust_no, ls_filter

cbx_1.checked = false

for ll_row = 1 to dw_3.rowcount()
	dw_3.SelectRow(ll_row, this.checked)

	if dw_3.IsSelected(ll_row) = true then
		if ll_row = 1 then
			ls_cust_no = "'" + dw_3.object.cust_no[ll_row] + "'"
		else
			ls_cust_no = ls_cust_no +" , '" + dw_3.object.cust_no[ll_row] + "'"
		end if
	end if
next

if isnull(ls_cust_no) or ls_cust_no = "" then
	ls_cust_no = "''"
end if

ls_filter = " do_cust_no in (" + ls_cust_no + ")"

dw_1.SetFilter(ls_filter)
dw_1.Filter()
end event

type gb_4 from gb_3 within w_oicust_r
integer x = 14
integer y = 208
integer width = 791
integer height = 116
integer taborder = 60
string text = ""
end type

