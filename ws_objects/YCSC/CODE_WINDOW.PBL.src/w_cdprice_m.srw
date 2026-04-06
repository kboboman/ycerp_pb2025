$PBExportHeader$w_cdprice_m.srw
$PBExportComments$물품별 표준단가관리(1998/3/14,성삼지)
forward
global type w_cdprice_m from w_inheritance
end type
type gb_4 from groupbox within w_cdprice_m
end type
type dw_3 from datawindow within w_cdprice_m
end type
type sle_1 from singlelineedit within w_cdprice_m
end type
type st_4 from statictext within w_cdprice_m
end type
type cb_3 from commandbutton within w_cdprice_m
end type
type st_2 from statictext within w_cdprice_m
end type
type cb_2 from commandbutton within w_cdprice_m
end type
type cbx_all from checkbox within w_cdprice_m
end type
type st_1 from statictext within w_cdprice_m
end type
type ddlb_3 from dropdownlistbox within w_cdprice_m
end type
type st_5 from statictext within w_cdprice_m
end type
type ddlb_4 from dropdownlistbox within w_cdprice_m
end type
type sle_value from singlelineedit within w_cdprice_m
end type
type cb_1 from commandbutton within w_cdprice_m
end type
type cb_4 from commandbutton within w_cdprice_m
end type
type cb_5 from commandbutton within w_cdprice_m
end type
type cb_6 from commandbutton within w_cdprice_m
end type
type cb_7 from commandbutton within w_cdprice_m
end type
type cb_8 from commandbutton within w_cdprice_m
end type
type cb_9 from commandbutton within w_cdprice_m
end type
type st_6 from statictext within w_cdprice_m
end type
type cb_10 from commandbutton within w_cdprice_m
end type
type cb_11 from commandbutton within w_cdprice_m
end type
type cb_12 from commandbutton within w_cdprice_m
end type
type cb_13 from commandbutton within w_cdprice_m
end type
end forward

global type w_cdprice_m from w_inheritance
integer width = 4485
integer height = 2124
string title = "표준단가관리(물품별)(w_cdprice_m)"
long backcolor = 79220952
boolean center = true
gb_4 gb_4
dw_3 dw_3
sle_1 sle_1
st_4 st_4
cb_3 cb_3
st_2 st_2
cb_2 cb_2
cbx_all cbx_all
st_1 st_1
ddlb_3 ddlb_3
st_5 st_5
ddlb_4 ddlb_4
sle_value sle_value
cb_1 cb_1
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
st_6 st_6
cb_10 cb_10
cb_11 cb_11
cb_12 cb_12
cb_13 cb_13
end type
global w_cdprice_m w_cdprice_m

type variables
public string is_scene_code,is_scene_desc, is_custno,is_custname
string is_dw1sql, is_dw3sql, is_field


end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.visible = false
cb_2.visible = false		// 단가수정
cb_3.enabled = false		// 찾기
cb_10.enabled = false	// 거래처 단가관리(물품별)

if gf_permission('물품표준단가관리자', gs_userid) = 'Y' then
   pb_save.enabled   = true
   pb_print.enabled  = true
else
   pb_save.enabled   = false
   pb_print.enabled  = false
end if

dw_2.object.upda_chk_t.visible = false
dw_2.object.upda_chk.visible = false
cbx_all.visible              = false
//if gs_userid = "1999010s" then
//   dw_2.object.upda_chk_t.visible = true
//	dw_2.object.upda_chk.visible = true
//	cbx_all.visible              = true
//end if

dw_3.settransobject(sqlca)
is_dw1sql = dw_1.describe("datawindow.table.select")
is_dw3sql = dw_3.describe("datawindow.table.select")


end event

on w_cdprice_m.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.dw_3=create dw_3
this.sle_1=create sle_1
this.st_4=create st_4
this.cb_3=create cb_3
this.st_2=create st_2
this.cb_2=create cb_2
this.cbx_all=create cbx_all
this.st_1=create st_1
this.ddlb_3=create ddlb_3
this.st_5=create st_5
this.ddlb_4=create ddlb_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.st_6=create st_6
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cb_12=create cb_12
this.cb_13=create cb_13
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cbx_all
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.ddlb_3
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.ddlb_4
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cb_4
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.cb_6
this.Control[iCurrent+18]=this.cb_7
this.Control[iCurrent+19]=this.cb_8
this.Control[iCurrent+20]=this.cb_9
this.Control[iCurrent+21]=this.st_6
this.Control[iCurrent+22]=this.cb_10
this.Control[iCurrent+23]=this.cb_11
this.Control[iCurrent+24]=this.cb_12
this.Control[iCurrent+25]=this.cb_13
end on

