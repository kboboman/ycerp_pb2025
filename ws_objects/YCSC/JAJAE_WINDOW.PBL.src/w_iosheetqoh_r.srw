$PBExportHeader$w_iosheetqoh_r.srw
$PBExportComments$SHEET재고현황(2000/01/16,이인호)
forward
global type w_iosheetqoh_r from w_inheritance
end type
type cbx_1 from checkbox within w_iosheetqoh_r
end type
type cbx_2 from checkbox within w_iosheetqoh_r
end type
type cbx_3 from checkbox within w_iosheetqoh_r
end type
type cbx_4 from checkbox within w_iosheetqoh_r
end type
type cbx_5 from checkbox within w_iosheetqoh_r
end type
type st_1 from statictext within w_iosheetqoh_r
end type
type dw_3 from datawindow within w_iosheetqoh_r
end type
type cbx_6 from checkbox within w_iosheetqoh_r
end type
type st_2 from statictext within w_iosheetqoh_r
end type
type pb_1 from picturebutton within w_iosheetqoh_r
end type
end forward

global type w_iosheetqoh_r from w_inheritance
integer width = 4562
integer height = 2668
string title = "SHEET재고 현황(w_iosheetqoh_r)"
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
cbx_5 cbx_5
st_1 st_1
dw_3 dw_3
cbx_6 cbx_6
st_2 st_2
pb_1 pb_1
end type
global w_iosheetqoh_r w_iosheetqoh_r

type variables

string is_loc, is_item
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if gf_permission('Sheet재고현황관리Open', gs_userid) = 'Y' then	
else
	messagebox("확인","이프로그램의 사용권한이 없습니다")
	pb_close.postevent(clicked!)
end if

if gf_permission('Sheet재고현황관리Print', gs_userid) = 'Y' then	
else
	pb_print.enabled = false
	pb_print_part.enabled = false
end if

datawindowchild ldwc_loc, ldwc_item

dw_2.settransobject(sqlca)
dw_2.insertrow(0)

dw_2.getchild("loc_no", ldwc_loc)
ldwc_loc.settransobject(SQLCA)
ldwc_loc.insertrow(1)
ldwc_loc.setitem(1, "loc_no", "%")
ldwc_loc.setitem(1, "loc_name", "전체")

dw_2.getchild("item_no", ldwc_item)
ldwc_item.settransobject(SQLCA)
ldwc_item.insertrow(1)
ldwc_item.setitem(1, "item_no", "%")
ldwc_item.setitem(1, "item_name", "전체")

is_loc = "%"
is_item = "%"
//is_flag = "W"
//is_oc = "O"

end event

on w_iosheetqoh_r.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.st_1=create st_1
this.dw_3=create dw_3
this.cbx_6=create cbx_6
this.st_2=create st_2
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.cbx_3
this.Control[iCurrent+4]=this.cbx_4
this.Control[iCurrent+5]=this.cbx_5
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.cbx_6
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.pb_1
end on

on w_iosheetqoh_r.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.cbx_6)
destroy(this.st_2)
destroy(this.pb_1)
end on

event resize;call super::resize;//
gb_2.width  = this.width  - 119
gb_2.height = this.height - 368

dw_1.width  = this.width  - 169
dw_1.height = this.height - 536

end event

type pb_save from w_inheritance`pb_save within w_iosheetqoh_r
boolean visible = false
integer x = 2683
end type

type dw_1 from w_inheritance`dw_1 within w_iosheetqoh_r
event mousemove pbm_dwnmousemove
integer y = 380
integer width = 4393
integer height = 2132
string dataobject = "d_iosheetqoh_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::mousemove;if row < 1 then return
this.scrolltorow(row)
end event

event dw_1::doubleclicked;call super::doubleclicked;if dw_1.dataobject <> 'd_iosheetqoh_r4' or row < 1  then return

string lsa_loc[]
if w_iosheetqoh_r2.rb_1.checked = true then
	lsa_loc[1] = 'WS00000000'
	lsa_loc[2] = 'WS00000003'
	lsa_loc[3] = 'WW01'
	lsa_loc[4] = 'WW02'
	lsa_loc[5] = 'WW03'
end if
if w_iosheetqoh_r2.rb_2.checked = true then
	lsa_loc[1] = 'WS00000006'
	lsa_loc[2] = 'WW04'
end if
if w_iosheetqoh_r2.rb_3.checked = true then
	lsa_loc[1] = 'WS00000008'
end if

string lsa_item_no[], ls_qa
lsa_item_no[1] = trim(this.object.sheetmst_item_no[row])
ls_qa = trim(this.object.c_qa[row]) + '%'

string lsa_oc[]
lsa_oc[1] = 'O'
lsa_oc[2] = 'M'
lsa_oc[3] = 'P'
lsa_oc[4] = 'S'

