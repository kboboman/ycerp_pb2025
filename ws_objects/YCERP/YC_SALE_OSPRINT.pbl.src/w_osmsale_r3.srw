$PBExportHeader$w_osmsale_r3.srw
$PBExportComments$영업사원 총괄현황[1999/03/31, 조현춘]
forward
global type w_osmsale_r3 from w_inheritance
end type
type em_1 from editmask within w_osmsale_r3
end type
type st_1 from statictext within w_osmsale_r3
end type
type dw_3 from datawindow within w_osmsale_r3
end type
type dw_4 from datawindow within w_osmsale_r3
end type
type ddlb_1 from dropdownlistbox within w_osmsale_r3
end type
type st_3 from statictext within w_osmsale_r3
end type
type st_5 from statictext within w_osmsale_r3
end type
type ddlb_fld from dropdownlistbox within w_osmsale_r3
end type
type ddlb_dwtitles from dropdownlistbox within w_osmsale_r3
end type
type st_6 from statictext within w_osmsale_r3
end type
type ddlb_op from dropdownlistbox within w_osmsale_r3
end type
type sle_value from singlelineedit within w_osmsale_r3
end type
type cb_1 from commandbutton within w_osmsale_r3
end type
type cb_2 from commandbutton within w_osmsale_r3
end type
type cb_3 from commandbutton within w_osmsale_r3
end type
type cb_5 from commandbutton within w_osmsale_r3
end type
type cbx_2 from checkbox within w_osmsale_r3
end type
type pb_1 from picturebutton within w_osmsale_r3
end type
type cb_4 from commandbutton within w_osmsale_r3
end type
type st_7 from statictext within w_osmsale_r3
end type
type cbx_zero from checkbox within w_osmsale_r3
end type
type dw_5 from datawindow within w_osmsale_r3
end type
type gb_4 from groupbox within w_osmsale_r3
end type
end forward

global type w_osmsale_r3 from w_inheritance
integer x = 23
integer y = 112
integer width = 4192
integer height = 2244
string title = "영업사원 특별관리(퇴직)(w_osmsale_r3)"
em_1 em_1
st_1 st_1
dw_3 dw_3
dw_4 dw_4
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
gb_4 gb_4
end type
global w_osmsale_r3 w_osmsale_r3

type variables
integer ii_month, ii_idx
datawindowchild idwc_user, idwc_rotate, idwc_coll

end variables

on w_osmsale_r3.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_4=create dw_4
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
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.ddlb_1
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.cbx_2
this.Control[iCurrent+18]=this.pb_1
this.Control[iCurrent+19]=this.cb_4
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.cbx_zero
this.Control[iCurrent+22]=this.dw_5
this.Control[iCurrent+23]=this.gb_4
end on

on w_osmsale_r3.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_4)
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
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_select, ls_clause, ls_where

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_2.visible = false
dw_3.visible = false
dw_5.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

// 담당자
dw_4.insertrow(1)
dw_4.getchild("user",idwc_user)

//idwc_user.insertrow(1)
//idwc_user.setitem(1,"user_id","%")
//idwc_user.setitem(1,"user_name","전체")
//idwc_user.accepttext()
dw_4.object.user[1] = "kytida7"

// 해당월
// 해당월
ii_idx      = 1
em_1.text   = string(today(),"yyyy")
ddlb_1.text = string(today(),"mm")		// "전체"

dw_1.dataobject = 'd_osmsaletotal_t'
dw_3.dataobject = 'd_osmsaletotal_r3'

dw_4.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x



end event

type pb_save from w_inheritance`pb_save within w_osmsale_r3
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osmsale_r3
string tag = "d_osmsaletotal_t"
integer x = 32
integer y = 444
integer width = 4078
integer height = 1668
integer taborder = 0
string title = "d_osmsale_t"
string dataobject = "d_osmsaletotal_t3"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_osmsale_r3
integer x = 46
integer y = 36
integer width = 1481
string text = "영업사원 특별관리(퇴직)"
end type

type st_tips from w_inheritance`st_tips within w_osmsale_r3
end type

