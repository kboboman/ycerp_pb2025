$PBExportHeader$w_bdinfo_r3.srw
$PBExportComments$일일업무진행현황[2000.12.05,서재복]
forward
global type w_bdinfo_r3 from w_inheritance
end type
type pb_insert2 from picturebutton within w_bdinfo_r3
end type
type pb_delete2 from picturebutton within w_bdinfo_r3
end type
type ddlb_1 from dropdownlistbox within w_bdinfo_r3
end type
type st_1 from statictext within w_bdinfo_r3
end type
type dw_3 from datawindow within w_bdinfo_r3
end type
type pb_print1 from picturebutton within w_bdinfo_r3
end type
type st_2 from statictext within w_bdinfo_r3
end type
type em_1 from editmask within w_bdinfo_r3
end type
type st_3 from statictext within w_bdinfo_r3
end type
type dw_4 from datawindow within w_bdinfo_r3
end type
type st_4 from statictext within w_bdinfo_r3
end type
type em_2 from editmask within w_bdinfo_r3
end type
type st_5 from statictext within w_bdinfo_r3
end type
end forward

global type w_bdinfo_r3 from w_inheritance
integer width = 3666
string title = "일일업무진행현황(w_bdinfo_r3)"
pb_insert2 pb_insert2
pb_delete2 pb_delete2
ddlb_1 ddlb_1
st_1 st_1
dw_3 dw_3
pb_print1 pb_print1
st_2 st_2
em_1 em_1
st_3 st_3
dw_4 dw_4
st_4 st_4
em_2 em_2
st_5 st_5
end type
global w_bdinfo_r3 w_bdinfo_r3

type variables
string is_build_no
st_print i_print
gst_bdwhere ist_where
string is_speccd, is_project
datetime id_fixeddate1, id_fixeddate2
string is_sprog, is_dprog, is_cprog, is_city

string is_divcls, is_percls, is_expcls
date id_expdate1,  id_expdate2
string is_person, is_divcd
string is_dperson, is_ddiv
string is_cperson, is_cdiv, is_bperson, is_bdiv
string  is_sperson, is_sdiv
date id_makedate1, id_makedate2
date id_dexpdate1, id_dexpdate2
date id_cexpdate1, id_cexpdate2
date id_bexpdate1, id_bexpdate2
date id_sexpdate1, id_sexpdate2

string is_stddiv, is_stdper
string is_organcd, is_designcd

end variables

forward prototypes
public subroutine wf_sortconf ()
end prototypes

public subroutine wf_sortconf ();if dw_2.rowcount() > 0 then
	//dw_2.SetRedraw(false)
	if ddlb_1.text = '본부' then
		dw_2.SetSort("bdinfodet_div A, bdinfodet_project A")
	elseif ddlb_1.text = '스펙' then
		dw_2.SetSort("bdinfodet_spec A, bdinfodet_project A")
	elseif ddlb_1.text = '프로젝트명' then
		dw_2.SetSort("bdinfodet_project A")
	elseif ddlb_1.text = '확정구분' then
		dw_2.SetSort("bdinfodet_sale_prog A, bdinfodet_fixeddate D, bdinfodet_project A")
	elseif ddlb_1.text = '확정일자' then
		dw_2.SetSort("bdinfodet_fixeddate D, bdinfodet_sale_prog A, bdinfodet_project A")
	elseif ddlb_1.text = '현장위치' then 
		dw_2.SetSort("bdinfodet_city A bdinfodet_dong A, bdinfodet_project A")
	else
		dw_2.SetSort("bdinfodet_div A, bdinfodet_project A")
	end if
	dw_2.Sort()
	//dw_2.SetRedraw(true)
end if
end subroutine

