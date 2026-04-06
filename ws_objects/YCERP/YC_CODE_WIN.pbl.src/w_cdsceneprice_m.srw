$PBExportHeader$w_cdsceneprice_m.srw
$PBExportComments$현장별 표준단가 관리(1998/03/18, 정재수)
forward
global type w_cdsceneprice_m from w_inheritance
end type
type dw_4 from datawindow within w_cdsceneprice_m
end type
type dw_3 from datawindow within w_cdsceneprice_m
end type
type dw_5 from datawindow within w_cdsceneprice_m
end type
type st_1 from statictext within w_cdsceneprice_m
end type
type st_2 from statictext within w_cdsceneprice_m
end type
type cb_2 from commandbutton within w_cdsceneprice_m
end type
type cbx_1 from checkbox within w_cdsceneprice_m
end type
type tab_1 from tab within w_cdsceneprice_m
end type
type tabpage_1 from userobject within tab_1
end type
type cb_10 from commandbutton within tabpage_1
end type
type dw_33 from datawindow within tabpage_1
end type
type dw_55 from datawindow within tabpage_1
end type
type st_22 from statictext within tabpage_1
end type
type st_11 from statictext within tabpage_1
end type
type cb_save from commandbutton within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_10 cb_10
dw_33 dw_33
dw_55 dw_55
st_22 st_22
st_11 st_11
cb_save cb_save
st_3 st_3
end type
type tab_1 from tab within w_cdsceneprice_m
tabpage_1 tabpage_1
end type
type cb_4 from commandbutton within w_cdsceneprice_m
end type
type cb_6 from commandbutton within w_cdsceneprice_m
end type
type cb_8 from commandbutton within w_cdsceneprice_m
end type
type cb_7 from commandbutton within w_cdsceneprice_m
end type
type st_6 from statictext within w_cdsceneprice_m
end type
type pb_excel from picturebutton within w_cdsceneprice_m
end type
type cbx_itemreg from checkbox within w_cdsceneprice_m
end type
type dw_6 from datawindow within w_cdsceneprice_m
end type
type dw_7 from datawindow within w_cdsceneprice_m
end type
type cbx_scene from checkbox within w_cdsceneprice_m
end type
type cb_9 from commandbutton within w_cdsceneprice_m
end type
type st_4 from statictext within w_cdsceneprice_m
end type
type st_vertical from u_splitbar_vertical within w_cdsceneprice_m
end type
type st_horizontal from u_splitbar_horizontal within w_cdsceneprice_m
end type
type st_horizontal2 from u_splitbar_horizontal within w_cdsceneprice_m
end type
type st_5 from statictext within w_cdsceneprice_m
end type
type ddlb_fld from dropdownlistbox within w_cdsceneprice_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdsceneprice_m
end type
type st_7 from statictext within w_cdsceneprice_m
end type
type sle_value from singlelineedit within w_cdsceneprice_m
end type
type cb_1 from commandbutton within w_cdsceneprice_m
end type
type cb_3 from commandbutton within w_cdsceneprice_m
end type
type cb_5 from commandbutton within w_cdsceneprice_m
end type
type cb_11 from commandbutton within w_cdsceneprice_m
end type
type cbx_edit from checkbox within w_cdsceneprice_m
end type
type ddlb_op from dropdownlistbox within w_cdsceneprice_m
end type
type gb_4 from groupbox within w_cdsceneprice_m
end type
type gb_5 from groupbox within w_cdsceneprice_m
end type
end forward

global type w_cdsceneprice_m from w_inheritance
integer width = 4357
integer height = 2216
string title = "현장별 단가관리(w_cdsceneprice_m)"
long backcolor = 79219928
dw_4 dw_4
dw_3 dw_3
dw_5 dw_5
st_1 st_1
st_2 st_2
cb_2 cb_2
cbx_1 cbx_1
tab_1 tab_1
cb_4 cb_4
cb_6 cb_6
cb_8 cb_8
cb_7 cb_7
st_6 st_6
pb_excel pb_excel
cbx_itemreg cbx_itemreg
dw_6 dw_6
dw_7 dw_7
cbx_scene cbx_scene
cb_9 cb_9
st_4 st_4
st_vertical st_vertical
st_horizontal st_horizontal
st_horizontal2 st_horizontal2
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
sle_value sle_value
cb_1 cb_1
cb_3 cb_3
cb_5 cb_5
cb_11 cb_11
cbx_edit cbx_edit
ddlb_op ddlb_op
gb_4 gb_4
gb_5 gb_5
end type
global w_cdsceneprice_m w_cdsceneprice_m

type variables
datawindowchild idwc_cust_no, idwc_cust_name, idwc_cust_qa, idwc_scene_code, idwc_scene_desc
st_print i_print

string is_dw, is_custno, is_custname, is_scene_code, is_scene_desc

string is_select, is_select1, is_dw1sql, is_dw2sql, is_dw7sql, is_dw55sql, is_ret
long   il_row, il_insert

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

tab_1.visible       = false	// 복사될 거래처
dw_4.visible        = false	// 프린트

cbx_scene.visible   = false	// 현장품목
cbx_itemreg.visible = false   // 등록된 품목

dw_4.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)

// 단가조회
if GF_Permission('현장표준단가관리자', gs_userid) = 'Y' then	
   pb_retrieve.enabled = true
	pb_excel.enabled    = true

   pb_save.visible     = true
   pb_insert.enabled   = true
   pb_print.enabled    = true
   pb_delete.enabled   = true
	cbx_1.enabled       = true
	tab_1.enabled       = true
	cb_2.enabled        = true
	is_ret = '%'
else
   pb_retrieve.enabled = false
	pb_excel.enabled    = false

   pb_save.visible     = false
   pb_insert.enabled   = false
   pb_print.enabled    = false
   pb_delete.enabled   = false
	cbx_1.enabled       = false
	tab_1.enabled       = false
	cb_2.enabled        = false
	is_ret = gs_userid
end if

// 현장단가 목록
dw_2.getchild("qa", idwc_cust_qa)
idwc_cust_qa.settransobject(sqlca)
is_select = idwc_cust_qa.describe("datawindow.table.select")

