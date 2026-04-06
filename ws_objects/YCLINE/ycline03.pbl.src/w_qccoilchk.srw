$PBExportHeader$w_qccoilchk.srw
$PBExportComments$스리팅기 점검
forward
global type w_qccoilchk from window
end type
type st_1 from statictext within w_qccoilchk
end type
type st_lastday from statictext within w_qccoilchk
end type
type cb_f09 from commandbutton within w_qccoilchk
end type
type cb_f08 from commandbutton within w_qccoilchk
end type
type dw_2 from datawindow within w_qccoilchk
end type
type st_13 from statictext within w_qccoilchk
end type
type dw_1 from datawindow within w_qccoilchk
end type
end forward

global type w_qccoilchk from window
integer width = 2921
integer height = 2264
boolean titlebar = true
string title = "w_qccoilchk"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
st_lastday st_lastday
cb_f09 cb_f09
cb_f08 cb_f08
dw_2 dw_2
st_13 st_13
dw_1 dw_1
end type
global w_qccoilchk w_qccoilchk

type variables
integer ii_weekchk, ii_monthchk
end variables

forward prototypes
public subroutine wf_update ()
end prototypes

public subroutine wf_update ();//
integer li_eos, li_gr, li_cb, li_br, li_sm
string  ls_null

dw_1.AcceptText()

SetNull(ls_null)
if isnull(dw_1.object.eos[1]) or dw_1.object.eos[1] = "" then
	li_eos = 0
else
	li_eos = integer(dw_1.object.eos[1])
end if

if isnull(dw_1.object.gr[1]) or dw_1.object.gr[1] = "" then
	li_gr = 0
else
	li_gr = integer(dw_1.object.gr[1])
end if

if isnull(dw_1.object.cb[1]) or dw_1.object.cb[1] = "" then
	li_cb = 0
else
	li_cb = integer(dw_1.object.cb[1])
end if

if li_eos < 1 or li_eos > 5 then 
	MessageBox("오류", "칼날 마모상태 입력이 잘못 되었습니다.")
	dw_1.SetItem(1, "eos", ls_null)
	dw_1.SetColumn("eos")
   goto end_line
end if

if li_gr < 1 or li_gr > 5 then 
	MessageBox("오류", "가이드레일 수평상태 입력이 잘못 되었습니다.")
	dw_1.SetItem(1, "gr", ls_null)
	dw_1.SetColumn("gr")
   goto end_line
end if

if li_cb < 1 or li_cb > 5 then 
	MessageBox("오류", "콘트롤 박스 통제가능여부 입력이 잘못 되었습니다.")
	dw_1.SetItem(1, "cb", ls_null)
	dw_1.SetColumn("cb")
   goto end_line
end if

if ii_weekchk > 0 then
else
	if isnull(dw_1.object.br[1]) or dw_1.object.br[1] = "" then
		li_br = 0
	else
		li_br = integer(dw_1.object.br[1])
	end if
	
	if li_br < 1 or li_br > 5 then 
		MessageBox("오류", "베어링 마모상태 입력이 잘못 되었습니다.")
		dw_1.SetItem(1, "br", ls_null)
		dw_1.SetColumn("br")
	   goto end_line
	end if
end if

if ii_monthchk > 0 then
else
	if isnull(dw_1.object.sm[1]) or dw_1.object.sm[1] = "" then
		li_sm = 0
	else
		li_sm = integer(dw_1.object.sm[1])
	end if
	
	if li_sm < 1 or li_sm > 5 then 
		MessageBox("오류", "슬라이드면 입력이 잘못 되었습니다.")
		dw_1.SetItem(1, "sm", ls_null)
		dw_1.SetColumn("sm")
	   goto end_line
	end if
end if


if dw_1.update() = 1 then
	commit;
	messagebox("확인", "저장 되었습니다.")
else 
	rollback;
	messagebox("확인", "저장이 실패 되었습니다.")
end if
close( w_qccoilchk )
		
end_line:

end subroutine

on w_qccoilchk.create
this.st_1=create st_1
this.st_lastday=create st_lastday
this.cb_f09=create cb_f09
this.cb_f08=create cb_f08
this.dw_2=create dw_2
this.st_13=create st_13
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.st_lastday,&
this.cb_f09,&
this.cb_f08,&
this.dw_2,&
this.st_13,&
this.dw_1}
end on

on w_qccoilchk.destroy
destroy(this.st_1)
destroy(this.st_lastday)
destroy(this.cb_f09)
destroy(this.cb_f08)
destroy(this.dw_2)
destroy(this.st_13)
destroy(this.dw_1)
end on

