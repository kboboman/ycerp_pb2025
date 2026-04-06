$PBExportHeader$w_icitemstock_m.srw
$PBExportComments$장기재고관리(2003/08/25, 이인호)
forward
global type w_icitemstock_m from w_inheritance
end type
type rb_1 from radiobutton within w_icitemstock_m
end type
type rb_2 from radiobutton within w_icitemstock_m
end type
type rb_3 from radiobutton within w_icitemstock_m
end type
type dw_3 from datawindow within w_icitemstock_m
end type
type dw_4 from datawindow within w_icitemstock_m
end type
type dw_5 from datawindow within w_icitemstock_m
end type
type pb_1 from picturebutton within w_icitemstock_m
end type
type gb_4 from groupbox within w_icitemstock_m
end type
end forward

global type w_icitemstock_m from w_inheritance
integer width = 3712
integer height = 2164
string title = "장기재고관리(w_icitemstock_m)"
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
pb_1 pb_1
gb_4 gb_4
end type
global w_icitemstock_m w_icitemstock_m

type variables
datawindowchild idwc_reason

end variables

forward prototypes
public subroutine wf_dw1ret (integer al_row)
end prototypes

public subroutine wf_dw1ret (integer al_row);string ls_loc, ls_item, ls_qa

dw_2.accepttext()
dw_3.accepttext()
dw_1.setredraw(false)
dw_1.reset()
if al_row < 1 or dw_2.rowcount() < 1 then 
	dw_1.setredraw(true)
	return
end if

ls_loc = trim(dw_3.object.loc_no[1])
ls_item = dw_2.object.item_no[al_row]
ls_qa = dw_2.object.qa[al_row]

dw_1.retrieve(ls_loc, ls_item, ls_qa)
dw_1.setredraw(true)

end subroutine

on w_icitemstock_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.pb_1=create pb_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.gb_4
end on

on w_icitemstock_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.pb_1)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.getchild("reason_code", idwc_reason)
idwc_reason.SetTransObject(sqlca)
string ls_loc

select def_loc into :ls_loc from area
 where area_no = :gs_area;
dw_3.SetTransObject(sqlca)
dw_5.SetTransObject(sqlca)
dw_5.retrieve()
dw_3.insertrow(1)
dw_3.object.loc_no[1] = ls_loc
dw_3.accepttext()
dw_2.sharedata(dw_4)
dw_4.visible = false
pb_retrieve.postevent(clicked!)
end event

event resize;call super::resize;//
dw_2.width  = this.width  - 114
dw_2.height = this.height - 904
end event

type pb_save from w_inheritance`pb_save within w_icitemstock_m
integer x = 3232
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_row

ll_row = dw_2.getrow()
//wf_update1(dw_1, 'Y')
if wf_update2(dw_1, dw_2, 'Y') = true then
	pb_retrieve.postevent(clicked!)
end if
end event

type dw_1 from w_inheritance`dw_1 within w_icitemstock_m
integer x = 46
integer y = 252
integer width = 2226
integer height = 496
string dataobject = "d_icitemstock_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;if row < 1 then return
string ls_user, ls_null

dwitemstatus l_status
l_status = dw_1.getitemstatus(row, 0, primary!)

setnull(ls_null)
choose case dwo.name
	case 'chk1_user'
		ls_user = this.object.chk1_user[row]
		if isnull(ls_user) or trim(ls_user) = ''then
			this.object.chk1_user[row] = gs_userid
		else
			if l_status = New! or l_status = NewModified! or gs_userid = ls_user then
				if this.object.chk1_user[row] = gs_userid then
					this.object.chk1_user[row] = ls_null
				end if
			else
				return 1
			end if
		end if
	case 'chk2_user'
		ls_user = this.object.chk2_user[row]
		if isnull(ls_user) or trim(ls_user) = ''then
			this.object.chk2_user[row] = gs_userid
		else
			if l_status = New! or l_status = NewModified! or gs_userid = ls_user  then
				if this.object.chk2_user[row] = gs_userid then
					this.object.chk2_user[row] = ls_null
				end if
			else
				return 1
			end if
		end if
end choose

end event

