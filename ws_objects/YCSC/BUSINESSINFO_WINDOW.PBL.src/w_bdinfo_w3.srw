$PBExportHeader$w_bdinfo_w3.srw
$PBExportComments$XXXX집계기준설정[2000.12.08,서재복]
forward
global type w_bdinfo_w3 from window
end type
type st_13 from statictext within w_bdinfo_w3
end type
type ddlb_person from dropdownlistbox within w_bdinfo_w3
end type
type ddlb_div from dropdownlistbox within w_bdinfo_w3
end type
type st_4 from statictext within w_bdinfo_w3
end type
type pb_2 from picturebutton within w_bdinfo_w3
end type
type pb_1 from picturebutton within w_bdinfo_w3
end type
type gb_1 from groupbox within w_bdinfo_w3
end type
end forward

global type w_bdinfo_w3 from window
integer x = 832
integer y = 360
integer width = 1271
integer height = 584
boolean titlebar = true
string title = "집계기준설정(w_bdinfo_w3)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_13 st_13
ddlb_person ddlb_person
ddlb_div ddlb_div
st_4 st_4
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_bdinfo_w3 w_bdinfo_w3

type variables
gs_custdo_str  ist_code
gst_bdwhere ist_where, ls_project
end variables

on w_bdinfo_w3.create
this.st_13=create st_13
this.ddlb_person=create ddlb_person
this.ddlb_div=create ddlb_div
this.st_4=create st_4
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.st_13,&
this.ddlb_person,&
this.ddlb_div,&
this.st_4,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_bdinfo_w3.destroy
destroy(this.st_13)
destroy(this.ddlb_person)
destroy(this.ddlb_div)
destroy(this.st_4)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;
ist_where = Message.PowerObjectParm

ddlb_div.text = ist_where.str19   //담당본부
ddlb_person.text = ist_where.str20   //담당자


end event

type st_13 from statictext within w_bdinfo_w3
boolean visible = false
integer x = 55
integer y = 468
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "영업담당:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_person from dropdownlistbox within w_bdinfo_w3
boolean visible = false
integer x = 375
integer y = 468
integer width = 617
integer height = 508
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"정보입수담당자","설계영업담당자","건설사영업담당자","시공사영업담당자","판매영업담당자"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_div from dropdownlistbox within w_bdinfo_w3
integer x = 512
integer y = 140
integer width = 622
integer height = 508
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"정보입수담당본부","설계영업담당본부","건설사영업담당본부","시공사영업담당본부","판매영업담당본부"}
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_bdinfo_w3
integer x = 101
integer y = 152
integer width = 389
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "담당본부분류:"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_bdinfo_w3
integer x = 951
integer y = 328
integer width = 279
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_where.okflag = false
closewithreturn(parent, ist_where)
end event

type pb_1 from picturebutton within w_bdinfo_w3
integer x = 686
integer y = 328
integer width = 265
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인0.bmp"
alignment htextalign = right!
end type

event clicked;
ist_where.str19 = ddlb_div.text  //담당본부
if ist_where.str19 = '' then ist_where.str19 = '전체'
ist_where.str20 = ddlb_person.text  //담당자
if ist_where.str20 = '' then ist_where.str20 = '전체'

ist_where.okflag = true

closewithreturn(parent, ist_where)

end event

type gb_1 from groupbox within w_bdinfo_w3
integer x = 32
integer y = 32
integer width = 1189
integer height = 284
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 16711680
long backcolor = 79219928
string text = "집계기준설정"
end type

