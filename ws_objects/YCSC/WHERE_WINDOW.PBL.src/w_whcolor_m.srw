$PBExportHeader$w_whcolor_m.srw
$PBExportComments$수주칼라코일등록(1999/06/03, 이인호)
forward
global type w_whcolor_m from Window
end type
type cb_9 from commandbutton within w_whcolor_m
end type
type cb_5 from commandbutton within w_whcolor_m
end type
type cb_8 from commandbutton within w_whcolor_m
end type
type cb_6 from commandbutton within w_whcolor_m
end type
type cb_7 from commandbutton within w_whcolor_m
end type
type st_2 from statictext within w_whcolor_m
end type
type cb_4 from commandbutton within w_whcolor_m
end type
type cb_3 from commandbutton within w_whcolor_m
end type
type sle_1 from singlelineedit within w_whcolor_m
end type
type cb_2 from commandbutton within w_whcolor_m
end type
type cb_1 from commandbutton within w_whcolor_m
end type
type dw_1 from datawindow within w_whcolor_m
end type
end forward

global type w_whcolor_m from Window
int X=823
int Y=360
int Width=1115
int Height=1832
boolean TitleBar=true
long BackColor=79741120
WindowType WindowType=response!
cb_9 cb_9
cb_5 cb_5
cb_8 cb_8
cb_6 cb_6
cb_7 cb_7
st_2 st_2
cb_4 cb_4
cb_3 cb_3
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_whcolor_m w_whcolor_m

type variables
gs_where istr_where
string is_code, is_name
int ii_sw = 0, ii_sw2 = 0
end variables

on w_whcolor_m.create
this.cb_9=create cb_9
this.cb_5=create cb_5
this.cb_8=create cb_8
this.cb_6=create cb_6
this.cb_7=create cb_7
this.st_2=create st_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_9,&
this.cb_5,&
this.cb_8,&
this.cb_6,&
this.cb_7,&
this.st_2,&
this.cb_4,&
this.cb_3,&
this.sle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_whcolor_m.destroy
destroy(this.cb_9)
destroy(this.cb_5)
destroy(this.cb_8)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.SetTransObject(SQLCA)
dw_1.retrieve()
long ll_row

ll_row = 1
istr_where = Message.PowerObjectParm

//setfilter
cb_5.triggerevent(clicked!)
ll_row = dw_1.Find( "color_name = '" + istr_where.name + "'", ll_row, dw_1.RowCount())
IF ll_row > 0 THEN
	dw_1.ScrollToRow(ll_row)
else
	sle_1.text = trim(istr_where.name)
	cb_4.triggerevent(clicked!)
	if dw_1.rowcount() < 1 then
		cb_3.triggerevent(clicked!)
		sle_1.text = trim(istr_where.name)
	end if
end if

end event

type cb_9 from commandbutton within w_whcolor_m
int X=50
int Y=28
int Width=169
int Height=80
int TabOrder=30
string Text="코드"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "color_code A "
else
	ii_sw = 1
	ls_sort = "color_code D "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type cb_5 from commandbutton within w_whcolor_m
int X=224
int Y=28
int Width=544
int Height=80
int TabOrder=20
string Text="색상명 정렬"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;string ls_sort

IF ii_sw2 = 0 then
	ii_sw2 = 1
	ls_sort = "color_name A "
else
	ii_sw2 = 1
	ls_sort = "color_name D "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type cb_8 from commandbutton within w_whcolor_m
int X=18
int Y=1640
int Width=215
int Height=92
int TabOrder=70
string Text="저장"
int TextSize=-10
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row
string ls_code
dwitemstatus l_status

dw_1.accepttext()
//setnull(ls_code)
//select max(supp_no)  into :ls_code from bsupp;
//if isnull(ls_code) or sqlca.SQLCode = 100 then
//	ls_code = "001"
//else 
//	ls_code = string(integer(ls_code) + 1, "000")
//end if
//for ll_row = 1 to dw_1.rowcount()
//	if isnull(dw_1.object.supp_name[ll_row]) or trim(dw_1.object.supp_name[ll_row]) = '' then 
//		beep(1)
//		dw_1.scrolltorow(ll_row)
//		return
//	end if
//	l_status = dw_1.getitemstatus(ll_row, 0,Primary!)
//	if l_status = new! or l_status = newmodified! then
//		dw_1.object.supp_no[ll_row] = ls_code
//		ls_code = string(integer(ls_code) + 1, "000")
//	end if
//next
if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if

//////////

end event

type cb_6 from commandbutton within w_whcolor_m
int X=18
int Y=1448
int Width=215
int Height=92
int TabOrder=40
string Text="추가"
int TextSize=-10
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row

dw_1.accepttext()
ll_row = dw_1.insertrow(dw_1.getrow() + 1)
dw_1.ScrollToRow(ll_row)
dw_1.setcolumn('color_code')
dw_1.setfocus()


