$PBExportHeader$w_bdinfo_m1_base2.srw
forward
global type w_bdinfo_m1_base2 from w_inheritance
end type
type pb_insert2 from picturebutton within w_bdinfo_m1_base2
end type
type pb_delete2 from picturebutton within w_bdinfo_m1_base2
end type
type pb_print3 from picturebutton within w_bdinfo_m1_base2
end type
type dw_3 from datawindow within w_bdinfo_m1_base2
end type
type dw_4 from datawindow within w_bdinfo_m1_base2
end type
type gb_4 from gb_2 within w_bdinfo_m1_base2
end type
end forward

global type w_bdinfo_m1_base2 from w_inheritance
integer width = 3941
integer height = 2512
string title = "기초입력정보(w_bdinfo_m1_base2)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
pb_insert2 pb_insert2
pb_delete2 pb_delete2
pb_print3 pb_print3
dw_3 dw_3
dw_4 dw_4
gb_4 gb_4
end type
global w_bdinfo_m1_base2 w_bdinfo_m1_base2

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
DataWindowChild mgr_id2,mgr_id3,mgr_id4,mgr_id5
gs_whcustret_str ist_whcustret
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

on w_bdinfo_m1_base2.create
int iCurrent
call super::create
this.pb_insert2=create pb_insert2
this.pb_delete2=create pb_delete2
this.pb_print3=create pb_print3
this.dw_3=create dw_3
this.dw_4=create dw_4
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_insert2
this.Control[iCurrent+2]=this.pb_delete2
this.Control[iCurrent+3]=this.pb_print3
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.gb_4
end on

on w_bdinfo_m1_base2.destroy
call super::destroy
destroy(this.pb_insert2)
destroy(this.pb_delete2)
destroy(this.pb_print3)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.gb_4)
end on

event open;call super::open;dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_2.GetChild ("bdinfodet_master", mgr_id2)
mgr_id2.SetTransObject (SQLCA)

dw_2.GetChild ("bdinfodet_buildingcom", mgr_id3)
mgr_id3.SetTransObject (SQLCA)

dw_2.GetChild ("bdinfodet_designoffice", mgr_id4)
mgr_id4.SetTransObject (SQLCA)

//dw_2.GetChild ("bdinfodet_designoffice", mgr_id5)
//mgr_id5.SetTransObject (SQLCA)
//mgr_id.Retrieve ( )



if gs_winname = 'w_bdinfo_m1' and gl_var1 <> 0 then
//	gs_winname = ''
	pb_retrieve.triggerevent(clicked!)
//	cb_wf_ret.postevent(clicked!)
//	wf_ret(trim(gs_var1))
//	if dw_plist.getrow() > 0 then
//		dw_plist.scrolltorow(1)
//	end if
	gl_var1 = 0
else
	pb_insert.triggerevent(clicked!)
end if
//pb_retrieve.triggerevent(clicked!)

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

type pb_save from w_inheritance`pb_save within w_bdinfo_m1_base2
integer x = 3461
boolean enabled = false
end type

event pb_save::clicked;		dw_2.accepttext()

		if dw_2.rowcount() > 0 then
			string ls_nullvalue
			ls_nullvalue = dw_2.object.bdinfodet_project[dw_2.getrow()]
			if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
				messagebox('확인','프로젝트명을 입력하세요.')
				dw_2.setcolumn('bdinfodet_project')
				dw_2.setfocus()
				return
			else
				wf_update1(dw_2,"Y") 
			end if
		end if

//string ls_nullvalue, ls_existvalue
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

type dw_1 from w_inheritance`dw_1 within w_bdinfo_m1_base2
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

