$PBExportHeader$w_edit_popup.srw
$PBExportComments$w_ifdbinfo_m의 하위 edit pop
forward
global type w_edit_popup from window
end type
type pb_close from picturebutton within w_edit_popup
end type
type pb_save from picturebutton within w_edit_popup
end type
type dw_1 from datawindow within w_edit_popup
end type
type gb_1 from groupbox within w_edit_popup
end type
end forward

global type w_edit_popup from window
integer x = 283
integer y = 364
integer width = 2665
integer height = 1076
boolean titlebar = true
string title = "w_bid_editing"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
pb_close pb_close
pb_save pb_save
dw_1 dw_1
gb_1 gb_1
end type
global w_edit_popup w_edit_popup

type variables
st_bdinfo ist_bdinfo
end variables

on w_edit_popup.create
this.pb_close=create pb_close
this.pb_save=create pb_save
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_close,&
this.pb_save,&
this.dw_1,&
this.gb_1}
end on

on w_edit_popup.destroy
destroy(this.pb_close)
destroy(this.pb_save)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;string ls_build_no, ls_gubun //1:견적, 2:입찰
dec ld_seq
//st_bdinfo ist_bdinfo
int li_chk

ist_bdinfo = message.powerobjectparm

dw_1.settransobject(sqlca)
ls_build_no = ist_bdinfo.build_no
ld_seq = ist_bdinfo.seq
ls_gubun = ist_bdinfo.gubun
ist_bdinfo.cancel_flag = 'N' //flag initialize

li_chk = dw_1.retrieve(ls_build_no,ld_seq)
dw_1.object.bdinfodet_sitedate[1] = today()
dw_1.object.bdinfodet_biddate[1] = today()
if li_chk = 1 then 
	if ls_gubun = '1' then
		dw_1.object.bdinfodet_etmt_chk[1] = '1' //견적
	elseif ls_gubun = '2' then
	dw_1.object.bdinfodet_bid_chk[1] = '1' //입찰
   end if
end if
dw_1.setcolumn('bdinfodet_conkind')
dw_1.setfocus()
end event

type pb_close from picturebutton within w_edit_popup
integer x = 2432
integer y = 8
integer width = 187
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event clicked;ist_bdinfo.cancel_flag = 'Y'
closewithreturn(parent, ist_bdinfo)
end event

type pb_save from picturebutton within w_edit_popup
integer x = 2217
integer y = 8
integer width = 187
integer height = 144
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row, ll_cnt
dwItemStatus l_status

dw_1.accepttext()

ll_row = dw_1.GetRow()
if ll_row < 1 then return

//if rb_1.checked = true then
//	dw_2.object.bdinfodet_etmt_chk[ll_row] = '1'
//elseif rb_2.checked = true then
//	dw_2.object.bdinfodet_bid_chk[ll_row] = '1'
//end if

ll_cnt = dw_1.ModifiedCount( ) + dw_1.DeletedCount( )

//ll_cnt2 = wf_modifycount(dw_2) 
if ll_cnt > 0  then	
	if dw_1.update() = 1 then
		commit;
		MessageBox("확인", "저장되었습니다.")
		closewithreturn(parent, ist_bdinfo)
	else
		rollback;
		MessageBox("오류", "저장 실패!")
		ist_bdinfo.cancel_flag = 'Y'
      closewithreturn(parent, ist_bdinfo)
	end if
end if

end event

type dw_1 from datawindow within w_edit_popup
integer x = 101
integer y = 224
integer width = 2459
integer height = 676
integer taborder = 20
string dataobject = "dw_bidretrieve"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_edit_popup
integer x = 32
integer y = 152
integer width = 2592
integer height = 788
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

