$PBExportHeader$w_sfcdayuser_m.srw
$PBExportComments$작업자 조회
forward
global type w_sfcdayuser_m from window
end type
type cbx_1 from checkbox within w_sfcdayuser_m
end type
type cb_f12 from commandbutton within w_sfcdayuser_m
end type
type cb_f02 from commandbutton within w_sfcdayuser_m
end type
type st_dept from statictext within w_sfcdayuser_m
end type
type cb_1 from commandbutton within w_sfcdayuser_m
end type
type dw_1 from datawindow within w_sfcdayuser_m
end type
end forward

global type w_sfcdayuser_m from window
integer width = 2491
integer height = 2004
boolean titlebar = true
string title = "작업자관리(w_sfcdayuser_m)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "OleGenReg!"
boolean center = true
cbx_1 cbx_1
cb_f12 cb_f12
cb_f02 cb_f02
st_dept st_dept
cb_1 cb_1
dw_1 dw_1
end type
global w_sfcdayuser_m w_sfcdayuser_m

type variables
gs_where2 istr_where2

end variables

forward prototypes
public subroutine wf_f2 ()
public subroutine wf_f12 ()
end prototypes

public subroutine wf_f2 ();/*
ldt_date      = dw_r.object.date[1]					// 작업일자
lst_code.str1 = ls_wcno									// 작업장
lst_code.str2 = string(ldt_date, 'yyyy/mm/dd')	// 작업일자(문자)
lst_code.name = dw_r.object.wc_nm[1]				// 작업장명
*/


//
gs_where2 lstr_where2
string    ls_wcno, ls_userid, ls_sdate, ls_edate, ls_null
long      ll_row, ll_cnt
date      ld_sfcdate

setnull( ls_null )

lstr_where2.str1[1] = istr_where2.str1[1]			// 작업장 gs_workname
lstr_where2.str1[1] = gs_workname					// 작업장: ERP작업장과 인사팀명 다름 
lstr_where2.str2[1] = istr_where2.str2[1]			// 작업일자(문자)
OpenWithParm( w_user, lstr_where2 )
lstr_where2 = Message.PowerObjectParm
if lstr_where2.chk <> "Y" then RETURN

ls_wcno    = istr_where2.str1[1]
ld_sfcdate = date(istr_where2.str2[1])

for ll_row = 1 to UpperBound(lstr_where2.str1)						
	ll_cnt = dw_1.insertrow(0)

	ls_userid = lstr_where2.str1[ll_row]

	dw_1.object.area_no[ll_cnt]  = gs_area
	dw_1.object.wc_no[ll_cnt]    = ls_wcno
	dw_1.object.sfc_date[ll_cnt] = ld_sfcdate	
	dw_1.object.user_id[ll_cnt]  = ls_userid
next

///////////////////////////////////////////////////
GF_UPDATE1(dw_1, "N")
///////////////////////////////////////////////////

ls_wcno     = istr_where2.str1[1]
ld_sfcdate  = date(istr_where2.str2[1])
dw_1.retrieve( gs_area, ls_wcno, ld_sfcdate )

end subroutine

public subroutine wf_f12 ();// F12: 한줄삭제
dwItemStatus l_status
long     ll_row
string   ls_area, ls_wcno, ls_teamcd, ls_teamnm, ls_userid, ls_namekor, ls_null, ls_errtext
datetime ldt_workday

setnull( ls_null )
ll_row = dw_1.getrow()

if isnull(ll_row) OR ll_row < 1 then RETURN

// 근태신청서 자동취소
ls_area     = dw_1.object.area_no[ll_row]
ls_wcno     = dw_1.object.wc_no[ll_row]
ldt_workday = dw_1.object.sfc_date[ll_row]
ls_userid   = dw_1.object.user_id[ll_row]
ls_teamcd   = dw_1.object.team_code[ll_row]
ls_namekor  = dw_1.object.user_name[ll_row]

/////////////////////////////////////////////
// 지원자는 파견부서에서 확정함
/////////////////////////////////////////////
if ls_wcno <> ls_teamcd then
	ls_teamnm = st_dept.text
	SELECT DISTINCT team_cd INTO :ls_teamcd FROM v_insabase where team_nm = :ls_teamnm;
end if

UPDATE sfcworkman 
	SET confirm1 = :ls_null
 WHERE area_no  = :ls_area     AND work_no = :ls_teamcd 
	AND work_day = :ldt_workday AND user_id = :ls_userid;
if SQLCA.SQLCode = 0 then
	COMMIT;
else
	ls_errtext = SQLCA.SQLErrText
	ROLLBACK;
	MessageBox("확인",ls_namekor + " 근태신청서 확정취소 오류가 발생 하였습니다.~n~n" + ls_errtext )
	RETURN
end if
/////////////////////////////////////////////

dw_1.deleterow( ll_row )
GF_UPDATE1( dw_1, "N" )


end subroutine

on w_sfcdayuser_m.create
this.cbx_1=create cbx_1
this.cb_f12=create cb_f12
this.cb_f02=create cb_f02
this.st_dept=create st_dept
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cbx_1,&
this.cb_f12,&
this.cb_f02,&
this.st_dept,&
this.cb_1,&
this.dw_1}
end on

