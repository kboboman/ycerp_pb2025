$PBExportHeader$w_bdinfo_m1.srw
forward
global type w_bdinfo_m1 from w_inheritance
end type
type pb_insert2 from picturebutton within w_bdinfo_m1
end type
type pb_delete2 from picturebutton within w_bdinfo_m1
end type
type pb_print3 from picturebutton within w_bdinfo_m1
end type
type st_1 from statictext within w_bdinfo_m1
end type
type st_2 from statictext within w_bdinfo_m1
end type
type st_3 from statictext within w_bdinfo_m1
end type
type st_4 from statictext within w_bdinfo_m1
end type
type cb_1 from commandbutton within w_bdinfo_m1
end type
type cb_2 from commandbutton within w_bdinfo_m1
end type
type cb_3 from commandbutton within w_bdinfo_m1
end type
end forward

global type w_bdinfo_m1 from w_inheritance
integer width = 4658
integer height = 2876
string title = "공사정보시스템(w_bdinfo_m1)"
boolean resizable = false
pb_insert2 pb_insert2
pb_delete2 pb_delete2
pb_print3 pb_print3
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
end type
global w_bdinfo_m1 w_bdinfo_m1

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
string is_scenesql
datawindowchild idwc_custperson
gs_boolean is_ble
DataWindowChild mgr_id2,mgr_id3,mgr_id4
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
//is_person = gs_userid
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

public subroutine wf_setfilter ();//string ls_where, ls_sql
//
//ls_where = ''
//ls_sql = ''
//
//if is_divcls <> '전체' and is_divcd = '%' then //담당본부가 있는것(일부/전체)
//	if	is_divcls = '정보입수담당본부' then 
//		ls_where = " len(bdinfodet_div) > 0 " 
//	elseif is_divcls = '설계영업담당본부' then 
//		is_ddiv = is_divcd
//		ls_where = " len(bdinfodet_ddiv) > 0 " 
//	elseif is_divcls = '건설사영업담당본부' then
//		is_cdiv = is_divcd
//		ls_where = " len(bdinfodet_cdiv) > 0 " 
//	elseif is_divcls = '시공사영업담당본부' then 
//		is_bdiv = is_divcd
//		ls_where = " len(bdinfodet_bdiv) > 0 " 
//	elseif is_divcls = '판매영업담당본부' then 
//		is_sdiv = is_divcd
//		ls_where = " len(bdinfodet_sdiv) > 0 " 
//	end if
//elseif is_divcls <> '전체' and is_divcd <> '%' then	//담당본부가 ??인것(일부/일부)	
//	if	is_divcls = '정보입수담당본부' then 
//		ls_where = " bdinfodet_div = '" + is_divcd + "'"  
//	elseif is_divcls = '설계영업담당본부' then 
//		ls_where = " bdinfodet_ddiv = '" + is_divcd + "'"  
//	elseif is_divcls = '건설사영업담당본부' then
//		ls_where = " bdinfodet_cdiv = '" + is_divcd + "'"  
//	elseif is_divcls = '시공사영업담당본부' then 
//		ls_where = " bdinfodet_bdiv = '" + is_divcd + "'"  
//	elseif is_divcls = '판매영업담당본부' then 
//		ls_where = " bdinfodet_sdiv = '" + is_divcd + "'"  
//	end if
//else // '전체/전체, 전체/일부'
//end if
//
//ls_sql = ls_where
//ls_where = ''
//
//if is_percls <> '전체' and is_person = '%' then //작성자가 있는것(일부/전체)
//	if is_percls = '정보입수담당자' then 
//		ls_where = " len(bdinfodet_person) > 0 " 
//	elseif is_percls = '설계영업담당자' then 
//		ls_where = " len(bdinfodet_dperson) > 0 " 
//	elseif is_percls = '건설사영업담당자' then
//		ls_where = " len(bdinfodet_cperson) > 0 " 
//	elseif is_percls = '시공사영업담당자' then 
//		ls_where = " len(bdinfodet_bperson) > 0 " 
//	elseif is_percls = '판매영업담당자' then 
//		ls_where = " len(bdinfodet_sperson) > 0 " 
//	end if
//elseif is_percls <> '전체' and is_person <> '%' then	//작성자가 ??인것(일부/일부)	
//	if is_percls = '정보입수담당자' then 
//		ls_where = " bdinfodet_person = '" + is_person + "'"  
//	elseif is_percls = '설계영업담당자' then 
//		ls_where = " bdinfodet_dperson = '" + is_person + "'"  
//	elseif is_percls = '건설사영업담당자' then
//		ls_where = " bdinfodet_cperson = '" + is_person + "'"  
//	elseif is_percls = '시공사영업담당자' then 
//		ls_where = " bdinfodet_bperson = '" + is_person + "'"  
//	elseif is_percls = '판매영업담당자' then 
//		ls_where = " bdinfodet_sperson = '" + is_person + "'"  
//	end if
//else // '전체/전체, 전체/일부'
//end if
//
//if len(ls_sql) > 0 and len(ls_where) > 0 then
//	ls_sql = ls_sql + ' and ' + ls_where
//elseif len(ls_sql) > 0 and len(ls_where) = 0 then
//	ls_sql = ls_sql 
//elseif len(ls_sql) = 0 and len(ls_where) > 0 then	
//	ls_sql = ls_where
//end if	
//ls_where = ''
//
//if	is_expcls = '정보입수발생일자' then
//	id_makedate1 = id_expdate1
//	id_makedate2 = id_expdate2
//	ls_where = " date( bdinfodet_makedate ) >= date('" + string(id_makedate1) + "') and  date( bdinfodet_makedate ) <= date('" + string(id_makedate2) + "')"
//elseif is_expcls = '설계확정예정일자' then
//	id_dexpdate1 = id_expdate1
//	id_dexpdate2 = id_expdate2
//	ls_where = " date( bdinfodet_dexpdate ) >= date('" + string(id_dexpdate1) + "') and  date( bdinfodet_dexpdate ) <= date('" + string(id_dexpdate2) + "')"
//elseif is_expcls = '건설사선정예정일자' then
//	id_cexpdate1 = id_expdate1
//	id_cexpdate2 = id_expdate2
//	ls_where = " date( bdinfodet_cexpdate ) >= date('" + string(id_cexpdate1) + "') and  date( bdinfodet_cexpdate ) <= date('" + string(id_cexpdate2) + "')"
//elseif is_expcls = '시공사선정예정일자' then
//	id_bexpdate1 = id_expdate1
//	id_bexpdate2 = id_expdate2
//	ls_where = " date( bdinfodet_bexpdate ) >= date('" + string(id_bexpdate1) + "') and  date( bdinfodet_bexpdate ) <= date('" + string(id_bexpdate2) + "')"
//elseif is_expcls = '판매확정예정일자' then
//	id_sexpdate1 = id_expdate1
//	id_sexpdate2 = id_expdate2
//	ls_where = " date( bdinfodet_sexpdate ) >= date('" + string(id_sexpdate1) + "') and  date( bdinfodet_sexpdate ) <= date('" + string(id_sexpdate2) + "')"
//else  //전체
//end if
//
//if len(ls_sql) > 0 and len(ls_where) > 0 then
//	ls_sql = ls_sql + ' and ' + ls_where
//elseif len(ls_sql) > 0 and len(ls_where) = 0 then
//	ls_sql = ls_sql 
//elseif len(ls_sql) = 0 and len(ls_where) > 0 then	
//	ls_sql = ls_where
//end if	
//
//dw_plist.SetFilter(ls_sql)
//dw_plist.Filter( )
//
//
end subroutine

