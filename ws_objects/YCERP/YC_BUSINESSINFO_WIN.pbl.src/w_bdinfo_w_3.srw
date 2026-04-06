$PBExportHeader$w_bdinfo_w_3.srw
$PBExportComments$공사정보조회조건[2000/12/08,서재복]
forward
global type w_bdinfo_w_3 from window
end type
type sle_17 from singlelineedit within w_bdinfo_w_3
end type
type sle_16 from singlelineedit within w_bdinfo_w_3
end type
type sle_15 from singlelineedit within w_bdinfo_w_3
end type
type sle_14 from singlelineedit within w_bdinfo_w_3
end type
type sle_13 from singlelineedit within w_bdinfo_w_3
end type
type sle_12 from singlelineedit within w_bdinfo_w_3
end type
type sle_11 from singlelineedit within w_bdinfo_w_3
end type
type sle_10 from singlelineedit within w_bdinfo_w_3
end type
type sle_9 from singlelineedit within w_bdinfo_w_3
end type
type sle_8 from singlelineedit within w_bdinfo_w_3
end type
type sle_7 from singlelineedit within w_bdinfo_w_3
end type
type sle_6 from singlelineedit within w_bdinfo_w_3
end type
type sle_5 from singlelineedit within w_bdinfo_w_3
end type
type sle_4 from singlelineedit within w_bdinfo_w_3
end type
type sle_3 from singlelineedit within w_bdinfo_w_3
end type
type sle_2 from singlelineedit within w_bdinfo_w_3
end type
type sle_1 from singlelineedit within w_bdinfo_w_3
end type
type cbx_16 from checkbox within w_bdinfo_w_3
end type
type cbx_12 from checkbox within w_bdinfo_w_3
end type
type cbx_8 from checkbox within w_bdinfo_w_3
end type
type cbx_4 from checkbox within w_bdinfo_w_3
end type
type cbx_15 from checkbox within w_bdinfo_w_3
end type
type cbx_11 from checkbox within w_bdinfo_w_3
end type
type cbx_7 from checkbox within w_bdinfo_w_3
end type
type cbx_3 from checkbox within w_bdinfo_w_3
end type
type cbx_14 from checkbox within w_bdinfo_w_3
end type
type cbx_10 from checkbox within w_bdinfo_w_3
end type
type cbx_6 from checkbox within w_bdinfo_w_3
end type
type cbx_2 from checkbox within w_bdinfo_w_3
end type
type cbx_17 from checkbox within w_bdinfo_w_3
end type
type cbx_13 from checkbox within w_bdinfo_w_3
end type
type cbx_9 from checkbox within w_bdinfo_w_3
end type
type cbx_5 from checkbox within w_bdinfo_w_3
end type
type cbx_1 from checkbox within w_bdinfo_w_3
end type
type pb_2 from picturebutton within w_bdinfo_w_3
end type
type pb_1 from picturebutton within w_bdinfo_w_3
end type
type gb_1 from groupbox within w_bdinfo_w_3
end type
end forward

global type w_bdinfo_w_3 from window
integer x = 832
integer y = 360
integer width = 1454
integer height = 1964
boolean titlebar = true
string title = "검색(세부조건)(w_bdinfo_w_3)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
sle_17 sle_17
sle_16 sle_16
sle_15 sle_15
sle_14 sle_14
sle_13 sle_13
sle_12 sle_12
sle_11 sle_11
sle_10 sle_10
sle_9 sle_9
sle_8 sle_8
sle_7 sle_7
sle_6 sle_6
sle_5 sle_5
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
cbx_16 cbx_16
cbx_12 cbx_12
cbx_8 cbx_8
cbx_4 cbx_4
cbx_15 cbx_15
cbx_11 cbx_11
cbx_7 cbx_7
cbx_3 cbx_3
cbx_14 cbx_14
cbx_10 cbx_10
cbx_6 cbx_6
cbx_2 cbx_2
cbx_17 cbx_17
cbx_13 cbx_13
cbx_9 cbx_9
cbx_5 cbx_5
cbx_1 cbx_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_bdinfo_w_3 w_bdinfo_w_3

