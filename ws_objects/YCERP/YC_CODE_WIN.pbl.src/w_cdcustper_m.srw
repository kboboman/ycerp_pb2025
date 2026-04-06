$PBExportHeader$w_cdcustper_m.srw
$PBExportComments$고객정보관리(98/04/23,이인호)
forward
global type w_cdcustper_m from w_inheritance
end type
type tab_1 from tab within w_cdcustper_m
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
cb_1 cb_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type pb_1 from picturebutton within tabpage_2
end type
type pb_2 from picturebutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
pb_1 pb_1
pb_2 pb_2
end type
type tabpage_3 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_3
end type
type pb_3 from picturebutton within tabpage_3
end type
type pb_4 from picturebutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_5 dw_5
pb_3 pb_3
pb_4 pb_4
end type
type tabpage_4 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_4
end type
type pb_5 from picturebutton within tabpage_4
end type
type pb_6 from picturebutton within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_6 dw_6
pb_5 pb_5
pb_6 pb_6
end type
type tabpage_5 from userobject within tab_1
end type
type dw_7 from datawindow within tabpage_5
end type
type pb_7 from picturebutton within tabpage_5
end type
type pb_8 from picturebutton within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_7 dw_7
pb_7 pb_7
pb_8 pb_8
end type
type tabpage_6 from userobject within tab_1
end type
type dw_8 from datawindow within tabpage_6
end type
type pb_9 from picturebutton within tabpage_6
end type
type pb_10 from picturebutton within tabpage_6
end type
type tabpage_6 from userobject within tab_1
dw_8 dw_8
pb_9 pb_9
pb_10 pb_10
end type
type tabpage_7 from userobject within tab_1
end type
type ddlb_1 from dropdownlistbox within tabpage_7
end type
type st_2 from statictext within tabpage_7
end type
type dw_9 from datawindow within tabpage_7
end type
type st_1 from statictext within tabpage_7
end type
type pb_print2 from picturebutton within tabpage_7
end type
type pb_ret2 from picturebutton within tabpage_7
end type
type tabpage_7 from userobject within tab_1
ddlb_1 ddlb_1
st_2 st_2
dw_9 dw_9
st_1 st_1
pb_print2 pb_print2
pb_ret2 pb_ret2
end type
type tab_1 from tab within w_cdcustper_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
type cb_2 from commandbutton within w_cdcustper_m
end type
type cb_3 from commandbutton within w_cdcustper_m
end type
end forward

global type w_cdcustper_m from w_inheritance
integer width = 4773
integer height = 2384
string title = "고객정보 관리(w_cdcustper_m)"
long backcolor = 78160032
tab_1 tab_1
cb_2 cb_2
cb_3 cb_3
end type
global w_cdcustper_m w_cdcustper_m

type variables
st_print i_print
integer ii_idno
string is_dw2sql, is_dw1sql
long il_row
datawindowchild idwc_cust
datawindowchild idwc_cust_name
boolean ib_check = true, ib_ncheck = true
datawindow dw3, dw4, dw5, dw6, dw7, dw8,dw9
end variables

forward prototypes
public subroutine wf_custper_insert ()
end prototypes

public subroutine wf_custper_insert ();//가족
if tab_1.tabpage_2.dw_4.rowcount() > 0 then
 dw_2.object.fam1a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[1]
 dw_2.object.fam1b[1] = tab_1.tabpage_2.dw_4.object.fam_name[1]
 dw_2.object.fam1c[1] = tab_1.tabpage_2.dw_4.object.fam_id[1]
 dw_2.object.fam1d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[1]
 dw_2.object.fam1e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[1])
 dw_2.object.fam1f[1] = tab_1.tabpage_2.dw_4.object.fam_job[1]
 dw_2.object.fam1g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[1]
 dw_2.object.fam1h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[1]
 dw_2.object.fam1i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[1]
 dw_2.object.fam1j[1] = tab_1.tabpage_2.dw_4.object.fam_school[1]
 dw_2.object.fam1k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[1]
 dw_2.object.fam1l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[1],'YYYY/MM/DD')
end if
	if tab_1.tabpage_2.dw_4.rowcount() > 1 then

 dw_2.object.fam2a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[2]
 dw_2.object.fam2b[1] = tab_1.tabpage_2.dw_4.object.fam_name[2]
 dw_2.object.fam2c[1] = tab_1.tabpage_2.dw_4.object.fam_id[2]
 dw_2.object.fam2d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[2]
 dw_2.object.fam2e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[2])
 dw_2.object.fam2f[1] = tab_1.tabpage_2.dw_4.object.fam_job[2]
 dw_2.object.fam2g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[2]
 dw_2.object.fam2h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[2]
 dw_2.object.fam2i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[2]
 dw_2.object.fam2j[1] = tab_1.tabpage_2.dw_4.object.fam_school[2]
 dw_2.object.fam2k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[2]
 dw_2.object.fam2l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[2],'YYYY/MM/DD')
