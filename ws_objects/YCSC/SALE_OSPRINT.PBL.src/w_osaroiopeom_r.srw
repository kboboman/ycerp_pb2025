$PBExportHeader$w_osaroiopeom_r.srw
$PBExportComments$매출거래처 이력
forward
global type w_osaroiopeom_r from w_inheritance
end type
type em_1 from editmask within w_osaroiopeom_r
end type
type st_1 from statictext within w_osaroiopeom_r
end type
type dw_3 from datawindow within w_osaroiopeom_r
end type
type st_2 from statictext within w_osaroiopeom_r
end type
type rb_1 from radiobutton within w_osaroiopeom_r
end type
type rb_2 from radiobutton within w_osaroiopeom_r
end type
type rb_all from radiobutton within w_osaroiopeom_r
end type
type cbx_1 from checkbox within w_osaroiopeom_r
end type
end forward

global type w_osaroiopeom_r from w_inheritance
integer width = 4352
integer height = 2156
string title = "거래처별 매출이력(w_osaroiopeom_r)"
em_1 em_1
st_1 st_1
dw_3 dw_3
st_2 st_2
rb_1 rb_1
rb_2 rb_2
rb_all rb_all
cbx_1 cbx_1
end type
global w_osaroiopeom_r w_osaroiopeom_r

type variables
datawindowchild idwc_user
end variables

on w_osaroiopeom_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_all=create rb_all
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.rb_all
this.Control[iCurrent+8]=this.cbx_1
end on

on w_osaroiopeom_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_all)
destroy(this.cbx_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
datetime ldt_date

dw_2.visible = false
SELECT top 1 dateadd(year, -1, getdate()) INTO :ldt_date FROM login;

em_1.text = string(ldt_date,"yyyy/mm/01")

// 담당자
dw_3.settransobject(sqlca)
dw_3.insertrow(1)

dw_3.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_3.object.user[1] = '%'

pb_retrieve.PostEvent(Clicked!)

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

end event

type pb_save from w_inheritance`pb_save within w_osaroiopeom_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_osaroiopeom_r
integer x = 32
integer y = 416
integer width = 4242
integer height = 1600
integer taborder = 60
string dataobject = "d_osaroiopeom_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return

this.SelectRow(0,  false)
this.SelectRow(row,  true)

this.scrolltorow(row)

end event

type dw_2 from w_inheritance`dw_2 within w_osaroiopeom_r
integer x = 1339
integer y = 48
integer width = 128
integer height = 100
integer taborder = 0
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_osaroiopeom_r
integer x = 37
integer y = 40
integer width = 1257
integer height = 144
string text = "거래처별 매출이력"
end type

type st_tips from w_inheritance`st_tips within w_osaroiopeom_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroiopeom_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroiopeom_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_osaroiopeom_r
integer x = 4050
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroiopeom_r
integer x = 3858
integer taborder = 40
string picturename = "CrossTab!"
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
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

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroiopeom_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_osaroiopeom_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_osaroiopeom_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroiopeom_r
integer x = 3666
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_year, ls_month, ls_userid
st_security lst_security

dw_1.reset() ; dw_2.reset()

dw_3.AcceptText()
ls_userid = dw_3.object.user[1]

if em_1.text = '' then
	messagebox("확인","해당 년월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_date  = em_1.text
ls_year  = LeftA(ls_date, 4)
ls_month = RightA(ls_date, 2)

dw_1.retrieve( ls_date, ls_userid )
cbx_1.PostEvent( clicked! )

end event

type gb_3 from w_inheritance`gb_3 within w_osaroiopeom_r
integer x = 2478
integer y = 12
integer width = 1120
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osaroiopeom_r
integer y = 224
integer width = 4242
integer height = 172
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroiopeom_r
integer x = 3625
integer width = 645
integer taborder = 0
integer weight = 400
end type

type em_1 from editmask within w_osaroiopeom_r
integer x = 2505
integer y = 128
integer width = 398
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "T"
end type

event rbuttondown;//
OpenWithParm(w_calendar, Message.StringParm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_osaroiopeom_r
integer x = 2505
integer y = 48
integer width = 398
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_osaroiopeom_r
integer x = 2907
integer y = 128
integer width = 663
integer height = 76
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_osaroiopeom_r
integer x = 2912
integer y = 48
integer width = 658
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_osaroiopeom_r
integer x = 2757
integer y = 268
integer width = 741
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "잔액 ZERO"
end type

event clicked;// 잔액 ZERO
dw_1.setfilter( "balance_amt = 0" )
dw_1.filter()
dw_1.groupcalc()

end event

type rb_2 from radiobutton within w_osaroiopeom_r
integer x = 2757
integer y = 328
integer width = 741
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "잔액 ZERO 아닌업체"
end type

event clicked;// 잔액 ZERO 아닌업체
dw_1.setfilter( "balance_amt <> 0" )
dw_1.filter()
dw_1.groupcalc()

end event

type rb_all from radiobutton within w_osaroiopeom_r
integer x = 2501
integer y = 268
integer width = 242
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;// 전체
dw_1.setfilter( "" )
dw_1.filter()
dw_1.groupcalc()

end event

type cbx_1 from checkbox within w_osaroiopeom_r
integer x = 82
integer y = 284
integer width = 347
integer height = 68
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx

if this.checked = true then
	ls_colx = string(long(dw_1.object.balance_amt.x) + long(dw_1.object.balance_amt.width))
else
	ls_colx = "0"
end if
dw_1.object.datawindow.horizontalscrollsplit = ls_colx

end event

