$PBExportHeader$w_whcustomer_w.srw
$PBExportComments$거래처조회(1998/04/24,이인호)
forward 
global type w_whcustomer_w from w_inheritance
end type
type dw_3 from datawindow within w_whcustomer_w
end type
type gb_5 from groupbox within w_whcustomer_w
end type
type tab_1 from tab within w_whcustomer_w
end type
type tabpage_1 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_4 from userobject within tab_1
end type
type st_1 from statictext within tabpage_4
end type
type st_2 from statictext within tabpage_4
end type
type st_3 from statictext within tabpage_4
end type
type dw_8 from datawindow within tabpage_4
end type
type pb_exinsert from picturebutton within tabpage_4
end type
type pb_exdelete from picturebutton within tabpage_4
end type
type pb_exsave from picturebutton within tabpage_4
end type
type tabpage_3 from userobject within tab_1
end type
type gb_7 from groupbox within tabpage_3
end type
type dw_6 from datawindow within tabpage_3
end type
type dw_7 from datawindow within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type st_6 from statictext within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type em_1 from editmask within tabpage_3
end type
type tabpage_1 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
end type
type tabpage_4 from userobject within tab_1
st_1 st_1
st_2 st_2
st_3 st_3
dw_8 dw_8
pb_exinsert pb_exinsert
pb_exdelete pb_exdelete
pb_exsave pb_exsave
end type
type tabpage_3 from userobject within tab_1
gb_7 gb_7
dw_6 dw_6
dw_7 dw_7
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
em_1 em_1
end type
type tab_1 from tab within w_whcustomer_w
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_4 tabpage_4
tabpage_3 tabpage_3
end type
end forward

global type w_whcustomer_w from w_inheritance
int Width=2816
int Height=2208
WindowType WindowType=response!
boolean TitleBar=true
string Title="판매거래처조회(w_whcustomer_w)"
boolean ControlMenu=false
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
WindowState WindowState=normal!
dw_3 dw_3
gb_5 gb_5
tab_1 tab_1
end type
global w_whcustomer_w w_whcustomer_w

type variables
public string is_custno,is_custname
st_print i_print
datawindowchild idwc_cust
datawindowchild idwc_user
datawindowchild idwc_cust_name
string is_select, is_where, is_clause, is_select1
string is_cust_no

end variables

on w_whcustomer_w.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.gb_5=create gb_5
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.gb_5
this.Control[iCurrent+3]=this.tab_1
end on

on w_whcustomer_w.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.gb_5)
destroy(this.tab_1)
end on

event open;dw_1.settransobject(sqlca)
tab_1.tabpage_2.dw_4.settransobject(sqlca)
tab_1.tabpage_1.dw_5.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_8.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_6.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_7.SetTransObject(SQLCA)

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)

is_cust_no = message.stringparm
dw_1.object.cust_no[1] = is_cust_no
dw_1.postevent('ue_retrieve')


end event

type pb_save from w_inheritance`pb_save within w_whcustomer_w
int X=2313
int Y=48
boolean Visible=false
end type

type dw_1 from w_inheritance`dw_1 within w_whcustomer_w
event ue_retrieve pbm_custom01
int X=55
int Y=264
int Width=2331
int Height=92
int TabOrder=50
string DataObject="d_custddw_c"
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean HScrollBar=false
boolean VScrollBar=false
end type

event dw_1::ue_retrieve;call super::ue_retrieve;long ll_row, ll_found
string ls_data
integer li_line

ls_data = is_cust_no + '%'
ll_row = idwc_cust.RowCount( )
ll_found = idwc_cust.Find("cust_no like '" + ls_data + "'", 1, ll_row)
		 
li_line = integer(this.Describe("cust_no.dddw.Line"))
if ll_found < 1 then
	return
end if
if ll_found > li_line then
	ll_found = ll_found + li_line
	if ll_found > ll_row then ll_found = ll_row
end if
idwc_cust.scrolltorow(ll_found)

this.object.cust_name[1] = ''
this.object.cust_name[1] = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")

tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_4.reset()
tab_1.tabpage_3.dw_6.reset()
tab_1.tabpage_3.dw_7.reset()
pb_print.setfocus()
tab_1.tabpage_1.dw_5.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
tab_1.tabpage_2.dw_4.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
tab_1.tabpage_4.dw_8.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
tab_1.tabpage_3.dw_7.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
tab_1.tabpage_3.dw_6.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"), &
		                              integer(string(wf_today(),'YYYY')))
