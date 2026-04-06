$PBExportHeader$w_osmsale_r.srw
$PBExportComments$영업사원 총괄현황[1999/03/31, 조현춘]
forward
global type w_osmsale_r from w_inheritance
end type
type em_1 from editmask within w_osmsale_r
end type
type st_1 from statictext within w_osmsale_r
end type
type dw_3 from datawindow within w_osmsale_r
end type
type ddlb_1 from dropdownlistbox within w_osmsale_r
end type
type st_3 from statictext within w_osmsale_r
end type
type st_5 from statictext within w_osmsale_r
end type
type ddlb_fld from dropdownlistbox within w_osmsale_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osmsale_r
end type
type st_6 from statictext within w_osmsale_r
end type
type ddlb_op from dropdownlistbox within w_osmsale_r
end type
type sle_value from singlelineedit within w_osmsale_r
end type
type cb_1 from commandbutton within w_osmsale_r
end type
type cb_2 from commandbutton within w_osmsale_r
end type
type cb_3 from commandbutton within w_osmsale_r
end type
type cb_5 from commandbutton within w_osmsale_r
end type
type cbx_2 from checkbox within w_osmsale_r
end type
type pb_1 from picturebutton within w_osmsale_r
end type
type cb_4 from commandbutton within w_osmsale_r
end type
type st_7 from statictext within w_osmsale_r
end type
type cbx_zero from checkbox within w_osmsale_r
end type
type dw_5 from datawindow within w_osmsale_r
end type
type st_8 from statictext within w_osmsale_r
end type
type dw_6 from datawindow within w_osmsale_r
end type
type dw_7 from datawindow within w_osmsale_r
end type
type st_9 from statictext within w_osmsale_r
end type
type st_10 from statictext within w_osmsale_r
end type
type cb_6 from commandbutton within w_osmsale_r
end type
type cbx_team from checkbox within w_osmsale_r
end type
type dw_sales from datawindow within w_osmsale_r
end type
type ddlb_level1 from dropdownlistbox within w_osmsale_r
end type
type st_2 from statictext within w_osmsale_r
end type
type ddlb_level2 from dropdownlistbox within w_osmsale_r
end type
type gb_5 from groupbox within w_osmsale_r
end type
type gb_4 from groupbox within w_osmsale_r
end type
end forward

global type w_osmsale_r from w_inheritance
integer x = 23
integer y = 112
integer width = 5061
integer height = 2656
string title = "영업사원 총괄현황(w_osmsale_r)"
em_1 em_1
st_1 st_1
dw_3 dw_3
ddlb_1 ddlb_1
st_3 st_3
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_2 cbx_2
pb_1 pb_1
cb_4 cb_4
st_7 st_7
cbx_zero cbx_zero
dw_5 dw_5
st_8 st_8
dw_6 dw_6
dw_7 dw_7
st_9 st_9
st_10 st_10
cb_6 cb_6
cbx_team cbx_team
dw_sales dw_sales
ddlb_level1 ddlb_level1
st_2 st_2
ddlb_level2 ddlb_level2
gb_5 gb_5
gb_4 gb_4
end type
global w_osmsale_r w_osmsale_r

type variables
integer ii_month, ii_idx
datawindowchild idwc_cust, idwc_user, idwc_rotate, idwc_coll

end variables

on w_osmsale_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.ddlb_1=create ddlb_1
this.st_3=create st_3
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_2=create cbx_2
this.pb_1=create pb_1
this.cb_4=create cb_4
this.st_7=create st_7
this.cbx_zero=create cbx_zero
this.dw_5=create dw_5
this.st_8=create st_8
this.dw_6=create dw_6
this.dw_7=create dw_7
this.st_9=create st_9
this.st_10=create st_10
this.cb_6=create cb_6
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.ddlb_level1=create ddlb_level1
this.st_2=create st_2
this.ddlb_level2=create ddlb_level2
this.gb_5=create gb_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.ddlb_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cbx_2
this.Control[iCurrent+17]=this.pb_1
this.Control[iCurrent+18]=this.cb_4
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.cbx_zero
this.Control[iCurrent+21]=this.dw_5
this.Control[iCurrent+22]=this.st_8
this.Control[iCurrent+23]=this.dw_6
this.Control[iCurrent+24]=this.dw_7
this.Control[iCurrent+25]=this.st_9
this.Control[iCurrent+26]=this.st_10
this.Control[iCurrent+27]=this.cb_6
this.Control[iCurrent+28]=this.cbx_team
this.Control[iCurrent+29]=this.dw_sales
this.Control[iCurrent+30]=this.ddlb_level1
this.Control[iCurrent+31]=this.st_2
this.Control[iCurrent+32]=this.ddlb_level2
this.Control[iCurrent+33]=this.gb_5
this.Control[iCurrent+34]=this.gb_4
end on

on w_osmsale_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.ddlb_1)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_2)
destroy(this.pb_1)
destroy(this.cb_4)
destroy(this.st_7)
destroy(this.cbx_zero)
destroy(this.dw_5)
destroy(this.st_8)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.cb_6)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.ddlb_level1)
destroy(this.st_2)
destroy(this.ddlb_level2)
destroy(this.gb_5)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_select, ls_clause, ls_where

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false
dw_3.visible = false
dw_5.visible = false

dw_3.settransobject(sqlca)
dw_sales.settransobject(sqlca)
dw_5.settransobject(sqlca)

// 해당월
ii_idx      = 1
em_1.text   = string(today(),"yyyy")
ddlb_1.text = string(today(),"mm")		// "전체"
ddlb_1.triggerevent( selectionchanged! )

//
dw_1.object.mgr_type.visible = 0

// 회전월
dw_6.insertrow(1)
dw_6.getchild("item_cd",idwc_rotate)
idwc_rotate.settransobject(sqlca)
idwc_rotate.retrieve("수금등급_분류표")
dw_6.object.item_cd[1] = "A"

// 미수금액
dw_7.insertrow(1)
dw_7.getchild("item_cd",idwc_coll)
idwc_coll.settransobject(sqlca)
idwc_coll.retrieve("수금등급_여신잔액")
dw_7.object.item_cd[1] = "A"

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)

//등급
ddlb_level1.text = '% 전체'
ddlb_level2.text = '% 전체'

