$PBExportHeader$w_oiscene_r.srw
$PBExportComments$현장별 자재투입현황(1998/05/16, 정재수)
forward
global type w_oiscene_r from w_inheritance
end type
type gb_6 from groupbox within w_oiscene_r
end type
type gb_4 from groupbox within w_oiscene_r
end type
type em_1 from editmask within w_oiscene_r
end type
type em_2 from editmask within w_oiscene_r
end type
type st_1 from statictext within w_oiscene_r
end type
type rb_1 from radiobutton within w_oiscene_r
end type
type rb_2 from radiobutton within w_oiscene_r
end type
type dw_4 from datawindow within w_oiscene_r
end type
type cbx_1 from checkbox within w_oiscene_r
end type
type sle_1 from singlelineedit within w_oiscene_r
end type
type dw_6 from datawindow within w_oiscene_r
end type
type pb_1 from picturebutton within w_oiscene_r
end type
type gb_7 from gb_2 within w_oiscene_r
end type
type dw_3 from datawindow within w_oiscene_r
end type
type cbx_cust from checkbox within w_oiscene_r
end type
type cbx_price from checkbox within w_oiscene_r
end type
type dw_5 from datawindow within w_oiscene_r
end type
type gb_5 from groupbox within w_oiscene_r
end type
end forward

global type w_oiscene_r from w_inheritance
integer y = 112
integer width = 4658
integer height = 2856
string title = "현장별 자재투입현황(w_oiscene_r)"
gb_6 gb_6
gb_4 gb_4
em_1 em_1
em_2 em_2
st_1 st_1
rb_1 rb_1
rb_2 rb_2
dw_4 dw_4
cbx_1 cbx_1
sle_1 sle_1
dw_6 dw_6
pb_1 pb_1
gb_7 gb_7
dw_3 dw_3
cbx_cust cbx_cust
cbx_price cbx_price
dw_5 dw_5
gb_5 gb_5
end type
global w_oiscene_r w_oiscene_r

type variables
string is_dw3sql, is_dw4sql, is_ret
datawindowchild idwc_cust, idwc_area
end variables

forward prototypes
public subroutine wf_ret ()
end prototypes

public subroutine wf_ret ();//
string ls_cust, ls_start, ls_end, ls_scene, ls_where, ls_sql, ls_area, ls_request, ls_price
string ls_scenecode
string ls_scenename, ls_scenename1
long   ll_count, ll_cnt
int    li_int

dw_1.accepttext()
dw_2.accepttext()

ls_cust = dw_1.object.cust_no[1]
ls_area = trim(LeftA(dw_6.object.area[dw_6.getrow()],1)) + "%"

ls_start = em_1.text
ls_end   = em_2.text

if cbx_cust.checked = true then	// 거래처 제출용(출력)
	ls_request = "Y"
else
	ls_request = "N"
end if
if cbx_price.checked = true then	// 단가 출력안함
	ls_price = "Y"
else
	ls_price = "N"
end if

ll_count = 0
for ll_cnt = 1 to dw_2.rowcount()
	if dw_2.isselected(ll_cnt) then
		ll_count ++
	end if
next

if ll_count < 1 then
	ls_scene = "~~'" + trim(dw_2.object.spot_code[dw_2.getrow()]) + "~~'"
	ls_scenecode = trim(dw_2.object.spot_code[dw_2.getrow()])
	SELECT scene_desc INTO :ls_scenename FROM scene WHERE scene_code = :ls_scenecode;
else
	ls_scene = ''
	for ll_cnt = 1 to dw_2.rowcount()
		if dw_2.isselected(ll_cnt) then
			ls_scene = ls_scene + "~~'" + trim(dw_2.object.spot_code[ll_cnt]) + "~~', "
			ls_scenecode = trim(dw_2.object.spot_code[ll_cnt])
			SELECT scene_desc INTO :ls_scenename1 FROM scene WHERE scene_code = :ls_scenecode;
			ls_scenename = ls_scenename + ' ' + ls_scenename1
		end if
	next
	ls_scene = trim(ls_scene)
	li_int   = LenA(ls_scene)
	ls_scene = LeftA(ls_scene, li_int -1 )
