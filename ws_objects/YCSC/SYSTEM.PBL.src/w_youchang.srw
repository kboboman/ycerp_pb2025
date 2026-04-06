$PBExportHeader$w_youchang.srw
$PBExportComments$유창메인화면(작성일:98/01/18, 작성자:곽용덕)
forward
global type w_youchang from window
end type
type st_sys from statictext within w_youchang
end type
type st_3 from statictext within w_youchang
end type
type st_5 from statictext within w_youchang
end type
type st_13 from statictext within w_youchang
end type
type mle_1 from multilineedit within w_youchang
end type
type st_in from statictext within w_youchang
end type
type st_mps from statictext within w_youchang
end type
type st_sale from statictext within w_youchang
end type
type st_gl from statictext within w_youchang
end type
type st_per from statictext within w_youchang
end type
type st_pr from statictext within w_youchang
end type
type st_wk from statictext within w_youchang
end type
type st_2 from statictext within w_youchang
end type
type st_6 from statictext within w_youchang
end type
type st_7 from statictext within w_youchang
end type
type st_9 from statictext within w_youchang
end type
type st_16 from statictext within w_youchang
end type
type st_17 from statictext within w_youchang
end type
type st_cost from statictext within w_youchang
end type
type st_14 from statictext within w_youchang
end type
type p_4 from picture within w_youchang
end type
type st_8 from statictext within w_youchang
end type
type st_bd from statictext within w_youchang
end type
type st_4 from statictext within w_youchang
end type
type st_co from statictext within w_youchang
end type
type st_tips from statictext within w_youchang
end type
type pb_exit from picturebutton within w_youchang
end type
type pb_1 from picturebutton within w_youchang
end type
type st_11 from statictext within w_youchang
end type
type st_12 from statictext within w_youchang
end type
type cb_1 from commandbutton within w_youchang
end type
type st_1 from statictext within w_youchang
end type
type st_10 from statictext within w_youchang
end type
end forward

global type w_youchang from window
integer x = 5
integer y = 4
integer width = 3657
integer height = 2284
boolean titlebar = true
string title = "YC ERP SYSTEM"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
event ue_1 pbm_custom01
st_sys st_sys
st_3 st_3
st_5 st_5
st_13 st_13
mle_1 mle_1
st_in st_in
st_mps st_mps
st_sale st_sale
st_gl st_gl
st_per st_per
st_pr st_pr
st_wk st_wk
st_2 st_2
st_6 st_6
st_7 st_7
st_9 st_9
st_16 st_16
st_17 st_17
st_cost st_cost
st_14 st_14
p_4 p_4
st_8 st_8
st_bd st_bd
st_4 st_4
st_co st_co
st_tips st_tips
pb_exit pb_exit
pb_1 pb_1
st_11 st_11
st_12 st_12
cb_1 cb_1
st_1 st_1
st_10 st_10
end type
global w_youchang w_youchang

type variables
int  il_sw
end variables

forward prototypes
public subroutine wf_clearselection ()
end prototypes

event ue_1;int li_cnt
		select count(*) into :li_cnt from sysmsg
		where tlogin = :gs_userid
		  and del = "N";
		if li_cnt > 0 then
			IF messagebox("메시지","확인 되지 않은 메시지가 " + string(li_cnt) + " 개 있읍니다 ~r~n" + &
										"메지시를 확인하시겠읍니까", Exclamation!, OKCancel!, 2) = 1 THEN
				gs_custper_str lstr_where
				lstr_where.str_ok = true
				openwithparm(w_sysmsg_m,lstr_where)
				w_sysmsg_m.WindowState = Normal!
			end if
		end if

end event

public subroutine wf_clearselection ();
st_sale.TextColor = RGB(0, 0, 0)	////판매관리
st_sale.Border = FALSE

//st_mps.TextColor = RGB(0, 0, 0)	////생산관리
//st_mps.Border = FALSE

//st_in.TextColor = RGB(0, 0, 0)	////자재관리
//st_in.Border = FALSE

//st_cost.TextColor = RGB(0, 0, 0)	////원가관리
//st_cost.Border = FALSE

