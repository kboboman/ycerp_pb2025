$PBExportHeader$w_repsuper.srw
forward
global type w_repsuper from window
end type
type st_2 from statictext within w_repsuper
end type
type st_1 from statictext within w_repsuper
end type
type dw_1 from datawindow within w_repsuper
end type
end forward

global type w_repsuper from window
integer x = 5
integer y = 160
integer width = 4667
integer height = 2780
boolean titlebar = true
string title = "출력"
string menuname = "m_printpreview"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
event ue_first pbm_custom01
event ue_last pbm_custom02
event ue_next pbm_custom03
event ue_prior pbm_custom04
event ue_print pbm_custom05
event ue_zoom pbm_custom06
event ue_zoom_down pbm_custom07
event ue_zoom_up pbm_custom08
event ue_ruler pbm_custom09
event ue_file pbm_custom10
event ue_print_setup pbm_custom11
st_2 st_2
st_1 st_1
dw_1 dw_1
end type
global w_repsuper w_repsuper

type variables
DataWindow idw_dw
st_print i_print
string is_prestyle

int ii_win_w, ii_win_h, ii_dw_w, ii_dw_h, ii_st1_w, ii_st2_w , ii_st1_x
boolean ib_exec
end variables

forward prototypes
public function integer wf_size_it ()
public function integer wf_resize_it ()
end prototypes

event ue_first;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Go to the first page of the report 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_row

dw_1.SetRedraw (false)

do 
	ll_row = dw_1.ScrollPriorPage()
loop until ll_row <= 1

dw_1.SetRedraw (true)

end event

event ue_last;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Go to the last page of the report 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_row, ll_prev_row

dw_1.SetRedraw (false)
do 
	ll_prev_row = ll_row
	ll_row = dw_1.ScrollNextPage()
loop until ll_row = ll_prev_row or ll_row <= 0
dw_1.SetRedraw (true)

end event

event ue_next;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Go to the next page of the report 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Int i

i = dw_1.ScrollNextPage()
i ++
end event

event ue_prior;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Go to the prior page of the report 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Int i

i = dw_1.ScrollPriorPage()
i ++

end event

event ue_print;//dw_1.Print()

OpenWithParm(w_printsetup, i_print)

end event

event ue_zoom;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Zoom the display size of the report to the size specified on the menu.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int			li_factor
m_printpreview		lm_menu

lm_menu = this.menuid

// Initialize li_factor to zero
li_factor = 0

if lm_menu.m_display.m_zoom.m_20%.checked then 	
	li_factor = 20
elseif lm_menu.m_display.m_zoom.m_40%.checked then
	li_factor = 40
elseif lm_menu.m_display.m_zoom.m_60%.checked then
	li_factor = 60
elseif lm_menu.m_display.m_zoom.m_80%.checked then
	li_factor = 80
elseif lm_menu.m_display.m_zoom.m_100%.checked then
	li_factor = 100
elseif lm_menu.m_display.m_zoom.m_120%.checked then
	li_factor = 120
end if

if li_factor > 0 Then
////	dw_1.Object.DataWindow.print.preview.zoom = li_factor
      dw_1.Object.DataWindow.zoom = li_factor
end if

end event

event ue_zoom_down;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Zoom the display area of the datawindow down
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 그래프는 zoom 이 없슴
if is_prestyle = '3' then return

string		ls_factor
integer		li_factor
m_printpreview		lm_menu

// get the current zoom
////ls_factor = dw_1.Object.DataWindow.print.preview.zoom
ls_factor = dw_1.Object.DataWindow.zoom

li_factor = integer (ls_factor)

// only zoom down if magnification is greater than 20%
//if li_factor >=40 and li_factor <= 100 then
	li_factor = li_factor - 2
//else
//	// if magnification is currently 120%, zoom down to 100%
//	if li_factor = 120 then
//		li_factor = 100
//	end if
//end if
if li_factor < 20 then
	li_factor = 20
end if
//if li_factor > 100 then
//	li_factor = 100
//end if

// set the new zoom level
////dw_1.Object.DataWindow.print.preview.zoom = li_factor
dw_1.Object.DataWindow.zoom = li_factor


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Check/uncheck the zoom menu items
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
lm_menu = this.menuid

lm_menu.m_display.m_zoom.m_20%.checked = false
lm_menu.m_display.m_zoom.m_40%.checked = false
lm_menu.m_display.m_zoom.m_60%.checked = false
lm_menu.m_display.m_zoom.m_80%.checked = false
lm_menu.m_display.m_zoom.m_100%.checked = false
lm_menu.m_display.m_zoom.m_120%.checked = false

