$PBExportHeader$w_cditemalter_m.srw
$PBExportComments$대체물품관리(1998/04/08,곽용덕)
forward
global type w_cditemalter_m from w_inheritance
end type
type dw_3 from datawindow within w_cditemalter_m
end type
type gb_4 from groupbox within w_cditemalter_m
end type
type gb_5 from groupbox within w_cditemalter_m
end type
type dw_4 from datawindow within w_cditemalter_m
end type
end forward

global type w_cditemalter_m from w_inheritance
integer width = 3607
integer height = 2188
string title = "생산대체 물품관리(w_cditemalter_m)"
long backcolor = 81838264
dw_3 dw_3
gb_4 gb_4
gb_5 gb_5
dw_4 dw_4
end type
global w_cditemalter_m w_cditemalter_m

type variables
public string is_itemno, is_itemname,is_qa
real ir_qoh
st_print i_print
string is_select,is_where,is_clause
datawindowchild idwc_qa,idwc_item
end variables

on w_cditemalter_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.dw_4=create dw_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.gb_5
this.Control[iCurrent+4]=this.dw_4
end on

on w_cditemalter_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.dw_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)	
dw_4.settransobject(sqlca)
dw_1.retrieve()

end event

type pb_save from w_inheritance`pb_save within w_cditemalter_m
integer x = 3113
boolean enabled = false
end type

event pb_save::clicked;
//long ll_row, ll_row2, ll_cnt
//dwItemStatus l_status
//
//tab_1.tabpage_1.dw_5.AcceptText()
//		  
//if wf_nullchk(tab_1.tabpage_1.dw_5) = false then return  
//		  
//l_status = tab_1.tabpage_1.dw_5.GetItemStatus(tab_1.tabpage_1.dw_5.GetRow(), 0 , Primary!)
//IF wf_update1(tab_1.tabpage_1.dw_5,"Y") = TRUE THEN
//	is_itemno = tab_1.tabpage_1.dw_5.Object.item_no[1]
//	is_qa = tab_1.tabpage_1.dw_5.Object.qa[1]
//	ir_qoh = tab_1.tabpage_1.dw_5.Object.qoh[1]
//   IF l_status = NewModified! THEN
//	   ll_row = dw_4.InsertRow(0)
//	   dw_4.ScrollToRow(ll_row)
//		IF ll_row = 1 then
//      	dw_4.Object.item_no[1] = is_itemno
//	      dw_4.Object.qa[1] = is_qa
//	      dw_4.Object.qoh[1] = ir_qoh			
//		end if
//	END IF
//END IF
//pb_insert.Enabled = True
//
//
end event

type dw_1 from w_inheritance`dw_1 within w_cditemalter_m
integer x = 55
integer y = 292
integer width = 1307
integer height = 996
integer taborder = 50
string dataobject = "d_cditemgroup_t"
boolean hscrollbar = false
boolean border = false
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;long ll_row
string ls_itemno

ll_row = wf_rowfocuschange(dw_1,"N")
if ll_row < 1 then
	return
end if
dw_1.accepttext()
dw_4.reset()
dw_2.reset()
ls_itemno = THIS.Object.item_no[ll_row]
dw_4.retrieve(ls_itemno)

	
end event

type dw_2 from w_inheritance`dw_2 within w_cditemalter_m
integer x = 1422
integer y = 300
integer width = 2085
integer taborder = 60
string dataobject = "d_cditemalter_m"
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_cditemalter_m
integer x = 37
integer width = 1335
string text = "생산대체 물품관리"
end type

type st_tips from w_inheritance`st_tips within w_cditemalter_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemalter_m
integer x = 2921
integer taborder = 110
boolean enabled = false
end type

event pb_compute::clicked;long ll_row,ll_found,i,ll_cnt,j,ll_maxrow,ll_found1,ll_num
string ls_item,ls_qa,ls_like,ls_foundqa
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

ll_row = dw_1.rowcount()