on w_sfcdayuser_m.destroy
destroy(this.cbx_1)
destroy(this.cb_f12)
destroy(this.cb_f02)
destroy(this.st_dept)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;/*
ldt_date      = dw_r.object.date[1]					// 작업일자
lst_code.str1 = ls_wcno									// 작업장
lst_code.str2 = string(ldt_date, 'yyyy/mm/dd')	// 작업일자(문자)
lst_code.name = dw_r.object.wc_nm[1]				// 작업장명
*/

// 작업자추가
string    ls_wcno
date      ld_sfcdate

dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution

istr_where2  = Message.PowerObjectParm
st_dept.text = istr_where2.name[1]					// 작업장명

ls_wcno      = istr_where2.str1[1]
ld_sfcdate   = date(istr_where2.str2[1])

// sfcdayuser : area_no, wc_no, sfc_date
dw_1.retrieve( gs_area, ls_wcno, ld_sfcdate )

end event

event closequery;//
if NOT ISNULL(istr_where2.chk) then
	RETURN 0
else
	RETURN 1
end if

end event

event key;//
choose case key
	case KeyF2!		// F02: 작업자 추가
		wf_F2()

	case KeyF12!	// F12: 한줄삭제
		wf_F12()

	case else
		return
end choose

end event

type cbx_1 from checkbox within w_sfcdayuser_m
integer x = 46
integer y = 1776
integer width = 1083
integer height = 88
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "휴먼엑스포"
long textcolor = 128
long backcolor = 67108864
string text = "근태신청서 자동확정"
boolean checked = true
end type

type cb_f12 from commandbutton within w_sfcdayuser_m
integer x = 1239
integer y = 232
integer width = 1189
integer height = 120
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F12: 한줄삭제"
boolean cancel = true
end type

event clicked;// F12: 한줄삭제
wf_F12()

end event

type cb_f02 from commandbutton within w_sfcdayuser_m
integer x = 46
integer y = 232
integer width = 1189
integer height = 120
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F2: 작업자 추가"
boolean cancel = true
end type

event clicked;// F02 : 작업자 추가
wf_F2()

end event

type st_dept from statictext within w_sfcdayuser_m
integer x = 46
integer y = 32
integer width = 2382
integer height = 176
integer textsize = -28
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8421376
string text = "작업자 관리"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_sfcdayuser_m
integer x = 1239
integer y = 1756
integer width = 1189
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean cancel = true
boolean default = true
end type

event clicked;//
long     ll_row, ll_cnt
string   ls_area, ls_wcno, ls_teamcd, ls_teamnm, ls_userid, ls_namekor, ls_errtext
datetime ldt_workday

if cbx_1.checked = true then
	for ll_row = 1 to dw_1.rowcount()
		ls_area     = dw_1.object.area_no[ll_row]
		ls_wcno     = dw_1.object.wc_no[ll_row]
		ldt_workday = dw_1.object.sfc_date[ll_row]
		ls_userid   = dw_1.object.user_id[ll_row]
		ls_teamcd   = dw_1.object.team_code[ll_row]
		ls_namekor  = dw_1.object.user_name[ll_row]
		
		/////////////////////////////////////////////
		// 지원자는 파견부서에서 확정함
		/////////////////////////////////////////////
		if ls_wcno <> ls_teamcd then
			ls_teamnm = st_dept.text
			SELECT DISTINCT team_cd INTO :ls_teamcd FROM v_insabase where team_nm = :ls_teamnm;
		end if
		/////////////////////////////////////////////
		
		if isnull(ls_userid) OR ls_userid = "" OR isnull(ls_teamcd) OR ls_teamcd = "" then
		else
			SELECT count(*) INTO :ll_cnt
			  FROM sfcworkman 
			 WHERE area_no  = :ls_area     AND work_no = :ls_teamcd 
				AND work_day = :ldt_workday AND user_id = :ls_userid;
			if ll_cnt = 1 then
				UPDATE sfcworkman 
					SET confirm1 = 'Y'
				 WHERE area_no  = :ls_area     AND work_no = :ls_teamcd 
					AND work_day = :ldt_workday AND user_id = :ls_userid;
				if SQLCA.SQLCode = 0 then
					COMMIT;
				else
					ls_errtext = SQLCA.SQLErrText
					ROLLBACK;
					MessageBox("확인",ls_namekor + " 근태신청서 확정오류가 발생 하였습니다.~n~n" + ls_errtext )
					RETURN
				end if
			else
				MessageBox("확인",ls_namekor + "|" + ls_teamcd + "|" + ls_userid + " 근태신청서 확정오류")
			end if
		end if
	next
end if

istr_where2.chk = "N"	
CloseWithReturn( Parent, istr_where2 )

end event

type dw_1 from datawindow within w_sfcdayuser_m
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
string tag = "d_sfcdayuser_m1"
integer x = 46
integer y = 360
integer width = 2382
integer height = 1376
integer taborder = 10
string title = "none"
string dataobject = "d_sfcdayuser_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;//
choose case key
	case KeyF2!
		wf_F2()		// F2: 작업자 추가
		
	case KeyF12!
		wf_F12()		// F12: 한줄삭제
		
	case else
		return
end choose

end event

