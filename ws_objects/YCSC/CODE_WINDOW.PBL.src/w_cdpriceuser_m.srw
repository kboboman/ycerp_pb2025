$PBExportHeader$w_cdpriceuser_m.srw
$PBExportComments$사용자표준단가변경(1998/4/24,성삼지)
forward
global type w_cdpriceuser_m from w_inheritance
end type
type gb_4 from groupbox within w_cdpriceuser_m
end type
type dw_3 from datawindow within w_cdpriceuser_m
end type
type cb_3 from commandbutton within w_cdpriceuser_m
end type
type sle_1 from singlelineedit within w_cdpriceuser_m
end type
type st_4 from statictext within w_cdpriceuser_m
end type
type st_2 from statictext within w_cdpriceuser_m
end type
end forward

global type w_cdpriceuser_m from w_inheritance
integer width = 3776
integer height = 2072
string title = "표준단가수정(물품별)(w_cdpriceuser_m)"
long backcolor = 79220952
gb_4 gb_4
dw_3 dw_3
cb_3 cb_3
sle_1 sle_1
st_4 st_4
st_2 st_2
end type
global w_cdpriceuser_m w_cdpriceuser_m

type variables
public string is_scene_code,is_scene_desc, is_custno,is_custname
string is_dw1sql, is_dw3sql

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.visible = false
cb_3.enabled = false		// 찾기

if gf_permission('물품표준단가관리자', gs_userid) = 'Y' then
   pb_save.enabled  = true
   pb_print.enabled = true
else
   pb_save.enabled  = false
   pb_print.enabled = false
end if

dw_3.settransobject(sqlca)
is_dw1sql = dw_1.describe("datawindow.table.select")
is_dw3sql = dw_3.describe("datawindow.table.select")

end event

on w_cdpriceuser_m.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.dw_3=create dw_3
this.cb_3=create cb_3
this.sle_1=create sle_1
this.st_4=create st_4
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_2
end on

on w_cdpriceuser_m.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.st_4)
destroy(this.st_2)
end on

event resize;call super::resize;//
//gb_2.width  = this.width  - 2537
gb_2.height = this.height - 376

//dw_1.width  = this.width  - 2597
dw_1.height = this.height - 580

gb_4.width  = this.width  - 1371
gb_4.height = this.height - 376

dw_2.width  = this.width  - 1435
dw_2.height = this.height - 472

end event

type pb_save from w_inheritance`pb_save within w_cdpriceuser_m
integer x = 3282
integer y = 60
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
		ls_item  = dw_2.object.item_no[ll_cnt]
		ls_qa    = dw_2.object.qa[ll_cnt]
		dw_2.object.user_id[ll_cnt]   = gs_userid
		dw_2.object.tran_date[ll_cnt] = gf_today()

		// itemcostb : 물품별단가내역
		INSERT INTO itemcostb (item_no, qa, tran_date, uom, user_id, rem, price, old_price) 
		SELECT item_no, qa, tran_date, uom, user_id, rem, price, old_price
		  FROM itemcost
		 WHERE item_no = :ls_item  and qa = :ls_qa;
		if sqlca.sqldbcode <> 0 then
			messagebox("저장오류","단가내역 저장중 에러가 발생했습니다.", exclamation!)
			rollback;
			return
		end if
		
	   SELECT price INTO :ld_price FROM itemcost WHERE item_no = :ls_item  AND qa = :ls_qa;
      if dw_2.object.price[ll_cnt] <> ld_price then			
         ld_price2 = dw_2.object.price[ll_cnt]			
	      dw_2.object.old_price[ll_cnt] = ld_price
			ls_qa = trim(ls_qa) + '%'
			
			// 품목
	   	UPDATE item SET price_a = :ld_price2 WHERE item_no = :ls_item AND qa LIKE :ls_qa;
			if sqlca.sqldbcode <> 0 then
				messagebox("저장오류","물품단가 저장중 에러가 발생했습니다.", exclamation!)
				rollback;
				return
			end if			
	   end if
	end if
next

// 수정 의미모름...
for ll_cnt = 1 to dw_2.rowcount()
	dw_2.object.upda_chk[ll_cnt] = "N"		// 불가
next
wf_update1(dw_2,"Y") 


end event

type dw_1 from w_inheritance`dw_1 within w_cdpriceuser_m
integer x = 59
integer y = 404
integer width = 1179
integer height = 1492
integer taborder = 50
string dataobject = "d_cditemdw_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;dwItemStatus  l_status
dec     ld_price, ld_price2
string  ls_item,  ls_qa, ls_itemno
integer ll_row,   ll_cnt

dw_2.Accepttext()
ll_row = wf_modifycount(dw_2)
if ll_row < 1 then
   if this.rowcount() > 0 then
	   dw_2.retrieve(this.getitemstring(this.getrow(), "item_no"))
   end if	
	return
end if

