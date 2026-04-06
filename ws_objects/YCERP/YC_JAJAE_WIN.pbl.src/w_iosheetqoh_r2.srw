$PBExportHeader$w_iosheetqoh_r2.srw
$PBExportComments$품목별 Sheet재고현황(2004/02/24,정갑용)
forward 
global type w_iosheetqoh_r2 from w_inheritance
end type
type rb_1 from radiobutton within w_iosheetqoh_r2
end type
type rb_2 from radiobutton within w_iosheetqoh_r2
end type
type rb_3 from radiobutton within w_iosheetqoh_r2
end type
type rb_4 from radiobutton within w_iosheetqoh_r2
end type
type rb_5 from radiobutton within w_iosheetqoh_r2
end type
type rb_6 from radiobutton within w_iosheetqoh_r2
end type
type rb_7 from radiobutton within w_iosheetqoh_r2
end type
type pb_1 from picturebutton within w_iosheetqoh_r2
end type
end forward

global type w_iosheetqoh_r2 from w_inheritance
integer width = 4562
integer height = 2668
string title = "SHEET재고 현황(품목별)(w_iosheetqoh_r2)"
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
pb_1 pb_1
end type
global w_iosheetqoh_r2 w_iosheetqoh_r2

type variables


end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

if gf_permission('품목별Sheet재고현황관리open', gs_userid) = 'Y' then	
else
	messagebox("확인","이프로그램의 사용권한이 없습니다")
	pb_close.postevent(clicked!)
end if

if gf_permission('품목별Sheet재고현황관리Print', gs_userid) = 'Y' then	
else
	pb_print.enabled = false
end if

dw_2.visible = false
dw_1.SetTransObject(sqlca)
dw_1.ShareData(dw_2)

end event

on w_iosheetqoh_r2.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.rb_5
this.Control[iCurrent+6]=this.rb_6
this.Control[iCurrent+7]=this.rb_7
this.Control[iCurrent+8]=this.pb_1
end on

on w_iosheetqoh_r2.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.pb_1)
end on

event resize;call super::resize;dw_1.width  = this.width - 100
dw_1.height = this.height - 368

end event

type pb_save from w_inheritance`pb_save within w_iosheetqoh_r2
boolean visible = false
integer x = 2683
end type

type dw_1 from w_inheritance`dw_1 within w_iosheetqoh_r2
event mousemove pbm_dwnmousemove
integer x = 23
integer y = 236
integer width = 4462
integer height = 2300
string dataobject = "d_iosheetqoh_s2"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::mousemove;if row < 1 then return
this.scrolltorow(row)
end event

event dw_1::doubleclicked;call super::doubleclicked;// row 의 원/스리팅 sheet번호로 상세조회(sheet재고현황) 호출
if row < 1 then return

string ls_item_name, ls_item_no, as_item_no[]
ls_item_name = trim(this.object.groupitem_item_name[row])

