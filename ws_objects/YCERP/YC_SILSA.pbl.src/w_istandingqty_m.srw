$PBExportHeader$w_istandingqty_m.srw
$PBExportComments$상비재고(2019/07/01,조원석)
forward
global type w_istandingqty_m from w_inheritance
end type
type dw_3 from datawindow within w_istandingqty_m
end type
type st_1 from statictext within w_istandingqty_m
end type
type dw_5 from datawindow within w_istandingqty_m
end type
type st_3 from statictext within w_istandingqty_m
end type
type ddlb_fld from dropdownlistbox within w_istandingqty_m
end type
type ddlb_dwtitles from dropdownlistbox within w_istandingqty_m
end type
type st_2 from statictext within w_istandingqty_m
end type
type ddlb_op from dropdownlistbox within w_istandingqty_m
end type
type sle_value from singlelineedit within w_istandingqty_m
end type
type cb_2 from commandbutton within w_istandingqty_m
end type
type cb_3 from commandbutton within w_istandingqty_m
end type
type cb_4 from commandbutton within w_istandingqty_m
end type
type cb_5 from commandbutton within w_istandingqty_m
end type
type pb_excel from picturebutton within w_istandingqty_m
end type
type dw_4 from datawindow within w_istandingqty_m
end type
type st_4 from statictext within w_istandingqty_m
end type
type gb_4 from groupbox within w_istandingqty_m
end type
end forward

global type w_istandingqty_m from w_inheritance
integer width = 4247
integer height = 2208
string title = "상비재고관리(w_istandingqty_m)"
dw_3 dw_3
st_1 st_1
dw_5 dw_5
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
pb_excel pb_excel
dw_4 dw_4
st_4 st_4
gb_4 gb_4
end type
global w_istandingqty_m w_istandingqty_m

type variables
st_print i_print
string is_where, is_dw
datawindowchild idwc_item, idwc_qa
end variables

on w_istandingqty_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_1=create st_1
this.dw_5=create dw_5
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.pb_excel=create pb_excel
this.dw_4=create dw_4
this.st_4=create st_4
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.pb_excel
this.Control[iCurrent+15]=this.dw_4
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.gb_4
end on

on w_istandingqty_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.pb_excel)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false
dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_5.settransobject(sqlca)
dw_5.insertrow(1)

dw_4.visible  = false 			// 가용량보기

if GF_PERMISSION("상비재고관리[관리자]", gs_userid) = "Y" then	
	pb_retrieve.visible = true	
	pb_insert.visible = true
	pb_delete.visible = true	
	pb_save.visible = true		
	pb_excel.visible = true		
else
	pb_retrieve.visible = true	
	pb_insert.visible = false
	pb_delete.visible = false
	pb_save.visible = false
	pb_excel.visible = true	
	dw_1.object.item_no.TabSequence = 0	
	dw_1.object.qa.TabSequence = 0			
	dw_1.object.stock_qty.TabSequence = 0		
	dw_1.object.rem.TabSequence = 0	
end if

dw_5.object.loc_no[1] = 'WS00000000'


dw_3.setitem(1,'user_id',gs_userid)

dw_1.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_1.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_1.sharedata(dw_2)

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 78
dw_1.height = newheight - 476


end event

