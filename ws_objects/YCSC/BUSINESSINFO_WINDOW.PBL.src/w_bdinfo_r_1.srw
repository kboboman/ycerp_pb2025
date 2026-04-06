$PBExportHeader$w_bdinfo_r_1.srw
$PBExportComments$설계영업현황조회[2000/11/29,서재복]
forward
global type w_bdinfo_r_1 from w_inheritance
end type
type pb_insert2 from picturebutton within w_bdinfo_r_1
end type
type pb_delete2 from picturebutton within w_bdinfo_r_1
end type
type ddlb_1 from dropdownlistbox within w_bdinfo_r_1
end type
type st_1 from statictext within w_bdinfo_r_1
end type
type dw_4 from datawindow within w_bdinfo_r_1
end type
type pb_print2 from picturebutton within w_bdinfo_r_1
end type
type pb_print1 from picturebutton within w_bdinfo_r_1
end type
type dw_5 from datawindow within w_bdinfo_r_1
end type
type pb_print3 from picturebutton within w_bdinfo_r_1
end type
type st_2 from statictext within w_bdinfo_r_1
end type
type dw_3 from datawindow within w_bdinfo_r_1
end type
end forward

global type w_bdinfo_r_1 from w_inheritance
integer width = 3662
string title = "건설현장현황조회(w_bdinfo_r_1)"
pb_insert2 pb_insert2
pb_delete2 pb_delete2
ddlb_1 ddlb_1
st_1 st_1
dw_4 dw_4
pb_print2 pb_print2
pb_print1 pb_print1
dw_5 dw_5
pb_print3 pb_print3
st_2 st_2
dw_3 dw_3
end type
global w_bdinfo_r_1 w_bdinfo_r_1

type variables
string is_build_no
st_print i_print
gst_bdwhere ist_where
string is_speccd, is_project
string is_fixeddate1, is_fixeddate2
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
public subroutine wf_getmakecls ()
public subroutine wf_initpara ()
public subroutine wf_setfilter ()
public subroutine wf_setfilter2 ()
end prototypes

public subroutine wf_sortconf ();if dw_2.rowcount() > 0 then
	//dw_2.SetRedraw(false)
	if ddlb_1.text = '담당본부' then
		dw_2.SetSort("bdinfodet_div A, bdinfodet_project A")
	elseif ddlb_1.text = '제품' then
		dw_2.SetSort("bdinfodet_spec A, bdinfodet_project A")
	elseif ddlb_1.text = '프로젝트명' then
		dw_2.SetSort("bdinfodet_project A, bdinfodet_div A")
	elseif ddlb_1.text = '확정구분' then
		dw_2.SetSort("bdinfodet_sale_prog A, bdinfodet_fixeddate D, bdinfodet_project A")
	elseif ddlb_1.text = '진행일자' then
		dw_2.SetSort("bdinfodet_fixeddate D, bdinfodet_sale_prog A, bdinfodet_project A")
	elseif ddlb_1.text = '지역' then 
		dw_2.SetSort("bdinfodet_city A bdinfodet_dong A, bdinfodet_project A")
	else
		dw_2.SetSort("bdinfodet_project A, bdinfodet_div A")
	end if
	dw_2.Sort()
	//dw_2.SetRedraw(true)
end if
end subroutine

public subroutine wf_getmakecls ();
if is_divcls <> '전체' then
else // '전체/전체, 전체/일부'
	is_divcd = is_divcd
	is_ddiv = is_divcd
	is_cdiv = is_divcd
	is_bdiv = is_divcd
	is_sdiv = is_divcd
end if

if is_percls <> '전체' then
else // '전체/전체, 전체/일부'
	is_person= is_person
	is_dperson= is_person
	is_cperson= is_person
	is_bperson= is_person
	is_sperson= is_person
end if


end subroutine

public subroutine wf_initpara ();is_sprog = '%'
is_dprog = '%'
is_cprog = '%'
is_city = '%'
is_divcd = '%'
is_speccd = '%'
is_project = '%'
is_fixeddate1 ='1900/01/01'
is_fixeddate2 = '2200/01/01'

