$PBExportHeader$w_magam_w.srw
$PBExportComments$마감용 임직원
forward
global type w_magam_w from window
end type
type mle_bigo from multilineedit within w_magam_w
end type
type st_phone from statictext within w_magam_w
end type
type cbx_mms from checkbox within w_magam_w
end type
type dw_1 from datawindow within w_magam_w
end type
type pb_2 from picturebutton within w_magam_w
end type
type pb_1 from picturebutton within w_magam_w
end type
type gb_1 from groupbox within w_magam_w
end type
type st_title from statictext within w_magam_w
end type
type gb_2 from groupbox within w_magam_w
end type
end forward

global type w_magam_w from window
integer x = 832
integer y = 360
integer width = 2272
integer height = 2040
boolean titlebar = true
string title = "w_magam_w"
windowtype windowtype = response!
long backcolor = 79220952
boolean center = true
mle_bigo mle_bigo
st_phone st_phone
cbx_mms cbx_mms
dw_1 dw_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
st_title st_title
gb_2 gb_2
end type
global w_magam_w w_magam_w

type variables
//
gs_codere_str  ist_code

integer ii_chk = 0
long    ih_curteam

TreeViewitem itv_team

end variables

on w_magam_w.create
this.mle_bigo=create mle_bigo
this.st_phone=create st_phone
this.cbx_mms=create cbx_mms
this.dw_1=create dw_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.st_title=create st_title
this.gb_2=create gb_2
this.Control[]={this.mle_bigo,&
this.st_phone,&
this.cbx_mms,&
this.dw_1,&
this.pb_2,&
this.pb_1,&
this.gb_1,&
this.st_title,&
this.gb_2}
end on

on w_magam_w.destroy
destroy(this.mle_bigo)
destroy(this.st_phone)
destroy(this.cbx_mms)
destroy(this.dw_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
destroy(this.st_title)
destroy(this.gb_2)
end on

event open;string ls_phone
long   l_row

ist_code = Message.PowerObjectParm

dw_1.SetTransObject(SQLCA)		// 팀원

l_row = dw_1.retrieve()

if isnull(l_row) OR l_row < 1 then RETURN

ls_phone = dw_1.object.phone[1]
st_phone.text = "전화번호:" + ls_phone


end event

type mle_bigo from multilineedit within w_magam_w
integer x = 55
integer y = 1508
integer width = 2107
integer height = 204
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_phone from statictext within w_magam_w
integer x = 1216
integer y = 88
integer width = 978
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전화번호:"
boolean focusrectangle = false
end type

type cbx_mms from checkbox within w_magam_w
integer x = 1202
integer y = 1328
integer width = 421
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "문자전송"
boolean checked = true
end type

type dw_1 from datawindow within w_magam_w
integer x = 37
integer y = 184
integer width = 2158
integer height = 1060
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_magam_member"
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;//
pb_1.triggerevent( clicked! )

end event

event clicked;//
string ls_phone

if isnull(row) OR row < 1 then RETURN

ls_phone = dw_1.object.phone[row]
st_phone.text = "전화번호:" + ls_phone
end event

type pb_2 from picturebutton within w_magam_w
integer x = 1925
integer y = 1300
integer width = 242
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;//
ist_code.okcancel = 'N'
CloseWithReturn(parent, ist_code)

end event

type pb_1 from picturebutton within w_magam_w
integer x = 1650
integer y = 1300
integer width = 242
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = right!
end type

event clicked;//
string ls_userid, ls_username, ls_phone, ls_bigo
long   ll_row

ll_row  = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_userid   = dw_1.object.user_id[ll_row]
ls_username = dw_1.object.user_name[ll_row]
ls_phone    = dw_1.object.phone[ll_row]
if mle_bigo.text = "" then
	MessageBox("확인","수주마감 사유를 등록하시기 바랍니다")
	RETURN
else
	ls_bigo = mle_bigo.text
end if

if cbx_mms.checked = false then ls_phone = ""

ist_code.okcancel = "Y"
ist_code.flag     = ls_phone
ist_code.start_no = ls_userid
ist_code.end_no   = ls_username
ist_code.sel      = ls_bigo
CloseWithReturn(parent, ist_code)
end event

type gb_1 from groupbox within w_magam_w
integer x = 1175
integer y = 1256
integer width = 1019
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
end type

type st_title from statictext within w_magam_w
integer x = 23
integer y = 28
integer width = 1138
integer height = 124
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "수신자 선택"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_magam_w
integer x = 23
integer y = 1452
integer width = 2171
integer height = 280
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "사유(비고)"
borderstyle borderstyle = stylebox!
end type

