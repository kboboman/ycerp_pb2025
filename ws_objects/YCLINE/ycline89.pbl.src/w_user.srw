$PBExportHeader$w_user.srw
$PBExportComments$사용자
forward
global type w_user from window
end type
type cb_3 from commandbutton within w_user
end type
type cbx_3 from checkbox within w_user
end type
type cbx_2 from checkbox within w_user
end type
type cbx_1 from checkbox within w_user
end type
type st_2 from statictext within w_user
end type
type st_1 from statictext within w_user
end type
type cb_2 from commandbutton within w_user
end type
type cb_1 from commandbutton within w_user
end type
type dw_1 from datawindow within w_user
end type
type ln_1 from line within w_user
end type
end forward

global type w_user from window
integer x = 1938
integer y = 700
integer width = 3781
integer height = 2016
boolean titlebar = true
string title = "작업자선택(w_user)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "OleGenReg!"
boolean center = true
cb_3 cb_3
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
st_2 st_2
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
ln_1 ln_1
end type
global w_user w_user

type variables
//
gs_where2 istr_where2

end variables

forward prototypes
public subroutine wf_spacebar ()
end prototypes

public subroutine wf_spacebar ();// 작업자선택
long   ll_dw1row, ll_cnt, ll_selcnt, ll_prtmax
string ls_userid, ls_namekor

if dw_1.rowcount() < 1 then RETURN

ll_dw1row = dw_1.getrow()	
if isnull(ll_dw1row) OR ll_dw1row < 1 then RETURN

ls_userid  = dw_1.object.user_id[ll_dw1row]
ls_namekor = dw_1.object.name_kor[ll_dw1row]

if isnull(ls_userid) OR ls_userid = "" then
	MessageBox("확인",ls_namekor + " 작업자는 KeyID가 공난이므로 선택할 수 없습니다.")
	RETURN
end if

dw_1.SelectRow(ll_dw1row, NOT dw_1.IsSelected(ll_dw1row))

 
end subroutine

on w_user.create
this.cb_3=create cb_3
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_2=create st_2
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.ln_1=create ln_1
this.Control[]={this.cb_3,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.st_2,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.ln_1}
end on

on w_user.destroy
destroy(this.cb_3)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.ln_1)
end on

event open;/*
lstr_where.str1[1] = istr_where.str1				// 작업장
lstr_where.str2[1] = istr_where.str2				// 작업일자(문자)
*/

//
string ls_com, ls_wcno, ls_sdate, ls_edate, ls_userid, ls_insateam
long   ll_row, ll_find
date   ld_sfcdate

choose case gs_area
	case "T0001"
		ls_com = "06"
	case else
		ls_com = "01"
end choose
	
istr_where2 = Message.PowerObjectParm
ls_wcno     = istr_where2.str1[1]
ld_sfcdate  = date(istr_where2.str2[1])
ls_sdate    = istr_where2.str2[1]
ls_edate    = istr_where2.str2[1]

if cbx_1.checked = true then
	dw_1.dataobject = "d_mpworkman_m"
else
	dw_1.dataobject = "d_user_secom"
end if

// 시간변경
dw_1.object.work_stime.TabSequence  = 0
dw_1.object.work_etime.TabSequence  = 0
dw_1.object.user_id.TabSequence     = 0

dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution

///////////////////////////////////////////////////////////////
// 작업장에 부여된 근태부서로 인사팀명을 검색함
///////////////////////////////////////////////////////////////
SELECT insa_team        INTO :ls_insateam FROM wc         WHERE work_name = :gs_workname;
SELECT DISTINCT team_nm INTO :ls_insateam FROM v_insabase WHERE team_cd   = :ls_insateam;

if isnull(ls_insateam) OR ls_insateam = "" then
	MessageBox("확인", "작업장의 근태부서로 근태부서원을 찾을 수 없습니다.")
else
	ls_wcno = ls_insateam
end if
///////////////////////////////////////////////////////////////

if	dw_1.dataobject = "d_user_secom" then
	dw_1.retrieve( ls_com )
else
	dw_1.retrieve( gs_area, ls_wcno, ls_sdate, ls_edate )
end if

// 기존작업자 표시하기
if w_sfcdayuser_m.dw_1.rowcount() > 0 then
	for ll_row = 1 to w_sfcdayuser_m.dw_1.rowcount()
		ls_userid = w_sfcdayuser_m.dw_1.object.user_id[ll_row]
		ll_find   = dw_1.find( "user_id = '" + ls_userid + "'", 1, dw_1.rowcount() )
		if ll_find > 0 then
			dw_1.object.chk[ll_find] = "Y"
		else
			dw_1.object.chk[ll_find] = "N"
		end if
	next
