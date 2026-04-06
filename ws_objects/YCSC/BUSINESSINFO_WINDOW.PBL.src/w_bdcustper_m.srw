$PBExportHeader$w_bdcustper_m.srw
$PBExportComments$인명정보관리(98/04/23,이인호)
forward
global type w_bdcustper_m from w_inheritance
end type
type cb_2 from commandbutton within w_bdcustper_m
end type
type dw_3 from datawindow within w_bdcustper_m
end type
type dw_4 from datawindow within w_bdcustper_m
end type
type cb_3 from commandbutton within w_bdcustper_m
end type
type rb_1 from radiobutton within w_bdcustper_m
end type
type rb_4 from radiobutton within w_bdcustper_m
end type
type rb_3 from radiobutton within w_bdcustper_m
end type
type rb_2 from radiobutton within w_bdcustper_m
end type
type rb_5 from radiobutton within w_bdcustper_m
end type
type rb_6 from radiobutton within w_bdcustper_m
end type
type sle_1 from singlelineedit within w_bdcustper_m
end type
type sle_2 from singlelineedit within w_bdcustper_m
end type
type rb_7 from radiobutton within w_bdcustper_m
end type
type gb_4 from groupbox within w_bdcustper_m
end type
end forward

global type w_bdcustper_m from w_inheritance
integer x = 37
integer y = 112
integer width = 4658
integer height = 2876
string title = "인명정보입력(w_bdcustper_m)"
cb_2 cb_2
dw_3 dw_3
dw_4 dw_4
cb_3 cb_3
rb_1 rb_1
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_5 rb_5
rb_6 rb_6
sle_1 sle_1
sle_2 sle_2
rb_7 rb_7
gb_4 gb_4
end type
global w_bdcustper_m w_bdcustper_m

type variables
st_print i_print
integer ii_idno
long il_row
datawindowchild idwc_cust
datawindowchild idwc_cust_name
boolean ib_check = true, ib_ncheck = true

end variables

forward prototypes
public subroutine wf_custper_insert ()
end prototypes

