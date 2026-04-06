$PBExportHeader$w_ocshipcon_m.srw
$PBExportComments$운반비변경결재관리(2002/08/28,이인호)
forward 
global type w_ocshipcon_m from w_inheritance
end type
type rb_3 from radiobutton within w_ocshipcon_m
end type
type rb_4 from radiobutton within w_ocshipcon_m
end type
type st_2 from statictext within w_ocshipcon_m
end type
type rb_1 from radiobutton within w_ocshipcon_m
end type
type rb_2 from radiobutton within w_ocshipcon_m
end type
type dw_3 from datawindow within w_ocshipcon_m
end type
type dw_4 from datawindow within w_ocshipcon_m
end type
type dw_5 from datawindow within w_ocshipcon_m
end type
type st_vertical from u_splitbar_vertical within w_ocshipcon_m
end type
type st_horizontal from u_splitbar_horizontal within w_ocshipcon_m
end type
type gb_4 from groupbox within w_ocshipcon_m
end type
end forward

global type w_ocshipcon_m from w_inheritance
integer width = 4087
integer height = 2520
string title = "운반비 결재관리(w_ocshipcon_m)"
rb_3 rb_3
rb_4 rb_4
st_2 st_2
rb_1 rb_1
rb_2 rb_2
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
st_vertical st_vertical
st_horizontal st_horizontal
gb_4 gb_4
end type
global w_ocshipcon_m w_ocshipcon_m

type variables
st_print i_print

string is_shipno, is_con ="O",  is_err

end variables

on w_ocshipcon_m.create
int iCurrent
call super::create
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_3
this.Control[iCurrent+2]=this.rb_4
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.dw_4
this.Control[iCurrent+8]=this.dw_5
this.Control[iCurrent+9]=this.st_vertical
this.Control[iCurrent+10]=this.st_horizontal
this.Control[iCurrent+11]=this.gb_4
end on

on w_ocshipcon_m.destroy
call super::destroy
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_4)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_1.visible = false
rb_1.triggerevent(clicked!)
end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

st_vertical.x      = dw_4.x + dw_4.width
st_vertical.height = dw_4.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_4.x

st_horizontal.y     = dw_4.y + dw_4.height
st_horizontal.width = newwidth  - (gb_4.x * 2)

dw_3.width  = newwidth  - (gb_4.x * 2)
dw_3.height = newheight - dw_3.y - gb_4.x


end event

