$PBExportHeader$w_multiprint_r.srw
$PBExportComments$바코드프린트(넓은거,짧은거,입고확인서)(2004/04월어느날, 정갑용)
forward
global type w_multiprint_r from window
end type
type st_10 from statictext within w_multiprint_r
end type
type st_9 from statictext within w_multiprint_r
end type
type st_8 from statictext within w_multiprint_r
end type
type em_p3left from editmask within w_multiprint_r
end type
type em_p3top from editmask within w_multiprint_r
end type
type em_p2left from editmask within w_multiprint_r
end type
type em_p2top from editmask within w_multiprint_r
end type
type em_p1top from editmask within w_multiprint_r
end type
type em_p1left from editmask within w_multiprint_r
end type
type cbx_all from checkbox within w_multiprint_r
end type
type dw_6 from datawindow within w_multiprint_r
end type
type st_7 from statictext within w_multiprint_r
end type
type dw_5 from datawindow within w_multiprint_r
end type
type sle_prt4 from singlelineedit within w_multiprint_r
end type
type sle_prt3 from singlelineedit within w_multiprint_r
end type
type sle_prt2 from singlelineedit within w_multiprint_r
end type
type sle_prt1 from singlelineedit within w_multiprint_r
end type
type st_12 from statictext within w_multiprint_r
end type
type st_11 from statictext within w_multiprint_r
end type
type st_6 from statictext within w_multiprint_r
end type
type st_5 from statictext within w_multiprint_r
end type
type st_4 from statictext within w_multiprint_r
end type
type st_3 from statictext within w_multiprint_r
end type
type cbx_4 from checkbox within w_multiprint_r
end type
type dw_4 from datawindow within w_multiprint_r
end type
type rb_2 from radiobutton within w_multiprint_r
end type
type rb_1 from radiobutton within w_multiprint_r
end type
type st_2 from statictext within w_multiprint_r
end type
type em_cnt from editmask within w_multiprint_r
end type
type dw_3 from datawindow within w_multiprint_r
end type
type dw_2 from datawindow within w_multiprint_r
end type
type dw_1 from datawindow within w_multiprint_r
end type
type cb_2 from commandbutton within w_multiprint_r
end type
type cb_1 from commandbutton within w_multiprint_r
end type
type cbx_3 from checkbox within w_multiprint_r
end type
type cbx_2 from checkbox within w_multiprint_r
end type
type cbx_1 from checkbox within w_multiprint_r
end type
type st_1 from statictext within w_multiprint_r
end type
type gb_1 from groupbox within w_multiprint_r
end type
type gb_2 from groupbox within w_multiprint_r
end type
type gb_3 from groupbox within w_multiprint_r
end type
end forward

global type w_multiprint_r from window
integer width = 4187
integer height = 2340
boolean titlebar = true
string title = "출력물 선택(w_multiprint_r)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_10 st_10
st_9 st_9
st_8 st_8
em_p3left em_p3left
em_p3top em_p3top
em_p2left em_p2left
em_p2top em_p2top
em_p1top em_p1top
em_p1left em_p1left
cbx_all cbx_all
dw_6 dw_6
st_7 st_7
dw_5 dw_5
sle_prt4 sle_prt4
sle_prt3 sle_prt3
sle_prt2 sle_prt2
sle_prt1 sle_prt1
st_12 st_12
st_11 st_11
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
cbx_4 cbx_4
dw_4 dw_4
rb_2 rb_2
rb_1 rb_1
st_2 st_2
em_cnt em_cnt
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
st_1 st_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_multiprint_r w_multiprint_r

type variables
gs_where ist_where
end variables

forward prototypes
public subroutine wf_setprinter ()
public subroutine wf_getprinter (integer ai_prt)
end prototypes

public subroutine wf_setprinter ();// wf_setprinter
string ls_prt1, ls_prt2, ls_prt3, ls_prt4

ls_prt1 = sle_prt1.text
ls_prt2 = sle_prt2.text
ls_prt3 = sle_prt3.text
ls_prt4 = sle_prt4.text

