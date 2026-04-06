$PBExportHeader$w_ocshipreq_m.srw
$PBExportComments$운반비변경요청관리(2002/08/28,이인호)
forward
global type w_ocshipreq_m from w_inheritance
end type
type em_1 from editmask within w_ocshipreq_m
end type
type em_2 from editmask within w_ocshipreq_m
end type
type st_1 from statictext within w_ocshipreq_m
end type
type dw_4 from datawindow within w_ocshipreq_m
end type
type dw_3 from datawindow within w_ocshipreq_m
end type
type rb_1 from radiobutton within w_ocshipreq_m
end type
type rb_2 from radiobutton within w_ocshipreq_m
end type
type rb_3 from radiobutton within w_ocshipreq_m
end type
end forward

global type w_ocshipreq_m from w_inheritance
integer width = 3712
integer height = 2356
string title = "운반비변경 요청관리(w_ocshipreq_m)"
em_1 em_1
em_2 em_2
st_1 st_1
dw_4 dw_4
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
end type
global w_ocshipreq_m w_ocshipreq_m

type variables
st_print i_print
gs_itembaldo_str  ist_code
string is_ship_no, is_oc = 'O'
end variables

forward prototypes
public subroutine wf_getdono (long al_row, string as_dono)
end prototypes

public subroutine wf_getdono (long al_row, string as_dono);datetime ld_date
string ls_ship, ls_driver, ls_cust, ls_scene, ls_cust_name, ls_scene_desc, ls_saleno
dec ld_amount

select cust_no, spot_code, do_date, ship_flag, ship_amount, driver, sale_no = DBO.uf_getdosaleno(do.do_no)
  into :ls_cust, :ls_scene, :ld_date, :ls_ship, :ld_amount, :ls_driver, :ls_saleno
  from do
 where do_no = :as_dono;
if sqlca.sqlcode = 0 then
	select cust_name into :ls_cust_name from customer
	 where cust_no = :ls_cust;
	select scene_desc into :ls_scene_desc from scene
	 where scene_code = :ls_scene;
	 
	dw_3.object.old_shipflag[al_row] = ls_ship
	dw_3.object.do_do_date[al_row] = ld_date
	dw_3.object.do_ship_amount[al_row] = ld_amount
	dw_3.object.do_driver[al_row] = ls_driver
	dw_3.object.cust_name[al_row] = ls_cust_name
	dw_3.object.scene_desc[al_row] = ls_scene_desc
	dw_3.object.sale_no[al_row] = ls_saleno
else
	setnull(ls_ship)
	setnull(ld_date)
	dw_3.object.old_shipflag[al_row] = ls_ship
	dw_3.object.do_do_date[al_row] = ld_date
	dw_3.object.do_ship_amount[al_row] = 0
	dw_3.object.do_driver[al_row] = ls_ship
	dw_3.object.cust_name[al_row] = ls_ship
	dw_3.object.scene_desc[al_row] = ls_ship
	dw_3.object.sale_no[al_row] = ls_saleno
end if

end subroutine

on w_ocshipreq_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_4=create dw_4
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_3
end on

on w_ocshipreq_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_4.visible = false


em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;dw_3.width  = this.width  - 105
dw_3.height = this.height - 1172

end event

