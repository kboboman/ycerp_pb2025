$PBExportHeader$w_oicarriage_m.srw
$PBExportComments$운송차량관리(2001/03/15,이인호)
forward
global type w_oicarriage_m from w_inheritance
end type
type cb_3 from commandbutton within w_oicarriage_m
end type
type st_8 from statictext within w_oicarriage_m
end type
type ddlb_fld from dropdownlistbox within w_oicarriage_m
end type
type st_9 from statictext within w_oicarriage_m
end type
type sle_value from singlelineedit within w_oicarriage_m
end type
type cb_filteron from commandbutton within w_oicarriage_m
end type
type cb_filteroff from commandbutton within w_oicarriage_m
end type
type cb_1 from commandbutton within w_oicarriage_m
end type
type cb_2 from commandbutton within w_oicarriage_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oicarriage_m
end type
type ddlb_op from dropdownlistbox within w_oicarriage_m
end type
type em_1 from editmask within w_oicarriage_m
end type
type st_5 from statictext within w_oicarriage_m
end type
type em_2 from editmask within w_oicarriage_m
end type
type st_2 from statictext within w_oicarriage_m
end type
type pb_excel from picturebutton within w_oicarriage_m
end type
type ddlb_status from dropdownlistbox within w_oicarriage_m
end type
type st_1 from statictext within w_oicarriage_m
end type
type rb_1 from radiobutton within w_oicarriage_m
end type
type rb_2 from radiobutton within w_oicarriage_m
end type
end forward

global type w_oicarriage_m from w_inheritance
integer x = 320
integer y = 552
integer width = 5221
integer height = 2568
string title = "배차내역리스트(w_oicarriage_m)"
cb_3 cb_3
st_8 st_8
ddlb_fld ddlb_fld
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
ddlb_dwtitles ddlb_dwtitles
ddlb_op ddlb_op
em_1 em_1
st_5 st_5
em_2 em_2
st_2 st_2
pb_excel pb_excel
ddlb_status ddlb_status
st_1 st_1
rb_1 rb_1
rb_2 rb_2
end type
global w_oicarriage_m w_oicarriage_m

type variables
public string is_bank_code, is_bank_name, is_bank_id
st_print i_print

string   is_sql, is_dw
boolean  ib_check = true

end variables

event open;call super::open;string ls_sdate, ls_edate
string ls_car_no, ls_owner_name, ls_owner_tel, ls_owner_addr, ls_owner_reg,  ls_business, ls_jongmok, ls_owner_bank_master, ls_owner_bank_name, ls_owner_bank_no, ls_car_cust_name 
long 	ll_count
//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

select convert(char(8), dateadd( dd,   1, dateadd(dd,-datepart(dd,getdate()),getdate()) ) ,112)  sdate,
           convert(char(8), dateadd(d,-1,dateadd(m,1,dateadd(dd,1,dateadd(dd,-datepart(dd, getdate()),getdate())))),112) edate
           into :ls_sdate, :ls_edate
from dual;

ddlb_status.text = '전체'
em_1.text = LeftA(ls_sdate,4) + '/' + MidA(ls_sdate,5,2) + '/' + RightA(ls_sdate,2)
em_2.text = LeftA(ls_edate,4) + '/' + MidA(ls_edate,5,2) + '/' + RightA(ls_edate,2)

ls_sdate = LeftA(em_1.text,4) + MidA(em_1.text,6,2)+RightA(em_1.text,2)
ls_edate = LeftA(em_2.text,4) + MidA(em_2.text,6,2)+RightA(em_2.text,2)

//dw_1.retrieve()
dw_1.retrieve(ls_sdate, ls_edate, '%')

