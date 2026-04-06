$PBExportHeader$w_mpsfcdayuser_m.srw
$PBExportComments$작업라인 작업자 추가(2003/07/05, 이인호)
forward 
global type w_mpsfcdayuser_m from window
end type
type cbx_1 from checkbox within w_mpsfcdayuser_m
end type
type cb_4 from commandbutton within w_mpsfcdayuser_m
end type
type cb_2 from commandbutton within w_mpsfcdayuser_m
end type
type st_dept from statictext within w_mpsfcdayuser_m
end type
type cb_1 from commandbutton within w_mpsfcdayuser_m
end type
type dw_1 from datawindow within w_mpsfcdayuser_m
end type
end forward

global type w_mpsfcdayuser_m from window
integer width = 2491
integer height = 2004
boolean titlebar = true
string title = "작업자추가(w_mpsfcdayuser_m)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_1 cbx_1
cb_4 cb_4
cb_2 cb_2
st_dept st_dept
cb_1 cb_1
dw_1 dw_1
end type
global w_mpsfcdayuser_m w_mpsfcdayuser_m

type variables
gs_where2 istr_where2

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

on w_mpsfcdayuser_m.create
this.cbx_1=create cbx_1
this.cb_4=create cb_4
this.cb_2=create cb_2
this.st_dept=create st_dept
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cbx_1,&
this.cb_4,&
this.cb_2,&
this.st_dept,&
this.cb_1,&
this.dw_1}
end on

on w_mpsfcdayuser_m.destroy
destroy(this.cbx_1)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.st_dept)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//ldt_date          = date(dw_2.object.work_date[1])	// 작업일자
//ls_where2.str1[1] = ls_wcno									// 작업장
//ls_where2.str2[1] = string(ldt_date, 'yyyy/mm/dd')	// 작업일자(문자)
//ls_where2.name[1] = ls_wcnm									// 작업장명

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string   ls_area, ls_wcno
date     ld_sfcdate

dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = gl_resolution

istr_where2  = Message.PowerObjectParm

ls_wcno      = istr_where2.str1[1]
st_dept.text = istr_where2.name[1]
ld_sfcdate   = date(istr_where2.str2[1])

SELECT area_no INTO :ls_area FROM wc WHERE work_no = :ls_wcno;
if isnull(ls_area) OR ls_area = "" then ls_area = "S0001"

dw_1.retrieve( ls_area, ls_wcno, ld_sfcdate )

end event

event closequery;IF NOT ISNULL(istr_where2.chk) THEN
	RETURN 0
ELSE
	RETURN 1
END IF
end event

type cbx_1 from checkbox within w_mpsfcdayuser_m
integer x = 46
integer y = 1776
integer width = 1083
integer height = 88
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "휴먼엑스포"
long textcolor = 128
long backcolor = 67108864
string text = "근태신청서 자동확정"
boolean checked = true
end type

type cb_4 from commandbutton within w_mpsfcdayuser_m
integer x = 1239
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
string text = "작업자 삭제"
end type

event clicked;// 작업자 삭제
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
WF_UPDATE1( dw_1, "N" )


end event

type cb_2 from commandbutton within w_mpsfcdayuser_m
integer x = 46
integer y = 232
integer width = 1189
integer height = 120
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업자 추가"
end type

event clicked;// 작업자 추가
gs_where2 lstr_where2
string    ls_area, ls_wcno, ls_userid, ls_sdate, ls_edate, ls_workname, ls_null
long      ll_row, ll_cnt
date      ld_sfcdate

setnull( ls_null )

lstr_where2.str1[1] = istr_where2.str1[1]			// 작업장 gs_workname
lstr_where2.str1[1] = st_dept.text					// 작업장: ERP작업장과 인사팀명 다름 
lstr_where2.str2[1] = istr_where2.str2[1]			// 작업일자(문자)
OpenWithParm( w_whuser_w, lstr_where2 )
lstr_where2 = Message.PowerObjectParm
if lstr_where2.chk <> "Y" then RETURN

ls_wcno     = istr_where2.str1[1]
ld_sfcdate  = date(istr_where2.str2[1])
ls_workname = st_dept.text

SELECT area_no INTO :ls_area FROM wc WHERE work_name = :ls_workname;
if isnull(ls_area) OR ls_area = "" then ls_area = "S0001"


for ll_row = 1 to UpperBound(lstr_where2.str1)						
	ll_cnt = dw_1.insertrow(0)

	ls_userid = lstr_where2.str1[ll_row]

	dw_1.object.area_no[ll_row]  = ls_area
	dw_1.object.wc_no[ll_row]    = ls_wcno
	dw_1.object.sfc_date[ll_row] = ld_sfcdate
	dw_1.object.user_id[ll_row]  = ls_userid
next

////////////////////////////////////////////////////
WF_UPDATE1( dw_1, "N" )
////////////////////////////////////////////////////
dw_1.retrieve( ls_area, ls_wcno, ld_sfcdate )

end event

type st_dept from statictext within w_mpsfcdayuser_m
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
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_mpsfcdayuser_m
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
boolean default = true
end type

event clicked;istr_where2.chk = "N"	
CloseWithReturn( Parent, istr_where2 )

end event

type dw_1 from datawindow within w_mpsfcdayuser_m
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
integer x = 46
integer y = 360
integer width = 2382
integer height = 1376
integer taborder = 10
string title = "none"
string dataobject = "d_mpsfcdayuser_m1"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

