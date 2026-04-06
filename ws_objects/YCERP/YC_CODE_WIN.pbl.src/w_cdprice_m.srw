$PBExportHeader$w_cdprice_m.srw
$PBExportComments$물품별 표준단가관리(1998/3/14,성삼지)
forward
global type w_cdprice_m from w_inheritance
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
type st_3 from statictext within w_cdprice_m
end type
type ddlb_fld from dropdownlistbox within w_cdprice_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdprice_m
end type
type st_1 from statictext within w_cdprice_m
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
type cb_14 from commandbutton within w_cdprice_m
end type
type pb_4 from picturebutton within w_cdprice_m
end type
type dw_4 from datawindow within w_cdprice_m
end type
type st_vertical from u_splitbar_vertical within w_cdprice_m
end type
type st_5 from statictext within w_cdprice_m
end type
type ddlb_op from dropdownlistbox within w_cdprice_m
end type
end forward

global type w_cdprice_m from w_inheritance
integer width = 4663
integer height = 2068
string title = "표준단가관리(물품별)(w_cdprice_m)"
long backcolor = 79220952
boolean center = true
dw_3 dw_3
sle_1 sle_1
st_4 st_4
cb_3 cb_3
st_2 st_2
cb_2 cb_2
cbx_all cbx_all
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
st_6 st_6
cb_10 cb_10
cb_11 cb_11
cb_12 cb_12
cb_13 cb_13
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_1 st_1
sle_value sle_value
cb_1 cb_1
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_14 cb_14
pb_4 pb_4
dw_4 dw_4
st_vertical st_vertical
st_5 st_5
ddlb_op ddlb_op
end type
global w_cdprice_m w_cdprice_m

type variables
public string is_scene_code,is_scene_desc, is_custno,is_custname
string is_dw1sql, is_dw3sql, is_field


end variables

forward prototypes
public subroutine wf_multi_select (datawindow a_dw, long al_row)
end prototypes

public subroutine wf_multi_select (datawindow a_dw, long al_row);//**************************************//
// 함수명 : wf_multi_select
// 전달값 : a_dw(datawindow),al_row(현재row)
// 
// 이 함수를 해당 Datawindow의 Clicked Event에서 부르면 됩니다.
// Clicked Event Script
// 
// if row < 1 then return
// wf_multi_select(this,row)
// 
//**************************************//

long  w_selrow, i

if al_row <= 0 then return

if keydown(keyshift!)then
   w_selrow = a_dw.GetSelectedRow(0)
   if w_selrow > 0 then
      for i = min(w_selrow,al_row) to max(w_selrow, al_row)
         a_dw.SelectRow(i, true)
			a_dw.object.chk[i] = 1			
      next
   else
		a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1			
   end if
elseif keydown(KeyControl!) then
   if a_dw.isSelected(al_row) then
      a_dw.SelectRow(al_row, false)
		a_dw.object.chk[al_row] = 0			
   else
      a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1
   end if
 else
   if a_dw.isSelected(al_row) then
      a_dw.SelectRow(0, false)
		a_dw.object.chk[al_row] = 0			
   else
      a_dw.SelectRow(0,false)
      a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1			
   end if
 end if  
//**************************************//

end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )

dw_4.visible = false		// 최저단가 목록
dw_3.visible = false
cb_2.visible = false		// 단가수정
cb_3.enabled = false		// 찾기
cb_10.enabled = false	// 거래처 단가관리(물품별)

pb_save.enabled   = false
pb_print.enabled  = false

dw_1.object.item_no.visible   = false

dw_2.object.price_min.visible = false
dw_2.object.min_date.visible  = false
dw_2.object.rem.visible = false

if gf_permission('물품표준단가관리자', gs_userid) = 'Y' then
   pb_save.enabled   = true
   pb_print.enabled  = true

	dw_2.object.price_min.visible = true
	dw_2.object.min_date.visible  = true
	dw_2.object.rem.visible = true
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
this.dw_3=create dw_3
this.sle_1=create sle_1
this.st_4=create st_4
this.cb_3=create cb_3
this.st_2=create st_2
this.cb_2=create cb_2
this.cbx_all=create cbx_all
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.st_6=create st_6
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cb_12=create cb_12
this.cb_13=create cb_13
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_1=create st_1
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_14=create cb_14
this.pb_4=create pb_4
this.dw_4=create dw_4
this.st_vertical=create st_vertical
this.st_5=create st_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cbx_all
this.Control[iCurrent+8]=this.cb_7
this.Control[iCurrent+9]=this.cb_8
this.Control[iCurrent+10]=this.cb_9
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.cb_10
this.Control[iCurrent+13]=this.cb_11
this.Control[iCurrent+14]=this.cb_12
this.Control[iCurrent+15]=this.cb_13
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.ddlb_fld
this.Control[iCurrent+18]=this.ddlb_dwtitles
this.Control[iCurrent+19]=this.st_1
this.Control[iCurrent+20]=this.sle_value
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.cb_4
this.Control[iCurrent+23]=this.cb_5
this.Control[iCurrent+24]=this.cb_6
this.Control[iCurrent+25]=this.cb_14
this.Control[iCurrent+26]=this.pb_4
this.Control[iCurrent+27]=this.dw_4
this.Control[iCurrent+28]=this.st_vertical
this.Control[iCurrent+29]=this.st_5
this.Control[iCurrent+30]=this.ddlb_op
end on

