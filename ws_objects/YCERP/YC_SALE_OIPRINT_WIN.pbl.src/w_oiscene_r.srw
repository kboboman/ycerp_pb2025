$PBExportHeader$w_oiscene_r.srw
$PBExportComments$현장별 자재투입현황(1998/05/16, 정재수)
forward
global type w_oiscene_r from w_inheritance
end type
type gb_5 from groupbox within w_oiscene_r
end type
type gb_4 from groupbox within w_oiscene_r
end type
type em_1 from editmask within w_oiscene_r
end type
type em_2 from editmask within w_oiscene_r
end type
type rb_1 from radiobutton within w_oiscene_r
end type
type rb_2 from radiobutton within w_oiscene_r
end type
type dw_4 from datawindow within w_oiscene_r
end type
type cbx_multi from checkbox within w_oiscene_r
end type
type dw_area from datawindow within w_oiscene_r
end type
type pb_1 from picturebutton within w_oiscene_r
end type
type dw_3 from datawindow within w_oiscene_r
end type
type cbx_cust from checkbox within w_oiscene_r
end type
type cbx_price from checkbox within w_oiscene_r
end type
type dw_5 from datawindow within w_oiscene_r
end type
type st_3 from statictext within w_oiscene_r
end type
type ddlb_fld from dropdownlistbox within w_oiscene_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiscene_r
end type
type st_4 from statictext within w_oiscene_r
end type
type sle_value from singlelineedit within w_oiscene_r
end type
type cb_1 from commandbutton within w_oiscene_r
end type
type cb_2 from commandbutton within w_oiscene_r
end type
type cb_3 from commandbutton within w_oiscene_r
end type
type cb_5 from commandbutton within w_oiscene_r
end type
type cbx_dodate from checkbox within w_oiscene_r
end type
type dw_7 from datawindow within w_oiscene_r
end type
type dw_8 from datawindow within w_oiscene_r
end type
type dw_9 from datawindow within w_oiscene_r
end type
type cb_4 from commandbutton within w_oiscene_r
end type
type dw_10 from datawindow within w_oiscene_r
end type
type st_2 from statictext within w_oiscene_r
end type
type st_1 from statictext within w_oiscene_r
end type
type st_7 from statictext within w_oiscene_r
end type
type cbx_team from checkbox within w_oiscene_r
end type
type dw_sales from datawindow within w_oiscene_r
end type
type st_5 from statictext within w_oiscene_r
end type
type dw_6 from datawindow within w_oiscene_r
end type
type dw_11 from datawindow within w_oiscene_r
end type
type st_vertical from u_splitbar_vertical within w_oiscene_r
end type
type cbx_noamt from checkbox within w_oiscene_r
end type
type cbx_excel from checkbox within w_oiscene_r
end type
type dw_12 from datawindow within w_oiscene_r
end type
type cbx_hap from checkbox within w_oiscene_r
end type
type ddlb_op from dropdownlistbox within w_oiscene_r
end type
type cbx_footer from checkbox within w_oiscene_r
end type
type dw_13 from datawindow within w_oiscene_r
end type
type dw_14 from datawindow within w_oiscene_r
end type
type cb_6 from commandbutton within w_oiscene_r
end type
type cb_7 from commandbutton within w_oiscene_r
end type
end forward

global type w_oiscene_r from w_inheritance
integer y = 112
integer width = 6080
integer height = 2720
string title = "현장별 자재투입현황(w_oiscene_r)"
gb_5 gb_5
gb_4 gb_4
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
dw_4 dw_4
cbx_multi cbx_multi
dw_area dw_area
pb_1 pb_1
dw_3 dw_3
cbx_cust cbx_cust
cbx_price cbx_price
dw_5 dw_5
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cbx_dodate cbx_dodate
dw_7 dw_7
dw_8 dw_8
dw_9 dw_9
cb_4 cb_4
dw_10 dw_10
st_2 st_2
st_1 st_1
st_7 st_7
cbx_team cbx_team
dw_sales dw_sales
st_5 st_5
dw_6 dw_6
dw_11 dw_11
st_vertical st_vertical
cbx_noamt cbx_noamt
cbx_excel cbx_excel
dw_12 dw_12
cbx_hap cbx_hap
ddlb_op ddlb_op
cbx_footer cbx_footer
dw_13 dw_13
dw_14 dw_14
cb_6 cb_6
cb_7 cb_7
end type
global w_oiscene_r w_oiscene_r

type variables
string is_dw9sql		// is_dw3sql, is_dw4sql, 
string is_ret
datawindowchild idwc_area, idwc_user, idwc_cust

end variables

forward prototypes
public subroutine wf_ret ()
end prototypes

public subroutine wf_ret ();////
//string ls_cust, ls_sdate, ls_edate, ls_scene, ls_where, ls_sql, ls_area, ls_request, ls_price
//string ls_scenecode
//string ls_scenename, ls_scenename1
//long   ll_count, ll_cnt
//int    li_int
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//ls_cust  = dw_1.object.cust_no[1]
//ls_area  = trim(left(dw_6.object.area[dw_6.getrow()],1)) + "%"
//ls_sdate = em_1.text
//ls_edate = em_2.text
//
//if cbx_cust.checked = true then	// 거래처 제출용(출력)
//	ls_request = "Y"
//else
//	ls_request = "N"
//end if
//
//if cbx_price.checked = true then	// 단가 출력안함
//	ls_price = "Y"
//else
//	ls_price = "N"
//end if
//
//ll_count = 0
//for ll_cnt = 1 to dw_2.rowcount()
//	if dw_2.isselected(ll_cnt) then
//		ll_count ++
//	end if
//next
//
//if ll_count < 1 then
//	ls_scene = "~~'" + trim(dw_2.object.spot_code[dw_2.getrow()]) + "~~'"
//	ls_scenecode = trim(dw_2.object.spot_code[dw_2.getrow()])
//	SELECT scene_desc INTO :ls_scenename FROM scene WHERE scene_code = :ls_scenecode;
//else
//	ls_scene = ''
//	for ll_cnt = 1 to dw_2.rowcount()
//		if dw_2.isselected(ll_cnt) then
//			ls_scene = ls_scene + "~~'" + trim(dw_2.object.spot_code[ll_cnt]) + "~~', "
//			ls_scenecode = trim(dw_2.object.spot_code[ll_cnt])
//			SELECT scene_desc INTO :ls_scenename1 FROM scene WHERE scene_code = :ls_scenecode;
//			ls_scenename = ls_scenename + ' ' + ls_scenename1
//		end if
//	next
//	ls_scene = trim(ls_scene)
//	li_int   = len(ls_scene)
//	ls_scene = left(ls_scene, li_int -1 )
//end if
//
////ls_where = " WHERE ( a.spot_code  IN (" + ls_scene + ") )"
////ls_sql   = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
////
////dw_3.settransobject(sqlca)
////dw_3.modify(ls_sql)
//dw_3.retrieve( ls_price, ls_sdate, ls_edate, ls_cust, ls_scene, ls_area, is_ret )
//dw_3.GroupCalc()
//
end subroutine