st_1.text = '규격별 sheet재고 상세현황'
st_1.visible = true
w_iosheetqoh_r.pb_print_part.text = '' // 이전화면
w_iosheetqoh_r.pb_print_part.picturename = 'C:\bmp\왼쪽화살표_가능.bmp'
w_iosheetqoh_r.pb_print_part.enabled = true

dw_1.dataobject = 'd_iosheetqoh_r4_1'
dw_1.settransobject(sqlca)
if dw_1.retrieve( lsa_loc, lsa_item_no, '%', lsa_oc, 'Y', 'Y', ls_qa ) < 1 then
	messagebox('확인', '조건에 만족하는 자료가 없습니다.')
end if

	
end event

type dw_2 from w_inheritance`dw_2 within w_iosheetqoh_r
integer x = 64
integer y = 284
integer width = 2322
integer height = 84
string dataobject = "d_iosheetqoh_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;datawindowchild ldwc_loc, ldwc_item

this.accepttext()
dw_2.getchild("item_no", ldwc_item)

is_loc = trim(this.object.loc_no[1])
if trim(this.object.item_no[1]) = '%' then
	is_item = '%'
else
	is_item = ldwc_item.getitemstring(ldwc_item.getrow(), "item_name")
end if
if is_item <> '%' then is_item = is_item + '%'
if is_loc <> '%' then is_loc = is_loc + '%'

end event

type st_title from w_inheritance`st_title within w_iosheetqoh_r
integer x = 46
integer y = 48
integer width = 1074
integer height = 136
string text = "SHEET재고 현황"
end type

type st_tips from w_inheritance`st_tips within w_iosheetqoh_r
end type

type pb_compute from w_inheritance`pb_compute within w_iosheetqoh_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_iosheetqoh_r
integer x = 3483
integer y = 60
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "실사목록"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;call super::clicked;if dw_1.dataobject = 'd_iosheetqoh_r4_1' then
	string ls_item_name, ls_item_no, as_item_no[]
	integer li_dw1row
	li_dw1row = w_iosheetqoh_r2.dw_1.getrow()
	ls_item_name = trim(w_iosheetqoh_r2.dw_1.object.groupitem_item_name[li_dw1row])
	
	integer li_i
	li_i = 1
	declare get_sheet_no cursor for
	select top 100 t_sheet.item_no from 
		(select item_no, replace(item_name, '스리팅 ', '') as grp from groupitem
		where item_name like '%sheet%'
			 and use_flag = 'Y'  ) t_sheet
		where t_sheet.grp = :ls_item_name
		order by t_sheet.item_no ;
	
	open get_sheet_no;
	
	FETCH get_sheet_no into :ls_item_no;
	DO WHILE sqlca.sqlcode = 0
		as_item_no[li_i] = ls_item_no
		li_i = li_i + 1
		FETCH get_sheet_no INTO :ls_item_no;
	LOOP
	close get_sheet_no;
	
	string lsa_oc[]
	lsa_oc[1] = 'O'
	lsa_oc[2] = 'M'
	lsa_oc[3] = 'P'
	lsa_oc[4] = 'S'
	
	string lsa_loc[]
	if w_iosheetqoh_r2.rb_1.checked = true then
		lsa_loc[1] = 'WS00000000'
		lsa_loc[2] = 'WS00000003'
		lsa_loc[3] = 'WW01'
		lsa_loc[4] = 'WW02'
		lsa_loc[5] = 'WW03'
	end if
	if w_iosheetqoh_r2.rb_2.checked = true then
		lsa_loc[1] = 'WS00000006'
		lsa_loc[2] = 'WW04'
	end if
	if w_iosheetqoh_r2.rb_3.checked = true then
		lsa_loc[1] = 'WS00000008'
	end if
	
	
//	opensheet(w_iosheetqoh_r, w_i_main, 5, original!)
	
	w_iosheetqoh_r.dw_2.visible = false
	w_iosheetqoh_r.cbx_1.enabled = false
	w_iosheetqoh_r.cbx_2.enabled = false
	w_iosheetqoh_r.cbx_3.enabled = false
	w_iosheetqoh_r.cbx_4.enabled = false
	w_iosheetqoh_r.cbx_5.enabled = false
//	w_iosheetqoh_r.cbx_6.enabled = false
//	w_iosheetqoh_r.cbx_7.enabled = false
	w_iosheetqoh_r.pb_retrieve.enabled = false
	
	w_iosheetqoh_r.pb_print.enabled = true