type variables
gs_custdo_str  ist_code
gst_bdwhere ist_where, ls_project
gs_boolean is_ble

end variables

on w_bdinfo_w_3.create
this.sle_17=create sle_17
this.sle_16=create sle_16
this.sle_15=create sle_15
this.sle_14=create sle_14
this.sle_13=create sle_13
this.sle_12=create sle_12
this.sle_11=create sle_11
this.sle_10=create sle_10
this.sle_9=create sle_9
this.sle_8=create sle_8
this.sle_7=create sle_7
this.sle_6=create sle_6
this.sle_5=create sle_5
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cbx_16=create cbx_16
this.cbx_12=create cbx_12
this.cbx_8=create cbx_8
this.cbx_4=create cbx_4
this.cbx_15=create cbx_15
this.cbx_11=create cbx_11
this.cbx_7=create cbx_7
this.cbx_3=create cbx_3
this.cbx_14=create cbx_14
this.cbx_10=create cbx_10
this.cbx_6=create cbx_6
this.cbx_2=create cbx_2
this.cbx_17=create cbx_17
this.cbx_13=create cbx_13
this.cbx_9=create cbx_9
this.cbx_5=create cbx_5
this.cbx_1=create cbx_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.sle_17,&
this.sle_16,&
this.sle_15,&
this.sle_14,&
this.sle_13,&
this.sle_12,&
this.sle_11,&
this.sle_10,&
this.sle_9,&
this.sle_8,&
this.sle_7,&
this.sle_6,&
this.sle_5,&
this.sle_4,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.cbx_16,&
this.cbx_12,&
this.cbx_8,&
this.cbx_4,&
this.cbx_15,&
this.cbx_11,&
this.cbx_7,&
this.cbx_3,&
this.cbx_14,&
this.cbx_10,&
this.cbx_6,&
this.cbx_2,&
this.cbx_17,&
this.cbx_13,&
this.cbx_9,&
this.cbx_5,&
this.cbx_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_bdinfo_w_3.destroy
destroy(this.sle_17)
destroy(this.sle_16)
destroy(this.sle_15)
destroy(this.sle_14)
destroy(this.sle_13)
destroy(this.sle_12)
destroy(this.sle_11)
destroy(this.sle_10)
destroy(this.sle_9)
destroy(this.sle_8)
destroy(this.sle_7)
destroy(this.sle_6)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cbx_16)
destroy(this.cbx_12)
destroy(this.cbx_8)
destroy(this.cbx_4)
destroy(this.cbx_15)
destroy(this.cbx_11)
destroy(this.cbx_7)
destroy(this.cbx_3)
destroy(this.cbx_14)
destroy(this.cbx_10)
destroy(this.cbx_6)
destroy(this.cbx_2)
destroy(this.cbx_17)
destroy(this.cbx_13)
destroy(this.cbx_9)
destroy(this.cbx_5)
destroy(this.cbx_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;is_ble = Message.PowerObjectParm
cbx_1.checked = false
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

//is_ble.ble1[1] = false
//is_ble.ble1[2] = false
//is_ble.ble1[3] = false
//is_ble.ble1[4] = false
//is_ble.ble1[5] = false
//is_ble.ble1[6] = false
//is_ble.ble1[7] = false
//is_ble.ble1[8] = false
//is_ble.ble1[9] = false
//is_ble.ble1[10] = false
//is_ble.ble1[11] = false
//is_ble.ble1[12] = false
//is_ble.ble1[13] = false
//is_ble.ble1[14] = false
//is_ble.ble1[15] = false
//is_ble.ble1[16] = false
//is_ble.ble1[17] = false

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
end event

type sle_17 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 1580
integer width = 457
integer height = 76
integer taborder = 340
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_16 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 1488
integer width = 457
integer height = 76
integer taborder = 320
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_15 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 1396
integer width = 457
integer height = 76
integer taborder = 300
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_14 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 1304
integer width = 457
integer height = 76
integer taborder = 280
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_13 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 1212
integer width = 457
integer height = 76
integer taborder = 260
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_12 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 1120
integer width = 457
integer height = 76
integer taborder = 240
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_11 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 1028
integer width = 457
integer height = 76
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_10 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 936
integer width = 457
integer height = 76
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_9 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 844
integer width = 457
integer height = 76
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_8 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 752
integer width = 457
integer height = 76
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_7 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 660
integer width = 457
integer height = 76
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_6 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 568
integer width = 457
integer height = 76
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_5 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 476
integer width = 457
integer height = 76
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_4 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 384
integer width = 457
integer height = 76
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_3 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 292
integer width = 457
integer height = 76
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 200
integer width = 457
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_bdinfo_w_3
integer x = 846
integer y = 108
integer width = 457
integer height = 76
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type cbx_16 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 1512
integer width = 617
integer height = 64
integer taborder = 310
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

event clicked;if this.checked = true then
	sle_16.enabled = true
else
	sle_16.enabled = false
end if
end event

type cbx_12 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 1144
integer width = 590
integer height = 64
integer taborder = 230
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

event clicked;if this.checked = true then
	sle_12.enabled = true
else
	sle_12.enabled = false
end if
end event

type cbx_8 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 776
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
string text = "건축면적"
end type

event clicked;if this.checked = true then
	sle_8.enabled = true
else
	sle_8.enabled = false
end if		
end event

type cbx_4 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 408
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
string text = "설계사(설계회사)"
end type

event clicked;if this.checked = true then
	sle_4.enabled = true
else
	sle_4.enabled = false
end if	
end event

type cbx_15 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 1420
integer width = 590
integer height = 64
integer taborder = 290
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

event clicked;if this.checked = true then
	sle_15.enabled = true
else
	sle_15.enabled = false
end if
end event

type cbx_11 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 1052
integer width = 590
integer height = 64
integer taborder = 210
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "진행상황"
end type

event clicked;if this.checked = true then
	sle_11.enabled = true
else
	sle_11.enabled = false
end if
end event

type cbx_7 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 684
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
string text = "층수"
end type

event clicked;if this.checked = true then
	sle_7.enabled = true
else
	sle_7.enabled = false
end if	
end event

type cbx_3 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 316
integer width = 590
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
string text = "발주처(건축주)"
end type

event clicked;if this.checked = true then
	sle_3.enabled = true
else
	sle_3.enabled = false
end if
end event

type cbx_14 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 1328
integer width = 590
integer height = 64
integer taborder = 270
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

event clicked;if this.checked = true then
	sle_14.enabled = true
else
	sle_14.enabled = false
end if	
end event

type cbx_10 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 960
integer width = 590
integer height = 64
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "준공일"
end type

event clicked;if this.checked = true then
	sle_10.enabled = true
else
	sle_10.enabled = false
end if	
end event

type cbx_6 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 592
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
string text = "지역"
end type

event clicked;if this.checked = true then
	sle_6.enabled = true
else
	sle_6.enabled = false
end if		
end event

type cbx_2 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 224
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
string text = "현장명(공사명)"
end type

event clicked;if this.checked = true then
	sle_2.enabled = true
else
	sle_2.enabled = false
end if
end event

type cbx_17 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 1604
integer width = 590
integer height = 64
integer taborder = 330
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

event clicked;if this.checked = true then
	sle_17.enabled = true
else
	sle_17.enabled = false
end if	
end event

type cbx_13 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 1236
integer width = 590
integer height = 64
integer taborder = 250
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "하도업체 진행상황"
end type

event clicked;if this.checked = true then
	sle_13.enabled = true
else
	sle_13.enabled = false
end if	
end event

type cbx_9 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 868
integer width = 457
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
boolean enabled = false
string text = "착공일"
end type

event clicked;if this.checked = true then
	sle_9.enabled = true
else
	sle_9.enabled = false
end if		
end event

type cbx_5 from checkbox within w_bdinfo_w_3
integer x = 137
integer y = 500
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
string text = "건설사"
end type

event clicked;if this.checked = true then
	sle_5.enabled = true
else
	sle_5.enabled = false
end if	
end event

type cbx_1 from checkbox within w_bdinfo_w_3
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
boolean enabled = false
string text = "최초등록일"
end type

event clicked;if this.checked = true then
	sle_1.enabled = true
else
	sle_1.enabled = false
end if	
end event

type pb_2 from picturebutton within w_bdinfo_w_3
integer x = 1134
integer y = 1748
integer width = 279
integer height = 108
integer taborder = 360
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

type pb_1 from picturebutton within w_bdinfo_w_3
integer x = 823
integer y = 1748
integer width = 265
integer height = 108
integer taborder = 350
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

event clicked;boolean lb_check = false
string ls_str = ""
if cbx_1.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_makedate = '" + trim(sle_1.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_makedate = '" + trim(sle_1.text) + "'"
		lb_check = true
	end if
end if

if cbx_2.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_project like '%" + trim(sle_2.text) + "%'"
	else
		ls_str = ls_str + " bdinfodet_project like '%" + trim(sle_2.text) + "%'"
		lb_check = true
	end if
end if

if cbx_3.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_master = '" + trim(sle_3.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_master = '" + trim(sle_3.text) + "'"
		lb_check = true
	end if
end if

if cbx_4.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_designoffice = '" + trim(sle_4.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_designoffice = '" + trim(sle_4.text) + "'"
		lb_check = true
	end if
end if

if cbx_5.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_buildingcom = '" + trim(sle_5.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_buildingcom = '" + trim(sle_5.text) + "'"
		lb_check = true
	end if
end if

if cbx_6.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bd_positon  like '%" + trim(sle_6.text) + "%'"
	else
		ls_str = ls_str + " bd_positon  like '%" + trim(sle_6.text) + "%'"
		lb_check = true
	end if
end if

if cbx_7.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_floors = '" + trim(sle_7.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_floors = '" + trim(sle_7.text) + "'"
		lb_check = true
	end if
end if

if cbx_8.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_square = '" + trim(sle_8.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_square = '" + trim(sle_8.text) + "'"
		lb_check = true
	end if
end if

if cbx_9.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_constructiondate = '" + trim(sle_9.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_constructiondate = '" + trim(sle_9.text) + "'"
		lb_check = true
	end if
end if

if cbx_10.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_completiondate = '" + trim(sle_10.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_completiondate = '" + trim(sle_10.text) + "'"
		lb_check = true
	end if
end if

if cbx_11.checked = true then
	if lb_check = true then
//		ls_str = ls_str + " and bdinfodet_makedate = '" + trim(sle_11.text) + "'"
	else
//		ls_str = ls_str + " bdinfodet_makedate = '" + trim(sle_11.text) + "'"
		lb_check = true
	end if
end if

if cbx_12.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_builder = '" + trim(sle_12.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_builder = '" + trim(sle_12.text) + "'"
		lb_check = true
	end if
end if

if cbx_13.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_build_prog = '" + trim(sle_13.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_build_prog = '" + trim(sle_13.text) + "'"
		lb_check = true
	end if
end if

if cbx_14.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_builderman = '" + trim(sle_14.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_builderman = '" + trim(sle_14.text) + "'"
		lb_check = true
	end if
end if

if cbx_15.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_builderphone = '" + trim(sle_15.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_builderphone = '" + trim(sle_15.text) + "'"
		lb_check = true
	end if
end if

if cbx_16.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_person = '" + trim(sle_16.text) + "'"
	else
		ls_str = ls_str + " bdinfodet_person = '" + trim(sle_16.text) + "'"
		lb_check = true
	end if
end if

if cbx_17.checked = true then
	if lb_check = true then
		ls_str = ls_str + " and bdinfodet_rem like '%" + trim(sle_17.text) + "%'"
	else
		ls_str = ls_str + " bdinfodet_rem like '%" + trim(sle_17.text) + "%'"
		lb_check = true
	end if
end if


is_ble.str1 = ls_str
is_ble.okflag = true
closewithreturn(parent, is_ble)

end event

type gb_1 from groupbox within w_bdinfo_w_3
integer x = 32
integer y = 28
integer width = 1376
integer height = 1700
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 16711680
long backcolor = 79219928
string text = "검색(세부조건)"
end type

