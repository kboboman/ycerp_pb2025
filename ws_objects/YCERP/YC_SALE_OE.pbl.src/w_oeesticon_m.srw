$PBExportHeader$w_oeesticon_m.srw
$PBExportComments$견적서결재 관리(2001/02/22,이인호)
forward 
global type w_oeesticon_m from w_inheritance
end type
type dw_4 from datawindow within w_oeesticon_m
end type
type st_1 from statictext within w_oeesticon_m
end type
type rb_3 from radiobutton within w_oeesticon_m
end type
type rb_1 from radiobutton within w_oeesticon_m
end type
type rb_2 from radiobutton within w_oeesticon_m
end type
type dw_3 from datawindow within w_oeesticon_m
end type
type em_2 from editmask within w_oeesticon_m
end type
type em_1 from editmask within w_oeesticon_m
end type
type cbx_1 from checkbox within w_oeesticon_m
end type
type cbx_2 from checkbox within w_oeesticon_m
end type
type cbx_3 from checkbox within w_oeesticon_m
end type
type st_2 from statictext within w_oeesticon_m
end type
type em_3 from editmask within w_oeesticon_m
end type
type em_4 from editmask within w_oeesticon_m
end type
type st_3 from statictext within w_oeesticon_m
end type
type st_4 from statictext within w_oeesticon_m
end type
type pb_1 from picturebutton within w_oeesticon_m
end type
type dw_8 from datawindow within w_oeesticon_m
end type
type dw_5 from datawindow within w_oeesticon_m
end type
type dw_6 from datawindow within w_oeesticon_m
end type
type dw_7 from datawindow within w_oeesticon_m
end type
end forward

global type w_oeesticon_m from w_inheritance
integer y = 72
integer width = 3630
integer height = 2196
string title = "견적서 결재관리(w_oeesticon_m)"
boolean resizable = false
dw_4 dw_4
st_1 st_1
rb_3 rb_3
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
em_2 em_2
em_1 em_1
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
st_2 st_2
em_3 em_3
em_4 em_4
st_3 st_3
st_4 st_4
pb_1 pb_1
dw_8 dw_8
dw_5 dw_5
dw_6 dw_6
dw_7 dw_7
end type
global w_oeesticon_m w_oeesticon_m

type variables
st_print i_print
date id_start, id_end
string is_order_no, is_con ="N" , is_flag ='%', is_err

end variables

on w_oeesticon_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.st_1=create st_1
this.rb_3=create rb_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.em_2=create em_2
this.em_1=create em_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.st_2=create st_2
this.em_3=create em_3
this.em_4=create em_4
this.st_3=create st_3
this.st_4=create st_4
this.pb_1=create pb_1
this.dw_8=create dw_8
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_7=create dw_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.cbx_2
this.Control[iCurrent+11]=this.cbx_3
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.em_3
this.Control[iCurrent+14]=this.em_4
this.Control[iCurrent+15]=this.st_3
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.pb_1
this.Control[iCurrent+18]=this.dw_8
this.Control[iCurrent+19]=this.dw_5
this.Control[iCurrent+20]=this.dw_6
this.Control[iCurrent+21]=this.dw_7
end on

on w_oeesticon_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.st_2)
destroy(this.em_3)
destroy(this.em_4)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.pb_1)
destroy(this.dw_8)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_7)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)
dw_8.settransobject(sqlca)

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

em_3.text = string(RelativeDate(today(), -2), 'yyyy/mm/dd')
em_4.text = string(today(), 'yyyy/mm/dd')
id_start = date(em_1.text)
id_end = date(em_2.text)

dw_1.visible = false
dw_8.visible = false
dw_5.insertrow(0)
dw_6.insertrow(0)
dw_7.insertrow(0)


end event

