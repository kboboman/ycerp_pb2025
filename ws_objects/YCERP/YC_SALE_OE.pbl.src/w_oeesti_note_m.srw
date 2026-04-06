$PBExportHeader$w_oeesti_note_m.srw
$PBExportComments$견적서 관리(NOTE관리)(2001/02/19,이인호)
forward 
global type w_oeesti_note_m from w_inheritance
end type
type gb_5 from groupbox within w_oeesti_note_m
end type
type gb_4 from groupbox within w_oeesti_note_m
end type
type rb_1 from radiobutton within w_oeesti_note_m
end type
type rb_2 from radiobutton within w_oeesti_note_m
end type
type st_1 from statictext within w_oeesti_note_m
end type
type st_2 from statictext within w_oeesti_note_m
end type
type rb_3 from radiobutton within w_oeesti_note_m
end type
type rb_4 from radiobutton within w_oeesti_note_m
end type
type st_3 from statictext within w_oeesti_note_m
end type
type rb_5 from radiobutton within w_oeesti_note_m
end type
type rb_6 from radiobutton within w_oeesti_note_m
end type
type rb_7 from radiobutton within w_oeesti_note_m
end type
type st_4 from statictext within w_oeesti_note_m
end type
type ddlb_1 from dropdownlistbox within w_oeesti_note_m
end type
type sle_1 from singlelineedit within w_oeesti_note_m
end type
type sle_2 from singlelineedit within w_oeesti_note_m
end type
type st_5 from statictext within w_oeesti_note_m
end type
type ddlb_2 from dropdownlistbox within w_oeesti_note_m
end type
end forward

global type w_oeesti_note_m from w_inheritance
integer x = 690
integer y = 188
integer width = 2281
integer height = 1640
string title = "견적서 NOTE(w_oeesti_note_m)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
gb_5 gb_5
gb_4 gb_4
rb_1 rb_1
rb_2 rb_2
st_1 st_1
st_2 st_2
rb_3 rb_3
rb_4 rb_4
st_3 st_3
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
st_4 st_4
ddlb_1 ddlb_1
sle_1 sle_1
sle_2 sle_2
st_5 st_5
ddlb_2 ddlb_2
end type
global w_oeesti_note_m w_oeesti_note_m

type variables
gs_where istr_where

end variables

forward prototypes
public subroutine wf_ret ()
public function boolean wf_check ()
end prototypes

public subroutine wf_ret ();	
	CHOOSE CASE MidA(dw_1.object.note[1],10)
		CASE rb_1.text
			rb_1.checked = true
			rb_2.checked = false
		CASE rb_2.text
			rb_2.checked = true
			rb_1.checked = false
		CASE ELSE
			rb_1.checked = true
	END CHOOSE
	if dw_1.rowcount() > 1 then
		//2. 운반비 : 포함
		CHOOSE CASE MidA(dw_1.object.note[2],13)
			CASE rb_3.text
				rb_3.checked = true
				rb_4.checked = false
			CASE rb_4.text
				rb_4.checked = true
				rb_3.checked = false
			CASE ELSE
				rb_3.checked = true
		END CHOOSE
		if dw_1.rowcount() > 2 then
			//3. 결재조건 : 현금
			CHOOSE CASE trim(MidA(dw_1.object.note[3],15))
				CASE rb_5.text
					rb_5.checked = true
					rb_6.checked = false
					rb_7.checked = false
				CASE rb_6.text
					rb_6.checked = true
					rb_5.checked = false
					rb_7.checked = false
				CASE rb_7.text
					rb_7.checked = true
					rb_6.checked = false
					rb_5.checked = false
				CASE ELSE
					rb_5.checked = true
			END CHOOSE
			
			if dw_1.rowcount() > 3 then
				//4. 견적유효기간 : 발행일로부터 3개월 이내
				string ls_text
				int li_int1, li_int2, li_int3
				
				ls_text = dw_1.object.note[4]
				li_int1 = PosA(ls_text,':')
				for li_int3 = 1 to 10
					li_int2 = PosA(ls_text,string(li_int3), li_int1 + 2)
					if li_int2 <> 0 then
						exit
					end if
				next
				sle_1.text = MidA(ls_text, li_int1 + 2 , li_int2 - li_int1 - 3)
				if MidA(ls_text, li_int2 + 1, 1 ) = '1' or MidA(ls_text, li_int2 + 1, 1 ) = '2' then
					li_int3 = 2
				else
					li_int3 = 1
				end if
				sle_2.text = MidA(ls_text, li_int2 + li_int3 )
				ddlb_1.text = trim(MidA(ls_text, li_int2 , li_int3))
			end if
		end if
	end if