public subroutine wf_custper_insert ();////가족
//if tab_1.tabpage_2.dw_4.rowcount() > 0 then
// dw_2.object.fam1a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[1]
// dw_2.object.fam1b[1] = tab_1.tabpage_2.dw_4.object.fam_name[1]
// dw_2.object.fam1c[1] = tab_1.tabpage_2.dw_4.object.fam_id[1]
// dw_2.object.fam1d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[1]
// dw_2.object.fam1e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[1])
// dw_2.object.fam1f[1] = tab_1.tabpage_2.dw_4.object.fam_job[1]
// dw_2.object.fam1g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[1]
// dw_2.object.fam1h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[1]
// dw_2.object.fam1i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[1]
// dw_2.object.fam1j[1] = tab_1.tabpage_2.dw_4.object.fam_school[1]
// dw_2.object.fam1k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[1]
// dw_2.object.fam1l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[1],'YYYY/MM/DD')
//end if
//	if tab_1.tabpage_2.dw_4.rowcount() > 1 then
//
// dw_2.object.fam2a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[2]
// dw_2.object.fam2b[1] = tab_1.tabpage_2.dw_4.object.fam_name[2]
// dw_2.object.fam2c[1] = tab_1.tabpage_2.dw_4.object.fam_id[2]
// dw_2.object.fam2d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[2]
// dw_2.object.fam2e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[2])
// dw_2.object.fam2f[1] = tab_1.tabpage_2.dw_4.object.fam_job[2]
// dw_2.object.fam2g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[2]
// dw_2.object.fam2h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[2]
// dw_2.object.fam2i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[2]
// dw_2.object.fam2j[1] = tab_1.tabpage_2.dw_4.object.fam_school[2]
// dw_2.object.fam2k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[2]
// dw_2.object.fam2l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[2],'YYYY/MM/DD')
//end if 
//	if tab_1.tabpage_2.dw_4.rowcount() > 2 then
//
// dw_2.object.fam3a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[3]
// dw_2.object.fam3b[1] = tab_1.tabpage_2.dw_4.object.fam_name[3]
// dw_2.object.fam3c[1] = tab_1.tabpage_2.dw_4.object.fam_id[3]
// dw_2.object.fam3d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[3]
// dw_2.object.fam3e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[3])
// dw_2.object.fam3f[1] = tab_1.tabpage_2.dw_4.object.fam_job[3]
// dw_2.object.fam3g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[3]
// dw_2.object.fam3h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[3]
// dw_2.object.fam3i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[3]
// dw_2.object.fam3j[1] = tab_1.tabpage_2.dw_4.object.fam_school[3]
// dw_2.object.fam3k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[3]
// dw_2.object.fam3l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[3],'YYYY/MM/DD')
//end if 
//	if tab_1.tabpage_2.dw_4.rowcount() > 3 then
//
// dw_2.object.fam4a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[4]
// dw_2.object.fam4b[1] = tab_1.tabpage_2.dw_4.object.fam_name[4]
// dw_2.object.fam4c[1] = tab_1.tabpage_2.dw_4.object.fam_id[4]
// dw_2.object.fam4d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[4]
// dw_2.object.fam4e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[4])
// dw_2.object.fam4f[1] = tab_1.tabpage_2.dw_4.object.fam_job[4]
// dw_2.object.fam4g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[4]
// dw_2.object.fam4h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[4]
// dw_2.object.fam4i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[4]
// dw_2.object.fam4j[1] = tab_1.tabpage_2.dw_4.object.fam_school[4]
// dw_2.object.fam4k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[4]
// dw_2.object.fam4l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[4],'YYYY/MM/DD')
//end if 
//	if tab_1.tabpage_2.dw_4.rowcount() > 4 then
//
// dw_2.object.fam5a[1] = tab_1.tabpage_2.dw_4.object.fam_rel[5]
// dw_2.object.fam5b[1] = tab_1.tabpage_2.dw_4.object.fam_name[5]
// dw_2.object.fam5c[1] = tab_1.tabpage_2.dw_4.object.fam_id[5]
// dw_2.object.fam5d[1] = tab_1.tabpage_2.dw_4.object.fam_ename[5]
// dw_2.object.fam5e[1] = string(tab_1.tabpage_2.dw_4.object.fam_age[5])
// dw_2.object.fam5f[1] = tab_1.tabpage_2.dw_4.object.fam_job[5]
// dw_2.object.fam5g[1] = tab_1.tabpage_2.dw_4.object.fam_fcorp[5]
// dw_2.object.fam5h[1] = tab_1.tabpage_2.dw_4.object.fam_ps[5]
// dw_2.object.fam5i[1] = tab_1.tabpage_2.dw_4.object.fam_marriage[5]
// dw_2.object.fam5j[1] = tab_1.tabpage_2.dw_4.object.fam_school[5]
// dw_2.object.fam5k[1] = tab_1.tabpage_2.dw_4.object.fam_addr[5]
// dw_2.object.fam5l[1] = string(tab_1.tabpage_2.dw_4.object.fam_birth[5],'YYYY/MM/DD')
//end if
////학력
//if tab_1.tabpage_3.dw_5.rowcount() > 0 then
// dw_2.object.sch1a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[1],'YYYY/MM/DD')
// dw_2.object.sch1b[1] = tab_1.tabpage_3.dw_5.object.shname[1]
// dw_2.object.sch1c[1] = tab_1.tabpage_3.dw_5.object.major[1]
// dw_2.object.sch1d[1] = tab_1.tabpage_3.dw_5.object.hak[1]
// dw_2.object.sch1e[1] = tab_1.tabpage_3.dw_5.object.rem[1]
//end if 
//	if tab_1.tabpage_3.dw_5.rowcount() > 1 then
//
// dw_2.object.sch2a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[2],'YYYY/MM/DD')
// dw_2.object.sch2b[1] = tab_1.tabpage_3.dw_5.object.shname[2]
// dw_2.object.sch2c[1] = tab_1.tabpage_3.dw_5.object.major[2]
// dw_2.object.sch2d[1] = tab_1.tabpage_3.dw_5.object.hak[2]
// dw_2.object.sch2e[1] = tab_1.tabpage_3.dw_5.object.rem[2]
//end if 
//	if tab_1.tabpage_3.dw_5.rowcount() > 2 then
//
// dw_2.object.sch3a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[3],'YYYY/MM/DD')
// dw_2.object.sch3b[1] = tab_1.tabpage_3.dw_5.object.shname[3]
// dw_2.object.sch3c[1] = tab_1.tabpage_3.dw_5.object.major[3]
// dw_2.object.sch3d[1] = tab_1.tabpage_3.dw_5.object.hak[3]
// dw_2.object.sch3e[1] = tab_1.tabpage_3.dw_5.object.rem[3]
//end if 
//	if tab_1.tabpage_3.dw_5.rowcount() > 3 then
//
// dw_2.object.sch4a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[4],'YYYY/MM/DD')
// dw_2.object.sch4b[1] = tab_1.tabpage_3.dw_5.object.shname[4]
// dw_2.object.sch4c[1] = tab_1.tabpage_3.dw_5.object.major[4]
// dw_2.object.sch4d[1] = tab_1.tabpage_3.dw_5.object.hak[4]
// dw_2.object.sch4e[1] = tab_1.tabpage_3.dw_5.object.rem[4]
//end if 
//	if tab_1.tabpage_3.dw_5.rowcount() > 4 then
//
// dw_2.object.sch5a[1] = string(tab_1.tabpage_3.dw_5.object.out_year[5],'YYYY/MM/DD')
// dw_2.object.sch5b[1] = tab_1.tabpage_3.dw_5.object.shname[5]
// dw_2.object.sch5c[1] = tab_1.tabpage_3.dw_5.object.major[5]
// dw_2.object.sch5d[1] = tab_1.tabpage_3.dw_5.object.hak[5]
// dw_2.object.sch5e[1] = tab_1.tabpage_3.dw_5.object.rem[5]
//end if
////경력
//if tab_1.tabpage_4.dw_6.rowcount() > 0 then
// dw_2.object.car1a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[1],'YYYY/MM/DD')
// dw_2.object.car1b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[1],'YYYY/MM/DD')
// dw_2.object.car1c[1] = tab_1.tabpage_4.dw_6.object.corp_name[1]
// dw_2.object.car1d[1] = tab_1.tabpage_4.dw_6.object.grad_name[1]
// dw_2.object.car1e[1] = tab_1.tabpage_4.dw_6.object.func_name[1]
//end if 
//	if tab_1.tabpage_4.dw_6.rowcount() > 1 then
// dw_2.object.car2a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[2],'YYYY/MM/DD')
// dw_2.object.car2b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[2],'YYYY/MM/DD')
// dw_2.object.car2c[1] = tab_1.tabpage_4.dw_6.object.corp_name[2]
// dw_2.object.car2d[1] = tab_1.tabpage_4.dw_6.object.grad_name[2]
// dw_2.object.car2e[1] = tab_1.tabpage_4.dw_6.object.func_name[2]
//end if 
//	if tab_1.tabpage_4.dw_6.rowcount() > 2 then
// dw_2.object.car3a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[3],'YYYY/MM/DD')
// dw_2.object.car3b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[3],'YYYY/MM/DD')
// dw_2.object.car3c[1] = tab_1.tabpage_4.dw_6.object.corp_name[3]
// dw_2.object.car3d[1] = tab_1.tabpage_4.dw_6.object.grad_name[3]
// dw_2.object.car3e[1] = tab_1.tabpage_4.dw_6.object.func_name[3]
//end if 
//	if tab_1.tabpage_4.dw_6.rowcount() > 3 then
// dw_2.object.car4a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[4],'YYYY/MM/DD')
// dw_2.object.car4b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[4],'YYYY/MM/DD')
// dw_2.object.car4c[1] = tab_1.tabpage_4.dw_6.object.corp_name[4]
// dw_2.object.car4d[1] = tab_1.tabpage_4.dw_6.object.grad_name[4]
// dw_2.object.car4e[1] = tab_1.tabpage_4.dw_6.object.func_name[4]
//end if 
//	if tab_1.tabpage_4.dw_6.rowcount() > 4 then
// dw_2.object.car5a[1] = string(tab_1.tabpage_4.dw_6.object.car_indate[5],'YYYY/MM/DD')
// dw_2.object.car5b[1] = string(tab_1.tabpage_4.dw_6.object.car_outdate[5],'YYYY/MM/DD')
// dw_2.object.car5c[1] = tab_1.tabpage_4.dw_6.object.corp_name[5]
// dw_2.object.car5d[1] = tab_1.tabpage_4.dw_6.object.grad_name[5]
// dw_2.object.car5e[1] = tab_1.tabpage_4.dw_6.object.func_name[5]
//end if
// //자격
//if tab_1.tabpage_5.dw_7.rowcount() > 0 then
// dw_2.object.lic1a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[1],'YYYY/MM/DD')
// dw_2.object.lic1b[1] = tab_1.tabpage_5.dw_7.object.licen_name[1]
// dw_2.object.lic1c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[1]
// dw_2.object.lic1d[1] = tab_1.tabpage_5.dw_7.object.licen_office[1]
//end if 
//	if tab_1.tabpage_5.dw_7.rowcount() > 1 then
// dw_2.object.lic2a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[2],'YYYY/MM/DD')
// dw_2.object.lic2b[1] = tab_1.tabpage_5.dw_7.object.licen_name[2]
// dw_2.object.lic2c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[2]
// dw_2.object.lic2d[1] = tab_1.tabpage_5.dw_7.object.licen_office[2]
//end if 
//	if tab_1.tabpage_5.dw_7.rowcount() > 2 then
// dw_2.object.lic3a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[3],'YYYY/MM/DD')
// dw_2.object.lic3b[1] = tab_1.tabpage_5.dw_7.object.licen_name[3]
// dw_2.object.lic3c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[3]
// dw_2.object.lic3d[1] = tab_1.tabpage_5.dw_7.object.licen_office[3]
//end if 
//	if tab_1.tabpage_5.dw_7.rowcount() > 3 then
// dw_2.object.lic4a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[4],'YYYY/MM/DD')
// dw_2.object.lic4b[1] = tab_1.tabpage_5.dw_7.object.licen_name[4]
// dw_2.object.lic4c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[4]
// dw_2.object.lic4d[1] = tab_1.tabpage_5.dw_7.object.licen_office[4]
//end if 
//	if tab_1.tabpage_5.dw_7.rowcount() > 4 then
// dw_2.object.lic5a[1] = string(tab_1.tabpage_5.dw_7.object.licenout_date[5],'YYYY/MM/DD')
// dw_2.object.lic5b[1] = tab_1.tabpage_5.dw_7.object.licen_name[5]
// dw_2.object.lic5c[1] = tab_1.tabpage_5.dw_7.object.licen_grad[5]
// dw_2.object.lic5d[1] = tab_1.tabpage_5.dw_7.object.licen_office[5]
//end if
// //기타
//if tab_1.tabpage_6.dw_8.rowcount() > 0 then
// dw_2.object.etc1a[1] = tab_1.tabpage_6.dw_8.object.etc_name[1]
// dw_2.object.etc1b[1] = tab_1.tabpage_6.dw_8.object.remarks[1]
//end if 
//	if tab_1.tabpage_6.dw_8.rowcount() > 1 then
// dw_2.object.etc2a[1] = tab_1.tabpage_6.dw_8.object.zetc_namex[2]
// dw_2.object.etc2b[1] = tab_1.tabpage_6.dw_8.object.remarks[2]
//end if 
//	if tab_1.tabpage_6.dw_8.rowcount() > 2 then
// dw_2.object.etc3a[1] = tab_1.tabpage_6.dw_8.object.etc_name[3]
// dw_2.object.etc3b[1] = tab_1.tabpage_6.dw_8.object.remarks[3]
//end if 
//	if tab_1.tabpage_6.dw_8.rowcount() > 3 then
// dw_2.object.etc4a[1] = tab_1.tabpage_6.dw_8.object.etc_name[4]
// dw_2.object.etc4b[1] = tab_1.tabpage_6.dw_8.object.remarks[4]
//end if 
//	if tab_1.tabpage_6.dw_8.rowcount() > 4 then
// dw_2.object.etc5a[1] = tab_1.tabpage_6.dw_8.object.etc_name[5]
// dw_2.object.etc5b[1] = tab_1.tabpage_6.dw_8.object.remarks[5]  
//end if
//return
end subroutine

