$PBExportHeader$w_orsaleyspcon_m.srw
$PBExportComments$YSP수주접수관리(2003/01/07,이인호)
forward
global type w_orsaleyspcon_m from w_inheritance
end type
type rb_1 from radiobutton within w_orsaleyspcon_m
end type
type rb_2 from radiobutton within w_orsaleyspcon_m
end type
type dw_3 from datawindow within w_orsaleyspcon_m
end type
type dw_4 from datawindow within w_orsaleyspcon_m
end type
type em_2 from editmask within w_orsaleyspcon_m
end type
type st_1 from statictext within w_orsaleyspcon_m
end type
type em_1 from editmask within w_orsaleyspcon_m
end type
type em_3 from editmask within w_orsaleyspcon_m
end type
type st_3 from statictext within w_orsaleyspcon_m
end type
end forward

global type w_orsaleyspcon_m from w_inheritance
integer y = 36
integer width = 3689
integer height = 2216
string title = "YSP 수주접수관리(w_orsaleyspcon_m)"
boolean resizable = false
windowstate windowstate = normal!
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_4 dw_4
em_2 em_2
st_1 st_1
em_1 em_1
em_3 em_3
st_3 st_3
end type
global w_orsaleyspcon_m w_orsaleyspcon_m

type variables
st_print i_print
end variables

on w_orsaleyspcon_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.em_2=create em_2
this.st_1=create st_1
this.em_1=create em_1
this.em_3=create em_3
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_1
this.Control[iCurrent+8]=this.em_3
this.Control[iCurrent+9]=this.st_3
end on

on w_orsaleyspcon_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_3)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if GF_Permission('YSP수주접수관리', gs_userid) = 'Y' then	
else
//	messagebox("권한", "이프로그램의 사용권한이 없습니다")
	pb_save.enabled = false
end if