type pb_save from w_inheritance`pb_save within w_istandingqty_m
integer x = 3515
integer y = 56
integer taborder = 30
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
if wf_nullchk(dw_1) = false then
	return
end if
wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_istandingqty_m
integer x = 37
integer y = 444
integer width = 4082
integer height = 1588
integer taborder = 90
string dataobject = "d_istandingqty_m"
end type

event dw_1::itemchanged;string ls_item_no, ls_qa,  ls_item_name, ls_data, ls_null
long ll_row, ll_found, ll_row1

this.accepttext()

ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")
setnull(ls_null)

choose case dwo.name
	

	case 'item_no'

		this.object.qa[ll_row] = ls_null
		this.object.qa.tabsequence = 0
		
		this.getchild("item_no", idwc_item)
		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		select item_name into :ls_item_name from groupitem 
		 where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
			return 1
		end if

		this.object.item_name[this.getrow()] = ls_item_name
		
		if ls_item_no <> '' then
			this.getchild("qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
		
			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
//				this.object.qa.background.color = 1087434968
				this.setcolumn("qa")
				this.setfocus()
//			else
//				this.object.qa.tabsequence = 0
//				this.object.qa.background.color = 78682240
//				this.setcolumn("item_no")
//				this.setfocus()
			end if
		end if

end choose

end event

event dw_1::itemerror;string ls_null

setnull(ls_null)

CHOOSE CASE dwo.name
	CASE 'item_no'
		this.object.item_no[this.getrow()] = ls_null
END CHOOSE

return 2
end event

event dw_1::rowfocuschanging;string  ls_item_no

this.accepttext()
if this.getrow() < 1 then return

ls_item_no = this.object.item_no[this.getrow()]
if ls_item_no = '' or isnull(ls_item_no) then
	return
else
		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		idwc_qa.filter()
end if

end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rbuttondown;call super::rbuttondown;m_manager manager
string ls_itemnm, ls_itemno, ls_qa, ls_s_date, ls_e_date
string ls_sdate, ls_locno, ls_gubun, ls_locname
long   ll_row = 0, ll_out_gigan
	
ls_locno = trim(dw_1.object.loc_no[1])

if ls_locno = "" then
	ls_locno = "%"

end if
	
	
manager = CREATE m_manager

manager.m_itemstock.m_item_generate.visible = false
manager.m_itemstock.m_item_search.visible = false
manager.m_itemstock.m_item_inaudit_research.visible = false
manager.m_itemstock.m_item_inaudit_history.visible = false
manager.m_itemstock.m_sale_search.visible = true
manager.m_itemstock.m_planout.visible = true
manager.m_itemstock.m_item_stock_end.visible = true

manager.m_itemstock.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())


choose case gs_print_control	

	case 'sale_search'		
		
		dw_4.width  = dw_1.width * 0.52
		dw_4.height = dw_1.height* 0.8
		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
		dw_4.y      = dw_1.y		
		
		
		if isnull(row) OR row < 1 then RETURN
		
		select convert(char(8),getdate(),112) 
			into :ls_sdate
		from dual;
		
		ls_locno = trim(dw_1.object.loc_no[row])
		ls_locname = dw_1.object.loc_name[row]
		ls_itemno = dw_1.object.item_no[row]
		ls_itemnm = dw_1.object.item_name[row]
		ls_qa     = dw_1.object.qa[row]
		ll_out_gigan = -3
		
		select top 1 convert(char(8), dateadd(month, :ll_out_gigan, :ls_sdate),112), convert(char(8), convert(datetime, :ls_sdate,111), 112)
		    into :ls_s_date, :ls_e_date
		from login;
		
		
		dw_4.dataobject =  'd_whsale_w1'
		dw_4.SetTransObject(sqlca)	
				
		dw_4.reset()
		dw_4.title = "수주별 미출고량  확인: [" + ls_locname+ "] " + ls_itemnm + " | " + ls_qa
		
		dw_4.setredraw( false )
		dw_4.visible    = true 
		dw_4.bringtotop = true
				
		dw_4.retrieve( ls_locno, ls_s_date,  ls_e_date, ls_itemno, ls_qa )
				
		dw_4.setredraw( true )
		
	case 'planout_search'		
		
		dw_4.width  = dw_1.width * 0.84
		dw_4.height = dw_1.height* 0.8
		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
		dw_4.y      = dw_1.y		
		
		
		if isnull(row) OR row < 1 then RETURN
		
		select convert(char(8),getdate(),112) 
			into :ls_sdate
		from dual;
		
		ls_locno = trim(dw_1.object.loc_no[row])
		ls_locname = dw_1.object.loc_name[row]
		ls_itemno = dw_1.object.item_no[row]
		ls_itemnm = dw_1.object.item_name[row]
		ls_qa     = dw_1.object.qa[row]		
	
		dw_4.dataobject =  'd_silsa_oiissuereq_r'
		dw_4.SetTransObject(sqlca)	
				
		dw_4.reset()
		dw_4.title = "수주별 출고예정량  확인: " + ls_itemnm + " | " + ls_qa
		
		dw_4.setredraw( false )
		dw_4.visible    = true 
		dw_4.bringtotop = true
				
		dw_4.retrieve(ls_locno, ls_sdate,  ls_itemno, ls_qa )
						
		dw_4.setredraw( true )		
		
	case 'item_stock_end'	
//		
//	case 'item_inaudit_history'
//		
//		gs_where lst_where
//		
//		if isnull(row) OR row < 1 then RETURN
//		
//		ls_sdate = mid(em_1.text, 1,4) + mid(em_1.text, 6,2) + mid(em_1.text, 9,2)
//		
//		ls_locno = trim(dw_3.object.loc_no[1])
//		
//		if ls_locno = "" then
//			ls_locno = "%"
//		end if
//		
//		ls_locno = trim(dw_1.object.loc_no[row])
//		ls_itemno = dw_1.object.item_no[row]
//		ls_qa     = dw_1.object.qa[row]		
//		ls_itemnm = dw_1.object.item_name[row]
//		
//		
//		lst_where.str1 = ls_itemno
//		lst_where.str2 = ls_qa
//		lst_where.str3 = ls_locno
////		lst_where.str4 = mid(ls_sdate,1,4)+'/'+mid(ls_sdate,5,2) + '/' +  mid(ls_sdate,7,2) // 시작
//		lst_where.str4 = mid(ls_sdate,1,4)+'/'+mid(ls_sdate,5,2) + '/' +  '01'  // 시작
//		lst_where.str5 = mid(ls_sdate,1,4)+'/'+mid(ls_sdate,5,2) + '/' +  mid(ls_sdate,7,2)  // 종료
//		
//		lst_where.name = ls_itemnm
//		lst_where.chk  = "DO"
//		
//		OpenWithParm(w_whinaudit_w, lst_where)
//		w_whinaudit_w.WindowState = Normal!
//		lst_where = Message.PowerObjectParm
//
end choose







end event

type st_title from w_inheritance`st_title within w_istandingqty_m
integer x = 46
string text = "상비 재고 관리"
end type