public subroutine wf_zzz ();//string ls_where, ls_sql
//
//ls_where = ''
//ls_sql = ''
//
//if is_divcls <> '전체' and is_divcd = '%' then //담당본부가 있는것(일부/전체)
//	if	is_divcls = '정보입수담당본부' then 
//		ls_where = " len(bdinfodet_div) > 0 " 
//	elseif is_divcls = '설계영업담당본부' then 
//		is_ddiv = is_divcd
//		ls_where = " len(bdinfodet_ddiv) > 0 " 
//	elseif is_divcls = '건설사영업담당본부' then
//		is_cdiv = is_divcd
//		ls_where = " len(bdinfodet_cdiv) > 0 " 
//	elseif is_divcls = '시공사영업담당본부' then 
//		is_bdiv = is_divcd
//		ls_where = " len(bdinfodet_bdiv) > 0 " 
//	elseif is_divcls = '판매영업담당본부' then 
//		is_sdiv = is_divcd
//		ls_where = " len(bdinfodet_sdiv) > 0 " 
//	end if
//elseif is_divcls <> '전체' and is_divcd <> '%' then	//담당본부가 ??인것(일부/일부)	
//	if	is_divcls = '정보입수담당본부' then 
//		ls_where = " bdinfodet_div = '" + is_divcd + "'"  
//	elseif is_divcls = '설계영업담당본부' then 
//		ls_where = " bdinfodet_ddiv = '" + is_divcd + "'"  
//	elseif is_divcls = '건설사영업담당본부' then
//		ls_where = " bdinfodet_cdiv = '" + is_divcd + "'"  
//	elseif is_divcls = '시공사영업담당본부' then 
//		ls_where = " bdinfodet_bdiv = '" + is_divcd + "'"  
//	elseif is_divcls = '판매영업담당본부' then 
//		ls_where = " bdinfodet_sdiv = '" + is_divcd + "'"  
//	end if
//else // '전체/전체, 전체/일부'
//	is_divcd = is_divcd
//	is_ddiv = is_divcd
//	is_cdiv = is_divcd
//	is_bdiv = is_divcd
//	is_sdiv = is_divcd
//end if
//
//ls_sql = ls_where
//ls_where = ''
//
//if is_percls <> '전체' and is_person = '%' then //작성자가 있는것(일부/전체)
//	if is_percls = '정보입수담당자' then 
//		ls_where = " len(bdinfodet_person) > 0 " 
//	elseif is_percls = '설계영업담당자' then 
//		ls_where = " len(bdinfodet_dperson) > 0 " 
//	elseif is_percls = '건설사영업담당자' then
//		ls_where = " len(bdinfodet_cperson) > 0 " 
//	elseif is_percls = '시공사영업담당자' then 
//		ls_where = " len(bdinfodet_bperson) > 0 " 
//	elseif is_percls = '판매영업담당자' then 
//		ls_where = " len(bdinfodet_sperson) > 0 " 
//	end if
//elseif is_percls <> '전체' and is_person <> '%' then	//작성자가 ??인것(일부/일부)	
//	if is_percls = '정보입수담당자' then 
//		ls_where = " bdinfodet_person = '" + is_person + "'"  
//	elseif is_percls = '설계영업담당자' then 
//		ls_where = " bdinfodet_dperson = '" + is_person + "'"  
//	elseif is_percls = '건설사영업담당자' then
//		ls_where = " bdinfodet_cperson = '" + is_person + "'"  
//	elseif is_percls = '시공사영업담당자' then 
//		ls_where = " bdinfodet_bperson = '" + is_person + "'"  
//	elseif is_percls = '판매영업담당자' then 
//		ls_where = " bdinfodet_sperson = '" + is_person + "'"  
//	end if
//else // '전체/전체, 전체/일부'
//	is_person= is_person
//	is_dperson= is_person
//	is_cperson= is_person
//	is_bperson= is_person
//	is_sperson= is_person
//end if
//
//if len(ls_sql) > 0 and len(ls_where) > 0 then
//	ls_sql = ls_sql + ' and ' + ls_where
//elseif len(ls_sql) > 0 and len(ls_where) = 0 then
//	ls_sql = ls_sql 
//elseif len(ls_sql) = 0 and len(ls_where) > 0 then	
//	ls_sql = ls_where
//end if	
//ls_where = ''
//
//if	is_expcls = '정보입수작성일자' then
//	id_makedate1 = id_expdate1
//	id_makedate2 = id_expdate2
//elseif is_expcls = '설계확정예정일자' then
//	id_dexpdate1 = id_expdate1
//	id_dexpdate2 = id_expdate2
//elseif is_expcls = '건설사선정예정일자' then
//	id_cexpdate1 = id_expdate1
//	id_cexpdate2 = id_expdate2
//elseif is_expcls = '시공사선정예정일자' then
//	id_bexpdate1 = id_expdate1
//	id_bexpdate2 = id_expdate2
//elseif is_expcls = '판매확정예정일자' then
//	id_sexpdate1 = id_expdate1
//	id_sexpdate2 = id_expdate2
//else  //전체
//	id_makedate1 = date('1900/01/01')
//	id_makedate2 = date('2200/01/01')
//	id_dexpdate1 = date('1900/01/01')
//	id_dexpdate2 = date('2200/01/01')
//	id_cexpdate1 = date('1900/01/01')
//	id_cexpdate2 = date('2200/01/01')
//	id_bexpdate1 = date('1900/01/01')
//	id_bexpdate2 = date('2200/01/01')
//	id_sexpdate1 = date('1900/01/01')
//	id_sexpdate2 = date('2200/01/01')
//end if
//
//dw_plist.SetFilter(ls_sql)
//dw_plist.Filter( )
//
//
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

