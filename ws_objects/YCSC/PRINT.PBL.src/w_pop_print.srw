$PBExportHeader$w_pop_print.srw
$PBExportComments$Print Option을 선택하는 PopWindow.  1997/02/21
forward
global type w_pop_print from window
end type
type rb_prt_print from radiobutton within w_pop_print
end type
type em_view_zoom from editmask within w_pop_print
end type
type rb_prt_view from radiobutton within w_pop_print
end type
type rb_prt_file from radiobutton within w_pop_print
end type
type sle_pagerange from singlelineedit within w_pop_print
end type
type em_right_margin from editmask within w_pop_print
end type
type em_left_margin from editmask within w_pop_print
end type
type em_bottom_margin from editmask within w_pop_print
end type
type em_top_margin from editmask within w_pop_print
end type
type st_10 from statictext within w_pop_print
end type
type st_9 from statictext within w_pop_print
end type
type st_8 from statictext within w_pop_print
end type
type st_7 from statictext within w_pop_print
end type
type ddlb_paper from dropdownlistbox within w_pop_print
end type
type st_6 from statictext within w_pop_print
end type
type em_zoom from editmask within w_pop_print
end type
type st_5 from statictext within w_pop_print
end type
type ddlb_orientation from dropdownlistbox within w_pop_print
end type
type st_4 from statictext within w_pop_print
end type
type cb_printer from commandbutton within w_pop_print
end type
type cb_cancel from commandbutton within w_pop_print
end type
type cbx_collate from checkbox within w_pop_print
end type
type rb_pages from radiobutton within w_pop_print
end type
type rb_current_page from radiobutton within w_pop_print
end type
type rb_all from radiobutton within w_pop_print
end type
type em_copies from editmask within w_pop_print
end type
type st_2 from statictext within w_pop_print
end type
type sle_printer from singlelineedit within w_pop_print
end type
type st_1 from statictext within w_pop_print
end type
type cb_ok from commandbutton within w_pop_print
end type
type gb_4 from groupbox within w_pop_print
end type
type gb_3 from groupbox within w_pop_print
end type
type gb_2 from groupbox within w_pop_print
end type
type gb_1 from groupbox within w_pop_print
end type
end forward

global type w_pop_print from window
integer x = 594
integer y = 504
integer width = 2277
integer height = 1468
windowtype windowtype = response!
long backcolor = 12632256
boolean center = true
rb_prt_print rb_prt_print
em_view_zoom em_view_zoom
rb_prt_view rb_prt_view
rb_prt_file rb_prt_file
sle_pagerange sle_pagerange
em_right_margin em_right_margin
em_left_margin em_left_margin
em_bottom_margin em_bottom_margin
em_top_margin em_top_margin
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
ddlb_paper ddlb_paper
st_6 st_6
em_zoom em_zoom
st_5 st_5
ddlb_orientation ddlb_orientation
st_4 st_4
cb_printer cb_printer
cb_cancel cb_cancel
cbx_collate cbx_collate
rb_pages rb_pages
rb_current_page rb_current_page
rb_all rb_all
em_copies em_copies
st_2 st_2
sle_printer sle_printer
st_1 st_1
cb_ok cb_ok
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_pop_print w_pop_print

type variables
string is_page_range
datawindow idw_dw
end variables

forward prototypes
private subroutine wf_page_range (radiobutton who)
public subroutine wf_prt_view (radiobutton who)
end prototypes

private subroutine wf_page_range (radiobutton who);
CHOOSE CASE who
	CASE rb_all
		sle_Pagerange.text   = ''
		sle_Pagerange.enabled = FALSE
		is_page_range        = 'a'
	CASE rb_current_page
		sle_Pagerange.text    = ''
		sle_Pagerange.enabled = FALSE
		is_page_range        = 'c'
	CASE rb_pages		
		sle_Pagerange.enabled = true
		is_page_range        = 'p'
END CHOOSE
end subroutine

public subroutine wf_prt_view (radiobutton who);CHOOSE CASE who
	 
	CASE rb_prt_view
		em_view_zoom.enabled = TRUE
	CASE ELSE
		em_view_zoom.enabled = FALSE
		 
END CHOOSE
end subroutine

event open;int     liPrtOrient
string  lstPaperSize
idw_dw = message.powerobjectparm

/* Printer Name Setup   */
sle_printer.text = idw_dw.Describe('datawindow.printer')
	
/* Printer Copies Setup  */
//em_copies.text = idw_dw.Describe(" datawindow.print.copies ")

/* Printer Orientation Setup */
liPrtOrient      = integer(idw_dw.Describe('datawindow.print.orientation'))

ddlb_orientation.SelectItem(liPrtOrient+1)
//ddlb_orientation.SelectItem("횡방향", liPrtOrient+1)

