$PBExportHeader$w_ocp_abancon_m.srw
$PBExportComments$제품폐기결재(2003/05/30이규배)
forward
global type w_ocp_abancon_m from window
end type
type dw_4 from datawindow within w_ocp_abancon_m
end type
type dw_3 from datawindow within w_ocp_abancon_m
end type
type dw_2 from datawindow within w_ocp_abancon_m
end type
type pb_print from picturebutton within w_ocp_abancon_m
end type
type rb_4 from radiobutton within w_ocp_abancon_m
end type
type rb_3 from radiobutton within w_ocp_abancon_m
end type
type dw_1 from datawindow within w_ocp_abancon_m
end type
type pb_save from picturebutton within w_ocp_abancon_m
end type
type st_title from statictext within w_ocp_abancon_m
end type
type pb_close from picturebutton within w_ocp_abancon_m
end type
type pb_retrieve from picturebutton within w_ocp_abancon_m
end type
type gb_1 from groupbox within w_ocp_abancon_m
end type
end forward

global type w_ocp_abancon_m from window
integer width = 3666
integer height = 2164
boolean titlebar = true
string title = "제품폐기 결재관리[w_ocp_abancon_m]"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowstate windowstate = maximized!
long backcolor = 79741120
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
pb_print pb_print
rb_4 rb_4
rb_3 rb_3
dw_1 dw_1
pb_save pb_save
st_title st_title
pb_close pb_close
pb_retrieve pb_retrieve
gb_1 gb_1
end type
global w_ocp_abancon_m w_ocp_abancon_m

type variables
string is_aban_no, is_con ="O",  is_err
end variables

forward prototypes
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
end prototypes

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

on w_ocp_abancon_m.create
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.pb_print=create pb_print
this.rb_4=create rb_4
this.rb_3=create rb_3
this.dw_1=create dw_1
this.pb_save=create pb_save
this.st_title=create st_title
this.pb_close=create pb_close
this.pb_retrieve=create pb_retrieve
this.gb_1=create gb_1
this.Control[]={this.dw_4,&
this.dw_3,&
this.dw_2,&
this.pb_print,&
this.rb_4,&
this.rb_3,&
this.dw_1,&
this.pb_save,&
this.st_title,&
this.pb_close,&
this.pb_retrieve,&
this.gb_1}
end on

