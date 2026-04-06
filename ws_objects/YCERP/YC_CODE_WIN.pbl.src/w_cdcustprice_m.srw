$PBExportHeader$w_cdcustprice_m.srw
$PBExportComments$거래처별 표준단가 관리(1998/03/16, 정재수)
forward
global type w_cdcustprice_m from w_inheritance
end type
type dw_4 from datawindow within w_cdcustprice_m
end type
type dw_3 from datawindow within w_cdcustprice_m
end type
type dw_5 from datawindow within w_cdcustprice_m
end type
type st_1 from statictext within w_cdcustprice_m
end type
type st_2 from statictext within w_cdcustprice_m
end type
type cbx_1 from checkbox within w_cdcustprice_m
end type
type dw_6 from datawindow within w_cdcustprice_m
end type
type cb_2 from commandbutton within w_cdcustprice_m
end type
type cb_6 from commandbutton within w_cdcustprice_m
end type
type cb_8 from commandbutton within w_cdcustprice_m
end type
type cb_7 from commandbutton within w_cdcustprice_m
end type
type st_6 from statictext within w_cdcustprice_m
end type
type pb_excel from picturebutton within w_cdcustprice_m
end type
type cbx_2 from checkbox within w_cdcustprice_m
end type
type cbx_custitem from checkbox within w_cdcustprice_m
end type
type st_vertical from u_splitbar_vertical within w_cdcustprice_m
end type
type st_3 from statictext within w_cdcustprice_m
end type
type st_horizontal from u_splitbar_horizontal within w_cdcustprice_m
end type
type cbx_edit from checkbox within w_cdcustprice_m
end type
type st_5 from statictext within w_cdcustprice_m
end type
type ddlb_fld from dropdownlistbox within w_cdcustprice_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdcustprice_m
end type
type st_7 from statictext within w_cdcustprice_m
end type
type sle_value from singlelineedit within w_cdcustprice_m
end type
type cb_1 from commandbutton within w_cdcustprice_m
end type
type cb_3 from commandbutton within w_cdcustprice_m
end type
type cb_5 from commandbutton within w_cdcustprice_m
end type
type cb_11 from commandbutton within w_cdcustprice_m
end type
type ddlb_op from dropdownlistbox within w_cdcustprice_m
end type
type gb_4 from groupbox within w_cdcustprice_m
end type
end forward

global type w_cdcustprice_m from w_inheritance
integer width = 4352
integer height = 2224
string title = "거래처 단가관리(w_cdcustprice_m)"
long backcolor = 79219928
dw_4 dw_4
dw_3 dw_3
dw_5 dw_5
st_1 st_1
st_2 st_2
cbx_1 cbx_1
dw_6 dw_6
cb_2 cb_2
cb_6 cb_6
cb_8 cb_8
cb_7 cb_7
st_6 st_6
pb_excel pb_excel
cbx_2 cbx_2
cbx_custitem cbx_custitem
st_vertical st_vertical
st_3 st_3
st_horizontal st_horizontal
cbx_edit cbx_edit
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
sle_value sle_value
cb_1 cb_1
cb_3 cb_3
cb_5 cb_5
cb_11 cb_11
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_cdcustprice_m w_cdcustprice_m

type variables
public string is_scene_code, is_scene_desc, is_custno, is_custname
st_print i_print
datawindowchild idwc_cust_no, idwc_cust_name, idwc_cust_qa
datawindowchild idwc_cust_no2, idwc_cust_name2
string is_dw, is_select, is_dw1sql, is_ret, is_dw2sql, is_dw6sql
long   il_row, il_insert = 0
decimal{0} ir_price
end variables

forward prototypes
public subroutine wf_ret (string as_cust, string as_flag)
end prototypes

public subroutine wf_ret (string as_cust, string as_flag);//
string ls_teamacc, ls_where, ls_sql

SELECT team_acc INTO :ls_teamacc FROM login WHERE user_id = :gs_userid ;
if ls_teamacc = 'Y' then
	ls_where = ' and ( ( custitem.cust_no = "' + as_cust + '" ) ) '
	ls_sql   = "DataWindow.Table.Select = '" + is_dw2sql + ls_where + "'"
	dw_2.SetTransObject(sqlca)
	dw_2.modify(ls_sql)
	dw_2.retrieve()
	dw_1.setfocus()
else
	ls_where = ' and ( ( custitem.cust_no = "' + as_cust + '" ) AND ( customer.salesman like "' + as_flag + '") ) '
	ls_sql   = "DataWindow.Table.Select = '" + is_dw2sql + ls_where + "'"
	dw_2.SetTransObject(sqlca)
	dw_2.modify(ls_sql)
	dw_2.retrieve()
	dw_1.setfocus()
end if


end subroutine

