$PBExportHeader$w_messagebox.srw
$PBExportComments$Custom Messagebox
forward
global type w_messagebox from window
end type
type pb_close from picturebutton within w_messagebox
end type
type st_title from statictext within w_messagebox
end type
type gb_1 from groupbox within w_messagebox
end type
type st_msg from statictext within w_messagebox
end type
type gb_2 from groupbox within w_messagebox
end type
end forward

global type w_messagebox from window
integer x = 494
integer y = 424
integer width = 2295
integer height = 600
boolean titlebar = true
string title = "알림창(w_messagebox)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Exclamation!"
boolean center = true
pb_close pb_close
st_title st_title
gb_1 gb_1
st_msg st_msg
gb_2 gb_2
end type
global w_messagebox w_messagebox

type variables
gs_custper_str istr_select
int ii_type, ii_sw =0
int ii_cnt = 0
end variables

on w_messagebox.create
this.pb_close=create pb_close
this.st_title=create st_title
this.gb_1=create gb_1
this.st_msg=create st_msg
this.gb_2=create gb_2
this.Control[]={this.pb_close,&
this.st_title,&
this.gb_1,&
this.st_msg,&
this.gb_2}
end on

on w_messagebox.destroy
destroy(this.pb_close)
destroy(this.st_title)
destroy(this.gb_1)
destroy(this.st_msg)
destroy(this.gb_2)
end on

event open;//string ls_return,ls_parm  
//ls_parm = as_text+','+as_option1+','
//ls_parm = '시공안내요망,실버타일 : 화살표 방향으로 시공요망,'
//openwithparm(w_msg,ls_parm)  
//ls_return = message.stringparm  

string ls_data,ls_parse  
integer li_loop,li_count  
ls_data = message.stringparm  
for li_loop = 1 to LenA(ls_data)  
	ls_parse += MidA(ls_data,li_loop,1)  
	if RightA(ls_parse,1) = ',' then  
		ls_parse = LeftA(ls_parse,LenA(ls_parse) - 1)  
		li_count++  
		choose case li_count  
			case 1  
				st_title.text = ls_parse  
			case 2  
				st_msg.text = ls_parse  
		end choose  
		ls_parse = ''  
	end if  
next  
end event

type pb_close from picturebutton within w_messagebox
integer x = 2030
integer y = 48
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\BMP\EXIT.BMP"
string disabledname = "C:\BMP\EXIT.BMP"
alignment htextalign = right!
end type

event clicked;closewithreturn(parent,'닫기')  
end event

type st_title from statictext within w_messagebox
integer x = 27
integer y = 24
integer width = 1440
integer height = 148
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "알림창"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_messagebox
integer x = 2011
integer width = 229
integer height = 212
integer taborder = 90
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

type st_msg from statictext within w_messagebox
integer x = 46
integer y = 236
integer width = 2181
integer height = 252
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
long backcolor = 65535
string text = "none"
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_messagebox
integer x = 27
integer y = 188
integer width = 2213
integer height = 312
integer taborder = 10
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
borderstyle borderstyle = StyleRaised!
end type

