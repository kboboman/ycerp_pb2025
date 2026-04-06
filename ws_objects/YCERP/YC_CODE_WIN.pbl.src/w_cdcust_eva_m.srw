$PBExportHeader$w_cdcust_eva_m.srw
$PBExportComments$도료관리등록(2019/07/16- 조원석)
forward
global type w_cdcust_eva_m from w_inheritance
end type
type pb_1 from picturebutton within w_cdcust_eva_m
end type
type st_vertical from u_splitbar_vertical within w_cdcust_eva_m
end type
type dw_3 from datawindow within w_cdcust_eva_m
end type
type dw_4 from datawindow within w_cdcust_eva_m
end type
type st_horizontal from u_splitbar_horizontal within w_cdcust_eva_m
end type
type em_1 from editmask within w_cdcust_eva_m
end type
type st_7 from statictext within w_cdcust_eva_m
end type
type dw_5 from datawindow within w_cdcust_eva_m
end type
type ddlb_bungi from dropdownlistbox within w_cdcust_eva_m
end type
type st_1 from statictext within w_cdcust_eva_m
end type
type st_3 from statictext within w_cdcust_eva_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdcust_eva_m
end type
type ddlb_fld from dropdownlistbox within w_cdcust_eva_m
end type
type st_4 from statictext within w_cdcust_eva_m
end type
type ddlb_op from dropdownlistbox within w_cdcust_eva_m
end type
type sle_value from singlelineedit within w_cdcust_eva_m
end type
type cbx_op from checkbox within w_cdcust_eva_m
end type
type cb_1 from commandbutton within w_cdcust_eva_m
end type
type cb_2 from commandbutton within w_cdcust_eva_m
end type
type cb_3 from commandbutton within w_cdcust_eva_m
end type
type cb_5 from commandbutton within w_cdcust_eva_m
end type
type rb_1 from radiobutton within w_cdcust_eva_m
end type
type rb_2 from radiobutton within w_cdcust_eva_m
end type
end forward

global type w_cdcust_eva_m from w_inheritance
integer width = 8439
integer height = 2876
string title = "영업거래선평가관리(w_cdcust_eva_m)"
long backcolor = 79219928
pb_1 pb_1
st_vertical st_vertical
dw_3 dw_3
dw_4 dw_4
st_horizontal st_horizontal
em_1 em_1
st_7 st_7
dw_5 dw_5
ddlb_bungi ddlb_bungi
st_1 st_1
st_3 st_3
ddlb_dwtitles ddlb_dwtitles
ddlb_fld ddlb_fld
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cbx_op cbx_op
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
rb_1 rb_1
rb_2 rb_2
end type
global w_cdcust_eva_m w_cdcust_eva_m

type variables
gs_item ist_item
string  is_dw, is_dw1sql, is_dw3sql, is_project_code, is_item_no, is_qa, is_scenesql, is_custsql, is_itemsql
string  is_com_paint_sql, is_order_com_paint_sql, is_order_paint_sql, is_paint_sql, is_paintsql, is_factorysql, is_itemgubunsql
string  is_bungi, is_yyyy
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

on w_cdcust_eva_m.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.st_vertical=create st_vertical
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_horizontal=create st_horizontal
this.em_1=create em_1
this.st_7=create st_7
this.dw_5=create dw_5
this.ddlb_bungi=create ddlb_bungi
this.st_1=create st_1
this.st_3=create st_3
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_fld=create ddlb_fld
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_vertical
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.st_horizontal
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.dw_5
this.Control[iCurrent+9]=this.ddlb_bungi
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cbx_op
this.Control[iCurrent+18]=this.cb_1
this.Control[iCurrent+19]=this.cb_2
this.Control[iCurrent+20]=this.cb_3
this.Control[iCurrent+21]=this.cb_5
this.Control[iCurrent+22]=this.rb_1
this.Control[iCurrent+23]=this.rb_2
end on

