$PBExportHeader$w_apoi_m1.srw
$PBExportComments$자재매입관리(운송료)(1998/05/21, 이인호)
forward 
global type w_apoi_m1 from window
end type
type cbx_2 from checkbox within w_apoi_m1
end type
type cbx_1 from checkbox within w_apoi_m1
end type
type dw_1 from datawindow within w_apoi_m1
end type
type pb_2 from picturebutton within w_apoi_m1
end type
type pb_1 from picturebutton within w_apoi_m1
end type
type gb_1 from groupbox within w_apoi_m1
end type
end forward

global type w_apoi_m1 from window
integer x = 832
integer y = 360
integer width = 1294
integer height = 1144
boolean titlebar = true
string title = "운송비 선택(w_apoi_m1)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cbx_2 cbx_2
cbx_1 cbx_1
dw_1 dw_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_apoi_m1 w_apoi_m1

type variables
st_apoi_s ist_apoi
end variables

on w_apoi_m1.create
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.dw_1=create dw_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.cbx_2,&
this.cbx_1,&
this.dw_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_apoi_m1.destroy
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.dw_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;//
datawindow ldw_1

ist_apoi = message.powerobjectparm

ldw_1 = ist_apoi.dw_object


//dw_1.dataobject = ist_apoi.name
dw_1.settransobject(sqlca)
//ldw_1.sharedata(dw_1)

end event

type cbx_2 from checkbox within w_apoi_m1
integer x = 142
integer y = 960
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "none"
end type

event clicked;//
string ls_supp_no, ls_register_no, ls_curr_code, ls_purflag, ls_area
date   ld_sdate, ld_edate

//ld_sdate = date(em_1.text)
//ld_edate = date(em_2.text)
//
//ls_supp_no = dw_1.getitemstring(dw_1.getrow(), "supp_no")
//
//if isnull(is_pur_flag) OR is_pur_flag = '' then
//	MessageBox("확인","매입유형을 선택하세요!",information!)
//	ddlb_1.setfocus()
//	RETURN
//end if
//if isnull(is_flag) OR is_flag = '' then
//	MessageBox("확인","입고유형을 선택하세요!",information!)
//	ddlb_2.setfocus()
//	RETURN
//end if
//if isnull(ls_supp_no) OR ls_supp_no = '' then
//	MessageBox("확인","거래처를 선택하세요!",information!)
//	dw_1.setfocus()
//	RETURN
//end if

ls_supp_no = "G0040"
ld_sdate   = date("2016/01/05")
ld_sdate   = date("2016/01/05")

//CHOOSE CASE index
//	CASE 1
//		is_flag = "S"		// 상품
//	CASE 2
//		is_flag = "W"		// 원자재
//	CASE 3	
//		is_flag = "B"		// 부자재
//	CASE 4
//		is_flag = "Y"		// 외주가공
//END CHOOSE
ls_purflag = "S"
ls_area    = "S"
dw_1.retrieve(ls_supp_no, ld_sdate, ld_edate, ls_area, ls_purflag)



end event

type cbx_1 from checkbox within w_apoi_m1
integer x = 27
integer y = 872
integer width = 352
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체선정"
end type

event clicked;long ll_row

for ll_row = 1 to dw_1.rowcount()
	dw_1.setitem(ll_row, "pick", 'Y')
next
end event

type dw_1 from datawindow within w_apoi_m1
integer x = 55
integer y = 64
integer width = 1166
integer height = 776
integer taborder = 10
string dataobject = "d_apoi_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = StyleLowered!
end type

type pb_2 from picturebutton within w_apoi_m1
integer x = 969
integer y = 880
integer width = 279
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_apoi.flag = 'N'
closewithreturn(parent, ist_apoi)
end event

type pb_1 from picturebutton within w_apoi_m1
integer x = 686
integer y = 880
integer width = 279
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = right!
end type

event clicked;ist_apoi.flag = 'Y'
closewithreturn(parent, ist_apoi)


end event

type gb_1 from groupbox within w_apoi_m1
integer x = 27
integer y = 12
integer width = 1225
integer height = 852
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
end type

