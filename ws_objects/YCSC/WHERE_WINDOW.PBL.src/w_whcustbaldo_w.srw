$PBExportHeader$w_whcustbaldo_w.srw
$PBExportComments$판매거래처별출고/미출고검색윈도우(1998/05/14,성삼지)
forward
global type w_whcustbaldo_w from Window
end type
type em_2 from editmask within w_whcustbaldo_w
end type
type em_1 from editmask within w_whcustbaldo_w
end type
type rb_7 from radiobutton within w_whcustbaldo_w
end type
type rb_6 from radiobutton within w_whcustbaldo_w
end type
type st_3 from statictext within w_whcustbaldo_w
end type
type st_2 from statictext within w_whcustbaldo_w
end type
type em_4 from editmask within w_whcustbaldo_w
end type
type em_3 from editmask within w_whcustbaldo_w
end type
type pb_2 from picturebutton within w_whcustbaldo_w
end type
type pb_1 from picturebutton within w_whcustbaldo_w
end type
type st_1 from statictext within w_whcustbaldo_w
end type
type rb_2 from radiobutton within w_whcustbaldo_w
end type
type rb_1 from radiobutton within w_whcustbaldo_w
end type
type gb_2 from groupbox within w_whcustbaldo_w
end type
type gb_1 from groupbox within w_whcustbaldo_w
end type
end forward

global type w_whcustbaldo_w from Window
int X=832
int Y=360
int Width=1326
int Height=928
boolean TitleBar=true
string Title="기간조회(w_whcustbaldo_w)"
long BackColor=79741120
WindowType WindowType=response!
em_2 em_2
em_1 em_1
rb_7 rb_7
rb_6 rb_6
st_3 st_3
st_2 st_2
em_4 em_4
em_3 em_3
pb_2 pb_2
pb_1 pb_1
st_1 st_1
rb_2 rb_2
rb_1 rb_1
gb_2 gb_2
gb_1 gb_1
end type
global w_whcustbaldo_w w_whcustbaldo_w

type variables
gs_itembaldo_str  ist_code
end variables

on w_whcustbaldo_w.create
this.em_2=create em_2
this.em_1=create em_1
this.rb_7=create rb_7
this.rb_6=create rb_6
this.st_3=create st_3
this.st_2=create st_2
this.em_4=create em_4
this.em_3=create em_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.em_2,&
this.em_1,&
this.rb_7,&
this.rb_6,&
this.st_3,&
this.st_2,&
this.em_4,&
this.em_3,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.rb_2,&
this.rb_1,&
this.gb_2,&
this.gb_1}
end on

on w_whcustbaldo_w.destroy
destroy(this.em_2)
destroy(this.em_1)
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;ist_code = message.powerobjectparm
em_3.text = string(today(),'yyyy/mm/dd')
em_4.text = string(today(),'yyyy/mm/dd')
end event

type em_2 from editmask within w_whcustbaldo_w
int X=901
int Y=532
int Width=366
int Height=84
int TabOrder=40
boolean Enabled=false
TextCase TextCase=Upper!
BorderStyle BorderStyle=StyleLowered!
string Mask="aaaa"
MaskDataType MaskDataType=StringMask!
boolean AutoSkip=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_2.text = lst_whcustret.cust_no
end if


end event

event getfocus;if not isnull(em_1.text) or trim(em_1.text) <> "" then
	em_2.text = em_1.text
end if

end event

type em_1 from editmask within w_whcustbaldo_w
int X=489
int Y=532
int Width=366
int Height=84
int TabOrder=30
boolean Enabled=false
TextCase TextCase=Upper!
BorderStyle BorderStyle=StyleLowered!
string Mask="aaaa"
MaskDataType MaskDataType=StringMask!
boolean AutoSkip=true
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event rbuttondown;gs_whcustret_str lst_whcustret

openwithparm(w_whcustret_w, lst_whcustret)
lst_whcustret =  message.powerobjectparm

if lst_Whcustret.cust_chk = 'Y' then
	em_1.text = lst_whcustret.cust_no
end if
em_2.setfocus()

end event

type rb_7 from radiobutton within w_whcustbaldo_w
event clicked pbm_bnclicked
int X=791
int Y=96
int Width=329
int Height=76
string Text="미출고"
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

type rb_6 from radiobutton within w_whcustbaldo_w
event clicked pbm_bnclicked
int X=69
int Y=96
int Width=558
int Height=76
string Text="출고/미출고"
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

type st_3 from statictext within w_whcustbaldo_w
int X=133
int Y=200
int Width=343
int Height=76
boolean Enabled=false
string Text="납기기간"
boolean FocusRectangle=false
long TextColor=16711935
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type st_2 from statictext within w_whcustbaldo_w
int X=859
int Y=216
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

type em_4 from editmask within w_whcustbaldo_w
int X=905
int Y=200
int Width=366
int Height=76
int TabOrder=20
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="yyyy/mm/dd"
MaskDataType MaskDataType=DateMask!
string DisplayData=""
long BackColor=16777215
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

type em_3 from editmask within w_whcustbaldo_w
int X=494
int Y=200
int Width=366
int Height=76
int TabOrder=10
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="yyyy/mm/dd"
MaskDataType MaskDataType=DateMask!
string DisplayData=""
long BackColor=16777215
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

type pb_2 from picturebutton within w_whcustbaldo_w
int X=1006
int Y=688
int Width=279
int Height=144
int TabOrder=70
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

event clicked;ist_code.okcancel = 'N'
closewithreturn(parent, ist_code)
end event

type pb_1 from picturebutton within w_whcustbaldo_w
int X=722
int Y=688
int Width=279
int Height=144
int TabOrder=60
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

event clicked;ist_code.okcancel = 'Y'

if rb_1.checked = true then
	ist_code.sel_flag = 'A'
else
	ist_code.sel_flag = 'P'
	ist_code.start_no = trim(em_1.text)
	ist_code.end_no = trim(em_2.text)
end if

if rb_6.checked = true then
	ist_code.do_flag = 'Y'
ELSE
	ist_code.do_flag = 'N'
end if

ist_code.start_date = em_3.text
ist_code.end_date = em_4.text
closewithreturn(parent, ist_code)
end event

type st_1 from statictext within w_whcustbaldo_w
int X=855
int Y=552
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

type rb_2 from radiobutton within w_whcustbaldo_w
int X=50
int Y=540
int Width=439
int Height=76
string Text="부분조회"
long BackColor=79220952
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

type rb_1 from radiobutton within w_whcustbaldo_w
int X=50
int Y=420
int Width=439
int Height=76
string Text="전체조회"
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

type gb_2 from groupbox within w_whcustbaldo_w
int X=23
int Y=16
int Width=1262
int Height=284
int TabOrder=50
string Text="조회선택"
long TextColor=16711680
long BackColor=79220952
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type gb_1 from groupbox within w_whcustbaldo_w
int X=23
int Y=316
int Width=1262
int Height=364
string Text="판매거래처범위"
long TextColor=16711680
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

