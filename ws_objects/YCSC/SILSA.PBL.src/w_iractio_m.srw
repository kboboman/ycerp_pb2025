$PBExportHeader$w_iractio_m.srw
$PBExportComments$실사입력 및 갱신(2000/09/02)
forward
global type w_iractio_m from w_inheritance
end type
type dw_4 from datawindow within w_iractio_m
end type
type gb_7 from groupbox within w_iractio_m
end type
type gb_5 from groupbox within w_iractio_m
end type
type gb_4 from groupbox within w_iractio_m
end type
type sle_1 from singlelineedit within w_iractio_m
end type
type rb_1 from radiobutton within w_iractio_m
end type
type rb_2 from radiobutton within w_iractio_m
end type
type rb_3 from radiobutton within w_iractio_m
end type
type rb_4 from radiobutton within w_iractio_m
end type
type rb_5 from radiobutton within w_iractio_m
end type
type rb_6 from radiobutton within w_iractio_m
end type
type rb_7 from radiobutton within w_iractio_m
end type
type em_1 from editmask within w_iractio_m
end type
type cbx_1 from checkbox within w_iractio_m
end type
type rb_8 from radiobutton within w_iractio_m
end type
type rb_9 from radiobutton within w_iractio_m
end type
type mle_1 from multilineedit within w_iractio_m
end type
type ddlb_2 from dropdownlistbox within w_iractio_m
end type
type dw_3 from datawindow within w_iractio_m
end type
type cbx_2 from checkbox within w_iractio_m
end type
end forward

global type w_iractio_m from w_inheritance
integer y = 36
integer width = 4229
integer height = 2560
string title = "실사 마감(w_iractio_m)"
dw_4 dw_4
gb_7 gb_7
gb_5 gb_5
gb_4 gb_4
sle_1 sle_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
em_1 em_1
cbx_1 cbx_1
rb_8 rb_8
rb_9 rb_9
mle_1 mle_1
ddlb_2 ddlb_2
dw_3 dw_3
cbx_2 cbx_2
end type
global w_iractio_m w_iractio_m

type variables
st_print i_print
datawindowchild  idwc_qa, idwc_item, idwc_loc

end variables

on w_iractio_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.gb_7=create gb_7
this.gb_5=create gb_5
this.gb_4=create gb_4
this.sle_1=create sle_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.em_1=create em_1
this.cbx_1=create cbx_1
this.rb_8=create rb_8
this.rb_9=create rb_9
this.mle_1=create mle_1
this.ddlb_2=create ddlb_2
this.dw_3=create dw_3
this.cbx_2=create cbx_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.gb_7
this.Control[iCurrent+3]=this.gb_5
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_3
this.Control[iCurrent+9]=this.rb_4
this.Control[iCurrent+10]=this.rb_5
this.Control[iCurrent+11]=this.rb_6
this.Control[iCurrent+12]=this.rb_7
this.Control[iCurrent+13]=this.em_1
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.rb_8
this.Control[iCurrent+16]=this.rb_9
this.Control[iCurrent+17]=this.mle_1
this.Control[iCurrent+18]=this.ddlb_2
this.Control[iCurrent+19]=this.dw_3
this.Control[iCurrent+20]=this.cbx_2
end on