em_3.text = "BD" + string(today(), "yyyy")
em_1.text = string(RelativeDate(today(),  - 7), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_4.visible = false
end event

type pb_save from w_inheritance`pb_save within w_orsaleyspcon_m
integer x = 3214
integer y = 56
end type

event pb_save::clicked;string ls_chk, ls_order
int li_cnt

if dw_2.rowcount() < 1 then return
ls_chk = 'N'
if dw_2.getItemStatus(1, 0, Primary!) <> NotModified! then
	ls_chk = 'Y'
end if

ls_order = dw_2.object.order_no[1]
select count(*) into :li_cnt from sale
 where order_no = :ls_order
   and confirm_flag = 'Y';
if li_cnt < 1 then 
	messagebox("확인", "해당수주는 확정이 취소 되어 있는 상태입니다. ~r~n" &
							 + "재조회 하시고, 수주담당자와 연락하시기 바랍니다.")
	return
end if

if wf_update2(dw_2, dw_3, 'Y') = true then
	if ls_chk = 'Y' then	pb_retrieve.postevent(clicked!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_orsaleyspcon_m
integer x = 0
integer y = 360
integer width = 946
integer height = 760
string dataobject = "d_orsaleyspcon_s"
boolean hscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;string ls_order
long ll_row

ll_row = this.getrow()

if ll_row < 1 then return
ls_order = this.object.order_no[ll_row]

dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)

end event

type dw_2 from w_inheritance`dw_2 within w_orsaleyspcon_m
integer x = 951
integer y = 220
integer width = 2679
integer height = 900
integer taborder = 60
string dataobject = "d_orsaleyspcon_m"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_orsaleyspcon_m
integer y = 32
integer width = 1275
string text = "YSP 수주접수관리"
end type

type st_tips from w_inheritance`st_tips within w_orsaleyspcon_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleyspcon_m
integer x = 773
integer y = 220
integer width = 169
integer height = 128
integer taborder = 110
string picturename = "c:\bmp\retrieve.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event pb_compute::clicked;string ls_order
long ll_row
 
ls_order = TRIM(em_3.TEXT)

dw_2.setredraw(false)
dw_3.setredraw(false)
dw_2.reset()
dw_3.reset()
dw_2.retrieve(ls_order)
dw_3.retrieve(ls_order)

dw_2.setredraw(true)
dw_3.setredraw(true)

end event

type pb_print_part from w_inheritance`pb_print_part within w_orsaleyspcon_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_orsaleyspcon_m
integer x = 3406
integer y = 56
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleyspcon_m
integer x = 3022
integer y = 56
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
 
if dw_2.getrow() < 1 then return
string ls_order
long ll_row

ls_order = dw_2.object.order_no[1]
dw_4.retrieve(ls_order)


l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleyspcon_m
boolean visible = false
integer y = 56
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleyspcon_m
boolean visible = false
integer x = 2880
integer taborder = 170
string disabledname = "c:\bmp\delete.bmp"
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleyspcon_m
boolean visible = false
integer x = 2693
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleyspcon_m
integer x = 2830
integer y = 56
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_flag
date ld_start, ld_end

dw_1.setredraw(false)
dw_2.setredraw(false)
dw_3.setredraw(false)
dw_1.reset()
dw_2.reset()
dw_3.reset()
ls_flag = 'Y'

if rb_1.checked = true then ls_flag = 'N'

ld_start = date(em_1.text)
ld_end   = date(em_2.text)
dw_1.retrieve(ls_flag, ld_start, ld_end)
dw_1.setredraw(true)
dw_2.setredraw(true)
dw_3.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_orsaleyspcon_m
boolean visible = false
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleyspcon_m
integer x = 1440
integer y = 32
integer width = 1307
integer height = 152
integer taborder = 120
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleyspcon_m
integer x = 2802
integer width = 823
end type

type rb_1 from radiobutton within w_orsaleyspcon_m
integer x = 1481
integer y = 84
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "대기"
boolean checked = true
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type rb_2 from radiobutton within w_orsaleyspcon_m
integer x = 1701
integer y = 84
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "완료"
end type

event clicked;pb_retrieve.postevent(clicked!)
end event

type dw_3 from datawindow within w_orsaleyspcon_m
integer x = 5
integer y = 1128
integer width = 3625
integer height = 984
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_orsaleyspcon_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;integer ll_row

this.Accepttext()
ll_row = this.getrow()

choose case dwo.name
	case 'chk'	
		if data = 'N' then
			this.object.sol_qty[ll_row] = this.getitemnumber(ll_row, "sol_qty", Primary!, TRUE)
			this.object.saledet_text[ll_row] = this.getitemstring(ll_row, "saledet_text", Primary!, TRUE)
		else
			this.object.sol_qty[ll_row] = this.object.order_qty[ll_row] - this.object.rlse_qty[ll_row]
			this.object.saledet_text[ll_row] = 'X'
	   end if
end choose


end event

type dw_4 from datawindow within w_orsaleyspcon_m
integer x = 1335
integer y = 84
integer width = 78
integer height = 64
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_orsaleyspcon_r"
boolean livescroll = true
end type

type em_2 from editmask within w_orsaleyspcon_m
integer x = 2363
integer y = 80
integer width = 357
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_orsaleyspcon_m
integer x = 2313
integer y = 92
integer width = 46
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsaleyspcon_m
integer x = 1947
integer y = 80
integer width = 357
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
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

type em_3 from editmask within w_orsaleyspcon_m
event keydown pbm_dwnkey
integer x = 288
integer y = 240
integer width = 480
integer height = 80
integer taborder = 100
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
string mask = "!!########-###"
boolean autoskip = true
end type

event keydown;IF keydown(KeyEnter! ) THEN
	IF keyflags = 0 THEN
		pb_cancel.postevent(clicked!)
	END IF

END IF



end event

type st_3 from statictext within w_orsaleyspcon_m
integer x = 9
integer y = 240
integer width = 274
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "수주번호"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