is_person = '%'
is_dperson = '%'
is_ddiv = '%'
is_cperson = '%'
is_cdiv = '%'
is_bperson = '%'
is_bdiv = '%'
is_sperson = '%'
is_sdiv = '%'
is_organcd = '%'

id_makedate1 = date('1900/01/01')
id_makedate2 = date('2200/01/01')
id_dexpdate1 = date('1900/01/01')
id_dexpdate2 = date('2200/01/01')
id_cexpdate1 = date('1900/01/01')
id_cexpdate2 = date('2200/01/01')
id_bexpdate1 = date('1900/01/01')
id_bexpdate2 = date('2200/01/01')
id_sexpdate1 = date('1900/01/01')
id_sexpdate2 = date('2200/01/01')

end subroutine

public subroutine wf_setfilter ();string ls_where, ls_sql

ls_where = ''
ls_sql = ''

if is_divcls <> '전체' and is_divcd = '%' then //담당본부가 있는것(일부/전체)
	if	is_divcls = '정보입수담당본부' then 
		ls_where = " len(bdinfodet_div) > 0 " 
	elseif is_divcls = '설계영업담당본부' then 
		is_ddiv = is_divcd
		ls_where = " len(bdinfodet_ddiv) > 0 " 
	elseif is_divcls = '건설사영업담당본부' then
		is_cdiv = is_divcd
		ls_where = " len(bdinfodet_cdiv) > 0 " 
	elseif is_divcls = '시공사영업담당본부' then 
		is_bdiv = is_divcd
		ls_where = " len(bdinfodet_bdiv) > 0 " 
	elseif is_divcls = '판매영업담당본부' then 
		is_sdiv = is_divcd
		ls_where = " len(bdinfodet_sdiv) > 0 " 
	end if
elseif is_divcls <> '전체' and is_divcd <> '%' then	//담당본부가 ??인것(일부/일부)	
	if	is_divcls = '정보입수담당본부' then 
		ls_where = " bdinfodet_div = '" + is_divcd + "'"  
	elseif is_divcls = '설계영업담당본부' then 
		ls_where = " bdinfodet_ddiv = '" + is_divcd + "'"  
	elseif is_divcls = '건설사영업담당본부' then
		ls_where = " bdinfodet_cdiv = '" + is_divcd + "'"  
	elseif is_divcls = '시공사영업담당본부' then 
		ls_where = " bdinfodet_bdiv = '" + is_divcd + "'"  
	elseif is_divcls = '판매영업담당본부' then 
		ls_where = " bdinfodet_sdiv = '" + is_divcd + "'"  
	end if
else // '전체/전체, 전체/일부'
end if

ls_sql = ls_where
ls_where = ''

if is_percls <> '전체' and is_person = '%' then //작성자가 있는것(일부/전체)
	if is_percls = '정보입수담당자' then 
		ls_where = " len(bdinfodet_person) > 0 " 
	elseif is_percls = '설계영업담당자' then 
		ls_where = " len(bdinfodet_dperson) > 0 " 
	elseif is_percls = '건설사영업담당자' then
		ls_where = " len(bdinfodet_cperson) > 0 " 
	elseif is_percls = '시공사영업담당자' then 
		ls_where = " len(bdinfodet_bperson) > 0 " 
	elseif is_percls = '판매영업담당자' then 
		ls_where = " len(bdinfodet_sperson) > 0 " 
	end if
elseif is_percls <> '전체' and is_person <> '%' then	//작성자가 ??인것(일부/일부)	
	if is_percls = '정보입수담당자' then 
		ls_where = " bdinfodet_person = '" + is_person + "'"  
	elseif is_percls = '설계영업담당자' then 
		ls_where = " bdinfodet_dperson = '" + is_person + "'"  
	elseif is_percls = '건설사영업담당자' then
		ls_where = " bdinfodet_cperson = '" + is_person + "'"  
	elseif is_percls = '시공사영업담당자' then 
		ls_where = " bdinfodet_bperson = '" + is_person + "'"  
	elseif is_percls = '판매영업담당자' then 
		ls_where = " bdinfodet_sperson = '" + is_person + "'"  
	end if
