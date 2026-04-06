$PBExportHeader$w_whglbillrep_w.srw
$PBExportComments$어음 REPORT 종류선택(1998/05/11, 정재수)
forward
global type w_whglbillrep_w from Window
end type
type pb_2 from picturebutton within w_whglbillrep_w
end type
type pb_1 from picturebutton within w_whglbillrep_w
end type
type rb_2 from radiobutton within w_whglbillrep_w
end type
type rb_1 from radiobutton within w_whglbillrep_w
end type
type gb_1 from groupbox within w_whglbillrep_w
end type
end forward

global type w_whglbillrep_w from Window
int X=833
int Y=361
int Width=993
int Height=641
boolean TitleBar=true
long BackColor=79741120
WindowType WindowType=response!
pb_2 pb_2
pb_1 pb_1
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_whglbillrep_w w_whglbillrep_w

type variables
gs_glbillprn_str ist_glbill
end variables

on w_whglbillrep_w.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={ this.pb_2,&
this.pb_1,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_whglbillrep_w.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;ist_glbill = message.powerobjectparm
end event

type pb_2 from picturebutton within w_whglbillrep_w
int X=673
int Y=397
int Width=279
int Height=145
int TabOrder=20
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

event clicked;ist_glbill.flag = 'N'
closewithreturn(parent, ist_glbill)
end event

type pb_1 from picturebutton within w_whglbillrep_w
int X=389
int Y=397
int Width=279
int Height=145
int TabOrder=10
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

event clicked;if rb_1.checked = true then
	ist_glbill.kind = '1'
else
	ist_glbill.kind = '2'
end if

ist_glbill.flag = 'Y'
closewithreturn(parent, ist_glbill)
end event

type rb_2 from radiobutton within w_whglbillrep_w
int X=69
int Y=241
int Width=869
int Height=77
string Text="어음처리내역 REPORT"
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type rb_1 from radiobutton within w_whglbillrep_w
int X=69
int Y=125
int Width=727
int Height=77
string Text="어음현황 REPORT"
boolean Checked=true
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type gb_1 from groupbox within w_whglbillrep_w
int X=28
int Y=13
int Width=929
int Height=365
string Text="REPORT 선택"
long TextColor=16711680
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

