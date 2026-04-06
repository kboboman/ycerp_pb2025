$PBExportHeader$w_magam_m.srw
forward
global type w_magam_m from window
end type
type em_1 from editmask within w_magam_m
end type
type st_1 from statictext within w_magam_m
end type
type ddlb_1 from dropdownlistbox within w_magam_m
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
end forward

global type w_magam_m from window
integer width = 3355
integer height = 2184
boolean titlebar = true
string title = "월마감(w_magam_m)"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 79741120
boolean center = true
em_1 em_1
st_1 st_1
ddlb_1 ddlb_1
pb_save pb_save
st_title st_title
pb_close pb_close
pb_retrieve pb_retrieve
gb_1 gb_1
gb_2 gb_2
dw_1 dw_1
end type
global w_magam_m w_magam_m

type variables


end variables

on w_magam_m.create
this.em_1=create em_1
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.pb_save=create pb_save
this.st_title=create st_title
this.pb_close=create pb_close
this.pb_retrieve=create pb_retrieve
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_1=create dw_1
this.Control[]={this.em_1,&
this.st_1,&
this.ddlb_1,&
this.pb_save,&
this.st_title,&
this.pb_close,&
this.pb_retrieve,&
this.gb_1,&
this.gb_2,&
this.dw_1}
end on

on w_magam_m.destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.pb_save)
destroy(this.st_title)
destroy(this.pb_close)
destroy(this.pb_retrieve)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_1.text = string(today(), 'yyyy')
em_1.text = string(today(),'yyyy/mm')

dw_1.SetTransObject(SQLCA)

if gf_permission("시스템_자동마감(월)", gs_userid) = "Y" then
	pb_save.visible = true
else
	pb_save.visible = false
end if

//// area 추가 2003/02/26
//dw_area.settransobject(sqlca)
//dw_area.insertrow(0)  
//dw_area.object.area[1] = gs_area
//// area 추가 2003/02/26
//00 : 수불 = inaudit 의 트리거에서 마감 처리
//01 : 수주
//02 : 매입 = apoi, apoiinv 의 트리거에서 마감 처리
//03 : 매출 = aroi, aroiinv 의 트리거에서 마감 처리


end event

type em_1 from editmask within w_magam_m
integer x = 1093
integer y = 72
integer width = 357
integer height = 92
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
string mask = "yyyy/mm"
end type

type st_1 from statictext within w_magam_m
integer x = 1527
integer y = 96
integer width = 366
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "마감년도 :"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_magam_m
integer x = 1925
integer y = 88
integer width = 343
integer height = 804
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.reset()
end event

type pb_save from picturebutton within w_magam_m
event mousemove pbm_mousemove
integer x = 2875
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

event clicked;

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
integer x = 3067
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
integer x = 2679
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
dw_1.retrieve(ls_year + '%')

if dw_1.rowcount() < 48 then
	for li_cnt = 1 to 12
		ls_mon = string(li_cnt, "00")
      // 수불만 처리하기위해 루프를 돌리지 않음	
      /* 00: 수불, 01: 수주, 02: 매입, 03: 매출 */
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
	
	dw_1.retrieve(ls_year + '%')
end if


end event

type gb_1 from groupbox within w_magam_m
integer x = 2651
integer y = 4
integer width = 640
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

type gb_2 from groupbox within w_magam_m
integer x = 1472
integer y = 44
integer width = 832
integer height = 144

integer taborder = 10
integer textsize = -10
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
integer x = 18
integer y = 236
integer width = 3273
integer height = 1824
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

long ll_row

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
				End If
		End If
End Choose
end event

