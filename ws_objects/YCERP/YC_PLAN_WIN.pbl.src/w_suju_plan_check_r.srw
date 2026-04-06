$PBExportHeader$w_suju_plan_check_r.srw
$PBExportComments$생산계획생성수주체크(2018/01/29,  조원석)
forward
global type w_suju_plan_check_r from window
end type
type st_6 from statictext within w_suju_plan_check_r
end type
type st_5 from statictext within w_suju_plan_check_r
end type
type st_4 from statictext within w_suju_plan_check_r
end type
type st_3 from statictext within w_suju_plan_check_r
end type
type st_2 from statictext within w_suju_plan_check_r
end type
type st_1 from statictext within w_suju_plan_check_r
end type
type pb_search from picturebutton within w_suju_plan_check_r
end type
type cb_7 from commandbutton within w_suju_plan_check_r
end type
type cb_6 from commandbutton within w_suju_plan_check_r
end type
type em_4 from editmask within w_suju_plan_check_r
end type
type st_8 from statictext within w_suju_plan_check_r
end type
type em_3 from editmask within w_suju_plan_check_r
end type
type dw_1 from datawindow within w_suju_plan_check_r
end type
type gb_1 from groupbox within w_suju_plan_check_r
end type
end forward

global type w_suju_plan_check_r from window
integer x = 1824
integer y = 124
integer width = 5051
integer height = 1960
boolean titlebar = true
string title = "수주번호생산계획생성체크(w_suju_plan_check_r)"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
pb_search pb_search
cb_7 cb_7
cb_6 cb_6
em_4 em_4
st_8 st_8
em_3 em_3
dw_1 dw_1
gb_1 gb_1
end type
global w_suju_plan_check_r w_suju_plan_check_r

type variables
gs_where istr_where
int ii_sw = 0
end variables

on w_suju_plan_check_r.create
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.pb_search=create pb_search
this.cb_7=create cb_7
this.cb_6=create cb_6
this.em_4=create em_4
this.st_8=create st_8
this.em_3=create em_3
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.pb_search,&
this.cb_7,&
this.cb_6,&
this.em_4,&
this.st_8,&
this.em_3,&
this.dw_1,&
this.gb_1}
end on

on w_suju_plan_check_r.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_search)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.em_4)
destroy(this.st_8)
destroy(this.em_3)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;string ls_orderno
long ll_height
long ll_width

dw_1.SetTransObject(SQLCA)


//환경변수를 읽어옴 
environment env
integer resp
resp = getenvironment(env)

//해상도를 구함
ll_height = env.screenheight
ll_width = env.screenwidth

//픽셀을 UNIT로
ll_height = PixelsToUnits(ll_height, YPixelsToUnits!)
ll_width = PixelsToUnits(ll_width, XPixelsToUnits!)

//로긴윈도우 위치 확정
if this.height < ll_height then
this.y = (ll_height - this.height ) / 2
else
this.y = 0
end if
if this.width < ll_width then
this.x = (ll_width - this.width ) / 2
else
this.x = 0
end if

end event

type st_6 from statictext within w_suju_plan_check_r
integer x = 3259
integer y = 172
integer width = 1783
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "기생성체크: N일경우,생산계획조정 기생성 점검"
boolean focusrectangle = false
end type

type st_5 from statictext within w_suju_plan_check_r
integer x = 3259
integer y = 96
integer width = 1774
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "출고체크  : N일경우,주문량대출고량 점검"
boolean focusrectangle = false
end type

type st_4 from statictext within w_suju_plan_check_r
integer x = 3259
integer y = 24
integer width = 1774
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "구매품체크: N일경우,제품그룹관리에서구매품여부 점검"
boolean focusrectangle = false
end type

type st_3 from statictext within w_suju_plan_check_r
integer x = 1248
integer y = 172
integer width = 1815
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "제품여부체크:N일경우,제품그룹관리에서 제품여부 점검"
boolean focusrectangle = false
end type

type st_2 from statictext within w_suju_plan_check_r
integer x = 1248
integer y = 96
integer width = 1851
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "비 용 체 크 :N일경우,제품그룹관리에서 비용항목 점검"
boolean focusrectangle = false
end type

type st_1 from statictext within w_suju_plan_check_r
integer x = 1248
integer y = 24
integer width = 1778
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "생산계획체크:N일경우,판매수주관리 생산계획부분 점검"
boolean focusrectangle = false
end type

type pb_search from picturebutton within w_suju_plan_check_r
event mousemove pbm_mousemove
string tag = "조회"
integer x = 823
integer y = 72
integer width = 151
integer height = 116
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event mousemove;//int li_x,li_y
//
//li_x = this.x 
//li_y = this.y + 156
//
//f_usetips(st_tips,"조회",parent, li_x, li_y)
//
end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_orderno, ls_custno
long   ll_row

ls_orderno = trim(em_3.text) + "-" + RightA ( "000" + trim(em_4.text), 3)
if isnull(ls_orderno) OR ls_orderno = "" then RETURN


//		 생산일자 조회 2018.1.27 조원석 로직 추가 	
if	dw_1.retrieve( ls_orderno ) > 0 then
//	dw_6.width = 6162
//	dw_6.height = 1056
//	dw_6.x = 1179
//	dw_6.y = 648
//	dw_6.visible = true
else
	MessageBox("확인", "해당하는 생산일자가 존재하지 않습니다.", Exclamation!)
