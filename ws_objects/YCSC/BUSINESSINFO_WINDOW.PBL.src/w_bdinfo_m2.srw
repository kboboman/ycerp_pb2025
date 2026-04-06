$PBExportHeader$w_bdinfo_m2.srw
$PBExportComments$설계영업진행관리-상세정보[2001/01/18,서재복]
forward
global type w_bdinfo_m2 from w_inheritance
end type
end forward

global type w_bdinfo_m2 from w_inheritance
string tag = "설계영업진행관리상세정보(w_bdinfo_m2)"
integer x = 82
integer y = 224
integer width = 3054
integer height = 2164
string title = "설계영업진행관리상세정보(w_bdinfo_m2)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
end type
global w_bdinfo_m2 w_bdinfo_m2

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


end variables

on w_bdinfo_m2.create
call super::create
end on

on w_bdinfo_m2.destroy
call super::destroy
end on

event open;call super::open;this.x = 30
this.y = 180

ist_where = Message.PowerObjectParm

dw_2.retrieve( ist_where.str12, ist_where.dec4 )

end event

type pb_save from w_inheritance`pb_save within w_bdinfo_m2
integer x = 2592
integer y = 56
end type

event pb_save::clicked;
dw_2.accepttext()

string ls_datecheck
ls_datecheck = string(dw_2.object.bdinfodet_makedate[1],'yyyy/mm/dd')
if isnull(ls_datecheck) or trim(ls_datecheck) = '' or trim(ls_datecheck) = '0000/00/00' then
	messagebox('확인', '최초발생일자를 입력하십시오.')
	dw_2.setcolumn('bdinfodet_makedate')
	dw_2.setfocus()
	return
end if
ls_datecheck = string(dw_2.object.bdinfodet_fixeddate[1],'yyyy/mm/dd')
if isnull(ls_datecheck) or trim(ls_datecheck) = '' or trim(ls_datecheck) = '0000/00/00' then
	messagebox('확인', '진행(확정)일자를 입력하십시오.')
	dw_2.setcolumn('bdinfodet_fixeddate')
	dw_2.setfocus()
	return
end if

wf_update1(dw_2,"Y") 

ist_where.okflag = true

closewithreturn(parent, ist_where)

end event

type dw_1 from w_inheritance`dw_1 within w_bdinfo_m2
boolean visible = false
integer x = 3781
integer y = 1152
integer width = 448
integer height = 392
string dataobject = "dw_info"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_m2
integer x = 64
integer y = 272
integer width = 2907
integer height = 1744
string dataobject = "d_bdinfo_m2_old"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

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

event dw_2::itemchanged;string ls_member

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

type st_title from w_inheritance`st_title within w_bdinfo_m2
integer width = 2080
integer textsize = -20
string text = "설계영업진행관리-상세정보"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_m2
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_m2
boolean visible = false
integer x = 3520
integer y = 468
end type

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_m2
boolean visible = false
integer x = 3685
integer y = 196
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_m2
integer x = 2784
integer y = 56
end type

event pb_close::clicked;ist_where.okflag = false
closewithreturn(parent, ist_where)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_m2
boolean visible = false
integer x = 3447
integer y = 196
end type

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_m2
boolean visible = false
integer x = 3557
integer y = 340
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_m2
boolean visible = false
integer x = 3237
integer y = 584
end type

type pb_insert from w_inheritance`pb_insert within w_bdinfo_m2
boolean visible = false
integer x = 3255
integer y = 416
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_m2
boolean visible = false
integer x = 3255
integer y = 248
end type

type gb_3 from w_inheritance`gb_3 within w_bdinfo_m2
integer x = 37
integer y = 216
integer width = 2967
integer height = 1832
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_m2
boolean visible = false
integer x = 3749
integer y = 948
integer width = 512
integer height = 624
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_m2
integer x = 2555
integer y = 16
integer width = 443
end type

