$PBExportHeader$w_bdinfo_input_m.srw
$PBExportComments$XXXX공사정보진행관리[2000/11/29,서재복]
forward
global type w_bdinfo_input_m from w_inheritance
end type
type dw_plist from datawindow within w_bdinfo_input_m
end type
type pb_insert2 from picturebutton within w_bdinfo_input_m
end type
type pb_delete2 from picturebutton within w_bdinfo_input_m
end type
type gb_4 from groupbox within w_bdinfo_input_m
end type
type pb_print3 from picturebutton within w_bdinfo_input_m
end type
type dw_print5 from datawindow within w_bdinfo_input_m
end type
end forward

global type w_bdinfo_input_m from w_inheritance
integer width = 3657
integer height = 2180
string title = "설계영업진행관리(w_bdinfo_input_m)"
boolean resizable = false
dw_plist dw_plist
pb_insert2 pb_insert2
pb_delete2 pb_delete2
gb_4 gb_4
pb_print3 pb_print3
dw_print5 dw_print5
end type
global w_bdinfo_input_m w_bdinfo_input_m

type variables
string is_build_no
gst_bdwhere ist_where
string is_speccd,  is_project
//string ls_fixedflag
date id_fixeddate1, id_fixeddate2
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

end variables

forward prototypes
public function boolean wf_delete1 (datawindow arg_dw1, string arg_str)
public subroutine wf_getmakecls ()
public subroutine wf_initpara ()
public subroutine wf_setfilter ()
public subroutine wf_zzz ()
public function decimal wf_makeseqno ()
end prototypes

public function boolean wf_delete1 (datawindow arg_dw1, string arg_str);
if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "삭제되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "삭제 실패!")
	return false
end if

end function

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
id_fixeddate1 = date('1900/01/01')
id_fixeddate2 = date('2200/01/01')

is_person = '%'
is_dperson = '%'
is_ddiv = '%'
is_cperson = '%'
is_cdiv = '%'
is_bperson = '%'
is_bdiv = '%'
is_sperson = '%'
is_sdiv = '%'
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

dw_plist.SetFilter(ls_sql)
dw_plist.Filter( )


end subroutine

public subroutine wf_zzz ();string ls_where, ls_sql

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
	is_divcd = is_divcd
	is_ddiv = is_divcd
	is_cdiv = is_divcd
	is_bdiv = is_divcd
	is_sdiv = is_divcd
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
	is_person= is_person
	is_dperson= is_person
	is_cperson= is_person
	is_bperson= is_person
	is_sperson= is_person
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
elseif is_expcls = '설계확정예정일자' then
	id_dexpdate1 = id_expdate1
	id_dexpdate2 = id_expdate2
elseif is_expcls = '건설사선정예정일자' then
	id_cexpdate1 = id_expdate1
	id_cexpdate2 = id_expdate2
elseif is_expcls = '시공사선정예정일자' then
	id_bexpdate1 = id_expdate1
	id_bexpdate2 = id_expdate2
elseif is_expcls = '판매확정예정일자' then
	id_sexpdate1 = id_expdate1
	id_sexpdate2 = id_expdate2
else  //전체
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
end if

dw_plist.SetFilter(ls_sql)
dw_plist.Filter( )


end subroutine

public function decimal wf_makeseqno ();decimal ld_seq_no
long ll_row

select max(seq) into :ld_seq_no from bdinfodet
 where build_no = :is_build_no;
if ld_seq_no = 0 or isnull(ld_seq_no) then
  	 ld_seq_no = 1
elseif ld_seq_no >= 1 then
	 ld_seq_no = ld_seq_no + 1
end if

ll_row = dw_2.getrow()
dw_2.object.bdinfodet_seq[ll_row] = ld_seq_no 

return ld_seq_no


end function

on w_bdinfo_input_m.create
int iCurrent
call super::create
this.dw_plist=create dw_plist
this.pb_insert2=create pb_insert2
this.pb_delete2=create pb_delete2
this.gb_4=create gb_4
this.pb_print3=create pb_print3
this.dw_print5=create dw_print5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_plist
this.Control[iCurrent+2]=this.pb_insert2
this.Control[iCurrent+3]=this.pb_delete2
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.pb_print3
this.Control[iCurrent+6]=this.dw_print5
end on