if messagebox("저장","저장하시겠습니까?",question!,okcancel!,1) = 1 then	
   ll_row = dw_2.rowcount()
   for ll_cnt =1 to ll_row
	   l_status = dw_2.GetItemStatus(ll_cnt, 0, Primary!)
	   if l_status = datamodified! then
		   ls_item  = dw_2.object.item_no[ll_cnt]
		   ls_qa    = dw_2.object.qa[ll_cnt]
	   	dw_2.object.user_id[ll_cnt]   = gs_userid
   		dw_2.object.tran_date[ll_cnt] = gf_today()
			
	   	INSERT INTO itemcostb (item_no, qa, tran_date, uom, user_id, rem, price, old_price) 
		   SELECT item_no, qa, tran_date, uom, user_id, rem, price, old_price
			  FROM itemcost
		    WHERE item_no = :ls_item AND qa = :ls_qa;
   		if sqlca.sqldbcode <> 0 then
	   		messagebox("저장오류","단가내역 저장중 에러가 발생했습니다.", exclamation!)
		   	rollback;
			   return
   		end if
	   	
	      SELECT price INTO :ld_price FROM itemcost WHERE item_no = :ls_item AND qa = :ls_qa;
         if dw_2.object.price[ll_cnt] <> ld_price then			
            ld_price2 = dw_2.object.price[ll_cnt]			
   	      dw_2.object.old_price[ll_cnt] = ld_price		// 이전단가
				
	   		ls_qa = trim(ls_qa) + '%'
	      	UPDATE item SET price_a = :ld_price2 WHERE item_no = :ls_item AND qa  LIKE :ls_qa;
      		if sqlca.sqldbcode <> 0 then
		      	messagebox("저장오류","물품단가 저장중 에러가 발생했습니다.", exclamation!)
	      		rollback;
			      return
	      	end if
	      end if
	   end if
   next
	wf_update1(dw_2,"Y") 
else
	rollback;
end if

if this.rowcount() > 0 then
	dw_2.retrieve(this.getitemstring(this.getrow(), "item_no"))
end if	

end event

event dw_1::retrieveend;sle_1.setfocus()
end event

type dw_2 from w_inheritance`dw_2 within w_cdpriceuser_m
integer x = 1317
integer y = 296
integer height = 1600
integer taborder = 60
string dataobject = "d_cditemcostu_m"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_cdpriceuser_m
integer x = 23
integer width = 1422
integer height = 132
string text = "표준단가 수정(물품별)"
end type

type st_tips from w_inheritance`st_tips within w_cdpriceuser_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdpriceuser_m
boolean visible = false
integer y = 48
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdpriceuser_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdpriceuser_m
integer x = 3474
integer y = 60
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdpriceuser_m
integer x = 3090
integer y = 60
integer taborder = 130
end type

event pb_print::clicked;gs_codere_str lst_code
w_repsuper w_print
st_print   l_print
string     ls_sql, ls_where

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

type pb_cancel from w_inheritance`pb_cancel within w_cdpriceuser_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdpriceuser_m
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

type pb_insert from w_inheritance`pb_insert within w_cdpriceuser_m
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

type pb_retrieve from w_inheritance`pb_retrieve within w_cdpriceuser_m
integer x = 2898
integer y = 60
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

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
dw_1.retrieve()

cb_3.enabled = true		// 찾기

end event

type gb_3 from w_inheritance`gb_3 within w_cdpriceuser_m
boolean visible = false
integer x = 1513
integer y = 208
integer width = 2080
integer height = 400
integer taborder = 90
long backcolor = 12632256
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_cdpriceuser_m
integer y = 232
integer width = 1239
integer height = 1696
integer taborder = 100
integer textsize = -10
long textcolor = 33554432
long backcolor = 79416533
string text = "item"
end type

type gb_1 from w_inheritance`gb_1 within w_cdpriceuser_m
integer x = 2862
integer y = 20
integer width = 827
integer taborder = 40
long backcolor = 79416533
end type

type gb_4 from groupbox within w_cdpriceuser_m
integer x = 1289
integer y = 232
integer width = 2405
integer height = 1696
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "itemcost"
end type

type dw_3 from datawindow within w_cdpriceuser_m
integer x = 1394
integer y = 8
integer width = 105
integer height = 84
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cditemcost_r"
boolean livescroll = true
end type

type cb_3 from commandbutton within w_cdpriceuser_m
integer x = 1024
integer y = 292
integer width = 215
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "찾기"
end type

event clicked;string ls_where,ls_filter
string ls_item

ls_item = trim(UPPER(sle_1.text))

if isnull(ls_item) or ls_item = "" then
	ls_where  = ""
else
	ls_filter = '%' + ls_item + '%'
	ls_where  = "item_name like '" + ls_filter + "'"
end if
dw_1.SetFilter(ls_where)
dw_1.Filter()

if dw_1.rowcount() > 1 then
	dw_1.ScrollToRow(1)
end if
sle_1.setfocus()

end event

type sle_1 from singlelineedit within w_cdpriceuser_m
integer x = 325
integer y = 292
integer width = 690
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
borderstyle borderstyle = stylelowered!
end type

event getfocus;cb_3.default = true
end event

event losefocus;cb_3.default = false
end event

event modified;cb_3.triggerevent(clicked!)
end event

type st_4 from statictext within w_cdpriceuser_m
integer x = 64
integer y = 312
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
boolean enabled = false
string text = "찾기 =>"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdpriceuser_m
integer x = 1490
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

