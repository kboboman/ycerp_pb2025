$PBExportHeader$w_mpplan_m.srw
$PBExportComments$생산계획조정(1998/05/21,곽용덕)
forward
global type w_mpplan_m from w_inheritance
end type
type dw_9 from datawindow within w_mpplan_m
end type
type dw_10 from datawindow within w_mpplan_m
end type
type tab_1 from tab within w_mpplan_m
end type
type tabpage_3 from userobject within tab_1
end type
type cbx_confirm from checkbox within tabpage_3
end type
type st_wctype from statictext within tabpage_3
end type
type dw_4 from datawindow within tabpage_3
end type
type pb_4 from picturebutton within tabpage_3
end type
type pb_5 from picturebutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cbx_confirm cbx_confirm
st_wctype st_wctype
dw_4 dw_4
pb_4 pb_4
pb_5 pb_5
end type
type tabpage_4 from userobject within tab_1
end type
type cb_12 from commandbutton within tabpage_4
end type
type cb_11 from commandbutton within tabpage_4
end type
type cb_filteroff from commandbutton within tabpage_4
end type
type cb_filteron from commandbutton within tabpage_4
end type
type sle_value from singlelineedit within tabpage_4
end type
type ddlb_2 from dropdownlistbox within tabpage_4
end type
type st_9 from statictext within tabpage_4
end type
type ddlb_col from dropdownlistbox within tabpage_4
end type
type st_8 from statictext within tabpage_4
end type
type cb_3 from commandbutton within tabpage_4
end type
type cbx_2 from checkbox within tabpage_4
end type
type pb_1 from picturebutton within tabpage_4
end type
type pb_2 from picturebutton within tabpage_4
end type
type pb_3 from picturebutton within tabpage_4
end type
type cb_1 from commandbutton within tabpage_4
end type
type ddlb_1 from dropdownlistbox within tabpage_4
end type
type st_1 from statictext within tabpage_4
end type
type cb_2 from commandbutton within tabpage_4
end type
type dw_7 from datawindow within tabpage_4
end type
type pb_7 from picturebutton within tabpage_4
end type
type dw_6 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_12 cb_12
cb_11 cb_11
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
ddlb_2 ddlb_2
st_9 st_9
ddlb_col ddlb_col
st_8 st_8
cb_3 cb_3
cbx_2 cbx_2
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
cb_1 cb_1
ddlb_1 ddlb_1
st_1 st_1
cb_2 cb_2
dw_7 dw_7
pb_7 pb_7
dw_6 dw_6
end type
type tab_1 from tab within w_mpplan_m
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type cbx_1 from checkbox within w_mpplan_m
end type
type dw_area from datawindow within w_mpplan_m
end type
type pb_file from picturebutton within w_mpplan_m
end type
type cb_10 from commandbutton within w_mpplan_m
end type
type cb_13 from commandbutton within w_mpplan_m
end type
type cb_4 from commandbutton within w_mpplan_m
end type
type gb_15 from groupbox within w_mpplan_m
end type
end forward

global type w_mpplan_m from w_inheritance
integer width = 4695
integer height = 2900
string title = "생산계획 조정(w_mpplan_m)"
dw_9 dw_9
dw_10 dw_10
tab_1 tab_1
cbx_1 cbx_1
dw_area dw_area
pb_file pb_file
cb_10 cb_10
cb_13 cb_13
cb_4 cb_4
gb_15 gb_15
end type
global w_mpplan_m w_mpplan_m

type variables
datawindowchild idwc_qa,  idwc_item
dwobject idw_target
int    ii_flag, ii_seq, ii_sw = 0, ii_wid = 0
long   il_row = 0
string is_like, is_sale, is_acc = 'N', is_area, is_select, is_time
datawindow dw3, dw4, dw5, dw6, dw7, dw9, dw10
gs_itembaldo_str ist_code

end variables

forward prototypes
public function boolean wf_itemchk ()
public function boolean wf_mpouter ()
public function boolean wf_saledetupdate ()
public subroutine wf_area (string as_area)
public function boolean wf_itemselect (datawindow arg_dw, string arg_ms, integer ai_row)
end prototypes

public function boolean wf_itemchk ();dwItemStatus l_status
int    i, li_exist
string ls_item, ls_qa

for i = 1 to dw6.rowcount()
   l_status = dw6.GetItemStatus(i,0, Primary!)
   if l_status <> NotModified! then
		ls_item = trim(dw6.GetItemString(i, "assy_item")) 
		ls_qa   = trim(dw6.GetItemString(i, "assy_qa"))
		SELECT count(*) INTO :li_exist 
		  FROM item
		 WHERE item_no = :ls_item AND qa   = :ls_qa;
		if sqlca.sqlcode = 100 or li_exist = 0 then
		   MessageBox('오류','수주내역의 ' + string(i) + ' 번째 제조물품이 잘못되었습니다',exclamation!)
		   return false
		end if
	end if
next

return true
end function

public function boolean wf_mpouter ();long    ll_rowcount, ll_cnt, ll_find, ll_row, ll_count
integer li_operation, li_op, li_seq
string  ls_plan, ls_sale, ls_assy, ls_assyqa, ls_uom
//real lr_planqty

dw4.accepttext()
dw_9.reset()
dw_10.reset()
ll_rowcount  = dw4.rowcount()

for ll_cnt = 1 to ll_rowcount
	li_operation = dw4.object.operation[ll_cnt]
	ls_plan = trim(dw4.object.plan_no[ll_cnt])
	dw4.object.rcpt_type[ll_cnt] = 'A'
	ll_find = 0
	if li_operation = 1 then
		SELECT count(*) INTO :ll_find FROM sudodet1      //외주구매물품체크
		 WHERE order_no    = :ls_plan  AND sudo_type <> "C";
		if ll_find = 0 then
			ll_row = dw_10.insertrow(0)
			dw_10.object.order_no[ll_row]  = ls_plan
			dw_10.object.item_no[ll_row]   = dw4.object.item_no[ll_cnt]
			dw_10.object.qa[ll_row]        = dw4.object.qa[ll_cnt]
			dw_10.object.wc_no[ll_row]     = dw4.object.wc_no[ll_cnt]
			dw_10.object.plan_qty[ll_row]  = dw4.object.order_qty[ll_cnt]
			dw_10.object.due_date[ll_row]  = dw4.object.napgi_date[ll_cnt]
			dw_10.object.operation[ll_row] = li_operation
			dw_10.object.sale_no[ll_row]   = dw4.object.sale_no[ll_cnt]
			dw_10.object.seq_no[ll_row]    = dw4.object.seq_no[ll_cnt]
			dw_10.object.rem[ll_row]       = dw4.object.rem[ll_cnt]
			dw_10.object.color[ll_row]     = dw4.object.item_color[ll_cnt]
			dw_10.object.area_no[ll_row]   = dw_1.object.area_no[1]
		end if			
	else
		SELECT count(*) INTO :ll_find FROM sudodet      //외주가공물품체크
		 WHERE order_no    = :ls_plan  AND sudo_type <> "C";
		if ll_find = 0 then
			ll_row = dw_9.insertrow(0)
			dw_9.object.order_no[ll_row]   = ls_plan
			dw_9.object.item_no[ll_row]    = dw4.object.item_no[ll_cnt]
			dw_9.object.qa[ll_row]         = dw4.object.qa[ll_cnt]
			dw_9.object.wc_no[ll_row]      = dw4.object.wc_no[ll_cnt]
			dw_9.object.plan_qty[ll_row]   = dw4.object.order_qty[ll_cnt]
			dw_9.object.due_date[ll_row]   = dw4.object.napgi_date[ll_cnt]
			dw_9.object.rem[ll_row]        = dw4.object.rem[ll_cnt]
			dw_9.object.area_no[ll_row]    = dw_1.object.area_no[1]
			
			ls_sale = trim(dw4.object.sale_no[ll_cnt])
			li_seq  = dw4.object.seq_no[ll_cnt]
			li_op   = li_operation - 1
//			select assy_item, assy_qa, plan_qty into :ls_assy, :ls_assyqa, :lr_planqty
			SELECT assy_item, assy_qa INTO :ls_assy, :ls_assyqa
			  FROM routtempnew
			 WHERE operation = :li_op  AND sale_no = :ls_sale AND seq_no = :li_seq;		
			choose case sqlca.sqlcode
				case 100
					SELECT distinct assembly, assy_qa INTO :ls_assy,:ls_assyqa
					  FROM saledet, rout
					 WHERE saledet.order_no = :ls_sale
						AND saledet.seq_no   = :li_seq
						AND rout.item_no     = saledet.item_no
						AND substring(rout.qa, 1, 13) = substring(saledet.qa,1,13)
						AND operation        = :li_op;
					ls_assyqa = LeftA(ls_assyqa,13) + MidA(dw4.object.qa[ll_cnt], 14, 6)
//					lr_planqty  = dw4.object.order_qty[ll_cnt]

				case 0
					
				case else
					 messagebox('오류1','수행중 오류가 발생하였습니다.',exclamation!)
					 rollback;
					 return false
			end choose
			dw_9.object.component[ll_row]    = ls_assy
			dw_9.object.component_qa[ll_row] = ls_assyqa
//			dw_9.object.issue_qty[ll_row]    = lr_planqty
			dw_9.object.issue_qty[ll_row]    = dw4.object.order_qty[ll_cnt]
			
			SELECT uom INTO :ls_uom FROM groupitem	WHERE item_no = :ls_assy;
			
			dw_9.object.comp_uom[ll_row]     = ls_uom	
			dw_9.object.issue_date[ll_row]   = wf_today()
			dw_9.object.operation[ll_row]    = li_operation
			dw_9.object.sale_no[ll_row]      = dw4.object.sale_no[ll_cnt]
			dw_9.object.seq_no[ll_row]       = dw4.object.seq_no[ll_cnt]
			dw_9.object.rem[ll_row]          = dw4.object.rem[ll_cnt]
			dw_9.object.color[ll_row]        = dw4.object.item_color[ll_cnt]
		end if			
	end if
next

RETURN wf_update3(dw4,dw_9,dw_10,"N")

end function

public function boolean wf_saledetupdate ();int    li_seq, li_division, li_operation
real   lr_orderqty, lr_sumtime, lr_qty, lr_solqty, lr_planqty, lr_rlseqty, lr_diffqty
string ls_sale,  ls_plan,ls_item, ls_qa, ls_chk
long   ll_div,ll_mod, ll_row, i
date   ld_date
time   lt_time
datetime ldt_datetime

dw_1.accepttext()
dw4.accepttext()

ld_date = date(dw_1.object.start_date[1])		// 생산시작일

