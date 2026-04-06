$PBExportHeader$w_printsetup.srw
$PBExportComments$프린트 Option을 조정하는 Window
forward 
global type w_printsetup from window
end type
type st_7 from statictext within w_printsetup
end type
type st_4 from statictext within w_printsetup
end type
type pb_print from picturebutton within w_printsetup
end type
type pb_printer from picturebutton within w_printsetup
end type
type em_persent from editmask within w_printsetup
end type
type rb_custom from radiobutton within w_printsetup
end type
type rb_30 from radiobutton within w_printsetup
end type
type rb_65 from radiobutton within w_printsetup
end type
type rb_80 from radiobutton within w_printsetup
end type
type rb_90 from radiobutton within w_printsetup
end type
type rb_100 from radiobutton within w_printsetup
end type
type rb_150 from radiobutton within w_printsetup
end type
type rb_200 from radiobutton within w_printsetup
end type
type st_3 from statictext within w_printsetup
end type
type sle_part from singlelineedit within w_printsetup
end type
type rb_part from radiobutton within w_printsetup
end type
type rb_current from radiobutton within w_printsetup
end type
type rb_all from radiobutton within w_printsetup
end type
type em_copy from editmask within w_printsetup
end type
type st_2 from statictext within w_printsetup
end type
type gb_4 from groupbox within w_printsetup
end type
type gb_3 from groupbox within w_printsetup
end type
type gb_2 from groupbox within w_printsetup
end type
type pb_cancle from picturebutton within w_printsetup
end type
type st_5 from statictext within w_printsetup
end type
type ddlb_paper from dropdownlistbox within w_printsetup
end type
type ddlb_port from dropdownlistbox within w_printsetup
end type
type em_1 from editmask within w_printsetup
end type
type hsb_1 from hscrollbar within w_printsetup
end type
type ddlb_page from dropdownlistbox within w_printsetup
end type
type st_6 from statictext within w_printsetup
end type
type gb_5 from groupbox within w_printsetup
end type
type gb_6 from groupbox within w_printsetup
end type
type gb_1 from groupbox within w_printsetup
end type
end forward

global type w_printsetup from window
integer x = 832
integer y = 360
integer width = 1989
integer height = 1072
boolean titlebar = true
string title = "프린트"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
string icon = "Form!"
boolean center = true
event ue_open pbm_custom01
st_7 st_7
st_4 st_4
pb_print pb_print
pb_printer pb_printer
em_persent em_persent
rb_custom rb_custom
rb_30 rb_30
rb_65 rb_65
rb_80 rb_80
rb_90 rb_90
rb_100 rb_100
rb_150 rb_150
rb_200 rb_200
st_3 st_3
sle_part sle_part
rb_part rb_part
rb_current rb_current
rb_all rb_all
em_copy em_copy
st_2 st_2
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
pb_cancle pb_cancle
st_5 st_5
ddlb_paper ddlb_paper
ddlb_port ddlb_port
em_1 em_1
hsb_1 hsb_1
ddlb_page ddlb_page
st_6 st_6
gb_5 gb_5
gb_6 gb_6
gb_1 gb_1
end type
global w_printsetup w_printsetup

type variables
st_print ist_print
string is_prestyle
end variables

forward prototypes
public subroutine wf_printsetting ()
public subroutine wf_printzoom (integer arg_persent)
end prototypes

event ue_open;// 이프로그램은 프린트할 Option을 정의하는 프로그램이다.
long ll_row
Int  li_persent, li_paper

// 출력하고자하는 DataWindow와 DataObject를 받는다.
ist_print = Message.PowerObjectParm

// 프린터 정보를 가져온다.
ist_print.st_datawindow.SetReDraw(false)
this.title = '프린트: ' + ist_print.st_datawindow.Describe('DataWindow.Printer')

// 출력하고자 하는 DataWindow와 DataObject를 받는다.
// ist_print = Message.PowerObjectParm
// ist_print.st_datawindow.Object.DataWindow.Print.PreView = false
// 0 : (Default) Form, group, query, or tabular
// 1 : Grid
// 2 : Label
// 3 : Graph
// 4 : Crosstab
// 5 : Composite
// 7 : RichText
is_prestyle = ist_print.st_datawindow.Describe('DataWindow.Processing')