on w_cdcustprice_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_5=create dw_5
this.st_1=create st_1
this.st_2=create st_2
this.cbx_1=create cbx_1
this.dw_6=create dw_6
this.cb_2=create cb_2
this.cb_6=create cb_6
this.cb_8=create cb_8
this.cb_7=create cb_7
this.st_6=create st_6
this.pb_excel=create pb_excel
this.cbx_2=create cbx_2
this.cbx_custitem=create cbx_custitem
this.st_vertical=create st_vertical
this.st_3=create st_3
this.st_horizontal=create st_horizontal
this.cbx_edit=create cbx_edit
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_11=create cb_11
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.dw_6
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_6
this.Control[iCurrent+10]=this.cb_8
this.Control[iCurrent+11]=this.cb_7
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.pb_excel
this.Control[iCurrent+14]=this.cbx_2
this.Control[iCurrent+15]=this.cbx_custitem
this.Control[iCurrent+16]=this.st_vertical
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.st_horizontal
this.Control[iCurrent+19]=this.cbx_edit
this.Control[iCurrent+20]=this.st_5
this.Control[iCurrent+21]=this.ddlb_fld
this.Control[iCurrent+22]=this.ddlb_dwtitles
this.Control[iCurrent+23]=this.st_7
this.Control[iCurrent+24]=this.sle_value
this.Control[iCurrent+25]=this.cb_1
this.Control[iCurrent+26]=this.cb_3
this.Control[iCurrent+27]=this.cb_5
this.Control[iCurrent+28]=this.cb_11
this.Control[iCurrent+29]=this.ddlb_op
this.Control[iCurrent+30]=this.gb_4
end on

on w_cdcustprice_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.dw_6)
destroy(this.cb_2)
destroy(this.cb_6)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.st_6)
destroy(this.pb_excel)
destroy(this.cbx_2)
destroy(this.cbx_custitem)
destroy(this.st_vertical)
destroy(this.st_3)
destroy(this.st_horizontal)
destroy(this.cbx_edit)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_11)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event open;call super::open;/* 거래처단가 만들기
--INSERT custitem
SELECT a.cust_no, a.item_no, a.qa, a.uom, pre_cost = 0, std_cost = 0, a.price, '', sys_date = getdate(), user_id = '1999010s'
  FROM (
       SELECT a.cust_no
            , a.item_no
            , a.qa
            , a.uom
            , price = max(a.price)
         FROM (
               SELECT DISTINCT do.cust_no, dodet.item_no
                   -- , g.item_name
                    , qa = (case when g.uom = 'M' then substring(dodet.qa,1,13) else dodet.qa end)
                    , g.uom, dodet.price
                 FROM do
                      LEFT OUTER JOIN dodet        ON do.do_no      = dodet.do_no
                      LEFT OUTER JOIN groupitem g  ON dodet.item_no = g.item_no
                WHERE do.do_date BETWEEN '2013/10/01' AND '2013/10/31'
                  AND do.cust_no = 'U580'
               ) A
         GROUP BY a.cust_no
             , a.item_no
             , a.qa
             , a.uom
       ) A     
*/

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_4.visible  = false	// 프린트
cb_3.enabled  = false	// 필터
cbx_1.enabled = false   // 복사될 거래처선택 하기

// 선택된 거래처
dw_3.enabled = false
dw_3.object.cust_no.background.color   = 79219928 // 1087434968 white
dw_3.object.cust_name.background.color = 79219928 // 1087434968
// 복사될 거래처
dw_5.enabled = false
dw_5.object.cust_no.background.color   = 79219928 // 1087434968 white
dw_5.object.cust_name.background.color = 79219928 // 1087434968

//
dw_6.settransobject(sqlca)
dw_4.settransobject(sqlca)

if gf_permission('거래처단가관리자', gs_userid) = 'Y' then
   pb_retrieve.enabled = true
	pb_excel.enabled    = true

   pb_save.visible    = true
   pb_insert.enabled  = true
   pb_print.enabled   = true
   pb_delete.enabled  = true
	pb_compute.enabled = true
	pb_cancel.enabled  = true
else
   pb_retrieve.enabled = false
	pb_excel.enabled    = false

   pb_save.visible    = false
   pb_print.enabled   = false
   pb_insert.enabled  = false
   pb_delete.enabled  = false
	pb_compute.enabled = false
	pb_cancel.enabled  = false
end if

// 단가 조회//
if gf_permission('거래처단가관리자', gs_userid) = 'Y' then
	is_ret = '%'
else
	is_ret = gs_userid
end if

dw_5.enabled       = false	// 복사될 거래처
pb_compute.enabled = false // 복사저장

dw_2.getchild("qa", idwc_cust_qa)
idwc_cust_qa.settransobject(sqlca)
is_select = idwc_cust_qa.describe("datawindow.table.select")

