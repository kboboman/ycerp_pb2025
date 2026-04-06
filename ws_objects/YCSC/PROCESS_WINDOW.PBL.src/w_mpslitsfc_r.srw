$PBExportHeader$w_mpslitsfc_r.srw
$PBExportComments$일별 코일입고 현황(2001/05/02,이인호)
forward
global type w_mpslitsfc_r from w_inheritance
end type
type st_1 from statictext within w_mpslitsfc_r
end type
type em_1 from editmask within w_mpslitsfc_r
end type
type em_2 from editmask within w_mpslitsfc_r
end type
type rb_1 from radiobutton within w_mpslitsfc_r
end type
type rb_3 from radiobutton within w_mpslitsfc_r
end type
type rb_4 from radiobutton within w_mpslitsfc_r
end type
type ddlb_1 from dropdownlistbox within w_mpslitsfc_r
end type
type rb_2 from radiobutton within w_mpslitsfc_r
end type
type pb_1 from picturebutton within w_mpslitsfc_r
end type
type gb_4 from groupbox within w_mpslitsfc_r
end type
end forward

global type w_mpslitsfc_r from w_inheritance
integer width = 4681
integer height = 2796
string title = "일별코일 입고현황(w_mpslitsfc_r)"
st_1 st_1
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_3 rb_3
rb_4 rb_4
ddlb_1 ddlb_1
rb_2 rb_2
pb_1 pb_1
gb_4 gb_4
end type
global w_mpslitsfc_r w_mpslitsfc_r

type variables
st_print i_print
date id_start, id_end
string is_wc = 'W'
end variables

on w_mpslitsfc_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_3=create rb_3
this.rb_4=create rb_4
this.ddlb_1=create ddlb_1
this.rb_2=create rb_2
this.pb_1=create pb_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.rb_4
this.Control[iCurrent+7]=this.ddlb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.gb_4
end on

on w_mpslitsfc_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.ddlb_1)
destroy(this.rb_2)
destroy(this.pb_1)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.insertrow(0)
dw_2.visible = false
em_1.text = string(today(), "YYYY/MM/DD")
em_2.text = string(today(), "YYYY/MM/DD")
ddlb_1.text = '원코일'

rb_1.enabled = false
rb_2.enabled = true
rb_2.checked = true
rb_2.triggerevent(clicked!)
rb_3.enabled = false

end event

event resize;call super::resize;//
gb_3.width  = this.width  - 105
gb_3.height = this.height - 364

dw_1.width  = this.width  - 187
dw_1.height = this.height - 452


end event

type pb_save from w_inheritance`pb_save within w_mpslitsfc_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpslitsfc_r
integer x = 69
integer y = 296
integer width = 4494
integer height = 2344
integer taborder = 30
string dataobject = "d_mpslitsfc_wt1"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_mpslitsfc_r
integer x = 1454
integer y = 8
integer width = 160
integer height = 120
integer taborder = 40
string dataobject = "d_mpslitsfc_wr1"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpslitsfc_r
integer x = 32
integer width = 1362
integer height = 136
string text = "일별코일 입고현황"
end type

type st_tips from w_inheritance`st_tips within w_mpslitsfc_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpslitsfc_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpslitsfc_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpslitsfc_r
integer x = 4384
integer y = 64
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpslitsfc_r
integer x = 3991
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

dw_2.SetTransObject(SQLCA)
dw_1.sharedata(dw_2)

//dw_2.SetTransObject(SQLCA)
//dw_2.Retrieve()
//dw_2.sharedata(dw_1)

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 일별 코일작업현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpslitsfc_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpslitsfc_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mpslitsfc_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpslitsfc_r
integer x = 3799
integer y = 64
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end

ld_start = date(em_1.text)
ld_end = date(em_2.text)