on w_bdinfo_input_m.destroy
call super::destroy
destroy(this.dw_plist)
destroy(this.pb_insert2)
destroy(this.pb_delete2)
destroy(this.gb_4)
destroy(this.pb_print3)
destroy(this.dw_print5)
end on

event open;call super::open;//dw_1.settransobject(sqlca)
//dw_2.settransobject(sqlca)
dw_plist.settransobject(sqlca)
dw_print5.settransobject(sqlca)

wf_initpara()
//pb_retrieve.PostEvent(Clicked!)
is_speccd = '꽝'
dw_1.retrieve()
pb_insert.PostEvent(Clicked!)
//dw_1.retrieve()

end event

type pb_save from w_inheritance`pb_save within w_bdinfo_input_m
integer x = 3182
end type

event pb_save::clicked;string ls_nullvalue, ls_existvalue
long ll_row1, ll_row2, ll_cnt1, ll_cnt2
long ll_existcount

dw_2.accepttext()

ll_row2 = dw_2.GetRow()
ll_row1 = dw_1.GetRow()
if ll_row1 < 1 and ll_row2 < 1 then return

if ll_row2 >= 1 then
	ls_nullvalue = dw_2.object.bdinfodet_project[ll_row2]
	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
		messagebox('확인','프로젝트명을 입력하세요.')
		dw_2.setcolumn('bdinfodet_project')
		dw_2.setfocus()
		return
	end if
	
	select count(project) into :ll_existcount from bdinfodet
	where project = :ls_nullvalue;

	dwitemstatus l_status
	l_status = dw_2.GetItemStatus(ll_row2, 0, Primary!)
	IF l_status = newModified! OR l_status = new! THEN
		if ll_existcount > 0 then //새로운 데이터 추가시 데이터가 있으면 count가 0보다 크므로 중복
			messagebox('확인', '프로젝트명이 중복됩니다.')
			dw_2.setcolumn('bdinfodet_project')
			dw_2.setfocus()
			return
		end if	
	else
		if ll_existcount > 1 then //수정하지 않고 저장시는 count가 1보다 크므로 중복
			messagebox('확인', string(ll_existcount) + '프로젝트명이 중복됩니다.')
			dw_2.setcolumn('bdinfodet_project')
			dw_2.setfocus()
			return
		end if	
	end if
	
	IF l_status = newModified! OR l_status = new! THEN
		if wf_makeseqno() <= 0 then 
			messagebox("오류", "키를 생성하지 못했습니다. 전산실로 문의 하세요.")
		end if
	end if
	
//	ls_nullvalue = dw_2.object.bdinfodet_div[ll_row2]
//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
//		messagebox('확인','담당본부를 입력하세요.')
//		dw_2.setcolumn('bdinfodet_div')
//		dw_2.setfocus()
//		return
//	end if
//	ls_nullvalue = dw_2.object.bdinfodet_spec[ll_row2]
//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
//		messagebox('확인','제품을 입력하세요.')
//		dw_2.setcolumn('bdinfodet_spec')
//		dw_2.setfocus()
//		return
//	end if
//	ls_nullvalue = dw_2.object.bdinfodet_fixedflag[ll_row2]
//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
//		messagebox('확인','영업진행사항을 입력하세요.')
//		dw_2.setcolumn('bdinfodet_fixedflag')
//		dw_2.setfocus()
//		return
//	end if
//	if isnull(dw_2.object.bdinfodet_fixeddate[ll_row2]) then
//		messagebox('확인','영업진행일자를 입력하세요.')
//		dw_2.setcolumn('bdinfodet_fixeddate')
//		dw_2.setfocus()
//		return
//	end if

end if

ll_cnt1 = wf_modifycount(dw_1) 
ll_cnt2 = wf_modifycount(dw_2) 


if ll_cnt1 > 0  or ll_cnt2 > 0 then	
	wf_update2(dw_1,dw_2,"Y") 
	IF l_status = newModified! OR l_status = new! THEN
		dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
		is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv)
	end if
end if

end event

type dw_1 from w_inheritance`dw_1 within w_bdinfo_input_m
integer x = 3781
integer y = 1152
integer width = 448
integer height = 392
integer taborder = 50
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

