$PBExportHeader$w_ocsale_custio_r.srw
$PBExportComments$거래처별 여신현황
forward 
global type w_ocsale_custio_r from w_inheritance
end type
type em_1 from editmask within w_ocsale_custio_r
end type
type ddlb_2 from dropdownlistbox within w_ocsale_custio_r
end type
type dw_4 from datawindow within w_ocsale_custio_r
end type
type em_2 from editmask within w_ocsale_custio_r
end type
type st_1 from statictext within w_ocsale_custio_r
end type
type st_2 from statictext within w_ocsale_custio_r
end type
type rb_1 from radiobutton within w_ocsale_custio_r
end type
type rb_2 from radiobutton within w_ocsale_custio_r
end type
type rb_3 from radiobutton within w_ocsale_custio_r
end type
type st_3 from statictext within w_ocsale_custio_r
end type
type rb_4 from radiobutton within w_ocsale_custio_r
end type
type rb_5 from radiobutton within w_ocsale_custio_r
end type
type rb_6 from radiobutton within w_ocsale_custio_r
end type
type rb_7 from radiobutton within w_ocsale_custio_r
end type
type rb_8 from radiobutton within w_ocsale_custio_r
end type
type st_4 from statictext within w_ocsale_custio_r
end type
type rb_9 from radiobutton within w_ocsale_custio_r
end type
end forward

global type w_ocsale_custio_r from w_inheritance
integer width = 4082
integer height = 2232
string title = "거래처 미수채권 현황(w_ocsalereceivable_r)"
em_1 em_1
ddlb_2 ddlb_2
dw_4 dw_4
em_2 em_2
st_1 st_1
st_2 st_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_3 st_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
rb_8 rb_8
st_4 st_4
rb_9 rb_9
end type
global w_ocsale_custio_r w_ocsale_custio_r

type variables
datawindowchild idwc_user
string is_level = '%', is_3mon = 'A'

end variables

on w_ocsale_custio_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.ddlb_2=create ddlb_2
this.dw_4=create dw_4
this.em_2=create em_2
this.st_1=create st_1
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_3=create st_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.rb_8=create rb_8
this.st_4=create st_4
this.rb_9=create rb_9
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.ddlb_2
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.rb_4
this.Control[iCurrent+12]=this.rb_5
this.Control[iCurrent+13]=this.rb_6
this.Control[iCurrent+14]=this.rb_7
this.Control[iCurrent+15]=this.rb_8
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.rb_9
end on

on w_ocsale_custio_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.ddlb_2)
destroy(this.dw_4)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.rb_8)
destroy(this.st_4)
destroy(this.rb_9)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_1.sharedata(dw_2)
dw_4.settransobject(sqlca)
dw_4.insertrow(1)
dw_4.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
dw_4.object.user[1] = '%'
idwc_user.accepttext()
em_1.text = string(today(),'yyyy/mm')
end event

event resize;call super::resize;//
dw_1.width  = this.width  - 141
dw_1.height = this.height - 524
end event

type pb_save from w_inheritance`pb_save within w_ocsale_custio_r
boolean visible = false
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_ocsale_custio_r
integer x = 50
integer y = 360
integer width = 3941
integer height = 1708
string dataobject = "d_ocsalereceivable_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ocsale_custio_r
integer x = 69
integer width = 1271
string text = "거래처별 여신현황"
end type

type st_tips from w_inheritance`st_tips within w_ocsale_custio_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocsale_custio_r
boolean visible = false
boolean enabled = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocsale_custio_r
boolean visible = false
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_ocsale_custio_r
integer x = 3776
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocsale_custio_r
integer x = 3584
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
string ls_level_userid

ls_level_userid = dw_4.object.user[1]
//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_bigyo
	string ls_username
		ls_userid = gs_userid
		ls_title = st_title.text
		If is_3mon = 'A' Then
			ls_bigyo = '전체'
		Else
			ls_bigyo = '3개월'
		End IF
		select user_name into :ls_username from login where user_id = :ls_level_userid;
		ls_desc = '기간 : ' + em_1.text + '/ 회전율 : ' + em_2.text + ' ' + ls_bigyo + '/ 등급 : ' + is_level + ' ' + ls_username +  '/ 출력'
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================

if dw_1.rowcount() < 1 then
	return
end if

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 거래처 미수채권 현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)




end event