end subroutine

public function boolean wf_check ();string ls_esti_flag

select esti_flag into :ls_esti_flag from estimate_head
 where estimate_no = :istr_where.str1;
if ls_esti_flag = 'Y' then
	messagebox("확인","견적서가 이미 결재된 견적서입니다.")
	return false
end if
return true

end function

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

//this.x = 1
//this.y = 1
dw_1.SetTransObject(SQLCA)
istr_where = Message.PowerObjectParm

//int li_cnt
//
//w_oigiupdate_m.dw_1.accepttext()
//w_oigiupdate_m.dw_5.accepttext()
//dw_1.object.cust_no[1] = w_oigiupdate_m.dw_1.object.cust_no[1]
//dw_1.object.scene_code[1] = w_oigiupdate_m.dw_1.object.scene_code[1]
//
if dw_1.retrieve(istr_where.str1) < 1 then
	
	dw_1.object.estimate_no[1] = istr_where.str1
	dw_1.object.seq_no[1] = 1
	dw_1.object.note[1] = trim(st_1.text) + " " + rb_1.text
	
	dw_1.object.estimate_no[2] = istr_where.str1
	dw_1.object.seq_no[2] = 2
	dw_1.object.note[2] = trim(st_2.text) + " " + rb_3.text
	
	dw_1.object.estimate_no[3] = istr_where.str1
	dw_1.object.seq_no[3] = 3
	dw_1.object.note[3] = trim(st_3.text) + " " + rb_5.text
	
	dw_1.object.estimate_no[4] = istr_where.str1
	dw_1.object.seq_no[4] = 4
	ddlb_1.selectitem(1)
	dw_1.object.note[4] = trim(st_4.text) + " " + sle_1.text + " " + ddlb_1.text + sle_2.text

	dw_1.object.estimate_no[5] = istr_where.str1
	dw_1.object.seq_no[5] = 5
	ddlb_2.selectitem(1)
	dw_1.object.note[5] = trim(st_5.text) + " " + ddlb_2.text
	
	wf_update1(dw_1, "N")
else
	wf_ret()
END IF
dw_1.accepttext()
//	
//
end event

on w_oeesti_note_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.gb_4=create gb_4
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_1=create st_1
this.st_2=create st_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_3=create st_3
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.st_4=create st_4
this.ddlb_1=create ddlb_1
this.sle_1=create sle_1
this.sle_2=create sle_2
this.st_5=create st_5
this.ddlb_2=create ddlb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.rb_4
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.rb_5
this.Control[iCurrent+11]=this.rb_6
this.Control[iCurrent+12]=this.rb_7
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.ddlb_1
this.Control[iCurrent+15]=this.sle_1
this.Control[iCurrent+16]=this.sle_2
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.ddlb_2
end on

on w_oeesti_note_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_3)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.st_4)
destroy(this.ddlb_1)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.st_5)
destroy(this.ddlb_2)
end on

type pb_save from w_inheritance`pb_save within w_oeesti_note_m
integer x = 1824
integer y = 44
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if wf_check() = false then return
wf_update1(dw_1, "Y")

end event

type dw_1 from w_inheritance`dw_1 within w_oeesti_note_m
integer x = 37
integer y = 668
integer width = 2199
integer height = 864
string dataobject = "d_oeesti_m2"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oeesti_note_m
integer x = 23
integer y = 40
integer width = 759
string text = "견적서 NOTE"
end type

type st_tips from w_inheritance`st_tips within w_oeesti_note_m
end type

type pb_compute from w_inheritance`pb_compute within w_oeesti_note_m
integer x = 841
integer y = 44
integer width = 238
integer taborder = 130
string text = "RESET"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;if wf_check() = false then return
LONG ll_row

dw_1.accepttext()
for ll_row = 1 to dw_1.rowcount()
	DW_1.DELETEROW(0)
