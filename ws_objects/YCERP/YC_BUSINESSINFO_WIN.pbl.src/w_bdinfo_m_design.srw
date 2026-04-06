$PBExportHeader$w_bdinfo_m_design.srw
$PBExportComments$설계영업진행관리[2001/01/18,서재복]
forward
global type w_bdinfo_m_design from w_inheritance
end type
type dw_plist from datawindow within w_bdinfo_m_design
end type
type pb_insert2 from picturebutton within w_bdinfo_m_design
end type
type pb_delete2 from picturebutton within w_bdinfo_m_design
end type
type gb_4 from groupbox within w_bdinfo_m_design
end type
type pb_print3 from picturebutton within w_bdinfo_m_design
end type
type dw_print5 from datawindow within w_bdinfo_m_design
end type
type tab_1 from tab within w_bdinfo_m_design
end type
type tabpage_1 from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_1 cb_1
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type dw_5 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
dw_5 dw_5
end type
type tab_1 from tab within w_bdinfo_m_design
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_wf_ret from commandbutton within w_bdinfo_m_design
end type
end forward

global type w_bdinfo_m_design from w_inheritance
integer width = 4658
integer height = 2876
string title = "설계영업진행입력(w_bdinfo_m_design)"
boolean resizable = false
event keydown pbm_dwnkey
dw_plist dw_plist
pb_insert2 pb_insert2
pb_delete2 pb_delete2
gb_4 gb_4
pb_print3 pb_print3
dw_print5 dw_print5
tab_1 tab_1
cb_wf_ret cb_wf_ret
end type
global w_bdinfo_m_design w_bdinfo_m_design

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

string is_organcd, is_designcd
datawindow bd_getdw, dw4, dw5
string is_custsql
datawindowchild idwc_custperson


end variables

forward prototypes
public function boolean wf_delete1 (datawindow arg_dw1, string arg_str)
public subroutine wf_getmakecls ()
public subroutine wf_initpara ()
public subroutine wf_setfilter ()
public subroutine wf_zzz ()
public function decimal wf_makeseqno ()
public subroutine wf_calc ()
public subroutine wf_ret (string as_project)
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

public subroutine wf_calc ();dw5.accepttext()
long ll_dw5row
dec ldc_dw5quantity
for ll_dw5row = 1 to dw5.rowcount()
	ldc_dw5quantity += dw5.object.quantity[ll_dw5row]
next
dw4.object.quantity[dw4.getrow()] = ldc_dw5quantity

end subroutine

public subroutine wf_ret (string as_project);string ls_str1, ls_str2, ls_str3, ls_str4, ls_str5, ls_str6, ls_str7
string ls_str8, ls_str9, ls_str10, ls_str16, ls_str17, ls_str18
string ls_sdate1, ls_sdate2, ls_sdate3, ls_sdate4

ls_str1 = '%'
ls_str2 = '%'
ls_str3 = '%'
ls_str4 = as_project
ls_str5 = '%'
ls_str6 = '%'
ls_str7 = '%'
ls_str8 = '%'
ls_str9 = '%'
ls_str10 = '%'
ls_str16 = '전체'
ls_str17 = '전체'
ls_str18 = '전체'
ls_sdate1 = '1998/06/15'
ls_sdate2 = string(today(), 'yyyy/mm/dd')
ls_sdate3 = '0000/00/00'
ls_sdate4 = '0000/00/00'

is_person 	= ls_str1
is_divcd 	= ls_str2 
is_speccd 	= ls_str3 
is_project = '%' + ls_str4 + '%'
is_sprog 	= ls_str5
is_dprog 	= ls_str6
is_cprog 	= ls_str7
is_city 		= ls_str8
is_organcd 	= ls_str9
is_designcd = ls_str10
is_divcls 	= ls_str16
is_percls 	= ls_str17
is_expcls 	= ls_str18

id_fixeddate1 = date(ls_sdate1)
id_fixeddate2 = date(ls_sdate2)
id_expdate1   = date(ls_sdate3)
id_expdate2   = date(ls_sdate4)