end event

type cb_7 from commandbutton within w_whcolor_m
int X=18
int Y=1544
int Width=215
int Height=92
int TabOrder=50
string Text="삭제"
int TextSize=-10
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row, ll_cnt, ll_cnt2
string ls_code

dw_1.accepttext()
if dw_1.getrow() < 1 then return
ll_row = dw_1.getrow() 
ls_code = trim(dw_1.object.color_code[ll_row])

select count(*) into :ll_cnt from saledet where color = :ls_code;
select count(*) into :ll_cnt2 from sale where color = :ls_code;

if ll_cnt + ll_cnt2 > 0 then
	MessageBox("확인", "이코드는 이미 사용중입니다. 삭제할 수 없습니다!")
	return
end if

dw_1.deleterow(ll_row)
dw_1.accepttext()
if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if


end event

type st_2 from statictext within w_whcolor_m
int X=242
int Y=1572
int Width=142
int Height=64
boolean Enabled=false
string Text="  명"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type cb_4 from commandbutton within w_whcolor_m
int X=274
int Y=1640
int Width=256
int Height=92
int TabOrder=80
string Text="조회"
int TextSize=-10
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;string ls_where,ls_filter, ls_name

ls_name = trim(sle_1.text)

IF ISNULL(ls_name) OR ls_name = "" THEN 
ELSE
	ls_filter = '%' + ls_name + '%'
	ls_where = "color_name like '" + ls_filter + "'"
END IF
dw_1.SetFilter(ls_where)
dw_1.Filter( )
if dw_1.rowcount() > 1 then
	dw_1.ScrollToRow(1)
	istr_where.str1 = dw_1.object.color_code[1]
	istr_where.name = dw_1.object.color_name[1]
end if


end event

type cb_3 from commandbutton within w_whcolor_m
int X=539
int Y=1640
int Width=256
int Height=92
int TabOrder=90
string Text="RESET"
int TextSize=-10
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;string ls_where

setnull(ls_where)
sle_1.text = ""
dw_1.SetFilter("")
dw_1.Filter( )
end event

type sle_1 from singlelineedit within w_whcolor_m
int X=384
int Y=1544
int Width=398
int Height=92
int TabOrder=60
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

event modified;IF ISNULL(TRIM(this.TEXT)) OR TRIM(THIS.TEXT) = "" THEN 
ELSE
	cb_4.triggerevent(clicked!)
end if
end event

type cb_2 from commandbutton within w_whcolor_m
int X=823
int Y=1640
int Width=256
int Height=92
int TabOrder=30
string Text="취소"
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;istr_where.chk = "N"
closewithreturn(parent, istr_where)

end event

type cb_1 from commandbutton within w_whcolor_m
int X=823
int Y=1544
int Width=256
int Height=92
int TabOrder=10
string Text="확인"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row

dw_1.accepttext()
ll_row = dw_1.getrow()

if ll_row > 0 then
//	IF ISNULL( dw_1.object.color_code[ll_row] ) THEN
//		BEEP(2)
//		dw_1.setcolumn('color_code')
//		dw_1.setfocus()
//		RETURN
//	END IF
//	IF ISNULL( dw_1.object.color_name[ll_row] ) THEN
//		BEEP(2)
//		dw_1.setcolumn('color_name')
//		dw_1.setfocus()
//		RETURN
//	END IF
//	
//	dw_1.update()
//	commit;
	istr_where.str1 = dw_1.object.color_code[ll_row]
	istr_where.name = dw_1.object.color_name[ll_row]
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
//	rollback;
end if
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whcolor_m
int X=37
int Y=116
int Width=859
int Height=1308
int TabOrder=100
string DataObject="d_whcolor_m"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event itemchanged;//THIS.ACCEPTTEXT()
//
//IF dwo.name = 'color_code' then
//	is_code = this.object.color_code[this.getrow()]
//	if THIS.retrieve(is_code) < 1 then
//		THIS.INSERTROW(0)
//		THIS.object.color_code[1] = is_code
//	end if
//	dw_1.setcolumn('color_name')
//	dw_1.setfocus()
//end if
//
end event

event doubleclicked;if row < 1 then return

istr_where.chk = "Y"
istr_where.str1 = this.object.color_code[row]
istr_where.name = this.object.color_name[row]
CloseWithReturn(parent, istr_where)
end event

event getfocus;parent.cb_1.default = true


end event

event losefocus;this.accepttext()
parent.cb_1.default = false


end event

event rowfocuschanged;if this.getrow() < 1 then return

this.SelectRow(0, false)
this.SelectRow(currentrow, TRUE)
istr_where.chk = "Y"
istr_where.str1 = this.object.color_code[currentrow]
istr_where.name = this.object.color_name[currentrow]


end event