is_build_no = dw_1.getitemstring(ll_row, "build_no")

if isnull(is_build_no) or is_build_no = "" then
   return
else
//	dw_plist.retrieve(is_build_no, ls_divcd, ls_speccd, ls_project, is_sprog, ld_fixeddate1, ld_fixeddate2, is_dprog, is_cprog, is_city)
	dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
	is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv)
end if
end event

type st_title from w_inheritance`st_title within w_bdinfo_input_m
integer y = 36
integer height = 164
integer textsize = -20
string text = "설계영업진행관리"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_input_m
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_input_m
boolean visible = false
integer x = 4087
integer y = 64
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_input_m
boolean visible = false
integer x = 4233
integer y = 64
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_input_m
integer x = 3374
integer taborder = 120
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_input_m
boolean visible = false
integer x = 3739
integer y = 64
integer taborder = 130
end type

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_input_m
boolean visible = false
integer x = 3927
integer y = 64
integer taborder = 150
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_input_m
integer x = 2990
integer taborder = 160
end type

event pb_delete::clicked;
string ls_bid_chk, ls_etmt_chk
long ll_row

dw_1.accepttext()
dw_plist.accepttext()

//if dw_plist.rowcount() < 1 then
//	if dw_1.rowcount() < 1 then
//		return
//	else
//		if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
//	      return
//      end if	
//		dw_1.deleterow(0)
//		if dw_1.RowCount() >= 1 then
//			dw_plist.retrieve(is_build_no, ls_divcd, ls_speccd, ls_project, is_sprog, ld_fixeddate1, ld_fixeddate2, is_dprog, is_cprog)
//		end if
//		wf_delete1(dw_1,"Y")
//		return
//	end if
//end if

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

string ls_delbuildno
dec ld_delseq
ls_delbuildno = dw_2.object.bdinfodet_build_no[dw_2.getrow()]
ld_delseq = dw_2.object.bdinfodet_seq[dw_2.getrow()]

ll_row = dw_2.GetRow()
ls_bid_chk = dw_2.object.bdinfodet_bid_chk[ll_row] 
ls_etmt_chk = dw_2.object.bdinfodet_etmt_chk[ll_row] 
if ls_bid_chk = '1' or ls_etmt_chk = '1' then  //견적이나 입찰이면
	dw_2.object.bdinfodet_std_chk[ll_row] = '0'
	//wf_delete1(dw_2,"Y")
	if wf_delete1(dw_2,"Y") then
		delete bdinfodetprog where build_no = :ls_delbuildno and seq = :ld_delseq;
		commit;
	end if
	
	if dw_1.RowCount() >= 1 then
		dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
		is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv)
	end if
else
	dw_2.deleterow(0)
	//wf_delete1(dw_2,"Y")
	if wf_delete1(dw_2,"Y") then
		delete bdinfodetprog where build_no = :ls_delbuildno and seq = :ld_delseq;
		commit;
	end if
	dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
	is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv)
	
end if



end event

type pb_insert from w_inheritance`pb_insert within w_bdinfo_input_m
integer x = 2798
integer taborder = 180
end type

event pb_insert::clicked;decimal ld_seq_no
long ll_row

dw_2.Object.bdinfodet_project.TabSequence = 1

if dw_1.RowCount() < 1 then
	messagebox('확인','먼저 건설정보번호를 입력하세요')
	return
end if

select max(seq) into :ld_seq_no from bdinfodet
 where build_no = :is_build_no;
if ld_seq_no = 0 or isnull(ld_seq_no) then
  	 ld_seq_no = 1
elseif ld_seq_no >= 1 then
	 ld_seq_no = ld_seq_no + 1
end if

ll_row = dw_2.insertrow(0)

//ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
dw_2.object.bdinfodet_build_no[ll_row] = is_build_no  //ls_build_no 
dw_2.object.bdinfodet_seq[ll_row] = ld_seq_no 
dw_2.object.bdinfodet_person[ll_row] = gs_personno
dw_2.object.bdinfodet_div[ll_row] = gs_divcode
dw_2.scrolltorow(ll_row)
dw_2.setcolumn('bdinfodet_project')
dw_2.setfocus()



end event

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_input_m
integer x = 2414
integer taborder = 170
end type