// 선택한 거래처
dw_3.settransobject(sqlca)
dw_3.insertrow(0)

// 복사될 거래처
dw_5.settransobject(sqlca)
dw_5.insertrow(0)
dw_5.getchild("cust_no", idwc_cust_no)
idwc_cust_no.settransobject(sqlca)
dw_5.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)

is_dw1sql = dw_1.describe("datawindow.table.select")
is_dw2sql = dw_2.describe("datawindow.table.select")
is_dw6sql = dw_6.describe("datawindow.table.select")

////////////////////////////////////////////////////////
st_horizontal.of_set_topobject( dw_6 )
st_horizontal.of_set_bottomobject( dw_1 )
st_horizontal.of_set_minsize(250, 250)

st_vertical.of_set_leftobject( dw_6 )
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////


end event

event resize;call super::resize;//
long  iHeight

iHeight     = newheight - dw_6.y - gb_2.x

gb_2.width  = newwidth  - (gb_2.x * 2)

dw_6.height = iHeight * 0.5		// 품목

st_horizontal.y      = dw_6.y + dw_6.height
st_horizontal.width  = dw_6.width

dw_1.y      = st_horizontal.y + st_horizontal.height
dw_1.height = (iHeight * 0.5) - st_horizontal.height		// 거래처

st_vertical.x        = dw_6.x + dw_6.width
st_vertical.height   = iHeight

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = newheight - dw_2.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_cdcustprice_m
integer x = 3863
integer y = 56
end type

event pb_save::clicked;string ls_newsort
long   ll_row

dw_2.accepttext()

if dw_2.rowcount() < 1 then return
if wf_nullchk(dw_2) = false then
	MessageBox("확인","거래처 단가목록에서 NULL값이 존재 합니다.") 
	return
end if

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then return

// 수정하기
cbx_edit.checked = false 
cbx_edit.TriggerEvent( clicked! )

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
for ll_row = 1 to dw_2.rowcount() 
	if dw_2.object.c_price[ll_row] <> dw_2.object.price[ll_row] then
		dw_2.object.pre_cost[ll_row] = dw_2.object.c_price[ll_row]
		dw_2.object.sys_date[ll_row] = wf_today()
	end if
next

dw_2.accepttext()
if WF_Update1(dw_2,"Y") = true then
	dw_2.Sort()		// 거래처 단가품목 정렬
	
	dw_4.reset()	// 프린트
	dw_4.retrieve(dw_3.getitemstring(dw_3.getrow(), "cust_no"))
	
	// 이전단가 
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.c_price[ll_row] = dw_2.object.price[ll_row]
	next
	
	if MessageBox("확인","저장 작업이 완료 되었습니다.~n~n새로고침을 하시겠습니까?",Exclamation!, YesNo!, 1) = 1 then
		pb_retrieve.triggerevent( clicked! )
	end if		
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdcustprice_m
integer x = 32
integer y = 1464
integer width = 2053
integer height = 620
integer taborder = 60
string dataobject = "d_cditemcost_t1"
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;string ls_item_no

if this.getrow() < 1 or dw_2.getrow() < 1 then return
ls_item_no = this.getitemstring(this.getrow(), "item_no")
il_row     = dw_2.find("item_no = '" + ls_item_no + "'", 1, dw_2.rowcount())
dw_2.scrolltorow(il_row)

end event

event dw_1::clicked;call super::clicked;//
if row < 1 then RETURN

is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

// 수정하기
cbx_edit.checked = false
cbx_edit.TriggerEvent( clicked! )


end event

