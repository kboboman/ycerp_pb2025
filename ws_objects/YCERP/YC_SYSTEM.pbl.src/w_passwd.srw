$PBExportHeader$w_passwd.srw
$PBExportComments$패스워드변경(1998/02/06,곽용덕)
forward
global type w_passwd from w_inheritance
end type
end forward

global type w_passwd from w_inheritance
integer width = 3255
integer height = 2340
string title = "패스워드 등록 및 변경(w_passwd)"
end type
global w_passwd w_passwd

type prototypes
// CapsLock 상태
FUNCTION int GetKeyState(int keystatus) LIBRARY "user32.dll"

end prototypes

type variables
string is_passwd
end variables

on w_passwd.create
call super::create
end on

on w_passwd.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if dw_1.retrieve( gs_userid ) = 0 then
	messagebox('확인','개인 정보를 조회하지 못했습니다.~r~n프로그램을 닫고 다시 시작하세요!')
end if


end event

type pb_save from w_inheritance`pb_save within w_passwd
integer x = 1870
string text = "확인"
end type

event pb_save::clicked;call super::clicked;string	ls_passwd, ls_str
long		k, ll_passwd

if dw_1.accepttext( ) = -1 then return

ls_passwd	= dw_1.getitemstring(1, 'password')
ll_passwd		= LenA(ls_passwd)
if ll_passwd < 4 then
	MessageBox("경고", "패스워드 길이(4자) 오류입니다." ,stopsign!)
	return
else
	for k = 1 to ll_passwd
		ls_str = MidA(ls_passwd,k,1)
		choose case ls_str
			case 'a' to 'z'

			case 'A' to 'Z'

			case '0' to '9'

			case else
				MessageBox("경고", "영문자와 숫자만~r~n사용가능합니다." ,Exclamation!)
				RETURN
		end choose
	next
end if
//저장 
wf_update1(dw_1,'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_passwd
integer x = 37
integer y = 264
integer width = 2272
integer height = 424
string dataobject = "d_userid_ff"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::constructor;call super::constructor;this.insertrow(0)
end event

type st_title from w_inheritance`st_title within w_passwd
integer width = 1234
integer textsize = -20
string text = "사용자 정보 변경"
end type

type st_tips from w_inheritance`st_tips within w_passwd
integer x = 0
integer y = 0
end type

type pb_compute from w_inheritance`pb_compute within w_passwd
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_print_part from w_inheritance`pb_print_part within w_passwd
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance`pb_close within w_passwd
integer x = 2066
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_passwd
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_cancel from w_inheritance`pb_cancel within w_passwd
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_delete from w_inheritance`pb_delete within w_passwd
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_insert from w_inheritance`pb_insert within w_passwd
boolean visible = false
integer x = 2071
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_passwd
boolean visible = false
integer x = 1879
end type

type gb_3 from w_inheritance`gb_3 within w_passwd
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_passwd
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_passwd
integer x = 1842
integer width = 466
end type

type dw_2 from w_inheritance`dw_2 within w_passwd
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 60
end type