end if
ls_where = " and do.cust_no        like ~~'" + ls_cust + "~~'" + &
			  " and do.spot_code        IN (" + ls_scene + ")" + &	
			  " and do.do_date     between ~~'" + ls_start + "~~' and ~~'" + ls_end + "~~'" + &
			  " and do.do_no          like ~~'" + ls_area + "~~'" + &
			  " and customer.salesman like ~~'" + is_ret + "~~'"
ls_sql = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
dw_3.settransobject(sqlca)
dw_3.modify(ls_sql)
dw_3.retrieve( ls_price )
dw_3.GroupCalc()

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_custname
	
	SELECT cust_name INTO :ls_custname FROM customer WHERE cust_no = :ls_cust;	
	
	ls_userid = gs_userid
	ls_title  = st_title.text
	ls_desc   = '출고기간:' + ls_start + '-' + ls_end + ' 판매거래처:' + ls_custname + ' 현장:' + ls_scenename
	gf_log(ls_userid,ls_title,ls_desc)
End If		
//==========================================================================

end subroutine

on w_oiscene_r.create
int iCurrent
call super::create
this.gb_6=create gb_6
this.gb_4=create gb_4
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.sle_1=create sle_1
this.dw_6=create dw_6
this.pb_1=create pb_1
this.gb_7=create gb_7
this.dw_3=create dw_3
this.cbx_cust=create cbx_cust
this.cbx_price=create cbx_price
this.dw_5=create dw_5
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_6
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.sle_1
this.Control[iCurrent+11]=this.dw_6
this.Control[iCurrent+12]=this.pb_1
this.Control[iCurrent+13]=this.gb_7
this.Control[iCurrent+14]=this.dw_3
this.Control[iCurrent+15]=this.cbx_cust
this.Control[iCurrent+16]=this.cbx_price
this.Control[iCurrent+17]=this.dw_5
this.Control[iCurrent+18]=this.gb_5
end on

on w_oiscene_r.destroy
call super::destroy
destroy(this.gb_6)
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.sle_1)
destroy(this.dw_6)
destroy(this.pb_1)
destroy(this.gb_7)
destroy(this.dw_3)
destroy(this.cbx_cust)
destroy(this.cbx_price)
destroy(this.dw_5)
destroy(this.gb_5)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// 조용재 : 19840901
// 안승환 : 19000011

// 아래 거래처는 강현섭[redsky] 만 
//H479 (주)유창강건
//N002 (주)유창내장건설
//N003 (주)유창건영
//N004 건축사업본부
//N005 (주)유창내장(사용불가)
//N006 (주)유창건영(사용불가)
//H407 (주)한경엔지니어링

string ls_area

dw_4.visible = false
dw_5.visible = false
cbx_price.enabled = false	// 단가 출력안함

this.x = 1
this.y = 1
dw_2.SetTransObject(SQLCA)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_6.settransobject(sqlca)

dw_6.insertrow(0)  
ls_area = " "	// gs_area
dw_6.object.area[1] = ls_area

dw_6.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')
idwc_area.accepttext()
idwc_area.setredraw(false)

//판매거래처
dw_1.insertrow(0)  
dw_1.getchild("cust_no", idwc_cust)
//GS_DS_WHCUSTRET.ShareData(idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.retrieve( )


if gf_permission('현장별자재투입현황_전체거래처', gs_userid) = 'Y' then
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, 'cust_no', '%')
	idwc_cust.setitem(1, 'cust_name', '전체거래처')
//	idwc_cust.accepttext()
else
end if

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = ls_lastday	// 당월말일
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if

is_dw3sql = dw_3.describe("datawindow.table.select")
is_dw4sql = dw_4.describe("datawindow.table.select")

end event

event resize;call super::resize;gb_5.width  = this.width - 992
gb_5.height = this.height - 332

dw_3.width  = this.width - 1033
dw_3.height = this.height - 400

gb_3.height = this.height - 504
dw_2.height = this.height - 760


end event