end if 
	if tab_1.tabpage_2.dw_4.rowcount() > 2 then

 dw_2.object.fam3a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[3]
 dw_2.object.fam3b[1] = tab_1.tabpage_2.dw_4.object.fam_name[3]
 dw_2.object.fam3c[1] = tab_1.tabpage_2.dw_4.object.fam_id[3]
 dw_2.object.fam3d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[3]
 dw_2.object.fam3e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[3])
 dw_2.object.fam3f[1] = tab_1.tabpage_2.dw_4.object.fam_job[3]
 dw_2.object.fam3g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[3]
 dw_2.object.fam3h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[3]
 dw_2.object.fam3i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[3]
 dw_2.object.fam3j[1] = tab_1.tabpage_2.dw_4.object.fam_school[3]
 dw_2.object.fam3k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[3]
 dw_2.object.fam3l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[3],'YYYY/MM/DD')
end if 
	if tab_1.tabpage_2.dw_4.rowcount() > 3 then

 dw_2.object.fam4a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[4]
 dw_2.object.fam4b[1] = tab_1.tabpage_2.dw_4.object.fam_name[4]
 dw_2.object.fam4c[1] = tab_1.tabpage_2.dw_4.object.fam_id[4]
 dw_2.object.fam4d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[4]
 dw_2.object.fam4e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[4])
 dw_2.object.fam4f[1] = tab_1.tabpage_2.dw_4.object.fam_job[4]
 dw_2.object.fam4g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[4]
 dw_2.object.fam4h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[4]
 dw_2.object.fam4i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[4]
 dw_2.object.fam4j[1] = tab_1.tabpage_2.dw_4.object.fam_school[4]
 dw_2.object.fam4k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[4]
 dw_2.object.fam4l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[4],'YYYY/MM/DD')
end if 
	if tab_1.tabpage_2.dw_4.rowcount() > 4 then

 dw_2.object.fam5a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[5]
 dw_2.object.fam5b[1] = tab_1.tabpage_2.dw_4.object.fam_name[5]
 dw_2.object.fam5c[1] = tab_1.tabpage_2.dw_4.object.fam_id[5]
 dw_2.object.fam5d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[5]
 dw_2.object.fam5e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[5])
 dw_2.object.fam5f[1] = tab_1.tabpage_2.dw_4.object.fam_job[5]
 dw_2.object.fam5g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[5]
 dw_2.object.fam5h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[5]
 dw_2.object.fam5i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[5]
 dw_2.object.fam5j[1] = tab_1.tabpage_2.dw_4.object.fam_school[5]
 dw_2.object.fam5k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[5]
 dw_2.object.fam5l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[5],'YYYY/MM/DD')
end if
//학력
if tab_1.tabpage_3.dw_5.rowcount() > 0 then
 dw_2.object.sch1a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[1],'YYYY/MM/DD')
 dw_2.object.sch1b[1] = tab_1.tabpage_3.dw_5.object.shname[1]
 dw_2.object.sch1c[1] = tab_1.tabpage_3.dw_5.object.major[1]
 dw_2.object.sch1d[1] = tab_1.tabpage_3.dw_5.object.hak[1]
 dw_2.object.sch1e[1] = tab_1.tabpage_3.dw_5.object.rem[1]
end if 
	if tab_1.tabpage_3.dw_5.rowcount() > 1 then

 dw_2.object.sch2a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[2],'YYYY/MM/DD')
 dw_2.object.sch2b[1] = tab_1.tabpage_3.dw_5.object.shname[2]
 dw_2.object.sch2c[1] = tab_1.tabpage_3.dw_5.object.major[2]
 dw_2.object.sch2d[1] = tab_1.tabpage_3.dw_5.object.hak[2]
 dw_2.object.sch2e[1] = tab_1.tabpage_3.dw_5.object.rem[2]
end if 
	if tab_1.tabpage_3.dw_5.rowcount() > 2 then

 dw_2.object.sch3a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[3],'YYYY/MM/DD')
 dw_2.object.sch3b[1] = tab_1.tabpage_3.dw_5.object.shname[3]
 dw_2.object.sch3c[1] = tab_1.tabpage_3.dw_5.object.major[3]
 dw_2.object.sch3d[1] = tab_1.tabpage_3.dw_5.object.hak[3]
 dw_2.object.sch3e[1] = tab_1.tabpage_3.dw_5.object.rem[3]
end if 
	if tab_1.tabpage_3.dw_5.rowcount() > 3 then

 dw_2.object.sch4a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[4],'YYYY/MM/DD')
 dw_2.object.sch4b[1] = tab_1.tabpage_3.dw_5.object.shname[4]
 dw_2.object.sch4c[1] = tab_1.tabpage_3.dw_5.object.major[4]
 dw_2.object.sch4d[1] = tab_1.tabpage_3.dw_5.object.hak[4]
 dw_2.object.sch4e[1] = tab_1.tabpage_3.dw_5.object.rem[4]
end if 
	if tab_1.tabpage_3.dw_5.rowcount() > 4 then

 dw_2.object.sch5a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[5],'YYYY/MM/DD')
 dw_2.object.sch5b[1] = tab_1.tabpage_3.dw_5.object.shname[5]
 dw_2.object.sch5c[1] = tab_1.tabpage_3.dw_5.object.major[5]
 dw_2.object.sch5d[1] = tab_1.tabpage_3.dw_5.object.hak[5]
 dw_2.object.sch5e[1] = tab_1.tabpage_3.dw_5.object.rem[5]