else // '전체/전체, 전체/일부'
end if

if LenA(ls_sql) > 0 and LenA(ls_where) > 0 then
	ls_sql = ls_sql + ' and ' + ls_where
elseif LenA(ls_sql) > 0 and LenA(ls_where) = 0 then
	ls_sql = ls_sql 
elseif LenA(ls_sql) = 0 and LenA(ls_where) > 0 then	
	ls_sql = ls_where
end if	
ls_where = ''

if	is_expcls = '정보입수발생일자' then
	id_makedate1 = id_expdate1
	id_makedate2 = id_expdate2
	ls_where = " date( bdinfodet_makedate ) >= date('" + string(id_makedate1, 'yyyy/mm/dd') + "') and  date( bdinfodet_makedate ) <= date('" + string(id_makedate2, 'yyyy/mm/dd') + "')"
elseif is_expcls = '설계확정예정일자' then
	id_dexpdate1 = id_expdate1
	id_dexpdate2 = id_expdate2
	ls_where = " date( bdinfodet_dexpdate ) >= date('" + string(id_dexpdate1, 'yyyy/mm/dd') + "') and  date( bdinfodet_dexpdate ) <= date('" + string(id_dexpdate2, 'yyyy/mm/dd') + "')"
elseif is_expcls = '건설사선정예정일자' then
	id_cexpdate1 = id_expdate1
	id_cexpdate2 = id_expdate2
	ls_where = " date( bdinfodet_cexpdate ) >= date('" + string(id_cexpdate1, 'yyyy/mm/dd') + "') and  date( bdinfodet_cexpdate ) <= date('" + string(id_cexpdate2, 'yyyy/mm/dd') + "')"
elseif is_expcls = '시공사선정예정일자' then
	id_bexpdate1 = id_expdate1
	id_bexpdate2 = id_expdate2
	ls_where = " date( bdinfodet_bexpdate ) >= date('" + string(id_bexpdate1, 'yyyy/mm/dd') + "') and  date( bdinfodet_bexpdate ) <= date('" + string(id_bexpdate2, 'yyyy/mm/dd') + "')"
elseif is_expcls = '판매확정예정일자' then
	id_sexpdate1 = id_expdate1
	id_sexpdate2 = id_expdate2
	ls_where = " date( bdinfodet_sexpdate ) >= date('" + string(id_sexpdate1, 'yyyy/mm/dd') + "') and  date( bdinfodet_sexpdate ) <= date('" + string(id_sexpdate2, 'yyyy/mm/dd') + "')"
else  //전체
end if

if LenA(ls_sql) > 0 and LenA(ls_where) > 0 then
	ls_sql = ls_sql + ' and ' + ls_where
elseif LenA(ls_sql) > 0 and LenA(ls_where) = 0 then
	ls_sql = ls_sql 
elseif LenA(ls_sql) = 0 and LenA(ls_where) > 0 then	
	ls_sql = ls_where
end if	

dw_2.SetFilter(ls_sql)
dw_2.Filter( )


end subroutine

public subroutine wf_setfilter2 ();string ls_where, ls_sql

ls_where = ''
ls_sql = ''

if is_divcls <> '전체' and is_divcd = '%' then //담당본부가 있는것(일부/전체)
	if	is_divcls = '정보입수담당본부' then 
		ls_where = " len(bdinfodet_div) > 0 " 
	elseif is_divcls = '설계영업담당본부' then 
		is_ddiv = is_divcd
		ls_where = " len(bdinfodet_ddiv) > 0 " 
	elseif is_divcls = '건설사영업담당본부' then
		is_cdiv = is_divcd
		ls_where = " len(bdinfodet_cdiv) > 0 " 
	elseif is_divcls = '시공사영업담당본부' then 
		is_bdiv = is_divcd
		ls_where = " len(bdinfodet_bdiv) > 0 " 
	elseif is_divcls = '판매영업담당본부' then 
		is_sdiv = is_divcd
		ls_where = " len(bdinfodet_sdiv) > 0 " 
	end if