type st_title from w_inheritance`st_title within w_cdcustprice_m
integer x = 32
integer y = 16
integer width = 1239
integer height = 132
string text = "거래처 단가관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcustprice_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustprice_m
integer x = 3310
integer y = 380
integer width = 329
integer height = 100
integer taborder = 160
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "복사저장"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::clicked;call super::clicked;long   ll_row
int    li_req
string ls_tarcust, ls_rem

dw_2.accepttext()
dw_5.accepttext()

if dw_2.rowcount() < 1 then return
//if wf_modifycount(dw_2) > 0 then
//	MessageBox("확인","저장후에 복사하십시요")
//	return
//end if

ls_tarcust = dw_5.object.cust_no[1]
ls_rem     = string(gdt_today,"yyyy/mm/dd") + " 복사"

if ls_tarcust = "" or isnull(ls_tarcust) then
	MessageBox("확인","복사될 거래처를 선택하십시요")
	return
end if

li_req = MessageBox("저장", "중복되는 자료는 삭제하시겠습니까~r~n" &
						+ "( 중복되는 자료를 삭제하려면 'Y' 기존자료유지는 'N')",Exclamation!, YesnoCancel!, 1)
choose case li_req
	case 3
		return
		
	case 1
		DELETE FROM custitem 
		 WHERE cust_no = :ls_tarcust
		   AND (item_no + qa) IN (SELECT (item_no + qa) FROM custitem WHERE cust_no = :is_custno);
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류1','[custitem] DELETE 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if

		INSERT INTO custitem ( cust_no, item_no, qa, uom, pre_cost, std_cost, price, rem, sys_date, user_id)
		SELECT :ls_tarcust, item_no, qa, uom, 0, std_cost,price, :ls_rem, getdate(), :gs_userid 
	     FROM custitem 
		 WHERE cust_no = :is_custno;
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류2','[custitem] INSERT 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if
		
	case 2
		INSERT INTO custitem ( cust_no, item_no, qa, uom, pre_cost, std_cost, price, rem, sys_date, user_id)
		SELECT :ls_tarcust, item_no, qa, uom, 0, std_cost,price, :ls_rem, getdate(), :gs_userid 
		  FROM custitem 
		 WHERE cust_no = :is_custno
		   AND (item_no + qa) NOT IN (SELECT (item_no + qa) FROM custitem WHERE cust_no = :ls_tarcust);
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류3','[custitem] INSERT 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if
end choose
		
// 복사될 거래처
dw_5.reset()
dw_5.enabled = false
dw_5.settransobject(sqlca)
dw_5.insertrow(0)
dw_5.object.cust_no.background.color   = 79219928 // 1087434968 white
dw_5.object.cust_name.background.color = 79219928 // 1087434968

cbx_1.checked   = false		// 복사될 거래처선택 하기
cbx_1.textcolor = rgb(0, 0, 255)
if MessageBox("확인","복사저장 작업이 완료 되었습니다.~n~n새로고침을 하시겠습니까?",Exclamation!, YesNo!, 1) = 1 then
	pb_retrieve.triggerevent( clicked! )
end if


end event

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_cdcustprice_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcustprice_m
integer x = 4055
integer y = 56
integer taborder = 170
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdcustprice_m
integer x = 3671
integer y = 56
integer taborder = 180
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

dw_4.retrieve(is_custno)
if dw_4.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 거래처별 표준단가를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustprice_m
integer x = 2519
integer y = 56
integer width = 352
integer taborder = 190
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체삭제"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::clicked;call super::clicked;long ll_row

dw_2.accepttext()
ll_row = dw_2.rowcount()
if ll_row > 0 then 	
	if MessageBox("확인",'거래처의 전체 단가자료를 삭제 후 저장 하시겠습니까?',information!, OKCancel!, 2) = 1 then
	   dw_2.accepttext()
		dw_2.rowsmove(1, ll_row, primary!, dw_2, 1, delete!)
		wf_update1(dw_2,"Y")
	end if
end if	



end event

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_cdcustprice_m
integer x = 3278
integer y = 56
integer taborder = 200
end type

event pb_delete::clicked;call super::clicked;//
dwitemstatus l_status

if dw_2.rowcount() > 0 then 	
	l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)
   if l_status = newmodified! then
		dw_2.deleterow(dw_2.getrow())
		il_insert = 0
	elseif MessageBox("확인",'삭제 하시겠습니까?',information!, OKCancel!, 2) = 1 then
	   dw_2.accepttext()
		dw_2.deleterow(dw_2.getrow())
		WF_Update1( dw_2, "Y" )
	end if
end if	



end event

type pb_insert from w_inheritance`pb_insert within w_cdcustprice_m
integer x = 3086
integer y = 56
integer taborder = 220
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;//
string ls_custno, ls_itemno, ls_itemnm, ls_itemno1, ls_qa
string ls_where, ls_sql
long   ll_row,   ll_cnt
dec    ld_price

dw_3.accepttext()		// 선택한 거래처
dw_2.accepttext()		// 거래처품목

if dw_1.rowcount() < 1 or dw_3.getrow() < 1 then return

ls_custno = dw_3.getitemstring(dw_3.getrow(), "cust_no")
if isnull(ls_custno) or trim(ls_custno) = '' then return

// insert된 row의 규격이 선택되었는지 확인
// if il_insert > 0 and dw_2.rowcount() > 0 then
if dw_2.rowcount() > 0 then
	ls_qa = dw_2.getitemstring(dw_2.rowcount(), "qa")
	if isnull(ls_qa) or ls_qa = "" then
		MessageBox("확인","해당하는 품목의 규격을 입력하세요!",information!)

		dw_2.scrolltorow(il_insert)
		dw_2.setcolumn("qa")
		dw_2.setfocus()
		return
	end if
end if

