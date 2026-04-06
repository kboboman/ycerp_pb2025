$PBExportHeader$w_whrout_w.srw
$PBExportComments$공정조회(2003/03/11,이인호)
forward 
global type w_whrout_w from window
end type
type st_1 from statictext within w_whrout_w
end type
type pb_1 from picturebutton within w_whrout_w
end type
type st_21 from statictext within w_whrout_w
end type
type sle_1 from singlelineedit within w_whrout_w
end type
type pb_close from picturebutton within w_whrout_w
end type
type dw_1 from datawindow within w_whrout_w
end type
type gb_1 from groupbox within w_whrout_w
end type
end forward

global type w_whrout_w from window
integer x = 873
integer y = 476
integer width = 1915
integer height = 1488
boolean titlebar = true
string title = "공정물품조회(w_whrout_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_1 st_1
pb_1 pb_1
st_21 st_21
sle_1 sle_1
pb_close pb_close
dw_1 dw_1
gb_1 gb_1
end type
global w_whrout_w w_whrout_w

type variables

end variables

forward prototypes
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
end prototypes

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

on w_whrout_w.create
this.st_1=create st_1
this.pb_1=create pb_1
this.st_21=create st_21
this.sle_1=create sle_1
this.pb_close=create pb_close
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.pb_1,&
this.st_21,&
this.sle_1,&
this.pb_close,&
this.dw_1,&
this.gb_1}
end on

on w_whrout_w.destroy
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.st_21)
destroy(this.sle_1)
destroy(this.pb_close)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.settransobject(sqlca)

end event

type st_1 from statictext within w_whrout_w
integer x = 9
integer y = 1296
integer width = 1870
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "규격중 길이는 제외되어 관리됩니다(길이를 뺸나머지만 같으면됩니다)"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_whrout_w
integer x = 1102
integer y = 68
integer width = 160
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean default = true
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;string ls_item, ls_name, ls_where, ls_sql, ls_text
gs_where2 lst_whitemret

lst_whitemret.chk = "S"
openwithparm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk <> 'Y' then return
sle_1.text = lst_whitemret.name[1]
ls_item    = lst_whitemret.str1[1]
dw_1.retrieve(ls_item)
end event

type st_21 from statictext within w_whrout_w
integer x = 23
integer y = 88
integer width = 133
integer height = 68
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
string text = "검색"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_whrout_w
integer x = 155
integer y = 80
integer width = 933
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
textcase textcase = upper!
integer limit = 10
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type pb_close from picturebutton within w_whrout_w
integer x = 1669
integer y = 44
integer width = 187
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_whrout_w
integer x = 9
integer y = 220
integer width = 1870
integer height = 1068
integer taborder = 30
string dataobject = "d_cditemwc_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = StyleBox!
end type

type gb_1 from groupbox within w_whrout_w
integer x = 9
integer width = 1870
integer height = 204
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