SetProfileString("YCERP.INI", "Database", "INPRINT1", ls_prt1)
SetProfileString("YCERP.INI", "Database", "INPRINT2", ls_prt2)
SetProfileString("YCERP.INI", "Database", "INPRINT3", ls_prt3)
SetProfileString("YCERP.INI", "Database", "INPRINT4", ls_prt4)

end subroutine

public subroutine wf_getprinter (integer ai_prt);//
string ls_prt, ls_prtname[]

PrintSetup()

ls_prt = PrintGetPrinter()
GF_Split( ls_prt, "~t", ls_prtname )

choose case ai_prt
	case 1
		sle_prt1.text = ls_prtname[1]
	case 2
		sle_prt2.text = ls_prtname[1]
	case 3
		sle_prt3.text = ls_prtname[1]
	case 4
		sle_prt4.text = ls_prtname[1]
end choose


end subroutine

on w_multiprint_r.create
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.em_p3left=create em_p3left
this.em_p3top=create em_p3top
this.em_p2left=create em_p2left
this.em_p2top=create em_p2top
this.em_p1top=create em_p1top
this.em_p1left=create em_p1left
this.cbx_all=create cbx_all
this.dw_6=create dw_6
this.st_7=create st_7
this.dw_5=create dw_5
this.sle_prt4=create sle_prt4
this.sle_prt3=create sle_prt3
this.sle_prt2=create sle_prt2
this.sle_prt1=create sle_prt1
this.st_12=create st_12
this.st_11=create st_11
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.cbx_4=create cbx_4
this.dw_4=create dw_4
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_2=create st_2
this.em_cnt=create em_cnt
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.st_10,&
this.st_9,&
this.st_8,&
this.em_p3left,&
this.em_p3top,&
this.em_p2left,&
this.em_p2top,&
this.em_p1top,&
this.em_p1left,&
this.cbx_all,&
this.dw_6,&
this.st_7,&
this.dw_5,&
this.sle_prt4,&
this.sle_prt3,&
this.sle_prt2,&
this.sle_prt1,&
this.st_12,&
this.st_11,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.cbx_4,&
this.dw_4,&
this.rb_2,&
this.rb_1,&
this.st_2,&
this.em_cnt,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.st_1,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_multiprint_r.destroy
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.em_p3left)
destroy(this.em_p3top)
destroy(this.em_p2left)
destroy(this.em_p2top)
destroy(this.em_p1top)
destroy(this.em_p1left)
destroy(this.cbx_all)
destroy(this.dw_6)
destroy(this.st_7)
destroy(this.dw_5)
destroy(this.sle_prt4)
destroy(this.sle_prt3)
destroy(this.sle_prt2)
destroy(this.sle_prt1)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cbx_4)
destroy(this.dw_4)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_2)
destroy(this.em_cnt)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;//
string ls_inspno

dw_5.settransobject(SQLCA)
dw_6.settransobject(SQLCA)

// 코일 겉포장용
dw_1.x = dw_5.x ; dw_1.y = dw_5.y ; dw_1.width = dw_5.width ; dw_1.height = dw_5.height

// 코일 낱장용
dw_2.x = dw_5.x ; dw_2.y = dw_5.y ; dw_2.width = dw_5.width ; dw_2.height = dw_5.height

dw_1.Visible = False
dw_2.Visible = False
dw_3.Visible = False
dw_4.Visible = False
dw_6.Visible = False

ist_where = Message.PowerObjectParm
ls_inspno = ist_where.str1

dw_5.retrieve( ls_inspno )

//if integer(ist_where.str2) > 0 then em_1.visible = true; st_2.visible = true

// 자재입고 및 외주스리팅 입고 에서 str1:입고번호, str2:0(순번)
// 입고수정및삭제 에서 str3:갯수(미사용), str4:폭

// 알루미늄이 아니고 GI 코일일때는 스리팅 계획의 수량을 찍어 달라?