type pb_save from w_inheritance`pb_save within w_oiscene_r
boolean visible = false
integer taborder = 40
end type

type dw_1 from w_inheritance`dw_1 within w_oiscene_r
integer x = 37
integer y = 272
integer width = 864
integer height = 92
integer taborder = 60
string dataobject = "d_oiscenecust_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_oiscene_r
integer x = 32
integer y = 624
integer width = 864
integer height = 2096
integer taborder = 70
string dataobject = "d_oiscene_s"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;if row < 1 then return

this.scrolltorow(row)
if cbx_1.checked = true then	// 복수선택
	this.SelectRow(row, true)
else
	this.SelectRow(0, false)
	this.SelectRow(row, NOT this.IsSelected(row))
end if

dw_1.object.cust_no[1] = this.object.cust_no[row]
wf_ret()

end event

event dw_2::rowfocuschanged;//if currentrow < 1 then return
//
//this.scrolltorow(currentrow)
//if cbx_1.checked = false then	// 복수선택
//else
//	this.SelectRow(currentrow, NOT this.IsSelected(currentrow))
//	dw_1.object.cust_no[1] = this.object.cust_no[currentrow]
//	wf_ret()
//end if
//
end event

type st_title from w_inheritance`st_title within w_oiscene_r
integer width = 1353
string text = "현장별 자재투입현황"
end type

type st_tips from w_inheritance`st_tips within w_oiscene_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiscene_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiscene_r
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_oiscene_r
integer x = 4375
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiscene_r
integer x = 3995
integer taborder = 90
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
string ls_cust_no, ls_scene_code[100], ls_scene, ls_dono, ls_area, ls_request, ls_price
date   ld_start, ld_end
long   ll_row, ll_count, ll_idx, ll_cnt
int    li_int
dec    ld_chk

dw_1.accepttext()
dw_2.accepttext()

ls_area    = trim(LeftA(dw_6.object.area[dw_6.getrow()],1)) + "%"
ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
if isnull(ls_cust_no) or ls_cust_no = '' then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

if em_1.text = '' then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	MessageBox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

ld_start = date(em_1.text)
ld_end   = date(em_2.text)
if cbx_cust.checked = true then	// 거래처 제출용(출력)
	ls_request = "Y"
else
	ls_request = "N"
end if
if cbx_price.checked = true then	// 단가 출력안함
	ls_price = "Y"
else
	ls_price = "N"
end if


if rb_1.checked = true then		// 전체
	dw_4.dataobject = 'd_oiscenerep_r1'
	dw_4.settransobject(sqlca)
	dw_4.retrieve( ls_cust_no, ld_start, ld_end, is_ret, ls_area, ls_request, ls_price )
else										// 부분
	if dw_2.rowcount() < 1 then return
	
	ll_count = 0
	for ll_cnt = 1 to dw_2.rowcount()
		if dw_2.isselected(ll_cnt) then
   	   ll_count ++
		end if
	next
	
	for ll_cnt = 1 to 100
		ls_scene_code[ll_cnt] = ''
	next
	
	if ll_count < 1 then
		ls_scene_code[1] = trim(dw_2.object.spot_code[dw_2.getrow()])
	else
		for ll_cnt = 1 to dw_2.rowcount()
			if dw_2.isselected(ll_cnt) then
				ls_scene_code[ll_cnt] = ls_scene_code[ll_cnt] + trim(dw_2.object.spot_code[ll_cnt]) 
			end if
		next
//		ls_scene_code = trim(ls_scene_code)
//		li_int        = len(ls_scene_code)
//		ls_scene_code = "(" + left(ls_scene_code[], li_int -1 ) + ")"
	end if
	
	dw_4.dataobject = 'd_oiscenerep_r2'
	dw_4.settransobject(sqlca)
	dw_4.retrieve( ls_cust_no, ls_scene_code, ld_start, ld_end, is_ret, ls_area, ls_request, ls_price )
end if

if dw_4.rowcount() < 1 then return
dw_4.GroupCalc()

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 현장별 자재투입현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