type pb_save from w_inheritance`pb_save within w_ocshipcon_m
event ue_print pbm_custom01
integer x = 3593
integer y = 56
integer taborder = 70
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row,  ll_dw4row
string ls_dono, ls_oldship, ls_newship, ls_cust, ls_dbship
dec    ld_amt

dw_5.accepttext()
if rb_2.checked = true then	// 운반비기타
	///////////////////////////////////
	// 저장
	///////////////////////////////////
	if wf_update1( dw_5,'Y' ) = true then
		pb_retrieve.triggerevent(clicked!)
	end if
	///////////////////////////////////
else		// 운반비변경사항
	dw_3.accepttext()
	dw_4.accepttext()
	if dw_4.rowcount() < 1 then return
	
	if rb_3.checked = true then		// 미결재
		for ll_dw4row = 1 to dw_4.rowcount()
			dw_4.scrolltorow(ll_dw4row)
			
			if dw_4.getitemstring(ll_dw4row, 'chk_team',     Primary!, FALSE) <> &
				dw_4.getitemstring(ll_dw4row, 'chk_team',     Primary!, TRUE ) or &
				dw_4.getitemstring(ll_dw4row, 'process_flag', Primary!, FALSE) <> &
				dw_4.getitemstring(ll_dw4row, 'process_flag', Primary!, TRUE ) then
				
				for ll_row = 1 to dw_3.rowcount()
					if dw_3.object.do_ship_close[ll_row] = 'C' then
						messagebox("확인","운반비가 마감된 자료는 변경이 불가능합니다.")
					else
						ls_dono    = dw_3.object.do_no[ll_row]
						ls_newship = dw_3.object.new_shipflag[ll_row]

						select ship_flag, cust_no, ship_amount into :ls_dbship, :ls_cust, :ld_amt 
						  from do
						 where do_no = :ls_dono;
						if sqlca.sqlcode <> 0 then
							rollback;
							messagebox('오류1',sqlca.sqlerrtext,exclamation!)
							return
						end if
						
						if ls_dbship <> ls_newship then
							if dw_3.object.shipamt_case[ll_row] = 'R' then 
								if ls_newship = 'D' then
									update do 
									   set ship_flag = :ls_newship
										  , do_cash  = do_cash  + :ld_amt
										  , do_rate  = do_rate  + FLOOR(:ld_amt / 10 )
										  , do_total = do_total + :ld_amt + FLOOR(:ld_amt / 10 ) 
									 where do_no = :ls_dono and ship_flag <> :ls_newship;
									if sqlca.sqlcode <> 0 then
										rollback;
										messagebox('오류2',sqlca.sqlerrtext,exclamation!)
										return
									end if			
								else
									update do 
									   set ship_flag = :ls_newship
										  , do_cash  = do_cash  - :ld_amt
										  , do_rate  = do_rate  - FLOOR(:ld_amt / 10 )
										  , do_total = do_total - ( :ld_amt + FLOOR(:ld_amt / 10 ))
									 where do_no = :ls_dono	and ship_flag <> :ls_newship;
									if sqlca.sqlcode <> 0 then
										rollback;
										messagebox('오류3',sqlca.sqlerrtext,exclamation!)
										return
									end if			
								end if
							else
								if ls_newship = 'D' then  // 대여
									update do 
									   set ship_flag = :ls_newship
									 where do_no = :ls_dono	and ship_flag <> :ls_newship;
									if sqlca.sqlcode <> 0 then
										rollback;
										messagebox('오류4',sqlca.sqlerrtext,exclamation!)
										return
									end if			
								else							// 부담
									update do 
									   set ship_flag = :ls_newship
									 where do_no = :ls_dono and ship_flag <> :ls_newship;
									if sqlca.sqlcode <> 0 then
										rollback;
										messagebox('오류5',sqlca.sqlerrtext,exclamation!)
										return
									end if			
								end if
							end if
						end if
					end if
				next
			end if
		next
	else		// 결재취소
		for ll_dw4row = 1 to dw_4.rowcount()
			dw_4.scrolltorow(ll_dw4row)
			if dw_4.getitemstring(ll_dw4row, 'chk_team',     Primary!, FALSE) <> &
				dw_4.getitemstring(ll_dw4row, 'chk_team',     Primary!, TRUE ) OR &
				dw_4.getitemstring(ll_dw4row, 'process_flag', Primary!, FALSE) <> &
				dw_4.getitemstring(ll_dw4row, 'process_flag', Primary!, TRUE ) then
				
				for ll_row = 1 to dw_3.rowcount()
					if dw_3.object.do_ship_close[ll_row] = 'C' then
						messagebox("확인","운반비가 마감된 자료는 변경이 불가능합니다.")
					else
						ls_dono    = dw_3.object.do_no[ll_row]
						ls_oldship = dw_3.object.old_shipflag[ll_row]
						ls_newship = dw_3.object.new_shipflag[ll_row]
				
						select ship_flag, cust_no, ship_amount into :ls_dbship, :ls_cust, :ld_amt 
						  from do
						 where do_no = :ls_dono;
						if sqlca.sqlcode <> 0 then
							rollback;
							messagebox('오류6',sqlca.sqlerrtext,exclamation!)
							return
						end if	

						if ls_oldship <> ls_dbship then
							if dw_3.object.shipamt_case[ll_row] = 'R' then 
								if ls_newship = 'D' then  // 대여
									update do 
									   set ship_flag = :ls_oldship
										  , do_cash  = do_cash  - :ld_amt
										  , do_rate  = do_rate  - FLOOR(:ld_amt / 10 )
										  , do_total = do_total - :ld_amt - FLOOR(:ld_amt / 10 ) 
									 where do_no = :ls_dono	and ship_flag <> :ls_oldship;
									if sqlca.sqlcode <> 0 then
										rollback;
										messagebox('오류7',sqlca.sqlerrtext,exclamation!)
										return
									end if			
								else							// 부담
									update do 
									   set ship_flag = :ls_oldship
										  , do_cash  = do_cash  - :ld_amt
										  , do_rate  = do_rate  - FLOOR(:ld_amt / 10 )
										  , do_total = do_total - ( :ld_amt + FLOOR(:ld_amt / 10 ))
									 where do_no = :ls_dono	and ship_flag <> :ls_oldship;
									if sqlca.sqlcode <> 0 then
										rollback;
										messagebox('오류8',sqlca.sqlerrtext,exclamation!)
										return
									end if			
								end if
							else
								if ls_newship = 'D' then  // 대여
									update do 
									   set ship_flag = :ls_oldship
									 where do_no = :ls_dono	and ship_flag <> :ls_oldship;
									if sqlca.sqlcode <> 0 then
										rollback;
										messagebox('오류9',sqlca.sqlerrtext,exclamation!)
										return
									end if			
								else							// 부담
									update do 
									   set ship_flag = :ls_oldship
									 where do_no = :ls_dono	and ship_flag <> :ls_oldship;
									if sqlca.sqlcode <> 0 then
										rollback;
										messagebox('오류10',sqlca.sqlerrtext,exclamation!)
										return
									end if			
								end if
							end if
						end if
					end if
				next
			end if
		next
	end if
	
	///////////////////////////////////
	// 저장
	///////////////////////////////////
	if wf_update1( dw_4,'Y') = true then
		pb_retrieve.triggerevent(clicked!)
	end if
	///////////////////////////////////
end if

end event

type dw_1 from w_inheritance`dw_1 within w_ocshipcon_m
integer x = 55
integer y = 192
integer width = 101
integer height = 68
integer taborder = 10
string dataobject = "d_ocshipreq_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::itemchanged;dw_2.reset()
dw_3.reset()
dw_4.reset()
pb_retrieve.setfocus()