type pb_cancel from w_inheritance`pb_cancel within w_ocsale_custio_r
boolean visible = false
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_ocsale_custio_r
boolean visible = false
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_ocsale_custio_r
boolean visible = false
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocsale_custio_r
integer x = 3392
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

st_security lst_security

string ls_level_userid
ls_level_userid = dw_4.object.user[1]
Choose Case gs_level
	Case 'A'
		If ls_level_userid = '%' Then
			ls_level_userid = '%'
		Else
			ls_level_userid = dw_4.object.user[1]
		End If
	Case 'B'			
		string sec_userid
		lst_security.s_title = st_title.text
		lst_security.s_userid = gs_userid		
		openwithparm(w_security,lst_security)
		sec_userid = Message.StringParm
		if sec_userid <> 'Y' then
			ls_level_userid = gs_userid
		Else
			If ls_level_userid = '%' Then
				ls_level_userid = '%'
			Else
				ls_level_userid = dw_4.object.user[1]
			End If
		end if
	Case 'C'
		ls_level_userid = gs_userid
End Choose


dw_1.setredraw(false)
dw_2.setredraw(false)
dw_1.retrieve(integer(LeftA(em_1.text,4)), integer(MidA(em_1.text,6,2)), is_level, &
					ls_level_userid, dec(em_2.text), is_3mon, integer(MidA(em_1.text,6,2)) - 1)
dw_2.setredraw(true)
dw_1.setredraw(true)

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_bigyo
	string ls_username

	ls_userid = gs_userid
	ls_title = st_title.text
	If is_3mon = 'A' Then
		ls_bigyo = '전체'
	Else
		ls_bigyo = '3개월'
	End IF
	
	select user_name into :ls_username from login where user_id = :ls_level_userid;
	ls_desc = '기간 : ' + em_1.text + '/ 회전율 : ' + em_2.text + ' ' + ls_bigyo + '/ 등급 : ' + is_level + ' ' + ls_username +  '/ 조회'
	gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================

end event

type gb_3 from w_inheritance`gb_3 within w_ocsale_custio_r
integer x = 50
integer y = 220
integer width = 3941
integer height = 124
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ocsale_custio_r
integer x = 1403
integer y = 12
integer width = 1618
integer height = 208
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocsale_custio_r
integer x = 3374
integer width = 617
end type

type dw_2 from w_inheritance`dw_2 within w_ocsale_custio_r
integer x = 3099
integer y = 52
integer width = 123
integer height = 96
string dataobject = "d_ocsalereceivable_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_ocsale_custio_r
integer x = 1426
integer y = 48
integer width = 320
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type ddlb_2 from dropdownlistbox within w_ocsale_custio_r
integer x = 1989
integer y = 44
integer width = 229
integer height = 752
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "전체"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","A","B","C","D","E","F","G","H","S","Z"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if index = 1 then
	is_level = '%'
else
	is_level = this.text
end if
end event

type dw_4 from datawindow within w_ocsale_custio_r
integer x = 2336
integer y = 48
integer width = 663
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type em_2 from editmask within w_ocsale_custio_r
integer x = 1650
integer y = 132
integer width = 247
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "3.00"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##.00"
end type

type st_1 from statictext within w_ocsale_custio_r
integer x = 1426
integer y = 144
integer width = 229
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "회전율:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ocsale_custio_r
integer x = 1902
integer y = 144
integer width = 293
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "개월이상"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_ocsale_custio_r
integer x = 2171
integer y = 140
integer width = 206
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;is_3mon = 'A'
end event

type rb_2 from radiobutton within w_ocsale_custio_r
integer x = 2382
integer y = 140
integer width = 626
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "3개월 수금/매출無"
end type

event clicked;is_3mon = '3'
end event

type rb_3 from radiobutton within w_ocsale_custio_r
integer x = 329
integer y = 264
integer width = 416
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처코드"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('cust_no')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type st_3 from statictext within w_ocsale_custio_r
integer x = 128
integer y = 260
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "정렬:"
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_ocsale_custio_r
integer x = 763
integer y = 264
integer width = 352
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처명"
boolean checked = true
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_5 from radiobutton within w_ocsale_custio_r
integer x = 1134
integer y = 264
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "등급"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('credit_level, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_6 from radiobutton within w_ocsale_custio_r
integer x = 1385
integer y = 264
integer width = 352
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "당월매출"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('inv_amt D, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_7 from radiobutton within w_ocsale_custio_r
integer x = 1755
integer y = 264
integer width = 416
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "당월말미수"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('inv_rem D, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_8 from radiobutton within w_ocsale_custio_r
integer x = 2190
integer y = 264
integer width = 311
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "회전율"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('invrate, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type st_4 from statictext within w_ocsale_custio_r
integer x = 1819
integer y = 60
integer width = 169
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "등급:"
boolean focusrectangle = false
end type

type rb_9 from radiobutton within w_ocsale_custio_r
integer x = 2519
integer y = 264
integer width = 311
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "담당"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('salesman, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