type pb_save from w_inheritance`pb_save within w_ocshipreq_m
event ue_print pbm_custom01
integer x = 3214
integer y = 48
integer taborder = 80
end type

event pb_save::clicked;long ll_row
int li_seq
dwItemStatus l_status
string ls_area,  ls_doship_date, ls_seq, ls_doship_no1, ls_doship_no, ls_reason

dw_2.accepttext()
dw_3.accepttext()
if dw_2.rowcount() < 1 then return
if dw_3.rowcount() < 1 then 
	messagebox("확인","변경상세 내역이 없습니다..")
	return
end if
if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

setpointer(hourglass!)
for ll_row = 1 to dw_3.rowcount()
	ls_reason = dw_3.object.ship_reason1[ll_row]
	if trim(ls_reason) = "" or isnull(ls_reason) then 
		messagebox("오류", string(ll_row) + " 번째의 변경사유가 없습니다.")
		dw_3.scrolltorow(ll_row)
		dw_3.setcolumn('ship_reason1')
		dw_3.setfocus()
		return
	end if
	if dw_3.object.old_shipflag[ll_row] = dw_3.object.new_shipflag[ll_row]  then
		messagebox("오류", string(ll_row) + " 번째가 변경전과 변경후가 같습니다.")
		dw_3.scrolltorow(ll_row)
		dw_3.setcolumn('new_shipflag')
		dw_3.setfocus()
		return
	end if
next
l_status = dw_2.GetItemStatus(1, 0, Primary!)
if l_status = NotModified! or l_status = DataModified! then
else
//번호 부여
	ls_area = LeftA(dw_2.object.area_no[1], 1)
	IF trim(dw_2.object.doship_no[1]) = '' OR isnull(dw_2.object.doship_no[1]) then
		ls_doship_date = string(dw_2.object.doship_date[1], "yyyymm")
		ls_doship_no1 = ls_area + 'A' + ls_doship_date + '-' + '%'			
		SELECT MAX(doship_no) INTO :ls_doship_no
			FROM doship 
			WHERE doship_no LIKE :ls_doship_no1;		
		if isnull(ls_doship_no) or ls_doship_no = '' then
			ls_doship_no1 = ls_area + 'A' + ls_doship_date + '-' + '001'
		else
			li_seq = integer(MidA(ls_doship_no, 10, 3))
			li_seq = li_seq + 1
			ls_seq = '00' + string(li_seq)
			ls_doship_no1 = LeftA(ls_doship_no1, 9) + RightA(ls_seq, 3)
		end if
	else
		setnull(ls_doship_no)
		ls_doship_no1 = dw_2.object.doship_no[1]
		SELECT doship_no INTO :ls_doship_no
			FROM doship
			WHERE doship_no = :ls_doship_no;
		IF trim(ls_doship_no) = '' or isnull(ls_doship_no) then
		ELSE
			messagebox("저장", "요청번호가 이미 존재합니다.", exclamation!)
			return
		end if
	end if
	dw_2.object.doship_no[1] = ls_doship_no1
	for ll_row = 1 to dw_3.rowcount()
		dw_3.object.doship_no[ll_row] = ls_doship_no1
		dw_3.object.seq[ll_row] = ll_row
	next
	is_ship_no = ls_doship_no1
END if
if wf_update2(dw_2,dw_3,'Y') = true then
	pb_retrieve.triggerevent(clicked!)
end if

end event

type dw_1 from w_inheritance`dw_1 within w_ocshipreq_m
integer x = 41
integer y = 244
integer width = 1257
integer height = 632
integer taborder = 30
string dataobject = "d_ocshipreq_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;long ll_row

ll_row = this.Getrow()
if ll_row < 1 then return

is_ship_no = this.object.doship_no[ll_row]

dw_2.retrieve(is_ship_no)
dw_3.retrieve(is_ship_no)


end event

type dw_2 from w_inheritance`dw_2 within w_ocshipreq_m
integer x = 1317
integer y = 488
integer width = 2304
integer height = 384
string dataobject = "d_ocshipreq_m"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_ocshipreq_m
integer x = 46
integer y = 44
integer width = 1458
integer height = 132
string text = "운반비변경 요청관리"
end type

type st_tips from w_inheritance`st_tips within w_ocshipreq_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipreq_m
integer x = 3465
integer y = 880
integer width = 155
integer height = 116
integer taborder = 100
string picturename = "c:\bmp\delete.bmp"
end type

event pb_compute::clicked;if dw_3.rowcount() < 1 then return
dw_3.deleterow(dw_3.getrow())

end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_ocshipreq_m
integer x = 3305
integer y = 880
integer width = 155
integer height = 116
integer taborder = 70
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)

end event

event pb_print_part::clicked;dwItemStatus l_status
long ll_row

if dw_2.rowcount() < 1 then return

ll_row = dw_3.insertrow(0)
dw_3.scrolltorow(ll_row)

l_status = dw_2.GetItemStatus(1, 0, Primary!)
if l_status = NotModified! or l_status = DataModified! then
	dw_3.object.doship_no[ll_row] = dw_2.object.doship_no[1]
	if ll_row > 1 then
		dw_3.object.seq[ll_row] = dw_3.object.seq[ll_row - 1] + 1
	end if
else
	dw_3.object.seq[ll_row] = ll_row
end if
dw_3.setcolumn('do_no')
dw_3.setfocus()
end event

type pb_close from w_inheritance`pb_close within w_ocshipreq_m
integer x = 3406
integer y = 48
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipreq_m
integer x = 2441
integer y = 48
integer taborder = 120
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
 
if dw_2.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_4.retrieve(is_ship_no)

l_print.st_datawindow = dw_4
l_print.st_print_desc = " 이 프로그램은 운반비 변경요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipreq_m
integer x = 2638
integer y = 48
integer taborder = 130
end type

event pb_cancel::clicked;if MessageBox("취소", "작업내역을 취소 하시겠습니까", Exclamation!, OKCancel!, 2) = 1 then
	dw_2.reset()
	dw_3.reset()
	pb_retrieve.triggerevent(clicked!)
end if

end event

type pb_delete from w_inheritance`pb_delete within w_ocshipreq_m
integer x = 3022
integer y = 48
integer taborder = 140
end type