string ls_bar_ttpw, ls_bar_ttps, ls_rcpt_prt

SELECT bar_ttpw, bar_ttps, rcpt_prt INTO :ls_bar_ttpw, :ls_bar_ttps, :ls_rcpt_prt FROM globals;

sle_prt1.text = ls_bar_ttpw
sle_prt2.text = ls_bar_ttps
sle_prt3.text = ls_bar_ttpw
sle_prt4.text = ls_rcpt_prt

//////////////////////////////////////////////////////////////////////////////
// wf_getprinter
//////////////////////////////////////////////////////////////////////////////
string ls_prt1, ls_prt2, ls_prt3, ls_prt4
string ls_p1left, ls_p1top, ls_p2left, ls_p2top, ls_p3left, ls_p3top

ls_prt1 = ProfileString("YCERP.INI", "Database", "INPRINT1", "")
ls_prt2 = ProfileString("YCERP.INI", "Database", "INPRINT2", "")
ls_prt3 = ProfileString("YCERP.INI", "Database", "INPRINT3", "")
ls_prt4 = ProfileString("YCERP.INI", "Database", "INPRINT4", "")

//////////////////////////////////////////////////////////////////////////////
ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")

if isnull(ls_p1left) OR ls_p1left = "" then ls_p1left = "0"
if isnull(ls_p1top)  OR ls_p1top  = "" then ls_p1top  = "0"
if isnull(ls_p2left) OR ls_p2left = "" then ls_p2left = "0"
if isnull(ls_p2top)  OR ls_p2top  = "" then ls_p2top  = "0"
if isnull(ls_p3left) OR ls_p3left = "" then ls_p3left = "0"
if isnull(ls_p3top)  OR ls_p3top  = "" then ls_p3top  = "0"

em_p1left.text = ls_p1left ; em_p1top.text  = ls_p1top 
em_p2left.text = ls_p2left ; em_p2top.text  = ls_p2top 
em_p3left.text = ls_p3left ; em_p3top.text  = ls_p3top 
//////////////////////////////////////////////////////////////////////////////

if isnull(ls_prt1) OR ls_prt1 = "" then ls_prt1 = ls_bar_ttpw
if isnull(ls_prt2) OR ls_prt2 = "" then ls_prt2 = ls_bar_ttps
if isnull(ls_prt3) OR ls_prt3 = "" then ls_prt3 = ls_bar_ttpw
if isnull(ls_prt4) OR ls_prt4 = "" then ls_prt4 = ls_rcpt_prt

sle_prt1.text = ls_prt1
sle_prt2.text = ls_prt2
sle_prt3.text = ls_prt3
sle_prt4.text = ls_prt4

end event

type st_10 from statictext within w_multiprint_r
integer x = 3415
integer y = 104
integer width = 672
integer height = 44
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "3mm 이동시 180(상단)"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_multiprint_r
integer x = 3922
integer y = 448
integer width = 165
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "상단"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_multiprint_r
integer x = 3749
integer y = 448
integer width = 165
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "왼쪽"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_p3left from editmask within w_multiprint_r
integer x = 3749
integer y = 340
integer width = 165
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "100"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
//ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
//ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
//ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
//ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
//ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
//ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")
//
SetProfileString("YCERP.INI", "Database", "PRT3_LEFT", em_p3left.text)
SetProfileString("YCERP.INI", "Database", "PRT3_TOP",  em_p3top.text)

end event

type em_p3top from editmask within w_multiprint_r
integer x = 3922
integer y = 340
integer width = 165
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "0"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
//ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
//ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
//ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
//ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
//ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
//ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")
//
SetProfileString("YCERP.INI", "Database", "PRT3_LEFT", em_p3left.text)
SetProfileString("YCERP.INI", "Database", "PRT3_TOP",  em_p3top.text)

end event

type em_p2left from editmask within w_multiprint_r
integer x = 3749
integer y = 248
integer width = 165
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
string text = "100"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
//ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
//ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
//ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
//ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
//ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
//ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")
//
SetProfileString("YCERP.INI", "Database", "PRT2_LEFT", em_p2left.text)
SetProfileString("YCERP.INI", "Database", "PRT2_TOP",  em_p2top.text)