type pb_compute from w_inheritance`pb_compute within w_osmsale_r3
boolean visible = false
integer x = 2871
integer y = 60
integer width = 46
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_osmsale_r3
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osmsale_r3
integer x = 3547
integer y = 72
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osmsale_r3
integer x = 3154
integer y = 72
integer taborder = 40
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
 
if dw_1.rowcount() < 1 then return

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 영업사원 총괄현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=98'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_osmsale_r3
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_osmsale_r3
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_osmsale_r3
boolean visible = false
integer x = 2821
integer y = 48
integer width = 55
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osmsale_r3
event ue_1 pbm_custom01
event ue_all pbm_custom02
integer x = 2962
integer y = 72
integer taborder = 20
boolean default = true
end type

event pb_retrieve::ue_1;String  ls_month
Decimal lr_ym, lr_ys, lr_mm, lr_ms, lr_bm, lr_yb, lr_yy
Decimal lr_aim_inv, lr_aim_del, lr_aim_mod, lr_aim_coll 
Long    ll_row, ll_m, ll_s, ll_row1, ll_column, ll_rows

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
	dw_1.setitem(ll_row1, "cust_no",      dw_2.object.data[ll_row, 1])	
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

	lr_yy = 0 ; lr_mm = 0 ; lr_ms = 0 ; lr_ym = 0 ;	lr_ys = 0 ; lr_bm = 0
	lr_aim_del  = 0 ;	lr_aim_inv  = 0 ;	lr_aim_coll = 0 ;	lr_aim_mod  = 0
next

dw_3.SetSort("user_name A, mgr_sort A, cust_sort A, cust_name A")	
dw_3.Sort()	

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
decimal lr_ym, lr_ys, lr_mm, lr_ms, lr_bm, lr_yb, lr_yy
decimal lr_aim_inv, lr_aim_del, lr_aim_mod, lr_aim_coll 
long    ll_row,  ll_row1, ll_column

for ll_row = 1 to dw_2.rowcount()
	//금월매출액, 연간매출액
	lr_yy = dw_2.object.data[ll_row, 2] //전월잔액

	for ll_column = 3 to 14
		lr_ym = lr_ym + dw_2.object.data[ll_row, ll_column]  // 연간매출
	next

	//lr_aim_inv, lr_aim_coll , lr_aim_mod, lr_aim_del
	
	//금월수금액, 연간수금액
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
	dw_1.setitem(ll_row1, "cust_no",      dw_2.object.data[ll_row, 1])	
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
    
	lr_yy = 0 ; lr_mm = 0 ;	lr_ms = 0 ;	lr_ym = 0 ;	lr_ys = 0 ;	lr_bm = 0
	lr_aim_del  = 0 ;	lr_aim_inv  = 0 ;	lr_aim_coll = 0 ;	lr_aim_mod  = 0
next

dw_3.SetSort("user_name A, mgr_sort A, cust_sort A, cust_name A")	
dw_3.Sort()	


end event

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

st_security lst_security
string ls_month, ls_date, ls_custname, ls_usernm, ls_level, ls_cred, ls_rotate, ls_coll, ls_colllevel
long   ll_year, ll_row, ll_col, ll_found

dw_1.reset() ; dw_2.reset() ; dw_3.reset()

cbx_2.checked = false	// 틀고정
dw_1.object.datawindow.horizontalscrollsplit = 0

if em_1.text = "" then
	MessageBox("확인","해당월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

//d_osmsaletotal_r
ls_date = em_1.text
ll_year = long(LeftA(ls_date, 4))

// 회전월, 미수금액
ls_colllevel = ls_rotate + ls_coll

// 담당자
ls_usernm = dw_4.object.user[1]
ls_level  = "%"
ls_cred   = "%"

string ls_level_userid

choose case gs_level
	case 'A', 'B'
		if ls_usernm = '%' then
			ls_usernm = '%'
		else
			ls_usernm = dw_4.object.user[1]
		end if

	case 'C'
		ls_usernm = gs_userid
end choose

dw_5.retrieve()		// 거래처정렬 순서DATA

dw_2.retrieve( ll_year, ls_usernm, ls_level, ls_cred )

if dw_2.rowcount() < 1 then 
   MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	return
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
// 거래처정렬 순서 변경하기
///////////////////////////////////////////////////////////////////
//ll_custsort = 0
//for ll_row = 1 to dw_1.rowcount()
//	dw_1.object.cust_sort[ll_row] = 9999
//	dw_3.object.cust_sort[ll_row] = 9999
//next
//
//for ll_row = 1 to dw_5.rowcount()
//
//	for ll_col = 1 to 2
//		choose case ll_col
//			case 1
//				ls_custname = dw_5.object.customer_cust_name[ll_row]
//
//			case 2
//				ls_custname = dw_5.object.customer_rcust_name[ll_row]
//		end choose
//		
//		if isnull(ls_custname) OR ls_custname = "" then
//		else
//			ll_found = dw_1.find( "cust_name = '" + ls_custname + "' ", 1, dw_1.rowcount() )
//			if isnull(ll_found) OR ll_found < 1 then
//			else
//				ll_custsort = ll_custsort + 1
//				dw_1.object.cust_sort[ll_found] = ll_custsort
//				dw_3.object.cust_sort[ll_found] = ll_custsort
//
//				dw_1.object.cust_name[ll_found] = "*" + dw_1.object.cust_name[ll_found]
//				dw_3.object.cust_name[ll_found] = "*" + dw_3.object.cust_name[ll_found]
//			end if
//		end if
//	next
//next
///////////////////////////////////////////////////////////////////
string ls_rcust_name, ls_cust_no, ls_sqlerrtext, ls_cust_name, ls_origin_cust_name
decimal ll_custsort

DECLARE rcust_no_cursor CURSOR FOR
      SELECT b.cust_name
      FROM customer_grp a with(nolock) inner join customer b with(nolock) on a.rcust_no = b.cust_no
      		                                                  inner join customer c with(nolock) on a.cust_no = c.cust_no
      WHERE a.cust_no = :ls_cust_no
order by  a.nrow asc;

// 거래처순서
for ll_row = 1 to dw_1.rowcount()
	     ll_custsort = truncate( ll_custsort,0)
		  
		if LeftA(dw_1.object.cust_name[ll_row],1) <> '*' then
			
			ll_custsort = ll_custsort + 1
			dw_1.object.cust_sort[ll_row] = ll_custsort
			dw_3.object.cust_sort[ll_row] = ll_custsort
			
		end if
	
		ls_cust_no = trim(dw_1.object.cust_no[ll_row])
	
		OPEN rcust_no_cursor;
		
			FETCH rcust_no_cursor INTO :ls_rcust_name;
		
			Do While sqlca.sqlcode = 0	
			
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = string(sqlca.sqlerrtext)
					ROLLBACK;				
					MessageBox('오류32','[customer_grp] customer_grp 조회중  DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
					RETURN 0
				end if					 
				
				if isnull(ls_rcust_name) OR ls_rcust_name = "" then
				else
					ll_found = dw_1.find( "cust_name = '" + ls_rcust_name + "' ", 1, dw_1.rowcount() )
					if isnull(ll_found) OR ll_found < 1 then
						//
					else
							ll_custsort = ll_custsort + 0.1						
							dw_1.object.cust_sort[ll_found] = ll_custsort
							dw_3.object.cust_sort[ll_found] = ll_custsort
							
							if LeftA(dw_1.object.cust_name[ll_row],1) <> '*' then
								dw_1.object.cust_name[ll_row] = "*" + dw_1.object.cust_name[ll_row]			
							end if
							
							dw_1.object.cust_name[ll_found] = "*" + dw_1.object.cust_name[ll_found]
							dw_3.object.cust_name[ll_found] = "*" + dw_3.object.cust_name[ll_found]							
						
					end if
				end if				
			
					
				FETCH rcust_no_cursor INTO :ls_rcust_name;
					
			Loop
		
		CLOSE rcust_no_cursor;	

next


// 수금등급 필터
dw_1.setfilter( "colllevel >= '" + ls_colllevel + "'" )
dw_1.filter()
dw_3.setfilter( "colllevel >= '" + ls_colllevel + "'" )
dw_3.filter()

dw_3.SetSort("user_name A, custname_sort A")	
dw_3.Sort()

dw_1.SetSort("user_name A, custname_sort A")	
dw_1.Sort()	

dw_1.groupcalc()
dw_3.groupcalc()

dw_1.setredraw( true )
dw_3.setredraw( true )
///////////////////////////////////////////////////////////////////

dw_1.setfocus()
MessageBox("확인","조회완료")


end event

type gb_3 from w_inheritance`gb_3 within w_osmsale_r3
integer x = 1591
integer y = 16
integer width = 590
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osmsale_r3
integer y = 260
integer width = 4078
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osmsale_r3
integer x = 2930
integer y = 16
integer width = 841
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osmsale_r3
integer x = 183
integer y = 180
integer width = 114
integer height = 80
integer taborder = 80
string dataobject = "d_osmsaletotal_h3"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_osmsale_r3
integer x = 1893
integer y = 64
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

