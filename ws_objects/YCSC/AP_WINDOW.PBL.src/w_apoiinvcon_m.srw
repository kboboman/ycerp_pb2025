$PBExportHeader$w_apoiinvcon_m.srw
$PBExportComments$월별매입확정(2001/12/26, 이인호)
forward
global type w_apoiinvcon_m from w_inheritance
end type
type ddlb_1 from dropdownlistbox within w_apoiinvcon_m
end type
type ddlb_2 from dropdownlistbox within w_apoiinvcon_m
end type
type st_1 from statictext within w_apoiinvcon_m
end type
type st_2 from statictext within w_apoiinvcon_m
end type
type cbx_1 from checkbox within w_apoiinvcon_m
end type
type dw_area from datawindow within w_apoiinvcon_m
end type
type cbx_2 from checkbox within w_apoiinvcon_m
end type
type rb_3 from radiobutton within w_apoiinvcon_m
end type
type rb_4 from radiobutton within w_apoiinvcon_m
end type
type st_3 from statictext within w_apoiinvcon_m
end type
type gb_4 from groupbox within w_apoiinvcon_m
end type
end forward

global type w_apoiinvcon_m from w_inheritance
integer x = 5
integer y = 112
integer width = 3643
integer height = 2172
string title = "월매입 확정(w_apoiinvcon_m)"
ddlb_1 ddlb_1
ddlb_2 ddlb_2
st_1 st_1
st_2 st_2
cbx_1 cbx_1
dw_area dw_area
cbx_2 cbx_2
rb_3 rb_3
rb_4 rb_4
st_3 st_3
gb_4 gb_4
end type
global w_apoiinvcon_m w_apoiinvcon_m

type variables
string is_date, is_con = 'O'
st_print i_print
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_2.visible = false

if gs_userid = '1999010s' then
else
	dw_area.enabled = false
end if

ddlb_1.text = string(today(),"YYYY")
ddlb_2.text = string(today(),"MM")
is_date     = string(ddlb_1.text) + "/" +  string(ddlb_2.text)

if gf_permission("월매입_확정", gs_userid) = "Y" then
else
	MessageBox("확인","월매입_확정 권한이 존재하지 않습니다.")
	close(this)
end if

end event

on w_apoiinvcon_m.create
int iCurrent
call super::create
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.st_1=create st_1
this.st_2=create st_2
this.cbx_1=create cbx_1
this.dw_area=create dw_area
this.cbx_2=create cbx_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_3=create st_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_1
this.Control[iCurrent+2]=this.ddlb_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.cbx_2
this.Control[iCurrent+8]=this.rb_3
this.Control[iCurrent+9]=this.rb_4
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.gb_4
end on

on w_apoiinvcon_m.destroy
call super::destroy
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.dw_area)
destroy(this.cbx_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_3)
destroy(this.gb_4)
end on

event resize;call super::resize;//
gb_2.width  = this.width  - 77
gb_2.height = this.height - 348

dw_1.width  = this.width  - 132
dw_1.height = this.height - 508

end event

type pb_save from w_inheritance`pb_save within w_apoiinvcon_m
integer x = 2994
integer y = 56
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// apoiinv_open_close = 'O': 매입 등록, 'S': 매입 확정, 'T': 지불등록 , 'C' :마감
if wf_update1(dw_1, "Y") = true then
	cbx_1.checked = false
	cbx_2.checked = false
end if
end event

type dw_1 from w_inheritance`dw_1 within w_apoiinvcon_m
integer x = 59
integer y = 364
integer width = 3511
integer height = 1664
integer taborder = 70
string dataobject = "d_apoiinvcon_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;if row < 1 then return

this.selectrow(0, false)
this.selectrow(row,true)
end event

event dw_1::itemchanged;string 	ls_user

setnull(ls_user)
CHOOSE CASE dwo.name
	CASE 'chk_user'
		if data = 'Y' then
			ls_user = gs_userid
		end if
		this.object.apoiinv_confirm_user[row] = ls_user
	CASE 'apoiinv_open_close'
		if data <> 'O' then
			ls_user = gs_userid
		end if
		this.object.apoiinv_top_user[row] = ls_user
END CHOOSE

end event

event dw_1::losefocus;this.accepttext()
end event

