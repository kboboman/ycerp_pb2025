$PBExportHeader$w_whcustper_w.srw
$PBExportComments$고객관리조회(1998/04/27,이인호)
forward 
global type w_whcustper_w from Window
end type
type cb_3 from commandbutton within w_whcustper_w
end type
type ddlb_1 from dropdownlistbox within w_whcustper_w
end type
type cb_2 from commandbutton within w_whcustper_w
end type
type cb_1 from commandbutton within w_whcustper_w
end type
type dw_1 from datawindow within w_whcustper_w
end type
end forward

global type w_whcustper_w from Window
int X=833
int Y=361
int Width=1665
int Height=1529
boolean TitleBar=true
string Title="고객자료검색(w_whcustper_w)"
long BackColor=78160032
WindowType WindowType=response!
cb_3 cb_3
ddlb_1 ddlb_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_whcustper_w w_whcustper_w

type variables
gs_custper_str istr_select
int ii_cur
string is_where, is_data
string is_where1, is_where2, is_where3, is_where4, is_where5
string is_where6, is_where7, is_where8, is_where9, is_where10
string is_where11, is_where12, is_where13, is_where14, is_where15
string is_where16, is_where17, is_where18, is_where19, is_where20
string is_where21, is_where22, is_where23, is_where24, is_where25
string is_where26, is_where27, is_where28, is_where29, is_where30
string is_where31, is_where32, is_where33, is_where34, is_where35
string is_where36, is_where37

end variables

event open;dw_1.SetTransObject(SQLCA)


end event