wf_getmakecls()

dw_1.reset()
dw_1.retrieve()


end subroutine

on w_bdinfo_m_design.create
int iCurrent
call super::create
this.dw_plist=create dw_plist
this.pb_insert2=create pb_insert2
this.pb_delete2=create pb_delete2
this.gb_4=create gb_4
this.pb_print3=create pb_print3
this.dw_print5=create dw_print5
this.tab_1=create tab_1
this.cb_wf_ret=create cb_wf_ret
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_plist
this.Control[iCurrent+2]=this.pb_insert2
this.Control[iCurrent+3]=this.pb_delete2
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.pb_print3
this.Control[iCurrent+6]=this.dw_print5
this.Control[iCurrent+7]=this.tab_1
this.Control[iCurrent+8]=this.cb_wf_ret
end on

on w_bdinfo_m_design.destroy
call super::destroy
destroy(this.dw_plist)
destroy(this.pb_insert2)
destroy(this.pb_delete2)
destroy(this.gb_4)
destroy(this.pb_print3)
destroy(this.dw_print5)
destroy(this.tab_1)
destroy(this.cb_wf_ret)
end on

event open;call super::open;//dw_1.settransobject(sqlca)
//dw_2.settransobject(sqlca)
dw4 = tab_1.tabpage_2.dw_4
dw5 = tab_1.tabpage_2.dw_5
dw_plist.settransobject(sqlca)
dw_print5.settransobject(sqlca)
dw4.settransobject(sqlca)
dw5.settransobject(sqlca)



wf_initpara()
//pb_retrieve.PostEvent(Clicked!)
is_speccd = '꽝'
dw_1.retrieve()
pb_insert.PostEvent(Clicked!)
//pb_retrieve.PostEvent(Clicked!)
dw_2.sharedata(tab_1.tabpage_1.dw_3)
bd_getdw = dw4

tab_1.tabpage_1.dw_3.getchild("bdinfodet_designman", idwc_custperson)
is_custsql = idwc_custperson.describe("datawindow.table.select")

if gs_winname = 'w_bdinfo_m1' then
//	gs_winname = ''
	cb_wf_ret.postevent(clicked!)
//	wf_ret(trim(gs_var1))
//	if dw_plist.getrow() > 0 then
//		dw_plist.scrolltorow(1)
//	end if
end if




end event

event closequery;call super::closequery;if gs_winname = 'w_bdinfo_m1' then
	gs_winname = ''
end if
end event

type pb_save from w_inheritance`pb_save within w_bdinfo_m_design
integer x = 3182
end type

event pb_save::clicked;string ls_nullvalue, ls_existvalue
long ll_row1, ll_row2, ll_cnt1, ll_cnt2
long ll_existcount

choose case tab_1.selectedtab
	case 1
		dw_2.accepttext()
		tab_1.tabpage_1.dw_3.accepttext()
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
		
			string ls_datecheck
			ls_datecheck = string(dw_2.object.bdinfodet_makedate[ll_row2],'yyyy/mm/dd')
			if isnull(ls_datecheck) or trim(ls_datecheck) = '' or trim(ls_datecheck) = '0000/00/00' then
				messagebox('확인', '최초발생일자를 입력하십시오.' + ls_datecheck)
				dw_2.setcolumn('bdinfodet_makedate')
				dw_2.setfocus()
				return
			end if

			if dw_2.object.bdinfodet_sale_prog[ll_row2] = '020' then
				ls_datecheck = string(dw_2.object.bdinfodet_fixeddate[ll_row2],'yyyy/mm/dd')
				if isnull(ls_datecheck) or trim(ls_datecheck) = '' or trim(ls_datecheck) = '0000/00/00' then
					messagebox('확인', '진행(확정)일자를 입력하십시오.' + ls_datecheck)
					dw_2.setcolumn('bdinfodet_fixeddate')
					dw_2.setfocus()
					return
				end if
			end if
		
			IF l_status = newModified! OR l_status = new! THEN
				if wf_makeseqno() <= 0 then 
					messagebox("오류", "키를 생성하지 못했습니다. 전산실로 문의하세요.")
					return
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
				is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
			end if
		end if
	
	case 2
		dw_2.accepttext()
		dw4.accepttext()
		dw5.accepttext()

		ll_row1 = dw_plist.GetRow()
		ll_row2 = dw_2.GetRow()
		if dw_plist.object.bdinfodet_seq[ll_row1] <> dw_2.object.bdinfodet_seq[ll_row2]  then return
		wf_update2(dw4,dw5,"Y") 
	

 		
END CHOOSE
end event

type dw_1 from w_inheritance`dw_1 within w_bdinfo_m_design
boolean visible = false
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
	is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