elseif is_divcls <> '전체' and is_divcd <> '%' then	//담당본부가 ??인것(일부/일부)	
	if	is_divcls = '정보입수담당본부' then 
		ls_where = " bdinfodet_div = '" + is_divcd + "'"  
	elseif is_divcls = '설계영업담당본부' then 
		ls_where = " bdinfodet_ddiv = '" + is_divcd + "'"  
	elseif is_divcls = '건설사영업담당본부' then
		ls_where = " bdinfodet_cdiv = '" + is_divcd + "'"  
	elseif is_divcls = '시공사영업담당본부' then 
		ls_where = " bdinfodet_bdiv = '" + is_divcd + "'"  
	elseif is_divcls = '판매영업담당본부' then 
		ls_where = " bdinfodet_sdiv = '" + is_divcd + "'"  
	end if
else // '전체/전체, 전체/일부'
end if

ls_sql = ls_where
ls_where = ''

if is_percls <> '전체' and is_person = '%' then //작성자가 있는것(일부/전체)
	if is_percls = '정보입수담당자' then 
		ls_where = " len(bdinfodet_person) > 0 " 
	elseif is_percls = '설계영업담당자' then 
		ls_where = " len(bdinfodet_dperson) > 0 " 
	elseif is_percls = '건설사영업담당자' then
		ls_where = " len(bdinfodet_cperson) > 0 " 
	elseif is_percls = '시공사영업담당자' then 
		ls_where = " len(bdinfodet_bperson) > 0 " 
	elseif is_percls = '판매영업담당자' then 
		ls_where = " len(bdinfodet_sperson) > 0 " 
	end if
elseif is_percls <> '전체' and is_person <> '%' then	//작성자가 ??인것(일부/일부)	
	if is_percls = '정보입수담당자' then 
		ls_where = " bdinfodet_person = '" + is_person + "'"  
	elseif is_percls = '설계영업담당자' then 
		ls_where = " bdinfodet_dperson = '" + is_person + "'"  
	elseif is_percls = '건설사영업담당자' then
		ls_where = " bdinfodet_cperson = '" + is_person + "'"  
	elseif is_percls = '시공사영업담당자' then 
		ls_where = " bdinfodet_bperson = '" + is_person + "'"  
	elseif is_percls = '판매영업담당자' then 
		ls_where = " bdinfodet_sperson = '" + is_person + "'"  
	end if
else // '전체/전체, 전체/일부'
end if

if LenA(ls_sql) > 0 and LenA(ls_where) > 0 then
	ls_sql = ls_sql + ' and ' + ls_where
elseif LenA(ls_sql) > 0 and LenA(ls_where) = 0 then
	ls_sql = ls_sql 
elseif LenA(ls_sql) = 0 and LenA(ls_where) > 0 then	
	ls_sql = ls_where
end if	
ls_where = ''

if	is_expcls = '정보입수작성일자' then
	id_makedate1 = id_expdate1
	id_makedate2 = id_expdate2
	ls_where = " date( bdinfodet_makedate ) >= date('" + string(id_makedate1) + "') and  date( bdinfodet_makedate ) <= date('" + string(id_makedate2) + "')"
elseif is_expcls = '설계확정예정일자' then
	id_dexpdate1 = id_expdate1
	id_dexpdate2 = id_expdate2
	ls_where = " date( bdinfodet_dexpdate ) >= date('" + string(id_dexpdate1) + "') and  date( bdinfodet_dexpdate ) <= date('" + string(id_dexpdate2) + "')"
elseif is_expcls = '건설사선정예정일자' then
	id_cexpdate1 = id_expdate1
	id_cexpdate2 = id_expdate2
	ls_where = " date( bdinfodet_cexpdate ) >= date('" + string(id_cexpdate1) + "') and  date( bdinfodet_cexpdate ) <= date('" + string(id_cexpdate2) + "')"
elseif is_expcls = '시공사선정예정일자' then
	id_bexpdate1 = id_expdate1
	id_bexpdate2 = id_expdate2
	ls_where = " date( bdinfodet_bexpdate ) >= date('" + string(id_bexpdate1) + "') and  date( bdinfodet_bexpdate ) <= date('" + string(id_bexpdate2) + "')"
