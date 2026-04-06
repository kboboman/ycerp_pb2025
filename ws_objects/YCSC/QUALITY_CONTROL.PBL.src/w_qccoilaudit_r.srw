$PBExportHeader$w_qccoilaudit_r.srw
$PBExportComments$스리팅 중간검사 성적서(2005/05/23, 이인호)
forward
global type w_qccoilaudit_r from w_inheritance
end type
type em_1 from editmask within w_qccoilaudit_r
end type
type em_2 from editmask within w_qccoilaudit_r
end type
type st_1 from statictext within w_qccoilaudit_r
end type
type dw_area from datawindow within w_qccoilaudit_r
end type
type dw_3 from datawindow within w_qccoilaudit_r
end type
type st_2 from statictext within w_qccoilaudit_r
end type
type st_3 from statictext within w_qccoilaudit_r
end type
type st_4 from statictext within w_qccoilaudit_r
end type
end forward

global type w_qccoilaudit_r from w_inheritance
integer width = 3616
integer height = 2272
string title = "스리팅 중간검사 성적서(w_qcsfcaudit_r)"
em_1 em_1
em_2 em_2
st_1 st_1
dw_area dw_area
dw_3 dw_3
st_2 st_2
st_3 st_3
st_4 st_4
end type
global w_qccoilaudit_r w_qccoilaudit_r

type variables
st_print i_print
integer ii_wcnt
end variables

forward prototypes
public subroutine wf_ret (string as_area, string as_wc, date ad_start, date ad_end)
public subroutine wf_lotmove (integer al_cnt, long al_row, long al_dw3row)
end prototypes

public subroutine wf_ret (string as_area, string as_wc, date ad_start, date ad_end);long ll_breakrow, ll_dw1row1, ll_dw3row
long ll_wcnt, ll_cnt, ll_rolcnt
string ls_name
string ls_item, ls_flag

select work_manager into :ls_name from wc
 where work_no = :as_wc;
 
ll_cnt = 1
for ll_dw3row = 1 to dw_3.rowcount()
	ll_breakrow = dw_3.FindGroupChange(ll_dw3row, 1)
	IF (ll_breakrow = ll_dw3row) or mod(ll_cnt, 6) = 1 THEN  //그룹이 바뀜 또는 6개가 넘음
		if ll_dw3row <> 1 then 
//			dw_1.object.wcnt[ll_dw1row1] = string(ll_cnt - 1, '#,##0')
			dw_1.object.wcnt[ll_dw1row1] = string(ll_rolcnt, '#,##0')
		end if
		ll_dw1row1 = dw_1.insertrow(0)
		dw_1.object.item_name[ll_dw1row1] = '용융아연도금강판 및 강대'
		dw_1.object.qc_code[ll_dw1row1] = 'WIJ-201'
		dw_1.object.wqa[ll_dw1row1] = LeftA(dw_3.object.qa[ll_dw3row],9) + string(dw_3.object.coilorderdet_tot_qty[ll_dw3row])
		dw_1.object.lot_no[ll_dw1row1] = dw_3.object.w_coil_no[ll_dw3row]
		dw_1.object.wc_name[ll_dw1row1] = ls_name
		dw_1.object.qc_user[ll_dw1row1] = dw_3.object.wname[ll_dw3row]
		dw_1.object.qc_date[ll_dw1row1] = dw_3.object.sfc_date[ll_dw3row]
		dw_1.object.qc_type[ll_dw1row1] = 'YCOT-11'
		ll_cnt = 1
		ll_rolcnt = 0
	end if

	wf_lotmove(ll_cnt, ll_dw1row1, ll_dw3row)
	ll_rolcnt = ll_rolcnt + dw_3.object.cnt[ll_dw3row]
	ll_cnt = ll_cnt + 1
next

//dw_1.object.wcnt[ll_dw1row1 ] = string(ll_cnt - 1, '#,##0')
dw_1.object.wcnt[ll_dw1row1 ] = string(ll_rolcnt, '#,##0')