end if
//경력
if tab_1.tabpage_4.dw_6.rowcount() > 0 then
 dw_2.object.car1a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[1],'YYYY/MM/DD')
 dw_2.object.car1b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[1],'YYYY/MM/DD')
 dw_2.object.car1c[1] = tab_1.tabpage_4.dw_6.object.corp_name[1]
 dw_2.object.car1d[1] = tab_1.tabpage_4.dw_6.object.grad_name[1]
 dw_2.object.car1e[1] = tab_1.tabpage_4.dw_6.object.func_name[1]
end if 
	if tab_1.tabpage_4.dw_6.rowcount() > 1 then
 dw_2.object.car2a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[2],'YYYY/MM/DD')
 dw_2.object.car2b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[2],'YYYY/MM/DD')
 dw_2.object.car2c[1] = tab_1.tabpage_4.dw_6.object.corp_name[2]
 dw_2.object.car2d[1] = tab_1.tabpage_4.dw_6.object.grad_name[2]
 dw_2.object.car2e[1] = tab_1.tabpage_4.dw_6.object.func_name[2]
end if 
	if tab_1.tabpage_4.dw_6.rowcount() > 2 then
 dw_2.object.car3a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[3],'YYYY/MM/DD')
 dw_2.object.car3b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[3],'YYYY/MM/DD')
 dw_2.object.car3c[1] = tab_1.tabpage_4.dw_6.object.corp_name[3]
 dw_2.object.car3d[1] = tab_1.tabpage_4.dw_6.object.grad_name[3]
 dw_2.object.car3e[1] = tab_1.tabpage_4.dw_6.object.func_name[3]
end if 
	if tab_1.tabpage_4.dw_6.rowcount() > 3 then
 dw_2.object.car4a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[4],'YYYY/MM/DD')
 dw_2.object.car4b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[4],'YYYY/MM/DD')
 dw_2.object.car4c[1] = tab_1.tabpage_4.dw_6.object.corp_name[4]
 dw_2.object.car4d[1] = tab_1.tabpage_4.dw_6.object.grad_name[4]
 dw_2.object.car4e[1] = tab_1.tabpage_4.dw_6.object.func_name[4]
end if 
	if tab_1.tabpage_4.dw_6.rowcount() > 4 then
 dw_2.object.car5a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[5],'YYYY/MM/DD')
 dw_2.object.car5b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[5],'YYYY/MM/DD')
 dw_2.object.car5c[1] = tab_1.tabpage_4.dw_6.object.corp_name[5]
 dw_2.object.car5d[1] = tab_1.tabpage_4.dw_6.object.grad_name[5]
 dw_2.object.car5e[1] = tab_1.tabpage_4.dw_6.object.func_name[5]
end if
 //자격
if tab_1.tabpage_5.dw_7.rowcount() > 0 then
 dw_2.object.lic1a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[1],'YYYY/MM/DD')
 dw_2.object.lic1b[1] = tab_1.tabpage_5.dw_7.object.licen_name[1]
 dw_2.object.lic1c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[1]
 dw_2.object.lic1d[1] = tab_1.tabpage_5.dw_7.object.licen_office[1]
end if 
	if tab_1.tabpage_5.dw_7.rowcount() > 1 then
 dw_2.object.lic2a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[2],'YYYY/MM/DD')
 dw_2.object.lic2b[1] = tab_1.tabpage_5.dw_7.object.licen_name[2]
 dw_2.object.lic2c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[2]
 dw_2.object.lic2d[1] = tab_1.tabpage_5.dw_7.object.licen_office[2]
end if 
	if tab_1.tabpage_5.dw_7.rowcount() > 2 then
 dw_2.object.lic3a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[3],'YYYY/MM/DD')
 dw_2.object.lic3b[1] = tab_1.tabpage_5.dw_7.object.licen_name[3]
 dw_2.object.lic3c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[3]
 dw_2.object.lic3d[1] = tab_1.tabpage_5.dw_7.object.licen_office[3]
end if 
	if tab_1.tabpage_5.dw_7.rowcount() > 3 then
 dw_2.object.lic4a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[4],'YYYY/MM/DD')
 dw_2.object.lic4b[1] = tab_1.tabpage_5.dw_7.object.licen_name[4]
 dw_2.object.lic4c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[4]
 dw_2.object.lic4d[1] = tab_1.tabpage_5.dw_7.object.licen_office[4]
end if 
	if tab_1.tabpage_5.dw_7.rowcount() > 4 then
 dw_2.object.lic5a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[5],'YYYY/MM/DD')
 dw_2.object.lic5b[1] = tab_1.tabpage_5.dw_7.object.licen_name[5]
 dw_2.object.lic5c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[5]
 dw_2.object.lic5d[1] = tab_1.tabpage_5.dw_7.object.licen_office[5]
end if
 //기타
if tab_1.tabpage_6.dw_8.rowcount() > 0 then
 dw_2.object.etc1a[1] = tab_1.tabpage_6.dw_8.object.etc_name[1]
 dw_2.object.etc1b[1] = tab_1.tabpage_6.dw_8.object.remarks[1]
