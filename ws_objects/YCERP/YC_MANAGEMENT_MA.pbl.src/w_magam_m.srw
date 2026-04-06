$PBExportHeader$w_magam_m.srw
forward
global type w_magam_m from window
end type
type st_2 from statictext within w_magam_m
end type
type em_1 from editmask within w_magam_m
end type
type st_1 from statictext within w_magam_m
end type
type pb_save from picturebutton within w_magam_m
end type
type st_title from statictext within w_magam_m
end type
type pb_close from picturebutton within w_magam_m
end type
type pb_retrieve from picturebutton within w_magam_m
end type
type gb_1 from groupbox within w_magam_m
end type
type gb_2 from groupbox within w_magam_m
end type
type dw_1 from datawindow within w_magam_m
end type
type gb_3 from groupbox within w_magam_m
end type
end forward

global type w_magam_m from window
integer width = 3383
integer height = 2212
boolean titlebar = true
string title = "월마감(w_magam_m)"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 79741120
boolean center = true
st_2 st_2
em_1 em_1
st_1 st_1
pb_save pb_save
st_title st_title
pb_close pb_close
pb_retrieve pb_retrieve
gb_1 gb_1
gb_2 gb_2
dw_1 dw_1
gb_3 gb_3
end type
global w_magam_m w_magam_m

type variables


end variables

on w_magam_m.create
this.st_2=create st_2
this.em_1=create em_1
this.st_1=create st_1
this.pb_save=create pb_save
this.st_title=create st_title
this.pb_close=create pb_close
this.pb_retrieve=create pb_retrieve
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_1=create dw_1
this.gb_3=create gb_3
this.Control[]={this.st_2,&
this.em_1,&
this.st_1,&
this.pb_save,&
this.st_title,&
this.pb_close,&
this.pb_retrieve,&
this.gb_1,&
this.gb_2,&
this.dw_1,&
this.gb_3}
end on

on w_magam_m.destroy
destroy(this.st_2)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.pb_save)
destroy(this.st_title)
destroy(this.pb_close)
destroy(this.pb_retrieve)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_1)
destroy(this.gb_3)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(),'yyyy')

dw_1.SetTransObject(SQLCA)

if gf_permission("시스템_자동마감(월)", gs_userid) = "Y" then
	pb_save.visible = true
else
	pb_save.visible = false
end if

//00 : 수불 = inaudit 의 트리거에서 마감 처리
//01 : 수주
//02 : 매입 = apoi, apoiinv 의 트리거에서 마감 처리
//03 : 매출 = aroi, aroiinv 의 트리거에서 마감 처리

pb_retrieve.PostEvent( clicked! )

end event

event resize;//
gb_3.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

end event

type st_2 from statictext within w_magam_m
integer x = 87
integer y = 316
integer width = 3122
integer height = 56
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "00: 수불, 01: 수주, 02: 매입, 03: 매출"
boolean focusrectangle = false
end type

type em_1 from editmask within w_magam_m
integer x = 2359
integer y = 88
integer width = 238
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
end type

type st_1 from statictext within w_magam_m
integer x = 2025
integer y = 104
integer width = 329
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "마감년도:"
boolean focusrectangle = false
end type

type pb_save from picturebutton within w_magam_m
event mousemove pbm_mousemove
integer x = 2894
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

event clicked;//
dw_1.accepttext()

if dw_1.Update() = 1 then
	Messagebox('확인','저장되었습니다.')
	Commit Using sqlca;
else
	MessageBox('확인', '저장되지 않았습니다.', StopSign!)
	RollBack Using sqlca;
end if
dw_1.SetFocus()

end event

type st_title from statictext within w_magam_m
integer x = 27
integer y = 36
integer width = 997
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
string text = "월마감"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type pb_close from picturebutton within w_magam_m
event mousemove pbm_mousemove
integer x = 3086
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

type pb_retrieve from picturebutton within w_magam_m
event mousemove pbm_mousemove
integer x = 2697
integer y = 52
integer width = 187
integer height = 144
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "조회"
end type

event clicked;int      li_cnt,  ll_row
string   ls_year, ls_mon, ls_gb, ls_today, ls_chk
datetime ldt_today

// SYSTEM DATE
SELECT GetDate() INTO :ldt_today FROM code1;
ls_today = String(ldt_today, 'yyyymmdd')

ls_year = LeftA(em_1.text,4)
dw_1.retrieve(ls_year + '%', '00')

if dw_1.rowcount() < 48 then
	for li_cnt = 1 to 12
      // 수불만 처리하기위해 루프를 돌리지 않음	
      /* 00: 수불, 01: 수주, 02: 매입, 03: 매출 */

		ls_mon = string(li_cnt, "00")
		for ll_row = 1 to 1
			ls_gb = String(ll_row -1, '00')
			
			SELECT SYS_GB INTO :ls_chk 
			  FROM MMAGAM
			 WHERE YYYYMM       = :ls_year + :ls_mon
			   AND SYS_GB       = :ls_gb
			   AND magam_yn     = 'Y';
		   if ls_chk = "" or isnull(ls_chk) then				
				INSERT INTO mmagam ( yyyymm, sys_gb, magam_yn, reg_nm, reg_dt )  
				VALUES ( :ls_year + :ls_mon, :ls_gb, 'N', :gs_userid, :ls_today );
			end if
		next
	next
	commit;
	
	dw_1.retrieve(ls_year + '%', '00')
end if


end event

type gb_1 from groupbox within w_magam_m
integer x = 2670
integer y = 4
integer width = 640
integer height = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_magam_m
integer x = 1966
integer y = 4
integer width = 681
integer height = 220
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_1 from datawindow within w_magam_m
event ue_key pbm_dwnkey
event ue_enter pbm_dwnprocessenter
integer x = 32
integer y = 436
integer width = 3273
integer height = 1636
integer taborder = 20
string title = "none"
string dataobject = "d_magam"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;This.SelectRow(0, False)
This.SelectRow(currentrow, True)

end event

event clicked;if row < 1 then return
this.scrolltorow(row)

long   ll_row
string ls_msg

st_magam lst_magam

ll_row = This.getrow()
Choose Case dwo.name
	Case 'magam_yn'
		If This.object.magam_yn[ll_row] = 'Y' Then				
				lst_magam.s_yyyy   = LeftA(string(dw_1.object.yyyymm[row]),4)
				lst_magam.s_mm     = RightA(string(dw_1.object.yyyymm[row]),2)
				lst_magam.s_userid = gs_userid
				lst_magam.s_kubun  = dw_1.object.sys_gb[row]
				
				OpenWithParm(w_magam_his, lst_magam)
				If Message.StringParm = 'N' Then
					Return 1
				else
					This.object.magam_yn[ll_row] = "N"
					pb_save.triggerevent( clicked! )
				End If
		End If
End Choose

end event

type gb_3 from groupbox within w_magam_m
integer x = 32
integer y = 240
integer width = 3273
integer height = 184
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

