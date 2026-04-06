$PBExportHeader$w_whbdcustret_w.srw
$PBExportComments$설계영업거래처검색(2002/04/16,이인호)
forward 
global type w_whbdcustret_w from Window
end type
type cb_17 from commandbutton within w_whbdcustret_w
end type
type cb_15 from commandbutton within w_whbdcustret_w
end type
type pb_2 from picturebutton within w_whbdcustret_w
end type
type pb_1 from picturebutton within w_whbdcustret_w
end type
type cb_19 from commandbutton within w_whbdcustret_w
end type
type dw_1 from datawindow within w_whbdcustret_w
end type
type cb_16 from commandbutton within w_whbdcustret_w
end type
type cb_ret from commandbutton within w_whbdcustret_w
end type
type sle_1 from singlelineedit within w_whbdcustret_w
end type
type cbx_1 from checkbox within w_whbdcustret_w
end type
type cb_14 from commandbutton within w_whbdcustret_w
end type
type cb_13 from commandbutton within w_whbdcustret_w
end type
type cb_12 from commandbutton within w_whbdcustret_w
end type
type cb_11 from commandbutton within w_whbdcustret_w
end type
type cb_10 from commandbutton within w_whbdcustret_w
end type
type cb_9 from commandbutton within w_whbdcustret_w
end type
type cb_8 from commandbutton within w_whbdcustret_w
end type
type cb_7 from commandbutton within w_whbdcustret_w
end type
type cb_6 from commandbutton within w_whbdcustret_w
end type
type cb_5 from commandbutton within w_whbdcustret_w
end type
type cb_4 from commandbutton within w_whbdcustret_w
end type
type cb_3 from commandbutton within w_whbdcustret_w
end type
type cb_2 from commandbutton within w_whbdcustret_w
end type
type cb_1 from commandbutton within w_whbdcustret_w
end type
type gb_1 from groupbox within w_whbdcustret_w
end type
end forward

global type w_whbdcustret_w from Window
int X=823
int Y=360
int Width=1381
int Height=1524
boolean TitleBar=true
string Title="설계영업거래처검색(w_whbdcustret_w)"
long BackColor=79741120
WindowType WindowType=response!
cb_17 cb_17
cb_15 cb_15
pb_2 pb_2
pb_1 pb_1
cb_19 cb_19
dw_1 dw_1
cb_16 cb_16
cb_ret cb_ret
sle_1 sle_1
cbx_1 cbx_1
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_whbdcustret_w w_whbdcustret_w

type variables
gs_whcustret_str ist_whcustret
string is_name, is_filter, is_where
int ii_name = 0, ii_code =  0

end variables

forward prototypes
public function string wf_custret (string ls_first, string ls_second)
end prototypes

public function string wf_custret (string ls_first, string ls_second);long ll_chr
string ls_chr, ls_result
choose case cbx_1.checked
	case true
//		ll_chr = pos("cust_name",")") + 1
//		messagebox ('',dw_1.getitemstring("cust_name"))
//		ls_result = "(mid(cust_name,1,2) >= '" + ls_first + "' and " + &
//		           "mid(cust_name,1,2) < '" + ls_second + "') or " + &
//					  "(left(cust_name,1) = '(' and " + &
//					  "( mid ( cust_name, pos(cust_name,')') + 1,2) >= '" + ls_first +"' AND " + &
//					  "mid ( cust_name, pos(cust_name,')') + 1,2) < '" + ls_second + "') " + &
		ls_result = "(mid(cust_name,1,2) >= '" + ls_first + "' and " + &
		            "mid(cust_name,1,2) < '" + ls_second + "') or " + &
		            "((left(cust_name,1) = '(' ) and  " + &
						"( mid ( cust_name, pos(cust_name,')') + 1,2) >= '" + ls_first + "' AND " + &
						"mid ( cust_name, pos(cust_name,')') + 1,2) < '" + ls_second + "'))"