choose case li_factor

	case 20
		lm_menu.m_display.m_zoom.m_20%.checked = true

	case 40
		lm_menu.m_display.m_zoom.m_40%.checked = true

	case 60
		lm_menu.m_display.m_zoom.m_60%.checked = true

	case 80
		lm_menu.m_display.m_zoom.m_80%.checked = true

	case 100
		lm_menu.m_display.m_zoom.m_100%.checked = true

	case 120
		lm_menu.m_display.m_zoom.m_120%.checked = true

end choose
end event

event ue_zoom_up;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Zoom the display area of the datawindow down
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 그래프는 zoom 이 없슴
if is_prestyle = '3' then return

string		ls_factor
integer		li_factor
m_printpreview		lm_menu

// get the current zoom
////ls_factor = dw_1.Object.DataWindow.print.preview.zoom
ls_factor = dw_1.Object.DataWindow.zoom

li_factor = Integer (ls_factor)

// zoom up by a factor of 20% if current magnification is between 20% - 80%
//if li_factor >=40 and li_factor <=80 then
	li_factor = li_factor + 2
//else
//	// if magnification is currently 100%, zoom to 120%
//	if li_factor = 100 then
//		li_factor = 120
//	end if
//end if
if li_factor > 200 then
	li_factor = 200
end if

// set the new zoom level
////dw_1.Object.DataWindow.print.preview.zoom = li_factor
dw_1.Object.DataWindow.zoom = li_factor

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Check/uncheck the zoom menu items
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
lm_menu = this.menuid

lm_menu.m_display.m_zoom.m_20%.checked = false
lm_menu.m_display.m_zoom.m_40%.checked = false
lm_menu.m_display.m_zoom.m_60%.checked = false
lm_menu.m_display.m_zoom.m_80%.checked = false
lm_menu.m_display.m_zoom.m_100%.checked = false
lm_menu.m_display.m_zoom.m_120%.checked = false

choose case li_factor

	case 20
		lm_menu.m_display.m_zoom.m_20%.checked = true

	case 40
		lm_menu.m_display.m_zoom.m_40%.checked = true

	case 60
		lm_menu.m_display.m_zoom.m_60%.checked = true

	case 80
		lm_menu.m_display.m_zoom.m_80%.checked = true

	case 100
		lm_menu.m_display.m_zoom.m_100%.checked = true

	case 120
		lm_menu.m_display.m_zoom.m_120%.checked = true

end choose

end event

event ue_ruler;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Toggle the display of rulers on the datawindow.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

m_printpreview		lm_menu

lm_menu = this.menuid
if lm_menu.m_display.m_rulers.checked then
	dw_1.Object.DataWindow.print.preview.rulers = 'yes'
else
	dw_1.Object.DataWindow.print.preview.rulers = 'no'
end if

end event

event ue_file;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

//   "파워빌더리포트 (*.PSR),*.PSR," + &
ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
	"엑셀 (*.XLS), *.XLS,"     + &
   "텍스트 (*.TXT),*.TXT,"    + &
	"HTML문서 (*.HTM), *.HTM," + &
   "CSV(쉽표로 분리), *.CSV,")
	
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_1.SaveAsascii(ls_DocName)
			
	elseif ls_ExpandName = "txt" OR ls_ExpandName = "TXT" then
		dw_1.SaveAsascii(ls_DocName)
			  
	elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" then
		dw_1.SaveAs(ls_DocName, HTMLTable!, TRUE)

	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		dw_1.SaveAs(ls_DocName, CSV!, TRUE)
	end if
end if


end event

event ue_print_setup;printsetup()

end event

public function integer wf_size_it ();
ii_win_w = this.width // + this.x // this.width + this.WorkSpaceWidth()
ii_win_h = this.height  - This.ToolbarHeight // + this.y  + st_2.y + st_2.height//this.height + this.WorkSpaceHeight()
ii_dw_w = dw_1.width
ii_dw_h = dw_1.height
ii_st2_w = st_2.width
ii_st1_w = st_1.width
ii_st1_x = st_1.x


//ii_win_frame_w = this.width - this.WorkSpaceWidth()
//ii_win_frame_h = this.height - this.WorkSpaceHeight()
return 1
//
end function

public function integer wf_resize_it ();
ib_exec = false
this.hide()

dw_1.height = ii_dw_h + this.height - ii_win_h  + 80 //This.ToolbarHeight
dw_1.width = ii_dw_w + this.width - ii_win_w
st_2.width = ii_st2_w * ( this.width / ii_win_w)
st_1.x = ii_st1_x * ( this.width / ii_win_w)
st_1.width = ii_st1_w * ( this.width / ii_win_w)


ib_exec = true

return 1

end function

on w_repsuper.create
if this.MenuName = "m_printpreview" then this.MenuID = create m_printpreview
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_2,&
this.st_1,&
this.dw_1}
end on

on w_repsuper.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;// window size width = 4699 - 36  height = 2798 - 36
int rc

randomize(0)
rc = wf_size_it()
ib_exec = true