// 선택된 거래처
dw_3.object.cust_no.background.color   = 79219928 // 1087434968 white
dw_3.object.cust_name.background.color = 79219928 // 1087434968
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
// 선택된 현장
dw_5.object.scene_code.background.color = 79219928  // 1087434968
dw_5.object.scene_desc.background.color = 79219928  // 1087434968
dw_5.settransobject(sqlca)
dw_5.insertrow(0)


// 복사할 거래처명
tab_1.tabpage_1.dw_33.settransobject(sqlca)
tab_1.tabpage_1.dw_33.insertrow(0)
tab_1.tabpage_1.dw_33.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
// 복사할 현장명
tab_1.tabpage_1.dw_55.settransobject(sqlca)
tab_1.tabpage_1.dw_55.insertrow(0)
tab_1.tabpage_1.dw_55.getchild("scene_desc", idwc_scene_desc)
idwc_scene_desc.settransobject(sqlca)

is_dw55sql = idwc_scene_desc.describe("datawindow.table.select")
is_dw1sql  = dw_1.describe("datawindow.table.select")		// 품목
is_dw2sql  = dw_2.describe("datawindow.table.select")		// 현장단가 목록
is_dw7sql  = dw_7.describe("datawindow.table.select")		// 거래처현장 목록

dw_3.enabled = false		// 선택한 거래처
dw_5.enabled = false		// 선택한 현장

////////////////////////////////////////////////////////
st_horizontal.of_set_topobject( dw_7 )
st_horizontal.of_set_bottomobject( dw_6 )
st_horizontal.of_set_minsize(250, 250)

st_horizontal2.of_set_topobject( dw_6 )
st_horizontal2.of_set_bottomobject( dw_1 )
st_horizontal2.of_set_minsize(250, 250)

st_vertical.of_set_leftobject( dw_7 )
st_vertical.of_set_leftobject( dw_6 )
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////


end event

on w_cdsceneprice_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_5=create dw_5
this.st_1=create st_1
this.st_2=create st_2
this.cb_2=create cb_2
this.cbx_1=create cbx_1
this.tab_1=create tab_1
this.cb_4=create cb_4
this.cb_6=create cb_6
this.cb_8=create cb_8
this.cb_7=create cb_7
this.st_6=create st_6
this.pb_excel=create pb_excel
this.cbx_itemreg=create cbx_itemreg
this.dw_6=create dw_6
this.dw_7=create dw_7
this.cbx_scene=create cbx_scene
this.cb_9=create cb_9
this.st_4=create st_4
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.st_horizontal2=create st_horizontal2
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_11=create cb_11
this.cbx_edit=create cbx_edit
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.tab_1
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.cb_6
this.Control[iCurrent+11]=this.cb_8
this.Control[iCurrent+12]=this.cb_7
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.pb_excel
this.Control[iCurrent+15]=this.cbx_itemreg
this.Control[iCurrent+16]=this.dw_6
this.Control[iCurrent+17]=this.dw_7
this.Control[iCurrent+18]=this.cbx_scene
this.Control[iCurrent+19]=this.cb_9
this.Control[iCurrent+20]=this.st_4
this.Control[iCurrent+21]=this.st_vertical
this.Control[iCurrent+22]=this.st_horizontal
this.Control[iCurrent+23]=this.st_horizontal2
this.Control[iCurrent+24]=this.st_5
this.Control[iCurrent+25]=this.ddlb_fld
this.Control[iCurrent+26]=this.ddlb_dwtitles
this.Control[iCurrent+27]=this.st_7
this.Control[iCurrent+28]=this.sle_value
this.Control[iCurrent+29]=this.cb_1
this.Control[iCurrent+30]=this.cb_3
this.Control[iCurrent+31]=this.cb_5
this.Control[iCurrent+32]=this.cb_11
this.Control[iCurrent+33]=this.cbx_edit
this.Control[iCurrent+34]=this.ddlb_op
this.Control[iCurrent+35]=this.gb_4
this.Control[iCurrent+36]=this.gb_5
end on

on w_cdsceneprice_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cbx_1)
destroy(this.tab_1)
destroy(this.cb_4)
destroy(this.cb_6)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.st_6)
destroy(this.pb_excel)
destroy(this.cbx_itemreg)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.cbx_scene)
destroy(this.cb_9)
destroy(this.st_4)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.st_horizontal2)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_11)
destroy(this.cbx_edit)
destroy(this.ddlb_op)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event resize;call super::resize;//
long  iHeight

This.Hide()
iHeight     = newheight - dw_7.y - gb_2.x

gb_2.width  = newwidth  - (gb_2.x * 2)

dw_7.height = iHeight * 0.4

st_horizontal.y      = dw_7.y + dw_7.height
st_horizontal.width  = dw_7.width 

dw_6.y      = st_horizontal.y + st_horizontal.height
dw_6.height = iHeight * 0.3

st_horizontal2.y      = dw_6.y + dw_6.height
st_horizontal2.width  = dw_6.width 

dw_1.y      = st_horizontal2.y + st_horizontal2.height
dw_1.height = newheight - dw_1.y - gb_2.x


st_vertical.x      = dw_7.x + dw_7.width
st_vertical.height = iHeight

dw_2.x      = st_vertical.x + st_vertical.width 
dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = iHeight

tab_1.x = dw_2.x
tab_1.y = dw_2.y

This.Show()

end event