event constructor;//w_repsuper w_print
//st_print l_print
//string ls_cust_no, ls_scene_code, ls_scene, ls_dono
//date ld_start, ld_end
//long ll_row, ll_count, ll_idx
//dec ld_chk
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
//if isnull(ls_cust_no) or ls_cust_no = '' then
//	messagebox("확인","거래처를 선택하세요!",information!)
//	dw_1.setfocus()
//	return
//end if
//
//if em_1.text = '' then
//	messagebox("확인","출고기간을 입력하세요!",information!)
//	em_1.setfocus()
//	return
//elseif em_2.text = '' then
//	messagebox("확인","출고기간을 입력하세요!",information!)
//	em_2.setfocus()
//	return
//elseif em_1.text > em_2.text then
//	messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
//	em_1.setfocus()
//	return
//end if
//
//dw_4.SetRedraw(false)
//
//
//
//ld_start = date(em_1.text)
//ld_end = date(em_2.text)
//
//if rb_1.checked = true then
//	dw_4.dataobject = 'd_oiscenerep_r1'
//	dw_4.settransobject(sqlca)
//	dw_4.retrieve(ls_cust_no, ld_start, ld_end)
////   dw_4.object.do_do_rate[1] = dw_4.object.do_cash[1] 
////	dw_4.object.do_do_total[1] = dw_4.object.do_cash[1] 
////	ls_dono = dw_4.object.do_do_no[1] 
////	ls_scene = dw_4.object.do_spot_code[1] 
////	ld_chk = dw_4.object.do_ship_amount[1]
////	for ll_count = 1 to dw_4.rowcount()
////		dw_4.object.scene_scene_code[ll_count] = em_1.text
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text
////		if ls_scene <> dw_4.object.do_spot_code[ll_count] then
////			dw_4.object.do_do_rate[ll_count] = 0
////			ls_scene = dw_4.object.do_spot_code[ll_count] 
////		end if	
////		ll_idx = ll_count - 1
////		if ls_dono <> dw_4.object.do_do_no[ll_count] then
////   		dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] + &
////	   	                                   (dw_4.object.do_cash[ll_count] * 1.1)
////		  	dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] + &
////			                                     (dw_4.object.do_cash[ll_count] * 1.1)
////	   	ls_dono = dw_4.object.do_do_no[ll_count] 
////		ELSE
////			dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] 
////			dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] 
////		end if
////	next	
//else
//	if dw_2.rowcount() < 1 then return
//	
//	ls_scene_code = dw_2.object.spot_code[dw_2.getrow()]
//	dw_4.dataobject = 'd_oiscenerep_r2'
//	dw_4.settransobject(sqlca)
//	dw_4.retrieve(ls_cust_no, ls_scene_code, ld_start, ld_end)
////   dw_4.object.do_do_rate[1] = dw_4.object.do_cash[1] 
////	dw_4.object.do_do_total[1] = dw_4.object.do_cash[1] 
////	ls_dono = dw_4.object.do_do_no[1] 
////	ls_scene = dw_4.object.do_spot_code[1] 
////	ld_chk = dw_4.object.do_ship_amount[1]
////	for ll_count = 1 to dw_4.rowcount()
////		dw_4.object.scene_scene_code[ll_count] = em_1.text
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text
////	   dw_4.object.scene_scene_code[ll_count] =  dw_2.object.spot_code[dw_2.getrow()]
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text 
////		if ls_scene <> dw_4.object.do_spot_code[ll_count] then
////			dw_4.object.do_do_rate[ll_count] = 0
////			ls_scene = dw_4.object.do_spot_code[ll_count] 
////		end if	
////		ll_idx = ll_count - 1
////		if ls_dono <> dw_4.object.do_do_no[ll_count] then
////   		dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] + &
////	   	                                   (dw_4.object.do_cash[ll_count] * 1.1)
////		  	dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] + &
////			                                     (dw_4.object.do_cash[ll_count] * 1.1)
////	   	ls_dono = dw_4.object.do_do_no[ll_count] 
////		ELSE
////			dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] 
////			dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] 
////		end if
////	next		
//end if
//
//if dw_4.rowcount() < 1 then return
//
//
//	dw_4.object.cc_start[1] = string(em_1.text)
//	dw_4.object.cc_end[1] = string(em_2.text)
//
//l_print.st_datawindow = dw_4
//l_print.st_print_sheet = " 프린트용지 : B4"
//l_print.st_print_desc = " 이 프로그램은 현장별 자재투입현황을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
//                   'Datawindow.Zoom=100'
//dw_4.SetRedraw(TRUE)
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_oiscene_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_oiscene_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_oiscene_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiscene_r
integer x = 3794
integer taborder = 80
end type