on w_oiscene_r.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.gb_4=create gb_4
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_4=create dw_4
this.cbx_multi=create cbx_multi
this.dw_area=create dw_area
this.pb_1=create pb_1
this.dw_3=create dw_3
this.cbx_cust=create cbx_cust
this.cbx_price=create cbx_price
this.dw_5=create dw_5
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cbx_dodate=create cbx_dodate
this.dw_7=create dw_7
this.dw_8=create dw_8
this.dw_9=create dw_9
this.cb_4=create cb_4
this.dw_10=create dw_10
this.st_2=create st_2
this.st_1=create st_1
this.st_7=create st_7
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.st_5=create st_5
this.dw_6=create dw_6
this.dw_11=create dw_11
this.st_vertical=create st_vertical
this.cbx_noamt=create cbx_noamt
this.cbx_excel=create cbx_excel
this.dw_12=create dw_12
this.cbx_hap=create cbx_hap
this.ddlb_op=create ddlb_op
this.cbx_footer=create cbx_footer
this.dw_13=create dw_13
this.dw_14=create dw_14
this.cb_6=create cb_6
this.cb_7=create cb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.dw_4
this.Control[iCurrent+8]=this.cbx_multi
this.Control[iCurrent+9]=this.dw_area
this.Control[iCurrent+10]=this.pb_1
this.Control[iCurrent+11]=this.dw_3
this.Control[iCurrent+12]=this.cbx_cust
this.Control[iCurrent+13]=this.cbx_price
this.Control[iCurrent+14]=this.dw_5
this.Control[iCurrent+15]=this.st_3
this.Control[iCurrent+16]=this.ddlb_fld
this.Control[iCurrent+17]=this.ddlb_dwtitles
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.cb_5
this.Control[iCurrent+24]=this.cbx_dodate
this.Control[iCurrent+25]=this.dw_7
this.Control[iCurrent+26]=this.dw_8
this.Control[iCurrent+27]=this.dw_9
this.Control[iCurrent+28]=this.cb_4
this.Control[iCurrent+29]=this.dw_10
this.Control[iCurrent+30]=this.st_2
this.Control[iCurrent+31]=this.st_1
this.Control[iCurrent+32]=this.st_7
this.Control[iCurrent+33]=this.cbx_team
this.Control[iCurrent+34]=this.dw_sales
this.Control[iCurrent+35]=this.st_5
this.Control[iCurrent+36]=this.dw_6
this.Control[iCurrent+37]=this.dw_11
this.Control[iCurrent+38]=this.st_vertical
this.Control[iCurrent+39]=this.cbx_noamt
this.Control[iCurrent+40]=this.cbx_excel
this.Control[iCurrent+41]=this.dw_12
this.Control[iCurrent+42]=this.cbx_hap
this.Control[iCurrent+43]=this.ddlb_op
this.Control[iCurrent+44]=this.cbx_footer
this.Control[iCurrent+45]=this.dw_13
this.Control[iCurrent+46]=this.dw_14
this.Control[iCurrent+47]=this.cb_6
this.Control[iCurrent+48]=this.cb_7
end on

on w_oiscene_r.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_4)
destroy(this.cbx_multi)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.dw_3)
destroy(this.cbx_cust)
destroy(this.cbx_price)
destroy(this.dw_5)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cbx_dodate)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.dw_9)
destroy(this.cb_4)
destroy(this.dw_10)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_7)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.st_5)
destroy(this.dw_6)
destroy(this.dw_11)
destroy(this.st_vertical)
destroy(this.cbx_noamt)
destroy(this.cbx_excel)
destroy(this.dw_12)
destroy(this.cbx_hap)
destroy(this.ddlb_op)
destroy(this.cbx_footer)
destroy(this.dw_13)
destroy(this.dw_14)
destroy(this.cb_6)
destroy(this.cb_7)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_2)
st_vertical.of_set_rightobject(dw_3)
st_vertical.of_set_rightobject(dw_12)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if gs_rank_no = '235' then
	pb_print.enabled = false
	pb_1.enabled = false
	dw_3.object.dodet_price.visible = false
end if 

is_dw9sql = dw_9.describe("datawindow.table.select")

cbx_price.enabled  = false	// 단가 출력안함
cbx_dodate.checked = true  // 적용일 보기
cb_4.enabled  = false

dw_4.visible  = false
dw_5.visible  = false
dw_6.visible  = false
dw_7.visible  = false
dw_8.visible  = false
dw_9.visible  = false
dw_10.visible = false
dw_11.visible = false
dw_12.visible = false
dw_13.visible = false
dw_14.visible = false

dw_2.SetTransObject(SQLCA)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_9.settransobject(sqlca)
dw_10.settransobject(sqlca)
dw_11.settransobject(sqlca)
dw_12.settransobject(sqlca)
dw_13.settransobject(sqlca)
dw_14.settransobject(sqlca)

cbx_cust.checked = true
cbx_cust.TriggerEvent( clicked! )

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday

SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM dual;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = ls_lastday	// 당월말일
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if

// 사업장 
string ls_area
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = "%"	// gs_area
dw_area.object.area[1] = ls_area

