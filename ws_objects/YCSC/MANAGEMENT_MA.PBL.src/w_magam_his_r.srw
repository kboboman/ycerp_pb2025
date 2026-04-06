$PBExportHeader$w_magam_his_r.srw
$PBExportComments$월마감해지이력(2006/12/08 이기영)
forward
global type w_magam_his_r from window
end type
type st_title from statictext within w_magam_his_r
end type
type pb_close from picturebutton within w_magam_his_r
end type
type pb_retrieve from picturebutton within w_magam_his_r
end type
type ddlb_1 from dropdownlistbox within w_magam_his_r
end type
type dw_1 from datawindow within w_magam_his_r
end type
type st_3 from statictext within w_magam_his_r
end type
type mle_2 from multilineedit within w_magam_his_r
end type
type gb_1 from groupbox within w_magam_his_r
end type
type gb_2 from groupbox within w_magam_his_r
end type
type gb_3 from groupbox within w_magam_his_r
end type
end forward

global type w_magam_his_r from window
integer width = 3954
integer height = 1924
boolean titlebar = true
string title = "월마감해지이력(w_magam_his_r)"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_title st_title
pb_close pb_close
pb_retrieve pb_retrieve
ddlb_1 ddlb_1
dw_1 dw_1
st_3 st_3
mle_2 mle_2
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_magam_his_r w_magam_his_r

on w_magam_his_r.create
this.st_title=create st_title
this.pb_close=create pb_close
this.pb_retrieve=create pb_retrieve
this.ddlb_1=create ddlb_1
this.dw_1=create dw_1
this.st_3=create st_3
this.mle_2=create mle_2
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.st_title,&
this.pb_close,&
this.pb_retrieve,&
this.ddlb_1,&
this.dw_1,&
this.st_3,&
this.mle_2,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_magam_his_r.destroy
destroy(this.st_title)
destroy(this.pb_close)
destroy(this.pb_retrieve)
destroy(this.ddlb_1)
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.mle_2)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_1.text = string(today(), 'yyyy')
dw_1.settrans(SQLCA)

pb_retrieve.TriggerEvent(Clicked!)
end event

event resize;//
this.width   = 3954

gb_3.height  = this.height - 392
dw_1.height  = this.height - 552
mle_2.height = this.height - 552
end event

type st_title from statictext within w_magam_his_r
integer x = 41
integer y = 48
integer width = 997
integer height = 140
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 32768
boolean enabled = false
string text = "월마감해지이력"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type pb_close from picturebutton within w_magam_his_r
event mousemove pbm_mousemove
integer x = 3639
integer y = 64
integer width = 187
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "종료"
end type

event clicked;close(parent)

end event

type pb_retrieve from picturebutton within w_magam_his_r
event mousemove pbm_mousemove
event we_nchittest pbm_nchittest
string tag = "aaa"
integer x = 3424
integer y = 64
integer width = 187
integer height = 144
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "조회"
end type

event we_nchittest;//w_magam_his_r.SetMicroHelp(this.tag)
end event

event clicked;string ls_yyyy

ls_yyyy = ddlb_1.text

dw_1.accepttext()
dw_1.retrieve(ls_yyyy)
end event

type ddlb_1 from dropdownlistbox within w_magam_his_r
integer x = 2981
integer y = 100
integer width = 343
integer height = 804
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
dw_1.reset()
mle_2.text = ''


end event

type dw_1 from datawindow within w_magam_his_r
integer x = 69
integer y = 376
integer width = 2167
integer height = 1372
integer taborder = 10
string title = "none"
string dataobject = "d_magam_his"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;if this.getrow() < 1 then return
mle_2.text = this.object.w_desc[this.getrow()]
end event

event clicked;if row < 1 then return
this.scrolltorow(row)
end event

type st_3 from statictext within w_magam_his_r
integer x = 96
integer y = 296
integer width = 814
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "해지사유"
boolean focusrectangle = false
end type

type mle_2 from multilineedit within w_magam_his_r
integer x = 2249
integer y = 376
integer width = 1582
integer height = 1372
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
integer tabstop[] = {0}
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type gb_1 from groupbox within w_magam_his_r
integer x = 3378
integer y = 16
integer width = 498
integer height = 220
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_magam_his_r
integer x = 2944
integer y = 16
integer width = 416
integer height = 220
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "마감년도"
end type

type gb_3 from groupbox within w_magam_his_r
integer x = 32
integer y = 248
integer width = 3845
integer height = 1532
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