// 거래처 단가품목에서 선택된 물품을 찾는다.
if dw_1.rowcount() > 0 then
	if dw_2.rowcount() > 0 then
		ls_itemno = dw_1.getitemstring(dw_1.getrow(), "item_no")
		il_row    = dw_2.find("item_no = '" + ls_itemno + "'", 1, dw_2.rowcount())
		dw_2.scrolltorow(il_row)
	end if
end if

// 품목리스트에서 선택한 품목으로
ls_itemno = dw_1.getitemstring(dw_1.getrow(), "item_no")
if il_row > 0 and dw_2.rowcount() > 0 then	// 기 등록된 거래처 단가품목을 검색함 
   ll_row     = dw_2.getrow()
	ls_itemno1 = dw_2.getitemstring(dw_2.getrow(), "item_no")
	Do Until ls_itemno <> ls_itemno1		
		ll_cnt = dw_2.rowcount()		// 마지막 row check
		if ll_row = ll_cnt then
			ls_itemno1 = ""
			ll_row     = ll_row + 1
		else
			ls_itemno1 = dw_2.getitemstring(ll_row + 1, "item_no")
		end if
		
		ll_row = ll_row + 1
   loop

	ll_row = dw_2.insertrow(ll_row)
	dw_2.scrolltorow(ll_row)
else	// 새로운 물품 등록	
	ll_row = dw_2.insertrow(0)
	dw_2.scrolltorow(ll_row)
end if

// 수정하기
cbx_edit.checked = true 
cbx_edit.TriggerEvent( clicked! )

// 거래처 단가품목
dw_2.object.cust_no[dw_2.getrow()]   = dw_3.getitemstring(dw_3.getrow(), "cust_no")
dw_2.object.cust_name[dw_2.getrow()] = dw_3.getitemstring(dw_3.getrow(), "cust_name")
dw_2.object.item_no[dw_2.getrow()]   = dw_1.getitemstring(dw_1.getrow(), "item_no")		// ls_itemno
dw_2.object.item_name[dw_2.getrow()] = dw_1.getitemstring(dw_1.getrow(), "item_name")
dw_2.object.uom[dw_2.getrow()]       = dw_1.getitemstring(dw_1.getrow(), "uom")

// 표준단가 읽기(거래처 단가품목 itemchanged event)
SELECT price = isnull(price, 0) INTO :ld_price FROM itemcost  WHERE item_no = :ls_itemno AND qa = :ls_qa;
//dw_2.object.pre_cost[dw_2.getrow()]  = 0			// pre_cost
dw_2.object.std_cost[dw_2.getrow()]  = ld_price		// std_cost
dw_2.object.sys_date[dw_2.getrow()]  = wf_today()
dw_2.object.user_id[dw_2.getrow()]   = gs_userid

ls_where = 'AND itemcost.item_no = ~~"' + ls_itemno + '~~"' 
ls_sql   = "DataWindow.Table.Select = '" + is_select + ls_where + "'"

dw_2.getchild("qa", idwc_cust_qa)
idwc_cust_qa.settransobject(sqlca)
idwc_cust_qa.modify(ls_sql)
idwc_cust_qa.retrieve()

il_insert = dw_2.getrow()
dw_2.setcolumn("qa")
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustprice_m
integer x = 2894
integer y = 56
integer taborder = 210
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_codere_str lst_code
string ls_sql, ls_where, ls_teamacc
long   ll_row, ll_custcnt

cbx_1.enabled = false   // 복사될 거래처선택 하기
cbx_2.visible = false	// 등록된 품목보기
cb_3.enabled  = true		// 검색


if dw_1.rowcount() > 0 then dw_1.reset()

OpenWithParm(w_whretrieve_w, lst_code)
lst_code = Message.PowerObjectParm
if lst_code.okcancel = 'N' then return

SELECT team_acc INTO :ls_teamacc FROM login WHERE user_id = :gs_userid ;
if ls_teamacc = 'Y' then
	dw_6.SetTransObject(sqlca)
	ll_custcnt = dw_6.retrieve()	// 거래처
elseif is_ret <> '%' then
	ls_where = ' and ( customer.salesman = "' + gs_userid + '" ) '
	ls_sql   = "DataWindow.Table.Select = '" + is_dw6sql + ls_where + "'"
	
	dw_6.SetTransObject(sqlca)
	dw_6.modify(ls_sql)	
	ll_custcnt = dw_6.retrieve()	// 거래처
end if

if lst_code.flag = 'A' then
	ls_sql   = "datawindow.table.select = '" + is_dw1sql + "'"
else
	ls_where = " and itemcost.item_no between ~~'" + lst_code.start_no + "~~' and " + &
				  "~~'" + lst_code.end_no + "~~'"
	ls_sql   = "DataWindow.Table.Select = '" + is_dw1sql + ls_where + "'"
end if

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_1.retrieve()	// 품목


end event