on w_iractio_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.gb_7)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.sle_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.em_1)
destroy(this.cbx_1)
destroy(this.rb_8)
destroy(this.rb_9)
destroy(this.mle_1)
destroy(this.ddlb_2)
destroy(this.dw_3)
destroy(this.cbx_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_loc, ls_defloc

dw_3.SetTransObject(sqlca)
dw_4.SetTransObject(sqlca)

dw_3.visible = false
dw_3.retrieve()

// 저장소
SELECT def_loc INTO :ls_defloc FROM AREA WHERE area_no = :gs_area;

dw_2.getchild("loc_no", idwc_loc)
idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()
dw_2.insertrow(0)
dw_2.object.loc_no[1] = ls_defloc 

// 실사마감(재고조정)
dw_4.visible = false
pb_save.enabled    = false		// 저장
if GF_PERMISSION("실사마감(재고조정)", gs_userid) = "Y" then	
	pb_compute.enabled = true		// 재고변경
	pb_save.enabled    = true		// 저장
	cbx_1.visible      = true		// CoilMST / SheetMST 포함
else
	pb_compute.enabled = false		// 재고변경
	pb_save.enabled    = false		// 저장
	cbx_1.visible      = false		// CoilMST / SheetMST 포함
end if

//dw_1.getchild("itemloc_item_no", idwc_item)
//gs_ds_itemall.ShareData(idwc_item)
//
//dw_1.getchild("itemloc_qa", idwc_qa)
//gs_ds_qaall.ShareData(idwc_qa)

//long ll_row
//for ll_row = 1 to gs_ds_qaall.rowcount()
//	dw_1.insertrow(0) 
//	dw_1.object.itemloc_item_no[ll_row]     = gs_ds_qaall.object.item_no[ll_row]
//	dw_1.object.itemloc_qa[ll_row]          = gs_ds_qaall.object.qa[ll_row]
//	dw_1.object.groupitem_item_name[ll_row] = gs_ds_qaall.object.item_name[ll_row]
//	dw_1.object.groupitem_uom[ll_row]       = gs_ds_qaall.object.uom[ll_row]
////	select qoh into :ld_qoh from ineoym
////	 where ineo
//next

//ddlb_1.text = string(today() ,'yyyy')
//ddlb_2.text = string(today() ,'mm')

em_1.text = string(gf_today() ,'yyyy mm dd') 

end event

event resize;call super::resize;//
dw_1.width   = newwidth  - (dw_1.x * 2)
dw_1.height  = newheight - dw_1.y - dw_1.x

dw_3.x       = dw_1.x + dw_1.width - dw_3.width
dw_3.y       = dw_1.y
dw_3.height  = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_iractio_m
integer x = 3739
integer y = 56
integer taborder = 40
end type

event pb_save::clicked;// 저장
dwItemStatus l_status
long   ll_row, ll_cnt, ll_count
real   lr_countqoh
string ls_location,ls_item,ls_qa, ls_year, ls_mon, ls_update

ls_year = MidA(em_1.text,1,4)
ls_mon  = MidA(em_1.text,6,2)

dw_1.accepttext()
dw_2.accepttext()

ls_location = trim(dw_2.object.loc_no[1])
if trim(ls_location) = '' or isnull(ls_location) then
	MessageBox("확인","저장소를 선택 하십시요")
	return
end if


OPEN(W_ICPROCESS)

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ll_row = dw_1.deletedcount()
ls_update = "N"

ll_row = dw_1.rowcount()
for ll_cnt = 1 to ll_row
	w_icprocess.hpb_1.position = (ll_cnt / ll_row) * 100

	l_status = dw_1.GetItemStatus(ll_cnt, 'qoh', Primary!)
	ls_item  = trim(dw_1.object.itemloc_item_no[ll_cnt])
	ls_qa    = trim(dw_1.object.itemloc_qa[ll_cnt])
	
	if l_status = notmodified! or isnull(ls_item) or trim(ls_item) = '' or &
		isnull(ls_qa) or trim(ls_qa) = '' then continue
	
	ls_update   = "Y"
	lr_countqoh = dw_1.object.qoh[ll_cnt]
	if isnull(lr_countqoh) then lr_countqoh = 0
	
	SELECT count(*) INTO :ll_count FROM ineoym
	 WHERE cyear = :ls_year	  AND cmon = :ls_mon
		AND item_no = :ls_item AND qa = :ls_qa	and loc_no = :ls_location;
	if sqlca.sqlcode < 0 then
		rollback;
		close(w_icprocess)
		MessageBox("오류1", "ineoym select중 ERROR가 발생하였습니다.~r~n재시도하십시요")
		return
	end if
	
	if ll_count > 0 then
		UPDATE ineoym SET qoh = :lr_countqoh
		 WHERE cyear = :ls_year	  AND cmon = :ls_mon
			AND item_no = :ls_item AND qa = :ls_qa	 AND loc_no = :ls_location;
		if sqlca.sqlcode < 0 then
			rollback;
			close(w_icprocess)
			MessageBox('오류2',string(ll_cnt) + ' 줄의 item_no = ' + ls_item + 'qa = ' + ls_qa &
									 + '~r~n 를 INEOYM에 update중 DB오류가 발생했습니다.',exclamation!)
			return
		end if
	else
		INSERT INTO ineoym (cyear, cmon, item_no, qa, loc_no, rcpt_qty, issue_qty, qoh )  
		VALUES ( :ls_year, :ls_mon, :ls_item, :ls_qa, :ls_location, 0, 0, :lr_countqoh );
		if sqlca.sqlcode < 0 then
			rollback;
			close(w_icprocess)
			MessageBox("오류3", "INEOYM INSERT중 ERROR가 발생하였습니다.~r~n재시도하십시요")
			return
		end if
	end if
	
	SELECT count(*) INTO :ll_count FROM itemloc
	 WHERE item_no = :ls_item AND qa = :ls_qa	AND loc_no = :ls_location;
	if sqlca.sqlcode < 0 then
		rollback;
		close(w_icprocess)
		MessageBox("오류4", "itemloc SELECT ERROR가 발생하였습니다.~r~n재시도하십시요")
		return
	end if
	
	if ll_count > 0 then
	else
		INSERT INTO itemloc ( item_no, qa, loc_no, balbf, receipt_qty, issue_qty, qoh, reserved, balbf_fifo_cost )  
		VALUES ( :ls_item, :ls_qa, :ls_location, 0, 0, 0, :lr_countqoh, 0, 0) ;
		if sqlca.sqlcode < 0 then
			rollback;
			close(w_icprocess)
			MessageBox("오류5", "itemloc INSERT중 ERROR가 발생하였습니다.~r~n재시도하십시요")
			return
		end if
	end if
next
COMMIT;

close(w_icprocess)

if ls_update = "Y" then
	MessageBox("확인", "저장이 완료되었습니다.")
else
//	messagebox("확인", "실사자료를 입력하십시요.")
end if

end event

type dw_1 from w_inheritance`dw_1 within w_iractio_m
integer x = 27
integer y = 756
integer width = 4119
integer height = 1664
integer taborder = 60
string dataobject = "d_iractio_m"
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;long ll_row, ll_row1, ll_found
string ls_item_no, ls_qa, ls_date, ls_item_name,  ls_data, ls_uom

this.accepttext()
dw_2.accepttext()
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "itemloc_item_no")
ls_qa = this.getitemstring(ll_row, "itemloc_qa")

choose case dwo.name
	case 'itemloc_item_no'

		this.object.itemloc_qa[ll_row] = ''
		this.object.itemloc_qa.tabsequence = 0
		
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		select item_name, uom into :ls_item_name, :ls_uom from groupitem 
		 where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
			return 1
		end if
		this.object.groupitem_item_name[ll_row] = ls_item_name
		this.object.groupitem_uom[ll_row] = ls_uom
		if ls_item_no <> '' then
			this.getchild("itemloc_qa", idwc_qa)
//			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
			
			if idwc_qa.rowcount() > 0 then
				this.object.itemloc_qa.tabsequence = 1
				this.setcolumn("itemloc_qa")
				this.setfocus()
			else
				this.object.itemloc_qa.tabsequence = 0
				this.setcolumn("itemloc_item_no")
				this.setfocus()
			end if
		end if
		
	case 'itemloc_qa'
		ls_data = data
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
				+ "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 THEN
				if gf_iteminsert(ls_item_no, ls_data) = false then return 1
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			else
				return 1
			end if
		end if
end choose

end event

event dw_1::itemerror;
CHOOSE CASE dwo.name
	CASE 'itemloc_item_no'
			this.object.itemloc_item_no[this.getrow()] = ''
	CASE 'itemloc_qa'
			this.object.itemloc_qa[this.getrow()] = ''	
END CHOOSE
		
return 2
end event

event dw_1::clicked;if row < 1 then return
this.scrolltorow(row)

dwItemStatus l_status
string  ls_item_no

if dwo.name = 'itemloc_qa' then
//	l_status = dw_1.GetItemStatus(row, 'itemloc_qa', Primary!)
//	if l_status = new! or l_status = newmodified! then
//		this.setredraw(false)
//		this.Modify("itemloc_qa.dddw.Name='d_cditemqa_c'")
//		this.Modify("itemloc_qa.dddw.allowedit=yes")
//		this.Modify("itemloc_qa.dddw.percentwidth='120'")
//		this.Modify("itemloc_qa.dddw.displayColumn='qa'")
//		this.Modify("itemloc_qa.dddw.DataColumn='qa'")
//		this.Modify("itemloc_qa.dddw.vscrollbar=yes")
//		this.getchild('coil_no',idwc_qa)
//		idwc_qa.settransobject(sqlca)

		this.getchild("itemloc_qa", idwc_qa)
		idwc_qa.setredraw(false)
		gs_ds_qaall.ShareData(idwc_qa)
		
		this.accepttext()
		ls_item_no = this.object.itemloc_item_no[row]
		if ls_item_no = '' or isnull(ls_item_no) then
			return
		else
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
		end if
		this.setcolumn('itemloc_qa')
		idwc_qa.setredraw(true)
		this.setredraw(true)
//	else
////		dw_1.Modify("itemloc_qa.edit.case=any")
////		dw_1.Modify("itemloc_qa.edit.autoselect=yes")
//////		dw_1.Modify("itemloc_qa.edit.nilisnull=yes")
////		dw_1.Modify("itemloc_qa.edit.display only=yes")
//	end if
end if

end event

event dw_1::rbuttondown;////
int li_int
string ls_item, ls_qa, ls_loc
date ld_date, ld_date_from

if row < 1 then return
this.scrolltorow(row)
ls_loc = trim(dw_2.object.loc_no[1])

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_itemret.PopMenu(w_iractio_m.parentwindow().PointerX(),  w_iractio_m.parentwindow().PointerY())

ld_date = date(em_1.text)
//w_frame.PointerX(), w_frame.PointerY())
ld_date_from = RelativeDate(ld_date, -61)
ls_item = this.object.itemloc_item_no[row]
ls_qa = this.object.itemloc_qa[row]
CHOOSE CASE gs_print_control
	CASE 'issue'
		open(w_whsale_w)

		w_whsale_w.em_1.text = string(ld_date_from, 'yyyy/mm/dd')
		w_whsale_w.em_2.text = em_1.text
		w_whsale_w.st_item.text = ls_item
		w_whsale_w.st_name.text = this.object.groupitem_item_name[row]
		w_whsale_w.st_qa.text = ls_qa
		w_whsale_w.is_loc = ls_loc
		w_whsale_w.is_FLAG = 'ISSUE'
		w_whsale_w.cb_1.postevent(clicked!)
	CASE 'sale'
		open(w_whsale_w)
		
		w_whsale_w.em_1.text = string(ld_date_from, 'yyyy/mm/dd')
		w_whsale_w.em_2.text = em_1.text
		w_whsale_w.st_item.text = ls_item
		w_whsale_w.st_name.text = this.object.groupitem_item_name[row]
		w_whsale_w.st_qa.text = ls_qa
		w_whsale_w.is_loc = ls_loc
		w_whsale_w.is_area = gs_area
		w_whsale_w.is_FLAG = 'SALE'
		w_whsale_w.cb_1.postevent(clicked!)
END CHOOSE

//w_frame.PointerX(), w_frame.PointerY())

end event

type dw_2 from w_inheritance`dw_2 within w_iractio_m
integer x = 791
integer y = 304
integer width = 1006
integer height = 84
integer taborder = 70
string dataobject = "d_irsilsainput_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;//
dw_1.reset()

end event

type st_title from w_inheritance`st_title within w_iractio_m
integer x = 23
integer y = 40
integer width = 1239
string text = "실사마감(재고조정)"
end type

type st_tips from w_inheritance`st_tips within w_iractio_m
end type

type pb_compute from w_inheritance`pb_compute within w_iractio_m
integer x = 3845
integer y = 344
integer width = 247
integer height = 180
integer taborder = 310
end type

event pb_compute::clicked;// 재고변경
//
//ineoymu를 ineoym으로 sum함
//UPDATE INEOYM 
//   SET INEOYM.QOH = (SELECT ISNULL(SUM(INEOYMU.QOH),0) 
//                       FROM INEOYMU 
//                      WHERE INEOYM.CYEAR   = INEOYMU.CYEAR 
//                        AND INEOYM.CMON    = INEOYMU.CMON
//                        AND INEOYM.ITEM_NO = INEOYMU.ITEM_NO 
//                        AND INEOYM.QA      = INEOYMU.QA
//                        AND INEOYM.LOC_NO  = INEOYMU.LOC_NO)
//
// WHERE INEOYM.CYEAR = '2003' 
//   AND INEOYM.CMON  = '08' ;

dwItemStatus l_status
real     lr_countqoh,  lr_mqty, lr_locqoh, lr_stock
long     ll_row,  ll_cnt,  ll_ycnt,   ll_count
string   ls_loc,  ls_item,  ls_qa, ls_year, ls_mon, ls_day, ls_date, ls_old_time
string   ls_chk1_user, ls_chk2_user
datetime ldt_date, ldt_time, ldt_countdate

ls_year = MidA(em_1.text,1,4)
ls_mon  = MidA(em_1.text,6,2)
ls_day  = MidA(em_1.text,9,2)

dw_1.accepttext()
if dw_1.modifiedcount() > 0 then
   MessageBox("확인", "재 조회후에 작업 하십시요")
   return
end if

if MessageBox("확인", ls_year + "년 " + ls_mon + "월 실사재고를 현재고로 반영 하시겠습니까?~r~n" &
            + "(한번더 실사년월을 확인하십시요)", Exclamation!, OKCancel!, 2) = 2 then
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "U", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
ll_row      = dw_1.rowcount()
ls_loc      = trim(dw_2.object.loc_no[1])
ls_date     = ls_year + ls_mon + ls_day
ldt_date    = datetime(date(em_1.text))
ls_old_time = string(now(),'hh:mm:ss:fff')
setnull(ls_chk1_user)
setnull(ls_chk2_user)

if gs_area = 'H0001' then		// 화곡사업장
   ls_chk1_user = gs_userid	// 공장확인
else
   ls_chk2_user = gs_userid   // 판매확인
end if

OPEN(W_ICPROCESS)
for ll_cnt = 1 to ll_row
   w_icprocess.hpb_1.position = (ll_cnt / ll_row) * 99

   ls_item     = trim(dw_1.object.itemloc_item_no[ll_cnt])
   ls_qa       = trim(dw_1.object.itemloc_qa[ll_cnt])
   lr_countqoh = dw_1.object.qoh[ll_cnt]
   if isnull(lr_countqoh) then lr_countqoh = 0
   
   lr_locqoh = 0
   SELECT qoh into :lr_locqoh 
     FROM ITEMLOC
    WHERE item_no = :ls_item and qa = :ls_qa and loc_no = :ls_loc;
   if isnull(lr_locqoh) then lr_locqoh = 0

   SELECT isnull(sum(rcpt_qty), 0) - isnull(sum(issue_qty),0) into :lr_mqty 
     FROM INEODAY
    WHERE cdate   > :ls_date
      AND item_no = :ls_item AND qa = :ls_qa AND loc_no = :ls_loc;
   if isnull(lr_mqty) then lr_mqty = 0
   
   if lr_countqoh = lr_locqoh - lr_mqty then continue
   
   for ll_count = 1 to 100000
      IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
         ls_old_time  = string(now(),'hh:mm:ss:fff')   
         exit
      end if
   next
   
   lr_countqoh =  truncate(lr_countqoh, 4)
   INSERT INTO INAUDIT ( inaudit_time,inaudit_date, inaudit_item, qa, loc_no,   inaudit_type, order_no, rcpt_qty, issue_qty, cost, rem, user_id )  
   SELECT getdate(), :ldt_date, groupitem.item_no, :ls_qa, :ls_loc
        , (case when :lr_countqoh > (isnull(itemloc.qoh, 0) - cineoday.dayqty) then 'RX' else 'IX' end)
        , 'SX' + :ls_date
        , (case when :lr_countqoh > (isnull(itemloc.qoh, 0) - cineoday.dayqty) then :lr_countqoh - (isnull(itemloc.qoh, 0) - cineoday.dayqty) else 0 end)
        , (case when :lr_countqoh < (isnull(itemloc.qoh, 0) - cineoday.dayqty) then (isnull(itemloc.qoh, 0) - cineoday.dayqty) - :lr_countqoh else 0 end)
        , 0
        , :ls_date +'일자실사'
        , :gs_userid  
     FROM groupitem
        , itemloc
        , ( SELECT dayqty = isnull(sum(ineoday.rcpt_qty), 0) - isnull(sum(ineoday.issue_qty),0) 
              FROM ineoday
             WHERE cdate   > :ls_date
               AND item_no = :ls_item AND qa = :ls_qa AND loc_no = :ls_loc 
          ) cineoday
    WHERE groupitem.item_no  = :ls_item
      and groupitem.item_no *= itemloc.item_no 
      and itemloc.qa         = :ls_qa
      and itemloc.loc_no     = :ls_loc;
   if sqlca.sqlcode <> 0 then
      rollback;
      close(w_icprocess)
      MessageBox('오류1', sqlca.sqlerrtext,exclamation!)
      MessageBox('오류1', string(ll_cnt) + ' 줄에서 inaudit INSERT중 DB오류가 발생했습니다.',exclamation!)
      dw_1.scrolltorow(ll_cnt)
      return
   end if
   
   lr_stock = dw_1.object.stock_qty[ll_cnt]
   if isnull(lr_stock) or lr_stock = 0 then
   else
      // 장기재고 
      SELECT count(*) into :ll_count 
        FROM ITEMSTOCK
       WHERE loc_no = :ls_loc  and item_no = :ls_item and qa =:ls_qa;
      if ll_count > 0 then
         UPDATE ITEMSTOCK 
            SET qty = :lr_stock - (SELECT isnull(sum(dodet.ship_qty), 0) 
                                     FROM dodet, do
                                    WHERE dodet.do_no   = do.do_no
                                      AND dodet.item_no = :ls_item AND dodet.qa = :ls_qa AND do.do_date > :ldt_date
                                  )
          WHERE loc_no  = :ls_loc  AND item_no = :ls_item AND qa = :ls_qa;
         if sqlca.sqlcode <> 0 then
            rollback;
            close(w_icprocess)
            MessageBox('오류2','itemstock update중 DB오류가 발생했습니다.',exclamation!)
            return
         end if
      else
         INSERT INTO ITEMSTOCK ( loc_no, item_no, qa, qty, chk1_user, chk2_user, user_date, reason_code )  
         VALUES ( :ls_loc, :ls_item, :ls_qa, :lr_stock, :ls_chk1_user, :ls_chk2_user, :ldt_date, 'Z' )  ;
         if sqlca.sqlcode <> 0 then
            rollback;
            close(w_icprocess)
            MessageBox('오류3','itemstock INSERT중 DB오류가 발생했습니다.',exclamation!)
            return
         end if
      end if
   end if
next

commit;

// SHEET OR COIL 재고를 COILMST / SHEETMST 의 품목별 집계로 ITEMLOC를 UPDATE 한다
if cbx_1.checked = true then  //coilmst/sheetmst 
   UPDATE ITEMLOC 
      SET balbf = 0, receipt_qty = 0, issue_qty = 0, itemloc.qoh = 0
    WHERE (substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '1')
       OR (substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '2');
   if sqlca.sqlcode <> 0 then
      rollback;
      close(w_icprocess)
      MessageBox('오류4','itemloc update중 DB오류가 발생했습니다.',exclamation!)
      return
   end if
   
   UPDATE ITEM 
      SET qoh = 0
    WHERE use_flag = 'Y'
      AND (substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '1')
       OR (substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '2');
   if sqlca.sqlcode <> 0 then
      rollback;
      close(w_icprocess)
      MessageBox('오류5','item update중 DB오류가 발생했습니다.',exclamation!)
      return
   end if

   // coilmst itemloc update
   INSERT INTO ITEMLOC ( item_no, qa, loc_no, balbf, receipt_qty, issue_qty, qoh, reserved, balbf_fifo_cost, last_rcpt_date )  
   (SELECT item_no, qa, loc_no, sum(qcnt), 0, 0, sum(qcnt), 0, 0, getdate() 
      FROM SHEETMST 
     WHERE loc_no + item_no + qa not in ( select loc_no + item_no + qa from itemloc )
       AND open_close <> 'C'
     GROUP BY item_no, qa, loc_no
     
    UNION 
    SELECT item_no, qa, loc_no, sum(unit_qty * qcnt), 0, 0, sum(unit_qty * qcnt), 0, 0, getdate() 
      FROM COILMST 
     WHERE loc_no + item_no + qa not in ( select loc_no + item_no + qa from itemloc)
       AND open_close <> 'C'
     GROUP BY item_no, qa, loc_no
    );
   if sqlca.sqlcode < 0 then
      rollback;
      close(w_icprocess)
      MessageBox('오류5-1','itemloc itemloc DB오류가 발생했습니다.',exclamation!)
      return
   end if

   UPDATE ITEMLOC 
      SET balbf = isnull((select sum(coilmst.unit_qty * coilmst.qcnt)                                     
                            from coilmst   
                           where open_close <> 'C'   
                             and coilmst.item_no = itemloc.item_no
                             and coilmst.qa      = itemloc.qa
                             and coilmst.loc_no  = itemloc.loc_no), 0 )
        , receipt_qty = 0
        , issue_qty   = 0
        , itemloc.qoh = isnull((select sum(coilmst.unit_qty * coilmst.qcnt)                                     
                                 from coilmst   
                                where open_close <> 'C'   
                                  and coilmst.item_no = itemloc.item_no
                                  and coilmst.qa      = itemloc.qa
                                  and coilmst.loc_no  = itemloc.loc_no), 0 )   
    WHERE (substring(itemloc.item_no,1,1) = 'M' 
      AND  substring(itemloc.item_no,4,1) = '1');
   if sqlca.sqlcode <> 0 then
      rollback;
      close(w_icprocess)
      MessageBox('오류6','itemloc에 (coilmst)update중 DB오류가 발생했습니다.',exclamation!)
      return
   end if
   
   // sheetmst itemloc update
   UPDATE ITEMLOC 
      SET balbf = isnull((select sum(sheetmst.qcnt) from sheetmst   
                           where open_close <> 'C'   
                             and sheetmst.item_no = itemloc.item_no
                             and sheetmst.qa      = itemloc.qa
                             and sheetmst.loc_no  = itemloc.loc_no), 0 )
        , receipt_qty = 0
        , issue_qty   = 0
        , itemloc.qoh = isnull((select sum(sheetmst.qcnt) from sheetmst   
                                 where open_close <> 'C'   
                                   and sheetmst.item_no = itemloc.item_no
                                   and sheetmst.qa      = itemloc.qa
                                   and sheetmst.loc_no  = itemloc.loc_no), 0 )
    WHERE (substring(itemloc.item_no,1,1) = 'M' and substring(itemloc.item_no,4,1) = '2');
   if sqlca.sqlcode <> 0 then
      rollback;
      close(w_icprocess)
      MessageBox('오류7','itemloc에 (sheetmst)update중 DB오류가 발생했습니다.',exclamation!)
      return
   end if
   
   // coilmst item update
//   update item 
//      set item.qoh = isnull((select sum(coilmst.unit_qty * coilmst.qcnt)                                     
//                               from coilmst   
//                              where open_close      <> 'C'   
//                                and coilmst.item_no  = item.item_no
//                                and coilmst.qa       = item.qa), 0 )
//    where use_flag = 'Y'
//      and (substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '1');   
//   if sqlca.sqlcode <> 0 then
//      rollback;
//      close(w_icprocess)
//      MessageBox('오류8','item에 (coilmst)update중 DB오류가 발생했습니다.',exclamation!)
//      return
//   end if
   
   // sheetmst item update
//   update item 
//      set item.qoh = isnull((select sum(sheetmst.qcnt)                                     
//                               from sheetmst   
//                              where open_close <> 'C'   
//                                and sheetmst.item_no = item.item_no
//                                and sheetmst.qa = item.qa), 0 )
//    where use_flag = 'Y'
//      and (substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '2');   
//   if sqlca.sqlcode <> 0 then
//      rollback;
//      close(w_icprocess)
//      MessageBox('오류9','item에 (sheetmst)update중 DB오류가 발생했습니다.',exclamation!)
//      return
//   end if

   COMMIT;
end if

if ll_row > 0 then
	// 저장소 마지막실사일자
   UPDATE LOCATION SET count_date = :ldt_date WHERE loc_no = :ls_loc;
   COMMIT;
end if

CLOSE(w_icprocess)
MessageBox('완료','저장이 완료되었습니다!',exclamation!)

end event

event pb_compute::constructor;//update itemloc set balbf = 0, 
//						receipt_qty = 0,
//						issue_qty = 0,
//						itemloc.qoh = 0
// where substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '2'
// 	 or substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '1';
//
//update item set qoh = 0
// where substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '2'
// 	 or substring(item_no,1,1) = 'M' and substring(item_no,4,1) = '1';
//
//	update itemloc set balbf = isnull((select sum(coilmst.unit_qty * coilmst.qcnt) 												
//										  from coilmst	
//										 where open_close <> 'C'	
//											and coilmst.item_no = itemloc.item_no
//											and coilmst.qa = itemloc.qa
//											and coilmst.loc_no = itemloc.loc_no), 0 ),
//							 receipt_qty = 0,
//							 issue_qty = 0,
//							 itemloc.qoh = isnull((select sum(coilmst.unit_qty * coilmst.qcnt) 												
//												  from coilmst	
//												 where open_close <> 'C'	
//													and coilmst.item_no = itemloc.item_no
//													and coilmst.qa = itemloc.qa
//													and coilmst.loc_no = itemloc.loc_no), 0 )
//	
//	where itemloc.item_no like 'M%';
//
//	update itemloc set balbf = isnull((select sum(sheetmst.qcnt) 												
//										  from sheetmst	
//										 where open_close <> 'C'	
//											and substring(sheetmst.item_no,4,1) = '2'
//											and sheetmst.item_no = itemloc.item_no
//											and sheetmst.qa = itemloc.qa
//											and sheetmst.loc_no = itemloc.loc_no), 0 ),
//							 receipt_qty = 0,
//							 issue_qty = 0,
//							 itemloc.qoh = isnull((select sum(sheetmst.qcnt) 												
//												  from sheetmst	
//												 where open_close <> 'C'	
//													and sheetmst.item_no = itemloc.item_no
//													and sheetmst.qa = itemloc.qa
//													and sheetmst.loc_no = itemloc.loc_no), 0 )
//	
//	where itemloc.item_no like 'M%';
//
//	update item set item.qoh = isnull((select sum(coilmst.unit_qty * coilmst.qcnt) 												
//												  from coilmst	
//												 where open_close <> 'C'	
//													and coilmst.item_no = item.item_no
//													and coilmst.qa = item.qa), 0 )
//	where item.item_no like 'M%';	
//
//	update item set item.qoh = isnull((select sum(sheetmst.qcnt) 												
//												  from sheetmst	
//												 where open_close <> 'C'	
//													and substring(sheetmst.item_no,4,1) = '2'
//													and sheetmst.item_no = item.item_no
//													and sheetmst.qa = item.qa), 0 )
//	where item.item_no like 'M%';	
//
//
end event

type pb_print_part from w_inheritance`pb_print_part within w_iractio_m
integer x = 2971
integer y = 56
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;long   ll_row, ll_cnt
string ls_location
gs_where2 lstr_where

dw_2.accepttext()

ls_location = trim(dw_2.object.loc_no[1])
if trim(ls_location) = '' or isnull(ls_location) then
	messagebox("확인","저장소를 선택하십시요")
	return
end if

lstr_where.chk = 'M' // M:nulti S:Single
lstr_where.chk1 = ls_location
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_2.accepttext()
dw_1.accepttext()
dw_1.setredraw(false)
for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(0)
	dw_1.object.itemloc_item_no[ll_cnt]     = trim(lstr_where.str1[ll_row])
	dw_1.object.itemloc_qa[ll_cnt]          = trim(lstr_where.str2[ll_row])
	dw_1.object.groupitem_uom[ll_cnt]       = trim(lstr_where.str3[ll_row])
	dw_1.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_1.scrolltorow(ll_cnt)
idwc_qa.setfilter("item_no = '" + dw_1.object.itemloc_item_no[ll_cnt] + "'")
idwc_qa.filter()
dw_1.setcolumn('qoh')
dw_1.setfocus()
dw_1.setredraw(true)


end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_iractio_m
integer x = 3931
integer y = 56
integer taborder = 330
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iractio_m
integer x = 3547
integer y = 56
integer taborder = 350
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
 
i_print.st_datawindow  = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 실사목록 리스트를 출력합니다." 
//i_print.name = 'd_irincoun_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)
end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"실사목록",parent, li_x, li_y)