end event

type em_p2top from editmask within w_multiprint_r
integer x = 3922
integer y = 248
integer width = 165
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
string text = "0"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
//ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
//ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
//ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
//ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
//ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
//ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")
//
SetProfileString("YCERP.INI", "Database", "PRT2_LEFT", em_p2left.text)
SetProfileString("YCERP.INI", "Database", "PRT2_TOP",  em_p2top.text)

end event

type em_p1top from editmask within w_multiprint_r
integer x = 3922
integer y = 156
integer width = 165
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "0"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
//ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
//ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
//ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
//ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
//ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
//ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")
//
SetProfileString("YCERP.INI", "Database", "PRT1_LEFT", em_p1left.text)
SetProfileString("YCERP.INI", "Database", "PRT1_TOP",  em_p1top.text)

end event

type em_p1left from editmask within w_multiprint_r
integer x = 3749
integer y = 156
integer width = 165
integer height = 80
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "100"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
//ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
//ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
//ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
//ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
//ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
//ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")
//
SetProfileString("YCERP.INI", "Database", "PRT1_LEFT", em_p1left.text)
SetProfileString("YCERP.INI", "Database", "PRT1_TOP",  em_p1top.text)

end event

type cbx_all from checkbox within w_multiprint_r
integer x = 64
integer y = 572
integer width = 315
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "선택"
end type

event clicked;// 선택
string ls_loctype, ls_worktype, ls_chk
long   ll_row

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_5.rowcount()
	ls_worktype = dw_5.object.work_type[ll_row]
	ls_loctype  = dw_5.object.loc_type[ll_row]

	if ls_worktype = "L" then
		// if (work_type = 'L', 1, if ( loc_type = 'Y', 1, 0) ) 조건		
	else
		if ls_loctype = "Y" then
			// if (work_type = 'L', 1, if ( loc_type = 'Y', 1, 0) ) 조건		
		else
			dw_5.object.chk[ll_row] = ls_chk
		end if
	end if
next

end event

type dw_6 from datawindow within w_multiprint_r
integer x = 3511
integer y = 16
integer width = 105
integer height = 80
integer taborder = 80
string title = "Sheet 코일용"
string dataobject = "d_label_multi_r"
boolean livescroll = true
end type

type st_7 from statictext within w_multiprint_r
integer x = 1051
integer y = 32
integer width = 1920
integer height = 68
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "유형이 사외, TYPE이 Loss는 출력대상이 아닙니다. "
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_multiprint_r
integer x = 32
integer y = 648
integer width = 4091
integer height = 1572
integer taborder = 90
string title = "none"
string dataobject = "d_apinspdetprt_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_prt4 from singlelineedit within w_multiprint_r
integer x = 2752
integer y = 432
integer width = 987
integer height = 80
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
string text = "none"
end type

event modified;//
wf_setprinter()


end event

type sle_prt3 from singlelineedit within w_multiprint_r
integer x = 2752
integer y = 340
integer width = 987
integer height = 80
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "none"
end type

event modified;//
wf_setprinter()


end event

type sle_prt2 from singlelineedit within w_multiprint_r
integer x = 2752
integer y = 248
integer width = 987
integer height = 80
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
string text = "none"
end type

event modified;//
wf_setprinter()


end event

type sle_prt1 from singlelineedit within w_multiprint_r
integer x = 2752
integer y = 156
integer width = 987
integer height = 80
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "none"
end type

event modified;//
wf_setprinter()


end event

type st_12 from statictext within w_multiprint_r
integer x = 2853
integer y = 572
integer width = 1271
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "낱장용 : 세로보기, 100mm X 50mm"
boolean focusrectangle = false
end type

type st_11 from statictext within w_multiprint_r
integer x = 599
integer y = 572
integer width = 1376
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "겉포장용 : 가로보기, 100mm X 130mm"
boolean focusrectangle = false
end type