on w_bdcustper_m.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cb_3=create cb_3
this.rb_1=create rb_1
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_5=create rb_5
this.rb_6=create rb_6
this.sle_1=create sle_1
this.sle_2=create sle_2
this.rb_7=create rb_7
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_4
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.rb_5
this.Control[iCurrent+10]=this.rb_6
this.Control[iCurrent+11]=this.sle_1
this.Control[iCurrent+12]=this.sle_2
this.Control[iCurrent+13]=this.rb_7
this.Control[iCurrent+14]=this.gb_4
end on

on w_bdcustper_m.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cb_3)
destroy(this.rb_1)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.rb_7)
destroy(this.gb_4)
end on

event open;call super::open;
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)

dw_2.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.setsort('cust_no')
idwc_cust.sort()
dw_2.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
idwc_cust_name.setsort('cust_name')
idwc_cust_name.sort()

dw_3.visible = false
dw_1.retrieve()

if gs_winname2 = 'w_bdcustper_m' then
	rb_1.checked = false
	rb_2.checked = false
	rb_3.checked = false
	rb_4.checked = false
	string ls_filter
	ls_filter = " bdcom_comcode = '" + gs_var2 + "' "
	dw_1.setfilter(ls_filter)
	dw_1.filter()
	gs_winname2 = ''
	gs_var2 = ''
	if dw_1.rowcount() > 0 then dw_1.event rowfocuschanged(1)