// 프린트 할 용지의 모양을 선택
choose case ist_print.st_datawindow.Describe('DataWindow.Print.Orientation')
	case '0'		////Printer Default
		ddlb_port.SelectItem(1)
		ist_print.st_datawindow.Modify('DataWindow.Print.Orientation = 0')
	case '1'		////LandScape
		ddlb_port.SelectItem(2)
		ist_print.st_datawindow.Modify('DataWindow.Print.Orientation = 1')
	case '2'		////PortRait
		ddlb_port.SelectItem(3)
		ist_print.st_datawindow.Modify('DataWindow.Print.Orientation = 2')
	case else ////Printer Default
		ddlb_port.SelectItem(1)
		ist_print.st_datawindow.Modify('DataWindow.Print.Orientation = 0')
end choose

// 프린트 할 용지를 선택한다.
choose case ist_print.st_datawindow.Describe('DataWindow.Print.Paper.Size')
	case '0'////Printer Default
		ddlb_paper.SelectItem(1)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 0')
	case '8'
		ddlb_paper.SelectItem(2)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 8')
	case '9'
		ddlb_paper.SelectItem(3)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 9')
	case '11'
		ddlb_paper.SelectItem(4)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 11')
	case '12'
		ddlb_paper.SelectItem(5)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 12')
	case '13'
		ddlb_paper.SelectItem(6)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 13')
	case '41'
		ddlb_paper.SelectItem(7)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 41')		
	case '17'
		ddlb_paper.SelectItem(8)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 17')		
	case else ////Printer Default
		ddlb_paper.SelectItem(1)
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 0')
end choose
// ddlb_paper.SelectItem(1)	// 프린트 용지를 프린트 Default로 한다.

ddlb_page.SelectItem(1)		// 출력범위 Default로 한다.

// 출력물 확대/축소
choose case ist_print.st_datawindow.Describe('DataWindow.Zoom')
	case '200'
		rb_200.Checked = True
		rb_200.TriggerEvent(Clicked!)
	case '150'
		rb_150.Checked = True
		rb_150.TriggerEvent(Clicked!)
	case '100'
		rb_100.Checked = True
		rb_100.TriggerEvent(Clicked!)
	case '90'
		rb_90.Checked = True
		rb_90.TriggerEvent(Clicked!)
	case '80'
		rb_80.Checked = True
		rb_80.TriggerEvent(Clicked!)
	case '65'
		rb_65.Checked = True
		rb_65.TriggerEvent(Clicked!)
	case '30'
		rb_30.Checked = True
		rb_30.TriggerEvent(Clicked!)
	case else
		rb_custom.Checked = True
		em_persent.Text    = String(ist_print.st_datawindow.Object.DataWindow.Zoom)
		em_persent.Enabled = True
		wf_printzoom( Integer(String(ist_print.st_datawindow.Object.DataWindow.Zoom)))
end choose
//
ist_print.st_datawindow.Object.DataWindow.Print.PreView = True

// 화면 확대 비율
em_1.Text = String(100)
ist_print.st_datawindow.SetReDraw(True)

end event

public subroutine wf_printsetting ();////Script By 김구현 1998-01-10
////프린트를 Setting한다.
end subroutine

public subroutine wf_printzoom (integer arg_persent);//실제 출력물을 확대/축소한다.
//arg_dw : DataWindow 이름
//arg_persent : 확대/축소비율(%)
if is_prestyle <> '3' then
	ist_print.st_datawindow.Object.DataWindow.Zoom = arg_persent
end if
end subroutine

on w_printsetup.create
this.st_7=create st_7
this.st_4=create st_4
this.pb_print=create pb_print
this.pb_printer=create pb_printer
this.em_persent=create em_persent
this.rb_custom=create rb_custom
this.rb_30=create rb_30
this.rb_65=create rb_65
this.rb_80=create rb_80
this.rb_90=create rb_90
this.rb_100=create rb_100
this.rb_150=create rb_150
this.rb_200=create rb_200
this.st_3=create st_3
this.sle_part=create sle_part
this.rb_part=create rb_part
this.rb_current=create rb_current
this.rb_all=create rb_all
this.em_copy=create em_copy
this.st_2=create st_2
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.pb_cancle=create pb_cancle
this.st_5=create st_5
this.ddlb_paper=create ddlb_paper
this.ddlb_port=create ddlb_port
this.em_1=create em_1
this.hsb_1=create hsb_1
this.ddlb_page=create ddlb_page
this.st_6=create st_6
this.gb_5=create gb_5
this.gb_6=create gb_6
this.gb_1=create gb_1
this.Control[]={this.st_7,&
this.st_4,&
this.pb_print,&
this.pb_printer,&
this.em_persent,&
this.rb_custom,&
this.rb_30,&
this.rb_65,&
this.rb_80,&
this.rb_90,&
this.rb_100,&
this.rb_150,&
this.rb_200,&
this.st_3,&
this.sle_part,&
this.rb_part,&
this.rb_current,&
this.rb_all,&
this.em_copy,&
this.st_2,&
this.gb_4,&
this.gb_3,&
this.gb_2,&
this.pb_cancle,&
this.st_5,&
this.ddlb_paper,&
this.ddlb_port,&
this.em_1,&
this.hsb_1,&
this.ddlb_page,&
this.st_6,&
this.gb_5,&
this.gb_6,&
this.gb_1}
end on