type pb_save from w_inheritance`pb_save within w_oeesticon_m
event ue_print pbm_custom01
integer x = 3163
integer y = 68
integer taborder = 140
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_4.rowcount() < 1 then return

dw_4.accepttext()
if wf_update2( dw_4,dw_2,'Y') = true then
end if

end event

type dw_1 from w_inheritance`dw_1 within w_oeesticon_m
integer x = 1445
integer y = 44
integer width = 110
integer height = 72
integer taborder = 10
string dataobject = "d_oeesti_rep_r1"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::itemchanged;dw_2.reset()
dw_3.reset()
dw_4.reset()
pb_retrieve.setfocus()

end event

type st_title from w_inheritance`st_title within w_oeesticon_m
integer x = 18
integer y = 24
integer width = 1230
string text = "견적서 결재관리"
end type

type st_tips from w_inheritance`st_tips within w_oeesticon_m
end type

type pb_compute from w_inheritance`pb_compute within w_oeesticon_m
integer x = 2766
integer y = 68
integer width = 201
integer taborder = 160
string text = "NOTE"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;gs_where lstr_where
long ll_row

ll_row  = dw_2.getrow()
if ll_row < 1 then return

dw_2.accepttext()

lstr_where.str1 = dw_2.object.estimate_no[ll_row]
openwithparm(w_oeesti_note_m,lstr_where)
lstr_where = Message.PowerObjectParm

end event

type pb_print_part from w_inheritance`pb_print_part within w_oeesticon_m
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 130
string text = "수주상황접수부 시화출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;////w_repsuper w_print
////
////i_print.st_datawindow = dw_3
////i_print.st_print_sheet = " 프린트용지 : A4"
////i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
////
////gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
////opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
////
////
////
//if dw_4.getrow() < 1 then
//	MessageBox("출력", "수주조회후에 출력하십시요!")
//	return
//end if
//
//if MessageBox("수주상황접수부 출력", "수주상황접수부를 시화프린터로 직접 출력합니다 ~r~n" &
//											+ "출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
//	return
//end if
//
//dw_5.settransobject(sqlca)
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
//
//dw_5.Modify('DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//	                   'Datawindow.Zoom=100' )
//dw_5.retrieve(dw_4.object.order_no[dw_4.getrow()])
//wf_multiprint()
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x - 70
li_y = this.y + 156

f_usetips(st_tips,"수주상황접수부 시화출력  ",parent, li_x, li_y)


end event