for ll_count = 1 to dw_1.rowcount()
	
	ls_car_no = dw_1.object.car_no[ll_count]	
	
	select owner_name, owner_tel, owner_addr, owner_reg, business, jongmok, owner_bank_master, owner_bank_name, owner_bank_no, car_cust_name
	into     :ls_owner_name, :ls_owner_tel, :ls_owner_addr, :ls_owner_reg,  :ls_business, :ls_jongmok, :ls_owner_bank_master, :ls_owner_bank_name, :ls_owner_bank_no, :ls_car_cust_name 
	from car_info        
	where driver = :ls_car_no;	

	 dw_1.object.owner_name[ll_count] = ls_owner_name
	 dw_1.object.owner_tel[ll_count] = ls_owner_tel
	 dw_1.object.owner_addr[ll_count] = ls_owner_addr
	 dw_1.object.owner_reg[ll_count] = ls_owner_reg
	 dw_1.object.business[ll_count] = ls_business
	 dw_1.object.jongmok[ll_count] = ls_jongmok
	
	 dw_1.object.owner_bank_master[ll_count] = ls_owner_bank_master
	 dw_1.object.owner_bank_name[ll_count]	 = ls_owner_bank_name
	 dw_1.object.owner_bank_no[ll_count] = ls_owner_bank_no		
	 dw_1.object.car_cust_name[ll_count] = ls_car_cust_name
	 
	 dw_1.object.owner_name_origin[ll_count] = ls_owner_name	 
	 dw_1.object.owner_tel_origin[ll_count] = ls_owner_tel
	 dw_1.object.owner_addr_origin[ll_count] = ls_owner_addr
	 dw_1.object.owner_reg_origin[ll_count] = ls_owner_reg
	 dw_1.object.business_origin[ll_count] = ls_business
	 dw_1.object.jongmok_origin[ll_count] = ls_jongmok
	
	 dw_1.object.owner_bank_master_origin[ll_count] = ls_owner_bank_master
	 dw_1.object.owner_bank_name_origin[ll_count]	 = ls_owner_bank_name
	 dw_1.object.owner_bank_no_origin[ll_count] = ls_owner_bank_no		
	 dw_1.object.car_cust_name_origin[ll_count] = ls_car_cust_name	 	 
	
next

wf_update1(dw_1,'N')

dw_1.retrieve(ls_sdate, ls_edate, '%')


dw_2.retrieve(ls_sdate, ls_edate, '%')

for ll_count = 1 to dw_2.rowcount()
	
	ls_car_no = dw_2.object.car_no[ll_count]	
	
	select owner_name, owner_tel, owner_addr, owner_reg, business, jongmok, owner_bank_master, owner_bank_name, owner_bank_no, car_cust_name
	into     :ls_owner_name, :ls_owner_tel, :ls_owner_addr, :ls_owner_reg,  :ls_business, :ls_jongmok, :ls_owner_bank_master, :ls_owner_bank_name, :ls_owner_bank_no, :ls_car_cust_name 
	from car_info        
	where driver = :ls_car_no;	

	 dw_2.object.CEO_NM[ll_count] = ls_owner_name
	 dw_2.object.tel[ll_count] = ls_owner_tel
	 dw_2.object.div_addr1[ll_count] = ls_owner_addr
	 dw_2.object.reg_nb[ll_count] = ls_owner_reg
	 dw_2.object.business[ll_count] = ls_business
	 dw_2.object.jongmok[ll_count] = ls_jongmok
	
	 dw_2.object.depositor[ll_count] = ls_owner_bank_master
	 dw_2.object.dummy2[ll_count]	 = ls_owner_bank_name
	 dw_2.object.ba_nb[ll_count] = ls_owner_bank_no
	 dw_2.object.TR_NM[ll_count] = ls_car_cust_name
	
next

//dw_1.sharedata(dw_2)

//if gf_permission('운송비관리자', gs_userid) = 'Y' then
//else
//	pb_insert.enabled = false
//	pb_delete.enabled = false
//	pb_save.enabled   = false
//end if
	
end event

on w_oicarriage_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_op=create ddlb_op
this.em_1=create em_1
this.st_5=create st_5
this.em_2=create em_2
this.st_2=create st_2
this.pb_excel=create pb_excel
this.ddlb_status=create ddlb_status
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.st_9
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_filteron
this.Control[iCurrent+7]=this.cb_filteroff
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.em_2
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.pb_excel
this.Control[iCurrent+17]=this.ddlb_status
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.rb_1
this.Control[iCurrent+20]=this.rb_2
end on

