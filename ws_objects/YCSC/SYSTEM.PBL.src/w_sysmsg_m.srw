$PBExportHeader$w_sysmsg_m.srw
$PBExportComments$사용자메시지(1999/06/23, 이인호)
forward
global type w_sysmsg_m from window
end type
type cbx_all from checkbox within w_sysmsg_m
end type
type cbx_3 from checkbox within w_sysmsg_m
end type
type cb_insertall from commandbutton within w_sysmsg_m
end type
type ddplb_1 from dropdownpicturelistbox within w_sysmsg_m
end type
type cb_cancel from commandbutton within w_sysmsg_m
end type
type cb_send from commandbutton within w_sysmsg_m
end type
type cb_exit from commandbutton within w_sysmsg_m
end type
type dw_1 from datawindow within w_sysmsg_m
end type
type cb_delete from commandbutton within w_sysmsg_m
end type
type cb_send2 from commandbutton within w_sysmsg_m
end type
type cb_insert from commandbutton within w_sysmsg_m
end type
type gb_1 from groupbox within w_sysmsg_m
end type
end forward

global type w_sysmsg_m from window
integer x = 494
integer y = 424
integer width = 3584
integer height = 1340
boolean titlebar = true
string title = "메시지(w_sysmsg_m)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
string icon = "C:\bmp\Book.ico"
boolean center = true
cbx_all cbx_all
cbx_3 cbx_3
cb_insertall cb_insertall
ddplb_1 ddplb_1
cb_cancel cb_cancel
cb_send cb_send
cb_exit cb_exit
dw_1 dw_1
cb_delete cb_delete
cb_send2 cb_send2
cb_insert cb_insert
gb_1 gb_1
end type
global w_sysmsg_m w_sysmsg_m

type variables
gs_custper_str istr_select
int ii_type, ii_sw =0
int ii_cnt = 0
end variables

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_msgchk

ls_msgchk = ProfileString("YCSC.INI", "MessageBox", "Check", " ")
if ls_msgchk = 'Y' then
	cbx_3.Checked = True		// 알림
else
	cbx_3.Checked = False
end if

istr_select = Message.PowerObjectParm
choose case istr_select.str_ok
	case true 	// 받은 메시지
		  dw_1.dataobject   = 'd_sysmsg_m'
		  ddplb_1.text      = "받은 메시지"
		  
		  ii_type           = 1
		  cb_insertall.text = "운영자"	// 전체추가
		  cb_cancel.enabled = false
		  cb_send.enabled   = false
		  cb_insert.enabled = false
		  cb_delete.enabled = true
		  cb_send2.enabled  = true
		  
	case false 	// 보낸 메시지
		  dw_1.dataobject   = 'd_sysmsg2_m'	
		  cb_insertall.text = "전체추가"
		  
		  ii_type   = 2
		  ddplb_1.text      = "보낸 메시지"
		  cb_cancel.enabled = true
		  cb_send.enabled   = true
		  cb_insert.enabled = true
		  cb_delete.enabled = false
		  cb_send2.enabled  = false
end choose

if gs_userid = "1999010s" then
   cb_insertall.enabled = true	// 전체추가
else
   cb_insertall.enabled = false
end if

dw_1.settransobject(sqlca)
dw_1.retrieve( gs_userid )
dw_1.setfocus()

if gs_print_control = "mess" then
	setnull(gs_print_control)
	
	cb_insert.triggerevent(clicked!)	// 추가
	dw_1.object.tlogin[dw_1.getrow()] = LeftA(istr_select.str_where,10)
	dw_1.object.msg[dw_1.getrow()]    = MidA(istr_select.str_where,11,170)
end if

timer(1)

end event

on w_sysmsg_m.create
this.cbx_all=create cbx_all
this.cbx_3=create cbx_3
this.cb_insertall=create cb_insertall
this.ddplb_1=create ddplb_1
this.cb_cancel=create cb_cancel
this.cb_send=create cb_send
this.cb_exit=create cb_exit
this.dw_1=create dw_1
this.cb_delete=create cb_delete
this.cb_send2=create cb_send2
this.cb_insert=create cb_insert
this.gb_1=create gb_1
this.Control[]={this.cbx_all,&
this.cbx_3,&
this.cb_insertall,&
this.ddplb_1,&
this.cb_cancel,&
this.cb_send,&
this.cb_exit,&
this.dw_1,&
this.cb_delete,&
this.cb_send2,&
this.cb_insert,&
this.gb_1}
end on