type st_6 from statictext within w_multiprint_r
integer x = 2016
integer y = 432
integer width = 722
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "입고명세서 프린트:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//
wf_getprinter( 4 )


end event

type st_5 from statictext within w_multiprint_r
integer x = 2016
integer y = 340
integer width = 722
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sheet 프린트:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//
wf_getprinter( 3 )


end event

type st_4 from statictext within w_multiprint_r
integer x = 2016
integer y = 248
integer width = 722
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "낱장용 프린트:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//
wf_getprinter( 2 )


end event

type st_3 from statictext within w_multiprint_r
integer x = 2016
integer y = 156
integer width = 722
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "겉포장용 프린트:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//
wf_getprinter( 1 )


end event

type cbx_4 from checkbox within w_multiprint_r
integer x = 78
integer y = 256
integer width = 558
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "Sheet코일용"
boolean checked = true
end type

event clicked;// Sheet 코일용
if this.checked = true then
	dw_5.enabled    = true
	cbx_all.enabled = true
	em_cnt.visible  = true
	st_2.visible    = true
else
	dw_5.enabled    = false
	cbx_all.enabled = false
	em_cnt.visible  = false
	st_2.visible    = false
end if

end event

type dw_4 from datawindow within w_multiprint_r
integer x = 3154
integer y = 16
integer width = 105
integer height = 80
integer taborder = 70
string title = "none"
string dataobject = "d_label_detail"
boolean livescroll = true
end type

type rb_2 from radiobutton within w_multiprint_r
integer x = 1582
integer y = 256
integer width = 320
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일 외"
end type

type rb_1 from radiobutton within w_multiprint_r
integer x = 1349
integer y = 256
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일"
boolean checked = true
end type

type st_2 from statictext within w_multiprint_r
integer x = 421
integer y = 344
integer width = 123
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "장"
boolean focusrectangle = false
end type

type em_cnt from editmask within w_multiprint_r
integer x = 165
integer y = 340
integer width = 238
integer height = 96
integer taborder = 50
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string minmax = "1~~9"
end type

type dw_3 from datawindow within w_multiprint_r
string tag = "d_ioinsliting_r2"
integer x = 3387
integer y = 16
integer width = 105
integer height = 80
integer taborder = 60
string title = "입고 명세서"
string dataobject = "d_ioinsliting_r"
boolean livescroll = true
end type

type dw_2 from datawindow within w_multiprint_r
integer x = 3264
integer y = 16
integer width = 105
integer height = 80
integer taborder = 40
string title = "코일 낱장용"
string dataobject = "d_label_2"
boolean livescroll = true
end type

type dw_1 from datawindow within w_multiprint_r
integer x = 2994
integer y = 16
integer width = 105
integer height = 80
integer taborder = 10
string title = "코일 겉포장용"
string dataobject = "d_label_1"
boolean livescroll = true
end type

type cb_2 from commandbutton within w_multiprint_r
integer x = 1335
integer y = 396
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "종 료"
boolean cancel = true
end type

event clicked;//
string ls_chk

if cbx_4.checked = true then
	ls_chk = '1'
else
	ls_chk = '2'
end if
CloseWithReturn(Parent, ls_chk)

end event

type cb_1 from commandbutton within w_multiprint_r
integer x = 731
integer y = 396
integer width = 594
integer height = 112
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출 력"
end type

event clicked;// 출력
string  ls_inspno, ls_itemnm, ls_qa, ls_uom 	// 입고번호 받아서 retrieve 하고 프린트함.
string  ls_prt1, ls_prt2, ls_prt3, ls_prt4
string  ls_p1left, ls_p1top, ls_p2left, ls_p2top, ls_p3left, ls_p3top 
string  ls_bar_ttpw, ls_bar_ttps, ls_rcpt_prt, ls_item

integer li_cnt, li_copyprt, li_row, li_start, li_end, li_sheet
long    ll_row, ll_dw6cnt, ll_rcptqty, ll_page
dec{1}  ld_wid
dec{4}  ld_unitqty