on w_oicarriage_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_op)
destroy(this.em_1)
destroy(this.st_5)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.pb_excel)
destroy(this.ddlb_status)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
end on

event resize;call super::resize;//
dw_1.width  = newwidth  - 64
dw_1.height = newheight - 440
gb_2.width = newwidth  - 64

end event

type pb_save from w_inheritance`pb_save within w_oicarriage_m
integer x = 3831
integer y = 56
end type

event pb_save::clicked;dwitemstatus l_status
string   ls_car_no,	ls_owner_name, ls_owner_tel, 	ls_owner_addr, 	ls_owner_reg,	ls_business, 	ls_jongmok,	 ls_owner_bank_master
string    ls_owner_bank_name, ls_owner_bank_no, ls_car_cust_name, ls_contents

string   ls_owner_name_origin, ls_owner_tel_origin, 	ls_owner_addr_origin, 	ls_owner_reg_origin,	ls_business_origin, 	ls_jongmok_origin,	 ls_owner_bank_master_origin
string   ls_owner_bank_name_origin, ls_owner_bank_no_origin, ls_car_cust_name_origin

datetime ldt_sysdate
int li_cnt1, li_cnt2, ll_count
long l_log_seq

dw_1.accepttext()

if dw_1.rowcount() < 1 then RETURN

for ll_count = 1 to dw_1.rowcount()
	
	l_status = dw_1.getitemstatus(ll_count, 0, primary!)	
	
	if l_status = New! or l_status = NewModified! or l_status = DataModified! then
	
		ls_car_no = trim(dw_1.object.car_no[ll_count])
		ls_owner_name = trim(dw_1.object.owner_name[ll_count])
		ls_owner_tel = trim(dw_1.object.owner_tel[ll_count])
		ls_owner_addr = trim(dw_1.object.owner_addr[ll_count])
		ls_owner_reg = trim(dw_1.object.owner_reg[ll_count])
		ls_business = trim(dw_1.object.business[ll_count])
		ls_jongmok = trim(dw_1.object.jongmok[ll_count])
		
		ls_owner_bank_master = trim(dw_1.object.owner_bank_master[ll_count])
		ls_owner_bank_name = trim(dw_1.object.owner_bank_name[ll_count]	)
		ls_owner_bank_no = trim(dw_1.object.owner_bank_no[ll_count])
		ls_car_cust_name = trim(dw_1.object.car_cust_name[ll_count])
		
		
		ls_owner_name_origin = trim(dw_1.object.owner_name_origin[ll_count])
		ls_owner_tel_origin = trim(dw_1.object.owner_tel_origin[ll_count])
		ls_owner_addr_origin = trim(dw_1.object.owner_addr_origin[ll_count])
		ls_owner_reg_origin = trim(dw_1.object.owner_reg_origin[ll_count])
		ls_business_origin = trim(dw_1.object.business_origin[ll_count])
		ls_jongmok_origin = trim(dw_1.object.jongmok_origin[ll_count])
		
		ls_owner_bank_master_origin = trim(dw_1.object.owner_bank_master_origin[ll_count])
		ls_owner_bank_name_origin = trim(dw_1.object.owner_bank_name_origin[ll_count]	)
		ls_owner_bank_no_origin = trim(dw_1.object.owner_bank_no_origin[ll_count])
		ls_car_cust_name_origin = trim(dw_1.object.car_cust_name_origin[ll_count])		
		
		if (  ls_owner_name <> ls_owner_name_origin or ls_owner_tel <> ls_owner_tel_origin or ls_owner_addr <> ls_owner_addr_origin or &
		      ls_owner_reg <> ls_owner_reg_origin or ls_business <> ls_business_origin or ls_jongmok <> ls_jongmok_origin or ls_owner_bank_master <> ls_owner_bank_master_origin or &
		      ls_owner_bank_name <> ls_owner_bank_name_origin or ls_owner_bank_no <> ls_owner_bank_no_origin or  ls_car_cust_name <> ls_car_cust_name_origin) then		
				
			 if isnull(ls_owner_name) then ls_owner_name = '' 
			 if isnull(ls_owner_tel) then ls_owner_tel = '' 
			 if isnull(ls_owner_addr) then ls_owner_addr = '' 
			 if isnull(ls_owner_reg) then ls_owner_reg = '' 
			 if isnull(ls_business) then ls_business = '' 
			 if isnull(ls_jongmok) then ls_jongmok = '' 
			 if isnull(ls_owner_bank_master) then ls_owner_bank_master = '' 			 
			 if isnull(ls_owner_bank_name) then ls_owner_bank_name = '' 	
			 if isnull(ls_owner_bank_no) then ls_owner_bank_no = '' 	
			 if isnull(ls_car_cust_name) then ls_car_cust_name = '' 						
				
				
			update car_info
				set owner_name   =  :ls_owner_name ,
						owner_tel    =  :ls_owner_tel,
						owner_addr = :ls_owner_addr,
						owner_reg   = :ls_owner_reg,
						business      = :ls_business,
						jongmok      = :ls_jongmok,
						owner_bank_master = :ls_owner_bank_master,
						owner_bank_name = :ls_owner_bank_name,
						owner_bank_no = :ls_owner_bank_no,
						car_cust_name  = :ls_car_cust_name
			where driver = :ls_car_no;				
		
			ls_contents  = 'ls_car_no: ' + ls_car_no + &
								'ls_owner_name: ' +ls_owner_name + &
								'ls_owner_tel: ' +ls_owner_tel + &
								'ls_owner_addr: ' + ls_owner_addr + &
								'ls_owner_reg: ' + ls_owner_reg + &
								'ls_business: ' + ls_business + &
								'ls_jongmok: ' + ls_jongmok + &
								'ls_owner_bank_master: ' + ls_owner_bank_master + &
								'ls_owner_bank_name: ' + ls_owner_bank_name + &
								'ls_owner_bank_no: ' + ls_owner_bank_no + &							
								'ls_car_cust_name: ' + ls_car_cust_name		
			
			
			insert into erp_log 
			values ( getdate(), :gs_userid, :ls_contents );
			
		end if			
			
	end if		
	
next



//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
WF_Update1( dw_1, "Y" )



end event

type dw_1 from w_inheritance`dw_1 within w_oicarriage_m
integer x = 27
integer y = 416
integer width = 4142
integer height = 2016
string dataobject = "d_oicarriage_m"
end type