type pb_save from w_inheritance`pb_save within w_cdsceneprice_m
integer x = 3863
integer y = 60
end type

event pb_save::clicked;string ls_custno, ls_sceneno
long   ll_row

dw_2.accepttext()

if dw_2.rowcount() < 1 then return
if wf_nullchk(dw_2) = false then
	MessageBox("확인","거래처 단가목록에서 NULL값이 존재 합니다.") 
	return
end if

if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return

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
if wf_update1(dw_2,"Y") = true then
	dw_2.Sort()
	
	ls_custno  = dw_3.getitemstring(dw_3.getrow(), "cust_no")
	ls_sceneno = dw_5.getitemstring(dw_5.getrow(), "scene_code")
	dw_4.retrieve( ls_custno, ls_sceneno, is_ret )
	
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.c_price[ll_row] = dw_2.object.price[ll_row]
	next
	
	if MessageBox("확인","저장 작업이 완료 되었습니다.~n~n새로고침을 하시겠습니까?",Exclamation!, YesNo!, 1) = 1 then
		pb_retrieve.triggerevent( clicked! )
	end if				
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdsceneprice_m
integer x = 32
integer y = 1640
integer width = 1545
integer height = 440
integer taborder = 60
string title = "d_cditemcost_t"
string dataobject = "d_cditemcost_t1"
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;string ls_item_no

if this.rowcount() > 0 then
	if dw_2.rowcount() > 0 then
		ls_item_no = this.getitemstring(this.getrow(), "item_no")
		il_row = dw_2.find("item_no = '" + ls_item_no + "'", 1, dw_2.rowcount())
		dw_2.scrolltorow(il_row)
	end if
end if
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

type st_title from w_inheritance`st_title within w_cdsceneprice_m
integer x = 46
integer y = 16
integer width = 1239
string text = "현장별 단가관리"
end type

type st_tips from w_inheritance`st_tips within w_cdsceneprice_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdsceneprice_m
boolean visible = false
integer y = 48
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdsceneprice_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdsceneprice_m
integer x = 4055
integer y = 60
integer taborder = 170
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdsceneprice_m
integer x = 3671
integer y = 60
integer taborder = 180
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_4.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 현장별 표준단가를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdsceneprice_m
boolean visible = false
integer taborder = 190
end type

type pb_delete from w_inheritance`pb_delete within w_cdsceneprice_m
integer x = 3269
integer y = 60
integer taborder = 200
end type

event pb_delete::clicked;call super::clicked;dwitemstatus l_status

if dw_2.rowcount() > 0 then 	
	l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)
   if l_status = newmodified! then
		dw_2.deleterow(dw_2.getrow())
		il_insert = 0
	elseif MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 1 then
	      dw_2.accepttext()
			dw_2.deleterow(dw_2.getrow())
			wf_update1(dw_2,"Y")
	end if
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_cdsceneprice_m
integer x = 3077
integer y = 60
integer taborder = 220
boolean enabled = false
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;string ls_item_no, ls_item_no1, ls_where, ls_sql, ls_qa
long   ll_row, ll_cnt

dw_2.accepttext()
dw_3.accepttext()
dw_5.accepttext()

if dw_1.rowcount() < 1 then return


//insert된 row의 규격이 선택되었는지 확인
if il_insert > 0 and dw_2.rowcount() > 0 then
	ls_qa = dw_2.getitemstring(il_insert, "qa")
	if isnull(ls_qa) or ls_qa = '' then
		messagebox("확인","규격을 입력하세요!",information!)
		dw_2.scrolltorow(il_insert)
		dw_2.setfocus()
		dw_2.setcolumn("qa")
		return
	end if
end if

//물품에서 선택된 물품을 찾는다.
if dw_1.rowcount() > 0 then
	if dw_2.rowcount() > 0 then
		ls_item_no = dw_1.getitemstring(dw_1.getrow(), "item_no")
		il_row = dw_2.find("item_no = '" + ls_item_no + "'", 1, dw_2.rowcount())
		dw_2.scrolltorow(il_row)
	end if
end if

ls_item_no = dw_1.getitemstring(dw_1.getrow(), "item_no")
//기존 물품등록
if il_row > 0 and dw_2.rowcount() > 0 then
   ll_row = dw_2.getrow()
	ls_item_no1 = dw_2.getitemstring(dw_2.getrow(), "item_no")
	DO UNTIL ls_item_no <> ls_item_no1
		//마직막 row check
		ll_cnt = dw_2.rowcount()
		if ll_row = ll_cnt then
			ls_item_no1 = ''
			ll_row = ll_row + 1
		else
			ls_item_no1 = dw_2.getitemstring(ll_row + 1, "item_no")
		end if
		ll_row = ll_row + 1
   LOOP

	ll_row = dw_2.insertrow(ll_row)
	dw_2.scrolltorow(ll_row)
else
   // 새로운 물품등록	
	ll_row = dw_2.insertrow(0)
	dw_2.scrolltorow(ll_row)
end if

// 수정하기
cbx_edit.checked = true
cbx_edit.TriggerEvent( clicked! )

dw_2.object.cust_no[dw_2.getrow()]    = dw_3.getitemstring(dw_3.getrow(), "cust_no")
dw_2.object.scene_code[dw_2.getrow()] = dw_5.getitemstring(dw_5.getrow(), "scene_code")
dw_2.object.item_no[dw_2.getrow()]    = ls_item_no
dw_2.object.groupitem_item_name[dw_2.getrow()] =  dw_1.getitemstring(dw_1.getrow(), "item_name")
dw_2.object.sys_date[dw_2.getrow()]   = wf_today()
dw_2.object.user_id[dw_2.getrow()]    = gs_userid

ls_where = "AND itemcost.item_no = ~~'" + ls_item_no + "~~'"
ls_sql = "DataWindow.Table.Select = '" + is_select + ls_where + "'"

dw_2.getchild("qa", idwc_cust_qa)
idwc_cust_qa.settransobject(sqlca)
idwc_cust_qa.modify(ls_sql)
idwc_cust_qa.retrieve()

il_insert = dw_2.getrow()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdsceneprice_m
integer x = 2885
integer y = 60
integer taborder = 210
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

gs_codere_str lst_code
string ls_sql, ls_where, ls_teamacc
long   ll_custcnt

dw_1.SetFilter("") ; dw_1.Filter()
dw_7.SetFilter("") ; dw_7.Filter()
dw_6.SetFilter("") ; dw_6.Filter()

if dw_1.rowcount() > 0 then
	dw_1.reset()
	dw_7.reset()
	dw_6.reset()
end if

// 거래처
dw_3.object.cust_no[1]   = ""
dw_3.object.cust_name[1] = ""
dw_3.accepttext()
// 현장
dw_5.object.scene_code[1] = ""
dw_5.object.scene_desc[1] = ""
dw_5.accepttext()