st_sys.TextColor = RGB(0, 0, 0)	////시스템 관리
st_sys.Border = FALSE

//st_co.TextColor = RGB(0, 0, 0)	////공무관리
//st_co.Border = FALSE
//
//st_bd.TextColor = RGB(0, 0, 0)	////공사정보관리
//st_bd.Border = FALSE
//
//st_gl.TextColor = RGB(0, 0, 0)	////회계관리
//st_gl.Border = FALSE
//
//st_per.TextColor = RGB(0, 0, 0) ////인사관리
//st_per.Border = FALSE
//
//st_pr.TextColor = RGB(0, 0, 0)	////급여관리
//st_pr.Border = FALSE
//
//st_wk.TextColor = RGB(0, 0, 0)	////근태관리
//st_wk.Border = FALSE

end subroutine

on w_youchang.create
this.st_sys=create st_sys
this.st_3=create st_3
this.st_5=create st_5
this.st_13=create st_13
this.mle_1=create mle_1
this.st_in=create st_in
this.st_mps=create st_mps
this.st_sale=create st_sale
this.st_gl=create st_gl
this.st_per=create st_per
this.st_pr=create st_pr
this.st_wk=create st_wk
this.st_2=create st_2
this.st_6=create st_6
this.st_7=create st_7
this.st_9=create st_9
this.st_16=create st_16
this.st_17=create st_17
this.st_cost=create st_cost
this.st_14=create st_14
this.p_4=create p_4
this.st_8=create st_8
this.st_bd=create st_bd
this.st_4=create st_4
this.st_co=create st_co
this.st_tips=create st_tips
this.pb_exit=create pb_exit
this.pb_1=create pb_1
this.st_11=create st_11
this.st_12=create st_12
this.cb_1=create cb_1
this.st_1=create st_1
this.st_10=create st_10
this.Control[]={this.st_sys,&
this.st_3,&
this.st_5,&
this.st_13,&
this.mle_1,&
this.st_in,&
this.st_mps,&
this.st_sale,&
this.st_gl,&
this.st_per,&
this.st_pr,&
this.st_wk,&
this.st_2,&
this.st_6,&
this.st_7,&
this.st_9,&
this.st_16,&
this.st_17,&
this.st_cost,&
this.st_14,&
this.p_4,&
this.st_8,&
this.st_bd,&
this.st_4,&
this.st_co,&
this.st_tips,&
this.pb_exit,&
this.pb_1,&
this.st_11,&
this.st_12,&
this.cb_1,&
this.st_1,&
this.st_10}
end on

on w_youchang.destroy
destroy(this.st_sys)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.st_13)
destroy(this.mle_1)
destroy(this.st_in)
destroy(this.st_mps)
destroy(this.st_sale)
destroy(this.st_gl)
destroy(this.st_per)
destroy(this.st_pr)
destroy(this.st_wk)
destroy(this.st_2)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_9)
destroy(this.st_16)
destroy(this.st_17)
destroy(this.st_cost)
destroy(this.st_14)
destroy(this.p_4)
destroy(this.st_8)
destroy(this.st_bd)
destroy(this.st_4)
destroy(this.st_co)
destroy(this.st_tips)
destroy(this.pb_exit)
destroy(this.pb_1)
destroy(this.st_11)
destroy(this.st_12)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.st_10)
end on

event open;this.title = this.title +" "+ gs_ver
st_5.text = "송천 YC2000" &
				+ " " + upper(trim(ProfileString("PB.INI","Database","DataBase",         " ")) + "ERP SYSTEM")


gf_loghis("I", this.title)
close(w_login)  
open(w_load)

date ld_date
ld_date = today()
ld_date = RelativeDate(ld_date, -7)
delete from loginhis 
 where in_date < :ld_date;
commit;

//ld_date = RelativeDate(ld_date, -5)
//delete from sysmsg
// where msgdate < :ld_date;
commit;
 
gs_ds_itemall = CREATE datastore
gs_ds_itemall.DataObject = 'd_item_all'
gs_ds_itemall.SetTransObject(SQLCA)
gs_ds_itemall.reset()