event open;//
datetime ldt_lastday
string   ls_manager

SELECT top 1 sfc_date INTO :ldt_lastday FROM qccoilchk ORDER BY sfc_date DESC;
st_lastday.text = string(ldt_lastday,"yyyy/mm/dd")

dw_1.SetTransObject(sqlca)
dw_1.Object.DataWindow.Zoom = 195
dw_2.SetTransObject(sqlca)
dw_2.Object.DataWindow.Zoom = 130
dw_2.insertrow(0)

ii_weekchk = Message.DoubleParm

date ldt_getdate
ldt_getdate = date( w_coilslit_m.dw_r.object.date[1] )

// 스리팅기 기장명
SELECT work_manager INTO :ls_manager FROM wc WHERE work_no = 'S01';

dw_1.insertrow(0)
dw_1.object.area_no[1]  = gs_area
dw_1.object.sfc_date[1] = ldt_getdate //gd_date
dw_1.object.wc_no[1]    = "S01"
dw_1.object.wname[1]    = ls_manager

if ii_weekchk > 0 then
	dw_1.object.t_4.visible  = false
	dw_1.object.t_6.visible  = false
	dw_1.object.t_14.visible = false
	dw_1.object.br.visible   = false
end if

string ls_month, ls_year, ls_sdate
ls_month = string(month(ldt_getdate)) //gd_date
ls_year  = string(year(ldt_getdate))  //gd_date

ls_sdate = ls_year + "/" +  RightA("00" + ls_month, 2) + "/01"

SELECT count(sm) INTO :ii_monthchk
  FROM qccoilchk   
 WHERE area_no = :gs_area
   AND sfc_Date BETWEEN :ls_sdate AND :ldt_getdate ; //gd_date

if ii_monthchk > 0 then
	dw_1.object.t_16.visible = false
	dw_1.object.t_17.visible = false
	dw_1.object.t_18.visible = false
	dw_1.object.sm.visible   = false
end if
dw_1.setfocus()

end event

event key;//
dw_1.AcceptText()

choose case key
	case KeyF8!
		wf_update()

	case KeyF9!
		//OpenWithParm(w_end, '프로그램 종료[w_end]')
		Close( this )
end choose

end event

type st_1 from statictext within w_qccoilchk
integer x = 41
integer y = 96
integer width = 672
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "마지막 점검일자:"
boolean focusrectangle = false
end type

type st_lastday from statictext within w_qccoilchk
integer x = 709
integer y = 96
integer width = 1157
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "NONE"
boolean focusrectangle = false
end type

type cb_f09 from commandbutton within w_qccoilchk
integer x = 2386
integer y = 16
integer width = 480
integer height = 148
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F9:종료"
end type

event clicked;// F9:종료
//OpenWithParm(w_end, '프로그램 종료[w_end]')
Close( Parent )

end event

type cb_f08 from commandbutton within w_qccoilchk
integer x = 1893
integer y = 16
integer width = 480
integer height = 148
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F8:저장"
end type

event clicked;// F8:저장
dw_1.AcceptText()
wf_update()

end event

type dw_2 from datawindow within w_qccoilchk
integer x = 32
integer y = 180
integer width = 2839
integer height = 672
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "d_qccoilchk_h"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type st_13 from statictext within w_qccoilchk
integer x = 46
integer y = 20
integer width = 1819
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "저장을 하지 않으면 다음으로 진행되지 않습니다."
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_qccoilchk
event ue_key pbm_dwnkey
integer x = 32
integer y = 864
integer width = 2839
integer height = 1284
integer taborder = 10
string title = "none"
string dataobject = "d_qccoilchk_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;dw_1.AcceptText()

choose case key
	case KeyF9!
		OpenWithParm(w_end, '프로그램 종료[w_end]')
		
	case KeyF8!
		wf_update()		

	case KeyUpArrow!
		//keybd_event(16,0,0,0) // SHIFT가 눌렸다.
		//keybd_event(9,0,0,0) // TAB이 눌렸다.
		//keybd_event(16,0,2,0) // SHIFT가 띄어졌다. (생략 불가능)
		//keybd_event(9,0,2,0) // TAB이 띄어졌다. (생략가능)

	case KeyDownArrow!
		//keybd_event(9,0,0,0) // TAB이 눌렸다.
		//keybd_event(9,0,2,0) // TAB이 띄어졌다. (생략가능)
end choose
end event

