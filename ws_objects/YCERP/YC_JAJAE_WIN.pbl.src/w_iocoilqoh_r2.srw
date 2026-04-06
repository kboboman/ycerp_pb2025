$PBExportHeader$w_iocoilqoh_r2.srw
$PBExportComments$품목별 코일재고현황(2004/02/24,정갑용)
forward 
global type w_iocoilqoh_r2 from w_inheritance
end type
type rb_4 from radiobutton within w_iocoilqoh_r2
end type
type rb_5 from radiobutton within w_iocoilqoh_r2
end type
type rb_6 from radiobutton within w_iocoilqoh_r2
end type
type rb_7 from radiobutton within w_iocoilqoh_r2
end type
type tab_1 from tab within w_iocoilqoh_r2
end type
type tabpage_1 from userobject within tab_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type sle_1 from singlelineedit within tabpage_1
end type
type ddlb_2 from dropdownlistbox within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
ddlb_2 ddlb_2
st_2 st_2
ddlb_1 ddlb_1
st_1 st_1
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type cb_16 from commandbutton within tabpage_2
end type
type cb_15 from commandbutton within tabpage_2
end type
type cb_14 from commandbutton within tabpage_2
end type
type cb_10 from commandbutton within tabpage_2
end type
type sle_value from singlelineedit within tabpage_2
end type
type ddlb_op from dropdownlistbox within tabpage_2
end type
type st_14 from statictext within tabpage_2
end type
type ddlb_fld from dropdownlistbox within tabpage_2
end type
type st_13 from statictext within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_16 cb_16
cb_15 cb_15
cb_14 cb_14
cb_10 cb_10
sle_value sle_value
ddlb_op ddlb_op
st_14 st_14
ddlb_fld ddlb_fld
st_13 st_13
dw_4 dw_4
end type
type tab_1 from tab within w_iocoilqoh_r2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type rb_1 from radiobutton within w_iocoilqoh_r2
end type
type rb_2 from radiobutton within w_iocoilqoh_r2
end type
type rb_3 from radiobutton within w_iocoilqoh_r2
end type
type pb_2 from picturebutton within w_iocoilqoh_r2
end type
type em_1 from editmask within w_iocoilqoh_r2
end type
type gb_4 from groupbox within w_iocoilqoh_r2
end type
end forward

global type w_iocoilqoh_r2 from w_inheritance
integer width = 4562
integer height = 2668
string title = "코일재고 현황(품목별)(w_iocoilqoh_r2)"
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
tab_1 tab_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
pb_2 pb_2
em_1 em_1
gb_4 gb_4
end type
global w_iocoilqoh_r2 w_iocoilqoh_r2

type variables


end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if gf_permission('품목별코일재고현황관리Open', gs_userid) = 'Y' then	
else
	messagebox("확인","이프로그램의 사용권한이 없습니다")
	pb_close.postevent(clicked!)
end if

if gf_permission('품목별코일재고현황관리Print', gs_userid) = 'Y' then	
else
	pb_print.enabled = false
end if

dw_1.visible = false
dw_2.visible = false

em_1.text = string(today(),'yyyy/mm/dd')

tab_1.tabpage_1.dw_3.SetTransObject(sqlca)
tab_1.tabpage_2.dw_4.SetTransObject(sqlca)
dw_1.SetTransObject(sqlca)
dw_1.ShareData(dw_2)

end event

on w_iocoilqoh_r2.create
int iCurrent
call super::create
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.tab_1=create tab_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.pb_2=create pb_2
this.em_1=create em_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_4
this.Control[iCurrent+2]=this.rb_5
this.Control[iCurrent+3]=this.rb_6
this.Control[iCurrent+4]=this.rb_7
this.Control[iCurrent+5]=this.tab_1
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_3
this.Control[iCurrent+9]=this.pb_2
this.Control[iCurrent+10]=this.em_1
this.Control[iCurrent+11]=this.gb_4
end on

on w_iocoilqoh_r2.destroy
call super::destroy
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.tab_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.pb_2)
destroy(this.em_1)
destroy(this.gb_4)
end on

event resize;call super::resize;tab_1.width  = this.width - 109
tab_1.height = this.height - 368