type gb_3 from w_inheritance`gb_3 within w_cdcustprice_m
boolean visible = false
integer x = 1513
integer y = 208
integer width = 2080
integer height = 400
integer taborder = 100
long backcolor = 12632256
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustprice_m
integer width = 4238
integer height = 272
integer taborder = 150
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79219928
string text = "itemcost"
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustprice_m
integer x = 2487
integer y = 16
integer width = 1783
integer taborder = 50
long backcolor = 79219928
end type

type dw_2 from w_inheritance`dw_2 within w_cdcustprice_m
integer x = 2144
integer y = 516
integer width = 2126
integer height = 1568
integer taborder = 70
string dataobject = "d_cdcustitem_m1"
boolean hscrollbar = true
end type

event dw_2::rowfocuschanged;string ls_item_no, ls_where, ls_sql
long   ll_row

this.accepttext()
ll_row = this.getrow()
dwitemstatus l_status

if ll_row < 1 then return
l_status = dw_2.getitemstatus(ll_row, 0, primary!)
if l_status = newmodified! then
	ls_item_no = this.getitemstring(ll_row, "item_no")

	ls_where = 'AND itemcost.item_no = ~~"' + ls_item_no + '~~"' 
	ls_sql   = "DataWindow.Table.Select = '" + is_select + ls_where + "'"

	dw_2.getchild("qa", idwc_cust_qa)
	idwc_cust_qa.settransobject(sqlca)
	idwc_cust_qa.modify(ls_sql)
	idwc_cust_qa.retrieve()
end if
end event

event dw_2::itemchanged;call super::itemchanged;string  ls_itemno, ls_qa, ls_uom
decimal lr_price
long    ll_find

this.accepttext()
choose case dwo.name
	case 'qa'
		ls_itemno = this.getitemstring(this.getrow(), "item_no")
		ls_qa     = this.getitemstring(this.getrow(), "qa")
		
		//이미 존재하는 규격 check
		if this.rowcount() > 1 then
			ll_find = this.find("item_no = '" + ls_itemno + "' and qa = '" + ls_qa + "'",1,this.getrow()-1)
			if ll_find > 0 then
				MessageBox("확인","이미 존재하는 물품의 규격입니다.~r~n다시 입력하세요!",exclamation!)
				return 1
			end if
		end if
		
		// 표준단가 읽기
		SELECT uom   INTO :ls_uom    FROM groupitem WHERE item_no = :ls_itemno;			
		SELECT price INTO :lr_price  FROM itemcost  WHERE item_no = :ls_itemno  AND qa = :ls_qa;			
		this.object.uom[this.getrow()]      = ls_uom
		this.object.std_cost[this.getrow()] = lr_price
		
		this.setcolumn("price")
		this.setfocus()
		
//	case 'price'
//		lr_price = this.getitemdecimal(this.getrow(), "price")
//		
//		if this.object.c_price[this.getrow()]  = 0 then
//			this.object.pre_cost[this.getrow()] = lr_price
//			this.object.sys_date[this.getrow()] = wf_today()
//		elseif this.object.c_price[this.getrow()] <> lr_price then
//			this.object.pre_cost[this.getrow()] = this.object.c_price[this.getrow()]
//			this.object.sys_date[this.getrow()] = wf_today()
//		elseif this.object.c_price[this.getrow()] = lr_price then
//		end if
end choose

end event

event dw_2::retrieveend;//
long   ll_row, ll_found, ll_dw1_cnt, ll_tcheck
string ls_itemno

if is_ret = '%' then
	pb_insert.visible = true
else
	pb_insert.visible = false
end if

ll_dw1_cnt = dw_1.RowCount()
if dw_2.rowcount() > 0 then
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.c_price[ll_row] = dw_2.object.price[ll_row]
		dw_2.setitemstatus(ll_row, 0, Primary!, NotModified!)
	next

	for ll_row = 1 to dw_2.rowcount()
		ls_itemno = dw_2.object.item_no[ll_row]
		
		ll_found = dw_1.Find( "item_no = '" + ls_itemno + "'", 1, ll_dw1_cnt)
		if ll_found > 0 then dw_1.object.chk[ll_found] = "Y"
	next
	
	cbx_1.enabled = true   // 복사될 거래처선택 하기	
	cbx_1.triggerevent( clicked! )
end if

ll_tcheck = dw_1.object.tcheck[1]
if ll_tcheck > 0 then
	cbx_2.visible = true
	cbx_2.textcolor = rgb(255, 0, 0)
else
	cbx_2.visible = false
	cbx_2.textcolor = rgb(0, 0, 0)
end if

end event

event dw_2::itemerror;call super::itemerror;//
choose case dwo.name
	case 'price'
		This.object.price[row] = 0
	case 'qa'
		this.object.qa[row] = ''
		this.setcolumn("qa")
		this.setfocus()