on w_ocp_abancon_m.destroy
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.pb_print)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.dw_1)
destroy(this.pb_save)
destroy(this.st_title)
destroy(this.pb_close)
destroy(this.pb_retrieve)
destroy(this.gb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.SetTransObject(SQLCA)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_1.visible = false
pb_retrieve.TriggerEvent(clicked!)

end event

type dw_4 from datawindow within w_ocp_abancon_m
integer x = 50
integer y = 264
integer width = 1728
integer height = 648
integer taborder = 20
string title = "none"
string dataobject = "d_ocp_abancon_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = this.Getrow()

if ll_row < 1 then return

is_aban_no = this.object.aban_no[ll_row]

dw_2.setfilter("aban_no = '" + is_aban_no + "'")
dw_2.filter()
dw_3.retrieve( is_aban_no )

end event

event itemerror;string  ls_ori_process_flag

CHOOSE CASE dwo.name
	CASE 'process_flag'
			if is_err = '1' then
					dw_4.object.process_flag[row] = 'Y'
					dw_4.object.approve_top[row] = gs_userid
			else
				dw_4.object.approve_top[row] = this.getitemstring(row, 'approve_top',  Primary!, TRUE)
				dw_4.object.process_flag[row] = this.getitemstring(row, 'process_flag',  Primary!, TRUE)
			END if
					
	CASE 'chk_team'
				dw_4.object.chk_team[row] = this.getitemstring(row, 'chk_team',  Primary!, TRUE)
				dw_4.object.approve_team[row] = this.getitemstring(row, 'approve_team',  Primary!, TRUE)
	CASE else
END CHOOSE
this.setredraw(true)
return 2


end event

event retrieveend;if this.getrow() <= 0 then
	dw_2.reset()
	dw_3.reset()
else
	is_aban_no = this.object.aban_no[this.getrow()]
end if
end event

event itemchanged;long ll_row
string ls_null, ls_data, ls_data2

setnull(ls_null)
this.accepttext()
this.setredraw(false)
ll_row = this.getrow()
is_err = '0'
CHOOSE CASE dwo.name
	CASE 'process_flag'
		ls_data = this.getitemstring(ll_row, 'process_flag',  Primary!, TRUE)
		CHOOSE CASE data
			CASE "Y"
				dw_4.object.approve_top[ll_row] = gs_userid
			CASE "O"
				//안승환상무 : 19000011
				//김영호이사 : 19921209 인수인계 심상철부장(ssch3015)
				//or gs_userid = 'yijong' and gs_userid <> 'cwj'
				//and  gs_userid <> '19921209'
				if ( gs_userid <> '1999010s' and gs_userid <> 'ssch3015'  ) and (ls_data = 'Y' ) then
					messagebox("확인","판매 본부장님께서만 변경하실수있습니다..")
					return 1
				end if
				dw_4.object.approve_top[ll_row] = ls_null
		END CHOOSE
	CASE 'chk_team'
		CHOOSE CASE data
			CASE "Y"
				dw_4.object.approve_team[ll_row] = gs_userid
			CASE "N"
				ls_data = this.getitemstring(ll_row, 'chk_team',  Primary!, TRUE)
				ls_data2 = this.getitemstring(ll_row, 'approve_team',  Primary!, TRUE)
				if gs_userid <> ls_data2 and ls_data = 'Y' then
					messagebox("확인","결재하신분이 아니므로 바꿀수가 없습니다.")
					return 1
				end if
				dw_4.object.approve_team[ll_row] = ls_null
		END CHOOSE
END CHOOSE
this.setredraw(true)


end event

type dw_3 from datawindow within w_ocp_abancon_m
integer x = 50
integer y = 928
integer width = 3552
integer height = 1112
integer taborder = 30
string title = "none"
string dataobject = "d_ocp_abancon_s2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_ocp_abancon_m
integer x = 1792
integer y = 264
integer width = 1810
integer height = 648
integer taborder = 20
string title = "none"
string dataobject = "d_ocp_abancon_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_print from picturebutton within w_ocp_abancon_m
integer x = 2999
integer y = 52
integer width = 187
integer height = 144
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
 
if dw_2.getrow() < 1 then
	return
end if
dw_1.Retrieve(is_aban_no)
l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 폐기물품을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type rb_4 from radiobutton within w_ocp_abancon_m
integer x = 2327
integer y = 96
integer width = 329
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "결재취소"
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "Y"
// process_flag = 'O':작성, 'Y':결재, 'C':마감 

end event

type rb_3 from radiobutton within w_ocp_abancon_m
integer x = 2007
integer y = 96
integer width = 302
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미결재"
boolean checked = true
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "O"
// process_flag = 'O':작성, 'Y':결재, 'C':마감 

end event

type dw_1 from datawindow within w_ocp_abancon_m
event ue_key pbm_dwnkey
event ue_enter pbm_dwnprocessenter
integer x = 1257
integer y = 16
integer width = 91
integer height = 76
integer taborder = 20
string title = "none"
string dataobject = "d_ocp_aban_r2"
end type

type pb_save from picturebutton within w_ocp_abancon_m
event mousemove pbm_mousemove
integer x = 3191
integer y = 52
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "저장"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if wf_update1( dw_4,'Y') = true then
	pb_retrieve.triggerevent(clicked!)
end if

end event

type st_title from statictext within w_ocp_abancon_m
integer x = 64
integer y = 36
integer width = 1312
integer height = 140
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "제품폐기 결재관리"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type pb_close from picturebutton within w_ocp_abancon_m
event mousemove pbm_mousemove
integer x = 3383
integer y = 52
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "종료"
end type

event clicked;Close(Parent)

end event

type pb_retrieve from picturebutton within w_ocp_abancon_m
event mousemove pbm_mousemove
integer x = 2807
integer y = 52
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "조회"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_4.retrieve(gs_area,is_con) < 1 then
	messagebox("확인","결재하실 내역이 없습니다.")
else
	dw_2.retrieve(gs_area, is_con)
	dw_4.setfocus()
end if

end event

type gb_1 from groupbox within w_ocp_abancon_m
integer x = 1952
integer y = 4
integer width = 1646
integer height = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