end event

type pb_cancel from w_inheritance`pb_cancel within w_iractio_m
integer x = 59
integer y = 304
integer width = 178
integer height = 92
integer taborder = 360
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "정렬"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::mousemove;call super::mousemove;//
end event

event pb_cancel::clicked;
dw_1.setsort('itemloc_item_no , itemloc_qa')
dw_1.sort()
end event

type pb_delete from w_inheritance`pb_delete within w_iractio_m
integer x = 3355
integer y = 56
integer taborder = 440
end type

event pb_delete::clicked;//
if dw_1.getrow() < 1 then return

dw_1.accepttext()
dw_1.deleterow(dw_1.getrow())

end event

type pb_insert from w_inheritance`pb_insert within w_iractio_m
integer x = 3163
integer y = 56
integer taborder = 460
end type

event pb_insert::clicked;long ll_row
string ls_item_no, ls_location

dw_2.accepttext()
dw_1.accepttext()

ls_location = trim(dw_2.object.loc_no[1])
if trim(ls_location) = '' or isnull(ls_location) then
	messagebox("확인","저장소를 선택하십시요")
	return
end if

if dw_1.getrow() < 1 then
	ll_row = 0
else
	ll_row = dw_1.getrow() + 1
end if 

dw_1.getchild("itemloc_item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_1.getchild("itemloc_qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

ll_row = dw_1.insertrow(ll_row)
dw_1.setredraw(false)
if ll_row > 1 then
	dw_1.object.itemloc_item_no[ll_row]     = dw_1.object.itemloc_item_no[ll_row - 1]
	dw_1.object.groupitem_item_name[ll_row] = dw_1.object.groupitem_item_name[ll_row - 1]
	dw_1.object.groupitem_uom[ll_row]       = dw_1.object.groupitem_uom[ll_row - 1]
	
	ls_item_no = dw_1.object.itemloc_item_no[ll_row]
	
	dw_1.getchild("itemloc_qa", idwc_qa)
	
	gs_ds_qaall.ShareData(idwc_qa)
	idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
	idwc_qa.filter()
end if
dw_1.scrolltorow(ll_row)

dw_1.setcolumn('qoh')
dw_1.setfocus()
dw_1.setredraw(true)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iractio_m
integer x = 2775
integer y = 56
integer taborder = 450
end type

event pb_retrieve::clicked;//
string ls_year, ls_mon, ls_day, ls_date, ls_location, ls_code, ls_name

dw_2.accepttext() 
ls_location = trim(dw_2.object.loc_no[1])

if isnull(ls_location) then
	MessageBox('오류','저장소를 선택하십시오.',exclamation!)
	return	
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_year = MidA(em_1.text,1,4)
ls_mon  = MidA(em_1.text,6,2)
ls_day  = MidA(em_1.text,9,2)
ls_date = ls_year + ls_mon + ls_day

dw_1.setredraw(false)
dw_1.reset()
dw_4.reset()
choose case rb_1.checked
	case true
		ls_code = sle_1.text + "%"
		ls_name = "%"
	case else
		if trim(sle_1.text) = '' or isnull(sle_1.text) then
			ls_name = "%"
		else
			ls_name = "%" + sle_1.text + "%"
		end if
		ls_code = "%"
end choose

dw_1.getchild("itemloc_item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)
dw_1.getchild("itemloc_qa", idwc_qa)
idwc_qa.insertrow(1)

dw_1.retrieve(ls_location, ls_year, ls_mon, ls_code, ls_name, ls_date)

dw_1.setredraw(true)
dw_1.sharedata(dw_4)
pb_retrieve.default = false
dw_1.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_iractio_m
integer x = 23
integer y = 240
integer width = 2030
integer height = 176
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iractio_m
integer x = 1326
integer y = 8
integer width = 1417
integer height = 212
integer taborder = 100
integer textsize = -9
long textcolor = 16711680
string text = "실사일자"
end type

type gb_1 from w_inheritance`gb_1 within w_iractio_m
integer x = 2747
integer y = 8
integer width = 1394
integer height = 212
integer taborder = 50
integer textsize = -10
end type

