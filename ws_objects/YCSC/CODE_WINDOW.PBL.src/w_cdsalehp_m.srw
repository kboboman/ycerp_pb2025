$PBExportHeader$w_cdsalehp_m.srw
$PBExportComments$영업사원HP관리(2001/03/15,정갑용)
forward
global type w_cdsalehp_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdsalehp_m
end type
type st_4 from statictext within w_cdsalehp_m
end type
type st_8 from statictext within w_cdsalehp_m
end type
type ddlb_fld from dropdownlistbox within w_cdsalehp_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdsalehp_m
end type
type st_9 from statictext within w_cdsalehp_m
end type
type ddlb_op from dropdownlistbox within w_cdsalehp_m
end type
type sle_value from singlelineedit within w_cdsalehp_m
end type
type cb_filteron from commandbutton within w_cdsalehp_m
end type
type cb_filteroff from commandbutton within w_cdsalehp_m
end type
type cb_1 from commandbutton within w_cdsalehp_m
end type
type cb_2 from commandbutton within w_cdsalehp_m
end type
type st_1 from statictext within w_cdsalehp_m
end type
type st_2 from statictext within w_cdsalehp_m
end type
type st_3 from statictext within w_cdsalehp_m
end type
type sle_1 from singlelineedit within w_cdsalehp_m
end type
type st_5 from statictext within w_cdsalehp_m
end type
type st_6 from statictext within w_cdsalehp_m
end type
type gb_4 from groupbox within w_cdsalehp_m
end type
end forward

global type w_cdsalehp_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4251
integer height = 2232
string title = "영업사원HP관리(w_cdsalehp_m)"
cb_3 cb_3
st_4 st_4
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
st_1 st_1
st_2 st_2
st_3 st_3
sle_1 sle_1
st_5 st_5
st_6 st_6
gb_4 gb_4
end type
global w_cdsalehp_m w_cdsalehp_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string   is_sql, is_dw
boolean  ib_check = true
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

if gf_permission('영업사원HP관리', gs_userid) = 'Y' then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

pb_retrieve.triggerevent(clicked!)

sle_1.setfocus()

end event

on w_cdsalehp_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_4=create st_4
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.sle_1=create sle_1
this.st_5=create st_5
this.st_6=create st_6
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_8
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_9
this.Control[iCurrent+7]=this.ddlb_op
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_filteron
this.Control[iCurrent+10]=this.cb_filteroff
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.st_3
this.Control[iCurrent+16]=this.sle_1
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.st_6
this.Control[iCurrent+19]=this.gb_4
end on

on w_cdsalehp_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_4)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.gb_4)
end on

event resize;call super::resize;//
//gb_2.height = this.height - 69

dw_1.width  = newwidth  - 69
dw_1.height = (newheight - dw_1.y) / 2

dw_2.y      = dw_1.y + dw_1.height + 10
dw_2.width  = newwidth  - 69
dw_2.height = dw_1.height - 20

end event

type pb_save from w_inheritance`pb_save within w_cdsalehp_m
integer x = 3767
integer y = 56
end type

event pb_save::clicked;//
int    li_cnt1, li_cnt2, ll_count, li_X
string ls_appyn, ls_apply1, ls_apply2, ls_apply3

dw_1.accepttext()

if dw_1.rowcount() < 1 then RETURN

debugbreak()
for ll_count = 1 TO dw_1.rowcount()
	if isnull(dw_1.object.user_id[ll_count]) OR dw_1.object.user_id[ll_count] <= "" THEN
		MessageBox("입력오류", string(ll_count) + " 번째 영업사원을 입력하십시오")
		dw_1.setcolumn("user_id")
		dw_1.setfocus()
		dw_1.scrolltorow(ll_count)
		RETURN
	end if

	ls_appyn  = dw_1.object.appyn[ll_count]
	ls_apply1 = dw_1.object.apply1[ll_count]
	ls_apply2 = dw_1.object.apply2[ll_count]
	ls_apply3 = dw_1.object.apply3[ll_count]
	
	if ls_appyn = "Y" then
		if (ls_apply1 = "" AND ls_apply2 = "" AND ls_apply3 = "") then
			MessageBox("결재오류", string(ll_count) + " 번째 결재자를 확인 하십시오")
			dw_1.setcolumn("appyn")
			dw_1.setfocus()
			dw_1.scrolltorow(ll_count)
			RETURN
		end if
	end if
next

for li_cnt1 = 1 TO dw_1.rowcount()
	for li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
	    if dw_1.object.user_id[li_cnt1] = dw_1.object.user_id[li_cnt2] THEN
		    MessageBox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
		            " 번째 영업사원이 중복되었습니다.")
			 RETURN
		end if
   next
next		            

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
wf_update1(dw_1, "Y")

end event

type dw_1 from w_inheritance`dw_1 within w_cdsalehp_m
integer x = 32
integer y = 440
integer width = 4146
integer height = 872
string dataobject = "d_cdsalehp_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
string ls_userid, ls_salesman