is_page_range         = 'a'

/* Printer Zoom Setup */
em_zoom.text          = idw_dw.Describe('datawindow.zoom')

/* Print Preview Zoom Setup */
em_view_zoom.text     = idw_dw.Describe('datawindow.print.preview.zoom')

/* Printer Paper Size */
lstPaperSize = idw_dw.Describe('datawindow.print.paper.size')
ddlb_paper.SelectItem(ddlb_paper.FindItem(lstPaperSize,1))


/* Default Margin Setting */
em_top_margin.text    = string(double(idw_dw.describe('datawindow.print.Margin.Top'))/1000)
em_bottom_margin.text = string(double(idw_dw.describe('datawindow.print.Margin.Bottom'))/1000)
em_left_margin.text   = string(double(idw_dw.describe('datawindow.print.Margin.Left'))/1000)
em_right_margin.text  = string(double(idw_dw.describe('datawindow.print.Margin.Right'))/1000)

/* Collate Output Setup */
IF idw_dw.Describe(" datawindow.print.collate ") = 'yes' THEN
   cbx_collate.checked=true
ELSE
   cbx_collate.checked=false
END IF
wf_prt_view(rb_prt_print)   

cb_ok.SetFocus()

end event

on w_pop_print.create
this.rb_prt_print=create rb_prt_print
this.em_view_zoom=create em_view_zoom
this.rb_prt_view=create rb_prt_view
this.rb_prt_file=create rb_prt_file
this.sle_pagerange=create sle_pagerange
this.em_right_margin=create em_right_margin
this.em_left_margin=create em_left_margin
this.em_bottom_margin=create em_bottom_margin
this.em_top_margin=create em_top_margin
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.ddlb_paper=create ddlb_paper
this.st_6=create st_6
this.em_zoom=create em_zoom
this.st_5=create st_5
this.ddlb_orientation=create ddlb_orientation
this.st_4=create st_4
this.cb_printer=create cb_printer
this.cb_cancel=create cb_cancel
this.cbx_collate=create cbx_collate
this.rb_pages=create rb_pages
this.rb_current_page=create rb_current_page
this.rb_all=create rb_all
this.em_copies=create em_copies
this.st_2=create st_2
this.sle_printer=create sle_printer
this.st_1=create st_1
this.cb_ok=create cb_ok
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.rb_prt_print,&
this.em_view_zoom,&
this.rb_prt_view,&
this.rb_prt_file,&
this.sle_pagerange,&
this.em_right_margin,&
this.em_left_margin,&
this.em_bottom_margin,&
this.em_top_margin,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.ddlb_paper,&
this.st_6,&
this.em_zoom,&
this.st_5,&
this.ddlb_orientation,&
this.st_4,&
this.cb_printer,&
this.cb_cancel,&
this.cbx_collate,&
this.rb_pages,&
this.rb_current_page,&
this.rb_all,&
this.em_copies,&
this.st_2,&
this.sle_printer,&
this.st_1,&
this.cb_ok,&
this.gb_4,&
this.gb_3,&
this.gb_2,&
this.gb_1}
end on

on w_pop_print.destroy
destroy(this.rb_prt_print)
destroy(this.em_view_zoom)
destroy(this.rb_prt_view)
destroy(this.rb_prt_file)
destroy(this.sle_pagerange)
destroy(this.em_right_margin)
destroy(this.em_left_margin)
destroy(this.em_bottom_margin)
destroy(this.em_top_margin)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.ddlb_paper)
destroy(this.st_6)
destroy(this.em_zoom)
destroy(this.st_5)
destroy(this.ddlb_orientation)
destroy(this.st_4)
destroy(this.cb_printer)
destroy(this.cb_cancel)
destroy(this.cbx_collate)
destroy(this.rb_pages)
destroy(this.rb_current_page)
destroy(this.rb_all)
destroy(this.em_copies)
destroy(this.st_2)
destroy(this.sle_printer)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type rb_prt_print from radiobutton within w_pop_print
integer x = 1655
integer y = 1252
integer width = 215
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
string text = "출력"
boolean checked = true
end type

on clicked;wf_prt_view(this)
end on

type em_view_zoom from editmask within w_pop_print
integer x = 1879
integer y = 1128
integer width = 215
integer height = 100
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long textcolor = 33554432
long backcolor = 15269887
alignment alignment = right!
string mask = "###"
boolean spin = true
double increment = 10
string minmax = "30~~200"
end type

type rb_prt_view from radiobutton within w_pop_print
integer x = 1655
integer y = 1148
integer width = 238
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
string text = "화면"
end type

event clicked;wf_prt_view(this)
end event