end if		


end event

type cb_7 from commandbutton within w_suju_plan_check_r
integer x = 745
integer y = 132
integer width = 82
integer height = 48
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▼"
end type

event clicked;em_4.text = string(integer(em_4.text) - 1)
if em_4.text < '1' then 
	em_4.text = '1'
	return
end if

pb_search.postevent(clicked!)
end event

type cb_6 from commandbutton within w_suju_plan_check_r
integer x = 745
integer y = 84
integer width = 82
integer height = 48
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▲"
end type

event clicked;em_4.text = string(integer(em_4.text) + 1)
pb_search.postevent(clicked!)
end event

type em_4 from editmask within w_suju_plan_check_r
integer x = 594
integer y = 84
integer width = 151
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
string minmax = "1~~999"
end type

event getfocus;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */
//pb_cancel.default = true
this.SelectText(1, 3)


end event

event losefocus;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */

// 수주장 2번 저장의 경우 발생함
// pb_cancel.default = true

end event

event modified;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */

//pb_cancel.default = true
end event

type st_8 from statictext within w_suju_plan_check_r
integer x = 553
integer y = 100
integer width = 46
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "-"
boolean focusrectangle = false
end type

type em_3 from editmask within w_suju_plan_check_r
event keydown pbm_dwnkey
integer x = 174
integer y = 84
integer width = 379
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
boolean autoskip = true
end type

event keydown;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */

//IF keydown(KeyEnter! ) THEN
//	IF keyflags = 0 THEN
//		pb_cancel.postevent(clicked!)
//	END IF
//END IF
end event

event modified;/* 2017.11.6 조원석 */
/* 엔터키 클릭시 조회 기능 삭제 */
/* defalut는 기본적으로 엔터클릭시 click 이벤트 발생 */
//pb_cancel.default = true

end event

type dw_1 from datawindow within w_suju_plan_check_r
event uemousemove pbm_mousemove
integer y = 252
integer width = 4969
integer height = 1596
integer taborder = 70
string dataobject = "d_mpautosale0_check1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event uemousemove;//int li_x,li_y
//string ls_tipstring
//statictext st_tips
//
//
//
//if ( xpos >= 2606 and xpos <= 3017 )  and ( ypos >= 0 and ypos <= 68) then
//
//	ls_tipstring = '수주마감테스체크'
//	if st_tips.text = ls_tipstring then RETURN
//	
//	
//	st_tips.text = ls_tipstring	
//	
//	if st_tips.tag = "" then
//		st_tips.alignment   = center!
//		st_tips.backcolor   = RGB(178, 161, 199)
//		st_tips.textcolor   = RGB(0, 0, 255)
//		st_tips.border      = true
//		st_tips.borderstyle = stylebox!
//		st_tips.textsize    = -9
//		st_tips.fontcharset = hangeul!
//		st_tips.fontfamily  = modern!
//		st_tips.facename    = "굴림체"
//		st_tips.fontpitch   = fixed!
//		st_tips.fillpattern = solid!
//		st_tips.italic      = false
//		st_tips.underline   = false
//		st_tips.tag         = "Fixed"
//	end if
//	st_tips.resize( len(st_tips.text) * 30 + 30, 60 )
//	
//	x = parent.pointerx()
//	y = parent.pointery() + 30
//	if x + st_tips.width  > parent.workspacewidth()  then x -= st_tips.width
//	if y + st_tips.height > parent.workspaceheight() then y -= st_tips.height + 80
//	
//	st_tips.move(li_x, li_y)
//	st_tips.show()
//	
//end if
//
//
//
//
//



end event

event clicked;//string ls_tipstring
//int li_x,li_y
//statictext  st_tips
//
choose case dwo.name 
case 'order_qty_t' 
//	li_x = xpos 
//	li_y = ypos + 156
////	f_usetips(st_tips,"수주마감 체크",dw_6, li_x, li_y)
//
//
//	ls_tipstring = '수주마감체크'
//	if st_tips.text = ls_tipstring then RETURN
//	
//	//
//	st_tips.text = ls_tipstring
//	
//	if st_tips.tag = "" then
//		st_tips.alignment   = center!
//		st_tips.backcolor   = RGB(178, 161, 199)
//		st_tips.textcolor   = RGB(0, 0, 255)
//		st_tips.border      = true
//		st_tips.borderstyle = stylebox!
//		st_tips.textsize    = -9
//		st_tips.fontcharset = hangeul!
//		st_tips.fontfamily  = modern!
//		st_tips.facename    = "굴림체"
//		st_tips.fontpitch   = fixed!
//		st_tips.fillpattern = solid!
//		st_tips.italic      = false
//		st_tips.underline   = false
//		st_tips.tag         = "Fixed"
//	end if
//	st_tips.resize( len(st_tips.text) * 30 + 30, 60 )
//	
//	//x = aw_window.pointerx()
//	//y = aw_window.pointery() + 30
////	if x + ast_tips.width  > aw_window.workspacewidth()  then x -= ast_tips.width
////	if y + ast_tips.height > aw_window.workspaceheight() then y -= ast_tips.height + 80
//	
//	st_tips.move(li_x, li_y)
//	st_tips.show()


end choose		


end event

type gb_1 from groupbox within w_suju_plan_check_r
integer x = 50
integer y = 20
integer width = 1056
integer height = 200
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수주번호"
end type