type dw_2 from w_inheritance`dw_2 within w_apoiinvcon_m
integer x = 814
integer y = 16
integer width = 87
integer height = 68
integer taborder = 80
string dataobject = "d_apoiinv_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_apoiinvcon_m
integer x = 23
integer width = 887
string text = "월매입 확정"
end type

type st_tips from w_inheritance`st_tips within w_apoiinvcon_m
end type

type pb_compute from w_inheritance`pb_compute within w_apoiinvcon_m
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_apoiinvcon_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_apoiinvcon_m
integer x = 3378
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoiinvcon_m
integer x = 3186
integer y = 56
integer taborder = 130
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

is_date = string(ddlb_1.text) + "/" +  string(ddlb_2.text)
dw_2.setredraw(false)
if dw_2.retrieve(is_date,is_con,dw_area.object.area[1]) < 1 then
	dw_2.reset()
end if
dw_2.setredraw(true)
if dw_2.rowcount() < 1 then return

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 월 매입(미)확정현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_apoiinvcon_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_apoiinvcon_m
boolean visible = false
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_apoiinvcon_m
boolean visible = false
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apoiinvcon_m
integer x = 2802
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

is_date = string(ddlb_1.text) + "/" +  string(ddlb_2.text)
dw_area.accepttext()
dw_1.setredraw(false)
if dw_1.retrieve(is_date, is_con, dw_area.object.area[1]) < 1 then
	dw_1.reset()
end if
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_apoiinvcon_m
integer x = 1029
integer y = 8
integer width = 1234
integer height = 212
integer taborder = 90
end type

type gb_2 from w_inheritance`gb_2 within w_apoiinvcon_m
integer x = 27
integer width = 3566
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_apoiinvcon_m
integer x = 2775
integer y = 16
integer width = 809
end type

type ddlb_1 from dropdownlistbox within w_apoiinvcon_m
integer x = 1577
integer y = 96
integer width = 270
integer height = 680
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_2 from dropdownlistbox within w_apoiinvcon_m
integer x = 1938
integer y = 96
integer width = 215
integer height = 772
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
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

type st_1 from statictext within w_apoiinvcon_m
integer x = 1847
integer y = 104
integer width = 82
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "년"
boolean focusrectangle = false
end type

type st_2 from statictext within w_apoiinvcon_m
integer x = 2153
integer y = 104
integer width = 82
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "월"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_apoiinvcon_m
integer x = 78
integer y = 284
integer width = 526
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
string text = "전체(부서장)"
end type

event clicked;long ll_row
string ls_chk, ls_user

// chk_user = 'Y': 부서장 매입결재 , 'N' 

setnull(ls_user)
if this.checked = true then
	ls_user = gs_userid
	ls_chk = 'Y'
else
	ls_chk = 'N'
end if
for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk_user[ll_row] = ls_chk
	dw_1.object.apoiinv_confirm_user[ll_row] = ls_user
next

end event

type dw_area from datawindow within w_apoiinvcon_m
integer x = 1047
integer y = 100
integer width = 517
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type cbx_2 from checkbox within w_apoiinvcon_m
integer x = 699
integer y = 284
integer width = 457
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체(임원)"
end type

event clicked;long ll_row
string ls_chk, ls_user

// apoiinv_open_close = 'O': 매입 등록, 'S': 공장장 결재 확정, 'T': 지불등록 , 'C' :마감

setnull(ls_user)
if this.checked = true then
	ls_user = gs_userid
	ls_chk = 'S'
else
	ls_chk = 'O'
end if
for ll_row = 1 to dw_1.rowcount()
	dw_1.object.apoiinv_open_close[ll_row] = ls_chk
	dw_1.object.apoiinv_top_user[ll_row] = ls_user
next


end event

type rb_3 from radiobutton within w_apoiinvcon_m
integer x = 2336
integer y = 64
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미결재"
boolean checked = true
end type

event clicked;// apoiinv_open_close = 'O': 매입 등록, 'S': 매입 확정, 'T': 지불등록 , 'C' :마감
is_con = 'O'
dw_1.reset()

end event

type rb_4 from radiobutton within w_apoiinvcon_m
integer x = 2336
integer y = 132
integer width = 329
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "결재완료"
end type

event clicked;is_con = 'S'
dw_1.reset()

end event

type st_3 from statictext within w_apoiinvcon_m
integer x = 2021
integer y = 288
integer width = 1550
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월매입 확정 후 매입계산서 미발행 체크 확인 바람."
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_apoiinvcon_m
integer x = 2272
integer y = 8
integer width = 498
integer height = 212
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "공장장"
end type