on w_cdprice_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.sle_1)
destroy(this.st_4)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cbx_all)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.st_6)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.cb_13)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_1)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_14)
destroy(this.pb_4)
destroy(this.dw_4)
destroy(this.st_vertical)
destroy(this.st_5)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_2.width
st_vertical.height = dw_1.height

dw_2.x             = st_vertical.x + st_vertical.width
dw_2.width         = newwidth  - dw_2.x - gb_2.x
dw_2.height        = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_cdprice_m
integer x = 4183
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
		dw_2.object.min_date[ll_cnt]  = gf_today()
		
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

//////////////////////////////////
// 저장
//////////////////////////////////
wf_update1(dw_2,"Y") 
//////////////////////////////////
if MessageBox("조회","조회 하시겠습니까?",question!,okcancel!,2) = 1 then
	ll_row = dw_1.getrow()
	pb_retrieve.triggerevent( clicked! )
	if dw_1.getrow() > ll_row then
		dw_1.scrolltorow( ll_row )
	end if
end if
end event

type dw_1 from w_inheritance`dw_1 within w_cdprice_m
integer x = 32
integer y = 420
integer width = 1705
integer height = 1508
string dataobject = "d_cditemdw_s1"
end type

event dw_1::retrieveend;sle_1.setfocus()
end event

event dw_1::clicked;call super::clicked;//
string ls_value, ls_col, ls_text
string ls_itemno

if row < 1 or row > this.rowcount() then return

this.accepttext()

choose case dwo.name
	case "item_no"
		ls_value = this.object.item_no[row]
		is_field = dwo.name
	case "item_name"
		ls_value = this.object.item_name[row]		
		is_field = dwo.name
	case "cnt"
		ls_value = string(this.object.cnt[row])
		is_field = dwo.name
	case "mincnt"
		ls_value = string(this.object.mincnt[row])		
		is_field = dwo.name
	case "uom"
		ls_value = string(this.object.uom[row])		
		is_field = dwo.name
end choose

sle_1.text     = ls_value

ls_itemno = this.object.item_no[row]
dw_2.retrieve( ls_itemno )

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
integer x = 4375
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdprice_m
integer x = 3785
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
integer x = 3982
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;call super::clicked;//
if dw_2.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_2.accepttext()
dw_2.deleterow(dw_2.getrow())
//wf_update1(dw_2,"Y")

end event

type pb_insert from w_inheritance`pb_insert within w_cdprice_m
integer x = 3593
integer y = 56
integer taborder = 170
end type

event pb_insert::clicked;call super::clicked;//
string ls_itemno, ls_itemnm
long   ll_row

if dw_1.rowcount() < 1 then RETURN

ll_row = dw_2.insertrow(0)

ls_itemno = dw_1.getitemstring(dw_1.getrow(),'item_no')
ls_itemnm = dw_1.getitemstring(dw_1.getrow(),'item_name')

dw_2.setitem( ll_row, 'item_no',   ls_itemno  )
dw_2.setitem( ll_row, 'item_name', ls_itemnm  )
dw_2.setitem( ll_row, 'user_id',   gs_userid  )
dw_2.setitem( ll_row, 'tran_date', gf_today() )
dw_2.setitem( ll_row, 'min_date',  gf_today() )
dw_2.setitem( ll_row, 'old_price', 0          )
dw_2.setitem( ll_row, 'price',     0          )
dw_2.setitem( ll_row, 'price_min', 0          )

dw_2.scrolltorow(ll_row)
dw_2.setcolumn('qa')
dw_2.setfocus()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdprice_m
integer x = 3397
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

sle_1.text = ""
//cb_3.triggerevent( clicked! )	// 필터
cb_4.triggerevent( clicked! )		// 해지