elseif is_expcls = '판매확정예정일자' then
	id_sexpdate1 = id_expdate1
	id_sexpdate2 = id_expdate2
	ls_where = " date( bdinfodet_sexpdate ) >= date('" + string(id_sexpdate1) + "') and  date( bdinfodet_sexpdate ) <= date('" + string(id_sexpdate2) + "')"
else  //전체
end if

if LenA(ls_sql) > 0 and LenA(ls_where) > 0 then
	ls_sql = ls_sql + ' and ' + ls_where
elseif LenA(ls_sql) > 0 and LenA(ls_where) = 0 then
	ls_sql = ls_sql 
elseif LenA(ls_sql) = 0 and LenA(ls_where) > 0 then	
	ls_sql = ls_where
end if	

dw_5.SetFilter(ls_sql)
dw_5.Filter( )


end subroutine

on w_bdinfo_r_1.create
int iCurrent
call super::create
this.pb_insert2=create pb_insert2
this.pb_delete2=create pb_delete2
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.dw_4=create dw_4
this.pb_print2=create pb_print2
this.pb_print1=create pb_print1
this.dw_5=create dw_5
this.pb_print3=create pb_print3
this.st_2=create st_2
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_insert2
this.Control[iCurrent+2]=this.pb_delete2
this.Control[iCurrent+3]=this.ddlb_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.pb_print2
this.Control[iCurrent+7]=this.pb_print1
this.Control[iCurrent+8]=this.dw_5
this.Control[iCurrent+9]=this.pb_print3
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.dw_3
end on

on w_bdinfo_r_1.destroy
call super::destroy
destroy(this.pb_insert2)
destroy(this.pb_delete2)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.dw_4)
destroy(this.pb_print2)
destroy(this.pb_print1)
destroy(this.dw_5)
destroy(this.pb_print3)
destroy(this.st_2)
destroy(this.dw_3)
end on

event open;call super::open;dw_1.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_4.visible = false
dw_5.visible = false

wf_initpara()

pb_retrieve.PostEvent(Clicked!)
//dw_1.retrieve()

end event

type pb_save from w_inheritance`pb_save within w_bdinfo_r_1
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

type dw_1 from w_inheritance`dw_1 within w_bdinfo_r_1
boolean visible = false
integer x = 1490
integer y = 0
integer width = 110
integer height = 124
string dataobject = "dw_info"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_r_1
integer x = 69
integer y = 284
integer width = 3493
string dataobject = "d_bdinfo_r"
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

