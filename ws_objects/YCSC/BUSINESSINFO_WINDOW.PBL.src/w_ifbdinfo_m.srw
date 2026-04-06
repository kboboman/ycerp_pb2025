$PBExportHeader$w_ifbdinfo_m.srw
$PBExportComments$견적,입찰정보관리w_bidinfo_input_m의 조회popup
forward
global type w_ifbdinfo_m from w_inheritance
end type
type cb_1 from commandbutton within w_ifbdinfo_m
end type
type cb_2 from commandbutton within w_ifbdinfo_m
end type
end forward

global type w_ifbdinfo_m from w_inheritance
int X=283
int Y=356
int Width=3159
int Height=1664
WindowType WindowType=response!
boolean TitleBar=true
string Title="기준정보(w_ifbdinfo_m)"
boolean ControlMenu=false
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
WindowState WindowState=normal!
cb_1 cb_1
cb_2 cb_2
end type
global w_ifbdinfo_m w_ifbdinfo_m

type variables
string is_build_no
st_bdinfo ist_bdinfo
end variables

on w_ifbdinfo_m.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
end on

on w_ifbdinfo_m.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_1.retrieve()
end event

type pb_save from w_inheritance`pb_save within w_ifbdinfo_m
int X=3182
boolean Visible=false
end type

event pb_save::clicked;long ll_row, ll_cnt1, ll_cnt2
dwItemStatus l_status

dw_2.accepttext()

ll_cnt1 = wf_modifycount(dw_1) 
ll_cnt2 = wf_modifycount(dw_2) 
if ll_cnt1 > 0  or ll_cnt2 > 0 then	
	wf_update2(dw_1,dw_2,"Y") 
end if

end event

type dw_1 from w_inheritance`dw_1 within w_ifbdinfo_m
int Y=64
int Width=448
int Height=1324
string DataObject="dw_info"
BorderStyle BorderStyle=StyleLowered!
end type

event dw_1::rowfocuschanged;long ll_row

ll_row = wf_rowfocuschange(dw_1,"N")
if ll_row < 1 then
	return
end if

dw_1.accepttext()
dw_2.accepttext()
is_build_no = dw_1.getitemstring(ll_row,"build_no")
//messagebox('is_build_no',is_build_no)
if isnull(is_build_no) or is_build_no = "" then
   return
else
	dw_2.retrieve(is_build_no)
end if
end event

type dw_2 from w_inheritance`dw_2 within w_ifbdinfo_m
int X=581
int Y=68
int Width=2523
int Height=1316
string DataObject="dw_infodet"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean HSplitScroll=true
end type

event dw_2::clicked;if row < 1 then return

if dwo.name = 'seq' then
   dw_2.ScrollTorow(row)
end if
//dw_2.SetColumn('
	
	
end event

event dw_2::doubleclicked;long ll_row
string ls_build_no, ls_project, ls_buildingcom
decimal ld_seq
//st_bdinfo lst_bdinfo

ll_row = dw_2.GetRow()
//dw_2.scrolltorow(ll_row)
ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
ld_seq = dw_2.getitemnumber(ll_row,"bdinfodet_seq")
ls_project = dw_2.getitemstring(ll_row,"bdinfodet_project")
ls_buildingcom = dw_2.getitemstring(ll_row,"bdinfodet_buildingcom")
ist_bdinfo.build_no = ls_build_no
ist_bdinfo.seq = ld_seq
ist_bdinfo.project = ls_project
ist_bdinfo.buildingcom = ls_buildingcom
//dw_2.object.bdinfodet_sitedate[ll_row] = today()
//dw_2.object.bdinfodet_biddate[ll_row] = today()
//dw_2.object.bdinfodet_build_no[ll_row] = ls_build_no 
//dw_2.object.bdinfodet_seq[ll_row] = li_seq_no 
//dw_2.setcolumn('bdinfodet_project')
//dw_2.setfocus()
closewithreturn(parent, ist_bdinfo)

end event

type st_title from w_inheritance`st_title within w_ifbdinfo_m
boolean Visible=false
string Text="건설정보진행현황"
end type

type pb_compute from w_inheritance`pb_compute within w_ifbdinfo_m
int X=1838
int TabOrder=90
boolean Visible=false
end type

event pb_compute::clicked;int li_build_no
string ls_build_no
long ll_row

if dw_1.RowCount() < 1 then
	li_build_no =  1
	ls_build_no = string(li_build_no,'0000000000')
else
	ls_build_no = dw_1.object.build_no[dw_1.RowCount()]
	li_build_no = integer(ls_build_no) + 1
	ls_build_no = string(li_build_no,'0000000000')
end if

ll_row = dw_1.insertrow(0)
dw_1.object.create_date[ll_row] = today()
dw_1.object.build_no[ll_row] = ls_build_no
dw_1.scrolltorow(ll_row)
dw_2.reset()
//dw_1.setcolumn('build_no')
//dw_1.setfocus()
end event

type pb_print_part from w_inheritance`pb_print_part within w_ifbdinfo_m
int X=2990
boolean Visible=false
end type

