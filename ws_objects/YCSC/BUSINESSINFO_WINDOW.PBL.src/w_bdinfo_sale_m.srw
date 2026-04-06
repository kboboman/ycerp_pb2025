$PBExportHeader$w_bdinfo_sale_m.srw
$PBExportComments$판매 물량 관리[2000/11/09,문종혁]
forward
global type w_bdinfo_sale_m from w_inheritance
end type
type pb_insert2 from picturebutton within w_bdinfo_sale_m
end type
type pb_delete2 from picturebutton within w_bdinfo_sale_m
end type
type dw_3 from datawindow within w_bdinfo_sale_m
end type
end forward

global type w_bdinfo_sale_m from w_inheritance
int Width=3643
int Height=2316
boolean TitleBar=true
string Title="판매 물량 관리(w_bdinfo_sale_m)"
pb_insert2 pb_insert2
pb_delete2 pb_delete2
dw_3 dw_3
end type
global w_bdinfo_sale_m w_bdinfo_sale_m

type variables
string is_build_no
gst_bdwhere ist_where
string ls_person, ls_deptcd, ls_speccd, ls_project
string ls_fixedflag
date ld_fixeddate1, ld_fixeddate2
end variables

on w_bdinfo_sale_m.create
int iCurrent
call super::create
this.pb_insert2=create pb_insert2
this.pb_delete2=create pb_delete2
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_insert2
this.Control[iCurrent+2]=this.pb_delete2
this.Control[iCurrent+3]=this.dw_3
end on

on w_bdinfo_sale_m.destroy
call super::destroy
destroy(this.pb_insert2)
destroy(this.pb_delete2)
destroy(this.dw_3)
end on

event open;call super::open;this.hide()
messagebox("확인","건설정보진행현황관리 프로그램을 이용하십시요.")
close(this)
return

//dw_1.settransobject(sqlca)
//dw_2.settransobject(sqlca)

dw_3.settransobject(sqlca)

ls_deptcd = '%'
ls_speccd = '%'
ls_project = '%'
ls_fixedflag = '%'
ld_fixeddate1 = date('1990/01/01')
ld_fixeddate2 = date('2200/01/01')

pb_retrieve.PostEvent(Clicked!)
//dw_1.retrieve()

end event

type pb_save from w_inheritance`pb_save within w_bdinfo_sale_m
int X=3182
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

type dw_1 from w_inheritance`dw_1 within w_bdinfo_sale_m
int Width=448
int Height=380
string DataObject="dw_info"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=false
end type

event dw_1::rowfocuschanged;long ll_row

ll_row = wf_rowfocuschange(dw_1,"N")
if ll_row < 1 then
	return
end if

dw_1.accepttext()
dw_2.accepttext()
is_build_no = dw_1.getitemstring(ll_row,"build_no")

if isnull(is_build_no) or is_build_no = "" then
   return
else
	//dw_3.retrieve(is_build_no, ls_deptcd, ls_speccd)	
	//dw_3.retrieve(is_build_no, ls_deptcd, ls_speccd, ls_project)
	dw_3.retrieve(is_build_no, ls_deptcd, ls_speccd, ls_project, ls_fixedflag, ld_fixeddate1, ld_fixeddate2)
	dw_3.sharedata(dw_2)
end if
end event

type dw_2 from w_inheritance`dw_2 within w_bdinfo_sale_m
int X=585
int Width=2981
string DataObject="dw_bdinfo_sale_m"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=false
end type

event dw_2::clicked;//if row < 1 then return
//
//if dwo.name = 'seq' then
//   dw_2.ScrollTorow(row)
//end if
////dw_2.SetColumn('
//	
//	
end event

event dw_2::rowfocuschanged;dw_3.scrolltorow(dw_2.getrow())
end event

type st_title from w_inheritance`st_title within w_bdinfo_sale_m
string Text="판매 물량 관리"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_sale_m
int X=2679
int Y=28
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_sale_m
int X=1838
boolean Visible=false
boolean Enabled=false
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

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_sale_m
int X=1632
int Y=48
boolean Visible=false
boolean Enabled=false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_sale_m
int X=3374
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_sale_m
int X=2647
int Y=56
boolean Visible=false
boolean Enabled=false
end type

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_sale_m
int X=2446
boolean Visible=false
boolean Enabled=false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_sale_m
int X=2254
boolean Visible=false
boolean Enabled=false
end type