type st_title from w_inheritance`st_title within w_bdinfo_m1_base2
integer y = 36
integer width = 1189
integer height = 164
integer textsize = -20
string text = "기초 입력 정보"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_m1_base2
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_m1_base2
boolean visible = false
integer x = 4087
integer y = 64
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_m1_base2
boolean visible = false
integer x = 4233
integer y = 64
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_m1_base2
integer x = 3653
integer taborder = 120
boolean cancel = true
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_m1_base2
boolean visible = false
integer x = 3739
integer y = 64
integer taborder = 130
end type

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_m1_base2
boolean visible = false
integer x = 3927
integer y = 64
integer taborder = 150
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_m1_base2
integer x = 3269
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

type pb_insert from w_inheritance`pb_insert within w_bdinfo_m1_base2
integer x = 3077
integer taborder = 180
boolean enabled = false
end type

event pb_insert::clicked;integer li_dw_2row
dw_2.reset()
li_dw_2row = dw_2.insertrow(0)
dw_2.object.bdinfodet_makedate[li_dw_2row] =  gf_today() //gdt_today
//decimal ld_seq_no
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

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_m1_base2
integer x = 2885
integer taborder = 170
boolean enabled = false
end type

event pb_retrieve::clicked;
dw_2.retrieve(gl_var1)
dw_3.retrieve(gl_var1)
dw_3.object.builder.protect = 1
dw_3.object.builderman.protect = 1
dw_3.object.builderphone.protect = 1
dw_3.object.person.protect = 1
dw_4.object.seq_no.protect = 1
dw_4.object.i_date.protect = 1
dw_4.object.rem.protect = 1

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