end choose

return 1
end event

event dw_2::clicked;call super::clicked;//
if row < 1 then RETURN

is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type dw_4 from datawindow within w_cdcustprice_m
integer x = 37
integer y = 172
integer width = 96
integer height = 64
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cdcustprice_r"
end type

type dw_3 from datawindow within w_cdcustprice_m
integer x = 1664
integer y = 292
integer width = 1499
integer height = 96
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_cdcust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;////
//choose case dwo.name
//	case 'cust_no'
//		is_custno = data
//		is_custname = idwc_cust_no.getitemstring(idwc_cust_no.getrow(), "cust_name")
//		this.object.cust_name[1] = is_custname
//
//	case 'cust_name'
//		is_custno = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
//		this.object.cust_no[1] = is_custno
//end choose
//
//wf_ret(is_custno, is_ret)
//if dw_2.rowcount() < 1 then MessageBox("확인","해당하는 거래처의 데이터가 존재하지 않습니다.")
//
//if ( dw_1.getrow() < 1 or dw_1.visible = False ) or dw_2.getrow() < 1 then return
//
//string ls_itemno
//
//ls_itemno = dw_1.getitemstring(dw_1.getrow(), "item_no")
//il_row    = dw_2.find("item_no = '" + ls_itemno + "'", 1, dw_2.rowcount())
//dw_2.scrolltorow(il_row)
//
//
end event

type dw_5 from datawindow within w_cdcustprice_m
integer x = 1664
integer y = 388
integer width = 1499
integer height = 96
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_cdcust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_custno, ls_custnm
long   ll_row

this.accepttext()

this.getchild("cust_name", idwc_cust_name)

ls_custno = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
ls_custnm = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_name")
this.object.cust_no[this.getrow()]   = ls_custno
this.object.cust_name[this.getrow()] = ls_custnm

if dw_2.rowcount() > 0 then
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.cust_no[ll_row]   = ls_custno
		dw_2.object.cust_name[ll_row] = ls_custnm
	next
end if

pb_compute.default = true
pb_compute.setfocus()

end event

type st_1 from statictext within w_cdcustprice_m
integer x = 3145
integer y = 304
integer width = 155
integer height = 68
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "에서"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdcustprice_m
integer x = 3150
integer y = 396
integer width = 87
integer height = 68
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "로"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_cdcustprice_m
integer x = 3310
integer y = 304
integer width = 942
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "복사될 거래처선택 하기"
end type

event clicked;//
if this.checked = true then
	dw_5.enabled = true
	dw_5.object.cust_no.background.color   = 1087434968  // white
	dw_5.object.cust_name.background.color = 1087434968

	pb_compute.enabled = true
	this.textcolor = rgb(255, 0, 0)
else
	dw_5.enabled = false
	dw_5.object.cust_no.background.color   = 79219928 // 1087434968 white
	dw_5.object.cust_name.background.color = 79219928 // 1087434968

	pb_compute.enabled = false
	this.textcolor = rgb(0, 0, 255)
end if

end event

type dw_6 from datawindow within w_cdcustprice_m
integer x = 32
integer y = 516
integer width = 2053
integer height = 896
integer taborder = 120
string title = "none"
string dataobject = "d_cdcustitem_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if row < 1 then RETURN

is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

// 수정하기
cbx_edit.checked = false
cbx_edit.TriggerEvent( clicked! )

//
string ls_custno, ls_custnm

this.scrolltorow(row)
ls_custno = this.object.customer_cust_no[row]
ls_custnm = this.object.customer_cust_name[row]

dw_3.object.cust_no[1]   = ls_custno
dw_3.object.cust_name[1] = ls_custnm

is_custno   = ls_custno
is_custname = ls_custnm

dw_3.accepttext()
//wf_ret( ls_custno, is_ret )

dw_2.object.qa.tabsequence    = 0
dw_2.object.price.tabsequence = 0
dw_2.object.rem.tabsequence   = 0

dw_2.retrieve( ls_custno )
//dw_1.setfocus()


end event

event retrieveend;//
long ll_ccheck

ll_ccheck = dw_6.object.ccheck[1]
if ll_ccheck > 0 then
	cbx_custitem.visible   = true
	cbx_custitem.checked   = true
	cbx_custitem.textcolor = rgb(255, 0, 0)
	cbx_custitem.triggerevent( clicked! )
else
	cbx_custitem.visible   = false
	cbx_custitem.checked   = false
	cbx_custitem.textcolor = rgb(0, 0, 0)
	cbx_custitem.triggerevent( clicked! )
end if

end event

type cb_2 from commandbutton within w_cdcustprice_m
integer x = 3666
integer y = 392
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
//ddlb_4.text = "LIKE"
//ddlb_3.text = "거래처"
//sle_value.text = ""

