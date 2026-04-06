$PBExportHeader$w_block_login.srw
forward
global type w_block_login from window
end type
type st_4 from statictext within w_block_login
end type
type st_3 from statictext within w_block_login
end type
type cb_2 from commandbutton within w_block_login
end type
type cb_1 from commandbutton within w_block_login
end type
type st_2 from statictext within w_block_login
end type
type st_1 from statictext within w_block_login
end type
type sle_pwd from singlelineedit within w_block_login
end type
type sle_id from singlelineedit within w_block_login
end type
type p_1 from picture within w_block_login
end type
type gb_1 from groupbox within w_block_login
end type
end forward

global type w_block_login from window
integer width = 1943
integer height = 716
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
st_4 st_4
st_3 st_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
sle_pwd sle_pwd
sle_id sle_id
p_1 p_1
gb_1 gb_1
end type
global w_block_login w_block_login

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

getenvironment(ge_Environment)
sle_id.setfocus() 
end event

on w_block_login.create
this.st_4=create st_4
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_pwd=create sle_pwd
this.sle_id=create sle_id
this.p_1=create p_1
this.gb_1=create gb_1
this.Control[]={this.st_4,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.sle_pwd,&
this.sle_id,&
this.p_1,&
this.gb_1}
end on

on w_block_login.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_pwd)
destroy(this.sle_id)
destroy(this.p_1)
destroy(this.gb_1)
end on

type st_4 from statictext within w_block_login
integer x = 96
integer y = 116
integer width = 1705
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
string text = "통제권자는 로그인 하여 주세요."
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_3 from statictext within w_block_login
integer x = 96
integer y = 40
integer width = 1705
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
string text = "통제 권한이 있는 분만 접근할수 있습니다."
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_block_login
integer x = 1385
integer y = 552
integer width = 407
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취 소"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_block_login
integer x = 992
integer y = 552
integer width = 393
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확 인"
boolean default = true
end type

event clicked;string ls_userid, ls_userpwd, ls_name

ls_userid = sle_id.text
ls_userpwd = sle_pwd.text

select user_name into :ls_name from security_login where user_id = :ls_userid and user_pwd = :ls_userpwd;
if sqlca.sqldbcode <> 0 then
	MessageBox('통제관리','등록된 통제권자가 아닙니다. 전산실에 확인해주세요.',Exclamation!)
	sle_id.setfocus()
	return
else
	open(w_b_main)
end if
close(parent)

end event

type st_2 from statictext within w_block_login
integer x = 622
integer y = 444
integer width = 338
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
string text = "비밀번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_1 from statictext within w_block_login
integer x = 622
integer y = 340
integer width = 338
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
string text = "아이디"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type sle_pwd from singlelineedit within w_block_login
integer x = 987
integer y = 440
integer width = 791
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
integer limit = 8
borderstyle borderstyle = styleshadowbox!
end type

type sle_id from singlelineedit within w_block_login
integer x = 987
integer y = 340
integer width = 791
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
integer limit = 8
borderstyle borderstyle = styleshadowbox!
end type

type p_1 from picture within w_block_login
integer x = 32
integer y = 252
integer width = 498
integer height = 408
string picturename = "C:\bmp\Key.bmp"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_block_login
integer x = 535
integer y = 252
integer width = 1275
integer height = 408
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
end type

