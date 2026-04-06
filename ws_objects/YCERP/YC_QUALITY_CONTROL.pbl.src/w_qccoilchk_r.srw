$PBExportHeader$w_qccoilchk_r.srw
$PBExportComments$스리팅 설비점검 체크리스트(2005/05/23, 이인호)
forward 
global type w_qccoilchk_r from w_inheritance
end type
type em_1 from editmask within w_qccoilchk_r
end type
type dw_3 from dw_2 within w_qccoilchk_r
end type
type dw_area from datawindow within w_qccoilchk_r
end type
type st_2 from statictext within w_qccoilchk_r
end type
type st_3 from statictext within w_qccoilchk_r
end type
type st_4 from statictext within w_qccoilchk_r
end type
end forward

global type w_qccoilchk_r from w_inheritance
integer width = 4215
integer height = 2108
string title = "성형 설비점검 체크리스트(w_qcchk_r)"
em_1 em_1
dw_3 dw_3
dw_area dw_area
st_2 st_2
st_3 st_3
st_4 st_4
end type
global w_qccoilchk_r w_qccoilchk_r

type variables
st_print i_print

end variables

forward prototypes
public function string wf_getchk (string as_chk)
end prototypes

public function string wf_getchk (string as_chk);string ls_chk

//○: 양호 ∧: 요교환 ◇: 요조정 ∨: 요수리
choose case as_chk
	case '1'
		ls_chk = '○ '
	case '2'
		ls_chk = '∧ '
	case '3'
		ls_chk = '◇ '
	case '4'
		ls_chk = '∨ '
	case '5'
		ls_chk = '■ '
	case else
		ls_chk = '   '
end choose

return ls_chk

end function

on w_qccoilchk_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.dw_3=create dw_3
this.dw_area=create dw_area
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
end on

on w_qccoilchk_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.dw_3)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_2.visible = false
dw_3.insertrow(1)
DW_3.object.wc_no[1] = 'S01'
em_1.text = string(today(), "YYYY/MM")
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
//1 = ○ : 양호 
//2 = ∧ : 요교환 
//3 = ◇ : 요조정 
//4 = ∨ : 요수리 
//5 = ■ : 주  유

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_qccoilchk_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_qccoilchk_r
integer x = 32
integer y = 428
integer width = 4105
integer height = 1544
integer taborder = 30
string dataobject = "d_qccoilchk_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_qccoilchk_r
integer x = 32
integer y = 20
integer width = 1701
integer height = 140
string text = "스리팅 설비점검 체크리스트"
end type

type st_tips from w_inheritance`st_tips within w_qccoilchk_r
end type

type pb_compute from w_inheritance`pb_compute within w_qccoilchk_r
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_qccoilchk_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_qccoilchk_r
integer x = 3799
integer y = 64
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_qccoilchk_r
integer x = 3607
integer y = 64
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF dw_1.getrow() <= 0 THEN
   RETURN
END IF

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 스리팅 설비점검 체크 리스트을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_qccoilchk_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_qccoilchk_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_qccoilchk_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_qccoilchk_r
integer x = 3415
integer y = 64
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_wc, ls_ym, ls_area
date ld_start, ld_end
datetime ldt_date

dw_1.reset()
dw_2.reset()

ls_ym = em_1.text
ld_start = date ( ls_ym + '/01')
ldt_date = datetime(ld_start)
select top 1 dbo.uf_getlastdate(:ldt_date) into :ldt_date from area;
//1 = ○ : 양호 
//2 = ∧ : 요교환 
//3 = ◇ : 요조정 
//4 = ∨ : 요수리 
//5 = ■ : 주  유
ls_area = dw_area.object.area[1]
ls_wc = dw_3.object.wc_no[1]
ld_end = date(ldt_date)
dw_2.retrieve(ls_area, ls_wc, ld_start, ld_end)//'2005/01/01', '2005/05/31')

if dw_2.rowcount() < 1 then
	messagebox("에러","해당일에 조회한 자료가 없습니다",Exclamation!)
	return
end if
long ll_row
string ls_row1, ls_row2, ls_row3, ls_row4, ls_row5, ls_row6, ls_row7
string ls_name1, ls_name2, ls_name3, ls_wname

dw_1.insertrow(0)
dw_1.object.qc_ym[1] = LeftA(em_1.text, 4) + MidA(em_1.text,6,2)
ls_row1 = ''
ls_row2 = ''
ls_row3 = ''
ls_row4 = ''
ls_row5 = ''
ls_row6 = ''
ls_row7 = ''
ls_name1 = ''
ls_name2 = ''
ls_name3 = ''

for ll_row = 1 to dw_2.rowcount()
	ls_row1 = ls_row1 + wf_getchk(dw_2.object.EOS[ll_row])
	ls_row2 = ls_row2 + wf_getchk(dw_2.object.GR[ll_row])
	ls_row3 = ls_row3 + wf_getchk(dw_2.object.CB[ll_row])
	ls_row4 = ls_row4 + wf_getchk(dw_2.object.BR[ll_row])
	ls_row5 = ls_row5 + wf_getchk(dw_2.object.SM[ll_row])
	ls_wname = dw_2.object.wname[ll_row]
	if isnull(ls_wname) or trim(ls_wname) = '' then
		ls_name1 = ls_name1 + '   '
		ls_name2 = ls_name2 + '   '
		ls_name3 = ls_name3 + '   '
	else
		ls_name1 = ls_name1 + LeftA(ls_wname, 2) + ' '
		ls_name2 = ls_name2 + MidA(ls_wname, 3,2) + ' '
		ls_name3 = ls_name3 + MidA(ls_wname, 5,2) + ' '
	end if
next
dw_1.object.row1[1] = ls_row1
dw_1.object.row2[1] = ls_row2
dw_1.object.row3[1] = ls_row3
dw_1.object.row4[1] = ls_row4
dw_1.object.row5[1] = ls_row5
dw_1.object.name1[1] = ls_name1
dw_1.object.name2[1] = ls_name2
dw_1.object.name3[1] = ls_name3
string ls_name
select work_name into :ls_name from wc
 where work_no = :ls_wc;
dw_1.object.mc_name[1] = ls_name

end event

type gb_3 from w_inheritance`gb_3 within w_qccoilchk_r
integer x = 32
integer y = 248
integer width = 4105
integer height = 168
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_qccoilchk_r
integer x = 1792
integer y = 16
integer width = 1563
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_qccoilchk_r
integer x = 3383
integer y = 16
integer width = 635
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_qccoilchk_r
integer x = 69
integer y = 128
integer width = 114
integer height = 76
integer taborder = 40
string dataobject = "d_qccoilchk_h"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::losefocus;call super::losefocus;this.accepttext()
end event

type em_1 from editmask within w_qccoilchk_r
integer x = 2921
integer y = 52
integer width = 384
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type dw_3 from dw_2 within w_qccoilchk_r
integer x = 2066
integer y = 136
integer width = 608
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_whwc_s"
boolean border = false
end type

type dw_area from datawindow within w_qccoilchk_r
integer x = 2071
integer y = 52
integer width = 530
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type st_2 from statictext within w_qccoilchk_r
integer x = 1824
integer y = 52
integer width = 242
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_qccoilchk_r
integer x = 1824
integer y = 136
integer width = 242
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_qccoilchk_r
integer x = 2679
integer y = 52
integer width = 242
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