on w_whcustper_w.create
this.cb_3=create cb_3
this.ddlb_1=create ddlb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={ this.cb_3,&
this.ddlb_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_whcustper_w.destroy
destroy(this.cb_3)
destroy(this.ddlb_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_3 from commandbutton within w_whcustper_w
int X=746
int Y=29
int Width=334
int Height=101
int TabOrder=20
string Text="전체선택"
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;istr_select.str_where = 'ALL'
istr_select.str_ok = TRUE
closewithreturn(parent, istr_select)
end event

type ddlb_1 from dropdownlistbox within w_whcustper_w
int X=28
int Y=29
int Width=622
int Height=529
int TabOrder=10
string Text="기본인적사항"
boolean Sorted=false
boolean VScrollBar=true
long TextColor=16711680
long BackColor=16777215
int TextSize=-12
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
string Item[]={"기본인적사항",&
"가족사항",&
"학력사항",&
"경력사항",&
"자격사항",&
"기타정보"}
end type

event selectionchanged;choose case index
	case 1 // 기본인적사항
		  dw_1.dataobject = 'd_whcustper_s'
		  ii_cur = 1
	case 2 // 가족사항
        dw_1.dataobject = 'd_whcustfam_s'
		  ii_cur = 2
	case 3 // 학력사항
        dw_1.dataobject = 'd_whcustsch_s'	
		  ii_cur = 3
	case 4 // 경력사항
        dw_1.dataobject = 'd_whcustcar_s'		  
		  ii_cur = 4
	case 5 // 자격사항
        dw_1.dataobject = 'd_whcustlic_s'		  
		  ii_cur = 5
	case 6 // 기타정보
        dw_1.dataobject = 'd_whcustetc_s'		  
		  ii_cur = 6
end choose			
dw_1.insertrow(1)
end event

event constructor;dw_1.dataobject = 'd_whcustper_s'
ii_cur = 1
dw_1.insertrow(1)
end event

type cb_2 from commandbutton within w_whcustper_w
int X=1372
int Y=29
int Width=247
int Height=101
int TabOrder=30
string Text="취소"
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;//istr_select.str_insert_count = integer(em_1.text)
istr_select.str_ok = FALSE
closewithreturn(parent, istr_select)
end event

type cb_1 from commandbutton within w_whcustper_w
int X=1102
int Y=29
int Width=247
int Height=101
int TabOrder=50
string Text="확인"
int TextSize=-11
int Weight=700
string FaceName="굴림체"
FontCharSet FontCharSet=Hangeul!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

event clicked;istr_select.str_ok = TRUE
closewithreturn(parent, istr_select)
end event

type dw_1 from datawindow within w_whcustper_w
event ue_per pbm_custom01
event ue_fam pbm_custom02
event ue_sch pbm_custom03
event ue_car pbm_custom04
event ue_lic pbm_custom05
event ue_etc pbm_custom06
int X=23
int Y=153
int Width=1601
int Height=1269
int TabOrder=40
string DataObject="d_whcustper_s"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

event ue_per;string ls_start, ls_end, ls_string
long ll_start, ll_end


choose case dw_1.getcolumnname()
	case 'cust_no'
		if isnull(is_data) or is_data = '' then
			is_where1 = ''
		else
			is_where1 = " and cust_no like ~~'" + is_data + "%~~' "
		end if
	case 'cust_hname'
		if isnull(is_data) or is_data = '' then
			is_where2 = ''
		else
			is_where2 = " and cust_hname like ~~'" + is_data + "%~~' "
		end if
	case 'cust_ename'
		if isnull(is_data) or is_data = '' then
			is_where3 = ''
		else
			is_where3 = " and cust_ename like ~~'" + is_data + "%~~' "
		end if
	case 'sex'
		if isnull(is_data) or is_data = '' or is_data = 'A' then
			is_where4 = ''
		else
			is_where4 = " and sex like ~~'" + is_data + "%~~' "
		end if
	case 'cust_idno'
		if isnull(is_data) or is_data = '' then
			is_where5 = ''
		else
			is_where5 = " and custper.cust_idno like ~~'" + is_data + "%~~' "
		end if
	case 'bir_class'
		if isnull(is_data) or is_data = '' or is_data = 'A' then
			is_where6 = ''
		else
			is_where6 = " and bir_class like ~~'" + is_data + "%~~' "
		end if
	case 'birthday', 'bir_end'
		if isnull(is_data) or is_data = '' then
			is_where7 = ''
		else
			ls_start = string(dw_1.object.birthday[1])
			ls_end = string(dw_1.object.bir_end[1])
			is_where7 = " and birthday between ~~'" + ls_start + "~~' and ~~'" + ls_end + "~~'"
		end if
	case 'age', 'age_end'
		if isnull(is_data) or is_data = '' then
			is_where8 = ''
		else
			ll_start = dw_1.object.age[1]
			ll_end = dw_1.object.age_end[1]
			is_where8 = " and age between " + string(ll_start) &
			            + "  and " + string(ll_end) + " "
		end if
	case 'ori_area'
		if isnull(is_data) or is_data = '' then
			is_where9 = ''
		else
			is_where9 = " and ori_area like ~~'" + is_data + "%~~' "
		end if
	case 'born_area'
		if isnull(is_data) or is_data = '' then
			is_where10 = ''
		else
			is_where10 = " and born_area like ~~'" + is_data + "%~~' "
		end if
	case 'dept'
		if isnull(is_data) or is_data = '' then
			is_where11 = ''
		else
			is_where11 = " and dept like ~~'" + is_data + "%~~' "
		end if
	case 'off_level'
		if isnull(is_data) or is_data = '' then
			is_where12 = ''
		else
			is_where12 = " and off_level like ~~'" + is_data + "%~~' "
		end if
	case 'tel1'
		if isnull(is_data) or is_data = '' then
			is_where13 = ''
		else
			is_where13 = " and tel1 like ~~'" + is_data + "%~~' "
		end if
	case 'tel2'
		if isnull(is_data) or is_data = '' then
			is_where14 = ''
		else
			is_where14 = " and tel2 like ~~'" + is_data + "%~~' "
		end if
	case 'phone'
		if isnull(is_data) or is_data = '' then
			is_where15 = ''
		else
			is_where15 = " and phone like ~~'" + is_data + "%~~' "
		end if
	case 'pager'
		if isnull(is_data) or is_data = '' then
			is_where16 = ''
		else
			is_where16 = " and pager like ~~'" + is_data + "%~~' "
		end if
	case 'etc_tel'
		if isnull(is_data) or is_data = '' then
			is_where17 = ''
		else
			is_where17 = " and etc_tel like ~~'" + is_data + "%~~' "
		end if
	case 'born_addr'
		if isnull(is_data) or is_data = '' then
			is_where18 = ''
		else
			is_where18 = " and born_addr like ~~'" + is_data + "%~~' "
		end if
	case 'addr1'
		if isnull(is_data) or is_data = '' then
			is_where19 = ''
		else
			is_where19 = " and addr1 like ~~'" + is_data + "%~~' "
		end if
	case 'addr2'
		if isnull(is_data) or is_data = '' then
			is_where20 = ''
		else
			is_where20 = " and addr2 like ~~'" + is_data + "%~~' "
		end if
	case 'resident'
		if isnull(is_data) or is_data = '' then
			is_where21 = ''
		else
			is_where21 = " and resident like ~~'" + is_data + "%~~' "
		end if
	case 'marriage_date'
		if isnull(is_data) or is_data = '' then
			is_where22 = ''
		else
			ls_start = string(dw_1.object.marriage_date[1])
			is_where22 = " and marriage_date like ~~'" + ls_start + "%~~' "
		end if
	case 'taste'
		if isnull(is_data) or is_data = '' then
			is_where23 = ''
		else
			is_where23 = " and taste like ~~'" + is_data + "%~~' "
		end if
	case 'special'
		if isnull(is_data) or is_data = '' then
			is_where24 = ''
		else
			is_where24 = " and special like ~~'" + is_data + "%~~' "
		end if
	case 'army_group'
		if isnull(is_data) or is_data = '' then
			is_where25 = ''
		else
			is_where25 = " and army_group like ~~'" + is_data + "%~~' "
		end if
	case 'army_type'
		if isnull(is_data) or is_data = '' then
			is_where26 = ''
		else
			is_where26 = " and army_type like ~~'" + is_data + "%~~' "
		end if
	case 'army_major'
		if isnull(is_data) or is_data = '' then
			is_where27 = ''
		else
			is_where27 = " and army_major like ~~'" + is_data + "%~~' "
		end if
	case 'army_grad'
		if isnull(is_data) or is_data = '' then
			is_where28 = ''
		else
			is_where28 = " and army_grad like ~~'" + is_data + "%~~' "
		end if
	case 'army_in_date'
		if isnull(is_data) or is_data = '' then
			is_where29 = ''
		else
			ls_start = string(dw_1.object.army_in_date[1])
			is_where29 = " and army_in_date like ~~'" + ls_start + "%~~' "
		end if
	case 'army_out_date'
		if isnull(is_data) or is_data = '' then
			is_where30 = ''
		else
			ls_start = string(dw_1.object.army_out_date[1])
			is_where30 = " and army_out_date like ~~'" + ls_start + "%~~' "
		end if
	case 'army_reason'
		if isnull(is_data) or is_data = '' then
			is_where31 = ''
		else
			is_where31 = " and army_reason like ~~'" + is_data + "%~~' "
		end if
	case 'blood_type'
		if isnull(is_data) or is_data = '' then
			is_where32 = ''
		else
			is_where32 = " and blood_type like ~~'" + is_data + "%~~' "
		end if
	case 'size'
		if isnull(is_data) or is_data = '' then
			is_where33 = ''
		else
			ls_string = string(is_data)
			is_where33 = " and size = " + ls_string
		end if
	case 'weight'
		if isnull(is_data) or is_data = '' then
			is_where34 = ''
		else
			ls_string = string(is_data)
			is_where34 = " and weight = " + ls_string
		end if
	case 'eye_gradel'
		if isnull(is_data) or is_data = '' then
			is_where35 = ''
		else
			ls_string = string(is_data)
			is_where35 = " and eye_gradel = " + ls_string
		end if
	case 'eye_gradr'
		if isnull(is_data) or is_data = '' then
			is_where36 = ''
		else
			ls_string = string(is_data)
			is_where36 = " and eye_gradr = " + ls_string
		end if
	case 'cust_name'
		if isnull(is_data) or is_data = '' then
			is_where37 = ''
		else
			is_where37 = " and cust_name like ~~'" + is_data + "%~~' "
		end if
end choose
istr_select.str_where = is_where1 + is_where2 &
	+ is_where3  + is_where4 + is_where5 &
	 + is_where6 + is_where7 + is_where8 + is_where9 + is_where10 &
	 + is_where11 + is_where12 + is_where13 + is_where14 + is_where15 &
	 + is_where16 + is_where17 + is_where18 + is_where19 + is_where20 &
	 + is_where21 + is_where22 + is_where23 + is_where24 + is_where25 &
	 + is_where26 + is_where27 + is_where28 + is_where29 + is_where30 &
	 + is_where31 + is_where32 + is_where33 + is_where34 + is_where35 &
	 + is_where36 + is_where37

end event

event ue_fam;string ls_start, ls_end, ls_string
long ll_start, ll_end


choose case dw_1.getcolumnname()
	case 'fam_name'
		if isnull(is_data) or is_data = '' then
			is_where1 = ''
		else
			is_where1 = " and fam_name like ~~'" + is_data + "%~~' "
		end if
	case 'fam_rel'
		if isnull(is_data) or is_data = '' then
			is_where2 = ''
		else
			is_where2 = " and fam_rel like ~~'" + is_data + "%~~' "
		end if
	case 'fam_id'
		if isnull(is_data) or is_data = '' then
			is_where3 = ''
		else
			is_where3 = " and fam_id like ~~'" + is_data + "%~~' "
		end if
	case 'fam_ename'
		if isnull(is_data) or is_data = '' then
			is_where4 = ''
		else
			is_where4 = " and fam_ename like ~~'" + is_data + "%~~' "
		end if
	case 'fam_birth', 'bir_end'
		if isnull(is_data) or is_data = '' then
			is_where5 = ''
		else
			ls_start = string(dw_1.object.fam_birth[1])
			ls_end = string(dw_1.object.bir_end[1])
			is_where5 = " and fam_birth between ~~'" + ls_start + "~~' and ~~'" + ls_end + "~~'"
		end if
	case 'fam_age', 'age_end'
		if isnull(is_data) or is_data = '' then
			is_where6 = ''
		else
			ll_start = dw_1.object.fam_age[1]
			ll_end = dw_1.object.age_end[1]
				is_where6 = " and fam_age between " + string(ll_start) &
			            + "  and " + string(ll_end) + " "
		end if
	case 'fam_job'
		if isnull(is_data) or is_data = '' then
			is_where7 = ''
		else
			is_where7 = " and fam_job like ~~'" + is_data + "%~~' "
		end if
	case 'fam_fcorp'
		if isnull(is_data) or is_data = '' then
			is_where8 = ''
		else
			is_where8 = " and fam_fcorp like ~~'" + is_data + "%~~' "
		end if
	case 'fam_ps'
		if isnull(is_data) or is_data = '' then
			is_where9 = ''
		else
			is_where9 = " and fam_ps like ~~'" + is_data + "%~~' "
		end if
	case 'born_area'
		if isnull(is_data) or is_data = '' then
			is_where10 = ''
		else
			is_where10 = " and born_area like ~~'" + is_data + "%~~' "
		end if
	case 'fam_marriage'
		if isnull(is_data) or is_data = '' then
			is_where11 = ''
		else
			is_where11 = " and fam_marriage like ~~'" + is_data + "%~~' "
		end if
	case 'fam_school'
		if isnull(is_data) or is_data = '' then
			is_where12 = ''
		else
			is_where12 = " and fam_school like ~~'" + is_data + "%~~' "
		end if
	case 'fam_addr'
		if isnull(is_data) or is_data = '' then
			is_where13 = ''
		else
			is_where13 = " and fam_addr like ~~'" + is_data + "%~~' "
		end if
end choose
istr_select.str_where = " and custper.cust_idno = custfam.cust_idno " + is_where1 + is_where2 &
	+ is_where3  + is_where4 + is_where5 &
	 + is_where6 + is_where7 + is_where8 + is_where9 + is_where10 &
	 + is_where11 + is_where12 + is_where13
	 
end event

event ue_sch;string ls_start, ls_end, ls_string
long ll_start, ll_end


choose case dw_1.getcolumnname()
	case 'out_year'
		if isnull(is_data) or is_data = '' then
			is_where1 = ''
		else
			ls_start = string(dw_1.object.out_year[1])
			is_where1 = " and out_year like ~~'" + ls_start + "%~~' "
		end if
	case 'shname'
		if isnull(is_data) or is_data = '' then
			is_where2 = ''
		else
			is_where2 = " and shname like ~~'" + is_data + "%~~' "
		end if
	case 'major'
		if isnull(is_data) or is_data = '' then
			is_where3 = ''
		else
			is_where3 = " and major like ~~'" + is_data + "%~~' "
		end if
	case 'hak'
		if isnull(is_data) or is_data = '' then
			is_where4 = ''
		else
			is_where4 = " and hak like ~~'" + is_data + "%~~' "
		end if
	case 'rem'
		if isnull(is_data) or is_data = '' then
			is_where5 = ''
		else
			is_where5 = " and rem like ~~'" + is_data + "%~~' "
		end if
end choose
istr_select.str_where = " and custper.cust_idno = custsch.cust_idno " + is_where1 + is_where2 &
	+ is_where3  + is_where4 + is_where5

end event

event ue_car;string ls_start, ls_end, ls_string
long ll_start, ll_end


choose case dw_1.getcolumnname()
	case 'car_indate'
		if isnull(is_data) or is_data = '' then
			is_where1 = ''
		else
			ls_start = string(dw_1.object.car_indate[1])
			is_where1 = " and car_indate like ~~'" + ls_start + "%~~' "
		end if
	case 'car_outdate'
		if isnull(is_data) or is_data = '' then
			is_where2 = ''
		else
			ls_start = string(dw_1.object.car_outdate[1])
			is_where2 = " and car_outdate like ~~'" + ls_start + "%~~' "
		end if
	case 'corp_name'
		if isnull(is_data) or is_data = '' then
			is_where3 = ''
		else
			is_where3 = " and corp_name like ~~'" + is_data + "%~~' "
		end if
	case 'grad_name'
		if isnull(is_data) or is_data = '' then
			is_where4 = ''
		else
			is_where4 = " and grad_name like ~~'" + is_data + "%~~' "
		end if
	case 'func_name'
		if isnull(is_data) or is_data = '' then
			is_where5 = ''
		else
			is_where5 = " and func_name like ~~'" + is_data + "%~~' "
		end if
end choose
istr_select.str_where = " and custper.cust_idno = custcar.cust_idno " + is_where1 + is_where2 &
	+ is_where3  + is_where4 + is_where5

end event

event ue_lic;string ls_start, ls_end, ls_string
long ll_start, ll_end


choose case dw_1.getcolumnname()
	case 'licenout_date'
		if isnull(is_data) or is_data = '' then
			is_where1 = ''
		else
			ls_start = string(dw_1.object.licenout_date[1])
			is_where1 = " and licenout_date like ~~'" + ls_start + "%~~' "
		end if
	case 'licen_name'
		if isnull(is_data) or is_data = '' then
			is_where2 = ''
		else
			is_where2 = " and licen_name like ~~'" + is_data + "%~~' "
		end if
	case 'licen_grad'
		if isnull(is_data) or is_data = '' then
			is_where3 = ''
		else
			is_where3 = " and licen_grad like ~~'" + is_data + "%~~' "
		end if
	case 'licen_office'
		if isnull(is_data) or is_data = '' then
			is_where4 = ''
		else
			is_where4 = " and licen_office like ~~'" + is_data + "%~~' "
		end if
end choose
istr_select.str_where = " and custper.cust_idno = custlic.cust_idno " + is_where1 + is_where2 &
	+ is_where3  + is_where4

end event

event ue_etc;string ls_start, ls_end, ls_string
long ll_start, ll_end


choose case dw_1.getcolumnname()
	case 'etc_name'
		if isnull(is_data) or is_data = '' then
			is_where1 = ''
		else
			is_where1 = " and etc_name like ~~'" + is_data + "%~~' "
		end if
	case 'remarks'
		if isnull(is_data) or is_data = '' then
			is_where2 = ''
		else
			is_where2 = " and remarks like ~~'" + is_data + "%~~' "
		end if
end choose
istr_select.str_where = " and custper.cust_idno = custetc.cust_idno " + is_where1 + is_where2
end event

event editchanged;string ls_start, ls_end, ls_string
long ll_start, ll_end

this.accepttext()
is_data = string(data)
choose case ii_cur
	case 1 // 기본인적사항
		  this.triggerevent('ue_per')
	case 2 // 가족사항
		  this.triggerevent('ue_fam')
	case 3 // 학력사항
		  this.triggerevent('ue_sch')
	case 4 // 경력사항
		  this.triggerevent('ue_car')
	case 5 // 자격사항
		  this.triggerevent('ue_lic')
	case 6 // 기타정보
		  this.triggerevent('ue_etc')
end choose			
//
end event

event itemchanged;string ls_start, ls_end, ls_string
long ll_start, ll_end

this.accepttext()
is_data = string(data)
choose case ii_cur
	case 1 // 기본인적사항
		  this.triggerevent('ue_per')
	case 2 // 가족사항
		  this.triggerevent('ue_fam')
	case 3 // 학력사항
		  this.triggerevent('ue_sch')
	case 4 // 경력사항
		  this.triggerevent('ue_car')
	case 5 // 자격사항
		  this.triggerevent('ue_lic')
	case 6 // 기타정보
		  this.triggerevent('ue_etc')
end choose			

end event