tab_1.tabpage_1.dw_3.width  = tab_1.width - 83
tab_1.tabpage_1.dw_3.height = tab_1.height - 292

tab_1.tabpage_2.dw_4.width  = tab_1.width - 83
tab_1.tabpage_2.dw_4.height = tab_1.height - 292

end event

type pb_save from w_inheritance`pb_save within w_iocoilqoh_r2
boolean visible = false
integer x = 2683
end type

type dw_1 from w_inheritance`dw_1 within w_iocoilqoh_r2
event mousemove pbm_dwnmousemove
integer x = 1330
integer y = 16
integer width = 128
integer height = 96
string dataobject = "d_iocoilqoh_s2"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::mousemove;if row < 1 then return
this.scrolltorow(row)
end event

event dw_1::doubleclicked;call super::doubleclicked;// row 의 원/스리팅 코일번호로 상세조회(코일재고현황) 호출
if row < 1 then return

string lsa_oc[]
lsa_oc[1] = 'O'
lsa_oc[2] = 'M'
lsa_oc[3] = 'P'
lsa_oc[4] = 'S'

string lsa_loc[]
if rb_1.checked = true then
	lsa_loc[1] = 'WS00000000'
	lsa_loc[2] = 'WS00000003'
	lsa_loc[3] = 'WW01'
	lsa_loc[4] = 'WW02'
	lsa_loc[5] = 'WW03'
end if
if rb_2.checked = true then
	lsa_loc[1] = 'WS00000006'
	lsa_loc[2] = 'WW04'
end if
if rb_3.checked = true then
	lsa_loc[1] = 'WS00000008'
end if

opensheet(w_iocoilqoh_r, w_i_main, 5, original!)

w_iocoilqoh_r.dw_2.visible = false
w_iocoilqoh_r.cbx_1.enabled = false
w_iocoilqoh_r.cbx_2.enabled = false
w_iocoilqoh_r.cbx_3.enabled = false
w_iocoilqoh_r.cbx_4.enabled = false
w_iocoilqoh_r.cbx_5.enabled = false
w_iocoilqoh_r.cbx_6.enabled = false
w_iocoilqoh_r.cbx_7.enabled = false
w_iocoilqoh_r.pb_print_part.enabled = false
w_iocoilqoh_r.pb_retrieve.enabled = false

w_iocoilqoh_r.pb_print.enabled = true
w_iocoilqoh_r.cbx_6.checked = true
w_iocoilqoh_r.cbx_7.checked = true

if rb_1.checked = true then
	w_iocoilqoh_r.st_title.text = '시화 코일재고현황'
end if
if rb_2.checked = true then
	w_iocoilqoh_r.st_title.text = 'YSP 코일재고현황'
end if
if rb_3.checked = true then
	w_iocoilqoh_r.st_title.text = '화성 코일재고현황'
end if

string ls_item_name, lsa_item_no[]
integer li_i
ls_item_name = trim(this.object.groupitem_item_name[row])

if dw_1.dataobject <> 'd_iocoilqoh_s2_1' then
	string ls_item_no

	li_i = 1
	declare get_coil_no1 cursor for
	select top 100 t_coil.item_no from 
		(select item_no, replace(item_name, '스리팅 ', '') as grp from groupitem
		where item_name like '%coil%'
			 and use_flag = 'Y'  ) t_coil
		where t_coil.grp = :ls_item_name
		order by t_coil.item_no ;
	
	open get_coil_no1;
	
	FETCH get_coil_no1 into :ls_item_no;
	DO WHILE sqlca.sqlcode = 0
		lsa_item_no[li_i] = ls_item_no
		li_i = li_i + 1
		FETCH get_coil_no1 INTO :ls_item_no;
	LOOP
	close get_coil_no1;
	
	w_iocoilqoh_r.st_1.text = '규격별 코일재고 집계현황'
	w_iocoilqoh_r.st_1.visible = true
	w_iocoilqoh_r.dw_1.dataobject = 'd_iocoilqoh_r4'
	w_iocoilqoh_r.dw_1.settransobject(sqlca)
	if w_iocoilqoh_r.dw_1.retrieve( lsa_loc, lsa_item_no, '%' , lsa_oc, 'Y', 'Y' ) < 1 then
		messagebox('확인', '조건에 만족하는 자료가 없습니다.')
	end if