end subroutine

public subroutine wf_lotmove (integer al_cnt, long al_row, long al_dw3row);choose case al_cnt
	case 1
		dw_1.object.wid1[al_row] = string(dw_3.object.wid[al_dw3row], '#,##0.0')
		dw_1.object.cnt1[al_row] = string(dw_3.object.cnt[al_dw3row], '#,##0')
		dw_1.object.chk1_1[al_row] = string(dw_3.object.qc_chk1[al_dw3row], '#,##0.0')
		dw_1.object.chk2_1[al_row] = string(dw_3.object.qc_chk2[al_dw3row], '#,##0.0')
		dw_1.object.chk3_1[al_row] = string(dw_3.object.qc_chk3[al_dw3row], '#,##0.0')
	case 2
		dw_1.object.wid2[al_row] = string(dw_3.object.wid[al_dw3row], '#,##0.0')
		dw_1.object.cnt2[al_row] = string(dw_3.object.cnt[al_dw3row], '#,##0')
		dw_1.object.chk1_2[al_row] = string(dw_3.object.qc_chk1[al_dw3row], '#,##0.0')
		dw_1.object.chk2_2[al_row] = string(dw_3.object.qc_chk2[al_dw3row], '#,##0.0')
		dw_1.object.chk3_2[al_row] = string(dw_3.object.qc_chk3[al_dw3row], '#,##0.0')
	case 3
		dw_1.object.wid3[al_row] = string(dw_3.object.wid[al_dw3row], '#,##0.0')
		dw_1.object.cnt3[al_row] = string(dw_3.object.cnt[al_dw3row], '#,##0')
		dw_1.object.chk1_3[al_row] = string(dw_3.object.qc_chk1[al_dw3row], '#,##0.0')
		dw_1.object.chk2_3[al_row] = string(dw_3.object.qc_chk2[al_dw3row], '#,##0.0')
		dw_1.object.chk3_3[al_row] = string(dw_3.object.qc_chk3[al_dw3row], '#,##0.0')
	case 4
		dw_1.object.wid4[al_row] = string(dw_3.object.wid[al_dw3row], '#,##0.0')
		dw_1.object.cnt4[al_row] = string(dw_3.object.cnt[al_dw3row], '#,##0')
		dw_1.object.chk1_4[al_row] = string(dw_3.object.qc_chk1[al_dw3row], '#,##0.0')
		dw_1.object.chk2_4[al_row] = string(dw_3.object.qc_chk2[al_dw3row], '#,##0.0')
		dw_1.object.chk3_4[al_row] = string(dw_3.object.qc_chk3[al_dw3row], '#,##0.0')
	case 5
		dw_1.object.wid5[al_row] = string(dw_3.object.wid[al_dw3row], '#,##0.0')
		dw_1.object.cnt5[al_row] = string(dw_3.object.cnt[al_dw3row], '#,##0')
		dw_1.object.chk1_5[al_row] = string(dw_3.object.qc_chk1[al_dw3row], '#,##0.0')
		dw_1.object.chk2_5[al_row] = string(dw_3.object.qc_chk2[al_dw3row], '#,##0.0')
		dw_1.object.chk3_5[al_row] = string(dw_3.object.qc_chk3[al_dw3row], '#,##0.0')
	case 6
		dw_1.object.wid6[al_row] = string(dw_3.object.wid[al_dw3row], '#,##0.0')
		dw_1.object.cnt6[al_row] = string(dw_3.object.cnt[al_dw3row], '#,##0')
		dw_1.object.chk1_6[al_row] = string(dw_3.object.qc_chk1[al_dw3row], '#,##0.0')
		dw_1.object.chk2_6[al_row] = string(dw_3.object.qc_chk2[al_dw3row], '#,##0.0')
		dw_1.object.chk3_6[al_row] = string(dw_3.object.qc_chk3[al_dw3row], '#,##0.0')