// 거래처
dw_1.SetTransObject(SQLCA)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("현장별 자재투입현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
else
	idwc_cust.retrieve( gs_userid )
end if
//if idwc_cust.rowcount() = 0 then	idwc_cust.insertrow(0)
dw_1.insertrow(0)

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
if GF_Permission("현장별 자재투입현황(ALL)", gs_userid) = "Y" then
	idwc_user.retrieve( "%" )

	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"
	
	cbx_team.checked = true		// 팀조회
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	string ls_userid
	long   ll_find
	
	ls_userid = gs_userid
	idwc_user.retrieve( ls_userid )
	if GF_Permission("내부업체열람", gs_userid) = "Y" then
		ls_userid = "killby"
	end if
	
	if idwc_user.find( "user_id = '" + ls_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
		cbx_team.checked = false
		idwc_cust.setfilter( "(salesman = '" + ls_userid + "' OR imwon_user_id = '" + ls_userid + "') OR cust_no IN ('%', 'ALL') " )
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

/* 2022-03-04 jowonsuk 
엑셀일괄업데이트를 하려면 거래명세서_수정/삭제의 단가수정권한이 있어야함*/
string ls_Permission
	
if gs_userid <> '1999010s' then

	SELECT  left(RTRIM(BIGO),1) INTO :ls_Permission  FROM  CODEMST
	 WHERE  type     =  '거래명세서_수정/삭제'
		AND  USE_YN   =  'Y' AND  item_cd  =  :gs_userid;
	
	if ls_Permission = 'Y' then
		cb_7.enabled = true
	else
		cb_7.enabled = false
	end if
	
end if	
		
dw_sales.setfocus()

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_2.height = newheight - dw_2.y - gb_3.x

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_3.x      = st_vertical.x + st_vertical.width 
dw_3.width  = newwidth  - dw_3.x - gb_3.x
dw_3.height = newheight - dw_3.y - gb_3.x

dw_12.x = dw_3.x ; dw_12.y = dw_3.y ; dw_12.width = dw_3.width ; dw_12.height = dw_3.height

end event

type pb_save from w_inheritance`pb_save within w_oiscene_r
boolean visible = false
integer taborder = 40
end type

type dw_1 from w_inheritance`dw_1 within w_oiscene_r
integer x = 2578
integer y = 128
integer width = 613
integer height = 84
integer taborder = 60
string dataobject = "d_oiscenecust_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;call super::itemchanged;//
this.accepttext()

pb_retrieve.triggerevent( clicked! )

end event

type st_title from w_inheritance`st_title within w_oiscene_r
integer y = 24
integer width = 1307
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
integer x = 4731
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;idwc_cust.deleterow(1)
close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiscene_r
integer x = 4352
integer y = 56
integer taborder = 90
end type

event pb_print::clicked;//
w_repsuper w_print
st_print l_print
string ls_custno, ls_scene[], ls_dono, ls_area, ls_request, ls_price
date   ld_sdate, ld_edate
long   ll_row, ll_count, ll_idx, ll_cnt
int    li_int
dec    ld_chk

dw_2.accepttext()

// 사업장
dw_area.accepttext()
ls_area   = trim(dw_area.object.area[1])
ls_area   = LeftA(ls_area,1) + "%"

// 거래처
dw_1.accepttext()
ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

// 일자
if em_1.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	MessageBox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)


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

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_1.checked = true then		// 전체(현장)
	if cbx_dodate.checked = true then		// 적용일 보기
		dw_4.dataobject = 'd_oiscenerep_rdate1'
	else
		dw_4.dataobject = 'd_oiscenerep_r1'
	end if
	dw_4.settransobject(sqlca)
	dw_4.retrieve( ls_custno, ld_sdate, ld_edate, "%", ls_area, ls_request, ls_price )
	dw_4.GroupCalc()
else										// 부분(현장)
	if dw_2.rowcount() < 1 then RETURN

	if cbx_multi.checked = false then	// 단일선택
		ls_scene[1] = dw_2.object.spot_code[dw_2.getrow()]
	else									// 복수선택	
		ll_count = 0
		for ll_cnt = 1 to dw_2.rowcount()
			if dw_2.IsSelected(ll_cnt) then
				ll_count ++
				ls_scene[ll_count] = dw_2.object.spot_code[ll_cnt]
			end if
		next
	end if

	// 적용일 보기
	if cbx_dodate.checked = true then		
		if cbx_noamt.checked = true then
			dw_4.dataobject = 'd_oiscenerep_rdate3'
		else
			dw_4.dataobject = 'd_oiscenerep_rdate2'
		end if
	else
		dw_4.dataobject = 'd_oiscenerep_r2'
	end if
	dw_4.settransobject(sqlca)
	dw_4.retrieve( ls_custno, ls_scene, ld_sdate, ld_edate, "%", ls_area, ls_request, ls_price )
	dw_4.GroupCalc()
	
	//if cbx_noamt.checked = true then
	//	dw_4.Modify("c_acc_qty.visible='0'")
	//	dw_4.Modify("dodet_price.visible='0'")
	//end if
end if

l_print.st_datawindow  = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 현장별 자재투입현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

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
integer x = 4151
integer y = 56
integer taborder = 80
end type

event pb_retrieve::clicked;// 법무팀은 전체권한 부여 후 단가권한 체크함
string ls_custno,  ls_sdate, ls_edate, ls_scene, ls_scenedesc[], ls_where, ls_sql, ls_area, ls_request, ls_price
string ls_salesman, ls_colllevel, ls_userid
long   ll_count, ll_cnt, ll_find
date   ld_sdate, ld_edate
int    li_int

debugbreak()

dw_2.accepttext()

// 거래처
dw_1.accepttext()
ls_custno = dw_1.object.cust_no[1]

if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	RETURN
end if

// 매출조직별 거래처 CHECK
SELECT user_name
     , colllevel = (case when isnull(customer.rotate,0.0) >= 0.0 AND isnull(customer.rotate,0.0) <=  3.0 then 'A'
                         when isnull(customer.rotate,0.0) >  3.0 AND isnull(customer.rotate,0.0) <=  5.0 then 'B'
                         when isnull(customer.rotate,0.0) >  5.0 AND isnull(customer.rotate,0.0) <=  8.0 then 'C'
                         when isnull(customer.rotate,0.0) >  8.0 AND isnull(customer.rotate,0.0) <= 12.0 then 'D'
                         when isnull(customer.rotate,0.0) > 12.0                                         then 'E'
                    end)
  INTO :ls_salesman, :ls_colllevel
  FROM customer
       LEFT OUTER JOIN login ON customer.salesman = login.user_id
 WHERE (customer.cust_no = :ls_custno );
 
if isnull(ls_salesman) OR ls_salesman = "" then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
	RETURN
end if

if GF_Permission("현장별 자재투입현황(ALL)", gs_userid) = "Y" then
	if gs_team = "40000" then
		if LeftA(ls_colllevel,1) = "A" then
			MessageBox("확인","법무팀 조회대상 거래처가 아닙니다.")
			RETURN
		else
			// 수금등급이 "A"가 아니면 가능
		end if
	end if
else
	dw_11.retrieve( gs_userid )
	if dw_11.rowcount() < 1 then
		MessageBox("확인","매출조직별 거래처 대상이 존재하지 않습니다.")
		RETURN
	else
		ll_find = dw_11.find( "cust_no = '" + ls_custno + "' ", 1, dw_11.rowcount() )
		if ll_find > 0 then
			// 매출조직거래처
		else				
			MessageBox("확인","해당하는 거래처의 담당자는 [" + ls_salesman + "] 입니다.~n~n거래처 열람할 수 없습니다.")
			RETURN
		end if
	end if
end if

// 사업장
dw_area.accepttext()
ls_area = trim(LeftA(dw_area.object.area[1],1)) + "%"

// 담당자
ls_userid  = "%"

// 일자
if em_1.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_sdate = em_1.text
ls_edate = em_2.text
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 거래처 제출용(출력)
if cbx_cust.checked = true then	
	ls_request = "Y"
else
	ls_request = "N"
end if

// 단가 출력안함
if cbx_price.checked = true then	
	ls_price = "Y"
else
	ls_price = "N"
end if

dw_3.reset()


if rb_1.checked = true then	// 전체(현장)
	dw_3.dataobject = "d_oiscenerep_r"
	dw_3.settransobject(sqlca)
	dw_13.dataobject = "d_oiscenerep_r_excel"
	dw_13.settransobject(sqlca)
	
	if gs_rank_no = '235' then
		dw_3.object.dodet_price.visible = false
	end if	
	
	if cbx_footer.checked = true then
//		dw_3.object.car_group_text.visible = true
//		dw_3.object.car_group.visible = true
//		dw_3.object.car_vat_group.visible = true
//		dw_3.object.car_total_group.visible = true
//		
//		dw_3.object.car_group_text.height = 60
//		dw_3.object.car_group.height = 60
//		dw_3.object.car_vat_group.height = 60
//		dw_3.object.car_total_group.height = 60
//		
//		dw_3.object.car_text.visible = true
//		dw_3.object.car_sum.visible = true
//		dw_3.object.car_vat_sum.visible = true
//		dw_3.object.car_total_sum.visible = true	
//		
//		dw_3.object.car_text.height = 60
//		dw_3.object.car_sum.height = 60
//		dw_3.object.car_vat_sum.height = 60
//		dw_3.object.car_total_sum.height = 60	
		
		dw_3.modify("datawindow.Footer.height = 160")				
		dw_3.modify("datawindow.Trailer.1.height = 140")				
	else
		
//		dw_3.object.car_group_text.visible = false
//		dw_3.object.car_group.visible = false
//		dw_3.object.car_vat_group.visible = false
//		dw_3.object.car_total_group.visible = false
//		
//		dw_3.object.car_group_text.height = 0
//		dw_3.object.car_group.height = 0
//		dw_3.object.car_vat_group.height = 0
//		dw_3.object.car_total_group.height = 0
//		
//		dw_3.object.car_text.visible = false
//		dw_3.object.car_sum.visible = false
//		dw_3.object.car_vat_sum.visible = false
//		dw_3.object.car_total_sum.visible = false	
//		
//		dw_3.object.car_text.height = 0
//		dw_3.object.car_sum.height = 0
//		dw_3.object.car_vat_sum.height = 0
//		dw_3.object.car_total_sum.height = 0	
		
		dw_3.modify("datawindow.Footer.height = 80")				
		dw_3.modify("datawindow.Trailer.1.height = 64")						
	end if 	
	
	dw_3.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_area, ls_userid )
	dw_3.GroupCalc()
	
	dw_13.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_area, ls_userid )
	dw_13.GroupCalc()	
else									// 부분(현장)
	if cbx_multi.checked = false then		// 복수선택
		dw_2.reset()
		dw_2.retrieve( ls_custno, ld_sdate, ld_edate, "%", ls_area )
	end if

	ll_count = 0
	for ll_cnt = 1 to dw_2.rowcount()
		if dw_2.IsSelected(ll_cnt) then
			ll_count ++
			ls_scenedesc[ll_count] = dw_2.object.spot_code[ll_cnt]
		end if
	next
	
	if ll_count > 0 then
		dw_3.dataobject = "d_oiscenerep_ra"
		dw_3.settransobject(sqlca)
		dw_13.dataobject = "d_oiscenerep_ra_excel"
		dw_13.settransobject(sqlca)		
		
		if gs_rank_no = '235' then
			dw_3.object.dodet_price.visible = false
		end if	
		
		if cbx_footer.checked = true then
//			dw_3.object.car_group_text.visible = true
//			dw_3.object.car_group.visible = true
//			dw_3.object.car_vat_group.visible = true
//			dw_3.object.car_total_group.visible = true
//			
//			dw_3.object.car_group_text.height = 60
//			dw_3.object.car_group.height = 60
//			dw_3.object.car_vat_group.height = 60
//			dw_3.object.car_total_group.height = 60
//			
//			dw_3.object.car_text.visible = true
//			dw_3.object.car_sum.visible = true
//			dw_3.object.car_vat_sum.visible = true
//			dw_3.object.car_total_sum.visible = true	
//			
//			dw_3.object.car_text.height = 60
//			dw_3.object.car_sum.height = 60
//			dw_3.object.car_vat_sum.height = 60
//			dw_3.object.car_total_sum.height = 60	
			
			dw_3.modify("datawindow.Footer.height = 160")				
			dw_3.modify("datawindow.Trailer.1.height = 140")				
		else
			
//			dw_3.object.car_group_text.visible = false
//			dw_3.object.car_group.visible = false
//			dw_3.object.car_vat_group.visible = false
//			dw_3.object.car_total_group.visible = false
//			
//			dw_3.object.car_group_text.height = 0
//			dw_3.object.car_group.height = 0
//			dw_3.object.car_vat_group.height = 0
//			dw_3.object.car_total_group.height = 0
//			
//			dw_3.object.car_text.visible = false
//			dw_3.object.car_sum.visible = false
//			dw_3.object.car_vat_sum.visible = false
//			dw_3.object.car_total_sum.visible = false	
//			
//			dw_3.object.car_text.height = 0
//			dw_3.object.car_sum.height = 0
//			dw_3.object.car_vat_sum.height = 0
//			dw_3.object.car_total_sum.height = 0	
			
			dw_3.modify("datawindow.Footer.height = 80")				
			dw_3.modify("datawindow.Trailer.1.height = 64")						
		end if 	
		
		
		dw_3.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_scenedesc, ls_area, ls_userid )
		dw_3.GroupCalc()	
		
		dw_13.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_scenedesc, ls_area, ls_userid )
		dw_13.GroupCalc()			

		dw_10.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_scenedesc, ls_area, ls_userid )
	else
		MessageBox("확인","부분(현장)을 선택한 후 조회하시기 바랍니다.")
	end if
end if


// 엑셀 제출용
if cbx_excel.checked = true then
	if rb_1.checked = true then // 전체(현장)
		ls_scene     = "%"	
      ls_scenedesc[1] = "%"
		dw_12.retrieve( ls_price, ld_sdate, ld_edate, ls_custno, ls_scene, ls_scenedesc, ls_area, ls_userid )
	else
		ls_scene     = "N"	

		ll_count = 0
		for ll_cnt = 1 to dw_2.rowcount()
			if dw_2.IsSelected(ll_cnt) then
				ll_count ++
				ls_scenedesc[ll_count] = dw_2.object.spot_code[ll_cnt]
			end if
		next
		if ll_count > 0 then
			dw_12.retrieve( ls_price, ld_sdate, ld_edate, ls_custno, ls_scene, ls_scenedesc, ls_area, ls_userid )
		end if
	end if
end if

if dw_3.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiscene_r
integer x = 32
integer y = 244
integer width = 4672
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
string text = "현장"
end type

type gb_2 from w_inheritance`gb_2 within w_oiscene_r
integer x = 2272
integer y = 0
integer width = 1056
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oiscene_r
integer x = 4119
integer y = 0
integer width = 832
integer height = 232
integer taborder = 0
integer textsize = -9
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiscene_r
integer x = 32
integer y = 424
integer width = 1262
integer height = 2088
integer taborder = 70
string dataobject = "d_oiscene_s"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;//
string ls_sdate, ls_edate, ls_price, ls_custno, ls_area, ls_scene[], ls_spot, ls_request, ls_ret, ls_userid
date   ld_sdate, ld_edate
long   ll_count, ll_cnt

if isnull(row) OR row < 1 then RETURN

dw_1.accepttext()

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

this.scrolltorow(row)
ls_custno = this.object.cust_no[row]
if isnull(ls_custno) OR ls_custno = "" then RETURN

ls_sdate = em_1.text
ls_edate = em_2.text
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)
ls_area  = LeftA(ls_area,1) + "%"

choose case gs_level
	case 'A', 'B'
		is_ret = '%'
	case 'C'
		is_ret = gs_userid
end choose

// 공무관리담당자별 계열사 내용 열감가능
//H479 (주)유창강건
//N002 (주)유창내장건설
//N003 (주)유창건영
//N014 (주)유창플러스
//N004 건축사업본부
//N005 (주)유창내장(사용불가)
//N006 (주)유창건영(사용불가)
//H407 (주)한경엔지니어링

/*2018.08.09 jowonsuk 공무관리담당자여도 판매관리_입력, 판매관ㄹ_조회의 권한이 있으면 제약에서 제외  */
if GF_PERMISSION("공무관리담당자", gs_userid) = "Y" and (( GF_Permission("판매관리_입력", gs_userid) <> "Y" or GF_Permission("판매관리_입력(부분)", gs_userid) = "Y") and GF_Permission("판매관리_조회", gs_userid) <> "Y" ) then
	if ls_custno = 'H479' or ls_custno = 'N002' or ls_custno = 'N003' or ls_custno = 'N014' or &
		ls_custno = 'N004' or ls_custno = 'N005' or ls_custno = 'N006' or ls_custno = 'H407' then
		is_ret = '%'
	else
		RETURN
	end if
end if

/*2018.08.09 jowonsuk 공무관리담당자여도 판매관리_입력, 판매관ㄹ_조회의 권한이 있으면 제약에서 제외  */
if GF_PERMISSION("공무관리담당자", gs_userid) = "Y" and (( GF_Permission("판매관리_입력", gs_userid) = "Y" or GF_Permission("판매관리_입력(부분)", gs_userid) = "Y" ) and GF_Permission("판매관리_조회", gs_userid) = "Y" ) then
	is_ret = '%'	
end if	

// 거래처 제출용(출력)
if cbx_cust.checked = true then	
	ls_request = "Y"
else
	ls_request = "N"
end if

// 단가 출력안함
if cbx_price.checked = true then	
	ls_price = "Y"
else
	ls_price = "N"
end if

// 
ls_ret  = is_ret

// 담당자
ls_userid  = "%"

//
dw_3.reset()
dw_4.reset()

if rb_1.checked = true then	// 전체
	dw_3.dataobject = "d_oiscenerep_r"
	dw_3.settransobject(sqlca)
	
	dw_13.dataobject = "d_oiscenerep_r_excel"
	dw_13.settransobject(sqlca)	

	if gs_rank_no = '235' then
		dw_3.object.dodet_price.visible = false
	end if
	
	if cbx_footer.checked = true then
		dw_3.modify("datawindow.Footer.height = 160")				
		dw_3.modify("datawindow.Trailer.1.height = 140")
	else
		dw_3.modify("datawindow.Footer.height = 80")				
		dw_3.modify("datawindow.Trailer.1.height = 64")
	end if			

	dw_3.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_area, ls_ret )
	dw_3.GroupCalc()	

	dw_13.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_area, ls_ret )
	dw_13.GroupCalc()		