on w_cdprice_m.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.sle_1)
destroy(this.st_4)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cbx_all)
destroy(this.st_1)
destroy(this.ddlb_3)
destroy(this.st_5)
destroy(this.ddlb_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.st_6)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.cb_13)
end on

event resize;call super::resize;//
//gb_2.width  = this.width  - 2963
gb_2.height = this.height - 428

//dw_1.width  = this.width  - 3018
dw_1.height = this.height - 616

gb_4.width  = this.width  - 1655
gb_4.height = this.height - 428

dw_2.width  = this.width  - 1710
dw_2.height = this.height - 616

end event

type pb_save from w_inheritance`pb_save within w_cdprice_m
integer x = 3995
integer y = 56
end type

event pb_save::clicked;dwItemStatus l_status
dec     ld_price, ld_price2
string  ls_item,  ls_qa
integer ll_row,   ll_cnt


dw_2.accepttext()
if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) <> 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ll_row = dw_2.rowcount()
for ll_cnt =1 to ll_row
	l_status = dw_2.GetItemStatus(ll_cnt, 0, Primary!)
	if l_status = datamodified! then
		ls_item = dw_2.object.item_no[ll_cnt]
		ls_qa   = dw_2.object.qa[ll_cnt]
		dw_2.object.user_id[ll_cnt]   = gs_userid
		dw_2.object.tran_date[ll_cnt] = gf_today()
		// 단가이력
		INSERT INTO itemcostb (item_no, qa, tran_date, uom, user_id, rem, price, old_price) 
		SELECT item_no, qa, tran_date, uom, user_id, rem, price, old_price
		  FROM itemcost
		 WHERE item_no = :ls_item  AND qa = :ls_qa;
		if sqlca.sqldbcode <> 0 then
			MessageBox("저장오류","단가내역 저장중 에러가 발생했습니다.", exclamation!)
			rollback;
			return
		end if
		
		// 현재단가
	   SELECT price INTO :ld_price FROM itemcost	 WHERE item_no = :ls_item	AND qa = :ls_qa;
      if dw_2.object.price[ll_cnt] <> ld_price then			
         ld_price2 = dw_2.object.price[ll_cnt]			
	      dw_2.object.old_price[ll_cnt] = ld_price		// 이전단가
			
			ls_qa = trim(ls_qa) + '%'
	   	UPDATE item SET price_a = :ld_price2  WHERE item_no = :ls_item AND qa LIKE :ls_qa;	// 현재단가
			if sqlca.sqldbcode <> 0 then
				MessageBox("저장오류","물품단가 저장중 에러가 발생했습니다.", exclamation!)
				rollback;
				return
			end if			
	   end if
	end if
next

wf_update1(dw_2,"Y") 

end event

type dw_1 from w_inheritance`dw_1 within w_cdprice_m
integer y = 404
integer width = 1467
integer height = 1508
string dataobject = "d_cditemdw_s1"
borderstyle borderstyle = stylelowered!
end type

event dw_1::retrieveend;sle_1.setfocus()
end event

event dw_1::clicked;call super::clicked;//
string ls_value, ls_col, ls_text
string ls_itemno

if row < 1 or row > this.rowcount() then return

choose case dwo.name
	case "item_no"
		ls_col   = "코드"
		ls_text  = this.object.item_no[row]
		ls_value = this.object.item_no[row]
		is_field = dwo.name
	case "item_name"
		ls_col   = "품목명"
		ls_text  = this.object.item_name[row]
		ls_value = this.object.item_name[row]		
		is_field = dwo.name
	case "cnt"
		is_field = dwo.name
end choose

sle_1.text     = ls_value

ls_itemno = this.object.item_no[row]
dw_2.retrieve( ls_itemno )

end event