ls_userid   = dw_1.object.user_id[currentrow]
ls_salesman = dw_1.object.salesman[currentrow]

dw_2.reset()
dw_2.retrieve( "%", ls_userid, "%" )

end event

event dw_1::getfocus;call super::getfocus;//
is_dw = "dw_1"
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )


end event

type dw_2 from w_inheritance`dw_2 within w_cdsalehp_m
integer x = 32
integer y = 1328
integer width = 4146
integer height = 756
integer taborder = 60
string dataobject = "d_cdcustomer_list"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_2::getfocus;call super::getfocus;//
is_dw = "dw_2"
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )


end event

event dw_2::doubleclicked;call super::doubleclicked;// 더블클릭시 "판매거래처관리" 실행.
string ls_custno, ls_custnm

if row > 0 then
	ls_custno = trim(this.object.거래처코드[row])
	SELECT cust_name INTO :ls_custnm FROM CUSTOMER WHERE cust_no = :ls_custno;
	 
	gs_print_control = "V" + ls_custno
	if gf_permission('판매거래처관리open', gs_userid) = 'Y' then
		if IsValid(w_cdcustomer_m) = False then			
			OpenSheet(w_cdcustomer_m, parent.parentwindow(), 5, Cascaded!) // Layered! , Cascaded!
			Parent.ArrangeSheets(Cascade!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
			
			w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
			w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
			w_cdcustomer_m.dw_24.Visible  =  False

			w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.insertrow(0)
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.reset()
			w_cdcustomer_m.tab_1.tabpage_1.dw_20.reset()
			w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.reset()
			w_cdcustomer_m.tab_1.tabpage_2.dw_4.reset()
			w_cdcustomer_m.tab_1.tabpage_3.dw_6.reset()
			w_cdcustomer_m.tab_1.tabpage_3.dw_7.reset()
			
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.setfocus()
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_1.dw_20.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
			w_cdcustomer_m.tab_1.tabpage_4.st_2.text = ls_custno
			w_cdcustomer_m.tab_1.tabpage_4.st_3.text = ls_custnm
			w_cdcustomer_m.tab_1.tabpage_3.st_5.text = ls_custno
			w_cdcustomer_m.tab_1.tabpage_3.st_6.text = ls_custnm
			w_cdcustomer_m.is_salesman = w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.salesman[1]
			w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
			w_cdcustomer_m.dw_15.retrieve(w_cdcustomer_m.tab_1.tabpage_3.st_5.text, integer(w_cdcustomer_m.tab_1.tabpage_3.em_1.text), w_cdcustomer_m.tab_1.tabpage_3.st_5.text)
			w_cdcustomer_m.tab_1.tabpage_6.cb_5.triggerevent(clicked!)
		
		else
			if MessageBox("확인", "작업중인 판매거래처관리 프로그램을 종료하고 재 실행 합니까?", Exclamation!, OKCancel!, 2) = 2 then
				parent.arrangesheets( Cascade! )
				return
			else
				close(w_cdcustomer_m)
				OpenSheet(w_cdcustomer_m, parent.parentwindow(), 5, Cascaded!) // Layered! , Cascaded!
				Parent.ArrangeSheets(Cascade!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

				w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
				w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
				w_cdcustomer_m.dw_24.Visible  =  False
	
				w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.insertrow(0)
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.reset()
				w_cdcustomer_m.tab_1.tabpage_1.dw_20.reset()
				w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.reset()
				w_cdcustomer_m.tab_1.tabpage_2.dw_4.reset()
				w_cdcustomer_m.tab_1.tabpage_3.dw_6.reset()
				w_cdcustomer_m.tab_1.tabpage_3.dw_7.reset()
				
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.setfocus()
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_1.dw_20.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
				w_cdcustomer_m.tab_1.tabpage_4.st_2.text = ls_custno
				w_cdcustomer_m.tab_1.tabpage_4.st_3.text = ls_custnm
				w_cdcustomer_m.tab_1.tabpage_3.st_5.text = ls_custno
				w_cdcustomer_m.tab_1.tabpage_3.st_6.text = ls_custnm
				w_cdcustomer_m.is_salesman = w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.salesman[1]
				w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
				w_cdcustomer_m.dw_15.retrieve(w_cdcustomer_m.tab_1.tabpage_3.st_5.text, integer(w_cdcustomer_m.tab_1.tabpage_3.em_1.text), w_cdcustomer_m.tab_1.tabpage_3.st_5.text)
				w_cdcustomer_m.tab_1.tabpage_6.cb_5.triggerevent(clicked!)
			end if
		end if
	else
		OpenSheet(w_cdcustomer_r, parent.parentwindow(), 5, Cascaded!)
		Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

		w_cdcustomer_r.dw_1.object.cust_no[1]   = ls_custno
		w_cdcustomer_r.dw_1.object.cust_name[1] = ls_custnm

		w_cdcustomer_r.tab_1.tabpage_1.dw_5.reset()
		w_cdcustomer_r.tab_1.tabpage_2.dw_4.reset()
		w_cdcustomer_r.tab_1.tabpage_3.dw_6.reset()
		w_cdcustomer_r.tab_1.tabpage_3.dw_7.reset()
		
		w_cdcustomer_r.tab_1.tabpage_1.dw_5.setfocus()
		w_cdcustomer_r.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
	end if
end if

end event

type st_title from w_inheritance`st_title within w_cdsalehp_m
integer width = 1138
string text = "영업사원 HP관리"
end type