event dw_1::getfocus;call super::getfocus;//
is_dw = "dw_1"
end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oicarriage_m
integer x = 32
integer y = 36
integer width = 1175
integer height = 140
string text = "배차내역 리스트 관리"
end type

type st_tips from w_inheritance`st_tips within w_oicarriage_m
end type

type pb_compute from w_inheritance`pb_compute within w_oicarriage_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_oicarriage_m
boolean visible = false
integer x = 3419
end type

type pb_close from w_inheritance`pb_close within w_oicarriage_m
integer x = 4023
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicarriage_m
boolean visible = false
integer x = 1029
integer y = 0
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then
	return
end if
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 운송차량 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oicarriage_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oicarriage_m
boolean visible = false
integer x = 1966
integer y = 44
integer taborder = 130
boolean enabled = false
end type

event pb_delete::clicked;string ls_driver, ls_bank_check
int li_count
if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()

ls_driver = dw_1.object.driver[dw_1.getrow()]
select count(*) into :li_count from do 
   where driver = :ls_driver;
IF li_count > 0 THEN
	Messagebox("에러", "출고관리에서 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
	return
END IF

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_oicarriage_m
boolean visible = false
integer x = 1774
integer y = 44
integer taborder = 150
boolean enabled = false
end type

event pb_insert::clicked;//
long ll_row, ll_count

dw_1.accepttext()

for ll_count = 1 to dw_1.rowcount()
	if isnull(dw_1.object.driver[ll_count]) OR dw_1.object.driver[ll_count] <= "" then
		MessageBox("입력오류", string(ll_count) + " 번째 차량NO을 입력하십시오")
		dw_1.setcolumn("driver")
		dw_1.setfocus()
		RETURN
	end if
next

//
ll_row = dw_1.insertrow( dw_1.getrow() )

dw_1.scrolltorow(ll_row)
dw_1.object.sys_date[ll_row] = GF_Today()

dw_1.setcolumn("driver")
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oicarriage_m
integer x = 3465
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;string ls_sdate, ls_edate, ls_status
string ls_car_no, ls_owner_name, ls_owner_tel, ls_owner_addr, ls_owner_reg,  ls_business, ls_jongmok, ls_owner_bank_master, ls_owner_bank_name, ls_owner_bank_no, ls_car_cust_name 
long 	ll_count

dw_1.reset()

//ls_status = ddlb_status.text
ls_sdate = LeftA(em_1.text,4) + MidA(em_1.text,6,2)+RightA(em_1.text,2)
ls_edate = LeftA(em_2.text,4) + MidA(em_2.text,6,2)+RightA(em_2.text,2)


if trim(ddlb_status.text) = '전체' then
	ls_status = '%'
elseif trim(ddlb_status.text) = '작성전' then
	ls_status = '03'	
elseif trim(ddlb_status.text) = '엑셀작성' then	
	ls_status = '04'
end if

if rb_1.checked then

	dw_1.retrieve(ls_sdate, ls_edate, ls_status)
	
else

	dw_1.retrieve(ls_sdate, ls_edate)
	
end if

for ll_count = 1 to dw_1.rowcount()
	
	ls_car_no = dw_1.object.car_no[ll_count]	
	
	select owner_name, owner_tel, owner_addr, owner_reg, business, jongmok, owner_bank_master, owner_bank_name, owner_bank_no, car_cust_name
	into     :ls_owner_name, :ls_owner_tel, :ls_owner_addr, :ls_owner_reg,  :ls_business, :ls_jongmok, :ls_owner_bank_master, :ls_owner_bank_name, :ls_owner_bank_no, :ls_car_cust_name 
	from car_info        
	where driver = :ls_car_no;	

	 dw_1.object.owner_name[ll_count] = ls_owner_name	 
	 dw_1.object.owner_tel[ll_count] = ls_owner_tel
	 dw_1.object.owner_addr[ll_count] = ls_owner_addr
	 dw_1.object.owner_reg[ll_count] = ls_owner_reg
	 dw_1.object.business[ll_count] = ls_business
	 dw_1.object.jongmok[ll_count] = ls_jongmok
	
	 dw_1.object.owner_bank_master[ll_count] = ls_owner_bank_master
	 dw_1.object.owner_bank_name[ll_count]	 = ls_owner_bank_name
	 dw_1.object.owner_bank_no[ll_count] = ls_owner_bank_no		
	 dw_1.object.car_cust_name[ll_count] = ls_car_cust_name
	 	 
	 dw_1.object.owner_name_origin[ll_count] = ls_owner_name	 
	 dw_1.object.owner_tel_origin[ll_count] = ls_owner_tel
	 dw_1.object.owner_addr_origin[ll_count] = ls_owner_addr
	 dw_1.object.owner_reg_origin[ll_count] = ls_owner_reg
	 dw_1.object.business_origin[ll_count] = ls_business
	 dw_1.object.jongmok_origin[ll_count] = ls_jongmok
	
	 dw_1.object.owner_bank_master_origin[ll_count] = ls_owner_bank_master
	 dw_1.object.owner_bank_name_origin[ll_count]	 = ls_owner_bank_name
	 dw_1.object.owner_bank_no_origin[ll_count] = ls_owner_bank_no		
	 dw_1.object.car_cust_name_origin[ll_count] = ls_car_cust_name	 	 
	
next

dw_2.retrieve(ls_sdate, ls_edate)


for ll_count = 1 to dw_2.rowcount()
	
	ls_car_no = dw_2.object.car_no[ll_count]	
	
	select owner_name, owner_tel, owner_addr, owner_reg, business, jongmok, owner_bank_master, owner_bank_name, owner_bank_no, car_cust_name
	into     :ls_owner_name, :ls_owner_tel, :ls_owner_addr, :ls_owner_reg,  :ls_business, :ls_jongmok, :ls_owner_bank_master, :ls_owner_bank_name, :ls_owner_bank_no, :ls_car_cust_name 
	from car_info        
	where driver = :ls_car_no;	

	 dw_2.object.CEO_NM[ll_count] = ls_owner_name
	 dw_2.object.tel[ll_count] = ls_owner_tel
	 dw_2.object.div_addr1[ll_count] = ls_owner_addr
	 dw_2.object.reg_nb[ll_count] = ls_owner_reg
	 dw_2.object.business[ll_count] = ls_business
	 dw_2.object.jongmok[ll_count] = ls_jongmok
	
	 dw_2.object.depositor[ll_count] = ls_owner_bank_master
	 dw_2.object.dummy2[ll_count]	 = ls_owner_bank_name
	 dw_2.object.ba_nb[ll_count] = ls_owner_bank_no
	 dw_2.object.TR_NM[ll_count] = ls_car_cust_name
	
next

//dw_1.sharedata(dw_2)

end event

type gb_3 from w_inheritance`gb_3 within w_oicarriage_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_oicarriage_m
integer x = 27
integer y = 232
integer width = 4137
integer height = 168
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_oicarriage_m
integer x = 3433
integer y = 16
integer width = 809
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_oicarriage_m
integer x = 27
integer y = 164
integer width = 114
integer height = 80
integer taborder = 60
string dataobject = "d_oicarriage_excel"
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_oicarriage_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type st_8 from statictext within w_oicarriage_m
integer x = 78
integer y = 308
integer width = 174
integer height = 56
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
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_oicarriage_m
integer x = 261
integer y = 288
integer width = 480
integer height = 580
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_9 from statictext within w_oicarriage_m
integer x = 777
integer y = 308
integer width = 174
integer height = 56
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_oicarriage_m
integer x = 1225
integer y = 292
integer width = 581
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_oicarriage_m
integer x = 1819
integer y = 288
integer width = 197
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_oicarriage_m
integer x = 2021
integer y = 288
integer width = 197
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_oicarriage_m
integer x = 2222
integer y = 288
integer width = 183
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_oicarriage_m
integer x = 2409
integer y = 288
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type ddlb_dwtitles from dropdownlistbox within w_oicarriage_m
integer x = 320
integer y = 304
integer width = 306
integer height = 92
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_op from dropdownlistbox within w_oicarriage_m
integer x = 942
integer y = 288
integer width = 274
integer height = 500
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type em_1 from editmask within w_oicarriage_m
integer x = 1545
integer y = 80
integer width = 443
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 65535
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;// FROM
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_5 from statictext within w_oicarriage_m
integer x = 1979
integer y = 92
integer width = 110
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_2 from editmask within w_oicarriage_m
integer x = 2075
integer y = 80
integer width = 443
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 65535
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;// FROM
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_oicarriage_m
integer x = 1239
integer y = 92
integer width = 297
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "조회시간"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_excel from picturebutton within w_oicarriage_m
event mousemove pbm_mousemove
integer x = 3653
integer y = 56
integer width = 178
integer height = 144
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"엑셀생성",parent, li_x, li_y)
end event