for i = 1 to ll_row
	dw_1.scrolltorow(i)
	ls_item   = trim(dw_1.object.item_no[i])
	ll_cnt    = dw_4.rowcount()
	ll_maxrow = dw_2.rowcount()
	if ll_cnt <= 1 then continue
	for j = 1 to ll_cnt
		if j = ll_cnt then continue
		dw_4.scrolltorow(j)
		ls_qa = trim(dw_4.object.qa[j])
		ls_like = LeftA(ls_qa,13) + "%"
		ll_found = j
		DO WHILE ll_found <> 0
	      ll_found = dw_4.Find("qa like '" + ls_like + "'",ll_found + 1,ll_cnt)
			if ll_found = 0 then exit
			ls_foundqa = trim(dw_4.object.qa[ll_found])
			if ll_maxrow > 1 then 
            ll_found1 = dw_2.Find("qa = '" + ls_foundqa + "'",1,ll_maxrow)
			else
				ll_found1 = 0
			end if
			if ll_found1 = 0 then
            ll_num = dw_2.insertrow(0)
				dw_2.scrolltorow(ll_num)
				dw_2.object.assy[ll_num] = ls_item
				dw_2.object.comp[ll_num] = ls_item
				dw_2.object.assy_qa[ll_num] = ls_qa
				dw_2.object.comp_qa[ll_num] = ls_foundqa
			end if
      LOOP
		if dw_2.update() <> 1 then 
			rollback;
			return
		end if
	next
next

messagebox('확인','저장되었읍니다.')  
commit;
end event

type pb_print_part from w_inheritance`pb_print_part within w_cditemalter_m
boolean visible = false
integer x = 2811
end type

type pb_close from w_inheritance`pb_close within w_cditemalter_m
integer x = 3305
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemalter_m
boolean visible = false
integer x = 1961
integer y = 48
integer taborder = 130
end type

type pb_cancel from w_inheritance`pb_cancel within w_cditemalter_m
boolean visible = false
integer x = 2427
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cditemalter_m
integer x = 2729
integer taborder = 150
boolean enabled = false
end type

event pb_delete::clicked;//string ls_itemno,ls_qa
//
//IF tab_1.tabpage_1.dw_5.rowcount() < 1 THEN RETURN
//
//IF MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 THEN
//	RETURN
//END IF
//
//dw_1.AcceptText()
//tab_1.tabpage_1.dw_5.AcceptText()
//dw_4.AcceptText()
//
//ls_itemno = dw_4.Object.item_no[dw_4.getrow()]
//ls_qa = dw_4.Object.qa[dw_4.getrow()]
//IF Trim(ls_itemno) = Trim(tab_1.tabpage_1.dw_5.Object.item_no[tab_1.tabpage_1.dw_5.getrow()]) THEN
//	tab_1.tabpage_1.dw_5.DeleteRow(0)
//	tab_1.tabpage_2.dw_6.DeleteRow(0)
//	wf_update1(tab_1.tabpage_1.dw_5,"Y")
//   dw_4.DeleteRow(dw_4.getrow())
//	dw_4.TriggerEvent(RowFocusChanged!)
//ELSE
//	tab_1.tabpage_1.dw_5.DeleteRow(0)
//	tab_1.tabpage_2.dw_6.DeleteRow(0)
//	tab_1.tabpage_1.dw_5.Retrieve(ls_itemno,ls_qa)
//	tab_1.tabpage_2.dw_6.Retrieve(ls_itemno,ls_qa)
//END IF
//pb_insert.Enabled = True
end event

type pb_insert from w_inheritance`pb_insert within w_cditemalter_m
integer x = 2537
integer taborder = 170
boolean enabled = false
end type

event pb_insert::clicked;call super::clicked;//long ll_row
//
//if dw_1.rowcount() < 1 then return
//tab_1.tabpage_1.dw_5.ReSet()
//tab_1.tabpage_2.dw_6.ReSet()
//ll_row = tab_1.tabpage_1.dw_5.InsertRow(0)
//tab_1.tabpage_2.dw_6.InsertRow(0)
//tab_1.tabpage_1.dw_5.ScrollToRow(ll_row)
//////물품규격을 입력하여야 한다.
////tab_1.tabpage_1.dw_5.Object.qa.Protect = False
//   tab_1.tabpage_1.dw_5.object.l1.protect = false
//	tab_1.tabpage_1.dw_5.object.l2.protect = false
//	tab_1.tabpage_1.dw_5.object.l3.protect = false
//	tab_1.tabpage_1.dw_5.object.l4.protect = false
//tab_1.tabpage_1.dw_5.object.item_no[ll_row] = trim(dw_1.object.item_no[dw_1.getrow()])
//tab_1.tabpage_1.dw_5.object.item_name[ll_row] = trim(dw_1.object.item_name[dw_1.getrow()])
//tab_1.tabpage_1.dw_5.object.last_tran_date[ll_row] = wf_today()
//tab_1.tabpage_2.dw_6.object.item_no[ll_row] = trim(dw_1.object.item_no[dw_1.getrow()])
//tab_1.tabpage_2.dw_6.object.item_name[ll_row] = trim(dw_1.object.item_name[dw_1.getrow()])
//tab_1.tabpage_1.dw_5.SetColumn('l1')
//tab_1.tabpage_1.dw_5.SetFocus()
//THIS.Enabled = False
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemalter_m
boolean visible = false
integer x = 1851
integer taborder = 160
end type

