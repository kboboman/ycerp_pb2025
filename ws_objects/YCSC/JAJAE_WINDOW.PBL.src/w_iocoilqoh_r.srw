$PBExportHeader$w_iocoilqoh_r.srw
$PBExportComments$코일재고현황(1998/09/09,곽용덕)
forward
global type w_iocoilqoh_r from w_inheritance
end type
type gb_4 from gb_3 within w_iocoilqoh_r
end type
type cbx_1 from checkbox within w_iocoilqoh_r
end type
type cbx_2 from checkbox within w_iocoilqoh_r
end type
type cbx_3 from checkbox within w_iocoilqoh_r
end type
type cbx_4 from checkbox within w_iocoilqoh_r
end type
type cbx_5 from checkbox within w_iocoilqoh_r
end type
type dw_3 from datawindow within w_iocoilqoh_r
end type
type cbx_6 from checkbox within w_iocoilqoh_r
end type
type cbx_7 from checkbox within w_iocoilqoh_r
end type
type st_1 from statictext within w_iocoilqoh_r
end type
type st_2 from statictext within w_iocoilqoh_r
end type
type pb_1 from picturebutton within w_iocoilqoh_r
end type
type st_8 from statictext within w_iocoilqoh_r
end type
type ddlb_fld from dropdownlistbox within w_iocoilqoh_r
end type
type ddlb_dwtitles from dropdownlistbox within w_iocoilqoh_r
end type
type st_9 from statictext within w_iocoilqoh_r
end type
type ddlb_op from dropdownlistbox within w_iocoilqoh_r
end type
type sle_value from singlelineedit within w_iocoilqoh_r
end type
type cb_filteron from commandbutton within w_iocoilqoh_r
end type
type cb_filteroff from commandbutton within w_iocoilqoh_r
end type
type cb_1 from commandbutton within w_iocoilqoh_r
end type
type cb_2 from commandbutton within w_iocoilqoh_r
end type
type gb_5 from groupbox within w_iocoilqoh_r
end type
end forward

global type w_iocoilqoh_r from w_inheritance
integer width = 4562
integer height = 2668
string title = "코일재고 현황(w_iocoilqoh_r)"
gb_4 gb_4
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
cbx_5 cbx_5
dw_3 dw_3
cbx_6 cbx_6
cbx_7 cbx_7
st_1 st_1
st_2 st_2
pb_1 pb_1
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
gb_5 gb_5
end type
global w_iocoilqoh_r w_iocoilqoh_r

type variables

string is_loc, is_item, is_flag
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

string ls_loc

if gf_permission('코일재고현황관리open', gs_userid) = 'Y' then	
else
	messagebox("확인","이프로그램의 사용권한이 없습니다")
	pb_close.postevent(clicked!)
end if
	
if gf_permission('코일재고현황관리Print', gs_userid) = 'Y' then	
else
	pb_print.enabled = false
	pb_print_part.enabled = false
end if

datawindowchild ldwc_loc, ldwc_item

dw_3.settransobject(sqlca)
dw_3.visible = false
dw_2.insertrow(0)

dw_2.getchild("loc_no", ldwc_loc)
ldwc_loc.settransobject(SQLCA)

ldwc_loc.insertrow(1)
ldwc_loc.setitem(1, "loc_no", "%")
ldwc_loc.setitem(1, "loc_name", "전체")
ldwc_loc.setfilter("loc_no <> 'WS00000006'")
is_loc = "%"
dw_2.object.loc_no[1] = "%"

ldwc_loc.filter()

dw_2.getchild("item_no", ldwc_item)
ldwc_item.settransobject(SQLCA)
ldwc_item.insertrow(1)
ldwc_item.setitem(1, "item_no", "%")
ldwc_item.setitem(1, "item_name", "전체")

is_item = "%"
is_flag = "W"

end event

on w_iocoilqoh_r.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.dw_3=create dw_3
this.cbx_6=create cbx_6
this.cbx_7=create cbx_7
this.st_1=create st_1
this.st_2=create st_2
this.pb_1=create pb_1
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.cbx_2
this.Control[iCurrent+4]=this.cbx_3
this.Control[iCurrent+5]=this.cbx_4
this.Control[iCurrent+6]=this.cbx_5
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.cbx_6
this.Control[iCurrent+9]=this.cbx_7
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_9
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_filteron
this.Control[iCurrent+20]=this.cb_filteroff
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.cb_2
this.Control[iCurrent+23]=this.gb_5
end on

