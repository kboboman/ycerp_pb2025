$PBExportHeader$w_whinspdet_w.srw
$PBExportComments$입고내역상세조회(1999/06/12,  이인호)
forward
global type w_whinspdet_w from Window
end type
type cb_1 from commandbutton within w_whinspdet_w
end type
type dw_1 from datawindow within w_whinspdet_w
end type
end forward

global type w_whinspdet_w from Window
int X=370
int Y=388
int Width=2738
int Height=1564
boolean TitleBar=true
string Title="입고내역상세조회(w_whinspdet_w)"
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
cb_1 cb_1
dw_1 dw_1
end type
global w_whinspdet_w w_whinspdet_w

type variables
gs_where istr_where

end variables

on w_whinspdet_w.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_whinspdet_w.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.SetTransObject(SQLCA)
istr_where = Message.PowerObjectParm
dw_1.retrieve(istr_where.str1)

end event

event close;
CloseWithReturn(this, istr_where)
end event

type cb_1 from commandbutton within w_whinspdet_w
int X=2414
int Y=1376
int Width=297
int Height=92
int TabOrder=20
string Text="확인"
boolean Default=true
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;istr_where.chk = "Y"
CloseWithReturn(parent, istr_where)
end event

type dw_1 from datawindow within w_whinspdet_w
int X=18
int Y=16
int Width=2683
int Height=1344
int TabOrder=10
string DataObject="d_iopurrcpt_inspdet_m"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