next
dw_1.object.estimate_no[1] = istr_where.str1
dw_1.object.seq_no[1] = 1
dw_1.object.note[1] = trim(st_1.text) + " " + rb_1.text
rb_1.checked = true
rb_2.checked = false

dw_1.object.estimate_no[2] = istr_where.str1
dw_1.object.seq_no[2] = 2
dw_1.object.note[2] = trim(st_2.text) + " " + rb_3.text
rb_3.checked = true
rb_4.checked = false

dw_1.object.estimate_no[3] = istr_where.str1
dw_1.object.seq_no[3] = 3
dw_1.object.note[3] = trim(st_3.text) + " " + rb_5.text
rb_5.checked = true
rb_6.checked = false
rb_7.checked = false

dw_1.object.estimate_no[4] = istr_where.str1
dw_1.object.seq_no[4] = 4
ddlb_1.selectitem(3)
dw_1.object.note[4] = trim(st_4.text) + " " + sle_1.text + " " + ddlb_1.text + sle_2.text

dw_1.object.estimate_no[5] = istr_where.str1
dw_1.object.seq_no[5] = 5
ddlb_2.selectitem(1)
dw_1.object.note[5] = trim(st_5.text) + " " + ddlb_2.text


end event

type pb_print_part from w_inheritance`pb_print_part within w_oeesti_note_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oeesti_note_m
integer x = 2016
integer y = 44
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oeesti_note_m
boolean visible = false
integer x = 2830
integer y = 60
integer taborder = 150
end type

type pb_cancel from w_inheritance`pb_cancel within w_oeesti_note_m
boolean visible = false
integer x = 2638
integer y = 60
integer taborder = 160
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

type pb_delete from w_inheritance`pb_delete within w_oeesti_note_m
integer x = 1632
integer y = 44
integer taborder = 170
end type

event pb_delete::clicked;if wf_check() = false then return
dw_1.accepttext()
dw_1.deleterow(dw_1.getrow())
end event

type pb_insert from w_inheritance`pb_insert within w_oeesti_note_m
integer x = 1440
integer y = 44
integer taborder = 190
end type

event pb_insert::clicked;if wf_check() = false then return

long ll_row

ll_row = dw_1.insertrow(0)
dw_1.object.estimate_no[ll_row] = istr_where.str1
dw_1.object.seq_no[ll_row] = ll_row

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oeesti_note_m
integer x = 1248
integer y = 44
integer taborder = 180
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.retrieve(istr_where.str1) > 0 then
	wf_ret()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oeesti_note_m
integer x = 1600
integer y = 212
integer width = 635
integer height = 116
integer taborder = 100
integer textsize = -8
integer weight = 400
long backcolor = 79220952
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_oeesti_note_m
integer x = 375
integer y = 212
integer width = 562
integer height = 116
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
boolean enabled = false
end type