end if 
	if tab_1.tabpage_6.dw_8.rowcount() > 1 then
 dw_2.object.etc2a[1] = tab_1.tabpage_6.dw_8.object.zetc_namex[2]
 dw_2.object.etc2b[1] = tab_1.tabpage_6.dw_8.object.remarks[2]
end if 
	if tab_1.tabpage_6.dw_8.rowcount() > 2 then
 dw_2.object.etc3a[1] = tab_1.tabpage_6.dw_8.object.etc_name[3]
 dw_2.object.etc3b[1] = tab_1.tabpage_6.dw_8.object.remarks[3]
end if 
	if tab_1.tabpage_6.dw_8.rowcount() > 3 then
 dw_2.object.etc4a[1] = tab_1.tabpage_6.dw_8.object.etc_name[4]
 dw_2.object.etc4b[1] = tab_1.tabpage_6.dw_8.object.remarks[4]
end if 
	if tab_1.tabpage_6.dw_8.rowcount() > 4 then
 dw_2.object.etc5a[1] = tab_1.tabpage_6.dw_8.object.etc_name[5]
 dw_2.object.etc5b[1] = tab_1.tabpage_6.dw_8.object.remarks[5]  
end if
return
end subroutine

on w_cdcustper_m.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.cb_2=create cb_2
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_3
end on

on w_cdcustper_m.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.cb_2)
destroy(this.cb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_sql, ls_where

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
dw5 = tab_1.tabpage_3.dw_5
dw6 = tab_1.tabpage_4.dw_6
dw7 = tab_1.tabpage_5.dw_7
dw8 = tab_1.tabpage_6.dw_8
dw9 = tab_1.tabpage_7.dw_9

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw3.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)
dw5.SetTransObject(SQLCA)
dw6.SetTransObject(SQLCA)
dw7.SetTransObject(SQLCA)
dw8.SetTransObject(SQLCA)
dw9.SetTransObject(SQLCA)

dw_2.visible = false
dw3.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.setsort('cust_no')
idwc_cust.sort()
tab_1.tabpage_1.dw_3.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
idwc_cust_name.setsort('cust_name')
idwc_cust_name.sort()


is_dw2sql = dw_2.describe("datawindow.table.select")
is_dw1sql = dw_1.describe("datawindow.table.select")
//ls_where = " and custper.cust_idno *= custfam.cust_idno " &
//			+ " and custper.cust_idno *= custsch.cust_idno " &
//			+ " and custper.cust_idno *= custcar.cust_idno " &
//			+ " and custper.cust_idno *= custlic.cust_idno " &
//			+ " and custper.cust_idno *= custetc.cust_idno "
//ls_sql = "datawindow.table.select='" + is_dw1sql + ls_where + "'"
//dw_1.modify(ls_sql)
dw_1.retrieve()

end event

event resize;call super::resize;//
tab_1.width  = this.width  - 1555
tab_1.height = this.height - 400

//gb_2.width   = this.width  - 1317
gb_2.height  = this.height - 368

//dw_1.width   = this.width  - 1317
dw_1.height  = this.height - 532

dw3.width    = this.width  - 1614
dw3.height   = this.height - 704

dw4.width    = dw3.width
dw4.height   = dw3.height

dw5.width    = dw3.width
dw5.height   = dw3.height

dw6.width    = dw3.width
dw6.height   = dw3.height

dw7.width    = dw3.width
dw7.height   = dw3.height

dw8.width    = dw3.width
dw8.height   = dw3.height

dw9.width    = dw3.width
dw9.height   = dw3.height

end event

type pb_save from w_inheritance`pb_save within w_cdcustper_m
integer x = 4274
integer y = 56
end type

event pb_save::clicked;dwItemStatus l_status
boolean lb_insert
integer li_idno 
long ll_count, ll_cnt
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw3.Accepttext()
dw4.Accepttext()
dw5.Accepttext()
dw6.Accepttext()
dw7.Accepttext()
dw8.Accepttext()

ll_count = wf_modifycount(dw3)
ll_count = ll_count + wf_modifycount(dw4)
ll_count = ll_count + wf_modifycount(dw5)
ll_count = ll_count + wf_modifycount(dw6)
ll_count = ll_count + wf_modifycount(dw7)
ll_count = ll_count + wf_modifycount(dw8)

if ll_count > 0 then

	l_status = dw3.GetItemStatus(1, 0, Primary!)
	lb_insert = false
	if l_status = newmodified! or l_status = new! then
		lb_insert = true
		select max(cust_idno) into :li_idno from custper;
		if isnull(li_idno) then 
			li_idno = 1
		else
			li_idno = li_idno + 1
		end if
		dw3.object.cust_idno[1] = li_idno
		for ll_cnt = 1 to dw4.rowcount()
			dw4.object.cust_idno[ll_cnt] = li_idno
		next
		for ll_cnt = 1 to dw5.rowcount()
			dw5.object.cust_idno[ll_cnt] = li_idno
		next
		for ll_cnt = 1 to dw6.rowcount()
			dw6.object.cust_idno[ll_cnt] = li_idno
		next
		for ll_cnt = 1 to dw7.rowcount()
			dw7.object.cust_idno[ll_cnt] = li_idno
		next
		for ll_cnt = 1 to dw8.rowcount()
			dw8.object.cust_idno[ll_cnt] = li_idno
		next
	else
		if l_status = datamodified! then
			if li_idno <> dw_1.object.cust_idno[il_row] then
				for ll_cnt = 1 to dw4.rowcount()
					dw4.object.cust_idno[ll_cnt] = li_idno
				next
				for ll_cnt = 1 to dw5.rowcount()
					dw5.object.cust_idno[ll_cnt] = li_idno
				next
				for ll_cnt = 1 to dw6.rowcount()
					dw6.object.cust_idno[ll_cnt] = li_idno
				next
				for ll_cnt = 1 to dw7.rowcount()
					dw7.object.cust_idno[ll_cnt] = li_idno
				next
				for ll_cnt = 1 to dw8.rowcount()
					dw8.object.cust_idno[ll_cnt] = li_idno
				next
			end if
		end if
	end if
	if wf_update6(dw3, dw4, dw5, dw6, dw7, dw8, "Y") = true then
		dw_1.setredraw(false)
		dw_1.retrieve()
		long ll_row
		
		ll_row = dw_1.find("cust_idno = " + string(li_idno), 1 , dw_1.rowcount() )
		if ll_row > 0 then 
			dw_1.scrolltorow(ll_row)
			ii_idno = li_idno
		end if
		dw_1.setredraw(true)

	else
		Messagebox("오류","UPDATE중 DB오류가 발생하였습니다.", exclamation!)
	end if
end if
			  
end event

type dw_1 from w_inheritance`dw_1 within w_cdcustper_m
integer x = 46
integer y = 368
integer width = 1376
integer height = 1844
string dataobject = "d_cdcustper_s"
boolean hsplitscroll = true
end type