type st_tips from w_inheritance`st_tips within w_istandingqty_m
end type

type pb_compute from w_inheritance`pb_compute within w_istandingqty_m
boolean visible = false
integer taborder = 170
end type

type pb_print_part from w_inheritance`pb_print_part within w_istandingqty_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_istandingqty_m
integer x = 3899
integer y = 56
integer taborder = 200
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_istandingqty_m
boolean visible = false
integer x = 3547
integer y = 264
integer taborder = 220
boolean enabled = false
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() < 1 then return 

w_repsuper w_print
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 담당자별 품목관리를 출력합니다." 
//i_print.name = 'd_irincoun_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_istandingqty_m
boolean visible = false
integer taborder = 230
end type

type pb_delete from w_inheritance`pb_delete within w_istandingqty_m
integer x = 3323
integer y = 56
integer taborder = 240
end type

event pb_delete::clicked;dw_1.accepttext()
if dw_1.getrow() < 1 then return

dw_1.deleterow(dw_1.getrow())
end event

type pb_insert from w_inheritance`pb_insert within w_istandingqty_m
integer x = 3131
integer y = 56
integer taborder = 260
end type

event pb_insert::clicked;string ls_id,ls_loc, ls_save_date
long ll_row, ll_cnt, ll_cnt2
gs_where2 lstr_where

dw_5.accepttext()

ls_loc = dw_5.object.loc_no[1]

if (isnull(ls_loc) or ls_loc='') then
	messagebox('알림','저장소를 선택하십시오')
	return
end if

//=====검색======
dw_1.accepttext()
if dw_1.rowcount() < 1 then 
	dw_1.reset()
	dw_1.retrieve(dw_5.object.loc_no[1])
end if
//===============

lstr_where.chk = 'M' //M:multi S:single
lstr_where.chk1 = ls_loc
OpenWithParm(w_whitemlocqohmulti_w3, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return
dw_1.SETREDRAW(false)

select convert(char(8),getdate(),112) 
   into :ls_save_date
from dual;


for ll_row = 1 to UpperBound(lstr_where.str1)	
	SELECT count(*) INTO :ll_cnt2
	  FROM standing_item
	 WHERE item_no = :lstr_where.str1[ll_row]
	   AND qa      = :lstr_where.str2[ll_row]
		AND loc_no  = :ls_loc;
	if ll_cnt2  <= 0 then
		ll_cnt = dw_1.insertrow(0)
		dw_1.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])
		dw_1.object.qa[ll_cnt]        = trim(lstr_where.str2[ll_row])
		dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
		dw_1.object.loc_no[ll_cnt]    = ls_loc
		dw_1.object.user_id[ll_cnt]    = gs_userid
		dw_1.object.save_date[ll_cnt] = ls_save_date
	end if
next

dw_1.scrolltorow(1)
dw_1.setsort('item_no, qa')
dw_1.sort()
dw_1.SETREDRAW(TRUE)


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_istandingqty_m
integer x = 2939
integer y = 56
integer taborder = 250
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_loc

ls_loc = dw_5.object.loc_no[1]

dw_5.accepttext()
dw_1.reset()
dw_1.retrieve(ls_loc)
end event

type gb_3 from w_inheritance`gb_3 within w_istandingqty_m
boolean visible = false
integer x = 1536
integer y = 60
integer width = 123
integer height = 156
integer taborder = 130
end type

