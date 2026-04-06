$PBExportHeader$w_bidinfo_input_m.srw
$PBExportComments$견적, 입찰정보 (2000/11/07 문종혁)
forward
global type w_bidinfo_input_m from w_inheritance
end type
type rb_1 from radiobutton within w_bidinfo_input_m
end type
type rb_2 from radiobutton within w_bidinfo_input_m
end type
type dw_3 from datawindow within w_bidinfo_input_m
end type
type pb_delete2 from picturebutton within w_bidinfo_input_m
end type
type pb_insert2 from picturebutton within w_bidinfo_input_m
end type
type gb_4 from groupbox within w_bidinfo_input_m
end type
end forward

global type w_bidinfo_input_m from w_inheritance
integer width = 3643
integer height = 2316
string title = "견적, 입찰정보(w_bidinfo_input_m)"
boolean resizable = false
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
pb_delete2 pb_delete2
pb_insert2 pb_insert2
gb_4 gb_4
end type
global w_bidinfo_input_m w_bidinfo_input_m

type variables
string is_build_no, is_ui_gubun
end variables

on w_bidinfo_input_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.pb_delete2=create pb_delete2
this.pb_insert2=create pb_insert2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.pb_delete2
this.Control[iCurrent+5]=this.pb_insert2
this.Control[iCurrent+6]=this.gb_4
end on

on w_bidinfo_input_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.pb_delete2)
destroy(this.pb_insert2)
destroy(this.gb_4)
end on

event open;call super::open;//dw_1.settransobject(sqlca)
//dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)

int li_chk
li_chk = dw_3.sharedata(dw_2)
if li_chk <> 1 then
	messagebox("확인","공유에러")
end if
dw_1.retrieve()

end event

type pb_save from w_inheritance`pb_save within w_bidinfo_input_m
integer x = 3182
end type

event pb_save::clicked;string ls_project
long ll_row1, ll_row2, ll_cnt1, ll_cnt2

dw_1.accepttext()
dw_2.accepttext()

ll_row2 = dw_2.GetRow()
ll_row1 = dw_1.GetRow()
if ll_row1 < 1 and ll_row2 < 1 then return

if ll_row2 >= 1 then
	ls_project = dw_2.object.bdinfodet_project[ll_row2]
	if isnull(ls_project) or trim(ls_project) = '' then
		messagebox('확인','현장명을 입력하세요')
		dw_2.setcolumn('bdinfodet_project')
		dw_2.setfocus()
		return
	end if

	if is_ui_gubun = 'I' then
		if rb_1.checked = true then
			dw_2.object.bdinfodet_etmt_chk[ll_row2] = '1'
		elseif rb_2.checked = true then
			dw_2.object.bdinfodet_bid_chk[ll_row2] = '1'
		end if
	end if
end if

ll_cnt1 = wf_modifycount(dw_1) 
ll_cnt2 = wf_modifycount(dw_2) 
if ll_cnt1 > 0  or ll_cnt2 > 0 then	
	wf_update2(dw_1,dw_2,"Y") 
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_cancel.enabled = false
end if
end event

type dw_1 from w_inheritance`dw_1 within w_bidinfo_input_m
integer x = 69
integer y = 420
integer width = 448
integer height = 384
string dataobject = "dw_info"
boolean hscrollbar = false
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
//messagebox('is_build_no',is_build_no)
if isnull(is_build_no) or is_build_no = "" then
   return
else
	dw_3.retrieve(is_build_no)
//	int li_chk
//	li_chk = dw_3.sharedata(dw_2)
//		if li_chk <> 1 then
//		messagebox("확인","공유에러")
//	end if
end if
end event

type dw_2 from w_inheritance`dw_2 within w_bidinfo_input_m
integer x = 585
integer width = 2981
string dataobject = "dw_etmtinfodet_input"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;//if row < 1 then return
//
//if dwo.name = 'seq' then
//   dw_2.ScrollTorow(row)
//end if
////dw_2.SetColumn('
//	
	
end event

event dw_2::editchanged;This.accepttext()
end event

type st_title from w_inheritance`st_title within w_bidinfo_input_m
integer x = 32
integer y = 32
integer width = 1440
integer height = 164
integer textsize = -24
string text = "견적, 입찰정보"
end type

type st_tips from w_inheritance`st_tips within w_bidinfo_input_m
end type

type pb_compute from w_inheritance`pb_compute within w_bidinfo_input_m
boolean visible = false
integer x = 2222
integer taborder = 100
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

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