tab_1.tabpage_4.st_2.text = tab_1.tabpage_1.dw_5.object.cust_no[getrow()]
tab_1.tabpage_4.st_3.text = tab_1.tabpage_1.dw_5.object.cust_name[getrow()]
tab_1.tabpage_3.st_5.text = tab_1.tabpage_1.dw_5.object.cust_no[getrow()]
tab_1.tabpage_3.st_6.text = tab_1.tabpage_1.dw_5.object.cust_name[getrow()]
tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')

end event

event dw_1::itemchanged;call super::itemchanged;choose case dwo.name
	case 'cust_no'
		this.object.cust_name[1] = ''
		this.object.cust_name[1] = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")
		tab_1.tabpage_1.dw_5.reset()
		tab_1.tabpage_2.dw_4.reset()
		tab_1.tabpage_3.dw_6.reset()
		tab_1.tabpage_3.dw_7.reset()
		pb_print.setfocus()
		tab_1.tabpage_1.dw_5.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
		tab_1.tabpage_2.dw_4.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
		tab_1.tabpage_4.dw_8.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
		tab_1.tabpage_3.dw_7.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
		tab_1.tabpage_3.dw_6.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"), &
		                              integer(string(wf_today(),'YYYY')))
	case 'cust_name'
		this.object.cust_no[1] = ''
		this.object.cust_no[1] = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
		tab_1.tabpage_1.dw_5.reset()
		tab_1.tabpage_2.dw_4.reset()
		tab_1.tabpage_3.dw_6.reset()
		tab_1.tabpage_3.dw_7.reset()
		pb_print.setfocus()
		tab_1.tabpage_1.dw_5.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
		tab_1.tabpage_2.dw_4.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
		tab_1.tabpage_4.dw_8.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
		tab_1.tabpage_3.dw_7.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
		tab_1.tabpage_3.dw_6.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"), &
		                              integer(string(wf_today(),'YYYY')))
end choose		
tab_1.tabpage_4.st_2.text = tab_1.tabpage_1.dw_5.object.cust_no[getrow()]
tab_1.tabpage_4.st_3.text = tab_1.tabpage_1.dw_5.object.cust_name[getrow()]
tab_1.tabpage_3.st_5.text = tab_1.tabpage_1.dw_5.object.cust_no[getrow()]
tab_1.tabpage_3.st_6.text = tab_1.tabpage_1.dw_5.object.cust_name[getrow()]
tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')

end event

event dw_1::editchanged;string ls_data,ls_cust
long ll_found,ll_row
int li_line

dw_1.getchild("cust_no", idwc_cust)