OpenWithParm(w_whretrieve_w, lst_code)
lst_code = message.powerobjectparm
if lst_code.okcancel = 'N' then RETURN

SELECT team_acc INTO :ls_teamacc FROM login WHERE user_id = :gs_userid ;
if ls_teamacc = 'Y' then
	dw_7.SetTransObject(sqlca)
	ll_custcnt = dw_7.retrieve()	// 거래처
elseif is_ret <> '%' then
	ls_where = ' and ( customer.salesman = "' + gs_userid + '" ) '
	ls_sql   = "DataWindow.Table.Select = '" + is_dw7sql + ls_where + "'"
	
	dw_7.SetTransObject(sqlca)
	dw_7.modify(ls_sql)	
	ll_custcnt = dw_7.retrieve()	// 거래처
end if

if lst_code.flag = 'A' then
	ls_sql   = "datawindow.table.select = '" + is_dw1sql + "'"
else
	ls_where = " and itemcost.item_no between ~~'" + lst_code.start_no + "~~' and " + &
				  "~~'" + lst_code.end_no + "~~'"
	ls_sql   = "datawindow.table.select = '" + is_dw1sql + ls_where + "'"
end if

//
dw_7.object.customer_cust_name.width = 620

dw_1.settransobject(sqlca)
dw_1.modify(ls_sql)
dw_1.retrieve()

dw_7.setfocus()	// 거래처

end event

type gb_3 from w_inheritance`gb_3 within w_cdsceneprice_m
boolean visible = false
integer x = 1513
integer y = 208
integer width = 2080
integer height = 400
integer taborder = 120
long backcolor = 12632256
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_cdsceneprice_m
integer y = 224
integer width = 4242
integer height = 248
integer taborder = 140
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79219928
string text = "itemcost"
end type

type gb_1 from w_inheritance`gb_1 within w_cdsceneprice_m
integer x = 2866
integer y = 16
integer width = 1403
integer taborder = 50
long backcolor = 79219928
end type