type pb_print_part from w_inheritance`pb_print_part within w_bidinfo_input_m
boolean visible = false
integer x = 2990
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bidinfo_input_m
integer x = 3374
integer taborder = 110
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bidinfo_input_m
boolean visible = false
integer x = 2798
integer taborder = 120
boolean enabled = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_bidinfo_input_m
integer x = 2990
integer taborder = 130
end type

event pb_cancel::clicked;is_ui_gubun = ''

dw_2.reset()
pb_insert.enabled = true
pb_delete.enabled = true
pb_cancel.enabled = false
end event

type pb_delete from w_inheritance`pb_delete within w_bidinfo_input_m
integer x = 2798
integer taborder = 140
end type

event pb_delete::clicked;string ls_build_no, ls_std_chk
long ll_row

dw_1.accepttext()
dw_3.accepttext()

if dw_3.rowcount() < 1 then
	if dw_1.rowcount() < 1 then
		return
	else
		if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	      return
      end if	
		dw_1.deleterow(0)
		if dw_1.RowCount() >= 1 then
			ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
			dw_3.Retrieve(ls_build_no)
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
ll_row = dw_3.GetRow()
ls_std_chk = dw_3.object.bdinfodet_std_chk[ll_row] 
//ls_etmt_chk = dw_3.object.bidinfodet_etmt_chk[ll_row] 
if ls_std_chk = '1' then
	if rb_1.checked = true then
		dw_3.object.bdinfodet_etmt_chk[ll_row] = '0'
	elseif rb_2.checked = true then
		dw_3.object.bdinfodet_bid_chk[ll_row] = '0'
	end if
	wf_update1(dw_3,"Y")
	if dw_1.RowCount() >= 1 then
		ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
		dw_3.Retrieve(ls_build_no)
	end if
else
	dw_3.deleterow(0)
	wf_update1(dw_3,"Y")
end if
//   dw_1.deleterow(dw_1.getrow())
//else
//	dw_2.deleterow(0)
//	dw_2.retrieve(ls_build_no)
//end if	
end event

