$PBExportHeader$w_whitemmolding_w.srw
$PBExportComments$몰딩재고검색
forward 
global type w_whitemmolding_w from window
end type
type pb_close from picturebutton within w_whitemmolding_w
end type
type pb_retrieve from picturebutton within w_whitemmolding_w
end type
type em_2 from editmask within w_whitemmolding_w
end type
type st_3 from statictext within w_whitemmolding_w
end type
type em_1 from editmask within w_whitemmolding_w
end type
type st_1 from statictext within w_whitemmolding_w
end type
type st_6 from statictext within w_whitemmolding_w
end type
type dw_1 from datawindow within w_whitemmolding_w
end type
type gb_1 from groupbox within w_whitemmolding_w
end type
end forward

global type w_whitemmolding_w from window
integer x = 1938
integer y = 700
integer width = 4494
integer height = 1760
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_close pb_close
pb_retrieve pb_retrieve
em_2 em_2
st_3 st_3
em_1 em_1
st_1 st_1
st_6 st_6
dw_1 dw_1
gb_1 gb_1
end type
global w_whitemmolding_w w_whitemmolding_w

type variables
gs_where istr_where

end variables

on w_whitemmolding_w.create
this.pb_close=create pb_close
this.pb_retrieve=create pb_retrieve
this.em_2=create em_2
this.st_3=create st_3
this.em_1=create em_1
this.st_1=create st_1
this.st_6=create st_6
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_close,&
this.pb_retrieve,&
this.em_2,&
this.st_3,&
this.em_1,&
this.st_1,&
this.st_6,&
this.dw_1,&
this.gb_1}
end on

on w_whitemmolding_w.destroy
destroy(this.pb_close)
destroy(this.pb_retrieve)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.SetTransObject(SQLCA)

string ls_getdate

SELECT TOP 1 CONVERT(CHAR(19), DATEADD(day, -1, CHECKTIME), 120)
  INTO :ls_getdate
  FROM ITEMMOLDING   
 ORDER BY CHECKTIME DESC;

if isnull(ls_getdate) or ls_getdate = "" then
	ls_getdate = string(gf_today()) // 2011-11-23 15:01:50
end if

em_1.text = LeftA(ls_getdate, 10)
em_2.text = RightA(ls_getdate, 8)

pb_retrieve.triggerevent(clicked!)


end event

event resize;//dw_1.width  = this.width  - 55
//dw_1.height = this.height - 280
//
end event

type pb_close from picturebutton within w_whitemmolding_w
integer x = 3438
integer y = 40
integer width = 160
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = left!
end type

event clicked;//
close(parent)
end event

type pb_retrieve from picturebutton within w_whitemmolding_w
integer x = 3246
integer y = 40
integer width = 160
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;//
string ls_getdate

ls_getdate = em_1.text + " " + em_2.text + ":00.000"
dw_1.retrieve( ls_getdate )

end event

type em_2 from editmask within w_whitemmolding_w
integer x = 1051
integer y = 12
integer width = 352
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean autoskip = true
end type

type st_3 from statictext within w_whitemmolding_w
integer x = 763
integer y = 12
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "등록시간"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_whitemmolding_w
integer x = 384
integer y = 12
integer width = 352
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy-mm-dd"
boolean autoskip = true
end type

event modified;//id_start = date(this.text)
//messagebox("",string(id_date))

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_whitemmolding_w
integer x = 23
integer y = 112
integer width = 1595
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "※ 실시간 변동으로 인한 근사치 수량 입니다."
boolean focusrectangle = false
end type

type st_6 from statictext within w_whitemmolding_w
integer x = 18
integer y = 12
integer width = 361
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "등록일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_whitemmolding_w
string tag = "d_whitemmoldingqoh_s"
integer x = 23
integer y = 184
integer width = 4434
integer height = 1472
integer taborder = 10
string dataobject = "d_itemmolding_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;This.SelectRow(0, FALSE)	
This.SelectRow(row, TRUE)

end event

type gb_1 from groupbox within w_whitemmolding_w
integer x = 3200
integer width = 434
integer height = 172
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