type pb_close from w_inheritance`pb_close within w_ifbdinfo_m
int X=3374
int TabOrder=100
boolean Visible=false
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ifbdinfo_m
int X=2798
int TabOrder=110
boolean Visible=false
end type

type pb_cancel from w_inheritance`pb_cancel within w_ifbdinfo_m
int X=2606
int TabOrder=120
boolean Visible=false
end type

type pb_delete from w_inheritance`pb_delete within w_ifbdinfo_m
int X=2414
int TabOrder=130
boolean Visible=false
end type

event pb_delete::clicked;string ls_build_no

dw_1.accepttext()
dw_2.accepttext()

if dw_2.rowcount() < 1 then
	if dw_1.rowcount() < 1 then
		return
	else
		if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	      return
      end if	
		dw_1.deleterow(0)
		if dw_1.RowCount() >= 1 then
			ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
			dw_2.Retrieve(ls_build_no)
		end if
		wf_update1(dw_1,"Y")
		return
	end if
end if

if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

//ls_build_no = dw_1.object.build_no[dw_1.getrow()]
//if ls_build_no = dw_2.object.bdinfodet_build_no[dw_2.getrow()] then
	dw_2.deleterow(0)
	wf_update1(dw_2,"Y")
//   dw_1.deleterow(dw_1.getrow())
//else
//	dw_2.deleterow(0)
//	dw_2.retrieve(ls_build_no)
//end if	
end event

type pb_insert from w_inheritance`pb_insert within w_ifbdinfo_m
int X=2222
int TabOrder=150
boolean Visible=false
end type

event pb_insert::clicked;decimal li_seq_no
long ll_row
string ls_build_no

if dw_1.RowCount() < 1 then
	messagebox('확인','먼저 건설정보번호를 입력하세요')
	return
end if

if dw_2.RowCount() < 1 then
	li_seq_no = 1
else
	li_seq_no = dw_2.object.bdinfodet_seq[dw_2.RowCount()]
	li_seq_no = li_seq_no + 1
end if

ll_row = dw_2.insertrow(0)
dw_2.scrolltorow(ll_row)
ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
dw_2.object.bdinfodet_build_no[ll_row] = ls_build_no 
dw_2.object.bdinfodet_seq[ll_row] = li_seq_no 
dw_2.setcolumn('bdinfodet_project')
dw_2.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ifbdinfo_m
int X=2030
int TabOrder=140
boolean Visible=false
end type

type gb_3 from w_inheritance`gb_3 within w_ifbdinfo_m
int X=558
int Y=0
int Width=2574
int Height=1412
end type

type gb_2 from w_inheritance`gb_2 within w_ifbdinfo_m
int Y=0
int Width=512
int Height=1412
int TabOrder=80
end type

type gb_1 from w_inheritance`gb_1 within w_ifbdinfo_m
int X=1815
boolean Visible=false
end type

type cb_1 from commandbutton within w_ifbdinfo_m
int X=1527
int Y=1440
int Width=247
int Height=108
int TabOrder=70
boolean BringToTop=true
string Text="확인"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;long ll_row
string ls_build_no, ls_project, ls_buildingcom
decimal ld_seq
//st_bdinfo lst_bdinfo

ll_row = dw_2.GetRow()
//dw_2.scrolltorow(ll_row)
ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
ld_seq = dw_2.getitemnumber(ll_row,"bdinfodet_seq")
ls_project = dw_2.getitemstring(ll_row,"bdinfodet_project")
ls_buildingcom = dw_2.getitemstring(ll_row,"bdinfodet_buildingcom")
ist_bdinfo.build_no = ls_build_no
ist_bdinfo.seq = ld_seq
ist_bdinfo.project = ls_project
ist_bdinfo.buildingcom = ls_buildingcom

closewithreturn(parent, ist_bdinfo)
end event

type cb_2 from commandbutton within w_ifbdinfo_m
int X=1943
int Y=1440
int Width=247
int Height=108
int TabOrder=70
boolean BringToTop=true
string Text="닫기"
int TextSize=-10
int Weight=400
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;ist_bdinfo.cancel_flag = 'Y'
closewithreturn(parent, ist_bdinfo)
end event