type dw_2 from w_inheritance`dw_2 within w_cdprice_m
integer x = 1595
integer y = 404
integer width = 2775
integer height = 1508
string dataobject = "d_cditemcost_m1"
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;string ls_col, ls_text

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

this.scrolltorow( row )
choose case dwo.name
	case "item_name"
		ls_col  = "물품명"
		ls_text = string(this.object.item_name[row])		
	case "qa"
		ls_col  = "규격"
		ls_text = string(this.object.qa[row])		
	case "uom"
		ls_col  = "단위"
		ls_text = string(this.object.uom[row])
	case "cust_cnt"
		ls_col  = "거래처"
		ls_text = string(this.object.cust_cnt[row])
	case "old_price"
		ls_col  = "종전단가"
		ls_text = string(this.object.old_price[row])
	case "price"
		ls_col  = "표준단가"
		ls_text = string(this.object.price[row])
	case "rem"
		ls_col  = "비고"
		ls_text = string(this.object.rem[row])
end choose

choose case ls_col
	case "종전단가", "표준단가"
		ddlb_4.text = "="
	case else
		ddlb_4.text = "LIKE"
end choose

ddlb_3.text    = ls_col
sle_value.text = ls_text


end event

type st_title from w_inheritance`st_title within w_cdprice_m
integer x = 41
integer width = 1358
integer height = 132
string text = "표준단가 관리(물품별)"
end type

type st_tips from w_inheritance`st_tips within w_cdprice_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdprice_m
boolean visible = false
integer y = 48
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdprice_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdprice_m
integer x = 4187
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdprice_m
integer x = 3803
integer y = 56
integer taborder = 130
end type

event pb_print::clicked;gs_codere_str lst_code
w_repsuper    w_print
st_print      l_print
string ls_sql, ls_where

openwithparm(w_whitem_w, lst_code)
lst_code = message.powerobjectparm
if lst_code.okcancel = 'N' then return

if lst_code.flag = 'A' then
	ls_sql   = "datawindow.table.select = '" + is_dw3sql + "'"
else
	ls_where = " and itemcost.item_no between ~~'" + lst_code.start_no + "~~' and " + &
				  "~~'" + lst_code.end_no + "~~'"
	ls_sql   = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
end if

dw_3.settransobject(sqlca)
dw_3.modify(ls_sql)
dw_3.retrieve()

if dw_3.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 물품별 표준단가를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdprice_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdprice_m
boolean visible = false
integer x = 2592
integer y = 60
integer taborder = 150
end type

event pb_delete::clicked;call super::clicked;//if dw_2.rowcount() < 1 then return	
//
//if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
//	return
//end if	
//
//dw_2.accepttext()
//dw_2.deleterow(dw_2.getrow())
//wf_update1(dw_2,"Y")
//
end event

type pb_insert from w_inheritance`pb_insert within w_cdprice_m
boolean visible = false
integer x = 2761
integer y = 60
integer taborder = 170
end type

event pb_insert::clicked;call super::clicked;//string ls_custno
//long ll_row
//
//ll_row = dw_2.insertrow(0)
//dw_2.scrolltorow(ll_row)
//dw_2.setcolumn('scene_code')
//dw_2.setfocus()
//ls_custno = dw_1.getitemstring(dw_1.getrow(),'cust_no')
//dw_2.setitem(ll_row,'cust_no',ls_custno)
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdprice_m
integer x = 3611
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_codere_str lst_code
string ls_sql, ls_where

if dw_1.rowcount() > 0 then
	dw_1.reset()
	dw_2.reset()
end if

OpenWithParm(w_whretrieve_w, lst_code)
lst_code = message.powerobjectparm
if lst_code.okcancel = 'N' then return

if lst_code.flag = 'A' then
	ls_sql   = "datawindow.table.select = '" + is_dw1sql + "'"
else
	ls_where = " where item.item_no between ~~'" + lst_code.start_no + "~~' and " + &
				  "~~'" + lst_code.end_no + "~~'"
	ls_sql   = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"
end if

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_1.reset()
dw_1.retrieve()

//cb_2.enabled    = true	// 단가수정
cb_10.enabled   = true	// 거래처 단가관리(물품별)
cb_3.enabled    = true	// 찾기
cbx_all.checked = false // 전체

end event

type gb_3 from w_inheritance`gb_3 within w_cdprice_m
boolean visible = false
integer x = 1513
integer y = 208
integer width = 2080
integer height = 400
integer taborder = 70
long backcolor = 12632256
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_cdprice_m
integer x = 37
integer y = 232
integer width = 1522
integer height = 1696
integer taborder = 90
integer textsize = -10
long textcolor = 33554432
long backcolor = 79416533
string text = "item"
end type

type gb_1 from w_inheritance`gb_1 within w_cdprice_m
integer x = 2144
integer y = 16
integer width = 2258
long backcolor = 79416533
end type