type dw_2 from w_inheritance`dw_2 within w_icitemstock_m
integer x = 32
integer y = 772
integer width = 3598
integer height = 1252
string dataobject = "d_icitemstock_s"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rowfocuschanged;call super::rowfocuschanged;long ll_row

ll_row = this.getrow()
wf_dw1ret(ll_row)
end event

event dw_2::clicked;call super::clicked;if row < 1 then return
this.scrolltorow(row)

end event

event dw_2::itemerror;call super::itemerror;return 2
end event

event dw_2::doubleclicked;call super::doubleclicked;if row < 1 then return
string ls_user, ls_null

this.scrolltorow(row)

dwitemstatus l_status
l_status = dw_1.getitemstatus(row, 0, primary!)

setnull(ls_null)
choose case dwo.name
	case 'chk1_user'
		ls_user = this.object.chk1_user[row]
		if isnull(ls_user) or trim(ls_user) = ''then
			this.object.chk1_user[row] = gs_userid
		else
			if l_status = New! or l_status = NewModified! or gs_userid = ls_user then
				if this.object.chk1_user[row] = gs_userid then
					this.object.chk1_user[row] = ls_null
				end if
			else
				return 1
			end if
		end if
	case 'chk2_user'
		ls_user = this.object.chk2_user[row]
		if isnull(ls_user) or trim(ls_user) = ''then
			this.object.chk2_user[row] = gs_userid
		else
			if l_status = New! or l_status = NewModified! or gs_userid = ls_user  then
				if this.object.chk2_user[row] = gs_userid then
					this.object.chk2_user[row] = ls_null
				end if
			else
				return 1
			end if
		end if
end choose

end event

type st_title from w_inheritance`st_title within w_icitemstock_m
integer x = 41
integer y = 48
integer width = 1006
string text = "장기재고관리"
end type

type st_tips from w_inheritance`st_tips within w_icitemstock_m
end type

type pb_compute from w_inheritance`pb_compute within w_icitemstock_m
integer x = 3415
integer y = 456
integer height = 88
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::mousemove;//
end event

event pb_compute::clicked;call super::clicked;wf_update1(dw_5, 'Y')
end event

type pb_print_part from w_inheritance`pb_print_part within w_icitemstock_m
integer x = 3415
integer y = 264
integer height = 88
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::clicked;call super::clicked;dw_5.scrolltorow( dw_5.insertrow(0))
end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_icitemstock_m
integer x = 3424
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_icitemstock_m
integer x = 3040
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
	return
end if

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 장기재고 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=93'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_icitemstock_m
integer x = 3415
integer y = 360
integer height = 88
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::clicked;call super::clicked; dw_5.deleterow(0)
end event

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_icitemstock_m
integer x = 2848
end type

event pb_delete::clicked;call super::clicked;//if mid(gs_team, 2,1) <> '0' then return
string ls_user1, ls_user2
long ll_row

dw_2.accepttext()
ll_row = dw_2.getrow()
if ll_row < 1 then return

ls_user1 = dw_2.object.chk1_user[ll_row]
ls_user2 = dw_2.object.chk2_user[ll_row]
if not isnull(ls_user1) or trim(ls_user1) <> '' or not isnull(ls_user2) or trim(ls_user2) <> '' then
	messagebox("확인", "확인이 안되어 있는 품목만 삭제가 가능합니다.")
else
	dw_2.setredraw(false)
	dw_2.deleterow(0)
	if dw_2.rowcount() > ll_row then
		wf_dw1ret(ll_row)
	end if
	dw_2.setredraw(true)
end if

end event

type pb_insert from w_inheritance`pb_insert within w_icitemstock_m
integer x = 2656
end type

event pb_insert::clicked;call super::clicked;long ll_row, ll_cnt
dec{2} ld_qoh
gs_where2 lstr_where
string ls_location

dw_3.accepttext()
ls_location = trim(dw_3.object.loc_no[1])
if trim(ls_location) = '' or isnull(ls_location) then
	messagebox("확인","저장소를 선택하십시요")
	return
end if
lstr_where.chk = 'M' //M:multi S:single
lstr_where.chk1 = ls_location
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_2.accepttext()
dw_2.setredraw(false)
dw_1.reset()
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_2.insertrow(0)
//	if gs_area = 'H0001' then
//		dw_2.object.chk2_user[ll_cnt] = gs_userid
//	else
//		dw_2.object.chk1_user[ll_cnt] = gs_userid
//	end if
	dw_2.object.user_date[ll_cnt] = wf_today()
	dw_2.object.loc_no[ll_cnt] = ls_location
	dw_2.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_2.object.qa[ll_cnt] = trim(lstr_where.str2[ll_row])
