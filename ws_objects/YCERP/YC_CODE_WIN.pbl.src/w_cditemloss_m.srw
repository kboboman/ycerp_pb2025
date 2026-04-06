$PBExportHeader$w_cditemloss_m.srw
$PBExportComments$LOSS코드관리(2001/06/23,이인호)
forward
global type w_cditemloss_m from w_inheritance
end type
type rb_1 from radiobutton within w_cditemloss_m
end type
type rb_2 from radiobutton within w_cditemloss_m
end type
type rb_3 from radiobutton within w_cditemloss_m
end type
type rb_4 from radiobutton within w_cditemloss_m
end type
type sle_1 from singlelineedit within w_cditemloss_m
end type
type st_3 from statictext within w_cditemloss_m
end type
type ddlb_fld from dropdownlistbox within w_cditemloss_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cditemloss_m
end type
type st_4 from statictext within w_cditemloss_m
end type
type sle_value from singlelineedit within w_cditemloss_m
end type
type cb_1 from commandbutton within w_cditemloss_m
end type
type cb_2 from commandbutton within w_cditemloss_m
end type
type cb_3 from commandbutton within w_cditemloss_m
end type
type cb_5 from commandbutton within w_cditemloss_m
end type
type ddlb_op from dropdownlistbox within w_cditemloss_m
end type
end forward

global type w_cditemloss_m from w_inheritance
integer x = 320
integer y = 552
integer width = 3095
integer height = 1636
string title = "로스물품 관리(w_cditemloss_m)"
boolean center = true
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
sle_1 sle_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
end type
global w_cditemloss_m w_cditemloss_m

type variables
datawindowchild idwc_item


end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	long ll_Y ; string ls_value, ls_val[]
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	for ll_Y = 1 to ddlb_dwtitles.totalitems()
		ls_value  = ddlb_dwtitles.text( ll_Y )

		GF_Split(ls_value, "|", ls_val)		
		dw_1.Modify( ls_val[3] + ".Protect=1")
	next
end if

dw_2.visible = false
//dw_1.getchild("loss_item", idwc_item)
//gs_ds_itemall.ShareData(idwc_item)
sle_1.enabled = false

//idwc_item.setfilter("mid(item_no,1,2) = 'M3' and mid(item_no,6,1) = 'L'")
//idwc_item.filter()

dw_1.retrieve()

end event

on w_cditemloss_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.sle_1=create sle_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.ddlb_op
end on

on w_cditemloss_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

end event

type pb_save from w_inheritance`pb_save within w_cditemloss_m
integer x = 2610
integer y = 56
end type

event pb_save::clicked;dw_1.accepttext()
wf_update1(dw_1, "Y")
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================



end event

type dw_1 from w_inheritance`dw_1 within w_cditemloss_m
integer x = 32
integer y = 420
integer width = 2985
integer height = 1056
string dataobject = "d_cditemloss_m"
boolean hscrollbar = false
end type

event dw_1::itemchanged;long ll_row, ll_cnt, ll_found
string ls_item_name, ls_data

this.accepttext()
ll_row = this.getrow()

choose case dwo.name

	case 'item_no'

		ls_data = data
		ll_cnt = this.RowCount( )
		ll_found = dw_1.Find("currentrow() <> getrow() and item_no = '" + ls_data + "'", 1, ll_cnt)
		
		if ll_found > 0 then
			messagebox("확인","기 등록된 물품이 존재합니다.",exclamation!)
			return 1
		end if

		select item_name into :ls_item_name from groupitem 
		where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
			return 1
		end if
		this.object.item_name1[this.getrow()] = ls_item_name
		
end choose

end event

event dw_1::itemerror;choose case dwo.name
	case 'item_no'
		string ls_null
		
		setnull(ls_null)
		this.object.item_no[this.getrow()] = ls_null
end choose

return 2
end event

event dw_1::keydown;long ll_row

ll_row = this.getrow()
IF keyflags = 2 THEN
	choose case key 
		CASE KeyQuote! 
			choose case this.getcolumnname() 
				case "loss_item" 
					if ll_row > 1 then
						this.object.loss_item[ll_row] = this.object.loss_item[ll_row - 1]
					end if
			end choose
	end choose
END IF
this.setfocus()
//Navigation keys	
//	KeyPageUp!
//	KeyPageDown!
//	KeyEnd!
//	KeyHome!
//	KeyLeftArrow!
//	KeyUpArrow!
//	KeyRightArrow!
//	KeyDownArrow!
//KeySpaceBar!
//Function keys	KeyF1! - KeyF12!
//Function keys F1 to F12
//Control keys
//KeyShift!
//KeyControl!
//KeyAlt!
//KeyPause!
//KeyCapsLock!
//KeyEscape!
//KeyPrintScreen!
//KeyInsert!
//KeyDelete!

end event

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if row < 1 then return
this.scrolltorow(row)

end event