event pb_retrieve::clicked;string ls_cust,  ls_start, ls_end, ls_scene, ls_where, ls_sql, ls_area, ls_request, ls_price
long   ll_count, ll_cnt
date   ld_start, ld_end
int    li_int
st_security lst_security

dw_1.accepttext()
dw_2.accepttext()

ls_cust = dw_1.getitemstring(dw_1.getrow(), "cust_no")
if isnull(ls_cust) or ls_cust = '' then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

ls_area = trim(LeftA(dw_6.object.area[dw_6.getrow()],1)) + "%"

string ls_level_userid
choose case gs_level
	case 'A', 'B'
		is_ret = '%'

	case 'C'
		is_ret = gs_userid
end choose

// 아래 거래처는 강현섭[redsky]
//H479 (주)유창강건
//N002 (주)유창내장건설
//N003 (주)유창건영
//N014 (주)유창플러스
//N004 건축사업본부
//N005 (주)유창내장(사용불가)
//N006 (주)유창건영(사용불가)
//H407 (주)한경엔지니어링
if GF_PERMISSION("공무관리담당자", gs_userid) = "Y" then
	if ls_cust = 'H479' or ls_cust = 'N002' or ls_cust = 'N003' or ls_cust = 'N014' or &
		ls_cust = 'N004' or ls_cust = 'N005' or ls_cust = 'N006' or ls_cust = 'H407' then
		is_ret = '%'
	else
		return
	end if
end if

if em_1.text = '' then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	MessageBox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_start = em_1.text
ls_end   = em_2.text
if cbx_cust.checked = true then	// 거래처 제출용(출력)
	ls_request = "Y"
else
	ls_request = "N"
end if
if cbx_price.checked = true then	// 단가 출력안함
	ls_price = "Y"
else
	ls_price = "N"
end if

if rb_1.checked = true then	// 전체
	ls_where = " and do.cust_no        like ~~'" + ls_cust + "~~'" + &
				  " and do.do_date     between ~~'" + ls_start + "~~' and ~~'" + ls_end + "~~'" + &
				  " and do.do_no          like ~~'" + ls_area  + "~~'" + &
				  " and customer.salesman like ~~'" + is_ret + "~~'"	
	ls_sql   = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
	dw_3.settransobject(sqlca)
	dw_3.modify(ls_sql)
	dw_3.retrieve( ls_price )
	dw_3.GroupCalc()	
else	// 부분
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)
	dw_2.setredraw(false)
	dw_2.retrieve(ls_cust, ld_start, ld_end, '%', ls_area)
	dw_2.setredraw(true)
end if

//===============사용자별 프로그램 사용현황=================================
if gs_level = 'B' then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_custname
	
	SELECT cust_name INTO :ls_custname FROM customer WHERE cust_no = :ls_cust;
	ls_userid = gs_userid
	ls_title  = st_title.text
	ls_desc   = '출고기간:' + string(ld_start) + '-' + string(ld_end) + '판매거래처:' + ls_custname + ' 조회'
	gf_log(ls_userid,ls_title,ls_desc)
end if		
//==========================================================================

	
end event

type gb_3 from w_inheritance`gb_3 within w_oiscene_r
integer x = 18
integer y = 388
integer width = 896
integer height = 2352
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "현장"
end type

type gb_2 from w_inheritance`gb_2 within w_oiscene_r
integer x = 18
integer y = 216
integer width = 896
integer height = 160
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "판매거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_oiscene_r
integer x = 3762
integer width = 832
integer taborder = 0
end type

type gb_6 from groupbox within w_oiscene_r
integer x = 2930
integer y = 12
integer width = 818
integer height = 204
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "규격->규격(송장)으로 변경."
end type

type gb_4 from groupbox within w_oiscene_r
integer x = 2002
integer y = 12
integer width = 919
integer height = 204
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출고기간"
end type