end if
end event

type st_title from w_inheritance`st_title within w_bdinfo_m_design
integer y = 36
integer height = 164
integer textsize = -20
string text = "설계영업 진행입력"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_m_design
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_m_design
boolean visible = false
integer x = 4087
integer y = 64
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_m_design
boolean visible = false
integer x = 4233
integer y = 64
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_m_design
integer x = 3374
integer taborder = 130
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_m_design
boolean visible = false
integer x = 3739
integer y = 64
integer taborder = 150
end type

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_m_design
boolean visible = false
integer x = 3927
integer y = 64
integer taborder = 170
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_m_design
integer x = 2990
integer taborder = 180
end type

event pb_delete::clicked;
string ls_bid_chk, ls_etmt_chk
long ll_row
string ls_person

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

//로그인과 담당자가 틀리면 삭제 못함, 또한 담당자가 없어도 삭제 못함 => 담당자만이 삭제할 수 있음
ls_person = dw_2.object.bdinfodet_person[dw_2.getrow()]
if ls_person <> gs_personno then 
	if gs_personno = '1999010s' or gs_personno = 'root' then
	else
		messagebox("삭제불가", "담당자만이 삭제할 수 있습니다.")
		return
	end if
end if

if MessageBox("확인",'삭제하시겠습니까? ~n~n#.주의사항: 삭제후 자동 저장 됩니다.',information!, OKCancel!, 2) = 2 then
	return
end if	

string ls_delbuildno, ls_delspec_code
dec ld_delseq
ls_delbuildno = dw_2.object.bdinfodet_build_no[dw_2.getrow()]
ld_delseq = dw_2.object.bdinfodet_seq[dw_2.getrow()]

choose case tab_1.selectedtab
	case 1
		ll_row = dw_2.GetRow()
		ls_bid_chk = dw_2.object.bdinfodet_bid_chk[ll_row] 
		ls_etmt_chk = dw_2.object.bdinfodet_etmt_chk[ll_row] 
		if ls_bid_chk = '1' or ls_etmt_chk = '1' then  //견적이나 입찰이면
			dw_2.object.bdinfodet_std_chk[ll_row] = '0'
			//wf_delete1(dw_2,"Y")
			if wf_delete1(dw_2,"Y") then
				delete from bdinfodetprog where build_no = :ls_delbuildno and seq = :ld_delseq;
				commit;
			end if
			
			if dw_1.RowCount() >= 1 then
				dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
				is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
			end if
		else
			dw_2.deleterow(0)
			//wf_delete1(dw_2,"Y")
			if wf_delete1(dw_2,"Y") then
				delete from bdinfodetprog where build_no = :ls_delbuildno and seq = :ld_delseq;
				delete FROM bdinfodet2_item where build_no = :ls_delbuildno and seq = :ld_delseq;
				delete FROM bdinfodet2 where build_no = :ls_delbuildno and seq = :ld_delseq;
				commit;
			end if
			dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
			is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
			
		end if
	case 2
		if bd_getdw = dw4 then
			long ll_dw4row
			ll_dw4row = dw4.getrow()
//			ls_delbuildno = dw4.object.build_no[ll_dw4row]
//			ld_delseq = dw4.object.seq[ll_dw4row]
			ls_delspec_code = dw4.object.spec_code[ll_dw4row]

			delete FROM bdinfodet2_item   
			where build_no = :ls_delbuildno
			and 	seq = :ld_delseq 
			and	spec_code = :ls_delspec_code;
			if sqlca.sqlcode = 0 then
				commit;
				dw4.deleterow(0)
				wf_delete1(dw4,"Y")
			else
				rollback;
				messagebox('경고 NO_1', '삭제 오류가 발생 되었습니다.  전산실에 문의 바랍니다.')
			end if
		else
			dw5.deleterow(0)
			wf_delete1(dw5,"Y")
		end if
end choose



end event

type pb_insert from w_inheritance`pb_insert within w_bdinfo_m_design
integer x = 2798
integer taborder = 200
end type