end choose

end subroutine

on w_qccoilaudit_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_area=create dw_area
this.dw_3=create dw_3
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_4
end on

on w_qccoilaudit_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(), "YYYY/MM/DD")

dw_3.visible = false
em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
dw_3.SetTransObject(SQLCA)

dw_2.insertrow(0)
dw_2.object.wc_no[1] = 'S01'

em_1.setfocus()

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

end event

type pb_save from w_inheritance`pb_save within w_qccoilaudit_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_qccoilaudit_r
integer x = 18
integer y = 352
integer width = 3543
integer height = 1792
integer taborder = 30
string dataobject = "d_qccoilaudit_r4"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_qccoilaudit_r
integer x = 1056
integer y = 248
integer width = 837
integer height = 80
integer taborder = 40
string dataobject = "d_whwc_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::losefocus;call super::losefocus;this.accepttext()
end event

type st_title from w_inheritance`st_title within w_qccoilaudit_r
integer x = 32
integer width = 1431
string text = "스리팅 중간검사 성적서"
end type

type st_tips from w_inheritance`st_tips within w_qccoilaudit_r
end type

type pb_compute from w_inheritance`pb_compute within w_qccoilaudit_r
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_qccoilaudit_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_qccoilaudit_r
integer x = 3337
integer y = 48
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_qccoilaudit_r
integer x = 3145
integer y = 48
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

gs_print_str lstr_print

IF dw_1.getrow() <= 0 THEN
   RETURN
END IF

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 스리팅 중간검사 성적서를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_qccoilaudit_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_qccoilaudit_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_qccoilaudit_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_qccoilaudit_r
integer x = 2953
integer y = 48
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_wc
date ld_start, ld_end

dw_area.accepttext()
dw_2.accepttext()
ls_area = dw_area.object.area[1]
ls_wc = dw_2.object.wc_no[1]

ld_start = date(em_1.text)
ld_end = date(em_2.text)
dw_1.setredraw(false)
dw_1.reset()
pointer oldpointer 

oldpointer = SetPointer(HourGlass!)

if dw_3.retrieve(ls_wc, ld_start, ld_end ) < 1 then
	messagebox("확인","해당일에 조회한 자료가 없습니다",Exclamation!)
else
	wf_ret(ls_area, ls_wc, ld_start, ld_end )
end if
SetPointer(oldpointer)
dw_1.setredraw(true)
//○ : 양호 ∧ : 요교환 ◇ : 요조정 ∨ : 요수리

end event

type gb_3 from w_inheritance`gb_3 within w_qccoilaudit_r
boolean visible = false
integer x = 2779
integer y = 40
integer width = 160
integer height = 184
integer taborder = 80
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_qccoilaudit_r
integer x = 18
integer y = 212
integer width = 3520
integer height = 136
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_qccoilaudit_r
integer x = 2926
integer y = 8
integer width = 626
integer taborder = 0
end type

type em_1 from editmask within w_qccoilaudit_r
integer x = 2121
integer y = 248
integer width = 411
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_qccoilaudit_r
integer x = 2642
integer y = 248
integer width = 407
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_qccoilaudit_r
integer x = 2551
integer y = 240
integer width = 78
integer height = 88
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_qccoilaudit_r
integer x = 274
integer y = 248
integer width = 503
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type dw_3 from datawindow within w_qccoilaudit_r
integer x = 1696
integer y = 56
integer width = 78
integer height = 60
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_qccoilaudit_h1"
boolean border = false
end type

type st_2 from statictext within w_qccoilaudit_r
integer x = 37
integer y = 260
integer width = 242
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_qccoilaudit_r
integer x = 809
integer y = 260
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "작업장:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_qccoilaudit_r
integer x = 1943
integer y = 260
integer width = 160
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "일자:"
boolean focusrectangle = false
end type