else	// 부분
	if cbx_multi.checked = false then	// 복수선택
		
		string ls_filter
	
		ls_scene[1] = dw_2.object.spot_code[row]

		dw_3.dataobject = "d_oiscenerep_ra"
		dw_3.settransobject(sqlca)	
		
		dw_13.dataobject = "d_oiscenerep_ra_excel"
//		dw_13.dataobject = "d_oiscenerep_r_excel"
		dw_13.settransobject(sqlca)			
		
		if cbx_footer.checked = true then
			dw_3.modify("datawindow.Footer.height = 160")				
			dw_3.modify("datawindow.Trailer.1.height = 140")
		else
			dw_3.modify("datawindow.Footer.height = 80")				
			dw_3.modify("datawindow.Trailer.1.height = 64")
		end if				
		
		if gs_rank_no = '235' then			
			dw_3.object.dodet_price.visible = false
		end if		
		
		dw_3.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_scene, ls_area, ls_ret )
		dw_3.GroupCalc()	
		
		dw_13.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_scene, ls_area, ls_ret )
		dw_13.GroupCalc()			
		
		dw_10.retrieve( ls_price, ls_sdate, ls_edate, ls_custno, ls_scene, ls_area, ls_ret )
	else
		this.SelectRow(row, NOT this.IsSelected(row))
		// 조회버튼에서 처리함
	end if
end if

// 엑셀 제출용
if cbx_excel.checked = true then
	if rb_1.checked = true then // 전체(현장)
		ls_spot     = "%"	
      	ls_scene[1] = "%"
		dw_12.retrieve( ls_price, ld_sdate, ld_edate, ls_custno, ls_spot, ls_scene, ls_area, ls_userid )
	else
		ls_spot     = "N"	
		ls_scene[1] = dw_2.object.spot_code[row]
		dw_12.retrieve( ls_price, ld_sdate, ld_edate, ls_custno, ls_spot, ls_scene, ls_area, ls_userid )
	end if
end if


end event

type gb_5 from groupbox within w_oiscene_r
integer x = 3342
integer width = 768
integer height = 232
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "규격->규격(송장) 변경"
end type

type gb_4 from groupbox within w_oiscene_r
integer x = 1390
integer width = 859
integer height = 232
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type em_1 from editmask within w_oiscene_r
integer x = 2578
integer y = 40
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	em_2.text = this.text
//end if
//
end event

type em_2 from editmask within w_oiscene_r
integer x = 2944
integer y = 40
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type rb_1 from radiobutton within w_oiscene_r
integer x = 87
integer y = 288
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

event clicked;// 전체
dw_2.reset() ; dw_3.reset()

cbx_multi.checked = false
cbx_multi.enabled = false

cb_4.enabled  = false

pb_retrieve.triggerevent( clicked! )

end event

type rb_2 from radiobutton within w_oiscene_r
integer x = 87
integer y = 340
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

event clicked;// 부분
dw_2.reset() ; dw_3.reset()

cbx_multi.enabled = true		// 복수선택

cb_4.enabled = true		// 수주상황부 일괄출력

pb_retrieve.triggerevent( clicked! )

end event