type em_1 from editmask within w_oiscene_r
integer x = 2053
integer y = 88
integer width = 357
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oiscene_r
integer x = 2523
integer y = 88
integer width = 357
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oiscene_r
integer x = 2418
integer y = 72
integer width = 110
integer height = 72
boolean bringtotop = true
integer textsize = -22
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_oiscene_r
integer x = 46
integer y = 460
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;//
dw_2.reset()
dw_3.reset()
cbx_1.enabled = false
cbx_1.checked = false


end event

type rb_2 from radiobutton within w_oiscene_r
integer x = 283
integer y = 460
integer width = 219
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "부분"
end type

event clicked;//
string ls_cust_no, ls_area
date   ld_start, ld_end

dw_2.reset()
dw_3.reset()
cbx_1.enabled = true

dw_1.accepttext()
ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
ls_area    = trim(LeftA(dw_6.object.area[dw_6.getrow()],1)) + "%"
if ls_cust_no = '' or isnull(ls_cust_no) or ls_cust_no = '%' then
	return
else
	if em_1.text = '' then
		return 
	elseif em_2.text = '' then
		return 
	elseif em_1.text > em_2.text then
		return 
	end if
	
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)
	dw_2.setredraw(false)
	dw_2.reset()
	dw_2.retrieve(ls_cust_no, ld_start, ld_end, '%', ls_area)
	dw_2.setredraw(true)
end if
	




end event

type dw_4 from datawindow within w_oiscene_r
string tag = "d_oiscenerep_r1"
integer x = 1038
integer y = 12
integer width = 101
integer height = 80
integer taborder = 10
boolean bringtotop = true
string title = "d_oiscenerep_r2"
string dataobject = "d_oiscenerep_r1"
boolean livescroll = true
end type

type cbx_1 from checkbox within w_oiscene_r
integer x = 526
integer y = 460
integer width = 357
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
string text = "복수선택"
end type

event clicked;if this.checked = false then
	dw_2.SelectRow(0, false)
end if
end event

type sle_1 from singlelineedit within w_oiscene_r
event keydown pbm_keydown
integer x = 32
integer y = 524
integer width = 864
integer height = 84
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event keydown;//
//IF keydown(KeyEnter! ) THEN
if key <> KeyEnter! then return

string ls_scene
date ld_start, ld_end

ls_scene = trim(this.text)
ld_start = date(em_1.text)
ld_end = date(em_2.text)
if isnull(ls_scene) or trim(ls_scene) = '' then
	return
//	ls_scene = '%'
else
	ls_scene = "%" + trim(ls_scene) + "%"
end if
dw_2.retrieve('%', ld_start, ld_end, ls_scene)
setnull(ls_scene)
dw_1.object.cust_no[1] = ls_scene

end event

event getfocus;this.selecttext(1, LenA(this.Text))
end event

type dw_6 from datawindow within w_oiscene_r
integer x = 1454
integer y = 88
integer width = 517
integer height = 96
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type pb_1 from picturebutton within w_oiscene_r
event mousemove pbm_mousemove
integer x = 4187
integer y = 52
integer width = 187
integer height = 144
integer taborder = 110
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_3.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
										"엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_3.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_3.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type gb_7 from gb_2 within w_oiscene_r
integer x = 1426
integer y = 12
integer width = 567
integer height = 204
integer taborder = 50
integer textsize = -9
string text = "사업장"
end type

type dw_3 from datawindow within w_oiscene_r
integer x = 946
integer y = 264
integer width = 3625
integer height = 2456
integer taborder = 110
string dataobject = "d_oiscenerep_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)
//
end event

type cbx_cust from checkbox within w_oiscene_r
integer x = 2958
integer y = 68
integer width = 768
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "거래처 제출용(출력)"
end type

event clicked;//
if this.checked = true then 
	cbx_price.enabled = true
else
	cbx_price.checked = false
	cbx_price.enabled = false
end if

end event

type cbx_price from checkbox within w_oiscene_r
integer x = 2958
integer y = 132
integer width = 768
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "단가 출력안함"
end type

type dw_5 from datawindow within w_oiscene_r
integer x = 1147
integer y = 12
integer width = 101
integer height = 80
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_r2"
boolean livescroll = true
end type

type gb_5 from groupbox within w_oiscene_r
integer x = 928
integer y = 216
integer width = 3666
integer height = 2524
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