type pb_insert from w_inheritance`pb_insert within w_bidinfo_input_m
integer x = 2606
integer taborder = 160
end type

event pb_insert::clicked;decimal ld_seq_no = 0
long ll_row
string ls_build_no

is_ui_gubun = 'I' //인서트시

if dw_1.RowCount() < 1 then
	messagebox('확인','먼저 건설정보번호를 입력하세요')
	return
end if

//if dw_2.RowCount() < 1 then
////	if rb_1.checked = true then 
////		ld_seq_no = 40001
////	elseif rb_2.checked = true then
////		ld_seq_no = 70001
////	end if
//	ld_seq_no = 1
//else
//	ld_seq_no = dw_2.object.bdinfodet_seq[dw_2.RowCount()]
select max(seq) into :ld_seq_no from bdinfodet
 where build_no = :is_build_no;
if ld_seq_no = 0 or isnull(ld_seq_no) then
  	 ld_seq_no = 1
elseif ld_seq_no >= 1 then
	 ld_seq_no = ld_seq_no + 1
end if
//end if

dw_2.setredraw (false)
ll_row = dw_2.insertrow(0)
dw_2.scrolltorow(ll_row)
dw_3.scrolltorow(ll_row)
ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
dw_2.object.bdinfodet_sitedate[ll_row] = today()
dw_2.object.bdinfodet_biddate[ll_row] = today()
dw_2.object.bdinfodet_build_no[ll_row] = ls_build_no 
dw_2.object.bdinfodet_seq[ll_row] = ld_seq_no 

dw_2.setcolumn('bdinfodet_project')
dw_2.setredraw (true)
dw_2.setfocus()
pb_insert.enabled = false
pb_delete.enabled = false
pb_cancel.enabled = true
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_bidinfo_input_m
integer x = 2414
integer taborder = 150
end type

event pb_retrieve::clicked;st_bdinfo lst_bdinfo
string ls_build_no, ls_buildingcom, ls_project
long ll_row
dec ld_seq

openwithparm(w_ifbdinfo_m,lst_bdinfo)
lst_bdinfo = message.powerobjectparm

ls_build_no = lst_bdinfo.build_no
//ls_buildingcom = lst_bdinfo.buildingcom
//ls_project = lst_bdinfo.project
ld_seq = lst_bdinfo.seq

if rb_1.checked = true then
	lst_bdinfo.gubun = '1' //견적
elseif rb_2.checked = true then
	lst_bdinfo.gubun = '2' //입찰
end if

if lst_bdinfo.cancel_flag = 'Y' then return

//dw_2.DataObject = 'dw_bidretrieve'
//dw_2.settransobject(sqlca)
//dw_2.sharedata(dw_3)
//dw_3.setredraw(false)
//ll_row = dw_2.retrieve(ls_build_no, ld_seq)
openwithparm(w_edit_popup,lst_bdinfo)
lst_bdinfo = message.powerobjectparm

if lst_bdinfo.cancel_flag = 'N' then
	dw_3.retrieve(is_build_no)
end if
//dw_2.scrolltorow(ll_row)
//ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
//dw_2.object.bdinfodet_sitedate[ll_row] = today()
//dw_2.object.bdinfodet_biddate[ll_row] = today()
//dw_2.object.bdinfodet_build_no[ll_row] = ls_build_no 
//dw_2.object.bdinfodet_seq[ll_row] = ld_seq
//dw_2.object.bdinfodet_buildingcom[ll_row] = ls_buildingcom
//dw_2.object.bdinfodet_project[ll_row] = ls_project

//dw_2.setcolumn('bdinfodet_sitedate')
//dw_2.setfocus()

//dw_3.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_bidinfo_input_m
integer x = 558
integer y = 216
integer width = 3026
integer height = 1852
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_bidinfo_input_m
integer x = 37
integer y = 216
integer width = 512
integer height = 616
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_bidinfo_input_m
integer x = 2386
integer width = 1202
end type

type rb_1 from radiobutton within w_bidinfo_input_m
integer x = 1664
integer y = 88
integer width = 256
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "견적"
boolean checked = true
end type

event clicked;int li_chk

dw_2.DataObject = 'dw_etmtinfodet_input'
dw_3.DataObject = 'dw_etmtinfodet_input2'
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
//is_build_no = dw_1.getitemstring(ll_row,"build_no")
//messagebox('is_build_no',is_build_no)
if isnull(is_build_no) or is_build_no = "" then
   return
else
	dw_3.retrieve(is_build_no)
	li_chk = dw_3.sharedata(dw_2)
	if li_chk <> 1 then
		messagebox("확인","공유에러")
	end if
end if
//dw_2.retrieve(is_build_no)
end event

type rb_2 from radiobutton within w_bidinfo_input_m
integer x = 1938
integer y = 88
integer width = 251
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "입찰"
end type

event clicked;//dw_2.DataObject	 = 'dw_bidinfodet'
//dw_2.settransobject(sqlca)
//dw_2.retrieve(is_build_no)
int li_chk

dw_2.DataObject = 'dw_bidinfodet_input'
dw_3.DataObject = 'dw_bidinfodet_input2'
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
//is_build_no = dw_1.getitemstring(ll_row,"build_no")
//messagebox('is_build_no',is_build_no)
if isnull(is_build_no) or is_build_no = "" then
   return
else
	dw_3.retrieve(is_build_no)
	li_chk = dw_3.sharedata(dw_2)
	if li_chk <> 1 then
		messagebox("확인","공유에러")
	end if
end if
//dw_2.retrieve(is_build_no)
end event

type dw_3 from datawindow within w_bidinfo_input_m
integer x = 69
integer y = 892
integer width = 443
integer height = 1168
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_etmtinfodet_input2"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = dw_3.getrow()
dw_2.scrolltorow(ll_row)
end event

event clicked;//if row < 1 then return
//
//long ll_row
//
//ll_row = dw_3.getrow()
//dw_2.scrolltorow(row)
end event

type pb_delete2 from picturebutton within w_bidinfo_input_m
integer x = 315
integer y = 268
integer width = 187
integer height = 144
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;string ls_build_no
int i, j

if dw_1.rowcount() < 1 then
	return
else
	if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
      return
   end if	
	
//	messagebox('',string(dw_3.rowcount()))
//	return
	if dw_3.rowcount() < 1 then
		
		dw_1.deleterow(0)
		if dw_1.RowCount() >= 1 then
			ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
			dw_3.Retrieve(ls_build_no)
		end if
		wf_update1(dw_1,"Y")
		return
		
	else
		
	   if MessageBox("확인",'상세정보의 모든자료를 삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
         return
      end if	
	
		j = dw_3.rowcount()
		
		dw_3.RowsMove(1, dw_3.RowCount(), Primary!, dw_3, 1, Delete!)
		
//		for i = 1 to j
//			dw_3.deleterow(0)
			wf_update1(dw_3,"N")
//		next
	end if
	
	dw_1.deleterow(0)
	if dw_1.RowCount() >= 1 then
		ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
		dw_3.Retrieve(ls_build_no)
	end if
	wf_update1(dw_1,"Y")
//	return
end if
end event

type pb_insert2 from picturebutton within w_bidinfo_input_m
integer x = 91
integer y = 268
integer width = 187
integer height = 144
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;int li_build_no
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
end event

type gb_4 from groupbox within w_bidinfo_input_m
integer x = 37
integer y = 832
integer width = 512
integer height = 1240
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

