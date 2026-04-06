$PBExportHeader$w_cdcustomer_org_m.srw
$PBExportComments$외상매출거래처출력순서
forward
global type w_cdcustomer_org_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdcustomer_org_m
end type
type st_4 from statictext within w_cdcustomer_org_m
end type
type st_1 from statictext within w_cdcustomer_org_m
end type
type ddlb_fld from dropdownlistbox within w_cdcustomer_org_m
end type
type st_6 from statictext within w_cdcustomer_org_m
end type
type sle_value from singlelineedit within w_cdcustomer_org_m
end type
type cbx_op from checkbox within w_cdcustomer_org_m
end type
type cb_2 from commandbutton within w_cdcustomer_org_m
end type
type cb_1 from commandbutton within w_cdcustomer_org_m
end type
type cb_4 from commandbutton within w_cdcustomer_org_m
end type
type cb_5 from commandbutton within w_cdcustomer_org_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdcustomer_org_m
end type
type st_2 from statictext within w_cdcustomer_org_m
end type
type st_7 from statictext within w_cdcustomer_org_m
end type
type dw_3 from datawindow within w_cdcustomer_org_m
end type
type dw_4 from datawindow within w_cdcustomer_org_m
end type
type cbx_sort from checkbox within w_cdcustomer_org_m
end type
type st_3 from statictext within w_cdcustomer_org_m
end type
type st_5 from statictext within w_cdcustomer_org_m
end type
type st_8 from statictext within w_cdcustomer_org_m
end type
type st_vertical from u_splitbar_vertical within w_cdcustomer_org_m
end type
type st_9 from statictext within w_cdcustomer_org_m
end type
type st_10 from statictext within w_cdcustomer_org_m
end type
type ddlb_op from dropdownlistbox within w_cdcustomer_org_m
end type
type gb_4 from groupbox within w_cdcustomer_org_m
end type
end forward

global type w_cdcustomer_org_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4809
integer height = 2584
string title = "매출집계 거래처순서(w_cdcustomer_org_m)"
cb_3 cb_3
st_4 st_4
st_1 st_1
ddlb_fld ddlb_fld
st_6 st_6
sle_value sle_value
cbx_op cbx_op
cb_2 cb_2
cb_1 cb_1
cb_4 cb_4
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
st_7 st_7
dw_3 dw_3
dw_4 dw_4
cbx_sort cbx_sort
st_3 st_3
st_5 st_5
st_8 st_8
st_vertical st_vertical
st_9 st_9
st_10 st_10
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_cdcustomer_org_m w_cdcustomer_org_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string   is_dw, is_sql
boolean  ib_check = true

datawindowchild idwc_user


end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)

st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////


GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(sqlca)
dw_4.SetTransObject(sqlca)
dw_4.visible  = false

//	pb_save.enabled   = false
if gf_permission('매출집계_거래처순서', gs_userid) = 'Y' then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
end if

// 담당자
dw_3.insertrow(1)
dw_3.getchild("user",idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,"user_id","%")
idwc_user.setitem(1,"user_name","전체")
idwc_user.accepttext()
dw_3.object.user[1] = "%"

dw_1.setfocus()

end event

on w_cdcustomer_org_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_4=create st_4
this.st_1=create st_1
this.ddlb_fld=create ddlb_fld
this.st_6=create st_6
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_4=create cb_4
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.st_7=create st_7
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cbx_sort=create cbx_sort
this.st_3=create st_3
this.st_5=create st_5
this.st_8=create st_8
this.st_vertical=create st_vertical
this.st_9=create st_9
this.st_10=create st_10
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.st_6
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cbx_op
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_4
this.Control[iCurrent+11]=this.cb_5
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.st_7
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.dw_4
this.Control[iCurrent+17]=this.cbx_sort
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.st_8
this.Control[iCurrent+21]=this.st_vertical
this.Control[iCurrent+22]=this.st_9
this.Control[iCurrent+23]=this.st_10
this.Control[iCurrent+24]=this.ddlb_op
this.Control[iCurrent+25]=this.gb_4
end on

on w_cdcustomer_org_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.ddlb_fld)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.st_7)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cbx_sort)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.st_8)
destroy(this.st_vertical)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event resize;call super::resize;//
long  iWidth