event pb_delete::clicked;string ls_build_no
boolean lb_del_chk

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
      lb_del_chk = wf_update1(dw_1,"Y")
      if lb_del_chk = false then dw_1.Retrieve()
		return
	end if
end if

if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

//ls_build_no = dw_1.object.build_no[dw_1.getrow()]
//if ls_build_no = dw_2.object.bdinfodet_build_no[dw_2.getrow()] then
dw_2.deleterow(0)	
lb_del_chk = wf_update1(dw_2,"Y")
if lb_del_chk = false then 
	ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
	dw_2.Retrieve(ls_build_no)
end if

//   dw_1.deleterow(dw_1.getrow())
//else
//	dw_2.deleterow(0)
//	dw_2.retrieve(ls_build_no)
//end if	
end event

type pb_insert from w_inheritance`pb_insert within w_bdinfo_sale_m
int X=2062
boolean Visible=false
boolean Enabled=false
end type

event pb_insert::clicked;decimal ld_seq_no
long ll_row
string ls_build_no

if dw_1.RowCount() < 1 then
	messagebox('확인','먼저 건설정보번호를 입력하세요')
	return
end if

if dw_2.RowCount() < 1 then
	ld_seq_no = 1
else
	ld_seq_no = dw_2.object.bdinfodet_seq[dw_2.RowCount()]
	ld_seq_no = ld_seq_no + 1
end if

ll_row = dw_2.insertrow(0)
dw_2.scrolltorow(ll_row)
dw_3.scrolltorow(ll_row)
ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
dw_2.object.bdinfodet_build_no[ll_row] = ls_build_no 
dw_2.object.bdinfodet_seq[ll_row] = ld_seq_no 
dw_2.setcolumn('bdinfodet_salequantity')
dw_2.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_sale_m
int X=2990
end type

event pb_retrieve::clicked;
openwithparm(w_bdinfo_w, ist_where)
ist_where = Message.PowerObjectParm

if ist_where.okflag = true then
	ls_person = ist_where.str1
	ls_deptcd = ist_where.str2 
	ls_speccd = ist_where.str3 
	ls_project = ist_where.str4
	if ls_project = '' then 
		ls_project = '%'
	else
		ls_project = '%' + ls_project + '%'
	end if
	if ist_where.str5 = '전체' then 
		ls_fixedflag = '%'
	elseif ist_where.str5 = '설계' then 
		ls_fixedflag = '1'
	elseif ist_where.str5 = '설계변경' then 
		ls_fixedflag = '2'
	elseif ist_where.str5 = '현장' then 
		ls_fixedflag = '3'
	end if
	ld_fixeddate1 = date(ist_where.sdate1)
	ld_fixeddate2 = date(ist_where.sdate2)

	dw_1.reset()
	dw_1.retrieve()
	//dw_3.retrieve(is_build_no, ls_deptcd, ls_speccd, ls_project, ls_fixedflag, ld_fixeddate1, ld_fixeddate2)
else
	return
end if


end event

type gb_3 from w_inheritance`gb_3 within w_bdinfo_sale_m
int X=558
int Y=224
int Width=3031
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_sale_m
int Y=224
int Width=512
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_sale_m
int X=2962
int Width=622
end type

type pb_insert2 from picturebutton within w_bdinfo_sale_m
int X=82
int Y=2064
int Width=187
int Height=144
int TabOrder=150
boolean Visible=false
string PictureName="c:\bmp\pencil.bmp"
Alignment HTextAlign=Right!
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type pb_delete2 from picturebutton within w_bdinfo_sale_m
int X=302
int Y=2064
int Width=187
int Height=144
int TabOrder=160
boolean Visible=false
string PictureName="c:\bmp\delete.bmp"
Alignment HTextAlign=Right!
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_3 from datawindow within w_bdinfo_sale_m
int X=64
int Y=688
int Width=443
int Height=1332
int TabOrder=60
boolean BringToTop=true
string DataObject="dw_bidinfodet_sale_m"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event rowfocuschanged;dw_2.scrolltorow(dw_3.getrow())
dw_2.setcolumn('bdinfodet_salequantity')
dw_2.setfocus()
end event