type dw_2 from w_inheritance`dw_2 within w_cdsceneprice_m
integer x = 1632
integer y = 484
integer width = 2642
integer height = 1600
integer taborder = 100
string dataobject = "d_cdcustscene_m1"
boolean hscrollbar = true
end type

event dw_2::itemchanged;call super::itemchanged;string ls_item_no, ls_qa, ls_uom
decimal lr_price
long ll_find

this.accepttext()
choose case dwo.name
	case 'qa'
		ls_item_no = this.getitemstring(this.getrow(), "item_no")
		ls_qa = this.getitemstring(this.getrow(), "qa")
		
		//이미 존재하는 규격 check
		if this.rowcount() > 1 then
			ll_find = this.find("item_no = '" + ls_item_no + "' and qa = '" + ls_qa + "'",1,this.getrow()-1)
			if ll_find > 0 then
				messagebox("확인","이미 존재하는 물품의 규격입니다." + &
				           "~r~n다시 입력하세요!",exclamation!)
				return 1
			end if
		end if
		
		SELECT uom, price INTO :ls_uom, :lr_price
		  FROM itemcost
		 WHERE item_no = :ls_item_no 
		   AND qa = :ls_qa;
			
		this.object.uom[this.getrow()] = ls_uom
		this.object.std_cost[this.getrow()] = lr_price
		
		this.setcolumn("price")
		this.setfocus()
		
//	case 'price'
//		lr_price = this.getitemdecimal(this.getrow(), "price")
//		
//		if ir_price = 0 then
//			this.object.pre_cost[this.getrow()] = lr_price
//		elseif ir_price <> lr_price then
//			this.object.pre_cost[this.getrow()] = ir_price
//		end if
//		this.object.sys_date[this.getrow()] = wf_today()
end choose
		
end event

event dw_2::rowfocuschanged;string ls_item_no, ls_where, ls_sql

this.accepttext()

if this.getrow() > 0 then
	ls_item_no = this.getitemstring(this.getrow(), "item_no")

	ls_where = "AND itemcost.item_no = ~~'" + ls_item_no + "~~'"
	ls_sql = "DataWindow.Table.Select = '" + is_select + ls_where + "'"

	dw_2.getchild("qa", idwc_cust_qa)
	idwc_cust_qa.settransobject(sqlca)
	idwc_cust_qa.modify(ls_sql)
	idwc_cust_qa.retrieve()
end if
end event

event dw_2::retrieveend;long   ll_row, ll_found, ll_dw1_cnt, ll_tcheck
string ls_itemno

pb_insert.enabled = true

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

	cbx_1.enabled = true   // 복사될 거래처현장
	cbx_1.triggerevent( clicked! )
end if

ll_tcheck = dw_1.object.tcheck[1]
if ll_tcheck > 0 then
	cbx_itemreg.visible = true
	cbx_itemreg.textcolor = rgb(255, 0, 0)
else
	cbx_itemreg.visible = false
	cbx_itemreg.textcolor = rgb(0, 0, 0)
end if

end event

event dw_2::itemerror;call super::itemerror;this.object.qa[this.getrow()] = ''
this.setcolumn("qa")
this.setfocus()
return 2
end event

event dw_2::clicked;call super::clicked;//
if row < 1 then RETURN

is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type dw_4 from datawindow within w_cdsceneprice_m
integer x = 73
integer y = 132
integer width = 96
integer height = 76
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_cdcustscene_r"
end type

type dw_3 from datawindow within w_cdsceneprice_m
integer x = 1957
integer y = 268
integer width = 1550
integer height = 100
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_cdscenecust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;////string is_custno, is_custname
//string ls_where, ls_sql
//
//dw_2.reset()
//dw_4.reset()
//pb_insert.enabled = false
//		
//this.accepttext()
//choose case dwo.name
//	case 'cust_no'
//		is_custno   = idwc_cust_no.getitemstring(idwc_cust_no.getrow(), "cust_no")
//		is_custname = idwc_cust_no.getitemstring(idwc_cust_no.getrow(), "cust_name")
//		this.object.cust_name[this.getrow()] = is_custname
//
//		ls_where = "WHERE scene.cust_no = ~~'" + is_custno + "~~'"
//		ls_sql   = "datawindow.table.select = '" + is_select1 + ls_where + "'"
//		
//		dw_5.getchild("scene_code", idwc_scene_no)
//		idwc_scene_no.settransobject(sqlca)
//		idwc_scene_no.modify(ls_sql)
//		idwc_scene_no.retrieve()
//		
//		dw_5.getchild("scene_desc", idwc_scene_desc)
//		idwc_scene_desc.settransobject(sqlca)
//		idwc_scene_desc.modify(ls_sql)
//		idwc_scene_desc.retrieve()
//		
//		dw_5.object.scene_code[dw_5.getrow()]   = ""
//		dw_5.object.scene_desc[dw_5.getrow()]   = ""
//		dw_5.object.scene_code.tabsequence      = 1
//		dw_5.object.scene_code.background.color = 1087434968
//		dw_5.object.scene_desc.tabsequence      = 2
//		dw_5.object.scene_desc.background.color = 1087434968
//		
//	case 'cust_name'
//		is_custname = this.getitemstring(this.getrow(), "cust_name")
//		this.object.cust_no[this.getrow()] = this.getitemstring(this.getrow(), "cust_name")
//				
//		ls_where = "WHERE scene.cust_no = ~~'" + is_custno + "~~'"
//		ls_sql   = "datawindow.table.select = '" + is_select1 + ls_where + "'"
//		
//		dw_5.getchild("scene_code", idwc_scene_no)
//		idwc_scene_no.settransobject(sqlca)
//		idwc_scene_no.modify(ls_sql)
//		idwc_scene_no.retrieve()
//		
//		dw_5.getchild("scene_desc", idwc_scene_desc)
//		idwc_scene_desc.settransobject(sqlca)
//		idwc_scene_desc.modify(ls_sql)
//		idwc_scene_desc.retrieve()
//		
//		dw_5.object.scene_code[dw_5.getrow()]   = ""
//		dw_5.object.scene_desc[dw_5.getrow()]   = ""
//		dw_5.object.scene_code.tabsequence      = 1
//		dw_5.object.scene_code.background.color = 1087434968
//		dw_5.object.scene_desc.tabsequence      = 2
//		dw_5.object.scene_desc.background.color = 1087434968
//end choose
//
//dw_5.setfocus()
//dw_6.visible = true
//dw_6.reset()
//dw_6.retrieve( is_custno )
//
//
end event

event losefocus;////
//this.accepttext()
//
end event

event getfocus;////
//rb_1.checked = false
//rb_2.checked = false
//rb_3.checked = false
//
end event

type dw_5 from datawindow within w_cdsceneprice_m
integer x = 1957
integer y = 364
integer width = 1490
integer height = 96
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_cdscene_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//string ls_cust
//
//this.accepttext()
//
//ls_cust = dw_3.object.cust_no[1]
//is_scene_code = this.object.scene_code[row]
//
//choose case dwo.name
//	case 'scene_code'
//		this.getchild("scene_code", idwc_scene_no)
//		idwc_scene_no.settransobject(sqlca)
//		is_scene_code = data
//		is_scene_desc = idwc_scene_no.getitemstring(idwc_scene_no.getrow(), "scene_desc")
//		this.object.scene_desc[1] = trim(is_scene_desc)
//		dw_2.retrieve(ls_cust, is_scene_code, is_ret)
//		dw_4.retrieve(ls_cust, is_scene_code, is_ret)
//		dw_1.setfocus()
//
//	case 'scene_desc'
//		this.getchild("scene_desc", idwc_scene_desc)
//		idwc_scene_desc.settransobject(sqlca)
//		is_scene_code = idwc_scene_desc.getitemstring(idwc_scene_desc.getrow(), "scene_code")
//		this.object.scene_code[1] = is_scene_code
////		dw_2.retrieve('i847', '%')
//		dw_2.retrieve(ls_cust, is_scene_code, is_ret)
//		dw_4.retrieve(ls_cust, is_scene_code, is_ret)
//		dw_1.setfocus()
//end choose
end event

event losefocus;//this.accepttext()
end event

event getfocus;////
//rb_1.checked = false
//rb_2.checked = false
//rb_3.checked = false
//
end event

type st_1 from statictext within w_cdsceneprice_m
integer x = 1659
integer y = 276
integer width = 256
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "거래처"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdsceneprice_m
integer x = 1659
integer y = 376
integer width = 261
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "현  장"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_cdsceneprice_m
integer x = 2473
integer y = 60
integer width = 352
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체삭제"
end type

event clicked;long ll_row

dw_2.accepttext()
ll_row = dw_2.rowcount()
if ll_row > 0 then 	
	if MessageBox("확인",'선택한 현장의 전체 단가자료를 삭제하시겠습니까?',information!, OKCancel!, 2) = 1 then
	   dw_2.accepttext()
		dw_2.rowsmove(1, ll_row, primary!, dw_2, 1, delete!)
		wf_update1(dw_2,"Y")
	end if
end if	



end event

type cbx_1 from checkbox within w_cdsceneprice_m
integer x = 3479
integer y = 272
integer width = 763
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "복사될 거래처현장"
end type

event clicked;//
if this.checked = true then
	if dw_2.rowcount() < 1 then
		MessageBox("확인","복사할 자료가 없습니다.",StopSign!)
		this.checked = false
		return
	end if
	
	tab_1.visible  = true
	this.textcolor = rgb(255, 0, 0)
	tab_1.tabpage_1.dw_33.setcolumn("cust_name")
	tab_1.tabpage_1.dw_33.setfocus()
else
	tab_1.visible  = false
	this.textcolor = rgb(0, 0, 255)
end if

end event

type tab_1 from tab within w_cdsceneprice_m
integer x = 1637
integer y = 816
integer width = 2309
integer height = 396
integer taborder = 130
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2272
integer height = 268
long backcolor = 79741120
string text = "복사될 현장"
long tabtextcolor = 16777215
long tabbackcolor = 16711680
long picturemaskcolor = 536870912
cb_10 cb_10
dw_33 dw_33
dw_55 dw_55
st_22 st_22
st_11 st_11
cb_save cb_save
st_3 st_3
end type

on tabpage_1.create
this.cb_10=create cb_10
this.dw_33=create dw_33
this.dw_55=create dw_55
this.st_22=create st_22
this.st_11=create st_11
this.cb_save=create cb_save
this.st_3=create st_3
this.Control[]={this.cb_10,&
this.dw_33,&
this.dw_55,&
this.st_22,&
this.st_11,&
this.cb_save,&
this.st_3}
end on

on tabpage_1.destroy
destroy(this.cb_10)
destroy(this.dw_33)
destroy(this.dw_55)
destroy(this.st_22)
destroy(this.st_11)
destroy(this.cb_save)
destroy(this.st_3)
end on

type cb_10 from commandbutton within tabpage_1
integer x = 1906
integer y = 32
integer width = 347
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;//
string ls_orgcust, ls_orgcustnm, ls_orgscene, ls_orgscenenm
long   ll_row

// dw_2 원본상태로 
ls_orgcust    = dw_3.object.cust_no[dw_3.getrow()]
ls_orgcustnm  = dw_3.object.cust_name[dw_3.getrow()]
ls_orgscene   = dw_5.object.scene_code[dw_5.getrow()]
ls_orgscenenm = dw_5.object.scene_desc[dw_5.getrow()]

for ll_row = 1 to dw_2.rowcount()
	dw_2.object.cust_no[ll_row]    = ls_orgcust
	dw_2.object.cust_name[ll_row]  = ls_orgcustnm
	dw_2.object.scene_code[ll_row] = ls_orgscene
	dw_2.object.scene_desc[ll_row] = ls_orgscenenm
next

tab_1.visible = false
cbx_1.checked = false
cbx_1.textcolor = rgb(0,0,255)

end event

type dw_33 from datawindow within tabpage_1
integer x = 338
integer y = 36
integer width = 1490
integer height = 92
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_cdscenecust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_custno, ls_custnm
string ls_where,  ls_sql
long   ll_row

this.accepttext()

ls_custno = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
ls_custnm = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_name")
this.object.cust_no[this.getrow()]   = ls_custno
this.object.cust_name[this.getrow()] = ls_custnm

for ll_row = 1 to dw_2.rowcount()
	dw_2.object.cust_no[ll_row]   = ls_custno
	dw_2.object.cust_name[ll_row] = ls_custnm
next


ls_where = "WHERE scene.cust_no = ~~'" + ls_custno + "~~'"
ls_sql   = "datawindow.table.select = '" + is_dw55sql + ls_where + "'"

dw_55.getchild("scene_desc", idwc_scene_desc)
idwc_scene_desc.SetTransObject(sqlca)
idwc_scene_desc.modify(ls_sql)
idwc_scene_desc.retrieve()

dw_55.object.scene_code[dw_55.getrow()]  = ""
dw_55.object.scene_code.background.color = 1087434968

dw_55.object.scene_desc[dw_55.getrow()]  = ""
dw_55.object.scene_desc.background.color = 1087434968

dw_55.setfocus()

end event

type dw_55 from datawindow within tabpage_1
integer x = 338
integer y = 128
integer width = 1481
integer height = 100
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_cdscene_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_tarcust, ls_tarcustnm, ls_tarscene, ls_tarscenenm
string ls_sceneno, ls_scenenm
long   ll_row

this.accepttext()

this.getchild("scene_desc", idwc_scene_desc)
ls_sceneno = idwc_scene_desc.getitemstring(idwc_scene_desc.getrow(), "scene_code")
ls_scenenm = idwc_scene_desc.getitemstring(idwc_scene_desc.getrow(), "scene_desc")
this.object.scene_code[this.getrow()] = ls_sceneno
this.object.scene_desc[this.getrow()] = ls_scenenm

if dw_2.rowcount() > 0 then
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.scene_code[ll_row] = ls_sceneno
		dw_2.object.scene_desc[ll_row] = ls_scenenm
	next
end if

cb_save.default = true
cb_save.setfocus()

end event

type st_22 from statictext within tabpage_1
integer x = 64
integer y = 148
integer width = 261
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "현  장"
boolean focusrectangle = false
end type

type st_11 from statictext within tabpage_1
integer x = 64
integer y = 48
integer width = 256
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "거래처"
boolean focusrectangle = false
end type

type cb_save from commandbutton within tabpage_1
integer x = 1906
integer y = 132
integer width = 347
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "복사저장"
end type

event clicked;long   ll_row
int    li_req
string ls_tarcust, ls_tarcustnm, ls_tarscene, ls_tarscenenm, ls_rem

if dw_2.rowcount() < 1 then return

dw_33.accepttext()
dw_55.accepttext()

ls_tarcust    = dw_33.object.cust_no[dw_33.getrow()]   
ls_tarcustnm  = dw_33.object.cust_name[dw_33.getrow()] 
ls_tarscene   = dw_55.object.scene_code[dw_55.getrow()] 
ls_tarscenenm = dw_55.object.scene_desc[dw_55.getrow()] 
ls_rem        = string(gdt_today,"yyyy/mm/dd") + " 복사"

dw_2.accepttext()
//if wf_modifycount(dw_2) > 0 then
//	MessageBox("확인","저장 후 복사 하시기바랍니다.")
//	return
//end if

li_req = MessageBox("저장", "중복되는 자료는 삭제하시겠습니까?~r~n~n" &
						+ "( 중복되는 자료를 삭제하려면 'Y' 기존자료유지는 'N')",Exclamation!, YesNoCancel!, 1)
choose case li_req
	case 3
		return
		
	case 1
		DELETE FROM custscene 
		 WHERE cust_no    = :ls_tarcust
		   AND scene_code = :ls_tarscene
		   AND (item_no + qa) IN (SELECT (item_no + qa)  FROM custscene
											WHERE cust_no = :is_custno AND scene_code = :is_scene_code);
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류1','[custscene] DELETE 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if
	                      
		INSERT INTO custscene ( cust_no, scene_code, item_no, qa, uom, pre_cost, std_cost, price, rem, sys_date, user_id)
		SELECT :ls_tarcust, :ls_tarscene, item_no, qa, uom, 0, std_cost,price, :ls_rem, getdate(), :gs_userid 
 	     FROM custscene 
		 WHERE cust_no = :is_custno AND scene_code = :is_scene_code;
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류2','[custscene] INSERT 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if
		
	case 2
		INSERT INTO custscene ( cust_no, scene_code, item_no, qa, uom, pre_cost, std_cost, price, rem, sys_date, user_id)
		SELECT :ls_tarcust, :ls_tarscene, item_no, qa, uom, 0, std_cost,price, :ls_rem, getdate(), :gs_userid 
		  FROM custscene 
		 WHERE cust_no    = :is_custno
  		   AND scene_code = :is_scene_code
		   AND (item_no + qa) NOT IN ( SELECT (item_no + qa) WHERE cust_no = :ls_tarcust AND scene_code = :ls_tarscene);
		if sqlca.sqldbcode < 0 then
			rollback;
			MessageBox('오류3','[custscene] INSERT 오류 발생하였습니다.~r~n' ,exclamation!)
			return
		else
			COMMIT;
		end if
end choose

// 복사될 거래처현장
tab_1.visible   = false
dw_33.reset()
dw_33.settransobject(sqlca)
dw_33.insertrow(0)
dw_55.reset()
dw_55.settransobject(sqlca)
dw_55.insertrow(0)

cbx_1.checked   = false
cbx_1.textcolor = rgb(0, 0, 255)		// 복사될 현장선택
if MessageBox("확인","복사저장 작업이 완료 되었습니다.~n~n새로고침을 하시겠습니까?",Exclamation!, YesNo!, 1) = 1 then
	pb_retrieve.triggerevent( clicked! )
end if

end event

type st_3 from statictext within tabpage_1
integer x = 1819
integer y = 144
integer width = 87
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "로"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_cdsceneprice_m
integer x = 3648
integer y = 356
integer width = 160
integer height = 76
integer taborder = 10
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

type cb_6 from commandbutton within w_cdsceneprice_m
integer x = 3817
integer y = 356
integer width = 151
integer height = 76
integer taborder = 20
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

type cb_8 from commandbutton within w_cdsceneprice_m
integer x = 3973
integer y = 356
integer width = 101
integer height = 76
integer taborder = 60
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

type cb_7 from commandbutton within w_cdsceneprice_m
integer x = 4078
integer y = 356
integer width = 151
integer height = 76
integer taborder = 70
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

type st_6 from statictext within w_cdsceneprice_m
integer x = 3662
integer y = 436
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

type pb_excel from picturebutton within w_cdsceneprice_m
event mousemove pbm_mousemove
integer x = 3470
integer y = 60
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

type cbx_itemreg from checkbox within w_cdsceneprice_m
integer x = 1115
integer y = 224
integer width = 448
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
string text = "등록된 품목"
end type

event clicked;//
string ls_where

if this.checked = true then 
	ls_where = "chk = 'Y'"
	dw_1.SetFilter(ls_where)
	dw_1.Filter()
else
	ls_where = ""
	dw_1.SetFilter(ls_where)
	dw_1.Filter()
end if

end event

type dw_6 from datawindow within w_cdsceneprice_m
integer x = 32
integer y = 1184
integer width = 1545
integer height = 412
integer taborder = 160
boolean bringtotop = true
string title = "현장별 품목수"
string dataobject = "d_cdscenecust_list"
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
string ls_custno, ls_custnm, ls_sceneno, ls_scenenm
long   ll_row

if row < 1 then return
this.scrolltorow(row)

ls_custno  = this.object.cust_no[row]
ls_custnm  = this.object.cust_name[row]
ls_sceneno = this.object.scene_code[row]
ls_scenenm = this.object.scene_desc[row]

is_custno     = ls_custno
is_custname   = ls_custnm
is_scene_code = ls_sceneno
is_scene_desc = ls_scenenm

// 선택한 거래처
dw_3.object.cust_no[1]   = ls_custno
dw_3.object.cust_name[1] = ls_custnm
dw_3.accepttext()
// 선택한 현장
dw_5.object.scene_code[1] = ls_sceneno
dw_5.object.scene_desc[1] = ls_scenenm
dw_5.accepttext()

dw_2.retrieve(ls_custno, ls_sceneno, is_ret)
dw_4.retrieve(ls_custno, ls_sceneno, is_ret)

dw_6.setfocus()		// 현장목록

end event

event rowfocuschanged;////
//string ls_custno, ls_custnm, ls_sceneno, ls_scenenm
//long   ll_row
//
//if currentrow < 1 then return
//this.scrolltorow(currentrow)
//
//ls_custno  = this.object.cust_no[currentrow]
//ls_custnm  = this.object.cust_name[currentrow]
//ls_sceneno = this.object.scene_code[currentrow]
//ls_scenenm = this.object.scene_desc[currentrow]
//
//dw_3.object.cust_no[1]   = ls_custno
//dw_3.object.cust_name[1] = ls_custnm
//dw_3.accepttext()
//
//dw_5.object.scene_code[1] = ls_sceneno
//dw_5.object.scene_desc[1] = ls_scenenm
//dw_5.accepttext()
//
//dw_5.getchild("scene_desc", idwc_scene_desc)
//idwc_scene_desc.settransobject(sqlca)
//is_scene_code = idwc_scene_desc.getitemstring(idwc_scene_desc.getrow(), "scene_code")
//dw_5.object.scene_code[1] = is_scene_code
//
//dw_2.retrieve(ls_custno, ls_sceneno, is_ret)
//dw_4.retrieve(ls_custno, ls_sceneno, is_ret)
//dw_6.setfocus()
//
end event

event retrieveend;//
long ll_tcheck

dw_2.reset()

ll_tcheck = dw_6.object.tcheck[1]
if ll_tcheck > 0 then
	cbx_scene.visible = true
	cbx_scene.checked = true
	cbx_scene.textcolor = rgb(255, 0, 0)
	cbx_scene.triggerevent( clicked! )
else
	cbx_scene.visible = false
	cbx_scene.checked = false
	cbx_scene.textcolor = rgb(0, 0, 0)
	cbx_scene.triggerevent( clicked! )
end if

end event

type dw_7 from datawindow within w_cdsceneprice_m
integer x = 32
integer y = 484
integer width = 1545
integer height = 660
integer taborder = 100
boolean bringtotop = true
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
string ls_custno, ls_custnm, ls_sceneno, ls_scenenm

if row < 1 then return
this.scrolltorow( row )

ls_custno = this.object.customer_cust_no[row]
ls_custnm = this.object.customer_cust_name[row]

dw_3.object.cust_no[1]   = ls_custno
dw_3.object.cust_name[1] = ls_custnm
dw_3.accepttext()

dw_5.object.scene_code[1] = ""
dw_5.object.scene_desc[1] = ""
dw_5.accepttext()

dw_6.retrieve( ls_custno )

dw_7.setfocus()	// 거래처


end event

event rowfocuschanged;//
string ls_custno, ls_custnm, ls_sceneno, ls_scenenm

if currentrow < 1 then return
this.scrolltorow( currentrow )

ls_custno = this.object.customer_cust_no[currentrow]
ls_custnm = this.object.customer_cust_name[currentrow]

dw_3.object.cust_no[1]   = ls_custno
dw_3.object.cust_name[1] = ls_custnm
dw_3.accepttext()

dw_5.object.scene_code[1] = ""
dw_5.object.scene_desc[1] = ""
dw_5.accepttext()

dw_6.retrieve( ls_custno )

dw_7.setfocus()	// 거래처


end event

type cbx_scene from checkbox within w_cdsceneprice_m
integer x = 736
integer y = 224
integer width = 357
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
string text = "현장품목"
end type

event clicked;//
string ls_where

if this.checked = true then 
	ls_where = "cnt > 0 "
	dw_6.SetFilter(ls_where)
	dw_6.Filter()
else
	ls_where = ""
	dw_6.SetFilter(ls_where)
	dw_6.Filter()
end if

end event

type cb_9 from commandbutton within w_cdsceneprice_m
integer x = 1897
integer y = 60
integer width = 567
integer height = 144
integer taborder = 30
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
string   ls_custno, ls_custnm, ls_itemno, ls_itemnm, ls_qa
long     ll_row, ll_dw6_cnt

ll_row = dw_3.getrow()
if ll_row < 1 then return

ls_custno = dw_3.object.cust_no[ll_row]
ls_custnm = dw_3.object.cust_name[ll_row]

if IsValid(w_o_main) then 
	OpenSheet(w_cdcustprice_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cdcustprice_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cdcustprice_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdcustprice_m,  w_all_main, 5, original!)
end if


w_cdcustprice_m.dw_1.retrieve()

w_cdcustprice_m.cb_3.enabled  = true		// 검색

w_cdcustprice_m.cbx_2.visible = false	// 등록된 품목보기
w_cdcustprice_m.dw_1.visible  = true		// 품목
w_cdcustprice_m.dw_6.visible  = true		// 거래처
w_cdcustprice_m.pb_insert.visible = false

ll_dw6_cnt = w_cdcustprice_m.dw_6.retrieve()	// 거래처
if ll_dw6_cnt > 0 then
   ll_row = w_cdcustprice_m.dw_6.Find( "customer_cust_name like '" + ls_custnm + "'", 1, ll_dw6_cnt )
   if ll_row > 0 then 
	   w_cdcustprice_m.dw_6.ScrollToRow(ll_row)

      w_cdcustprice_m.is_custno = ls_custno
      w_cdcustprice_m.dw_3.object.cust_name[1] = ls_custnm
      w_cdcustprice_m.dw_3.object.cust_no[1]   = ls_custno

      w_cdcustprice_m.dw_3.accepttext()
      w_cdcustprice_m.wf_ret(ls_custno, "%")		
	end if
end if


end event

type st_4 from statictext within w_cdsceneprice_m
integer x = 1650
integer y = 224
integer width = 297
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "custscene"
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_cdsceneprice_m
integer x = 1595
integer y = 484
integer height = 1600
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.width   = dw_1.width
st_horizontal2.width  = dw_1.width

end event

type st_horizontal from u_splitbar_horizontal within w_cdsceneprice_m
integer x = 32
integer y = 1152
integer width = 1545
boolean bringtotop = true
end type

type st_horizontal2 from u_splitbar_horizontal within w_cdsceneprice_m
integer x = 32
integer y = 1604
integer width = 1545
boolean bringtotop = true
end type

type st_5 from statictext within w_cdsceneprice_m
integer x = 78
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_cdsceneprice_m
integer x = 265
integer y = 288
integer width = 480
integer height = 632
integer taborder = 10
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

type ddlb_dwtitles from dropdownlistbox within w_cdsceneprice_m
integer x = 297
integer y = 296
integer width = 347
integer height = 88
integer taborder = 130
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

type st_7 from statictext within w_cdsceneprice_m
integer x = 782
integer y = 304
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

type sle_value from singlelineedit within w_cdsceneprice_m
integer x = 78
integer y = 376
integer width = 827
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cdsceneprice_m
integer x = 923
integer y = 380
integer width = 160
integer height = 76
integer taborder = 140
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
	case "dw_7"
		arg_dw  = dw_7
	case "dw_6"
		arg_dw  = dw_6
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)



end event

type cb_3 from commandbutton within w_cdsceneprice_m
integer x = 1088
integer y = 380
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_7"
		arg_dw  = dw_7
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

type cb_5 from commandbutton within w_cdsceneprice_m
integer x = 1253
integer y = 380
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_7"
		arg_dw  = dw_7
	case "dw_6"
		arg_dw  = dw_6
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_11 from commandbutton within w_cdsceneprice_m
integer x = 1417
integer y = 380
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_7"
		arg_dw  = dw_7
	case "dw_6"
		arg_dw  = dw_6
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_edit from checkbox within w_cdsceneprice_m
integer x = 1481
integer y = 108
integer width = 347
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
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

type ddlb_op from dropdownlistbox within w_cdsceneprice_m
integer x = 946
integer y = 288
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

type gb_4 from groupbox within w_cdsceneprice_m
integer x = 1870
integer y = 16
integer width = 983
integer height = 204
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
end type

type gb_5 from groupbox within w_cdsceneprice_m
integer x = 1449
integer y = 16
integer width = 407
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