event dw_1::rowfocuschanged;long ll_count
integer li_chk

il_row = dw_1.getrow()
if il_row < 1 then
	return
end if
this.selectrow(0,false)
this.selectrow(il_row, true)
tab_1.tabpage_1.dw_3.Accepttext()
tab_1.tabpage_2.dw_4.Accepttext()
tab_1.tabpage_3.dw_5.Accepttext()
tab_1.tabpage_4.dw_6.Accepttext()
tab_1.tabpage_5.dw_7.Accepttext()
tab_1.tabpage_6.dw_8.Accepttext()

ll_count = wf_modifycount(tab_1.tabpage_1.dw_3)
ll_count = ll_count + wf_modifycount(tab_1.tabpage_2.dw_4)
ll_count = ll_count + wf_modifycount(tab_1.tabpage_3.dw_5)
ll_count = ll_count + wf_modifycount(tab_1.tabpage_4.dw_6)
ll_count = ll_count + wf_modifycount(tab_1.tabpage_5.dw_7)
ll_count = ll_count + wf_modifycount(tab_1.tabpage_6.dw_8)

IF ll_count >= 1 THEN
	li_chk = MessageBox("확인", "변경된 내역을 저장하시겠습니까 ?", Question!, YesNo!, 2)
   IF li_chk = 1 THEN 
		if wf_update6(tab_1.tabpage_1.dw_3, &
						  tab_1.tabpage_2.dw_4, &
						  tab_1.tabpage_3.dw_5, &
						  tab_1.tabpage_4.dw_6, &
						  tab_1.tabpage_5.dw_7, &
						  tab_1.tabpage_6.dw_8, "Y") then
		end if
   END IF
END IF


ii_idno = dw_1.object.cust_idno[il_row]

tab_1.tabpage_1.dw_3.retrieve(ii_idno)
tab_1.tabpage_2.dw_4.retrieve(ii_idno)
tab_1.tabpage_3.dw_5.retrieve(ii_idno)
tab_1.tabpage_4.dw_6.retrieve(ii_idno)
tab_1.tabpage_5.dw_7.retrieve(ii_idno)
tab_1.tabpage_6.dw_8.retrieve(ii_idno)

end event

event dw_1::clicked;if row < 1 then return

this.scrolltorow(row)

end event

type st_title from w_inheritance`st_title within w_cdcustper_m
integer y = 32
integer width = 1189
string text = "고객정보 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcustper_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustper_m
boolean visible = false
integer x = 1719
integer y = 44
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcustper_m
boolean visible = false
integer x = 2871
integer y = 44
end type

type pb_close from w_inheritance`pb_close within w_cdcustper_m
integer x = 4471
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcustper_m
integer x = 4078
integer y = 56
integer taborder = 130
end type

event pb_print::clicked;w_repsuper w_print
string ls_sql, ls_where, ls_source
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================
//==========================================================================
dw_2.retrieve(ii_idno)
wf_custper_insert()

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 고객정보내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustper_m
boolean visible = false
integer x = 2487
integer y = 44
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdcustper_m
integer x = 3881
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;int li_chk

il_row = dw_1.getrow()
if il_row < 1 then
	return
end if
li_chk = messagebox("확인","선택된 자료를 삭제하시겠습니까?",Question!, YesNo!,2)
if li_chk = 2 then
	return
end if

