$PBExportHeader$w_bdinfo_w_1.srw
$PBExportComments$공사정보조회조건[2000/12/08,서재복]
forward
global type w_bdinfo_w_1 from window
end type
type cb_2 from commandbutton within w_bdinfo_w_1
end type
type cb_1 from commandbutton within w_bdinfo_w_1
end type
type cbx_17 from checkbox within w_bdinfo_w_1
end type
type cbx_16 from checkbox within w_bdinfo_w_1
end type
type cbx_15 from checkbox within w_bdinfo_w_1
end type
type cbx_14 from checkbox within w_bdinfo_w_1
end type
type cbx_13 from checkbox within w_bdinfo_w_1
end type
type cbx_12 from checkbox within w_bdinfo_w_1
end type
type cbx_11 from checkbox within w_bdinfo_w_1
end type
type cbx_10 from checkbox within w_bdinfo_w_1
end type
type cbx_9 from checkbox within w_bdinfo_w_1
end type
type cbx_8 from checkbox within w_bdinfo_w_1
end type
type cbx_7 from checkbox within w_bdinfo_w_1
end type
type cbx_6 from checkbox within w_bdinfo_w_1
end type
type cbx_5 from checkbox within w_bdinfo_w_1
end type
type cbx_4 from checkbox within w_bdinfo_w_1
end type
type cbx_3 from checkbox within w_bdinfo_w_1
end type
type cbx_2 from checkbox within w_bdinfo_w_1
end type
type cbx_1 from checkbox within w_bdinfo_w_1
end type
type pb_2 from picturebutton within w_bdinfo_w_1
end type
type pb_1 from picturebutton within w_bdinfo_w_1
end type
type gb_1 from groupbox within w_bdinfo_w_1
end type
end forward

global type w_bdinfo_w_1 from window
integer x = 832
integer y = 360
integer width = 2990
integer height = 864
boolean titlebar = true
string title = "화면표시항목(w_bdinfo_w_1)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cb_2 cb_2
cb_1 cb_1
cbx_17 cbx_17
cbx_16 cbx_16
cbx_15 cbx_15
cbx_14 cbx_14
cbx_13 cbx_13
cbx_12 cbx_12
cbx_11 cbx_11
cbx_10 cbx_10
cbx_9 cbx_9
cbx_8 cbx_8
cbx_7 cbx_7
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_bdinfo_w_1 w_bdinfo_w_1

type variables
gs_custdo_str  ist_code
gst_bdwhere ist_where, ls_project
gs_boolean is_ble

end variables

on w_bdinfo_w_1.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cbx_17=create cbx_17
this.cbx_16=create cbx_16
this.cbx_15=create cbx_15
this.cbx_14=create cbx_14
this.cbx_13=create cbx_13
this.cbx_12=create cbx_12
this.cbx_11=create cbx_11
this.cbx_10=create cbx_10
this.cbx_9=create cbx_9
this.cbx_8=create cbx_8
this.cbx_7=create cbx_7
this.cbx_6=create cbx_6
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.cbx_17,&
this.cbx_16,&
this.cbx_15,&
this.cbx_14,&
this.cbx_13,&
this.cbx_12,&
this.cbx_11,&
this.cbx_10,&
this.cbx_9,&
this.cbx_8,&
this.cbx_7,&
this.cbx_6,&
this.cbx_5,&
this.cbx_4,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_bdinfo_w_1.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cbx_17)
destroy(this.cbx_16)
destroy(this.cbx_15)
destroy(this.cbx_14)
destroy(this.cbx_13)
destroy(this.cbx_12)
destroy(this.cbx_11)
destroy(this.cbx_10)
destroy(this.cbx_9)
destroy(this.cbx_8)
destroy(this.cbx_7)
destroy(this.cbx_6)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;is_ble = Message.PowerObjectParm
//cbx_1.checked = is_ble.ble1[1]
//cbx_2.checked = is_ble.ble1[2]
//cbx_3.checked = is_ble.ble1[3]
//cbx_4.checked = is_ble.ble1[4]
//cbx_5.checked = is_ble.ble1[5]
//cbx_6.checked = is_ble.ble1[6]
//cbx_7.checked = is_ble.ble1[7]
//cbx_8.checked = is_ble.ble1[8]
//cbx_9.checked = is_ble.ble1[9]
//cbx_10.checked = is_ble.ble1[10]
//cbx_11.checked = is_ble.ble1[11]
//cbx_12.checked = is_ble.ble1[12]
//cbx_13.checked = is_ble.ble1[13]
//cbx_14.checked = is_ble.ble1[14]
//cbx_15.checked = is_ble.ble1[15]
//cbx_16.checked = is_ble.ble1[16]
//cbx_17.checked = is_ble.ble1[17]