type gb_4 from groupbox within w_cdprice_m
integer x = 1573
integer y = 232
integer width = 2830
integer height = 1696
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "itemcost"
end type

type dw_3 from datawindow within w_cdprice_m
integer x = 1353
integer y = 12
integer width = 142
integer height = 104
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_cditemcost_r"
boolean livescroll = true
end type

type sle_1 from singlelineedit within w_cdprice_m
integer x = 279
integer y = 296
integer width = 763
integer height = 88
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event getfocus;cb_3.default = true
end event

event losefocus;cb_3.default = false
end event

event modified;//cb_3.triggerevent(clicked!)
end event

type st_4 from statictext within w_cdprice_m
integer x = 69
integer y = 316
integer width = 206
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
boolean enabled = false
string text = "찾기=>"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_cdprice_m
integer x = 1051
integer y = 296
integer width = 146
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_where,ls_filter
string ls_item

ls_item = trim(UPPER(sle_1.text))

if isnull(ls_item) or ls_item = "" then
	ls_where = ""
else
	ls_filter = '%' + ls_item + '%'
	ls_where  = "item_name like '" + ls_filter + "'"
end if
dw_1.SetFilter(ls_where)
dw_1.Filter()

dw_2.retrieve(dw_1.getitemstring(dw_1.getrow(), "item_no"))
sle_1.setfocus()

end event

type st_2 from statictext within w_cdprice_m
integer x = 1431
integer y = 172
integer width = 590
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "물품표준단가관리자"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_cdprice_m
integer x = 1513
integer y = 16
integer width = 421
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "표준단가수정"
end type

event clicked;// 물품별 표준단가 수정
gs_where lstr_where
string   ls_itemno, ls_itemnm
long     ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if IsValid(w_o_main) then 
	OpenSheet(w_cdpriceuser_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cdpriceuser_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cdpriceuser_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdpriceuser_m,  w_all_main, 5, original!)
end if

w_cdpriceuser_m.sle_1.text = sle_1.text	// 품목 넘겨줌

end event

type cbx_all from checkbox within w_cdprice_m
integer x = 3744
integer y = 236
integer width = 224
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "전체"
end type

event clicked;//
long  ll_row

for ll_row = 1 to dw_2.rowcount()
	if this.checked = true then
		dw_2.object.upda_chk[ll_row] = "Y"
	else
		dw_2.object.upda_chk[ll_row] = "N"
	end if
next
end event

type st_1 from statictext within w_cdprice_m
integer x = 1609
integer y = 316
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

type ddlb_3 from dropdownlistbox within w_cdprice_m
integer x = 1797
integer y = 300
integer width = 402
integer height = 532
integer taborder = 20
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
string item[] = {"물품명","규격","단위","거래처","종전단가","표준단가","비고"}
end type

type st_5 from statictext within w_cdprice_m
integer x = 2226
integer y = 316
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

type ddlb_4 from dropdownlistbox within w_cdprice_m
integer x = 2395
integer y = 300
integer width = 297
integer height = 512
integer taborder = 30
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_cdprice_m
integer x = 2715
integer y = 308
integer width = 567
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
end type

type cb_1 from commandbutton within w_cdprice_m
integer x = 3287
integer y = 308
integer width = 160
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