type st_title from w_inheritance`st_title within w_bdinfo_r_1
integer width = 1454
integer textsize = -20
long textcolor = 1090519039
string text = "건설 현장 현황"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_r_1
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_r_1
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

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_r_1
boolean visible = false
integer x = 3899
integer y = 92
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_r_1
integer x = 3374
integer taborder = 100
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_r_1
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

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_r_1
boolean visible = false
integer x = 3954
integer y = 292
integer taborder = 140
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_r_1
boolean visible = false
integer x = 4306
integer y = 124
integer taborder = 150
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_bdinfo_r_1
boolean visible = false
integer x = 4334
integer y = 360
integer taborder = 170
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

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_r_1
integer x = 2606
integer taborder = 160
end type

event pb_retrieve::clicked;openwithparm(w_bdinfo_w1, ist_where)
ist_where = Message.PowerObjectParm

if ist_where.okflag = true then
	is_person = ist_where.str1
	is_divcd = ist_where.str2 
//	is_speccd = ist_where.str3 
	is_speccd = '003'
	is_project = ist_where.str4
	is_sprog = ist_where.str5
	is_dprog = ist_where.str6
	is_cprog = ist_where.str7
	is_city = ist_where.str8
	is_organcd = ist_where.str9
	is_designcd = ist_where.str10
	is_divcls = ist_where.str16
	is_percls = ist_where.str17
	is_expcls = ist_where.str18
	if is_project = '' then 
		is_project = '%'
	else
		is_project = '%' + is_project + '%'
	end if
	is_fixeddate1 = ist_where.sdate1
	is_fixeddate2 = ist_where.sdate2
	id_expdate1 = date(ist_where.sdate3)
	id_expdate2 = date(ist_where.sdate4)
	
	wf_getmakecls()

	long ll_row
	
	dw_1.reset()
	ll_row =  dw_1.retrieve()
	if ll_row < 1 then
		return
	end if

	dw_1.accepttext()
	dw_2.accepttext()
	is_build_no = dw_1.getitemstring(ll_row,"build_no")

//	if is_sprog = '010' then
//		st_title.text = "설계진행현황"
//	elseif is_sprog = '020' then
//		st_title.text = "설계확정현황"
//	else
//		st_title.text = "설계영업현황(전체)"
//	end if
	if isnull(is_build_no) or is_build_no = "" then
		return
	else
		dw_2.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, is_fixeddate1, is_fixeddate2, is_dprog, is_cprog, is_city, &
							is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd )
		wf_setfilter()
		
		dw_2.sharedata(dw_3)
	end if
	
	wf_sortconf()

	
else
	return
end if


end event

type gb_3 from w_inheritance`gb_3 within w_bdinfo_r_1
integer x = 37
integer y = 232
integer width = 3557
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_r_1
boolean visible = false
integer x = 3808
integer y = 1208
integer width = 512
integer height = 472
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_r_1
integer x = 2565
integer width = 1024
end type

type pb_insert2 from picturebutton within w_bdinfo_r_1
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

type pb_delete2 from picturebutton within w_bdinfo_r_1
boolean visible = false
integer x = 3954
integer y = 532
integer width = 187
integer height = 144
integer taborder = 220
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

type ddlb_1 from dropdownlistbox within w_bdinfo_r_1
integer x = 1883
integer y = 148
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
string item[] = {"확정구분","진행일자","프로젝트명","담당본부","지역"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;wf_sortconf()
end event

type st_1 from statictext within w_bdinfo_r_1
integer x = 1627
integer y = 160
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

type dw_4 from datawindow within w_bdinfo_r_1
integer x = 1294
integer y = 144
integer width = 146
integer height = 100
integer taborder = 120
boolean bringtotop = true
string title = "d_infodet_p2,"
string dataobject = "d_bdconcustscene_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_print2 from picturebutton within w_bdinfo_r_1
event mousemove pbm_mousemove
integer x = 2990
integer y = 52
integer width = 187
integer height = 144
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

//f_usetips(st_tips,"영업실적집계표",parent, li_x, li_y)
f_usetips(st_tips,"거래처별 현장 진행 상황",parent, li_x, li_y)


end event

event clicked;w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no, ls_specname
long ll_row

dw_4.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog,&
				is_fixeddate1, is_fixeddate2, is_dprog, is_cprog, is_city, &
				is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, &
				is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd )

if dw_4.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if

//추후 실적기준을 위해 임시-지우면 안됨
//openwithparm(w_bdinfo_w3, ist_where)
//ist_where = Message.PowerObjectParm
//if ist_where.okflag = true then
//	is_stddiv  = ist_where.str19
//	is_stdper = ist_where.str20
//end if
//추후 실적기준을 위해 임시