is_ble.ble1[1] = false
is_ble.ble1[2] = false
is_ble.ble1[3] = false
is_ble.ble1[4] = false
is_ble.ble1[5] = false
is_ble.ble1[6] = false
is_ble.ble1[7] = false
is_ble.ble1[8] = false
is_ble.ble1[9] = false
is_ble.ble1[10] = false
is_ble.ble1[11] = false
is_ble.ble1[12] = false
is_ble.ble1[13] = false
is_ble.ble1[14] = false
is_ble.ble1[15] = false
is_ble.ble1[16] = false
is_ble.ble1[17] = false
end event

type cb_2 from commandbutton within w_bdinfo_w_1
integer x = 535
integer y = 664
integer width = 302
integer height = 108
integer taborder = 210
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "전체취소"
end type

event clicked;cbx_1.checked = false
cbx_2.checked = false
cbx_3.checked = false
cbx_4.checked = false
cbx_5.checked = false
cbx_6.checked = false
cbx_7.checked = false
cbx_8.checked = false
cbx_9.checked = false
cbx_10.checked = false
cbx_11.checked = false
cbx_12.checked = false
cbx_13.checked = false
cbx_14.checked = false
cbx_15.checked = false
cbx_16.checked = false
cbx_17.checked = false
end event

type cb_1 from commandbutton within w_bdinfo_w_1
integer x = 128
integer y = 664
integer width = 302
integer height = 108
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "전체선택"
end type

event clicked;cbx_1.checked = true
cbx_2.checked = true
cbx_3.checked = true
cbx_4.checked = true
cbx_5.checked = true
cbx_6.checked = true
cbx_7.checked = true
cbx_8.checked = true
cbx_9.checked = true
cbx_10.checked = true
cbx_11.checked = true
cbx_12.checked = true
cbx_13.checked = true
cbx_14.checked = true
cbx_15.checked = true
cbx_16.checked = true
cbx_17.checked = true
end event

type cbx_17 from checkbox within w_bdinfo_w_1
integer x = 2231
integer y = 420
integer width = 617
integer height = 64
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "담당영업사원(유창)"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[17] = true
//else
//	is_ble.ble1[17] = false
//end if	
end event

type cbx_16 from checkbox within w_bdinfo_w_1
integer x = 2231
integer y = 324
integer width = 590
integer height = 64
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "하도업체"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[16] = true
//else
//	is_ble.ble1[16] = false
//end if	
end event

type cbx_15 from checkbox within w_bdinfo_w_1
integer x = 2231
integer y = 228
integer width = 590
integer height = 64
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "건축면적"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[15] = true
//else
//	is_ble.ble1[15] = false
//end if		
end event

type cbx_14 from checkbox within w_bdinfo_w_1
integer x = 2231
integer y = 132
integer width = 590
integer height = 64
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "설계사(설계회사)"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[14] = true
//else
//	is_ble.ble1[14] = false
//end if		
end event

type cbx_13 from checkbox within w_bdinfo_w_1
integer x = 1504
integer y = 420
integer width = 590
integer height = 64
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "담당자 연락처"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[13] = true
//else
//	is_ble.ble1[13] = false
//end if	
end event

type cbx_12 from checkbox within w_bdinfo_w_1
integer x = 1504
integer y = 324
integer width = 590
integer height = 64
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "진행상황"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[12] = true
//else
//	is_ble.ble1[12] = false
//end if	
end event

type cbx_11 from checkbox within w_bdinfo_w_1
integer x = 1504
integer y = 228
integer width = 590
integer height = 64
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "층수"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[11] = true
//else
//	is_ble.ble1[11] = false
//end if		
end event

type cbx_10 from checkbox within w_bdinfo_w_1
integer x = 1504
integer y = 132
integer width = 590
integer height = 64
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "발주처(건축주)"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[10] = true
//else
//	is_ble.ble1[10] = false
//end if	

end event

type cbx_9 from checkbox within w_bdinfo_w_1
integer x = 814
integer y = 420
integer width = 590
integer height = 64
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "하도업체 담당자"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[9] = true
//else
//	is_ble.ble1[9] = false
//end if		
end event

type cbx_8 from checkbox within w_bdinfo_w_1
integer x = 814
integer y = 324
integer width = 590
integer height = 64
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "준공일"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[8] = true
//else
//	is_ble.ble1[8] = false
//end if		
end event