dw3.RowsMove(1, dw3.rowCount(), Primary!, dw3, 1, Delete!)
dw4.RowsMove(1, dw4.rowCount(), Primary!, dw4, 1, Delete!)
dw5.RowsMove(1, dw5.rowCount(), Primary!, dw5, 1, Delete!)
dw6.RowsMove(1, dw6.rowCount(), Primary!, dw6, 1, Delete!)
dw7.RowsMove(1, dw7.rowCount(), Primary!, dw7, 1, Delete!)
dw8.RowsMove(1, dw8.rowCount(), Primary!, dw8, 1, Delete!)
											
dw_1.deleterow(il_row)
if wf_update6(dw3, dw4, dw5, dw6, dw7, dw8, "Y") then
   il_row = dw_1.getrow()
	if il_row < 1 then return
	ii_idno = dw_1.object.cust_idno[il_row]

	dw3.retrieve(ii_idno)
	dw4.retrieve(ii_idno)
	dw5.retrieve(ii_idno)
	dw6.retrieve(ii_idno)
	dw7.retrieve(ii_idno)
	dw8.retrieve(ii_idno)

end if

end event

type pb_insert from w_inheritance`pb_insert within w_cdcustper_m
integer x = 3685
integer y = 56
integer taborder = 170
end type

event pb_insert::clicked;
dw3.reset()
dw4.reset()
dw5.reset()
dw6.reset()
dw7.reset()
dw8.reset()

il_row = dw3.insertrow(0)
tab_1.SelectTab(1)
dw3.setfocus()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustper_m
integer x = 3488
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;gs_custper_str lstr_select
long ll_cnt, ll_row, ll_count
string ls_sql, ls_where
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

openwithparm(w_whcustper_w,lstr_select)
lstr_select = message.powerobjectparm

if lstr_select.str_ok = FALSE then return
if trim(lstr_select.str_where) = "ALL" then

//   2018.03.26 조원석 주석처리	
//	ls_where = " and custper.cust_idno *= custfam.cust_idno " &
//			+ " and custper.cust_idno *= custsch.cust_idno " &
//			+ " and custper.cust_idno *= custcar.cust_idno " &
//			+ " and custper.cust_idno *= custlic.cust_idno " &
//			+ " and custper.cust_idno *= custetc.cust_idno "

else
	ls_where = lstr_select.str_where
	ls_sql = "datawindow.table.select='" + is_dw1sql + ls_where + "'"
end if
/*ls_sql = "datawindow.table.select='" + is_dw1sql + ls_where + "'"          2018.03.26 조원석 주석처리 */
//messagebox("",ls_sql)

dw_1.reset()
dw_1.SetTransObject(SQLCA)
dw_1.modify(ls_sql)
dw_1.retrieve()
if dw_1.rowcount() < 1 then
	messagebox("에러","검색한 자료가 없습니다.")

end if
end event

event pb_retrieve::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"자료검색",parent, li_x, li_y)

end event

type gb_3 from w_inheritance`gb_3 within w_cdcustper_m
boolean visible = false
integer x = 631
integer y = 232
integer width = 2926
integer height = 312
integer taborder = 90
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustper_m
integer x = 23
integer width = 1431
integer height = 2008
integer taborder = 100
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustper_m
integer x = 3461
integer y = 16
integer width = 1230
end type

