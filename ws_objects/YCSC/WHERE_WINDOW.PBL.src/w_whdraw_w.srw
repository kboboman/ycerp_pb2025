$PBExportHeader$w_whdraw_w.srw
$PBExportComments$도면번호관리 (2001/10/15, 이대준)
forward
global type w_whdraw_w from w_inheritance
end type
type st_1 from statictext within w_whdraw_w
end type
type st_2 from statictext within w_whdraw_w
end type
end forward

global type w_whdraw_w from w_inheritance
integer x = 864
integer y = 864
integer width = 2821
integer height = 1228
string title = "도면번호(w_ipdraw_w)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
st_1 st_1
st_2 st_2
end type
global w_whdraw_w w_whdraw_w

type variables
gs_where ist_code
string is_code, is_name
end variables

on w_whdraw_w.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
end on

on w_whdraw_w.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
end on

event open;dw_1.settransobject(sqlca)
ist_code = message.powerobjectparm
is_code = upper(trim(ist_code.str1))

dw_1.insertrow(0)
dw_1.object.supp_no[1] = is_code
dw_1.object.draw_no[1] = ist_code.str2
dw_1.setcolumn('mk')
dw_1.setfocus()

end event

event mousemove;//
end event

type pb_save from w_inheritance`pb_save within w_whdraw_w
integer x = 2025
integer y = 68
integer width = 343
integer height = 96
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::clicked;// 확인
if wf_update1(dw_1,"N") = false then
	ist_code.chk = "N"
else
	ist_code.str2 = dw_1.object.draw_no[1]
	ist_code.str3 = string(dw_1.object.mk[1])
	
	ist_code.chk = "Y"
end if
closewithreturn(parent, ist_code)
end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_whdraw_w
integer x = 50
integer y = 304
integer width = 2697
integer height = 788
string dataobject = "d_ipdraw_m"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_whdraw_w
boolean visible = false
end type

type st_title from w_inheritance`st_title within w_whdraw_w
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whdraw_w
end type

type pb_compute from w_inheritance`pb_compute within w_whdraw_w
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_whdraw_w
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_whdraw_w
integer x = 2386
integer y = 68
integer width = 343
integer height = 96
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;// 취소
ist_code.chk = "N"
closewithreturn(parent, ist_code)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whdraw_w
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_whdraw_w
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_whdraw_w
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_whdraw_w
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_whdraw_w
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_whdraw_w
integer x = 1984
integer y = 16
integer width = 786
integer height = 180
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whdraw_w
integer x = 27
integer y = 256
integer width = 2743
integer height = 856
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_whdraw_w
boolean visible = false
end type

type st_1 from statictext within w_whdraw_w
integer x = 41
integer y = 40
integer width = 1051
integer height = 128
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "도면번호 선택"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_2 from statictext within w_whdraw_w
integer x = 27
integer y = 216
integer width = 1083
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "도면등록은(기준정보->구매처별 도면관리)"
boolean focusrectangle = false
end type