//		ls_result = "(mid(cust_name,1,2) >= '" + ls_first + "' and " + &
//		           "mid(cust_name,1,2) < '" + ls_second + "') or " + &
//					  "(left(cust_name,1) = '(' and " + &
//					  "(mid(cust_name,5,2) >= '" + ls_first + "' and " + &
//					  "mid(cust_name,5,2) < '" + ls_second + "')) "
	case false
		ls_result = "mid(cust_name,1,2) >= '" + ls_first + "' and mid(cust_name,1,2) < '" + ls_second + "'"
end choose

return ls_result
end function

on w_whbdcustret_w.create
this.cb_17=create cb_17
this.cb_15=create cb_15
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_19=create cb_19
this.dw_1=create dw_1
this.cb_16=create cb_16
this.cb_ret=create cb_ret
this.sle_1=create sle_1
this.cbx_1=create cbx_1
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_17,&
this.cb_15,&
this.pb_2,&
this.pb_1,&
this.cb_19,&
this.dw_1,&
this.cb_16,&
this.cb_ret,&
this.sle_1,&
this.cbx_1,&
this.cb_14,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_whbdcustret_w.destroy
destroy(this.cb_17)
destroy(this.cb_15)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_19)
destroy(this.dw_1)
destroy(this.cb_16)
destroy(this.cb_ret)
destroy(this.sle_1)
destroy(this.cbx_1)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

ist_whcustret = message.powerobjectparm

end event

type cb_17 from commandbutton within w_whbdcustret_w
int X=1015
int Y=692
int Width=320
int Height=92
int TabOrder=150
string Text="코드정렬"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;if ii_name = 0 then
	dw_1.setsort('cust_no A')
	ii_name = 1
elseif ii_name = 1 then
	dw_1.setsort('cust_no D')
	ii_name = 0
end if
dw_1.sort()
end event

type cb_15 from commandbutton within w_whbdcustret_w
int X=1015
int Y=592
int Width=320
int Height=92
int TabOrder=140
string Text="상호정렬"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;if ii_code = 0 then
	dw_1.setsort('cust_name A')
	ii_code = 1
elseif ii_code = 1 then
	dw_1.setsort('cust_name D')
	ii_code = 0
end if
dw_1.sort()

end event

type pb_2 from picturebutton within w_whbdcustret_w
int X=1019
int Y=1204
int Width=311
int Height=168
int TabOrder=160
string Text="취소"
string PictureName="c:\bmp\취소.bmp"
Alignment HTextAlign=Right!
boolean Cancel=true
int TextSize=-12
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;ist_Whcustret.cust_chk = 'N'
closewithreturn(parent,ist_whcustret)

end event

type pb_1 from picturebutton within w_whbdcustret_w
int X=1019
int Y=1020
int Width=311
int Height=168
int TabOrder=150
string Text="확인"
string PictureName="c:\bmp\확인1.bmp"
Alignment HTextAlign=Right!
boolean Default=true
int TextSize=-12
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row

ll_row = dw_1.getrow()

if ll_row < 1 then return

ist_whcustret.cust_name = dw_1.object.cust_name[ll_row]
ist_whcustret.cust_no = dw_1.object.cust_no[ll_row]
ist_whcustret.cust_chk = 'Y'

closewithreturn(parent,ist_whcustret)

end event

type cb_19 from commandbutton within w_whbdcustret_w
int X=55
int Y=156
int Width=233
int Height=96
int TabOrder=100
string Text="ABC.."
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row
string ls_name, ls_filter, ls_where

dw_1.setredraw(false)

choose case cbx_1.checked
	case true
		ls_where = "(mid(cust_name,1,2) >= 'A'  or " + &
					  "(left(cust_name,1) = '(' and (mid(cust_name,5,2) >= 'A' "
	case false
		ls_where = "mid(cust_name,1,2) >= 'A' "
end choose

dw_1.setfilter(ls_where)
dw_1.filter()
dw_1.setredraw(true)
end event

type dw_1 from datawindow within w_whbdcustret_w
int X=27
int Y=420
int Width=951
int Height=956
int TabOrder=130
string DataObject="d_whbdcustret_s"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event doubleclicked;pb_1.triggerevent(clicked!)
end event

type cb_16 from commandbutton within w_whbdcustret_w
int X=1024
int Y=316
int Width=247
int Height=92
int TabOrder=170
string Text="RESET"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setfilter('')
dw_1.filter()