/*2018.07.19 jowonsuk 동부, 송천 주석처리 전부 다 조회 가능 하게 */
/*if GF_Permission("영업사원_총괄현황(ALL)", gs_userid) = "Y" then*/
	idwc_user.retrieve( "%" )

	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"
	
	cbx_team.checked = true		// 팀조회
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
/*	/*2018.07.19 jowonsuk 동부, 송천 주석처리 전부 다 조회 가능 하게 */
else
	idwc_user.retrieve( gs_userid )
	if idwc_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
		cbx_team.checked = false
	   idwc_cust.setfilter( "salesman = '" + gs_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	else
		// 거래처가 없는 담당자(임원)
		idwc_user.insertrow(1)
		idwc_user.setitem(1,"user_id",gs_userid)
		idwc_user.setitem(1,"user_name",gs_username)
		idwc_user.accepttext()

		cbx_team.checked = true
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	end if
	dw_sales.object.user[1] = gs_userid
end if
*/
dw_sales.setfocus()


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32



end event

type pb_save from w_inheritance`pb_save within w_osmsale_r
boolean visible = false
integer taborder = 100
end type

type dw_1 from w_inheritance`dw_1 within w_osmsale_r
string tag = "d_osmsaletotal_t"
integer x = 32
integer y = 436
integer width = 4293
integer height = 1980
integer taborder = 0
string title = "d_osmsale_t"
string dataobject = "d_osmsaletotal_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::doubleclicked;call super::doubleclicked;
/*거래처 매출 조회로직 반영 2017.11.1 조원석 */

if dwo.name = 'cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.cust_no[row]
	lstr_where.name = this.object.cust_name[row]
	
	select cust_name 
	 INTO :lstr_where.name
	from customer
	WHERE CUST_NO = :lstr_where.str1;
	
	openwithparm(w_whopeom_w, lstr_where)
	
end if
end event

type dw_2 from w_inheritance`dw_2 within w_osmsale_r
integer x = 155
integer y = 176
integer width = 114
integer height = 80
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_osmsaletotal_h"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_osmsale_r
integer x = 32
integer y = 20
integer width = 1134
integer height = 140
string text = "영업사원 총괄현황"
end type

type st_tips from w_inheritance`st_tips within w_osmsale_r
end type

type pb_compute from w_inheritance`pb_compute within w_osmsale_r
boolean visible = false
integer x = 2871
integer y = 60
integer width = 46
integer taborder = 240
end type

type pb_print_part from w_inheritance`pb_print_part within w_osmsale_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_osmsale_r
integer x = 4731
integer y = 72
integer taborder = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osmsale_r
integer x = 4338
integer y = 72
integer taborder = 50
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
 
if dw_1.rowcount() < 1 then RETURN

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 영업사원 총괄현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=98'
OpenSheetWithParm( w_print, l_print, ParentWindow(), 1, Original! )



end event

type pb_cancel from w_inheritance`pb_cancel within w_osmsale_r
boolean visible = false
integer taborder = 280
end type

type pb_delete from w_inheritance`pb_delete within w_osmsale_r
boolean visible = false
integer taborder = 300
end type

type pb_insert from w_inheritance`pb_insert within w_osmsale_r
boolean visible = false
integer x = 2821
integer y = 48
integer width = 55
integer taborder = 320
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osmsale_r
event ue_1 pbm_custom01
event ue_all pbm_custom02
integer x = 4146
integer y = 72
integer taborder = 30
end type

event pb_retrieve::ue_1;//
String  ls_month, ls_top_level
Decimal lr_ym, lr_ys, lr_mm, lr_ms, lr_bm, lr_yb, lr_yy
Decimal lr_aim_inv, lr_aim_del, lr_aim_mod, lr_aim_coll 
Long    ll_row, ll_m, ll_s, ll_row1, ll_column, ll_rows, l_toplevel

ls_month = RightA('0' + string(ii_month), 2)
ll_m     = ii_month + 2
ll_s     = ii_month + 14

ll_rows = dw_2.rowcount()	// 여신현황
for ll_row = 1 to ll_rows 	//dw_2.rowcount()
	//금월매출액, 연간매출액
	lr_yy = dw_2.object.data[ll_row, 2] //전년이월
	for ll_column = 3 to ll_m
		lr_ym = lr_ym + dw_2.object.data[ll_row, ll_column]  // 연간매출
		
		if ll_column = ll_m then
			lr_mm = dw_2.object.data[ll_row, ll_column]       // 금월매출
		end if
	next
	
	//lr_aim_inv, lr_aim_coll , lr_aim_mod, lr_aim_del
	ll_column   = 31 + ii_month
	lr_aim_inv  = dw_2.object.data[ll_row, ll_column]  // 월매출목표
	if isnull(lr_aim_inv) then lr_aim_inv = 0
	
	ll_column   = ll_column + 12
	lr_aim_coll = dw_2.object.data[ll_row, ll_column]  // 월수금목표
	if isnull(lr_aim_coll) then lr_aim_coll = 0
	
	ll_column   = ll_column + 12
	lr_aim_mod  = dw_2.object.data[ll_row, ll_column]  // 월매출수정목표
	if isnull(lr_aim_mod) then lr_aim_mod = 0
		
	ll_column   = ll_column + 12
	lr_aim_del  = dw_2.object.data[ll_row, ll_column]  // 월수금수정목표
	if isnull(lr_aim_del) then lr_aim_del = 0
	
	//금월수금액, 연간수금액
	for ll_column = 15 to ll_s
		lr_ys = lr_ys + dw_2.object.data[ll_row, ll_column]
		if ll_column = ll_s then
			lr_ms = dw_2.object.data[ll_row, ll_column]
		end if
	next
	
	lr_bm = (lr_ym + lr_yy  - lr_mm) - (lr_ys - lr_ms) // 전월잔액
	// 전체거래처
	ll_row1 = dw_1.insertrow(0)
	dw_1.setitem(ll_row1, "cust_name",    dw_2.object.data[ll_row, 31]) // 거래처
	dw_1.setitem(ll_row1, "m_jan",        lr_mm - lr_ms + lr_bm)        // 월말잔액
	dw_1.setitem(ll_row1, "m_m",          lr_mm)                        // 금월매출
	dw_1.setitem(ll_row1, "m_s",          lr_ms)                        // 금월수금
	dw_1.setitem(ll_row1, "bm_jan",       lr_bm)                        // 전월잔액
	dw_1.setitem(ll_row1, "y_m",          lr_ym)                        // 연간매출
	dw_1.setitem(ll_row1, "y_s",          lr_ys)                        // 연간수금
	dw_1.setitem(ll_row1, "m_aim_inv",    lr_aim_inv)                   // 월매출목표
	dw_1.setitem(ll_row1, "m_aim_coll",   lr_aim_coll)                  // 월수금목표
	dw_1.setitem(ll_row1, "m_aim_mod",    lr_aim_mod)                   // 월매출수정목표
	dw_1.setitem(ll_row1, "m_aim_del",    lr_aim_del)                   // 월수금수정목표

	dw_1.setitem(ll_row1, "user_name",    dw_2.object.data[ll_row, 30]) // 담당자

	dw_1.setitem(ll_row1, "credit_level", dw_2.object.data[ll_row, 28]) // 신용
	dw_1.setitem(ll_row1, "level_grade",  dw_2.object.data[ll_row, 29]) // 매출
	dw_1.setitem(ll_row1, "collect_ymd",  dw_2.object.data[ll_row, 80]) // 채권이관
	dw_1.setitem(ll_row1, "reg_no",       dw_2.object.data[ll_row, 81]) // 사업자번호
	dw_1.setitem(ll_row1, "price_level",  dw_2.object.data[ll_row, 82]) // 단가
	
	dw_1.setitem(ll_row1, "mgr_type",     dw_2.object.data[ll_row, 83]) // 관리구분
	dw_1.setitem(ll_row1, "mgr_sort",     dw_2.object.data[ll_row, 84]) // 관리순서
	dw_1.setitem(ll_row1, "colllevel",    dw_2.object.data[ll_row, 85]) // 수금등급
	dw_1.setitem(ll_row1, "cust_idx",     dw_2.object.data[ll_row, 86]) // 출력순서
	dw_1.setitem(ll_row1, "custname_sort",dw_2.object.data[ll_row, 87]) // 거래처단명
	dw_1.setitem(ll_row1, "class",        dw_2.object.data[ll_row, 88]) // 업체유형
	dw_1.setitem(ll_row1, "top_level",    dw_2.object.data[ll_row, 89]) // 종합등급

	/*
	choose case dw_2.object.data[ll_row, 89]
		case "A+" 
			dw_1.setitem(ll_row1, "toplevel",     "1") // 종합등급
		case "A"
			dw_1.setitem(ll_row1, "toplevel",     "2") // 종합등급
		case "B+"
			dw_1.setitem(ll_row1, "toplevel",     "3") // 종합등급
		case "B"
			dw_1.setitem(ll_row1, "toplevel",     "4") // 종합등급
		case "C"
			dw_1.setitem(ll_row1, "toplevel",     "5") // 종합등급
		case "채권"
			dw_1.setitem(ll_row1, "toplevel",     "6") // 종합등급
		case else
			dw_1.setitem(ll_row1, "toplevel",     "7") // 종합등급
	end choose
	*/
	ls_top_level = dw_2.object.data[ll_row, 89]
	
	select dbo.uf_toplevel_sort(:ls_top_level) toplevel
	into :l_toplevel
	from dual;
	
	dw_1.setitem(ll_row1, "toplevel",     l_toplevel) 		
/*	
	choose case dw_2.object.data[ll_row, 89]
		case "Aa" 
			dw_1.setitem(ll_row1, "toplevel",     1) // 종합등급
		case "Ab"
			dw_1.setitem(ll_row1, "toplevel",     2) // 종합등급
		case "Ac"
			dw_1.setitem(ll_row1, "toplevel",     3) // 종합등급			
		case "Ba"
			dw_1.setitem(ll_row1, "toplevel",     4) // 종합등급
		case "Bb"
			dw_1.setitem(ll_row1, "toplevel",     5) // 종합등급
		case "Bc"
			dw_1.setitem(ll_row1, "toplevel",     6) // 종합등급
		case "Ca"
			dw_1.setitem(ll_row1, "toplevel",     7) // 종합등급
		case "Cb"
			dw_1.setitem(ll_row1, "toplevel",     8) // 종합등급
		case "Cc"
			dw_1.setitem(ll_row1, "toplevel",     9) // 종합등급
		case else
			dw_1.setitem(ll_row1, "toplevel",     10) // 종합등급						
	end choose	
*/	
	dw_1.setitem(ll_row1, "cust_no",      dw_2.object.data[ll_row, 1])  // 거래처
	
	// PRINT
	ll_row1 = dw_3.insertrow(0)
	dw_3.setitem(ll_row1, "cust_no",      dw_2.object.data[ll_row, 1])
	dw_3.setitem(ll_row1, "cust_name",    dw_2.object.data[ll_row, 31]) // 거래처
	dw_3.setitem(ll_row1, "m_m",          lr_mm)
	dw_3.setitem(ll_row1, "y_y",          lr_yy)
	dw_3.setitem(ll_row1, "m_s",          lr_ms)
	dw_3.setitem(ll_row1, "y_m",          lr_ym)
	dw_3.setitem(ll_row1, "y_s",          lr_ys)
	dw_3.setitem(ll_row1, "m_aim_inv",    lr_aim_inv)                   // 월매출목표
	dw_3.setitem(ll_row1, "m_aim_coll",   lr_aim_coll)                  // 월수금목표
	dw_3.setitem(ll_row1, "m_aim_mod",    lr_aim_mod)                   // 월매출수정목표
	dw_3.setitem(ll_row1, "m_aim_del",    lr_aim_del)                   // 월수금수정목표
	dw_3.object.month[ll_row1] = ls_month

	dw_3.setitem(ll_row1, "user_name",    dw_2.object.data[ll_row, 30]) // 담당자
	dw_3.setitem(ll_row1, "credit_level", dw_2.object.data[ll_row, 28]) // 신용
	dw_3.setitem(ll_row1, "level_grade",  dw_2.object.data[ll_row, 29]) // 매출
	dw_3.setitem(ll_row1, "price_level",  dw_2.object.data[ll_row, 82]) // 단가
	
	dw_3.setitem(ll_row1, "mgr_type",     dw_2.object.data[ll_row, 83]) // 관리구분
	dw_3.setitem(ll_row1, "mgr_sort",     dw_2.object.data[ll_row, 84]) // 관리순서
	dw_3.setitem(ll_row1, "colllevel",    dw_2.object.data[ll_row, 85]) // 수금등급
	dw_3.setitem(ll_row1, "cust_idx",     dw_2.object.data[ll_row, 86]) // 출력순서
	dw_3.setitem(ll_row1, "custname_sort",dw_2.object.data[ll_row, 87]) // 거래처단명
	dw_3.setitem(ll_row1, "class",        dw_2.object.data[ll_row, 88]) // 업체유형
	dw_3.setitem(ll_row1, "top_level",    dw_2.object.data[ll_row, 89]) // 종합등급
	
	/*
	choose case dw_2.object.data[ll_row, 89]
		case "A+" 
			dw_3.setitem(ll_row1, "toplevel",     "1") // 종합등급
		case "A"
			dw_3.setitem(ll_row1, "toplevel",     "2") // 종합등급
		case "B+"
			dw_3.setitem(ll_row1, "toplevel",     "3") // 종합등급
		case "B"
			dw_3.setitem(ll_row1, "toplevel",     "4") // 종합등급
		case "C"
			dw_3.setitem(ll_row1, "toplevel",     "5") // 종합등급
		case "채권"
			dw_3.setitem(ll_row1, "toplevel",     "6") // 종합등급
		case else
			dw_3.setitem(ll_row1, "toplevel",     "7") // 종합등급
	end choose
	*/
	ls_top_level = dw_2.object.data[ll_row, 89]
	
	select dbo.uf_toplevel_sort(:ls_top_level) toplevel
	into :l_toplevel
	from dual;
	
	dw_3.setitem(ll_row1, "toplevel",     l_toplevel) 		
	
/*
	choose case dw_2.object.data[ll_row, 89]
		case "Aa" 
			dw_3.setitem(ll_row1, "toplevel",     1) // 종합등급
		case "Ab"
			dw_3.setitem(ll_row1, "toplevel",     2) // 종합등급
		case "Ac"
			dw_3.setitem(ll_row1, "toplevel",     3) // 종합등급			
		case "Ba"
			dw_3.setitem(ll_row1, "toplevel",     4) // 종합등급
		case "Bb"
			dw_3.setitem(ll_row1, "toplevel",     5) // 종합등급
		case "Bc"
			dw_3.setitem(ll_row1, "toplevel",     6) // 종합등급
		case "Ca"
			dw_3.setitem(ll_row1, "toplevel",     7) // 종합등급
		case "Cb"
			dw_3.setitem(ll_row1, "toplevel",     8) // 종합등급
		case "Cc"
			dw_3.setitem(ll_row1, "toplevel",     9) // 종합등급
		case else
			dw_3.setitem(ll_row1, "toplevel",     10) // 종합등급						
	end choose		
*/

	
	lr_yy = 0 ; lr_mm = 0 ; lr_ms = 0 ; lr_ym = 0 ;	lr_ys = 0 ; lr_bm = 0
	lr_aim_del  = 0 ;	lr_aim_inv  = 0 ;	lr_aim_coll = 0 ;	lr_aim_mod  = 0
next

// 잔액제로 제외
if dw_1.dataobject = "d_osmsaletotal_t" then
	cbx_zero.enabled = true

	if cbx_zero.checked = true then
		dw_1.setfilter( "calc_chk <> 0" )
		dw_1.filter()
		dw_3.setfilter( "calc_chk <> 0" )
		dw_3.filter()
	end if
else
	cbx_zero.enabled = false
end if

end event

event pb_retrieve::ue_all;//
string ls_top_level
decimal lr_ym, lr_ys, lr_mm, lr_ms, lr_bm, lr_yb, lr_yy
decimal lr_aim_inv, lr_aim_del, lr_aim_mod, lr_aim_coll 
long    ll_row,  ll_row1, ll_column, l_toplevel

for ll_row = 1 to dw_2.rowcount()
	// 금월매출액, 연간매출액
	lr_yy = dw_2.object.data[ll_row, 2] // 전월잔액

	for ll_column = 3 to 14
		lr_ym = lr_ym + dw_2.object.data[ll_row, ll_column]  // 연간매출
	next

	//lr_aim_inv, lr_aim_coll , lr_aim_mod, lr_aim_del
	
	// 금월수금액, 연간수금액
	for ll_column = 15 to 26
		lr_ys = lr_ys + dw_2.object.data[ll_row, ll_column]  // 년간수금액
	next
	for ll_column = 32 to 43
		lr_aim_inv = lr_aim_inv + dw_2.object.data[ll_row, ll_column]   // 년간 매출목표
	next
	if isnull(lr_aim_inv) then lr_aim_inv = 0
	
	for ll_column = 44 to 55
		lr_aim_coll = lr_aim_coll + dw_2.object.data[ll_row, ll_column] // 년간 수금목표
	next
	if isnull(lr_aim_coll) then lr_aim_coll = 0
	
	for ll_column = 56 to 67
		lr_aim_mod = lr_aim_mod + dw_2.object.data[ll_row, ll_column]   // 년간 수정매출목표
	next
	if isnull(lr_aim_mod) then lr_aim_mod = 0
	
	for ll_column = 68 to 79
		lr_aim_del = lr_aim_del + dw_2.object.data[ll_row, ll_column]   // 년간 수정수금목표
	next
	if isnull(lr_aim_del) then lr_aim_del = 0
	

	lr_bm = (lr_ym + lr_yy  - lr_mm) - (lr_ys - lr_ms) // 전월잔액
	// 전체거래처
	ll_row1 = dw_1.insertrow(0)
	dw_1.setitem(ll_row1, "cust_name",    dw_2.object.data[ll_row, 31]) // 거래처
	dw_1.setitem(ll_row1, "m_jan",        lr_mm - lr_ms + lr_bm)        // 월말잔액
	dw_1.setitem(ll_row1, "m_m",          lr_mm)                        // 금월매출
	dw_1.setitem(ll_row1, "m_s",          lr_ms)                        // 금월수금
	dw_1.setitem(ll_row1, "bm_jan",       lr_bm)                        // 전월잔액
	dw_1.setitem(ll_row1, "y_m",          lr_ym)                        // 연간매출
	dw_1.setitem(ll_row1, "y_s",          lr_ys)                        // 연간수금
	dw_1.setitem(ll_row1, "m_aim_inv",    lr_aim_inv)                   // 매출목표
	dw_1.setitem(ll_row1, "m_aim_coll",   lr_aim_coll)                  // 수금목표
	dw_1.setitem(ll_row1, "m_aim_mod",    lr_aim_mod)                   // 매출수정목표
	dw_1.setitem(ll_row1, "m_aim_del",    lr_aim_del)                   // 수금수정목표

	dw_1.setitem(ll_row1, "user_name",    dw_2.object.data[ll_row, 30]) // 담당자

	dw_1.setitem(ll_row1, "credit_level", dw_2.object.data[ll_row, 28]) // 신용
	dw_1.setitem(ll_row1, "level_grade",  dw_2.object.data[ll_row, 29]) // 매출
	dw_1.setitem(ll_row1, "price_level",  dw_2.object.data[ll_row, 82]) // 단가
	dw_1.setitem(ll_row1, "mgr_type",     dw_2.object.data[ll_row, 83]) // 관리구분
	dw_1.setitem(ll_row1, "mgr_sort",     dw_2.object.data[ll_row, 84]) // 관리순서
	dw_1.setitem(ll_row1, "colllevel",    dw_2.object.data[ll_row, 85]) // 수금등급
	dw_1.setitem(ll_row1, "cust_idx",     dw_2.object.data[ll_row, 86]) // 출력순서
	dw_1.setitem(ll_row1, "custname_sort",dw_2.object.data[ll_row, 87]) // 거래처단명
	dw_1.setitem(ll_row1, "class",        dw_2.object.data[ll_row, 88]) // 업체유형
	dw_1.setitem(ll_row1, "top_level",    dw_2.object.data[ll_row, 89]) // 종합등급
	
	/*
	choose case dw_2.object.data[ll_row, 89]
		case "A+" 
			dw_1.setitem(ll_row1, "toplevel",     "1") // 종합등급
		case "A"
			dw_1.setitem(ll_row1, "toplevel",     "2") // 종합등급
		case "B+"
			dw_1.setitem(ll_row1, "toplevel",     "3") // 종합등급
		case "B"
			dw_1.setitem(ll_row1, "toplevel",     "4") // 종합등급
		case "C"
			dw_1.setitem(ll_row1, "toplevel",     "5") // 종합등급
		case "채권"
			dw_1.setitem(ll_row1, "toplevel",     "6") // 종합등급
		case else
			dw_1.setitem(ll_row1, "toplevel",     "7") // 종합등급
	end choose
	*/
	ls_top_level = dw_2.object.data[ll_row, 89]
	
	select dbo.uf_toplevel_sort(:ls_top_level) toplevel
	into :l_toplevel
	from dual;
	
	dw_1.setitem(ll_row1, "toplevel",     l_toplevel) 		
/*	
	choose case dw_2.object.data[ll_row, 89]
		case "Aa" 
			dw_1.setitem(ll_row1, "toplevel",     1) // 종합등급
		case "Ab"
			dw_1.setitem(ll_row1, "toplevel",     2) // 종합등급
		case "Ac"
			dw_1.setitem(ll_row1, "toplevel",     3) // 종합등급			
		case "Ba"
			dw_1.setitem(ll_row1, "toplevel",     4) // 종합등급
		case "Bb"
			dw_1.setitem(ll_row1, "toplevel",     5) // 종합등급
		case "Bc"
			dw_1.setitem(ll_row1, "toplevel",     6) // 종합등급
		case "Ca"
			dw_1.setitem(ll_row1, "toplevel",     7) // 종합등급
		case "Cb"
			dw_1.setitem(ll_row1, "toplevel",     8) // 종합등급
		case "Cc"
			dw_1.setitem(ll_row1, "toplevel",     9) // 종합등급
		case else
			dw_1.setitem(ll_row1, "toplevel",     10) // 종합등급			
	end choose	
*/	
	dw_1.setitem(ll_row1, "cust_no",      dw_2.object.data[ll_row, 1]) // 거래처
	
	// PRINT
	ll_row1 = dw_3.insertrow(0)
	dw_3.setitem(ll_row1, "cust_no",      dw_2.object.data[ll_row, 1])
	dw_3.setitem(ll_row1, "cust_name",    dw_2.object.data[ll_row, 31]) // 거래처
	dw_3.setitem(ll_row1, "m_m",          lr_mm)
	dw_3.setitem(ll_row1, "y_y",          lr_yy)
	dw_3.setitem(ll_row1, "m_s",          lr_ms)
	dw_3.setitem(ll_row1, "y_m",          lr_ym)
	dw_3.setitem(ll_row1, "y_s",          lr_ys)
	dw_3.setitem(ll_row1, "m_aim_inv",    lr_aim_inv)                   // 월매출목표
	dw_3.setitem(ll_row1, "m_aim_coll",   lr_aim_coll)                  // 월수금목표
	dw_3.setitem(ll_row1, "m_aim_mod",    lr_aim_mod)                   // 월매출수정목표
	dw_3.setitem(ll_row1, "m_aim_del",    lr_aim_del)                   // 월수금수정목표

	dw_3.object.month[ll_row1] = "**"
	dw_3.object.year[ll_row1]  = LeftA(em_1.text, 4)

	dw_3.setitem(ll_row1, "user_name",    dw_2.object.data[ll_row, 30]) // 담당자
	
	dw_3.setitem(ll_row1, "credit_level", dw_2.object.data[ll_row, 28]) // 신용
	dw_3.setitem(ll_row1, "level_grade",  dw_2.object.data[ll_row, 29]) // 매출
	dw_3.setitem(ll_row1, "price_level",  dw_2.object.data[ll_row, 82]) // 단가
	dw_3.setitem(ll_row1, "mgr_type",     dw_2.object.data[ll_row, 83]) // 관리구분
	dw_3.setitem(ll_row1, "mgr_sort",     dw_2.object.data[ll_row, 84]) // 관리순서
	dw_3.setitem(ll_row1, "colllevel",    dw_2.object.data[ll_row, 85]) // 수금등급
	dw_3.setitem(ll_row1, "cust_idx",     dw_2.object.data[ll_row, 86]) // 출력순서
	dw_3.setitem(ll_row1, "custname_sort",dw_2.object.data[ll_row, 87]) // 거래처단명
	dw_3.setitem(ll_row1, "class",        dw_2.object.data[ll_row, 88]) // 업체유형
	dw_3.setitem(ll_row1, "top_level",    dw_2.object.data[ll_row, 89]) // 종합등급

/*	
	choose case dw_2.object.data[ll_row, 89]
		case "A+" 
			dw_3.setitem(ll_row1, "toplevel",     "1") // 종합등급
		case "A"
			dw_3.setitem(ll_row1, "toplevel",     "2") // 종합등급
		case "B+"
			dw_3.setitem(ll_row1, "toplevel",     "3") // 종합등급
		case "B"
			dw_3.setitem(ll_row1, "toplevel",     "4") // 종합등급
		case "C"
			dw_3.setitem(ll_row1, "toplevel",     "5") // 종합등급
		case "채권"
			dw_3.setitem(ll_row1, "toplevel",     "6") // 종합등급
		case else
			dw_3.setitem(ll_row1, "toplevel",     "7") // 종합등급
	end choose
  */
	ls_top_level = dw_2.object.data[ll_row, 89]
	
	select dbo.uf_toplevel_sort(:ls_top_level) toplevel
	into :l_toplevel
	from dual;
	
	dw_3.setitem(ll_row1, "toplevel",     l_toplevel) 	  
  /*
  	choose case dw_2.object.data[ll_row, 89]
		case "Aa" 
			dw_3.setitem(ll_row1, "toplevel",     1) // 종합등급
		case "Ab"
			dw_3.setitem(ll_row1, "toplevel",     2) // 종합등급
		case "Ac"
			dw_3.setitem(ll_row1, "toplevel",     3) // 종합등급			
		case "Ba"
			dw_3.setitem(ll_row1, "toplevel",     4) // 종합등급
		case "Bb"
			dw_3.setitem(ll_row1, "toplevel",     5) // 종합등급
		case "Bc"
			dw_3.setitem(ll_row1, "toplevel",     6) // 종합등급
		case "Ca"
			dw_3.setitem(ll_row1, "toplevel",     7) // 종합등급
		case "Cb"
			dw_3.setitem(ll_row1, "toplevel",     8) // 종합등급
		case "Cc"
			dw_3.setitem(ll_row1, "toplevel",     9) // 종합등급
		case else
			dw_3.setitem(ll_row1, "toplevel",     10) // 종합등급			
	end choose	
	*/
	lr_yy = 0 ; lr_mm = 0 ;	lr_ms = 0 ;	lr_ym = 0 ;	lr_ys = 0 ;	lr_bm = 0
	lr_aim_del  = 0 ;	lr_aim_inv  = 0 ;	lr_aim_coll = 0 ;	lr_aim_mod  = 0
next

end event

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_month, ls_date, ls_custname, ls_userid, ls_rotate, ls_coll, ls_colllevel, ls_top_level, ls_top_level1, ls_top_level2
long   ll_year, ll_row, ll_col, ll_found, ll_custsort

dw_1.reset() ; 
dw_2.reset() ; 
dw_3.reset();

cbx_2.checked = false	// 틀고정
dw_1.object.datawindow.horizontalscrollsplit = 0

if em_1.text = "" then
	MessageBox("확인","해당월을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
end if

//
ls_date = em_1.text
ll_year = long(LeftA(ls_date, 4))

// 회전월, 미수금액
ls_rotate    = dw_6.object.item_cd[1]
ls_coll      = dw_7.object.item_cd[1]
ls_colllevel = ls_rotate + ls_coll

// 담당자
dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

//종합등급
ls_top_level1  = trim(LeftA(ddlb_level1.text,1))
ls_top_level2  = trim(LeftA(ddlb_level2.text,1))


// 거래처정렬 순서DATA
dw_5.retrieve()		
dw_2.retrieve( ll_year, ls_userid )

if dw_2.rowcount() < 1 then 
   MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	RETURN
end if

dw_1.setredraw( false )
dw_3.setredraw( false )

ii_month = integer(ddlb_1.text)
if ddlb_1.text = "전체" then			// 해당월
	this.triggerevent('ue_all') 
else											// 1월 ~ 12월
	this.triggerevent('ue_1') 
end if

///////////////////////////////////////////////////////////////////
// 거래처 정렬순서 변경하기
///////////////////////////////////////////////////////////////////
ll_custsort = 0
for ll_row = 1 to dw_1.rowcount()
	dw_1.object.cust_sort[ll_row] = 9999
	dw_3.object.cust_sort[ll_row] = 9999
next

// 거래처순서
for ll_row = 1 to dw_5.rowcount()
	// 유관거래처명
	for ll_col = 1 to 2
		choose case ll_col
			case 1
				ls_custname = dw_5.object.customer_cust_name[ll_row]

			case 2
				
				ls_custname = dw_5.object.customer_rcust_name[ll_row]
				
		end choose
		
		if isnull(ls_custname) OR ls_custname = "" then
		else
			ll_found = dw_1.find( "cust_name = '" + ls_custname + "' ", 1, dw_1.rowcount() )
			if isnull(ll_found) OR ll_found < 1 then
				//
			else
				ll_custsort = ll_custsort + 1
				dw_1.object.cust_sort[ll_found] = ll_custsort
				dw_3.object.cust_sort[ll_found] = ll_custsort

				dw_1.object.cust_name[ll_found] = "*" + dw_1.object.cust_name[ll_found]
				dw_3.object.cust_name[ll_found] = "*" + dw_3.object.cust_name[ll_found]
				
			end if
		end if
	next
next
///////////////////////////////////////////////////////////////////

// 수금등급 필터
//dw_1.setfilter( "colllevel >= '" + ls_colllevel + "'" )
dw_1.setfilter( " colllevel >= '" + ls_colllevel + "' and ( if( isnull( mid(top_level,1,1) ), '%', mid(top_level,1,1) ) like '"+ ls_top_level1 + "') and ( if( isnull( mid(top_level,2,1) ), '%', mid(top_level,2,1) ) like '" + ls_top_level2 + "')" );
//dw_1.setFilter("(A LIKE '" + ls_filter + "') OR (B LIKE '" + ls_filter + "')");
dw_1.filter()
//dw_3.setfilter( "colllevel >= '" + ls_colllevel + "'" )
dw_3.setfilter( " colllevel >= '" + ls_colllevel + "' and ( if( isnull( mid(top_level,1,1) ), '%', mid(top_level,1,1) ) like '"+ ls_top_level1 + "') and ( if( isnull( mid(top_level,2,1) ), '%', mid(top_level,2,1) ) like '" + ls_top_level2 + "')" );
dw_3.filter()

//// 2018.01.28 조원석 소팅 관련 주석 처리 시작 //
													//cust_idx A, mgr_sort A, cust_sort A, 
//dw_1.SetSort("user_name A, toplevel A, cust_sort A, custname_sort A")	
dw_1.SetSort("user_name A, toplevel A,  cust_sort A, custname_sort A")	
dw_1.Sort()	

//dw_3.SetSort("user_name A, toplevel A, cust_sort A, custname_sort A")	
dw_3.SetSort("user_name A, toplevel A,  cust_sort A, custname_sort A")	
dw_3.Sort()
//// 2018.01.28 조원석 소팅 관련 주석 처리  끝//
dw_1.groupcalc()
dw_3.groupcalc()

dw_1.setredraw( true )
dw_3.setredraw( true )
///////////////////////////////////////////////////////////////////

dw_1.setfocus()
MessageBox("확인","조회완료")


end event

type gb_3 from w_inheritance`gb_3 within w_osmsale_r
integer x = 1211
integer y = 16
integer width = 1687
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osmsale_r
integer y = 248
integer width = 4293
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osmsale_r
integer x = 4114
integer y = 16
integer width = 841
integer height = 232
integer taborder = 0
integer weight = 400
end type

type em_1 from editmask within w_osmsale_r
integer x = 1490
integer y = 56
integer width = 201
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
end type

type st_1 from statictext within w_osmsale_r
integer x = 1225
integer y = 68
integer width = 261
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "년도:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_osmsale_r
integer x = 274
integer y = 176
integer width = 114
integer height = 80
integer taborder = 170
boolean bringtotop = true
string title = "d_osmsaletotal_r1"
string dataobject = "d_osmsaletotal_r"
end type

type ddlb_1 from dropdownlistbox within w_osmsale_r
integer x = 2021
integer y = 52
integer width = 242
integer height = 812
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "전체"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","01","02","03","04","05","06","07","08","09","10","11","12"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// 해당월
ii_idx = index

choose case ii_idx
	case 1		// 전체
		dw_1.dataobject = 'd_osmsale_t'
		dw_3.dataobject = 'd_osmsaletotal_r'
	case else	// 1월,12월
		dw_1.dataobject = 'd_osmsaletotal_t'
		dw_3.dataobject = 'd_osmsaletotal_r'
end choose

//
dw_1.object.mgr_type.visible = 0


end event

type st_3 from statictext within w_osmsale_r
integer x = 1755
integer y = 68
integer width = 261
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "해당월:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_osmsale_r
integer x = 119
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_osmsale_r
integer x = 306
integer y = 304
integer width = 480
integer height = 632
integer taborder = 210
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

type ddlb_dwtitles from dropdownlistbox within w_osmsale_r
integer x = 375
integer y = 320
integer width = 329
integer height = 88
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
end type

type st_6 from statictext within w_osmsale_r
integer x = 823
integer y = 320
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

type ddlb_op from dropdownlistbox within w_osmsale_r
integer x = 992
integer y = 304
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_osmsale_r
integer x = 1312
integer y = 308
integer width = 567
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_osmsale_r
integer x = 1893
integer y = 308
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
string text = "필터"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Filter( arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_osmsale_r
integer x = 2057
integer y = 308
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

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

// 잔액제로 제외
cbx_zero.triggerevent( clicked! )
end event

type cb_3 from commandbutton within w_osmsale_r
integer x = 2222
integer y = 308
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_osmsale_r
integer x = 2386
integer y = 308
integer width = 160
integer height = 76
integer taborder = 290
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

type cbx_2 from checkbox within w_osmsale_r
integer x = 2587
integer y = 316
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;// 해당월
string ls_position

if ddlb_1.text = "전체" then
	ls_position = dw_1.object.m_aim_inv.x // 일반 전체
else
	ls_position = dw_1.object.m_jan.x     // 일반 당월
end if
	
if this.checked = true then
	dw_1.object.datawindow.horizontalscrollsplit = ls_position
else
	dw_1.object.datawindow.horizontalscrollsplit = 0
end if

end event

type pb_1 from picturebutton within w_osmsale_r
event mousemove pbm_mousemove
string tag = "파일"
integer x = 4535
integer y = 72
integer width = 187
integer height = 144
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	//   "파워빌더리포트 (*.PSR),*.PSR," + &
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)				
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인", "작업완료")
	end if
end if

end event

type cb_4 from commandbutton within w_osmsale_r
integer x = 2880
integer y = 292
integer width = 599
integer height = 104
integer taborder = 310
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "매출채권 연령표"
end type

event clicked;//
string ls_yyyymm

if IsValid(w_o_main) then 
	OpenSheet(w_ocsaleageing_r,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_ocsaleageing_r,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_ocsaleageing_r,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_ocsaleageing_r,  w_all_main, 5, original!)
end if

if ddlb_1.text = "전체" then
	ls_yyyymm = string(gf_today(), "yyyy/mm")
else
	ls_yyyymm = em_1.text + "/" + ddlb_1.text
end if

w_ocsaleageing_r.em_1.text = ls_yyyymm
w_ocsaleageing_r.dw_4.object.user[1] = dw_sales.object.user[1]
w_ocsaleageing_r.pb_retrieve.triggerevent( clicked! )

end event

type st_7 from statictext within w_osmsale_r
integer x = 2939
integer y = 60
integer width = 485
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

type cbx_zero from checkbox within w_osmsale_r
integer x = 3493
integer y = 316
integer width = 567
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "CHK 제로 제외"
end type

event clicked;// 잔액제로 제외
if dw_1.dataobject = "d_osmsaletotal_t" then
	if cbx_zero.checked = true then
		dw_1.setfilter( "calc_chk <> 0" )
		dw_1.filter()
		dw_3.setfilter( "calc_chk <> 0" )
		dw_3.filter()
	else
		dw_1.setfilter( "" )
		dw_1.filter()
		dw_3.setfilter( "" )
		dw_3.filter()
	end if
end if

end event

type dw_5 from datawindow within w_osmsale_r
integer x = 37
integer y = 176
integer width = 110
integer height = 80
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdcustomer_grp"
boolean controlmenu = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_osmsale_r
integer x = 1225
integer y = 164
integer width = 261
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "회전월:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_osmsale_r
integer x = 1486
integer y = 148
integer width = 535
integer height = 84
integer taborder = 200
boolean bringtotop = true
string title = "none"
string dataobject = "d_codemst_c"
boolean border = false
boolean livescroll = true
end type

type dw_7 from datawindow within w_osmsale_r
integer x = 2213
integer y = 148
integer width = 535
integer height = 84
integer taborder = 230
boolean bringtotop = true
string title = "none"
string dataobject = "d_codemst_c"
boolean border = false
boolean livescroll = true
end type

type st_9 from statictext within w_osmsale_r
integer x = 2011
integer y = 164
integer width = 192
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "잔액:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_10 from statictext within w_osmsale_r
integer x = 2738
integer y = 168
integer width = 146
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "이상"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_osmsale_r
integer x = 2267
integer y = 48
integer width = 613
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "업체유형"
end type

event clicked;//
string ls_msg

ls_msg  = "A1 : 사월회~n"
ls_msg += "A2 : 공략업체~n"
ls_msg += "A3 : 우량,중점업체~n"
ls_msg += "~n"
ls_msg += "B1 : 유통업체~n"
ls_msg += "B2 : 년간단가(입찰)업체~n"
ls_msg += "B3 : 생산업체~n"
ls_msg += "~n"
ls_msg += "C1 : 매출순위 중간(결제양호)~n"
ls_msg += "C11: 매출순위 중간(불량)~n"
ls_msg += "C2 : 소액업체(양호)~n"
ls_msg += "C22: 소액업체(불량)~n"
ls_msg += "~n"
ls_msg += "D  : 고액/장기미수 유지업체~n"
ls_msg += "~n"
ls_msg += "X1 : 단발,건별(수출)공사,특수품~n"
ls_msg += "X2 : 채권회수업체~n"
ls_msg += "X3 : 관망,거래대기~n"

MessageBox("확인",ls_msg)
end event

type cbx_team from checkbox within w_osmsale_r
integer x = 3273
integer y = 160
integer width = 160
integer height = 56
integer taborder = 110
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
string text = "팀"
end type

event clicked;// 팀
string ls_userid

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

if ls_userid = "%" then
	// 전체
else
	if cbx_team.checked = true then
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	else
		idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	end if
end if

end event

type dw_sales from datawindow within w_osmsale_r
integer x = 2939
integer y = 140
integer width = 329
integer height = 88
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
string ls_userid
long   ll_row, ll_seq

for ll_row = 1 to idwc_user.rowcount()
	ls_userid = idwc_user.getitemstring(ll_row, "user_id")
	SELECT isnull(seq,99) INTO :ll_seq FROM opeom_org WHERE user_id = :ls_userid;
	if gs_userid = ls_userid then
		idwc_user.setitem(ll_row, "seq", 0)
	else
		idwc_user.setitem(ll_row, "seq", ll_seq)
	end if
next
idwc_user.setfilter( "seq A" )
idwc_user.sort()

end event

event itemchanged;////
//string ls_userid, ls_myauth
//long   ll_row, ll_find
//
//this.accepttext()
//ls_userid = this.object.user[1]
//
//// 거래처
//dw_cust.enabled = true
//dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)
//
//dw_cust.SetTransObject(SQLCA)
//dw_cust.getchild("cust_no", idwc_cust)
//idwc_cust.SetTransObject(sqlca)
//
//if GF_Permission("영업사원_총괄현황(ALL)", gs_userid) = "Y" then
//	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "%")
//	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
//	idwc_cust.accepttext()
//	dw_cust.object.cust_no[1] = "%"
//else
//	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "ALL")
//	idwc_cust.setitem(1, "cust_name", "1.담당전체")
//	idwc_cust.accepttext()
//	dw_cust.object.cust_no[1] = "ALL"
//end if
//
//// 팀
//if cbx_team.checked = true then
//	idwc_cust.setfilter( "" )
//	idwc_cust.filter()
//else
//	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
//	idwc_cust.filter()
//end if
//this.accepttext()
//
end event

type ddlb_level1 from dropdownlistbox within w_osmsale_r
integer x = 3502
integer y = 140
integer width = 293
integer height = 944
integer taborder = 150
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
integer limit = 7
string item[] = {"% 전체","A 등급","B 등급","C 등급"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;////
//int    li_year
//long   ll_row
//string ls_open, ls_zero, ls_salesman, ls_username, ls_class
//
/////////////////////////////////////////////
//// 업체유형 제외
/////////////////////////////////////////////
//ls_class  = trim(left(ddlb_1.text,2))
//if ls_class = "%" then
//	dw_9.visible = false
//
//	// 잔액(카드)존재 업체
//	if cbx_card.checked = true then
//		dw_9.title = "카드 등록업체"
//		dw_9.dataobject = "d_cdcustmaster_r_cards"
//		dw_9.SetTransObject(SQLCA)
//	else
//		dw_9.title = "잔액 존재업체"
//		dw_9.dataobject = "d_cdcustmaster_r_sales"
//		dw_9.SetTransObject(SQLCA)
//	end if
//else
//	dw_9.title = "업체유형"
//	dw_9.dataobject = "d_cdcustmaster_r_class"
//	dw_9.SetTransObject(SQLCA)
//end if
//
/////////////////////////////////////////////
//// 사용불가 제외
/////////////////////////////////////////////
//if cbx_open.checked = true then
//	ls_open = "O"
//else
//	ls_open = "%"
//end if
//
/////////////////////////////////////////////
//// 잔액제로 제외
/////////////////////////////////////////////
//if cbx_zero.checked = true then
//	ls_zero = "Y"
//else
//	ls_zero = "%"
//end if
//
//// 담당자 
//dw_salesman.accepttext()
//ls_salesman = dw_salesman.object.user[1]
//
//// 일괄출력
//if trim(left(ddlb_1.text,3)) = "%" then 	// 전체사용자
//	pb_auto.enabled = false
//else
//	if ls_salesman = gs_userid then	// 로긴담당자 
//		pb_auto.enabled = true
//	else
//		if GF_PERMISSION("거래처_여신현황(일괄)", gs_userid) = "Y" then
//			pb_auto.enabled = true
//		else
//			pb_auto.enabled = false
//		end if
//	end if
//end if
//
//// 년도
//li_year   = integer(em_1.text)
//
////================================//
//dw_1.getchild("cust_no", idwc_cust)
//idwc_cust.settransobject(sqlca)
//ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust.setsort('mgr_sort, cust_no, cust_name')
//idwc_cust.sort()
////================================//
//dw_1.getchild("cust_name", idwc_cust_name)
//idwc_cust_name.settransobject(sqlca)
//ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust_name.setsort('mgr_sort, cust_name, cust_no')
//idwc_cust_name.sort()
////================================//
//dw_1.getchild("icube_no", idwc_icube)
//idwc_icube.settransobject(sqlca)
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_icube.setsort('icube_no, cust_name')
//idwc_icube.sort()
/////////////////////////////////////////////
//
//// 잔액(카드)존재 업체
//if cbx_card.checked = true then
//	dw_9.title = "카드 등록업체"
//	dw_9.dataobject = "d_cdcustmaster_r_cards"
//	dw_9.SetTransObject(SQLCA)
//else
//	dw_9.title = "업체유형"
//	dw_9.dataobject = "d_cdcustmaster_r_class"
//	dw_9.SetTransObject(SQLCA)
//end if
//
//ll_row = dw_9.Retrieve( ls_open, ls_salesman, li_year, ls_class )
//
//if ll_row < 1 then
//	if cbx_card.checked = true then
//		MessageBox("확인","카드 등록업체가 존재하지 않습니다.")
//		return	
//	else
//		MessageBox("확인","업체유형 데이터가 존재하지 않습니다.")
//		return	
//	end if
//end if
//
//SELECT user_name INTO :ls_username FROM login WHERE user_id = :ls_salesman;
//st_salesman.text = ls_username 	// 현재담당자
//
//
end event

type st_2 from statictext within w_osmsale_r
integer x = 3502
integer y = 60
integer width = 585
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
string text = "종합등급"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_level2 from dropdownlistbox within w_osmsale_r
integer x = 3799
integer y = 144
integer width = 293
integer height = 944
integer taborder = 130
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
integer limit = 7
string item[] = {"% 전체","a 등급","b 등급","c 등급"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;////
//int    li_year
//long   ll_row
//string ls_open, ls_zero, ls_salesman, ls_username, ls_class
//
/////////////////////////////////////////////
//// 업체유형 제외
/////////////////////////////////////////////
//ls_class  = trim(left(ddlb_1.text,2))
//if ls_class = "%" then
//	dw_9.visible = false
//
//	// 잔액(카드)존재 업체
//	if cbx_card.checked = true then
//		dw_9.title = "카드 등록업체"
//		dw_9.dataobject = "d_cdcustmaster_r_cards"
//		dw_9.SetTransObject(SQLCA)
//	else
//		dw_9.title = "잔액 존재업체"
//		dw_9.dataobject = "d_cdcustmaster_r_sales"
//		dw_9.SetTransObject(SQLCA)
//	end if
//else
//	dw_9.title = "업체유형"
//	dw_9.dataobject = "d_cdcustmaster_r_class"
//	dw_9.SetTransObject(SQLCA)
//end if
//
/////////////////////////////////////////////
//// 사용불가 제외
/////////////////////////////////////////////
//if cbx_open.checked = true then
//	ls_open = "O"
//else
//	ls_open = "%"
//end if
//
/////////////////////////////////////////////
//// 잔액제로 제외
/////////////////////////////////////////////
//if cbx_zero.checked = true then
//	ls_zero = "Y"
//else
//	ls_zero = "%"
//end if
//
//// 담당자 
//dw_salesman.accepttext()
//ls_salesman = dw_salesman.object.user[1]
//
//// 일괄출력
//if trim(left(ddlb_1.text,3)) = "%" then 	// 전체사용자
//	pb_auto.enabled = false
//else
//	if ls_salesman = gs_userid then	// 로긴담당자 
//		pb_auto.enabled = true
//	else
//		if GF_PERMISSION("거래처_여신현황(일괄)", gs_userid) = "Y" then
//			pb_auto.enabled = true
//		else
//			pb_auto.enabled = false
//		end if
//	end if
//end if
//
//// 년도
//li_year   = integer(em_1.text)
//
////================================//
//dw_1.getchild("cust_no", idwc_cust)
//idwc_cust.settransobject(sqlca)
//ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust.setsort('mgr_sort, cust_no, cust_name')
//idwc_cust.sort()
////================================//
//dw_1.getchild("cust_name", idwc_cust_name)
//idwc_cust_name.settransobject(sqlca)
//ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust_name.setsort('mgr_sort, cust_name, cust_no')
//idwc_cust_name.sort()
////================================//
//dw_1.getchild("icube_no", idwc_icube)
//idwc_icube.settransobject(sqlca)
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_icube.setsort('icube_no, cust_name')
//idwc_icube.sort()
/////////////////////////////////////////////
//
//// 잔액(카드)존재 업체
//if cbx_card.checked = true then
//	dw_9.title = "카드 등록업체"
//	dw_9.dataobject = "d_cdcustmaster_r_cards"
//	dw_9.SetTransObject(SQLCA)
//else
//	dw_9.title = "업체유형"
//	dw_9.dataobject = "d_cdcustmaster_r_class"
//	dw_9.SetTransObject(SQLCA)
//end if
//
//ll_row = dw_9.Retrieve( ls_open, ls_salesman, li_year, ls_class )
//
//if ll_row < 1 then
//	if cbx_card.checked = true then
//		MessageBox("확인","카드 등록업체가 존재하지 않습니다.")
//		return	
//	else
//		MessageBox("확인","업체유형 데이터가 존재하지 않습니다.")
//		return	
//	end if
//end if
//
//SELECT user_name INTO :ls_username FROM login WHERE user_id = :ls_salesman;
//st_salesman.text = ls_username 	// 현재담당자
//
//
end event

type gb_5 from groupbox within w_osmsale_r
integer x = 2917
integer y = 16
integer width = 544
integer height = 232
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79219928
end type

type gb_4 from groupbox within w_osmsale_r
integer x = 3488
integer y = 16
integer width = 617
integer height = 232
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