type dw_2 from w_inheritance`dw_2 within w_cdcustper_m
integer x = 1298
integer y = 76
integer width = 105
integer height = 80
integer taborder = 70
string dataobject = "d_cdcustper_r"
boolean vscrollbar = false
end type

type tab_1 from tab within w_cdcustper_m
integer x = 1472
integer y = 256
integer width = 3218
integer height = 1976
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 78160032
boolean raggedright = true
alignment alignment = right!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3182
integer height = 1848
long backcolor = 78160032
string text = "기본인적사항"
long tabtextcolor = 16711680
long tabbackcolor = 78160032
string picturename = "Custom089!"
long picturemaskcolor = 553648127
dw_3 dw_3
cb_1 cb_1
end type

on tabpage_1.create
this.dw_3=create dw_3
this.cb_1=create cb_1
this.Control[]={this.dw_3,&
this.cb_1}
end on

on tabpage_1.destroy
destroy(this.dw_3)
destroy(this.cb_1)
end on

type dw_3 from datawindow within tabpage_1
integer x = 9
integer y = 164
integer width = 3159
integer height = 1672
integer taborder = 21
string dataobject = "d_cdcustper_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;tab_1.tabpage_1.dw_3.accepttext()

choose case dwo.name
	case 'cust_idno'
		ii_idno = this.object.cust_idno[1]
	case 'cust_no'
		this.object.cust_name[1] = ''
		this.object.cust_name[1] = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")
	case 'cust_name'
		this.object.cust_no[1] = ''
		this.object.cust_no[1] = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
end choose		

end event

type cb_1 from commandbutton within tabpage_1
integer x = 2679
integer y = 12
integer width = 489
integer height = 144
integer taborder = 51
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처정보"
end type

event clicked;string ls_custno

if tab_1.tabpage_1.dw_3.rowcount() < 1 then
	ls_custno = ""
else
	ls_custno = tab_1.tabpage_1.dw_3.object.cust_no[1]
	if isnull(ls_custno) or ls_custno = "" then
		ls_custno = "*"
	end if
end if
openwithparm(w_whcustomer_w,ls_custno)
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3182
integer height = 1848
long backcolor = 78160032
string text = "가족사항"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
string picturename = "Custom076!"
long picturemaskcolor = 553648127
dw_4 dw_4
pb_1 pb_1
pb_2 pb_2
end type

on tabpage_2.create
this.dw_4=create dw_4
this.pb_1=create pb_1
this.pb_2=create pb_2
this.Control[]={this.dw_4,&
this.pb_1,&
this.pb_2}
end on

on tabpage_2.destroy
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.pb_2)
end on

type dw_4 from datawindow within tabpage_2
integer y = 164
integer width = 3159
integer height = 1672
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_cdcustper_fam_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within tabpage_2
integer x = 2766
integer y = 8
integer width = 187
integer height = 144
integer taborder = 21
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_2.dw_4.insertrow(0)
tab_1.tabpage_2.dw_4.object.cust_idno[ll_row] = ii_idno

end event

type pb_2 from picturebutton within tabpage_2
integer x = 2967
integer y = 8
integer width = 187
integer height = 144
integer taborder = 31
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_2.dw_4.getrow()
if ll_row < 1 then
	return
end if
tab_1.tabpage_2.dw_4.deleterow(ll_row)

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3182
integer height = 1848
long backcolor = 78160032
string text = "학력사항"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
string picturename = "Library!"
long picturemaskcolor = 553648127
dw_5 dw_5
pb_3 pb_3
pb_4 pb_4
end type

on tabpage_3.create
this.dw_5=create dw_5
this.pb_3=create pb_3
this.pb_4=create pb_4
this.Control[]={this.dw_5,&
this.pb_3,&
this.pb_4}
end on

on tabpage_3.destroy
destroy(this.dw_5)
destroy(this.pb_3)
destroy(this.pb_4)
end on

type dw_5 from datawindow within tabpage_3
integer y = 164
integer width = 3159
integer height = 1672
integer taborder = 52
boolean bringtotop = true
string dataobject = "d_cdcustper_sch_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_3 from picturebutton within tabpage_3
event clicked pbm_bnclicked
integer x = 2761
integer y = 12
integer width = 187
integer height = 144
integer taborder = 22
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_3.dw_5.insertrow(0)
tab_1.tabpage_3.dw_5.object.cust_idno[ll_row] = ii_idno
tab_1.tabpage_3.dw_5.object.seq[ll_row] = ll_row

end event

type pb_4 from picturebutton within tabpage_3
event clicked pbm_bnclicked
integer x = 2962
integer y = 12
integer width = 187
integer height = 144
integer taborder = 22
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_3.dw_5.getrow()
if ll_row < 1 then
	return
end if
tab_1.tabpage_3.dw_5.deleterow(ll_row)

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3182
integer height = 1848
long backcolor = 78160032
string text = "경력사항"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
string picturename = "Move!"
long picturemaskcolor = 553648127
dw_6 dw_6
pb_5 pb_5
pb_6 pb_6
end type

on tabpage_4.create
this.dw_6=create dw_6
this.pb_5=create pb_5
this.pb_6=create pb_6
this.Control[]={this.dw_6,&
this.pb_5,&
this.pb_6}
end on

on tabpage_4.destroy
destroy(this.dw_6)
destroy(this.pb_5)
destroy(this.pb_6)
end on

type dw_6 from datawindow within tabpage_4
integer y = 164
integer width = 3159
integer height = 1672
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_cdcustper_car_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_5 from picturebutton within tabpage_4
event clicked pbm_bnclicked
integer x = 2761
integer y = 8
integer width = 187
integer height = 144
integer taborder = 22
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_4.dw_6.insertrow(0)
tab_1.tabpage_4.dw_6.object.cust_idno[ll_row] = ii_idno
tab_1.tabpage_4.dw_6.object.seq[ll_row] = ll_row

end event

type pb_6 from picturebutton within tabpage_4
event clicked pbm_bnclicked
integer x = 2962
integer y = 8
integer width = 187
integer height = 144
integer taborder = 22
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_4.dw_6.getrow()
if ll_row < 1 then
	return
end if
tab_1.tabpage_4.dw_6.deleterow(ll_row)

end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3182
integer height = 1848
long backcolor = 78160032
string text = "자격사항"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
string picturename = "Custom032!"
long picturemaskcolor = 553648127
dw_7 dw_7
pb_7 pb_7
pb_8 pb_8
end type

on tabpage_5.create
this.dw_7=create dw_7
this.pb_7=create pb_7
this.pb_8=create pb_8
this.Control[]={this.dw_7,&
this.pb_7,&
this.pb_8}
end on

on tabpage_5.destroy
destroy(this.dw_7)
destroy(this.pb_7)
destroy(this.pb_8)
end on

type dw_7 from datawindow within tabpage_5
integer y = 164
integer width = 3159
integer height = 1672
integer taborder = 22
boolean bringtotop = true
string dataobject = "d_cdcustper_lic_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_7 from picturebutton within tabpage_5
event clicked pbm_bnclicked
integer x = 2770
integer y = 8
integer width = 187
integer height = 144
integer taborder = 22
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_5.dw_7.insertrow(0)
tab_1.tabpage_5.dw_7.object.cust_idno[ll_row] = ii_idno
tab_1.tabpage_5.dw_7.object.seq[ll_row] = ll_row

end event

type pb_8 from picturebutton within tabpage_5
event clicked pbm_bnclicked
integer x = 2971
integer y = 8
integer width = 187
integer height = 144
integer taborder = 22
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_5.dw_7.getrow()
if ll_row < 1 then
	return
end if
tab_1.tabpage_5.dw_7.deleterow(ll_row)

end event

type tabpage_6 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3182
integer height = 1848
long backcolor = 78160032
string text = "기타정보"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
string picturename = "UserObject!"
long picturemaskcolor = 553648127
dw_8 dw_8
pb_9 pb_9
pb_10 pb_10
end type

on tabpage_6.create
this.dw_8=create dw_8
this.pb_9=create pb_9
this.pb_10=create pb_10
this.Control[]={this.dw_8,&
this.pb_9,&
this.pb_10}
end on

on tabpage_6.destroy
destroy(this.dw_8)
destroy(this.pb_9)
destroy(this.pb_10)
end on

type dw_8 from datawindow within tabpage_6
integer y = 164
integer width = 3159
integer height = 1672
integer taborder = 22
boolean bringtotop = true
string dataobject = "d_cdcustper_etc_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_9 from picturebutton within tabpage_6
event clicked pbm_bnclicked
integer x = 2766
integer y = 8
integer width = 187
integer height = 144
integer taborder = 22
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_6.dw_8.insertrow(0)
tab_1.tabpage_6.dw_8.object.cust_idno[ll_row] = ii_idno
tab_1.tabpage_6.dw_8.object.seq[ll_row] = ll_row

end event

type pb_10 from picturebutton within tabpage_6
event clicked pbm_bnclicked
integer x = 2967
integer y = 8
integer width = 187
integer height = 144
integer taborder = 22
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_6.dw_8.getrow()
if ll_row < 1 then
	return
end if
tab_1.tabpage_6.dw_8.deleterow(ll_row)

end event

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3182
integer height = 1848
long backcolor = 79741120
string text = "조회/출력"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
ddlb_1 ddlb_1
st_2 st_2
dw_9 dw_9
st_1 st_1
pb_print2 pb_print2
pb_ret2 pb_ret2
end type

on tabpage_7.create
this.ddlb_1=create ddlb_1
this.st_2=create st_2
this.dw_9=create dw_9
this.st_1=create st_1
this.pb_print2=create pb_print2
this.pb_ret2=create pb_ret2
this.Control[]={this.ddlb_1,&
this.st_2,&
this.dw_9,&
this.st_1,&
this.pb_print2,&
this.pb_ret2}
end on

on tabpage_7.destroy
destroy(this.ddlb_1)
destroy(this.st_2)
destroy(this.dw_9)
destroy(this.st_1)
destroy(this.pb_print2)
destroy(this.pb_ret2)
end on

type ddlb_1 from dropdownlistbox within tabpage_7
integer x = 2363
integer y = 56
integer width = 215
integer height = 916
integer taborder = 90
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"01","02","03","04","05","06","07","08","09","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;pb_ret2.triggerevent(clicked!)
end event

type st_2 from statictext within tabpage_7
integer x = 2597
integer y = 68
integer width = 123
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_9 from datawindow within tabpage_7
integer x = 5
integer y = 184
integer width = 3159
integer height = 1672
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_cdcustper_r1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within tabpage_7
integer x = 14
integer y = 80
integer width = 2318
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "생년월일(음,양), 결혼기념일, 창립기념일 조회/ 출력"
boolean focusrectangle = false
end type

type pb_print2 from picturebutton within tabpage_7
integer x = 2967
integer y = 24
integer width = 187
integer height = 144
integer taborder = 130
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event clicked;w_repsuper w_print
string ls_sql, ls_where, ls_source

i_print.st_datawindow = dw_9
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 고객정보리스트를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_ret2 from picturebutton within tabpage_7
integer x = 2770
integer y = 24
integer width = 187
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;dw9.retrieve(integer(ddlb_1.text))
end event

type cb_2 from commandbutton within w_cdcustper_m
integer x = 59
integer y = 276
integer width = 242
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "성명"
end type

event clicked;string ls_cust_hname
   
if dw_1.rowcount() < 1 then
	return
end if
dw_1.setredraw(false)
IF  ib_check = TRUE THEN
    ls_cust_hname = "cust_hname A"
	 ib_check = FALSE
ELSE
    ls_cust_hname = "cust_hname D"
	 ib_check = TRUE
END IF
dw_1.SetSort(ls_cust_hname)
dw_1.Sort( )
dw_1.setredraw(true)


end event

type cb_3 from commandbutton within w_cdcustper_m
integer x = 329
integer y = 276
integer width = 283
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처"
end type

event clicked;string ls_cust_name
   
if dw_1.rowcount() < 1 then
	return
end if
dw_1.setredraw(false)
IF  ib_ncheck = TRUE THEN
    ls_cust_name = "cust_name A"
	 ib_ncheck = FALSE
ELSE
    ls_cust_name = "cust_name D"
	 ib_ncheck = TRUE
END IF
dw_1.SetSort(ls_cust_name)
dw_1.Sort( )
//dw_1.postevent(rowfocuschanged!)
dw_1.setredraw(true)


end event