on w_printsetup.destroy
destroy(this.st_7)
destroy(this.st_4)
destroy(this.pb_print)
destroy(this.pb_printer)
destroy(this.em_persent)
destroy(this.rb_custom)
destroy(this.rb_30)
destroy(this.rb_65)
destroy(this.rb_80)
destroy(this.rb_90)
destroy(this.rb_100)
destroy(this.rb_150)
destroy(this.rb_200)
destroy(this.st_3)
destroy(this.sle_part)
destroy(this.rb_part)
destroy(this.rb_current)
destroy(this.rb_all)
destroy(this.em_copy)
destroy(this.st_2)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.pb_cancle)
destroy(this.st_5)
destroy(this.ddlb_paper)
destroy(this.ddlb_port)
destroy(this.em_1)
destroy(this.hsb_1)
destroy(this.ddlb_page)
destroy(this.st_6)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.gb_1)
end on

event open;//
PostEvent('ue_open')
end event

type st_7 from statictext within w_printsetup
integer x = 64
integer y = 820
integer width = 302
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
boolean enabled = false
string text = "화면확대:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_printsetup
integer x = 1111
integer y = 452
integer width = 302
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
boolean enabled = false
string text = "출력범위:"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_print from picturebutton within w_printsetup
integer x = 1563
integer y = 104
integer width = 325
integer height = 184
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출력"
string picturename = "c:\bmp\프린트.bmp"
alignment htextalign = right!
vtextalign vtextalign = vcenter!
end type

event clicked;//
if isnull(ist_print.st_datawindow) then
else
	ist_print.st_datawindow.Print()
	
	Close(Parent)
end if


end event

type pb_printer from picturebutton within w_printsetup
integer x = 1605
integer y = 772
integer width = 325
integer height = 184
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "셋업"
boolean originalsize = true
string picturename = "c:\bmp\프린트셋업.bmp"
alignment htextalign = right!
vtextalign vtextalign = vcenter!
end type

event clicked;//
if isnull(ist_print.st_datawindow) then RETURN

PrintSetUp()

Parent.title = '프린트: ' + ist_print.st_datawindow.Describe('DataWindow.Printer')
ist_print.st_datawindow.Object.DataWindow.Print.PreView = True

end event

type em_persent from editmask within w_printsetup
integer x = 681
integer y = 640
integer width = 219
integer height = 68
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = "H"
end type

event modified;//wf_printzoom( integer(mid(this.text,1,len(trim(this.text)) - 1)))
wf_printzoom(Integer(THIS.Text))
end event

type rb_custom from radiobutton within w_printsetup
integer x = 366
integer y = 640
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "사용자"
end type

event clicked;em_persent.Text = '0'
em_persent.Enabled = True
em_persent.SetFocus()
end event

type rb_30 from radiobutton within w_printsetup
integer x = 50
integer y = 640
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "30%"
end type

event clicked;em_persent.Text = '0'
em_persent.Enabled = False
wf_printzoom( integer(MidA(this.text,1,LenA(trim(this.text)) - 1)))
//wf_printzoom(dw_1, 30)
end event

type rb_65 from radiobutton within w_printsetup
integer x = 681
integer y = 544
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "65%"
end type

event clicked;em_persent.Text = '0'
em_persent.Enabled = False
wf_printzoom( integer(MidA(this.text,1,LenA(trim(this.text)) - 1)))
//wf_printzoom(dw_1, 65)
end event

type rb_80 from radiobutton within w_printsetup
integer x = 366
integer y = 544
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "80%"
end type

event clicked;em_persent.Text = '0'
em_persent.Enabled = False
wf_printzoom( integer(MidA(this.text,1,LenA(trim(this.text)) - 1)))
//wf_printzoom( integer(mid(this.text,1,len(trim(this.text)) - 1)))
end event

type rb_90 from radiobutton within w_printsetup
integer x = 50
integer y = 544
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "90%"
end type

event clicked;em_persent.Text = '0'
em_persent.Enabled = False
wf_printzoom( integer(MidA(this.text,1,LenA(trim(this.text)) - 1)))
//wf_printzoom(dw_1, 90)
end event

type rb_100 from radiobutton within w_printsetup
integer x = 681
integer y = 448
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "100%"
boolean checked = true
end type