end if

end event

type pb_save from w_inheritance`pb_save within w_bdcustper_m
integer x = 3104
integer y = 60
end type

event pb_save::clicked;dwItemStatus l_status
boolean lb_insert
integer li_idno 
long ll_count, ll_cnt

dw_2.Accepttext()

ll_count = wf_modifycount(dw_2)

if ll_count > 0 then

	l_status = dw_2.GetItemStatus(1, 0, Primary!)
	lb_insert = false
	if l_status = newmodified! or l_status = new! then
		lb_insert = true
		select max(cust_idno) into :li_idno from bdcustper;
		if isnull(li_idno) then 
			li_idno = 1
		else
			li_idno = li_idno + 1
		end if
		dw_2.object.cust_idno[1] = li_idno
	end if
	if wf_update1(dw_2, "Y") = true then
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

type dw_1 from w_inheritance`dw_1 within w_bdcustper_m
integer x = 46
integer y = 568
integer width = 635
integer height = 1596
integer taborder = 50
string dataobject = "d_bdcustper_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;long ll_count

il_row = dw_1.getrow()
if il_row < 1 then
	return
end if
this.selectrow(0,false)
this.selectrow(il_row, true)
dw_2.Accepttext()
ii_idno = dw_1.object.cust_idno[il_row]