event pb_retrieve::clicked;
openwithparm(w_bdinfo_w2, ist_where)
ist_where = Message.PowerObjectParm

if ist_where.okflag = true then
	is_person = ist_where.str1
	is_divcd = ist_where.str2 
	is_speccd = ist_where.str3 
	is_project = ist_where.str4
	is_sprog = ist_where.str5
	is_dprog = ist_where.str6
	is_cprog = ist_where.str7
	is_city = ist_where.str8
	is_divcls = ist_where.str16
	is_percls = ist_where.str17
	is_expcls = ist_where.str18
	if is_project = '' then 
		is_project = '%'
	else
		is_project = '%' + is_project + '%'
	end if
	id_fixeddate1 = date(ist_where.sdate1)
	id_fixeddate2 = date(ist_where.sdate2)
	id_expdate1 = date(ist_where.sdate3)
	id_expdate2 = date(ist_where.sdate4)
	
	wf_getmakecls()

	dw_1.reset()
	dw_1.retrieve()
else
	is_speccd = '꽝'
	dw_1.retrieve()
	return
end if


end event

type gb_3 from w_inheritance`gb_3 within w_bdinfo_input_m
integer x = 622
integer y = 216
integer width = 2967
integer height = 1832
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_input_m
integer x = 3749
integer y = 948
integer width = 512
integer height = 624
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_input_m
integer x = 2373
integer width = 1216
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_input_m
integer x = 649
integer y = 272
integer width = 2907
integer height = 1744
integer taborder = 60
string dataobject = "d_bdinfo_input_m"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;if row < 1 then return

dwitemstatus l_status
l_status = dw_2.GetItemStatus(dw_2.getrow(), 0, Primary!)

if dwo.name = 'design_prog' then
	IF l_status = newModified! OR l_status = new! THEN
		messagebox("확인", "현재 프로젝트를 저장해야 진행내역을 작성할 수 있습니다." )
		return
	end if
	ist_where.str11 = "1"
	ist_where.str12 = this.object.bdinfodet_build_no[this.getrow()]
	ist_where.dec4 = this.object.bdinfodet_seq[this.getrow()]
	openwithparm(w_bdinfo_det_m1, ist_where)
end if
if dwo.name = 'com_prog' then
	IF l_status = newModified! OR l_status = new! THEN
		messagebox("확인", "현재 프로젝트를 저장해야 진행내역을 작성할 수 있습니다." )
		return
	end if
	ist_where.str11 = "2"
	ist_where.str12 = this.object.bdinfodet_build_no[this.getrow()]
	ist_where.dec4 = this.object.bdinfodet_seq[this.getrow()]
	openwithparm(w_bdinfo_det_m2, ist_where)
end if
	

end event

event dw_2::rowfocuschanged;//dw_3.scrolltorow(dw_2.getrow())
end event

event dw_2::losefocus;This.accepttext()

end event

event dw_2::rbuttondown;string ls_date

CHOOSE CASE dwo.Name
	case 'bdinfodet_fixeddate'
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.bdinfodet_fixeddate[row] = datetime(date(ls_date))
		end if
	case 'bdinfodet_predate'
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.bdinfodet_predate[row] = datetime(date(ls_date))
		end if
	case 'bdinfodet_completiondate'
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.bdinfodet_completiondate[row] = datetime(date(ls_date))
		end if
	case 'bdinfodet_makedate' 
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.bdinfodet_makedate[row] = datetime(date(ls_date))
		end if
	case 'bdinfodet_dexpdate' 
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.bdinfodet_dexpdate[row] = datetime(date(ls_date))
		end if
	case 'bdinfodet_cexpdate' 
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.bdinfodet_cexpdate[row] = datetime(date(ls_date))
		end if
	case 'bdinfodet_bexpdate' 
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.bdinfodet_bexpdate[row] = datetime(date(ls_date))
		end if
	case 'bdinfodet_sexpdate' 
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.bdinfodet_sexpdate[row] = datetime(date(ls_date))
		end if
end choose


	
end event

event dw_2::itemchanged;CHOOSE CASE dwo.Name
	case 'bdinfodet_design_prog'
		if data = '010' or data = '020' or data = '030' then //설계진행중
			this.object.bdinfodet_sale_prog[1] = '010'
		elseif data = '040' then //설계확정
			this.object.bdinfodet_sale_prog[1] = '020'
		end if
	case 'bdinfodet_com_prog'
	case 'bdinfodet_buildingcom'
		if data <> '' then
			this.object.bdinfodet_com_prog[1] = '020'  //건설사확정
		end if
	case 'bdinfodet_builder'
		if data <> '' then
			this.object.bdinfodet_com_prog[1] = '040' //시공사확정
		end if
	case 'bdinfodet_quantity', 'bdinfodet_buildquantity'
		if dec(data) > 0 then
			this.object.bdinfodet_sale_prog[1] = '020'  //설계또는 현장확정
		end if
	case 'bdinfodet_salequantity'
		if dec(data) > 0 then
			this.object.bdinfodet_sale_prog[1] = '027'  //수주확정
		end if
end choose

end event

type dw_plist from datawindow within w_bdinfo_input_m
integer x = 37
integer y = 272
integer width = 571
integer height = 1740
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_bdinfo_input_l"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//dw_2.scrolltorow(dw_3.getrow())
//dw_2.setcolumn('bdinfodet_project')
//dw_2.setfocus()

if this.rowcount() <= 0 then return

dw_2.Object.bdinfodet_project.TabSequence = 0

string ls_agbuildno
dec ld_agseq
ls_agbuildno = this.object.bdinfodet_build_no[this.getrow()]
ld_agseq = this.object.bdinfodet_seq[this.getrow()]

dw_2.retrieve( ls_agbuildno, ld_agseq )

dw_2.setfocus()

end event

event retrieveend;wf_setfilter()

if this.rowcount() <= 0 then
	dw_2.reset()
	return
end if

dw_2.Object.bdinfodet_project.TabSequence = 0

string ls_agbuildno
dec ld_agseq
ls_agbuildno = this.object.bdinfodet_build_no[this.getrow()]
ld_agseq = this.object.bdinfodet_seq[this.getrow()]

dw_2.retrieve( ls_agbuildno, ld_agseq )

dw_2.setfocus()

end event

type pb_insert2 from picturebutton within w_bdinfo_input_m
integer x = 3803
integer y = 1000
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
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

type pb_delete2 from picturebutton within w_bdinfo_input_m
integer x = 4027
integer y = 1000
integer width = 187
integer height = 144
integer taborder = 200
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

type gb_4 from groupbox within w_bdinfo_input_m
integer x = 18
integer y = 216
integer width = 608
integer height = 1832
integer taborder = 70
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type pb_print3 from picturebutton within w_bdinfo_input_m
event mousemove pbm_mousemove
integer x = 2606
integer y = 52
integer width = 187
integer height = 144
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = left!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"프로젝트별 공사정보진행현황",parent, li_x, li_y)


end event

event clicked;w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no, ls_specname

string ls_agbuildno
decimal ld_agseq
ls_agbuildno = dw_2.object.bdinfodet_build_no[dw_2.getrow()]
ld_agseq = dw_2.object.bdinfodet_seq[dw_2.getrow()]

dw_print5.retrieve( ls_agbuildno, ld_agseq )

if dw_print5.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if

//SELECT spec_name  into :ls_specname
//    FROM bdspec 
//	 where spec_code = :ls_speccd;
//
l_print.st_datawindow = dw_print5
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 건설정보진행현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//if isnull(ld_fixeddate1) then
//	w_print.dw_1.object.t_start.text = "전체"
//	w_print.dw_1.object.t_end.text = "전체"
//else
//	w_print.dw_1.object.t_start.text = string(ld_fixeddate1, 'YYYY/MM/DD')
//	w_print.dw_1.object.t_end.text = string(RelativeDate(ld_fixeddate2, -1), 'YYYY/MM/DD')
//end if
//if trim(ls_specname) = '' or isnull(ls_specname) or ls_specname = '%' then
//	w_print.dw_1.object.t_spec.text = ""
//else
//	w_print.dw_1.object.t_spec.text = "(" + string(ls_specname) + ")"
//end if
	

end event

type dw_print5 from datawindow within w_bdinfo_input_m
boolean visible = false
integer x = 1486
integer y = 60
integer width = 128
integer height = 100
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_bdinfo_input_p"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