// 필드
if trim(ddlb_3.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_3.text)
		case "물품명"
			ls_col  = "item_name "
		case "규격"
			ls_col  = "qa "
		case "단위"
			ls_col  = "uom "
		case "거래처"
			ls_col  = "cust_cnt "
		case "종전단가"
			ls_col  = "old_price "
		case "표준단가"
			ls_col  = "price "
		case "비고"
			ls_col  = "rem "
	end choose

	if trim(ddlb_4.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_4.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "sys_date " then
			ls_column = ls_col + trim(ddlb_4.text) + " #" + trim(sle_value.text) + "# "
		elseif ls_col = "old_price " or ls_col = "price " or ls_col = "cust_cnt " then
			ls_column = ls_col + trim(ddlb_4.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_4.text) + " '" + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type cb_4 from commandbutton within w_cdprice_m
integer x = 3451
integer y = 308
integer width = 160
integer height = 76
integer taborder = 90
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
ddlb_4.text = "LIKE"
ddlb_3.text = "규격"
sle_value.text = ""

dw_2.setfilter("")
dw_2.filter()

end event

type cb_5 from commandbutton within w_cdprice_m
integer x = 3616
integer y = 308
integer width = 160
integer height = 76
integer taborder = 100
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
string ls_col

choose case trim(ddlb_3.text)
	case "물품명"
		ls_col  = "item_name "
	case "규격"
		ls_col  = "qa "
	case "단위"
		ls_col  = "uom "
	case "거래처"
		ls_col  = "cust_cnt "
	case "종전단가"
		ls_col  = "old_price "
	case "표준단가"
		ls_col  = "price "
	case "비고"
		ls_col  = "rem "
end choose		

dw_2.SetSort(ls_col + "A")
dw_2.sort()

end event

type cb_6 from commandbutton within w_cdprice_m
integer x = 3781
integer y = 308
integer width = 160
integer height = 76
integer taborder = 110
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
string ls_col

choose case trim(ddlb_3.text)
	case "물품명"
		ls_col  = "item_name "
	case "규격"
		ls_col  = "qa "
	case "단위"
		ls_col  = "uom "
	case "거래처"
		ls_col  = "cust_cnt "
	case "종전단가"
		ls_col  = "old_price "
	case "표준단가"
		ls_col  = "price "
	case "비고"
		ls_col  = "rem "
end choose		

dw_2.SetSort(ls_col + "D")
dw_2.sort()

end event

type cb_7 from commandbutton within w_cdprice_m
integer x = 3959
integer y = 308
integer width = 151
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "낮음"
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

ls_temp = " old_price > price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type cb_8 from commandbutton within w_cdprice_m
integer x = 4114
integer y = 308
integer width = 101
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "="
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

ls_temp = " old_price = price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type cb_9 from commandbutton within w_cdprice_m
integer x = 4219
integer y = 308
integer width = 151
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "높음"
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

ls_temp = " old_price < price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type st_6 from statictext within w_cdprice_m
integer x = 3273
integer y = 236
integer width = 434
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "종전단가,확정가"
boolean focusrectangle = false
end type

type cb_10 from commandbutton within w_cdprice_m
integer x = 2757
integer y = 56
integer width = 832
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처단가관리(물품별)"
end type

event clicked;// 거래처 단가관리(물품별)
string   ls_itemno, ls_itemnm, ls_qa
long     ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if IsValid(w_o_main) then 
	OpenSheet(w_cditemcustprice_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cditemcustprice_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cditemcustprice_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cditemcustprice_m,  w_all_main, 5, original!)
end if

ll_row = dw_2.getrow()
ls_itemno = dw_2.object.item_no[ll_row]
ls_itemnm = dw_2.object.item_name[ll_row]
ls_qa     = dw_2.object.qa[ll_row]
w_cditemcustprice_m.sle_1.text = ls_itemno	// 품목 넘겨줌
w_cditemcustprice_m.sle_2.text = ls_itemnm	// 품명 넘겨줌
w_cditemcustprice_m.pb_retrieve.triggerevent( clicked! )

w_cditemcustprice_m.sle_value.text = ls_qa	// 규격 넘겨줌
w_cditemcustprice_m.ddlb_4.text  = "LIKE"
w_cditemcustprice_m.ddlb_3.text  = "규격"
w_cditemcustprice_m.cb_1.triggerevent( clicked! )

end event

type cb_11 from commandbutton within w_cdprice_m
integer x = 1225
integer y = 296
integer width = 146
integer height = 92
integer taborder = 110
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
dw_1.SetSort(is_field + " A")
dw_1.sort()

end event

type cb_12 from commandbutton within w_cdprice_m
integer x = 1381
integer y = 296
integer width = 146
integer height = 92
integer taborder = 120
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
dw_1.SetSort(is_field + " D")
dw_1.sort()

end event

type cb_13 from commandbutton within w_cdprice_m
integer x = 2181
integer y = 56
integer width = 567
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처 단가관리"
end type

event clicked;// 거래처 단가관리
if IsValid(w_o_main) then 
	OpenSheet(w_cdcustprice_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cdcustprice_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cdcustprice_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdcustprice_m,  w_all_main, 5, original!)
end if

end event

