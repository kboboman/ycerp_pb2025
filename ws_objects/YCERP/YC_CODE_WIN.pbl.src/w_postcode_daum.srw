$PBExportHeader$w_postcode_daum.srw
forward
global type w_postcode_daum from window
end type
type cb_3 from commandbutton within w_postcode_daum
end type
type cb_2 from commandbutton within w_postcode_daum
end type
type sle_4 from singlelineedit within w_postcode_daum
end type
type sle_3 from singlelineedit within w_postcode_daum
end type
type st_4 from statictext within w_postcode_daum
end type
type st_3 from statictext within w_postcode_daum
end type
type sle_2 from singlelineedit within w_postcode_daum
end type
type st_2 from statictext within w_postcode_daum
end type
type sle_1 from singlelineedit within w_postcode_daum
end type
type st_1 from statictext within w_postcode_daum
end type
type cb_1 from commandbutton within w_postcode_daum
end type
type ole_postcode from u_web_browser within w_postcode_daum
end type
type gb_1 from groupbox within w_postcode_daum
end type
type gb_2 from groupbox within w_postcode_daum
end type
end forward

global type w_postcode_daum from window
integer width = 2478
integer height = 1312
boolean titlebar = true
string title = "DaumAPI[w_postcode_daum]"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
sle_4 sle_4
sle_3 sle_3
st_4 st_4
st_3 st_3
sle_2 sle_2
st_2 st_2
sle_1 sle_1
st_1 st_1
cb_1 cb_1
ole_postcode ole_postcode
gb_1 gb_1
gb_2 gb_2
end type
global w_postcode_daum w_postcode_daum

type variables
//
gs_zipcode is_zipcode
end variables

event open;//
string ls_url

is_zipcode = Message.PowerObjectParm

ls_url = "http://m.yoo-chang.co.kr/merp/postcode.html"
ole_postcode.object.navigate(ls_url,0,0,0,0)


end event

on w_postcode_daum.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_4=create sle_4
this.sle_3=create sle_3
this.st_4=create st_4
this.st_3=create st_3
this.sle_2=create sle_2
this.st_2=create st_2
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_1=create cb_1
this.ole_postcode=create ole_postcode
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_3,&
this.cb_2,&
this.sle_4,&
this.sle_3,&
this.st_4,&
this.st_3,&
this.sle_2,&
this.st_2,&
this.sle_1,&
this.st_1,&
this.cb_1,&
this.ole_postcode,&
this.gb_1,&
this.gb_2}
end on

on w_postcode_daum.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.ole_postcode)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_3 from commandbutton within w_postcode_daum
integer x = 1760
integer y = 1076
integer width = 672
integer height = 116
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "취소"
end type

event clicked;// 취소
Close(Parent)  

end event

type cb_2 from commandbutton within w_postcode_daum
integer x = 901
integer y = 1076
integer width = 672
integer height = 116
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "복사 후 닫기"
end type

event clicked;//
if sle_1.text = "" OR sle_2.text = "" OR sle_3.text = "" OR sle_4.text = "" then
	RETURN
else
	is_zipcode.zipcode = sle_1.text + "|" + sle_3.text
	is_zipcode.address = sle_2.text + "|" + sle_4.text
	is_zipcode.chk     = "Y"
end if
CloseWithReturn(Parent, is_zipcode)

end event

type sle_4 from singlelineedit within w_postcode_daum
integer x = 462
integer y = 920
integer width = 1851
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type sle_3 from singlelineedit within w_postcode_daum
integer x = 462
integer y = 816
integer width = 457
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_4 from statictext within w_postcode_daum
integer x = 69
integer y = 940
integer width = 352
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "주소"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_postcode_daum
integer x = 69
integer y = 844
integer width = 352
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "우편번호"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_postcode_daum
integer x = 462
integer y = 600
integer width = 1851
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_2 from statictext within w_postcode_daum
integer x = 69
integer y = 624
integer width = 352
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "주소"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_postcode_daum
integer x = 462
integer y = 496
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type st_1 from statictext within w_postcode_daum
integer x = 69
integer y = 520
integer width = 352
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "우편번호"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_postcode_daum
integer x = 23
integer y = 1076
integer width = 672
integer height = 116
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "확인"
end type

event clicked;//
OleObject Obj
string ls_temp, ls_return
long 	 ll_str,  ll_end

// 작업내용 가져오기
if ole_postcode.object.Busy = FALSE then
	Obj = ole_postcode.OBJECT.Document
	
	if ole_postcode.OBJECT.document then
		ls_temp = Obj.body.outerhtml
	end if
end if

// 도로명 주소
ll_str     = PosA(ls_temp, '@')
ll_end     = PosA(ls_temp, '$')
ll_end     = ll_end - ll_str

ls_return  = MidA(ls_temp, ll_str + 1, ll_end - 1)
sle_1.text = MidA(ls_return,1,5)
ll_end     = LenA(ls_return)
sle_2.text = MidA(ls_return,6,ll_end)

// 지번 주소
ll_str     = PosA(ls_temp, '*')
ll_end     = PosA(ls_temp, '%')
ll_end     = ll_end - ll_str

// DEBUGDATA
ls_return  = MidA(ls_temp, ll_str + 1, ll_end - 1)
if ls_return = "' + data.zonecode + addr + '" then
else
	sle_3.text = MidA(ls_return,1,5)
	ll_end     = LenA(ls_return)
	sle_4.text = MidA(ls_return,6,ll_end)
end if

end event

type ole_postcode from u_web_browser within w_postcode_daum
integer x = 23
integer y = 12
integer width = 2409
integer height = 392
string binarykey = "w_postcode_daum.win"
end type

type gb_1 from groupbox within w_postcode_daum
integer x = 23
integer y = 428
integer width = 2409
integer height = 308
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "도로명 주소"
end type

type gb_2 from groupbox within w_postcode_daum
integer x = 23
integer y = 756
integer width = 2409
integer height = 308
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "지번 주소"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
04w_postcode_daum.bin 
2F00000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000a51a410001d41f4600000003000000c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f00000000a51a19f001d41f46a51a410001d41f46000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c000000000000000100000002fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c0000367800000a210000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14w_postcode_daum.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