//	dw_2.object.groupitem_uom[ll_cnt] = trim(lstr_where.str3[ll_row])
	dw_2.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
	dw_2.object.qty[ll_cnt] = lstr_where.qty1[ll_row]
	dw_2.object.loc_qoh[ll_cnt] = lstr_where.qty1[ll_row]
next

dw_2.scrolltorow(ll_cnt)
dw_2.setredraw(true)


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_icitemstock_m
integer x = 2464
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.setredraw(false)
dw_1.setredraw(false)

dw_1.reset()
dw_2.reset()
dw_2.setfilter('')
dw_2.filter()

dw_3.accepttext()
dw_2.retrieve(dw_3.object.loc_no[1])
dw_5.retrieve()

//rb_1.checked = true
//rb_2.checked = true
//rb_3.checked = true
dw_1.setredraw(true)
dw_2.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_icitemstock_m
integer x = 2299
integer y = 216
integer width = 1330
integer height = 544
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_icitemstock_m
integer y = 216
integer width = 2258
integer height = 544
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_icitemstock_m
integer x = 2066
integer width = 1563
integer weight = 400
end type

type rb_1 from radiobutton within w_icitemstock_m
integer x = 2327
integer y = 684
integer width = 219
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;dw_2.setfilter('')
dw_2.filter()
wf_dw1ret(1)
end event

type rb_2 from radiobutton within w_icitemstock_m
integer x = 2793
integer y = 684
integer width = 402
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "공장미확인"
end type

event clicked;dw_2.setfilter('isnull(chk1_user)')
dw_2.filter()
wf_dw1ret(1)
end event

type rb_3 from radiobutton within w_icitemstock_m
integer x = 3214
integer y = 684
integer width = 384
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "판매미확인"
end type

event clicked;dw_2.setfilter('isnull(chk2_user)')
dw_2.filter()
wf_dw1ret(1)
end event

type dw_3 from datawindow within w_icitemstock_m
integer x = 1179
integer y = 88
integer width = 855
integer height = 92
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

event itemchanged;dw_2.setredraw(false)
dw_1.setredraw(false)
dw_1.reset()
dw_2.reset()
dw_2.setfilter('')
dw_2.filter()
dw_3.accepttext()
dw_2.retrieve(dw_3.object.loc_no[1])
dw_5.retrieve()
dw_1.setredraw(true)
dw_2.setredraw(true)

end event

type dw_4 from datawindow within w_icitemstock_m
integer x = 809
integer y = 12
integer width = 114
integer height = 80
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_icitemstock_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_icitemstock_m
integer x = 2656
integer y = 256
integer width = 741
integer height = 412
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdstockreason_c"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_icitemstock_m
integer x = 2107
integer y = 52
integer width = 343
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "장기재고 검색"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;gs_where2 lstr_where
long   ll_row, ll_cnt
string ls_location

dw_3.accepttext()
ls_location = trim(dw_3.object.loc_no[1])
if trim(ls_location) = '' or isnull(ls_location) then
	messagebox("확인","저장소를 선택하십시요")
	return
end if

lstr_where.chk = ls_location
openwithparm(w_whitemstock_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_2.accepttext()
dw_2.setredraw(false)
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_2.insertrow(0)
//	if gs_area = 'H0001' then
//		dw_2.object.chk2_user[ll_cnt] = gs_userid
//	else
//		dw_2.object.chk1_user[ll_cnt] = gs_userid
//	end if
	dw_2.object.user_date[ll_cnt] = wf_today()
	dw_2.object.loc_no[ll_cnt]    = dw_3.object.loc_no[1]
	dw_2.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])
	dw_2.object.qa[ll_cnt]        = trim(lstr_where.str2[ll_row])
	dw_2.object.qty[ll_cnt]       = dec(lstr_where.str3[ll_row])
	dw_2.object.loc_qoh[ll_cnt]   = dec(lstr_where.str3[ll_row])
	dw_2.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_2.scrolltorow(ll_cnt)
dw_2.setredraw(true)

end event

type gb_4 from groupbox within w_icitemstock_m
integer x = 1152
integer y = 12
integer width = 896
integer height = 204
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "저장소"
end type