on w_iocoilqoh_r.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.dw_3)
destroy(this.cbx_6)
destroy(this.cbx_7)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.gb_5)
end on

event resize;call super::resize;//
dw_1.width  = newwidth  - 46
dw_1.height = newheight - 608

end event

type pb_save from w_inheritance`pb_save within w_iocoilqoh_r
boolean visible = false
integer x = 2683
end type

type dw_1 from w_inheritance`dw_1 within w_iocoilqoh_r
event mousemove pbm_dwnmousemove
integer x = 18
integer y = 556
integer width = 4480
integer height = 1956
string dataobject = "d_iocoilqoh_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::mousemove;if row < 1 then return
this.scrolltorow(row)
end event

event dw_1::doubleclicked;call super::doubleclicked;if dw_1.dataobject <> 'd_iocoilqoh_r4' or row < 1  then return

string lsa_loc[]
if w_iocoilqoh_r2.rb_1.checked = true then
	lsa_loc[1] = 'WS00000000'
	lsa_loc[2] = 'WS00000003'
	lsa_loc[3] = 'WW01'
	lsa_loc[4] = 'WW02'
	lsa_loc[5] = 'WW03'
end if
if w_iocoilqoh_r2.rb_2.checked = true then
	lsa_loc[1] = 'WS00000006'
	lsa_loc[2] = 'WW04'
end if
if w_iocoilqoh_r2.rb_3.checked = true then
	lsa_loc[1] = 'WS00000008'
end if

string lsa_item_no[], ls_qa
lsa_item_no[1] = trim(this.object.coilmst_item_no[row])
ls_qa = trim(this.object.c_qa[row]) + '%'

string lsa_oc[]
lsa_oc[1] = 'O'
lsa_oc[2] = 'M'
lsa_oc[3] = 'P'
lsa_oc[4] = 'S'

st_1.text = '규격별 코일재고 상세현황'
st_1.visible = true
w_iocoilqoh_r.pb_print_part.text = '' // 이전화면
w_iocoilqoh_r.pb_print_part.picturename = 'C:\bmp\왼쪽화살표_가능.bmp'
w_iocoilqoh_r.pb_print_part.enabled = true

dw_1.dataobject = 'd_iocoilqoh_r4_1'
dw_1.settransobject(sqlca)
if dw_1.retrieve( lsa_loc, lsa_item_no, '%', lsa_oc, 'Y', 'Y', ls_qa ) < 1 then
	messagebox('확인', '조건에 만족하는 자료가 없습니다.')
end if

	
end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_iocoilqoh_r
integer x = 46
integer y = 260
integer width = 2766
integer height = 84
string dataobject = "d_iocoilqoh_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;//
this.accepttext()

is_loc  = trim(this.object.loc_no[1])
is_item = trim(this.object.item_no[1])
is_flag = trim(this.object.flag[1])
if dwo.name = 'flag' then
	if data = 'S' then
		dw_1.dataobject = 'd_iocoilqoh_r1'
	else
		dw_1.dataobject = 'd_iocoilqoh_r'
	end if
end if
//is_oc = trim(this.object.oc[1])

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )


end event

type st_title from w_inheritance`st_title within w_iocoilqoh_r
integer width = 1033
string text = "코일재고 현황"
end type

type st_tips from w_inheritance`st_tips within w_iocoilqoh_r
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilqoh_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_iocoilqoh_r
integer x = 3506
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "실사목록"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;if dw_1.dataobject = 'd_iocoilqoh_r4_1' then
	string ls_item_name, ls_item_no, as_item_no[]
	integer li_dw1row
	li_dw1row = w_iocoilqoh_r2.dw_1.getrow()
	ls_item_name = trim(w_iocoilqoh_r2.dw_1.object.groupitem_item_name[li_dw1row])
	
	integer li_i
	li_i = 1
	declare get_coil_no cursor for
	select top 100 t_coil.item_no from 
		(select item_no, replace(item_name, '스리팅 ', '') as grp from groupitem
		where item_name like '%coil%'
			 and use_flag = 'Y'  ) t_coil
		where t_coil.grp = :ls_item_name
		order by t_coil.item_no ;
	
	open get_coil_no;
	
	FETCH get_coil_no into :ls_item_no;
	DO WHILE sqlca.sqlcode = 0
		as_item_no[li_i] = ls_item_no
		li_i = li_i + 1
		FETCH get_coil_no INTO :ls_item_no;
	LOOP
	close get_coil_no;
	
	string lsa_oc[]
	lsa_oc[1] = 'O'
	lsa_oc[2] = 'M'
	lsa_oc[3] = 'P'
	lsa_oc[4] = 'S'
	
	string lsa_loc[]
	if w_iocoilqoh_r2.rb_1.checked = true then
		lsa_loc[1] = 'WS00000000'
		lsa_loc[2] = 'WS00000003'
		lsa_loc[3] = 'WW01'
		lsa_loc[4] = 'WW02'
		lsa_loc[5] = 'WW03'
	end if
	if w_iocoilqoh_r2.rb_2.checked = true then
		lsa_loc[1] = 'WS00000006'
		lsa_loc[2] = 'WW04'
	end if
	if w_iocoilqoh_r2.rb_3.checked = true then
		lsa_loc[1] = 'WS00000008'
	end if
	
	