on w_bdinfo_r3.create
int iCurrent
call super::create
this.pb_insert2=create pb_insert2
this.pb_delete2=create pb_delete2
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.dw_3=create dw_3
this.pb_print1=create pb_print1
this.st_2=create st_2
this.em_1=create em_1
this.st_3=create st_3
this.dw_4=create dw_4
this.st_4=create st_4
this.em_2=create em_2
this.st_5=create st_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_insert2
this.Control[iCurrent+2]=this.pb_delete2
this.Control[iCurrent+3]=this.ddlb_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.pb_print1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.dw_4
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.em_2
this.Control[iCurrent+13]=this.st_5
end on

on w_bdinfo_r3.destroy
call super::destroy
destroy(this.pb_insert2)
destroy(this.pb_delete2)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.pb_print1)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.em_2)
destroy(this.st_5)
end on

event open;call super::open;dw_1.settransobject(sqlca)
dw_3.settransobject(sqlca)

is_person = '%'
is_divcd = '%'
is_speccd = '%' //'003' //'%'
is_project = '%'
is_sprog = '%'
is_dprog = '%'
is_cprog = '%'
is_city = '%'
is_organcd = '%'
is_designcd = '%'

datawindowchild ldwc_person, ldwc_div, ldwc_spec

dw_4.settransobject(sqlca)
dw_4.insertrow(0)
dw_4.getchild('spec_code',ldwc_spec)
ldwc_spec.insertrow(1)
ldwc_spec.setitem(1,'spec_code','%')
ldwc_spec.setitem(1,'spec_name','전체')
ldwc_spec.accepttext()

//em_1.text = string(today(), "yyyy/mm/dd")
em_1.text = string(RelativeDate(today(),  - 1), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

pb_retrieve.PostEvent(Clicked!)
//dw_1.retrieve()

end event

type pb_save from w_inheritance`pb_save within w_bdinfo_r3
boolean visible = false
integer x = 4091
integer y = 92
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

type dw_1 from w_inheritance`dw_1 within w_bdinfo_r3
boolean visible = false
integer x = 3845
integer y = 1260
integer width = 448
integer height = 384
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
dw_2.reset()

if isnull(is_build_no) or is_build_no = "" then
   return
else
	dw_2.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, is_organcd, is_designcd)
	dw_2.ShareData(dw_3)
end if
end event

type st_title from w_inheritance`st_title within w_bdinfo_r3
integer width = 1394
integer textsize = -20
long textcolor = 1090519039
string text = "일일업무진행현황"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_r3
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_r3
boolean visible = false
integer x = 3858
integer y = 244
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

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_r3
boolean visible = false
integer x = 3899
integer y = 92
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_r3
integer x = 3374
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_r3
boolean visible = false
integer x = 4133
integer y = 352
integer taborder = 130
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no

//ld_start = date(em_1.text)
//ld_end = date(em_2.text)
//if rb_1.checked = true then
//	dw_2.dataobject = 'dw_infodet_ret'	
//	dw_2.settransobject(sqlca)
//	dw_2.retrieve(ld_start, ld_end)
//else
//end if
//dw_2.object.c_start[1] = string(ld_start, 'YYYY/MM/DD')
//dw_2.object.c_end[1] = string(ld_end, 'YYYY/MM/DD')

if dw_3.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if


//dw_3.object.c_start[1] = string(ld_fixeddate1, 'YYYY/MM/DD')
//dw_3.object.c_end[1] = string(ld_fixeddate2, 'YYYY/MM/DD')

//l_print.name = 'd_bdinfodet_r1'

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 견적현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_r3
boolean visible = false
integer x = 3954
integer y = 292
integer taborder = 140
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_r3
boolean visible = false
integer x = 4306
integer y = 124
integer taborder = 150
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_bdinfo_r3
boolean visible = false
integer x = 4334
integer y = 360
integer taborder = 180
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

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_r3
integer x = 2990
integer taborder = 160
boolean default = true
end type

event pb_retrieve::clicked;//is_speccd = dw_4.object.spec_code[1] 
is_speccd = '003'
if is_speccd = '' or isnull(is_speccd) then is_speccd = '%'
	
id_fixeddate1 = datetime(date(em_1.text), time("00:00:00")) 
id_fixeddate2 = datetime(date(em_2.text), time("23:59:59")) 
//id_fixeddate1 = datetime(date(em_1.text), time("00:00:00")) 
//id_fixeddate2 = datetime(date(em_1.text), time("23:59:59")) 

dw_1.reset()
dw_1.retrieve()

//물량계산 dw_에다가 sum(c_quantity for group 1  distinct bdinfodet_div, bdinfodet_project)

end event

type gb_3 from w_inheritance`gb_3 within w_bdinfo_r3
integer x = 37
integer y = 232
integer width = 3557
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_r3
boolean visible = false
integer x = 3808
integer y = 1208
integer width = 512
integer height = 472
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_r3
integer x = 2953
integer width = 635
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_r3
integer x = 69
integer y = 280
integer width = 3493
string dataobject = "d_bdinfo_r3"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;if row < 1 then return