on w_cdcust_eva_m.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.st_vertical)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_horizontal)
destroy(this.em_1)
destroy(this.st_7)
destroy(this.dw_5)
destroy(this.ddlb_bungi)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_fld)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.rb_1)
destroy(this.rb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_sql, ls_where, ls_item, ls_sqlerrtext
long l_length
////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_3 )
st_vertical.of_set_rightobject( dw_1 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_3)
st_horizontal.of_set_topobject( dw_1)
st_horizontal.of_set_bottomobject( dw_4)
st_horizontal.of_set_minsize(250, 250)

////////////////////////////////////////////////////////////////////////////////////////////
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_3.reset()
dw_3.InsertRow(0)

dw_5.InsertRow(0)

dw_4.insertrow(0)

em_1.text = string(today(),'yyyy/mm/dd')
is_yyyy =  trim(em_1.text)

pb_retrieve.triggerevent( clicked! )		

		
		

end event

event resize;call super::resize;////
//long  iHeight
//
//iHeight     = newheight - dw_1.y - gb_3.x
//
gb_3.width  = newwidth  - (gb_3.x * 2)
//
//dw_1.height = newheight - dw_1.y - gb_3.x
//
//st_vertical.x      = dw_1.x + dw_1.width
//st_vertical.height = dw_1.height
//
//dw_3.width  = newwidth  - dw_1.width - st_vertical.width
dw_4.width  = newwidth  - st_vertical.width
dw_4.height = newheight - st_horizontal.height 
//
//st_horizontal.width  = dw_3.width

end event

type pb_save from w_inheritance`pb_save within w_cdcust_eva_m
integer x = 5879
integer y = 40
integer taborder = 100
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
long l_count1, l_count2, l_count
decimal l_value
string ls_eva_code, ls_cust_no
string ls_eva_code1
			
ls_cust_no = dw_5.object.cust_no[1]

  if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return
	
	dw_3.accepttext()
	dw_4.AcceptText()
	
		
	dw_4.AcceptText()
		
	for l_count1 = 1 to  10
		
		ls_eva_code1 = trim(string(l_count1,'00'));
	
		delete cust_eva
		where yyyy = :is_yyyy
		and bungi = :is_bungi
		and cust_no = :ls_cust_no
		and eva_code like :ls_eva_code1+'%';		
		
		for l_count2 = 1 to 9
				ls_eva_code = trim(string(l_count1,'00')) + trim(string(l_count2,'00'))
				if trim(dw_4.getitemstring(1, "eva_code"+  ls_eva_code ))	 = '1' then
					
					l_count = 0
					select count(*)
					into :l_count
					from cust_eva
					where yyyy = :is_yyyy
					and bungi = :is_bungi
					and cust_no = :ls_cust_no
					and eva_code = :ls_eva_code;
					
					if l_count = 0 then
						
						select weight
						 into :l_value
						from eva_code
						where eva_code = :ls_eva_code;
						
					
						insert into  cust_eva
						values (:is_yyyy, :is_bungi, :ls_cust_no, :ls_eva_code, :l_value, null);

					
					end if
					
				end if 
		next
			
	next
	
setpointer(hourglass!)

commit;

messagebox('알림', '저장되었습니다.')
end event

type dw_1 from w_inheritance`dw_1 within w_cdcust_eva_m
integer x = 3474
integer y = 340
integer width = 4549
integer height = 368
integer taborder = 10
string title = "d_item_paint_r"
string dataobject = "d_cdcust_eva_r2"
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

type st_title from w_inheritance`st_title within w_cdcust_eva_m
integer x = 37
integer y = 40
integer width = 1175
integer height = 132
string text = "영업 거래선 평가관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcust_eva_m
integer x = 5051
integer y = 208
end type

type pb_compute from w_inheritance`pb_compute within w_cdcust_eva_m
boolean visible = false
integer x = 4631
integer y = 176
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

type pb_print_part from w_inheritance`pb_print_part within w_cdcust_eva_m
boolean visible = false
integer x = 4233
integer y = 172
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

type pb_close from w_inheritance`pb_close within w_cdcust_eva_m
integer x = 6254
integer y = 40
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcust_eva_m
integer x = 6066
integer y = 40
integer taborder = 60
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

l_print.st_datawindow  = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 설비카드를 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4

if rb_2.checked then
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=67'
else
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=62'
end if
//gs_print_control = 'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcust_eva_m
boolean visible = false
integer x = 4850
integer y = 176
integer taborder = 230
end type

type pb_delete from w_inheritance`pb_delete within w_cdcust_eva_m
integer x = 5696
integer y = 40
integer taborder = 40
end type

event pb_delete::clicked;dwItemStatus l_status
DataWindow dw5, dw6, dw7, dw8, dw10

string ls_cust_no

ls_cust_no = dw_5.object.cust_no[1]

dw_4.accepttext()

l_status = dw_4.getitemstatus(1, 0, primary!)

//if l_status = new! or l_status = newmodified! then
	
if messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then

	delete cust_eva
	where yyyy = :is_yyyy
	and bungi = :is_bungi
	and cust_no = :ls_cust_no;		

end if		

pb_retrieve.triggerevent(clicked!)

return 1
//
end event

type pb_insert from w_inheritance`pb_insert within w_cdcust_eva_m
integer x = 5504
integer y = 40
integer taborder = 30
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;call super::clicked;long ll_row, l_seq, l_count1, l_count2
string ls_eva_code, ls_value

	dw_4.ReSet()	
	
	ll_row = dw_4.InsertRow(0)	


	for l_count1 = 1 to  10
		
		for l_count2 = 1 to 9
				ls_eva_code = trim(string(l_count1,'00')) + trim(string(l_count2,'00'))
				dw_4.Modify("eva_code"+  ls_eva_code + '.background.color = 134217750' )
		next
			
	next	
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcust_eva_m
integer x = 5312
integer y = 40
integer taborder = 250
end type

event pb_retrieve::clicked;string ls_cust_no, ls_eva_code
string ls_value
long l_count1, l_count2

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_cust_no = dw_5.object.cust_no[1]

//dw_4.reset()

//tab_1.tabpage_1.dw_5.reset()
//tab_1.tabpage_2.dw_6.reset()
//tab_1.tabpage_3.dw_10.reset()
//tab_1.tabpage_4.dw_11.reset()
//tab_1.tabpage_5.dw_12.reset()

dw_3.reset()
dw_1.reset()

dw_3.retrieve(ls_cust_no)
dw_1.retrieve(ls_cust_no)

if dw_3.rowcount() < 1 then 
	dw_3.insertrow(0) 
end if

IF RB_1.CHECKED THEN
	
	dw_4.insertrow(0) 
	
	for l_count1 = 1 to  10
		
		for l_count2 = 1 to 9
				ls_eva_code = trim(string(l_count1,'00')) + trim(string(l_count2,'00'))
				
				ls_value = '0'
				
				select case when isnull(value,0) = 0  then '0' else '1' end
				into :ls_value
				from cust_eva
				where yyyy = :is_yyyy
				and bungi = :is_bungi
				and cust_no = :ls_cust_no
				and eva_code = :ls_eva_code;
				
				if isnull(ls_value)  or ls_value = '' then
					ls_value = '0'
				end if
					
					
				dw_4.setitem( 1, 'eva_code'+ls_eva_code, ls_value )	
					
				if ls_value = '1' then
					dw_4.Modify('eva_code' + ls_eva_code + '.background.color = 16711680' )					
				else
					dw_4.Modify("eva_code"+  ls_eva_code + '.background.color = 134217750' )
				end if	
	
		next
			
	next	
	
ELSE
	
	dw_4.retrieve(is_yyyy, is_bungi)	
	
END IF


end event

type gb_3 from w_inheritance`gb_3 within w_cdcust_eva_m
integer x = 41
integer y = 180
integer width = 4123
integer height = 160
integer taborder = 170
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_cdcust_eva_m
boolean visible = false
integer x = 1275
integer y = 28
integer width = 3986
integer height = 160
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
long backcolor = 81838264
end type

type gb_1 from w_inheritance`gb_1 within w_cdcust_eva_m
integer x = 5294
integer y = 0
integer width = 1550
integer taborder = 0
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_cdcust_eva_m
boolean visible = false
integer x = 5339
integer y = 232
integer width = 105
integer height = 88
integer taborder = 160
boolean enabled = false
boolean vscrollbar = false
end type

type pb_1 from picturebutton within w_cdcust_eva_m
event mousemove pbm_mousemove
string tag = "파일"
boolean visible = false
integer x = 4421
integer y = 172
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

type st_vertical from u_splitbar_vertical within w_cdcust_eva_m
integer x = 3456
integer y = 336
integer height = 376
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = this.x + this.width
//st_horizontal.width = dw_4.width

end event

type dw_3 from datawindow within w_cdcust_eva_m
integer x = 27
integer y = 340
integer width = 3424
integer height = 368
integer taborder = 71
boolean bringtotop = true
string title = "d_item_paint_m"
string dataobject = "d_cdcust_eva_r1"
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

type dw_4 from datawindow within w_cdcust_eva_m
integer x = 27
integer y = 736
integer width = 8005
integer height = 1936
integer taborder = 81
boolean bringtotop = true
string title = "d_item_paint_m"
string dataobject = "d_cdcust_eva_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_eva_code, ls_cust_no
long l_count2



this.accepttext()
if row < 1 then return

IF MidA(dwo.name, 1,8) = 'eva_code'  THEN

		for l_count2 = 1 to 9
			
				ls_eva_code = MidA(dwo.name, 9,2) + trim(string(l_count2,'00'))

				dw_4.setitem(1, "eva_code"+  ls_eva_code, '0' )
				dw_4.Modify("eva_code"+  ls_eva_code + '.background.color = 134217750' )

		next		
		
		if data = '1' then
			dw_4.Modify(dwo.name + '.background.color = 16711680' )
		else			
			dw_4.Modify(dwo.name + '.background.color = 134217750' )
		end if
	
END IF
	

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

event clicked;string ls_cust_no

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if rb_2.checked then
	
	ls_cust_no = this.object.cust_eva_cust_no[row]
	
	dw_3.retrieve(ls_cust_no)
	dw_1.retrieve(ls_cust_no)
	
end if
end event

type st_horizontal from u_splitbar_horizontal within w_cdcust_eva_m
integer x = 27
integer y = 712
integer width = 8005
boolean bringtotop = true
end type

type em_1 from editmask within w_cdcust_eva_m
integer x = 1655
integer y = 80
integer width = 261
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
boolean spin = true
string displaydata = " "
string minmax = "1990~~2100"
end type

event modified;is_yyyy =  trim(this.text)

end event

type st_7 from statictext within w_cdcust_eva_m
integer x = 1326
integer y = 80
integer width = 315
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "해당년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_cdcust_eva_m
integer x = 2903
integer y = 72
integer width = 2336
integer height = 104
integer taborder = 180
boolean bringtotop = true
string title = "none"
string dataobject = "d_custddw_c"
boolean border = false
end type

event itemchanged;datawindowchild ldwc_cust
string ls_cust_no, ls_cust_name

dw_3.reset()
dw_4.reset()

choose case dwo.name
	case 'cust_no'
		this.getchild("cust_no", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		ls_cust_name = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_name")
		this.object.cust_name[1] = ls_cust_name
		this.object.cust_no[1] = ls_cust_no
		
	case 'cust_name'
		this.getchild("cust_name", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		this.object.cust_no[1] = ls_cust_no
end choose

pb_retrieve.triggerevent(clicked!)
end event

type ddlb_bungi from dropdownlistbox within w_cdcust_eva_m
integer x = 2263
integer y = 80
integer width = 617
integer height = 432
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
string item[] = {"1분기","2분기","상반기","3분기","4분기","하반기"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if trim(this.text) = '1분기' then
	is_bungi = 'A'
elseif trim(this.text) = '2분기' then
	is_bungi = 'B'	
elseif trim(this.text) = '상반기' then
	is_bungi = 'C'	
elseif trim(this.text) = '3분기' then
	is_bungi = 'D'	
elseif trim(this.text) = '4분기' then
	is_bungi = 'E'	
elseif trim(this.text) = '하반기' then
	is_bungi = 'F'	
end if
end event

type st_1 from statictext within w_cdcust_eva_m
integer x = 1943
integer y = 80
integer width = 315
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "분기"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_cdcust_eva_m
integer x = 105
integer y = 244
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type ddlb_dwtitles from dropdownlistbox within w_cdcust_eva_m
integer x = 315
integer y = 236
integer width = 311
integer height = 88
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

type ddlb_fld from dropdownlistbox within w_cdcust_eva_m
integer x = 283
integer y = 224
integer width = 443
integer height = 632
integer taborder = 240
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

type st_4 from statictext within w_cdcust_eva_m
integer x = 754
integer y = 240
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

type ddlb_op from dropdownlistbox within w_cdcust_eva_m
integer x = 923
integer y = 224
integer width = 274
integer height = 512
integer taborder = 250
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

type sle_value from singlelineedit within w_cdcust_eva_m
integer x = 1216
integer y = 232
integer width = 535
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cbx_op from checkbox within w_cdcust_eva_m
integer x = 1765
integer y = 244
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type cb_1 from commandbutton within w_cdcust_eva_m
integer x = 1966
integer y = 232
integer width = 146
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;// 필터(다중필터 추가)
// OPEN Event : GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
// 해지 Click : GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
// cbx_op Control 추가 
// 필터 Click Script 아래 Script로 변경

datawindow arg_dw
integer    li_ret

arg_dw  = dw_4

string     ls_column, ls_value, ls_col, ls_type, ls_op
ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_2 from commandbutton within w_cdcust_eva_m
integer x = 2117
integer y = 232
integer width = 146
integer height = 76
integer taborder = 190
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

arg_dw  = dw_4


GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cdcust_eva_m
integer x = 2267
integer y = 232
integer width = 146
integer height = 76
integer taborder = 200
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

arg_dw  = dw_4

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdcust_eva_m
integer x = 2418
integer y = 232
integer width = 146
integer height = 76
integer taborder = 210
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

arg_dw  = dw_4

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type rb_1 from radiobutton within w_cdcust_eva_m
integer x = 3259
integer y = 236
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "평가"
boolean checked = true
end type

event clicked;dw_4.dataobject = 'd_cdcust_eva_m'

dw_4.settrans( sqlca )

dw_4.reset()
dw_3.reset()
dw_1.reset()

dw_3.insertrow(0)
dw_4.insertrow(0)

pb_insert.visible = true
pb_save.visible = true
pb_delete.visible = true
dw_5.visible = true


end event

type rb_2 from radiobutton within w_cdcust_eva_m
integer x = 3575
integer y = 236
integer width = 297
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "조회"
end type

event clicked;dw_4.dataobject = 'd_cdcust_eva_r3'
dw_4.settrans( sqlca )

dw_3.reset()
dw_1.reset()

dw_3.insertrow(0)

pb_insert.visible = false
pb_save.visible = false
pb_delete.visible = false
dw_5.visible = false

end event

