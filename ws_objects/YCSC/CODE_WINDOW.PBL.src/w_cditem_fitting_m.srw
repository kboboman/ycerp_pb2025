$PBExportHeader$w_cditem_fitting_m.srw
$PBExportComments$품목별 부속품 저장소관리(2008/02/28,정갑용)
forward
global type w_cditem_fitting_m from w_inheritance
end type
type st_2 from statictext within w_cditem_fitting_m
end type
type dw_6 from datawindow within w_cditem_fitting_m
end type
end forward

global type w_cditem_fitting_m from w_inheritance
integer width = 4247
integer height = 2192
string title = "사업장별 부속품 저장소 관리(w_cditem_fitting_m)"
st_2 st_2
dw_6 dw_6
end type
global w_cditem_fitting_m w_cditem_fitting_m

type variables
st_print i_print
string is_where
datawindowchild idwc_item, idwc_qa
end variables

on w_cditem_fitting_m.create
int iCurrent
call super::create
this.st_2=create st_2
this.dw_6=create dw_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.dw_6
end on

on w_cditem_fitting_m.destroy
call super::destroy
destroy(this.st_2)
destroy(this.dw_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
//dw_6.settransobject(sqlca)
//dw_6.insertrow(0)  
//dw_6.object.area[1] = gs_area

dw_1.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_1.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

//dw_1.sharedata(dw_2)

if gf_permission("부속품저장소_관리", gs_userid) = 'Y' then
else
	pb_save.visible = false
	messagebox('확인', '이 프로그램에 사용권한이 없습니다.')
end if

end event

type pb_save from w_inheritance`pb_save within w_cditem_fitting_m
integer x = 3707
integer y = 48
end type

event pb_save::clicked;
dw_1.accepttext()
if wf_nullchk(dw_1) = false then
	return
end if
wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cditem_fitting_m
integer y = 304
integer width = 4032
integer height = 1684
integer taborder = 60
string dataobject = "d_cditem_fitting_m"
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;//string ls_item_no, ls_qa,  ls_item_name, ls_data, ls_null
//long ll_row, ll_found, ll_row1
//
//this.accepttext()
//
//ll_row = this.getrow()
//ls_item_no = this.getitemstring(ll_row, "item_no")
//ls_qa = this.getitemstring(ll_row, "qa")
//setnull(ls_null)
//
//choose case dwo.name
//	
//
//	case 'item_no'
//
//		this.object.qa[ll_row] = ls_null
//		this.object.qa.tabsequence = 0
//		
//		this.getchild("item_no", idwc_item)
//		gs_ds_itemall.ShareData(idwc_item)
//		
//		ls_data = data
//  	   ll_row1 = idwc_item.RowCount( )
//		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
//		
//		if ll_found = 0 then
//			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
//			return 1
//		end if
//		select item_name into :ls_item_name from groupitem 
//		 where item_no = :ls_data;
//		if sqlca.sqlcode = 100 then 
//			return 1
//		end if
//
//		this.object.item_name[this.getrow()] = ls_item_name
//		
//		if ls_item_no <> '' then
//			this.getchild("qa", idwc_qa)
//			gs_ds_qaall.ShareData(idwc_qa)
//			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//			idwc_qa.filter()
//		
//			if idwc_qa.rowcount() > 0 then
//				this.object.qa.tabsequence = 1
////				this.object.qa.background.color = 1087434968
//				this.setcolumn("qa")
//				this.setfocus()
////			else
////				this.object.qa.tabsequence = 0
////				this.object.qa.background.color = 78682240
////				this.setcolumn("item_no")
////				this.setfocus()
//			end if
//		end if
//
//end choose
//
end event

event dw_1::itemerror;//string ls_null
//
//setnull(ls_null)
//
//CHOOSE CASE dwo.name
//	CASE 'item_no'
//		this.object.item_no[this.getrow()] = ls_null
//END CHOOSE
//
//return 2
end event

event dw_1::rowfocuschanging;//string  ls_item_no
//
//this.accepttext()
//if this.getrow() < 1 then return
//
//ls_item_no = this.object.item_no[this.getrow()]
//if ls_item_no = '' or isnull(ls_item_no) then
//	return
//else
//		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//		idwc_qa.filter()
//end if
//
end event

event dw_1::clicked;call super::clicked;if row < 1 then
	gf_sort_random(This, True)   
	Return
end if 
end event

type dw_2 from w_inheritance`dw_2 within w_cditem_fitting_m
integer x = 1221
integer y = 8
integer width = 169
integer height = 108
integer taborder = 80
string dataobject = "d_incounu_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_cditem_fitting_m
integer x = 46
integer width = 1563
string text = "부속품 저장소 관리"
end type

type st_tips from w_inheritance`st_tips within w_cditem_fitting_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditem_fitting_m
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditem_fitting_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditem_fitting_m
integer x = 3899
integer y = 48
integer taborder = 120
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditem_fitting_m
integer x = 3515
integer y = 48
integer taborder = 130
boolean enabled = false
end type

event pb_print::clicked;//if dw_1.rowcount() < 1 then return 
//
//
//w_repsuper w_print
//i_print.st_datawindow = dw_2
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 담당자별 품목관리를 출력합니다." 
////i_print.name = 'd_irincoun_r'
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cditem_fitting_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cditem_fitting_m
integer x = 3323
integer y = 48
integer taborder = 150
end type

event pb_delete::clicked;dw_1.accepttext()
if dw_1.getrow() < 1 then return

dw_1.deleterow(dw_1.getrow())
end event

type pb_insert from w_inheritance`pb_insert within w_cditem_fitting_m
integer x = 3131
integer y = 48
integer taborder = 170
end type

event pb_insert::clicked;string ls_area_no, ls_def_loc
long ll_row, ll_cnt
gs_where2 lstr_where

//dw_6.accepttext()
//ls_area_no = dw_6.object.area[1]
//
//if isnull(ls_area_no) or trim(ls_area_no) = '' then
//	messagebox('알림','사업장을 선택하십시오')
//	return
//end if

if dw_1.rowcount() < 1 then 
	pb_retrieve.triggerevent(clicked!)
end if

//select isnull(def_loc,'')
// into :ls_def_loc
// from area
//where real_area = 'Y'
//and area_no = :ls_area_no;

select isnull(def_loc,'')
 into :ls_def_loc
 from area
where real_area = 'Y'
and area_no = :gs_area;

if sqlca.sqlcode <> 0 then
	messagebox('경고', '사업장 선택 오류!~n~n관리자에게 문의 바랍니다.')
	return
end if

lstr_where.chk = 'M' //M:multi S:single
lstr_where.chk1 = ls_def_loc
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return
dw_1.SETREDRAW(false)

for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(0)
//	dw_1.object.area_no[ll_cnt] = ls_area_no
	dw_1.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_1.object.qa[ll_cnt] = trim(lstr_where.str2[ll_row])
	dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_1.scrolltorow(1)
dw_1.setsort('item_no, qa')
dw_1.sort()
dw_1.SETREDRAW(TRUE)


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditem_fitting_m
integer x = 2939
integer y = 48
integer taborder = 160
end type

event pb_retrieve::clicked;//string ls_area_no
//
//dw_6.accepttext()
dw_1.reset()

//ls_area_no = dw_6.object.area[1]
//dw_1.retrieve(ls_area_no)
dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cditem_fitting_m
boolean visible = false
integer x = 1993
integer y = 40
integer width = 763
integer height = 144
integer taborder = 90
end type

type gb_2 from w_inheritance`gb_2 within w_cditem_fitting_m
integer x = 46
integer y = 260
integer width = 4064
integer height = 1760
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_cditem_fitting_m
integer x = 2907
integer y = 8
integer width = 1207
end type

type st_2 from statictext within w_cditem_fitting_m
boolean visible = false
integer x = 2016
integer y = 88
integer width = 219
integer height = 72
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_cditem_fitting_m
boolean visible = false
integer x = 2240
integer y = 84
integer width = 494
integer height = 84
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