event clicked;em_persent.Text = '0'
em_persent.Enabled = False
wf_printzoom( integer(MidA(this.text,1,LenA(trim(this.text)) - 1)))
//wf_printzoom(dw_1, 100)
end event

type rb_150 from radiobutton within w_printsetup
integer x = 366
integer y = 448
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "150%"
end type

event clicked;em_persent.Text = '0'
em_persent.Enabled = False
wf_printzoom( integer(MidA(this.text,1,LenA(trim(this.text)) - 1)))
//wf_printzoom(dw_1, 150)
end event

type rb_200 from radiobutton within w_printsetup
integer x = 50
integer y = 448
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "200%"
end type

event clicked;em_persent.Text = '0'
em_persent.Enabled = False
wf_printzoom( integer(MidA(this.text,1,LenA(trim(this.text)) - 1)))
//wf_printzoom(200)
end event

type st_3 from statictext within w_printsetup
integer x = 59
integer y = 292
integer width = 1038
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
boolean enabled = false
string text = "출력범위를 입력하십시요(예 1, 2, 4-8)"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_part from singlelineedit within w_printsetup
integer x = 402
integer y = 192
integer width = 686
integer height = 72
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event losefocus;String ls_command

ls_command = "DataWindow.Print.Page.Range = '" + THIS.Text + "'"
ist_print.st_datawindow.Modify(ls_command)
end event

type rb_part from radiobutton within w_printsetup
integer x = 73
integer y = 196
integer width = 448
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "부  분"
end type

event clicked;sle_part.Text = ''
sle_part.Enabled = True
sle_part.SetFocus()
end event

type rb_current from radiobutton within w_printsetup
integer x = 73
integer y = 132
integer width = 512
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "현재면"
end type

event clicked;String ls_command, ls_temp
Long   ll_row

sle_part.Text = ''
sle_part.Enabled = False

////현재의 Row를 가져온다.
ll_row = ist_print.st_datawindow.getrow()
////현재의 Row를 이용하여 현재 Page를 구한다.
ls_temp = ist_print.st_datawindow.describe("evaluate('page()',"+string(ll_row)+")")

ls_command = "DataWindow.Print.Page.Range = '" + ls_temp + "'"
ist_print.st_datawindow.Modify(ls_command)
////MessageBox('페이지', ls_temp)

end event

type rb_all from radiobutton within w_printsetup
integer x = 73
integer y = 68
integer width = 448
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "전  체"
boolean checked = true
end type

event clicked;String ls_command

sle_part.Text = ''
sle_part.Enabled = False
ls_command = "DataWindow.Print.Page.Range = ''"
ist_print.st_datawindow.Modify(ls_command)
end event

type em_copy from editmask within w_printsetup
integer x = 873
integer y = 60
integer width = 219
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
string displaydata = ""
end type

event losefocus;//
string ls_command

if IsNumber(This.Text) then
	ls_command = "DataWindow.Print.Copies = " + This.Text
	
	if isnull(ist_print.st_datawindow) then
	else
		ist_print.st_datawindow.Modify( ls_command )
	end if	
end if

end event

type st_2 from statictext within w_printsetup
integer x = 585
integer y = 68
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
boolean enabled = false
string text = "인쇄매수:"
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_printsetup
boolean visible = false
integer x = 489
integer y = 996
integer width = 425
integer height = 292
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "출력방향"
end type

type gb_3 from groupbox within w_printsetup
integer x = 27
integer y = 384
integer width = 987
integer height = 336
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "내용 확대/축소"
end type

type gb_2 from groupbox within w_printsetup
boolean visible = false
integer x = 46
integer y = 996
integer width = 425
integer height = 292
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "출력범위"
end type

type pb_cancle from picturebutton within w_printsetup
integer x = 1184
integer y = 104
integer width = 325
integer height = 184
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean originalsize = true
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
vtextalign vtextalign = vcenter!
end type

event clicked;//
if isnull(ist_print.st_datawindow) then
else
	ist_print.st_datawindow.setredraw( true )
end if

Close(Parent)

end event

type st_5 from statictext within w_printsetup
integer x = 1111
integer y = 548
integer width = 302
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
boolean enabled = false
string text = "출력방향:"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_paper from dropdownlistbox within w_printsetup
integer x = 1413
integer y = 632
integer width = 425
integer height = 316
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Default","A3","A4","A5","B4","B5","136칼럼","11x17"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 0')
	CASE 2
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 8')
	CASE 3
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 9')
	CASE 4
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 11')
	CASE 5
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 12')
	CASE 6
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 13')
	CASE 7
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 41')		
	CASE 8
		ist_print.st_datawindow.Modify('DataWindow.Print.Paper.Size = 17')		