on w_sysmsg_m.destroy
destroy(this.cbx_all)
destroy(this.cbx_3)
destroy(this.cb_insertall)
destroy(this.ddplb_1)
destroy(this.cb_cancel)
destroy(this.cb_send)
destroy(this.cb_exit)
destroy(this.dw_1)
destroy(this.cb_delete)
destroy(this.cb_send2)
destroy(this.cb_insert)
destroy(this.gb_1)
end on

event timer;//
long hWnd
int  li_cnt

if ii_sw = 1 then
	SELECT count(*) INTO :li_cnt FROM sysmsg WHERE tlogin = :gs_userid AND del = "N";
	if li_cnt > 0 then dw_1.retrieve( gs_userid )
else
	if This.WindowState = Minimized! then
		if ii_sw = 0 then
			SELECT count(*) INTO :li_cnt FROM sysmsg WHERE tlogin = :gs_userid AND del = "N";
			if li_cnt > 0 then
				dw_1.retrieve( gs_userid )
				ii_sw = 2
			end if
			
			UPDATE sysmsg SET del = "Y" WHERE tlogin = :gs_userid AND del = "N";
			COMMIT;
			
			if This.WindowState = Minimized! and li_cnt > 0 and cbx_3.checked = true then
				if messagebox("메시지","메시지가 " + string(li_cnt) + " 개 있습니다 ~r~n" + &
								  "메지시를 확인하시겠습니까", Exclamation!, OKCancel!, 2) = 1 THEN
					This.WindowState = Normal!
				else
					ii_sw = 0
				end if
			end if
		end if
		
		if ii_sw = 2 then
			hWnd = Handle (THIS)
			gu_ext_func.uf_Flash_Window (hWnd, true)
			ii_sw = 2
			Timer (0.25)
		end if
	else
		ii_sw = 0
		Timer (120)
		gu_ext_func.uf_Flash_Window (hWnd, TRUE)
	end if
end if

end event

event resize;//
dw_1.width  = this.width  - 102
dw_1.height = this.height - 348


end event

type cbx_all from checkbox within w_sysmsg_m
integer x = 3241
integer y = 136
integer width = 229
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
end type

event clicked;//
long   ll_row
string ls_chk

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = ls_chk
next

end event

type cbx_3 from checkbox within w_sysmsg_m
integer x = 3241
integer y = 60
integer width = 238
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "알림"
end type

event clicked;string  ls_chk

if cbx_3.checked = true then
	SetProfileString("YCSC.INI", "MessageBox", "Check", "Y")
else
	SetProfileString("YCSC.INI", "MessageBox", "Check", "N")
end if

end event

type cb_insertall from commandbutton within w_sysmsg_m
integer x = 640
integer y = 72
integer width = 375
integer height = 100
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체추가"
end type

event clicked;//
datawindowchild ldwc_login
long ll_row, ll_cnt

if ii_type = 2 then
	dw_1.getchild("tlogin", ldwc_login)
	ldwc_login.settransobject(sqlca)

	ii_sw = 0
	ldwc_login.retrieve()
	for ll_row = 1 to ldwc_login.rowcount()
		ll_cnt = dw_1.insertrow(0)
		dw_1.object.flogin[ll_cnt] = gs_userid
		dw_1.object.tlogin[ll_cnt] = ldwc_login.getitemstring(ll_row,'user_id')
		dw_1.object.del[ll_cnt] = "N"
	next
else
	dw_1.retrieve( gs_userid )
end if

end event

type ddplb_1 from dropdownpicturelistbox within w_sysmsg_m
integer x = 59
integer y = 76
integer width = 544
integer height = 320
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"받은 메시지","보낸 메시지"}
integer itempictureindex[] = {1,2}
string picturename[] = {"EnglishEdit!","RunWindow!","Custom021!"}
long picturemaskcolor = 553648127
end type

event selectionchanged;//
string ls_sql, ls_where

choose case index
	case 1 // 받은 메시지
		dw_1.dataobject = 'd_sysmsg_m'		
		cb_insertall.text = "운영자"
		ii_type = 1
		
		ii_sw = 0

		cb_insert.enabled = true	// 추가
		cb_send2.enabled  = false	// 보내기2
		cb_delete.enabled = true	// 삭제
		cb_send.enabled   = true	// 보내기
		cb_cancel.enabled = true   // 취소
		
	case 2 // 보낸 메시지
		dw_1.update()
		commit;
		
      dw_1.dataobject   = 'd_sysmsg2_m'	
		cb_insertall.text = "전체추가"
		ii_type = 2
		
		ii_sw   = 0
		cb_insert.enabled = true	// 추가
		cb_send2.enabled  = false	// 보내기2
		cb_delete.enabled = true	// 삭제
		cb_send.enabled   = true	// 보내기
		cb_cancel.enabled = true	// 취소