type st_tips from w_inheritance`st_tips within w_cdsalehp_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdsalehp_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdsalehp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdsalehp_m
integer x = 3959
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdsalehp_m
integer x = 3575
integer y = 56
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then
	return
end if
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원 HP 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdsalehp_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdsalehp_m
integer x = 3383
integer y = 56
integer taborder = 130
end type

event pb_delete::clicked;string ls_driver, ls_bank_check
int li_count
if dw_1.rowcount() < 1 then return	

if LeftA(dw_1.object.user_id[dw_1.getrow()],8) = 'chulha_t' then
	messagebox('확인', '삭제 할수 없는 항목입니다. 전산실에 문의하세요', information!)
	return
end if

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdsalehp_m
integer x = 3191
integer y = 56
integer taborder = 150
end type

event pb_insert::clicked;long ll_row //, ll_count

dw_1.accepttext()

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('user_id')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdsalehp_m
integer x = 2999
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cdsalehp_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdsalehp_m
integer y = 252
integer width = 4146
integer height = 168
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdsalehp_m
integer x = 2962
integer y = 16
integer width = 1211
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cdsalehp_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type st_4 from statictext within w_cdsalehp_m
integer x = 1211
integer y = 64
integer width = 407
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "영업사원HP관리"
boolean focusrectangle = false
end type

type st_8 from statictext within w_cdsalehp_m
integer x = 110
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_cdsalehp_m
integer x = 293
integer y = 312
integer width = 480
integer height = 580
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
end type

type ddlb_dwtitles from dropdownlistbox within w_cdsalehp_m
integer x = 352
integer y = 320
integer width = 306
integer height = 92
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
end type

type st_9 from statictext within w_cdsalehp_m
integer x = 809
integer y = 332
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_cdsalehp_m
integer x = 983
integer y = 312
integer width = 261
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_cdsalehp_m
integer x = 1257
integer y = 316
integer width = 581
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdsalehp_m
integer x = 1851
integer y = 312
integer width = 197
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
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
else
	arg_dw  = dw_2
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdsalehp_m
integer x = 2053
integer y = 312
integer width = 197
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_cdsalehp_m
integer x = 2254
integer y = 312
integer width = 183
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
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
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_cdsalehp_m
integer x = 2441
integer y = 312
integer width = 183
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
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
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type st_1 from statictext within w_cdsalehp_m
integer x = 2661
integer y = 300
integer width = 1134
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "결재: 매출할인 결재라인으로 사용함."
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdsalehp_m
integer x = 2661
integer y = 356
integer width = 1262
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
string text = "      본부장 공난시 회장님 직접 결재됨."
boolean focusrectangle = false
end type

type st_3 from statictext within w_cdsalehp_m
integer x = 41
integer y = 208
integer width = 1152
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
string text = "거래처 수가 ZERO 이면 매출할인 결재 안됨."
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cdsalehp_m
integer x = 2327
integer y = 132
integer width = 585
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//
string ls_custnm

if LenA(this.text) > 3 then
	ls_custnm = "%" + this.text + "%"
	dw_2.reset()
	dw_2.retrieve( "%", "%", ls_custnm )
	
	if dw_2.rowcount() > 0 then
		dw_2.setfocus()
	end if
end if

end event

event getfocus;//
this.SelectText(1, LenA(this.text))
end event

type st_5 from statictext within w_cdsalehp_m
integer x = 2327
integer y = 52
integer width = 585
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "거래처 찾기"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_cdsalehp_m
integer x = 1211
integer y = 208
integer width = 946
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "더블클릭시 ~"판매거래처관리~" 실행."
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_cdsalehp_m
integer x = 2295
integer y = 16
integer width = 649
integer height = 204
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

