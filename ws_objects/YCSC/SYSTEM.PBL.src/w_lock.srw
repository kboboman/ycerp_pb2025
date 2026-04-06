$PBExportHeader$w_lock.srw
$PBExportComments$프로그램잠금(1998/02/06,곽용덕)
forward
global type w_lock from w_inheritance
end type
type sle_1 from singlelineedit within w_lock
end type
type st_1 from statictext within w_lock
end type
type mle_1 from multilineedit within w_lock
end type
type st_2 from statictext within w_lock
end type
type st_3 from statictext within w_lock
end type
type st_4 from statictext within w_lock
end type
end forward

global type w_lock from w_inheritance
integer x = 974
integer y = 524
integer width = 1376
integer height = 548
string title = "프로그램잠금(w_lock)"
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
st_4 st_4
end type
global w_lock w_lock

type variables
string is_passwd
end variables

on w_lock.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_1=create st_1
this.mle_1=create mle_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
end on

on w_lock.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

IF IsValid( w_ca_Main ) THEN				// 원가 관리
	w_ca_Main.WindowState = Minimized!
END IF
IF IsValid( w_s_Main ) THEN				// 시스템 관리
	w_s_Main.WindowState = Minimized!
END IF
IF IsValid( w_o_Main ) THEN				// 판매 관리
	w_o_Main.WindowState = Minimized!
END IF
IF IsValid( w_m_Main ) THEN				// 생산 관리
	w_m_Main.WindowState = Minimized!
END IF
IF IsValid( w_i_Main ) THEN				// 자재 관리
	w_i_Main.WindowState = Minimized!
END IF
IF IsValid( w_youchang ) THEN				// 메인메뉴
	w_youchang.WindowState = Minimized!
END IF

//IF IsValid( w_c_Main ) THEN				// 공무 관리
//	w_c_Main.WindowState = Minimized!
//END IF
//IF IsValid( w_b_Main ) THEN				// 공사정보 관리
//	w_b_Main.WindowState = Minimized!
//END IF
//IF IsValid( w_gl_Main ) THEN				// 회계 관리
//	w_gl_Main.WindowState = Minimized!
//END IF
//IF IsValid( w_per_Main ) THEN				// 인사 관리
//	w_per_Main.WindowState = Minimized!
//END IF
//IF IsValid( w_pr_Main ) THEN				// 급여 관리
//	w_pr_Main.WindowState = Minimized!
//END IF
//IF IsValid( w_wk_Main ) THEN				// 근태 관리
//	w_wk_Main.WindowState = Minimized!
//END IF

string ls_str
this.x = 1120
this.y = 800
dw_1.retrieve(gs_userid)

//ls_str = "user_id = '" + gs_userid + "'"
//
//dw_1.SetFilter(ls_str)
//dw_1.Filter( )
sle_1.setfocus()
end event

type pb_save from w_inheritance`pb_save within w_lock
boolean visible = false
integer x = 1719
string text = "확인"
end type

type dw_1 from w_inheritance`dw_1 within w_lock
boolean visible = false
integer x = 2267
integer y = 84
integer width = 896
integer height = 700
string dataobject = "d_userid"
end type

type dw_2 from w_inheritance`dw_2 within w_lock
boolean visible = false
integer taborder = 60
end type

type st_title from w_inheritance`st_title within w_lock
boolean visible = false
integer width = 1801
integer textsize = -20
string text = "패스워드"
end type

type st_tips from w_inheritance`st_tips within w_lock
end type

type pb_compute from w_inheritance`pb_compute within w_lock
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_lock
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_lock
boolean visible = false
integer x = 1915
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_lock
boolean visible = false
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_lock
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_lock
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_lock
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_lock
boolean visible = false
integer taborder = 150
end type

type gb_3 from w_inheritance`gb_3 within w_lock
integer x = 73
integer y = 76
integer width = 1179
integer height = 156
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_lock
integer x = 37
integer y = 32
integer width = 1257
integer height = 372
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_lock
boolean visible = false
integer x = 1874
integer width = 265
end type

type sle_1 from singlelineedit within w_lock
event keydown pbm_keydown
integer x = 517
integer y = 248
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

event keydown;string ls_passwd,ls_str,ls_name
choose case keyflags
	case 0	
       choose case key 
		     case KeyEnter!
                ls_passwd = trim(sle_1.text)
                ls_str = trim(dw_1.getitemstring(1,"password")) 
                ls_name = trim(dw_1.getitemstring(1,"user_name"))
                if isnull(ls_str) then
	                ls_str = ""
                end if

                if ls_passwd = ls_str then

							IF IsValid( w_ca_Main ) THEN				// 원가 관리
								w_ca_Main.WindowState = Normal!
							END IF
							IF IsValid( w_s_Main ) THEN				// 시스템 관리
								w_s_Main.WindowState = Normal!
							END IF
							IF IsValid( w_o_Main ) THEN				// 판매 관리
								w_o_Main.WindowState = Normal!
							END IF
							IF IsValid( w_m_Main ) THEN				// 생산 관리
								w_m_Main.WindowState = Normal!
							END IF
							IF IsValid( w_i_Main ) THEN				// 자재 관리
								w_i_Main.WindowState = Normal!
							END IF
							IF IsValid( w_youchang ) THEN				// 메인메뉴
								w_youchang.WindowState = Normal!
							END IF
							
							//IF IsValid( w_c_Main ) THEN				// 공무 관리
							//	w_c_Main.WindowState = Normal!
							//END IF
							//IF IsValid( w_b_Main ) THEN				// 공사정보 관리
							//	w_b_Main.WindowState = Normal!
							//END IF
							//IF IsValid( w_gl_Main ) THEN				// 회계 관리
							//	w_gl_Main.WindowState = Normal!
							//END IF
							//IF IsValid( w_per_Main ) THEN				// 인사 관리
							//	w_per_Main.WindowState = Normal!
							//END IF
							//IF IsValid( w_pr_Main ) THEN				// 급여 관리
							//	w_pr_Main.WindowState = Normal!
							//END IF
							//IF IsValid( w_wk_Main ) THEN				// 근태 관리
							//	w_wk_Main.WindowState = Normal!
							//END IF
							 close(parent)
					 else
						 sle_1.text = ""
						 sle_1.setfocus() 
                end if
		 end choose
   case 2

end choose
end event

type st_1 from statictext within w_lock
integer x = 91
integer y = 264
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 77897888
boolean enabled = false
string text = "Password :"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_lock
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

type st_2 from statictext within w_lock
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

type st_3 from statictext within w_lock
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

type st_4 from statictext within w_lock
integer x = 169
integer y = 128
integer width = 960
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 77897888
boolean enabled = false
string text = "패스워드를 입력하십시요."
boolean focusrectangle = false
end type

