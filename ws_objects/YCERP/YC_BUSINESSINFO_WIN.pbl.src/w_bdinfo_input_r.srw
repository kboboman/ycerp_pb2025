$PBExportHeader$w_bdinfo_input_r.srw
$PBExportComments$설계영업현황조회pop[2000/11/29,서재복]
forward
global type w_bdinfo_input_r from w_inheritance
end type
type pb_print3 from picturebutton within w_bdinfo_input_r
end type
type dw_print5 from datawindow within w_bdinfo_input_r
end type
end forward

global type w_bdinfo_input_r from w_inheritance
integer width = 3031
integer height = 2180
string title = "설계영업진행현황(w_bdinfo_input_r)"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
windowstate windowstate = normal!
pb_print3 pb_print3
dw_print5 dw_print5
end type
global w_bdinfo_input_r w_bdinfo_input_r

type variables
gst_bdwhere ist_where



end variables

forward prototypes
public function boolean wf_delete1 (datawindow arg_dw1, string arg_str)
end prototypes

public function boolean wf_delete1 (datawindow arg_dw1, string arg_str);
if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "삭제되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "삭제 실패!")
	return false
end if

end function

on w_bdinfo_input_r.create
int iCurrent
call super::create
this.pb_print3=create pb_print3
this.dw_print5=create dw_print5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_print3
this.Control[iCurrent+2]=this.dw_print5
end on

on w_bdinfo_input_r.destroy
call super::destroy
destroy(this.pb_print3)
destroy(this.dw_print5)
end on

event open;call super::open;this.x = 30
this.y = 180

dw_print5.settransobject(sqlca)

string ls_agbuildno
dec ld_agseq

ist_where = Message.PowerObjectParm
ls_agbuildno = ist_where.str12
ld_agseq = ist_where.dec4

dw_2.retrieve( ls_agbuildno, ld_agseq )
dw_2.setfocus()

end event

type pb_save from w_inheritance`pb_save within w_bdinfo_input_r
boolean visible = false
integer x = 3575
integer y = 128
end type

type dw_1 from w_inheritance`dw_1 within w_bdinfo_input_r
boolean visible = false
integer x = 3209
integer y = 836
integer width = 448
integer height = 392
integer taborder = 50
string dataobject = "dw_info"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_bdinfo_input_r
integer y = 36
integer width = 1490
integer height = 164
integer textsize = -20
string text = "설계영업진행현황"
end type

type st_tips from w_inheritance`st_tips within w_bdinfo_input_r
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_input_r
boolean visible = false
integer x = 3319
integer y = 40
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_input_r
boolean visible = false
integer x = 3543
integer y = 348
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_input_r
integer x = 2779
integer y = 44
integer taborder = 100
end type

event pb_close::clicked;close(parent)
//ist_where.okflag = true
//closewithreturn(parent, ist_where)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_input_r
boolean visible = false
integer x = 3127
integer y = 92
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_input_r
boolean visible = false
integer x = 3342
integer y = 120
integer taborder = 120
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_bdinfo_input_r
boolean visible = false
integer x = 3346
integer y = 288
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_bdinfo_input_r
boolean visible = false
integer x = 3255
integer y = 472
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_input_r
boolean visible = false
integer x = 3118
integer y = 276
integer taborder = 150
end type

type gb_3 from w_inheritance`gb_3 within w_bdinfo_input_r
integer x = 32
integer y = 216
integer width = 2967
integer height = 1832
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_input_r
boolean visible = false
integer x = 3150
integer y = 768
integer width = 512
integer height = 624
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_input_r
integer x = 2555
integer y = 4
integer width = 439
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_input_r
integer x = 59
integer y = 272
integer width = 2912
integer height = 1744
integer taborder = 60
string dataobject = "d_bdinfo_input_r"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;if row < 1 then return

if dwo.name = 'design_prog' then
	ist_where.str11 = "1"
	ist_where.str12 = this.object.bdinfodet_build_no[this.getrow()]
	ist_where.dec4 = this.object.bdinfodet_seq[this.getrow()]
	openwithparm(w_bdinfo_det_m1, ist_where)
end if
if dwo.name = 'com_prog' then
	ist_where.str11 = "2"
	ist_where.str12 = this.object.bdinfodet_build_no[this.getrow()]
	ist_where.dec4 = this.object.bdinfodet_seq[this.getrow()]
	openwithparm(w_bdinfo_det_m2, ist_where)
end if
if dwo.name = 'info_detail' then
	ist_where.str12 = this.object.bdinfodet_build_no[this.getrow()]
	ist_where.dec4 = this.object.bdinfodet_seq[this.getrow()]
	openwithparm(w_bdinfo_input_r2, ist_where)
	if ist_where.okflag = true then
		dw_2.retrieve( ist_where.str12, ist_where.dec4 )
	end if
end if
	
	
	
end event

event dw_2::rowfocuschanged;//dw_3.scrolltorow(dw_2.getrow())
end event

event dw_2::losefocus;This.accepttext()

end event

type pb_print3 from picturebutton within w_bdinfo_input_r
event mousemove pbm_mousemove
integer x = 2587
integer y = 44
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = left!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"프로젝트별 공사정보진행현황",parent, li_x, li_y)


end event

event clicked;w_repsuper w_print
st_print l_print
date ld_start, ld_end
string ls_cust_no, ls_specname

string ls_agbuildno
decimal ld_agseq
ls_agbuildno = dw_2.object.bdinfodet_build_no[dw_2.getrow()]
ld_agseq = dw_2.object.bdinfodet_seq[dw_2.getrow()]

dw_print5.retrieve( ls_agbuildno, ld_agseq )

if dw_print5.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if
parent.WindowState = Minimized!
l_print.st_datawindow = dw_print5
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 건설정보진행현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)




end event

type dw_print5 from datawindow within w_bdinfo_input_r
boolean visible = false
integer x = 1595
integer y = 56
integer width = 178
integer height = 128
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_bdinfo_input_p"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