iWidth      = newwidth  - (gb_2.x * 2)

gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = newheight - dw_2.y - gb_2.x

dw_4.x      = dw_2.x
dw_4.y      = dw_2.y
dw_4.width  = dw_2.width
dw_4.height = dw_2.height


end event

type pb_save from w_inheritance`pb_save within w_cdcustomer_org_m
integer x = 4325
integer y = 56
end type

event pb_save::clicked;//
string ls_custno, ls_errtext
long   ll_row,  ll_idx,  ll_found

dw_1.accepttext()
dw_2.accepttext()

if dw_2.rowcount() < 1 then RETURN

// 순서만들기용 Index 값 부여
for ll_row = 1 TO dw_2.rowcount()
	dw_2.object.nrow[ll_row] = ll_row	
next

for ll_row = 1 TO dw_2.rowcount()
	if dw_2.object.chk[ll_row] = "N" then
		 Messagebox("확인", string(ll_row) + " 행의 데이터 등록 조건이 오류 입니다.")
		 RETURN
	end if
next

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
for ll_row = 1 TO dw_1.rowcount()
	ls_custno = dw_1.object.cust_no[ll_row]
	ll_idx    = dw_1.object.cust_idx[ll_row]
	
	SELECT count(cust_no) INTO :ll_found FROM customer_sort WHERE cust_no = :ls_custno;
	if ll_found > 0 then
		UPDATE customer_sort SET cust_idx = :ll_idx WHERE cust_no = :ls_custno;
		if SQLCA.SQLCode = 0 then                 
			COMMIT;                                
		else
			ls_errtext = SQLCA.SQLErrText
			ROLLBACK;
			MessageBox("SQL error", ls_errtext)
		end if                                    
	else
		INSERT INTO customer_sort ( cust_no, cust_idx ) VALUES ( :ls_custno, :ll_idx );
		if SQLCA.SQLCode = 0 then                 
			COMMIT;                                
		else                                      
			ls_errtext = SQLCA.SQLErrText
			ROLLBACK;
			MessageBox("SQL error", ls_errtext)
		end if                                    
	end if
next

wf_update1( dw_2, "Y" )

pb_retrieve.postevent( clicked! )
dw_2.setfocus()

end event

type dw_1 from w_inheritance`dw_1 within w_cdcustomer_org_m
integer x = 32
integer y = 496
integer width = 2766
integer height = 1952
string dataobject = "d_cdcustomer_sort"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_custno
long   ll_find
ls_custno  = this.object.cust_no[row]
ll_find    = dw_2.find( "customer_grp_cust_no = '" + ls_custno + "'", 1, dw_2.rowcount() )
if ll_find > 0 then
	dw_2.scrolltorow( ll_find )
end if

end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;//
choose case dwo.name
	case "cust_idx"
		dw_1.SelectText(1, LenA(dw_1.GetText()))
end choose

end event

