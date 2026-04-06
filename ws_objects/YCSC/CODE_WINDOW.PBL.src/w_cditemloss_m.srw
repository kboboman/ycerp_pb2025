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
end forward

global type w_cditemloss_m from w_inheritance
integer x = 320
integer y = 552
integer width = 3095
integer height = 1636
string title = "로스물품 관리(w_cditemloss_m)"
windowstate windowstate = normal!
boolean center = true
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
sle_1 sle_1
end type
global w_cditemloss_m w_cditemloss_m

type variables
datawindowchild idwc_item


end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_1.getchild("loss_item", idwc_item)
gs_ds_itemall.ShareData(idwc_item)
sle_1.enabled = false


idwc_item.setfilter("mid(item_no,1,2) = 'M3' and mid(item_no,6,1) = 'L'")
idwc_item.filter()

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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.sle_1
end on

on w_cditemloss_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.sle_1)
end on

event resize;call super::resize;//
this.width  = 3095
gb_2.height = this.height - 376
dw_1.height = this.height - 448

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
integer x = 59
integer width = 2935
integer height = 1188
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
		ll_cnt = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_cnt)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
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

type dw_2 from w_inheritance`dw_2 within w_cditemloss_m
integer x = 928
integer y = 12
integer width = 142
integer height = 92
string dataobject = "d_cditemloss_s"
boolean vscrollbar = false
end type

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
ll_row = dw_1.insertrow(0)
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
integer height = 1260
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