//// 256 User-defined paper size
//dw_1.Object.DataWindow.Print.Paper.Size = 256
//dw_1.Object.DataWindow.Print.CustomPage.Length = 254   // 10 inches 
//dw_1.Object.DataWindow.Print.CustomPage.Width  = 190.5 //  7 inches

ls_inspno = ist_where.str1

ls_prt1 = sle_prt1.text			// 겉포장용 프린트
ls_prt2 = sle_prt2.text			// 낱장용 프린트
ls_prt3 = sle_prt3.text			// Sheet 프린트
ls_prt4 = sle_prt4.text			// 입고 명세서

ls_p1left = em_p1left.text ; ls_p1top = em_p1top.text
ls_p2left = em_p2left.text ; ls_p2top = em_p2top.text
ls_p3left = em_p3left.text ; ls_p3top = em_p3top.text

ll_page = long(em_cnt.text)	// 출력장수

// 코일 겉포장용
if cbx_1.checked = true then
	dw_1.dataobject = "d_label_1"
	dw_1.settransobject(sqlca)
	dw_1.retrieve( ls_inspno )
	
	if isnull(ls_prt1) OR ls_prt1 = "" then
	else
		dw_1.modify("DataWindow.print.margin.left = " + ls_p1left + " " )
		dw_1.modify("DataWindow.print.margin.top  = " + ls_p1top + " "  )
		dw_1.Object.DataWindow.Printer = ls_prt1		// ls_bar_ttpw
		dw_1.print()
	end if
end if

// 코일 낱장용(코일갯수만큼 출력으로 변경)
if cbx_2.checked = true then		
	SELECT count(*) INTO :li_cnt FROM inspdet WHERE inspdet.insp_no = :ls_inspno ;
	li_start = 1
	li_end   = li_cnt

	for li_row = li_start to li_end
		dw_4.SetTransObject(SQLCA)
		dw_4.Retrieve(ls_inspno, li_row)

		ls_item = dw_4.Object.item_no[1] 
		ld_wid  = dw_4.Object.item_qa[1]
				
		if MidA(ls_item, 2, 1) = "1" then				// 원코일
			dw_2.dataobject = "d_label_4"
		elseif MidA(ls_item, 2, 1)  = "2" then		// 스리팅
			//
		else
			if ld_wid > 50.0 then	// 낱장 큰것
				dw_2.dataobject = "d_label_2"
			else							// 낱장 작은것
				dw_2.dataobject = "d_label_3"
			end if
		end if
		
		dw_2.settransobject(sqlca)
		if dw_2.retrieve(ls_inspno, li_row) > 0 then
			if isnull(ls_prt2) OR ls_prt2 = "" then
			else
				dw_2.modify("DataWindow.print.margin.left = " + ls_p2left + " " )
				dw_2.modify("DataWindow.print.margin.top  = " + ls_p2top + " "  )
				dw_2.Object.DataWindow.Printer      = ls_prt2		// ls_bar_ttps
				dw_2.Object.DataWindow.Print.Copies = li_copyprt
				dw_2.print()
			end if
		end if
	next
end if

// 입고확인서		
if cbx_3.checked = true then		
	if rb_1.checked = true then 		// 코일용
		dw_3.dataobject = "d_ioinsliting_r"
	else										// 코일 외
		dw_3.dataobject = "d_ioinsliting_r2"
	end if
	dw_3.settransobject(sqlca)
	dw_3.retrieve(ls_inspno)
	
	if isnull(ls_prt4) OR ls_prt4 = "" then
	else
		dw_3.Object.DataWindow.Printer = ls_prt4		// ls_rcpt_prt
		dw_3.print()
	end if
end if