event pb_delete::clicked;string ls_team

dw_2.accepttext()
dw_3.accepttext()
if dw_2.rowcount() < 1 then return
if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	ls_team = dw_2.object.approve_team[1]
	if trim(ls_team) = '' or isnull(ls_team) then
	else
		messagebox("확인","팀장결재가 되었습니다. 팀장결재 취소후 삭제가 가능합니다.")
		return
	end if
	dw_2.deleterow(0)
	dw_3.RowsMove(1, dw_3.rowCount(), Primary!, dw_3, 1, Delete!)
	wf_update2(dw_2,dw_3,'Y')
	pb_retrieve.triggerevent(clicked!)
end if
//		
end event

type pb_insert from w_inheritance`pb_insert within w_ocshipreq_m
integer x = 2830
integer y = 48
integer taborder = 150
string text = " "
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;long ll_row, ll_dw4row

dw_2.reset()
dw_3.reset()

ll_row = dw_2.insertrow(0)
dw_2.object.doship_date[1] = wf_today()
dw_2.object.area_no[1] = gs_area
dw_2.object.user_id[1] = gs_userid
dw_2.object.user_date[1] = gf_today()

// process_flag = 'O':작성, 'Y':결재, 'C':운반비마감 
dw_2.object.process_flag[1] = "O"


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipreq_m
integer x = 2249
integer y = 48
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date  ld_start_date, ld_end_date
 
dw_1.setredraw(false)
dw_2.setredraw(false)
dw_3.setredraw(false)
dw_1.reset()
dw_2.reset()
dw_3.reset()
ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
dw_1.retrieve(ld_start_date,ld_end_date,is_oc)
dw_1.setredraw(true)
dw_2.setredraw(true)
dw_3.setredraw(true)


end event

type gb_3 from w_inheritance`gb_3 within w_ocshipreq_m
boolean visible = false
integer x = 1605
integer y = 52
integer width = 617
integer height = 148
integer taborder = 0
integer textsize = -9
integer weight = 400
long textcolor = 0
string text = "모드"
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipreq_m
integer x = 1317
integer y = 236
integer width = 2304
integer height = 220
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "조회"
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipreq_m
integer x = 2213
integer y = 8
integer width = 1408
integer taborder = 90
end type

type em_1 from editmask within w_ocshipreq_m
integer x = 1376
integer y = 328
integer width = 366
integer height = 72
integer taborder = 10
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
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_ocshipreq_m
integer x = 1856
integer y = 328
integer width = 366
integer height = 72
integer taborder = 20
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
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_ocshipreq_m
integer x = 1778
integer y = 332
integer width = 59
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_ocshipreq_m
integer x = 1367
integer y = 16
integer width = 101
integer height = 80
boolean bringtotop = true
string dataobject = "d_ocshipreq_r"
boolean livescroll = true
end type

type dw_3 from datawindow within w_ocshipreq_m
integer x = 41
integer y = 1000
integer width = 3584
integer height = 1208
integer taborder = 60
string dataobject = "d_ocshipreq_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()

CHOOSE CASE dwo.name
	CASE 'do_no'
		wf_getdono(row, data)
END CHOOSE

end event

event buttonclicked;dwItemStatus l_status

this.accepttext()
this.scrolltorow(row)

openwithparm(w_whshipreq_w, ist_code)
ist_code = message.powerobjectparm

if ist_code.okcancel = 'N' then
	return
end if				  

dw_3.object.do_no[row] = ist_code.order_flag
wf_getdono(row, ist_code.order_flag)

l_status = dw_2.GetItemStatus(1, 0, Primary!)
if l_status = NotModified! or l_status = DataModified! then
	dw_3.object.doship_no[row] = dw_2.object.doship_no[1]
	if row > 1 then
		dw_3.object.seq[row] = dw_3.object.seq[row - 1] + 1
	end if
else
	dw_3.object.seq[row] = row
end if
RETURN 0
end event

type rb_1 from radiobutton within w_ocshipreq_m
integer x = 2560
integer y = 320
integer width = 247
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
string text = "미결"
boolean checked = true
end type

event clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
pb_save.enabled = true
pb_delete.enabled = true
is_oc = 'O'

end event

type rb_2 from radiobutton within w_ocshipreq_m
integer x = 2811
integer y = 320
integer width = 247
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
string text = "기결"
end type

event clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
pb_save.enabled = false
pb_delete.enabled = false
is_oc = 'Y'
end event

type rb_3 from radiobutton within w_ocshipreq_m
integer x = 3063
integer y = 320
integer width = 247
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

event clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
pb_save.enabled = false
pb_delete.enabled = false
is_oc = '%'
end event