dw_2.retrieve(ii_idno)

end event

event dw_1::clicked;if row < 1 then return

this.scrolltorow(row)

end event

type dw_2 from w_inheritance`dw_2 within w_bdcustper_m
integer x = 773
integer y = 448
integer width = 2802
integer height = 1320
integer taborder = 80
string dataobject = "d_bdcustper_m"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;long ll_row
this.accepttext()

choose case dwo.name
	case 'cust_idno'
		ii_idno = this.object.cust_idno[1]
	case 'cust_no'
		this.object.cust_name[1] = ''
		ll_row = idwc_cust.getrow()
		if ll_row > 0 then
			this.object.cust_name[1] = idwc_cust.getitemstring(ll_row, "comname")
		end if
	case 'cust_name'
		this.object.cust_no[1] = ''
		ll_row = idwc_cust_name.getrow()
		if ll_row > 0 then
			this.object.cust_no[1] = idwc_cust_name.getitemstring(ll_row, "comcode")
		end if
end choose		

end event

event dw_2::retrieveend;string ls_custno

if this.rowcount() < 1 then
	ls_custno = ""
else
	ls_custno = this.object.cust_no[1]
end if
dw_4.retrieve(ls_custno)
end event

type st_title from w_inheritance`st_title within w_bdcustper_m
integer y = 32
string text = "인명정보입력"
end type