// Sheet 코일용		
if cbx_4.checked = true then		
	if dw_5.object.tchk[1] < 1 then
		MessageBox("확인","출력대상을 선택하시기 바랍니다.")
		RETURN
	end if
	
	for ll_row = 1 to dw_5.rowcount()
		if dw_5.object.chk[ll_row] <> "Y" then	CONTINUE
	
		ls_itemnm   = dw_5.object.item_item_name[ll_row]

		if PosA(ls_itemnm, "SHEET") > 0 then
			if dw_6.rowcount() < 1 then dw_6.insertrow( 0 )
			ll_dw6cnt = dw_6.rowcount()
			
			li_sheet  = li_sheet + 1
			
			ls_inspno   = dw_5.object.inspdet_insp_no[ll_row]
			ls_itemnm   = dw_5.object.item_item_name[ll_row]
			ls_qa       = dw_5.object.inspdet_qa[ll_row]
			ls_qa       = GF_ReplaceAll(ls_qa,"X","*")
			if RightA(ls_qa,5) = "00000" then ls_qa = LeftA(ls_qa,13)
			
			ls_uom      = dw_5.object.inspdet_uom[ll_row]
			ll_rcptqty  = dw_5.object.inspdet_cnt[ll_row]
			ld_unitqty  = dw_5.object.inspdet_unit_qty[ll_row]
			
			dw_6.SetItem(ll_dw6cnt, "insp_no"                     , ls_inspno)
			dw_6.SetItem(ll_dw6cnt, "item_name" + string(li_sheet), ls_itemnm)
			dw_6.SetItem(ll_dw6cnt, "qa"        + string(li_sheet), ls_qa)
			dw_6.SetItem(ll_dw6cnt, "uom"       + string(li_sheet), ls_uom)
			dw_6.SetItem(ll_dw6cnt, "rcpt_qty"  + string(li_sheet), ll_rcptqty)
			dw_6.SetItem(ll_dw6cnt, "com_qty"   + string(li_sheet), ld_unitqty)

			if li_sheet > 7 then
				dw_6.modify("DataWindow.print.margin.left = " + ls_p3left + " " )
				dw_6.modify("DataWindow.print.margin.top  = " + ls_p3top + " "  )
				dw_6.Object.DataWindow.Printer = ls_prt3		// ls_rcpt_prt
           	     dw_6.object.DataWindow.Print.Copies = string(ll_page)
				dw_6.Print()

				li_sheet = 0
				dw_6.Reset()
				dw_6.insertrow( 0 )
				dw_6.object.insp_no[1]   = ls_inspno
			end if
		end if
	next
	// Sheet 코일용(잔량)
	if li_sheet > 0 then
		dw_6.modify("DataWindow.print.margin.left = " + ls_p3left + " " )
		dw_6.modify("DataWindow.print.margin.top  = " + ls_p3top + " "  )
		dw_6.Object.DataWindow.Printer = ls_prt3		// ls_rcpt_prt
		dw_6.object.DataWindow.Print.Copies = string(ll_page)
		dw_6.Print()
	end if
end if

// 프린터명 저장
WF_SetPrinter()

// 종료
cb_2.TriggerEvent(Clicked!)

end event

type cbx_3 from checkbox within w_multiprint_r
integer x = 1349
integer y = 172
integer width = 498
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "입고 확인서"
boolean checked = true
end type

event clicked;if cbx_3.checked = true then
	rb_1.visible = true
	rb_2.visible = true
else
	rb_1.visible = false
	rb_2.visible = false
end if
end event

type cbx_2 from checkbox within w_multiprint_r
integer x = 731
integer y = 172
integer width = 558
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일 낱장용"
end type

type cbx_1 from checkbox within w_multiprint_r
integer x = 78
integer y = 172
integer width = 558
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일 겉포장용"
boolean checked = true
end type

type st_1 from statictext within w_multiprint_r
integer x = 41
integer y = 32
integer width = 987
integer height = 68
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력할 항목을 선택하세요."
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_multiprint_r
integer x = 1298
integer y = 132
integer width = 631
integer height = 228
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_multiprint_r
integer x = 32
integer y = 100
integer width = 1943
integer height = 444
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_multiprint_r
integer x = 1984
integer y = 100
integer width = 2139
integer height = 444
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

