$PBExportHeader$w_whdatetime_w.srw
$PBExportComments$출고도착 예정시간
forward
global type w_whdatetime_w from window
end type
type rb_27 from radiobutton within w_whdatetime_w
end type
type rb_26 from radiobutton within w_whdatetime_w
end type
type rb_25 from radiobutton within w_whdatetime_w
end type
type st_time from statictext within w_whdatetime_w
end type
type st_5 from statictext within w_whdatetime_w
end type
type st_4 from statictext within w_whdatetime_w
end type
type st_3 from statictext within w_whdatetime_w
end type
type st_2 from statictext within w_whdatetime_w
end type
type rb_24 from radiobutton within w_whdatetime_w
end type
type rb_23 from radiobutton within w_whdatetime_w
end type
type rb_22 from radiobutton within w_whdatetime_w
end type
type rb_21 from radiobutton within w_whdatetime_w
end type
type rb_20 from radiobutton within w_whdatetime_w
end type
type rb_19 from radiobutton within w_whdatetime_w
end type
type rb_18 from radiobutton within w_whdatetime_w
end type
type rb_17 from radiobutton within w_whdatetime_w
end type
type rb_16 from radiobutton within w_whdatetime_w
end type
type rb_15 from radiobutton within w_whdatetime_w
end type
type rb_14 from radiobutton within w_whdatetime_w
end type
type rb_13 from radiobutton within w_whdatetime_w
end type
type rb_12 from radiobutton within w_whdatetime_w
end type
type rb_11 from radiobutton within w_whdatetime_w
end type
type rb_10 from radiobutton within w_whdatetime_w
end type
type rb_9 from radiobutton within w_whdatetime_w
end type
type rb_8 from radiobutton within w_whdatetime_w
end type
type rb_7 from radiobutton within w_whdatetime_w
end type
type rb_6 from radiobutton within w_whdatetime_w
end type
type rb_5 from radiobutton within w_whdatetime_w
end type
type rb_4 from radiobutton within w_whdatetime_w
end type
type rb_3 from radiobutton within w_whdatetime_w
end type
type st_1 from statictext within w_whdatetime_w
end type
type pb_2 from picturebutton within w_whdatetime_w
end type
type pb_1 from picturebutton within w_whdatetime_w
end type
type em_2 from editmask within w_whdatetime_w
end type
type em_1 from editmask within w_whdatetime_w
end type
type rb_2 from radiobutton within w_whdatetime_w
end type
type rb_1 from radiobutton within w_whdatetime_w
end type
type gb_1 from groupbox within w_whdatetime_w
end type
end forward

global type w_whdatetime_w from window
integer x = 832
integer y = 360
integer width = 2153
integer height = 988
boolean titlebar = true
string title = "도착예정 시간(w_whdatetime_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
rb_27 rb_27
rb_26 rb_26
rb_25 rb_25
st_time st_time
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
rb_24 rb_24
rb_23 rb_23
rb_22 rb_22
rb_21 rb_21
rb_20 rb_20
rb_19 rb_19
rb_18 rb_18
rb_17 rb_17
rb_16 rb_16
rb_15 rb_15
rb_14 rb_14
rb_13 rb_13
rb_12 rb_12
rb_11 rb_11
rb_10 rb_10
rb_9 rb_9
rb_8 rb_8
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
st_1 st_1
pb_2 pb_2
pb_1 pb_1
em_2 em_2
em_1 em_1
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_whdatetime_w w_whdatetime_w

type variables
gs_codere_str  ist_code
datetime time_arrival
end variables

forward prototypes
public function datetime wf_datetime (integer arg_time)
public subroutine wf_datetime_calc (integer arg_hour)
end prototypes

public function datetime wf_datetime (integer arg_time);// 
datetime ldt_datetime, ldt_ctime

SELECT top 1 dateadd(hh, :arg_time, getdate() ) INTO :ldt_datetime FROM login;

RETURN ldt_datetime
end function

public subroutine wf_datetime_calc (integer arg_hour);//
string ls_datetime, ls_date, ls_time

ls_datetime = string(wf_datetime( arg_hour ), "yyyy/mm/dd hh:mm")
ls_date     = LeftA(ls_datetime, 10)
ls_time     = RightA(ls_datetime, 5)

em_1.text   = ls_date
em_2.text   = ls_time

em_1.enabled = true
em_2.enabled = true
em_1.backcolor = 1087434968
em_2.backcolor = 1087434968

end subroutine