type st_tips from w_inheritance`st_tips within w_bdcustper_m
end type

type pb_compute from w_inheritance`pb_compute within w_bdcustper_m
boolean visible = false
integer x = 1719
integer y = 44
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_bdcustper_m
boolean visible = false
integer x = 2871
integer y = 44
end type

type pb_close from w_inheritance`pb_close within w_bdcustper_m
integer x = 3301
integer y = 60
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdcustper_m
integer x = 2907
integer y = 60
integer taborder = 130
end type

event pb_print::clicked;w_repsuper w_print
string ls_sql, ls_where, ls_source

dw_3.retrieve(ii_idno)
//wf_custper_insert()

i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 인명정보내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_bdcustper_m
boolean visible = false
integer x = 2487
integer y = 44
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_bdcustper_m
integer x = 2711
integer y = 60
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

dw_2.RowsMove(1, dw_2.rowCount(), Primary!, dw_2, 1, Delete!)
											
if wf_update1(dw_2, "Y") then
	dw_4.reset()
	dw_1.deleterow(il_row)
   il_row = dw_1.getrow()
	if il_row < 1 then return
	ii_idno = dw_1.object.cust_idno[il_row]

	dw_2.retrieve(ii_idno)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_bdcustper_m
integer x = 2514
integer y = 60
integer taborder = 170
end type

event pb_insert::clicked;
dw_2.reset()
dw_4.reset()

il_row = dw_2.insertrow(0)
dw_2.setfocus()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_bdcustper_m
integer x = 2318
integer y = 60
integer taborder = 160
end type

event pb_retrieve::clicked;dw_1.retrieve()
dw_4.reset()

if rb_1.checked = true then
	rb_1.postevent(clicked!)
elseif rb_2.checked = true then
	rb_2.postevent(clicked!)
elseif rb_3.checked = true then
	rb_3.postevent(clicked!)
elseif rb_4.checked = true then
	rb_4.postevent(clicked!)
else
	string ls_filter
	ls_filter = ''
	dw_1.setfilter(ls_filter)
	dw_1.filter()
end if

//if dw_1.rowcount() < 1 then
//	messagebox("에러","검색한 자료가 없습니다.")
//end if
end event

event pb_retrieve::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"자료검색",parent, li_x, li_y)

end event

type gb_3 from w_inheritance`gb_3 within w_bdcustper_m
integer x = 1541
integer y = 12
integer width = 695
integer height = 212
integer taborder = 90
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_bdcustper_m
integer x = 23
integer y = 428
integer width = 677
integer height = 1756
integer taborder = 100
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_bdcustper_m
integer x = 2277
integer y = 20
integer width = 1243
end type

type cb_2 from commandbutton within w_bdcustper_m
integer x = 50
integer y = 476
integer width = 219
integer height = 84
integer taborder = 60
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

type dw_3 from datawindow within w_bdcustper_m
integer x = 23
integer y = 64
integer width = 197
integer height = 128
integer taborder = 40
string dataobject = "d_bdcustper_r"
boolean livescroll = true
end type

