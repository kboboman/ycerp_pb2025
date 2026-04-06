$PBExportHeader$w_cditem_paint_m.srw
$PBExportComments$도료관리등록(2019/07/16- 조원석)
forward
global type w_cditem_paint_m from w_inheritance
end type
type st_4 from statictext within w_cditem_paint_m
end type
type ddlb_fld from dropdownlistbox within w_cditem_paint_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cditem_paint_m
end type
type st_5 from statictext within w_cditem_paint_m
end type
type sle_value from singlelineedit within w_cditem_paint_m
end type
type cb_3 from commandbutton within w_cditem_paint_m
end type
type cb_4 from commandbutton within w_cditem_paint_m
end type
type cb_5 from commandbutton within w_cditem_paint_m
end type
type cb_6 from commandbutton within w_cditem_paint_m
end type
type pb_1 from picturebutton within w_cditem_paint_m
end type
type st_vertical from u_splitbar_vertical within w_cditem_paint_m
end type
type st_horizontal from u_splitbar_horizontal within w_cditem_paint_m
end type
type ddlb_op from dropdownlistbox within w_cditem_paint_m
end type
type cbx_picture_check from checkbox within w_cditem_paint_m
end type
type dw_3 from datawindow within w_cditem_paint_m
end type
type dw_4 from datawindow within w_cditem_paint_m
end type
type st_horizontal1 from u_splitbar_horizontal within w_cditem_paint_m
end type
type pb_2 from picturebutton within w_cditem_paint_m
end type
type pb_3 from picturebutton within w_cditem_paint_m
end type
end forward

global type w_cditem_paint_m from w_inheritance
integer width = 7808
integer height = 2648
string title = "도료관리등록(w_cditem_paint_m)"
long backcolor = 79219928
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
pb_1 pb_1
st_vertical st_vertical
st_horizontal st_horizontal
ddlb_op ddlb_op
cbx_picture_check cbx_picture_check
dw_3 dw_3
dw_4 dw_4
st_horizontal1 st_horizontal1
pb_2 pb_2
pb_3 pb_3
end type
global w_cditem_paint_m w_cditem_paint_m

type variables
gs_item ist_item
string  is_dw, is_dw1sql, is_dw3sql, is_project_code, is_item_no, is_qa, is_scenesql, is_custsql, is_itemsql
string  is_com_paint_sql, is_order_com_paint_sql, is_order_paint_sql, is_paint_sql, is_paintsql, is_factorysql, is_itemgubunsql
string  is_chk = "1", is_chk2 = "1"
integer  i_tabpage

long   il_maxHeight, il_maxWidth, i_personal_id
datawindowchild idwc_scene, idwc_cust, idwc_item, idwc_paint_name, idwc_order_paint_name, idwc_paint_company, idwc_order_paint_company
datawindowchild idwc_paint, idwc_fatcory_name, idwc_item_gubun
end variables

forward prototypes
public subroutine gf_qrcode_create (string ls_data, string ls_qrcode_name)
end prototypes

public subroutine gf_qrcode_create (string ls_data, string ls_qrcode_name);
 