if dwo.name = 'seq' then
   dw_2.ScrollTorow(row)
end if
	
IF row > 0 THEN
	ScrollToRow( row )
	SelectRow( 0, FALSE )
	SelectRow( row, TRUE )
END IF
end event

event dw_2::doubleclicked;if row < 1 then return

ist_where.str12 = this.object.bdinfodet_build_no[this.getrow()]
ist_where.dec4 = this.object.bdinfodet_seq[this.getrow()]
openwithparm(w_bdinfo_input_r, ist_where)

end event

event dw_2::retrieveend;long ll_row
if this.rowcount() <= 0 then return

//추후 실적기준을 위해 임시-지우면 안됨
//openwithparm(w_bdinfo_w3, ist_where)
//ist_where = Message.PowerObjectParm
//if ist_where.okflag = true then
//	is_stddiv = ist_where.str19
//	is_stdper = ist_where.str20
//end if
//추후 실적기준을 위해 임시-지우면 안됨
this.setredraw(false)
for ll_row = 1 to this.rowcount()
	if is_stddiv = '설계영업담당본부' then
		this.object.c_div[ll_row] = this.object.bdinfodet_ddiv[ll_row]
	elseif is_stddiv = '건설사영업담당본부' then
		this.object.c_div[ll_row] = this.object.bdinfodet_cdiv[ll_row]	
	elseif is_stddiv = '시공사영업담당본부' then
		this.object.c_div[ll_row] = this.object.bdinfodet_bdiv[ll_row]	
	elseif is_stddiv = '판매영업담당본부' then
		this.object.c_div[ll_row] = this.object.bdinfodet_sdiv[ll_row]	
	else
		this.object.c_div[ll_row] = this.object.bdinfodet_div[ll_row]	
	end if
	if dw_2.object.bdinfodet_sale_prog[ll_row] = '010' &
	or dw_2.object.bdinfodet_sale_prog[ll_row] = '020' then //진행중 또는 확정
		dw_2.object.c_quantity[ll_row] = dw_2.object.bdinfodet_quantity[ll_row] //설계물량
	elseif dw_2.object.bdinfodet_sale_prog[ll_row] = '027' then //수주확정
		dw_2.object.c_quantity[ll_row] = dw_2.object.bdinfodet_salequantity[ll_row]//판매확정물량
	else
		dw_2.object.c_quantity[ll_row] = dw_2.object.bdinfodet_buildquantity[ll_row]	
	end if
next

if dw_2.rowcount() > 0 then
	//dw_2.SetSort("bdinfodet_div A, bdinfodet_project A")
	dw_2.SetSort("c_div A, bdinfodet_project, v_bdinfodetprogmax_prog_date A")
	dw_2.Sort()
end if

this.setredraw(true)

end event

type pb_insert2 from picturebutton within w_bdinfo_r3
boolean visible = false
integer x = 4219
integer y = 576
integer width = 187
integer height = 144
integer taborder = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