type dw_4 from datawindow within w_bdcustper_m
integer x = 782
integer y = 1764
integer width = 2766
integer height = 420
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_bdcustcom_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_bdcustper_m
integer x = 283
integer y = 476
integer width = 389
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "회사명"
end type

event clicked;string ls_cust_name
   
if dw_1.rowcount() < 1 then
	return
end if
dw_1.setredraw(false)
IF  ib_ncheck = TRUE THEN
    ls_cust_name = "bdcom_comname A"
	 ib_ncheck = FALSE
ELSE
    ls_cust_name = "bdcom_comname D"
	 ib_ncheck = TRUE
END IF
dw_1.SetSort(ls_cust_name)
dw_1.Sort( )
//dw_1.postevent(rowfocuschanged!)
dw_1.setredraw(true)


end event

type rb_1 from radiobutton within w_bdcustper_m
integer x = 1573
integer y = 72
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "발주처"
boolean checked = true
end type

event clicked;string ls_filter
if rb_5.checked = true then
	ls_filter = " (bdcom_comcode like 'M%') and (bdcom_comname like '%" + trim(sle_1.text) + "%')"
elseif rb_6.checked = true then
	ls_filter = " (bdcom_comcode like 'M%') and (project like '%" + trim(sle_2.text) + "%')"
else
	ls_filter = " bdcom_comcode like 'M%' "	
end if
dw_1.setfilter(ls_filter)
dw_1.filter()
end event

type rb_4 from radiobutton within w_bdcustper_m
integer x = 1874
integer y = 136
integer width = 343
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "하도업체"
end type

event clicked;string ls_filter
if rb_5.checked = true then
	ls_filter = " (bdcom_comcode like 'B%') and (bdcom_comname like '%" + trim(sle_1.text) + "%')"
elseif rb_6.checked = true then
	ls_filter = " (bdcom_comcode like 'B%') and (project like '%" + trim(sle_2.text) + "%')"
else
	ls_filter = " bdcom_comcode like 'B%' "	
end if
dw_1.setfilter(ls_filter)
dw_1.filter()
end event

type rb_3 from radiobutton within w_bdcustper_m
integer x = 1573
integer y = 136
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "건설사"
end type

event clicked;string ls_filter
if rb_5.checked = true then
	ls_filter = " (bdcom_comcode like 'C%') and (bdcom_comname like '%" + trim(sle_1.text) + "%')"
elseif rb_6.checked = true then
	ls_filter = " (bdcom_comcode like 'C%') and (project like '%" + trim(sle_2.text) + "%')"
else
	ls_filter = " bdcom_comcode like 'C%' "	
end if
dw_1.setfilter(ls_filter)
dw_1.filter()
end event

type rb_2 from radiobutton within w_bdcustper_m
integer x = 1874
integer y = 72
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "설계사"
end type

event clicked;string ls_filter
if rb_5.checked = true then
	ls_filter = " (bdcom_comcode like 'D%') and (bdcom_comname like '%" + trim(sle_1.text) + "%')"
elseif rb_6.checked = true then
	ls_filter = " (bdcom_comcode like 'D%') and (project like '%" + trim(sle_2.text) + "%')"
else
	ls_filter = " bdcom_comcode like 'D%' "	
end if
dw_1.setfilter(ls_filter)
dw_1.filter()
end event

type rb_5 from radiobutton within w_bdcustper_m
integer x = 631
integer y = 304
integer width = 457
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "거래처명:"
end type

type rb_6 from radiobutton within w_bdcustper_m
integer x = 2080
integer y = 300
integer width = 457
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "현장명:"
end type

type sle_1 from singlelineedit within w_bdcustper_m
integer x = 1093
integer y = 292
integer width = 891
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_bdcustper_m
integer x = 2464
integer y = 292
integer width = 891
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_7 from radiobutton within w_bdcustper_m
integer x = 114
integer y = 304
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "검색안함"
boolean checked = true
end type

type gb_4 from groupbox within w_bdcustper_m
integer x = 23
integer y = 216
integer width = 3525
integer height = 212
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