dw_2.setfilter("")
dw_2.filter()

end event

type cb_6 from commandbutton within w_cdcustprice_m
integer x = 3835
integer y = 392
integer width = 151
integer height = 76
integer taborder = 100
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
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost > price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type cb_8 from commandbutton within w_cdcustprice_m
integer x = 3991
integer y = 392
integer width = 101
integer height = 76
integer taborder = 110
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
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost = price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type cb_7 from commandbutton within w_cdcustprice_m
integer x = 4096
integer y = 392
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
string text = "높음"
end type

event clicked;//if ( pre_cost < price, rgb(255, 0, 0), if ( pre_cost > price, rgb(83, 141, 213), rgb(0, 0, 0) ) )
string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

ls_temp = " pre_cost < price "

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)


end event

type st_6 from statictext within w_cdcustprice_m
integer x = 3680
integer y = 472
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

type pb_excel from picturebutton within w_cdcustprice_m
event mousemove pbm_mousemove
integer x = 3470
integer y = 56
integer width = 187
integer height = 144
integer taborder = 90
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

datawindow dw_dest

dw_dest = dw_2

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type cbx_2 from checkbox within w_cdcustprice_m
integer x = 1010
integer y = 224
integer width = 571
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
string text = "등록된 품목보기"
end type

event clicked;//
string ls_where

if this.checked = true then 
	ls_where = "chk = 'Y' "
	dw_1.SetFilter(ls_where)
	dw_1.Filter()
else
	ls_where = ""
	dw_1.SetFilter(ls_where)
	dw_1.Filter()
end if

end event

type cbx_custitem from checkbox within w_cdcustprice_m
integer x = 553
integer y = 224
integer width = 453
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
string text = "거래처 품목"
end type

event clicked;//
string ls_where

if this.checked = true then 
	ls_where = "ccnt > 0 "
	dw_6.SetFilter(ls_where)
	dw_6.Filter()
else
	ls_where = ""
	dw_6.SetFilter(ls_where)
	dw_6.Filter()
end if

end event

type st_vertical from u_splitbar_vertical within w_cdcustprice_m
integer x = 2112
integer y = 516
integer height = 1568
boolean bringtotop = true
end type

type st_3 from statictext within w_cdcustprice_m
integer x = 1673
integer y = 224
integer width = 567
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "거래처(custitem)"
boolean focusrectangle = false
end type

type st_horizontal from u_splitbar_horizontal within w_cdcustprice_m
integer x = 32
integer y = 1428
integer width = 2053
boolean bringtotop = true
end type

type cbx_edit from checkbox within w_cdcustprice_m
integer x = 2085
integer y = 100
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수정하기"
end type

event clicked;// 수정하기
if this.checked = true then
	dw_2.object.qa.tabsequence    = 10
	dw_2.object.price.tabsequence = 20
	dw_2.object.rem.tabsequence   = 30
else
	dw_2.object.qa.tabsequence    = 0
	dw_2.object.price.tabsequence = 0
	dw_2.object.rem.tabsequence   = 0
end if

end event

type st_5 from statictext within w_cdcustprice_m
integer x = 73
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_cdcustprice_m
integer x = 261
integer y = 308
integer width = 480
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_cdcustprice_m
integer x = 293
integer y = 316
integer width = 347
integer height = 88
integer taborder = 140
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

type st_7 from statictext within w_cdcustprice_m
integer x = 777
integer y = 324
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

type sle_value from singlelineedit within w_cdcustprice_m
integer x = 73
integer y = 396
integer width = 827
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cdcustprice_m
integer x = 919
integer y = 400
integer width = 160
integer height = 76
integer taborder = 150
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

choose case is_dw
	case "dw_6"
		arg_dw  = dw_6
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)



end event

type cb_3 from commandbutton within w_cdcustprice_m
integer x = 1083
integer y = 400
integer width = 160
integer height = 76
integer taborder = 160
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

choose case is_dw
	case "dw_6"
		arg_dw  = dw_6
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_cdcustprice_m
integer x = 1248
integer y = 400
integer width = 160
integer height = 76
integer taborder = 170
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

choose case is_dw
	case "dw_6"
		arg_dw  = dw_6
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_11 from commandbutton within w_cdcustprice_m
integer x = 1413
integer y = 400
integer width = 160
integer height = 76
integer taborder = 180
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

choose case is_dw
	case "dw_6"
		arg_dw  = dw_6
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_cdcustprice_m
integer x = 942
integer y = 308
integer width = 306
integer height = 500
integer taborder = 60
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

type gb_4 from groupbox within w_cdcustprice_m
integer x = 2053
integer y = 16
integer width = 421
integer height = 204
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
end type