event clicked;
string ls_Docname, ls_Named, ls_ExpandName, ls_sdate, ls_edate, ls_cardate, ls_scene_code, ls_status
string ls_car_no, ls_owner_name, ls_owner_tel, ls_owner_addr, ls_owner_reg,  ls_business, ls_jongmok, ls_owner_bank_master, ls_owner_bank_name, ls_owner_bank_no, ls_car_cust_name
integer ls_Value, li_Pos, li_value, ll_count, l_car_seq

if trim(ddlb_status.text) = '전체' then
	ls_status = '%'
elseif trim(ddlb_status.text) = '작성전' then
	ls_status = '03'	
elseif trim(ddlb_status.text) = '엑셀작성' then	
	ls_status = '04'
end if

ls_sdate = LeftA(em_1.text,4) + MidA(em_1.text,6,2)+RightA(em_1.text,2)
ls_edate = LeftA(em_2.text,4) + MidA(em_2.text,6,2)+RightA(em_2.text,2)

dw_2.retrieve(ls_sdate, ls_edate)

for ll_count = 1 to dw_2.rowcount()
	
	ls_car_no = dw_2.object.car_no[ll_count]	
	
	select owner_name, owner_tel, owner_addr, owner_reg, business, jongmok, owner_bank_master, owner_bank_name, owner_bank_no, car_cust_name
	into     :ls_owner_name, :ls_owner_tel, :ls_owner_addr, :ls_owner_reg,  :ls_business, :ls_jongmok, :ls_owner_bank_master, :ls_owner_bank_name, :ls_owner_bank_no, :ls_car_cust_name 
	from car_info        
	where driver = :ls_car_no;	

	 dw_2.object.CEO_NM[ll_count] = ls_owner_name
	 dw_2.object.tel[ll_count] = ls_owner_tel
	 dw_2.object.div_addr1[ll_count] = ls_owner_addr
	 dw_2.object.reg_nb[ll_count] = ls_owner_reg
	 dw_2.object.business[ll_count] = ls_business
	 dw_2.object.jongmok[ll_count] = ls_jongmok
	
	 dw_2.object.depositor[ll_count] = ls_owner_bank_master
	 dw_2.object.dummy2[ll_count]	 = ls_owner_bank_name
	 dw_2.object.ba_nb[ll_count] = ls_owner_bank_no
	 dw_2.object.TR_NM[ll_count] = ls_car_cust_name 	
	 
	 
	 /*2019.04.04 jowonsuk 어떻게할지 점검 필요, 엑셀변경  '04'*/
	 update dbo.car_carriage
	         set car_status = '04'
	 where  cardate = :ls_cardate
		  and scene_code = :ls_scene_code											
		  and car_seq = :l_car_seq;		
	
