$PBExportHeader$w_whitemstock_m.srw
$PBExportComments$장기재고추가관리(2003/12/02, 이인호)
forward 
global type w_whitemstock_m from w_inheritance
end type
end forward

global type w_whitemstock_m from w_inheritance
integer x = 599
integer y = 864
integer width = 2409
integer height = 712
string title = "장기재고 추가(w_whitemstock_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
end type
global w_whitemstock_m w_whitemstock_m

type variables
gs_where ist_where
string is_user
end variables

on w_whitemstock_m.create
call super::create
end on

on w_whitemstock_m.destroy
call super::destroy
end on

event open;STRING  ls_area

ist_where = message.powerobjectparm

dw_1.settransobject(sqlca)
dw_1.setredraw(false)
if dw_1.retrieve(ist_where.str1, ist_where.str2, ist_where.str3) < 1 then
	dw_1.reset()
	dw_1.insertrow(1)
	if gs_area = 'H0001' then
		dw_1.object.chk2_user[1] = gs_userid
	else
		dw_1.object.chk1_user[1] = gs_userid
	end if
	dw_1.object.user_date[1] = wf_today()
	dw_1.object.loc_no[1] = ist_where.str1
	dw_1.object.item_no[1] = trim(ist_where.str2)
	dw_1.object.qa[1] = trim(ist_where.str3)
	dw_1.object.uom[1] = trim(ist_where.str4)
	dw_1.object.groupitem_item_name[1] = trim(ist_where.name)
	dw_1.object.qty[1] = dec(ist_where.str5)
//	dw_1.object.loc_qoh[1] = dec(ist_where.str6)
end if
dw_1.accepttext()
dw_1.setredraw(true)
dw_1.setfocus()

end event

event mousemove;//
end event

type pb_save from w_inheritance`pb_save within w_whitemstock_m
integer x = 1522
integer y = 500
integer width = 430
integer height = 116
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::clicked;long ll_seq
dwItemStatus l_status

dw_1.accepttext()
if dw_1.rowcount() < 1 then return
ist_where.chk = 'Y'
if wf_update1(dw_1,"N") = false then
	return
end if
closewithreturn(parent, ist_where)
end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_whitemstock_m
integer x = 0
integer y = 0
integer width = 2391
integer height = 488
integer taborder = 30
string dataobject = "d_icitemstock_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::losefocus;call super::losefocus;this.accepttext()
end event

type st_title from w_inheritance`st_title within w_whitemstock_m
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whitemstock_m
end type

type pb_compute from w_inheritance`pb_compute within w_whitemstock_m
boolean visible = false
integer taborder = 0
end type

type pb_print_part from w_inheritance`pb_print_part within w_whitemstock_m
boolean visible = false
integer taborder = 0
end type

type pb_close from w_inheritance`pb_close within w_whitemstock_m
integer x = 1961
integer y = 500
integer width = 430
integer height = 116
integer taborder = 10
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;ist_where.chk = "N"
closewithreturn(parent, ist_where)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whitemstock_m
boolean visible = false
integer taborder = 0
end type

type pb_cancel from w_inheritance`pb_cancel within w_whitemstock_m
boolean visible = false
integer taborder = 0
end type

type pb_delete from w_inheritance`pb_delete within w_whitemstock_m
boolean visible = false
integer taborder = 0
end type

type pb_insert from w_inheritance`pb_insert within w_whitemstock_m
boolean visible = false
integer x = 1202
integer y = 952
integer width = 366
integer height = 104
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::mousemove;//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_whitemstock_m
boolean visible = false
integer taborder = 0
end type

type gb_3 from w_inheritance`gb_3 within w_whitemstock_m
boolean visible = false
integer x = 1925
integer y = 724
integer width = 709
integer height = 128
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whitemstock_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 3131
integer height = 1044
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_whitemstock_m
boolean visible = false
integer x = 1408
integer y = 1328
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_whitemstock_m
boolean visible = false
integer x = 3552
integer y = 164
integer width = 238
integer height = 136
integer taborder = 0
end type