type pb_close from w_inheritance`pb_close within w_oeesticon_m
integer x = 3355
integer y = 68
integer taborder = 190
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oeesticon_m
integer x = 2971
integer y = 68
integer taborder = 200
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

if dw_2.getrow() < 1 then return
long ll_row, ll_mod, ll_int, ll_dw1row, ll_cnt, ll_dw8row
long ll_dw1rowcount, ll_dw8rowcount
string ls_text, ls_esti, ls_case
dec{0} ld_sum

dw_1.setredraw(false)
ls_esti = dw_2.getitemstring(1, "estimate_no")
ls_case = dw_2.getitemstring(1, "estimate_head_esti_case")
ll_dw1rowcount = dw_1.retrieve(ls_esti)
ll_dw8rowcount = dw_8.retrieve(ls_esti)

ld_sum = 0
for ll_dw1row = 1 to ll_dw1rowcount
	ld_sum = ld_sum + dw_1.object.estimate_det_item_amt[ll_dw1row]
next

ll_dw1row = dw_1.insertrow(0)
dw_1.object.esti_case[ll_dw1row] = ls_case
dw_1.object.estimate_head_estimate_no[ll_dw1row] = ls_esti	
dw_1.object.estimate_det_item_amt[ll_dw1row] = ld_sum
if ls_case <> "Y" then
	dw_1.object.note[ll_dw1row] = space(40) + '합계'	
end if
ll_mod = Mod(ll_dw1rowcount + 1, 20)
ll_cnt = 0
ll_dw8row = 0
if ll_mod <> 0 then
	
	for ll_int = 1 to 20 - ll_mod
		ll_dw1row = dw_1.insertrow(0)
		dw_1.object.estimate_head_estimate_no[ll_dw1row] = ls_esti	
		if ll_int = 2 then
			dw_1.object.note_text[ll_dw1row] = 'NOTE'		
		end if
		if ll_int > 1 and ll_dw8row < ll_dw8rowcount then
			ll_dw8row = ll_dw8row + 1
			ls_text = dw_8.object.note[ll_dw8row]
			dw_1.object.note[ll_dw1row] = ls_text
		end if
	next
	if ll_dw8row < ll_dw8rowcount then
		for ll_int = 1 to 20
			ll_dw1row = dw_1.insertrow(0)
			dw_1.object.estimate_head_estimate_no[ll_dw1row] = ls_esti	
			if ll_dw8row = 1 then
				dw_1.object.note_text[ll_dw1row] = 'NOTE'		
			end if
			if ll_dw8row < ll_dw8rowcount then
				ll_dw8row = ll_dw8row + 1
				ls_text = dw_8.object.note[ll_dw8row]
				dw_1.object.note[ll_dw1row] = ls_text
			end if
		next
	end if
end if
//ll_row = dw_1.rowcount()
//
//ll_cnt = dw_1.insertrow(0)
//dw_1.object.estimate_det_item_amt[ll_cnt] = ld_sum
//dw_1.object.note[ll_cnt] = space(40) + '합계'		
//
//ll_mod = Mod(ll_row + 1, 20)
//ll_cnt = 0
//ll_dw8row = 0
//if ll_mod <> 0 then
//	for ll_int = 1 to 20 - ll_mod
//		ll_dw1row = dw_1.insertrow(0)
//		ll_cnt = ll_cnt + 1
//		if ll_cnt = 3 then
//			dw_1.object.note_text[ll_dw1row] = 'NOTE'		
//		end if
//		if ll_cnt > 2 and dw_8.rowcount() > ll_dw8row then
//			ll_dw8row = ll_dw8row + 1
//			ls_text = dw_8.object.note[ll_dw8row]
//			dw_1.object.note[ll_dw1row] = ls_text
//		end if
//	next
//end if
dw_1.setredraw(true)
i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 견적서를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_oeesticon_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 210
end type

type pb_delete from w_inheritance`pb_delete within w_oeesticon_m
boolean visible = false
integer x = 2971
integer y = 40
integer taborder = 220
end type

type pb_insert from w_inheritance`pb_insert within w_oeesticon_m
boolean visible = false
integer x = 2779
integer y = 40
integer taborder = 230
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oeesticon_m
integer x = 2514
integer y = 80
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end

ld_start = date(em_3.text)
ld_end = date(em_4.text)
dw_4.reset()
dw_2.reset()
dw_3.reset()
if dw_4.retrieve(is_con, ld_start, ld_end, '%','%','%') < 1 then
	messagebox("확인","해당일자에는 내역이 없습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oeesticon_m
integer x = 5
integer y = 1068
integer width = 882
integer height = 1028
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oeesticon_m
integer x = 1586
integer y = 16
integer width = 1143
integer height = 228
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회"
end type

type gb_1 from w_inheritance`gb_1 within w_oeesticon_m
integer x = 2738
integer y = 16
integer width = 827
integer height = 228
integer taborder = 150
end type

