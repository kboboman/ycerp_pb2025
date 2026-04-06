$PBExportHeader$w_apoi_m1.srw
$PBExportComments$자재매입관리(운송료)(1998/05/21, 이인호)
forward
global type w_apoi_m1 from Window
end type
type cbx_1 from checkbox within w_apoi_m1
end type
type dw_1 from datawindow within w_apoi_m1
end type
type pb_2 from picturebutton within w_apoi_m1
end type
type pb_1 from picturebutton within w_apoi_m1
end type
type gb_1 from groupbox within w_apoi_m1
end type
end forward

global type w_apoi_m1 from Window
int X=832
int Y=360
int Width=1289
int Height=1128
boolean TitleBar=true
string Title="운송비 선택(w_osaroi_m1)"
long BackColor=79741120
WindowType WindowType=response!
cbx_1 cbx_1
dw_1 dw_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_apoi_m1 w_apoi_m1

type variables
st_aroi_s ist_aroi
end variables

on w_apoi_m1.create
this.cbx_1=create cbx_1
this.dw_1=create dw_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.cbx_1,&
this.dw_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_apoi_m1.destroy
destroy(this.cbx_1)
destroy(this.dw_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;datawindow ldw_1

ist_aroi = message.powerobjectparm

ldw_1 = ist_aroi.dw_object

dw_1.dataobject = ist_aroi.name
dw_1.settransobject(sqlca)
ldw_1.sharedata(dw_1)



end event

type cbx_1 from checkbox within w_apoi_m1
int X=27
int Y=872
int Width=352
int Height=76
string Text="전체선정"
BorderStyle BorderStyle=StyleLowered!
long TextColor=16711680
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row

for ll_row = 1 to dw_1.rowcount()
	dw_1.setitem(ll_row, "pick", 'Y')
next
end event

type dw_1 from datawindow within w_apoi_m1
int X=55
int Y=64
int Width=1166
int Height=776
int TabOrder=10
string DataObject="d_apoi_s"
boolean Border=false
boolean LiveScroll=true
end type

type pb_2 from picturebutton within w_apoi_m1
int X=969
int Y=880
int Width=279
int Height=144
int TabOrder=30
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

event clicked;ist_aroi.flag = 'N'
closewithreturn(parent, ist_aroi)
end event

type pb_1 from picturebutton within w_apoi_m1
int X=686
int Y=880
int Width=279
int Height=144
int TabOrder=20
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

event clicked;ist_aroi.flag = 'Y'
closewithreturn(parent, ist_aroi)


end event

type gb_1 from groupbox within w_apoi_m1
int X=27
int Y=12
int Width=1225
int Height=852
long TextColor=16711680
long BackColor=79219928
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