event pb_insert::clicked;decimal ld_seq_no
long ll_row, ll_dw4row, ll_dw5row

//dw_2.Object.bdinfodet_project.TabSequence = 1

if dw_1.RowCount() < 1 then
	messagebox('확인','먼저 건설정보번호를 입력하세요')
	return
end if

choose case tab_1.selectedtab
	case 1 
		tab_1.tabpage_2.enabled = false
		select max(seq) into :ld_seq_no from bdinfodet
		 where build_no = :is_build_no;
		if ld_seq_no = 0 or isnull(ld_seq_no) then
			 ld_seq_no = 1
		elseif ld_seq_no >= 1 then
			 ld_seq_no = ld_seq_no + 1
		end if

		dw_2.reset()
		dw4.reset()
		dw5.reset()
		ll_row = dw_2.insertrow(0)
		
		//ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
		dw_2.object.bdinfodet_build_no[ll_row] = is_build_no  //ls_build_no 
		dw_2.object.bdinfodet_seq[ll_row] = ld_seq_no 
		dw_2.object.bdinfodet_person[ll_row] = gs_personno
		dw_2.object.bdinfodet_div[ll_row] = gs_divcode
		dw_2.object.bdinfodet_makedate[ll_row] =  today()
		dw_2.object.bdinfodet_floors[ll_row] =  '0/0'
		dw_2.scrolltorow(ll_row)
		dw_2.setcolumn('bdinfodet_project')
		dw_2.setfocus()
	case 2
		if bd_getdw = dw4 then
			string ls_build_no
			long ll_seq, ll_dw4setrow
			dw_2.accepttext()
			dw4.accepttext()
			ll_dw4row = dw4.insertrow(0)
			dw4.object.build_no[ll_dw4row] = dw_2.object.bdinfodet_build_no[1]
			dw4.object.seq[ll_dw4row] = dw_2.object.bdinfodet_seq[1]
			ls_build_no = dw_2.object.bdinfodet_build_no[1]
			ll_seq = dw_2.object.bdinfodet_seq[1]
			dw4.scrolltorow(ll_dw4row)
			dw5.reset()
			select isnull(seq_no,0) into :ll_dw4setrow from bdinfodet2
			where build_no = :ls_build_no
			and   seq = :ll_seq;
			if isnull(ll_dw4setrow) or ll_dw4setrow = 0 then
				ll_dw4setrow = 1
			else
				ll_dw4setrow = ll_dw4setrow + 1
			end if
			dw4.object.seq_no[ll_dw4row] = ll_dw4setrow
			if ll_dw4row > 1 then
				if dw4.object.seq_no[ll_dw4row - 1] = dw4.object.seq_no[ll_dw4row] then
					dw4.deleterow(ll_dw4row)
					messagebox('확인', '자재코드는 1줄씩 입력하고 저장하세요.')
					return
				end if
			end if
			dw4.setcolumn('spec_code')
			dw4.setfocus()
		else
			if dw4.getrow() >= 1 then
				dw4.accepttext()
				ll_dw5row = dw5.insertrow(0)
				dw5.object.build_no[ll_dw5row] = dw_2.object.bdinfodet_build_no[1]
				dw5.object.seq[ll_dw5row] = dw_2.object.bdinfodet_seq[1]
				dw5.object.spec_code[ll_dw5row] = dw4.object.spec_code[dw4.getrow()]
				dw5.scrolltorow(ll_dw5row)
				dw5.setcolumn('input_ym')
				dw5.setfocus()
			end if
		end if		