if FileExists("c:\Program Files\ycsc_main\itemall.TXT") = true then
	if gs_ds_itemall.ImportFile("c:\Program Files\ycsc_main\itemall.TXT") = 0 then
		gf_item()
	end if
else
	gf_item()
end if

gs_ds_qaall = CREATE datastore
gs_ds_qaall.DataObject = 'd_qa_all'
gs_ds_qaall.SetTransObject(SQLCA)
gs_ds_qaall.reset()
if FileExists("c:\Program Files\ycsc_main\qaall.TXT") = true then
	if gs_ds_qaall.ImportFile("c:\Program Files\ycsc_main\qaall.TXT") = 0 then
		gf_qa()
	end if
else
	gf_qa()
end if
//거래처 검색프로그램 w_whcustret_w
//   2001 년 06월 26일 이대준
gs_ds_whcustret = CREATE datastore
gs_ds_whcustret.DataObject = 'd_whcustret_s'
gs_ds_whcustret.SetTransObject(SQLCA)
gs_ds_whcustret.reset()

if FileExists("c:\Program Files\ycsc_main\whcustret.TXT") = true then
	if gs_ds_whcustret.ImportFile("c:\Program Files\ycsc_main\whcustret.TXT") = 0 then
		gf_whcustret()
	end if
else
	gf_whcustret()
end if
//
commit;
close(w_load)
//Timer(120)
postevent('ue_1')

end event

event timer;int li_cnt
setnull(li_cnt)
select count(*) into :li_cnt from sysmsg
where tlogin = :gs_userid
  and del = "N";
if li_cnt > 0 then
	gs_custper_str lstr_where
	lstr_where.str_ok = true
	openwithparm(w_sysmsg_m,lstr_where)
end if

end event

event close;gf_loghis("O", "")

end event

type st_sys from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 229
integer y = 1604
integer width = 526
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "시스템관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event clicked;
gs_chkpass_str lstr_pass

openwithparm(w_chkpass,lstr_pass)
lstr_pass = message.powerobjectparm
if lstr_pass.chk = false then
	return
end if
open(w_s_main)  // 시스템관리 메인윈도우 오픈
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_sys.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_s_main )
//m_UtilMain.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text


end event

type st_3 from statictext within w_youchang
integer x = 2171
integer y = 1864
integer width = 1403
integer height = 104
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "문의처:전산실 내선(234,236,237,238)"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within w_youchang
integer x = 14
integer y = 1856
integer width = 2130
integer height = 128
integer textsize = -20
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8388608
boolean enabled = false
string text = "유창 YCERP SYSTEM"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_13 from statictext within w_youchang
integer x = 14
integer y = 1996
integer width = 3570
integer height = 152
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
string text = "추가기능 : 화면상단 오른쪽과 각모율의 상단메뉴의 ~"메시지보내기~" 에서 원하는 사용자에게 메시지보내기 기능이 추가되었습니다"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_youchang
integer x = 2181
integer y = 400
integer width = 1381
integer height = 1452
integer taborder = 20
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "즐거운 하루가 되시길 바라며        시스템사용에 대한 공지사항을 유의  하여 사용하시길 바랍니다                                            1. 자신의 로그인 번호가 없으신 분은    전산실로 연락하여 개인의 로그인     번호를 부여 받아 사용하여 주시길    바랍니다                                                         2. 로그인시에 비밀번호를 넣지 않고     사용하시는 분은 꼭 비밀번호를       변경하여 사용하시길 바랍니다       - 변경방법은 각모듈의 상단메뉴의      유틸리티의 ~"패스워드변경~"에서       바꾸어 사용하시길 바랍니다                                      3. 비밀번호는 다른 사람에게 유출       되지 않게 보완을 요구합니다                                      4. 비밀번호는 주기적으로 바꾸어        사용하시길 바랍니다                                             5. 기타 문의 사항은 전산실로          연락바랍니다"
boolean border = false
boolean displayonly = true
end type