type st_title from w_inheritance`st_title within w_cditemloss_m
integer x = 41
integer y = 52
integer width = 992
string text = "로스물품 관리"
end type

type st_tips from w_inheritance`st_tips within w_cditemloss_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemloss_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditemloss_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditemloss_m
integer x = 2802
integer y = 56
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemloss_m
boolean visible = false
integer x = 2373
integer y = 40
end type

event pb_print::clicked;//w_repsuper w_print
//st_print l_print
//
//if dw_1.rowcount() < 1 then
//	return
//else
//	dw_2.retrieve()
//end if
//
//l_print.st_datawindow = dw_2
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 국가코드를 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cditemloss_m
integer x = 1755
integer y = 56
integer width = 430
integer textsize = -11
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "자동추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::mousemove;//
end event

event pb_cancel::clicked;string ls_item, ls_name, ls_like
long ll_row, ll_cnt, ll_ins

if rb_1.checked = true then
	ls_like = trim(rb_1.text) + "%"
elseif rb_2.checked = true then
	ls_like = trim(rb_2.text) + "%"
elseif rb_3.checked = true then
	ls_like = trim(rb_3.text) + "%"
elseif rb_4.checked = true then
	if trim(sle_1.text) = '' or isnull(sle_1.text) then
		beep(2)
		sle_1.setfocus()
		return
	else
		ls_like = trim(sle_1.text) + "%"
	end if
end if

ll_cnt = dw_2.retrieve(ls_like)
for ll_row = 1 to ll_cnt
	ls_item = dw_2.object.item_no[ll_row]
	ls_name = dw_2.object.item_name[ll_row]
	ll_ins = dw_1.insertrow(0)
	dw_1.scrolltorow(ll_ins)
	
	dw_1.object.item_no[ll_ins] = ls_item
	dw_1.object.item_name1[ll_ins] = ls_name
next
end event

type pb_delete from w_inheritance`pb_delete within w_cditemloss_m
integer x = 2418
integer y = 56
end type

event pb_delete::clicked;if dw_1.rowcount() < 1 then return	

dw_1.deleterow(0)


end event

type pb_insert from w_inheritance`pb_insert within w_cditemloss_m
integer x = 2226
integer y = 56
end type

event pb_insert::clicked;long ll_row, ll_count

dw_1.accepttext()
ll_row = dw_1.insertrow(1)
dw_1.scrolltorow(ll_row)
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemloss_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_cditemloss_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cditemloss_m
integer y = 236
integer width = 2985
integer height = 160
integer textsize = -8
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cditemloss_m
integer x = 1147
integer y = 16
integer width = 1870
integer height = 208
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cditemloss_m
integer x = 928
integer y = 12
integer width = 142
integer height = 92
string dataobject = "d_cditemloss_s"
boolean vscrollbar = false
end type

type rb_1 from radiobutton within w_cditemloss_m
integer x = 1175
integer y = 48
integer width = 160
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
string text = "M1"
boolean checked = true
end type

event clicked;IF this.checked = true then
	sle_1.enabled = false
else 
	sle_1.enabled = true
end if
end event

type rb_2 from radiobutton within w_cditemloss_m
integer x = 1358
integer y = 48
integer width = 160
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
string text = "M2"
end type

event clicked;IF this.checked = true then
	sle_1.enabled = false
else 
	sle_1.enabled = true
end if
end event

type rb_3 from radiobutton within w_cditemloss_m
integer x = 1541
integer y = 48
integer width = 160
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
string text = "M3"
end type

event clicked;IF this.checked = true then
	sle_1.enabled = false
else 
	sle_1.enabled = true
end if
end event

type rb_4 from radiobutton within w_cditemloss_m
integer x = 1175
integer y = 132
integer width = 169
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
string text = "외"
end type

event clicked;IF this.checked = true then
	sle_1.enabled = true
else 
	sle_1.enabled = false
end if
end event

type sle_1 from singlelineedit within w_cditemloss_m
integer x = 1344
integer y = 124
integer width = 357
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_cditemloss_m
integer x = 87
integer y = 304
integer width = 174
integer height = 56
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
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_cditemloss_m
integer x = 274
integer y = 288
integer width = 443
integer height = 632
integer taborder = 140
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
end type

type ddlb_dwtitles from dropdownlistbox within w_cditemloss_m
integer x = 306
integer y = 300
integer width = 311
integer height = 88
integer taborder = 150
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
end type

type st_4 from statictext within w_cditemloss_m
integer x = 745
integer y = 304
integer width = 165
integer height = 56
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cditemloss_m
integer x = 1234
integer y = 292
integer width = 567
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cditemloss_m
integer x = 1806
integer y = 296
integer width = 160
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_cditemloss_m
integer x = 1970
integer y = 296
integer width = 160
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cditemloss_m
integer x = 2135
integer y = 296
integer width = 160
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cditemloss_m
integer x = 2299
integer y = 296
integer width = 160
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_cditemloss_m
integer x = 919
integer y = 288
integer width = 306
integer height = 500
integer taborder = 70
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