choose case dwo.name
	case 'cust_no'
		 ls_data = data + '%'
		 ll_row = idwc_cust.RowCount( )
		 ll_found = idwc_cust.Find("cust_no like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("cust_no.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_cust.scrolltorow(ll_found)

	case 'cust_name'
		 ls_data = data + '%'
		 ll_row = idwc_cust.RowCount( )
		 ll_found = idwc_cust.Find("cust_name like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("cust_name.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 idwc_cust.scrolltorow(ll_found)

end choose
RETURN 0

end event

type st_title from w_inheritance`st_title within w_whcustomer_w
int Y=28
string Text="판매거래처조회"
end type

type pb_compute from w_inheritance`pb_compute within w_whcustomer_w
int X=1659
int TabOrder=110
boolean Visible=false
end type

type pb_print_part from w_inheritance`pb_print_part within w_whcustomer_w
int X=2811
boolean Visible=false
end type

type pb_close from w_inheritance`pb_close within w_whcustomer_w
int X=2519
int Y=48
int TabOrder=120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_whcustomer_w
int X=2318
int Y=48
int TabOrder=130
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================

string  ls_window
ls_window=parent.classname()
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================
pb_insert.enabled = true
i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_whcustomer_w
int X=2427
int TabOrder=140
boolean Visible=false
end type

type pb_delete from w_inheritance`pb_delete within w_whcustomer_w
int X=1947
int Y=44
int TabOrder=150
boolean Visible=false
end type

event pb_delete::clicked;call super::clicked;string ls_custno

if dw_2.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()
dw_2.accepttext()

ls_custno = dw_1.object.cust_no[dw_1.getrow()]
if ls_custno = dw_2.object.cust_no[dw_2.getrow()] then
	dw_2.deleterow(0)
	wf_update1(dw_2,"Y")
   dw_1.deleterow(dw_1.getrow())
else
	dw_2.deleterow(0)
	dw_2.retrieve(ls_custno)
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_whcustomer_w
int X=1929
int Y=48
int TabOrder=170
boolean Visible=false
int Weight=400
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_whcustomer_w
int X=1851
int TabOrder=160
boolean Visible=false
end type

type gb_3 from w_inheritance`gb_3 within w_whcustomer_w
int X=1015
int Y=232
int Width=2519
int Height=1560
int TabOrder=90
boolean Visible=false
end type

type gb_2 from w_inheritance`gb_2 within w_whcustomer_w
int X=41
int Y=224
int Width=2711
int Height=144
int TabOrder=100
long TextColor=16711680
long BackColor=79416533
end type

type gb_1 from w_inheritance`gb_1 within w_whcustomer_w
int X=2272
int Y=8
int Width=480
int TabOrder=40
end type

type dw_2 from w_inheritance`dw_2 within w_whcustomer_w
int X=219
int Y=8
int Width=2405
int Height=2016
int TabOrder=70
boolean Visible=false
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean VScrollBar=false
end type

type dw_3 from datawindow within w_whcustomer_w
int X=1568
int Y=52
int Width=64
int Height=72
int TabOrder=30
boolean Visible=false
boolean BringToTop=true
string DataObject="d_cdcustomer_r"
boolean LiveScroll=true
end type

type gb_5 from groupbox within w_whcustomer_w
int X=37
int Y=640
int Width=494
int Height=360
int TabOrder=80
string Text="none"
long BackColor=79416533
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type tab_1 from tab within w_whcustomer_w
int X=18
int Y=392
int Width=2766
int Height=1696
int TabOrder=60
boolean BringToTop=true
boolean RaggedRight=true
Alignment Alignment=Center!
int SelectedTab=1
long BackColor=79416533
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_4 tabpage_4
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_4=create tabpage_4
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_4,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_4)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
int X=18
int Y=108
int Width=2729
int Height=1572
long BackColor=79416533
string Text="판매거래처 헤더"
long TabBackColor=79416533
long TabTextColor=16711680
long PictureMaskColor=536870912
dw_5 dw_5
end type

on tabpage_1.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_1.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_1
event editchanged pbm_dwnchanging
event itemchanged pbm_dwnitemchange
int Width=2725
int Height=1540
int TabOrder=1
boolean Enabled=false
boolean BringToTop=true
string DataObject="d_cdcustomer_m1"
boolean Border=false
boolean LiveScroll=true
end type

type tabpage_2 from userobject within tab_1
int X=18
int Y=108
int Width=2729
int Height=1572
long BackColor=79416533
string Text="판매거래처 상세"
long TabBackColor=79416533
long TabTextColor=16711680
long PictureMaskColor=536870912
dw_4 dw_4
end type

on tabpage_2.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_2.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_2
int Width=2720
int Height=1556
int TabOrder=1
boolean Enabled=false
boolean BringToTop=true
string DataObject="d_cdcustomer_m2"
boolean Border=false
boolean LiveScroll=true
end type

type tabpage_4 from userobject within tab_1
int X=18
int Y=108
int Width=2729
int Height=1572
long BackColor=79220952
string Text="공사예상현장"
long TabBackColor=79220952
long TabTextColor=16711680
long PictureMaskColor=536870912
st_1 st_1
st_2 st_2
st_3 st_3
dw_8 dw_8
pb_exinsert pb_exinsert
pb_exdelete pb_exdelete
pb_exsave pb_exsave
end type

on tabpage_4.create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_8=create dw_8
this.pb_exinsert=create pb_exinsert
this.pb_exdelete=create pb_exdelete
this.pb_exsave=create pb_exsave
this.Control[]={this.st_1,&
this.st_2,&
this.st_3,&
this.dw_8,&
this.pb_exinsert,&
this.pb_exdelete,&
this.pb_exsave}
end on

on tabpage_4.destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_8)
destroy(this.pb_exinsert)
destroy(this.pb_exdelete)
destroy(this.pb_exsave)
end on

type st_1 from statictext within tabpage_4
int Y=40
int Width=389
int Height=80
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="판매거래처"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=15780518
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type st_2 from statictext within tabpage_4
int X=389
int Y=40
int Width=183
int Height=80
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean FocusRectangle=false
long BackColor=79220952
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type st_3 from statictext within tabpage_4
int X=571
int Y=40
int Width=1623
int Height=80
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean FocusRectangle=false
long BackColor=79220952
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type dw_8 from datawindow within tabpage_4
int Y=132
int Width=2725
int Height=1440
int TabOrder=51
boolean Enabled=false
boolean BringToTop=true
string DataObject="d_cdexscene_m"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type pb_exinsert from picturebutton within tabpage_4
int X=2363
int Y=180
int Width=187
int Height=144
int TabOrder=52
boolean Visible=false
boolean BringToTop=true
string PictureName="c:\bmp\pencil.bmp"
string DisabledName="c:\bmp\pencil.bmp"
Alignment HTextAlign=Left!
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type pb_exdelete from picturebutton within tabpage_4
int X=2363
int Y=328
int Width=187
int Height=144
int TabOrder=61
boolean Visible=false
boolean BringToTop=true
string PictureName="c:\bmp\delete.bmp"
string DisabledName="c:\bmp\delete.bmp"
Alignment HTextAlign=Left!
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type pb_exsave from picturebutton within tabpage_4
int X=2363
int Y=476
int Width=187
int Height=144
int TabOrder=81
boolean Visible=false
boolean BringToTop=true
string PictureName="c:\bmp\save.bmp"
string DisabledName="c:\bmp\save.bmp"
Alignment HTextAlign=Left!
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type tabpage_3 from userobject within tab_1
int X=18
int Y=108
int Width=2729
int Height=1572
long BackColor=79220952
string Text="매출/수금내역"
long TabBackColor=79220952
long TabTextColor=16711680
long PictureMaskColor=536870912
gb_7 gb_7
dw_6 dw_6
dw_7 dw_7
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
em_1 em_1
end type

on tabpage_3.create
this.gb_7=create gb_7
this.dw_6=create dw_6
this.dw_7=create dw_7
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.em_1=create em_1
this.Control[]={this.gb_7,&
this.dw_6,&
this.dw_7,&
this.st_4,&
this.st_5,&
this.st_6,&
this.st_7,&
this.em_1}
end on

on tabpage_3.destroy
destroy(this.gb_7)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.em_1)
end on

type gb_7 from groupbox within tabpage_3
int Width=2725
int Height=800
int TabOrder=111
long BackColor=79416533
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type dw_6 from datawindow within tabpage_3
event ue_spin pbm_enchange
int X=9
int Y=124
int Width=2688
int Height=668
int TabOrder=111
boolean Enabled=false
boolean BringToTop=true
string DataObject="d_cdinvcoll_q"
boolean Border=false
boolean LiveScroll=true
end type

event ue_spin;//this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))
end event

event editchanged;this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))

end event

event itemchanged;this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))
end event

type dw_7 from datawindow within tabpage_3
int Y=812
int Width=2729
int Height=752
int TabOrder=82
boolean Enabled=false
boolean BringToTop=true
string DataObject="d_cdglbill_q"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

type st_4 from statictext within tabpage_3
int X=18
int Y=44
int Width=384
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="판매거래처"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=15780518
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type st_5 from statictext within tabpage_3
int X=402
int Y=44
int Width=247
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean FocusRectangle=false
long BackColor=79416533
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type st_6 from statictext within tabpage_3
int X=649
int Y=44
int Width=1275
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean FocusRectangle=false
long BackColor=79416533
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type st_7 from statictext within tabpage_3
int X=2062
int Y=44
int Width=315
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="해당년도"
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=15780518
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type em_1 from editmask within tabpage_3
event us_modified pbm_enchange
int X=2377
int Y=44
int Width=265
int Height=76
int TabOrder=141
boolean BringToTop=true
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="yyyy"
MaskDataType MaskDataType=DateTimeMask!
boolean Spin=true
string DisplayData=" "
string MinMax="1990~~2100"
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event us_modified;tab_1.tabpage_3.dw_6.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text))
end event

event modified;tab_1.tabpage_3.dw_6.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text))

end event