end if

end event

event closequery;//
if Not isnull(istr_where2.chk) then
	RETURN 0
else
	RETURN 1
end if
end event

type cb_3 from commandbutton within w_user
integer x = 946
integer y = 1756
integer width = 919
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택삭제[DEL]"
boolean cancel = true
end type

event clicked;// 선택삭제
string   ls_area, ls_workno, ls_userid, ls_namekor, ls_confirm1, ls_errtext
datetime ldt_workday, ldt_stime, ldt_etime
long     ll_row, ll_cnt
boolean  lb_chk

for ll_row = dw_1.rowcount() to 1 step -1
	if dw_1.IsSelected(ll_row) = true then
		ls_area     = dw_1.object.area_no[ll_row]
		ls_workno   = dw_1.object.work_no[ll_row]
		ldt_workday = dw_1.object.work_day[ll_row]
		ls_userid   = dw_1.object.user_id[ll_row]
		
		ldt_stime   = dw_1.object.work_stime[ll_row]
		ldt_etime   = dw_1.object.work_etime[ll_row]
		ls_namekor  = dw_1.object.name_kor[ll_row]

		SELECT confirm1 INTO :ls_confirm1 
		  FROM sfcworkman 
		 WHERE area_no = :ls_area   AND work_no = :ls_workno    AND work_day = :ldt_workday 
		   AND user_id = :ls_userid AND work_stime = :ldt_stime AND work_etime = :ldt_etime;
		if ls_confirm1 = "Y" then
			// 1차확정
			ll_cnt = ll_cnt + 1
		else	
			// sfcdayuser
			DELETE sfcdayuser 
			 WHERE area_no = :ls_area AND wc_no = :ls_workno AND sfc_date = :ldt_workday AND user_id = :ls_userid;
			if SQLCA.SQLCode = 0 then
				COMMIT;
				
				dw_1.deleterow( ll_row )
			else
				ls_errtext = SQLCA.SQLErrText
				ROLLBACK;
				MessageBox("확인",ls_namekor + " 작업자[sfcdayuser] 삭제오류가 발생 하였습니다.~n~n" + ls_errtext )
				RETURN
			end if
		end if
	end if
next

GF_UPDATE1( dw_1, "Y" )
if ll_cnt > 0 then
	MessageBox("확인",string(ll_cnt) + " 건의 데이터가 확정되어 처리할 수 없습니다.")
end if


end event

type cbx_3 from checkbox within w_user
integer x = 2011
integer y = 252
integer width = 1198
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "시간(시작,종료), KeyID 수정"
end type

event clicked;// 시간변경
long  ll_row

if this.checked = true then
	dw_1.object.work_stime.TabSequence  = 10
	dw_1.object.work_etime.TabSequence  = 20
	dw_1.object.user_id.TabSequence     = 30
else
	dw_1.object.work_stime.TabSequence  = 0
	dw_1.object.work_etime.TabSequence  = 0
	dw_1.object.user_id.TabSequence     = 0
end if

end event

type cbx_2 from checkbox within w_user
integer x = 46
integer y = 1756
integer width = 576
integer height = 128
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;// 전체선택
string  ls_userid, ls_namekor
long    ll_row
boolean lb_chk

for ll_row = 1 to dw_1.rowcount()
	ls_userid  = dw_1.object.user_id[ll_row]
	ls_namekor = dw_1.object.name_kor[ll_row]

	if this.checked = true then
		// 선택
		if isnull(ls_userid) OR ls_userid = "" then
			MessageBox("확인",ls_namekor + " 작업자는 KeyID가 공난이므로 선택할 수 없습니다.")
		else
			dw_1.SelectRow(ll_row, true )
		end if
	else
		// 해지
		dw_1.SelectRow(ll_row, false )
	end if
next
 
end event

type cbx_1 from checkbox within w_user
integer x = 3232
integer y = 252
integer width = 485
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "근무신청서"
boolean checked = true
end type

event clicked;//
string ls_com, ls_wcno, ls_sdate, ls_edate
date   ld_sfcdate

choose case gs_area
	case "T0001"
		ls_com = "06"
	case else
		ls_com = "01"
end choose
	
if this.checked = true then
	dw_1.dataobject = "d_user_secom"
else
	dw_1.dataobject = "d_user"
end if

dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution

ls_wcno     = istr_where2.str1[1]
ld_sfcdate  = date(istr_where2.str2[1])
ls_sdate    = istr_where2.str2[1]
ls_edate    = istr_where2.str2[1]

if	dw_1.dataobject = "d_user_secom" then
	dw_1.retrieve( ls_com )