type pb_delete2 from picturebutton within w_bdinfo_r3
boolean visible = false
integer x = 3954
integer y = 532
integer width = 187
integer height = 144
integer taborder = 210
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

type ddlb_1 from dropdownlistbox within w_bdinfo_r3
boolean visible = false
integer x = 3918
integer y = 732
integer width = 571
integer height = 388
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"본부","스펙","프로젝트명","확정구분","확정일자","현장위치"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;wf_sortconf()
end event

type st_1 from statictext within w_bdinfo_r3
boolean visible = false
integer x = 3666
integer y = 744
integer width = 251
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
string text = "정렬조건:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_bdinfo_r3
boolean visible = false
integer x = 1467
integer y = 124
integer width = 146
integer height = 100
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_infodet_p4"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;long ll_row
if dw_3.rowcount() <= 0 then return
for ll_row = 1 to dw_3.rowcount()
	if dw_3.object.bdinfodet_sale_prog[ll_row] = '010' &
	or dw_3.object.bdinfodet_sale_prog[ll_row] = '020' then  //진행중 또는 확정
		dw_3.object.c_quantity[ll_row] = dw_3.object.bdinfodet_quantity[ll_row]  //설계물량
	elseif dw_3.object.bdinfodet_sale_prog[ll_row] = '027' then  //수주확정
		dw_3.object.c_quantity[ll_row] = dw_3.object.bdinfodet_salequantity[ll_row] //판매확정물량
	else
		dw_3.object.c_quantity[ll_row] = dw_3.object.bdinfodet_buildquantity[ll_row]	
	end if
next

end event

type pb_print1 from picturebutton within w_bdinfo_r3
event mousemove pbm_mousemove
integer x = 3182
integer y = 52
integer width = 187
integer height = 144
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"일일업무진행현황",parent, li_x, li_y)


end event

event clicked;w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no, ls_specname

if dw_3.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if

SELECT spec_name  into :ls_specname
    FROM bdspec 
	 where spec_code = :is_speccd;

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 일일업무진행현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=92'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)


w_print.dw_1.object.t_start.text = string(id_fixeddate1, 'YYYY/MM/DD')
w_print.dw_1.object.t_end.text = string(id_fixeddate2, 'YYYY/MM/DD')

if trim(ls_specname) = '' or isnull(ls_specname) or ls_specname = '%' then
	w_print.dw_1.object.t_spec.text = ""
else
	w_print.dw_1.object.t_spec.text = "(" + string(ls_specname) + ")"
end if

end event

type st_2 from statictext within w_bdinfo_r3
integer x = 2021
integer y = 20
integer width = 878
integer height = 96
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 8388736
long backcolor = 67108864
boolean enabled = false
string text = "목록을 더블클릭하시면 건설정보에 대한 상세 내역을 볼수 있습니다."
boolean focusrectangle = false
end type

type em_1 from editmask within w_bdinfo_r3
integer x = 2162
integer y = 140
integer width = 338
integer height = 88
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;string ls_date

openWithParm(w_calendar, ls_date)
ls_date = message.stringparm
if ls_date <> 'N' then
	em_1.text = string(date(ls_date))
end if

end event

type st_3 from statictext within w_bdinfo_r3
integer x = 1897
integer y = 156
integer width = 242
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
string text = "검색일자:"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_bdinfo_r3
boolean visible = false
integer x = 2240
integer y = 32
integer width = 626
integer height = 88
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_spec_s"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_bdinfo_r3
boolean visible = false
integer x = 2098
integer y = 52
integer width = 146
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
string text = "제품:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_2 from editmask within w_bdinfo_r3
integer x = 2555
integer y = 140
integer width = 338
integer height = 88
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;string ls_date

openWithParm(w_calendar, ls_date)
ls_date = message.stringparm
if ls_date <> 'N' then
	em_2.text = string(date(ls_date))
end if

end event

type st_5 from statictext within w_bdinfo_r3
integer x = 2501
integer y = 156
integer width = 55
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