type gb_3 from w_inheritance`gb_3 within w_bdinfo_m1_base2
string tag = "736"
integer x = 32
integer y = 244
integer width = 3831
integer height = 1072
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_m1_base2
integer y = 1312
integer width = 3835
integer height = 512
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_m1_base2
integer x = 2857
integer width = 1010
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_m1_base2
integer x = 50
integer width = 3790
integer height = 992
integer taborder = 60
boolean enabled = false
string dataobject = "d_bdlist_1_s_new"
boolean vscrollbar = false
boolean livescroll = false
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

event dw_2::doubleclicked;call super::doubleclicked;//choose case dwo.name
//	case 'designoffice_c'
//		if dw_2.getrow() > 0 then
//			gs_winname = 'w_bdinfo_m1'
//			gs_var1 = dw_2.object.bdinfodet_project[dw_2.getrow()]
//			IF IsValid(w_bdinfo_m_design) = TRUE THEN close(w_bdinfo_m_design)
//			openwithparm(w_bdinfo_m_design, ist_where)
//		end if
//	case 'buildingcom_c'
//		if dw_2.getrow() > 0 then
//			gs_winname = 'w_bdinfo_m1'
//			gs_var1 = dw_2.object.bdinfodet_project[dw_2.getrow()]
//			IF IsValid(w_bdinfo_m_con) = TRUE THEN close(w_bdinfo_m_con)
//			openwithparm(w_bdinfo_m_con, ist_where)
//		end if
//	case 'builder_c'
//		if dw_2.getrow() > 0 then
//			gs_winname = 'w_bdinfo_m1'
//			gs_var1 = dw_2.object.bdinfodet_project[dw_2.getrow()]
//			IF IsValid(w_bdinfo_m_sale) = TRUE THEN close(w_bdinfo_m_sale)
//			openwithparm(w_bdinfo_m_sale, ist_where)
//		end if
//end choose
//
end event

event dw_2::clicked;call super::clicked;integer li_dw_2row
li_dw_2row = this.getrow()
choose case dwo.name
	case "b_1"
		openwithparm(w_bdinfo_w_2,ist_where)
		ist_where = Message.PowerObjectParm
		if ist_where.okflag = true then
//			this.object.bdinfodet_build_no[li_dw_2row] = ist_where.str2
			this.object.bdinfodet_seq[li_dw_2row] = ist_where.dec1
//			this.object.bdinfodet_project[li_dw_2row] = ist_where.str1
			dw_2.retrieve(ist_where.dec1)
		end if
		
	case "b_2"
		openwithparm(w_bdinfo_w_s2,ist_where)
		ist_where = Message.PowerObjectParm
		if ist_where.okflag = true then
			mgr_id2.SetTransObject(SQLCA)
			mgr_id2.retrieve()
			mgr_id2.insertrow(1)
			mgr_id2.setitem(1,'comcode',ist_where.str1)
			mgr_id2.setitem(1,'comname',ist_where.str2)
//			mgr_id2.accepttext()
			this.object.bdinfodet_master[li_dw_2row] = ist_where.str1
		end if
		
	case "b_3"
		openwithparm(w_bdinfo_w_s3,ist_where)
		ist_where = Message.PowerObjectParm
		if ist_where.okflag = true then
			mgr_id3.SetTransObject (SQLCA)
			mgr_id3.retrieve()
			mgr_id3.insertrow(1)
			mgr_id3.setitem(1,'comcode',ist_where.str1)
			mgr_id3.setitem(1,'comname',ist_where.str2)
//			mgr_id3.accepttext()
			this.object.bdinfodet_buildingcom[li_dw_2row] = ist_where.str1
		end if
		
	case "b_4"
		openwithparm(w_bdinfo_w_s4,ist_where)
		ist_where = Message.PowerObjectParm
		if ist_where.okflag = true then
			mgr_id4.SetTransObject (SQLCA)
			
//			mgr_id.Retrieve()
//			this.object.bdinfodet_designoffice[li_dw_2row] = ist_where.str1
//			mgr_id.insertrow(1)
//			mgr_id.object.comcode[1] = ist_where.str1
//			mgr_id.object.comcode[1] = ist_where.str2
			
//			dw_1.settransobject(sqlca)
//			dw_1.insertrow(0)
//			dw_1.getchild('person_no',ldwc_person)
//			ldwc_person.insertrow(1)
//			ldwc_person.setitem(1,'person_no','%')
//			ldwc_person.setitem(1,'kor_name','전체')
//			ldwc_person.accepttext()
			mgr_id4.retrieve()
			mgr_id4.insertrow(1)
			mgr_id4.setitem(1,'comcode',ist_where.str1)
			mgr_id4.setitem(1,'comname',ist_where.str2)
//			mgr_id4.accepttext()
			this.object.bdinfodet_designoffice[li_dw_2row] = ist_where.str1
		end if
		
//	case "b_5"
//		openwithparm(w_bdinfo_w_s5,ist_where)
//		ist_where = Message.PowerObjectParm
//		if ist_where.okflag = true then
//			mgr_id5.insertrow(1)
//			mgr_id5.setitem(1,'comcode',ist_where.str1)
//			mgr_id5.setitem(1,'comname',ist_where.str2)
//			mgr_id5.accepttext()
//			this.object.bdinfodet_builder[li_dw_2row] = ist_where.str1
//		end if
		
	case else
end choose
		
	
end event

type pb_insert2 from picturebutton within w_bdinfo_m1_base2
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

type pb_delete2 from picturebutton within w_bdinfo_m1_base2
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

type pb_print3 from picturebutton within w_bdinfo_m1_base2
event mousemove pbm_mousemove
boolean visible = false
integer x = 1509
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

type dw_3 from datawindow within w_bdinfo_m1_base2
integer x = 50
integer y = 1364
integer width = 3790
integer height = 432
integer taborder = 200
boolean bringtotop = true
string title = "none"
string dataobject = "d_bdlist_1_s_new_sale"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_seq
string ls_builder
ll_seq = this.object.seq[currentrow]
ls_builder = this.object.builder[currentrow]
dw_4.retrieve(ll_seq, ls_builder)
end event

event clicked;long ll_seq
string ls_builder
if row < 1 then return
ll_seq = this.object.seq[row]
ls_builder = this.object.builder[row]
this.ScrollToRow(row)
dw_4.retrieve(ll_seq, ls_builder)
end event

type dw_4 from datawindow within w_bdinfo_m1_base2
integer x = 50
integer y = 1888
integer width = 3790
integer height = 432
integer taborder = 210
boolean bringtotop = true
string title = "none"
string dataobject = "d_bdlist_1_s_new_sale2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;this.ScrollToRow(row)
end event

type gb_4 from gb_2 within w_bdinfo_m1_base2
integer y = 1840
integer taborder = 110
end type

