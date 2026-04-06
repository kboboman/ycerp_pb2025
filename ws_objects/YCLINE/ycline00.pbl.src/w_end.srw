$PBExportHeader$w_end.srw
$PBExportComments$생산현장 종료
forward
global type w_end from window
end type
type st_1 from statictext within w_end
end type
type cb_1 from commandbutton within w_end
end type
type dw_1 from datawindow within w_end
end type
end forward

global type w_end from window
integer width = 2528
integer height = 420
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean toolbarvisible = false
boolean center = true
st_1 st_1
cb_1 cb_1
dw_1 dw_1
end type
global w_end w_end

type prototypes
////
//FUNCTION STRING GetCommandLineA()  LIBRARY "kernel32.DLL"
//
end prototypes

on w_end.create
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.cb_1,&
this.dw_1}
end on

on w_end.destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;string ls_title
 
ls_title = Message.StringParm
if isNull(ls_title) or Trim(ls_title) = '' then
	this.title = 'No Title'
else
	this.title = ls_title
end if

dw_1.InsertRow(0)

if GF_PERMISSION('ycline유압반pc', gs_ipaddress) = 'Y' or LeftA(gs_ipaddress, 9) = "192.168.1" then
	halt close
end if

end event

type st_1 from statictext within w_end
integer x = 46
integer y = 300
integer width = 873
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ctrl + Shift + F12"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_end
integer x = 2016
integer y = 284
integer width = 457
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소[ESC]"
boolean cancel = true
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_end
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
integer x = 9
integer width = 2496
integer height = 272
integer taborder = 10
string title = "none"
string dataobject = "d_end"
boolean border = false
boolean livescroll = true
end type

event ue_key;long ll_ret

This.AcceptText()
if keyflags = 3 and key = KeyF12! then
		if MessageBox('확인', '프로그램을 종료하시겠습니까?', Question!, YesNo!, 1) = 2 then return
		
//		SystemParametersInfo( 97, False, b, 0);
		HALT CLOSE
else
	choose case key
		case KeyEnter!
			choose case This.GetItemString(This.GetRow(), 'end_gb')
				case '1'	// 시스템 종료
					ll_ret = MessageBox('확인', '시스템을 종료하시겠습니까?', Question!, YesNo!, 1)
					if ll_ret = 2 then return
					Close(Parent)
					Close(w_line)
//					ExitWindowsEx(1, 4294967295)
					
				case '2' // 시스템 재시작
					ll_ret = MessageBox('확인', '시스템을 다시 시작하시겠습니까?', Question!, YesNo!, 1)
					if ll_ret = 2 then return
					Close(Parent)
					Close(w_line)
//					ExitWindowsEx(2, 4294967295)
					
				case '3'	// 프로그램 재시작
					RUN("ycline_verup.exe")
					HALT CLOSE
			end choose
	end choose
end if

end event

