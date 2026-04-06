$PBExportHeader$w_magam_his.srw
$PBExportComments$월마감해지이력(2006/12/08 이기영)
forward
global type w_magam_his from window
end type
type mle_2 from multilineedit within w_magam_his
end type
type st_3 from statictext within w_magam_his
end type
type st_2 from statictext within w_magam_his
end type
type mle_1 from multilineedit within w_magam_his
end type
type dw_1 from datawindow within w_magam_his
end type
type ddlb_1 from dropdownlistbox within w_magam_his
end type
type st_1 from statictext within w_magam_his
end type
type pb_save from picturebutton within w_magam_his
end type
type pb_retrieve from picturebutton within w_magam_his
end type
type pb_close from picturebutton within w_magam_his
end type
type st_title from statictext within w_magam_his
end type
type gb_1 from groupbox within w_magam_his
end type
type gb_2 from groupbox within w_magam_his
end type
type gb_3 from groupbox within w_magam_his
end type
end forward

global type w_magam_his from window
integer width = 2789
integer height = 2464
boolean titlebar = true
string title = "월마감해지이력(w_magam_his)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_2 mle_2
st_3 st_3
st_2 st_2
mle_1 mle_1
dw_1 dw_1
ddlb_1 ddlb_1
st_1 st_1
pb_save pb_save
pb_retrieve pb_retrieve
pb_close pb_close
st_title st_title
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_magam_his w_magam_his

on w_magam_his.create
this.mle_2=create mle_2
this.st_3=create st_3
this.st_2=create st_2
this.mle_1=create mle_1
this.dw_1=create dw_1
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.pb_save=create pb_save
this.pb_retrieve=create pb_retrieve
this.pb_close=create pb_close
this.st_title=create st_title
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.mle_2,&
this.st_3,&
this.st_2,&
this.mle_1,&
this.dw_1,&
this.ddlb_1,&
this.st_1,&
this.pb_save,&
this.pb_retrieve,&
this.pb_close,&
this.st_title,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_magam_his.destroy
destroy(this.mle_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.pb_save)
destroy(this.pb_retrieve)
destroy(this.pb_close)
destroy(this.st_title)
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

type mle_2 from multilineedit within w_magam_his
integer x = 78
integer y = 1212
integer width = 2624
integer height = 508
integer taborder = 80
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

type st_3 from statictext within w_magam_his
integer x = 73
integer y = 284
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

type st_2 from statictext within w_magam_his
integer x = 69
integer y = 1804
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
string text = "해지사유를 입력해 주세요."
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_magam_his
integer x = 82
integer y = 1892
integer width = 2624
integer height = 436
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
string text = "해지사유를 여기에 입력해 주세요."
boolean vscrollbar = true
integer tabstop[] = {0}
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event getfocus;mle_1.text = ''
mle_1.textcolor = RGB(0,0,0)
end event

type dw_1 from datawindow within w_magam_his
integer x = 82
integer y = 364
integer width = 2619
integer height = 824
integer taborder = 70
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

type ddlb_1 from dropdownlistbox within w_magam_his
integer x = 1659
integer y = 88
integer width = 343
integer height = 804
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
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

type st_1 from statictext within w_magam_his
integer x = 1262
integer y = 96
integer width = 366
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "마감년도 :"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_save from picturebutton within w_magam_his
event mousemove pbm_mousemove
integer x = 2309
integer y = 52
integer width = 187
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "저장"
end type

event clicked;string ls_yyyy, ls_mm, ls_userid, ls_kubun, ls_desc
date   ls_date

st_magam lst_magam

lst_magam = Message.PowerObjectParm

ls_yyyy   = lst_magam.s_yyyy
ls_mm     = lst_magam.s_mm
ls_userid = lst_magam.s_userid
ls_kubun  = lst_magam.s_kubun
ls_date   = today()
ls_desc   = mle_1.text

INSERT INTO magam_his(yyyy,mm,w_desc,user_id,w_kubun) VALUES (:ls_yyyy,:ls_mm,:ls_desc,:ls_userid,:ls_kubun);
if sqlca.sqldbcode <> 0 then
	MessageBox('마감해지이력관리','서버에 저장중 오류가 발생했습니다. 재시도 해주세요.',Exclamation!)
	rollback;
	return
end if	
commit;

MessageBox('마감해지이력관리','서버에 해지이력이 저장되었습니다. 월마감해지를 저장하세요.',Exclamation!)
CloseWithReturn(Parent, 'Y')

end event

type pb_retrieve from picturebutton within w_magam_his
event mousemove pbm_mousemove
integer x = 2112
integer y = 52
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

event clicked;string ls_yyyy

ls_yyyy = ddlb_1.text

dw_1.accepttext()
dw_1.retrieve(ls_yyyy)
end event

type pb_close from picturebutton within w_magam_his
event mousemove pbm_mousemove
integer x = 2501
integer y = 52
integer width = 187
integer height = 144
integer taborder = 10
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

event clicked;MessageBox('마감해지이력관리','취소를 선택하면 마감해지가 되지 않습니다.',Exclamation!)
CloseWithReturn(Parent, 'N')

end event

type st_title from statictext within w_magam_his
integer x = 27
integer y = 36
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

type gb_1 from groupbox within w_magam_his
integer x = 2098
integer y = 4
integer width = 640
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

type gb_2 from groupbox within w_magam_his
integer x = 1207
integer y = 44
integer width = 832
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_magam_his
integer x = 18
integer y = 228
integer width = 2720
integer height = 2124
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