datawindowchild ldwc_code

i_print = Message.Powerobjectparm
this.x = 3
this.y = 3

idw_dw    = i_print.st_datawindow
st_1.text = i_print.st_print_sheet
st_2.text = i_print.st_print_desc

dw_1.DataObject = i_print.name 

dw_1.settransobject(sqlca)
dw_1.setredraw(false)

choose case i_print.name
	case "d_irincoun_r"
	      dw_1.DataObject = idw_dw.DataObject
      	idw_dw.shareData(dw_1)
			dw_1.getchild('loc_no',ldwc_code)
			ldwc_code.settransobject(sqlca)
			ldwc_code.retrieve()
	case "d_ocaroivcday_r7"
			dw_1.retrieve(i_print.class, i_print.sdate, i_print.edate, i_print.yymm1, i_print.yymm2, i_print.yymm3)

	case "d_ocaroivcday_r5"
			dw_1.retrieve(i_print.class, i_print.sdate, i_print.edate, i_print.yymm3)
			
	case "d_osaroirep_r1"
			idw_dw.sharedata(dw_1)

	case "d_oecustdiary_r"
//			dw_3.retrieve(ls_user, ldt_diary, li_seq)
			dw_1.retrieve(i_print.class, i_print.sdate, i_print.da1)
//			dw_1.retrieve(i_print.class, i_print.sdate, i_print.edate, i_print.yymm1, i_print.yymm2, i_print.yymm3)

	case "d_oidotrans_m_prt_3"
			dw_1.retrieve(i_print.class)

	case ''
			dw_1.DataObject = idw_dw.DataObject
			idw_dw.shareData(dw_1)
   case else
	      dw_1.DataObject = idw_dw.DataObject
			idw_dw.shareData(dw_1)
end choose

dw_1.object.datawindow.print.preview = true
dw_1.Modify(gs_print_control)
dw_1.groupcalc()

If dw_1.dataobject = "d_ippurchase_r" OR dw_1.dataobject = "d_ippurchase_r2" OR dw_1.dataobject = "d_ippurchase_r3" Then
	If string(dw_1.object.buyer[1]) = "ybs" or string(dw_1.object.buyer[1]) = "k0172h" or gs_userid = 'bestvic' OR string(dw_1.object.buyer[1]) = "jclee" Then
		dw_1.object.p_1.filename = 'C:\Program Files\YCSC_MAIN\통합구매팀\' + string(dw_1.object.buyer[1]) + '.jpg'
		dw_1.object.p_2.filename = 'C:\Program Files\YCSC_MAIN\통합구매팀\sjh4279.jpg'		
	Else
		dw_1.object.p_1.filename = 'C:\Program Files\YCSC_MAIN\통합구매팀\' + string(dw_1.object.buyer[1]) + '.jpg'
		dw_1.object.p_2.filename = 'C:\Program Files\YCSC_MAIN\통합구매팀\ssch3015.jpg'
	End If
Elseif dw_1.dataobject = "d_ippurchase_r4" Then
	If string(dw_1.object.pur_buyer[1]) = "ybs" OR string(dw_1.object.pur_buyer[1]) = "k0172h" OR string(dw_1.object.pur_buyer[1]) = "bestvic" OR string(dw_1.object.pur_buyer[1]) = "jclee" Then
		dw_1.object.p_1.filename = 'C:\Program Files\YCSC_MAIN\통합구매팀\' + string(dw_1.object.pur_buyer[1]) + '.jpg'
		dw_1.object.p_2.filename = 'C:\Program Files\YCSC_MAIN\통합구매팀\sjh4279.jpg'		
	Else
		dw_1.object.p_1.filename = 'C:\Program Files\YCSC_MAIN\통합구매팀\' + string(dw_1.object.pur_buyer[1]) + '.jpg'
		dw_1.object.p_2.filename = 'C:\Program Files\YCSC_MAIN\통합구매팀\ssch3015.jpg'
	End If	
End If

dw_1.setredraw(true)

//0 : (Default) Form, group, query, or tabular
//1 : Grid
//2 : Label
//3 : Graph
//4 : Crosstab
//5 : Composite
//7 : RichText
is_prestyle = dw_1.Describe('DataWindow.Processing')

i_print.st_datawindow = dw_1
i_print.name  = dw_1.dataobject



end event

event close;dw_1.Modify("DataWindow.Print.Margin.Bottom=0")
end event

event resize;//int rc



int rc

if ib_exec then

	rc = wf_resize_it()
end if


end event

type st_2 from statictext within w_repsuper
integer x = 5
integer y = 4
integer width = 3424
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_repsuper
integer x = 3438
integer y = 4
integer width = 1179
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
boolean border = true
long bordercolor = 16711680
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_repsuper
integer x = 5
integer y = 88
integer width = 4613
integer height = 2492
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