else
	dw_1.retrieve( gs_area, "8", ls_sdate, ls_edate )
end if

dw_1.setfocus()

end event

type st_2 from statictext within w_user
integer x = 46
integer y = 252
integer width = 1216
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "선택: SPACE BAR, 더블클릭 이용"
boolean focusrectangle = false
end type

type st_1 from statictext within w_user
integer x = 46
integer y = 32
integer width = 3671
integer height = 176
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421376
string text = "작업자 선택"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_user
integer x = 2802
integer y = 1756
integer width = 919
integer height = 128
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소[ESC]"
boolean cancel = true
end type

event clicked;// 취소[ESC]
istr_where2.chk = "N"
closewithreturn(parent, istr_where2)

end event

type cb_1 from commandbutton within w_user
integer x = 1874
integer y = 1756
integer width = 919
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인[ENT]"
boolean default = true
end type

event clicked;// 확인[ENT]
dwItemStatus l_status1, l_status2, l_status3
boolean  lb_Modify, lb_ModifyID
datetime ldt_workday, ldt_stime, ldt_etime
string   ls_area, ls_teamcd, ls_namekor, ls_userid, ls_errtext
long     ll_row, ll_cnt

dw_1.accepttext()

ll_row = dw_1.rowcount()
if isnull( ll_row ) OR ll_row < 1 then RETURN

// 근무시간변경
lb_Modify = false
for ll_row = 1 to dw_1.rowcount()	
	l_status1 = dw_1.GetItemStatus(ll_row, "work_stime", primary!)
	l_status2 = dw_1.GetItemStatus(ll_row, "work_etime", primary!)
	if l_status1 = NotModified! AND l_status2 = NotModified!	then
	else
		lb_Modify = true
		exit
	end if
next
if	lb_Modify = true then
	if MessageBox("확인","근무시간을 변경 하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
		GF_UPDATE1( dw_1, "Y" )
	end if
end if

// KeyID 변경
lb_ModifyID = false
for ll_row = 1 to dw_1.rowcount()	
	l_status3 = dw_1.GetItemStatus(ll_row, "user_id",    primary!)
	if l_status3 = NotModified! then
	else
		lb_ModifyID = true
		exit
	end if
next
if	lb_ModifyID = true then
	if lb_Modify = false then
		GF_UPDATE1( dw_1, "N" )
	end if
end if

// 작업자 다중처리건
for ll_row = 1 to dw_1.rowcount()
	if dw_1.IsSelected(ll_row) = true then
		if dw_1.object.chk[ll_row] = "Y" then
			// 등록된 작업자는 SKIP
		else
			ll_cnt = ll_cnt + 1
			
			istr_where2.str1[ll_cnt] = dw_1.object.user_id[ll_row]		// 성명		
		end if
	end if
next

if ll_cnt > 0 then
	istr_where2.chk = "Y"
else
	istr_where2.chk = "N"
end if
CloseWithReturn(Parent, istr_where2)

end event

type dw_1 from datawindow within w_user
event use_key pbm_dwnkey
string tag = "d_mpworkman_m"
integer x = 46
integer y = 360
integer width = 3671
integer height = 1376
integer taborder = 10
string title = "d_user_secom"
string dataobject = "d_mpworkman_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event use_key;/////////////////////////////////////////////////////////////////////////////////////////
// ReturnType(long) use_key
// argument Type keycode,      key
//               unsignedlong, keyflags
// EventID : pbm_dwnkey
/////////////////////////////////////////////////////////////////////////////////////////

long ll_row

ll_row = this.getrow()
choose case key
	case KeySpaceBar!				// 작업자선택
		//wf_spacebar()
		dw_1.SelectRow(ll_row, NOT dw_1.IsSelected(ll_row))		
		
	case KeyEscape!				// ESC: 선택해지
		dw_1.SelectRow(0, FALSE)
end choose

end event

event getfocus;//

end event

event itemfocuschanged;//
choose case dwo.name
	case "work_stime", "work_etime"
		this.SelectText(1, LenA(GetText()))		// 전체선택
end choose

end event

event clicked;//
long ll_row

if isnull(row) OR row < 1 then RETURN

dw_1.scrolltorow( row )
dw_1.SelectRow( row, false )		

end event

event doubleclicked;//
long ll_row

if isnull(row) OR row < 1 then RETURN

dw_1.scrolltorow( row )
dw_1.SelectRow( row, true )		

end event

type ln_1 from line within w_user
long linecolor = 128
integer linethickness = 10
integer beginx = 46
integer beginy = 336
integer endx = 3721
integer endy = 336
end type