type gb_2 from w_inheritance`gb_2 within w_istandingqty_m
integer x = 1984
integer y = 8
integer width = 910
integer height = 220
integer taborder = 150
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_istandingqty_m
integer x = 2912
integer y = 8
integer width = 1207
integer height = 220
integer taborder = 50
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_istandingqty_m
integer x = 1559
integer y = 84
integer width = 133
integer height = 104
integer taborder = 110
string dataobject = "d_incounu_r"
end type

type dw_3 from datawindow within w_istandingqty_m
boolean visible = false
integer x = 1317
integer y = 212
integer width = 635
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_userid_c2"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_istandingqty_m
boolean visible = false
integer x = 1106
integer y = 212
integer width = 210
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_istandingqty_m
integer x = 2016
integer y = 84
integer width = 850
integer height = 88
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type st_3 from statictext within w_istandingqty_m
integer x = 73
integer y = 312
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

type ddlb_fld from dropdownlistbox within w_istandingqty_m
integer x = 261
integer y = 296
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

type ddlb_dwtitles from dropdownlistbox within w_istandingqty_m
integer x = 302
integer y = 308
integer width = 311
integer height = 88
integer taborder = 180
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

type st_2 from statictext within w_istandingqty_m
integer x = 759
integer y = 312
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

type ddlb_op from dropdownlistbox within w_istandingqty_m
integer x = 928
integer y = 296
integer width = 297
integer height = 512
integer taborder = 40
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

type sle_value from singlelineedit within w_istandingqty_m
integer x = 1248
integer y = 304
integer width = 567
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_istandingqty_m
integer x = 1819
integer y = 304
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_istandingqty_m
integer x = 1984
integer y = 304
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_istandingqty_m
integer x = 2149
integer y = 304
integer width = 160
integer height = 76
integer taborder = 190
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_istandingqty_m
integer x = 2313
integer y = 304
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_excel from picturebutton within w_istandingqty_m
integer x = 3707
integer y = 56
integer width = 187
integer height = 144
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

//if cbx_stock.checked = true then
//	dwxls = dw_2
//else
	dwxls = dw_1
//end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	
end event

type dw_4 from datawindow within w_istandingqty_m
integer x = 425
integer y = 676
integer width = 3502
integer height = 1048
integer taborder = 190
boolean bringtotop = true
boolean titlebar = true
string title = "품목 일일수불 확인"
string dataobject = "d_iitemstock_m1_new"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_4"

end event

type st_4 from statictext within w_istandingqty_m
integer x = 2578
integer y = 312
integer width = 1582
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
string text = "일평균출고량: 최근 2주 일평균출고량(※토,일 제외)"
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_istandingqty_m
integer x = 37
integer y = 244
integer width = 4082
integer height = 164
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