else
	li_i = 1
	declare get_coil_no2 cursor for
	select top 100 t_coil.item_no from 
		(select item_no, replace(item_name, '스리팅 ', '') as grp from groupitem
		where item_name like '%coil%'
			 and use_flag = 'Y'  ) t_coil
		where t_coil.grp = :ls_item_name
		order by t_coil.item_no ;
	
	open get_coil_no2;
	
	FETCH get_coil_no2 into :ls_item_no;
	DO WHILE sqlca.sqlcode = 0
		lsa_item_no[li_i] = ls_item_no
		li_i = li_i + 1
		FETCH get_coil_no2 INTO :ls_item_no;
	LOOP
	close get_coil_no2;

	string ls_qa
	ls_qa = trim(this.object.c_qa[row]) + '%'
	
	w_iocoilqoh_r.st_1.text = '규격별 코일재고 상세현황'
	w_iocoilqoh_r.st_1.visible = true
	w_iocoilqoh_r.pb_print_part.text = '실사목록' 
	w_iocoilqoh_r.pb_print_part.picturename = ''
	w_iocoilqoh_r.pb_print_part.enabled = false
	
	w_iocoilqoh_r.dw_1.dataobject = 'd_iocoilqoh_r4_1'
	w_iocoilqoh_r.dw_1.settransobject(sqlca)
	if w_iocoilqoh_r.dw_1.retrieve( lsa_loc, lsa_item_no, '%', lsa_oc, 'Y', 'Y', ls_qa ) < 1 then
		messagebox('확인', '조건에 만족하는 자료가 없습니다.')
	end if
end if
end event

type st_title from w_inheritance`st_title within w_iocoilqoh_r2
integer x = 37
integer width = 1449
integer height = 136
string text = "코일재고 현황(품목별)"
end type

type st_tips from w_inheritance`st_tips within w_iocoilqoh_r2
end type

type pb_compute from w_inheritance`pb_compute within w_iocoilqoh_r2
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_iocoilqoh_r2
boolean visible = false
integer x = 2702
integer y = 48
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_iocoilqoh_r2
integer x = 4261
integer y = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iocoilqoh_r2
integer x = 3863
integer y = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 코일재고내역을 출력합니다." 

if dw_1.dataobject  = 'd_iocoilqoh_s2_1' then
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90'
else
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
end if
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iocoilqoh_r2
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_iocoilqoh_r2
boolean visible = false
integer x = 2299
end type

type pb_insert from w_inheritance`pb_insert within w_iocoilqoh_r2
boolean visible = false
integer x = 2107
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iocoilqoh_r2
integer x = 3671
integer y = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String ls_date

dw_1.SetTransObject(sqlca)
dw_1.ShareData(dw_2)

tab_1.tabpage_1.dw_3.SetTransObject(sqlca)
tab_1.tabpage_2.dw_4.SetTransObject(sqlca)

ls_date = em_1.text

dw_1.retrieve()
tab_1.tabpage_1.dw_3.retrieve()
tab_1.tabpage_2.dw_4.retrieve(ls_date)

end event

type gb_3 from w_inheritance`gb_3 within w_iocoilqoh_r2
integer x = 3045
integer y = 16
integer width = 571
integer height = 208
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 81838264
string text = "품목"
end type

type gb_2 from w_inheritance`gb_2 within w_iocoilqoh_r2
integer x = 2400
integer y = 16
integer width = 626
integer height = 208
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "사업장"
end type