ll_row  = dw4.rowcount()
for i = 1 to ll_row 
	ls_sale = trim(dw4.object.sale_no[i])
	if MidA(ls_sale,2,2) = 'NO' then continue
	 
	UPDATE sale 
	   SET plan_date = :ld_date
	 WHERE order_no = :ls_sale AND (plan_date is null OR plan_date < :ld_date);
	if sqlca.sqldbcode <> 0 then
		MessageBox('오류0',"sale UPDATE중 " + STRING(i) + " 번째줄에서 오류가 발생하였습니다.~r~n" + SQLCA.sqlerrtext,exclamation!)
		rollback;
		return false
	end if	
	 
	ls_plan      = trim(dw4.object.plan_no[i])
	ls_item      = trim(dw4.object.item_no[i])
	ls_qa        = trim(dw4.object.qa[i])
	li_seq       = dw4.object.seq_no[i]
	li_division  = dw4.object.division[i]
	li_operation = dw4.object.operation[i]
	lr_orderqty  = dw4.object.order_qty[i]

	lr_sumtime   = dw4.object.aaa[i]
	ll_div       = long(lr_sumtime / 510)
	ll_mod       = long(mod(lr_sumtime,510)) * 60

	ld_date      = RelativeDate(ld_date, ll_div)
	lt_time      = RelativeTime(08:30:00, ll_mod)
	ldt_datetime = datetime(ld_date,lt_time)

	if li_operation = 1 then	
		SELECT order_qty, sol_qty,   plan_qty,   rlse_qty,    saledet_text
		  INTO :lr_qty,  :lr_solqty, :lr_planqty,:lr_rlseqty, :ls_chk
		  FROM saledet
		 WHERE order_no = :ls_sale AND seq_no = :li_seq;
		if sqlca.sqlcode <> 0 then
			MessageBox('오류1',"수주번호 = [" + ls_sale + "] 순번 =[" + STRING(li_seq) + "의 수주내역이 없습니다. 판매부로 연락바랍니다.~r~n" + SQLCA.sqlerrtext,exclamation!)
			rollback;
			return false
		end if
 
      ////////////////////////////////////////////
		// 진행상태 
		////////////////////////////////////////////
		// Y : 가능, N : 불가, E : 완료, P : 진행
      ////////////////////////////////////////////
      // case(saledet_text when 'X' then '가능' when 'N' then '불가' else if(sol_qty > 0, '부분', '생산'))		
		lr_diffqty = lr_qty - (lr_solqty + lr_planqty + lr_rlseqty + lr_orderqty)
		if lr_diffqty <= 0 then
			if ls_chk = 'P' then 
				ls_chk = 'S'
			else
				ls_chk = 'Y'
			end if
		else
			if ls_chk = 'N' then
				ls_chk = 'Q'
			end if
		end if

		UPDATE saledet 
		   SET plan_qty = plan_qty + :lr_orderqty
			  , saledet_text = :ls_chk
			  , plan_close   = :ldt_datetime
		 WHERE order_no = :ls_sale AND seq_no = :li_seq;
		if sqlca.sqldbcode <> 0 then
			MessageBox('오류2',"saledet UPDATE중 " + STRING(i) + " 번째줄에서 오류가 발생하였습니다.~r~n" + SQLCA.sqlerrtext,exclamation!)
			rollback;
			return false
		end if	
	else
		UPDATE saledet 
		   SET plan_close = :ldt_datetime
		 WHERE order_no = :ls_sale AND seq_no = :li_seq;
		if sqlca.sqldbcode <> 0 then
			MessageBox('오류5',"saledet UPDATE중 " + STRING(i) + " 번째줄에서 오류가 발생하였습니다.~r~n" + SQLCA.sqlerrtext,exclamation!)
			rollback;
			return false
		end if	
	end if
next

return true

end function

public subroutine wf_area (string as_area);string ls_name

SELECT REPLACE(area_name,'사업장','') INTO :ls_name 
  FROM area
 WHERE area_no = :as_area;

//st_title.text = ls_name + " " + '생산계획 조정'

end subroutine

public function boolean wf_itemselect (datawindow arg_dw, string arg_ms, integer ai_row);gs_where2 lstr_where
long ll_row, ll_cnt, ll_row1
int li_seq

arg_dw.accepttext()

lstr_where.chk = arg_ms //'M' //M:multi S:single
//lstr_where.chk1 = dw_2.object.loc_no[1]
ll_row1 = arg_dw.rowcount() + 1
if arg_ms = 'S' then
	lstr_where.str1[1] = arg_dw.object.assy_item[ai_row]
	lstr_where.str2[1] = arg_dw.object.assy_qa[ai_row]