type st_1 from statictext within w_osmsale_r3
integer x = 1627
integer y = 76
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

type dw_3 from datawindow within w_osmsale_r3
integer x = 302
integer y = 180
integer width = 114
integer height = 80
integer taborder = 90
boolean bringtotop = true
string title = "d_osmsaletotal_r1"
string dataobject = "d_osmsaletotal_r3"
end type

type dw_4 from datawindow within w_osmsale_r3
integer x = 2217
integer y = 140
integer width = 663
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_whlogin_c4"
boolean border = false
boolean livescroll = true
end type

type ddlb_1 from dropdownlistbox within w_osmsale_r3
integer x = 1893
integer y = 152
integer width = 242
integer height = 812
integer taborder = 30
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
		dw_3.dataobject = 'd_osmsaletotal_r3'
	case else	// 1 ~ 12월
		dw_1.dataobject = 'd_osmsaletotal_t'
		dw_3.dataobject = 'd_osmsaletotal_r3'
end choose

end event

type st_3 from statictext within w_osmsale_r3
integer x = 1627
integer y = 168
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

type st_5 from statictext within w_osmsale_r3
integer x = 119
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

type ddlb_fld from dropdownlistbox within w_osmsale_r3
integer x = 306
integer y = 316
integer width = 480
integer height = 632
integer taborder = 100
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