// 빠짐
//for ll_row = 1 to dw_4.rowcount()
//	if is_stddiv = '설계영업담당본부' then
//		dw_4.object.c_div[ll_row] = dw_4.object.bdinfodet_ddiv[ll_row]
//	elseif is_stddiv = '건설사영업담당본부' then
//		dw_4.object.c_div[ll_row] = dw_4.object.bdinfodet_cdiv[ll_row]	
//	elseif is_stddiv = '시공사영업담당본부' then
//		dw_4.object.c_div[ll_row] = dw_4.object.bdinfodet_bdiv[ll_row]	
//	elseif is_stddiv = '판매영업담당본부' then
//		dw_4.object.c_div[ll_row] = dw_4.object.bdinfodet_sdiv[ll_row]	
//	else
//		dw_4.object.c_div[ll_row] = dw_4.object.bdinfodet_div[ll_row]	
//	end if
//next
//
//if dw_4.rowcount() > 0 then
//	//dw_4.SetSort("bdinfodet_div A, bdinfodet_project A")
//	dw_4.SetSort("c_div A, bdinfodet_project A")
//	dw_4.Sort()
//end if
//
//SELECT spec_name  into :ls_specname
//    FROM bdspec 
//	 where spec_code = :is_speccd;

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 영업실적집계표를 출력합니다." 
l_print.st_print_desc = " 이 프로그램은 거래처별 현장 진행 현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=58'
//                   'Datawindow.Zoom=90'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//빠짐
//if isnull(is_fixeddate1) then
//	w_print.dw_1.object.t_start.text = "전체"
//	w_print.dw_1.object.t_end.text = "전체"
//else
//	w_print.dw_1.object.t_start.text = is_fixeddate1
//	w_print.dw_1.object.t_end.text = is_fixeddate2
//end if
//if trim(ls_specname) = '' or isnull(ls_specname) or ls_specname = '%' then
//	w_print.dw_1.object.t_spec.text = ""
//else
//	w_print.dw_1.object.t_spec.text = "(" + string(ls_specname) + ")"
//end if
	

end event

type pb_print1 from picturebutton within w_bdinfo_r_1
event mousemove pbm_mousemove
integer x = 2798
integer y = 52
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
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

//f_usetips(st_tips,"설계영업진행(확정)현황",parent, li_x, li_y)
f_usetips(st_tips,"건설 현장 현황",parent, li_x, li_y)


end event

event clicked;w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no, ls_specname
long ll_row

dw_3.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog,&
				is_fixeddate1, is_fixeddate2, is_dprog, is_cprog, is_city, &
				is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, &
				is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd )

if dw_3.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 건설 현장 현황을 출력합니다." 


gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=59'

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//빠짐
//if isnull(is_fixeddate1) then
//	w_print.dw_1.object.t_start.text = "전체"
//	w_print.dw_1.object.t_end.text = "전체"
//else
//	w_print.dw_1.object.t_start.text = is_fixeddate1
//	w_print.dw_1.object.t_end.text = is_fixeddate2
//end if
//if trim(ls_specname) = '' or isnull(ls_specname) or ls_specname = '%' then
//	w_print.dw_1.object.t_spec.text = ""
//else
//	w_print.dw_1.object.t_spec.text = "(" + string(ls_specname) + ")"
//end if
//===================================
//ori
//w_repsuper w_print
//st_print l_print
//date ld_start, ld_end
//string ls_cust_no
//
//if dw_3.rowcount() < 1 then
//	messagebox("확인", "출력할 데이터가 없습니다")
//	return
//end if
//
//l_print.st_datawindow = dw_3
//l_print.st_print_sheet = " 프린트용지 : A4"
////l_print.st_print_desc = " 이 프로그램은 설계영업진행(확정)현황을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=95'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//if isnull(is_fixeddate2) then
//	w_print.dw_1.object.t_start.text = "전체"
//	w_print.dw_1.object.t_end.text = "전체"
//else
//	w_print.dw_1.object.t_start.text = is_fixeddate1
//	w_print.dw_1.object.t_end.text = is_fixeddate2
//end if
//
//if is_sprog = '010' then
//	w_print.dw_1.object.t_title.text = '설계진행현황'
//elseif is_sprog = '020' then
//	w_print.dw_1.object.t_title.text = '설계확정현황'
//else
//	w_print.dw_1.object.t_title.text = '설계영업현황(전체)'
//end if


end event

type dw_5 from datawindow within w_bdinfo_r_1
integer x = 1449
integer y = 144
integer width = 146
integer height = 100
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_infodet_p3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;long ll_row
if this.rowcount() <= 0 then return

wf_setfilter()