end choose
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_m_design
integer x = 2414
integer taborder = 190
end type

event pb_retrieve::clicked;
openwithparm(w_bdinfo_w1, ist_where)
ist_where = Message.PowerObjectParm

if ist_where.okflag = true then
	is_person = ist_where.str1
	is_divcd = ist_where.str2 
	is_speccd = ist_where.str3 
//	is_speccd = '003'
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

type gb_3 from w_inheritance`gb_3 within w_bdinfo_m_design
string tag = "736"
integer x = 741
integer y = 216
integer width = 3141
integer height = 2568
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_m_design
boolean visible = false
integer x = 3749
integer y = 948
integer width = 512
integer height = 624
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_m_design
integer x = 2373
integer width = 1216
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_m_design
integer x = 763
integer y = 268
integer width = 3099
integer height = 484
integer taborder = 60
string dataobject = "d_bdinfo_m_design"
boolean vscrollbar = false
boolean border = false
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
	
if dwo.name = 'info_detail' then
	IF l_status = newModified! OR l_status = new! THEN
		messagebox("확인", "현재 프로젝트를 저장해야 상세정보를 작성할 수 있습니다." )
		return
	end if
	ist_where.str12 = this.object.bdinfodet_build_no[this.getrow()]
	ist_where.dec4 = this.object.bdinfodet_seq[this.getrow()]
	openwithparm(w_bdinfo_m2, ist_where)
	if ist_where.okflag = true then
		dw_2.retrieve( ist_where.str12, ist_where.dec4 )
	end if
end if


end event

event dw_2::rowfocuschanged;//dw_3.scrolltorow(dw_2.getrow())

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

event dw_2::itemchanged;string ls_member
long ll_row2

ll_row2 = dw_2.GetRow()

this.accepttext()

CHOOSE CASE dwo.Name
	case 'bdinfodet_design_prog'
		if data = '010' or data = '020' or data = '030' then //설계진행중
			this.object.bdinfodet_sale_prog[ll_row2] = '010'
		elseif data = '040' then //설계확정
			this.object.bdinfodet_sale_prog[ll_row2] = '020'
		end if
	case 'bdinfodet_com_prog'
	case 'bdinfodet_buildingcom'
		if data <> '' then
			this.object.bdinfodet_com_prog[ll_row2] = '020'  //건설사확정
		end if
	case 'bdinfodet_builder'
		if data <> '' then
			this.object.bdinfodet_com_prog[ll_row2] = '040' //시공사확정
		end if
//	case 'bdinfodet_quantity', 'bdinfodet_buildquantity'
//		if dec(data) > 0 then
//			this.object.bdinfodet_sale_prog[ll_row2] = '020'  //설계또는 현장확정
//		end if
//	case 'bdinfodet_salequantity'
//		if dec(data) > 0 then
//			this.object.bdinfodet_sale_prog[ll_row2] = '020'  //수주확정 => 확정
//		end if
	case 'bdinfodet_sale_prog'
		if data <> '010' or isnull(data) then
			//구성원의 레벨이 관리에 소속되는 id만이 확정구분을 수정할 수 있음
			select member_id into :ls_member from bdmember 
			where member_code = '10' and member_id = :gs_userid;
			if isnull(ls_member) or ls_member = '' then 
				messagebox("변경불가", "확정구분을 변경할 권한이 없습니다. 전산실로 문의하십시요.")
				return 1
			end if
		end if
end choose

return 0
	

end event

event dw_2::itemerror;CHOOSE CASE dwo.name
	CASE 'bdinfodet_sale_prog'
		this.object.bdinfodet_sale_prog[row] = '010'
	CASE ELSE
END CHOOSE

return 2
end event

event dw_2::keydown;call super::keydown;if key = KeyEnter! then
	Send(Handle(this),256,9,Long(0,0))
end if
end event

type dw_plist from datawindow within w_bdinfo_m_design
integer x = 37
integer y = 272
integer width = 667
integer height = 2488
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_bdinfo_input_l_design"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//dw_2.scrolltorow(dw_3.getrow())
//dw_2.setcolumn('bdinfodet_project')
//dw_2.setfocus()

if this.rowcount() <= 0 then return

//dw_2.Object.bdinfodet_project.TabSequence = 0

string ls_agbuildno
dec ld_agseq
ls_agbuildno = this.object.bdinfodet_build_no[this.getrow()]
ld_agseq = this.object.bdinfodet_seq[this.getrow()]

dw_2.retrieve( ls_agbuildno, ld_agseq )

long ll_dw4cnt
ll_dw4cnt = dw4.retrieve(ls_agbuildno, ld_agseq)
if ll_dw4cnt > 0 then
	dw4.scrolltorow(dw4.getrow())
else
	dw5.reset()
end if

tab_1.tabpage_2.enabled = true
tab_1.selectedtab = 1

//dw_2.setfocus()

end event

event retrieveend;wf_setfilter()

if this.rowcount() <= 0 then
	dw_2.reset()
	return
end if

//dw_2.Object.bdinfodet_project.TabSequence = 0
//if gs_winname = 'w_oecustdiary'then
	string ls_agbuildno
	dec ld_agseq
	ls_agbuildno = this.object.bdinfodet_build_no[this.getrow()]
	ld_agseq = this.object.bdinfodet_seq[this.getrow()]
	
	dw_2.retrieve( ls_agbuildno, ld_agseq )
	tab_1.tabpage_2.enabled = true
	dw4.reset()
	dw5.reset()
//end if

//dw_2.setfocus()

end event

type pb_insert2 from picturebutton within w_bdinfo_m_design
boolean visible = false
integer x = 3803
integer y = 1000
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
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

type pb_delete2 from picturebutton within w_bdinfo_m_design
boolean visible = false
integer x = 4027
integer y = 1000
integer width = 187
integer height = 144
integer taborder = 220
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

type gb_4 from groupbox within w_bdinfo_m_design
integer x = 18
integer y = 216
integer width = 709
integer height = 2564
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

type pb_print3 from picturebutton within w_bdinfo_m_design
event mousemove pbm_mousemove
integer x = 2606
integer y = 52
integer width = 187
integer height = 144
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
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

type dw_print5 from datawindow within w_bdinfo_m_design
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

type tab_1 from tab within w_bdinfo_m_design
integer x = 768
integer y = 752
integer width = 3077
integer height = 2008
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3040
integer height = 1892
long backcolor = 79741120
string text = "상세현황"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_1 cb_1
dw_3 dw_3
end type

on tabpage_1.create
this.cb_1=create cb_1
this.dw_3=create dw_3
this.Control[]={this.cb_1,&
this.dw_3}
end on

on tabpage_1.destroy
destroy(this.cb_1)
destroy(this.dw_3)
end on

type cb_1 from commandbutton within tabpage_1
integer x = 2821
integer y = 268
integer width = 210
integer height = 84
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;
if tab_1.tabpage_1.dw_3.getrow() > 0 then
	gs_winname2 = 'w_bdcustper_m'
	gs_var2 = tab_1.tabpage_1.dw_3.object.bdinfodet_designoffice[tab_1.tabpage_1.dw_3.getrow()]
	IF IsValid(w_bdcustper_m) = TRUE THEN close(w_bdcustper_m)
	openwithparm(w_bdcustper_m, ist_where)
end if

end event

type dw_3 from datawindow within tabpage_1
event keydown pbm_dwnkey
integer y = 20
integer width = 2834
integer height = 1864
integer taborder = 100
string title = "none"
string dataobject = "d_bdinfo_m2_design"
boolean border = false
boolean livescroll = true
end type

event keydown;if key = KeyEnter! then
	Send(Handle(this),256,9,Long(0,0))
end if 
end event

event itemchanged;string ls_member
this.accepttext()

CHOOSE CASE dwo.Name
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
//	case 'bdinfodet_quantity', 'bdinfodet_buildquantity'
//		if dec(data) > 0 then
//			this.object.bdinfodet_sale_prog[1] = '020'  //설계또는 현장확정
//		end if
//	case 'bdinfodet_salequantity'
//		if dec(data) > 0 then
//			this.object.bdinfodet_sale_prog[1] = '020'  //수주확정
//		end if
	case 'bdinfodet_sale_prog'
		if data <> '010' or isnull(data) then
			//구성원의 레벨이 관리에 소속되는 id만이 확정구분을 수정할 수 있음
			select member_id into :ls_member from bdmember 
			where member_code = '10' and member_id = :gs_userid;
			if isnull(ls_member) or ls_member = '' then 
				messagebox("변경불가", "확정구분을 변경할 권한이 없습니다. 전산실로 문의하십시요.")
				return 1
			end if
		end if
	case 'bdinfodet_designoffice'
		this.object.bdinfodet_designman[row] = ''
		string ls_where, ls_sql
		ls_where = "WHERE cust_no = ~~'" + data + "~~'"
		ls_sql = "datawindow.table.select = '" + is_custsql + ls_where + "'"
		idwc_custperson.modify(ls_sql)
//		dw_1.Modify("emp_status.dddw.PercentWidth=120")
//		this.Modify("bdinfodet_designman.dddw.PercentWidth=120")
//		this.Modify("bdinfodet_designman.dddw.Line=10")
		idwc_custperson.settransobject(sqlca)
		idwc_custperson.retrieve()
end choose

return 0
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3040
integer height = 1892
long backcolor = 79741120
string text = "설계진행현황"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_4 dw_4
dw_5 dw_5
end type

on tabpage_2.create
this.dw_4=create dw_4
this.dw_5=create dw_5
this.Control[]={this.dw_4,&
this.dw_5}
end on

on tabpage_2.destroy
destroy(this.dw_4)
destroy(this.dw_5)
end on

type dw_4 from datawindow within tabpage_2
integer x = 18
integer y = 24
integer width = 2990
integer height = 1868
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_bdinfodet2_m_design"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;bd_getdw = this
end event

event rowfocuschanged;if currentrow < 1 then	return
dw5.retrieve(this.object.build_no[currentrow], this.object.seq[currentrow], this.object.spec_code[currentrow])

end event

event clicked;if row < 1 then	return
dw5.retrieve(this.object.build_no[row], this.object.seq[row], this.object.spec_code[row])

end event

event itemchanged;string ls_uom

choose case dwo.name
	case 'spec_code'
		select isnull(uom,'')
			into :ls_uom from bdspec
		where spec_code = :data;
		this.object.uom[row] = ls_uom
end choose
end event

type dw_5 from datawindow within tabpage_2
boolean visible = false
integer x = 2231
integer y = 24
integer width = 791
integer height = 1904
integer taborder = 130
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_bdinfodet2_item_m_design"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;bd_getdw = this
end event

event itemchanged;wf_calc()
end event

type cb_wf_ret from commandbutton within w_bdinfo_m_design
boolean visible = false
integer x = 1883
integer y = 64
integer width = 357
integer height = 112
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "cb_wf_ret"
end type

event clicked;wf_ret(gs_var1)
gs_var1 = ''

if dw_plist.rowcount() <= 0 then
	pb_insert.PostEvent(Clicked!)
	return
end if

string ls_agbuildno
dec ld_agseq
ls_agbuildno = dw_plist.object.bdinfodet_build_no[dw_plist.getrow()]
ld_agseq = dw_plist.object.bdinfodet_seq[dw_plist.getrow()]

//dw_2.retrieve( ls_agbuildno, ld_agseq )

long ll_dw4cnt
ll_dw4cnt = dw4.retrieve(ls_agbuildno, ld_agseq)
if ll_dw4cnt > 0 then
	dw4.scrolltorow(dw4.getrow())
else
	dw5.reset()
end if

tab_1.tabpage_2.enabled = true
tab_1.selectedtab = 1
end event