type dw_4 from datawindow within w_oiscene_r
string tag = "d_oiscenerep_r1"
integer x = 293
integer y = 168
integer width = 101
integer height = 60
integer taborder = 10
boolean bringtotop = true
string title = "d_oiscenerep_rdate1"
string dataobject = "d_oiscenerep_rdate3"
boolean livescroll = true
end type

type cbx_multi from checkbox within w_oiscene_r
integer x = 334
integer y = 312
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

event clicked;//
if this.checked = false then
	dw_2.SelectRow(0, false)
end if

end event

type dw_area from datawindow within w_oiscene_r
integer x = 1701
integer y = 44
integer width = 526
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type pb_1 from picturebutton within w_oiscene_r
event mousemove pbm_mousemove
integer x = 4544
integer y = 56
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

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dw_xls

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 엑셀 제출용
if cbx_excel.checked = true then
	dw_xls  = dw_12
else
	dw_xls  = dw_13
end if

if dw_xls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS",  &
										"엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			/*dw_xls.SaveAsASCII(ls_DocName)*/ /*dw_xls.saveasascii( ls_DocName, "~t", "'" )*/
			  dw_xls.saveasascii( ls_DocName, "~t", "")
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	


end event

type dw_3 from datawindow within w_oiscene_r
string tag = "d_oiscenerep_ra"
integer x = 1353
integer y = 424
integer width = 3351
integer height = 2088
integer taborder = 110
string title = "d_oiscenerep_r"
string dataobject = "d_oiscenerep_ra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

event doubleclicked;string ls_orsale

ls_orsale = 'oiscene' + this.object.dodet_sale_no[row]

OpenWithParm( w_orsale_m, ls_orsale )
end event

type cbx_cust from checkbox within w_oiscene_r
integer x = 3369
integer y = 40
integer width = 709
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
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
integer x = 3369
integer y = 104
integer width = 709
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "단가 출력안함"
end type

type dw_5 from datawindow within w_oiscene_r
integer x = 512
integer y = 168
integer width = 101
integer height = 60
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_r2"
boolean livescroll = true
end type

type st_3 from statictext within w_oiscene_r
integer x = 1047
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

type ddlb_fld from dropdownlistbox within w_oiscene_r
integer x = 1234
integer y = 296
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oiscene_r
integer x = 1266
integer y = 308
integer width = 311
integer height = 88
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

type st_4 from statictext within w_oiscene_r
integer x = 1705
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

type sle_value from singlelineedit within w_oiscene_r
integer x = 2194
integer y = 304
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oiscene_r
integer x = 2766
integer y = 304
integer width = 160
integer height = 76
integer taborder = 80
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

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

//
pb_print.enabled = false

end event

type cb_2 from commandbutton within w_oiscene_r
integer x = 2930
integer y = 304
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_3

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

//
pb_print.enabled = true

end event

type cb_3 from commandbutton within w_oiscene_r
integer x = 3095
integer y = 304
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiscene_r
integer x = 3259
integer y = 304
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_dodate from checkbox within w_oiscene_r
integer x = 3447
integer y = 308
integer width = 494
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "적용일 보기"
boolean checked = true
end type

event clicked;// 적용일 보기
if rb_1.checked = true then	// 전체
	if cbx_dodate.checked = true then		
		dw_4.dataobject = 'd_oiscenerep_rdate1'
	else
		dw_4.dataobject = 'd_oiscenerep_r1'
	end if
else									// 부분
	if cbx_dodate.checked = true then		
		dw_4.dataobject = 'd_oiscenerep_rdate2'
	else
		dw_4.dataobject = 'd_oiscenerep_r2'
	end if
end if	
dw_4.settransobject(sqlca)

end event

type dw_7 from datawindow within w_oiscene_r
integer x = 398
integer y = 168
integer width = 101
integer height = 60
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_rdate1"
boolean livescroll = true
end type

type dw_8 from datawindow within w_oiscene_r
integer x = 617
integer y = 168
integer width = 101
integer height = 60
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_rdate2"
boolean livescroll = true
end type

type dw_9 from datawindow within w_oiscene_r
integer x = 41
integer y = 168
integer width = 101
integer height = 60
integer taborder = 50
boolean bringtotop = true
string title = "수주상황부(환산수량)"
string dataobject = "d_orsale_print22"
boolean livescroll = true
end type

type cb_4 from commandbutton within w_oiscene_r
integer x = 3936
integer y = 292
integer width = 672
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주상황부 일괄출력"
end type

event clicked;//
w_repsuper w_print
st_print   l_print
string ls_orderno, ls_dw9sql, ls_where, ls_sql, ls_scenehp
long   ll_row