end event

type cb_ret from commandbutton within w_whbdcustret_w
int X=741
int Y=316
int Width=247
int Height=92
int TabOrder=120
string Text="검색"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row
string ls_name, ls_filter, ls_where

dw_1.setredraw(false)

ls_name = string(sle_1.text)
if trim(ls_name) = '' or isnull(ls_name) then
	ls_where = ''
else
	ls_filter = '%' + ls_name + '%'
	ls_where = "cust_name like '" + ls_filter + "'"
end if
dw_1.setfilter(ls_where)
dw_1.filter()
dw_1.setredraw(true)
//gs_ds_whcustret.retrieve(ls_where) 
//
//dw_1.reset()
//dw_1.setredraw(false)
//for ll_row=1 to gs_ds_whcustret.rowcount()
//	dw_1.insertrow(0)
//	dw_1.object.cust_name[ll_row] =  gs_ds_whcustret.getitemstring(ll_row,'cust_name')
//next
//dw_1.setredraw(true)
//
//for ll_row =1 to gs_ds_whcustret.rowcount()
	




end event

type sle_1 from singlelineedit within w_whbdcustret_w
int X=27
int Y=316
int Width=672
int Height=92
int TabOrder=110
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event getfocus;cb_ret.default = true
pb_1.default = false

end event

event losefocus;cb_ret.default = false
pb_1.default = true

end event

type cbx_1 from checkbox within w_whbdcustret_w
int X=59
int Y=68
int Width=238
int Height=76
string Text="(주)"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type cb_14 from commandbutton within w_whbdcustret_w
int X=297
int Y=156
int Width=133
int Height=96
int TabOrder=90
string Text="ㅇ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('아','자'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_13 from commandbutton within w_whbdcustret_w
int X=439
int Y=156
int Width=133
int Height=96
int TabOrder=190
string Text="ㅈ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('자','차'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_12 from commandbutton within w_whbdcustret_w
int X=581
int Y=156
int Width=133
int Height=96
int TabOrder=200
string Text="ㅊ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('차','카'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_11 from commandbutton within w_whbdcustret_w
int X=722
int Y=156
int Width=133
int Height=96
int TabOrder=180
string Text="ㅋ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('카','타'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_10 from commandbutton within w_whbdcustret_w
int X=864
int Y=156
int Width=133
int Height=96
int TabOrder=210
string Text="ㅌ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('타','파'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_9 from commandbutton within w_whbdcustret_w
int X=1006
int Y=156
int Width=133
int Height=96
int TabOrder=220
string Text="ㅍ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('파','하'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_8 from commandbutton within w_whbdcustret_w
int X=1147
int Y=156
int Width=133
int Height=96
int TabOrder=230
string Text="ㅎ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('하','힣'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_7 from commandbutton within w_whbdcustret_w
int X=1147
int Y=56
int Width=133
int Height=96
int TabOrder=80
string Text="ㅅ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('사','아'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_6 from commandbutton within w_whbdcustret_w
int X=1006
int Y=56
int Width=133
int Height=96
int TabOrder=70
string Text="ㅂ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('바','사'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_5 from commandbutton within w_whbdcustret_w
int X=864
int Y=56
int Width=133
int Height=96
int TabOrder=60
string Text="ㅁ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('마','바'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_4 from commandbutton within w_whbdcustret_w
int X=722
int Y=56
int Width=133
int Height=96
int TabOrder=50
string Text="ㄹ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('라','마'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_3 from commandbutton within w_whbdcustret_w
int X=581
int Y=56
int Width=133
int Height=96
int TabOrder=40
string Text="ㄷ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('다','라'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_2 from commandbutton within w_whbdcustret_w
int X=439
int Y=56
int Width=133
int Height=96
int TabOrder=30
string Text="ㄴ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('나','다'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_1 from commandbutton within w_whbdcustret_w
int X=297
int Y=56
int Width=133
int Height=96
int TabOrder=10
string Text="ㄱ"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('가','나'))
dw_1.filter()
dw_1.setredraw(true)

end event

type gb_1 from groupbox within w_whbdcustret_w
int X=23
int Width=1317
int Height=280
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