//	opensheet(w_iocoilqoh_r, w_i_main, 5, original!)
	
	w_iocoilqoh_r.dw_2.visible = false
	w_iocoilqoh_r.cbx_1.enabled = false
	w_iocoilqoh_r.cbx_2.enabled = false
	w_iocoilqoh_r.cbx_3.enabled = false
	w_iocoilqoh_r.cbx_4.enabled = false
	w_iocoilqoh_r.cbx_5.enabled = false
	w_iocoilqoh_r.cbx_6.enabled = false
	w_iocoilqoh_r.cbx_7.enabled = false
	w_iocoilqoh_r.pb_retrieve.enabled = false
	
	w_iocoilqoh_r.pb_print.enabled = true
	w_iocoilqoh_r.cbx_6.checked = true
	w_iocoilqoh_r.cbx_7.checked = true
	
	if w_iocoilqoh_r2.rb_1.checked = true then
		w_iocoilqoh_r.st_title.text = '시화 코일재고현황'
	end if
	if w_iocoilqoh_r2.rb_2.checked = true then
		w_iocoilqoh_r.st_title.text = 'YSP 코일재고현황'
	end if
	if w_iocoilqoh_r2.rb_3.checked = true then
		w_iocoilqoh_r.st_title.text = '화성 코일재고현황'
	end if
	
	w_iocoilqoh_r.st_1.text = '규격별 코일재고 집계현황'
	w_iocoilqoh_r.st_1.visible = true
	w_iocoilqoh_r.pb_print_part.text = '실사목록'
	w_iocoilqoh_r.pb_print_part.picturename = ''
	w_iocoilqoh_r.pb_print_part.enabled = false

	w_iocoilqoh_r.dw_1.dataobject = 'd_iocoilqoh_r4'
	w_iocoilqoh_r.dw_1.settransobject(sqlca)
	if w_iocoilqoh_r.dw_1.retrieve( lsa_loc, as_item_no, '%' , lsa_oc, 'Y', 'Y' ) < 1 then
		messagebox('확인', '조건에 만족하는 자료가 없습니다.')
	end if

else
	w_repsuper w_print
	st_print l_print
	//===============사용자별 프로그램 사용현황=================================
	gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
	//==========================================================================
	dw_1.sharedata(dw_3)
	
	l_print.st_datawindow = dw_3
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc = " 이 프로그램은 코일재고실사내역을 출력합니다." 
	
	
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
							 'Datawindow.Zoom=100'
	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end if
end event

type pb_close from w_inheritance`pb_close within w_iocoilqoh_r
integer x = 4288
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilqoh_r
integer x = 3895
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 코일재고내역을 출력합니다." 

if dw_1.dataobject = 'd_iocoilqoh_r4' then
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
							 'Datawindow.Zoom=100'
else
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
							 'Datawindow.Zoom=93'
end if

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iocoilqoh_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_iocoilqoh_r
boolean visible = false
integer x = 2299
end type

type pb_insert from w_inheritance`pb_insert within w_iocoilqoh_r
boolean visible = false
integer x = 2107
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilqoh_r
integer x = 3703
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_oc[5], ls_work_chk, ls_stock_chk
int    li_int

for li_int = 1 to 5
	setnull(ls_oc[li_int])
next

li_int = 1
if cbx_1.checked = true then	// 재고
	ls_oc[li_int] = "O"
	li_int = li_int + 1
end if
if cbx_2.checked = true then	// 계획
	ls_oc[li_int] =  "M"
	li_int = li_int + 1