end choose			

dw_1.settransobject(sqlca)
dw_1.retrieve( gs_userid )

end event

type cb_cancel from commandbutton within w_sysmsg_m
integer x = 2007
integer y = 72
integer width = 238
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;//
dw_1.reset()
dw_1.retrieve( gs_userid )

end event

type cb_send from commandbutton within w_sysmsg_m
integer x = 1755
integer y = 72
integer width = 238
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "보내기"
end type

event clicked;//
dw_1.accepttext()
ii_sw = 0

if dw_1.update() = 1 then
	commit;
	
	cbx_all.checked = false
	MessageBox("확인", "메시지 보내기 성공!")
else
	rollback;
	MessageBox("오류", "메시지 내역을 확인하십시요. 보내기 실패!")
	return
end if

ii_sw   = 1
ii_type = 1
dw_1.dataobject      = 'd_sysmsg_m'
ddplb_1.text         = "받은 메시지"

cb_insertall.enabled = false	// 전체추가
cb_insert.enabled    = false	// 추가
cb_send2.enabled     = true	// 보내기2
cb_delete.enabled    = true	// 삭제
cb_send.enabled      = false	// 보내기
cb_cancel.enabled    = false  // 취소

dw_1.settransobject(sqlca)
dw_1.retrieve(gs_userid)

end event

type cb_exit from commandbutton within w_sysmsg_m
integer x = 2258
integer y = 72
integer width = 238
integer height = 100
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "종료"
end type

event clicked;//
closewithreturn(parent, istr_select)
close(parent)

end event

type dw_1 from datawindow within w_sysmsg_m
string tag = "d_sysmsg_m"
integer x = 37
integer y = 220
integer width = 3483
integer height = 992
integer taborder = 80
string title = "d_sysmsg2_m"
string dataobject = "d_sysmsg_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemerror;return 1
end event

event dberror;return 2
end event

type cb_delete from commandbutton within w_sysmsg_m
integer x = 1513
integer y = 72
integer width = 238
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;//
long ll_row

dw_1.accepttext()
if dw_1.getrow() < 1 then return

if cbx_all.checked = true then
	for ll_row = dw_1.rowcount() to 1 step - 1
		if dw_1.object.chk[ll_row] = "Y" then
			dw_1.scrolltorow( ll_row )
			dw_1.deleterow( ll_row )
		end if
	next

	cbx_all.checked = false
else
	dw_1.deleterow( dw_1.getrow() )
end if

dw_1.accepttext()
if dw_1.update() = 1 then
	COMMIT;
else
	ROLLBACK;
end if

ii_sw = 0

end event

type cb_send2 from commandbutton within w_sysmsg_m
integer x = 1271
integer y = 72
integer width = 238
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "보내기"
end type

event clicked;//
long   ll_row
string ls_touser

ddplb_1.text = "보낸 메시지"

dw_1.accepttext()

ll_row = dw_1.getrow()

update sysmsg set del = "Y" where tlogin = :gs_userid and del = "N";
commit;

if ll_row > 0 then
	ls_touser = dw_1.object.flogin[ll_row]
end if

dw_1.dataobject = 'd_sysmsg2_m'
ii_type = 2
ii_sw   = 0

cb_insert.enabled = true	// 추가
cb_send2.enabled  = false	// 보내기2
cb_delete.enabled = true	// 삭제
cb_send.enabled   = true	// 보내기
cb_cancel.enabled = true   // 취소

if gs_userid = "1999010s" then
  cb_insertall.enabled = true
else
  cb_insertall.enabled = false
end if

dw_1.settransobject(sqlca)
dw_1.retrieve(gs_userid)

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.object.flogin[ll_row] = gs_userid
dw_1.object.tlogin[ll_row] = ls_touser
dw_1.setcolumn('del')
dw_1.setfocus()

end event

type cb_insert from commandbutton within w_sysmsg_m
integer x = 1024
integer y = 72
integer width = 238
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;long ll_row

dw_1.accepttext()

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)

dw_1.object.flogin[ll_row] = gs_userid
dw_1.setcolumn('del')
dw_1.setfocus()

ii_sw = 0

end event

type gb_1 from groupbox within w_sysmsg_m
integer x = 37
integer y = 16
integer width = 3483
integer height = 192
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