type st_in from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 229
integer y = 504
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long textcolor = 10789024
long backcolor = 16777215
boolean enabled = false
string text = "자재관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if
//this.Border = TRUE
//
//p_in.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_i_main )
//m_InMenu.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_InMenu.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

event clicked;
open(w_i_main)  // 자재관리 메인윈도우 오픈
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_in.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_i_main )
//m_InMenu.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_InMenu.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_mps from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 229
integer y = 648
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long textcolor = 10789024
long backcolor = 16777215
boolean enabled = false
string text = "생산관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event clicked;open(w_m_main)  // 생산관리 메인윈도우 오픈
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_Mps.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_m_main )
//m_MpsMenu.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_sale from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 1330
integer y = 504
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "판매관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event clicked; open(w_o_main)  // 판매관리 메인윈도우 오픈
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_op.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_o_main )
//m_opMenu.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_gl from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 233
integer y = 1008
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 16777215
boolean enabled = false
string text = "회계관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event doubleclicked;//IF gb_IsConnected = FALSE THEN
//	Messagebox("오류...", "DataBase와 연결되지 않았습니다.~n다시 로그온 하십시오,")
//	RETURN
//END IF
//
//Open( w_glframe )
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_gl.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_GlMdi )
//m_GlMdi.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_GlMdi.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_per from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 1330
integer y = 1032
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 16777215
boolean enabled = false
string text = "인사관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event doubleclicked;//IF gb_IsConnected = FALSE THEN
//	Messagebox("오류...", "DataBase와 연결되지 않았습니다.~n다시 로그온 하십시오,")
//	RETURN
//END IF
//
//Open( w_PerFrame )
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_per.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_permdi )
//m_permdi.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_permdi.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_pr from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 1330
integer y = 1160
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 16777215
boolean enabled = false
string text = "급여관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event doubleclicked;//IF gb_IsConnected = FALSE THEN
//	Messagebox("오류...", "DataBase와 연결되지 않았습니다.~n다시 로그온 하십시오,")
//	RETURN
//END IF
//
//Open( w_PayFrame )
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_pay.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_paymdi )
//m_paymdi.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_paymdi.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_wk from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 1330
integer y = 1288
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 16777215
boolean enabled = false
string text = "근태관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event doubleclicked;//IF gb_IsConnected = FALSE THEN
//	Messagebox("오류...", "DataBase와 연결되지 않았습니다.~n다시 로그온 하십시오,")
//	RETURN
//END IF
//
//Open( w_WkFrame )
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_wk.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_wk )
//m_wk.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_wk.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_2 from statictext within w_youchang
integer x = 2167
integer y = 232
integer width = 1403
integer height = 160
integer textsize = -26
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8388608
boolean enabled = false
string text = "공지사항"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_6 from statictext within w_youchang
integer x = 178
integer y = 376
integer width = 763
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8388608
long backcolor = 33554431
boolean enabled = false
string text = "제 조  모 듈"
boolean focusrectangle = false
end type

type st_7 from statictext within w_youchang
integer x = 1275
integer y = 376
integer width = 741
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8388608
long backcolor = 33554431
boolean enabled = false
string text = "물 류  모 듈"
boolean focusrectangle = false
end type

type st_9 from statictext within w_youchang
integer x = 1275
integer y = 896
integer width = 763
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8421504
long backcolor = 33554431
boolean enabled = false
string text = "총 무  모 듈"
boolean focusrectangle = false
end type

type st_16 from statictext within w_youchang
integer x = 178
integer y = 896
integer width = 741
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8388608
long backcolor = 33554431
boolean enabled = false
string text = "관 리  모 듈"
boolean focusrectangle = false
end type

type st_17 from statictext within w_youchang
integer x = 178
integer y = 1468
integer width = 741
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8388608
long backcolor = 33554431
boolean enabled = false
string text = "관리자  모듈"
boolean focusrectangle = false
end type