end if
openwithparm(w_whitemlocqohmulti_w,lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return false

arg_dw.SETREDRAW(FALSE)
li_seq = 0
for ll_row = 1 to UpperBound(lstr_where.str1)	
	if arg_ms = 'M' then
		ll_cnt = arg_dw.insertrow(0)
		is_sale = LeftA(is_area, 1) + 'NO' + string(dw_1.object.start_date[1],'yyyymmdd')
		if ii_seq = 0 or isnull(ii_seq) then
			select max(seq_no) into :ii_seq from routtempnew where sale_no = :is_sale;
			if isnull(ii_seq) then ii_seq = 0 
		end if
		li_seq = ii_seq + ll_row
		
		arg_dw.object.sale_no[ll_cnt] = is_sale
		arg_dw.object.seq_no[ll_cnt]  = li_seq
		arg_dw.object.wc_no[ll_cnt]  = dw7.object.wc_no[1]
		arg_dw.object.routtempnew_area_no[ll_cnt]  = is_area
		arg_dw.object.suju_type[ll_cnt]  = "N" 
		arg_dw.object.work_date[ll_cnt] = wf_today()
		arg_dw.object.napgi_date[ll_cnt] = wf_today()
	else
		ll_row1 = ai_row
		ll_cnt = ai_row
	end if
	arg_dw.object.assy_item[ll_cnt] = lstr_where.str1[ll_row]
	arg_dw.object.assy_qa[ll_cnt] = lstr_where.str2[ll_row]
	arg_dw.object.uom[ll_cnt] = lstr_where.str3[ll_row]
	arg_dw.object.groupitem_item_name[ll_cnt] = lstr_where.name[ll_row]
next
ii_seq = li_seq
arg_dw.accepttext()
arg_dw.scrolltorow(ll_row1)
arg_dw.SETREDRAW(TRUE)
return true
end function

on w_mpplan_m.create
int iCurrent
call super::create
this.dw_9=create dw_9
this.dw_10=create dw_10
this.tab_1=create tab_1
this.cbx_1=create cbx_1
this.dw_area=create dw_area
this.pb_file=create pb_file
this.cb_10=create cb_10
this.cb_13=create cb_13
this.cb_4=create cb_4
this.gb_15=create gb_15
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_9
this.Control[iCurrent+2]=this.dw_10
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.pb_file
this.Control[iCurrent+7]=this.cb_10
this.Control[iCurrent+8]=this.cb_13
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.gb_15
end on

on w_mpplan_m.destroy
call super::destroy
destroy(this.dw_9)
destroy(this.dw_10)
destroy(this.tab_1)
destroy(this.cbx_1)
destroy(this.dw_area)
destroy(this.pb_file)
destroy(this.cb_10)
destroy(this.cb_13)
destroy(this.cb_4)
destroy(this.gb_15)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_name

pb_retrieve.visible = false

dw_area.settransobject(sqlca)
dw_area.insertrow(0)
dw_area.object.area[1] = gs_area
is_area = dw_area.object.area[1]
wf_area(is_area)

if GF_PERMISSION('생산계획조정', gs_userid) = "Y" then
	tab_1.tabpage_4.cb_1.enabled = true
	tab_1.tabpage_4.cb_2.enabled = true
	tab_1.tabpage_4.pb_1.enabled = true
	tab_1.tabpage_4.pb_2.enabled = true
	tab_1.tabpage_4.pb_3.enabled = true
	tab_1.tabpage_3.pb_4.enabled = true
	tab_1.tabpage_3.pb_5.enabled = true
	pb_print_part.enabled = true
	pb_insert.enabled = true
	is_acc = 'Y'
else
	tab_1.tabpage_4.cb_1.enabled = false
	tab_1.tabpage_4.cb_2.enabled = false
	tab_1.tabpage_4.pb_1.enabled = false
	tab_1.tabpage_4.pb_2.enabled = false
	tab_1.tabpage_4.pb_3.enabled = false
	tab_1.tabpage_3.pb_4.enabled = false
	tab_1.tabpage_3.pb_5.enabled = false
	pb_print_part.enabled = false
	pb_insert.enabled = false
	is_acc = 'N'
end if

datawindowchild ldwc_wc
string ls_select, ls_clause, ls_where

dw4 = tab_1.tabpage_3.dw_4
dw6 = tab_1.tabpage_4.dw_6
dw7 = tab_1.tabpage_4.dw_7
dw4.settransobject(sqlca)
dw7.settransobject(sqlca)
dw6.settransobject(sqlca)

is_select = dw6.Describe("DataWindow.Table.Select")
// 시화 // 2004/08/12 부로 Y , N 로 통합
ls_clause = " and routtempnew.plan_flag = ~~'N~~'" &
			 + " and routtempnew.area_no = ~~'" + is_area + "~~'" 
ls_where  = "DataWindow.Table.Select='"  + is_select + ls_clause + "'"
dw6.Modify(ls_where)
dw6.settransobject(sqlca)

dw_9.settransobject(sqlca)
dw_10.settransobject(sqlca)

dw_2.visible = false
dw_9.visible = false
dw_10.visible = false

dw7.insertrow(0)
dw7.getchild('wc_no',ldwc_wc)
ldwc_wc.insertrow(1)
ldwc_wc.setitem(1,'work_no',' ')
ldwc_wc.setitem(1,'work_name','전체')
ldwc_wc.accepttext()


dw6.getchild("assy_item", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw6.getchild("assy_qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

/////////////////////////////////////
pb_insert.triggerevent(clicked!)
/////////////////////////////////////

is_sale = LeftA(gs_area, 1) + 'NO' + string(today(),'yyyymmdd')
SELECT max(seq_no) INTO :ii_seq FROM routtempnew WHERE sale_no = :is_sale;
if isnull(ii_seq) then ii_seq = 0 

/////////////////////////////////////
pb_save.postevent(clicked!)
/////////////////////////////////////

end event

event resize;call super::resize;this.hide()
tab_1.width  = this.width  - 73
tab_1.height = this.height - 296

tab_1.tabpage_3.dw_4.width  = this.width  - 119
tab_1.tabpage_3.dw_4.height = this.height - 604

tab_1.tabpage_4.dw_6.width  = this.width  - 124
tab_1.tabpage_4.dw_6.height = this.height - 532

end event

type pb_save from w_inheritance`pb_save within w_mpplan_m
integer x = 3090
integer y = 36
integer width = 320
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주내역 재조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_save::clicked;string ls_colx, ls_clause,ls_where

//tab_1.setredraw(false)
//dw6.setredraw(false)
ls_clause = " and routtempnew.plan_flag = ~~'N~~'" &
			 +	" and routtempnew.area_no = ~~'" + is_area + "~~'" 
ls_where  = "DataWindow.Table.Select='"  + is_select + ls_clause + "'"
dw6.Modify(ls_where)
dw6.settransobject(sqlca)

if tab_1.tabpage_4.cbx_2.checked = false then
	dw6.object.pri.width = 0
end if

//////////////////////////////
ii_wid = 0
tab_1.selecttab(2)
//////////////////////////////

dw6.Modify("DataWindow.Trailer.1.Height=0")

if dw6.retrieve() > 0 then
	ls_colx = dw6.object.work_date.x
	//dw6.object.datawindow.horizontalscrollsplit= ls_colx
end if
//dw6.setredraw(true)
//tab_1.setredraw(true)


////////////////////////////////////////////////////
// 분할 작업 취소한 경우
////////////////////////////////////////////////////
tab_1.tabpage_4.cb_1.enabled = true	// 생산계획
tab_1.tabpage_4.pb_7.enabled = true // 다중추가
////////////////////////////////////////////////////


// 조회시간 설정 'yyyy-mm-dd hh:mi:ss.mmm'
SELECT TOP 1 convert(char(19), getdate(), 121) INTO :is_time FROM LOGIN; 

end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_mpplan_m
integer x = 1001
integer y = 200
integer width = 2853
integer height = 76
string dataobject = "d_mpsale1_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;string  ls_date,ls_wc,ls_order,ls_temp,ls_like
integer li_temp

this.accepttext()
choose case dwo.name
	case "start_date"		// 생산시작일
		ls_date  = string(this.object.start_date[1],'yyyymmdd')
		ls_wc    = trim(this.object.wc_no[1])
		ls_order = LeftA(is_area, 1) + ls_wc + MidA(ls_date,4,5)
		ls_like  = LeftA(is_area, 1) + ls_wc + MidA(ls_date,4,5) + '%'
		SELECT max(order_no) INTO :ls_temp FROM mps WHERE order_no LIKE :ls_like;
		if isnull(ls_temp) then 
			ls_order = ls_order + '01'
		   this.object.order_no[1] = ls_order
		else
			li_temp  = integer(MidA(ls_temp,10,2)) + 1
			ls_temp  = RightA('000' + string(li_temp),2)
			ls_order = ls_order + ls_temp
			this.object.order_no[1] = ls_order
		end if
		ii_seq = 0
		 
	case "wc_no"		// 작업장
		ls_date  = string(this.object.start_date[1],'yyyymmdd')
		ls_wc    = trim(this.object.wc_no[1])
		ls_order = LeftA(is_area, 1) + ls_wc + MidA(ls_date,4,5)
		ls_like  = LeftA(is_area, 1) + ls_wc + MidA(ls_date,4,5) + '%'
		SELECT max(order_no) INTO :ls_temp FROM mps WHERE order_no LIKE :ls_like;
		if isnull(ls_temp) then 
			ls_order = ls_order + '01'
		   this.object.order_no[1] = ls_order
		else
			li_temp  = integer(MidA(ls_temp,10,2)) + 1
			ls_temp  = RightA('000' + string(li_temp),2)
			ls_order = ls_order + ls_temp
			this.object.order_no[1] = ls_order
		end if	 

		// 자동선택
		dw7.object.wc_no[1] = ls_wc
		dw7.accepttext()
		dw7.TriggerEvent( itemchanged! )
		 
		dw7.setcolumn("wc_no")
		dw7.setfocus()
end choose

end event

event dw_1::rbuttondown;call super::rbuttondown;string ls_date,ls_wc,ls_order,ls_temp,ls_like
integer li_temp

CHOOSE CASE dwo.name
	CASE "start_date"		// 생산시작일
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.start_date[row] = datetime(date(message.stringparm))
		end if
		
		this.accepttext()
		ls_date  = string(this.object.start_date[1],'yyyymmdd')
		ls_wc    = trim(this.object.wc_no[1])
		ls_order = LeftA(is_area, 1) + ls_wc + MidA(ls_date,4,5)
		ls_like  = LeftA(is_area, 1) + ls_wc + MidA(ls_date,4,5) + '%'
		SELECT max(order_no) INTO :ls_temp FROM mps WHERE order_no LIKE :ls_like;
		if isnull(ls_temp) then 
			ls_order = ls_order + '01'
			this.object.order_no[1] = ls_order
		else
			li_temp  = integer(MidA(ls_temp,10,2)) + 1
			ls_temp  = RightA('000' + string(li_temp),2)
			ls_order = ls_order + ls_temp
			this.object.order_no[1] = ls_order
		 end if
		 ii_seq = 0
END CHOOSE
this.accepttext()

end event

event dw_1::losefocus;call super::losefocus;//
this.accepttext()

end event

type dw_2 from w_inheritance`dw_2 within w_mpplan_m
integer x = 599
integer y = 4
integer width = 87
integer height = 64
integer taborder = 60
string dragicon = "Rectangle!"
string dataobject = "d_mpplansale_r"
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_mpplan_m
integer x = 14
integer y = 32
integer width = 951
integer height = 116
string text = "생산계획 조정"
end type

type st_tips from w_inheritance`st_tips within w_mpplan_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpplan_m
integer x = 2848
integer y = 36
integer width = 238
integer taborder = 120
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품별 소계"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::mousemove;//
end event

event pb_compute::clicked;string ls_wc, ls_sort, ls_group, ls_column1, ls_column2, ls_err
int    li_rc

ls_wc = tab_1.tabpage_4.dw_7.object.wc_no[1]
if isnull(ls_wc) or trim(ls_wc) = "" then return

//dw6.setredraw(false)
dw6.Modify("DataWindow.Trailer.1.Height=64")
if ls_wc = 'F19' or ls_wc = 'F20' or ls_wc = 'F21' then // AL
	ls_sort = "item_no, qa, wc_no"	
else
	ls_sort = "qa, item_no, wc_no"	
end if

dw6.SetSort(ls_sort)
li_rc = dw6.Sort()
if li_rc = 1 then
	li_rc = dw6.GroupCalc()
	if li_rc = 1 then
	else
		MessageBox("확인", "물품별 소계 계산중 오류가 발생 했습니다.[" + ls_sort + "]")
	end if
else
	MessageBox("확인", "물품별 소계 정렬중 오류가 발생 했습니다.[" + ls_sort + "]")
end if
//dw6.setredraw(true)

end event

type pb_print_part from w_inheritance`pb_print_part within w_mpplan_m
integer x = 2295
integer y = 40
integer width = 165
integer height = 132
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "마감"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::clicked;if cbx_1.checked = FALSE then RETURN

LONG ll_cnt

if messagebox("마감","선택하신 자료를 마감 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
	return
end if

dw6.setredraw(false)
for ll_cnt = 1 to dw6.rowcount()
	if dw6.isselected(ll_cnt) then
		dw6.object.process_flag[ll_cnt] = 'C'
	end if
next

dw6.accepttext()
if wf_update1(dw6,'Y') = true then
	pb_save.triggerevent(clicked!)
	cbx_1.backcolor = rgb(192,192,192)
	cbx_1.checked   = false
end if
dw6.setredraw(true)

end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_mpplan_m
integer x = 4416
integer y = 36
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpplan_m
integer x = 3415
integer y = 36
integer width = 389
integer taborder = 150
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업지시서 발행"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print::clicked;//string ls_sql, ls_where
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================

if dw_1.rowcount() < 1 then return

string ls_wcno

ls_wcno  = trim(dw_1.object.wc_no[1])
if isnull(ls_wcno) or ls_wcno = "" then
	MessageBox("확인","작업장을 선택 하세요.",exclamation!)
	dw_1.setcolumn("wc_no")
	dw_1.setfocus()
	return
end if

// 작업지시서 발행
if IsValid(w_m_main) then 
	OpenSheet(w_mpsfcrel_m,  w_m_main,   5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_mpsfcrel_m,  w_all_main, 5, original!)
end if

w_mpsfcrel_m.dw_2.object.wc_no[1] = ls_wcno
w_mpsfcrel_m.is_wcno              = ls_wcno
w_mpsfcrel_m.em_1.text            = string(dw_1.object.start_date[1],"yyyy/mm/dd")
w_mpsfcrel_m.pb_retrieve.postevent(clicked!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpplan_m
boolean visible = false
integer x = 1093
integer y = 4
integer taborder = 160
boolean enabled = false
string picturename = "c:\bmp\pen.bmp"
end type

type pb_delete from w_inheritance`pb_delete within w_mpplan_m
boolean visible = false
integer x = 2848
integer y = 40
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_mpplan_m
integer x = 4005
integer y = 36
integer taborder = 190
end type

event pb_insert::clicked;//
dw4.reset()
dw_1.reset()

dw_1.insertrow(1)
dw_1.object.start_date[1] = wf_today()
dw_1.object.order_date[1] = wf_today()
dw_1.object.work_time[1]  = 480
dw_1.object.planner[1]    = gs_userid
dw_1.object.area_no[1]    = is_area

dw_1.object.wc_no.protect = false
dw_1.object.start_date.protect = false

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpplan_m
integer x = 3813
integer y = 36
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_where lstr_name
string ls_where, ls_wc, ls_colx
date   ld_date, ld_date1, ld_date2

lstr_name.chk = 'N'
lstr_name.name = 'w_mpmodify1_m'
openwithparm(w_whplanno_w,lstr_name)
lstr_name = Message.PowerObjectParm	

if lstr_name.chk = 'Y' then
   dw_1.retrieve(lstr_name.str1)
	dw4.retrieve(lstr_name.str1)
	ls_colx = dw4.object.qa.x
	dw4.object.datawindow.horizontalscrollsplit= ls_colx
else
	return
end if
end event

type gb_3 from w_inheritance`gb_3 within w_mpplan_m
boolean visible = false
integer x = 1513
integer y = 24
integer width = 105
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpplan_m
integer x = 2034
integer y = 0
integer width = 457
integer height = 188
integer taborder = 100
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpplan_m
integer x = 2501
integer y = 0
integer width = 2135
integer height = 192
end type

type dw_9 from datawindow within w_mpplan_m
integer x = 690
integer y = 4
integer width = 87
integer height = 64
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_iosudodet_m"
boolean livescroll = true
end type

type dw_10 from datawindow within w_mpplan_m
integer x = 786
integer y = 4
integer width = 87
integer height = 64
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_mpsudo1_m"
boolean livescroll = true
end type

type tab_1 from tab within w_mpplan_m
integer x = 18
integer y = 184
integer width = 4622
integer height = 2572
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

event clicked;if index = 2 or tab_1.SelectedTab = 2  then
	pb_file.enabled = true
else
	pb_file.enabled = false
end if

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4585
integer height = 2444
long backcolor = 79741120
string text = "생산계획"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Continue!"
long picturemaskcolor = 553648127
cbx_confirm cbx_confirm
st_wctype st_wctype
dw_4 dw_4
pb_4 pb_4
pb_5 pb_5
end type

on tabpage_3.create
this.cbx_confirm=create cbx_confirm
this.st_wctype=create st_wctype
this.dw_4=create dw_4
this.pb_4=create pb_4
this.pb_5=create pb_5
this.Control[]={this.cbx_confirm,&
this.st_wctype,&
this.dw_4,&
this.pb_4,&
this.pb_5}
end on

on tabpage_3.destroy
destroy(this.cbx_confirm)
destroy(this.st_wctype)
destroy(this.dw_4)
destroy(this.pb_4)
destroy(this.pb_5)
end on

type cbx_confirm from checkbox within tabpage_3
integer x = 2967
integer y = 24
integer width = 832
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "생산계획확정 자동처리"
boolean checked = true
end type

type st_wctype from statictext within tabpage_3
integer x = 23
integer y = 32
integer width = 1230
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "사내 작업장은 생산계획 자동확정 처리됨"
boolean focusrectangle = false
end type

type dw_4 from datawindow within tabpage_3
event clicked pbm_dwnlbuttonclk
event dragdrop pbm_dwndragdrop
integer y = 104
integer width = 4576
integer height = 2264
integer taborder = 60
string dragicon = "Rectangle!"
boolean bringtotop = true
string dataobject = "d_mpsaledet3_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_4 from picturebutton within tabpage_3
integer x = 3813
integer width = 169
integer height = 104
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
end type

event clicked;//
dw_4.deleterow(0)


end event

type pb_5 from picturebutton within tabpage_3
event ue_2 pbm_custom02
integer x = 3991
integer width = 169
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\save.bmp"
end type

event ue_2;string ls_wc, ls_type

ls_wc = trim(dw_1.object.wc_no[1])
SELECT work_type INTO :ls_type FROM wc WHERE work_no = :ls_wc;
if ls_type = "S" then
//	if MessageBox("성공", "생산계획이 확정되었습니다. ~r~n" &
//					+ "확정된 생산계획의 외주청구를 등록하시겠습니까 ?",Exclamation!, OKCancel!, 1) = 1 then
		if wf_mpouter() = true then
			MessageBox("확인","외주대상물품이 이동 되었습니다.",information!)
		else
			MessageBox("오류","외주청구시 오류가 발생되었습니다.~r~n외주청구등록에서 처리 하십시요",information!)
		end if
//	end if
else
	MessageBox("성공","생산계획이 확정되었습니다.",exclamation!)
end if

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_order, ls_sale, ls_item, ls_qa, ls_wc
real    lr_orderqty, lr_qty, lr_mpsqty, lr_useqty, lr_diffqty
long    ll_row, i, ll_cnt
integer li_seq, li_division, li_op
dwItemStatus l_status

dw_1.accepttext()
dw4.accepttext()

if wf_modifycount(dw4) < 1 then return

ll_row = dw4.rowcount()
for i = 1 to ll_row
	 lr_orderqty = dw4.object.order_qty[i]
	 if lr_orderqty <= 0 then
		MessageBox("확인", "계획상세의 " +  string( i ) + " 번째 수량이 0 이거나 0 보다작습니다 ")
		return
	 end if
next

ls_order = trim(dw_1.object.order_no[1])
ls_wc    = trim(dw_1.object.wc_no[1])
ll_row   = dw4.deletedcount()
for i = 1 to ll_row
	 ls_sale     = trim(dw4.GetItemstring(i,"sale_no", Delete!, TRUE))
	 li_seq      = dw4.GetItemnumber(i,"seq_no", Delete!, TRUE)
    ls_item     = trim(dw4.GetItemstring(i,"item_no", Delete!, TRUE))
    ls_qa       = trim(dw4.GetItemstring(i,"qa", Delete!, TRUE))
	 lr_orderqty = dw4.GetItemnumber(i,"order_qty", Delete!, TRUE)
	 li_division = dw4.GetItemnumber(i,"division", Delete!, TRUE)
	 li_op       = dw4.GetItemnumber(i,"operation", Delete!, TRUE)
	 
    UPDATE routtempnew 
	    SET plan_flag = 'N' 
	  WHERE operation = :li_op 	    AND wc_no     = :ls_wc 
	    AND sale_no   = :ls_sale 	    AND seq_no    = :li_seq 
	    AND assy_item = :ls_item 	    AND assy_qa   = :ls_qa 
	    AND division  = :li_division;
	 if sqlca.sqlcode < 0 then
		 rollback;
		 MessageBox("오류",sqlca.sqlerrtext,exclamation!)
		 return
	 end if	 
	 li_op ++
		
    UPDATE routtempnew 
	    SET process_flag = 'N'  
	  WHERE operation = :li_op 	    AND sale_no   = :ls_sale 	    AND seq_no    = :li_seq
	    AND assy_item = :ls_item 	    AND assy_qa   = :ls_qa 
	    AND division  = :li_division  AND process_flag <> "E";
	 if sqlca.sqlcode < 0 then
		 rollback;
		 MessageBox("오류",sqlca.sqlerrtext,exclamation!)
		 return
	 end if	 
next

ll_row = dw4.rowcount()
for i = 1 to ll_row
	l_status    = dw4.GetItemStatus(i, 0, Primary!)
	ls_sale     = trim(dw4.object.sale_no[i])
	li_seq      = dw4.object.seq_no[i]
	ls_item     = trim(dw4.object.item_no[i])
	ls_qa       = trim(dw4.object.qa[i])
	li_division = dw4.object.division[i]
	lr_orderqty = (dw4.object.order_qty[i])
	li_op       = dw4.object.operation[i]
	 
	dw4.object.plan_no[i]  = ls_order + '-' + RightA('000' + string(i),3)
	dw4.object.order_no[i] = ls_order
	if l_status = newmodified! then	
		UPDATE routtempnew 
			SET plan_flag = 'Y' 
		 WHERE operation = :li_op 	 			AND wc_no     = :ls_wc 
			AND sale_no   = :ls_sale 		   AND seq_no    = :li_seq 
			AND assy_item = :ls_item 		   AND assy_qa   = :ls_qa 
			AND division  = :li_division;
		if sqlca.sqlcode < 0 then
			rollback;
			MessageBox("오류",sqlca.sqlerrtext,exclamation!)
			return
		end if
		
		li_op ++
		UPDATE routtempnew 
			SET process_flag = 'Y'  
		 WHERE operation = :li_op 			   AND sale_no   = :ls_sale 	AND seq_no    = :li_seq 
			AND assy_item = :ls_item 		   AND assy_qa   = :ls_qa 
			AND division  = :li_division	   AND process_flag <> "E";
		if sqlca.sqlcode <> 0 then
			rollback;
			MessageBox("오류",sqlca.sqlerrtext,exclamation!)
			return
		end if			
	end if
next

if dw_4.rowcount() < 1 then
	if wf_update1(dw4,"Y") then
		if tab_1.tabpage_4.cbx_2.checked = false then
			dw6.object.pri.width = 0
		end if
		
		ii_wid = 0
		dw6.retrieve()
		
		dw_1.reset()
		dw_1.insertrow(1)
		dw_1.object.wc_no.protect      = false
		dw_1.object.start_date.protect = false		
	end if
else
	// 생산계획을 미리 확정한다.
	dw_1.object.open_close[1] = 'P'
   //	생산계획확정을 자동으로 하기때문에 아래의 4줄을 막고 다음1줄을 추가함
	if wf_saledetupdate() = false then
		rollback;
		MessageBox("오류3", "생산계획저장시 오류가 발생하였습니다.",Exclamation!)
		return
	end if
	
	///////////////////////
	// 생산계획 저장
	///////////////////////
	if wf_update2(dw_1, dw4,"N") then
		ii_seq = 0
	//	if MessageBox("확정", "생산계획 저장완료. 생산계획 확정 하시겠습니까 ?",Exclamation!, OKCancel!, 1) = 1 then
	//		dw_3.retrieve(ls_order)
	//		dw_5.retrieve(ls_order)
	//		pb_compute.triggerevent("ue_save")

	//		생산계획확정을 자동으로 하기때문에 위의 4줄을 막고 다음1줄을 추가함
			this.triggerevent("ue_2")		// 외주대상 물품이동
		
			dw4.reset()
			dw_1.reset()
			dw_1.insertrow(1)
			dw_1.object.wc_no.protect      = false
			dw_1.object.start_date.protect = false		
			
			tab_1.selecttab(2)
	//	end if

		if tab_1.tabpage_4.cbx_2.checked = false then	// 순위고정
			dw6.object.pri.width = 0
		end if
		ii_wid = 0
		dw6.retrieve()
	else
		rollback;
		MessageBox("오류3", "생산계획 저장시 오류가 발생하였습니다.",Exclamation!)
	end if
end if

end event

type tabpage_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4585
integer height = 2444
long backcolor = 79741120
string text = "수주"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Form!"
long picturemaskcolor = 553648127
cb_12 cb_12
cb_11 cb_11
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
ddlb_2 ddlb_2
st_9 st_9
ddlb_col ddlb_col
st_8 st_8
cb_3 cb_3
cbx_2 cbx_2
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
cb_1 cb_1
ddlb_1 ddlb_1
st_1 st_1
cb_2 cb_2
dw_7 dw_7
pb_7 pb_7
dw_6 dw_6
end type

on tabpage_4.create
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.sle_value=create sle_value
this.ddlb_2=create ddlb_2
this.st_9=create st_9
this.ddlb_col=create ddlb_col
this.st_8=create st_8
this.cb_3=create cb_3
this.cbx_2=create cbx_2
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.cb_1=create cb_1
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.cb_2=create cb_2
this.dw_7=create dw_7
this.pb_7=create pb_7
this.dw_6=create dw_6
this.Control[]={this.cb_12,&
this.cb_11,&
this.cb_filteroff,&
this.cb_filteron,&
this.sle_value,&
this.ddlb_2,&
this.st_9,&
this.ddlb_col,&
this.st_8,&
this.cb_3,&
this.cbx_2,&
this.pb_1,&
this.pb_2,&
this.pb_3,&
this.cb_1,&
this.ddlb_1,&
this.st_1,&
this.cb_2,&
this.dw_7,&
this.pb_7,&
this.dw_6}
end on

on tabpage_4.destroy
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.sle_value)
destroy(this.ddlb_2)
destroy(this.st_9)
destroy(this.ddlb_col)
destroy(this.st_8)
destroy(this.cb_3)
destroy(this.cbx_2)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.cb_1)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.dw_7)
destroy(this.pb_7)
destroy(this.dw_6)
end on

type cb_12 from commandbutton within tabpage_4
integer x = 5600
integer y = 12
integer width = 146
integer height = 76
integer taborder = 80
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
String ls_col
choose case trim(ddlb_col.text)
	case "작업장"
		ls_col = "wc_no "
	case "수주물품"
		ls_col = "item_name1 "
	case "규격"
		ls_col = "qa "
	case "예정일자"
		ls_col = "work_date "
	case "납기일자"
		ls_col = "napgi_date "
		
	case "주문량"
		ls_col = "order_qty "
	case "계획량"
		ls_col = "plan_qty "
	case "환산수량"
		ls_col = "obj_24092413 "
	case "출고량"
		ls_col = "dodet_ship_qty "
		
	case "분할"
		ls_col = "division "
	case "색상"
		ls_col = "color_name "
	case "거래처"
		ls_col = "customer_cust_name "
		
	case "현장"
		ls_col = "scene_scene_desc "
	case "진행"
		ls_col = "process_flag "
	case "수주번호"
		ls_col = "sale_no "
	case "순번"
		ls_col = "seq_no "
	case "비고"
		ls_col = "routtempnew_rem "
end choose		

dw6.SetSort(ls_col + "D")
dw6.sort()

end event

type cb_11 from commandbutton within tabpage_4
integer x = 5454
integer y = 12
integer width = 146
integer height = 76
integer taborder = 70
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
String ls_col
choose case trim(ddlb_col.text)
	case "작업장"
		ls_col = "wc_no "
	case "수주물품"
		ls_col = "item_name1 "
	case "규격"
		ls_col = "qa "
	case "예정일자"
		ls_col = "work_date "
	case "납기일자"
		ls_col = "napgi_date "
		
	case "주문량"
		ls_col = "order_qty "
	case "계획량"
		ls_col = "plan_qty "
	case "환산수량"
		ls_col = "obj_24092413 "
	case "출고량"
		ls_col = "dodet_ship_qty "
		
	case "분할"
		ls_col = "division "
	case "색상"
		ls_col = "color_name "
	case "거래처"
		ls_col = "customer_cust_name "
		
	case "현장"
		ls_col = "scene_scene_desc "
	case "진행"
		ls_col = "process_flag "
	case "수주번호"
		ls_col = "sale_no "
	case "순번"
		ls_col = "seq_no "
	case "비고"
		ls_col = "routtempnew_rem "
end choose		

dw6.SetSort(ls_col + "A")
dw6.sort()

end event

type cb_filteroff from commandbutton within tabpage_4
integer x = 5303
integer y = 12
integer width = 146
integer height = 76
integer taborder = 50
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
string ls_wc, ls_where
long   ll_row

ddlb_2.text     = "LIKE"
ddlb_col.text   = "현장명"
sle_value.text  = ""

ls_wc = tab_1.tabpage_4.dw_7.object.wc_no[1]
if isnull(ls_wc) or trim(ls_wc) = "" then
	dw6.setredraw(false)
	dw6.setfilter("")
	dw6.filter()
	
	pb_save.postevent(clicked!)
	dw6.scrolltorow(1)
	dw6.setredraw(true)	
else	
	ls_wc = trim(ls_wc) + "%"
	if MidA(ls_wc,2,2) = '00' then
		ls_wc = MidA(ls_wc,1,1) + "%"
		ls_where = "wc_no LIKE '" + ls_wc + "'"
	else
		ls_where = "wc_no LIKE '" + ls_wc + "'"
	end if
		
	// dw6.setredraw(false)	// FilteredCount = 0 이면 SetRedraw 에서 오류 남
	dw6.SetFilter(ls_where)
	dw6.Filter()
	//dw6.setredraw(true)
	
	// 작업장별 수주품목이 없으면 물품별소계 기능 DISABLE
	ll_row = dw6.FilteredCount()
	ll_row = dw6.RowCount()
	if ll_row > 0 then
		pb_compute.enabled = true
	else
		pb_compute.enabled = false
	end if
end if

end event

type cb_filteron from commandbutton within tabpage_4
integer x = 5152
integer y = 12
integer width = 146
integer height = 76
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw6.FilteredCount() > 0 THEN
	dw6.setfilter(ls_temp)
	dw6.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "작업장"
			ls_col = "wc_no "
		case "수주물품"
			ls_col = "item_name1 "
		case "규격"
			ls_col = "qa "
		case "예정일자"
			ls_col = "work_date "
		case "납기일자"
			ls_col = "napgi_date "
			
		case "주문량"
			ls_col = "order_qty "
		case "계획량"
			ls_col = "plan_qty "
		case "환산수량"
			ls_col = "obj_24092413 "
		case "출고량"
			ls_col = "dodet_ship_qty "
			
		case "분할"
			ls_col = "division "
		case "색상"
			ls_col = "color_name "
		case "거래처"
			ls_col = "customer_cust_name "
			
		case "현장"
			ls_col = "scene_scene_desc "
		case "진행"
			ls_col = "process_flag "
		case "순위"
			ls_col = "operation "
		case "수주번호"
			ls_col = "sale_no "
		case "순번"
			ls_col = "seq_no "
		case "비고"
			ls_col = "routtempnew_rem "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "work_date ", "napgi_date "
				ls_column = ls_col + trim(ddlb_2.text) + "datetime('" + trim(sle_value.text) + "') "
			case "order_qty ", "plan_qty ", "obj_24092413 ", "dodet_ship_qty ", "division ", "operation ", "seq_no "
				ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
		end choose 
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

// 작업장 체크
string ls_wcno
ls_wcno = trim(tab_1.tabpage_4.dw_7.object.wc_no[1])
if isnull(ls_wcno) or ls_wcno = "" then
else
	if RightA(ls_wcno,2) = "00" then
		ls_wcno = LeftA(ls_wcno,1)
		ls_temp = "( wc_no LIKE '" + ls_wcno + "') AND " + ls_temp
	else
		ls_temp = "( wc_no    = '" + ls_wcno + "') AND " + ls_temp
	end if
end if

dw6.setfilter(ls_temp)
dw6.filter()

dw6.scrolltorow(1)
//dw6.triggerevent(rowfocuschanged!)

end event

type sle_value from singlelineedit within tabpage_4
integer x = 4640
integer y = 12
integer width = 498
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_2 from dropdownlistbox within tabpage_4
integer x = 4347
integer y = 8
integer width = 279
integer height = 512
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
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

type st_9 from statictext within tabpage_4
integer x = 4197
integer y = 28
integer width = 151
integer height = 56
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_col from dropdownlistbox within tabpage_4
integer x = 3781
integer y = 8
integer width = 402
integer height = 532
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"작업장","수주물품","규격","예정일자","납기일자","주문량","계획량","환산수량","출고량","분할","색상","거래처","현장","진행","수주번호","비고"}
end type

type st_8 from statictext within tabpage_4
integer x = 3630
integer y = 28
integer width = 146
integer height = 56
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
string text = "필드: "
boolean focusrectangle = false
end type

type cb_3 from commandbutton within tabpage_4
integer x = 3447
integer width = 142
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "▶"
end type

event clicked;if this.text = '▶' then
	this.text = '◀'
	dw6.object.t_19.visible = true	// 제조물품
	dw6.object.t_20.visible = true	// 제조품명
	dw6.object.t_21.visible = true	// 제조규격
	dw6.object.t_22.visible = true	// 제조단위
	dw6.object.t_23.visible = true	// NO
	
	dw6.object.assy_item.visible = true
	dw6.object.groupitem_item_name.visible = true
	dw6.object.assy_qa.visible   = true
	dw6.object.uom.visible       = true
	dw6.object.compute_2.visible = true
else
	this.text = '▶'
	dw6.object.t_19.visible = true	// 제조물품
	dw6.object.t_20.visible = true	// 제조품명
	dw6.object.t_21.visible = true	// 제조규격
	dw6.object.t_22.visible = true	// 제조단위
	dw6.object.t_23.visible = true	// NO
	
	dw6.object.assy_item.visible = false
	dw6.object.groupitem_item_name.visible = false
	dw6.object.assy_qa.visible   = false
	dw6.object.uom.visible       = false
	dw6.object.compute_2.visible = false
end if
end event

type cbx_2 from checkbox within tabpage_4
integer x = 2217
integer y = 28
integer width = 361
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 134217856
long backcolor = 67108864
string text = "순위고정"
end type

event clicked;dw6.object.pri.width = 105

end event

type pb_1 from picturebutton within tabpage_4
integer x = 2926
integer width = 169
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
end type

event clicked;long   ll_row
string ls_suju

dw6.setredraw(false)
ll_row = dw6.insertrow(0)
dw6.scrolltorow(ll_row)
////////////////////////////////////////////////////
// 2004년 8월 12일 통합 수주생산 : Y 계획생산 : N
// =======================
// |     | 시화 | YSP    |
// =======================
// |수주 |  E   |  Y     | =>  'Y'
// |계획 |  N   |  B     | =>  'N'
// =======================
//if is_area = "B0001" THEN   // 반월
//	ls_suju = "B" 
//else  
	ls_suju = "N" 
//end if
////////////////////////////////////////////////////

is_sale = LeftA(is_area, 1) + "NO" + string(dw_1.object.start_date[1],'yyyymmdd')
if ii_seq = 0 or isnull(ii_seq) then
	SELECT max(seq_no) INTO :ii_seq FROM routtempnew WHERE sale_no = :is_sale;
	if isnull(ii_seq) then ii_seq = 0 
end if

ii_seq ++
dw6.object.sale_no[ll_row]    = is_sale
dw6.object.seq_no[ll_row]     = ii_seq
dw6.object.wc_no[ll_row]      = dw7.object.wc_no[1]
dw6.object.routtempnew_area_no[ll_row]  = is_area
dw6.object.suju_type[ll_row]  = ls_suju
dw6.object.work_date[ll_row]  = wf_today()
dw6.object.napgi_date[ll_row] = wf_today()
dw6.setredraw(true)


end event

type pb_2 from picturebutton within tabpage_4
integer x = 3099
integer width = 169
integer height = 104
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
end type

event clicked;long ll_row

dw6.accepttext()
ll_row = dw6.getrow()
if ll_row < 1 then return

if MidA(trim(dw6.object.sale_no[ll_row]),2,2) = 'NO' &
	or MidA(trim(dw6.object.sale_no[ll_row]),1,2) = 'NO' then
   dw6.deleterow(0)
else
	messagebox('오류','수주에의한 생산계획은 삭제할수 없습니다.',exclamation!)
	return
end if

end event

type pb_3 from picturebutton within tabpage_4
integer x = 3273
integer width = 169
integer height = 104
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\save.bmp"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

////////////////////////////////////////////////////
// 작업순서 : 항목선택 -> 분할 -> 저장 -> 생산계획
////////////////////////////////////////////////////
cb_1.enabled = true		// 생산계획
pb_7.enabled = false 	// 다중추가
////////////////////////////////////////////////////

dw6.accepttext()
if wf_itemchk() = false then return

wf_update1(dw6,"Y")

end event

type cb_1 from commandbutton within tabpage_4
integer x = 1733
integer y = 4
integer width = 306
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "생산계획"
end type

event clicked;long    ll_dw6cnt, ll_dw4cnt, ll_cnt, ll_find, ll_row, ll_count
string  ls_wc,  ls_item, ls_qa, ls_sale, ls_plan, ls_openclose
integer li_seq, li_division


dw6.accepttext()
dw6.setredraw(false)
if ii_wid <> 0 then
	dw_6.SetSort("if (pri = 0 , 999, pri)")
	dw_6.Sort( )
end if

if wf_itemchk() = false then	
	dw6.setredraw(true)
	return
end if

DateTime ld_sdate, ld_edate
ld_sdate = dw_1.object.start_date[1]	// 생산시작일
if isnull(ld_sdate) then
	dw6.setredraw(true)
	MessageBox("오류","생산시작일을 입력 하십시요.",exclamation!)
	return
else
	if MessageBox("확인", "생산시작일 " + string(ld_sdate, "yyyy/mm/dd") + " 맞습니까?",Exclamation!, YesNo!, 1) = 2 then
		return
	end if	
end if


// 수주내역 저장
if wf_update1(dw6,"N") = false then
	dw6.setredraw(true)
	MessageBox("오류","수주내역을 재조회 하십시요.",exclamation!)
	return
end if

dw_1.accepttext()
if dw_1.rowcount() < 1 then
	dw6.setredraw(true)
	MessageBox("오류","생산계획번호를 입력하십시요.",exclamation!)
	return
end if

ls_plan = trim(dw_1.object.order_no[1])
if ls_plan = "" or isnull(ls_plan) then
	dw6.setredraw(true)
	MessageBox("오류","생산계획번호를 입력하십시요.",exclamation!)
	return
end if

dw4.accepttext()
ll_dw6cnt = dw6.rowcount()
ll_dw4cnt = dw4.rowcount()

ll_count = 0
for ll_cnt = dw6.GetSelectedRow(0) to ll_dw6cnt
	if dw6.isselected(ll_cnt) then
		ls_sale = trim(dw6.object.sale_no[ll_cnt])
		if MidA(ls_sale, 2, 2) <> "NO" then
			setnull(ls_openclose)
			SELECT open_close INTO :ls_openclose FROM sale WHERE order_no = :ls_sale;
			if sqlca.sqlcode = 100 or isnull(ls_openclose) then
				dw6.setredraw(true)
				MessageBox("오류","해당수주가 없습니다. 수주내역을 재조회 하십시요")
				return
			else
				if ls_openclose = "C" then
					dw6.setredraw(true)
					MessageBox("확인","해당수주가 이미 마감되었습니다.수주내역을 재조회 하십시요")
					return
				else
				end if
			end if
		end if
			
      ll_count ++
	else
		exit
	end if
next

if ll_count = 0 then
	dw6.setredraw(true)
	MessageBox("오류","임시 생산계획 항목을 선택하십시요.",exclamation!)
	return
end if

for ll_cnt = dw6.GetSelectedRow(0) to ll_dw6cnt
	if dw6.isselected(ll_cnt) = false then
		exit
	else
		ls_sale     = trim(dw6.object.sale_no[ll_cnt])
		ls_wc       = trim(dw6.object.wc_no[ll_cnt])
		li_seq      = dw6.object.seq_no[ll_cnt]
		ls_item     = (dw6.object.assy_item[ll_cnt])
		ls_qa       = (dw6.object.assy_qa[ll_cnt])
		li_division = dw6.object.division[ll_cnt]
		if ll_dw4cnt < 1 then
			ll_find = 0
		else
		   ll_find = dw4.find("wc_no = '" + ls_wc + "' and sale_no = '" + &
			          ls_sale + "' and seq_no = " + string(li_seq) + " and " + &
						"item_no = '" + ls_item + "' and qa = '" + ls_qa + "' and " + &
						"division = " + string(li_division),1,dw4.rowcount())
		end if
		// 중복항목이 없으면
		if ll_find = 0 then
			ll_row = dw4.insertrow(0)
			dw6.object.work_date[ll_cnt]  = dw_1.object.start_date[1]		// 예정일 <- 생산시작일
			
			dw4.object.order_no[ll_row]   = trim(dw_1.object.order_no[1])
			dw4.object.plan_no[ll_row]    = trim(dw_1.object.order_no[1]) + "-" + RightA('000' + string(ll_row),3)
			dw4.object.priority[ll_row]   = dw6.object.pri[ll_cnt]
			dw4.object.napgi_date[ll_row] = datetime(dw6.object.napgi_date[ll_cnt])
			dw4.object.item_no[ll_row]    = dw6.object.assy_item[ll_cnt]
			dw4.object.qa[ll_row]         = dw6.object.assy_qa[ll_cnt]
			dw4.object.wc_no[ll_row]      = dw_1.object.wc_no[1]
         dw4.object.item_item_name[ll_row] = dw6.object.groupitem_item_name[ll_cnt]
			dw4.object.uom[ll_row]        = dw6.object.uom[ll_cnt]
			dw4.object.order_qty[ll_row]  = dw6.object.plan_qty[ll_cnt] 
			dw4.object.division[ll_row]   = dw6.object.division[ll_cnt]
			//- dw6.object.use_qty[ll_cnt]
			dw4.object.cust_no[ll_row]    = dw6.object.cust_no[ll_cnt]
			dw4.object.scene_code[ll_row] = dw6.object.scene_code[ll_cnt]
			dw4.object.suju_type[ll_row]  = dw6.object.suju_type[ll_cnt]
			dw4.object.work_time[ll_row]  = dw6.object.work_time[ll_cnt]
			dw4.object.setup_time[ll_row] = dw6.object.setup_time[ll_cnt]
			dw4.object.item_color[ll_row] = dw6.object.item_color[ll_cnt]
			dw4.object.sale_no[ll_row]    = dw6.object.sale_no[ll_cnt]
			dw4.object.seq_no[ll_row]     = dw6.object.seq_no[ll_cnt]
			dw4.object.work_per[ll_row]   = dw6.object.work_per[ll_cnt]
			dw4.object.operation[ll_row]  = dw6.object.operation[ll_cnt]
			dw4.object.rem[ll_row]        = trim(dw6.object.routtempnew_rem[ll_cnt])
			dw4.object.due_date[ll_row]   = wf_today()
			dw6.object.pri[ll_cnt]        = 0
		end if
	end if
next

// 수주내역 저장
if wf_update1(dw6,"N") then
   dw_1.object.wc_no.protect      = true
   dw_1.object.start_date.protect = true
   dw6.selectrow(0,false)
	
	ii_wid = 0
	dw6.object.pri.width = 0
	dw6.setredraw(true)
	tab_1.selecttab(1)
   MessageBox("확인","생산계획을 작성 하였습니다.",information!)
else
	dw6.setredraw(true)
   MessageBox("오류","생산계획을 작성시 오류가 발생 하였습니다.",information!)
end if

end event

type ddlb_1 from dropdownlistbox within tabpage_4
integer x = 1015
integer y = 12
integer width = 699
integer height = 840
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"순위","-","예정일+ 수주번호","수주번호 + 예정일","수주번호 + 제품코드","-","예정일+색상","색상+예정일","-","예정일+ 제품코드","제품코드+ 예정일","-","작업장","납기일"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;integer li_seq
string ls_sort

li_seq = index

dw_6.setredraw(false)
choose case index
	case 1
		    ls_sort = "if (pri = 0 , 999, pri)"
	case 3
		    ls_sort = "work_date A, sale_no A, seq_no A "
	case 4
		    ls_sort = "sale_no A, seq_no A , work_date A"	
	case 5
		    ls_sort = "sale_no A, item_no A, qa A"	
	case 7
		    ls_sort = "work_date A, item_color A, item_no A, qa A, sale_no A, seq_no A "
	case 8
		    ls_sort = "item_color A, work_date A, item_no A, qa A, sale_no A, seq_no A "
	case 10
		    ls_sort = "work_date A, item_no A, qa A, sale_no A, seq_no A "		
	case 11
		    ls_sort = "item_no A, qa A, work_date A, sale_no A, seq_no A "	
	case 13
		    ls_sort = "wc_no A, sale_no A, seq_no A, work_date A "	
	case 14
			 ls_sort = "napgi_date A, sale_no A, seq_no A, work_date A "	
	case else
		dw_6.setredraw(true)
		return
end choose
dw_6.SetSort(ls_sort)
dw_6.Sort( )
dw_6.groupcalc()
dw_6.setredraw(true)
end event

type st_1 from statictext within tabpage_4
integer x = 864
integer y = 24
integer width = 146
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "정렬"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within tabpage_4
integer x = 2043
integer y = 4
integer width = 160
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "분할"
end type

event clicked;long    ll_dw6cnt, ll_dw4cnt, ll_cnt, ll_find, ll_row, ll_count, ll_time
string  ls_wc,  ls_item, ls_qa, ls_sale, ls_openclose
integer li_seq, li_division

dw4.accepttext()
dw6.accepttext()
if wf_itemchk() = false then return


// 조회시간 설정 'yyyy-mm-dd hh:mi:ss.mmm'
SELECT TOP 1 DATEDIFF(mi, :is_time, getdate() ) INTO :ll_time FROM LOGIN; 

if MessageBox("조회시간",string(ll_time) + " 분 전에 조회한 데이터 : " + is_time + "~n~n 분할작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
	return
end if

////////////////////////////////////////////////////
// 작업순서 : 항목선택 -> 분할 -> 저장 -> 생산계획
////////////////////////////////////////////////////
cb_1.enabled = false		// 생산계획
pb_7.enabled = false 	// 다중추가
////////////////////////////////////////////////////

ll_dw6cnt = dw6.rowcount()
ll_dw4cnt = dw4.rowcount()

ll_count  = 0
for ll_cnt = 1 to ll_dw6cnt
	if dw6.isselected(ll_cnt) then
		ls_sale = trim(dw6.object.sale_no[ll_cnt])
		if MidA(ls_sale, 2, 2) <> "NO" then
			setnull(ls_openclose)
			SELECT open_close INTO :ls_openclose FROM sale WHERE order_no = :ls_sale;
			if sqlca.sqlcode = 100 or isnull(ls_openclose) then
				MessageBox("오류","해당수주가 없습니다. 수주내역을 재조회 하십시요")
				return
			else
				if ls_openclose = "C" then
					MessageBox("확인","해당수주가 이미 마감되었습니다.수주내역을 재조회 하십시요")
					return
				else
				end if
			end if
		end if
		
      ll_count ++
	end if
next

if ll_count = 0 then
	MessageBox('오류','임시 생산계획 항목을 선택하십시요.',exclamation!)
	return
end if

string ls_auto
long   ll_pri, ll_division
double ld_plan_qty, ld_plan_qty_org, ld_order_qty, ld_dodet_ship_qty, ld_result

if MessageBox("분할","분할차수와 계획량을 자동계산 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
	ls_auto = "Y"
end if

for ll_cnt = 1 to ll_dw6cnt
	if dw6.isselected(ll_cnt) then
		ls_wc   = trim(dw6.object.wc_no[ll_cnt])
		ls_sale = trim(dw6.object.sale_no[ll_cnt])
		li_seq  = dw6.object.seq_no[ll_cnt]
		ls_item = (dw6.object.assy_item[ll_cnt])
		ls_qa   = (dw6.object.assy_qa[ll_cnt])

		///////////////////////////////////////////////////////////////////////////////
		ld_order_qty      = dw6.object.order_qty[ll_cnt] 			// 주문량
		ld_plan_qty       = dw6.object.plan_qty[ll_cnt] 			// 계획량
		ld_plan_qty_org   = dw6.object.plan_qty_org[ll_cnt] 		// 계획량_ORG
		ld_dodet_ship_qty = dw6.object.dodet_ship_qty[ll_cnt] 	// 출고량
		ll_division       = dw6.object.division[ll_cnt] 			// 분할차수	
		ld_result         = ld_plan_qty_org - ld_plan_qty        // 계획량_ORG - 입력계획량
		///////////////////////////////////////////////////////////////////////////////
		
      dw6.RowsCopy(ll_cnt,ll_cnt, Primary!, dw6, ll_cnt, Primary!)	// 행 복사
		ll_cnt++		// Index 증가

		if ls_auto = "Y" then
			// 행복사된 곳에 차수증가 및 계획량 계산값 부여하기
			dw6.object.plan_qty[ll_cnt] = ld_result
			dw6.object.division[ll_cnt] = ll_division + 1	// 분할차수 증가
		end if
	
   	ll_dw6cnt++		// 행전체값 증가
	end if
next

dw6.accepttext()
dw6.selectrow(0,false)

MessageBox('확인','생산계획을 분할 하였습니다.',information!)

end event

type dw_7 from datawindow within tabpage_4
integer y = 12
integer width = 855
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_mpwcno_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
// 수주물품에 대한 반제품이 존재하는지 확인 ITEM TABLE
if wf_itemchk() = false then	return

long   ll_row, ll_cnt, li_wid
string ls_where, ls_wc

il_row = 0

dw6.Modify("DataWindow.Trailer.1.Height=0")
dw6.SelectRow(0, false)
if ii_wid <> 0 then
	ii_wid = 0
	if tab_1.tabpage_4.cbx_2.checked = false then
		dw6.object.pri.width = 0
	end if
	
	for ll_cnt = 1 to dw6.rowcount()
		dw6.object.pri[ll_cnt] = 0
	next
end if

this.accepttext()
ls_wc = this.object.wc_no[1] + "%"	// trim(data) + "%"		// 원본

if MidA(ls_wc,2,2) = '00' then
	ls_wc = MidA(ls_wc,1,1) + "%"
   ls_where = "wc_no LIKE '" + ls_wc + "'"
else
	ls_where = "wc_no LIKE '" + ls_wc + "'"
end if

////////////////////////////////////////////////////
// FilteredCount = 0 이면 SetRedraw 에서 오류 남
////////////////////////////////////////////////////
//dw6.setredraw(false)
dw6.SetFilter(ls_where)
dw6.Filter()
//dw6.setredraw(true)
////////////////////////////////////////////////////

// 작업장별 수주품목이 없으면 물품별소계 기능 DISABLE
ll_row = dw6.FilteredCount()
ll_row = dw6.RowCount()
if ll_row > 0 then
	pb_compute.enabled = true
else
	pb_compute.enabled = false
end if

end event

event losefocus;this.accepttext()


end event

type pb_7 from picturebutton within tabpage_4
integer x = 2592
integer y = 4
integer width = 329
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
vtextalign vtextalign = multiline!
end type

event clicked;//if parent.dw_6.getrow() < 1 then return

wf_itemselect(parent.dw_6, 'M',0)

//gs_where lstr_where
//long ll_row
//
//ll_row  = parent.dw_6.getrow()
//
//parent.dw_6.accepttext()
//lstr_where.str1 = parent.dw_6.object.assy_item[ll_row]
//lstr_where.str2 = parent.dw_6.object.assy_qa[ll_row]
//lstr_where.name = parent.dw_6.object.groupitem_item_name[ll_row]
//openwithparm(w_whitemqaall_w,lstr_where)
//lstr_where = Message.PowerObjectParm
//if lstr_where.chk = "Y" then
//	parent.dw_6.SETREDRAW(FALSE)
//	parent.dw_6.object.assy_item[ll_row] = lstr_where.str1
//	parent.dw_6.object.assy_qa[ll_row] = lstr_where.str2
//	parent.dw_6.object.uom[ll_row] = lstr_where.str3
//	parent.dw_6.object.groupitem_item_name[ll_row] = lstr_where.name
//	parent.dw_6.SETREDRAW(TRUE)
//end if
//
end event

type dw_6 from datawindow within tabpage_4
event keydown pbm_dwnkey
integer y = 104
integer width = 4571
integer height = 2336
integer taborder = 70
string dataobject = "d_mpplansale_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "wc_no"
		ls_col  = "작업장"
		ls_text = this.object.wc_no[row]
	case "item_name1"
		ls_col  = "수주물품"
		ls_text = this.object.item_name1[row]
	case "qa"
		ls_col  = "규격"
		ls_text = this.object.qa[row]
	case "work_date"
		ls_col  = "예정일자"
		ls_text = string(this.object.work_date[row])
	case "napgi_date"
		ls_col  = "납기일자"
		ls_text = string(this.object.napgi_date[row])
		
	case "order_qty"
		ls_col  = "주문량"
		ls_text = string(this.object.order_qty[row])
	case "plan_qty"
		ls_col  = "계획량"
		ls_text = string(this.object.plan_qty[row])
	case "obj_24092413"
		ls_col  = "환산수량"
		ls_text = string(this.object.obj_24092413[row])
	case "dodet_ship_qty"
		ls_col  = "출고량"
		ls_text = string(this.object.dodet_ship_qty[row])
		
	case "division"
		ls_col  = "분할"
		ls_text = string(this.object.division[row])
	case "color_name"
		ls_col  = "색상"
		ls_text = this.object.color_name[row]

	case "customer_cust_name"
		ls_col  = "거래처"
		ls_text = this.object.customer_cust_name[row]
	case "scene_scene_desc"
		ls_col  = "현장"
		ls_text = this.object.scene_scene_desc[row]
	case "process_flag"
		ls_col  = "진행"
		ls_text = this.object.process_flag[row]
	case "operation"
		ls_col  = "순위"
		ls_text = string(this.object.operation[row])

	case "sale_no"
		ls_col  = "수주번호"
		ls_text = this.object.sale_no[row]
	case "seq_no"
		ls_col  = "순번"
		ls_text = string(this.object.seq_no[row])
	case "routtempnew_rem"
		ls_col  = "비고"
		ls_text = this.object.routtempnew_rem[row]
end choose

choose case ls_col
	case "주문량", "계획량", "환산수량", "출고량", "분할", "예정일자", "납기일자", "순위", "순번"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text



long   ll_pri, ll_cnt, ll_last_pri, ll_selrow
string ls_wc,ls_wc1,ls_flag, ls_item_no

this.setredraw(false)
this.accepttext()

if dwo.name = 'assy_qa' then
	ls_item_no = this.object.assy_item[row]
	idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
	idwc_qa.filter()
end if

if cbx_1.checked = true then
//   this.SelectRow(row, NOT this.IsSelected(row))
	if keydown(keyshift!)then
		ll_selrow = this.GetSelectedRow(il_row -1)
		if ll_selrow > 0 then
			for ll_cnt = min(ll_selrow,row) + 1 to max(ll_selrow, row)
					ii_wid = ii_wid + 1
					this.SelectRow(ll_cnt,true)
			next
		else
			this.SelectRow(row,true)
		end if
	else
		this.SelectRow(row, NOT this.IsSelected(row))
		if isselected(row) = true then
			ii_wid = ii_wid + 1
		else
			ii_wid = ii_wid - 1
		end if
	end if
	
	this.setredraw(true)
	return
end if

if isnull(this.object.work_date[row]) &
  or isnull(this.object.assy_item[row]) &
  or isnull(this.object.assy_qa[row]) &
  or isnull(this.object.wc_no[row]) &
  or isnull(this.object.plan_qty[row]) or dwo.name = 'assy_qa' then
	this.setredraw(true)
  return
else
	if this.object.plan_qty[row] = 0  then
		this.setredraw(true)
		messagebox("확인","계획수량이 0입니다")
		return
	end if
end if

//this.scrolltorow(row)

//KeyShift!
//if getkeycode() = KeyShift! then
//end if
ls_flag = trim(this.object.process_flag[row])
if ls_flag = 'N' then 
	this.setredraw(true)
	return
end if
	
ls_wc  = trim(dw_1.object.wc_no[1])
ls_wc1 = trim(dw7.object.wc_no[1])
if ls_wc = ls_wc1 then
	if keydown(keyshift!)then
		ll_selrow = this.GetSelectedRow(il_row -1)
		if ll_selrow > 0 then
			for ll_cnt = min(ll_selrow,row) + 1 to max(ll_selrow, row)
					ii_wid = ii_wid + 1
					this.SelectRow(ll_cnt,true)
					this.object.pri[ll_cnt] = ii_wid
			next
		else
			this.SelectRow(row,true)
		end if
		
		if cbx_2.checked = false then		// 순위고정
			if this.object.pri[row] = 1 then
				this.object.pri.width = 105
			end if
		end if
	else
		this.SelectRow(row, NOT this.IsSelected(row))
		if isselected(row) = true then
			ii_wid = ii_wid + 1
			this.object.pri[row] = ii_wid
			if cbx_2.checked = false then
				if this.object.pri[row] = 1 then
					this.object.pri.width = 105
				end if
			end if
		else
			ll_pri = this.object.pri[row]
			ll_last_pri = ll_pri - 1
			ii_wid = ii_wid - 1
			this.object.pri[row] = 0
			for ll_cnt = 1 to this.rowcount()
				if isnull(this.object.pri[ll_cnt]) then continue
				if ll_pri < this.object.pri[ll_cnt] then
					this.object.pri[ll_cnt] = this.object.pri[ll_cnt] - 1
					ll_last_pri = this.object.pri[ll_cnt] 
				end if
			next
			if tab_1.tabpage_4.cbx_2.checked = false then
				if ll_last_pri = 0 then
					this.object.pri.width = 0
				end if
			end if
		end if
	end if
end if

//다중selectrow를 위해 저장
il_row = row
this.setredraw(true)

end event

event itemchanged;string ls_item,ls_qa, ls_uom, ls_data, ls_itemname, ls_colx, ls_area
long ll_row, ll_row1, ll_found

this.accepttext()
ll_row = this.getrow()
ls_item = this.getitemstring(ll_row, "assy_item")
ls_qa = this.getitemstring(ll_row, "assy_qa")
choose case dwo.name
	case 'wc_no'
		select area_no into :ls_area from wc
		 where work_no = :data;
		if ls_area <> this.object.routtempnew_area_no [row] then
			this.object.routtempnew_area_no [row] = ls_area
			messagebox("확인","해당 계획의 사업장도 변경하셨습니다.~r~n저장하면 해당사업장으로 이동됩니다.")
		end if
	case 'assy_item'
		if ii_sw = 1 then
			ii_sw = 0
			parent.pb_7.triggerevent(clicked!)
		end if
		this.object.assy_qa[ll_row] = ''
		this.object.uom[ll_row] = ''
		
		this.getchild("assy_item", idwc_item)
//		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_itemname = idwc_item.getitemstring(idwc_item.getrow(), "item_name")
		ls_uom = idwc_item.getitemstring(idwc_item.getrow(), "uom")
		this.object.groupitem_item_name[this.getrow()] = ls_itemname
		this.object.uom[this.getrow()] = ls_uom
		
		if ls_item <> '' then
			this.getchild("assy_qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item + "'")
			idwc_qa.filter()
			if idwc_qa.rowcount() > 0 then
				this.setcolumn("assy_qa")
				this.setfocus()
			else
				this.setcolumn("assy_item")
				this.setfocus()
			end if
		end if
		///////////////
	case 'assy_qa'
		this.getchild("assy_qa", idwc_qa)
//		gs_ds_qaall.ShareData(idwc_qa)
		
		ls_data = data
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 규격은 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_uom = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom")) //단위
		this.object.uom[ll_row] = ls_uom
		this.setcolumn("plan_qty")
		this.setfocus()
	case 'groupitem_item_name'
		if ii_sw = 1 then
			ii_sw = 0
			parent.pb_7.triggerevent(clicked!)
		end if
		 ls_itemname = trim(this.object.groupitem_item_name[row])
		 ls_qa = trim(this.object.assy_qa[row])
		 select item_no, uom into :ls_item, :ls_uom from item
		  where item_name = :ls_itemname
		    and qa = :ls_qa;
		 if sqlca.sqlcode = 100 then 
			 return 1
		 end if
		 this.object.uom[row] = ls_uom
		 this.object.assy_item[row] = ls_item
end choose

end event

event rbuttondown;//
if is_acc = 'N' then return

long   ll_division,ll_seq,ll_operation
string ls_sale, ls_wc, ls_click
ws_process st_process

int    li_int, li_seq
string ls_login
long   ll_found
string ls_item,ls_itemname

if row < 1 then return
this.scrolltorow(row)

ls_sale = trim(dw6.object.sale_no[row])
st_process.sale_no     = ls_sale
st_process.seq_no      = dw6.object.seq_no[row]

m_manager NewMenu

ls_click = 'N'
NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_mpmodify.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
CHOOSE CASE gs_print_control
	CASE 'rout_D', 'rout_U'
		st_process.division = dw6.object.division[row]
		st_process.operation = dw6.object.operation[row]
		if gs_print_control = 'rout_D' then
			st_process.ud = "D"
		else
			st_process.ud = "U"
		end if
		OpenWithParm(w_mpgong_m, st_process)
		st_process = message.powerobjectparm
		if st_process.ud = "N" then return

		ls_click = 'Y'

	CASE 'DO'
		OpenWithParm(w_whsaledodet_w, st_process)
		return
		
	CASE 'salerout'
		Open(w_mpsalerout_m)
		w_mpsalerout_m.sle_1.text = trim(dw6.object.sale_no[row])
		w_mpsalerout_m.pb_retrieve.postevent(clicked!)

	CASE 'item'
		string ls_olditem, ls_oldqa, ls_oldloc, ls_newitem, ls_newqa, ls_newloc, ls_old_time
		datetime ldt_date
		real   lr_qty
		long   ll_count
		
		gs_where istr_where
		
		istr_where.str1 = ls_sale
		istr_where.str2 = trim(string(this.object.seq_no[row],"###"))
		istr_where.str3 = trim(this.object.assy_item[row])
		istr_where.str4 = trim(this.object.groupitem_item_name[row])
		istr_where.str5 = trim(this.object.assy_qa[row])
		istr_where.name = trim(this.object.customer_cust_name[row])
		
		openwithparm(w_mpjaegoc_m, istr_where)

		istr_where = message.powerobjectparm
		if istr_where.chk = "N" then return

		ls_wc  = dw6.object.wc_no[row]
		li_seq = dw6.object.seq_no[row]
		ll_operation = dw6.object.operation[row]
		ll_division  = dw6.object.division[row]
		delete from routtempnew 
		 where wc_no = :ls_wc
		   and sale_no = :ls_sale        and seq_no = :li_seq
		   and operation = :ll_operation and division = :ll_division;
		if sqlca.sqlcode <> 0 then
			messagebox("확인","자동생산계획자료삭제중 에러발생")
			rollback;
			return
		end if
		
		update saledet 
		   set sol_qty = (case when order_qty - rlse_qty <= 0 then 0 else order_qty - rlse_qty end),	saledet_text = "X"
		 where order_no = :ls_sale and seq_no = :li_seq;
		if sqlca.sqlcode <> 0 then
			messagebox("확인","수주자료변경중 에러발생")
			rollback;
			return
		end if
		
		if istr_where.chk = "Q" then
			ldt_date   = wf_today()
			lr_qty     = this.object.plan_qty[row]
			ls_olditem = trim(istr_where.str3)
			ls_oldloc  = trim(istr_where.str4)
			ls_oldqa   = trim(istr_where.str5)
			
			insert into inaudit (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,
			       order_no,rcpt_qty,issue_qty,cost,rem, user_id)
			values (getdate(),:ldt_date,:ls_olditem,:ls_oldqa,:ls_oldloc,'IA',
			       'ALTER_OUT',0,:lr_qty,0,"생산계획조정", :gs_userid);   
			if sqlca.sqlcode < 0 then
				messagebox('오류22',SQLCA.SQLERRTEXT,exclamation!)
				rollback;
				return
			end if
			
			ls_old_time = string(now(),'hh:mm:ss:fff')
			for ll_count = 1 to 100000
				 IF ls_old_time <> string(now(),'hh:mm:ss:fff') then
					 ls_old_time  = string(now(),'hh:mm:ss:fff')	
					 exit
				 END IF	
			NEXT
			
			ls_newitem = trim(this.object.assy_item[row])
			ls_newloc  = ls_oldloc
			ls_newqa   = trim(this.object.assy_qa[row])
			insert into inaudit (inaudit_time,inaudit_date,inaudit_item,qa,loc_no,inaudit_type,
			       order_no,rcpt_qty,issue_qty,cost,rem, user_id)
			values (getdate(),:ldt_date,:ls_newitem,:ls_newqa,:ls_newloc,'RA',
			       'ALTER_IN',:lr_qty,0,0,"생산계획조정", :gs_userid);   
			if sqlca.sqlcode < 0 then
				messagebox('오류33',SQLCA.SQLERRTEXT,exclamation!)
				rollback;
				return
			end if
		end if
		
		commit;
		ls_click = 'Y'
		
	CASE 'PLANSALE'
		gs_where2 lst_str 
		if ls_sale = '' or isnull(ls_sale) or LenA(ls_sale) <> 14  then return
		lst_str.str1[1] = ls_sale

		OpenWithParm(w_whsaleall_w, lst_str)	
END CHOOSE

if ls_click = 'Y' then
	this.setredraw(false)
	dw6.retrieve()	
	dw6.scrolltorow(row)
	this.setredraw(true)
end if

end event

event doubleclicked;CHOOSE CASE dwo.name
	CASE 'assy_item','assy_qa',"groupitem_item_name"
		ii_sw = 1
		if this.accepttext() = 1 then
			ii_sw = 0
			wf_itemselect(parent.dw_6, 'S',row)
//			parent.pb_7.triggerevent(clicked!)
		end if
END CHOOSE

end event

event itemerror;
CHOOSE CASE dwo.name
	CASE 'item_no'
		this.object.item_no[row] = ''
	CASE 'qa'
		this.object.qa[row] = ''
	CASE 'assy_item'
		this.object.assy_item[row] = ''
	CASE 'assy_qa'
		this.object.assy_qa[row] = ''
END CHOOSE

return 2
end event

event retrieveend;il_row = 0

end event

event error;//
MessageBox("Error Number " + string(errornumber) + " Occurred", "Errortext: " + String(errortext))
action = ExceptionIgnore!
end event

type cbx_1 from checkbox within w_mpplan_m
integer x = 2062
integer y = 76
integer width = 229
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "마감"
end type

event clicked;long ll_cnt

dw6.accepttext()
if this.checked = true then
	this.backcolor = rgb(255,0,0)
	
	dw6.setredraw(false)
	if tab_1.tabpage_4.cbx_2.checked = false then
		dw6.object.pri.width = 0
	end if
	ii_wid = 0
	dw6.SelectRow(0, false)
	for ll_cnt = 1 to dw6.rowcount()
		dw6.object.pri[ll_cnt] = 0
	next
	dw6.setredraw(true)
else
	this.backcolor = rgb(192,192,192)
	dw6.SelectRow(0, false)
end if
end event

type dw_area from datawindow within w_mpplan_m
integer x = 1015
integer y = 68
integer width = 517
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

is_area = data
wf_area(is_area)
pb_save.postevent(clicked!)

end event

event losefocus;this.accepttext()

end event

type pb_file from picturebutton within w_mpplan_m
event mousemove pbm_mousemove
integer x = 4201
integer y = 36
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
if dw6.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	ls_Docname, ls_Named, "XLS",  &
	"엑셀 (*.XLS), *.XLS," + &
   "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
  		      dw6.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
    		      dw6.SaveAs(ls_DocName, CSV!, TRUE)
      end if
end if

end event

type cb_10 from commandbutton within w_mpplan_m
integer x = 2523
integer y = 36
integer width = 320
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주관리"
end type

event clicked;string ls_orderno
long   ll_row

// 수주관리 화면만 표시
if dw6.rowcount() < 1 then
	if IsValid(w_o_main) then 
		OpenSheet(w_orsale_m,  w_o_main, 5, original!)
	elseif IsValid(w_i_main) then 
		OpenSheet(w_orsale_m,  w_i_main, 5, original!)
	elseif IsValid(w_m_main) then 
		OpenSheet(w_orsale_m,  w_m_main, 5, original!)
	elseif IsValid(w_all_main) then 
		OpenSheet(w_orsale_m,  w_all_main, 5, original!)
	end if
	
	w_orsale_m.pb_save.enabled = false
end if
	
ll_row     = dw6.getrow()
ls_orderno = dw6.object.sale_no[ll_row]
if ls_orderno = "" or isnull(ls_orderno) then return

if LeftA(gs_team,1) = '7' then 
	if IsValid(w_orsale_m) then 
		MessageBox("확인","영업부서는 수주관리에서 확인하시기 바랍니다.~n~n수주관리 프로그램이 열린상태 입니다.")
		return
	end if
end if

if IsValid(w_o_main) then 
	OpenSheet(w_orsale_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_orsale_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_orsale_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_orsale_m,  w_all_main, 5, original!)
end if

w_orsale_m.setredraw(false)
w_orsale_m.pb_save.enabled = false
w_orsale_m.em_3.text = LeftA(ls_orderno,10)	// 수주번호
w_orsale_m.em_4.text = string(integer(RightA(ls_orderno,3)))
w_orsale_m.pb_cancel.postevent(clicked!)
w_orsale_m.setredraw(true)

end event

type cb_13 from commandbutton within w_mpplan_m
integer x = 1573
integer y = 24
integer width = 448
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력검색"
end type

event clicked;long ll_row

ll_row = dw6.getrow()
if ll_row < 1 then return

gs_where lst_where

int ls_a
ls_a = dw6.GetClickedColumn()

lst_where.str1 = trim(dw6.object.item_no[ll_row])
lst_where.str2 = trim(dw6.object.qa[ll_row])
lst_where.str3 = trim("WS00000000")
lst_where.name = trim(dw6.object.item_name1[ll_row])

openwithparm(w_whinaudit_w, lst_where)
w_whinaudit_w.WindowState = Normal!
lst_where = message.powerobjectparm

end event

type cb_4 from commandbutton within w_mpplan_m
integer x = 1573
integer y = 100
integer width = 448
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "제품공정관리"
end type

event clicked;string ls_itemno
long   ll_row

if dw6.rowcount() < 1 then return

ll_row    = dw6.getrow()
ls_itemno = dw6.object.item_no[ll_row]
if ls_itemno = "" or isnull(ls_itemno) then return

if IsValid(w_m_main) then 
	OpenSheet(w_cditemwc_m, w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cditemwc_m, w_all_main, 5, original!)
end if

w_cditemwc_m.setredraw(false)
if LeftA(gs_team,1) = "7" then
	w_cditemwc_m.pb_save.enabled = false	// 저장
end if
w_cditemwc_m.sle_1.text = ls_itemno	// 품목번호
w_cditemwc_m.pb_retrieve.postevent(clicked!)
w_cditemwc_m.setredraw(true)

end event

type gb_15 from groupbox within w_mpplan_m
integer x = 992
integer y = 4
integer width = 571
integer height = 168
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