type ddlb_dwtitles from dropdownlistbox within w_osmsale_r3
integer x = 375
integer y = 332
integer width = 329
integer height = 88
integer taborder = 110
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

type st_6 from statictext within w_osmsale_r3
integer x = 823
integer y = 332
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

type ddlb_op from dropdownlistbox within w_osmsale_r3
integer x = 992
integer y = 316
integer width = 297
integer height = 512
integer taborder = 110
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

type sle_value from singlelineedit within w_osmsale_r3
integer x = 1312
integer y = 320
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

type cb_1 from commandbutton within w_osmsale_r3
integer x = 1893
integer y = 320
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
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Filter( arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_osmsale_r3
integer x = 2057
integer y = 320
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

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

// 잔액제로 제외
cbx_zero.triggerevent( clicked! )
end event

type cb_3 from commandbutton within w_osmsale_r3
integer x = 2222
integer y = 320
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_osmsale_r3
integer x = 2386
integer y = 320
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_2 from checkbox within w_osmsale_r3
integer x = 2587
integer y = 328
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

type pb_1 from picturebutton within w_osmsale_r3
event mousemove pbm_mousemove
string tag = "파일"
integer x = 3351
integer y = 72
integer width = 187
integer height = 144
integer taborder = 60
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

type cb_4 from commandbutton within w_osmsale_r3
integer x = 2898
integer y = 304
integer width = 535
integer height = 104
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
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
w_ocsaleageing_r.dw_4.object.user[1] = dw_4.object.user[1]
w_ocsaleageing_r.pb_retrieve.triggerevent( clicked! )

end event

type st_7 from statictext within w_osmsale_r3
integer x = 2222
integer y = 60
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

type cbx_zero from checkbox within w_osmsale_r3
integer x = 3493
integer y = 328
integer width = 539
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
string text = "잔액제로 제외"
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

type dw_5 from datawindow within w_osmsale_r3
integer x = 64
integer y = 180
integer width = 114
integer height = 80
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdcustomer_grp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_osmsale_r3
integer x = 2199
integer y = 16
integer width = 713
integer height = 232
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79219928
end type