on w_whdatetime_w.create
this.rb_27=create rb_27
this.rb_26=create rb_26
this.rb_25=create rb_25
this.st_time=create st_time
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.rb_24=create rb_24
this.rb_23=create rb_23
this.rb_22=create rb_22
this.rb_21=create rb_21
this.rb_20=create rb_20
this.rb_19=create rb_19
this.rb_18=create rb_18
this.rb_17=create rb_17
this.rb_16=create rb_16
this.rb_15=create rb_15
this.rb_14=create rb_14
this.rb_13=create rb_13
this.rb_12=create rb_12
this.rb_11=create rb_11
this.rb_10=create rb_10
this.rb_9=create rb_9
this.rb_8=create rb_8
this.rb_7=create rb_7
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.em_2=create em_2
this.em_1=create em_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.rb_27,&
this.rb_26,&
this.rb_25,&
this.st_time,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.rb_24,&
this.rb_23,&
this.rb_22,&
this.rb_21,&
this.rb_20,&
this.rb_19,&
this.rb_18,&
this.rb_17,&
this.rb_16,&
this.rb_15,&
this.rb_14,&
this.rb_13,&
this.rb_12,&
this.rb_11,&
this.rb_10,&
this.rb_9,&
this.rb_8,&
this.rb_7,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.st_1,&
this.pb_2,&
this.pb_1,&
this.em_2,&
this.em_1,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_whdatetime_w.destroy
destroy(this.rb_27)
destroy(this.rb_26)
destroy(this.rb_25)
destroy(this.st_time)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.rb_24)
destroy(this.rb_23)
destroy(this.rb_22)
destroy(this.rb_21)
destroy(this.rb_20)
destroy(this.rb_19)
destroy(this.rb_18)
destroy(this.rb_17)
destroy(this.rb_16)
destroy(this.rb_15)
destroy(this.rb_14)
destroy(this.rb_13)
destroy(this.rb_12)
destroy(this.rb_11)
destroy(this.rb_10)
destroy(this.rb_9)
destroy(this.rb_8)
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;//
ist_code = message.powerobjectparm

st_time.text = string(gf_today(),"yyyy/mm/dd hh:mm")
end event

type rb_27 from radiobutton within w_whdatetime_w
integer x = 599
integer y = 632
integer width = 485
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "익일07:00"
end type

event clicked;string ls_datetime, ls_date, ls_time

select 
	convert(varchar(10), dateadd(day,1,getdate()), 111) 
into
	:ls_date
from 
	dual
using sqlca;

em_1.text   = ls_date
em_2.text   = '07:00'

em_1.enabled = true
em_2.enabled = true
em_1.backcolor = 1087434968
em_2.backcolor = 1087434968

end event

type rb_26 from radiobutton within w_whdatetime_w
integer x = 1097
integer y = 632
integer width = 485
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "익일07:30"
end type

event clicked;string ls_datetime, ls_date, ls_time

select 
	convert(varchar(10), dateadd(day,1,getdate()), 111) 
into
	:ls_date
from 
	dual
using sqlca;

em_1.text   = ls_date
em_2.text   = '07:30'

em_1.enabled = true
em_2.enabled = true
em_1.backcolor = 1087434968
em_2.backcolor = 1087434968

end event

type rb_25 from radiobutton within w_whdatetime_w
integer x = 1600
integer y = 632
integer width = 485
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "익일08:00"
end type

event clicked;string ls_datetime, ls_date, ls_time

select 
	convert(varchar(10), dateadd(day,1,getdate()), 111) 
into
	:ls_date
from 
	dual
using sqlca;

em_1.text   = ls_date
em_2.text   = '08:00'

em_1.enabled = true
em_2.enabled = true
em_1.backcolor = 1087434968
em_2.backcolor = 1087434968

end event

type st_time from statictext within w_whdatetime_w
integer x = 1166
integer y = 88
integer width = 882
integer height = 100
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
string text = "2014/04/05 17:00"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within w_whdatetime_w
integer x = 55
integer y = 596
integer width = 2021
integer height = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 8421376
boolean focusrectangle = false
end type

type st_4 from statictext within w_whdatetime_w
integer x = 73
integer y = 408
integer width = 1989
integer height = 12
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 32896
boolean focusrectangle = false
end type

type st_3 from statictext within w_whdatetime_w
integer x = 55
integer y = 208
integer width = 2021
integer height = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 8421376
boolean focusrectangle = false
end type

type st_2 from statictext within w_whdatetime_w
integer x = 78
integer y = 108
integer width = 352
integer height = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "예정시간:"
boolean focusrectangle = false
end type

type rb_24 from radiobutton within w_whdatetime_w
integer x = 1755
integer y = 524
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "24:00"
end type

event clicked;//
wf_datetime_calc( 24 )

end event

type rb_23 from radiobutton within w_whdatetime_w
integer x = 1417
integer y = 524
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "23:00"
end type

event clicked;//
wf_datetime_calc( 23 )

end event

type rb_22 from radiobutton within w_whdatetime_w
integer x = 1079
integer y = 520
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "22:00"
end type

event clicked;//
wf_datetime_calc( 22 )

end event

type rb_21 from radiobutton within w_whdatetime_w
integer x = 741
integer y = 520
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "21:00"
end type

event clicked;//
wf_datetime_calc( 21 )

end event

type rb_20 from radiobutton within w_whdatetime_w
integer x = 402
integer y = 516
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "20:00"
end type

event clicked;//
wf_datetime_calc( 20 )

end event

type rb_19 from radiobutton within w_whdatetime_w
integer x = 78
integer y = 516
integer width = 315
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "19:00"
end type

