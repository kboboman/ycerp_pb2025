$PBExportHeader$w_irsilsa_r.srw
$PBExportComments$실사목록보고서(1998/05/13,곽용덕)
forward
global type w_irsilsa_r from w_inheritance
end type
type dw_4 from datawindow within w_irsilsa_r
end type
type sle_1 from singlelineedit within w_irsilsa_r
end type
type rb_1 from radiobutton within w_irsilsa_r
end type
type rb_2 from radiobutton within w_irsilsa_r
end type
type ddlb_1 from dropdownlistbox within w_irsilsa_r
end type
type ddlb_2 from dropdownlistbox within w_irsilsa_r
end type
type st_2 from statictext within w_irsilsa_r
end type
type st_1 from statictext within w_irsilsa_r
end type
type rb_3 from radiobutton within w_irsilsa_r
end type
type rb_4 from radiobutton within w_irsilsa_r
end type
end forward

global type w_irsilsa_r from w_inheritance
integer y = 36
integer width = 3630
integer height = 2208
string title = "실사목록표 출력(w_irsilsa_r)"
dw_4 dw_4
sle_1 sle_1
rb_1 rb_1
rb_2 rb_2
ddlb_1 ddlb_1
ddlb_2 ddlb_2
st_2 st_2
st_1 st_1
rb_3 rb_3
rb_4 rb_4
end type
global w_irsilsa_r w_irsilsa_r

type variables

st_print i_print
datawindowchild  idwc_loc

end variables

on w_irsilsa_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.sle_1=create sle_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.st_2=create st_2
this.st_1=create st_1
this.rb_3=create rb_3
this.rb_4=create rb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.ddlb_1
this.Control[iCurrent+6]=this.ddlb_2
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.rb_4
end on

on w_irsilsa_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.sle_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.rb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.settransobject(sqlca)
dw_2.insertrow(0)

dw_2.getchild("loc_no", idwc_loc)
idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()

dw_4.visible = false
ddlb_1.text = string(today() ,'yyyy')
ddlb_2.text = string(today() ,'mm')

end event

event resize;call super::resize;dw_1.width  = this.width  - 110
dw_1.height = this.height - 596

end event

type pb_save from w_inheritance`pb_save within w_irsilsa_r
boolean visible = false
integer x = 3159
integer y = 48
integer taborder = 30
end type

type dw_1 from w_inheritance`dw_1 within w_irsilsa_r
integer x = 32
integer y = 452
integer width = 3520
integer height = 1612
integer taborder = 50
string dataobject = "d_irincoun_s"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_irsilsa_r
integer x = 558
integer y = 304
integer width = 992
integer height = 88
integer taborder = 60
string dataobject = "d_irsilsainput_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;dw_1.reset()

end event

type st_title from w_inheritance`st_title within w_irsilsa_r
integer x = 32
integer width = 1541
string text = "실사목록표 출력"
end type

type st_tips from w_inheritance`st_tips within w_irsilsa_r
end type

type pb_compute from w_inheritance`pb_compute within w_irsilsa_r
boolean visible = false
integer x = 1687
integer y = 68
integer height = 140
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_irsilsa_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_irsilsa_r
integer x = 3319
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_irsilsa_r
integer x = 3131
integer taborder = 150
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;w_repsuper w_print

string ls_year, ls_mon, ls_location, ls_code, ls_name
 
dw_2.accepttext()
ls_location = trim(dw_2.object.loc_no[1])

if isnull(ls_location) then
	messagebox('오류','저장소를 입력하십시오.',exclamation!)
	return	
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_year = trim(ddlb_1.text)
ls_mon = trim(ddlb_2.text)

dw_4.reset()
CHOOSE CASE rb_1.checked
	CASE true
		ls_code = sle_1.text + "%"
		ls_name = "%"
	CASE ELSE
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
END CHOOSE

if dw_4.retrieve(ls_location, ls_year, ls_mon, ls_code, ls_name) < 1 then return

CHOOSE CASE rb_1.checked
	CASE true
		dw_4.setsort ( "ineoym_item_no , ineoym_qa")
	CASE ELSE
		dw_4.setsort ( "groupitem_item_name, ineoym_qa")
END CHOOSE
dw_4.Sort( )


i_print.st_datawindow = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 실사목록 리스트를 출력합니다." 
//i_print.name = 'd_irincoun_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_irsilsa_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_irsilsa_r
boolean visible = false
integer x = 2967
integer y = 48
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_irsilsa_r
boolean visible = false
integer x = 2775
integer y = 48
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_irsilsa_r
integer x = 2944
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_year, ls_mon, ls_location, ls_code, ls_name
 
ls_location = trim(dw_2.object.loc_no[1])

if isnull(ls_location) then
	messagebox('오류','저장소를 입력하십시오.',exclamation!)
	return	
end if

ls_year = trim(ddlb_1.text)
ls_mon = trim(ddlb_2.text)
dw_1.reset()
CHOOSE CASE rb_1.checked
	CASE true
		ls_code = sle_1.text + "%"
		ls_name = "%"
	CASE ELSE
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
END CHOOSE



if dw_1.retrieve(ls_location, ls_year, ls_mon, ls_code, ls_name) < 1 then return

CHOOSE CASE rb_1.checked
	CASE true
		dw_1.setsort ( "itemloc_item_no , itemloc_qa")
	CASE ELSE
		dw_1.setsort ( "groupitem_item_name, itemloc_qa")
END CHOOSE
dw_1.Sort( )


end event

type gb_3 from w_inheritance`gb_3 within w_irsilsa_r
integer x = 1751
integer y = 240
integer width = 1801
integer height = 188
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_irsilsa_r
integer y = 240
integer width = 1541
integer height = 188
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_irsilsa_r
integer x = 2894
integer y = 8
integer width = 658
integer taborder = 40
integer textsize = -10
end type

type dw_4 from datawindow within w_irsilsa_r
integer x = 1669
integer y = 88
integer width = 123
integer height = 96
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_irincoun_r"
boolean livescroll = true
end type

type sle_1 from singlelineedit within w_irsilsa_r
integer x = 2921
integer y = 296
integer width = 521
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_irsilsa_r
integer x = 2523
integer y = 320
integer width = 215
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
string text = "코드"
boolean checked = true
end type

type rb_2 from radiobutton within w_irsilsa_r
integer x = 2747
integer y = 320
integer width = 160
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
string text = "명"
end type

type ddlb_1 from dropdownlistbox within w_irsilsa_r
integer x = 1801
integer y = 304
integer width = 265
integer height = 424
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.reset()
end event

type ddlb_2 from dropdownlistbox within w_irsilsa_r
integer x = 2158
integer y = 304
integer width = 197
integer height = 928
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"01","02","03","04","05","06","07","08","09","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.reset()
end event

type st_2 from statictext within w_irsilsa_r
integer x = 2354
integer y = 316
integer width = 82
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "월"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_irsilsa_r
integer x = 2066
integer y = 320
integer width = 82
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "년"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_irsilsa_r
integer x = 69
integer y = 312
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사내"
boolean checked = true
end type

event clicked;idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()

end event

type rb_4 from radiobutton within w_irsilsa_r
integer x = 315
integer y = 312
integer width = 229
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주"
end type

event clicked;idwc_loc.setfilter("loc_type = 'Y'")
idwc_loc.filter()

end event