if MessageBox("확인", "수주상황접수부의 연락처 번호를 해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if

PrintSetup()

dw_9.settransobject(sqlca)
for ll_row = 1 to dw_10.rowcount()
	ls_orderno = dw_10.object.sale_no[ll_row]	// 수주번호
	
	ls_where   = "" ; ls_sql = ""
/*	ls_where   = " and sale.order_no        = ~~'" + ls_orderno + "~~'" &	*/
	ls_where   = " where sale.order_no        = ~~'" + ls_orderno + "~~'" &
				  + " and sale.confirm_flag LIKE ~~'" + "%" + "~~'"
	ls_sql     = "datawindow.table.select = '" + is_dw9sql + ls_where + "'"
		
	dw_9.modify( ls_sql )
	dw_9.retrieve(	ls_scenehp )	// 수주상황접수부
	
	dw_9.modify( 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100' )
	dw_9.print()

	//l_print.st_datawindow  = dw_9
	//l_print.st_print_sheet = " 프린트용지 : A4"
	//gs_print_control       = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	
	//// LANDSCAPE:1, PORTRAIT:2
	//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
	//OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
next
MessageBox("확인","출력완료")

end event

type dw_10 from datawindow within w_oiscene_r
integer x = 151
integer y = 168
integer width = 101
integer height = 60
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_ra1"
boolean resizable = true
boolean livescroll = true
end type

type st_2 from statictext within w_oiscene_r
integer x = 1417
integer y = 44
integer width = 279
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_oiscene_r
integer x = 2295
integer y = 44
integer width = 279
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "출고기간"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_oiscene_r
integer x = 1417
integer y = 132
integer width = 279
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자팀"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_team from checkbox within w_oiscene_r
integer x = 1714
integer y = 144
integer width = 59
integer height = 56
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;// 팀
string ls_userid

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

if ls_userid = "%" then
	// 전체
else
	if this.checked = true then
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	else
//		idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.setfilter( "(salesman = '" + ls_userid + "' OR imwon_user_id = '" + ls_userid + "') OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	end if
end if

end event

type dw_sales from datawindow within w_oiscene_r
integer x = 1792
integer y = 128
integer width = 329
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
long   ll_row, ll_seq
string ls_userid

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
this.accepttext()

end event

event itemchanged;//
string ls_userid, ls_myauth
long   ll_row, ll_find

this.accepttext()
ls_userid = this.object.user[1]

// 거래처
dw_1.enabled = true
dw_1.object.cust_no.Background.Color = rgb(255, 255, 255)

dw_1.SetTransObject(SQLCA)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("현장별 자재투입현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "%")
//	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
//	idwc_cust.accepttext()
//	dw_1.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "ALL")
//	idwc_cust.setitem(1, "cust_name", "1.담당전체")
//	idwc_cust.accepttext()
//	dw_1.object.cust_no[1] = "ALL"
end if
dw_1.insertrow(0)

// 팀
if cbx_team.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if
this.accepttext()

end event

type st_5 from statictext within w_oiscene_r
integer x = 2295
integer y = 132
integer width = 279
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
boolean enabled = false
string text = "거래처"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_oiscene_r
integer x = 1440
integer y = 1040
integer width = 3003
integer height = 824
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_ra"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_11 from datawindow within w_oiscene_r
integer x = 736
integer y = 168
integer width = 101
integer height = 60
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdmycustomer_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_vertical from u_splitbar_vertical within w_oiscene_r
integer x = 1307
integer y = 424
integer height = 2088
boolean bringtotop = true
end type

type cbx_noamt from checkbox within w_oiscene_r
integer x = 3369
integer y = 156
integer width = 709
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "출고금액만"
end type

type cbx_excel from checkbox within w_oiscene_r
integer x = 5280
integer y = 300
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
string text = "엑셀 제출용"
end type

event clicked;//
if this.checked = true then
	dw_12.visible = true
	dw_12.reset()
	cbx_footer.enabled = false
	cbx_footer.checked = false
else
	dw_12.visible = false
	cbx_footer.enabled = true
end if

end event

type dw_12 from datawindow within w_oiscene_r
integer x = 599
integer y = 1228
integer width = 2807
integer height = 412
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscene_excel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_hap from checkbox within w_oiscene_r
integer x = 873
integer y = 184
integer width = 475
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			
	arg_dw.Modify("DataWindow.Trailer.2.Height=72")		
	arg_dw.Modify("DataWindow.Trailer.1.Height=72")	
else
	arg_dw.Modify("DataWindow.Detail.Height=72")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=72")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=72")	
end if
arg_dw.setredraw( true )

end event

type ddlb_op from dropdownlistbox within w_oiscene_r
integer x = 1883
integer y = 296
integer width = 302
integer height = 500
integer taborder = 190
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

type cbx_footer from checkbox within w_oiscene_r
integer x = 4731
integer y = 300
integer width = 503
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
string text = "운반비총합계 보기"
end type

event clicked;
if cbx_excel.checked then
	messagebox('알림', '엑셀제출용이 체크되었을때는 사용할 수 없습니다.')
else

	if this.checked = true then
		dw_3.modify("datawindow.Footer.height = 160")				
		dw_3.modify("datawindow.Trailer.1.height = 140")
	else		
		dw_3.modify("datawindow.Footer.height = 80")
		dw_3.modify("datawindow.Trailer.1.height = 64")		
	end if

end if	

end event

type dw_13 from datawindow within w_oiscene_r
integer x = 1765
integer y = 1620
integer width = 3360
integer height = 592
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenerep_r_excel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_14 from datawindow within w_oiscene_r
integer x = 1015
integer y = 2004
integer width = 3360
integer height = 592
integer taborder = 100
boolean bringtotop = true
boolean titlebar = true
string title = "송장점검"
string dataobject = "d_scene_comparison"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;string ls_do_no
long	i
decimal l_calc_amt, l_tax_amt, l_do_total

if dwo.name = 'b_1' then
//	ls_do_no = this.object.do_no[row]
//	messagebox('알림','송장번호: ' + ls_do_no)

	for i = 1 to this.rowcount()		
		
		
		ls_do_no = this.object.do_no[i]
		l_calc_amt = this.object.c_calc_amt[i]
		l_tax_amt = this.object.c_tax_amt[i]
		l_do_total = this.object.c_do_total[i]
		
		
		insert into do_log 
		SELECT convert(datetime, convert(nvarchar, getdate(), 120)) log_date
				 , ( SELECT isnull(max(log_seq),0) FROM do_log WHERE log_date = convert(datetime, convert(nvarchar, getdate(), 120)) ) + ROW_NUMBER() OVER(ORDER BY (SELECT 1)) log_seq
				 , :gs_userid
				 , do.do_no         
				 , do.user_id             
				 , do.area_no
				 , do.do_case                  
				 , do.do_date  
				 , do.issue_date
				 , do.ship_amount       
				 , do.ship_flag         
				 , do.do_cash           
				 , do.do_rate           
				 , do.do_total          
				 , null do_jobdesc
				 , do.cust_no            
				 , do.spot_code
				 , '기타' pgm_name
				 , '변경전내역: ' + do.do_jobdesc
			 FROM do where do_no = :ls_do_no;		

			update do
				 set do_cash = :l_calc_amt,
					 do_rate = :l_tax_amt,
					 do_total = :l_do_total,
					 do_jobtype = 'JD009',
					 do_jobdesc = '합계금액수정'
				  where do_no = :ls_do_no;
			  
			  insert into do_log 										  
			  SELECT  convert(datetime, convert(nvarchar, getdate(), 120)) log_date
						 , ( SELECT isnull(max(log_seq),0) FROM do_log WHERE log_date = convert(datetime, convert(nvarchar, getdate(), 120)) ) + ROW_NUMBER() OVER(ORDER BY (SELECT 1)) log_seq
						 , :gs_userid
						 , do.do_no         
						 , do.user_id             
						 , do.area_no
						 , do.do_case                  
						 , do.do_date  
						 , do.issue_date
						 , do.ship_amount       
						 , do.ship_flag         
						 , do.do_cash           
						 , do.do_rate           
						 , do.do_total          
						 , do.do_jobdesc
						 , do.cust_no            
						 , do.spot_code
						 , '기타' pgm_name
						 , '변경내역: ' + do.do_jobdesc contents
				 FROM do where do_no = :ls_do_no;
			  
	next

	 commit;
	 
	 messagebox('알림','수정이 완료되었습니다.')
end if
end event

type cb_6 from commandbutton within w_oiscene_r
integer x = 4955
integer y = 36
integer width = 457
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "송장점검"
end type

event clicked;string ls_sdate, ls_edate, ls_custno
int      l_gab = 1
		
		dw_14.width  = dw_3.width * 0.68
		dw_14.height = dw_3.height* 0.8
		dw_14.x      = dw_3.x + ((dw_3.width - dw_14.width) / 2)
		dw_14.y      = dw_3.y		
		
		ls_sdate = MidA(em_1.text, 1,4) + MidA(em_1.text, 6,2) + MidA(em_1.text, 9,2)
		ls_edate = MidA(em_2.text, 1,4) + MidA(em_2.text, 6,2) + MidA(em_2.text, 9,2)		
		
          ls_custno = dw_1.object.cust_no[1]
		
		
//		dw_4.dataobject =  'd_whsale_w1'
//		dw_4.SetTransObject(sqlca)	
				
		dw_14.reset()
//		dw_14.title = "수주별 미출고량  확인: [" + ls_locname+ "] " + ls_itemnm + " | " + ls_qa
		
		dw_14.setredraw( false )
		dw_14.visible    = true 
		dw_14.bringtotop = true
				
		dw_14.retrieve( ls_custno, ls_sdate, ls_edate, l_gab )
				
		dw_14.setredraw( true )
end event

type cb_7 from commandbutton within w_oiscene_r
integer x = 4955
integer y = 128
integer width = 457
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "단가일괄수정"
end type

event clicked;oleobject ole_excel
Boolean lb_select, lb_delete
Integer li_connect, li_open, li_value, l_magam_yn
Long    l_cnt1, l_count, ll_xls, ll_row, ll_import, ll_xl_row, i, ii, iii, i_row_add, i_row_number, i_row_check, l_request_seq
String  ls_open_file, ls_save_file, ls_named, ls_curdir, ls_do_no, ls_sql, ls_getdate, ls_magam_yn
DECIMAL l_seq, l_seq_no, l_rlse_acc_qty, l_price


ls_curdir = getcurrentdirectory()
li_value = GetFileOpenName("Open Excel File", ls_open_file, ls_named, "Excel", "Excel Files Files(*.xls), *.xls, Excel 통합문서(*.xlsx), *.xlsx, CSV Files (*.csv), *.csv")

IF li_value <> 1 THEN 
	MessageBox("확인","등록할 파일을 선택해주세요")
	return -1
END IF

IF LenA(TRIM(ls_open_file)) = 0 THEN
	MessageBox("확인","등록할 파일을 선택해주세요")
	return -1
END IF

ll_xls = PosA(ls_open_file, 'xls')

IF IsNull(ll_xls) or ll_xls = 0 then
	ll_xls = PosA(ls_open_file, 'XLS')
end if

IF IsNull(ll_xls) or ll_xls = 0 then
	ll_xls = PosA(ls_open_file, 'xlsx')
end if

IF IsNull(ll_xls) or ll_xls = 0 then
	ll_xls = PosA(ls_open_file, 'XLSX')
end if	

IF IsNull(ll_xls) or ll_xls = 0 then //* Excel File이 아니면 Text File인지 체크
	ll_xls = PosA(ls_open_file, 'csv')
	
	if IsNull(ll_xls) or ll_xls = 0 then
		MessageBox("확인", "Excel 파일이 아닙니다.")
		return -1
	end if
end if

ole_excel = CREATE OLEobject

li_connect = ole_excel.ConnectToObject("","excel.application") 

IF li_connect = -5 THEN 
// -5 Can't connect to the currently active object 
	li_connect = ole_excel.ConnectToNewObject("excel.application") 
END IF 

IF li_connect <> 0 THEN
	SetPointer(Arrow!)

	DESTROY ole_excel 

	MessageBox("확인", '엑셀 프로그램을 실행할 수 없습니다.')
	return -1
END IF
  

SetPointer(HourGlass!)

ole_excel.WorkBooks.Open(ls_open_file)
ole_excel.Application.Visible = FALSE

lb_select = ole_excel.WorkSheets(1).Activate

// 매출  //
//4 번 출고번호
//5 번 출고번호순번
//11 번 환산수량
//12 번 단가
//13 번 출고금액 /운반비 단가로 활용 위해/ 

//ls_sql = 'Create table #dodettemp  (date  char(12),  '+ "~r~n" + &
//         '                          do_no     char(14),  '+ "~r~n" + &
//         '                          seq_no   smallint,  '+ "~r~n" + &
//         '                          qty      decimal(18,2),  '+ "~r~n" + &
//         '                          price   decimal(18,4)) '
//   
//  
// EXECUTE IMMEDIATE :ls_sql;
 
l_seq = 0
ll_xl_row =2

delete dodet_temp
where ip = :gs_ipaddress;

DO UNTIL (	isnull( ole_excel.cells[ll_xl_row, 13].value ) )
	
	
	if isnull( ole_excel.cells[ll_xl_row, 3].value ) = false  then
		ls_do_no		 	= ole_excel.cells[ll_xl_row, 4].VALUE 		// 출고번호
		l_seq_no			= ole_excel.cells[ll_xl_row, 5].VALUE		// 순번
				
		/*운반비에서는 숫자를 1*/
		if 	l_seq_no = 3000 then		/*3000은 운반비*/
			l_rlse_acc_qty = 1			/*3000은 운반비는 수량 1*/
			l_price = ole_excel.cells[ll_xl_row, 13].VALUE /*3000은 운반비는 단가는 출고금액을 활용 */
		else
			l_rlse_acc_qty 	= ole_excel.cells[ll_xl_row, 11].VALUE			// 환산수량
			l_price = ole_excel.cells[ll_xl_row, 12].VALUE			// 단가				
		end if
		
/* 신규*/	insert into dodet_temp (ip, do_no, oi_no, price, price_org, qty, apply_yn) values (:gs_ipaddress, :ls_do_no, :l_seq_no, :l_price, 0, :l_rlse_acc_qty, 'Y');
/*기존		insert into dodet_temp (ip, do_no, oi_no, price, price_org, qty) values (:gs_ipaddress, :ls_do_no, :l_seq_no, :l_price, 0, :l_rlse_acc_qty ); */
		
		IF SQLCA.sqlcode   <> 0 THEN
			MESSAGEBOX('알림', '오류');
		END IF
	end if
	
	ll_xl_row ++
	
LOOP

ole_excel.Application.Quit
ole_excel.DisConnectObject()

// 수정전 자재단가 일괄 업데이트
update dodet_temp
set price_org =  b.price     
from dodet_temp as a JOIN dodet as b ON a.do_no = b.do_no and a.oi_no = b.oi_no 
and a.ip = :gs_ipaddress;


/*신규로직 단가범위 벗어난것을 체크해둠*/
update dodet_temp
      set apply_yn =  'N'		// 벗어난건 'N'
from dodet_temp a INNER JOIN (
                                                                  select  a.do_no,
                                                                              a.oi_no,
                                                                              a.price_org,
                                                                              a.price, 
                                                                              a.rate
                                                                  from 
                                                                  (
                                                                      SELECT a.do_no, 
                                                                                     a.oi_no, 
                                                                                     a.price price_org,               
                                                                                     b.price price,               
                                                                                     (case when b.price <= 2000 then 0.4
                                                                                               when b.price > 2000 and b.price <= 5000 then 0.3
                                                                                               when b.price > 5000 then 0.2
                                                                                        end ) rate
                                                                        FROM dodet a with(nolock) inner join dodet_temp b with(nolock) on a.do_no = b.do_no and a.oi_no = b.oi_no and b.ip = :gs_ipaddress
                                                                  ) a
                                                                  where a.price_org < a.price  - (a.price * a.rate) or a.price_org > a.price + (a.price * a.rate)
                                                        ) b ON a.do_no = b.do_no and a.oi_no = b.oi_no
and a.ip = :gs_ipaddress;


 //이전달 월마감 체크 
l_magam_yn = 0;

SELECT count(mmagam.magam_yn)
	  into :l_magam_yn
  FROM mmagam
  Where mmagam.yyyymm in (
                                                      select distinct substring(do_no,3,6) yyyymm
                                                      from dodet_temp      
										 where ip = :gs_ipaddress
                                                 )
       and  mmagam.sys_gb  = '00'
	  and magam_yn = 'Y' ;

IF l_magam_yn > 0 then 
	messagebox('알림','월마감되었습니다. 전산팀에 마감해제를 요청해 주세요.')
	return 0
end if

/*
	단가 2,000원 이하 40%,
	단가 2,000원 초과  5,000원 이하 30%,
	단가 5,000원 초과 20%
	넘어가면 경고 메세지
*/
l_count = 0;

/*기존로직*/
//select  count(a.do_no)
//   into :l_count
//from 
//(    
//    SELECT a.do_no, 
//                   a.oi_no, 
//                   a.price price_org,               
//                   b.price price,               
//                   (case when b.price <= 2000 then 0.4
//                             when b.price > 2000 and b.price <= 5000 then 0.3
//                             when b.price > 5000 then 0.2
//                      end ) rate
//      FROM dodet a with(nolock) inner join dodet_temp b with(nolock) on a.do_no = b.do_no and a.oi_no = b.oi_no and b.ip = :gs_ipaddress
//  ) a
//  where a.price_org < a.price  - (a.price * a.rate) or a.price_org > a.price + (a.price * a.rate);

// 신규로직 2022-04-28 jowonsuk
select  count(*)
into :l_count
from  dodet_temp
where ip = :gs_ipaddress
     and apply_yn = 'N';

if l_count > 0 then 	
  
	if GF_Permission("거래명세서_단가금액확인", gs_userid) = "Y" then
		if MessageBox("확인", " 단가 수정 범위를 벗어납니다. 그래도 반영하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
			rollback;			
			RETURN 0
		end if
		/*테스트 기간만 운영하고 제외할 로직 */
		if MessageBox("확인", "단가 수정 범위를 벗어난 건을 출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then					
			dw_14.dataobject = 'd_scene_unit_gab'
			dw_14.settransobject(sqlca)
			dw_14.retrieve(gs_ipaddress)
			dw_14.print()
			
			dw_14.dataobject = 'd_scene_comparison'
			dw_14.settransobject(sqlca)
		end if
		
	else
		if MessageBox("확인","'거래명세서_단가금액 확인 권한이 없어'~n" + " 단가 수정 범위를 벗어난 단가를 수정할 수 없습니다.~n단가 수정 범위를 벗어난 건을 출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then					
			dw_14.dataobject = 'd_scene_unit_gab'
			dw_14.settransobject(sqlca)
			dw_14.retrieve(gs_ipaddress)
			dw_14.print()
			
			dw_14.dataobject = 'd_scene_comparison'
			dw_14.settransobject(sqlca)		
		end if 			

//        기존로직		
//		rollback;			
//		RETURN 0		
	
/* 신규로직  2022-04-28 jowonsuk	*/

		if MessageBox("확인", " 단가 수정 범위를 벗어나지 않은 건은 반영하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
			rollback;			
			RETURN 0
		else			
			delete  dodet_temp
			where ip = :gs_ipaddress
			    and apply_yn = 'N';
		end if

	end if
	
end if	


insert into do_log 
SELECT convert(datetime, convert(nvarchar, getdate(), 120)) log_date
       , ( SELECT isnull(max(log_seq),0) FROM do_log WHERE log_date = convert(datetime, convert(nvarchar, getdate(), 120)) ) + ROW_NUMBER() OVER(ORDER BY (SELECT 1)) log_seq
       , :gs_userid
       , do.do_no         
       , do.user_id             
       , do.area_no
       , do.do_case                  
       , do.do_date  
       , do.issue_date
       , do.ship_amount       
       , do.ship_flag         
       , do.do_cash           
       , do.do_rate           
       , do.do_total          
       , null do_jobdesc
       , do.cust_no            
       , do.spot_code
       , '일괄업로드' pgm_name
       , '변경전내역: ' + do.do_jobdesc contents
    FROM do inner join (select distinct do_no from dodet_temp where ip = :gs_ipaddress) do_temp on do.do_no = do_temp.do_no;


/*2021-12-23 jowonsuk dodet 업데이트 */
update dodet
set price = B.price,
      rate_cash = b.tax_amt
from dodet as A JOIN (
                                                           select a.do_no, 
                                                                      a.oi_no,
			                                                      a.price,
/*																					
                                                                       calc_amt    = (case when a.round = 'Y' then 
                                                                                                                (case when a.calc_qty < 0 then round(a.price * a.calc_qty, 0)
                                                                                                                  else round(a.price * a.calc_qty + 0.000001, 0) end)
                                                                                                         else (case when a.calc_qty < 0 then round(a.price * a.calc_qty, 0, 1)
                                                                                                                   else round(a.price * a.calc_qty + 0.000001, 0, 1) end)                                   
                                                                                                         end),
                                                                       tax_amt    =  (case when a.tax_sign = 'Y' then (case when a.round = 'Y' then 
                                                                                                                                                        (case when a.calc_qty < 0 then round((a.price * a.calc_qty)/10, 0,1)
                                                                                                                                                          else round((a.price * a.calc_qty)/10 + 0.000001, 0,1) end)
                                                                                                                                                 else (case when a.calc_qty < 0 then round((a.price * a.calc_qty)/10, 0, 1)
                                                                                                                                                           else round((a.price * a.calc_qty)/10 + 0.000001, 0, 1) end)                                   
                                                                                                                                                 end) else 0 end )
*/																																																 
													 calc_amt    = (case when a.round = 'Y' 
																			  then round(a.price * a.calc_qty, 0)                                                                                                  
																			 else  round( a.price * a.calc_qty, 0, 1 )
																			 end ),
													tax_amt    =  ( case when a.tax_sign = 'Y' then (case when a.round = 'Y' 
																													  then round( round(a.price * a.calc_qty, 0)/10, 0, 1 )
																			 										  else  round( round( a.price * a.calc_qty, 0, 1 )/10, 0, 1 )
																			 										  end) 
																			else 0 end )																																									 
                                                            from 
                                                            (
                                                                  SELECT do.ship_flag, 
                                                                                 do.shipamt_case, 
                                                                                 b.do_no, 
                                                                                 b.oi_no, 
                                                                                 b.price price,
                                                                                 b.qty calc_qty,
                                                                                 customer.round, 
                                                                                 sale.tax_sign
                                                                    FROM do   with(nolock) inner join dodet_temp b with(nolock) on do.do_no = b.do_no and b.ip = :gs_ipaddress
                                                                                                  inner join dodet with(nolock) on b.do_no = dodet.do_no and b.oi_no = dodet.oi_no
                                                                                                  inner join customer on do.cust_no = customer.cust_no
                                                                                                  left outer join sale on dodet.sale_no = sale.order_no
                                                            ) a 
                                      ) as B
ON A.do_no = B.do_no and a.oi_no = b.oi_no;

/*2021-12-23 jowonsuk do 업데이트 */
update do
    set do_cash = B.new_do_cash,
          do_rate = b.new_do_rate,
          do_total = b.new_do_total,
	     do_jobtype = 'JD001',
		do_jobdesc = '단가일괄수정'
from do as A JOIN (

                                       select do.do_no, 
                                                  do.ship_amount,
                                                  do.ship_flag,
                                                  do.shipamt_case,
                                                  do.do_cash,            
                                                  do.do_rate, 
                                                  do.do_total,
/*
                                                  (case when do.ship_flag = 'D' AND do.shipamt_case = 'R' then c.calc_amt + do.ship_amount else c.calc_amt end) new_do_cash,
                                                  round((case when do.ship_flag = 'D' AND do.shipamt_case = 'R' then c.tax_amt + do.ship_amount/10 else c.tax_amt end)+0.0000001,0,1) new_do_rate,
                                                  (case when do.ship_flag = 'D' AND do.shipamt_case = 'R' then c.calc_amt + do.ship_amount else c.calc_amt end) +
                                                  round((case when do.ship_flag = 'D' AND do.shipamt_case = 'R' then c.tax_amt + do.ship_amount/10 else c.tax_amt end)+0.0000001,0,1) new_do_total
*/
                                                  (case when do.ship_flag = 'D' AND do.shipamt_case = 'R' then c.calc_amt + do.ship_amount else c.calc_amt end) new_do_cash,
                                                  round((case when do.ship_flag = 'D' AND do.shipamt_case = 'R' then c.calc_amt + do.ship_amount else c.calc_amt end)/10,0,1) new_do_rate,
                                                  (case when do.ship_flag = 'D' AND do.shipamt_case = 'R' then c.calc_amt + do.ship_amount else c.calc_amt end) +
                                                  round((case when do.ship_flag = 'D' AND do.shipamt_case = 'R' then c.calc_amt + do.ship_amount else c.calc_amt end)/10,0,1) new_do_total
                                       from do inner join (
                                                                             select a.do_no, 
/*																									  
                                                                                         calc_amt    = sum(case when a.round = 'Y' then 
                                                                                                                                  (case when a.calc_qty < 0 then round(a.price * a.calc_qty, 0)
                                                                                                                                    else round(a.price * a.calc_qty + 0.000001, 0) end)
                                                                                                                           else (case when a.calc_qty < 0 then round(a.price * a.calc_qty, 0, 1)
                                                                                                                                     else round(a.price * a.calc_qty + 0.000001, 0, 1) end)                                   
                                                                                                                           end),
                                                                                         tax_amt    =  sum(case when a.tax_sign = 'Y' then (case when a.round = 'Y' then 
                                                                                                                                                                          (case when a.calc_qty < 0 then round((a.price * a.calc_qty)/10, 0, 1)
                                                                                                                                                                            else round((a.price * a.calc_qty)/10 + 0.000001, 0, 1) end)
                                                                                                                                                                   else (case when a.calc_qty < 0 then round((a.price * a.calc_qty)/10, 0, 1)
                                                                                                                                                                             else round((a.price * a.calc_qty)/10 + 0.000001, 0, 1) end)                                   
                                                                                                                                                                   end) else 0 end )
*/
																 calc_amt    = sum(case when a.round = 'Y' 
																						  then round(a.price * a.calc_qty, 0)                                                                                                  
																						 else  round( a.price * a.calc_qty, 0, 1 )
																						 end ),
																 tax_amt    =  sum( case when a.tax_sign = 'Y' then (case when a.round = 'Y' 
																																  then round( round(a.price * a.calc_qty, 0)/10, 0, 1 )
																																  else  round( round( a.price * a.calc_qty, 0, 1 )/10, 0, 1 )
																																  end) 
																						else 0 end )	
                                                                              from 
                                                                              (
                                                                                    SELECT do.ship_flag, 
                                                                                                   do.shipamt_case, 
                                                                                                   b.do_no, 
                                                                                                   b.oi_no, 
                                                                                                   b.price price,
                                                                                                   b.qty calc_qty,
                                                                                                   customer.round, 
                                                                                                   sale.tax_sign
                                                                                      FROM do   with(nolock) inner join dodet_temp b with(nolock) on do.do_no = b.do_no and b.ip = :gs_ipaddress
                                                                                                                    inner join dodet with(nolock) on b.do_no = dodet.do_no and b.oi_no = dodet.oi_no
                                                                                                                    inner join customer on do.cust_no = customer.cust_no
                                                                                                                    left outer join sale on dodet.sale_no = sale.order_no
                                                                              ) a  
                                                                              group by a.do_no                               
                                                                     ) c on do.do_no = c.do_no
                                       
         
                                ) as B ON A.do_no = B.do_no;
										  
  insert into do_log 										  
  SELECT  convert(datetime, convert(nvarchar, getdate(), 120)) log_date
			 , ( SELECT isnull(max(log_seq),0) FROM do_log WHERE log_date = convert(datetime, convert(nvarchar, getdate(), 120)) ) + ROW_NUMBER() OVER(ORDER BY (SELECT 1)) log_seq
			 , :gs_userid
			 , do.do_no         
			 , do.user_id             
			 , do.area_no
			 , do.do_case                  
			 , do.do_date  
			 , do.issue_date
			 , do.ship_amount       
			 , do.ship_flag         
			 , do.do_cash           
			 , do.do_rate           
			 , do.do_total          
			 , do.do_jobdesc
			 , do.cust_no            
			 , do.spot_code
			 , '일괄업로드' pgm_name
			 , '변경내역: ' + do.do_jobdesc contents
    FROM do inner join (select distinct do_no from dodet_temp where ip = :gs_ipaddress) do_temp on do.do_no = do_temp.do_no;										  


delete dodet_temp
where ip = :gs_ipaddress;

IF SQLCA.sqlcode   <> 0 THEN
	MESSAGEBOX('알림', '오류');
	rollback;
else
	commit;	
	messagebox('알림', '단가 업로드가 완료되었습니다.')	
END IF

Return 1

end event

