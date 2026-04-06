$PBExportHeader$w_chkpass.srw
forward
global type w_chkpass from w_inheritance
end type
type sle_1 from singlelineedit within w_chkpass
end type
type st_1 from statictext within w_chkpass
end type
type mle_1 from multilineedit within w_chkpass
end type
type st_2 from statictext within w_chkpass
end type
type st_3 from statictext within w_chkpass
end type
end forward

global type w_chkpass from w_inheritance
integer width = 1257
integer height = 436
string title = "패스워드확인(w_chkpass)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
sle_1 sle_1
st_1 st_1
mle_1 mle_1
st_2 st_2
st_3 st_3
end type
global w_chkpass w_chkpass

type variables
gs_chkpass_str istr_pass

end variables

on w_chkpass.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_1=create st_1
this.mle_1=create mle_1
this.st_2=create st_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
end on

on w_chkpass.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.st_2)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_str
this.x = 1120
this.y = 300

sle_1.setfocus()
end event

type pb_save from w_inheritance`pb_save within w_chkpass
boolean visible = false
integer x = 1719
string text = "확인"
end type

type dw_1 from w_inheritance`dw_1 within w_chkpass
boolean visible = false
integer x = 2267
integer y = 84
integer width = 896
integer height = 700
end type

type dw_2 from w_inheritance`dw_2 within w_chkpass
boolean visible = false
integer y = 288
integer taborder = 60
end type

type st_title from w_inheritance`st_title within w_chkpass
boolean visible = false
integer width = 1801
integer textsize = -20
string text = "패스워드"
end type

type st_tips from w_inheritance`st_tips within w_chkpass
end type

type pb_compute from w_inheritance`pb_compute within w_chkpass
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_chkpass
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_chkpass
integer x = 439
integer y = 168
integer width = 343
integer taborder = 110
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "확인"
string picturename = "c:\bmp\확인0.bmp"
end type

event pb_close::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"확인",parent, li_x, li_y)

end event

event pb_close::clicked;string ls_passwd, ls_root

ls_passwd = trim(sle_1.text)
setnull(ls_root)
select password into :ls_root from login
 where user_id = "root";
if ls_passwd = ls_root then
   istr_pass.chk = TRUE
	closewithreturn(parent, istr_pass)
else
	sle_1.text = ""
	sle_1.setfocus() 
end if

end event

type pb_print from w_inheritance`pb_print within w_chkpass
boolean visible = false
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_chkpass
integer x = 795
integer y = 168
integer width = 343
integer taborder = 130
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
end type

event pb_cancel::clicked;istr_pass.chk = false
closewithreturn(parent, istr_pass)

end event

type pb_delete from w_inheritance`pb_delete within w_chkpass
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_chkpass
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_chkpass
boolean visible = false
integer taborder = 150
end type

type gb_3 from w_inheritance`gb_3 within w_chkpass
boolean visible = false
integer x = 73
integer y = 76
integer width = 1179
integer height = 156
integer taborder = 70
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_chkpass
integer x = 27
integer y = 0
integer width = 1175
integer height = 324
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_chkpass
boolean visible = false
integer x = 1874
integer width = 265
end type

type sle_1 from singlelineedit within w_chkpass
event keydown pbm_keydown
integer x = 434
integer y = 52
integer width = 699
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean autohscroll = false
boolean password = true
integer limit = 8
borderstyle borderstyle = stylelowered!
end type

event keydown;string ls_passwd, ls_root
choose case keyflags
	case 0	
       choose case key 
		     case KeyEnter!
                ls_passwd = trim(sle_1.text)
					 setnull(ls_root)
					 select password into :ls_root from login
					  where user_id = "root";
                if ls_passwd = ls_root then
                   istr_pass.chk = TRUE
						 closewithreturn(parent, istr_pass)
					 else
						 sle_1.text = ""
						 sle_1.setfocus() 
                end if
		 end choose
   case 2

end choose
end event

type st_1 from statictext within w_chkpass
integer x = 46
integer y = 68
integer width = 379
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
boolean enabled = false
string text = "Password :"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_chkpass
boolean visible = false
integer x = 151
integer y = 352
integer width = 1051
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 12632256
boolean enabled = false
string text = "  패스워드를 입력하십시요."
boolean border = false
end type

type st_2 from statictext within w_chkpass
boolean visible = false
integer x = 325
integer y = 656
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
boolean enabled = false
string text = "New Password :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_chkpass
boolean visible = false
integer x = 325
integer y = 656
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
boolean enabled = false
string text = "Retry :"
alignment alignment = right!
boolean focusrectangle = false
end type