type st_cost from statictext within w_youchang
event mousemove pbm_mousemove
boolean visible = false
integer x = 229
integer y = 1640
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "원가관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event doubleclicked;open(w_ca_main)  // 생산관리 메인윈도우 오픈
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_Mps.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_m_main )
//m_MpsMenu.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_14 from statictext within w_youchang
boolean visible = false
integer x = 178
integer y = 1512
integer width = 763
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8388608
long backcolor = 33554431
boolean enabled = false
string text = "원 가  모 듈"
boolean focusrectangle = false
end type

type p_4 from picture within w_youchang
integer x = 27
integer y = 36
integer width = 2121
integer height = 156
boolean enabled = false
string picturename = "c:\bmp\유창마크(black_shadow).bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_youchang
boolean visible = false
integer x = 178
integer y = 1036
integer width = 763
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8421504
long backcolor = 33554431
boolean enabled = false
string text = "공 사  모 듈"
boolean focusrectangle = false
end type

type st_bd from statictext within w_youchang
event mousemove pbm_mousemove
boolean visible = false
integer x = 229
integer y = 1316
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 16777215
boolean enabled = false
string text = "공사정보"
boolean focusrectangle = false
end type

event mousemove;//if il_sw = 0 then
//	TextColor = RGB(0,0,255)
//	this.Border = TRUE
//	this.BorderStyle = StyleRaised!
//	il_sw = 1
//end if
//
end event

event doubleclicked;//open(w_b_main)  // 공사정보관리 메인윈도우 오픈
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_Mps.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_m_main )
//m_MpsMenu.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_4 from statictext within w_youchang
integer x = 2158
integer y = 40
integer width = 1070
integer height = 152
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_co from statictext within w_youchang
event mousemove pbm_mousemove
boolean visible = false
integer x = 229
integer y = 1172
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 16777215
string text = "공무관리"
boolean focusrectangle = false
end type

event mousemove;//if il_sw = 0 then
//	TextColor = RGB(0,0,255)
//	this.Border = TRUE
//	this.BorderStyle = StyleRaised!
//	il_sw = 1
//end if
//
end event

type st_tips from statictext within w_youchang
boolean visible = false
integer x = 974
integer y = 52
integer width = 215
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type pb_exit from picturebutton within w_youchang
event clicked pbm_bnclicked
event mousemove pbm_mousemove
integer x = 3397
integer y = 48
integer width = 146
integer height = 136
integer taborder = 20
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\mrpexit.bmp"
alignment htextalign = left!
end type

event clicked;Close( Parent )
HALT CLOSE
end event

event mousemove;INT li_x, li_y

li_x = THIS.x + 156
li_y = THIS.y + 156
f_usetips(st_tips, '종료', parent, li_x, li_y)
end event

type pb_1 from picturebutton within w_youchang
event clicked pbm_bnclicked
event mousemove pbm_mousemove
integer x = 3246
integer y = 48
integer width = 146
integer height = 136
integer taborder = 30
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\log.bmp"
alignment htextalign = left!
end type

event clicked;
Open( w_login )
end event

event mousemove;INT li_x, li_y

li_x = THIS.x + 156
li_y = THIS.y + 156
f_usetips(st_tips, 'Logon', parent, li_x, li_y)
end event

type st_11 from statictext within w_youchang
integer x = 3232
integer y = 40
integer width = 320
integer height = 152
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_12 from statictext within w_youchang
integer x = 14
integer y = 24
integer width = 3570
integer height = 184
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_youchang
integer x = 2171
integer y = 52
integer width = 1042
integer height = 132
integer taborder = 10
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "Help!"
string text = "Message Box"
end type

event clicked;gs_custper_str lstr_where
lstr_where.str_where = "S"
openwithparm(w_sysmsg_m,lstr_where)
w_sysmsg_m.WindowState = Normal!

end event

type st_1 from statictext within w_youchang
integer x = 2153
integer y = 220
integer width = 1431
integer height = 1764
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_10 from statictext within w_youchang
event mousemove pbm_mousemove
integer x = 14
integer y = 220
integer width = 2135
integer height = 1628
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event mousemove;if il_sw = 1 then
	wf_ClearSelection()
	il_sw = 0
end if

end event