type rb_prt_file from radiobutton within w_pop_print
integer x = 1650
integer y = 1056
integer width = 215
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
string text = "화일"
end type

event clicked;wf_prt_view(this)
end event

type sle_pagerange from singlelineedit within w_pop_print
integer x = 613
integer y = 428
integer width = 727
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 16777215
boolean autohscroll = false
end type

event modified;String lsCurrentPage
Long   llgRow

CHOOSE CASE is_page_range 
	CASE 'a'  // all
		lsCurrentPage = ''
	CASE 'c' // current page?
		llgRow = idw_dw.getrow()
		lsCurrentPage = idw_dw.describe("evaluate('page()',"+string(llgRow)+")")
	CASE 'p' // a range?
   	lsCurrentPage = sle_pagerange.text

END CHOOSE		

IF LenA(lsCurrentPage) > 0 THEN 
//	idw_dw.Modify(" datawindow.print.page.range = '"+lsCurrentPage+"'")
   idw_dw.Object.datawindow.print.page.range = lsCurrentPage
END IF

end event

type em_right_margin from editmask within w_pop_print
integer x = 1056
integer y = 1212
integer width = 215
integer height = 96
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 15269887
alignment alignment = right!
string mask = "0.000"
end type

event modified;/* Right Margin Setup */
idw_dw.Object.datawindow.print.margin.right = string(double(em_right_margin.text) * 1000)						
end event

type em_left_margin from editmask within w_pop_print
integer x = 1056
integer y = 1104
integer width = 215
integer height = 96
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 15269887
alignment alignment = right!
string mask = "0.000"
end type

event modified;/* Left Margin Setup */
idw_dw.Object.datawindow.print.margin.left = string(double(em_left_margin.text) * 1000)						
end event

type em_bottom_margin from editmask within w_pop_print
integer x = 439
integer y = 1212
integer width = 215
integer height = 96
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 15269887
alignment alignment = right!
string mask = "0.000"
end type

event modified;/* Bottom Margin Setup */
idw_dw.Object.datawindow.print.margin.bottom = string(double(em_bottom_margin.text) * 1000)						
end event

type em_top_margin from editmask within w_pop_print
integer x = 439
integer y = 1104
integer width = 215
integer height = 96
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 15269887
alignment alignment = right!
string mask = "0.000"
end type

event modified;/* Top Margin Setup  */
idw_dw.Object.datawindow.print.margin.top = string(double(em_top_margin.text) * 1000)
end event

type st_10 from statictext within w_pop_print
integer x = 823
integer y = 1224
integer width = 215
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 12632256
boolean enabled = false
string text = "오른쪽:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_pop_print
integer x = 823
integer y = 1116
integer width = 215
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 12632256
boolean enabled = false
string text = "왼쪽:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_pop_print
integer x = 210
integer y = 1224
integer width = 215
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 12632256
boolean enabled = false
string text = "아래:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_pop_print
integer x = 210
integer y = 1116
integer width = 215
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 12632256
boolean enabled = false
string text = "위:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_paper from dropdownlistbox within w_pop_print
integer x = 425
integer y = 804
integer width = 1088
integer height = 544
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 15269887
string text = "9 -A4 210 X 297 mm"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"0 - Default Paper Size for the Printer","1 - Letter 8 1/2 X 11 inch","3 - Tabloid 17 X 11 Inch","4 - Ledger  17 X 11 in","5 - Legal 8 1/2 X 14 in","8 - A3 297 X 420 mm","9 - A4 210 X 297 mm","11-A5 148 X 210 mm","12-B4 250 X 354 mm","13-B5 182 X 257 mm","24-c","25-d","26-e"}
end type

event selectionchanged;/* Paper Size Set */

idw_dw.Object.datawindow.print.paper.size = trim(LeftA(ddlb_paper.text,2))
end event

type st_6 from statictext within w_pop_print
integer x = 133
integer y = 812
integer width = 265
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 12632256
boolean enabled = false
string text = "용지크기:"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_zoom from editmask within w_pop_print
integer x = 1262
integer y = 676
integer width = 242
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 15269887
alignment alignment = right!
string mask = "###"
boolean spin = true
double increment = 10
string minmax = "30~~200"
end type

event modified;/* Zoom Value Set */

idw_dw.Object.datawindow.zoom = em_zoom.text
end event

type st_5 from statictext within w_pop_print
integer x = 987
integer y = 692
integer width = 270
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 12632256
boolean enabled = false
string text = "인쇄배율:"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_orientation from dropdownlistbox within w_pop_print
integer x = 421
integer y = 676
integer width = 453
integer height = 304
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 15269887
string text = "L횡방향"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"D기본설정","L횡방향","P종방향"}
end type

event selectionchanged;// determine Orientation (Default,Landscape,Portrate)
string lstorientation

