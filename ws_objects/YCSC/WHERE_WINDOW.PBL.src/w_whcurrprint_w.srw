$PBExportHeader$w_whcurrprint_w.srw
$PBExportComments$환율관리 프린트 조건(1998/05/04, 정재수)
forward
global type w_whcurrprint_w from Window
end type
type pb_2 from picturebutton within w_whcurrprint_w
end type
type pb_1 from picturebutton within w_whcurrprint_w
end type
type st_1 from statictext within w_whcurrprint_w
end type
type em_2 from editmask within w_whcurrprint_w
end type
type em_1 from editmask within w_whcurrprint_w
end type
type rb_2 from radiobutton within w_whcurrprint_w
end type
type rb_1 from radiobutton within w_whcurrprint_w
end type
type gb_1 from groupbox within w_whcurrprint_w
end type
end forward

global type w_whcurrprint_w from Window
int X=832
int Y=360
int Width=1326
int Height=640
boolean TitleBar=true
long BackColor=79741120
WindowType WindowType=response!
pb_2 pb_2
pb_1 pb_1
st_1 st_1
em_2 em_2
em_1 em_1
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_whcurrprint_w w_whcurrprint_w

type variables
st_currate ist_curr
end variables

on w_whcurrprint_w.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_1,&
this.em_2,&
this.em_1,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_whcurrprint_w.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;ist_curr = message.powerobjectparm
end event

type pb_2 from picturebutton within w_whcurrprint_w
int X=1006
int Y=392
int Width=279
int Height=144
int TabOrder=40
string Text="취소"
string PictureName="c:\bmp\취소.bmp"
Alignment HTextAlign=Right!
int TextSize=-10
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;ist_curr.flag = 'N'
closewithreturn(parent, ist_curr)
end event

type pb_1 from picturebutton within w_whcurrprint_w
int X=722
int Y=392
int Width=279
int Height=144
int TabOrder=30
string Text="확인"
string PictureName="c:\bmp\확인1.bmp"
Alignment HTextAlign=Right!
boolean Default=true
int TextSize=-10
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;ist_curr.flag = 'Y'
if rb_1.checked = true then
	ist_curr.all_part = 'A'
else
	ist_curr.all_part = 'P'
	ist_curr.start_date = date(em_1.text)
	ist_curr.end_date = date(em_2.text)
end if

closewithreturn(parent, ist_curr)
end event

type st_1 from statictext within w_whcurrprint_w
int X=841
int Y=240
int Width=46
int Height=64
boolean Enabled=false
string Text="~~"
boolean FocusRectangle=false
long BackColor=79219928
int TextSize=-10
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type em_2 from editmask within w_whcurrprint_w
int X=891
int Y=228
int Width=352
int Height=76
int TabOrder=20
boolean Enabled=false
BorderStyle BorderStyle=StyleLowered!
string Mask="yyyy/mm/dd"
MaskDataType MaskDataType=DateMask!
boolean AutoSkip=true
string DisplayData=""
long BackColor=79219928
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_1 from editmask within w_whcurrprint_w
int X=485
int Y=228
int Width=352
int Height=76
int TabOrder=10
boolean Enabled=false
BorderStyle BorderStyle=StyleLowered!
string Mask="yyyy/mm/dd"
MaskDataType MaskDataType=DateMask!
boolean AutoSkip=true
string DisplayData=""
long BackColor=79219928
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_2 from radiobutton within w_whcurrprint_w
int X=69
int Y=228
int Width=439
int Height=76
string Text="부분출력"
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;em_1.enabled = true
em_2.enabled = true
em_1.backcolor = 1087434968
em_2.backcolor = 1087434968
end event

type rb_1 from radiobutton within w_whcurrprint_w
int X=69
int Y=112
int Width=421
int Height=76
string Text="전체출력"
boolean Checked=true
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;em_1.enabled = false
em_2.enabled = false
em_1.backcolor = 78682240
em_2.backcolor = 78682240
end event

type gb_1 from groupbox within w_whcurrprint_w
int X=27
int Y=12
int Width=1262
int Height=364
string Text="출력조건"
long TextColor=16711680
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