type dw_2 from w_inheritance`dw_2 within w_cdcustomer_org_m
integer x = 2862
integer y = 496
integer width = 1874
integer height = 1952
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_cdcustomer_grp"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_2"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string ls_ColName, ls_value
long   ll_row, ll_col, ll_found

ll_row   = this.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ll_col   = this.getcolumn()
ls_ColName = this.GetColumnName()

choose case dwo.name
	case "customer_grp_cust_no", "customer_cust_name", "user_name1"
		ls_value = this.object.customer_grp_cust_no[ll_row]
		
	case "customer_grp_rcust_no", "customer_rcust_name", "user_name2"
		ls_value = this.object.customer_grp_rcust_no[ll_row]
end choose

ll_found = dw_1.find( "cust_no = '" + ls_value + "' ", 1, dw_1.rowcount() )
if ll_found > 0 then
	dw_1.scrolltorow( ll_found )
end if

end event

event dw_2::doubleclicked;call super::doubleclicked;//
gs_whcustret_str lst_whcustret
gs_where2        lst_whitemret
string ls_custno, ls_custname, ls_username, ls_mgrtype
long   ll_row, ll_mgrsort

if isnull( row ) OR row < 1 then RETURN

This.AcceptText()
ll_row = This.GetRow()

choose case dwo.name
	case "customer_grp_cust_no", "customer_cust_name", "user_name1"
		OpenWithParm(w_whcustret_w, lst_whcustret)
		lst_whcustret = Message.PowerObjectParm

		if lst_whcustret.cust_chk = 'Y' then
			ls_custno = lst_whcustret.cust_no
			
			SELECT l.user_name
				  , mgr_sort   = isnull((SELECT sort FROM codemst WHERE type = 'MGR_TYPE' and use_yn = 'Y' and item_cd = c.mgr_type),99)
				  , mgr_type   = (SELECT item_nm FROM codemst WHERE type = 'MGR_TYPE' and use_yn = 'Y' and item_cd = c.mgr_type)
			  INTO :ls_username, :ll_mgrsort, :ls_mgrtype
			  FROM customer C
					 LEFT OUTER JOIN login    L ON c.salesman = l.user_id
			 WHERE c.cust_no  = :ls_custno;
			 
			This.SetItem(ll_row, 'customer_grp_cust_no', lst_whcustret.cust_no)
			This.SetItem(ll_row, 'customer_cust_name', lst_whcustret.cust_name)
			This.SetItem(ll_row, 'mgr_sort1', ll_mgrsort)
			This.SetItem(ll_row, 'mgr_type1', ls_mgrtype)
			This.SetItem(ll_row, 'user_name1', ls_username)
			
			This.SetColumn('customer_grp_cust_no')
		end if

	case "customer_grp_rcust_no", "customer_rcust_name", "user_name2"
		OpenWithParm(w_whcustret_w, lst_whcustret)
		lst_whcustret = Message.PowerObjectParm

		if lst_whcustret.cust_chk = 'Y' then
			ls_custno = lst_whcustret.cust_no

			SELECT l.user_name
				  , mgr_sort   = isnull((SELECT sort FROM codemst WHERE type = 'MGR_TYPE' and use_yn = 'Y' and item_cd = c.mgr_type),99)
				  , mgr_type   = (SELECT item_nm FROM codemst WHERE type = 'MGR_TYPE' and use_yn = 'Y' and item_cd = c.mgr_type)
			  INTO :ls_username, :ll_mgrsort, :ls_mgrtype
			  FROM customer C
					 LEFT OUTER JOIN login    L ON c.salesman = l.user_id
			 WHERE c.cust_no  = :ls_custno;

			This.SetItem(ll_row, 'customer_grp_rcust_no', lst_whcustret.cust_no)
			This.SetItem(ll_row, 'customer_rcust_name', lst_whcustret.cust_name)
			This.SetItem(ll_row, 'mgr_sort2', ll_mgrsort)
			This.SetItem(ll_row, 'mgr_type2', ls_mgrtype)
			This.SetItem(ll_row, 'user_name2', ls_username)

			This.SetColumn('customer_grp_rcust_no')
		end if
end choose

end event

type st_title from w_inheritance`st_title within w_cdcustomer_org_m
integer x = 32
integer y = 24
integer width = 1417
long backcolor = 8421376
string text = "매출집계 거래처순서"
end type

type st_tips from w_inheritance`st_tips within w_cdcustomer_org_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustomer_org_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcustomer_org_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcustomer_org_m
integer x = 4526
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcustomer_org_m
integer x = 4133
integer y = 56
integer taborder = 110
string picturename = "C:\BMP\PRINT.BMP"
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 매출집계 조직도를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustomer_org_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdcustomer_org_m
integer x = 3941
integer y = 56
integer taborder = 130
end type

event pb_delete::clicked;//
string ls_userid
int    li_count
DataWindow dwdet

if is_dw = "dw_1" then
	dwdet = dw_1
else
	dwdet = dw_2
end if


if dwdet.rowcount() < 1 then RETURN	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then	RETURN

dwdet.deleterow(0)
wf_update1( dwdet, "Y" )


end event

type pb_insert from w_inheritance`pb_insert within w_cdcustomer_org_m
integer x = 3749
integer y = 56
integer taborder = 150
end type

event pb_insert::clicked;//
long ll_row, ll_nrow

if is_dw = "dw_1" then RETURN

dw_2.accepttext()

