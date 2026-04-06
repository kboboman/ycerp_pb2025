$PBExportHeader$w_security.srw
$PBExportComments$보안체크[2005/11/03,정갑용]
forward 
global type w_security from window
end type
type cb_2 from commandbutton within w_security
end type
type sle_2 from singlelineedit within w_security
end type
type st_3 from statictext within w_security
end type
type st_2 from statictext within w_security
end type
type p_1 from picture within w_security
end type
type st_1 from statictext within w_security
end type
type cb_1 from commandbutton within w_security
end type
type sle_1 from singlelineedit within w_security
end type
end forward

global type w_security from window
integer width = 1856
integer height = 684
boolean titlebar = true
string title = "보안카드(w_security)"
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
sle_2 sle_2
st_3 st_3
st_2 st_2
p_1 p_1
st_1 st_1
cb_1 cb_1
sle_1 sle_1
end type
global w_security w_security

type variables
string userid
end variables

on w_security.create
this.cb_2=create cb_2
this.sle_2=create sle_2
this.st_3=create st_3
this.st_2=create st_2
this.p_1=create p_1
this.st_1=create st_1
this.cb_1=create cb_1
this.sle_1=create sle_1
this.Control[]={this.cb_2,&
this.sle_2,&
this.st_3,&
this.st_2,&
this.p_1,&
this.st_1,&
this.cb_1,&
this.sle_1}
end on

on w_security.destroy
destroy(this.cb_2)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.sle_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_msg
integer ls_rand
getenvironment(ge_Environment)
ls_msg = '보안확인을 시행합니다.~n~r'
ls_msg = ls_msg + '나누어 드린 보안카드를 보시고.~n~r'
ls_msg = ls_msg + '아래의 숫자에 해당하는 보안번호를 ~n~r입력하여 주세요.~n~r'
ls_msg = ls_msg + '보안카드는 꼭 본인만 소지하셔야 합니다.'
st_1.text = ls_msg

//userid = message.StringParm
//acc_title = message.StringParm
Randomize(0)
ls_rand = Rand(30)
sle_2.text = string(ls_rand)
sle_1.Text = ''	
sle_1.SetFocus()
 

end event

type cb_2 from commandbutton within w_security
integer x = 1627
integer y = 492
integer width = 169
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;CloseWithReturn(Parent, 'N')
end event

type sle_2 from singlelineedit within w_security
integer x = 425
integer y = 496
integer width = 128
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_3 from statictext within w_security
integer x = 562
integer y = 508
integer width = 654
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
string text = "번에 해당되는 번호는"
boolean focusrectangle = false
end type

type st_2 from statictext within w_security
integer x = 32
integer y = 508
integer width = 402
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 16777215
string text = "보안카드번호"
boolean focusrectangle = false
end type

type p_1 from picture within w_security
integer x = 18
integer y = 40
integer width = 498
integer height = 408
string picturename = "C:\bmp\Key.bmp"
boolean focusrectangle = false
end type

type st_1 from statictext within w_security
integer x = 535
integer y = 44
integer width = 1275
integer height = 420
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8421376
long backcolor = 16777215
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_security
integer x = 1458
integer y = 492
integer width = 169
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
end type

event clicked;integer chk_db_userid, chk_input_userid

string ls_title,ls_userid,ls_date,ls_time,ls_sdate,ls_edate,ls_acc,ls_ect

st_security lst_security

lst_security = Message.PowerObjectParm
ls_userid = lst_security.s_userid
ls_title = lst_security.s_title
ls_sdate = lst_security.s_sdate
ls_edate = lst_security.s_edate
ls_acc = lst_security.s_acc
ls_ect = lst_security.s_etc
//ls_userid = gs_userid

chk_input_userid = integer(sle_1.text)

select res_num
into :chk_db_userid
from security where req_num = :sle_2.text and userid = :gs_userid;
if sqlca.sqldbcode <> 0 then	
	MessageBox("보안오류", "보안번호를 재입력 해주세요..",StopSign!)
	sle_1.Text = ''	
 	sle_1.SetFocus()
	sle_2.text = string(Rand(30))
	return
end if

if chk_db_userid <> chk_input_userid then
	MessageBox("보안오류", "보안번호를 재입력 해주세요..",StopSign!)
	sle_1.Text = ''
 	sle_1.SetFocus()
	sle_2.text = string(Rand(30))
	return
else
	select convert(char(8),getdate(),112) , convert(char(12),getdate(),114) into :ls_date,:ls_time from login where user_id = '1999010s';
	if sqlca.sqldbcode <> 0 then
		return
	end if	
	Insert Into Level_log(user_id,user_desc,acc_date,acc_time,se_sdate,se_edate,se_acc,se_etc) values(:ls_userid,:ls_title,:ls_date,:ls_time,:ls_sdate,:ls_edate,:ls_acc,:ls_ect);
	if sqlca.sqldbcode <> 0 then
		rollback;
		return
	end if	
	commit;
	CloseWithReturn(Parent, 'Y')
end if
end event

type sle_1 from singlelineedit within w_security
integer x = 1234
integer y = 496
integer width = 206
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

