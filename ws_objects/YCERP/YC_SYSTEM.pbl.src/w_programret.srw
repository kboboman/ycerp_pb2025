$PBExportHeader$w_programret.srw
$PBExportComments$프로그램 수정요청서(2000/02/03,이인호)
forward 
global type w_programret from w_inheritance
end type
type em_1 from editmask within w_programret
end type
type em_2 from editmask within w_programret
end type
type rb_1 from radiobutton within w_programret
end type
type rb_2 from radiobutton within w_programret
end type
end forward

global type w_programret from w_inheritance
integer x = 5
integer y = 136
integer width = 3643
integer height = 2156
string title = "프로그램 수정요청서(w_progranret)"
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
end type
global w_programret w_programret

type variables
string is_user = gs_userid, is_w = 'Y'
end variables

on w_programret.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
end on

on w_programret.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(RelativeDate(today(), -7),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

end event

type pb_save from w_inheritance`pb_save within w_programret
integer x = 3177
end type

event pb_save::clicked;wf_update1(dw_2,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_programret
integer y = 512
integer width = 471
integer height = 1508
string dataobject = "d_pgmreq_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;if row < 1 then return

dw_2.setredraw(false)
dw_2.reset()
this.scrolltorow(row)
this.SelectRow(0, false)
this.SelectRow(row, true)
dw_2.retrieve(is_user, date(dw_1.object.wdate[row]))
dw_2.setredraw(true)
end event

event dw_1::doubleclicked;call super::doubleclicked;if is_w = 'Y' then
	this.width = 471
else
	this.width = 3000
end if

end event

type st_title from w_inheritance`st_title within w_programret
integer y = 52
integer width = 1481
string text = "프로그램 수정요청서"
end type

type st_tips from w_inheritance`st_tips within w_programret
end type

type pb_compute from w_inheritance`pb_compute within w_programret
boolean visible = false
integer x = 1787
integer y = 56
end type

type pb_print_part from w_inheritance`pb_print_part within w_programret
boolean visible = false
integer x = 2939
integer y = 56
end type

type pb_close from w_inheritance`pb_close within w_programret
integer x = 3369
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_programret
integer x = 2985
end type

type pb_cancel from w_inheritance`pb_cancel within w_programret
boolean visible = false
integer x = 2555
integer y = 56
end type

type pb_delete from w_inheritance`pb_delete within w_programret
integer x = 2793
end type

event pb_delete::clicked;if dw_2.getrow() < 1 then return

dw_2.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_programret
integer x = 2601
end type

event pb_insert::clicked;long ll_row
int li_int
date ld_date

dw_2.reset()
ll_row = dw_2.insertrow(0)
ld_date = date(wf_today())
dw_2.object.user_id[ll_row] = gs_userid
dw_2.object.req_user[ll_row] = gs_userid
dw_2.object.req_team[ll_row] = gs_team
dw_2.object.req_date[ll_row] = ld_date
select max(seq_no) into :li_int from pgmreq
 where user_id = :gs_userid
   and req_date = :ld_date;
if isnull(li_int) then li_int = 0
dw_2.object.seq_no[ll_row] = li_int + 1
dw_2.object.proc_flag[ll_row] = 'A'


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_programret
integer x = 421
integer y = 308
integer width = 133
integer height = 112
end type

event pb_retrieve::clicked;dw_2.setredraw(false)
dw_2.reset()
dw_2.setredraw(true)
dw_1.retrieve(is_user, date(em_1.text), date(em_2.text))
end event

type gb_3 from w_inheritance`gb_3 within w_programret
integer x = 581
integer y = 216
integer width = 3003
integer height = 1816
end type

type gb_2 from w_inheritance`gb_2 within w_programret
integer y = 216
integer width = 535
integer height = 1816
end type

type gb_1 from w_inheritance`gb_1 within w_programret
integer x = 2565
integer width = 1024
end type

type dw_2 from w_inheritance`dw_2 within w_programret
integer x = 599
integer y = 260
integer width = 2971
integer height = 1752
string dataobject = "d_pgmreq_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type em_1 from editmask within w_programret
integer x = 50
integer y = 260
integer width = 347
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

type em_2 from editmask within w_programret
integer x = 69
integer y = 340
integer width = 347
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

type rb_1 from radiobutton within w_programret
integer x = 50
integer y = 424
integer width = 279
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "내자료"
boolean checked = true
end type

event clicked;is_user = gs_userid
rb_1.textcolor = rgb(0,0,255)
rb_2.textcolor = rgb(0,0,0)
dw_2.setredraw(false)
dw_2.reset()
dw_2.setredraw(true)

end event

type rb_2 from radiobutton within w_programret
integer x = 334
integer y = 424
integer width = 210
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
string text = "전체"
end type

event clicked;is_user = '%'
rb_1.textcolor = rgb(0,0,0)
rb_2.textcolor = rgb(0,0,255)
dw_2.setredraw(false)
dw_2.reset()
dw_2.setredraw(true)

end event