//	w_iosheetqoh_r.cbx_6.checked = true
//	w_iosheetqoh_r.cbx_7.checked = true
	
	if w_iosheetqoh_r2.rb_1.checked = true then
		w_iosheetqoh_r.st_title.text = '시화 sheet재고현황'
	end if
	if w_iosheetqoh_r2.rb_2.checked = true then
		w_iosheetqoh_r.st_title.text = 'YSP sheet재고현황'
	end if
	if w_iosheetqoh_r2.rb_3.checked = true then
		w_iosheetqoh_r.st_title.text = '화성 sheet재고현황'
	end if
	
	w_iosheetqoh_r.st_1.text = '규격별 sheet재고 집계현황'
	w_iosheetqoh_r.st_1.visible = true
	w_iosheetqoh_r.pb_print_part.text = '실사목록'
	w_iosheetqoh_r.pb_print_part.picturename = ''
	w_iosheetqoh_r.pb_print_part.enabled = false

	w_iosheetqoh_r.dw_1.dataobject = 'd_iosheetqoh_r4'
	w_iosheetqoh_r.dw_1.settransobject(sqlca)
	if w_iosheetqoh_r.dw_1.retrieve( lsa_loc, as_item_no, '%' , lsa_oc, 'Y', 'Y' ) < 1 then
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
	l_print.st_print_desc = " 이 프로그램은 sheet재고실사내역을 출력합니다." 
	
	
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
							 'Datawindow.Zoom=100'
	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end if
end event

type pb_close from w_inheritance`pb_close within w_iosheetqoh_r
integer x = 4261
integer y = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iosheetqoh_r
integer x = 3867
integer y = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 SHEET재고내역을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iosheetqoh_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_iosheetqoh_r
boolean visible = false
integer x = 2299
end type

type pb_insert from w_inheritance`pb_insert within w_iosheetqoh_r
boolean visible = false
integer x = 2107
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iosheetqoh_r
integer x = 3675
integer y = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_oc[5]
int li_int

for li_int = 1 to 5
	setnull(ls_oc[li_int])
next
li_int = 1
if cbx_1.checked = true then
	ls_oc[li_int] = "O"
	li_int = li_int + 1
end if
if cbx_2.checked = true then
	ls_oc[li_int] =  "M"
	li_int = li_int + 1
end if
if cbx_3.checked = true then
	ls_oc[li_int] =  "P"
	li_int = li_int + 1
end if
if cbx_4.checked = true then
	ls_oc[li_int] =  "S"
	li_int = li_int + 1
end if
if cbx_5.checked = true then
	ls_oc[li_int] =  "C"
	li_int = li_int + 1
end if
dw_2.accepttext()
dw_1.retrieve( is_loc, is_item, ls_oc)
dw_1.setfilter(" sheetmst_qcnt <> 0 ")
dw_1.filter()
end event

type gb_3 from w_inheritance`gb_3 within w_iosheetqoh_r
integer x = 1920
integer y = 16
integer width = 1504
integer height = 208
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "상태"
end type

type gb_2 from w_inheritance`gb_2 within w_iosheetqoh_r
integer x = 41
integer y = 236
integer width = 4443
integer height = 2300
end type

type gb_1 from w_inheritance`gb_1 within w_iosheetqoh_r
integer x = 3447
integer y = 16
integer width = 1038
integer height = 208
integer textsize = -10
integer weight = 400
long backcolor = 81838264
end type

type cbx_1 from checkbox within w_iosheetqoh_r
integer x = 1957
integer y = 104
integer width = 219
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
string text = "재고"
boolean checked = true
end type

type cbx_2 from checkbox within w_iosheetqoh_r
integer x = 2213
integer y = 104
integer width = 219
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
string text = "계획"
boolean checked = true
end type

type cbx_3 from checkbox within w_iosheetqoh_r
integer x = 2469
integer y = 104
integer width = 352
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
string text = "작업지시"
boolean checked = true
end type

type cbx_4 from checkbox within w_iosheetqoh_r
integer x = 2830
integer y = 104
integer width = 352
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
string text = "외주가공"
boolean checked = true
end type

type cbx_5 from checkbox within w_iosheetqoh_r
integer x = 3191
integer y = 104
integer width = 219
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
string text = "완료"
end type

type st_1 from statictext within w_iosheetqoh_r
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

type dw_3 from datawindow within w_iosheetqoh_r
boolean visible = false
integer x = 1065
integer y = 12
integer width = 105
integer height = 96
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_iosheetqoh_r11"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_6 from checkbox within w_iosheetqoh_r
integer x = 3703
integer y = 284
integer width = 736
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "완료되지 않은 0 포함"
end type

event clicked;
if cbx_6.checked = true then
	dw_1.setfilter("")
	dw_1.filter()
else
	dw_1.setfilter(" sheetmst_qcnt <> 0 ")
	dw_1.filter()
end if
end event

type st_2 from statictext within w_iosheetqoh_r
integer x = 1147
integer y = 160
integer width = 741
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
string text = "Sheet재고현황관리Open 권한"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_iosheetqoh_r
event mousemove pbm_mousemove
integer x = 4059
integer y = 60
integer width = 187
integer height = 144
integer taborder = 150
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