dw_4.settransobject(sqlca)			// 최저단가
dw_4.reset()
dw_4.retrieve()

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_1.reset()
dw_1.retrieve()

//cb_2.enabled   = true	// 단가수정
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
integer y = 232
integer width = 4558
integer height = 180
integer taborder = 90
integer textsize = -10
long textcolor = 33554432
long backcolor = 79416533
string text = "item"
end type

type gb_1 from w_inheritance`gb_1 within w_cdprice_m
integer x = 1486
integer y = 16
integer width = 3104
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdprice_m
integer x = 1774
integer y = 420
integer width = 2830
integer height = 1508
string dataobject = "d_cditemcost_m1"
end type

event dw_2::clicked;call super::clicked;////
//if dwo.name = "seq" then
//	if row < 1 then return
//	WF_MULTI_SELECT(this, row)	// 다중선택
//else
	//
	GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
	//This.SelectRow(0, FALSE)
	//This.SelectRow(row, TRUE)
//end if

end event

event dw_2::itemfocuschanged;call super::itemfocuschanged;// DataWinodw AutoSelection = true 대체

choose case dwo.name
	case "price_min", "price"
		this.SelectText(1, LenA(GetText()) + 2 )		// 금액전체 선택
end choose

end event

type dw_3 from datawindow within w_cdprice_m
integer x = 1029
integer y = 8
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

event clicked;//
string ls_where, ls_filter, ls_op
string ls_value, ls_itemno

ls_value = trim(UPPER(sle_1.text))
dw_1.SetFilter(" item_name like '%" + ls_value + "%' " )
dw_1.Filter()

if dw_1.rowcount() > 0 then
	ls_itemno = dw_1.getitemstring(dw_1.getrow(), "item_no")
	dw_2.retrieve( ls_itemno )
end if
sle_1.setfocus()

end event

type st_2 from statictext within w_cdprice_m
integer x = 1408
integer y = 12
integer width = 521
integer height = 44
boolean bringtotop = true
integer textsize = -8
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
integer x = 1518
integer y = 56
integer width = 421
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
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
integer x = 3895
integer y = 228
integer width = 224
integer height = 60
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

type cb_7 from commandbutton within w_cdprice_m
integer x = 4146
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
integer x = 4302
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
integer x = 4407
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
integer x = 3461
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
integer x = 2528
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
integer x = 1353
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
integer x = 1504
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
integer x = 1952
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

type st_3 from statictext within w_cdprice_m
integer x = 1797
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

type ddlb_fld from dropdownlistbox within w_cdprice_m
integer x = 1984
integer y = 300
integer width = 443
integer height = 632
integer taborder = 90
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

type ddlb_dwtitles from dropdownlistbox within w_cdprice_m
integer x = 2016
integer y = 312
integer width = 311
integer height = 88
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

type st_1 from statictext within w_cdprice_m
integer x = 2455
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

type sle_value from singlelineedit within w_cdprice_m
integer x = 2944
integer y = 308
integer width = 462
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
integer x = 3424
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

event clicked;//
datawindow arg_dw

arg_dw  = dw_2
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_cdprice_m
integer x = 3589
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
DataWindow arg_dw

arg_dw = dw_2

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_cdprice_m
integer x = 3753
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
DataWindow arg_dw

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_cdprice_m
integer x = 3918
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
DataWindow arg_dw

arg_dw = dw_2
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_14 from commandbutton within w_cdprice_m
integer x = 1202
integer y = 296
integer width = 146
integer height = 92
integer taborder = 50
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

sle_1.text = ""
arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type pb_4 from picturebutton within w_cdprice_m
event mousemove pbm_mousemove
integer x = 1504
integer y = 56
integer width = 443
integer height = 144
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "최저단가목록"
alignment htextalign = right!
vtextalign vtextalign = vcenter!
end type

event clicked;String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_4
if ldw_sel.rowcount() > 0 then
	Integer iRet

	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		choose case ls_ExpandName
			case "xls", "XLS"
				ldw_sel.SaveAsascii(ls_DocName)
			case "csv", "CSV"
				ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end choose
	end if
end if	


end event

type dw_4 from datawindow within w_cdprice_m
integer x = 818
integer y = 8
integer width = 142
integer height = 104
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdprice_min"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_vertical from u_splitbar_vertical within w_cdprice_m
integer x = 1746
integer y = 420
integer height = 1508
boolean bringtotop = true
end type

type st_5 from statictext within w_cdprice_m
integer x = 1815
integer y = 236
integer width = 311
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79416533
string text = "itemcost"
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_cdprice_m
integer x = 2624
integer y = 300
integer width = 306
integer height = 500
integer taborder = 80
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