type dw_4 from datawindow within w_iractio_m
integer x = 1198
integer width = 105
integer height = 88
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_irincoun1_r"
boolean livescroll = true
end type

type gb_7 from groupbox within w_iractio_m
integer x = 23
integer y = 432
integer width = 2030
integer height = 172
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "처리방법"
end type

type gb_5 from groupbox within w_iractio_m
integer x = 2089
integer y = 232
integer width = 1678
integer height = 368
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
string text = "필터"
end type

type gb_4 from groupbox within w_iractio_m
integer x = 3785
integer y = 232
integer width = 357
integer height = 368
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "재고변경"
end type

type sle_1 from singlelineedit within w_iractio_m
integer x = 2094
integer y = 100
integer width = 617
integer height = 84
integer taborder = 320
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;pb_retrieve.DEFAULT = true

end event

type rb_1 from radiobutton within w_iractio_m
integer x = 1879
integer y = 88
integer width = 210
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코드"
boolean checked = true
end type

event clicked;dw_1.setsort ( "itemloc_item_no , itemloc_qa")
dw_1.Sort( )

end event

type rb_2 from radiobutton within w_iractio_m
integer x = 1879
integer y = 144
integer width = 210
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "명"
end type

event clicked;dw_1.setsort ( "groupitem_item_name, itemloc_qa")
dw_1.Sort( )