on w_bdinfo_m1.create
int iCurrent
call super::create
this.pb_insert2=create pb_insert2
this.pb_delete2=create pb_delete2
this.pb_print3=create pb_print3
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_insert2
this.Control[iCurrent+2]=this.pb_delete2
this.Control[iCurrent+3]=this.pb_print3
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_3
end on

on w_bdinfo_m1.destroy
call super::destroy
destroy(this.pb_insert2)
destroy(this.pb_delete2)
destroy(this.pb_print3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
end on

event open;call super::open;dw_2.GetChild ("bdinfodet_master", mgr_id2)
mgr_id2.SetTransObject (SQLCA)
dw_2.GetChild ("bdinfodet_buildingcom", mgr_id3)
mgr_id3.SetTransObject (SQLCA)
dw_2.GetChild ("bdinfodet_designoffice", mgr_id4)
mgr_id4.SetTransObject (SQLCA)

dw_2.object.bdinfodet_makedate.width = 0
dw_2.object.bdinfodet_designoffice.width = 0
dw_2.object.bdinfodet_floors.width = 0
dw_2.object.bdinfodet_constructiondate.width = 0
dw_2.object.bdinfodet_completiondate.width = 0
dw_2.object.bdinfodet_build_prog.width = 0
dw_2.object.bdinfodet_builderman.width = 0
dw_2.object.bdinfodet_builderphone.width = 0
dw_2.object.bdinfodet_person.width = 0
dw_2.object.bdinfodet_rem.width = 0
pb_retrieve.triggerevent(clicked!)
////dw_1.settransobject(sqlca)
////dw_2.settransobject(sqlca)
//dw4 = tab_1.tabpage_2.dw_4
//dw5 = tab_1.tabpage_2.dw_5
//dw_plist.settransobject(sqlca)
//dw_print5.settransobject(sqlca)
//dw4.settransobject(sqlca)
//dw5.settransobject(sqlca)
//
//wf_initpara()
////pb_retrieve.PostEvent(Clicked!)
//is_speccd = '꽝'
//dw_1.retrieve()
//pb_insert.PostEvent(Clicked!)
////pb_retrieve.PostEvent(Clicked!)
//dw_2.sharedata(tab_1.tabpage_1.dw_3)
//bd_getdw = dw4
//
//tab_1.tabpage_1.dw_3.getchild("bdinfodet_builderman", idwc_custperson)
//is_scenesql = idwc_custperson.describe("datawindow.table.select")
//
//if gs_winname = 'w_oecustdiary'then
////	gs_winname = ''
//	cb_wf_ret.postevent(clicked!)
////	wf_ret(trim(gs_var1))
////	if dw_plist.getrow() > 0 then
////		dw_plist.scrolltorow(1)
////	end if
//end if




end event

type pb_save from w_inheritance`pb_save within w_bdinfo_m1
integer x = 3182
boolean enabled = false
end type

event pb_save::clicked;//string ls_nullvalue, ls_existvalue
//long ll_row1, ll_row2, ll_cnt1, ll_cnt2, ll_cnt4, ll_cnt5
//long ll_existcount
//
//
////		dw_2.accepttext()
////		tab_1.tabpage_1.dw_3.accepttext()
////		ll_row2 = dw_2.GetRow()
////		ll_row1 = dw_1.GetRow()
////		if ll_row1 < 1 and ll_row2 < 1 then return
////		
////		if ll_row2 >= 1 then
////			ls_nullvalue = dw_2.object.bdinfodet_project[ll_row2]
////			if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
////				messagebox('확인','프로젝트명을 입력하세요.')
////				dw_2.setcolumn('bdinfodet_project')
////				dw_2.setfocus()
////				return
////			end if
////			
////			select count(project) into :ll_existcount from bdinfodet
////			where project = :ls_nullvalue;
////		
////			dwitemstatus l_status
////			l_status = dw_2.GetItemStatus(ll_row2, 0, Primary!)
////			IF l_status = newModified! OR l_status = new! THEN
////				if ll_existcount > 0 then //새로운 데이터 추가시 데이터가 있으면 count가 0보다 크므로 중복
////					messagebox('확인', '프로젝트명이 중복됩니다.')
////					dw_2.setcolumn('bdinfodet_project')
////					dw_2.setfocus()
////					return
////				end if	
////			else
////				if ll_existcount > 1 then //수정하지 않고 저장시는 count가 1보다 크므로 중복
////					messagebox('확인', string(ll_existcount) + '프로젝트명이 중복됩니다.')
////					dw_2.setcolumn('bdinfodet_project')
////					dw_2.setfocus()
////					return
////				end if	
////			end if
////		
////			string ls_datecheck
////			ls_datecheck = string(dw_2.object.bdinfodet_makedate[ll_row2],'yyyy/mm/dd')
////			if isnull(ls_datecheck) or trim(ls_datecheck) = '' or trim(ls_datecheck) = '0000/00/00' then
////				messagebox('확인', '최초발생일자를 입력하십시오.' + ls_datecheck)
////				dw_2.setcolumn('bdinfodet_makedate')
////				dw_2.setfocus()
////				return
////			end if
////			ls_datecheck = string(dw_2.object.bdinfodet_fixeddate[ll_row2],'yyyy/mm/dd')
////			if isnull(ls_datecheck) or trim(ls_datecheck) = '' or trim(ls_datecheck) = '0000/00/00' then
////				messagebox('확인', '진행(확정)일자를 입력하십시오.' + ls_datecheck)
////				dw_2.setcolumn('bdinfodet_fixeddate')
////				dw_2.setfocus()
////				return
////			end if
////		
////			IF l_status = newModified! OR l_status = new! THEN
////				if wf_makeseqno() <= 0 then 
////					messagebox("오류", "키를 생성하지 못했습니다. 전산실로 문의하세요.")
////					return
////				end if
////			end if
////			
////		//	ls_nullvalue = dw_2.object.bdinfodet_div[ll_row2]
////		//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
////		//		messagebox('확인','담당본부를 입력하세요.')
////		//		dw_2.setcolumn('bdinfodet_div')
////		//		dw_2.setfocus()
////		//		return
////		//	end if
////		//	ls_nullvalue = dw_2.object.bdinfodet_spec[ll_row2]
////		//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
////		//		messagebox('확인','제품을 입력하세요.')
////		//		dw_2.setcolumn('bdinfodet_spec')
////		//		dw_2.setfocus()
////		//		return
////		//	end if
////		//	ls_nullvalue = dw_2.object.bdinfodet_fixedflag[ll_row2]
////		//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
////		//		messagebox('확인','영업진행사항을 입력하세요.')
////		//		dw_2.setcolumn('bdinfodet_fixedflag')
////		//		dw_2.setfocus()
////		//		return
////		//	end if
////		//	if isnull(dw_2.object.bdinfodet_fixeddate[ll_row2]) then
////		//		messagebox('확인','영업진행일자를 입력하세요.')
////		//		dw_2.setcolumn('bdinfodet_fixeddate')
////		//		dw_2.setfocus()
////		//		return
////		//	end if
////		
////		end if
////
////		dw4.accepttext()
////		dw5.accepttext()		
////		ll_cnt1 = wf_modifycount(dw_1) 
////		ll_cnt2 = wf_modifycount(dw_2) 
////		ll_cnt4 = wf_modifycount(dw4) 
////		ll_cnt5 = wf_modifycount(dw5) 
////		
////		
////		if ll_cnt1 > 0  or ll_cnt2 > 0 or ll_cnt4 > 0  or ll_cnt5 > 0 then	
////			wf_update4(dw_1,dw_2, dw4, dw5, "Y")
////			IF l_status = newModified! OR l_status = new! THEN
////				dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
////				is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
////			end if
////		end if
//	 		
//
//choose case tab_1.selectedtab
//	case 1
//		dw_2.accepttext()
//		tab_1.tabpage_1.dw_3.accepttext()
//		ll_row2 = dw_2.GetRow()
//		ll_row1 = dw_1.GetRow()
//		if ll_row1 < 1 and ll_row2 < 1 then return
//		
//		if ll_row2 >= 1 then
//			ls_nullvalue = dw_2.object.bdinfodet_project[ll_row2]
//			if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
//				messagebox('확인','프로젝트명을 입력하세요.')
//				dw_2.setcolumn('bdinfodet_project')
//				dw_2.setfocus()
//				return
//			end if
//			
//			select count(project) into :ll_existcount from bdinfodet
//			where project = :ls_nullvalue;
//		
//			dwitemstatus l_status
//			l_status = dw_2.GetItemStatus(ll_row2, 0, Primary!)
//			IF l_status = newModified! OR l_status = new! THEN
//				if ll_existcount > 0 then //새로운 데이터 추가시 데이터가 있으면 count가 0보다 크므로 중복
//					messagebox('확인', '프로젝트명이 중복됩니다.')
//					dw_2.setcolumn('bdinfodet_project')
//					dw_2.setfocus()
//					return
//				end if	
//			else
//				if ll_existcount > 1 then //수정하지 않고 저장시는 count가 1보다 크므로 중복
//					messagebox('확인', string(ll_existcount) + '프로젝트명이 중복됩니다.')
//					dw_2.setcolumn('bdinfodet_project')
//					dw_2.setfocus()
//					return
//				end if	
//			end if
//		
//			string ls_datecheck
//			ls_datecheck = string(dw_2.object.bdinfodet_makedate[ll_row2],'yyyy/mm/dd')
//			if isnull(ls_datecheck) or trim(ls_datecheck) = '' or trim(ls_datecheck) = '0000/00/00' then
//				messagebox('확인', '최초발생일자를 입력하십시오.' + ls_datecheck)
//				dw_2.setcolumn('bdinfodet_makedate')
//				dw_2.setfocus()
//				return
//			end if
//
//			if dw_2.object.bdinfodet_sale_prog[ll_row2] = '020' then
//				ls_datecheck = string(dw_2.object.bdinfodet_fixeddate[ll_row2],'yyyy/mm/dd')
//				if isnull(ls_datecheck) or trim(ls_datecheck) = '' or trim(ls_datecheck) = '0000/00/00' then
//					messagebox('확인', '진행(확정)일자를 입력하십시오.' + ls_datecheck)
//					dw_2.setcolumn('bdinfodet_fixeddate')
//					dw_2.setfocus()
//					return
//				end if
//			end if
//		
//			IF l_status = newModified! OR l_status = new! THEN
//				if wf_makeseqno() <= 0 then 
//					messagebox("오류", "키를 생성하지 못했습니다. 전산실로 문의하세요.")
//					return
//				end if
//			end if
//			
//		//	ls_nullvalue = dw_2.object.bdinfodet_div[ll_row2]
//		//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
//		//		messagebox('확인','담당본부를 입력하세요.')
//		//		dw_2.setcolumn('bdinfodet_div')
//		//		dw_2.setfocus()
//		//		return
//		//	end if
//		//	ls_nullvalue = dw_2.object.bdinfodet_spec[ll_row2]
//		//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
//		//		messagebox('확인','제품을 입력하세요.')
//		//		dw_2.setcolumn('bdinfodet_spec')
//		//		dw_2.setfocus()
//		//		return
//		//	end if
//		//	ls_nullvalue = dw_2.object.bdinfodet_fixedflag[ll_row2]
//		//	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
//		//		messagebox('확인','영업진행사항을 입력하세요.')
//		//		dw_2.setcolumn('bdinfodet_fixedflag')
//		//		dw_2.setfocus()
//		//		return
//		//	end if
//		//	if isnull(dw_2.object.bdinfodet_fixeddate[ll_row2]) then
//		//		messagebox('확인','영업진행일자를 입력하세요.')
//		//		dw_2.setcolumn('bdinfodet_fixeddate')
//		//		dw_2.setfocus()
//		//		return
//		//	end if
//		
//		end if
//		
//		ll_cnt1 = wf_modifycount(dw_1) 
//		ll_cnt2 = wf_modifycount(dw_2) 
//		
//		
//		if ll_cnt1 > 0  or ll_cnt2 > 0 then	 
//			wf_update2(dw_1,dw_2,"Y") 
//			IF l_status = newModified! OR l_status = new! THEN
//				dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
//				is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
//			end if
//		end if
//	
//	case 2
//		dw_2.accepttext()
//		dw4.accepttext()
//		dw5.accepttext()
//
//		ll_row1 = dw_plist.GetRow()
//		ll_row2 = dw_2.GetRow()
//		if dw_plist.object.bdinfodet_seq[ll_row1] <> dw_2.object.bdinfodet_seq[ll_row2]  then return
//		wf_update2(dw4,dw5,"Y") 
//		
//END CHOOSE
end event

type dw_1 from w_inheritance`dw_1 within w_bdinfo_m1
boolean visible = false
integer x = 1765
integer y = 72
integer width = 197
integer height = 116
integer taborder = 50
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;//long ll_row
//
//ll_row = wf_rowfocuschange(dw_1,"N")
//if ll_row < 1 then
//	return
//end if
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//is_build_no = dw_1.getitemstring(ll_row, "build_no")
//
//if isnull(is_build_no) or is_build_no = "" then
//   return
//else
////	messagebox('1', is_build_no)
////	messagebox('2', is_divcd)
////	messagebox('3', is_speccd)
////	messagebox('4', is_project)
////	messagebox('5', is_sprog)
////	messagebox('6', string(id_fixeddate1))
////	messagebox('7', string(id_fixeddate2))
////	messagebox('8', is_dprog)
////	messagebox('9', is_cprog)
////	messagebox('10', is_city)
////	
////	messagebox('11', is_person)
////	messagebox('12', is_dperson)
////	messagebox('13', is_ddiv)
////	messagebox('14', is_cperson)
////	messagebox('15', is_cdiv)
////	messagebox('16', is_bperson)
////	messagebox('17', is_bdiv)
////	messagebox('18', is_sperson)
////	messagebox('19', is_sdiv)
////	messagebox('20', is_organcd)
////	messagebox('21', is_designcd)
//
//
////	dw_plist.retrieve(is_build_no, ls_divcd, ls_speccd, ls_project, is_sprog, ld_fixeddate1, ld_fixeddate2, is_dprog, is_cprog, is_city)
//	dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
//	is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
//end if
end event

type st_title from w_inheritance`st_title within w_bdinfo_m1
integer y = 36
integer height = 164
integer textsize = -20
string text = "공사정보 시스템"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_m1
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_m1
boolean visible = false
integer x = 4087
integer y = 64
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_m1
boolean visible = false
integer x = 4233
integer y = 64
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_m1
integer x = 3374
integer taborder = 120
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_m1
boolean visible = false
integer x = 3739
integer y = 64
integer taborder = 130
end type

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_m1
boolean visible = false
integer x = 3927
integer y = 64
integer taborder = 150
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_m1
integer x = 2990
integer taborder = 160
boolean enabled = false
end type

event pb_delete::clicked;//
//string ls_bid_chk, ls_etmt_chk
//long ll_row
//string ls_person
//
//dw_1.accepttext()
//dw_plist.accepttext()
//
////if dw_plist.rowcount() < 1 then
////	if dw_1.rowcount() < 1 then
////		return
////	else
////		if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
////	      return
////      end if	
////		dw_1.deleterow(0)
////		if dw_1.RowCount() >= 1 then
////			dw_plist.retrieve(is_build_no, ls_divcd, ls_speccd, ls_project, is_sprog, ld_fixeddate1, ld_fixeddate2, is_dprog, is_cprog)
////		end if
////		wf_delete1(dw_1,"Y")
////		return
////	end if
////end if
//
////로그인과 담당자가 틀리면 삭제 못함, 또한 담당자가 없어도 삭제 못함 => 담당자만이 삭제할 수 있음
//ls_person = dw_2.object.bdinfodet_person[dw_2.getrow()]
//if ls_person <> gs_personno then 
//	if gs_personno = '1999010s' or gs_personno = 'root' then
//	else
//		messagebox("삭제불가", "담당자만이 삭제할 수 있습니다.")
//		return
//	end if
//end if
//
//if MessageBox("확인",'삭제하시겠습니까? ~n~n#.주의사항: 삭제후 자동 저장 됩니다.',information!, OKCancel!, 2) = 2 then
//	return
//end if	
//
//string ls_delbuildno, ls_delspec_code
//dec ld_delseq
//ls_delbuildno = dw_2.object.bdinfodet_build_no[dw_2.getrow()]
//ld_delseq = dw_2.object.bdinfodet_seq[dw_2.getrow()]
//
//choose case tab_1.selectedtab
//	case 1
//		ll_row = dw_2.GetRow()
//		ls_bid_chk = dw_2.object.bdinfodet_bid_chk[ll_row] 
//		ls_etmt_chk = dw_2.object.bdinfodet_etmt_chk[ll_row] 
//		if ls_bid_chk = '1' or ls_etmt_chk = '1' then  //견적이나 입찰이면
//			dw_2.object.bdinfodet_std_chk[ll_row] = '0'
//			//wf_delete1(dw_2,"Y")
//			if wf_delete1(dw_2,"Y") then
//				delete from bdinfodetprog where build_no = :ls_delbuildno and seq = :ld_delseq;
//				commit;
//			end if
//			
//			if dw_1.RowCount() >= 1 then
//				dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
//				is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
//			end if
//		else
//			dw_2.deleterow(0)
//			//wf_delete1(dw_2,"Y")
//			if wf_delete1(dw_2,"Y") then
//				delete from bdinfodetprog where build_no = :ls_delbuildno and seq = :ld_delseq;
//				delete FROM bdinfodet2_item where build_no = :ls_delbuildno and seq = :ld_delseq;
//				delete FROM bdinfodet2 where build_no = :ls_delbuildno and seq = :ld_delseq;
//				commit;
//			end if
//			dw_plist.retrieve(is_build_no, is_divcd, is_speccd, is_project, is_sprog, id_fixeddate1, id_fixeddate2, is_dprog, is_cprog, is_city, &
//			is_person, is_dperson, is_ddiv, is_cperson, is_cdiv, is_bperson, is_bdiv, is_sperson, is_sdiv, is_organcd, is_designcd)
//			
//		end if
//	case 2
//		if bd_getdw = dw4 then
//			long ll_dw4row
//			ll_dw4row = dw4.getrow()
////			ls_delbuildno = dw4.object.build_no[ll_dw4row]
////			ld_delseq = dw4.object.seq[ll_dw4row]
//			ls_delspec_code = dw4.object.spec_code[ll_dw4row]
//
//			delete FROM bdinfodet2_item   
//			where build_no = :ls_delbuildno
//			and 	seq = :ld_delseq 
//			and	spec_code = :ls_delspec_code;
//			if sqlca.sqlcode = 0 then
//				commit;
//				dw4.deleterow(0)
//				wf_delete1(dw4,"Y")
//			else
//				rollback;
//				messagebox('경고 NO_1', '삭제 오류가 발생 되었습니다.  전산실에 문의 바랍니다.')
//			end if
//		else
//			dw5.deleterow(0)
//			wf_delete1(dw5,"Y")
//		end if
//end choose
//
//
//
end event

type pb_insert from w_inheritance`pb_insert within w_bdinfo_m1
integer x = 2798
integer taborder = 180
boolean enabled = false
end type

event pb_insert::clicked;//decimal ld_seq_no
//long ll_row, ll_dw4row, ll_dw5row
//
////dw_2.Object.bdinfodet_project.TabSequence = 1
//
//if dw_1.RowCount() < 1 then
//	messagebox('확인','먼저 건설정보번호를 입력하세요')
//	return
//end if
//
//choose case tab_1.selectedtab
//	case 1 
//		tab_1.tabpage_2.enabled = false
//		select max(seq) into :ld_seq_no from bdinfodet
//		 where build_no = :is_build_no;
//		if ld_seq_no = 0 or isnull(ld_seq_no) then
//			 ld_seq_no = 1
//		elseif ld_seq_no >= 1 then
//			 ld_seq_no = ld_seq_no + 1
//		end if
//
//		dw_2.reset()
//		dw4.reset()
//		dw5.reset()
//		ll_row = dw_2.insertrow(0)
//		
//		//ls_build_no = dw_1.getitemstring(dw_1.GetRow(),"build_no")
//		dw_2.object.bdinfodet_build_no[ll_row] = is_build_no  //ls_build_no 
//		dw_2.object.bdinfodet_seq[ll_row] = ld_seq_no 
//		dw_2.object.bdinfodet_person[ll_row] = gs_personno
//		dw_2.object.bdinfodet_div[ll_row] = gs_divcode
//		dw_2.object.bdinfodet_makedate[ll_row] =  today()
//		dw_2.object.bdinfodet_floors[ll_row] =  '0/0'
//		dw_2.scrolltorow(ll_row)
//		dw_2.setcolumn('bdinfodet_project')
//		dw_2.setfocus()
//	case 2
//		if bd_getdw = dw4 then
//			string ls_build_no
//			long ll_seq, ll_dw4setrow
//			dw_2.accepttext()
//			dw4.accepttext()
//			ll_dw4row = dw4.insertrow(0)
//			dw4.object.build_no[ll_dw4row] = dw_2.object.bdinfodet_build_no[1]
//			dw4.object.seq[ll_dw4row] = dw_2.object.bdinfodet_seq[1]
//			ls_build_no = dw_2.object.bdinfodet_build_no[1]
//			ll_seq = dw_2.object.bdinfodet_seq[1]
//			dw4.scrolltorow(ll_dw4row)
//			dw5.reset()
//			select isnull(seq_no,0) into :ll_dw4setrow from bdinfodet2
//			where build_no = :ls_build_no
//			and   seq = :ll_seq;
//			if isnull(ll_dw4setrow) or ll_dw4setrow = 0 then
//				ll_dw4setrow = 1
//			else
//				ll_dw4setrow = ll_dw4setrow + 1
//			end if
//			dw4.object.seq_no[ll_dw4row] = ll_dw4setrow
//			if ll_dw4row > 1 then
//				if dw4.object.seq_no[ll_dw4row - 1] = dw4.object.seq_no[ll_dw4row] then
//					dw4.deleterow(ll_dw4row)
//					messagebox('확인', '자재코드는 1줄씩 입력하고 저장하세요.')
//					return
//				end if
//			end if
//			dw4.setcolumn('spec_code')
//			dw4.setfocus()
//		else
//			if dw4.getrow() >= 1 then
//				dw4.accepttext()
//				ll_dw5row = dw5.insertrow(0)
//				dw5.object.build_no[ll_dw5row] = dw_2.object.bdinfodet_build_no[1]
//				dw5.object.seq[ll_dw5row] = dw_2.object.bdinfodet_seq[1]
//				dw5.object.spec_code[ll_dw5row] = dw4.object.spec_code[dw4.getrow()]
//				dw5.scrolltorow(ll_dw5row)
//				dw5.setcolumn('input_ym')
//				dw5.setfocus()
//			end if
//		end if		
//end choose
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_m1
integer x = 2414
integer taborder = 170
end type

event pb_retrieve::clicked;dw_2.retrieve()
//
//openwithparm(w_bdinfo_w1, ist_where)
//ist_where = Message.PowerObjectParm
//
//if ist_where.okflag = true then
//	is_person = ist_where.str1
////	is_person = gs_userid
//	is_divcd = ist_where.str2 
//	is_speccd = ist_where.str3 
////	is_speccd = '003'
//	is_project = ist_where.str4
//	is_sprog = ist_where.str5
//	is_dprog = ist_where.str6
//	is_cprog = ist_where.str7
//	is_city = ist_where.str8
//	is_organcd = ist_where.str9
//	is_designcd = ist_where.str10
//	is_divcls = ist_where.str16
//	is_percls = ist_where.str17
//	is_expcls = ist_where.str18
//	if is_project = '' then 
//		is_project = '%'
//	else
//		is_project = '%' + is_project + '%'
//	end if
//	id_fixeddate1 = date(ist_where.sdate1)
//	id_fixeddate2 = date(ist_where.sdate2)
//	id_expdate1 = date(ist_where.sdate3)
//	id_expdate2 = date(ist_where.sdate4)
//	
//	wf_getmakecls()
//
//	dw_1.reset()
//	dw_1.retrieve()
//else
//	is_speccd = '꽝'
//	dw_1.retrieve()
//	return
//end if
//
//
end event

type gb_3 from w_inheritance`gb_3 within w_bdinfo_m1
string tag = "736"
integer x = 32
integer y = 808
integer width = 4421
integer height = 1964
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_m1
integer y = 248
integer width = 4430
integer height = 556
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_m1
integer x = 2373
integer width = 1216
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_m1
integer x = 50
integer y = 848
integer width = 4384
integer height = 1904
integer taborder = 60
string dataobject = "d_bdlist_1_s"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rbuttondown;//string ls_date
//
//CHOOSE CASE dwo.Name
//	case 'bdinfodet_fixeddate'
//		openWithParm(w_calendar, ls_date)
//		ls_date = message.stringparm
//		if ls_date <> 'N' then
//			this.object.bdinfodet_fixeddate[row] = datetime(date(ls_date))
//		end if
//	case 'bdinfodet_predate'
//		openWithParm(w_calendar, ls_date)
//		ls_date = message.stringparm
//		if ls_date <> 'N' then
//			this.object.bdinfodet_predate[row] = datetime(date(ls_date))
//		end if
//	case 'bdinfodet_completiondate'
//		openWithParm(w_calendar, ls_date)
//		ls_date = message.stringparm
//		if ls_date <> 'N' then
//			this.object.bdinfodet_completiondate[row] = datetime(date(ls_date))
//		end if
//	case 'bdinfodet_makedate' 
//		openWithParm(w_calendar, ls_date)
//		ls_date = message.stringparm
//		if ls_date <> 'N' then
//			this.object.bdinfodet_makedate[row] = datetime(date(ls_date))
//		end if
//	case 'bdinfodet_dexpdate' 
//		openWithParm(w_calendar, ls_date)
//		ls_date = message.stringparm
//		if ls_date <> 'N' then
//			this.object.bdinfodet_dexpdate[row] = datetime(date(ls_date))
//		end if
//	case 'bdinfodet_cexpdate' 
//		openWithParm(w_calendar, ls_date)
//		ls_date = message.stringparm
//		if ls_date <> 'N' then
//			this.object.bdinfodet_cexpdate[row] = datetime(date(ls_date))
//		end if
//	case 'bdinfodet_bexpdate' 
//		openWithParm(w_calendar, ls_date)
//		ls_date = message.stringparm
//		if ls_date <> 'N' then
//			this.object.bdinfodet_bexpdate[row] = datetime(date(ls_date))
//		end if
//	case 'bdinfodet_sexpdate' 
//		openWithParm(w_calendar, ls_date)
//		ls_date = message.stringparm
//		if ls_date <> 'N' then
//			this.object.bdinfodet_sexpdate[row] = datetime(date(ls_date))
//		end if
//end choose
//
//
//	
end event

event dw_2::keydown;call super::keydown;//if key = KeyEnter! then
//	Send(Handle(this),256,9,Long(0,0))
//end if
end event

event dw_2::doubleclicked;call super::doubleclicked;choose case dwo.name
	case 'designoffice_c'
//		messagebox('알림', '공사중')
//		return
		if dw_2.getrow() > 0 then
			gs_winname = 'w_bdinfo_m1'
			gs_var1 = dw_2.object.bdinfodet_project[dw_2.getrow()]
			IF IsValid(w_bdinfo_m_design) = TRUE THEN close(w_bdinfo_m_design)
			openwithparm(w_bdinfo_m_design, ist_where)
		end if
	case 'buildingcom_c'
			messagebox('알림', '공사중')
			return
//		if dw_2.getrow() > 0 then
//			gs_winname = 'w_bdinfo_m1'
//			gs_var1 = dw_2.object.bdinfodet_project[dw_2.getrow()]
//			IF IsValid(w_bdinfo_m_con) = TRUE THEN close(w_bdinfo_m_con)
//			openwithparm(w_bdinfo_m_con, ist_where)
//		end if
	case 'builder_c'
		if dw_2.getrow() > 0 then
			gs_winname = 'w_bdinfo_m1'
			gs_var1 = dw_2.object.bdinfodet_project[dw_2.getrow()]
			IF IsValid(w_bdinfo_m_sale) = TRUE THEN close(w_bdinfo_m_sale)
			openwithparm(w_bdinfo_m_sale2, ist_where)
		end if
	case else
		if dw_2.getrow() > 0 then
			gs_winname = 'w_bdinfo_m1'
			gl_var1 = dw_2.object.bdinfodet_seq[dw_2.getrow()]
			IF IsValid(w_bdinfo_m1_base2) = TRUE THEN close(w_bdinfo_m1_base2)
			openwithparm(w_bdinfo_m1_base2, ist_where)
			gl_var1 = 0
		end if
		
end choose
pb_retrieve.triggerevent( clicked! )
end event

event dw_2::clicked;call super::clicked;this.ScrollToRow(row)
end event

type pb_insert2 from picturebutton within w_bdinfo_m1
boolean visible = false
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

type pb_delete2 from picturebutton within w_bdinfo_m1
boolean visible = false
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

type pb_print3 from picturebutton within w_bdinfo_m1
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
boolean enabled = false
string picturename = "c:\bmp\print.bmp"
alignment htextalign = left!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"프로젝트별 공사정보진행현황",parent, li_x, li_y)


end event

event clicked;//w_repsuper w_print
//st_print l_print
//date ld_start, ld_end
//string ls_cust_no, ls_specname
//
//string ls_agbuildno
//decimal ld_agseq
//ls_agbuildno = dw_2.object.bdinfodet_build_no[dw_2.getrow()]
//ld_agseq = dw_2.object.bdinfodet_seq[dw_2.getrow()]
//
//dw_print5.retrieve( ls_agbuildno, ld_agseq )
//
//if dw_print5.rowcount() < 1 then
//	messagebox("확인", "출력할 데이터가 없습니다")
//	return
//end if
//
////SELECT spec_name  into :ls_specname
////    FROM bdspec 
////	 where spec_code = :ls_speccd;
////
//l_print.st_datawindow = dw_print5
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 건설정보진행현황을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
////if isnull(ld_fixeddate1) then
////	w_print.dw_1.object.t_start.text = "전체"
////	w_print.dw_1.object.t_end.text = "전체"
////else
////	w_print.dw_1.object.t_start.text = string(ld_fixeddate1, 'YYYY/MM/DD')
////	w_print.dw_1.object.t_end.text = string(RelativeDate(ld_fixeddate2, -1), 'YYYY/MM/DD')
////end if
////if trim(ls_specname) = '' or isnull(ls_specname) or ls_specname = '%' then
////	w_print.dw_1.object.t_spec.text = ""
////else
////	w_print.dw_1.object.t_spec.text = "(" + string(ls_specname) + ")"
////end if
//	
//
end event

type st_1 from statictext within w_bdinfo_m1
integer x = 160
integer y = 356
integer width = 571
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "신규 현장 등록"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_2 from statictext within w_bdinfo_m1
integer x = 160
integer y = 460
integer width = 677
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "화면 표시내용 설정"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_3 from statictext within w_bdinfo_m1
integer x = 160
integer y = 564
integer width = 677
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "정렬"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_4 from statictext within w_bdinfo_m1
integer x = 160
integer y = 668
integer width = 677
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "검색(세부조건)"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_bdinfo_m1
integer x = 1175
integer y = 356
integer width = 571
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "Click"
end type

event clicked;//open(w_bdinfo_w_2)
//pb_retrieve.triggerevent( clicked! )

gs_winname = 'w_bdinfo_m1'
gs_var1 = ''
IF IsValid(w_bdinfo_m1_base) = TRUE THEN close(w_bdinfo_m1_base)
openwithparm(w_bdinfo_m1_base, ist_where)
mgr_id2.SetTransObject(SQLCA)
mgr_id2.retrieve()
mgr_id3.SetTransObject(SQLCA)
mgr_id3.retrieve()
mgr_id4.SetTransObject(SQLCA)
mgr_id4.retrieve()
pb_retrieve.triggerevent( clicked! )

end event

type cb_2 from commandbutton within w_bdinfo_m1
integer x = 1175
integer y = 460
integer width = 571
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "Click"
end type

event clicked;openwithparm(w_bdinfo_w_1, is_ble)
is_ble = Message.PowerObjectParm
if is_ble.okflag = false then return
dw_1.setredraw(false)
/*
with="901" 	bdinfodet_project 			
width="553"	bd_positon					 
width="384" bdinfodet_square  			
width="507"	bdinfodet_master 				
width="517"	bdinfodet_buildingcom		
width="498"	bdinfodet_builder				
width="599"	bdinfodet_makedate 			
width="507"	bdinfodet_designoffice 		
width="302"	bdinfodet_floors 				
width="347"	bdinfodet_constructiondate 
width="334"	bdinfodet_completiondate 	
width="654"	bdinfodet_build_prog 		
width="526"	bdinfodet_builderman 		
width="690"	bdinfodet_builderphone 		
width="581"	bdinfodet_person 				
width="1047	bdinfodet_rem 					
*/

if is_ble.ble1[1] = true then 
	dw_2.object.bdinfodet_makedate.width = 599
else
	dw_2.object.bdinfodet_makedate.width = 0
end if

if is_ble.ble1[2] = true then 
	dw_2.object.bdinfodet_buildingcom.width = 517
else
	dw_2.object.bdinfodet_buildingcom.width = 0
end if

if is_ble.ble1[3] = true then 
	dw_2.object.bdinfodet_constructiondate.width = 347
else
	dw_2.object.bdinfodet_constructiondate.width = 0
end if

if is_ble.ble1[4] = true then 
	dw_2.object.bdinfodet_build_prog.width = 654
else
	dw_2.object.bdinfodet_build_prog.width = 0
end if

if is_ble.ble1[5] = true then 
	dw_2.object.bdinfodet_rem.width = 1047
else
	dw_2.object.bdinfodet_rem.width = 0
end if

if is_ble.ble1[6] = true then 
	dw_2.object.bdinfodet_project.width = 901
else
	dw_2.object.bdinfodet_project.width = 0
end if

if is_ble.ble1[7] = true then 
	dw_2.object.bd_positon.width = 553
else
	dw_2.object.bd_positon.width = 0
end if

if is_ble.ble1[8] = true then 
	dw_2.object.bdinfodet_completiondate.width = 334
else
	dw_2.object.bdinfodet_completiondate.width = 0
end if

if is_ble.ble1[9] = true then 
	dw_2.object.bdinfodet_builderman.width = 526
else
	dw_2.object.bdinfodet_builderman.width = 0
end if

if is_ble.ble1[10] = true then 
	dw_2.object.bdinfodet_master.width = 507
else
	dw_2.object.bdinfodet_master.width = 0
end if

if is_ble.ble1[11] = true then 
	dw_2.object.bdinfodet_floors.width = 302
else
	dw_2.object.bdinfodet_floors.width = 0
end if

if is_ble.ble1[12] = true then //진행상황
	dw_2.object.designoffice_c.width = 137
	dw_2.object.buildingcom_c.width = 137
	dw_2.object.builder_c.width = 137
else
	dw_2.object.designoffice_c.width = 0
	dw_2.object.buildingcom_c.width = 0
	dw_2.object.builder_c.width = 0
end if

if is_ble.ble1[13] = true then 
	dw_2.object.bdinfodet_builderphone.width = 690
else
	dw_2.object.bdinfodet_builderphone.width = 0
end if

if is_ble.ble1[14] = true then 
	dw_2.object.bdinfodet_designoffice.width = 507
else
	dw_2.object.bdinfodet_designoffice.width = 0
end if

if is_ble.ble1[15] = true then 
	dw_2.object.bdinfodet_square.width = 384
else
	dw_2.object.bdinfodet_square.width = 0
end if

if is_ble.ble1[16] = true then 
	dw_2.object.bdinfodet_builder.width = 498
else
	dw_2.object.bdinfodet_builder.width = 0
end if

if is_ble.ble1[17] = true then 
	dw_2.object.bdinfodet_person.width = 581
else
	dw_2.object.bdinfodet_person.width = 0
end if
dw_1.setredraw(true)
pb_retrieve.triggerevent(clicked!)

/*
최초등록일 	bdinfodet_makedate
현장명(공사명) 	bdinfodet_project
발주처(건축주) 	bdinfodet_master
설계사(설계회사) bdinfodet_designoffice
건설사 		bdinfodet_buildingcom
지역		bd_positon = (  SELECT city_name FROM bdcity where city_code = bdinfodet.city ) + bdinfodet.dong
층수 		bdinfodet_floors
건축면적 	bdinfodet_square
착공일 		bdinfodet_constructiondate
준공일 		bdinfodet_completiondate
진행상황 
하도업체 	bdinfodet_builder
하도업체 진행상황 bdinfodet_build_prog
하도업체 담당자 bdinfodet_builderman
하도업체 담당자 연락처 	bdinfodet_builderphone
담당영업사원(유창) 	bdinfodet_person
기타입력내용 		bdinfodet_rem

dw_2.object.bdinfodet_makedate.width = 0
dw_2.object.bdinfodet_designoffice.width = 0
dw_2.object.bdinfodet_floors.width = 0
dw_2.object.bdinfodet_constructiondate.width = 0
dw_2.object.bdinfodet_completiondate.width = 0
dw_2.object.bdinfodet_build_prog.width = 0
dw_2.object.bdinfodet_builderman.width = 0
dw_2.object.bdinfodet_builderphone.width = 0
dw_2.object.bdinfodet_person.width = 0
dw_2.object.bdinfodet_rem.width = 0
*/
end event

type cb_3 from commandbutton within w_bdinfo_m1
integer x = 1175
integer y = 668
integer width = 571
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "Click"
end type

event clicked;openwithparm(w_bdinfo_w_3, is_ble)
is_ble = Message.PowerObjectParm
if is_ble.okflag = false then
	dw_2.setfilter("")
	dw_2.filter()
	return
end if
//messagebox('결과', is_ble.str1)
dw_2.setfilter( is_ble.str1 )
dw_2.filter()
pb_retrieve.triggerevent(clicked!)

end event

