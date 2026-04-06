$PBExportHeader$w_passwd.srw
$PBExportComments$패스워드변경(1998/02/06,곽용덕)
forward
global type w_passwd from w_inheritance
end type
type sle_1 from singlelineedit within w_passwd
end type
type st_1 from statictext within w_passwd
end type
type mle_1 from multilineedit within w_passwd
end type
type st_2 from statictext within w_passwd
end type
type st_3 from statictext within w_passwd
end type
end forward

global type w_passwd from w_inheritance
integer width = 2217
integer height = 960
string title = "패스워드 등록 및 변경(w_passwd)"
sle_1 sle_1
st_1 st_1
mle_1 mle_1
st_2 st_2
st_3 st_3
end type
global w_passwd w_passwd

type variables
string is_passwd
end variables

on w_passwd.create
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

on w_passwd.destroy
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
dw_1.retrieve(gs_userid)

//ls_str = "user_id = '" + gs_userid + "'"
//
//dw_1.SetFilter(ls_str)
//dw_1.Filter( )
sle_1.setfocus()
end event

type pb_save from w_inheritance`pb_save within w_passwd
boolean visible = false
integer x = 1719
string text = "확인"
end type

type dw_1 from w_inheritance`dw_1 within w_passwd
boolean visible = false
integer x = 1605
integer y = 4
integer width = 270
integer height = 172
string dataobject = "d_userid"
end type

type dw_2 from w_inheritance`dw_2 within w_passwd
boolean visible = false
integer taborder = 60
end type

type st_title from w_inheritance`st_title within w_passwd
integer width = 1568
integer textsize = -20
string text = "패스워드 등록 및 변경"
end type

type st_tips from w_inheritance`st_tips within w_passwd
end type

type pb_compute from w_inheritance`pb_compute within w_passwd
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_passwd
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_passwd
integer x = 1915
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_passwd
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_passwd
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_passwd
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_passwd
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_passwd
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_passwd
integer x = 119
integer y = 312
integer width = 1920
integer height = 276
end type

type gb_2 from w_inheritance`gb_2 within w_passwd
integer x = 41
integer y = 260
integer width = 2103
integer height = 556
end type

type gb_1 from w_inheritance`gb_1 within w_passwd
integer x = 1874
integer width = 265
end type

type sle_1 from singlelineedit within w_passwd
event keydown pbm_keydown
integer x = 1056
integer y = 644
integer width = 773
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
integer ll_cnt,k
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

                if st_1.visible = true then   // old passwd
	                if ls_passwd = ls_str then
		                st_1.visible = false
		                st_2.visible = true
		                sle_1.text = ""
		                sle_1.setfocus()
		                return
                   else
		                MessageBox("오류", "현재 패스워드가 틀렸습니다!" ,stopsign!)
		                sle_1.text = ""
		                sle_1.setfocus()
		                return
	                end if
                end if	

                if st_2.visible = true then   // new passwd
                   ll_cnt = LenA(ls_passwd)
	                if ls_passwd = "" then
		
	                else	
                      for k = 1 to ll_cnt
		                    ls_str = MidA(ls_passwd,k,1)
			                 choose case ls_str
				                case 'a' to 'z'
					
				                case 'A' to 'Z'
					
				                case '0' to '9'
					
				                case else
			                       MessageBox("경고", "패스워드 스트링 오류입니다." ,Exclamation!)
			                       sle_1.text = ""
				                    sle_1.setfocus()
			                       return
			                end choose
	                  next
	               end if	
                  if isnull(ls_passwd) then
	                  ls_passwd = ""
                  end if	 
	               is_passwd = ls_passwd 
               	st_2.visible = false
	               st_3.visible = true
               	sle_1.text = ""
	               sle_1.setfocus()
	               return
               end if

               if st_3.visible = true then   // new passwd
                  if is_passwd = ls_passwd then
		               dw_1.setitem(1,"password",is_passwd)
	 	               wf_update1(dw_1,"N")
                     close(parent)
	               else
		               MessageBox("경고", "패스워드 변경 오류입니다." ,stopsign!)
		               st_3.visible = false
	                  st_1.visible = true
	                  sle_1.text = ""
		               sle_1.setfocus()
                  end if		
               end if
		 end choose
   case 2
		

end choose
end event

type st_1 from statictext within w_passwd
integer x = 119
integer y = 652
integer width = 805
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
string text = "현재 패스워드 :"
alignment alignment = right!
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_passwd
integer x = 261
integer y = 396
integer width = 1586
integer height = 156
integer taborder = 61
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 12632256
string text = "  패스워드는 영문자와 숫자만을 허용하고   그 이외의 문자는  허용하지 않읍니다."
boolean border = false
boolean displayonly = true
end type

type st_2 from statictext within w_passwd
boolean visible = false
integer x = 119
integer y = 652
integer width = 805
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 12632256
boolean enabled = false
string text = "변경할 패스워드 :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_passwd
boolean visible = false
integer x = 119
integer y = 652
integer width = 805
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 12632256
boolean enabled = false
string text = "변경할패스워드 확인:"
alignment alignment = right!
boolean focusrectangle = false
end type