event clicked;//
wf_datetime_calc( 19 )

end event

type rb_18 from radiobutton within w_whdatetime_w
integer x = 1755
integer y = 428
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "18:00"
end type

event clicked;//
wf_datetime_calc( 18 )

end event

type rb_17 from radiobutton within w_whdatetime_w
integer x = 1417
integer y = 428
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "17:00"
end type

event clicked;//
wf_datetime_calc( 17 )

end event

type rb_16 from radiobutton within w_whdatetime_w
integer x = 1079
integer y = 428
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "16:00"
end type

event clicked;//
wf_datetime_calc( 16 )

end event

type rb_15 from radiobutton within w_whdatetime_w
integer x = 741
integer y = 428
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "15:00"
end type

event clicked;//
wf_datetime_calc( 15 )

end event

type rb_14 from radiobutton within w_whdatetime_w
integer x = 402
integer y = 428
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "14:00"
end type

event clicked;//
wf_datetime_calc( 14 )

end event

type rb_13 from radiobutton within w_whdatetime_w
integer x = 78
integer y = 428
integer width = 315
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79219928
string text = "13:00"
end type

event clicked;//
wf_datetime_calc( 13 )

end event

type rb_12 from radiobutton within w_whdatetime_w
integer x = 1755
integer y = 328
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "12:00"
end type

event clicked;//
wf_datetime_calc( 12 )

end event

type rb_11 from radiobutton within w_whdatetime_w
integer x = 1417
integer y = 328
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "11:00"
end type

event clicked;//
wf_datetime_calc( 11 )

end event

type rb_10 from radiobutton within w_whdatetime_w
integer x = 1079
integer y = 324
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "10:00"
end type

event clicked;//
wf_datetime_calc( 10 )

end event

type rb_9 from radiobutton within w_whdatetime_w
integer x = 741
integer y = 324
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "09:00"
end type

event clicked;//
wf_datetime_calc( 9 )

end event

type rb_8 from radiobutton within w_whdatetime_w
integer x = 402
integer y = 320
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "08:00"
end type

event clicked;//
wf_datetime_calc( 8 )

end event

type rb_7 from radiobutton within w_whdatetime_w
integer x = 78
integer y = 320
integer width = 315
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "07:00"
end type

event clicked;//
wf_datetime_calc( 7 )

end event

type rb_6 from radiobutton within w_whdatetime_w
integer x = 1755
integer y = 232
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "06:00"
end type

event clicked;//
wf_datetime_calc( 6 )

end event

type rb_5 from radiobutton within w_whdatetime_w
integer x = 1417
integer y = 232
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "05:00"
end type

event clicked;//
wf_datetime_calc( 5 )

end event

type rb_4 from radiobutton within w_whdatetime_w
integer x = 1079
integer y = 232
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "04:00"
end type

event clicked;//
wf_datetime_calc( 4 )

end event

type rb_3 from radiobutton within w_whdatetime_w
integer x = 741
integer y = 232
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "03:00"
end type

event clicked;//
wf_datetime_calc( 3 )

end event

type st_1 from statictext within w_whdatetime_w
integer x = 32
integer y = 732
integer width = 1083
integer height = 64
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "※도착예정시간 문자로 전송."
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_whdatetime_w
integer x = 1774
integer y = 728
integer width = 329
integer height = 156
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;// 취소
ist_code.okcancel = 'N'
closewithreturn(parent, ist_code)
end event

type pb_1 from picturebutton within w_whdatetime_w
integer x = 1431
integer y = 728
integer width = 329
integer height = 156
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = right!
end type

event clicked;// 확인
string ls_date, ls_time, ls_hh, ls_mm

ls_date = trim(em_1.text)
ls_time = trim(em_2.text)
ls_hh   = LeftA(ls_time,2)
ls_mm   = RightA(ls_time,2)

ist_code.okcancel = 'Y'
ist_code.start_no = ls_date
ist_code.end_no   = ls_time	// left(ls_time,3) + "00"

CloseWithReturn(parent, ist_code)

end event

type em_2 from editmask within w_whdatetime_w
integer x = 896
integer y = 100
integer width = 256
integer height = 76
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean autoskip = true
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_2.text = lst_whcustret.cust_no
end if

end event

type em_1 from editmask within w_whdatetime_w
event doubleclick pbm_lbuttondblclk
integer x = 434
integer y = 100
integer width = 457
integer height = 76
integer taborder = 10
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_2 from radiobutton within w_whdatetime_w
integer x = 402
integer y = 232
integer width = 329
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "02:00"
end type

event clicked;//
wf_datetime_calc( 2 )

end event

type rb_1 from radiobutton within w_whdatetime_w
integer x = 78
integer y = 232
integer width = 315
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "01:00"
end type

event clicked;//
wf_datetime_calc( 1 )

end event

type gb_1 from groupbox within w_whdatetime_w
integer x = 27
integer y = 12
integer width = 2080
integer height = 704
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "도착예정"
end type