next

if dw_2.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	ls_Docname, ls_Named, "XLS",  &
	"엑셀 (*.XLS), *.XLS," + &
   "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
  		      dw_2.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
    		      dw_2.SaveAs(ls_DocName, CSV!, TRUE)
      end if
end if

end event

type ddlb_status from dropdownlistbox within w_oicarriage_m
integer x = 2825
integer y = 132
integer width = 480
integer height = 400
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"전체","작성전","엑셀작성"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_oicarriage_m
integer x = 2606
integer y = 148
integer width = 201
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "상태"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oicarriage_m
integer x = 2555
integer y = 44
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "재무자료"
boolean checked = true
end type

event clicked;	dw_1.dataobject = 'd_oicarriage_m' /*신규 장표 2018.08.29 jowonsuk */
	dw_1.SetTransObject(sqlca)	
	
	ddlb_dwtitles.reset()
     ddlb_dwtitles.visible = false
     GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	
	ddlb_status.enabled = true
	st_1.enabled = true
end event

type rb_2 from radiobutton within w_oicarriage_m
integer x = 2958
integer y = 44
integer width = 448
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "차량점검용"
end type

event clicked;	dw_1.dataobject = 'd_oicarriage_m_check' /*신규 장표 2018.08.29 jowonsuk */
	dw_1.SetTransObject(sqlca)	
	
	ddlb_dwtitles.reset()
     ddlb_dwtitles.visible = false
     GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	
	
	ddlb_status.enabled = false
	st_1.enabled = false
	
end event

