$PBExportHeader$w_mpslitsfc2_r.srw
$PBExportComments$스리팅작업일보조회(2001/06/26,이인호)
forward
global type w_mpslitsfc2_r from w_inheritance
end type
type st_1 from statictext within w_mpslitsfc2_r
end type
type em_1 from editmask within w_mpslitsfc2_r
end type
type em_2 from editmask within w_mpslitsfc2_r
end type
type rb_1 from radiobutton within w_mpslitsfc2_r
end type
type rb_2 from radiobutton within w_mpslitsfc2_r
end type
type pb_1 from picturebutton within w_mpslitsfc2_r
end type
type rb_3 from radiobutton within w_mpslitsfc2_r
end type
end forward

global type w_mpslitsfc2_r from w_inheritance
integer width = 4649
integer height = 2768
string title = "스리팅 작업일보 현황(w_mpslitsfc2_r)"
st_1 st_1
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
pb_1 pb_1
rb_3 rb_3
end type
global w_mpslitsfc2_r w_mpslitsfc2_r

type variables
st_print i_print
date id_start, id_end
string is_oi = 'I'
end variables

on w_mpslitsfc2_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.pb_1=create pb_1
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.rb_3
end on

on w_mpslitsfc2_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.pb_1)
destroy(this.rb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.insertrow(0)
dw_2.visible = false
em_1.text    = string(today(), "YYYY/MM/DD")
em_2.text    = string(today(), "YYYY/MM/DD")


end event

event resize;call super::resize;//
gb_3.width  = this.width  - 114
gb_3.height = this.height - 384

dw_1.width  = this.width  - 183
dw_1.height = this.height - 468


end event

type pb_save from w_inheritance`pb_save within w_mpslitsfc2_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpslitsfc2_r
integer x = 69
integer y = 300
integer width = 4466
integer height = 2300
integer taborder = 30
string title = "d_mpslitsfc2_t2"
string dataobject = "d_mpslitsfc2_t"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if this.rowcount() < 1 then return

this.scrolltorow(row)
end event

type dw_2 from w_inheritance`dw_2 within w_mpslitsfc2_r
integer x = 1403
integer y = 16
integer width = 142
integer height = 108
integer taborder = 40
string dataobject = "d_mpslitsfc2_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpslitsfc2_r
integer x = 37
integer width = 1440
integer height = 136
string text = "스리팅 작업일보 현황"
end type

type st_tips from w_inheritance`st_tips within w_mpslitsfc2_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpslitsfc2_r
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpslitsfc2_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpslitsfc2_r
integer x = 4352
integer y = 64
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpslitsfc2_r
integer x = 3954
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


i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 스리팅 생산계획 현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpslitsfc2_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_mpslitsfc2_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_mpslitsfc2_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpslitsfc2_r
integer x = 3762
integer y = 64
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_flag
date   ld_start, ld_end

if rb_1.checked = true then		// 전체
	ls_flag = "%"
elseif rb_2.checked = true then	// 사내
	ls_flag = "I"
elseif rb_3.checked = true then	// 외주
	ls_flag = "O"
end if

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

dw_1.reset()
dw_1.retrieve( ld_start, ld_end, ls_flag )
dw_1.sharedata(dw_2)

if dw_1.rowcount() < 1 then
	messagebox("확인","해당일에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpslitsfc2_r
integer x = 37
integer y = 244
integer width = 4535
integer height = 2384
integer taborder = 80
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpslitsfc2_r
integer x = 2729
integer y = 20
integer width = 974
integer height = 204
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpslitsfc2_r
integer x = 3721
integer y = 20
integer width = 850
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type st_1 from statictext within w_mpslitsfc2_r
integer x = 3177
integer y = 124
integer width = 73
integer height = 76
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_1 from editmask within w_mpslitsfc2_r
integer x = 2766
integer y = 136
integer width = 407
integer height = 76
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

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpslitsfc2_r
integer x = 3255
integer y = 136
integer width = 407
integer height = 76
integer taborder = 90
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

event modified;id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_mpslitsfc2_r
integer x = 2766
integer y = 64
integer width = 224
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;//
dw_1.dataobject = "d_mpslitsfc2_t"
dw_1.SetTransObject(SQLCA)

end event

type rb_2 from radiobutton within w_mpslitsfc2_r
integer x = 3017
integer y = 64
integer width = 224
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "사내"
end type

type pb_1 from picturebutton within w_mpslitsfc2_r
event mousemove pbm_mousemove
integer x = 4142
integer y = 64
integer width = 187
integer height = 144
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type rb_3 from radiobutton within w_mpslitsfc2_r
integer x = 3273
integer y = 64
integer width = 224
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "외주"
end type