type cbx_7 from checkbox within w_bdinfo_w_1
integer x = 814
integer y = 228
integer width = 590
integer height = 64
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "지역"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[7] = true
//else
//	is_ble.ble1[7] = false
//end if		
end event

type cbx_6 from checkbox within w_bdinfo_w_1
integer x = 814
integer y = 132
integer width = 590
integer height = 64
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "현장명(공사명)"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[6] = true
//else
//	is_ble.ble1[6] = false
//end if	
end event

type cbx_5 from checkbox within w_bdinfo_w_1
integer x = 137
integer y = 516
integer width = 590
integer height = 64
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "기타입력내용"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[5] = true
//else
//	is_ble.ble1[5] = false
//end if		
end event

type cbx_4 from checkbox within w_bdinfo_w_1
integer x = 137
integer y = 420
integer width = 590
integer height = 64
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "하도업체 진행상황"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[4] = true
//else
//	is_ble.ble1[4] = false
//end if		
end event

type cbx_3 from checkbox within w_bdinfo_w_1
integer x = 137
integer y = 324
integer width = 457
integer height = 64
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "착공일"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[3] = true
//else
//	is_ble.ble1[3] = false
//end if		
end event

type cbx_2 from checkbox within w_bdinfo_w_1
integer x = 137
integer y = 228
integer width = 457
integer height = 64
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "건설사"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[2] = true
//else
//	is_ble.ble1[2] = false
//end if		
end event

type cbx_1 from checkbox within w_bdinfo_w_1
integer x = 137
integer y = 132
integer width = 457
integer height = 64
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
string text = "최초등록일"
end type

event clicked;//if this.checked = true then
//	is_ble.ble1[1] = true
//else
//	is_ble.ble1[1] = false
//end if	
end event

type pb_2 from picturebutton within w_bdinfo_w_1
integer x = 2647
integer y = 664
integer width = 279
integer height = 108
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "취소"
boolean cancel = true
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;is_ble.okflag = false
closewithreturn(parent, is_ble)
end event

type pb_1 from picturebutton within w_bdinfo_w_1
integer x = 2336
integer y = 664
integer width = 265
integer height = 108
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인0.bmp"
alignment htextalign = right!
end type

event clicked;if cbx_1.checked = true then
	is_ble.ble1[1] = true
else
	is_ble.ble1[1] = false
end if	
if cbx_2.checked = true then
	is_ble.ble1[2] = true
else
	is_ble.ble1[2] = false
end if	
if cbx_3.checked = true then
	is_ble.ble1[3] = true
else
	is_ble.ble1[3] = false
end if	
if cbx_4.checked = true then
	is_ble.ble1[4] = true
else
	is_ble.ble1[4] = false
end if	
if cbx_5.checked = true then
	is_ble.ble1[5] = true
else
	is_ble.ble1[5] = false
end if	
if cbx_6.checked = true then
	is_ble.ble1[6] = true
else
	is_ble.ble1[6] = false
end if	
if cbx_7.checked = true then
	is_ble.ble1[7] = true
else
	is_ble.ble1[7] = false
end if	
if cbx_8.checked = true then
	is_ble.ble1[8] = true
else
	is_ble.ble1[8] = false
end if	
if cbx_9.checked = true then
	is_ble.ble1[9] = true
else
	is_ble.ble1[9] = false
end if	
if cbx_10.checked = true then
	is_ble.ble1[10] = true
else
	is_ble.ble1[10] = false
end if	
if cbx_11.checked = true then
	is_ble.ble1[11] = true
else
	is_ble.ble1[11] = false
end if	
if cbx_12.checked = true then
	is_ble.ble1[12] = true
else
	is_ble.ble1[12] = false
end if	
if cbx_13.checked = true then
	is_ble.ble1[13] = true
else
	is_ble.ble1[13] = false
end if	
if cbx_14.checked = true then
	is_ble.ble1[14] = true
else
	is_ble.ble1[14] = false
end if	
if cbx_15.checked = true then
	is_ble.ble1[15] = true
else
	is_ble.ble1[15] = false
end if	
if cbx_16.checked = true then
	is_ble.ble1[16] = true
else
	is_ble.ble1[16] = false
end if	
if cbx_17.checked = true then
	is_ble.ble1[17] = true
else
	is_ble.ble1[17] = false
end if	

is_ble.okflag = true
closewithreturn(parent, is_ble)

end event

type gb_1 from groupbox within w_bdinfo_w_1
integer x = 32
integer y = 28
integer width = 2894
integer height = 612
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 16711680
long backcolor = 79219928
string text = "화면 표시 항목"
end type