for ll_row = 1 to this.rowcount()
	if is_divcls = '설계영업담당본부' then
		this.object.c_div[ll_row] = this.object.bdinfodet_ddiv[ll_row]
	elseif is_divcls = '건설사영업담당본부' then
		this.object.c_div[ll_row] = this.object.bdinfodet_cdiv[ll_row]	
	elseif is_divcls = '시공사영업담당본부' then
		this.object.c_div[ll_row] = this.object.bdinfodet_bdiv[ll_row]	
	elseif is_divcls = '판매영업담당본부' then
		this.object.c_div[ll_row] = this.object.bdinfodet_sdiv[ll_row]	
	else
		this.object.c_div[ll_row] = this.object.bdinfodet_div[ll_row]	
	end if
next


end event

type pb_print3 from picturebutton within w_bdinfo_r_1
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
boolean enabled = false
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"영업진행내역",parent, li_x, li_y)


end event

event clicked;
w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no, ls_specname
long ll_row

dw_5.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, is_fixeddate1, is_fixeddate2, is_dprog, is_cprog, is_city, &
is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
wf_setfilter2()
if dw_5.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if

//추후 실적기준을 위해 임시-지우면 안됨
//openwithparm(w_bdinfo_w3, ist_where)
//ist_where = Message.PowerObjectParm
//if ist_where.okflag = true then
//	is_stddiv  = ist_where.str19
//	is_stdper = ist_where.str20
//end if
//추후 실적기준을 위해 임시-지우면 안됨

for ll_row = 1 to dw_5.rowcount()
	if is_stddiv = '설계영업담당본부' then
		dw_5.object.c_div[ll_row] = dw_5.object.bdinfodet_ddiv[ll_row]
	elseif is_stddiv = '건설사영업담당본부' then
		dw_5.object.c_div[ll_row] = dw_5.object.bdinfodet_cdiv[ll_row]	
	elseif is_stddiv = '시공사영업담당본부' then
		dw_5.object.c_div[ll_row] = dw_5.object.bdinfodet_bdiv[ll_row]	
	elseif is_stddiv = '판매영업담당본부' then
		dw_5.object.c_div[ll_row] = dw_5.object.bdinfodet_sdiv[ll_row]	
	else
		dw_5.object.c_div[ll_row] = dw_5.object.bdinfodet_div[ll_row]	
	end if
next

if dw_5.rowcount() > 0 then
	dw_5.SetSort("c_div A, bdinfodet_project A")
	dw_5.Sort()
end if

/*프로젝트별로 번호를 부여하는데 중복되는 번호는 제외한다.*/
//////////////
string ls_prett, ls_curtt
long ll_rowseq
ls_prett = dw_5.object.bdinfodet_project[1]
ll_rowseq = 1
dw_5.object.rowseq[1] = ll_rowseq
for ll_row = 2 to dw_5.rowcount()
	ls_curtt = dw_5.object.bdinfodet_project[ll_row]
	if ls_prett <> ls_curtt then
		ll_rowseq = ll_rowseq + 1
		dw_5.object.rowseq[ll_row] = ll_rowseq
	end if
	ls_prett = ls_curtt
next
//////////////

SELECT spec_name  into :ls_specname
    FROM bdspec 
	 where spec_code = :is_speccd;

l_print.st_datawindow = dw_5
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업진행내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=95'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

if isnull(is_fixeddate1) then
	w_print.dw_1.object.t_start.text = "전체"
	w_print.dw_1.object.t_end.text = "전체"
else
	w_print.dw_1.object.t_start.text = is_fixeddate1
	w_print.dw_1.object.t_end.text = is_fixeddate2
end if
if trim(ls_specname) = '' or isnull(ls_specname) or ls_specname = '%' then
	w_print.dw_1.object.t_spec.text = ""
else
	w_print.dw_1.object.t_spec.text = "(" + string(ls_specname) + ")"
end if
	

end event

type st_2 from statictext within w_bdinfo_r_1
boolean visible = false
integer x = 1595
integer y = 36
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

type dw_3 from datawindow within w_bdinfo_r_1
boolean visible = false
integer x = 1138
integer y = 144
integer width = 146
integer height = 100
integer taborder = 130
boolean bringtotop = true
string title = "d_infodet_p1"
string dataobject = "d_bdconscene_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