dw_1.reset()
dw_1.SetTransObject(SQLCA)
if is_wc = 'W' and rb_2.checked = true then
	if gs_team = "12000" then
		dw_1.retrieve( ld_start, ld_end, "S")
	else
		dw_1.retrieve( ld_start, ld_end, LeftA(gs_area,1))
   end if
else
	dw_1.retrieve( ld_start, ld_end)
end if
if dw_1.rowcount() < 1 then
	messagebox("에러","해당일에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpslitsfc_r
integer x = 32
integer y = 240
integer width = 4576
integer height = 2432
integer taborder = 80
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_mpslitsfc_r
integer x = 2802
integer y = 16
integer width = 942
integer height = 212
integer taborder = 0
integer textsize = -10
long textcolor = 0
string text = "구분"
end type

type gb_1 from w_inheritance`gb_1 within w_mpslitsfc_r
integer x = 3762
integer y = 16
integer width = 841
integer height = 212
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type st_1 from statictext within w_mpslitsfc_r
integer x = 2254
integer y = 88
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

type em_1 from editmask within w_mpslitsfc_r
integer x = 1838
integer y = 100
integer width = 407
integer height = 76
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

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpslitsfc_r
integer x = 2331
integer y = 100
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

event modified;id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_mpslitsfc_r
integer x = 3209
integer y = 64
integer width = 247
integer height = 60
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
boolean checked = true
end type

event clicked;CHOOSE CASE is_wc
	CASE 'W'
		dw_1.dataobject = 'd_mpslitsfc_wt'
		dw_2.dataobject = 'd_mpslitsfc_wr'
	CASE 'C'
		dw_1.dataobject = 'd_mpslitsfc_t'
		dw_2.dataobject = 'd_mpslitsfc_r'
END CHOOSE


end event

type rb_3 from radiobutton within w_mpslitsfc_r
integer x = 3209
integer y = 148
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주"
end type

event clicked;CHOOSE CASE is_wc
	CASE 'W'
		dw_1.dataobject = 'd_mpslitsfc_wt2'
		dw_2.dataobject = 'd_mpslitsfc_wr2'
	CASE 'C'
		dw_1.dataobject = 'd_mpslitsfc_t2'
		dw_2.dataobject = 'd_mpslitsfc_r2'
END CHOOSE

end event

type rb_4 from radiobutton within w_mpslitsfc_r
integer x = 3470
integer y = 148
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "구매"
end type

event clicked;dw_1.dataobject = 'd_mpslitsfc_t3'
dw_2.dataobject = 'd_mpslitsfc_r3'
end event

type ddlb_1 from dropdownlistbox within w_mpslitsfc_r
integer x = 2839
integer y = 92
integer width = 334
integer height = 332
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"원코일","스리팅"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		is_wc = 'W'
		rb_1.enabled = false
		rb_2.enabled = true
		rb_2.checked = true
		rb_2.triggerevent(clicked!)
		rb_3.enabled = false
	CASE 2
		is_wc = 'C'
		rb_1.enabled = true
		rb_1.checked = true
		rb_1.triggerevent(clicked!)
		rb_2.enabled = true
		rb_3.enabled = true
END CHOOSE

end event

type rb_2 from radiobutton within w_mpslitsfc_r
integer x = 3470
integer y = 64
integer width = 233
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사내"
end type

event clicked;CHOOSE CASE is_wc
	CASE 'W'
		dw_1.dataobject = 'd_mpslitsfc_wt1'
		dw_2.dataobject = 'd_mpslitsfc_wr1'
	CASE 'C'
		dw_1.dataobject = 'd_mpslitsfc_t1'
		dw_2.dataobject = 'd_mpslitsfc_r1'
END CHOOSE

end event

type pb_1 from picturebutton within w_mpslitsfc_r
event mousemove pbm_mousemove
integer x = 4183
integer y = 64
integer width = 187
integer height = 144
integer taborder = 140
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

type gb_4 from groupbox within w_mpslitsfc_r
integer x = 1797
integer y = 16
integer width = 987
integer height = 212
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "입고일자"
end type