end event

type rb_3 from radiobutton within w_iractio_m
integer x = 274
integer y = 320
integer width = 210
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사내"
boolean checked = true
end type

event clicked;idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()

end event

type rb_4 from radiobutton within w_iractio_m
integer x = 544
integer y = 320
integer width = 210
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "외주"
end type

event clicked;idwc_loc.setfilter("loc_type = 'Y'")
idwc_loc.filter()

end event

type rb_5 from radiobutton within w_iractio_m
integer x = 2130
integer y = 312
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -9
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

type rb_6 from radiobutton within w_iractio_m
integer x = 2130
integer y = 396
integer width = 777
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "실사수량이 0 이 아닌것만"
end type

event clicked;dw_1.setfilter('qoh <> 0')
dw_1.filter()

end event

type rb_7 from radiobutton within w_iractio_m
integer x = 2130
integer y = 488
integer width = 777
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월말재고가 0 이 아닌것만"
end type

event clicked;dw_1.setfilter('eom_qoh <> 0')
dw_1.filter()

end event

type em_1 from editmask within w_iractio_m
integer x = 1358
integer y = 100
integer width = 498
integer height = 84
integer taborder = 340
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type cbx_1 from checkbox within w_iractio_m
integer x = 73
integer y = 236
integer width = 837
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "CoilMST / SheetMST 포함"
end type