FILEDELETE("C:\BMP\"+ls_qrcode_name+".JPG")
	
run( "qrencode -o C:\BMP\"+ls_qrcode_name+".jpg '"+ ls_data + "' ")

end subroutine

on w_cditem_paint_m.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.pb_1=create pb_1
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.ddlb_op=create ddlb_op
this.cbx_picture_check=create cbx_picture_check
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_horizontal1=create st_horizontal1
this.pb_2=create pb_2
this.pb_3=create pb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_5
this.Control[iCurrent+9]=this.cb_6
this.Control[iCurrent+10]=this.pb_1
this.Control[iCurrent+11]=this.st_vertical
this.Control[iCurrent+12]=this.st_horizontal
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.cbx_picture_check
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.dw_4
this.Control[iCurrent+17]=this.st_horizontal1
this.Control[iCurrent+18]=this.pb_2
this.Control[iCurrent+19]=this.pb_3
end on

on w_cditem_paint_m.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.pb_1)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.ddlb_op)
destroy(this.cbx_picture_check)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_horizontal1)
destroy(this.pb_2)
destroy(this.pb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_sql, ls_where, ls_item, ls_sqlerrtext
long l_length
////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_1 )

st_vertical.of_set_rightobject( dw_3 )
st_vertical.of_set_rightobject( dw_4 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_bottomobject( dw_3 )
st_horizontal.of_set_minsize(250, 250)

st_horizontal1.of_set_topobject( dw_3 )
st_horizontal1.of_set_bottomobject( dw_4 )
st_horizontal1.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_3.reset()
dw_3.InsertRow(0)

dw_3.getchild("item_no", idwc_item)
idwc_item.insertrow(0)
idwc_item.settransobject(sqlca)
is_itemsql = idwc_item.describe("datawindow.table.select")

DECLARE item_paint_cur CURSOR FOR
select distinct item.item_no
from item inner join groupitem on item.item_no = groupitem.item_no
where groupitem.p4 = '0'
AND ITEM.USE_FLAG = 'Y';


	OPEN item_paint_cur;
		
			FETCH item_paint_cur INTO :ls_item;
		
			Do While sqlca.sqlcode = 0
		
				ls_where = ls_where + "~~'"+ ls_item + "~~', "
			
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = string(sqlca.sqlerrtext)
					ROLLBACK;				
					MessageBox('오류32','[item_stock] item_stock중 DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
					RETURN 0
				end if					 
			
					
				FETCH item_paint_cur INTO :ls_item;
					
			Loop
		
		CLOSE item_paint_cur;

l_length = LenA(ls_where)		
		
if trim( MidA(ls_where, l_length -1, 2) ) = ',' then
	ls_where = MidA(ls_where, 1, l_length - 2 )	
end if 


ls_sql =   "  SELECT distinct groupitem.item_no,   " +&
			"           groupitem.uom,   "		   +&			
			"           groupitem.source,   " 	   +&
			"           groupitem.item_name  "    +&
			"      FROM groupitem  "                +&
			"     WHERE groupitem.use_flag <> ~~'C~~' " 

ls_where = " and groupitem.item_no in ( " + ls_where + " )"

ls_sql =  "datawindow.table.select = '" + ls_sql + ls_where + "'"

idwc_item.modify(ls_sql)
idwc_item.retrieve()



dw_4.insertrow(0)

dw_4.getchild("customer_cust_no", idwc_cust)
idwc_cust.insertrow(1)
idwc_cust.settransobject(sqlca)

dw_4.getchild("scene_code", idwc_scene)
idwc_scene.insertrow(1)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_4.getchild("order_paint_company", idwc_order_paint_company)
idwc_order_paint_company.insertrow(1)
idwc_order_paint_company.settransobject(sqlca)
is_order_com_paint_sql = idwc_order_paint_company.describe("datawindow.table.select")

dw_4.getchild("paint_company", idwc_paint_company)
idwc_paint_company.insertrow(1)
idwc_paint_company.settransobject(sqlca)
is_com_paint_sql = idwc_paint_company.describe("datawindow.table.select")

dw_4.getchild("order_paint_name", idwc_order_paint_name)
idwc_order_paint_name.insertrow(1)
idwc_order_paint_name.settransobject(sqlca)
is_order_paint_sql = idwc_order_paint_name.describe("datawindow.table.select")

dw_4.getchild("paint_name", idwc_paint_name)
idwc_paint_name.insertrow(1)
idwc_paint_name.settransobject(sqlca)
is_paint_sql = idwc_paint_name.describe("datawindow.table.select")

dw_4.getchild("item_gubun", idwc_item_gubun)
idwc_item_gubun.insertrow(1)
idwc_item_gubun.settransobject(sqlca)
is_itemgubunsql = idwc_item_gubun.describe("datawindow.table.select")

dw_3.getchild("factory_name", idwc_fatcory_name)
idwc_fatcory_name.insertrow(1)
idwc_fatcory_name.settransobject(sqlca)
is_factorysql = idwc_fatcory_name.describe("datawindow.table.select")

dw_3.getchild("paint_name", idwc_paint)
idwc_paint.insertrow(1)
idwc_paint.settransobject(sqlca)
is_paintsql = idwc_paint_name.describe("datawindow.table.select")

pb_retrieve.triggerevent( clicked! )		

		
		

end event

event resize;call super::resize;//
long  iHeight

iHeight     = newheight - dw_1.y - gb_3.x

gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.height = newheight - dw_1.y - gb_3.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_3.width  = newwidth  - dw_1.width - st_vertical.width
dw_4.width  = newwidth  - dw_1.width - st_vertical.width
dw_4.height = dw_1.height - dw_3.height - st_horizontal.height - st_horizontal1.height

//st_horizontal.y      = dw_3.y + dw_3.height
st_horizontal.width  = dw_3.width

//st_horizontal1.y      = dw_4.y + dw_4.height
st_horizontal1.width  = dw_4.width

//tab_1.y      = st_horizontal.y + st_horizontal.height
//tab_1.width  = newwidth  - tab_1.x - gb_3.x
//tab_1.height = newheight - tab_1.y - gb_3.x
//
//tab_1.tabpage_2.dw_6.height = dw_1.height
//tab_1.tabpage_2.dw_7.height = dw_1.height
//tab_1.tabpage_3.dw_10.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_cditem_paint_m
integer x = 3680
integer y = 48
integer taborder = 100
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
			
string  ls_qa, ls_scene_code, ls_select_name, ls_select_tel, ls_sql
string  ls_chk_now, ls_chk_origin, ls_work
string ls_company_code, ls_company_name, ls_paint_name
long	l_project_code_seq, l_count, ll_count, l_personal_id


  if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return
	
	dw_3.accepttext()
	dw_4.AcceptText()
	
	l_status   = dw_3.getitemstatus(1, 0, primary!)
	
	ls_qa = trim(dw_3.getitemstring(1, "qa"))
	ls_paint_name = trim(dw_3.getitemstring(1, "paint_name"))	
		
	if isnull(ls_qa) or ls_qa = "" then
		MessageBox("입력오류","제품코드 필수 입력사항입니다!",stopsign!)
		dw_3.setcolumn('ls_qa')
		dw_3.setfocus()
		RETURN
      end if			
		
	if isnull(ls_paint_name) or ls_paint_name = "" then
		MessageBox("입력오류","제조사_도료명 필수 입력사항입니다!",stopsign!)
		dw_3.setcolumn('paint_name')
		dw_3.setfocus()
		RETURN
      end if					
	

	dw_4.AcceptText()
		
	for l_count = 1 to  dw_4.rowcount()
	
		IF isnull(dw_4.object.item_gubun[l_count]) or dw_4.object.item_gubun[l_count] = "" THEN
			messagebox("입력오류", "품목류는 필수 입력사항입니다.")
			dw_4.setcolumn('item_gubun')
			dw_4.setfocus()			
			return
		END IF		
		
		
		IF isnull(dw_4.object.order_paint_name[l_count]) or dw_4.object.order_paint_name[l_count] = "" THEN
			messagebox("입력오류", "지정_도료명 필수 입력사항입니다.")
			dw_4.setcolumn('order_paint_name')
			dw_4.setfocus()				
			return
		END IF				
		
		
//		IF isnull(dw_4.object.paint_name[l_count]) or dw_4.object.paint_name[l_count] = "" THEN
//			messagebox("입력오류", "대체_도료명 필수 입력사항입니다.")
//			dw_4.setcolumn('paint_name')
//			dw_4.setfocus()				
//			return
//		END IF				
		
		
		l_status = dw_4.GetItemStatus(l_count, 0, Primary!)
		
		if l_status = NewModified! OR  l_status = New! then			
			
		elseif l_status = DataModified! then			
							
		end if
		
	next

	
	ls_sql =   " SELECT  scene.scene_code,   " +&
				"                  scene.scene_desc    "		   +&			
				"     FROM scene   "

	ls_sql =  "datawindow.table.select = '" + ls_sql + "'"
	
	idwc_scene.modify(ls_sql)
	idwc_scene.SetTransObject(sqlca)
	idwc_scene.retrieve()
	
	idwc_order_paint_company.modify(is_order_com_paint_sql)
	idwc_order_paint_company.SetTransObject(sqlca)
	idwc_order_paint_company.retrieve()	
	
	idwc_paint_company.modify(is_com_paint_sql)
	idwc_paint_company.SetTransObject(sqlca)
	idwc_paint_company.retrieve()	
	
	idwc_order_paint_name.modify(is_order_paint_sql)
	idwc_order_paint_name.SetTransObject(sqlca)
	idwc_order_paint_name.retrieve()	
	
	idwc_paint_name.modify(is_paint_sql)
	idwc_paint_name.SetTransObject(sqlca)
	idwc_paint_name.retrieve()	
	
	idwc_item_gubun.modify(is_itemgubunsql)
	idwc_item_gubun.SetTransObject(sqlca)
	idwc_item_gubun.retrieve()
	
	idwc_paint.modify(is_paintsql)
	idwc_paint.SetTransObject(sqlca)
	idwc_paint.retrieve()			
	
	idwc_fatcory_name.modify(is_factorysql)
	idwc_fatcory_name.SetTransObject(sqlca)
	idwc_fatcory_name.retrieve()				

	if WF_Update2( dw_3, dw_4, 'Y' ) = true then
	end if			
	
	setpointer(hourglass!)
end event

type dw_1 from w_inheritance`dw_1 within w_cditem_paint_m
integer x = 27
integer y = 400
integer width = 3086
integer height = 2120
integer taborder = 10
string title = "d_item_paint_r"
string dataobject = "d_item_paint_r"
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//long   ll_row
//string ls_value
//
////dw_4.setredraw(false)
////dw_4.reset()
//tab_1.tabpage_1.dw_5.reset()
//tab_1.tabpage_2.dw_6.reset()
//
//ll_row   = this.getrow()
//if ll_row > 0 then
////	dw_4.retrieve(this.object.item_no[ll_row])
//end if
//
////dw_4.setredraw(true)
//
end event

event dw_1::clicked;call super::clicked;string  ls_scene_code, ls_retrieve, ls_sql
long 	 l_row = 0, ll_row, ll_FileLength, ll_fp = 32765, li_loops
Blob    lb_picture, lb_pictemp, blob_totalfile, blob_file, blob_null
int        li_FileFP,  i

is_dw = "dw_1"

if row = 0 then return

this.scrolltorow( row )

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//tab_1.tabpage_1.dw_5.reset()
//tab_1.tabpage_2.dw_6.reset()
//tab_1.tabpage_2.dw_7.reset()
//tab_1.tabpage_3.dw_10.reset()
//
is_item_no = this.object.item_no[row]
is_qa = this.object.qa[row]
	
ls_sql =   " SELECT  scene.scene_code,   " +&
			"                  scene.scene_desc    "		   +&			
			"     FROM scene   "

ls_sql =  "datawindow.table.select = '" + ls_sql + "'"

idwc_scene.modify(ls_sql)
idwc_scene.SetTransObject(sqlca)
idwc_scene.retrieve()

idwc_order_paint_company.modify(is_order_com_paint_sql)
idwc_order_paint_company.SetTransObject(sqlca)
idwc_order_paint_company.retrieve()	

idwc_paint_company.modify(is_com_paint_sql)
idwc_paint_company.SetTransObject(sqlca)
idwc_paint_company.retrieve()	

idwc_order_paint_name.modify(is_order_paint_sql)
idwc_order_paint_name.SetTransObject(sqlca)
idwc_order_paint_name.retrieve()	

idwc_paint_name.modify(is_paint_sql)
idwc_paint_name.SetTransObject(sqlca)
idwc_paint_name.retrieve()	

idwc_item_gubun.modify(is_itemgubunsql)
idwc_item_gubun.SetTransObject(sqlca)
idwc_item_gubun.retrieve()

idwc_paint.modify(is_paintsql)
idwc_paint.SetTransObject(sqlca)
idwc_paint.retrieve()		

idwc_fatcory_name.modify(is_factorysql)
idwc_fatcory_name.SetTransObject(sqlca)
idwc_fatcory_name.retrieve()

dw_3.retrieve(is_item_no, is_qa)
dw_4.retrieve(is_item_no, is_qa)	
end event

type st_title from w_inheritance`st_title within w_cditem_paint_m
integer x = 37
integer y = 40
integer width = 1120
integer height = 132
string text = "도료 관리 등록"
end type

type st_tips from w_inheritance`st_tips within w_cditem_paint_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditem_paint_m
boolean visible = false
integer x = 3104
integer y = 76
integer width = 160
integer height = 116
integer taborder = 190
boolean enabled = false
string picturename = "Custom008!"
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;
//wf_update1(dw_4, 'Y')
end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"저장",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cditem_paint_m
boolean visible = false
integer x = 4562
integer y = 84
integer width = 165
integer height = 120
integer taborder = 130
boolean enabled = false
end type

event pb_print_part::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_codere_str lst_code
w_repsuper w_print
st_print   l_print
string ls_sql, ls_where
long   l_dw4_rowcount, l_row, l_page, i

//dw_4.settransobject(sqlca)
//dw_4.retrieve(is_project_code)
//
//l_dw4_rowcount = dw_4.rowcount()
//
//if l_dw4_rowcount > 0 then
//	
//	l_row = mod(l_dw4_rowcount, 16)
//	l_page = round( l_dw4_rowcount / 16, 0)
//	
//	if l_row > 0 then	
//		l_page = l_page + 1		
//	else
//		l_page = l_page
//	end if
//
//else	
//	
//	l_page = 1
//	
//end if
//
//
//for i = 1 to (l_page*16 - l_dw4_rowcount)
//	dw_4.insertrow(0)
//next


//l_print.st_datawindow  = dw_4
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 수리이력을 출력합니다." 

//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//gs_print_control = 'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수리이력인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cditem_paint_m
integer x = 3872
integer y = 48
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditem_paint_m
boolean visible = false
integer x = 4951
integer y = 72
integer taborder = 60
boolean enabled = false
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_codere_str lst_code
w_repsuper w_print
st_print   l_print
string  ls_sql, ls_where, ls_path, ls_file
blob    lb_picture, blob_temp
LONG    ll_filelen, li_loop, i, l_dw4_rowcount, l_page, l_row
integer i_file
boolean l_ret

//openwithparm(w_whitem_w, lst_code)
//lst_code = message.powerobjectparm
//if lst_code.okcancel = 'N' then return
//
//if lst_code.flag = 'A' then
//	ls_sql = "datawindow.table.select = '" + is_dw3sql + "'"
//else
//	ls_where = " and item.item_no between ~~'" + lst_code.start_no + "~~' and " + &
//				  "~~'" + lst_code.end_no + "~~'"
//	ls_sql = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
//end if
//
//dw_3.settransobject(sqlca)
////dw_3.modify(ls_sql)
//
//
//if cbx_picture_check.checked then
//
//	SELECTBLOB photo 
//	 INTO :lb_picture 
//	 FROM equip 
//	WHERE equip_code = :is_project_code;
//	
//	if isnull(lb_picture) = false then
//		
//		ll_filelen = len(lb_picture)
//		
//		if ll_filelen > 32765 then
//			
//			if mod(ll_filelen,32765) = 0 then
//				  li_loop = ll_filelen / 32765
//			else
//				  li_loop = (ll_filelen/32765) + 1
//			end if
//			
//		else
//			li_loop = 1
//		end if
//		
//		ls_path = 'C:\BMP\EQUIP.JPG'
//		
//		l_ret = Filedelete(ls_path)	
//		
//		i_file = FileOpen(ls_path, StreamMode!, Write!, lockwrite!, append!)
//	
//		for i = 1 to li_loop
//			 if i = li_loop then
//					 blob_temp = BlobMid(lb_picture, (i - 1) * 32765 + 1)
//			 else
//					 blob_temp = BlobMid(lb_picture, (i - 1) * 32765 + 1,32765)
//			 end if
//			 FileWrite(i_file, blob_temp)
//		next
//		
//		Fileclose(i_file)
//		
//		dw_3.Modify("p_equip.filename = '"+ls_path+"'")
//	
//	else	
//		
//		ls_path = 'C:\BMP\YC_150X150.JPG'
//		
//		dw_3.Modify("p_equip.filename = '"+ls_path+"'")
//	end if
//
//else
//	
//	ls_path = 'C:\BMP\YC_150X150.JPG'
//	
//	dw_3.Modify("p_equip.filename = '"+ls_path+"'")	
//		
//end if

/*qrcodetst 작업 커스를 돌리고 */

//string ls_data
//
//
//ls_data = 'HD20180406-135' + &
//			'001PAWSST7K00080X0120X0045X0258001000' + &
//			'002PAWSST7K00080X0120X0045X0258001000' + &
//			'003PAWSST7K00080X0120X0045X0258001000' + &
//			'004PAWSST7K00080X0120X0045X0258001000' + &
//			'005PAWSST7K00080X0120X0045X0258001000' + &
//			'006PAWSST7K00080X0120X0045X0258001000' + &
//			'007PAWSST7K00080X0120X0045X0258001000' + &
//			'008PAWSST7K00080X0120X0045X0258001000' + &			
//			'009PAWSST7K00080X0120X0045X0258001000' + &
//			'010PAWSST7K00080X0120X0045X0258001000' 
//
//select replace(:ls_data,' ', '')  
//into :ls_data  
//from login where user_id = '1999010s';			


// 왠만하면 이걸 쓰는게 좋음. 제한 조건 6개 제품, 읽을때, 빈공간 없어야함.
//gf_qrcode_create('labelqrcode',ls_data)



//	사전에 qrtext.txt 처리 로직을 만들어야한다. 
//	1. qrtext.txt파일 없으면 생성. 위치는 qrtext.txt
//	2. qrcode.bmp 생성.
//	3. sdpIkhyeon.DLL 없으면 포함.
	
//	sdp_QRCodeCreate2()	
	



//dw_3.retrieve(is_project_code)

//if dw_3.rowcount() < 1 then return

//dw_4.retrieve(is_equip_code)
//
//
//l_dw4_rowcount = dw_4.rowcount()
//
//if l_dw4_rowcount > 0 then
//	l_row = mod(l_dw4_rowcount, 17)
//	l_page = round( l_dw4_rowcount / 17, 0)
//	
//end if

//l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 설비카드를 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//gs_print_control = 'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_cditem_paint_m
boolean visible = false
integer x = 2702
integer taborder = 230
end type

type pb_delete from w_inheritance`pb_delete within w_cditem_paint_m
boolean visible = false
integer x = 4754
integer y = 72
integer taborder = 40
boolean enabled = false
end type

event pb_delete::clicked;dwItemStatus l_status
DataWindow dw5, dw6, dw7, dw8, dw10
string ls_select_name, ls_select_tel, ls_scene_code, ls_personal_id
long   l_personal_id, ll_count, ll_row, l_rowcount
string  ls_chk_origin, ls_chk_now

//dw5 = tab_1.tabpage_1.dw_5
//dw6 = tab_1.tabpage_2.dw_6
//dw7 = tab_1.tabpage_2.dw_7		
//dw8 = tab_1.tabpage_2.dw_8
//dw10 = tab_1.tabpage_3.dw_10
//
//tab_1.tabpage_1.dw_5.accepttext()
//
//l_status = tab_1.tabpage_1.dw_5.getitemstatus(1, 0, primary!)
//
//
//if l_status = new! or l_status = newmodified! then
//	
//elseif messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
//	
//	if i_tabpage = 1 then
//		
//		ls_scene_code = dw5.object.scene_code[1]
//				
//		dw5.deleterow(0)		
//		
//		l_rowcount = dw6.rowcount()
//		
//		l_rowcount = dw8.retrieve( ls_scene_code, '%')
//
//		FOR ll_count = 1 TO  l_rowcount
//			dw8.deleterow(0)
//		NEXT		
//	
//
//		for ll_count = 1 to  dw10.rowcount()			
//			
//			ls_chk_origin = dw10.GetItemstring(ll_count, "chk", Primary!, TRUE) 									
//			
//			if ls_chk_origin = 'Y' then		
//				MessageBox("오류", "이력등록" + string(ll_count) + "행은 이미확정되어 삭제 할 수 없습니다.",stopsign!)
//				return 0
//			end if
//		next			
//		
//		l_rowcount = dw10.rowcount()		
//		FOR ll_count = 1 TO  l_rowcount
//			dw10.deleterow(0)
//		NEXT		
//		
//		if WF_Update3(dw5, dw8, dw10,  'Y' ) = true then
//			
//		end if
//		
//		dw5.reset()
//		dw6.reset()
//		dw7.reset()
//		dw10.reset()		
//				
//	elseif i_tabpage = 3 then
//
//		l_status = dw10.GetItemStatus(ll_count, 0, Primary!)					
//		
//		setpointer(hourglass!)
//		
//		dw10.AcceptText()
//		
//		ls_chk_origin = dw10.GetItemstring(dw10.getrow(), "chk", Primary!, TRUE) 									
//		
//		if isnull(ls_chk_origin) then
//			ls_chk_origin = 'N'
//		end if
//		
//		if ls_chk_origin <> 'Y' then		
//			dw10.deleterow(dw10.getrow())
//		else
//			MessageBox("오류", "이력등록" + string(dw10.getrow()) + "행은 이미확정되어 삭제 할 수 없습니다.",stopsign!)
//		end if
//		
//		if WF_Update1( dw10,  'Y' ) = true then
//			
//		end if						
//				
//	end if
//	
//end if		
//	
//
//return 1
//
end event

type pb_insert from w_inheritance`pb_insert within w_cditem_paint_m
integer x = 3488
integer taborder = 30
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;call super::clicked;long ll_row, l_seq

//if dw_1.rowcount() < 1 then return

//tab_1.tabpage_1.dw_5.ReSet()
//tab_1.tabpage_2.dw_6.ReSet()
//tab_1.tabpage_2.dw_7.ReSet()
//tab_1.tabpage_3.dw_10.Reset()

//if i_tabpage = 1 then
//	
	dw_3.ReSet()	
	
	ll_row = dw_3.InsertRow(0)	
	dw_3.setfocus()
	dw_3.setrow(ll_row)
	dw_3.setcolumn('item_no')
//	
//	
//elseif i_tabpage = 3 then	
//	
//
//	ll_row= tab_1.tabpage_3.dw_10.InsertRow(1)
//	
//	tab_1.tabpage_3.dw_10.object.item_no[ll_row] = is_item_no // is_equip_code 는 dw_1 click 받는다.
//	tab_1.tabpage_3.dw_10.object.qa[ll_row] = is_qa // is_equip_code 는 dw_1 click 받는다.
//	tab_1.tabpage_3.dw_10.setrow(ll_row)
//	tab_1.tabpage_3.dw_10.setcolumn('paint_name')
//	tab_1.tabpage_3.dw_10.setfocus()	
//		
//end if	
//	
//
//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditem_paint_m
integer x = 3296
integer taborder = 250
end type

event pb_retrieve::clicked;string ls_con_code, ls_yn


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()

dw_1.setfilter('')
dw_1.filter()
//tab_1.tabpage_1.dw_5.reset()
//tab_1.tabpage_2.dw_6.reset()
//tab_1.tabpage_3.dw_10.reset()
//tab_1.tabpage_4.dw_11.reset()
//tab_1.tabpage_5.dw_12.reset()
//
dw_1.retrieve()

if dw_1.rowcount() < 1 then return

dw_1.scrolltorow(1)
end event

type gb_3 from w_inheritance`gb_3 within w_cditem_paint_m
integer x = 32
integer y = 224
integer width = 4434
integer height = 160
integer taborder = 170
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_cditem_paint_m
boolean visible = false
integer x = 1422
integer y = 200
integer width = 2130
integer height = 192
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
long backcolor = 81838264
string text = "출처"
end type

type gb_1 from w_inheritance`gb_1 within w_cditem_paint_m
integer x = 3278
integer width = 827
integer taborder = 0
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_cditem_paint_m
boolean visible = false
integer x = 1449
integer y = 40
integer width = 119
integer height = 88
integer taborder = 160
boolean enabled = false
boolean vscrollbar = false
end type

type st_4 from statictext within w_cditem_paint_m
integer x = 73
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_cditem_paint_m
integer x = 261
integer y = 276
integer width = 480
integer height = 632
integer taborder = 260
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

type ddlb_dwtitles from dropdownlistbox within w_cditem_paint_m
integer x = 265
integer y = 284
integer width = 311
integer height = 88
integer taborder = 280
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

type st_5 from statictext within w_cditem_paint_m
integer x = 777
integer y = 292
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

type sle_value from singlelineedit within w_cditem_paint_m
integer x = 1266
integer y = 284
integer width = 567
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_cditem_paint_m
integer x = 1847
integer y = 284
integer width = 160
integer height = 76
integer taborder = 210
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_3" then
	arg_dw  = dw_3	
elseif is_dw = "dw_4" then	
	arg_dw  = dw_4
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_cditem_paint_m
integer x = 2011
integer y = 284
integer width = 160
integer height = 76
integer taborder = 220
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_3" then
	arg_dw  = dw_3	
elseif is_dw = "dw_4" then	
	arg_dw  = dw_4
end if

GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_cditem_paint_m
integer x = 2176
integer y = 284
integer width = 160
integer height = 76
integer taborder = 240
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_3" then
	arg_dw  = dw_3	
elseif is_dw = "dw_4" then	
	arg_dw  = dw_4
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_cditem_paint_m
integer x = 2341
integer y = 284
integer width = 160
integer height = 76
integer taborder = 270
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
elseif is_dw = "dw_3" then
	arg_dw  = dw_3	
elseif is_dw = "dw_4" then	
	arg_dw  = dw_4
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_cditem_paint_m
event mousemove pbm_mousemove
string tag = "파일"
boolean visible = false
integer x = 2487
integer y = 52
integer width = 187
integer height = 144
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "CrossTab!"
alignment htextalign = right!
string powertiptext = "파일로저장시킵니다."
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

if GF_Permission('물품코드관리자', gs_userid) = 'Y' then
else
	MessageBox("확인","물품코드 관리자만 내보내기 작업을 할 수 잇습니다.")
	RETURN
end if

if is_dw = "dw_1" then
	ldw_sel = dw_1
else
	//ldw_sel = dw_4
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

type st_vertical from u_splitbar_vertical within w_cditem_paint_m
integer x = 3127
integer y = 408
integer height = 2120
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = this.x + this.width
//st_horizontal.width = dw_4.width

end event

type st_horizontal from u_splitbar_horizontal within w_cditem_paint_m
integer x = 3150
integer y = 404
integer width = 2213
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cditem_paint_m
integer x = 951
integer y = 280
integer width = 306
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type cbx_picture_check from checkbox within w_cditem_paint_m
boolean visible = false
integer x = 2853
integer y = 124
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "사진조회,출력"
boolean checked = true
end type

type dw_3 from datawindow within w_cditem_paint_m
integer x = 3150
integer y = 428
integer width = 6007
integer height = 368
integer taborder = 71
boolean bringtotop = true
string title = "d_item_paint_m"
string dataobject = "d_item_paint_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_data, ls_item_name
long ll_row1, ll_found

is_dw = "dw_3"

choose case dwo.name
	case 'item_no'

		this.getchild("item_no", idwc_item)
		idwc_item.settransobject(sqlca)
		
		ls_data = data
  	     ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_item_name = idwc_item.getitemstring(idwc_item.getrow(), "item_name")
		this.object.item_name[this.getrow()] = ls_item_name


//	case 'l2'
//		  if isnumber(ls_l2) then
//			  ls_l2 = '00000' + ls_l2
//			  ls_l2 = right(ls_l2,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l2[1] = ls_l2
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l3'
//		  if isnumber(ls_l3) then
//			  ls_l3 = '00000' + ls_l3
//			  ls_l3 = right(ls_l3,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l3[1] = ls_l3
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l4'
//		  	if dw_1.object.qa_rule[dw_1.getrow()] = 'Y' then // 표준규격
//			   if isnumber(ls_l4) then
//				   ls_l4 = '00000' + ls_l4
//				   ls_l4 = right(ls_l4,5)
//				   this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//				   this.object.l4[1] = ls_l4
//			   else
//			 	  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			 	  return	1		
//			   end if
//			   ls_qa1 = this.object.qa[1]
//			else
//				this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + trim(ls_l4)
//			   this.object.l4[1] = trim(ls_l4)
//		  end if
end choose

end event

event itemerror;//string ls_data,ls_item
//
//setnull(ls_data)
//choose case dwo.name
//	case 'target_item'
//        this.object.target_item[row] = ls_data
//	case 'target_qa'
//		  this.object.target_qa[row] = ls_data
//end choose
//
//return 2
end event

event losefocus;//IF THIS.ROWCOUNT() < 1 THEN RETURN
//this.accepttext()
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//
end event

event retrieveend;//this.accepttext()
//
//if this.getrow() > 0 then
//	ist_item.loc_no = this.object.loc_no[1]
//	ist_item.count_code = this.object.count_code[1]
//	ist_item.obsolete_code = this.object.obsolete_code[1]
//	ist_item.lot = this.object.lot[1]
//	ist_item.leadtime = this.object.leadtime[1]
//	ist_item.reorder = this.object.reorder[1]
//	ist_item.safety_stock = this.object.safety_stock[1]
//end if
end event

type dw_4 from datawindow within w_cditem_paint_m
integer x = 3150
integer y = 812
integer width = 5998
integer height = 1720
integer taborder = 81
boolean bringtotop = true
string title = "d_item_paint_m"
string dataobject = "d_item_paint_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_data, ls_cust_name, ls_scene_name, ls_sql
long ll_row1, ll_found

is_dw = "dw_4"

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

this.accepttext()
if row < 1 then return

choose case dwo.name
	case 'customer_cust_no'

		this.getchild("customer_cust_no", idwc_cust)
		idwc_cust.settransobject(sqlca)
		
		ls_data = data
  	     ll_row1 = idwc_cust.RowCount( )
		ll_found = idwc_cust.Find("cust_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_cust_name = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")
		this.object.cust_name[this.getrow()] = ls_cust_name
		
		ls_sql =   " SELECT  scene.scene_code,   " +&
					"                  scene.scene_desc    "		   +&			
					"     FROM scene   " 	   +&			
					" where scene.cust_no =  ~~'" + ls_data + "~~'"
		
		ls_sql =  "datawindow.table.select = '" + ls_sql + "'"
		
		idwc_scene.modify(ls_sql)
		idwc_scene.retrieve()		
		
	case 'scene_code'

		this.getchild("scene_code", idwc_scene)
		idwc_scene.settransobject(sqlca)
		
		ls_data = data
  	     ll_row1 = idwc_scene.RowCount( )
		ll_found = idwc_scene.Find("scene_code = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		ls_scene_name = idwc_scene.getitemstring(idwc_scene.getrow(), "scene_desc")
		this.object.scene_scene_desc[row] = ls_scene_name		

//	case 'l2'
//		  if isnumber(ls_l2) then
//			  ls_l2 = '00000' + ls_l2
//			  ls_l2 = right(ls_l2,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l2[1] = ls_l2
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l3'
//		  if isnumber(ls_l3) then
//			  ls_l3 = '00000' + ls_l3
//			  ls_l3 = right(ls_l3,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l3[1] = ls_l3
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l4'
//		  	if dw_1.object.qa_rule[dw_1.getrow()] = 'Y' then // 표준규격
//			   if isnumber(ls_l4) then
//				   ls_l4 = '00000' + ls_l4
//				   ls_l4 = right(ls_l4,5)
//				   this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//				   this.object.l4[1] = ls_l4
//			   else
//			 	  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			 	  return	1		
//			   end if
//			   ls_qa1 = this.object.qa[1]
//			else
//				this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + trim(ls_l4)
//			   this.object.l4[1] = trim(ls_l4)
//		  end if
end choose
//
end event

event itemerror;//string ls_data,ls_item
//
//setnull(ls_data)
//choose case dwo.name
//	case 'target_item'
//        this.object.target_item[row] = ls_data
//	case 'target_qa'
//		  this.object.target_qa[row] = ls_data
//end choose
//
//return 2
end event

event losefocus;//IF THIS.ROWCOUNT() < 1 THEN RETURN
//this.accepttext()
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//
end event

event retrieveend;//this.accepttext()
//
//if this.getrow() > 0 then
//	ist_item.loc_no = this.object.loc_no[1]
//	ist_item.count_code = this.object.count_code[1]
//	ist_item.obsolete_code = this.object.obsolete_code[1]
//	ist_item.lot = this.object.lot[1]
//	ist_item.leadtime = this.object.leadtime[1]
//	ist_item.reorder = this.object.reorder[1]
//	ist_item.safety_stock = this.object.safety_stock[1]
//end if
end event

type st_horizontal1 from u_splitbar_horizontal within w_cditem_paint_m
integer x = 3150
integer y = 788
integer width = 2213
boolean bringtotop = true
end type

type pb_2 from picturebutton within w_cditem_paint_m
integer x = 3493
integer y = 252
integer width = 169
integer height = 112
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

dw_3.accepttext()

ll_row = dw_4.InsertRow(0)	
dw_4.setfocus()
dw_4.setrow(ll_row)
dw_4.object.item_no[ll_row] = dw_3.object.item_no[1]
dw_4.object.qa[ll_row] = dw_3.object.qa[1]	
dw_4.setcolumn('customer_cust_no')
end event

type pb_3 from picturebutton within w_cditem_paint_m
integer x = 3671
integer y = 252
integer width = 169
integer height = 112
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

dw_4.deleterow(dw_4.getrow())	

end event