END CHOOSE
end event

type ddlb_port from dropdownlistbox within w_printsetup
integer x = 1413
integer y = 536
integer width = 425
integer height = 296
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Default","가로","세로"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		ist_print.st_datawindow.Modify('DataWindow.Print.Orientation = 0')
	CASE 2
		ist_print.st_datawindow.Modify('DataWindow.Print.Orientation = 1')
	CASE 3
		ist_print.st_datawindow.Modify('DataWindow.Print.Orientation = 2')
END CHOOSE
end event

type em_1 from editmask within w_printsetup
integer x = 366
integer y = 812
integer width = 247
integer height = 72
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
boolean enabled = false
string text = "100"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
string displaydata = "~b"
end type

type hsb_1 from hscrollbar within w_printsetup
integer x = 635
integer y = 812
integer width = 882
integer height = 72
boolean stdheight = false
integer minposition = 20
integer maxposition = 200
integer position = 100
end type

event lineleft;////왼쪽 화살키를 움직일때
String ls_command

IF THIS.PosiTion > 20 THEN
	THIS.Position = THIS.Position - 1
	em_1.Text = String(THIS.Position)
	ls_command = 'DataWindow.Print.PreView.Zoom = ' + em_1.Text
	ist_print.st_datawindow.setredraw(false)
	ist_print.st_datawindow.Modify(ls_command)
	ist_print.st_datawindow.setredraw(true)
END IF
end event

event lineright;////오른쪽 화살키를 움직일때
String ls_command

IF THIS.Position < 200 THEN
	THIS.Position = THIS.Position + 1
	em_1.Text = String(THIS.Position)
	ls_command = 'DataWindow.Print.PreView.Zoom = ' + em_1.Text
	ist_print.st_datawindow.setredraw(false)
	ist_print.st_datawindow.Modify(ls_command)
	ist_print.st_datawindow.setredraw(true)
END IF
end event

event pageleft;////왼쪽을 클릭할때
String ls_command

THIS.Position = THIS.Position - 10
IF THIS.PosiTion  < 20 THEN THIS.Position = 20
em_1.Text = String(THIS.Position)
ls_command = 'DataWindow.Print.PreView.Zoom = ' + em_1.Text
ist_print.st_datawindow.setredraw(false)
ist_print.st_datawindow.Modify(ls_command)
ist_print.st_datawindow.setredraw(true)

end event

event pageright;////오른쪽을을 클릭할때
String ls_command

THIS.Position = THIS.Position + 10
IF THIS.PosiTion  > 200 THEN THIS.Position = 200
em_1.Text = String(THIS.Position)
ls_command = 'DataWindow.Print.PreView.Zoom = ' + em_1.Text
ist_print.st_datawindow.setredraw(false)
ist_print.st_datawindow.Modify(ls_command)
ist_print.st_datawindow.setredraw(true)

end event

event moved;////마우스로 Position을 이동시키는 경우
String ls_command

IF THIS.Position >= 20 AND THIS.Position <=200 THEN
	em_1.Text = String(scrollpos)
	ls_command = 'DataWindow.Print.PreView.Zoom = ' + em_1.Text
	ist_print.st_datawindow.setredraw(false)
	ist_print.st_datawindow.Modify(ls_command)
	ist_print.st_datawindow.setredraw(true)
END IF
end event

type ddlb_page from dropdownlistbox within w_printsetup
integer x = 1413
integer y = 440
integer width = 425
integer height = 296
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","홀수면","짝수면"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1    ////전체 페이지
		ist_print.st_datawindow.Modify('DataWindow.Print.Page.RangeInclude = 0')
	CASE 2    ////홀수 페이지
		ist_print.st_datawindow.Modify('DataWindow.Print.Page.RangeInclude = 1')
	CASE 3    ////짝수 페이지
		ist_print.st_datawindow.Modify('DataWindow.Print.Page.RangeInclude = 2')
END CHOOSE
end event

type st_6 from statictext within w_printsetup
integer x = 1111
integer y = 644
integer width = 302
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
boolean enabled = false
string text = "용지선택:"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_printsetup
integer x = 27
integer y = 752
integer width = 1536
integer height = 200
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
end type

type gb_6 from groupbox within w_printsetup
integer x = 1065
integer y = 384
integer width = 873
integer height = 336
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "선택"
end type

type gb_1 from groupbox within w_printsetup
integer x = 27
integer y = 12
integer width = 1915
integer height = 352
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "출력 페이지"
end type