ll_row   = dw_2.insertrow(0)

dw_2.scrolltorow(ll_row)
dw_2.setcolumn("customer_grp_cust_no")
dw_2.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustomer_org_m
integer x = 3557
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_salesman, ls_usernm

// 담당자
dw_3.accepttext()
ls_salesman = dw_3.object.user[1]

dw_1.retrieve( ls_salesman )
dw_2.retrieve()

MessageBox("확인","조회완료")

//if gf_permission('매출집계_거래처순서', gs_userid) = 'Y' then
//	pb_save.triggerevent( clicked! )
//end if


end event

type gb_3 from w_inheritance`gb_3 within w_cdcustomer_org_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustomer_org_m
integer y = 240
integer width = 4709
integer height = 156
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustomer_org_m
integer x = 3529
integer y = 0
integer width = 1211
integer height = 232
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cdcustomer_org_m
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

type st_4 from statictext within w_cdcustomer_org_m
integer x = 37
integer y = 208
integer width = 535
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "매출집계_거래처순서"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cdcustomer_org_m
integer x = 91
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

type ddlb_fld from dropdownlistbox within w_cdcustomer_org_m
integer x = 279
integer y = 288
integer width = 443
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

type st_6 from statictext within w_cdcustomer_org_m
integer x = 750
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

type sle_value from singlelineedit within w_cdcustomer_org_m
integer x = 1239
integer y = 296
integer width = 567
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cbx_op from checkbox within w_cdcustomer_org_m
integer x = 1824
integer y = 304
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

type cb_2 from commandbutton within w_cdcustomer_org_m
integer x = 2030
integer y = 296
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

integer    li_ret
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

type cb_1 from commandbutton within w_cdcustomer_org_m
integer x = 2194
integer y = 296
integer width = 160
integer height = 76
integer taborder = 100
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_cdcustomer_org_m
integer x = 2359
integer y = 296
integer width = 160
integer height = 76
integer taborder = 110
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdcustomer_org_m
integer x = 2523
integer y = 296
integer width = 160
integer height = 76
integer taborder = 120
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_cdcustomer_org_m
integer x = 311
integer y = 300
integer width = 311
integer height = 88
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

type st_2 from statictext within w_cdcustomer_org_m
integer x = 3913
integer y = 304
integer width = 800
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "거래처 선택은 더블클릭"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_cdcustomer_org_m
integer x = 2825
integer y = 44
integer width = 658
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cdcustomer_org_m
integer x = 2821
integer y = 124
integer width = 663
integer height = 84
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within w_cdcustomer_org_m
integer x = 1298
integer y = 12
integer width = 238
integer height = 132
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdcustomer_sort"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_sort from checkbox within w_cdcustomer_org_m
integer x = 2702
integer y = 304
integer width = 375
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "순서매김"
end type

event clicked;//
long  ll_row, ll_idx

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.cust_idx[ll_row] = ll_row * 10
next

end event

type st_3 from statictext within w_cdcustomer_org_m
integer x = 1824
integer y = 56
integer width = 965
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 79416533
string text = "영업사원 총괄현황 출력시"
boolean focusrectangle = false
end type

type st_5 from statictext within w_cdcustomer_org_m
integer x = 1824
integer y = 132
integer width = 965
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 79416533
string text = "반드시 저장 하시기 바립니다."
boolean focusrectangle = false
end type

type st_8 from statictext within w_cdcustomer_org_m
integer x = 3118
integer y = 304
integer width = 507
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "[[관련거래처]]"
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_cdcustomer_org_m
integer x = 2816
integer y = 496
integer height = 1952
boolean bringtotop = true
end type

type st_9 from statictext within w_cdcustomer_org_m
integer x = 37
integer y = 404
integer width = 1079
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 32896
string text = "거래처 순서"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_10 from statictext within w_cdcustomer_org_m
integer x = 2862
integer y = 404
integer width = 1079
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 32896
string text = "관련거래처 "
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_cdcustomer_org_m
integer x = 923
integer y = 292
integer width = 306
integer height = 500
integer taborder = 50
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

type gb_4 from groupbox within w_cdcustomer_org_m
integer x = 2802
integer width = 713
integer height = 232
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79219928
end type

