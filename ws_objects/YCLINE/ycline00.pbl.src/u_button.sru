$PBExportHeader$u_button.sru
$PBExportComments$UO Button
forward
global type u_button from userobject
end type
type pb_save from picturebutton within u_button
end type
type pb_retrieve from picturebutton within u_button
end type
type pb_close from picturebutton within u_button
end type
type pb_excel from picturebutton within u_button
end type
type pb_print from picturebutton within u_button
end type
end forward

global type u_button from userobject
integer width = 2208
integer height = 208
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
event timer pbm_timer
pb_save pb_save
pb_retrieve pb_retrieve
pb_close pb_close
pb_excel pb_excel
pb_print pb_print
end type
global u_button u_button

type variables
window iw_parent_window
integer ii_menu_ht = 0
boolean ib_show_clock
int ii_resizeable_offset
long il_bar_max

end variables

forward prototypes
public subroutine uf_set_msg (string as_msg)
public subroutine uf_set_clock ()
public subroutine uf_init (window aw_win)
end prototypes

public subroutine uf_set_msg (string as_msg);
end subroutine

public subroutine uf_set_clock ();
end subroutine

public subroutine uf_init (window aw_win);this.width = aw_win.workspacewidth() - 10

end subroutine

on u_button.create
this.pb_save=create pb_save
this.pb_retrieve=create pb_retrieve
this.pb_close=create pb_close
this.pb_excel=create pb_excel
this.pb_print=create pb_print
this.Control[]={this.pb_save,&
this.pb_retrieve,&
this.pb_close,&
this.pb_excel,&
this.pb_print}
end on

on u_button.destroy
destroy(this.pb_save)
destroy(this.pb_retrieve)
destroy(this.pb_close)
destroy(this.pb_excel)
destroy(this.pb_print)
end on

type pb_save from picturebutton within u_button
integer x = 384
integer width = 192
integer height = 176
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "C:\BMP\U_UPDATE.bmp"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "저장"
end type

event clicked;window activesheet

activesheet = w_h_main.GetActiveSheet()

IF IsValid(activesheet) THEN activesheet.TriggerEvent('ue_save')

end event

type pb_retrieve from picturebutton within u_button
integer width = 192
integer height = 176
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "C:\BMP\U_VIEW.BMP"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "조회"
end type

event clicked;window activesheet

activesheet = w_h_main.GetActiveSheet()

IF IsValid(activesheet) THEN activesheet.TriggerEvent('ue_retrieve')

end event

type pb_close from picturebutton within u_button
integer x = 768
integer width = 192
integer height = 176
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "C:\BMP\U_CLOSE.bmp"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "닫기"
end type

event clicked;//
Window activesheet

activesheet = w_h_main.GetActiveSheet()

//close(w_bgr)
IF IsValid(activesheet) THEN
	activesheet.TriggerEvent('ue_close')
ELSE
	Close(w_h_main)
	RETURN
END IF
//OpenSheetWithParm(w_bgr, m_e_main.Text + '[w_bgr]', w_h_main, 6, Layered!)

end event

type pb_excel from picturebutton within u_button
integer x = 192
integer width = 192
integer height = 176
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "C:\BMP\U_EXCEL.BMP"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "화일"
end type

event clicked;window activesheet

activesheet = w_h_main.GetActiveSheet()

IF IsValid(activesheet) THEN activesheet.TriggerEvent('ue_part_print')

end event

type pb_print from picturebutton within u_button
integer x = 576
integer width = 192
integer height = 176
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "C:\BMP\U_REPORT.BMP"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "출력"
end type

event clicked;window activesheet

activesheet = w_h_main.GetActiveSheet()

IF IsValid(activesheet) THEN activesheet.TriggerEvent('ue_print')

end event