type dw_2 from w_inheritance`dw_2 within w_oeesticon_m
integer x = 1289
integer y = 248
integer width = 2313
integer height = 820
integer taborder = 40
string dataobject = "d_oeesticon_s"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_oeesticon_m
integer x = 5
integer y = 304
integer width = 1280
integer height = 752
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_oeesticon_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() > 0 then
	dw_2.retrieve(this.getitemstring(this.getrow(), "estimate_no"))
	dw_3.retrieve(this.getitemstring(this.getrow(), "estimate_no"))
else	
	dw_2.reset()
	dw_3.reset()
end if

end event

event retrieveend;if this.getrow() <= 0 then
	dw_2.reset()
	dw_3.reset()
end if
end event

event itemchanged;long ll_row
string ls_null, ls_data, ls_data2

setnull(ls_null)
this.accepttext()
this.setredraw(false)
ll_row = this.getrow()
is_err = '0'
CHOOSE CASE dwo.name
	CASE 'esti_flag'
		ls_data = this.getitemstring(ll_row, 'esti_flag',  Primary!, TRUE)
		CHOOSE CASE data
			CASE "Y"
				dw_4.object.approve_top[ll_row] = gs_userid
			CASE "B"
				dw_4.object.approve_top[ll_row] = '보류'
				if gs_userid <> '19000011' and (ls_data = 'Y' or ls_data = 'N') then
					messagebox("확인","바꿀권리가 없습니다.")
					return 1
				end if
				if gs_userid <> '19000011' then
					is_err = '1'
					return 1
				end if
			CASE "N"
				if gs_userid <> '19000011' and (ls_data = 'Y' or ls_data = 'B') then
					messagebox("확인","바꿀권리가 없습니다.")
					return 1
				end if
				dw_4.object.approve_top[ll_row] = ls_null
		END CHOOSE
	CASE 'chk_team'
		CHOOSE CASE data
			CASE "Y"
				dw_4.object.approve_team[ll_row] = gs_userid
			CASE "N"
				ls_data = this.getitemstring(ll_row, 'chk_team',  Primary!, TRUE)
				ls_data2 = this.getitemstring(ll_row, 'approve_team',  Primary!, TRUE)
				if gs_userid <> ls_data2 and ls_data = 'Y' then
					messagebox("확인","결재하신분이 아니므로 바꿀수가 없습니다.")
					return 1
				end if
				dw_4.object.approve_team[ll_row] = ls_null
		END CHOOSE
END CHOOSE
this.setredraw(true)
return 0


end event

event itemerror;string  ls_ori_esti_flag

CHOOSE CASE dwo.name
	CASE 'esti_flag'
			if is_err = '1' then
					dw_4.object.esti_flag[row] = 'Y'
					dw_4.object.approve_top[row] = gs_userid
			else
				dw_4.object.approve_top[row] = this.getitemstring(row, 'approve_top',  Primary!, TRUE)
				dw_4.object.esti_flag[row] = this.getitemstring(row, 'esti_flag',  Primary!, TRUE)
			END if
					
	CASE 'chk_team'
				dw_4.object.chk_team[row] = this.getitemstring(row, 'chk_team',  Primary!, TRUE)
				dw_4.object.approve_team[row] = this.getitemstring(row, 'approve_team',  Primary!, TRUE)
	CASE else
END CHOOSE
this.setredraw(true)
return 2


end event

type st_1 from statictext within w_oeesticon_m
integer x = 18
integer y = 240
integer width = 1120
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
string text = "본부장결재시에만 결재완료 됩니다."
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_oeesticon_m
integer x = 2295
integer y = 68
integer width = 215
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "보류"
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "B"
end event

type rb_1 from radiobutton within w_oeesticon_m
integer x = 1618
integer y = 68
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미결재"
boolean checked = true
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "N"
end event

type rb_2 from radiobutton within w_oeesticon_m
integer x = 1975
integer y = 68
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "완결"
end type

event clicked;dw_2.reset()
dw_3.reset()
dw_4.reset()
is_con = "Y"

end event

type dw_3 from datawindow within w_oeesticon_m
integer x = 891
integer y = 1068
integer width = 2720
integer height = 1028
integer taborder = 50
string dataobject = "d_oeesticon_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_2 from editmask within w_oeesticon_m
integer x = 471
integer y = 1348
integer width = 357
integer height = 76
integer taborder = 60
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

event modified;id_end = date(em_2.text)

end event

type em_1 from editmask within w_oeesticon_m
integer x = 37
integer y = 1348
integer width = 352
integer height = 76
integer taborder = 70
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

event modified;id_start = date(em_1.text)

end event

type cbx_1 from checkbox within w_oeesticon_m
integer x = 14
integer y = 1452
integer width = 384
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "거래처 전체"
boolean checked = true
boolean lefttext = true
end type

event clicked;if this.checked = true then
	dw_5.object.cust_no.background.color = rgb(192,192,192)
	dw_5.enabled = false
else
	dw_5.enabled = true
	dw_5.object.cust_no.background.color = rgb(255,255,255)
end if
end event

type cbx_2 from checkbox within w_oeesticon_m
integer x = 14
integer y = 1624
integer width = 384
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "현장 전체"
boolean checked = true
boolean lefttext = true
end type

event clicked;if this.checked = true then
	dw_6.enabled = false
	dw_6.object.scene_code.background.color = rgb(192,192,192)
else
	dw_6.enabled = true
	dw_6.object.scene_code.background.color = rgb(255,255,255)
end if

end event

type cbx_3 from checkbox within w_oeesticon_m
integer x = 14
integer y = 1796
integer width = 384
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "시스템 전체"
boolean checked = true
boolean lefttext = true
end type

event clicked;if this.checked = true then
	dw_7.enabled = false
	dw_7.object.item_no.background.color = rgb(192,192,192)
else
	dw_7.enabled = true
	dw_7.object.item_no.background.color = rgb(255,255,255)
end if
end event

type st_2 from statictext within w_oeesticon_m
integer x = 23
integer y = 1116
integer width = 837
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 15780518
boolean enabled = false
string text = "견적서 찾기"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_3 from editmask within w_oeesticon_m
integer x = 1646
integer y = 144
integer width = 357
integer height = 76
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

type em_4 from editmask within w_oeesticon_m
integer x = 2130
integer y = 144
integer width = 352
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

type st_3 from statictext within w_oeesticon_m
integer x = 2039
integer y = 140
integer width = 73
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type st_4 from statictext within w_oeesticon_m
integer x = 407
integer y = 1336
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_oeesticon_m
integer x = 640
integer y = 1196
integer width = 187
integer height = 144
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\retrieve.bmp"
string disabledname = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;string ls_cust_no, ls_scene, ls_item
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_5.accepttext()
dw_6.accepttext()
dw_7.accepttext()
if cbx_1.checked = false then
	ls_cust_no = '%' + trim(dw_5.object.cust_no[1]) + '%'
else
	ls_cust_no = '%'
end if
if cbx_2.checked = false then
	ls_scene = '%' + trim(dw_6.object.scene_code[1]) + '%'
else
	ls_scene = '%'
end if
if cbx_3.checked = false then
	ls_item = '%' + trim(dw_7.object.item_no[1]) + '%'
else
	ls_item = '%'
end if
dw_4.reset()
dw_4.retrieve(is_flag, id_start, id_end, ls_cust_no, ls_scene, ls_item)
end event

type dw_8 from datawindow within w_oeesticon_m
integer x = 1445
integer y = 124
integer width = 110
integer height = 72
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_oeesti_rep_r2"
boolean livescroll = true
end type

type dw_5 from datawindow within w_oeesticon_m
integer x = 14
integer y = 1524
integer width = 864
integer height = 88
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_oecustomer_s"
boolean border = false
end type

event constructor;	this.object.cust_no.background.color = rgb(192,192,192)

end event

type dw_6 from datawindow within w_oeesticon_m
integer x = 14
integer y = 1696
integer width = 864
integer height = 88
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_whscene_s"
boolean border = false
end type

event constructor;	this.object.scene_code.background.color = rgb(192,192,192)

end event

type dw_7 from datawindow within w_oeesticon_m
integer x = 14
integer y = 1868
integer width = 864
integer height = 88
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_oeesti_s1"
boolean border = false
end type

event constructor;	this.object.item_no.background.color = rgb(192,192,192)

end event