type gb_3 from w_inheritance`gb_3 within w_cditemalter_m
boolean visible = false
integer x = 1408
integer width = 2135
integer taborder = 90
integer textsize = -10
long textcolor = 16711680
long backcolor = 81838264
string text = "물품상세"
end type

type gb_2 from w_inheritance`gb_2 within w_cditemalter_m
integer width = 1353
integer height = 1084
integer taborder = 100
integer textsize = -10
long textcolor = 16711680
long backcolor = 81838264
string text = "물품코드"
end type

type gb_1 from w_inheritance`gb_1 within w_cditemalter_m
integer x = 2491
integer width = 1047
integer taborder = 40
long backcolor = 81838264
end type

type dw_3 from datawindow within w_cditemalter_m
boolean visible = false
integer x = 1554
integer y = 52
integer width = 50
integer height = 60
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cditem_r"
boolean livescroll = true
end type

type gb_4 from groupbox within w_cditemalter_m
integer x = 1399
integer y = 228
integer width = 2135
integer height = 1824
integer taborder = 91
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "구성품현황"
end type

type gb_5 from groupbox within w_cditemalter_m
integer x = 32
integer y = 1324
integer width = 1353
integer height = 728
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 81838264
string text = "규격 및 현재고량"
end type

type dw_4 from datawindow within w_cditemalter_m
integer x = 50
integer y = 1384
integer width = 1307
integer height = 652
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_cdqa_s"
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;//long ll_row
//string ls_itemno,ls_qa
//
//ll_row = wf_rowfocuschange(dw_4,"N")
//if ll_row < 1 then
//	return
//end if
//dw_1.accepttext()
//tab_1.tabpage_1.dw_5.accepttext()
//dw_4.accepttext()
//ls_itemno = trim(THIS.Object.item_no[ll_row])
//ls_qa = THIS.Object.qa[ll_row]
//
//if ISNULL(ls_itemno) OR ls_itemno = "" then
//	dw_4.Object.item_no[ll_row] = is_itemno
//	dw_4.Object.qa[ll_row] = is_qa
//	dw_4.Object.qoh[ll_row] = ir_qoh
//else
//	tab_1.tabpage_1.dw_5.retrieve(ls_itemno,ls_qa)
//	tab_1.tabpage_2.dw_6.retrieve(ls_itemno,ls_qa)
//	tab_1.tabpage_1.dw_5.object.l1[1] = mid(ls_qa,1,3)
//	tab_1.tabpage_1.dw_5.object.l2[1] = mid(ls_qa,5,4)
//	tab_1.tabpage_1.dw_5.object.l3[1] = mid(ls_qa,10,4)
//	tab_1.tabpage_1.dw_5.object.l4[1] = mid(ls_qa,15,5)
//end if
////물품번호를 수정하지 못하도록한다.
//IF tab_1.tabpage_1.dw_5.GetItemStatus(ll_row, 0, Primary!) = New! OR &
//	tab_1.tabpage_1.dw_5.GetItemStatus(ll_row, 0, Primary!) = NewModified! THEN
//   tab_1.tabpage_1.dw_5.object.l1.protect = false
//	tab_1.tabpage_1.dw_5.object.l2.protect = false
//	tab_1.tabpage_1.dw_5.object.l3.protect = false
//	tab_1.tabpage_1.dw_5.object.l4.protect = false
//	pb_insert.Enabled = False
//ELSE
//   tab_1.tabpage_1.dw_5.object.l1.protect = true
//	tab_1.tabpage_1.dw_5.object.l2.protect = true
//	tab_1.tabpage_1.dw_5.object.l3.protect = true
//	tab_1.tabpage_1.dw_5.object.l4.protect = true
//	pb_insert.Enabled = True
//END IF
//
end event