integer li_i
li_i = 1
declare get_sheet_no cursor for
select top 100 t_sheet.item_no from 
	(select item_no, replace(item_name, ' 반제품', '') as grp from groupitem
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


opensheet(w_iosheetqoh_r, w_i_main, 5, original!)

w_iosheetqoh_r.dw_2.visible = false
w_iosheetqoh_r.cbx_1.enabled = false
w_iosheetqoh_r.cbx_2.enabled = false
w_iosheetqoh_r.cbx_3.enabled = false
w_iosheetqoh_r.cbx_4.enabled = false
w_iosheetqoh_r.cbx_5.enabled = false
//w_iosheetqoh_r.cbx_6.enabled = false
//w_iosheetqoh_r.cbx_7.enabled = false
w_iosheetqoh_r.pb_retrieve.enabled = false

w_iosheetqoh_r.pb_print.enabled = true
//w_iosheetqoh_r.cbx_6.checked = true
//w_iosheetqoh_r.cbx_7.checked = true

if rb_1.checked = true then
	w_iosheetqoh_r.st_title.text = '시화 sheet재고현황'
end if
if rb_2.checked = true then
	w_iosheetqoh_r.st_title.text = 'YSP sheet재고현황'
end if
if rb_3.checked = true then
	w_iosheetqoh_r.st_title.text = '화성 sheet재고현황'
end if

//w_iosheetqoh_r.st_1.text = '규격별 sheet재고 집계현황'
w_iosheetqoh_r.st_1.visible = true
w_iosheetqoh_r.pb_print_part.enabled = false

//w_iosheetqoh_r.dw_1.dataobject = 'd_iosheetqoh_r4'
//w_iosheetqoh_r.dw_1.settransobject(sqlca)
//if w_iosheetqoh_r.dw_1.retrieve( lsa_loc, as_item_no, '%' , lsa_oc, 'Y', 'Y' ) < 1 then
//	messagebox('확인', '조건에 만족하는 자료가 없습니다.')
//end if

w_iosheetqoh_r.st_1.text = '규격별 sheet재고 상세현황'
w_iosheetqoh_r.dw_1.dataobject = 'd_iosheetqoh_r4_1'
w_iosheetqoh_r.dw_1.settransobject(sqlca)
if w_iosheetqoh_r.dw_1.retrieve(lsa_loc, as_item_no, '%', lsa_oc, 'Y', 'Y', '%') < 1 then
	messagebox('확인', '조건에 만족하는 자료가 없습니다.')
end if



end event

type st_title from w_inheritance`st_title within w_iosheetqoh_r2
integer y = 44
integer width = 1582
integer height = 148
string text = "SHEET재고 현황(품목별)"
end type

type st_tips from w_inheritance`st_tips within w_iosheetqoh_r2
end type

type pb_compute from w_inheritance`pb_compute within w_iosheetqoh_r2
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_iosheetqoh_r2
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

type pb_close from w_inheritance`pb_close within w_iosheetqoh_r2
integer x = 4261
integer y = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iosheetqoh_r2
integer x = 3863
integer y = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 코일재고내역을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iosheetqoh_r2
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_iosheetqoh_r2
boolean visible = false
integer x = 2299
end type

type pb_insert from w_inheritance`pb_insert within w_iosheetqoh_r2
boolean visible = false
integer x = 2107
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iosheetqoh_r2
integer x = 3671
integer y = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.SetTransObject(sqlca)
dw_1.ShareData(dw_2)

dw_1.Retrieve()


end event

type gb_3 from w_inheritance`gb_3 within w_iosheetqoh_r2
integer x = 2427
integer y = 16
integer width = 581
integer height = 204
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 81838264
string text = "사업장"
end type

type gb_2 from w_inheritance`gb_2 within w_iosheetqoh_r2
integer x = 3026
integer y = 16
integer width = 581
integer height = 204
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "품목"
end type

type gb_1 from w_inheritance`gb_1 within w_iosheetqoh_r2
integer x = 3625
integer y = 16
integer width = 859
integer textsize = -10
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_iosheetqoh_r2
integer x = 1509
integer y = 8
integer width = 133
integer height = 100
string dataobject = "d_iosheetqoh_r2"
boolean vscrollbar = false
boolean livescroll = false
end type

type rb_1 from radiobutton within w_iosheetqoh_r2
integer x = 2469
integer y = 80
integer width = 224
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
string text = "시화"
boolean checked = true
end type

event clicked;dw_1.dataobject = 'd_iosheetqoh_s2'
dw_2.dataobject = 'd_iosheetqoh_r2'
rb_4.checked = true
rb_4.triggerevent(clicked!)
pb_retrieve.triggerevent(clicked!)
end event

type rb_2 from radiobutton within w_iosheetqoh_r2
integer x = 2469
integer y = 144
integer width = 224
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
string text = "YSP"
end type

event clicked;dw_1.dataobject = 'd_iosheetqoh2_s2'
dw_2.dataobject = 'd_iosheetqoh2_r2'
rb_4.checked = true
rb_4.triggerevent(clicked!)
pb_retrieve.triggerevent(clicked!)
end event

type rb_3 from radiobutton within w_iosheetqoh_r2
integer x = 2729
integer y = 144
integer width = 224
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
string text = "화성"
end type

event clicked;dw_1.dataobject = 'd_iosheetqoh3_s2'
dw_2.dataobject = 'd_iosheetqoh3_r2'
rb_4.checked = true
rb_4.triggerevent(clicked!)
pb_retrieve.triggerevent(clicked!)
end event

type rb_4 from radiobutton within w_iosheetqoh_r2
integer x = 3072
integer y = 80
integer width = 215
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
string text = "전체"
boolean checked = true
end type

event clicked;dw_1.setfilter('')
dw_1.filter()

end event

type rb_5 from radiobutton within w_iosheetqoh_r2
integer x = 3333
integer y = 80
integer width = 215
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
string text = "GI"
end type

event clicked;dw_1.setfilter("left(groupitem_item_name, 2) = 'GI'")
dw_1.filter()

end event

type rb_6 from radiobutton within w_iosheetqoh_r2
integer x = 3072
integer y = 148
integer width = 215
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
string text = "AL"
end type

event clicked;dw_1.setfilter("left(groupitem_item_name, 2 ) = 'AL'")
dw_1.filter()

end event

type rb_7 from radiobutton within w_iosheetqoh_r2
integer x = 3333
integer y = 148
integer width = 215
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
string text = "기타"
end type

event clicked;dw_1.setfilter("left(groupitem_item_name, 2) <> 'GI' and  left(groupitem_item_name, 2) <> 'AL'")
dw_1.filter()

end event

type pb_1 from picturebutton within w_iosheetqoh_r2
event mousemove pbm_mousemove
integer x = 4055
integer y = 60
integer width = 187
integer height = 144
integer taborder = 140
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