end event

type st_title from w_inheritance`st_title within w_ocshipcon_m
integer x = 41
integer y = 28
integer width = 1097
integer height = 144
string text = "운반비 결재관리"
end type

type st_tips from w_inheritance`st_tips within w_ocshipcon_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipcon_m
boolean visible = false
integer x = 1659
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocshipcon_m
boolean visible = false
integer x = 1929
integer y = 48
integer width = 526
integer height = 152
integer taborder = 60
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

type pb_close from w_inheritance`pb_close within w_ocshipcon_m
integer x = 3785
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipcon_m
integer x = 3401
integer y = 56
integer taborder = 110
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
 
if dw_2.getrow() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve( is_shipno )

l_print.st_datawindow  = dw_1
l_print.st_print_desc  = " 이 프로그램은 운반비 변경요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control       = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipcon_m
boolean visible = false
integer x = 2587
integer y = 40
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ocshipcon_m
boolean visible = false
integer x = 2971
integer y = 40
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_ocshipcon_m
boolean visible = false
integer x = 2779
integer y = 40
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipcon_m
integer x = 3209
integer y = 56
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_1.checked = true then
	if dw_4.retrieve(is_con) < 1 then
		messagebox("확인","결재하실 내역이 없습니다.")
	else
		dw_2.retrieve(is_con,"%")
		dw_4.setfocus()
	end if
else
	if dw_5.retrieve(is_con) < 1 then
		messagebox("확인","결재하실 내역이 없습니다.")
	end if
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ocshipcon_m
integer x = 2482
integer y = 16
integer width = 677
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
string text = "결재"
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipcon_m
integer x = 1993
integer y = 16
integer width = 462
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
string text = "조회"
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipcon_m
integer x = 3177
integer y = 16
integer width = 823
integer taborder = 80
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ocshipcon_m
integer x = 2871
integer y = 424
integer width = 1138
integer height = 540
integer taborder = 40
string dataobject = "d_ocshipcon_s"
boolean hscrollbar = true
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type rb_3 from radiobutton within w_ocshipcon_m
integer x = 2043
integer y = 80
integer width = 302
integer height = 68
boolean bringtotop = true
integer textsize = -10
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

event clicked;//
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()

is_con = "O"
// process_flag = 'O':작성, 'Y':결재, 'C':운반비마감 

end event

type rb_4 from radiobutton within w_ocshipcon_m
integer x = 2043
integer y = 144
integer width = 357
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "결재취소"
end type

event clicked;//
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()

is_con = "Y"
// process_flag = 'O':작성, 'Y':결재, 'C':운반비마감 

end event

type st_2 from statictext within w_ocshipcon_m
integer x = 2775
integer y = 312
integer width = 1175
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "본부장 결재시에만 운반비내역이 변경됩니다"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_ocshipcon_m
integer x = 2528
integer y = 80
integer width = 590
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "운반비변경사항"
boolean checked = true
end type

event clicked;//
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()

dw_5.visible = false
dw_2.visible = true
dw_3.visible = true
dw_4.visible = true

pb_print.enabled = true
end event

type rb_2 from radiobutton within w_ocshipcon_m
integer x = 2528
integer y = 144
integer width = 590
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "운반비기타"
end type

event clicked;//
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()

dw_5.visible = true
dw_2.visible = false
dw_3.visible = false
dw_4.visible = false

pb_print.enabled = false

end event

type dw_3 from datawindow within w_ocshipcon_m
integer x = 32
integer y = 1012
integer width = 3977
integer height = 1376
integer taborder = 50
string dataobject = "d_ocshipcon_s2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
if row < 1 then return
this.scrolltorow(row)

gs_where2 lst_str 
string ls_text, ls_chk, ls_sale, ls_seqno
int    li_find, li_int,li_end

ls_text = trim(this.object.sale_no[row])
if ls_text = '' or isnull(ls_text) then return

ls_chk  = 'Y'
li_find = 1
li_int  = 0
do while ls_chk = 'Y'
	li_end = PosA(ls_text, ",", li_find)
	if li_end = 0 or isnull(li_end) then exit
	
	ls_sale  = MidA(ls_text, li_find, 14)
   ls_seqno = "1"
	if trim(ls_sale) = '' or isnull(ls_sale) then exit
	
	li_int = li_int + 1
	lst_str.str1[li_int] = ls_sale
	lst_str.str2[li_int] = "1"
	li_find = li_end + 2
loop

OpenWithParm(w_whsaleall_w, lst_str)

end event

type dw_4 from datawindow within w_ocshipcon_m
integer x = 32
integer y = 424
integer width = 2770
integer height = 540
integer taborder = 30
string dataobject = "d_ocshipcon_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = this.Getrow()

if ll_row < 1 then return

is_shipno = this.object.doship_no[ll_row]

dw_2.setfilter("doship_no = '" + is_shipno + "'")
dw_2.filter()
dw_3.retrieve( is_shipno )

end event

event retrieveend;if this.getrow() <= 0 then
	dw_2.reset()
	dw_3.reset()
else
	is_shipno = this.object.doship_no[this.getrow()]
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
	CASE 'area_chk'
		if ( gs_userid <> '19000011' and gs_userid <> '1999010s' ) and (data = 'Y' ) then
			messagebox("확인","판매 본부장님께서만 변경하실수있습니다..")
			return 1
		end if
	CASE 'process_flag'
		ls_data = this.getitemstring(ll_row, 'process_flag',  Primary!, TRUE)
		CHOOSE CASE data
			CASE "Y"
				dw_4.object.approve_top[ll_row] = gs_userid
			CASE "O"
				//안승환상무 : 19000011
				//조용재이사 : 19840901
				if ( gs_userid <> '19000011' and gs_userid <> '1999010s' ) and (ls_data = 'Y' ) then
					messagebox("확인","판매 본부장님께서만 변경하실수있습니다..")
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


end event

event itemerror;string  ls_ori_process_flag

CHOOSE CASE dwo.name
	CASE 'area_chk'
			dw_4.object.area_chk[row] = this.getitemstring(row, 'area_chk',  Primary!, TRUE)
	CASE 'process_flag'
			if is_err = '1' then
					dw_4.object.process_flag[row] = 'Y'
					dw_4.object.approve_top[row] = gs_userid
			else
				dw_4.object.approve_top[row] = this.getitemstring(row, 'approve_top',  Primary!, TRUE)
				dw_4.object.process_flag[row] = this.getitemstring(row, 'process_flag',  Primary!, TRUE)
			END if
					
	CASE 'chk_team'
				dw_4.object.chk_team[row] = this.getitemstring(row, 'chk_team',  Primary!, TRUE)
				dw_4.object.approve_team[row] = this.getitemstring(row, 'approve_team',  Primary!, TRUE)
	CASE else
END CHOOSE
this.setredraw(true)
return 2


end event

type dw_5 from datawindow within w_ocshipcon_m
boolean visible = false
integer x = 9
integer y = 440
integer width = 3589
integer height = 1600
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_ocshipconetc_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long ll_row
string ls_null, ls_data, ls_data2

setnull(ls_null)
this.accepttext()
this.setredraw(false)
ll_row = this.getrow()
is_err = '0'
CHOOSE CASE dwo.name
	CASE 'area_chk'
		//gs_userid <> '19000011' and gs_userid <> 'cwj' 
		if ( gs_userid <> '19840901' and gs_userid = 'ssch3015' and gs_userid = 'yun0093' ) and (ls_data = 'Y' ) then
			messagebox("확인","판매 본부장님께서만 변경하실수있습니다..")
			return 1
		end if
	CASE 'etc_flag'
		ls_data = this.getitemstring(ll_row, 'etc_flag',  Primary!, TRUE)
		CHOOSE CASE data
			CASE "Y"
				this.object.approve_top[ll_row] = gs_userid
			CASE "O"
				//안승환상무 : 19000011
				//조용재이사 : 19840901
				//gs_userid <> '19000011' and gs_userid <> 'cwj' and gs_userid = 'bj5879' and gs_userid = '470409' 
				if ( gs_userid <> '19840901' and gs_userid = 'parkji' and gs_userid = 'ssch3015'   and gs_userid = '19981214' &
				     and gs_userid = 'yun0093' and gs_userid = 'kgyoung') and (ls_data = 'Y' ) then
					messagebox("확인","판매 본부장님께서만 변경하실수있습니다..")
					return 1
				end if
				this.object.approve_top[ll_row] = ls_null
		END CHOOSE
	CASE 'chk_team'
		CHOOSE CASE data
			CASE "Y"
				this.object.approve_team[ll_row] = gs_userid
			CASE "N"
				ls_data = this.getitemstring(ll_row, 'chk_team',  Primary!, TRUE)
				ls_data2 = this.getitemstring(ll_row, 'approve_team',  Primary!, TRUE)
				if gs_userid <> ls_data2 and ls_data = 'Y' then
					messagebox("확인","결재하신분이 아니므로 바꿀수가 없습니다.")
					return 1
				end if
				this.object.approve_team[ll_row] = ls_null
		END CHOOSE
END CHOOSE
this.setredraw(true)


end event

event itemerror;string  ls_ori_etc_flag

CHOOSE CASE dwo.name
	CASE 'area_chk'
				this.object.area_chk[row] = this.getitemstring(row, 'area_chk',  Primary!, TRUE)
	CASE 'etc_flag'
			if is_err = '1' then
					this.object.etc_flag[row] = 'Y'
					this.object.approve_top[row] = gs_userid
			else
				this.object.approve_top[row] = this.getitemstring(row, 'approve_top',  Primary!, TRUE)
				this.object.etc_flag[row] = this.getitemstring(row, 'etc_flag',  Primary!, TRUE)
			END if
					
	CASE 'chk_team'
				this.object.chk_team[row] = this.getitemstring(row, 'chk_team',  Primary!, TRUE)
				this.object.approve_team[row] = this.getitemstring(row, 'approve_team',  Primary!, TRUE)
	CASE else
END CHOOSE
this.setredraw(true)
return 2


end event

event doubleclicked;
if row < 1 then return
this.scrolltorow(row)

gs_where2 lst_str 
string ls_sale

ls_sale = trim(this.object.sale_no[row])
if ls_sale = '' or isnull(ls_sale) then return

lst_str.str1[1] = ls_sale
lst_str.str2[1] = "1"

OpenWithParm(w_whsaleall_w, lst_str)

end event

type st_vertical from u_splitbar_vertical within w_ocshipcon_m
integer x = 2825
integer y = 424
integer height = 540
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_ocshipcon_m
integer x = 32
integer y = 980
integer width = 3977
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_4.height

end event

type gb_4 from groupbox within w_ocshipcon_m
integer x = 32
integer y = 244
integer width = 3977
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

