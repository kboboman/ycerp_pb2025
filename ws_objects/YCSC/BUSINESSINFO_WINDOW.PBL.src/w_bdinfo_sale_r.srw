$PBExportHeader$w_bdinfo_sale_r.srw
$PBExportComments$판매 물량 조회[2000/11/09,문종혁]
forward
global type w_bdinfo_sale_r from w_inheritance
end type
type pb_insert2 from picturebutton within w_bdinfo_sale_r
end type
type pb_delete2 from picturebutton within w_bdinfo_sale_r
end type
type ddlb_1 from dropdownlistbox within w_bdinfo_sale_r
end type
type st_1 from statictext within w_bdinfo_sale_r
end type
end forward

global type w_bdinfo_sale_r from w_inheritance
integer width = 3643
integer height = 2188
string title = "판매 물량 조회(w_bdinfo_sale_r)"
boolean resizable = false
pb_insert2 pb_insert2
pb_delete2 pb_delete2
ddlb_1 ddlb_1
st_1 st_1
end type
global w_bdinfo_sale_r w_bdinfo_sale_r

type variables
string is_build_no
st_print i_print
gst_bdwhere ist_where
string ls_deptcd, ls_person, ls_speccd, ls_project
string ls_fixedflag
date ld_fixeddate1, ld_fixeddate2
end variables

on w_bdinfo_sale_r.create
int iCurrent
call super::create
this.pb_insert2=create pb_insert2
this.pb_delete2=create pb_delete2
this.ddlb_1=create ddlb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_insert2
this.Control[iCurrent+2]=this.pb_delete2
this.Control[iCurrent+3]=this.ddlb_1
this.Control[iCurrent+4]=this.st_1
end on

on w_bdinfo_sale_r.destroy
call super::destroy
destroy(this.pb_insert2)
destroy(this.pb_delete2)
destroy(this.ddlb_1)
destroy(this.st_1)
end on

event open;call super::open;this.hide()
messagebox("확인","건설정보조회 프로그램을 이용하십시요.")
close(this)
return

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

ls_deptcd = '%'
ls_speccd = '%'
ls_project = '%'
ls_fixedflag = '%'
ld_fixeddate1 = date('1990/01/01')
ld_fixeddate2 = date('2200/01/01')

pb_retrieve.PostEvent(Clicked!)
//dw_1.retrieve()


end event

type pb_save from w_inheritance`pb_save within w_bdinfo_sale_r
boolean visible = false
integer x = 2752
integer y = 48
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

type dw_1 from w_inheritance`dw_1 within w_bdinfo_sale_r
integer x = 73
integer y = 284
integer width = 448
string dataobject = "dw_info"
borderstyle borderstyle = stylelowered!
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
	dw_2.retrieve(is_build_no, ls_deptcd, ls_speccd, ls_project, ls_fixedflag, ld_fixeddate1, ld_fixeddate2)
end if
end event

type dw_2 from w_inheritance`dw_2 within w_bdinfo_sale_r
integer x = 585
integer y = 284
integer width = 2981
string dataobject = "dw_infodet_sale_ret"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;if row < 1 then return

if dwo.name = 'seq' then
   dw_2.ScrollTorow(row)
end if
	
	
end event

type st_title from w_inheritance`st_title within w_bdinfo_sale_r
integer y = 36
integer width = 1394
integer height = 164
integer textsize = -24
long textcolor = 1090519039
string text = "판매 물량 조회"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_sale_r
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_sale_r
boolean visible = false
integer x = 1838
boolean enabled = false
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

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_sale_r
boolean visible = false
integer x = 2560
integer y = 48
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_sale_r
integer x = 3374
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_sale_r
integer x = 3186
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no

if dw_2.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if

//dw_2.GroupCalc()

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 판매물량현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_sale_r
boolean visible = false
integer x = 2350
integer y = 36
integer taborder = 120
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_sale_r
boolean visible = false
integer x = 2158
integer y = 36
integer taborder = 130
boolean enabled = false
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

type pb_insert from w_inheritance`pb_insert within w_bdinfo_sale_r
boolean visible = false
integer x = 2222
integer taborder = 150
boolean enabled = false
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
ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
dw_2.object.bdinfodet_build_no[ll_row] = ls_build_no 
dw_2.object.bdinfodet_seq[ll_row] = ld_seq_no 
dw_2.setcolumn('bdinfodet_project')
dw_2.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_sale_r
integer x = 2999
integer taborder = 140
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

	dw_1.reset()
	dw_1.retrieve()
	//dw_2.retrieve(is_build_no, ls_deptcd, ls_speccd, ls_project, ls_fixedflag, ld_fixeddate1, ld_fixeddate2)
	
	if dw_2.rowcount() > 0 then
		//dw_2.SetRedraw(false)
		if ddlb_1.text = '확정일자' then
			dw_2.SetSort("bdinfodet_fixeddate D")
		elseif ddlb_1.text = '본부' then  //부서=>본부
			dw_2.SetSort("bdinfodet_dept A")
		elseif ddlb_1.text = '스펙' then
			dw_2.SetSort("bdinfodet_spec A")
		elseif ddlb_1.text = '프로젝트명' then
			dw_2.SetSort("bdinfodet_project A")
		else
			dw_2.SetSort("bdinfodet_project A")
		end if
		dw_2.Sort()
		//dw_2.SetRedraw(true)
	end if
else
	return
end if


end event

type gb_3 from w_inheritance`gb_3 within w_bdinfo_sale_r
integer x = 562
integer y = 232
integer width = 3031
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_sale_r
integer x = 37
integer y = 232
integer width = 512
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_sale_r
integer x = 2962
integer width = 626
end type

type pb_insert2 from picturebutton within w_bdinfo_sale_r
boolean visible = false
integer x = 1678
integer y = 8
integer width = 187
integer height = 144
integer taborder = 160
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

type pb_delete2 from picturebutton within w_bdinfo_sale_r
boolean visible = false
integer x = 1897
integer y = 8
integer width = 187
integer height = 144
integer taborder = 170
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

type ddlb_1 from dropdownlistbox within w_bdinfo_sale_r
integer x = 2295
integer y = 128
integer width = 571
integer height = 388
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"본부","스펙","프로젝트명","확정일자"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;	if dw_2.rowcount() > 0 then
		//dw_2.SetRedraw(false)
		if ddlb_1.text = '확정일자' then
			dw_2.SetSort("bdinfodet_fixeddate D")
		elseif ddlb_1.text = '본부' then
			dw_2.SetSort("bdinfodet_dept A")
		elseif ddlb_1.text = '스펙' then
			dw_2.SetSort("bdinfodet_spec A")
		elseif ddlb_1.text = '프로젝트명' then
			dw_2.SetSort("bdinfodet_project A")
		else
			dw_2.SetSort("bdinfodet_project A")
		end if
		dw_2.Sort()
		//dw_2.SetRedraw(true)
	end if
end event

type st_1 from statictext within w_bdinfo_sale_r
integer x = 2039
integer y = 140
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79741120
boolean enabled = false
string text = "정렬조건"
boolean focusrectangle = false
end type