type gb_1 from w_inheritance`gb_1 within w_oeesti_note_m
integer x = 818
integer y = 4
integer width = 1422
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oeesti_note_m
boolean visible = false
integer x = 23
integer y = 404
integer width = 2665
integer height = 1496
boolean border = false
end type

type gb_5 from groupbox within w_oeesti_note_m
integer x = 37
integer y = 324
integer width = 2199
integer height = 328
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
boolean enabled = false
end type

type gb_4 from groupbox within w_oeesti_note_m
boolean visible = false
integer x = 37
integer y = 896
integer width = 3392
integer height = 1040
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79220952
end type

type rb_1 from radiobutton within w_oeesti_note_m
integer x = 425
integer y = 252
integer width = 238
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
string text = "별도"
end type

event clicked;dw_1.object.estimate_no[1] = istr_where.str1
dw_1.object.seq_no[1] = 1
dw_1.object.note[1] = trim(st_1.text) + " " + this.text
rb_2.checked = false

end event

type rb_2 from radiobutton within w_oeesti_note_m
integer x = 681
integer y = 252
integer width = 238
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
string text = "포함"
boolean checked = true
end type

event clicked;dw_1.object.estimate_no[1] = istr_where.str1
dw_1.object.seq_no[1] = 1
dw_1.object.note[1] = trim(st_1.text) + " " + this.text
rb_1.checked = false

end event

type st_1 from statictext within w_oeesti_note_m
integer x = 87
integer y = 256
integer width = 270
integer height = 52
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
string text = "1. VAT :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oeesti_note_m
integer x = 1221
integer y = 256
integer width = 366
integer height = 52
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
string text = "2. 운반비 :"
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_oeesti_note_m
integer x = 1655
integer y = 252
integer width = 238
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
string text = "별도"
boolean checked = true
end type

event clicked;dw_1.object.estimate_no[2] = istr_where.str1
dw_1.object.seq_no[2] = 2
dw_1.object.note[2] = trim(st_2.text) + " " + this.text
rb_4.checked = false

end event

type rb_4 from radiobutton within w_oeesti_note_m
integer x = 1938
integer y = 252
integer width = 238
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
string text = "포함"
end type

event clicked;dw_1.object.estimate_no[2] = istr_where.str1
dw_1.object.seq_no[2] = 2
dw_1.object.note[2] = trim(st_2.text) + " " + this.text
rb_3.checked = false

end event

type st_3 from statictext within w_oeesti_note_m
integer x = 87
integer y = 364
integer width = 430
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
string text = "3. 결재조건 :"
boolean focusrectangle = false
end type

type rb_5 from radiobutton within w_oeesti_note_m
integer x = 576
integer y = 364
integer width = 256
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
string text = "현금"
boolean checked = true
end type

event clicked;dw_1.object.estimate_no[3] = istr_where.str1
dw_1.object.seq_no[3] = 3
dw_1.object.note[3] = trim(st_3.text) + " " + this.text
rb_6.checked = false
rb_7.checked = false

end event

type rb_6 from radiobutton within w_oeesti_note_m
integer x = 859
integer y = 364
integer width = 480
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
string text = "현금(선입금)"
end type

event clicked;dw_1.object.estimate_no[3] = istr_where.str1
dw_1.object.seq_no[3] = 3
dw_1.object.note[3] = trim(st_3.text) + " " + this.text
rb_5.checked = false
rb_7.checked = false

end event

type rb_7 from radiobutton within w_oeesti_note_m
integer x = 1353
integer y = 364
integer width = 256
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
string text = "어음"
end type

event clicked;dw_1.object.estimate_no[3] = istr_where.str1
dw_1.object.seq_no[3] = 3
dw_1.object.note[3] = trim(st_3.text) + " " + this.text
rb_5.checked = false
rb_6.checked = false

end event

type st_4 from statictext within w_oeesti_note_m
integer x = 87
integer y = 464
integer width = 558
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
string text = "4. 견적유효기간 :"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_oeesti_note_m
integer x = 1326
integer y = 448
integer width = 219
integer height = 936
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"1","2","3","4","5","6","7","8","9","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.object.estimate_no[4] = istr_where.str1
dw_1.object.seq_no[4] = 4
dw_1.object.note[4] = trim(st_4.text) + " " + sle_1.text + " " + ddlb_1.text + sle_2.text

end event

type sle_1 from singlelineedit within w_oeesti_note_m
integer x = 649
integer y = 452
integer width = 663
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "발행일로부터"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;dw_1.object.estimate_no[4] = istr_where.str1
dw_1.object.seq_no[4] = 4
dw_1.object.note[4] = trim(st_4.text) + " " + sle_1.text + " " + ddlb_1.text + sle_2.text

end event

type sle_2 from singlelineedit within w_oeesti_note_m
integer x = 1550
integer y = 452
integer width = 640
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
string text = "개월 이내"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;dw_1.object.estimate_no[4] = istr_where.str1
dw_1.object.seq_no[4] = 4
dw_1.object.note[4] = trim(st_4.text) + " " + sle_1.text + " " + ddlb_1.text + sle_2.text

end event

type st_5 from statictext within w_oeesti_note_m
integer x = 87
integer y = 552
integer width = 439
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
string text = "5. 입금계좌 :"
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_oeesti_note_m
integer x = 535
integer y = 540
integer width = 1659
integer height = 416
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"신한은행 100-026-786071 (주)유창","신한은행 100-026-794163 (주)유창"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.object.estimate_no[5] = istr_where.str1
dw_1.object.seq_no[5] = 5
dw_1.object.note[5] = trim(st_5.text) + " " + ddlb_2.text

end event