type gb_1 from w_inheritance`gb_1 within w_iocoilqoh_r2
integer x = 3634
integer y = 16
integer width = 850
integer height = 208
integer textsize = -10
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_iocoilqoh_r2
integer x = 1486
integer y = 20
integer width = 128
integer height = 96
string dataobject = "d_iocoilqoh_r2"
boolean vscrollbar = false
boolean livescroll = false
end type

type rb_4 from radiobutton within w_iocoilqoh_r2
integer x = 3086
integer y = 84
integer width = 215
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

event clicked;//
if dw_1.dataobject = 'd_iocoilqoh_s2_1' then
	dw_1.dataobject = 'd_iocoilqoh_s2'
	dw_2.dataobject = 'd_iocoilqoh_r2'
	dw_1.settransobject(sqlca)
	dw_1.ShareData(dw_2)
	dw_1.retrieve()
end if
dw_1.setfilter('')
dw_1.filter()



end event

type rb_5 from radiobutton within w_iocoilqoh_r2
integer x = 3328
integer y = 84
integer width = 215
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
string text = "GI"
end type

event clicked;//
if dw_1.dataobject = 'd_iocoilqoh_s2_1' then
	dw_1.dataobject = 'd_iocoilqoh_s2'
	dw_2.dataobject = 'd_iocoilqoh_r2'
	dw_1.settransobject(sqlca)
	dw_1.ShareData(dw_2)
	dw_1.retrieve()
end if
dw_1.setfilter("left(groupitem_item_name, 2) = 'GI'")
dw_1.filter()

end event

type rb_6 from radiobutton within w_iocoilqoh_r2
integer x = 3086
integer y = 148
integer width = 215
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
string text = "AL"
end type

event clicked;//
if dw_1.dataobject = 'd_iocoilqoh_s2' then
	dw_1.dataobject = 'd_iocoilqoh_s2_1'
	dw_2.dataobject = 'd_iocoilqoh_r2_1'
	dw_1.settransobject(sqlca)
	dw_1.ShareData(dw_2)
	dw_1.retrieve()
else
	dw_1.setfilter("left(groupitem_item_name, 2 ) = 'AL'")
	dw_1.filter()
end if
end event

type rb_7 from radiobutton within w_iocoilqoh_r2
integer x = 3328
integer y = 148
integer width = 215
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
string text = "기타"
end type

event clicked;//
if dw_1.dataobject = 'd_iocoilqoh_s2_1' then
	dw_1.dataobject = 'd_iocoilqoh_s2'
	dw_2.dataobject = 'd_iocoilqoh_r2'
	dw_1.settransobject(sqlca)
	dw_1.ShareData(dw_2)
	dw_1.retrieve()
end if
dw_1.setfilter("left(groupitem_item_name, 2) <> 'GI' and  left(groupitem_item_name, 2) <> 'AL'")
dw_1.filter()

end event

type tab_1 from tab within w_iocoilqoh_r2
event create ( )
event destroy ( )
integer x = 32
integer y = 248
integer width = 4453
integer height = 2300
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4416
integer height = 2172
long backcolor = 79741120
string text = "재고현황"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "CrossTab!"
long picturemaskcolor = 536870912
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
ddlb_2 ddlb_2
st_2 st_2
ddlb_1 ddlb_1
st_1 st_1
dw_3 dw_3
end type

on tabpage_1.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.ddlb_2=create ddlb_2
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.dw_3=create dw_3
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_1,&
this.ddlb_2,&
this.st_2,&
this.ddlb_1,&
this.st_1,&
this.dw_3}
end on

on tabpage_1.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.ddlb_2)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.dw_3)
end on

type cb_4 from commandbutton within tabpage_1
integer x = 2249
integer y = 40
integer width = 146
integer height = 76
integer taborder = 190
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

event clicked;////
//string ls_col
//choose case trim(ddlb_fld.text)
//	case "품명"
//		ls_col  = "item_name"
//	case "규격"
//		ls_col  = "qa"
//	case "단위"
//		ls_col  = "uom"
//	case "수량"
//		ls_col  = "qty"
//	case "환산수량"
//		ls_col  = "c_qty"
//	case "단가"
//		ls_col  = "c_price"
//	case "공급가액"
//		ls_col  = "c_amt"
//	case "세액"
//		ls_col  = "c_rate"
//	case "합계"
//		ls_col  = "c_tot"
//end choose
//
//dw_1.SetSort(ls_col + " D")
//dw_1.sort()
//
end event

type cb_3 from commandbutton within tabpage_1
integer x = 2103
integer y = 40
integer width = 146
integer height = 76
integer taborder = 180
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

event clicked;////
//string ls_col
//choose case trim(ddlb_fld.text)
//	case "품명"
//		ls_col  = "item_name"
//	case "규격"
//		ls_col  = "qa"
//	case "단위"
//		ls_col  = "uom"
//	case "수량"
//		ls_col  = "qty"
//	case "환산수량"
//		ls_col  = "c_qty"
//	case "단가"
//		ls_col  = "c_price"
//	case "공급가액"
//		ls_col  = "c_amt"
//	case "세액"
//		ls_col  = "c_rate"
//	case "합계"
//		ls_col  = "c_tot"
//end choose
//
//dw_1.SetSort(ls_col + " A")
//dw_1.sort()
//
end event

type cb_2 from commandbutton within tabpage_1
integer x = 1952
integer y = 40
integer width = 146
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "해지"
end type

event clicked;////
//ddlb_fld.text  = "물품명"
//ddlb_op.text   = "LIKE"
//sle_value.text = ""
//
//dw_1.setfilter("")
//dw_1.filter()
//
//pb_retrieve.triggerevent(clicked!)
//dw_1.scrolltorow(1)
//
end event

type cb_1 from commandbutton within tabpage_1
integer x = 1801
integer y = 40
integer width = 146
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "필터"
end type

event clicked;//string ls_custnm, ls_column, ls_value, ls_temp
//
//ls_temp = ""
//if dw_1.FilteredCount() > 0 THEN
//	dw_1.setfilter(ls_temp)
//	dw_1.filter()
//end if
//
//// 필드
//if trim(ddlb_fld.text) = "" then
//	ls_column = ""
//else
//	string ls_col
//	choose case trim(ddlb_fld.text)
//		case "품명"
//			ls_col  = "item_name"
//		case "규격"
//			ls_col  = "qa"
//		case "단위"
//			ls_col  = "uom"
//		case "수량"
//			ls_col  = "qty"
//		case "환산수량"
//			ls_col  = "c_qty"
//		case "단가"
//			ls_col  = "c_price"
//		case "공급가액"
//			ls_col  = "c_amt"
//		case "세액"
//			ls_col  = "c_rate"
//		case "합계"
//			ls_col  = "c_tot"
//	end choose
//	
//	ls_col = ls_col + " "
//	if trim(ddlb_op.text) = "LIKE" then
//		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
//	else
//		choose case ls_col
//			case "insp_log_date"
//				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
//			case "ship_qty", "c_qty", "c_price", "c_amt", "c_rate", "c_tot"
//				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
//			case else
//				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
//		end choose 
//	end if
//end if
//
//if ls_column = "" then
//	ls_temp = ls_column
//else
//	ls_temp = "(" + ls_column + ")"
//end if
//
//if ls_value <> "" then
//	if ls_temp = "" then
//		ls_temp = ls_value
//	else
//		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
//	end if
//end if
//
//dw_1.setfilter(ls_temp)
//dw_1.filter()
//
//dw_1.scrolltorow(1)
//
//
end event

type sle_1 from singlelineedit within tabpage_1
integer x = 1088
integer y = 40
integer width = 704
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

type ddlb_2 from dropdownlistbox within tabpage_1
integer x = 795
integer y = 40
integer width = 279
integer height = 512
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_2 from statictext within tabpage_1
integer x = 626
integer y = 56
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

type ddlb_1 from dropdownlistbox within tabpage_1
integer x = 206
integer y = 40
integer width = 402
integer height = 532
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"품명","규격","단위","수량","환산수량","단가","공급가액","세액","합계"}
end type

type st_1 from statictext within tabpage_1
integer x = 32
integer y = 56
integer width = 160
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

type dw_3 from datawindow within tabpage_1
event mousemove pbm_dwnmousemove
integer x = 23
integer y = 140
integer width = 4370
integer height = 2008
integer taborder = 70
string title = "none"
string dataobject = "d_iocoilqoh_s2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;if row < 1 then return
this.scrolltorow(row)
end event

event doubleclicked;// row 의 원/스리팅 코일번호로 상세조회(코일재고현황) 호출
if row < 1 then return

string lsa_oc[]
lsa_oc[1] = 'O'
lsa_oc[2] = 'M'
lsa_oc[3] = 'P'
lsa_oc[4] = 'S'

string lsa_loc[]
if rb_1.checked = true then
	lsa_loc[1] = 'WS00000000'
	lsa_loc[2] = 'WS00000003'
	lsa_loc[3] = 'WW01'
	lsa_loc[4] = 'WW02'
	lsa_loc[5] = 'WW03'
end if
if rb_2.checked = true then
	lsa_loc[1] = 'WS00000006'
	lsa_loc[2] = 'WW04'
end if
if rb_3.checked = true then
	lsa_loc[1] = 'WS00000008'
end if

opensheet(w_iocoilqoh_r, w_i_main, 5, original!)

w_iocoilqoh_r.dw_2.visible = false
w_iocoilqoh_r.cbx_1.enabled = false
w_iocoilqoh_r.cbx_2.enabled = false
w_iocoilqoh_r.cbx_3.enabled = false
w_iocoilqoh_r.cbx_4.enabled = false
w_iocoilqoh_r.cbx_5.enabled = false
w_iocoilqoh_r.cbx_6.enabled = false
w_iocoilqoh_r.cbx_7.enabled = false
w_iocoilqoh_r.pb_print_part.enabled = false
w_iocoilqoh_r.pb_retrieve.enabled = false

w_iocoilqoh_r.pb_print.enabled = true
w_iocoilqoh_r.cbx_6.checked = true
w_iocoilqoh_r.cbx_7.checked = true

if rb_1.checked = true then
	w_iocoilqoh_r.st_title.text = '시화 코일재고현황'
end if
if rb_2.checked = true then
	w_iocoilqoh_r.st_title.text = 'YSP 코일재고현황'
end if
if rb_3.checked = true then
	w_iocoilqoh_r.st_title.text = '화성 코일재고현황'
end if

string ls_item_name, lsa_item_no[]
integer li_i
ls_item_name = trim(this.object.groupitem_item_name[row])

if dw_1.dataobject <> 'd_iocoilqoh_s2_1' then
	string ls_item_no

	li_i = 1
	declare get_coil_no1 cursor for
	select top 100 t_coil.item_no from 
		(select item_no, replace(item_name, '스리팅 ', '') as grp from groupitem
		where item_name like '%coil%'
			 and use_flag = 'Y'  ) t_coil
		where t_coil.grp = :ls_item_name
		order by t_coil.item_no ;
	
	open get_coil_no1;
	
	FETCH get_coil_no1 into :ls_item_no;
	DO WHILE sqlca.sqlcode = 0
		lsa_item_no[li_i] = ls_item_no
		li_i = li_i + 1
		FETCH get_coil_no1 INTO :ls_item_no;
	LOOP
	close get_coil_no1;
	
	w_iocoilqoh_r.st_1.text = '규격별 코일재고 집계현황'
	w_iocoilqoh_r.st_1.visible = true
	w_iocoilqoh_r.dw_1.dataobject = 'd_iocoilqoh_r4'
	w_iocoilqoh_r.dw_1.settransobject(sqlca)
	if w_iocoilqoh_r.dw_1.retrieve( lsa_loc, lsa_item_no, '%' , lsa_oc, 'Y', 'Y' ) < 1 then
		messagebox('확인', '조건에 만족하는 자료가 없습니다.')
	end if
else
	li_i = 1
	declare get_coil_no2 cursor for
	select top 100 t_coil.item_no from 
		(select item_no, replace(item_name, '스리팅 ', '') as grp from groupitem
		where item_name like '%coil%'
			 and use_flag = 'Y'  ) t_coil
		where t_coil.grp = :ls_item_name
		order by t_coil.item_no ;
	
	open get_coil_no2;
	
	FETCH get_coil_no2 into :ls_item_no;
	DO WHILE sqlca.sqlcode = 0
		lsa_item_no[li_i] = ls_item_no
		li_i = li_i + 1
		FETCH get_coil_no2 INTO :ls_item_no;
	LOOP
	close get_coil_no2;

	string ls_qa
	ls_qa = trim(this.object.c_qa[row]) + '%'
	
	w_iocoilqoh_r.st_1.text = '규격별 코일재고 상세현황'
	w_iocoilqoh_r.st_1.visible = true
	w_iocoilqoh_r.pb_print_part.text = '실사목록' 
	w_iocoilqoh_r.pb_print_part.picturename = ''
	w_iocoilqoh_r.pb_print_part.enabled = false
	
	w_iocoilqoh_r.dw_1.dataobject = 'd_iocoilqoh_r4_1'
	w_iocoilqoh_r.dw_1.settransobject(sqlca)
	if w_iocoilqoh_r.dw_1.retrieve( lsa_loc, lsa_item_no, '%', lsa_oc, 'Y', 'Y', ls_qa ) < 1 then
		messagebox('확인', '조건에 만족하는 자료가 없습니다.')
	end if
end if
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4416
integer height = 2172
long backcolor = 79741120
string text = "재고내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Database!"
long picturemaskcolor = 536870912
cb_16 cb_16
cb_15 cb_15
cb_14 cb_14
cb_10 cb_10
sle_value sle_value
ddlb_op ddlb_op
st_14 st_14
ddlb_fld ddlb_fld
st_13 st_13
dw_4 dw_4
end type

on tabpage_2.create
this.cb_16=create cb_16
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_10=create cb_10
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_14=create st_14
this.ddlb_fld=create ddlb_fld
this.st_13=create st_13
this.dw_4=create dw_4
this.Control[]={this.cb_16,&
this.cb_15,&
this.cb_14,&
this.cb_10,&
this.sle_value,&
this.ddlb_op,&
this.st_14,&
this.ddlb_fld,&
this.st_13,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.cb_16)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_10)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_14)
destroy(this.ddlb_fld)
destroy(this.st_13)
destroy(this.dw_4)
end on

type cb_16 from commandbutton within tabpage_2
integer x = 2249
integer y = 40
integer width = 146
integer height = 76
integer taborder = 90
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

event clicked;////
//string ls_col
//choose case trim(ddlb_fld.text)
//	case "품명"
//		ls_col  = "item_name"
//	case "규격"
//		ls_col  = "qa"
//	case "단위"
//		ls_col  = "uom"
//	case "수량"
//		ls_col  = "qty"
//	case "환산수량"
//		ls_col  = "c_qty"
//	case "단가"
//		ls_col  = "c_price"
//	case "공급가액"
//		ls_col  = "c_amt"
//	case "세액"
//		ls_col  = "c_rate"
//	case "합계"
//		ls_col  = "c_tot"
//end choose
//
//dw_1.SetSort(ls_col + " D")
//dw_1.sort()
//
end event

type cb_15 from commandbutton within tabpage_2
integer x = 2103
integer y = 40
integer width = 146
integer height = 76
integer taborder = 80
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

event clicked;////
//string ls_col
//choose case trim(ddlb_fld.text)
//	case "품명"
//		ls_col  = "item_name"
//	case "규격"
//		ls_col  = "qa"
//	case "단위"
//		ls_col  = "uom"
//	case "수량"
//		ls_col  = "qty"
//	case "환산수량"
//		ls_col  = "c_qty"
//	case "단가"
//		ls_col  = "c_price"
//	case "공급가액"
//		ls_col  = "c_amt"
//	case "세액"
//		ls_col  = "c_rate"
//	case "합계"
//		ls_col  = "c_tot"
//end choose
//
//dw_1.SetSort(ls_col + " A")
//dw_1.sort()
//
end event

type cb_14 from commandbutton within tabpage_2
integer x = 1952
integer y = 40
integer width = 146
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "해지"
end type

event clicked;////
//ddlb_fld.text  = "물품명"
//ddlb_op.text   = "LIKE"
//sle_value.text = ""
//
//dw_1.setfilter("")
//dw_1.filter()
//
//pb_retrieve.triggerevent(clicked!)
//dw_1.scrolltorow(1)
//
end event

type cb_10 from commandbutton within tabpage_2
integer x = 1801
integer y = 40
integer width = 146
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "필터"
end type

event clicked;//string ls_custnm, ls_column, ls_value, ls_temp
//
//ls_temp = ""
//if dw_1.FilteredCount() > 0 THEN
//	dw_1.setfilter(ls_temp)
//	dw_1.filter()
//end if
//
//// 필드
//if trim(ddlb_fld.text) = "" then
//	ls_column = ""
//else
//	string ls_col
//	choose case trim(ddlb_fld.text)
//		case "품명"
//			ls_col  = "item_name"
//		case "규격"
//			ls_col  = "qa"
//		case "단위"
//			ls_col  = "uom"
//		case "수량"
//			ls_col  = "qty"
//		case "환산수량"
//			ls_col  = "c_qty"
//		case "단가"
//			ls_col  = "c_price"
//		case "공급가액"
//			ls_col  = "c_amt"
//		case "세액"
//			ls_col  = "c_rate"
//		case "합계"
//			ls_col  = "c_tot"
//	end choose
//	
//	ls_col = ls_col + " "
//	if trim(ddlb_op.text) = "LIKE" then
//		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
//	else
//		choose case ls_col
//			case "insp_log_date"
//				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
//			case "ship_qty", "c_qty", "c_price", "c_amt", "c_rate", "c_tot"
//				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
//			case else
//				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
//		end choose 
//	end if
//end if
//
//if ls_column = "" then
//	ls_temp = ls_column
//else
//	ls_temp = "(" + ls_column + ")"
//end if
//
//if ls_value <> "" then
//	if ls_temp = "" then
//		ls_temp = ls_value
//	else
//		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
//	end if
//end if
//
//dw_1.setfilter(ls_temp)
//dw_1.filter()
//
//dw_1.scrolltorow(1)
//
//
end event

type sle_value from singlelineedit within tabpage_2
integer x = 1088
integer y = 40
integer width = 704
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
end type

type ddlb_op from dropdownlistbox within tabpage_2
integer x = 795
integer y = 40
integer width = 279
integer height = 512
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_14 from statictext within tabpage_2
integer x = 626
integer y = 56
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

type ddlb_fld from dropdownlistbox within tabpage_2
integer x = 206
integer y = 40
integer width = 402
integer height = 532
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"품명","규격","단위","수량","환산수량","단가","공급가액","세액","합계"}
end type

type st_13 from statictext within tabpage_2
integer x = 32
integer y = 56
integer width = 160
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

type dw_4 from datawindow within tabpage_2
integer x = 23
integer y = 140
integer width = 4370
integer height = 2008
integer taborder = 80
string title = "none"
string dataobject = "d_iocoilqoh_all"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_iocoilqoh_r2
integer x = 2450
integer y = 84
integer width = 224
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
string text = "시화"
boolean checked = true
end type

event clicked;//
dw_1.dataobject = 'd_iocoilqoh_s2'
dw_2.dataobject = 'd_iocoilqoh_r2'

tab_1.tabpage_1.dw_3.dataobject = 'd_iocoilqoh_s2'

rb_4.checked = true
rb_4.triggerevent(clicked!)
pb_retrieve.triggerevent(clicked!)
end event

type rb_2 from radiobutton within w_iocoilqoh_r2
integer x = 2450
integer y = 148
integer width = 224
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
string text = "YSP"
end type

event clicked;//
dw_1.dataobject = 'd_iocoilqoh2_s2'
dw_2.dataobject = 'd_iocoilqoh2_r2'

tab_1.tabpage_1.dw_3.dataobject = 'd_iocoilqoh2_s2'

rb_4.checked = true
rb_4.triggerevent(clicked!)
pb_retrieve.triggerevent(clicked!)
end event

type rb_3 from radiobutton within w_iocoilqoh_r2
integer x = 2729
integer y = 148
integer width = 224
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
string text = "화성"
end type

event clicked;//
dw_1.dataobject = 'd_iocoilqoh3_s2'
dw_2.dataobject = 'd_iocoilqoh3_r2'

tab_1.tabpage_1.dw_3.dataobject = 'd_iocoilqoh3_s2'

rb_4.checked = true
rb_4.triggerevent(clicked!)
pb_retrieve.triggerevent(clicked!)
end event

type pb_2 from picturebutton within w_iocoilqoh_r2
event mousemove pbm_mousemove
integer x = 4055
integer y = 60
integer width = 187
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

if tab_1.selectedtab = 1 then
	ldw_sel = tab_1.tabpage_1.dw_3
else
	ldw_sel = tab_1.tabpage_2.dw_4
end if

if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			ldw_sel.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	


end event

type em_1 from editmask within w_iocoilqoh_r2
integer x = 1934
integer y = 96
integer width = 402
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type gb_4 from groupbox within w_iocoilqoh_r2
integer x = 1888
integer y = 16
integer width = 494
integer height = 208
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "입고일자"
end type