type rb_8 from radiobutton within w_iractio_m
integer x = 2935
integer y = 396
integer width = 777
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "둘중하나가 0 이 아닌것만"
end type

event clicked;dw_1.setfilter('eom_qoh <> 0 or qoh <> 0')
dw_1.filter()

end event

type rb_9 from radiobutton within w_iractio_m
integer x = 2935
integer y = 488
integer width = 777
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "두 수량이 같지 않은것만"
end type

event clicked;dw_1.setfilter('eom_qoh <> qoh ')
dw_1.filter()

end event

type mle_1 from multilineedit within w_iractio_m
integer x = 27
integer y = 620
integer width = 3822
integer height = 112
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 134217732
string text = "재고 실사일자 이전 미처리 작업(작업일보, 물품이동)은 저장소재고에 반영 안됨. 재고변경 작업전에 ~'미처리 작업~'은 실적처리 완료 해야 함.(저장소 실사일자 CLEAR)"
boolean border = false
end type

type ddlb_2 from dropdownlistbox within w_iractio_m
integer x = 55
integer y = 492
integer width = 1970
integer height = 492
integer taborder = 320
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"--","전체실사수량 = 0","월말재고 => 실사수량","월말재고 => 실사수량(실사수량이 없는것만)","실사수량을 0 으로(0보다 작은 월말재고만)","실사수량을 0 으로(월말재고가 0 이 아니고 실사수량없는 것만) "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
long ll_row
choose case index
	case 2
		if MessageBox("확인","실사수량을 전부 0 으로 만드시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 2 then 
				this.text = '--'
				return
		end if
		
		dw_1.accepttext()
		
		dw_1.setredraw(false)
		dw_1.accepttext()
		for ll_row = 1 to dw_1.rowcount()
			dw_1.object.qoh[ll_row] = 0
		next
		dw_1.accepttext()
		dw_1.setredraw(true)
		MessageBox("확인","작업이 완료되었습니다.")
		
	case 3
		if MessageBox("확인","실사수량을 전부 월말재고로 만드시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 2 then 
				this.text = '--'
				return
		end if
		
		dw_1.setredraw(false)
		dw_1.accepttext()
		
		for ll_row = 1 to dw_1.rowcount()
			dw_1.object.qoh[ll_row] = dw_1.object.eom_qoh[ll_row]
		next
		dw_1.accepttext()
		dw_1.setredraw(true)
		MessageBox("확인","작업이 완료되었습니다.")
		
	case 4
		if MessageBox("확인","실사수량이 없는 실사수량을 전부 월말재고로 만드시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 2 then 
				this.text = '--'
				return
		end if
		
		dw_1.setredraw(false)
		dw_1.accepttext()
		
		for ll_row = 1 to dw_1.rowcount()
			if dw_1.object.eom_qoh[ll_row] > 0 &
				and (isnull(dw_1.object.qoh[ll_row]) or dw_1.object.qoh[ll_row] = 0 )then
				dw_1.object.qoh[ll_row] = dw_1.object.eom_qoh[ll_row]
			end if
		next
		dw_1.accepttext()
		dw_1.setredraw(true)
		MessageBox("확인","작업이 완료되었습니다.")
		
	case 5
		if MessageBox("확인","0보다 작은 월말재고만 실사수량을 0으로 만드시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 2 then 
				this.text = '--'
				return
		end if
		
		dw_1.setredraw(false)
		dw_1.accepttext()
		
		for ll_row = 1 to dw_1.rowcount()
			if dw_1.object.eom_qoh[ll_row] <> 0 and isnull(dw_1.object.qoh[ll_row])then
				dw_1.object.qoh[ll_row] = 0
			end if
		next
		dw_1.accepttext()
		dw_1.setredraw(true)
		MessageBox("확인","작업이 완료되었습니다.")
		
	case 6
		if MessageBox("확인","월말재고가 0이아니면서 실사수량 없는 실사수량을 0으로 만드시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 2 then 
				this.text = '--'
				return
		end if
		
		dw_1.setredraw(false)
		dw_1.accepttext()
		
		for ll_row = 1 to dw_1.rowcount()
			if dw_1.object.eom_qoh[ll_row] <> 0 and isnull(dw_1.object.qoh[ll_row])then
				dw_1.object.qoh[ll_row] = 0
			end if
		next
		dw_1.accepttext()
		dw_1.setredraw(true)
		MessageBox("확인","작업이 완료되었습니다.")
end choose

end event

event constructor;this.text = '--'
end event

type dw_3 from datawindow within w_iractio_m
integer x = 1842
integer y = 756
integer width = 2295
integer height = 1664
integer taborder = 110
boolean bringtotop = true
boolean titlebar = true
string title = "저장소 실사일자"
string dataobject = "d_loc_countday"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = StyleLowered!
end type

type cbx_2 from checkbox within w_iractio_m
integer x = 3607
integer y = 684
integer width = 558
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "실사일자 보기"
end type

event clicked;//
if this.checked = true then
	dw_3.visible = true
else
	dw_3.visible = false
end if


end event