CHOOSE CASE lower(LeftA(ddlb_orientation.text,1)) 
	CASE 'd' // Default
		lstOrientation = '0'
	CASE 'l' // Landscape
		lstOrientation = '1'
	CASE 'p' // Portrate
		lstOrientation = '2'
END CHOOSE

idw_dw.Object.datawindow.print.Orientation = lstOrientation
end event

type st_4 from statictext within w_pop_print
integer x = 133
integer y = 684
integer width = 265
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "인쇄방향:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_printer from commandbutton within w_pop_print
integer x = 1696
integer y = 288
integer width = 389
integer height = 108
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "프린터 설정"
end type

on clicked;printsetup()
sle_printer.text = idw_dw.describe('datawindow.printer')
end on

type cb_cancel from commandbutton within w_pop_print
integer x = 1696
integer y = 168
integer width = 389
integer height = 104
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "취소"
boolean cancel = true
end type

on clicked;closewithreturn(parent,-1)
end on

type cbx_collate from checkbox within w_pop_print
integer x = 1632
integer y = 820
integer width = 480
integer height = 68
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
string text = "순서대로출력"
boolean checked = true
end type

event clicked;// Collate output ? Setup

IF cbx_collate.checked THEN 
	idw_dw.Modify(" datawindow.print.collate = yes")
ELSE
   idw_dw.Modify(" datawindow.print.collate = no")
END IF
end event

type rb_pages from radiobutton within w_pop_print
integer x = 192
integer y = 432
integer width = 343
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
string text = "일부분(&P)"
end type

event clicked;wf_page_range(this)
end event

type rb_current_page from radiobutton within w_pop_print
integer x = 777
integer y = 340
integer width = 462
integer height = 68
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
string text = "현재면(&C)"
end type

on clicked;wf_page_range(this)
end on

type rb_all from radiobutton within w_pop_print
integer x = 192
integer y = 352
integer width = 288
integer height = 68
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
string text = "전체(&A)"
boolean checked = true
end type

on clicked;wf_page_range(this)
end on

type em_copies from editmask within w_pop_print
integer x = 338
integer y = 148
integer width = 169
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long backcolor = 15269887
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

event modified;

// number of copies ?
IF LenA(em_copies.text) > 0 THEN idw_dw.Modify(" datawindow.print.copies = "+em_copies.text)

end event

type st_2 from statictext within w_pop_print
integer x = 123
integer y = 164
integer width = 215
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "매   수:"
boolean focusrectangle = false
end type

type sle_printer from singlelineedit within w_pop_print
integer x = 343
integer y = 48
integer width = 1198
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long textcolor = 33554432
long backcolor = 12632256
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type st_1 from statictext within w_pop_print
integer x = 123
integer y = 64
integer width = 297
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "프린터:"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_pop_print
integer x = 1696
integer y = 44
integer width = 389
integer height = 104
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "확인"
boolean default = true
end type

event clicked;string tmp, command
long   row 
string docname, named
int	 value

setpointer(hourglass!)
 
/* Page Range Setup   */
CHOOSE CASE is_page_range 
	CASE 'a'  // all
		tmp = ''
	CASE 'c' // current page?
		row = idw_dw.getrow()
		tmp = idw_dw.describe("evaluate('page()',"+string(row)+")")
	CASE 'p' // a range?
		tmp = sle_pagerange.text
end choose		
IF LenA(tmp) > 0 THEN 
   idw_dw.Object.datawindow.print.page.range = tmp
END IF
	
string aaa
 
/* Print To File Save As  */
IF rb_prt_file.checked THEN // print to file ?
   idw_dw.SaveAs()
   closewithreturn(parent,-1)
ELSEIF rb_prt_view.checked THEN // print to priew ?
   idw_dw.Object.datawindow.print.preview.zoom = em_view_zoom.text
   closewithreturn(parent,-1)
ELSE
	closewithreturn(parent,1)
END IF
end event

type gb_4 from groupbox within w_pop_print
integer x = 1600
integer y = 976
integer width = 517
integer height = 380
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "System"
long textcolor = 16711680
long backcolor = 12632256
string text = "출력약식"
end type

type gb_3 from groupbox within w_pop_print
integer x = 110
integer y = 1004
integer width = 1440
integer height = 372
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 32768
long backcolor = 12632256
string text = "여백(단위:Cm)"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_pop_print
integer x = 110
integer y = 580
integer width = 1440
integer height = 360
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 32768
long backcolor = 12632256
string text = "인쇄형태"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_pop_print
integer x = 110
integer y = 284
integer width = 1440
integer height = 248
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 255
long backcolor = 12632256
string text = "범위지정"
borderstyle borderstyle = styleraised!
end type