end if
if cbx_3.checked = true then	// 작업지시
	ls_oc[li_int] =  "P"
	li_int = li_int + 1
end if
if cbx_4.checked = true then	// 외주가공
	ls_oc[li_int] =  "S"
	li_int = li_int + 1
end if
if cbx_5.checked = true then	// 완료
	ls_oc[li_int] =  "C"
	li_int = li_int + 1
end if

dw_1.settransobject(sqlca)

if cbx_6.checked = true then	// 작업장
	ls_work_chk = 'Y'	
else
	ls_work_chk = 'N'	
end if	
if cbx_7.checked = true then	// 장기
	ls_stock_chk = 'Y'	
else
	ls_stock_chk = 'N'	
end if	

dw_1.retrieve( is_loc, is_item, is_flag, ls_oc, ls_work_chk, ls_stock_chk )
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_iocoilqoh_r
integer x = 1957
integer y = 8
integer width = 1504
integer height = 208
integer textsize = -10
long textcolor = 0
long backcolor = 81838264
string text = "상태"
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilqoh_r
integer x = 18
integer y = 216
integer width = 2807
integer height = 144
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilqoh_r
integer x = 3474
integer y = 8
integer width = 1029
integer height = 208
integer textsize = -10
long backcolor = 81838264
end type

type gb_4 from gb_3 within w_iocoilqoh_r
integer x = 1527
integer width = 416
integer taborder = 70
string text = "저장소"
end type

type cbx_1 from checkbox within w_iocoilqoh_r
integer x = 1998
integer y = 104
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "재고"
boolean checked = true
end type

type cbx_2 from checkbox within w_iocoilqoh_r
integer x = 2249
integer y = 104
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "계획"
boolean checked = true
end type

type cbx_3 from checkbox within w_iocoilqoh_r
integer x = 2501
integer y = 104
integer width = 352
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "작업지시"
boolean checked = true
end type

type cbx_4 from checkbox within w_iocoilqoh_r
integer x = 2857
integer y = 104
integer width = 352
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주가공"
boolean checked = true
end type

type cbx_5 from checkbox within w_iocoilqoh_r
integer x = 3214
integer y = 104
integer width = 229
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "완료"
end type

type dw_3 from datawindow within w_iocoilqoh_r
integer x = 1006
integer y = 20
integer width = 110
integer height = 84
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_iocoilqoh_r11"
boolean livescroll = true
end type

type cbx_6 from checkbox within w_iocoilqoh_r
integer x = 1582
integer y = 68
integer width = 293
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "작업장"
end type

type cbx_7 from checkbox within w_iocoilqoh_r
integer x = 1582
integer y = 128
integer width = 293
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "장기"
end type

type st_1 from statictext within w_iocoilqoh_r
boolean visible = false
integer x = 119
integer y = 260
integer width = 1390
integer height = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_2 from statictext within w_iocoilqoh_r
integer x = 3689
integer y = 300
integer width = 814
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "코일재고현황관리open 권한"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_iocoilqoh_r
event mousemove pbm_mousemove
integer x = 4087
integer y = 52
integer width = 187
integer height = 144
integer taborder = 130
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
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
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

type st_8 from statictext within w_iocoilqoh_r
integer x = 128
integer y = 444
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

type ddlb_fld from dropdownlistbox within w_iocoilqoh_r
integer x = 311
integer y = 424
integer width = 480
integer height = 580
integer taborder = 100
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

type ddlb_dwtitles from dropdownlistbox within w_iocoilqoh_r
integer x = 370
integer y = 432
integer width = 306
integer height = 92
integer taborder = 110
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

type st_9 from statictext within w_iocoilqoh_r
integer x = 827
integer y = 444
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_iocoilqoh_r
integer x = 1001
integer y = 424
integer width = 261
integer height = 500
integer taborder = 110
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_iocoilqoh_r
integer x = 1275
integer y = 428
integer width = 581
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
end type

type cb_filteron from commandbutton within w_iocoilqoh_r
integer x = 1870
integer y = 424
integer width = 197
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
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
arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_iocoilqoh_r
integer x = 2071
integer y = 424
integer width = 197
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_iocoilqoh_r
integer x = 2272
integer y = 424
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_iocoilqoh_r
integer x = 2459
integer y = 424
integer width = 183
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
arg_dw.groupcalc()

end event

type gb_5 from groupbox within w_iocoilqoh_r
integer x = 18
integer y = 368
integer width = 4480
integer height = 168
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

